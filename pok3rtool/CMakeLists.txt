## Pok3rTool CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3rTool)

ADD_SUBDIRECTORY(libchaos)
ADD_SUBDIRECTORY(rawhid)

### =================== SOURCES =================== ###

SET(POK3RTOOL_SOURCES
    main.cpp

    proto_pok3r.h
    proto_pok3r.cpp
    proto_cykb.h
    proto_cykb.cpp
    #vortex_core.h
    #vortex_core.cpp
    #vortex_tester.h
    #vortex_tester.cpp

    hiddevice.h
    hiddevice.cpp

    updateinterface.h
)

SET(FILES
    99-pok3r.rules
)

### =================== CONFIG ==================== ###

INCLUDE_DIRECTORIES(
    ${LibChaos_INCLUDE}
    ${LIBUSB_1_INCLUDE_DIRS}
)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LibChaos_CXX_FLAGS} ${LIBUSB_1_DEFINITIONS}")

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(pok3rtool-dummy SOURCES ${FILES})

ADD_EXECUTABLE(pok3rtool ${POK3RTOOL_SOURCES})
LibChaos_Configure_Target(pok3rtool)
TARGET_LINK_LIBRARIES(pok3rtool rawhid ${LIBUSB_1_LIBRARIES})
