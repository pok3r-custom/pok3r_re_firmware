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

SET(FILES
    ${COMMON_SOURCES}
    ${POK3R_SOURCES}
    ${POK3R_RGB_SOURCES}
    pok3r_custom.ld
    pok3r_rgb_custom.ld
    pok3r-jlink.cfg
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

ADD_CUSTOM_TARGET(pok3r_custom ALL
    DEPENDS ${COMMON_SOURCES} ${POK3R_SOURCES}
    WORKING_DIRECTORY ${POK3R_DIR}
    COMMAND make -f ${POK3R_MAKE}
)

ADD_CUSTOM_TARGET(pok3r_rgb_custom ALL
    DEPENDS ${COMMON_SOURCES} ${POK3R_RGB_SOURCES}
    WORKING_DIRECTORY ${POK3R_RGB_DIR}
    COMMAND make -f ${POK3R_RGB_MAKE}
)
