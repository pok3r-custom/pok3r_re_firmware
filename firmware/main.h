#ifndef COMMON_H
#define COMMON_H

// FOR IDE COMPLETION, IGNORE
#ifndef FW_BUILDING
    #define BOARD 1
    #define CPU 1
#endif

#if BOARD == 1
    // POK3R
    #include "board/pok3r_board.h"
#elif BOARD == 2
    // POK3R RGB
    #include "board/pok3r_rgb_board.h"
#elif BOARD == 3
    // Vortex Core
    #include "board/vortex_core_board.h"
#else
    #error "Must specify a BOARD!"
#endif

void usb_init_descriptors();

#endif // COMMON_H
