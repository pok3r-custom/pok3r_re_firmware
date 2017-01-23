#ifndef HT32_H
#define HT32_H

#if CPU == 0x1655
    #include "ht32f1655.h"
#elif CPU == 0x1654
    #include "ht32f1654.h"
#else
    #error "Must specify a CPU!"
#endif

#endif // HT32_H
