/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/ram_disk.h
 * @version $Rev:: 2825         $
 * @date    $Date:: 2018-05-29 #$
 * @brief   The header file of RAM Disk.
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
#ifndef __RAM_DISK_H
#define __RAM_DISK_H

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
#define RAMDISK_NUM             (2)

#define RAMDISK0_ID             (0)
#define RAMDISK0_MemorySize     (512 * 3 + 1024 * 3)    /* FAT Table + Memory Size                          */
#define RAMDISK0_BlockSize      (512)
#define RAMDISK0_BlockCount     (RAMDISK0_MemorySize / RAMDISK0_BlockSize)
#define RAMDISK0_AddressMode    (BOT_ADDR_MODE_BYTE)

#define RAMDISK1_ID             (1)
#define RAMDISK1_MemorySize     (512 * 3 + 1024 * 3)    /* FAT Table + Memory Size                          */
#define RAMDISK1_BlockSize      (512)
#define RAMDISK1_BlockCount     (RAMDISK1_MemorySize / RAMDISK1_BlockSize)
#define RAMDISK1_AddressMode    (BOT_ADDR_MODE_BYTE)

/* Exported functions --------------------------------------------------------------------------------------*/
u32 RAMDISK_Read(u32 uId, u8 **pBuffer, u32 uAddress, u32 uLength);
u32 RAMDISK_Write(u32 uId, u8 *pBuffer, u32 uAddress, u32 uLength);
u32 RAMDISK_GetStatus(u32 uId, BOT_MediaSize_Typedef *pSizeInfo);
void RAMDISK_Unmount(u32 uId);

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __RAM_DISK_H -------------------------------------------------------------------------------------*/
