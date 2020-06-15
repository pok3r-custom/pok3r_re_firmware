/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/spi_sd.c
 * @version $Rev:: 1357         $
 * @date    $Date:: 2018-08-02 #$
 * @brief   The SD Memory card driver. Supports both SD and SDHC.
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
#include "ht32.h"
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


/* Private constants ---------------------------------------------------------------------------------------*/
#define SD_DUMMY_DATA                     (0xFF)

/*----------------------------------------------------------------------------------------------------------*/
/* Start Data Tokens                                                                                        */
/*----------------------------------------------------------------------------------------------------------*/
#define SD_START_SINGLE_BLOCK_READ        (0xFE)
#define SD_START_SINGLE_BLOCK_WRITE       (0xFE)
#define SD_START_MULTIPLE_BLOCK_READ      (0xFE)
#define SD_START_MULTIPLE_BLOCK_WRITE     (0xFC)
#define SD_STOP_MULTIPLE_BLOCK_WRITE      (0xFD)

/*----------------------------------------------------------------------------------------------------------*/
/* SD Commands                                                                                              */
/*----------------------------------------------------------------------------------------------------------*/
#define SD_CMD00_GO_IDLE_STATE            (0)    /* 0x40                                                    */
#define SD_CMD01_SEND_OP_COND             (1)    /* 0x41                                                    */
#define SD_CMD08_SEND_IF_COMD             (8)    /* 0x48                                                    */
#define SD_CMD09_SEND_CSD                 (9)    /* 0x49                                                    */
#define SD_CMD10_SEND_CID                 (10)   /* 0x4A                                                    */
#define SD_CMD12_STOP_TRAN                (12)   /* 0x4C                                                    */
#define SD_CMD13_SEND_STATUS              (13)   /* 0x4D                                                    */
#define SD_CMD16_SETBLOCKLEN              (16)   /* 0x50                                                    */
#define SD_CMD55_APP_CMD                  (55)   /* 0x77                                                    */
#define SD_CMD58_READ_OCR                 (58)   /* 0x7A                                                    */
#define SD_CMD59_CRC_ONOFF                (59)   /* 0x7B                                                    */
#define SD_ACMD41_SEND_OP_COND            (41)   /* 0x69                                                    */

#define SD_READ_SINGLE_BLOCK              (17)   /* 0x51                                                    */
#define SD_READ_MULTIPLE_BLOCK            (18)   /* 0x52                                                    */
#define SD_WRITE_BLOCK                    (24)   /* 0x58                                                    */
#define SD_WRITE_MULTIPLE_BLOCK           (25)   /* 0x59                                                    */

/*----------------------------------------------------------------------------------------------------------*/
/* Write Data Response                                                                                      */
/*----------------------------------------------------------------------------------------------------------*/
#define SD_DATA_OK                        (0x5)
#define SD_DATA_CRC_ERROR                 (0xB)
#define SD_DATA_WRITE_ERROR               (0xD)
#define SD_DATA_ERROR                     (0xF)

/* Private function prototypes -----------------------------------------------------------------------------*/
static u8 SD_ReadByte(void);
//static void SD_WriteByte(u8 uData);
static void SD_SendCmd(u32 uCmd, u32 uParameter, u32 uCrc);
static u32 SD_GetResponse(u8 uResponse, u32 uTimeout);
static u32 SD_GetDataResponse(void);
//static u32 SD_GetStatus(void);
static u32 SD_SetIdleStateSPI(void);
static u32 SD_ClearSPIFIFO(void);
static void SD_DummyDealy(void);
static void SPI_Configuration(u32 uSpeed);

/* Private macro -------------------------------------------------------------------------------------------*/
#if (SD_DEBUG == 1)
#define SDDBG   printf
#else
#define SDDBG(...)
#endif

#define SD_WriteByte(uData)  SPI_SendData(SD_SPI_PORT, uData)

/* Global variables ----------------------------------------------------------------------------------------*/
u32 uSD_IsSDHC = FALSE;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  The initial function of SD Memory card driver.
  * @retval result: SD_RESPONSE_ERR: SD card response failed.
  *                 SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_Init(void)
{
  u8 uResult;
  s32 i;
  u32 uTimeoutCount = SD_INIT_CNT;
  u32 uRetry = 3;
  SDDBG("\r\n");

  if (SD_IsCardDetected() == FALSE)
  {
    return SD_RESPONSE_ERR;
  }

  SPI_Configuration(SD_SPI_DIV);

  SD_CS_INACTIVE();
  for (i = 10; i > 0; i--)
  {
    SD_WriteByte(SD_DUMMY_DATA);
    while ((SD_SPI_PORT->SR & SPI_FLAG_BUSY));
  }

  do
  {
    SDDBG("SD: Try %d\r\nSD: CMD00\t", 3 - uRetry);
    do
    {
      SD_CS_ACTIVE();
      SD_SendCmd(SD_CMD00_GO_IDLE_STATE, 0, 0x95);
      uResult = SD_GetResponse(SD_IN_IDLE_STATE, 0x1FF);
      SD_CS_INACTIVE();
      uTimeoutCount--;
    } while ((uResult != SD_RESPONSE_NOERR) && (uTimeoutCount));

    if (uTimeoutCount == 0)
    {
      SDDBG("Failed\r\n");
      uTimeoutCount = SD_INIT_CNT;
      uRetry--;
      continue;
    }
    SDDBG("OK\r\n");

    uResult = SD_SetIdleStateSPI();
    if (uResult == SD_RESPONSE_NOERR)
    {
      break;
    }
    uRetry--;
  } while (uRetry != 0);

  #if 0
  SD_CS_ACTIVE();
  SD_SendCmd(SD_CMD59_CRC_ONOFF, 0, 0);
  SD_GetResponse(SD_IN_IDLE_STATE, 0xFF);
  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);
  #endif

  #if 0
  if (uSD_IsSDHC == FALSE)
  {
    SD_CS_ACTIVE();
    SD_SendCmd(SD_CMD16_SETBLOCKLEN, 512, 0);
    SD_GetResponse(SD_IN_IDLE_STATE, 0xFF);
    SD_CS_INACTIVE();
    SD_WriteByte(SD_DUMMY_DATA);
  }
  #endif

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Read a block of data from SD card.
  * @param  pBuf: Point to the buffer of received data from SD card
  * @param  uReadAddr: The start address of SD card read operation
  * @param  uReadSize: The number of byte data that read from SD card
  * @retval uResult: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_ReadBlock(u8* pBuf, u32 uReadAddr, u32 uReadSize)
{
  u8 uResult = SD_RESPONSE_ERR;
  s32 i;
  //s32 j;

#if (SDHC_SUPPORT == 1)
  if (uSD_IsSDHC == FALSE)
#endif
  {
    uReadAddr *= SD_BLOCK_SIZE;
  }

  SDDBG("SD: Read block, addr[%d] size[%d]\r\n", uReadAddr, uReadSize);

  SD_CS_ACTIVE();
  SD_SendCmd(SD_READ_SINGLE_BLOCK, uReadAddr, 0xFF);

  /* Wait for response in the R1 format (0x00 is no errors)                                                 */
  if (!SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    /* Wait for data token start byte                                                                       */
    if (!SD_GetResponse(SD_START_SINGLE_BLOCK_READ, SD_GETRSP_CNT))
    {
      for (i = uReadSize / 8; i > 0; i--)
      {
        #if 0
        for (j = 8; j > 0; j--)
        {
          SPI_SendData(SD_SPI_PORT, SD_DUMMY_DATA);
        }
        #else
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        #endif

        //while (SPI_GetFIFOStatus(SD_SPI_PORT, SPI_FIFO_RX) != 8);
        while (((SD_SPI_PORT->FSR & 0xf0) >> 4) != 8);

        #if 0
        for (j = 8; j > 0; j--)
        {
          *pBuf++ = SPI_ReceiveData(SD_SPI_PORT);
        }
        #else
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        #endif
      }

      /* Get 16-bit CRC                                                                                     */
      //SD_ReadByte();
      //SD_ReadByte();
      SD_SPI_PORT->DR = SD_DUMMY_DATA;
      SD_SPI_PORT->DR = SD_DUMMY_DATA;

      /* Set response value to success                                                                      */
      uResult = SD_RESPONSE_NOERR;
    }
    else
    {
      SDDBG("\r\nI. Read block error!!\r\n");
    }
  }
  else
  {
    SDDBG("\r\nII. Read block error!!\r\n");
  }

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Read multiple block of data from SD card.
  * @param  pBuf: Point to the buffer of received data from SD card
  * @param  uReadAddr: The start address of SD card read operation
  * @param  uReadSize: The number of byte data that read from SD card
  * @retval uResult: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_ReadMultipleBlock(u8* pBuf, u32 uReadAddr, u32 uReadSize)
{
  u32 uResult = SD_RESPONSE_ERR;
  u32 uReadCount;
  s32 i;

#if (SDHC_SUPPORT == 1)
  if (uSD_IsSDHC == FALSE)
#endif
  {
    uReadAddr *= SD_BLOCK_SIZE;
  }

  uReadCount = uReadSize / SD_BLOCK_SIZE;

  SDDBG("SD: Read multiple block, addr[%d] size[%d]\r\n", uReadAddr, uReadSize);

  SD_CS_ACTIVE();
  SD_SendCmd(SD_READ_MULTIPLE_BLOCK, uReadAddr, 0xFF);
  if (SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    return SD_RESPONSE_ERR;
  }

  while (uReadCount--)
  {
    if (!SD_GetResponse(SD_START_MULTIPLE_BLOCK_READ, SD_GETRSP_CNT))
    {
      #if 0
      for (i = SD_BLOCK_SIZE; i > 0; i--)
      {
        *pBuf++ = SD_ReadByte();
      }
      #endif
      for (i = SD_BLOCK_SIZE / 8; i > 0; i--)
      {
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;
        SD_SPI_PORT->DR = SD_DUMMY_DATA;

        while (((SD_SPI_PORT->FSR & 0xf0) >> 4) != 8);

        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
        *pBuf++ = SD_SPI_PORT->DR;
      }

      //SD_ReadByte();
      //SD_ReadByte();
      SD_SPI_PORT->DR = SD_DUMMY_DATA;
      SD_SPI_PORT->DR = SD_DUMMY_DATA;

      uResult = SD_RESPONSE_NOERR;
    }
    else
    {
      uResult = SD_RESPONSE_ERR;
    }
  }

  SD_WriteByte(SD_DUMMY_DATA);
  SD_SendCmd(SD_CMD12_STOP_TRAN, 0x0, 0x0);

  if (SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    return SD_RESPONSE_ERR;
  }

  while (SD_IsReadBusy() == TRUE);

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Write a block of data to SD card.
  * @param  pBuf: Point to the buffer of data be written to SD card.
  * @param  uWritedAddr: The start address of SD card write operation.
  * @param  uWriteSize: The number of byte data that write to SD card.
  * @retval uResult: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_WriteBlock(u8* pBuf, u32 uWritedAddr, u32 uWriteSize)
{
  u32 uResult = SD_RESPONSE_ERR;
  s32 i;
  //s32 j;

#if (SDHC_SUPPORT == 1)
  if (uSD_IsSDHC == FALSE)
#endif
  {
    uWritedAddr *= SD_BLOCK_SIZE;
  }

  SDDBG("SD: Write block, addr[%d] size[%d]\r\n", uWritedAddr, uWriteSize);

  SD_CS_ACTIVE();
  SD_SendCmd(SD_WRITE_BLOCK, uWritedAddr, 0xFF);

  /* Wait for response in the R1 format (0x00 is no errors)                                                 */
  if (!SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    SD_WriteByte(SD_DUMMY_DATA);
    SD_WriteByte(SD_START_SINGLE_BLOCK_WRITE);  /* Start Block token                                        */
    while (SPI_GetFlagStatus(SD_SPI_PORT, SPI_FLAG_BUSY));

    for (i = uWriteSize / 8; i > 0 ; i--)
    {
      /* Wait until Tx FIFO empty                                                                           */
      //while (SPI_GetFIFOStatus(SD_SPI_PORT, SPI_FIFO_TX) != 0);
      while ((SD_SPI_PORT->FSR & 0xf) != 0);

      #if 0
      for (j = 8; j > 0; j--)
      {
        SPI_SendData(SD_SPI_PORT, *pBuf++);
      }
      #else
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      #endif
    }

    //SD_ClearSPIFIFO();

    /* Get 16-bit CRC                                                                                       */
    //SD_ReadByte();
    //SD_ReadByte();
    SD_SPI_PORT->DR = SD_DUMMY_DATA;
    SD_SPI_PORT->DR = SD_DUMMY_DATA;

    /* Set response value to success                                                                        */
    if (SD_GetDataResponse() == SD_DATA_OK)
    {
      uResult = SD_RESPONSE_NOERR;
    }
    else
    {
      SDDBG("\r\nWrite block response error!!\r\n");
    }
  }
  else
  {
    SDDBG("\r\nWrite block error!!\r\n");
  }

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Write multiple block of data to SD card..
  * @param  pBuf: Point to the buffer of data be written to SD card.
  * @param  uWritedAddr: The start address of SD card write operation.
  * @param  uWriteSize: The number of byte data that write to SD card.
  * @retval uResult: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_WriteMultipleBlock(u8* pBuf, u32 uWritedAddr, u32 uWriteSize)
{
  u32 uResult = SD_RESPONSE_ERR;
  s32 i;
  u32 uBlockCount;

#if (SDHC_SUPPORT == 1)
  if (uSD_IsSDHC == FALSE)
#endif
  {
    uWritedAddr *= SD_BLOCK_SIZE;
  }

  uBlockCount = uWriteSize / SD_BLOCK_SIZE;

  SDDBG("SD: Write multiple block, addr[%d] size[%d]\r\n", uWritedAddr, uWriteSize);

  SD_CS_ACTIVE();
  SD_SendCmd(SD_WRITE_MULTIPLE_BLOCK, uWritedAddr, 0xFF);
  if (SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    return SD_RESPONSE_ERR;
  }

  while (uBlockCount--)
  {
    /* Send start multiple block token                                                                      */
    //SD_WriteByte(SD_DUMMY_DATA);
    //SD_WriteByte(SD_START_MULTIPLE_BLOCK_WRITE);
    SD_SPI_PORT->DR = SD_DUMMY_DATA;
    SD_SPI_PORT->DR = SD_START_MULTIPLE_BLOCK_WRITE;

    for (i = SD_BLOCK_SIZE / 8; i > 0; i--)
    {
      while ((SD_SPI_PORT->FSR & 0xf) != 0);

      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
      SD_SPI_PORT->DR = *pBuf++;
    }

    //SD_ClearSPIFIFO();

    /* Get 16-bit CRC                                                                                       */
    //SD_ReadByte();
    //SD_ReadByte();
    SD_SPI_PORT->DR = SD_DUMMY_DATA;
    SD_SPI_PORT->DR = SD_DUMMY_DATA;

    /* Set response value to success                                                                        */
    if (SD_GetDataResponse() == SD_DATA_OK)
    {
      uResult = SD_RESPONSE_NOERR;
    }
    else
    {
      SDDBG("\r\nData response error!\r\n");
      uResult = SD_RESPONSE_ERR;
      break;
    }

    while (SD_IsWriteBusy());
    SD_WriteByte(SD_DUMMY_DATA);
  }

  /* Send multiple block stop write token                                                                   */
  SD_WriteByte(SD_STOP_MULTIPLE_BLOCK_WRITE);

  while (SD_IsWriteBusy());

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  SD_CS_ACTIVE();
  while (SD_IsWriteBusy());

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Get CSD Register from Sd Card..
  * @param  SD_CSD: structure point of CSD register.
  * @retval uStatus: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_GetCSDRegister(SD_CSD_TypeDef* SD_CSD)
{
  u32 i;
  u32 uStatus = SD_RESPONSE_ERR;
  u8 uCSDTab[16];

  SD_CS_ACTIVE();
  SD_SendCmd(SD_CMD09_SEND_CSD, 0, 0xFF);

  /* Wait for response in the R1 format (0x00 is no errors)                                                 */
  if (!SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    /* Wait for data token start byte                                                                       */
    if (!SD_GetResponse(SD_START_SINGLE_BLOCK_READ, SD_GETRSP_CNT))
    {
      for (i = 0; i < 16; i++)
      {
        /* Store CSD register value on CSD_Tab                                                              */
        uCSDTab[i] = SD_ReadByte();
      }

      /* Get 16-bit CRC                                                                                     */
      SD_WriteByte(SD_DUMMY_DATA);
      SD_WriteByte(SD_DUMMY_DATA);

      /* Set response value to success                                                                      */
      uStatus = SD_RESPONSE_NOERR;
    }
  }

  for (i = 3; i > 0; i--)
  {
    SD_WriteByte(SD_DUMMY_DATA);
  }
  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  /* Byte 0                                                                                                 */
  SD_CSD->CSDStruct            = (uCSDTab[0] & 0xC0) >> 6;
  SD_CSD->SysSpecVersion       = (uCSDTab[0] & 0x3C) >> 2;
  SD_CSD->Reserved1            = uCSDTab[0] & 0x03;
  /* Byte 1                                                                                                 */
  SD_CSD->TAAC                 = uCSDTab[1];
  /* Byte 2                                                                                                 */
  SD_CSD->NSAC                 = uCSDTab[2];
  /* Byte 3                                                                                                 */
  SD_CSD->MaxBusClkFrec        = uCSDTab[3];
  /* Byte 4                                                                                                 */
  SD_CSD->CardComdClasses      = uCSDTab[4] << 4;
  /* Byte 5                                                                                                 */
  SD_CSD->CardComdClasses     |= (uCSDTab[5] & 0xF0) >> 4;
  SD_CSD->RdBlockLen           = uCSDTab[5] & 0x0F;
  /* Byte 6                                                                                                 */
  SD_CSD->PartBlockRead        = (uCSDTab[6] & 0x80) >> 7;
  SD_CSD->WrBlockMisalign      = (uCSDTab[6] & 0x40) >> 6;
  SD_CSD->RdBlockMisalign      = (uCSDTab[6] & 0x20) >> 5;
  SD_CSD->DSRImpl              = (uCSDTab[6] & 0x10) >> 4;
  SD_CSD->Reserved2            = 0;
  SD_CSD->DeviceSize           = (uCSDTab[6] & 0x03) << 10;
  /* Byte 7                                                                                                 */
  SD_CSD->DeviceSize          |= (uCSDTab[7]) << 2;
  /* Byte 8                                                                                                 */
  SD_CSD->DeviceSize          |= (uCSDTab[8] & 0xC0) >> 6;
  SD_CSD->MaxRdCurrentVDDMin   = (uCSDTab[8] & 0x38) >> 3;
  SD_CSD->MaxRdCurrentVDDMax   = (uCSDTab[8] & 0x07);
  /* Byte 9                                                                                                 */
  SD_CSD->MaxWrCurrentVDDMin   = (uCSDTab[9] & 0xE0) >> 5;
  SD_CSD->MaxWrCurrentVDDMax   = (uCSDTab[9] & 0x1C) >> 2;
  SD_CSD->DeviceSizeMul        = (uCSDTab[9] & 0x03) << 1;
  /* Byte 10                                                                                                */
  SD_CSD->DeviceSizeMul       |= (uCSDTab[10] & 0x80) >> 7;
  SD_CSD->EraseGrSize          = (uCSDTab[10] & 0x7C) >> 2;
  SD_CSD->EraseGrMul           = (uCSDTab[10] & 0x03) << 3;
  /* Byte 11                                                                                                */
  SD_CSD->EraseGrMul          |= (uCSDTab[11] & 0xE0) >> 5;
  SD_CSD->WrProtectGrSize      = (uCSDTab[11] & 0x1F);
  /* Byte 12                                                                                                */
  SD_CSD->WrProtectGrEnable    = (uCSDTab[12] & 0x80) >> 7;
  SD_CSD->ManDeflECC           = (uCSDTab[12] & 0x60) >> 5;
  SD_CSD->WrSpeedFact          = (uCSDTab[12] & 0x1C) >> 2;
  SD_CSD->MaxWrBlockLen        = (uCSDTab[12] & 0x03) << 2;
  /* Byte 13                                                                                                */
  SD_CSD->MaxWrBlockLen       |= (uCSDTab[13] & 0xc0) >> 6;
  SD_CSD->WriteBlockPaPartial  = (uCSDTab[13] & 0x20) >> 5;
  SD_CSD->Reserved3            = 0;
  SD_CSD->ContentProtectAppli  = (uCSDTab[13] & 0x01);
  /* Byte 14                                                                                                */
  SD_CSD->FileFormatGrouop     = (uCSDTab[14] & 0x80) >> 7;
  SD_CSD->CopyFlag             = (uCSDTab[14] & 0x40) >> 6;
  SD_CSD->PermWrProtect        = (uCSDTab[14] & 0x20) >> 5;
  SD_CSD->TempWrProtect        = (uCSDTab[14] & 0x10) >> 4;
  SD_CSD->FileFormat           = (uCSDTab[14] & 0x0C) >> 2;
  SD_CSD->ECC                  = (uCSDTab[14] & 0x03);
  /* Byte 15                                                                                                */
  SD_CSD->msd_CRC              = (uCSDTab[15] & 0xFE) >> 1;
  SD_CSD->Reserved4            = 1;

#if (SDHC_SUPPORT == 1)
  if (uSD_IsSDHC == 1)
  {
    /* Byte 7                                                                                               */
    SD_CSD->DeviceSize = (u16)(uCSDTab[8]) * 256;
    /* Byte 8                                                                                               */
    SD_CSD->DeviceSize += uCSDTab[9];
  }
#endif

  /* Return the response                                                                                    */
  return uStatus;
}

/*********************************************************************************************************//**
  * @brief  Get CID Register from Sd Card.
  * @param  SD_CID: structure point of CID register.
  * @retval uStatus: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
u32 SD_GetCIDRegister(SD_CID_TypeDef* SD_CID)
{
  u32 i = 0;
  u32 uStatus = SD_RESPONSE_ERR;
  u8 uCIDTab[16];

  SD_CS_ACTIVE();
  SD_SendCmd(SD_CMD10_SEND_CID, 0, 0xFF);

  /* Wait for response in the R1 format (0x00 is no errors)                                                 */
  if (!SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT))
  {
    if (!SD_GetResponse(SD_START_SINGLE_BLOCK_READ, SD_GETRSP_CNT))
    {
      /* Store CID register value on CID_Tab                                                                */
      for (i = 0; i < 16; i++)
      {
        uCIDTab[i] = SD_ReadByte();
      }
    }
    /* Get 16-bit CRC                                                                                       */
    SD_WriteByte(SD_DUMMY_DATA);
    SD_WriteByte(SD_DUMMY_DATA);
    /* Set response value to success                                                                        */
    uStatus = SD_RESPONSE_NOERR;
  }

  for (i = 3; i > 0; i--)
  {
    SD_WriteByte(SD_DUMMY_DATA);
  }
  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  /* Byte 0                                                                                                 */
  SD_CID->ManufacturerID = uCIDTab[0];
  /* Byte 1                                                                                                 */
  SD_CID->OEM_AppliID = uCIDTab[1] << 8;
  /* Byte 2                                                                                                 */
  SD_CID->OEM_AppliID |= uCIDTab[2];
  /* Byte 3                                                                                                 */
  SD_CID->ProdName1 = uCIDTab[3] << 24;
  /* Byte 4                                                                                                 */
  SD_CID->ProdName1 |= uCIDTab[4] << 16;
  /* Byte 5                                                                                                 */
  SD_CID->ProdName1 |= uCIDTab[5] << 8;
  /* Byte 6                                                                                                 */
  SD_CID->ProdName1 |= uCIDTab[6];
  /* Byte 7                                                                                                 */
  SD_CID->ProdName2 = uCIDTab[7];
  /* Byte 8                                                                                                 */
  SD_CID->ProdRev = uCIDTab[8];
  /* Byte 9                                                                                                 */
  SD_CID->ProdSN = uCIDTab[9] << 24;
  /* Byte 10                                                                                                */
  SD_CID->ProdSN |= uCIDTab[10] << 16;
  /* Byte 11                                                                                                */
  SD_CID->ProdSN |= uCIDTab[11] << 8;
  /* Byte 12                                                                                                */
  SD_CID->ProdSN |= uCIDTab[12];
  /* Byte 13                                                                                                */
  SD_CID->Reserved1 |= (uCIDTab[13] & 0xF0) >> 4;
  /* Byte 14                                                                                                */
  SD_CID->ManufactDate = (uCIDTab[13] & 0x0F) << 8;
  /* Byte 15                                                                                                */
  SD_CID->ManufactDate |= uCIDTab[14];
  /* Byte 16                                                                                                */
  SD_CID->msd_CRC = (uCIDTab[15] & 0xFE) >> 1;
  SD_CID->Reserved2 = 1;

  /* Return the response                                                                                    */
  return uStatus;
}

/*********************************************************************************************************//**
  * @brief  Check the block write status.
  * @retval TRUE: write operation is busy. FALSE: write operation is finished.
  ***********************************************************************************************************/
u32 SD_IsWriteBusy(void)
{
  SD_ClearSPIFIFO();

  return((SD_ReadByte() == 0xFF) ? FALSE : TRUE);
}

/*********************************************************************************************************//**
  * @brief  Check the block read status.
  * @retval TRUE: read operation is busy. FALSE: write operation is finished.
  ***********************************************************************************************************/
u32 SD_IsReadBusy(void)
{
  SD_ClearSPIFIFO();

  return((SD_ReadByte() == 0x0) ? TRUE : FALSE);
}

/*********************************************************************************************************//**
  * @brief  Check the card inserted or not.
  * @retval TRUE: Card is detected. FALSE Card is not detected.
  ***********************************************************************************************************/
u32 SD_IsCardDetected(void)
{
  return((SD_CD_READ() == 0x0) ? TRUE : FALSE);
}

/* Private functions ---------------------------------------------------------------------------------------*/

/*********************************************************************************************************//**
  * @brief  Read one byte data from SD card.
  * @retval uData: Received data (1 Byte).
  ***********************************************************************************************************/
static u8 SD_ReadByte(void)
{
  u8 uData = 0;

  //SPI_SendData(SD_SPI_PORT, SD_DUMMY_DATA);
  SD_SPI_PORT->DR = SD_DUMMY_DATA;

  /* Wait data ready                                                                                        */
  //while (SPI_GetFIFOStatus(SD_SPI_PORT, SPI_FIFO_RX) == 0);
  while (((SD_SPI_PORT->FSR & 0xf0) >> 4) == 0);

  //uData = SPI_ReceiveData(SD_SPI_PORT);
  uData = SD_SPI_PORT->DR;

  return uData;
}

/*********************************************************************************************************//**
  * @brief  Send 6 bytes command to SD card.
  * @param  uCmd: SD command
  * @param  uParameter: Command argument
  * @param  uCrc: CRC7
  * @retval None
  ***********************************************************************************************************/
static void SD_SendCmd(u32 uCmd, u32 uParameter, u32 uCrc)
{
  s32 i;
  u8 uData[6];

  uData[5] = (uCmd | 0x40);
  uData[4] = (u8)(uParameter >> 24);
  uData[3] = (u8)(uParameter >> 16);
  uData[2] = (u8)(uParameter >> 8);
  uData[1] = (u8)(uParameter);
  uData[0] = (uCrc);

  for (i = 5; i >= 0; i--)
  {
    //SD_WriteByte(uData[i]);
    SD_SPI_PORT->DR = uData[i];
  }

  SD_ClearSPIFIFO();

  return;
}

/*********************************************************************************************************//**
  * @brief  Get response from SD card.
  * @param  uResponse: the response token
  * @param  uTimeout: Timeout value
  * @retval result: SD_RESPONSE_ERR: SD card response failed.
  *                 SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
static u32 SD_GetResponse(u8 uResponse, u32 uTimeout)
{
  u32 uTimeoutCount = uTimeout;
  u32 uValue;
  SD_ClearSPIFIFO();

  do
  {
    uValue = SD_ReadByte();
    if (uValue == uResponse)
    {
      break;
    }
    uTimeoutCount--;
  } while (uTimeoutCount);

  if (uTimeoutCount == 0)
  {
    return SD_RESPONSE_ERR;
  }
  else
  {
    return SD_RESPONSE_NOERR;
  }
}

/*********************************************************************************************************//**
  * @brief  Get data response token form SD card.
  * @retval uResult: SD_DATA_OK, SD_DATA_CRC_ERROR, SD_DATA_WRITE_ERROR, SD_DATA_ERROR
  ***********************************************************************************************************/
static u32 SD_GetDataResponse(void)
{
  u32 uResult = 0;
  u32 uTimeoutCount = SD_GETDRSP_CNT;

  SD_ClearSPIFIFO();

  while (uTimeoutCount--)
  {
    uResult = SD_ReadByte() & 0x1F;  /* Mask data response bit5~7                                           */
    if (uResult == SD_DATA_OK)
    {
      break;
    }
  }

  /* Wait for data is zero                                                                                  */
  while (SD_ReadByte() == 0);

  return uResult;
}

/*********************************************************************************************************//**
  * @brief  Get status from SD card.
  * @retval uStatus: The SD Card status
  ***********************************************************************************************************/
#if 0
static u32 SD_GetStatus(void)
{
  u32 uStatus;

  SD_CS_ACTIVE();
  SD_SendCmd(SD_CMD13_SEND_STATUS, 0, 0xFF);

  uStatus = SD_ReadByte();
  uStatus |= (u16)(SD_ReadByte() << 8);

  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);

  return uStatus;
}
#endif

/*********************************************************************************************************//**
  * @brief  Set SD card as idle state and SPI mode.
  * @retval result: SD_RESPONSE_ERR: SD card response failed.
  *                 SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
static u32 SD_SetIdleStateSPI(void)
{
  u32 uTimeoutCount;
  u32 uResult;
  u32 i;

#if (SDHC_SUPPORT == 1)

  SD_DummyDealy();

  uTimeoutCount = SD_CHECK_VER;

  SDDBG("SD: CMD08\t");
  SD_SendCmd(SD_CMD08_SEND_IF_COMD, 0x1AA, 0x87);

  do
  {
    uResult = SD_ReadByte();
    if (uResult != 0xFF)
    {
      break;
    }
    uTimeoutCount--;
  } while (uTimeoutCount);

  if (uTimeoutCount == 0)
  {
    SDDBG("Failed\r\n");
    return SD_RESPONSE_ERR;
  }
  SDDBG("OK R1=%x\r\n", uResult);

  if (uResult == (SD_IN_IDLE_STATE | SD_ILLEGAL_COMMAND))
  {
    uSD_IsSDHC = FALSE;
#endif

    SDDBG("SD: SD Mode\r\n");

    for (i = 0; i < 4; i++)
    {
      SD_WriteByte(SD_DUMMY_DATA);
    }
    SD_ClearSPIFIFO();

    SDDBG("SD: CMD55, ACMD41\t");
    uTimeoutCount = 0xFFFF;
    do
    {
      SD_DummyDealy();
      SD_SendCmd(SD_CMD55_APP_CMD, 0, 0x0);
      uResult = SD_GetResponse(SD_IN_IDLE_STATE, 0xFF);
      if (uResult == SD_RESPONSE_NOERR)
      {
        SD_DummyDealy();
        SD_SendCmd(SD_ACMD41_SEND_OP_COND, 0x0, 0x0);
        uResult = SD_GetResponse(SD_RESPONSE_NOERR, 0xFF);
        if (uResult == SD_RESPONSE_NOERR)
        {
          break;
        }
      }
      uTimeoutCount--;
    } while (uTimeoutCount);

    if (uTimeoutCount == 0)
    {
      SDDBG("Failed\r\n");
      SDDBG("SD: CMD01\t");
      uTimeoutCount = SD_IDLE_CNT;
      do
      {
        SD_DummyDealy();
        SD_SendCmd(SD_CMD01_SEND_OP_COND, 0, 0xFF);
        uTimeoutCount--;
      } while (SD_GetResponse(SD_RESPONSE_NOERR, SD_GETRSP_CNT) && uTimeoutCount);

      SD_CS_INACTIVE();
      SD_WriteByte(SD_DUMMY_DATA);

      if (uTimeoutCount == 0)
      {
        SDDBG("Failed\r\n");
        return SD_RESPONSE_ERR;
      }
    }
    for (i = 4; i > 0; i--)
    {
      SD_WriteByte(SD_DUMMY_DATA);
    }
    SDDBG("OK\r\n");

    SD_CS_INACTIVE();
    SD_WriteByte(SD_DUMMY_DATA);
    SPI_Configuration(SD_SPI_DIV_HIGHSPEED);

#if (SDHC_SUPPORT == 1)
  }
  else if (uResult == (SD_IN_IDLE_STATE | SD_RESPONSE_NOERR))
  {
    for (i = 0; i < 4; i++)
    {
      SD_WriteByte(SD_DUMMY_DATA);
    }
    SD_ClearSPIFIFO();

    SDDBG("SD: CMD55, ACMD41\t");
    uTimeoutCount = 0xFFFF;
    do
    {
      SD_DummyDealy();
      SD_SendCmd(SD_CMD55_APP_CMD, 0, 0x0);
      uResult = SD_GetResponse(SD_IN_IDLE_STATE, 0xFF);
      if (uResult == SD_RESPONSE_NOERR)
      {
        SD_DummyDealy();
        SD_SendCmd(SD_ACMD41_SEND_OP_COND, 0x40000000, 0x0);
        uResult = SD_GetResponse(SD_RESPONSE_NOERR, 0xFF);
        if (uResult == SD_RESPONSE_NOERR)
        {
          break;
        }
      }
      uTimeoutCount--;
    } while (uTimeoutCount);

    if (uTimeoutCount == 0)
    {
      SDDBG("Failed\r\n");
      return SD_RESPONSE_ERR;
    }
    else
    {
      SDDBG("OK\r\n");
      SDDBG("SD: CMD58\t");

      SD_DummyDealy();
      SD_SendCmd(SD_CMD58_READ_OCR, 0, 0x0);

      for (i = 0; i < 0xFFFFFF; i++)
      {
        uResult = SD_ReadByte();
        if (uResult != 0xFF)
        {
         break;
        }
      }

      if (i == 0xFFFFFF)
      {
        SDDBG("Failed\r\n");
        return SD_RESPONSE_ERR;
      }

      uResult = SD_ReadByte();
      SDDBG("OK OCR %x\r\n", uResult);
      if (uResult & 0x40)
      {
        uSD_IsSDHC = TRUE;
        SDDBG("SD: SDHC Mode\r\n");
      }
      else
      {
        uSD_IsSDHC = FALSE;
        SDDBG("SD: SD Mode\r\n");
      }
      for (i = 4; i > 0; i--)
      {
        SD_WriteByte(SD_DUMMY_DATA);
      }
      SD_CS_INACTIVE();
      SD_WriteByte(SD_DUMMY_DATA);
      SPI_Configuration(SD_SPI_DIV_HIGHSPEED);
    }
  }
  else
  {
    return SD_RESPONSE_ERR;
  }
#endif

  SD_ClearSPIFIFO();
  return SD_RESPONSE_NOERR;
}

/*********************************************************************************************************//**
  * @brief  Clear SPI FIFO.
  * @retval None
  ***********************************************************************************************************/
static u32 SD_ClearSPIFIFO(void)
{
  vu32 uTemp;

  //while (SPI_GetFlagStatus(SD_SPI_PORT, SPI_FLAG_BUSY));
  while ((SD_SPI_PORT->SR & SPI_FLAG_BUSY));

  //while (SPI_GetFIFOStatus(SD_SPI_PORT, SPI_FIFO_RX) != 0)
  while (((SD_SPI_PORT->FSR & 0xf0) >> 4) != 0)
  {
    //SPI_ReceiveData(SD_SPI_PORT);
    uTemp = SD_SPI_PORT->DR;
  }

  return uTemp;
}

/*********************************************************************************************************//**
  * @brief  Dummy delay.
  * @retval None
  ***********************************************************************************************************/
static void SD_DummyDealy(void)
{
  SD_CS_INACTIVE();
  SD_WriteByte(SD_DUMMY_DATA);
  //while (SPI_GetFlagStatus(SD_SPI_PORT, SPI_FLAG_BUSY));
  while ((SD_SPI_PORT->SR & SPI_FLAG_BUSY));
  SD_CS_ACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Configures the SPI Port.
  * @retval None
  ***********************************************************************************************************/
static void SPI_Configuration(u32 uSpeed)
{
  SPI_InitTypeDef SPI_InitStructure;

  SPI_InitStructure.SPI_Mode = SPI_MASTER;
  SPI_InitStructure.SPI_FIFO = SPI_FIFO_ENABLE;
  SPI_InitStructure.SPI_DataLength = SPI_DATALENGTH_8;
  SPI_InitStructure.SPI_SELMode = SPI_SEL_SOFTWARE;
  SPI_InitStructure.SPI_SELPolarity = SPI_SELPOLARITY_LOW;
  SPI_InitStructure.SPI_FirstBit = SPI_FIRSTBIT_MSB;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_HIGH;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_SECOND;
  SPI_InitStructure.SPI_RxFIFOTriggerLevel = 0;
  SPI_InitStructure.SPI_TxFIFOTriggerLevel = 0;
  SPI_InitStructure.SPI_ClockPrescaler = uSpeed;
  SPI_Init(SD_SPI_PORT, &SPI_InitStructure);

  SPI_SELOutputCmd(SD_SPI_PORT, ENABLE);

  SPI_Cmd(SD_SPI_PORT, ENABLE);

  return;
}


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
