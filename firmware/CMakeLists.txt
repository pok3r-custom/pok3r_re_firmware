# Pok3r Firmware CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.2)

PROJECT(Pok3r_Custom C ASM)

### =================== SOURCES =================== ###

SET(HEADERS
    main.h

    board/board.h
    board/cortex-m3.h
    board/gd25q_flash.h

    board/ht32/ht32.h
    board/ht32/ht32f165x.h
    board/ht32/ht32f1654.h
    board/ht32/ht32f1655.h
    board/ht32/ht32_usb.h

    board/pok3r_board.h
    board/pok3r_rgb_board.h
    board/vortex_core_board.h
)

SET(COMMON_SOURCES
    main.c
    descriptor.c

    board/cortex-m3.c

    board/ht32/startup.s
    board/ht32/ht32f165x.c
    board/ht32/ht32_usb.c

    ht32f165x_flash.S
)

SET(POK3R_SOURCES
    ${COMMON_SOURCES}
    board/pok3r_board.c
    board/ht32/ht32f1655.c
)

SET(POK3R_RGB_SOURCES
    ${COMMON_SOURCES}
    board/pok3r_rgb_board.c
    board/ht32/ht32f1654.c
)

SET(VORTEX_CORE_SOURCES
    ${COMMON_SOURCES}
    board/vortex_core_board.c
    board/ht32/ht32f1654.c
)

FILE(GLOB_RECURSE DEMO_FILES demo/*.c demo/*.h demo/*.s demo/*.ld)

SET(FILES
    ${HEADERS}
    ${COMMON_SOURCES}

    ${POK3R_SOURCES}
    ${POK3R_RGB_SOURCES}
    ${VORTEX_CORE_SOURCES}

    Makefile.in
    ht32f1654.ld
    ht32f1655.ld
    openocd.cfg

    ${DEMO_FILES}
)

### =================== CONFIG ==================== ###

SET(CMAKE_VERBOSE_MAKEFILE ON)

FUNCTION(ConfigureBoard NAME SRCS LINK DEFS)
    MESSAGE(STATUS "Configure ${NAME}")

    # Variables for makefile configure
    SET(OUT_NAME ${NAME})
    SET(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
    SET(BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/${NAME}")
    SET(LD_FILE ${LINK})
    SET(C_DEFS ${DEFS})
    STRING(REPLACE ";" " " C_SRCS "${SRCS}")

    # Configure makefile
    SET(BOARD_DIR "${CMAKE_CURRENT_BINARY_DIR}/${NAME}")
    SET(BOARD_MAKE "${BOARD_DIR}/${NAME}.make")
    CONFIGURE_FILE(Makefile.in "${BOARD_MAKE}" @ONLY)

    # Custom make command
    SET(BOARD_BIN "${BOARD_DIR}/${NAME}.bin")
    ADD_CUSTOM_COMMAND(OUTPUT ${BOARD_BIN}
        DEPENDS ${HEADERS} ${SRCS} ${LINK}
        WORKING_DIRECTORY ${BOARD_DIR}
        COMMAND make -f ${BOARD_MAKE}
    )

    SET(${NAME}_BIN "${BOARD_BIN}" PARENT_SCOPE)
ENDFUNCTION()

ConfigureBoard("pok3r_custom"
    "${POK3R_SOURCES}"
    ht32f1655.ld
    "-DBOARD=1 -DCPU=1"
)
ConfigureBoard("pok3r_rgb_custom"
    "${POK3R_RGB_SOURCES}"
    ht32f1654.ld
    "-DBOARD=2 -DCPU=2"
)
ConfigureBoard("vortex_core_custom"
    "${VORTEX_CORE_SOURCES}"
    ht32f1654.ld
    "-DBOARD=3 -DCPU=2"
)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(firmware-dummy SOURCES ${FILES})

# Firmware target
ADD_CUSTOM_TARGET(firmware ALL
    DEPENDS ${pok3r_custom_BIN}
    #DEPENDS ${pok3r_custom_rgb_BIN}
    #DEPENDS ${vortex_core_custom_BIN}
    )
