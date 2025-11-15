# JLink Holtek HT32 Flash Loader

In this directory are the source files and binaries for flash loaders for use with the SEGGER JLink software.
These flash loaders allows the JLink software to write the internal flash of the HT32F1654 and HT32F1655 devices, and all or most other HT32Fxxxx devices with minor modifications to flash and RAM sizes.

## Newer JLink software

The `FlashLoader_HT32_v2` directory contains a [SEGGER Flash Loader](https://wiki.segger.com/SEGGER_Flash_Loader) for the HT32 series MCUs. This requires relatively modern JLink software (maybe v7.80 and up).

The `Holtek` directory can be dropped directly into the appropriate `JLinkDevices` folder in your JLink software install. See [here](https://wiki.segger.com/J-Link_Device_Support_Kit#JLinkDevices_folder).

## Older JLink software

The "Open Flashloader" format seems to be abandoned by SEGGER, and these flash loaders will (quietly) not work correctly with newer JLink software (maybe v7.80 and up).

Anyway, the `FlashLoader_HT32` directory contains the source for the legacy flash loader.

The `Legacy/JLinkDevices.xml` file must be merged with your JLink software's `JLinkDevices.xml` (e.g. `/opt/SEGGER/JLink/JLinkDevices.xml`) by copying `<Device>` items.

Add the `Legacy/Devices/Holtek` directory to the the `Devices` directory in your JLink install (e.g. `/opt/SEGGER/JLink/Devices`).

## Building

Open the FlashLoader_HT32 solution (`FlashLoader_HT32.emProject`) with SEGGER Embedded Studio. Select the desired project, and build the Release configuration. The flash loader binares will be in `Output/Release/Exe`.
