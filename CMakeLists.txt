## YAPTLYTOTI CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3r)

ADD_SUBDIRECTORY(pok3rtool/libchaos)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/pok3rtool)
FIND_PACKAGE(LibUSB-1.0 REQUIRED)

#FIND_PATH(LIBUSB_INCLUDE    NAMES libusb-1.0/libusb.h)
#FIND_LIBRARY(LIBUSB_LIB     NAMES libusb-1.0.dylib)

#IF(NOT LIBUSB_INCLUDE OR NOT LIBUSB_LIB)
#    MESSAGE("ERROR: libusb not found")
#ENDIF()

#MESSAGE(STATUS "libusb: ${LIBUSB_INCLUDE} ${LIBUSB_LIB}")

### =================== SOURCES =================== ###

SET(SOURCES
    pok3rtool/main.cpp
    pok3rtool/pok3r.h
    pok3rtool/pok3r.cpp
)

SET(FILES
    README.md

    disassemble/build.sh
    disassemble/unas.sh

    disassemble/builtin/firmware_builtin.bin
    disassemble/builtin/firmware_builtin.txt
    disassemble/builtin/symbols_builtin.txt
    disassemble/builtin/sram-variables_builtin.txt

    disassemble/v117/firmware_v117.bin
    disassemble/v117/firmware_v117.txt
    disassemble/v117/symbols_v117.txt
    disassemble/v117/sram-variables_v117.txt
    disassemble/v117/descriptors.h

    disassemble/v130/firmware_v130.bin
    disassemble/v130/firmware_v130.txt
    disassemble/v130/fw_xor_decode.c

    firmware/ht32f165x.cfg
    firmware/pok3r-jlink.cfg
    firmware/pok3r-buspirate.cfg
    firmware/Makefile
    firmware/linker.ld
    firmware/startup_ht32f165x.s
    firmware/main.c
    firmware/ht32_usbd_class.h
    firmware/ht32_usbd_class.c
    firmware/ht32_usbd_descriptor.h
    firmware/ht32_usbd_descriptor.c
    firmware/ht32f165x_it.c
    firmware/ht32f165x_usbdconf.h
)

### =================== CONFIG ==================== ###

INCLUDE_DIRECTORIES(
    ${LibChaos_INCLUDE}
    ${LIBUSB_1_INCLUDE_DIRS}
)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LibChaos_CXX_FLAGS} ${LIBUSB_1_DEFINITIONS}")
ADD_DEFINITIONS(-DBUILDING)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(poker-dummy SOURCES ${FILES})

ADD_EXECUTABLE(pok3rtest ${SOURCES})
LibChaos_Configure_Target(pok3rtest)
TARGET_LINK_LIBRARIES(pok3rtest ${LIBUSB_1_LIBRARIES})
