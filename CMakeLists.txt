## Pok3r CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3r)

ADD_SUBDIRECTORY(pok3rtool)

### =================== SOURCES =================== ###

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
    disassemble/v117/patch_v117.txt
    disassemble/v117/descriptors.h

    disassemble/v130/firmware_v130.bin
    disassemble/v130/firmware_v130.txt
    disassemble/v130/symbols_v130.txt
    disassemble/v130/sram-variables_v130.txt
    disassemble/v130/patch_v130.txt
    disassemble/v130/fw_xor_decode.c

    firmware/main.c

    firmware/Makefile
    firmware/linker.ld

    firmware/pok3r-jlink.cfg
    firmware/pok3r-buspirate.cfg

    firmware/ht32/ht32_usbd_class.h
    firmware/ht32/ht32_usbd_class.c
    firmware/ht32/ht32_usbd_descriptor.h
    firmware/ht32/ht32_usbd_descriptor.c
    firmware/ht32/ht32f165x_it.c
    firmware/ht32/ht32f165x_usbdconf.h
    firmware/ht32/startup_ht32f165x.s
)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(pok3r-dummy SOURCES ${FILES})
