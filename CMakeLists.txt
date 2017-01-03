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
    pok3rtool/pok3r_rgb.h
    pok3rtool/pok3r_rgb.cpp

    pok3rtool/hiddevice.h
    pok3rtool/hiddevice.cpp

    pok3rtool/usbdevice.h
    pok3rtool/usbdevice.cpp

    pok3rtool/updateinterface.h

    pok3rtool/rawhid/hid.h
)

IF(${LibChaos_PLATFORM_WINDOWS})
    SET(SOURCES ${SOURCES} pok3rtool/rawhid/hid_WINDOWS.c)
ELSEIF(${LibChaos_PLATFORM_MACOSX})
    SET(SOURCES ${SOURCES} pok3rtool/rawhid/hid_MACOSX.c)
ELSE()
    SET(SOURCES ${SOURCES} pok3rtool/rawhid/hid_LINUX.c)
ENDIF()

SET(FILES
    README.md

    disassemble/build.sh
    disassemble/unas.sh

    disassemble/builtin/firmware_builtin.bin
    disassemble/builtin/firmware_builtin.txt
    disassemble/builtin/symbols_builtin.txt
    disassemble/builtin/sram-variables_builtin.txt

    disassemble/builtin_rgb/firmware_builtin_rgb.bin
    disassemble/builtin_rgb/firmware_builtin_rgb.txt
    disassemble/builtin_rgb/symbols_builtin_rgb.txt

    disassemble/v117/firmware_v117.bin
    disassemble/v117/firmware_v117.txt
    disassemble/v117/symbols_v117.txt
    disassemble/v117/sram-variables_v117.txt
    disassemble/v117/descriptors.h

    disassemble/v130/firmware_v130.bin
    disassemble/v130/firmware_v130.txt
    disassemble/v130/symbols_v130.txt
    disassemble/v130/sram-variables_v130.txt
    disassemble/v130/patch_v130.txt
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

    pok3rtool/99-pok3r.rules
    pok3rtool/rawhid/hid_LINUX.c
    pok3rtool/rawhid/hid_MACOSX.c
    pok3rtool/rawhid/hid_WINDOWS.c
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

IF(${LibChaos_PLATFORM_WINDOWS})
    TARGET_LINK_LIBRARIES(pok3rtest ${LIBUSB_1_LIBRARIES} setupapi hid)
ELSEIF(${LibChaos_PLATFORM_MACOSX})
    TARGET_LINK_LIBRARIES(pok3rtest ${LIBUSB_1_LIBRARIES})
ELSE()
    TARGET_LINK_LIBRARIES(pok3rtest ${LIBUSB_1_LIBRARIES} usb hidapi-hidraw)
ENDIF()
