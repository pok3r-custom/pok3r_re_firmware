#!/bin/bash

arm-none-eabi-objdump -D -EL -b binary -m arm -M force-thumb -z --adjust-vma=0x2c00 "$1" > "$2"

