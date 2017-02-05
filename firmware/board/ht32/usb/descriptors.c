#include "descriptors.h"
#include "usb.h"

extern USB_Device usb_dev;

const u8 deviceDesc[] = {
    0x12,        // bLength
    0x01,        // bDescriptorType (Device)
    0x10, 0x01,  // bcdUSB 1.10
    0x00,        // bDeviceClass (Use class information in the Interface Descriptors)
    0x00,        // bDeviceSubClass
    0x00,        // bDeviceProtocol
    0x40,        // bMaxPacketSize0 64
    0xD9, 0x04,  // idVendor 0x04D9
    0x41, 0x01,  // idProduct 0x0141
    0x17, 0x01,  // bcdDevice 2.17
    0x00,        // iManufacturer (String Index)
    0x02,        // iProduct (String Index)
    0x00,        // iSerialNumber (String Index)
    0x01,        // bNumConfigurations 1
};

const u8 configDesc[] = {
    0x09,        //   bLength
    0x02,        //   bDescriptorType (Configuration)
    0x5B, 0x00,  //   wTotalLength 91
    0x01,        //   bNumInterfaces 1
    0x01,        //   bConfigurationValue
    0x00,        //   iConfiguration (String Index)
    0xA0,        //   bmAttributes Remote Wakeup
    0x32,        //   bMaxPower 100mA
};

const u8 interface0Desc[] = {
    0x09,        // bLength
    0x04,        // bDescriptorType (Interface)
    0x00,        // bInterfaceNumber 0
    0x00,        // bAlternateSetting
    0x02,        // bNumEndpoints 2
    0x03,        // bInterfaceClass
    0x00,        // bInterfaceSubClass
    0x00,        // bInterfaceProtocol
    0x00,        // iInterface (String Index)
};

const u8 hid0Desc[] = {
    0x09,        // bLength
    0x21,        // bDescriptorType (HID)
    0x11, 0x01,  // bcdHID 1.11
    0x00,        // bCountryCode
    0x01,        // bNumDescriptors
    0x22,        // bDescriptorType[0] (HID)
    0x22, 0x00,  // wDescriptorLength[0] 34
};

const u8 ep1Desc[] = {
    0x07,        // bLength
    0x05,        // bDescriptorType (Endpoint)
    0x81,        // bEndpointAddress (IN/D2H)
    0x03,        // bmAttributes (Interrupt)
    0x40, 0x00,  // wMaxPacketSize 64
    0x01,        // bInterval 1 (unit depends on device speed)
};

const u8 ep2Desc[] = {
    0x07,        // bLength
    0x05,        // bDescriptorType (Endpoint)
    0x02,        // bEndpointAddress (OUT/H2D)
    0x03,        // bmAttributes (Interrupt)
    0x40, 0x00,  // wMaxPacketSize 64
    0x01,        // bInterval 1 (unit depends on device speed)
};

// USB string descriptor 0 (LANGID 0x0409 - English US)
const u8 str0Desc[] = {
    0x04,        // bLength
    0x03,        // bDescriptorType (String)
    0x09, 0x04,
};

// USB string descriptor 1 "USB Keyboard"
const u8 str1Desc[] = {
    0x1A,        // bLength
    0x03,        // bDescriptorType (String)
    0x55, 0x00, 0x53, 0x00, 0x42, 0x00, 0x20, 0x00,
    0x4B, 0x00, 0x65, 0x00, 0x79, 0x00, 0x62, 0x00,
    0x6F, 0x00, 0x61, 0x00, 0x72, 0x00, 0x64, 0x00,
};

const u8 report0Desc[] = {
    0x06, 0x00, 0xFF,  // Usage Page (Vendor Defined 0xFF00)
    0x09, 0x01,        // Usage (0x01)
    0xA1, 0x01,        // Collection (Application)
    0x09, 0x02,        //   Usage (0x02)
    0x15, 0x00,        //   Logical Minimum (0)
    0x26, 0xFF, 0x00,  //   Logical Maximum (255)
    0x75, 0x08,        //   Report Size (8)
    0x95, 0x40,        //   Report Count (64)
    0x81, 0x02,        //   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)
    0x09, 0x03,        //   Usage (0x03)
    0x15, 0x00,        //   Logical Minimum (0)
    0x26, 0xFF, 0x00,  //   Logical Maximum (255)
    0x75, 0x08,        //   Report Size (8)
    0x95, 0x40,        //   Report Count (64)
    0x91, 0x02,        //   Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
    0xC0,              // End Collection
};

const u8 *ifaceDescs[] = {
    interface0Desc,
};
const u8 *epDescs[] = {
    ep1Desc,
    ep2Desc,
};
const u8 *strDescs[] = {
    str0Desc,
    str1Desc,
};

void usb_init_descriptors(){
    usb_dev.descriptors.deviceDesc = deviceDesc;
    usb_dev.descriptors.configDesc = configDesc;

    usb_dev.descriptors.interfaceDescs = ifaceDescs;
    usb_dev.descriptors.numInterfaceDescs = sizeof(ifaceDescs) / sizeof(u8*);

    usb_dev.descriptors.endpointDescs = epDescs;
    usb_dev.descriptors.numEndpointDescs = sizeof(epDescs) / sizeof(u8*);

    usb_dev.descriptors.stringDescs = strDescs;
    usb_dev.descriptors.numStringDescs = sizeof(strDescs) / sizeof(u8*);
}
