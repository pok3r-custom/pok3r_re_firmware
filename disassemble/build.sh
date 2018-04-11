#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

reas () {
    echo "$1"
    elf=$1.elf
    out=$1.bin
    ld=$DIR/$2.ld
    tmp=/tmp/out.o

    rm -f $tmp "$elf"

    arm-none-eabi-as -mcpu=cortex-m3 -mthumb "$1" -o $tmp && \
    arm-none-eabi-ld -T "$ld" -o "$elf" $tmp && \
    arm-none-eabi-objcopy "$elf" -O binary "$out" && \
    echo "  out: $out"
}

pushd $DIR > /dev/null

reas pok3r/builtin/firmware_builtin.s               vma0
reas pok3r/v117/pok3r_v117.s                        vma2c

reas pok3r_rgb/builtin_rgb/firmware_builtin_rgb.s   vma0
reas pok3r_rgb/v140/pok3r_rgb_v140.s                vma34

reas pok3r_rgb2/v105/rgb2_v105.s                    vma34

reas vortex_core/builtin_core/vortex_core_builtin.s vma0
reas vortex_core/v145/core_v145.s                   vma34

reas race3/bootloader/race3_bootloader.s            vma0
reas race3/v124/race_v124.s                         vma34

popd > /dev/null

