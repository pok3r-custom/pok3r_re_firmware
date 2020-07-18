/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/sd_disk.h
 * @version $Rev:: 330          $
 * @date    $Date:: 2016-04-14 #$
 * @brief   The header file of SD Disk.
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
#ifndef __SD_DISK_H
#define __SD_DISK_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "usb_bulk_only_transport.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Mass_Storage
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define SDDISK_NUM             (1)

#define SDDISK0_ID             (0)
#define SDDISK0_BlockSize      (512)
//#define SDDISK1_ID             (1)
//#define SDDISK1_BlockSize      (512)

#define SDISK_DEBUG            (0)

/* Exported functions --------------------------------------------------------------------------------------*/
u32 SDDISK_Read(u32 uId, u8 **pBuffer, u32 uAddress, u32 uLength);
u32 SDDISK_Write(u32 uId, u8 *pBuffer, u32 uAddress, u32 uLength);
u32 SDDISK_GetStatus(u32 id, BOT_MediaSize_Typedef *pSizeInfo);
void SDDISK_Unmount(u32 uId);

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __SD_DISK_H --------------------------------------------------------------------------------------*/
