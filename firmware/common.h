#ifndef COMMON_H
#define COMMON_H

// FOR IDE COMPLETION, IGNORE
#ifndef FW_BUILDING
    #define BOARD 1
    #define CPU 0x1655
#endif
#include "board/cpu/ht32.h"

//#if BOARD == 1
//    #include "board/pok3r_board.h"
//#elif BOARD == 2
//    #include "board/pok3r_rgb_board.h"
//#else
//    #error "Must specify a BOARD!"
//#endif

#endif // COMMON_H
