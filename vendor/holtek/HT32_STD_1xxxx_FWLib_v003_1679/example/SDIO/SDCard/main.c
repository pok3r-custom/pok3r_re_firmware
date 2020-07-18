/*********************************************************************************************************//**
 * @file    SDIO/SDCard/main.c
 * @version $Rev:: 819          $
 * @date    $Date:: 2017-09-27 #$
 * @brief   Main program.
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"
#include "sdio_sd.c"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup SDIO_Examples SDIO
  * @{
  */

/** @addtogroup SDIO_SDCard
  * @{
  */


/* Private define ------------------------------------------------------------------------------------------*/
#define BLK_SIZE            (512)                       /* block size in bytes                              */
#define BUF_SIZE            (BLK_SIZE >> 2)             /* buffer size in words                             */

#define BLK_CNT             (2)                         /* for multi-block operation                        */
#define BLK_BUF_SIZE        ((BLK_CNT * BLK_SIZE) >> 2)

/* Private variables ---------------------------------------------------------------------------------------*/
SD_CardInfo SDCardInfo;
u32 Buffer_Block_Tx[BUF_SIZE], Buffer_Block_Rx[BUF_SIZE];
u32 Buffer_MultiBlock_Tx[BLK_BUF_SIZE], Buffer_MultiBlock_Rx[BLK_BUF_SIZE];

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Enable(void);
SD_Error SD_EraseTest(void);
SD_Error SD_SingleBlockTest(void);
SD_Error SD_MultiBlockTest(void);
void Fill_Buffer(u32 *pBuffer, u32 BufferLength, u32 Offset);
ErrStatus Buffercmp(u32* pBuffer1, u32* pBuffer2, u32 BufferLength);
ErrStatus eBuffercmp(u32* pBuffer, u32 BufferLength);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  SD_Error errorstatus;
  RETARGET_Configuration();           /* Retarget Related configuration                                     */
  
  printf("\n\r\n\r*** SDIO SD card PDMA example ***");

  while (1)
  {
    printf("\r\n\r\nInit SD...");
    errorstatus = SD_Init(&SDCardInfo); /* init SDIO                                                          */

    if (errorstatus != SD_OK)
    {
      printf("\nSD init fail: %d", errorstatus);
    }
    else
    {
      printf(" PASS");
      printf("\r\n\tCardType : %u", SDCardInfo.CardType);
      printf("\r\n\tCapacity : %u Bytes", SDCardInfo.CardCapacity);
      printf("\r\n\tBlockSize: %u", SDCardInfo.CardBlockSize);
      printf("\r\n\tRCA      : 0x%04x", SDCardInfo.RCA);
      printf("\r\n\tManufID  : %u", SDCardInfo.SD_cid.ManufacturerID);
    }

    NVIC_EnableIRQ(SDIO_IRQn);
    NVIC_EnableIRQ(PDMACH6_IRQn);   // SDIO_RX
    NVIC_EnableIRQ(PDMACH7_IRQn);   // SDIO_TX
    /* erase test */
    printf("\n\r\r\nErase SD...");

    errorstatus = SD_EraseTest();      /* Erase SD card                                                        */
    if (errorstatus != SD_OK)
    {
      printf(" FAIL[%d]",errorstatus);
    }
    else
    {
      printf(" PASS");
    }
    printf("\n\rSingle block ...");  /* Single-block test                                                       */
    errorstatus = SD_SingleBlockTest();

    if (errorstatus != SD_OK)
    {
      printf(" FAIL[%d]",errorstatus);
    }
    else
    {
      printf(" PASS");
    }

    printf("\n\rMultiple block ...");  /* Multi-block test                                                       */
    errorstatus = SD_MultiBlockTest();

    if (errorstatus != SD_OK)
    {
      printf(" FAIL[%d]",errorstatus);
    }
    else
    {
      printf(" PASS");
    }
    getchar();
  }

}

/*********************************************************************************************************//**
  * @brief  Test the SD card erase operation.
  * @retval None
  ***********************************************************************************************************/
SD_Error SD_EraseTest(void)
{
  SD_Error errorstatus;
  ErrStatus transferstatus;

  /* Erase multi-block from address 0x00 */
  errorstatus = SD_Erase(&SDCardInfo, 0x00, (BLK_SIZE * BLK_CNT));

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Read multi-block from address 0x00 */
  errorstatus = SD_ReadMultiBlocks(&SDCardInfo, 0x00, (u32*)Buffer_MultiBlock_Rx, BLK_SIZE, BLK_CNT);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Check the correctness of erased blocks */
  transferstatus = eBuffercmp((u32*)Buffer_MultiBlock_Rx, (BLK_BUF_SIZE / 4));

  if (transferstatus == SUCCESS)
  {
    return(SD_OK);
  }
  else
  {
    return(SD_ERROR);
  }
}

/*********************************************************************************************************//**
  * @brief  Test the SD card single block operations.
  * @retval None
  ***********************************************************************************************************/
SD_Error SD_SingleBlockTest(void)
{
  SD_Error errorstatus;
  ErrStatus transferstatus;

  /* Fill the buffer to send */
  Fill_Buffer(Buffer_Block_Tx, BLK_SIZE, 0x0F);

  /* Write one block on address 0x00 */
  errorstatus = SD_WriteBlock(&SDCardInfo, 0x00, Buffer_Block_Tx, BLK_SIZE);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Read one block from address 0x00 */
  errorstatus = SD_ReadBlock(&SDCardInfo, 0x00, Buffer_Block_Rx, BLK_SIZE);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Check the correctness of written data */
  transferstatus = Buffercmp(Buffer_Block_Tx, Buffer_Block_Rx, (BLK_SIZE / 4));

  if (transferstatus == SUCCESS)
  {
    return(SD_OK);
  }
  else
  {
    return(SD_ERROR);
  }
}

/*********************************************************************************************************//**
  * @brief  Test the SD card multi-block operations.
  * @retval None
  ***********************************************************************************************************/
SD_Error SD_MultiBlockTest(void)
{
  SD_Error errorstatus;
  ErrStatus transferstatus;

  /* Fill the buffer to send */
  Fill_Buffer((u32*)Buffer_MultiBlock_Tx, BLK_BUF_SIZE, 0x00);

  /* Write multi-block on address 0x00 */
  errorstatus = SD_WriteMultiBlocks(&SDCardInfo, 0x00, Buffer_MultiBlock_Tx, BLK_SIZE, BLK_CNT);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Read multi-block from address 0x00 */
  errorstatus = SD_ReadMultiBlocks(&SDCardInfo, 0x00, Buffer_MultiBlock_Rx, BLK_SIZE, BLK_CNT);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Check the correctness of written data */
  transferstatus = Buffercmp(Buffer_MultiBlock_Tx, Buffer_MultiBlock_Rx, (BLK_BUF_SIZE / 4));

  if (transferstatus == SUCCESS)
  {
    return(SD_OK);
  }
  else
  {
    return(SD_ERROR);
  }
}

/*********************************************************************************************************//**
  * @brief  Check if a buffer has all its values are equal to 0x00 or 0xFF.
  * @param  pBuffer: buffer to be compared.
  * @param  BufferLength: buffer's length
  * @return The result of erase buff comparsion.
  ***********************************************************************************************************/
ErrStatus eBuffercmp(u32* pBuffer, u32 BufferLength)
{
  while (BufferLength--)
  {
    /* In some SD cards the erased state is 0xFF, in others it's 0x00 */
    if ((*pBuffer != 0xFFFFFFFF) && (*pBuffer != 0x00000000))
    {
      return ERROR;
    }

    pBuffer++;
  }

  return SUCCESS;
}

/*********************************************************************************************************//**
  * @brief  Fill buffer with user predefined data.
  * @param  pBuffer: pointer on the Buffer to fill
  * @param  BufferLength: size of the buffer to fill
  * @param  Offset: first value to fill on the Buffer
  * * @retval None
  ***********************************************************************************************************/
void Fill_Buffer(u32 *pBuffer, u32 BufferLength, u32 Offset)
{
  u32 index = 0;

  /* Put in global buffer same values */
  for (index = 0; index < BufferLength; index++)
  {
    pBuffer[index] = 0x5A5AA5A5;
  }
}

/*********************************************************************************************************//**
  * @brief  Compare two buffers.
  * @param  pBuffer1, pBuffer2: buffers to be compared.
  * @param  BufferLength: buffer's length
  * @return The result of two buff comparsion.
  ***********************************************************************************************************/
ErrStatus Buffercmp(u32* pBuffer1, u32* pBuffer2, u32 BufferLength)
{
  while (BufferLength--)
  {
    if (*pBuffer1 != *pBuffer2)
    {
      return ERROR;
    }

    pBuffer1++;
    pBuffer2++;
  }

  return SUCCESS;
}

#if (HT32_LIB_DEBUG == 1)
/*********************************************************************************************************//**
  * @brief  Report both the error name of the source file and the source line number.
  * @param  filename: pointer to the source file name.
  * @param  uline: error line source number.
  * @retval None
  ***********************************************************************************************************/
void assert_error(u8* filename, u32 uline)
{
  /*
     This function is called by IP library that the invalid parameters has been passed to the library API.
     Debug message can be added here.
     Example: printf("Parameter Error: file %s on line %d\r\n", filename, uline);
  */

  while (1)
  {
  }
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
