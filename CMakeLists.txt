## YAPTLYTOTI CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3r)

ADD_SUBDIRECTORY(libchaos)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR})
FIND_PACKAGE(LibUSB-1.0 REQUIRED)

#FIND_PATH(LIBUSB_INCLUDE    NAMES libusb-1.0/libusb.h)
#FIND_LIBRARY(LIBUSB_LIB     NAMES libusb-1.0.dylib)

#IF(NOT LIBUSB_INCLUDE OR NOT LIBUSB_LIB)
#    MESSAGE("ERROR: libusb not found")
#ENDIF()

#MESSAGE(STATUS "libusb: ${LIBUSB_INCLUDE} ${LIBUSB_LIB}")

### =================== SOURCES =================== ###

SET(SOURCES
    main.cpp
    pok3r.h
    pok3r.cpp
    README.md
    disassemble/fw117.txt
    disassemble/functions.txt
)

### =================== CONFIG ==================== ###

INCLUDE_DIRECTORIES(
    ${LibChaos_INCLUDE}
    ${LIBUSB_1_INCLUDE_DIRS}
)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LibChaos_CXX_FLAGS} ${LIBUSB_1_DEFINITIONS}")
ADD_DEFINITIONS(-DBUILDING)

### =================== BUILD =================== ###

ADD_EXECUTABLE(pok3rtest ${SOURCES})
TARGET_LINK_LIBRARIES(pok3rtest chaos ${LIBUSB_1_LIBRARIES})

