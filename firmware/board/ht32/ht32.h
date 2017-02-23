#ifndef HT32_H
#define HT32_H

// FOR IDE COMPLETION, IGNORE
#ifndef FW_BUILDING
    #define CPU 1
#endif

#if CPU == 1
    // HT32F1655
    #include "ht32f1655.h"
#elif CPU == 2
    // HT32F1654
    #include "ht32f1654.h"
#else
    #error "Must specify a CPU!"
#endif

#include "usb/usb.h"

#endif // HT32_H
