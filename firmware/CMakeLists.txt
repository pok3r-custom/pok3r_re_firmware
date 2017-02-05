# Pok3r Firmware CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.2)

PROJECT(Pok3r_Custom C ASM)

### =================== SOURCES =================== ###

SET(COMMON_SOURCES
    common.h
    main.c

    board/types.h

    board/ht32/ht32.h
    board/ht32/ht32f165x.h
    board/ht32/ht32f165x.c
    board/ht32/ht32f1654.h
    board/ht32/ht32f1654.c
    board/ht32/ht32f1655.h
    board/ht32/ht32f1655.c

    board/ht32/startup.s

    board/ht32/usb/descriptors.h
    board/ht32/usb/descriptors.c
    board/ht32/usb/usb.h
    board/ht32/usb/usb.c
)

SET(POK3R_SOURCES
    board/pok3r_board.h
)

SET(POK3R_RGB_SOURCES
    board/pok3r_rgb_board.h
)

FILE(GLOB_RECURSE DEMO_FILES demo/*.c demo/*.h demo/*.s demo/*.ld)

SET(FILES
    ${COMMON_SOURCES}
    ${POK3R_SOURCES}
    ${POK3R_RGB_SOURCES}
    pok3r_custom.ld
    pok3r_rgb_custom.ld
    openocd.cfg
    ${DEMO_FILES}
)

### =================== CONFIG ==================== ###

SET(CMAKE_VERBOSE_MAKEFILE ON)

SET(POK3R_NAME      "pok3r_custom")
SET(POK3R_DIR       "${CMAKE_CURRENT_BINARY_DIR}/${POK3R_NAME}")
SET(POK3R_MAKE      "pok3r.make")

SET(POK3R_RGB_NAME  "pok3r_rgb_custom")
SET(POK3R_RGB_DIR   "${CMAKE_CURRENT_BINARY_DIR}/${POK3R_RGB_NAME}")
SET(POK3R_RGB_MAKE  "pok3r_rgb.make")

# Generate makefiles
SET(OUT_NAME ${POK3R_NAME})
SET(FIRMWARE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
SET(FIRMWARE_BINARY_DIR "${POK3R_DIR}")
SET(C_DEFS "-DBOARD=1 -DCPU=0x1655")
CONFIGURE_FILE(Makefile.in ${POK3R_DIR}/${POK3R_MAKE} @ONLY)

SET(OUT_NAME ${POK3R_RGB_NAME})
SET(FIRMWARE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
SET(FIRMWARE_BINARY_DIR "${POK3R_RGB_DIR}")
SET(C_DEFS "-DBOARD=2 -DCPU=0x1654")
CONFIGURE_FILE(Makefile.in ${POK3R_RGB_DIR}/${POK3R_RGB_MAKE} @ONLY)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(firmware-dummy SOURCES ${FILES})

IF(CMAKE_SYSTEM_NAME MATCHES "Linux")

    # POK3R
    SET(POK3R_BIN "${POK3R_DIR}/${POK3R_NAME}.bin")

    ADD_CUSTOM_COMMAND(OUTPUT ${POK3R_BIN}
        DEPENDS ${STARTUP_SOURCES} ${COMMON_SOURCES} ${POK3R_SOURCES}
        WORKING_DIRECTORY ${POK3R_DIR}
        COMMAND make -f ${POK3R_MAKE}
    )

    # POK3R RGB
    SET(POK3R_RGB_BIN "${POK3R_RGB_DIR}/${POK3R_RGB_NAME}.bin")

    ADD_CUSTOM_COMMAND(OUTPUT ${POK3R_RGB_BIN}
        DEPENDS ${STARTUP_SOURCES} ${COMMON_SOURCES} ${POK3R_RGB_SOURCES}
        WORKING_DIRECTORY ${POK3R_RGB_DIR}
        COMMAND make -f ${POK3R_RGB_MAKE}
    )

    # Firmware target
    ADD_CUSTOM_TARGET(firmware ALL
        DEPENDS ${POK3R_BIN}
        #DEPENDS ${POK3R_RGB_BIN}
    )

ENDIF()
