# Vortex Pok3r Custom Firmware Project

*Disclaimer: This project comes with no warranty, and may be used for free at your own risk. I do
this in my free time for fun, as such there are no guarantees of progress or success.*

### Goals / Progress
- Reverse engineer the Pok3r firmware and update procedure. **DONE**
- Application to write new firmware to Pok3r over USB. **WIP, Mostly Done**
- Open-source firmware compatible with Pok3r. *Not Started*
    - Firmware can be installed from Vortex firmware over USB (no hardware required).
    - Firmware can be rolled back with Votex firmware update application.

### Firmware Patch
A very small firmware patch will allow the contents of the flash storage to be read out over USB,
with the protocol used to read the version number during an update. This is effectively
accomplished by changing a single byte in the Vortex firmware updater. In the v117 updater,
changing the byte `0x09` at `0x1A7E5E` to `0x07` will patch the firmware update to allow reading
flash. This circumvents a test in the code that normally only allows reading between 0x2800 and
0x2C00. The relevant disassembly for this is at 0x7240 of the v117 firmware.

### Usage
The `pok3rtool` application is built with CMake. You will need the LibChaos submodule cloned, and
libusb installed. It works on Linux, and will run on Windows, but USB functions will fail on
Windows without the correct libusb drivers. If you figure out what exactly needs to be installed,
please tell me, because it stopped working on my machine.

    ./pok3rtest version
    ./pok3rtest setversion <version>

    ./pok3rtest read <start address> <length> <output.bin>
    ./pok3rtest flash <version> <firmware>

    ./pok3rtest decode <path to updater> <output>
    ./pok3rtest encode <path to firmware image> <output>
    ./pok3rtest encodepatch <path to updater> <path to firmware> <output updater>

This will attempt to read the 128K flash:

    ./pok3rtest read 0x0 0x20000 pok3rdump_flash.bin

Without the patch, it will read a lot of 0x00. With the single-instruction patch, the tool will
read back the entirety of flash, including the unencrypted firmware.

## Pok3r Notes

### General
- Holtek MCU HT32F1655
- ARM Cortex M3

### Updater
The updater executable contains the firmware update, encrypted twice. It is decrypted once by
the updater (package encryption), sent to the keyboard, and decrypted again (firmware encryption)
before being written to flash.

The updater also contains an info block for the firmware, which has the size of the firmware, the
version, and some string for the UI. This is encrypted only by the package encryption method.

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

USB VID: 0x04d9
USB PID: 0x0141

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
- Unknown processor, probably HT32F1755 (I don't have a Pok3r RGB)

### Updater
This updater will be harder to break, if even possible. The firmware and info chunks are present
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
- POK3R_RGB_V124.exe
- POK3R_RGB_V130.exe


## References
[SpritesMods hacked a Cooler Master Quickfire Rapid-i](https://spritesmods.com/?art=rapidisnake),
which uses a similar Holtek ARM microcontroller. I also think the firmware was written for that
keyboard by the same people as the Pok3r. His blog gave me some ideas when working on the Pok3r,
and I ended up coming to mostly the same conclusions as he did.
