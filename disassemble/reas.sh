#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    exit
fi

rm -f /tmp/out.o "$1.elf"

#arm-none-eabi-as -mcpu=cortex-m3 -mthumb --no-pad-sections "$1" -o /tmp/out.o
arm-none-eabi-as -mcpu=cortex-m3 -mthumb "$1" -o /tmp/out.o
if (( $? != 0 )); then exit 1; fi
arm-none-eabi-ld -T "$2" -o "$1.elf" /tmp/out.o
if (( $? != 0 )); then exit 2; fi
arm-none-eabi-objcopy "$1.elf" -O binary "$1.bin"
if (( $? != 0 )); then exit 3; fi

echo "  out: $1.bin"
