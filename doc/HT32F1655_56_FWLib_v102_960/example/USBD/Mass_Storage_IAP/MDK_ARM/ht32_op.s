;/****************************************************************************                              */
;/* ht32f_op.s: HT32 Series Flash Option Bytes Block                                                        */
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

PP0     EQU         0x00000000
PP1     EQU         0x00000000
PP2     EQU         0x00000000
PP3     EQU         0x00000000
CP      EQU         0x00000000

nPP0    EQU         PP0:EOR:0xFFFFFFFF
nPP1    EQU         PP1:EOR:0xFFFFFFFF
nPP2    EQU         PP2:EOR:0xFFFFFFFF
nPP3    EQU         PP3:EOR:0xFFFFFFFF
nCP     EQU         CP:EOR:0xFFFFFFFF

    IF nPP0 = 0xFFFFFFFF && nPP1 = 0xFFFFFFFF && nPP2 = 0xFFFFFFFF && nPP3 = 0xFFFFFFFF &&  nCP = 0xFFFFFFFF
CK      EQU         0xFFFFFFFF
    ELSE
CK      EQU         (nPP0 + nPP1 + nPP2 + nPP3 + nCP)
    ENDIF
RES     EQU         0xFFFFFFFF


                IF      FLASH_OPT <> 0
                AREA    |.ARM.__AT_0x1FF00000|, CODE, READONLY
                DCD   nPP0          ; 0x1FF00000
                DCD   nPP1          ; 0x1FF00004
                DCD   nPP2          ; 0x1FF00008
                DCD   nPP3          ; 0x1FF0000C
                DCD   nCP           ; 0x1FF00010
                DCD   RES           ; 0x1FF00014
                DCD   RES           ; 0x1FF00018
                DCD   RES           ; 0x1FF0001C
                DCD   CK            ; 0x1FF00020
                DCD   RES           ; 0x1FF00024
                DCD   RES           ; 0x1FF00028
                ENDIF

;// <e> Program Bootloader Options
BOOT_OPT      EQU     0
;//   <o> Bootloader Waiting time (mS) <1500-14200:50>
;//    <i> Bootloader Waiting time in mSecond
BOOTOPTV EQU        1500

    IF BOOT_OPT <> 0
BOOTOPT EQU         0xFFFFFF00:OR:(BOOTOPTV - 1500)/50
    ELSE
BOOTOPT EQU         0xFFFFFFFF
    ENDIF

                IF      BOOT_OPT <> 0
                AREA    |.ARM.__AT_0x1FF0002C|, CODE, READONLY
                DCD   BOOTOPT       ; 0x1FF0002C
                ENDIF

;// </e>

;// <e> Program user's Flash data into Option Byte
;// <i> Address range: from 0x1FF00050 to 0x1FF003FF (Max 944 Bytes)
FLASH_DATA      EQU     0
;// </e>
                IF      FLASH_DATA <> 0
                AREA    |.ARM.__AT_0x1FF00050|, CODE, READONLY
                INCBIN  userdata.dat
                ENDIF

                END
