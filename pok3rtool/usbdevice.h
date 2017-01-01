#ifndef USBDEVICE_H
#define USBDEVICE_H

#include "libusb.h"

#include "zstring.h"
#include "zbinary.h"
#include "zpointer.h"
using namespace LibChaos;

#define SEND_TIMEOUT    1000
#define RECV_TIMEOUT    100

class USBDevice {
public:
    struct Dev {
        ZPointer<USBDevice> dev;
        zu16 vid;
        zu16 pid;
    };

public:
    USBDevice();
    USBDevice(libusb_device *device);
    ~USBDevice();

    USBDevice(const USBDevice &other) = delete;

    //! Find USB device with \a vid and \a pid.
    bool findUSBVidPid(zu16 vid, zu16 pid);

    //! Open USB device.
    bool open();
    //! Close USB device.
    void close();

    zu16 interrupt_send(int ep, const zbyte *data, zu16 len);
    zu16 interrupt_recv(int ep, zbyte *data, zu16 maxlen);

public:
    static ZArray<Dev> listDevices();

private:
    bool claimInterface(int interface);
    bool releaseInterface(int interface);
    bool detachKernel(int interface);
    bool attachKernel(int interface);

private:
    libusb_context *context;
    libusb_device *device;
    libusb_device_handle *handle;
    bool claimed[3];
    bool kernel[3];
};

#endif // USBDEVICE_H
