## Pok3r CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

PROJECT(Pok3r_RE)

ADD_SUBDIRECTORY(pok3rtool)
ADD_SUBDIRECTORY(firmware)

### =================== SOURCES =================== ###

FILE(GLOB_RECURSE DISASSEMBLE_FILES disassemble/*)

SET(FILES
    README.md
    .travis.yml

    ${DISASSEMBLE_FILES}
)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(pok3r-dummy SOURCES ${FILES})
