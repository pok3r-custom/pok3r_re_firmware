#!/bin/bash

mkdir /tmp/pcap

# Split usb interrupt packet data into files
tshark -nxr "$1" "usb.transfer_type == 1 && usb.src == host" | awk -v RS= '{print > ("/tmp/pcap/pcap-" NR ".asc")}'

# Convert ascii packets to patch list
(find /tmp/pcap -type f -name '*.asc' | while read i; do
    # Skip urb header
    # Make ascii patch
    xxd -r $i | dd bs=1 skip=27 | xxd -p - | tr -d '\n'
    echo
done) | grep '^0101' | sed -E 's/.{8}(..)(..).{12}/\2\1: /' > /tmp/pcap/pcap-list.asc

# Patch flash image
dd if=/dev/zero bs=128K count=1 | tr "\000" "\377" > /tmp/pcap/pcapflash.bin
cat /tmp/pcap/pcap-list.asc | xxd -r -c 52 - /tmp/pcap/pcapflash.bin
dd if=/tmp/pcap/pcapflash.bin of=pcapfw.bin bs=1 skip=11264 count=25812

rm -rf /tmp/pcap

