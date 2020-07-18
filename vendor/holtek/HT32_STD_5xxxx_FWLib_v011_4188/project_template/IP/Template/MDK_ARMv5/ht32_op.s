;/*---------------------------------------------------------------------------------------------------------*/
;/* Holtek Semiconductor Inc.                                                                               */
;/*                                                                                                         */
;/* Copyright (C) Holtek Semiconductor Inc.                                                                 */
;/* All rights reserved.                                                                                    */
;/*                                                                                                         */
;/*-----------------------------------------------------------------------------------------------------------
;  File Name        : ht32_op.s
;  Version          : V1.04
;  Date             : 2019-08-02
;  Description      : HT32 Series Flash Option Bytes Block.
;-----------------------------------------------------------------------------------------------------------*/

;/****************************************************************************                              */
;/* <<< Use Configuration Wizard in Context Menu >>>                                                        */
;/****************************************************************************                              */

;// <e> Program setting into Option Byte
;// <i> Setting of Page erase/program protection and security protection of Flash (configured in Option Byte)
FLASH_OPT     EQU     0
;// </e>

;// <h> ------------------------------------------------------------------------------------------------------
;// </h>
;// <h> -- Main Flash page erase/program protection (OB_PP0 bits)
;// <i> Enable page erase/program protection to prevent unwanted change of Flash contents.
;// <i> One bit for n pages. Check FMC chapter of User Manual for detailed.
;//   <o0.0 >  Enable page erase/Program Protection 0  - OB_PP[0]
;//   <o0.1 >  Enable page erase/Program Protection 1  - OB_PP[1]
;//   <o0.2 >  Enable page erase/Program Protection 2  - OB_PP[2]
;//   <o0.3 >  Enable page erase/Program Protection 3  - OB_PP[3]
;//   <o0.4 >  Enable page erase/Program Protection 4  - OB_PP[4]
;//   <o0.5 >  Enable page erase/Program Protection 5  - OB_PP[5]
;//   <o0.6 >  Enable page erase/Program Protection 6  - OB_PP[6]
;//   <o0.7 >  Enable page erase/Program Protection 7  - OB_PP[7]
;//   <o0.8 >  Enable page erase/Program Protection 8  - OB_PP[8]
;//   <o0.9 >  Enable page erase/Program Protection 9  - OB_PP[9]
;//   <o0.10 > Enable page erase/Program Protection 10 - OB_PP[10]
;//   <o0.11 > Enable page erase/Program Protection 11 - OB_PP[11]
;//   <o0.12 > Enable page erase/Program Protection 12 - OB_PP[12]
;//   <o0.13 > Enable page erase/Program Protection 13 - OB_PP[13]
;//   <o0.14 > Enable page erase/Program Protection 14 - OB_PP[14]
;//   <o0.15 > Enable page erase/Program Protection 15 - OB_PP[15]
;//   <o0.16 > Enable page erase/Program Protection 16 - OB_PP[16]
;//   <o0.17 > Enable page erase/Program Protection 17 - OB_PP[17]
;//   <o0.18 > Enable page erase/Program Protection 18 - OB_PP[18]
;//   <o0.19 > Enable page erase/Program Protection 19 - OB_PP[19]
;//   <o0.20 > Enable page erase/Program Protection 20 - OB_PP[20]
;//   <o0.21 > Enable page erase/Program Protection 21 - OB_PP[21]
;//   <o0.22 > Enable page erase/Program Protection 22 - OB_PP[22]
;//   <o0.23 > Enable page erase/Program Protection 23 - OB_PP[23]
;//   <o0.24 > Enable page erase/Program Protection 24 - OB_PP[24]
;//   <o0.25 > Enable page erase/Program Protection 25 - OB_PP[25]
;//   <o0.26 > Enable page erase/Program Protection 26 - OB_PP[26]
;//   <o0.27 > Enable page erase/Program Protection 27 - OB_PP[27]
;//   <o0.28 > Enable page erase/Program Protection 28 - OB_PP[28]
;//   <o0.29 > Enable page erase/Program Protection 29 - OB_PP[29]
;//   <o0.30 > Enable page erase/Program Protection 30 - OB_PP[30]
;//   <o0.31 > Enable page erase/Program Protection 31 - OB_PP[31]
;// </h>
;// <h> -- Main Flash page erase/program protection (OB_PP1 bits)
;// <i> Enable page erase/program protection to prevent unwanted change of Flash contents.
;// <i> One bit for n pages. Check FMC chapter of User Manual for detailed.
;//   <o1.0 >  Enable page erase/Program Protection 32 - OB_PP[32]
;//   <o1.1 >  Enable page erase/Program Protection 33 - OB_PP[33]
;//   <o1.2 >  Enable page erase/Program Protection 34 - OB_PP[34]
;//   <o1.3 >  Enable page erase/Program Protection 35 - OB_PP[35]
;//   <o1.4 >  Enable page erase/Program Protection 36 - OB_PP[36]
;//   <o1.5 >  Enable page erase/Program Protection 37 - OB_PP[37]
;//   <o1.6 >  Enable page erase/Program Protection 38 - OB_PP[38]
;//   <o1.7 >  Enable page erase/Program Protection 39 - OB_PP[39]
;//   <o1.8 >  Enable page erase/Program Protection 40 - OB_PP[40]
;//   <o1.9 >  Enable page erase/Program Protection 41 - OB_PP[41]
;//   <o1.10 > Enable page erase/Program Protection 42 - OB_PP[42]
;//   <o1.11 > Enable page erase/Program Protection 43 - OB_PP[43]
;//   <o1.12 > Enable page erase/Program Protection 44 - OB_PP[44]
;//   <o1.13 > Enable page erase/Program Protection 45 - OB_PP[45]
;//   <o1.14 > Enable page erase/Program Protection 46 - OB_PP[46]
;//   <o1.15 > Enable page erase/Program Protection 47 - OB_PP[47]
;//   <o1.16 > Enable page erase/Program Protection 48 - OB_PP[48]
;//   <o1.17 > Enable page erase/Program Protection 49 - OB_PP[49]
;//   <o1.18 > Enable page erase/Program Protection 50 - OB_PP[50]
;//   <o1.19 > Enable page erase/Program Protection 51 - OB_PP[51]
;//   <o1.20 > Enable page erase/Program Protection 52 - OB_PP[52]
;//   <o1.21 > Enable page erase/Program Protection 53 - OB_PP[53]
;//   <o1.22 > Enable page erase/Program Protection 54 - OB_PP[54]
;//   <o1.23 > Enable page erase/Program Protection 55 - OB_PP[55]
;//   <o1.24 > Enable page erase/Program Protection 56 - OB_PP[56]
;//   <o1.25 > Enable page erase/Program Protection 57 - OB_PP[57]
;//   <o1.26 > Enable page erase/Program Protection 58 - OB_PP[58]
;//   <o1.27 > Enable page erase/Program Protection 59 - OB_PP[59]
;//   <o1.28 > Enable page erase/Program Protection 60 - OB_PP[60]
;//   <o1.29 > Enable page erase/Program Protection 61 - OB_PP[61]
;//   <o1.30 > Enable page erase/Program Protection 62 - OB_PP[62]
;//   <o1.31 > Enable page erase/Program Protection 63 - OB_PP[63]
;// </h>
;// <h> -- Main Flash page erase/program protection (OB_PP2 bits)
;// <i> Enable page erase/program protection to prevent unwanted change of Flash contents.
;// <i> One bit for n pages. Check FMC chapter of User Manual for detailed.
;//   <o2.0 >  Enable page erase/Program Protection 64 - OB_PP[64]
;//   <o2.1 >  Enable page erase/Program Protection 65 - OB_PP[65]
;//   <o2.2 >  Enable page erase/Program Protection 66 - OB_PP[66]
;//   <o2.3 >  Enable page erase/Program Protection 67 - OB_PP[67]
;//   <o2.4 >  Enable page erase/Program Protection 68 - OB_PP[68]
;//   <o2.5 >  Enable page erase/Program Protection 69 - OB_PP[69]
;//   <o2.6 >  Enable page erase/Program Protection 70 - OB_PP[70]
;//   <o2.7 >  Enable page erase/Program Protection 71 - OB_PP[71]
;//   <o2.8 >  Enable page erase/Program Protection 72 - OB_PP[72]
;//   <o2.9 >  Enable page erase/Program Protection 73 - OB_PP[73]
;//   <o2.10 > Enable page erase/Program Protection 74 - OB_PP[74]
;//   <o2.11 > Enable page erase/Program Protection 75 - OB_PP[75]
;//   <o2.12 > Enable page erase/Program Protection 76 - OB_PP[76]
;//   <o2.13 > Enable page erase/Program Protection 77 - OB_PP[77]
;//   <o2.14 > Enable page erase/Program Protection 78 - OB_PP[78]
;//   <o2.15 > Enable page erase/Program Protection 79 - OB_PP[79]
;//   <o2.16 > Enable page erase/Program Protection 80 - OB_PP[80]
;//   <o2.17 > Enable page erase/Program Protection 81 - OB_PP[81]
;//   <o2.18 > Enable page erase/Program Protection 82 - OB_PP[82]
;//   <o2.19 > Enable page erase/Program Protection 83 - OB_PP[83]
;//   <o2.20 > Enable page erase/Program Protection 84 - OB_PP[84]
;//   <o2.21 > Enable page erase/Program Protection 85 - OB_PP[85]
;//   <o2.22 > Enable page erase/Program Protection 86 - OB_PP[86]
;//   <o2.23 > Enable page erase/Program Protection 87 - OB_PP[87]
;//   <o2.24 > Enable page erase/Program Protection 88 - OB_PP[88]
;//   <o2.25 > Enable page erase/Program Protection 89 - OB_PP[89]
;//   <o2.26 > Enable page erase/Program Protection 90 - OB_PP[90]
;//   <o2.27 > Enable page erase/Program Protection 91 - OB_PP[91]
;//   <o2.28 > Enable page erase/Program Protection 92 - OB_PP[92]
;//   <o2.29 > Enable page erase/Program Protection 93 - OB_PP[93]
;//   <o2.30 > Enable page erase/Program Protection 94 - OB_PP[94]
;//   <o2.31 > Enable page erase/Program Protection 95 - OB_PP[95]
;// </h>
;// <h> -- Main Flash page erase/program protection (OB_PP3 bits)
;// <i> Enable page erase/program protection to prevent unwanted change of Flash contents.
;// <i> One bit for n pages. Check FMC chapter of User Manual for detailed.
;//   <o3.0 >  Enable page erase/Program Protection 96  - OB_PP[96]
;//   <o3.1 >  Enable page erase/Program Protection 97  - OB_PP[97]
;//   <o3.2 >  Enable page erase/Program Protection 98  - OB_PP[98]
;//   <o3.3 >  Enable page erase/Program Protection 99  - OB_PP[99]
;//   <o3.4 >  Enable page erase/Program Protection 100 - OB_PP[100]
;//   <o3.5 >  Enable page erase/Program Protection 101 - OB_PP[101]
;//   <o3.6 >  Enable page erase/Program Protection 102 - OB_PP[102]
;//   <o3.7 >  Enable page erase/Program Protection 103 - OB_PP[103]
;//   <o3.8 >  Enable page erase/Program Protection 104 - OB_PP[104]
;//   <o3.9 >  Enable page erase/Program Protection 105 - OB_PP[105]
;//   <o3.10 > Enable page erase/Program Protection 106 - OB_PP[106]
;//   <o3.11 > Enable page erase/Program Protection 107 - OB_PP[107]
;//   <o3.12 > Enable page erase/Program Protection 108 - OB_PP[108]
;//   <o3.13 > Enable page erase/Program Protection 109 - OB_PP[109]
;//   <o3.14 > Enable page erase/Program Protection 110 - OB_PP[110]
;//   <o3.15 > Enable page erase/Program Protection 111 - OB_PP[111]
;//   <o3.16 > Enable page erase/Program Protection 112 - OB_PP[112]
;//   <o3.17 > Enable page erase/Program Protection 113 - OB_PP[113]
;//   <o3.18 > Enable page erase/Program Protection 114 - OB_PP[114]
;//   <o3.19 > Enable page erase/Program Protection 115 - OB_PP[115]
;//   <o3.20 > Enable page erase/Program Protection 116 - OB_PP[116]
;//   <o3.21 > Enable page erase/Program Protection 117 - OB_PP[117]
;//   <o3.22 > Enable page erase/Program Protection 118 - OB_PP[118]
;//   <o3.23 > Enable page erase/Program Protection 119 - OB_PP[119]
;//   <o3.24 > Enable page erase/Program Protection 120 - OB_PP[120]
;//   <o3.25 > Enable page erase/Program Protection 121 - OB_PP[121]
;//   <o3.26 > Enable page erase/Program Protection 122 - OB_PP[122]
;//   <o3.27 > Enable page erase/Program Protection 123 - OB_PP[123]
;//   <o3.28 > Enable page erase/Program Protection 124 - OB_PP[124]
;//   <o3.29 > Enable page erase/Program Protection 125 - OB_PP[125]
;//   <o3.30 > Enable page erase/Program Protection 126 - OB_PP[126]
;//   <o3.31 > Enable page erase/Program Protection 127 - OB_PP[127]
;// </h>

;// <o4.0> -- Enable security protection of Flash (OB_CP[0])
;//   <i> Enable security protection to prevent illegal Flash code/data access
;// <o4.1> -- Enable Option Byte erase/program protection (OB_CP[1])
;//   <i> Enable Option Byte erase/program protection to prevent unwanted change of Option Byte
;// <o0> -- Option Byte value: OB_PP0 (0x1FF00000)
;// <o1> -- Option Byte value: OB_PP1 (0x1FF00004)
;// <o2> -- Option Byte value: OB_PP2 (0x1FF00008)
;// <o3> -- Option Byte value: OB_PP3 (0x1FF0000C)
;// <o4> -- Option Byte value: OB_CP  (0x1FF00010)
;// <h> -- !!! Note: One OB_PP bit for setting n Pages. Check FMC chapter of User Manual for detailed.
;// </h>
;// <h> ------------------------------------------------------------------------------------------------------
;// </h>
OB_PP0              EQU     0x00000000
OB_PP1              EQU     0x00000000
OB_PP2              EQU     0x00000000
OB_PP3              EQU     0x00000000
OB_CP               EQU     0x00000000

;// <e0> Program Bootloader Options
;// <o1> Bootloader Waiting time (ms) <1500-14200:50>
;//  <i> Bootloader waiting time based on ms. Range 1500 ~ 14200 ms, Steps: 50)
;// <i> !!! Note: Only the devices below supported Bootloader waiting time options.
;// <i>           Supported Device List:
;// <i>             HT32F1755, HT32F1765
;// <i>             HT32F1653, HT32F1654, HT32F1655, HT32F1656
;// <i>             HT32F12345, HT32F12365, HT32F12366
;// <i>             HT32F52220, HT32F52230, HT32F52231, HT32F52241, HT32F52243, HT32F52253
;// <i>             HT32F52331, HT32F52341, HT32F52342, HT32F52352
;// <i>             HT32F50220, HT32F50230, HT32F50231, HT32F50241
;// <i>             HT32F5826
;// <i>             HT32F0008
BOOT_OPT            EQU     0
BOOTOPTV            EQU     1500
;// </e>

;// <e> Watchdog Timer Enable
;// <i> WDT will be enabled immediately when MCU is power on reset or system reset and can be disabled by firmware.
;// <i> The default timeout period of WDT is 8 second (Clock source = 32 KHz LSI, Prescaler = 1/64, 12-bit counter).
;// <i> !!! Note: The device below does not support Watchdog Timer Enable by Flash Option Bytes.
;// <i>           Not Supported Device List:
;// <i>             HT32F1755, HT32F1765
;// <i>             HT32F1653, HT32F1654, HT32F1655, HT32F1656
;// <i>             HT32F12345, HT32F12366
;// <i>             HT32F52220, HT32F52230, HT32F52231, HT32F52241, HT32F52243, HT32F52253
;// <i>             HT32F52331, HT32F52341, HT32F52342, HT32F52352
;// <i>             HT32F5826
;// <i> Address of OB_WDT:
;// <i>   0x1FF003F0: HT32F50220, HT32F50230, HT32F50231, HT32F50241, HT32F0008.
;// <i>   0x1FF0002C: Others except device in the Not Supported Device List and above 5 devices.
WDT_OPT             EQU     0
;// </e>

;// <e0> Program Writer Checksum
;//   <o1> Writer Checksum: Code
;//   <o2> Writer Checksum: Data
;//   <o3> Writer Checksum: Code + Option
WRITERCK_OPT        EQU     0
WRITERCK_CODE       EQU     0xFFFFFFFF
WRITERCK_DATA       EQU     0xFFFFFFFF
WRITERCK_CODEOP     EQU     0xFFFFFFFF
;// </e>


;/*---------------------------------------------------------------------------------------------------------*/
;/* DO NOT MODIFY                                                                                           */
;/*---------------------------------------------------------------------------------------------------------*/
HT32F1653_54_55_56  EQU     1
HT32F12365_66       EQU     2
HT32F12345          EQU     3
HT32F52220_30       EQU     1
HT32F52231_41       EQU     2
HT32F52331_41       EQU     3
HT32F52342_52       EQU     4
HT32F52243_53       EQU     5
HT32F0008           EQU     6
HT32F50220_30       EQU     7
HT32F50231_41       EQU     8

OPT_RES             EQU     0xFFFFFFFF

nOB_PP0             EQU     OB_PP0:EOR:0xFFFFFFFF
nOB_PP1             EQU     OB_PP1:EOR:0xFFFFFFFF
nOB_PP2             EQU     OB_PP2:EOR:0xFFFFFFFF
nOB_PP3             EQU     OB_PP3:EOR:0xFFFFFFFF
nOB_CP              EQU     OB_CP:EOR:0xFFFFFFFF

    IF OB_PP0 = 0 && OB_PP1 = 0 && OB_PP2 = 0 && OB_PP3 = 0 &&  OB_CP = 0
OPT_CK              EQU     0xFFFFFFFF
    ELSE
OPT_CK              EQU     (nOB_PP0 + nOB_PP1 + nOB_PP2 + nOB_PP3 + nOB_CP)
    ENDIF

    IF BOOT_OPT = 1
OPT_BOOT_WAIT       EQU     0xFFFFFF00:OR:(BOOTOPTV - 1500)/50
    ELSE
OPT_BOOT_WAIT       EQU     0xFFFFFFFF
    ENDIF

    IF WDT_OPT = 1
      IF (USE_HT32_CHIP=HT32F1653_54_55_56) || \
         (USE_HT32_CHIP=HT32F12345)         || \
         (USE_HT32_CHIP=HT32F12365_66)      || \
         (USE_HT32_CHIP=HT32F52220_30)      || \
         (USE_HT32_CHIP=HT32F52231_41)      || \
         (USE_HT32_CHIP=HT32F52331_41)      || \
         (USE_HT32_CHIP=HT32F52342_52)      || \
         (USE_HT32_CHIP=HT32F52243_53)
          The_selected_MCU_(by_USE_HT32_CHIP)_of_this_project_does_not_support_Watchdog_Timer_Enable_(OB_WDT=1)
      ENDIF
    ENDIF

    IF WDT_OPT = 1
OB_WDT              EQU     0xFFFF7A92
    ELSE
OB_WDT              EQU     0xFFFFFFFF
    ENDIF

    IF (USE_HT32_CHIP=HT32F1653_54_55_56) || \
       (USE_HT32_CHIP=HT32F12345)         || \
       (USE_HT32_CHIP=HT32F12365_66)      || \
       (USE_HT32_CHIP=HT32F52220_30)      || \
       (USE_HT32_CHIP=HT32F52231_41)      || \
       (USE_HT32_CHIP=HT32F52331_41)      || \
       (USE_HT32_CHIP=HT32F52342_52)      || \
       (USE_HT32_CHIP=HT32F52243_53)      || \
       (USE_HT32_CHIP=HT32F50220_30)      || \
       (USE_HT32_CHIP=HT32F50231_41)      || \
       (USE_HT32_CHIP=HT32F0008)
OPT_2C              EQU     OPT_BOOT_WAIT
    ELSE
      IF BOOT_OPT = 1
        The_selected_MCU_(by_USE_HT32_CHIP)_of_this_project_does_not_support_Bootloader_Waiting_time_Option_(BOOT_OPT=1)
      ENDIF
OPT_2C              EQU     OB_WDT
    ENDIF

    IF WRITERCK_OPT = 1
OPTCK_CODE          EQU     WRITERCK_CODE
OPTCK_DATA          EQU     WRITERCK_DATA
OPTCK_CODEOP        EQU     WRITERCK_CODEOP
    ELSE
OPTCK_CODE          EQU     0xFFFFFFFF
OPTCK_DATA          EQU     0xFFFFFFFF
OPTCK_CODEOP        EQU     0xFFFFFFFF
    ENDIF

    IF FLASH_OPT = 1
        AREA    |.ARM.__AT_0x1FF00000|, CODE, READONLY
        DCD   nOB_PP0       ; 0x1FF00000
        DCD   nOB_PP1       ; 0x1FF00004
        DCD   nOB_PP2       ; 0x1FF00008
        DCD   nOB_PP3       ; 0x1FF0000C
        DCD   nOB_CP        ; 0x1FF00010
        DCD   OPT_RES       ; 0x1FF00014
        DCD   OPT_RES       ; 0x1FF00018
        DCD   OPT_RES       ; 0x1FF0001C
        DCD   OPT_CK        ; 0x1FF00020
        DCD   OPT_RES       ; 0x1FF00024
        DCD   OPT_RES       ; 0x1FF00028
        DCD   OPT_2C        ; 0x1FF0002C
        DCD   OPTCK_CODE    ; 0x1FF00030
        DCD   OPTCK_DATA    ; 0x1FF00034
        DCD   OPTCK_CODEOP  ; 0x1FF00038

      IF WDT_OPT = 1
      IF (USE_HT32_CHIP=HT32F50220_30) || \
         (USE_HT32_CHIP=HT32F50231_41) || \
         (USE_HT32_CHIP=HT32F0008)
        AREA    |.ARM.__AT_0x1FF003F0|, CODE, READONLY
        DCD   OB_WDT        ; 0x1FF003F0
      ENDIF
      ENDIF

    ENDIF

;// <e> Program user's Flash data into Option Byte
;// <i> Address range: from 0x1FF00050 to 0x1FF003EF/0x1FF002FF (Max 928/432 Bytes)
FLASH_DATA      EQU     0
;// </e>
    IF FLASH_DATA = 1
        AREA    |.ARM.__AT_0x1FF00050|, CODE, READONLY
        INCBIN  userdata.dat
    ENDIF

                END
