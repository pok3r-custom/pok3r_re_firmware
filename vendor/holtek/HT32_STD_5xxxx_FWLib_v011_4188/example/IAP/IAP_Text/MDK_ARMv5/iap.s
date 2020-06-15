;********************************************************************************
;* @file        iap.s
;* @version     $Rev:: 3905         $
;* @date        $Date:: 2019-05-22 #$
;* @brief       Include IAP image
;*
;* @note        Copyright (C) Holtek Semiconductor Inc. All rights reserved.
;*
;* <h2><center>&copy; COPYRIGHT Holtek</center></h2>
;*
;********************************************************************************
;*----------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;********************************************************************************

HT32F52220_30       EQU     1
HT32F52231_41       EQU     2
HT32F52331_41       EQU     3
HT32F52342_52       EQU     4
HT32F52243_53       EQU     5
HT32F0008           EQU     6
HT32F50220_30       EQU     7
HT32F50231_41       EQU     8
HT32F52344_54       EQU     9
HT32F0006           EQU     10
HT32F52357_67       EQU     11
HT32F57331_41       EQU     13
HT32F57342_52       EQU     14

;// <q> Include IAP image into user's application
INCLUDE_IAP      EQU     1

        AREA    IAP, DATA, READONLY

        IF (USE_HT32_CHIP=HT32F52220_30)
          INCBIN  HT32\52230\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52231_41)
          INCBIN  HT32\52241\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52331_41)
          INCBIN  HT32\52341\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52342_52)
          INCBIN  HT32\52352\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52344_54)
          INCBIN  HT32\52354\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52243_53)
          INCBIN  HT32\52253\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F0008)
          INCBIN  HT32\0008\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F50220_30)
          INCBIN  HT32\50230\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F50231_41)
          INCBIN  HT32\50241\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F0006)
          INCBIN  HT32\0006\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F57331_41)
          INCBIN  HT32\57341\IAP\Obj\IAP.axf.bin
         ENDIF

        IF (USE_HT32_CHIP=HT32F57342_52)
          INCBIN  HT32\57352\IAP\Obj\IAP.axf.bin
        ENDIF

        IF (USE_HT32_CHIP=HT32F52357_67)
          INCBIN  HT32\52367\IAP\Obj\IAP.axf.bin
        ENDIF

        END
