/* Simple Raw HID functions for Windows - for use with Teensy RawHID example
 * http://www.pjrc.com/teensy/rawhid.html
 * Copyright (c) 2009 PJRC.COM, LLC
 *
 *  rawhid_open - open 1 or more devices
 *  rawhid_recv - receive a packet
 *  rawhid_send - send a packet
 *  rawhid_close - close a device
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above description, website URL and copyright notice and this permission
 * notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * Version 1.0: Initial Release
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <windows.h>
#include <setupapi.h>
#include <hidsdi.h>
#include <hidclass.h>

#include "hid.h"

typedef struct hid_struct hid_t;
struct hid_struct {
    HANDLE handle;
    int open;
};

static HANDLE rx_event = NULL;
static HANDLE tx_event = NULL;
static CRITICAL_SECTION rx_mutex;
static CRITICAL_SECTION tx_mutex;

void print_win32_err(void)
{
    char str[1024];
    DWORD err = GetLastError();
    FormatMessageA(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
                   NULL,
                   err,
                   MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                   str, sizeof(str),
                   NULL);
    printf("err %lx: %s\n", err, str);
}

// private functions, not intended to be used from outside this file
static void hid_close(hid_t *hid);

//  rawhid_recv - receive a packet
//    Inputs:
//	num = device to receive from
//	buf = buffer to receive packet
//	len = buffer's size
//	timeout = time to wait, in milliseconds
//    Output:
//	number of bytes received, or -1 on error
//
int rawhid_recv(hid_t *hid, void *buf, int len, int timeout)
{
    unsigned char tmpbuf[516];
    OVERLAPPED ov;
    DWORD n, r;

    if (sizeof(tmpbuf) < len + 1) return -1;
    if (!hid || !hid->open) return -1;
    EnterCriticalSection(&rx_mutex);
    ResetEvent(&rx_event);
    memset(&ov, 0, sizeof(ov));
    ov.hEvent = rx_event;
    if (!ReadFile(hid->handle, tmpbuf, len + 1, NULL, &ov)) {
        if (GetLastError() != ERROR_IO_PENDING) goto return_error;
        r = WaitForSingleObject(rx_event, timeout);
        if (r == WAIT_TIMEOUT) goto return_timeout;
        if (r != WAIT_OBJECT_0) goto return_error;
    }
    if (!GetOverlappedResult(hid->handle, &ov, &n, FALSE)) goto return_error;
    LeaveCriticalSection(&rx_mutex);
    if (n <= 0) return -1;
    n--;
    if (n > len) n = len;
    memcpy(buf, tmpbuf + 1, n);
    return n;
return_timeout:
    CancelIo(hid->handle);
    LeaveCriticalSection(&rx_mutex);
    return 0;
return_error:
    print_win32_err();
    LeaveCriticalSection(&rx_mutex);
    return -1;
}

//  rawhid_send - send a packet
//    Inputs:
//	num = device to transmit to
//	buf = buffer containing packet to send
//	len = number of bytes to transmit
//	timeout = time to wait, in milliseconds
//    Output:
//	number of bytes sent, or -1 on error
//
int rawhid_send(hid_t *hid, const void *buf, int len, int timeout)
{
    unsigned char tmpbuf[516];
    OVERLAPPED ov;
    DWORD n, r;

    if (sizeof(tmpbuf) < len + 1) return -1;
    if (!hid || !hid->open) return -1;
    EnterCriticalSection(&tx_mutex);
    ResetEvent(&tx_event);
    memset(&ov, 0, sizeof(ov));
    ov.hEvent = tx_event;
    tmpbuf[0] = 0;
    memcpy(tmpbuf + 1, buf, len);
    if(!WriteFile(hid->handle, tmpbuf, len + 1, NULL, &ov)){
        if (GetLastError() != ERROR_IO_PENDING)
            goto return_error;
        r = WaitForSingleObject(tx_event, timeout);
        if (r == WAIT_TIMEOUT)
            goto return_timeout;
        if (r != WAIT_OBJECT_0)
            goto return_error;
    }
    if(!GetOverlappedResult(hid->handle, &ov, &n, FALSE))
        goto return_error;
    LeaveCriticalSection(&tx_mutex);
    if (n <= 0){
        return -1;
    }
    return n - 1;
return_timeout:
    CancelIo(hid->handle);
    LeaveCriticalSection(&tx_mutex);
    return 0;
return_error:
    LeaveCriticalSection(&tx_mutex);
    return -1;
}

//  rawhid_open - open a device
//
//    Inputs:
//	vid = Vendor ID, or -1 if any
//	pid = Product ID, or -1 if any
//	usage_page = top level usage page, or -1 if any
//	usage = top level usage number, or -1 if any
//    Output:
//	device handle
//
hid_t *rawhid_open(int vid, int pid, int usage_page, int usage)
{
    GUID guid;
    HDEVINFO info;
    DWORD index=0, reqd_size;
    SP_DEVICE_INTERFACE_DATA iface;
    SP_DEVICE_INTERFACE_DETAIL_DATA *details;
    HIDD_ATTRIBUTES attrib;
    PHIDP_PREPARSED_DATA hid_data;
    HIDP_CAPS capabilities;
    HANDLE h;
    BOOL ret;

    hid_t *hid = NULL;

    if (!rx_event) {
        rx_event = CreateEvent(NULL, TRUE, TRUE, NULL);
        tx_event = CreateEvent(NULL, TRUE, TRUE, NULL);
        InitializeCriticalSection(&rx_mutex);
        InitializeCriticalSection(&tx_mutex);
    }
    HidD_GetHidGuid(&guid);
    info = SetupDiGetClassDevs(&guid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if (info == INVALID_HANDLE_VALUE) return 0;
    for (index=0; 1 ;index++) {
        iface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
        ret = SetupDiEnumDeviceInterfaces(info, NULL, &guid, index, &iface);
        if (!ret)
            return hid;
        SetupDiGetInterfaceDeviceDetail(info, &iface, NULL, 0, &reqd_size, NULL);
        details = (SP_DEVICE_INTERFACE_DETAIL_DATA *)malloc(reqd_size);
        if (details == NULL)
            continue;

        memset(details, 0, reqd_size);
        details->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);
        ret = SetupDiGetDeviceInterfaceDetail(info, &iface, details,
            reqd_size, NULL, NULL);
        if (!ret) {
            free(details);
            continue;
        }
        h = CreateFile(details->DevicePath, GENERIC_READ|GENERIC_WRITE,
            FILE_SHARE_READ|FILE_SHARE_WRITE, NULL,
            OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
        free(details);
        if (h == INVALID_HANDLE_VALUE)
            continue;
        attrib.Size = sizeof(HIDD_ATTRIBUTES);
        ret = HidD_GetAttributes(h, &attrib);
        //printf("vid: %4x\n", attrib.VendorID);
        if (!ret || (vid > 0 && attrib.VendorID != vid) ||
          (pid > 0 && attrib.ProductID != pid) ||
          !HidD_GetPreparsedData(h, &hid_data)) {
            CloseHandle(h);
            continue;
        }
        if (!HidP_GetCaps(hid_data, &capabilities) ||
          (usage_page > 0 && capabilities.UsagePage != usage_page) ||
          (usage > 0 && capabilities.Usage != usage)) {
            HidD_FreePreparsedData(hid_data);
            CloseHandle(h);
            continue;
        }
        HidD_FreePreparsedData(hid_data);

        if(hid){
            hid_close(hid);
            return NULL;
        }

        hid = (struct hid_struct *)malloc(sizeof(struct hid_struct));
        if (!hid) {
            CloseHandle(h);
            continue;
        }
        hid->handle = h;
        hid->open = 1;
//        add_hid(hid);
        return hid;
    }
}

int rawhid_openall(hid_t **hids, int max, int vid, int pid, int usage_page, int usage)
{
    GUID guid;
    HDEVINFO info;
    DWORD index=0, reqd_size;
    SP_DEVICE_INTERFACE_DATA iface;
    SP_DEVICE_INTERFACE_DETAIL_DATA *details;
    HIDD_ATTRIBUTES attrib;
    PHIDP_PREPARSED_DATA hid_data;
    HIDP_CAPS capabilities;
    HANDLE h;
    BOOL ret;
    int opencount = 0;

    if (!rx_event) {
        rx_event = CreateEvent(NULL, TRUE, TRUE, NULL);
        tx_event = CreateEvent(NULL, TRUE, TRUE, NULL);
        InitializeCriticalSection(&rx_mutex);
        InitializeCriticalSection(&tx_mutex);
    }
    HidD_GetHidGuid(&guid);
    info = SetupDiGetClassDevs(&guid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if(info == INVALID_HANDLE_VALUE)
        return 0;
    for(index = 0; 1; index++) {
        iface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
        ret = SetupDiEnumDeviceInterfaces(info, NULL, &guid, index, &iface);
        if (!ret)
            return opencount;
        SetupDiGetInterfaceDeviceDetail(info, &iface, NULL, 0, &reqd_size, NULL);
        details = (SP_DEVICE_INTERFACE_DETAIL_DATA *)malloc(reqd_size);
        if (details == NULL)
            continue;

        memset(details, 0, reqd_size);
        details->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);
        ret = SetupDiGetDeviceInterfaceDetail(info, &iface, details,
            reqd_size, NULL, NULL);
        if (!ret) {
            free(details);
            continue;
        }
        h = CreateFile(details->DevicePath, GENERIC_READ|GENERIC_WRITE,
            FILE_SHARE_READ|FILE_SHARE_WRITE, NULL,
            OPEN_EXISTING, FILE_FLAG_OVERLAPPED, NULL);
        free(details);
        if (h == INVALID_HANDLE_VALUE)
            continue;
        attrib.Size = sizeof(HIDD_ATTRIBUTES);
        ret = HidD_GetAttributes(h, &attrib);
        //printf("vid: %4x\n", attrib.VendorID);
        if (!ret || (vid > 0 && attrib.VendorID != vid) ||
          (pid > 0 && attrib.ProductID != pid) ||
          !HidD_GetPreparsedData(h, &hid_data)) {
            CloseHandle(h);
            continue;
        }
        if (!HidP_GetCaps(hid_data, &capabilities) ||
          (usage_page > 0 && capabilities.UsagePage != usage_page) ||
          (usage > 0 && capabilities.Usage != usage)) {
            HidD_FreePreparsedData(hid_data);
            CloseHandle(h);
            continue;
        }
        HidD_FreePreparsedData(hid_data);

        hids[opencount] = (struct hid_struct *)malloc(sizeof(struct hid_struct));
        hid_t *hid = hids[opencount];
        if (!hid) {
            CloseHandle(h);
            continue;
        }
        opencount++;

        hid->handle = h;
        hid->open = 1;

        if(opencount == max) return opencount;
    }
    return opencount;
}

//  rawhid_close - close a device
//
//    Inputs:
//	num = device to close
//    Output
//	(nothing)
//
void rawhid_close(hid_t *hid)
{
    if (!hid || !hid->open) return;
    hid_close(hid);
    free(hid);
}

static void hid_close(hid_t *hid)
{
    CloseHandle(hid->handle);
    hid->handle = NULL;
}
