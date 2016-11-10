#!/bin/bash

arm-none-eabi-objdump -D -EL -b binary -m arm -M force-thumb "$1" > "$2"

