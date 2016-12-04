# Vortex Pok3r Custom Firmware Project

This project is primarily for educational purposes, learning ARM and Thumb the hard way.
A secondary goal is to reverse engineer the functions of the Pok3r firmware, for the purpose
of creating a piece of custom firmware to replace it, ideally from scratch in C. Writing custom
firmware for the ARM processor and board would not be hard, with the barely adequate Holtek
documentation, and an oscilliscope and multimeter to map the PCB traces.

However, the main issue is in then deploying that firmware usefully. Custom firmware has little
value if it requires a JTAG emulator to deploy, in contrast to the existing Vortex firmware, which
can be updated over USB with a Windows program. So, the goal is then to replicate the process
Vortex uses for firmware updates, such that custom firmware can be deployed over USB, AND maintain
the existing update interface, so the keyboard can be rolled back or updated to official firmware
releases.

So far, we know the update procedure from the PC side. The USB HID Report Descriptor 1
(the 34-byte one) exposed by the keyboard represents a vendor-defined HID protocol, for reading
and writing to the flash of the keyboard. See pok3r.h and pok3r.cpp for the implementation of this.
We can see that each write packet can hold up to 52 bytes.

The official firmware has a bit of code that only allows reading from flash with the update
protocol between 0x2800 and 0x2c00 (beginning of firmware). This is to read the version number from
the keyboard, which lives at 0x2800. Otherwise, it appears that writing is not forbidden anywhere,
although there are update protocol commands for entering flash mode, which likely jumps to the
built-in firmware at the beginning of flash, so the main firmware can be overwritten.

Since we couldn't get the firmware over USB, and we could only erase flash over JTAG, we wouldn't
able to read it first, I looked for the firmware update in the updater program. Based loosely
on the idea of Sprite's work [here](https://spritesmods.com/?art=rapidisnake), I extracted the
"encrypted" firmware image from the Windows updater executable, looked like slightly patterned
nonsense. Knowing what a vector table, ARM instructions, and blocks of zeroes should look like,
I reverse engineered the simple byteswap and shift "encryption" that covered the firmware update
and a chunk of strings in the updater, which really wasn't very hard.

The resulting "decypted" firmware update had an intact vector table, and most of the later code
looked fine, but there was a big chunk at the beginning that was trash. So, it is encrypted some
other way. This decrypted image was compared to the data send over USB during the update, and
they were identical, so the second decryption step is done on the keyboard.

Fortuntely, I eventually came to a breakthrough. I found in the unobfuscated part of the firmware
update code that test against the known read boundaries, 0x2800 and 0x2c00. The relevant code is at
0x7240 in the v117 disassembly, and the instruction that replaces forbidden bytes with zero is at
0x725a. Replacing this single instruction with a NOP, re-"encrypting" the update with the
reverse-engineered algorithm, patching the update back into the updater, crossing all the fingers,
and running the updater worked perfectly.

So, the C++ program that can read the flash over USB is built in this project with the CMakeLists.
I won't detail how to use CMake, it is a pretty standard procedure. You will need the LibChaos
submodule cloned, and libusb installed. It works on Linux, and ocassionally Windows. (seriously)

This will attempt to read the 128K flash:

    ./pok3rtest read pok3rdump_flash.bin

Without the patch, it will read a lot of 0x00 and 0xFF. With the single-instruction patch, the
tool will read back the entirety of flash, including the unencrypted firmware. Comparing this
version against the earlier version extracted from the updater, we can see the obfuscated region is
aligned on 52-byte boundaries. It looks like the update packets where 10 < i < 100 are decrypted by
the keyboard, and the rest are written untouched.

And that is the current state of the project, trying to determine the update and decryption
procedure in the firmware by static analysis of the disassembly. I have attempted serveral times
to get a JTAG emulator to work over the SWD pins, but have not had much luck. I don't want to brick
my keyboard, so I haven't pushed too hard at that.


## Pok3r Notes

### General
- Holtek MCU HT32F1655
- ARM Cortex M3

### Updater
The updater executable contains the firmware update, encrypted twice. It is decrypted once by
the updater (package encryption), sent to the keyboard, and decrypted again (firmware encryption)
before being written to flash.

The updater also contains a chunk of strings for the updater UI. These are encrypted only by the
first scheme (package encryption).

The Windows program version string identifies the program name as "FWUpdate.exe", and the other
fields are "TODO: <field name in chinese characters>.

### PCB

#### Header CN2
- Pin 1: 3.3V?
- Pin 2: SWDIO
- Pin 3: SWCLK
- Pin 4: nRST
- Pin 5: GND

#### Boot Mode
- BOOT_0: 0
- BOOT_1: 0

#### JTAG to SWD
- SWDCK: TCK
- SWDIO: TMS
- nRST

### Firmware

#### USB Descriptor Hierarchy
- usb_device_desc
    - usb_config_desc
        - usb_interface0_desc
            - usb_endpoint1_desc
            - usb_hid0_desc
                - usb_report0_desc
        - usb_interface1_desc
            - usb_endpoint3_desc
            - usb_endpoint4_desc
            - usb_hid1_desc
                - usb_report1_desc
        - usb_interface2_desc
            - usb_endpoint2_desc
            - usb_hid2_desc
                - usb_report2_desc
- usb_str0_desc
- usb_str1_desc

#### Firmware Updaters
- POK3R_V113.exe
- POK3R_V114.exe
- POK3R_V115.exe
- POK3R_V116.exe
- POK3R_V117.exe


## Pok3r RGB Notes

### General
- Unknown processor (do not actually have a pok3r RGB)

### Updater
This updater will be harder to break, if even possible. The firmware and string chunks are present
as in the Pok3r updater, and seem to be encrypted with the same scheme (package encryption). It
also seems that there are two firmware chunks. Based on the strings in the file, the first is for
US Layout, and the second is for EU Layout.

However, the updates do not look like firmware at all. I cannot see a vector table or a data region,
like was visible in the Pok3r updates. An encryption scheme that encrypts words in-place, even with
a rotating key, should leave some pattern behind, so my guess is the encryption is a lot better on
this firmware.

Also, it is worth noting that the Windows program version string info identifies the company and
copyright at "Cooler Master", and also names the program "FWUpdate.exe".

### Firmware

#### Firmware Updaters
- POK3R_V124.exe
- POK3R_V130.exe
