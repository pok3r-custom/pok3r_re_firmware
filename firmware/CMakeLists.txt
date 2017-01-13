# Pok3r Firmware CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3r_Custom C ASM)

### =================== SOURCES =================== ###

SET(COMMON_SOURCES
    main.c
    startup.s

    board/ht32f165x_cpu.h

    usb/descriptors.h
    usb/descriptors.c
    usb/usb.h
    usb/usb.c
)

SET(POK3R_SOURCES
    board/ht32f1655_cpu.h
    board/pok3r_board.h
)

SET(POK3R_RGB_SOURCES
    board/ht32f1654_cpu.h
    board/pok3r_board.h
)

FILE(GLOB_RECURSE DEMO_FILES demo/*.c demo/*.h demo/*.s demo/*.ld)
FILE(GLOB_RECURSE HT32_FILES ht32/*.c ht32/*.h ht32/*.s ht32/*.ld)

SET(FILES
    ${COMMON_SOURCES}
    ${POK3R_SOURCES}
    ${POK3R_RGB_SOURCES}
    pok3r_custom.ld
    pok3r_rgb_custom.ld
    openocd.cfg
    ${DEMO_FILES}
    ${HT32_FILES}
)

### =================== CONFIG ==================== ###

#SET(CMAKE_VERBOSE_MAKEFILE ON)

SET(POK3R_NAME      "pok3r_custom")
SET(POK3R_DIR       "${CMAKE_CURRENT_BINARY_DIR}/${POK3R_NAME}")
SET(POK3R_MAKE      "pok3r.make")

SET(POK3R_RGB_NAME  "pok3r_rgb_custom")
SET(POK3R_RGB_DIR   "${CMAKE_CURRENT_BINARY_DIR}/${POK3R_RGB_NAME}")
SET(POK3R_RGB_MAKE  "pok3r_rgb.make")

# Generate makefiles
SET(OUT_NAME ${POK3R_NAME})
SET(C_DEFS "-D POK3R")
CONFIGURE_FILE(Makefile.in ${POK3R_DIR}/${POK3R_MAKE} @ONLY)

SET(OUT_NAME ${POK3R_RGB_NAME})
SET(C_DEFS "-D POK3R_RGB")
CONFIGURE_FILE(Makefile.in ${POK3R_RGB_DIR}/${POK3R_RGB_MAKE} @ONLY)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(firmware-dummy SOURCES ${FILES})

IF(NOT CMAKE_SYSTEM_NAME MATCHES "Windows" AND
   NOT CMAKE_SYSTEM_NAME MATCHES "Darwin")

    ADD_CUSTOM_TARGET(pok3r_custom ALL
        DEPENDS ${COMMON_SOURCES} ${POK3R_SOURCES}
        WORKING_DIRECTORY ${POK3R_DIR}
        VERBATIM
        COMMAND make -f ${POK3R_MAKE}
    )

    ADD_CUSTOM_TARGET(pok3r_rgb_custom ALL
        DEPENDS ${COMMON_SOURCES} ${POK3R_RGB_SOURCES}
        WORKING_DIRECTORY ${POK3R_RGB_DIR}
        VERBATIM
        COMMAND make -f ${POK3R_RGB_MAKE}
    )

ENDIF()
