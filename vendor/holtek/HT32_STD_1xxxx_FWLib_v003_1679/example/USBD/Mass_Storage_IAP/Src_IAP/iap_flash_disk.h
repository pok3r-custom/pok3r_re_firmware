/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage_IAP/Src_IAP/iap_flash_disk.h
 * @version $Rev:: 553          $
 * @date    $Date:: 2017-07-18 #$
 * @brief   The header file of Flash Disk.
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
#ifndef __FLASH_DISK_H
#define __FLASH_DISK_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "iap_usb_bulk_only_transport.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USBD_Mass_Storage_IAP USBD Mass Storage IAP
  * @{
  */

/** @addtogroup Mass_Storage_IAP IAP
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define FAT_TABLE_SIZE             (512 * 4)
#define IAP_CMD_FILENUM            (4)

#define FLASH_DISK0_ID             (0)
#define FLASH_DISK0_MemorySize     (FAT_TABLE_SIZE + 512 * IAP_CMD_FILENUM + 1024 * (HTCFG_FLASH_SIZE - 8) + 1024)
#define FLASH_DISK0_BlockSize      (512)
#define FLASH_DISK0_BlockCount     (FLASH_DISK0_MemorySize / FLASH_DISK0_BlockSize)

/* Exported types ------------------------------------------------------------------------------------------*/
typedef enum
{
  FLASH_DISK_VL_MAIN     = 1,
  FLASH_DISK_VL_OPTION   = 2,
  FLASH_DISK_VL_READ     = 3,
  FLASH_DISK_VL_ERROR    = 4,
} FLASH_DISK_VolumeLabel_Enum;

/* Exported functions --------------------------------------------------------------------------------------*/
u32 FLASH_DISK_Init(u32 uId, BOT_MediaSize_Typedef *pSizeInfo);
u32 FLASH_DISK_Read(u32 uId, u8 **pBuffer, u32 uAddress, u32 uLength);
u32 FLASH_DISK_Write(u32 uId, u8 *pBuffer, u32 uAddress, u32 uLength);
u32 FLASH_DISK_GetStatus(u32 uId, BOT_MediaSize_Typedef *pSizeInfo);
u8 FLASH_DISK_GetCommand(void);
void FLASH_DISK_SetVolumeLabel(FLASH_DISK_VolumeLabel_Enum VolumeLabelID);
void FLASH_DISK_SetResult(void);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __FLASH_DISK_H -----------------------------------------------------------------------------------*/
