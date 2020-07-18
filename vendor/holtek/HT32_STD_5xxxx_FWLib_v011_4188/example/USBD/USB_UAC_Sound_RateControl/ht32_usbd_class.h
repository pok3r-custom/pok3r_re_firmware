/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound_RateControl/ht32_usbd_class.h
 * @version $Rev:: 3331         $
 * @date    $Date:: 2018-12-25 #$
 * @brief   The header file of USB Device Class.
 *************************************************************************************************************
 * @attention
 *
 * Firmware Disclaimer Information
 *
 * 1. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, which is supplied by Holtek Semiconductor Inc., (hereinafter referred to as "HOLTEK") is the
 *    proprietary and confidential intellectual property of HOLTEK, and is protected by copyright law and
 *    other intellectual property laws.
 *
 * 2. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, is confidential information belonging to HOLTEK, and must not be disclosed to any third parties
 *    other than HOLTEK and the customer.
 *
 * 3. The program technical documentation, including the code, is provided "as is" and for customer reference
 *    only. After delivery by HOLTEK, the customer shall use the program technical documentation, including
 *    the code, at their own risk. HOLTEK disclaims any expressed, implied or statutory warranties, including
 *    the warranties of merchantability, satisfactory quality and fitness for a particular purpose.
 *
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32_USBD_CLASS_H
#define __HT32_USBD_CLASS_H

/* Includes ------------------------------------------------------------------------------------------------*/

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USB_UAC_Sound_RateControl
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/

/* For ht32_usbd_descriptor.c                                                                               */

/* Audio related definition                                                                                 */
#define DESC_LEN_0C_UAC_IN_TERML          ((u8)(12))
#define DESC_LEN_09_UAC_OUT_TERML         ((u8)(9))
#define DESC_LEN_07_UAC_STREAMING         ((u8)(7))
#define DESC_LEN_09_UAC_STD_EPT           ((u8)(9))
#define DESC_LEN_07_UAC_STREAM_EPT        ((u8)(7))

#define DESC_TYPE_20_CS_UNDEFINED         (0x20)
#define DESC_TYPE_21_CS_DEVICE            (0x21)
#define DESC_TYPE_22_CS_CONFIGURATION     (0x22)
#define DESC_TYPE_23_CS_STRING            (0x23)
#define DESC_TYPE_24_CS_INTERFACE         (0x24)
#define DESC_TYPE_25_CS_EPT               (0x25)

#define DESC_SUBTYPE_01_HEADER            (0x01)
#define DESC_SUBTYPE_02_IN_TERML          (0x02)
#define DESC_SUBTYPE_03_OUT_TERML         (0x03)
#define DESC_SUBTYPE_06_FEATURE_UNIT      (0x06)

#define DESC_SUBTYPE_00_AS_UNDEFINED      (0x00)
#define DESC_SUBTYPE_01_AS_GERERAL        (0x01)
#define DESC_SUBTYPE_02_FORMAT_TYPE       (0x02)
#define DESC_SUBTYPE_03_FORMAT_SPEC       (0x03)

#define DESC_SUBTYPE_01_EP_GERERAL        (0x01)

#define UAC_SUBCLASS_00_UNDEFINED         (0x00)
#define UAC_SUBCLASS_01_AUDIOCTRL         (0x01)
#define UAC_SUBCLASS_02_AUDIOSTREAM       (0x02)
#define UAC_SUBCLASS_03_MIDISTREAM        (0x03)

#define UAC_PROTOCOL_00_UNDEFINED         (0x00)

/* Audio Class-specific Request Codes */
#define CLASS_REQ_00_CODE_UNDEFINED   (0x00)
#define CLASS_REQ_01_SET_CUR          (0x01)
#define CLASS_REQ_81_GET_CUR          (0x81)
#define CLASS_REQ_02_SET_MIN          (0x02)
#define CLASS_REQ_82_GET_MIN          (0x82)
#define CLASS_REQ_03_SET_MAX          (0x03)
#define CLASS_REQ_83_GET_MAX          (0x83)
#define CLASS_REQ_04_SET_RES          (0x04)
#define CLASS_REQ_84_GET_RES          (0x84)
#define CLASS_REQ_85_SET_MEM          (0x05)
#define CLASS_REQ_85_GET_MEM          (0x85)
#define CLASS_REQ_FF_GET_STAT         (0xFF)


#define AC_INTERFACE_NUM              (0x00)
#define AS_INTERFACE_NUM              (0x01)

#define CONTROL_ID  (0x00)
#define IT_ID       (0x01)
#define FU_ID       (0x02)
#define OT_ID       (0x03)

//Feature Unit Control Selectors
#define MUTE_CONTROL    (0x01)
#define VOLUME_CONTROL  (0x02)
#define BASS_CONTROL    (0x03)

/* Exported types ------------------------------------------------------------------------------------------*/
/* Exported variables --------------------------------------------------------------------------------------*/
extern vu8 UAC_bMuteControl;
/* Exported macro ------------------------------------------------------------------------------------------*/
/* Exported functions --------------------------------------------------------------------------------------*/
void USBDClass_Init(USBDCore_Class_TypeDef *pClass);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __HT32_USBD_CLASS_H ------------------------------------------------------------------------------*/
