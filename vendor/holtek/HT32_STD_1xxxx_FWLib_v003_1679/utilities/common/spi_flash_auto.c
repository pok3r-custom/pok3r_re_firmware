/*********************************************************************************************************//**
 * @file    spi_flash_auto.c
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The SPI Flash Driver with auto detection function.
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
#include "spi_flash_auto.h"
#include "spi_flash_common.h"
#include "spi_flash_common.c"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup SPI_FLASH_AUTO SPI_FLASH_AUTO
  * @brief The SPI Flash Driver with auto detection function.
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Private_Variable SPI_FLASH_AUTO private variables
  * @{
  */
static const ReadID_TypeDef SPI_Flash_ReadID[1] =
{
  SPI_FLASH_ReadJEDECID_0,
};

#ifdef SPI_FLASH_CACHE
static u32 uCachePage;
__ALIGN4 static u8 uCacheBuffer[4096];
static u32 uIsCachePageErased;
static u8 uIsCachePageUpdate;
#endif
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Initializes peripherals used by the SPI flash driver.
  * @retval None
  ***********************************************************************************************************/
u32 SPI_FLASH_Init(void)
{
  s32 i, j;
  u32 uFlashID;

  SPI_InitTypeDef  SPI_InitStructure;

  /*  Enable AFIO & SPI SEL pin port & SPI clock                                                            */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  FLASH_SPI_SEL_CLK(CKCUClock) = 1;
  FLASH_SPI_CLK(CKCUClock)     = 1;
  CKCUClock.Bit.AFIO           = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /*  Configure SPI SEL pin                                                                                 */
  GPIO_SetOutBits(GPIO_PORT[FLASH_SPI_SEL_GPIO_ID], FLASH_SPI_SEL_GPIO_PIN);
  GPIO_DirectionConfig(GPIO_PORT[FLASH_SPI_SEL_GPIO_ID], FLASH_SPI_SEL_GPIO_PIN, GPIO_DIR_OUT);

  /*  Configure SPI SCK pin, SPI MISO pin, SPI MOSI pin                                                     */
  HT32F_DVB_GPxConfig(FLASH_SPI_SCK_GPIO_ID, FLASH_SPI_SCK_AFIO_PIN, FLASH_SPI_SCK_AFIO_MODE);
  HT32F_DVB_GPxConfig(FLASH_SPI_MISO_GPIO_ID, FLASH_SPI_MISO_AFIO_PIN, FLASH_SPI_MISO_AFIO_MODE);
  HT32F_DVB_GPxConfig(FLASH_SPI_MOSI_GPIO_ID, FLASH_SPI_MOSI_AFIO_PIN, FLASH_SPI_MOSI_AFIO_MODE);

  /*  SPI Configuration                                                                                     */
  SPI_InitStructure.SPI_Mode = SPI_MASTER;
  SPI_InitStructure.SPI_FIFO = SPI_FIFO_DISABLE;
  SPI_InitStructure.SPI_DataLength = SPI_DATALENGTH_8;
  SPI_InitStructure.SPI_SELMode = SPI_SEL_SOFTWARE;
  SPI_InitStructure.SPI_SELPolarity = SPI_SELPOLARITY_LOW;
  SPI_InitStructure.SPI_FirstBit = SPI_FIRSTBIT_MSB;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_HIGH;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_SECOND;
  SPI_InitStructure.SPI_RxFIFOTriggerLevel = 0;
  SPI_InitStructure.SPI_TxFIFOTriggerLevel = 0;
  SPI_InitStructure.SPI_ClockPrescaler = 2;
  SPI_Init(FLASH_SPI, &SPI_InitStructure);

  SPI_SELOutputCmd(FLASH_SPI, ENABLE);

  SPI_Cmd(FLASH_SPI, ENABLE);

  for (i = SPI_READ_CMD_NUM - 1; i >= 0; i--)
  {
    uFlashID = SPI_Flash_ReadID[i]();
    for (j = SPI_FALSH_NUM - 1; j >= 0; j--)
    {
      if ((uFlashID & SPIFlash[j].uFlashIDMask) == SPIFlash[j].uFlashID)
      {
        sSPI_FLASH_Index = j;
        sSPI_FLASH_Size = (SPIFlash[j].GetSize != NULL) ? SPIFlash[j].GetSize(uFlashID) : SPIFlash[j].sFlashSize;
        return TRUE;
      }
    }
  }

  return FALSE;
}

/*********************************************************************************************************//**
  * @brief  Reads JEDEC ID.
  * @retval JEDEC ID value.
  ***********************************************************************************************************/
u32 SPI_FLASH_ReadJEDECID(void)
{
  return (SPIFlash[sSPI_FLASH_Index].ReadID());
}

/*********************************************************************************************************//**
  * @brief  Get Flash Size.
  * @retval Size value in byte.
  ***********************************************************************************************************/
s32 SPI_FLASH_GetSize(void)
{
  return (SPIFlash[sSPI_FLASH_Index].sFlashSize);
}

/*********************************************************************************************************//**
  * @brief  Erases the entire FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_ChipErase(void)
{
  SPIFlash[sSPI_FLASH_Index].ChipErase();
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH sector.
  * @param  SectorAddr: address of the sector to erase.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_SectorErase(u32 SectorAddr)
{
  SPIFlash[sSPI_FLASH_Index].SectorErase(SectorAddr);
}

/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH.
  * @param  WriteBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  SPIFlash[sSPI_FLASH_Index].BufferWrite(WriteBuffer, WriteAddr, NumOfWriteByte);
}

/*********************************************************************************************************//**
  * @brief  Reads a block of data from the FLASH.
  * @param  ReadBuffer : pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr : FLASH's internal address to read from.
  * @param  NumOfReadByte : number of bytes to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferRead(u8* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte)
{
  SPIFlash[sSPI_FLASH_Index].BufferRead(ReadBuffer, ReadAddr, NumOfReadByte);
}

#if (DUAL_READ_ENABLE==1)
/*********************************************************************************************************//**
  * @brief  Reads a block of data from the FLASH using Dual Output Mode.
  * @param  ReadBuffer : pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr : FLASH's internal address to read from.
  * @param  NumOfReadByte : number of half words to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferDualRead(u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte)
{
  if (SPIFlash[sSPI_FLASH_Index].BufferDualRead != NULL)
    SPIFlash[sSPI_FLASH_Index].BufferDualRead(ReadBuffer, ReadAddr, NumOfReadByte);
}
#endif

/*********************************************************************************************************//**
  * @brief  Writes the new value to the Status Register.
  * @param  Value : the new value to be written to the Status Register.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteStatus(u32 Value)
{
  SPIFlash[sSPI_FLASH_Index].WriteStatus(Value);
}

/*********************************************************************************************************//**
  * @brief  Enables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteEnable(void)
{
  SPIFlash[sSPI_FLASH_Index].WriteEnable();
}

/*********************************************************************************************************//**
  * @brief  Disables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteDisable(void)
{
  SPIFlash[sSPI_FLASH_Index].WriteDisable();
}

/*********************************************************************************************************//**
  * @brief  Polls the status of the BUSY flag in the FLASH's status register and waits for the end of Flash
            writing.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WaitForWriteEnd(void)
{
  SPIFlash[sSPI_FLASH_Index].WaitForWriteEnd();
}

#ifdef SPI_FLASH_CACHE
/*********************************************************************************************************//**
  * @brief  Write 512 bytes buffer into SPI Flash.
  * @param  buf: buffer pointer of data
  * @param  uAddress: Address for write
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_CacheWrite(uc8 *buf, u32 uAddress)
{
  u32 uTargetPage = (uAddress & 0xFFFF000);
  s32 i;
  u32 *pCache;
  u32 *pBuf = (u32 *)buf;

  if (uCachePage != uTargetPage)
  {
    /* Change Cache page, sync cached data before change it                                                 */
    SPI_FLASH_CacheSync();

    /* Get data from SPI Flash to cache and then update cached address information                          */
    SPI_FLASH_BufferRead(uCacheBuffer, uTargetPage, 4096);
    uCachePage = uTargetPage;
  }

  /* According to the address to get data position of 4K cache range                                        */
  pCache = (u32 *)(uCacheBuffer + (uAddress % 4096));

  for (i = 512/4 - 1; i >= 0; i--)
  {
    if (uIsCachePageErased == FALSE)
    {
      /* Check cached page need erase or not when it is not erased before                                   */
      if ((pCache[i] & pBuf[i]) != pBuf[i])
      {
        /* Cached page data is different with write data, erase it                                          */
        SPI_FLASH_SectorErase(uCachePage);
        uIsCachePageErased = TRUE;
      }
    }

    /* Update write data to cache                                                                           */
    pCache[i] = pBuf[i];
  }

  if (uIsCachePageErased == FALSE)
  {
    /* No need to erase the page, write data need program to SPI Flash separately                           */
    u32 uCachePos = (uAddress % 4096) / 512;
    uIsCachePageUpdate  |= (1 << uCachePos);
  }
}

/*********************************************************************************************************//**
  * @brief  Sync cache data into SPI Flash.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_CacheSync(void)
{
  s32 i;
  if (uIsCachePageErased == TRUE)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Cached Flash page have been erased, write all cache data back to the page                            */
    /*------------------------------------------------------------------------------------------------------*/
    SPI_FLASH_BufferWrite(uCacheBuffer, uCachePage, 4096);
  }
  else
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Cached Flash page do not need erase, program each write data in cache to Flash separately            */
    /*------------------------------------------------------------------------------------------------------*/
    for (i = 7; i >= 0; i--)
    {
      if ((uIsCachePageUpdate &  (1 << i)))
      {
        SPI_FLASH_BufferWrite(&uCacheBuffer[512 * i], uCachePage + (512 * i), 512);
      }
    }
  }
  uCachePage = 0xFFFFFFFF;
  uIsCachePageErased = FALSE;
  uIsCachePageUpdate = 0;
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

/**
  * @}
  */
