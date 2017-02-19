#ifndef DESCRIPTORS_H
#define DESCRIPTORS_H

// Descriptor Types
#define DESC_TYPE_DEVICE                    1
#define DESC_TYPE_CONFIGURATION             2
#define DESC_TYPE_STRING                    3
#define DESC_TYPE_INTERFACE                 4
#define DESC_TYPE_ENDPOINT                  5
#define DESC_TYPE_DEVICE_QUALIFIER          6
#define DESC_TYPE_OTHER_SPEED_CONFIGURATION 7
#define DESC_TYPE_INTERFACE_POWER           8
#define DESC_TYPE_HID                       0x21

void usb_init_descriptors();

#endif // DESCRIPTORS_H
