#ifndef DESCRIPTORS_H
#define DESCRIPTORS_H

// 0x89FC
const unsigned char desc1[198] = {
    // System control inputs
    0x05, 0x01, // Usage Page       (Generic Desktop)
    0x09, 0x80, // Usage            (System Control)
    0xa1, 0x01, // Collection       (Application)
    0x85, 0x01, // Report ID        (1)
    // System controls
    0x19, 0x81, // Usage Minimum    (System Power Down)
    0x29, 0x83, // Usage Maximim    (System Wake Up)
    0x15, 0x00, // Logical Minimum  (0)
    0x25, 0x01, // Logical Maximum  (1)
    0x95, 0x03, // Report Count     (3)
    0x75, 0x01, // Report Size      (1)
    0x81, 0x02, // Input            (Data,Variable,Absolute)
    // Padding
    0x95, 0x01, // Report Count     (1)
    0x75, 0x05, // Report Size      (5)
    0x81, 0x01, // Input            (Constant,Array,Absolute)
    0xc0,       // End Collection

    // Media key inputs
    0x05, 0x0c, // Usage Page       (Consumer)
    0x09, 0x01, // Usage            (Consumer Control)
    0xa1, 0x01, // Collection       (Application)
    0x85, 0x02, // Report ID        (2)
    // Media keys
    0x15, 0x00, // Logical Minumum  (0)
    0x25, 0x01, // Logical Maximum  (1)
    0x95, 0x12, // Report Count     (18)
    0x75, 0x01, // Report Size      (1)
    0x0a, 0x83, 0x01, // Usage      (AL Consumer Control Configuration)
    0x0a, 0x8a, 0x01, // Usage      (AL Email Reader)
    0x0a, 0x92, 0x01, // Usage      (AL Calculator)
    0x0a, 0x94, 0x01, // Usage      (AL Local Machine Browser)
    0x09, 0xcd,       // Usage      (Play/Pause)
    0x09, 0xb7,       // Usage      (Stop)
    0x09, 0xb6,       // Usage      (Scan Previous Track)
    0x09, 0xb5,       // Usage      (Scan Next Track)
    0x09, 0xe2,       // Usage      (Mute)
    0x09, 0xea,       // Usage      (Volume Decrement)
    0x09, 0xe9,       // Usage      (Volume Increment)
    0x0a, 0x21, 0x02, // Usage      (AC Search)
    0x0a, 0x23, 0x02, // Usage      (AC Home)
    0x0a, 0x24, 0x02, // Usage      (AC Back)
    0x0a, 0x25, 0x02, // Usage      (AC Forward)
    0x0a, 0x26, 0x02, // Usage      (AC Stop)
    0x0a, 0x27, 0x02, // Usage      (AC Refresh)
    0x0a, 0x2a, 0x02, // Usage      (AC Bookmarks)
    0x81, 0x02, // Input            (Data,Variable,Absolute)
    // Padding
    0x95, 0x01, // Report Count     (1)
    0x75, 0x0e, // Report Size      (14)
    0x81, 0x01, // Input            (Constant,Array,Absolute)
    0xc0,       // End Collection

    // Mouse inputs
    0x05, 0x01, // Usage Page       (Generic Desktop)
    0x09, 0x02, // Usage            (Mouse)
    0xa1, 0x01, // Collection       (Application)
    0x09, 0x01, // Usage            (Pointer)
    0xa1, 0x00, // Collection       (Physical)
    0x85, 0x03, // Report ID        (3)
    // Mouse buttons
    0x05, 0x09, // Usage Page       (Button)
    0x19, 0x01, // Usage Minimum    (Button 1)
    0x29, 0x03, // Usage Maximum    (Button 3)
    0x15, 0x00, // Logical Minimum  (0)
    0x25, 0x01, // Logical Maximum  (1)
    0x75, 0x01, // Report Size      (1)
    0x95, 0x03, // Report Count     (3)
    0x81, 0x02, // Input            (Data,Variable,Absolute)
    // Padding
    0x95, 0x01, // Report Count     (1)
    0x75, 0x05, // Report Size      (5)
    0x81, 0x01, // Input            (Constant,Array,Absolute)
    // Mouse
    0x05, 0x01, // Usage Page       (Generic Desktop)
    0x09, 0x30, // Usage            (X)
    0x09, 0x31, // Usage            (Y)
    0x15, 0x81, // Logical Minimum  (-127)
    0x25, 0x7f, // Logical Maximum  (127)
    0x75, 0x08, // Report Size      (8)
    0x95, 0x02, // Report Count     (2)
    0x81, 0x06, // Input            (Data,Variable,Relative)
    // Mouse wheel
    0x09, 0x38, // Usage            (Wheel)
    0x15, 0x81, // Logical Minimum  (-127)
    0x25, 0x7f, // Logical Maximum  (127)
    0x75, 0x08, // Report Size      (8)
    0x95, 0x01, // Report Count     (1)
    0x81, 0x06, // Input            (Data,Variable,Relative)
    0xc0,       // End Collection
    0xc0,       // End Collection

    // Keyboard inputs
    0x05, 0x01, // Usage Page       (Generic Desktop)
    0x09, 0x06, // Usage            (Keyboard)
    0xa1, 0x01, // Collection       (Application)
    0x85, 0x04, // Report ID        (4)
    0x05, 0x07, // Usage Page       (Keyboard)
    // Padding
    0x95, 0x01, // Report Count     (1)
    0x75, 0x08, // Report Size      (8)
    0x81, 0x03, // Input            (Constant,Variable,Absolute)
    // Key press bitfield
    0x95, 0xe8, // Report Count     (232)
    0x75, 0x01, // Report Size      (1)
    0x15, 0x00, // Logical Minimum  (0)
    0x25, 0x01, // Logical Maximum  (1)
    0x05, 0x07, // Usage Page       (Keyboard)
    0x19, 0x00, // Usage Minimum    (0) (Reserved)
    0x29, 0xe7, // Usage Maximum    (231) (Keyboard Right GUI)
    0x81, 0x00, // Input            (Data,Array,Absolute)
    0xc0        // End Collection
};

// 0x89D8
const unsigned char desc2[34] = {
    0x06, 0x00, 0xff,   // Usage Page       (Vendor Defined)
    0x09, 0x01,         // Usage            (1)
    0xa1, 0x01,         // Collection       (Application)

    0x09, 0x02,         // Usage            (2)
    0x15, 0x00,         // Logical Minimum  (0)
    0x26, 0xff, 0x00,   // Logical Maximum  (0xFF)
    0x75, 0x08,         // Report Size      (8)
    0x95, 0x40,         // Report Count     (64)
    0x81, 0x02,         // Input            (Data,Variable,Absolute)

    0x09, 0x03,         // Usage            (3)
    0x15, 0x00,         // Logical Minimum  (0)
    0x26, 0xff, 0x00,   // Logical Maximum  (0xFF)
    0x75, 0x08,         // Report Size      (8)
    0x95, 0x40,         // Report Count     (64)
    0x91, 0x02,         // Output           (Data,Variable,Absolute)

    0xc0                // End Collection
};

// 0x8998
const unsigned char desc3[64] = {
    0x05, 0x01, // Usage Page       (Generic Desktop)
    0x09, 0x06, // Usage            (Keyboard)
    0xa1, 0x01, // Collection       (Application)

    0x05, 0x07, // Usage Page       (Keyboard)
    0x19, 0xe0, // Usage Minimum    (Keyboard Left Control)
    0x29, 0xe7, // Usage Maximum    (Keyboard Right GUI)
    0x15, 0x00, // Logical Minimum  (0)
    0x25, 0x01, // Logical Maximum  (1)
    0x75, 0x01, // Report Size      (1)
    0x95, 0x08, // Report Count     (8)
    0x81, 0x02, // Input            (Data,Variable,Absolute)

    0x95, 0x01, // Report Count     (1)
    0x75, 0x08, // Report Size      (8)
    0x81, 0x03, // Input            (Constant,Variable,Absolute)

    0x95, 0x03, // Report Count     (3)
    0x75, 0x01, // Report Size      (1)
    0x05, 0x08, // Usage Page       (LEDs)
    0x19, 0x01, // Usage Minimum    (Num Lock)
    0x29, 0x03, // Usage Maximum    (Scroll Lock)
    0x91, 0x02, // Output           (Data,Variable,Absolute)

    0x95, 0x01, // Report Count     (1)
    0x75, 0x05, // Report Size      (5)
    0x91, 0x03, // Output           (Constant,Variable,Absolute)

    0x95, 0x06, // Report Count     (6)
    0x75, 0x08, // Report Size      (8)
    0x15, 0x00,         // Logical Minimum  (0)
    0x26, 0xa4, 0x00,   // Logical Maximum  (164)
    0x05, 0x07, // Usage Page       (Keyboard)
    0x19, 0x00, // Usage Minimum    (Reserved)
    0x29, 0xa4, // Usage Maximum    (Keyboard ExSel)
    0x81, 0x00, // Input            (Data,Array,Absolute)

    0xc0        // End Collection
};


#endif // DESCRIPTORS_H
