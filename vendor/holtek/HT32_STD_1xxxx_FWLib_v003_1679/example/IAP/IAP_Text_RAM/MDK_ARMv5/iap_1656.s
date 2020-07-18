;********************************************************************************
;* @file        iap_1656.s
;* @version     $Rev:: 763          $
;* @date        $Date:: 2017-08-29 #$
;* @brief       Include IAP image
;*
;* @note        Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved.
;*
;* <h2><center>&copy; COPYRIGHT 2014 Holtek</center></h2>
;*
;********************************************************************************
;*----------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;********************************************************************************

;// <q> Include IAP image into user's application
INCLUDE_IAP      EQU     1

    AREA    IAP, DATA, READONLY

    IF INCLUDE_IAP <> 0
      INCBIN HT32\1656\IAP\Obj\IAP.axf.bin
    ENDIF

    END
