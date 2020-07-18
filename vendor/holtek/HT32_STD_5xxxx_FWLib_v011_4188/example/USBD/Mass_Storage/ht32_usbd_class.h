/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/ht32_usbd_class.h
 * @version $Rev:: 330          $
 * @date    $Date:: 2016-04-14 #$
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

/** @addtogroup Mass_Storage
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/

/* For ht32_usbd_descriptor.c                                                                               */
#define CLASS_INF_CLASS                   (DESC_CLASS_08_MASS_STORAGE)
#define CLASS_INF_SUBCLASS                (MASS_SUBCLASS_06_SCSI_TRANS)
#define CLASS_INF_PTCO                    (MASS_PROTOCOL_BBB)

#define MASS_SUBCLASS_06_SCSI_TRANS       (0x06)

#define MASS_PROTOCOL_BBB                 (0x50)


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
