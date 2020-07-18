/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/sd_disk.c
 * @version $Rev:: 2825         $
 * @date    $Date:: 2018-05-29 #$
 * @brief   The SD Disk related function.
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "sd_disk.h"
#include "spi_sd.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Mass_Storage
  * @{
  */


#if (BOT_SD_DISK0 == 1)
/* Settings ------------------------------------------------------------------------------------------------*/
#define SDISK_READ_BUFFER      (1024 * 4)

/* Private types -------------------------------------------------------------------------------------------*/
typedef enum
{
  SDDISK_IDLE  = 0,
  SDDISK_READ  = 1,
  SDDISK_WRITE = 2,
} SDDISK_Status_Enum;

/* Private constants ---------------------------------------------------------------------------------------*/
#define CACHE_CNT  (SDISK_READ_BUFFER / SDDISK0_BlockSize)

/* Private macro -------------------------------------------------------------------------------------------*/
#if (SDISK_DEBUG == 1)
#define DBG   printf
#else
#define DBG(...)
#endif

/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 static u8 guReadBuffer[SDISK_READ_BUFFER];
__ALIGN4 static u8 guWriteBuffer[SDDISK0_BlockSize];
static u32 guReadBufferOffset;
static u32 guWriteBufferOffset;
static SDDISK_Status_Enum gDiskWriteStatus = SDDISK_IDLE;

static u32 uCachePage = 0xFFFFFFFF;
static u32 uCurrentBlock = 0xFFFFFFFF;

u32 bSDDiskUnload = FALSE;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Read from SD Disk memory.
  * @param  uId: SD Disk ID
  * @param  pBuffer: Pointer of data buffer
  * @param  uBlockAddress: Block Address for read operation
  * @param  uLength: Length for read operation
  * @retval uResult: TRUE or FALSE
  ***********************************************************************************************************/
u32 SDDISK_Read(u32 uId, u8 **pBuffer, u32 uBlockAddress, u32 uLength)
{
  u32 uResult = TRUE;

  if (uId == SDDISK0_ID)
  {
    if ((uBlockAddress / CACHE_CNT != uCachePage / CACHE_CNT) && (uCachePage != uBlockAddress))
    {
      uCachePage = uBlockAddress;
      SD_ReadMultipleBlock(guReadBuffer, uBlockAddress, SDISK_READ_BUFFER);
    }
    if ((uCurrentBlock != uBlockAddress) || ((guReadBufferOffset % SDDISK0_BlockSize) == 0))
    {
      uCurrentBlock = uBlockAddress;
      guReadBufferOffset = (uBlockAddress - uCachePage) * SDDISK0_BlockSize;
    }
    *pBuffer = &(guReadBuffer[guReadBufferOffset]);
    guReadBufferOffset += BOT_MAX_PACKET_SIZE;
  }
  else
  {
    uResult = FALSE;
  }
  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Write to SD Disk memory.
  * @param  uId: SD Disk ID
  * @param  pBuffer: Pointer of data buffer
  * @param  uBlockAddress: Block Address for write operation
  * @param  uLength: Length for write operation
  * @retval uResult: TRUE or FALSE
  ***********************************************************************************************************/
u32 SDDISK_Write(u32 uId, u8 *pBuffer, u32 uBlockAddress, u32 uLength)
{
  u32 i;
  u32 uResult = TRUE;

  if (uId == SDDISK0_ID)
  {
    uResult = TRUE;
    if (gDiskWriteStatus == SDDISK_IDLE)
    {
      gDiskWriteStatus = SDDISK_WRITE;
      guWriteBufferOffset = 0;
    }
    for (i = 0; i < uLength; i++)
    {
      guWriteBuffer[guWriteBufferOffset + i] = *(pBuffer + i);
    }
    guWriteBufferOffset += uLength;
    if (guWriteBufferOffset == SDDISK0_BlockSize)
    {
      gDiskWriteStatus = SDDISK_IDLE;
      SD_WriteBlock(guWriteBuffer, uBlockAddress, SDDISK0_BlockSize);
    }
  }
  else
  {
    uResult = FALSE;
  }

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Get SD Disk Status.
  * @param  uId: SD Disk ID
  * @param  pSizeInfo: Pointer of media size information
  * @retval uResult: TRUE means disk ready for access. FALSE for disk not ready
  ***********************************************************************************************************/
u32 SDDISK_GetStatus(u32 uId, BOT_MediaSize_Typedef *pSizeInfo)
{
  u32 uResult = TRUE;
  u32 uSizeMul;
  SD_CSD_TypeDef SDCSD;

  if (bSDDiskUnload)
  {
    return FALSE;
  }

  if (SD_Init() == SD_RESPONSE_ERR)
  {
    uResult = FALSE;
  }
  else
  {
    if (SD_GetCSDRegister(&SDCSD) != SD_RESPONSE_NOERR)
    {
      uResult = FALSE;
    }
    else
    {
      pSizeInfo->uAddressMode = BOT_ADDR_MODE_BLOCK;

      #if (SDHC_SUPPORT == 1)
      if (uSD_IsSDHC == TRUE)
      {
        pSizeInfo->uBlockSize = SDDISK0_BlockSize;
        pSizeInfo->uBlockCount = (SDCSD.DeviceSize + 1) * 512 * 2;
      }
      else
      #endif
      {
        pSizeInfo->uBlockSize = SDDISK0_BlockSize;
        uSizeMul = (1 << (SDCSD.DeviceSizeMul + 2)) * ((1 << SDCSD.RdBlockLen) / SDDISK0_BlockSize);
        pSizeInfo->uBlockCount = (SDCSD.DeviceSize + 1) * uSizeMul;
      }
    }
  }

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Unmount SD Disk.
  * @param  uId: RAM Disk ID
  ***********************************************************************************************************/
void SDDISK_Unmount(u32 uId)
{
  bSDDiskUnload = TRUE;
}
#endif

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
