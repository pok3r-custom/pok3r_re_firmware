# Vortex POK3R (RGB) Custom Firmware Project

*Disclaimer: This project comes with no warranty, and may be used for free at your own risk. I do
this in my free time for fun, as such there are no guarantees of progress or success.*

### Goals / Progress
- POK3R
    - Extract unencrypted POK3R firmware and flash contents. **DONE**
    - Reverse engineer the POK3R firmware and update procedure. **DONE**
    - Application to write new firmware to POK3R over USB. **WIP**
- POK3R RGB
    - Extract unencrypted POK3R RGB firmware and flash contents. **DONE**
    - Reverse engineer the POK3R RGB firmware and update procedure. **WIP**
    - Application to write new firmware to POK3R RGB over USB. *TODO*
- New Firmware
    - Open-source firmware compatible with POK3R and POK3R RGB. *TODO*
        - Patch OpenOCD to allow JTAG flashing of HT32. **DONE**
        - Firmware can be installed from Vortex firmware over USB (no hardware required).
        - Firmware can be rolled back with Votex firmware update application.

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

This will attempt to dump the contents of flash:

    ./pok3rtest dump pok3rdump_flash.bin

Without the patch, it will read a lot of 0x00. With the single-instruction patch, the tool will
read back the entirety of flash, including the unencrypted firmware.

## POK3R Notes

### General
- Holtek HT32F1655
- ARM Cortex M3
- 128KB Flash
- 32KB SRAM
- 64LQFP

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
