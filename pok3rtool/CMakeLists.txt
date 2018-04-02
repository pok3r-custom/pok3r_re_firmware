## Pok3rTool CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

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
    proto_qmkp.h
    proto_qmkp.cpp

    updateinterface.h

    updatepackage.h
    updatepackage.cpp
)

SET(FILES
    99-pok3r.rules
    test.sh
)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(pok3rtool-dummy SOURCES ${FILES})

ADD_EXECUTABLE(pok3rtool ${POK3RTOOL_SOURCES})

SET_PROPERTY(TARGET pok3rtool PROPERTY CXX_STANDARD 11)

TARGET_INCLUDE_DIRECTORIES(pok3rtool PRIVATE ${LIBUSB_1_INCLUDE_DIRECTORIES})
TARGET_COMPILE_DEFINITIONS(pok3rtool PRIVATE ${LIBUSB_1_DEFINITIONS})

TARGET_LINK_LIBRARIES(pok3rtool chaos rawhid ${LIBUSB_1_LIBRARIES})
