/*********************************************************************************************************//**
 * @file    USBD/HID_Keyboard_Virtual_COM/ht32_usbd_class.h
 * @version $Rev:: 2873         $
 * @date    $Date:: 2018-06-29 #$
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

/** @addtogroup HID_Keyboard_Virtual_COM
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/

/* For ht32_usbd_descriptor.c                                                                               */
#define CLASS_INF_CLASS                   (DESC_CLASS_03_HID)
#define CLASS_INF_SUBCLASS                (HID_SUBCLASS_00_NONE)
#define CLASS_INF_PTCO                    (HID_PROTOCOL_00_NONE)

/* HID related definition                                                                                   */
#define DESC_LEN_HID                      ((u32)(9))
#define DESC_LEN_RPOT                     ((u16)(63))

#define DESC_TYPE_21_HID                  (0x21)
#define DESC_TYPE_22_RPOT                 (0x22)
#define DESC_TYPE_23_PHY                  (0x23)

#define HID_SUBCLASS_00_NONE              (0x00)
#define HID_SUBCLASS_01_BOOT              (0x01)

#define HID_PROTOCOL_00_NONE              (0x00)
#define HID_PROTOCOL_01_KEYBOARD          (0x01)
#define HID_PROTOCOL_02_MOUSE             (0x02)


#define HID_KEY_COUNT       (3)
#define HID_KEY_NUMLOCK     (0)
#define HID_KEY_CAPSLOCK    (1)
#define HID_KEY_SCROLLLOCK  (2)

/* For ht32_usbd_descriptor.c                                                                               */
#define COMMUNICATION_INF_CLASS           (DESC_CLASS_02_CDC_CTRL)
#define COMMUNICATION_INF_SUBCLASS        (CDC_SUBCLASS_ABS)
#define COMMUNICATION_INF_PTCO            (CDC_PROTOCOL_AT)

#define DATA_INF_CLASS                    (DESC_CLASS_0A_CDC_DATA)
#define DATA_INF_SUBCLASS                 (CDC_SUBCLASS_NULL)
#define DATA_INF_PTCO                     (CDC_PROTOCOL_NULL)

/* CDC related definition                                                                                   */
#define CDC_HEADER_LEN                    (0x05)
#define CDC_ABSTRACT_LEN                  (0x04)
#define CDC_UNION_LEN                     (0x05)
#define CDC_CALL_LEN                      (0x05)

#define CDC_TYPE_24_INF                   (0x24)

#define CDC_SUBTYPE_HEADER                (0x00)
#define CDC_SUBTYPE_CALL                  (0x01)
#define CDC_SUBTYPE_ABSTRACT              (0x02)
#define CDC_SUBTYPE_UNION                 (0x06)

#define CDC_SUBCLASS_NULL                 (0x00)
#define CDC_SUBCLASS_ABS                  (0x02)

#define CDC_PROTOCOL_NULL                 (0x00)
#define CDC_PROTOCOL_AT                   (0x01)

/* Exported types ------------------------------------------------------------------------------------------*/
typedef struct _VCP_LINE_CODING
{
  u32 dwDTERate;      //Bit rate;
  u8  bCharFormat;    //Stop bits:
                      //0 = 1   Stop bit
                      //1 = 1.5 Stop bit
                      //2 = 2   Stop bit
  u8  bParityType;    //parity:
                      //0 = None
                      //1 = Odd
                      //2 = Even
                      //3 = Mark
                      //4 = Space
  u8  bDataBits;      //Number of data bits (7,8,9)
}USBDClass_VCP_LINE_CODING;

/* Exported functions --------------------------------------------------------------------------------------*/
void USBDClass_Init(USBDCore_Class_TypeDef *pClass);
s32 USBDClass_CDC_Tx(u32 *pFrom, u32 len);


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
