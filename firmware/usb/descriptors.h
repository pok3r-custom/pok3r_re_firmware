#ifndef DESCRIPTORS_H
#define DESCRIPTORS_H

// Descriptor Types
#define DESC_TYPE_DEVICE    0x01
#define DESC_TYPE_CONFIG    0x02
#define DESC_TYPE_STRING    0x03
#define DESC_TYPE_INTERFACE 0x04
#define DESC_TYPE_ENDPOINT  0x05
#define DESC_TYPE_HID       0x21

void usb_init_descriptors();

#endif // DESCRIPTORS_H
