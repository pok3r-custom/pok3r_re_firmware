# Vortex Keyboard Custom Firmware Project

[![Travis-CI Badge](https://travis-ci.org/pok3r-custom/pok3r_re_firmware.svg?branch=master "Travis-CI Badge")](https://travis-ci.org/pok3r-custom/pok3r_re_firmware)

*Disclaimer: This project comes with no warranty, and may be used for free at your own risk. I do
this in my free time for fun, as such there are no guarantees of progress or success.*

### Scope
This project includes the reverse engineering effort for the original keyboard firmwares on several
keyboards, including:

- Vortex
    - POK3R
    - POK3R RGB
    - Vortex CORE
    - Vortex Tester
    - Vortex RACE 3
- KBParadise
    - V60 Mini
    - V80 TKL

For the tool developed for communicating with and updating the firmware on Vortex
(and similar) keyboards, see 
[pok3rtool](https://github.com/pok3r-custom/pok3rtool).

For the effort at developing new firmware for these keyboards based on TMK, see
[tmk_pok3r](https://github.com/pok3r-custom/tmk_pok3r).

### POK3R Firmware Patch
A very small firmware patch will allow the contents of the flash storage to be read out over USB,
with the protocol used to read the version number during an update. This is effectively
accomplished by changing a single byte in the Vortex firmware updater. In the v117 updater,
changing the byte `0x09` at `0x1A7E5E` to `0x07` will patch the firmware update to allow reading
flash. This circumvents a test in the code that normally only allows reading between 0x2800 and
0x2C00. The relevant disassembly for this is at 0x7240 of the v117 firmware. See patch_v117.txt.

A patched version of the firmware is provided, see `firmware_v117_patched.bin`. This can be
loaded with `pok3rtool flash`.

### POK3R RGB Firmware Patch
The POK3R RGB update protocol is more minimal, and inherently doesn't allow reading arbitrary
offsets. The equivalent patch for the POK3R RGB adds the ability to read from arbitrary addresses
to the update protocol. See patch_v130.txt

A patched version of the firmware is provided, see `firmware_v130_patched.bin`. This can be
loaded with `pok3rtool flash`.

### Vortex CORE Firmware Patch
A patched version of the firmware is provided, see `firmware_v104_patched.bin`. This can be
loaded with `pok3rtool flash`.

## References
[SpritesMods hacked a Cooler Master Quickfire Rapid-i](https://spritesmods.com/?art=rapidisnake),
which uses a similar Holtek ARM microcontroller. I also think the firmware was written for that
keyboard by the same people as the POK3R. His blog gave me some ideas when working on the POK3R,
and I ended up coming to mostly the same conclusions as he did.
