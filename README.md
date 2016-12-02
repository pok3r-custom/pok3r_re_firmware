Vortex Pok3r Custom Firmware Project

Holtek MCU HT32F1655
ARM Cortex M3

## Firmware Updaters:
- POK3R_V113.exe
- POK3R_V114.exe
- POK3R_V115.exe
- POK3R_V116.exe
- POK3R_V117.exe

## PCB Notes

# Header CN2
- Pin 1: 3.3V?
- Pin 2: SWDIO
- Pin 3: SWCLK
- Pin 4: nRST
- Pin 5: GND

# Boot Mode
- BOOT_0: 0
- BOOT_1: 0

# JTAG to SWD
- SWDCK: TCK
- SWDIO: TMS
- nRST

## Firmware Notes

# USB Descriptor Hierarchy
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
