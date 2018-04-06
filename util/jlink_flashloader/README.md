# JLink Holtek HT32 Flash Loader

In this directory are the source files and binaries for an "Open Flashloader" flash loader for use with the SEGGER JLink software.
This flash loader allows JLink software to write the internal flash of the HT32F1654 and HT32F1655 devices, and all or most other HT32Fxxxx devices with minor modifications to flash and RAM sizes.

## Usage

Add the `<Device>` items in `JLinkDevices.xml` to your system `JLinkDevices.xml`, e.g. `/opt/SEGGER/JLink/JLinkDevices.xml`.

Add the `Holtek` directory to the the `Devices` directory in your JLink install, e.g. `/opt/SEGGER/JLink/Devices`.

## Building

Open the FlashLoader_HT32 solution (`FlashLoader_HT32.emProject`) with SEGGER Embedded Studio. Select the desired project, and build the Release configuration. The flash loader binares will be in `Output/Release/Exe`.
