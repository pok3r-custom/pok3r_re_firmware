/*********************************************************************************************************//**
 * @file    Src_MassStorage/usb_scsi_block_command.h
 * @version $Rev:: 3382         $
 * @date    $Date:: 2019-02-12 #$
 * @brief   The header file of SCSI Block Command (SBC-3 & SPC-4).
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
#ifndef __USB_SCSI_BLOCK_COMMAND_H
#define __USB_SCSI_BLOCK_COMMAND_H

/* Includes ------------------------------------------------------------------------------------------------*/

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup HID_Keyboard_Mass_Storage
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------*/
/* Const of SCSI_SenseData_Typedef                                                                          */
/*----------------------------------------------------------------------------------------------------------*/
/* Sense Key                                                                                                */
#define SK_NO_SENSE                               (0x00)
#define SK_RECOVERED_ERROR                        (0x01)
#define SK_NOT_READY                              (0x02)
#define SK_MEDIUM_ERROR                           (0x03)
#define SK_HARDWARE_ERROR                         (0x04)
#define SK_ILLEGAL_REQUEST                        (0x05)
#define SK_UNIT_ATTENTION                         (0x06)
#define SK_DATA_PROTECT                           (0x07)
#define SK_BLANK_CHECK                            (0x08)
#define SK_VENDOR_SPECIFIC                        (0x09)
#define SK_COPY_ABORTED                           (0x0A)
#define SK_ABORTED_COMMAND                        (0x0B)
#define SK_VOLUME_OVERFLOW                        (0x0D)
#define SK_MISCOMPARE                             (0x0E)
/* Additional Sense Code (ASC)                                                                              */
#define ASC_UNRECOVERED_READ_ERROR                (0x11)
#define ASC_PARAMETER_LIST_LENGTH_ERROR           (0x1A)
#define ASC_INVALID_COMMAND                       (0x20)
#define ASC_ADDRESS_OUT_OF_RANGE                  (0x21)
#define ASC_INVALID_FIELED_IN_COMMAND             (0x24)
#define ASC_INVALID_FIELD_IN_PARAMETER_LIST       (0x26)
#define ASC_WRITE_PROTECTED                       (0x27)
#define ASC_MEDIUM_HAVE_CHANGED                   (0x28)
#define ASC_MEDIUM_NOT_PRESENT                    (0x3A)

/* Exported functions --------------------------------------------------------------------------------------*/
void SBC_Init(BOT_Media_TypeDef *pMedia, u32 uLun);
void SBC_CMDHandler(BOT_Media_TypeDef *pMedia, u8 *pCB);
void SBC_DataIN(BOT_Media_TypeDef *pMedia, u8 *pCB);
void SBC_DataOUT(BOT_Media_TypeDef *pMedia, u8 *pCB);
void SBC_UpdateSenseData(BOT_Media_TypeDef *pMedia, u8 uSenseKey, u8 uAdditionalSenseCode);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __USB_SCSI_BLOCK_COMMAND_H -----------------------------------------------------------------------*/
