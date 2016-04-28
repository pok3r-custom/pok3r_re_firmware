## YAPTLYTOTI CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

PROJECT(USBTest)

ADD_SUBDIRECTORY(libchaos)

#FIND_PACKAGE(LibUSB REQUIRED)
FIND_PATH(LIBUSB_INCLUDE    NAMES libusb-1.0/libusb.h)
FIND_LIBRARY(LIBUSB_LIB     NAMES libusb-1.0.so)

IF(NOT LIBUSB_INCLUDE OR NOT LIBUSB_LIB)
    MESSAGE("ERROR: libusb not found")
ENDIF()

MESSAGE(STATUS "libusb: ${LIBUSB_INCLUDE} ${LIBUSB_LIB}")

### =================== SOURCES =================== ###

SET(SOURCES
    main.cpp
)

### =================== CONFIG ==================== ###

INCLUDE_DIRECTORIES(
    ${LibChaos_INCLUDE}
    ${LIBUSB_INCLUDE}
)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LibChaos_CXX_FLAGS}")
ADD_DEFINITIONS(-DBUILDING)

### =================== BUILD =================== ###

ADD_EXECUTABLE(usbtest ${SOURCES})
TARGET_LINK_LIBRARIES(usbtest chaos ${LIBUSB_LIB})

