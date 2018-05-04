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

    if [[ ! -z "$3" ]]; then
        md5sum "$out" "$3"
    fi
}

pushd $DIR > /dev/null

reas pok3r/builtin/firmware_builtin.s                   vma0
reas pok3r/builtin/firmware_builtin_ref.s               vma0    pok3r/builtin/firmware_builtin.bin
reas pok3r/v117/pok3r_v117.s                            vma2c
reas pok3r/v117/pok3r_v117_ref.s                        vma2c   pok3r/v117/firmware_v117.bin
echo

reas pok3r_rgb/builtin_rgb/firmware_builtin_rgb.s       vma0
reas pok3r_rgb/builtin_rgb/firmware_builtin_rgb_ref.s   vma0    pok3r_rgb/builtin_rgb/firmware_builtin_rgb.bin
reas pok3r_rgb/v140/pok3r_rgb_v140.s                    vma34
reas pok3r_rgb/v140/pok3r_rgb_v140_ref.s                vma34   pok3r_rgb/v140/pok3r_rgb_v140.bin
echo

reas pok3r_rgb2/bootloader/rgb2_bootloader_ref.s        vma0    pok3r_rgb2/bootloader/rgb2_bootloader.bin
reas pok3r_rgb2/v105/rgb2_v105.s                        vma34
reas pok3r_rgb2/v105/rgb2_v105_ref.s                    vma34   pok3r_rgb2/v105/rgb2_v105.bin
echo

reas vortex_core/builtin_core/vortex_core_builtin.s     vma0
reas vortex_core/builtin_core/vortex_core_builtin_ref.s vma0    vortex_core/builtin_core/firmware_builtin_core.bin
reas vortex_core/v145/core_v145.s                       vma34
reas vortex_core/v145/core_v145_ref.s                   vma34   vortex_core/v145/core_v145.bin
echo

reas race3/bootloader/race3_bootloader.s                vma0
reas race3/bootloader/race3_bootloader_ref.s            vma0    race3/bootloader/race3_bootloader.bin
reas race3/v124/race_v124.s                             vma34
reas race3/v124/race_v124_ref.s                         vma34   race3/v124/race_v124.bin
echo

reas vibe/v113/vibe_v113_ref.s                          vma34   vibe/v113/vibe_v113.bin

popd > /dev/null

