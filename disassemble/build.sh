#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

reas () {
    echo "$1"
    elf=$1.elf
    out=$1.bin
    ld=$DIR/$2.ld
    tmp=/tmp/out.o

    rm -f $tmp "$elf"

    #arm-none-eabi-as -mcpu=cortex-m3 -mthumb "$1" -o $tmp && \
    arm-none-eabi-as "$1" -o $tmp && \
    arm-none-eabi-ld -T "$ld" -o "$elf" $tmp && \
    arm-none-eabi-objcopy "$elf" -O binary "$out" && \
    echo "  out: $out"

    if [[ ! -z "$3" ]]; then
        #sha1sum "$out" "$3" && echo "reassemble OK"
        cmp -s "$out" "$3" && echo "  OK" || echo "  DIFFER"
    fi
}

pushd $DIR > /dev/null

#    Assembler Source                                   VMA     Comparison Binary

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

reas core/builtin_core/vortex_core_builtin.s            vma0
reas core/builtin_core/vortex_core_builtin_ref.s        vma0    core/builtin_core/firmware_builtin_core.bin
reas core/v145/core_v145.s                              vma34
reas core/v145/core_v145_ref.s                          vma34   core/v145/core_v145.bin
echo

reas race/bootloader/race_bootloader.s                  vma0
reas race/bootloader/race_bootloader_ref.s              vma0    race/bootloader/race_bootloader.bin
reas race/v124/race_v124.s                              vma34
reas race/v124/race_v124_ref.s                          vma34   race/v124/race_v124.bin
echo

reas vibe/v113/vibe_v113_ref.s                          vma34   vibe/v113/vibe_v113.bin
echo

reas md200/bootloader/md200_bootloader_ref.s            vma0    md200/bootloader/md200_bootloader.bin
reas md200/v112/md200_v112_ref.s                        vma34   md200/v112/md200_v112.bin
echo

reas md600/v148/md600_v148_ref.s                        vma34   md600/v148/md600_v148.bin
echo

popd > /dev/null

