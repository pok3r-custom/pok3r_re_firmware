# Vortex POK3R (RGB) Custom Firmware Project

*Disclaimer: This project comes with no warranty, and may be used for free at your own risk. I do
this in my free time for fun, as such there are no guarantees of progress or success.*

### Goals / Progress
- POK3R
    - Extract unencrypted POK3R firmware and flash contents. **DONE**
    - Reverse engineer the POK3R firmware and update procedure. **DONE**
    - Application to write new firmware to POK3R over USB. **DONE**
- POK3R RGB
    - Extract unencrypted POK3R RGB firmware and flash contents. **DONE**
    - Reverse engineer the POK3R RGB firmware and update procedure. **DONE**
    - Application to write new firmware to POK3R RGB over USB. *WIP*
- New Firmware
    - Open-source firmware compatible with POK3R and POK3R RGB. *WIP*
        - Patch OpenOCD to allow JTAG flashing of HT32. **DONE**
        - Firmware can be installed from Vortex firmware over USB (no hardware required).
        - Firmware can be rolled back with Votex firmware update application.

## pok3rtool
The `pok3rtool` CLI application runs on Linux, Windows, and Mac OS X. Along with some development
tools, `pok3rtool` implements the firmware update protocol over USB for the POK3R and POK3R RGB.

The `pok3rtool` executable is built with CMake. You will need the LibChaos submodule cloned to
build it. After it is compiled, it should have no runtime dependencies, and can be run portably.

### Usage
**WARNING: THIS TOOL IS RELATIVELY UNTESTESTED, AND HAS A VERY REAL RISK OF CORRUPTING YOUR
POK3R OR POK3R RGB, MAKING IT UNUSABLE WITHOUT EXPENSIVE DEVELOPMENT TOOLS. PROCEED AT YOUR
OWN RISK.**

The marked commands below are particularly dangerous, and have the ability to put the keyboard
info a state where it will not accept another update.

    ./pok3rtool version
    *./pok3rtool setversion <version>
    ./pok3rtool info

    ./pok3rtool reboot
    ./pok3rtool bootloader

    ./pok3rtool dump <output>
    *./pok3rtool flash <version> <firmware>

Flags:
- `--pok3r` Force connecting to POK3R
- `--pok3r-rgb` Force connecting to POK3R RGB

This will attempt to dump the contents of flash on a POK3R:

    ./pok3rtest --pok3r dump pok3rdump_flash.bin

**NOTE:** The `dump` command will not do much without the firmware patch mentioned below
installed. However, there is not much reason to do this for non-development purporses.

### POK3R Firmware Patch
A very small firmware patch will allow the contents of the flash storage to be read out over USB,
with the protocol used to read the version number during an update. This is effectively
accomplished by changing a single byte in the Vortex firmware updater. In the v117 updater,
changing the byte `0x09` at `0x1A7E5E` to `0x07` will patch the firmware update to allow reading
flash. This circumvents a test in the code that normally only allows reading between 0x2800 and
0x2C00. The relevant disassembly for this is at 0x7240 of the v117 firmware. See patch_v117.txt.

### POK3R RGB Firmware Patch
The POK3R RGB update protocol is more minimal, and inherently doesn't allow reading arbitrary
offsets. The equivalent patch for the POK3R RGB adds the ability to read from arbitrary addresses
to the update protocol. See patch_v130.txt

## POK3R Notes

### General
- Holtek HT32F1655
    - ARM Cortex M3
    - 128KB Flash
    - 32KB SRAM
    - 64LQFP
- GD25Q40
    - 4Mbit EEPROM

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
- Pin 1: 3.3V
- Pin 2: SWDIO
- Pin 3: SWCLK
- Pin 4: nRST
- Pin 5: GND

#### Boot Mode
- BOOT_0: 0
- BOOT_1: 0

SRAM booting? Doesn't make sense to me. It looks like the controller actually gets the vector
table from `0x0` in flash, boots the builtin firmware, then jumps to the main firmware at `0x2C00`.

#### JTAG to SWD
- SWDCK: TCK
- SWDIO: TMS

### Firmware

USB VID/PID: 0x04d9/0x0141

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

Interface 0 is a HID subclass 1 (Boot Interface) keyboard. Interface 1 is a vendor-defined HID
protocol for firmware updates. Interface 2 is a HID subclass 0 keyboard, which supports NKRO,
mouse controls, media keys and system controls.

#### Firmware Updaters
- POK3R_V113.exe
- POK3R_V114.exe
- POK3R_V115.exe
- POK3R_V116.exe
- POK3R_V117.exe


## POK3R RGB Notes

### General
- Holtek HT32F1654
    - ARM Cortex M3
    - 64KB Flash
    - 16KB SRAM
    - 64LQFP
- GD25Q41
    - 4Mbit EEPROM

### PCB

#### Header CN3
- Pin 1: 3.3V?
- Pin 2: SWDIO
- Pin 3: SWCLK
- Pin 4: nRST
- Pin 5: GND

#### Header SEL3
- Pin 1:
- Pin 2:

#### Header SEL4
- Pin 1:
- Pin 2:

### Updater
The updater contains two firmware updates, US and EU layouts, again encrypted twice. The firmware
encryption now spans the entire update, rather than just part like the pok3r updater. This
encryption is a simple XOR with a 52-byte key.

I thought this encryption would be harder to break, but it took longer to reverse the format of
the updater data than to crack the key. The key was upgraded from the previous updater, to a
random 52-byte key. Since parts of the firmware are predictable, and XOR is easily reversible,
the key was easy to determine.

The Windows program version string info identifies the company and copyright as "Cooler Master",
and also names the program "FWUpdate.exe".

### Firmware

USB VID/PID: 0x04d9/0x0167

#### Firmware Updaters
- POK3R_RGB_V124.exe
- POK3R_RGB_V130.exe


## References
[SpritesMods hacked a Cooler Master Quickfire Rapid-i](https://spritesmods.com/?art=rapidisnake),
which uses a similar Holtek ARM microcontroller. I also think the firmware was written for that
keyboard by the same people as the Pok3r. His blog gave me some ideas when working on the Pok3r,
and I ended up coming to mostly the same conclusions as he did.
