## Pok3r CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

PROJECT(Pok3r)

ADD_SUBDIRECTORY(pok3rtool)
ADD_SUBDIRECTORY(firmware)

### =================== SOURCES =================== ###

SET(FILES
    README.md

    disassemble/build.sh
    disassemble/unas.sh

    disassemble/pok3r/builtin/firmware_builtin.bin
    disassemble/pok3r/builtin/firmware_builtin.txt
    disassemble/pok3r/builtin/symbols_builtin.txt
    disassemble/pok3r/builtin/sram-variables_builtin.txt

    disassemble/pok3r/builtin/firmware_builtin.s
    disassemble/pok3r/builtin/symbols_builtin.sym
    disassemble/pok3r/builtin/data_builtin.sym

    disassemble/pok3r/v117/firmware_v117.bin
    disassemble/pok3r/v117/firmware_v117.txt
    disassemble/pok3r/v117/symbols_v117.txt
    disassemble/pok3r/v117/sram-variables_v117.txt
    disassemble/pok3r/v117/patch_v117.txt
    disassemble/pok3r/v117/descriptors.h

    disassemble/pok3r/v117/firmware_v117.s
    disassemble/pok3r/v117/symbols_v117.sym
    disassemble/pok3r/v117/data_v117.sym

    disassemble/pok3r_rgb/builtin_rgb/firmware_builtin_rgb.bin
    disassemble/pok3r_rgb/builtin_rgb/firmware_builtin_rgb.txt
    disassemble/pok3r_rgb/builtin_rgb/symbols_builtin_rgb.txt
    disassemble/pok3r_rgb/builtin_rgb/sram-variables_builtin_rgb.txt

    disassemble/pok3r_rgb/builtin_rgb/firmware_builtin_rgb.s
    disassemble/pok3r_rgb/builtin_rgb/symbols_builtin_rgb.sym
    disassemble/pok3r_rgb/builtin_rgb/data_builtin_rgb.sym

    disassemble/pok3r_rgb/v130/firmware_v130.bin
    disassemble/pok3r_rgb/v130/firmware_v130.txt
    disassemble/pok3r_rgb/v130/symbols_v130.txt
    disassemble/pok3r_rgb/v130/sram-variables_v130.txt
    disassemble/pok3r_rgb/v130/patch_v130.txt
    disassemble/pok3r_rgb/v130/fw_xor_decode.c

    disassemble/pok3r_rgb/v130/firmware_v130.s
    disassemble/pok3r_rgb/v130/symbols_v130.sym
    disassemble/pok3r_rgb/v130/data_v130.sym

    disassemble/vortex_core/builtin_core/firmware_builtin_core.bin
    disassemble/vortex_core/builtin_core/firmware_builtin_core.txt

    disassemble/vortex_core/v104/firmware_v104.bin
    disassemble/vortex_core/v104/firmware_v104.txt
    disassemble/vortex_core/v104/patch_v104.txt
)

### =================== BUILD =================== ###

ADD_CUSTOM_TARGET(pok3r-dummy SOURCES ${FILES})
