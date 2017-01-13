/*********************************************************************************************************//**
 * @file    spi_flash.c
 * @version $Rev:: 923          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides a set of functions needed to manage the
 *          communication between SPI peripheral and SPI MX25L1606E FLASH.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "spi_flash.h"
#ifndef SPI_FLASH_AUTO

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup SPI_FLASH SPI_FLASH
  * @brief This file provides a set of functions needed to manage the
  *        communication between SPI peripheral and SPI MX25L1606E FLASH.
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_Exported_Functions SPI FLASH exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Initializes peripherals used by the SPI flash driver.
  * @retval None
  ***********************************************************************************************************/
u32 SPI_FLASH_Init(void)
{
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

  return TRUE;
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH sector.
  * @param  SectorAddr: address of the sector to erase.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_SectorErase(u32 SectorAddr)
{
  /* Send write enable instruction                                                                          */
  SPI_FLASH_WriteEnable();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Sector Erase" instruction                                                                        */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_SE);
  /* Send high byte address of SectorAddr                                                                   */
  SPI_FLASH_SendByte((SectorAddr & 0xFF0000) >> 16);
  /* Send medium byte address of SectorAddr                                                                 */
  SPI_FLASH_SendByte((SectorAddr & 0xFF00) >> 8);
  /* Send low byte address of SectorAddr                                                                    */
  SPI_FLASH_SendByte(SectorAddr & 0xFF);
  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH block.
  * @param  BlockAddr: address of the block to erase.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BlockErase(u32 BlockAddr)
{
  /* Send write enable instruction                                                                          */
  SPI_FLASH_WriteEnable();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Block Erase" instruction                                                                         */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_BE);
  /* Send high byte address of BlockAddr                                                                    */
  SPI_FLASH_SendByte((BlockAddr & 0xFF0000) >> 16);
  /* Send medium byte address of BlockAddr                                                                  */
  SPI_FLASH_SendByte((BlockAddr & 0xFF00) >> 8);
  /* Send low byte address of BlockAddr                                                                     */
  SPI_FLASH_SendByte(BlockAddr & 0xFF);
  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Erases the entire FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_ChipErase(void)
{
  /* Send write enable instruction                                                                          */
  SPI_FLASH_WriteEnable();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Chip Erase" instruction                                                                          */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_CE);
  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH with a single WRITE cycle.
  * @param  WriteBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_PageWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  /* Enable the write access to the FLASH                                                                   */
  SPI_FLASH_WriteEnable();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Page Program" instruction                                                                        */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_WRITE);
  /* Send high byte address of WriteAddr                                                                    */
  SPI_FLASH_SendByte((WriteAddr & 0xFF0000) >> 16);
  /* Send medium byte address of WriteAddr                                                                  */
  SPI_FLASH_SendByte((WriteAddr & 0xFF00) >> 8);
  /* Send low byte address of WriteAddr                                                                     */
  SPI_FLASH_SendByte(WriteAddr & 0xFF);

  while (NumOfWriteByte--)
  {
    /* Send the current byte                                                                                */
    SPI_FLASH_SendByte(*WriteBuffer);
    /* Point on the next byte to be written                                                                 */
    WriteBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the end of Flash writing                                                                          */
  SPI_FLASH_WaitForWriteEnd();
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
  u8 NumOfSingle = 0, Addr = 0, Count = 0, tmp = 0;
  u16 NumOfPage = 0;

  Addr = WriteAddr % SPI_FLASH_PAGESIZE;
  Count = SPI_FLASH_PAGESIZE - Addr;
  NumOfPage =  NumOfWriteByte / SPI_FLASH_PAGESIZE;
  NumOfSingle = NumOfWriteByte % SPI_FLASH_PAGESIZE;

  if (Addr == 0)
  {
    if (NumOfPage == 0)
    {
      SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, NumOfWriteByte);
    }
    else
    {
      while (NumOfPage--)
      {
        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, SPI_FLASH_PAGESIZE);
        WriteAddr +=  SPI_FLASH_PAGESIZE;
        WriteBuffer += SPI_FLASH_PAGESIZE;
      }
      if (NumOfSingle)
      {
        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, NumOfSingle);
      }
    }
  }
  else
  {
    if (NumOfPage == 0)
    {
      if (NumOfSingle > Count)
      {
        tmp = NumOfSingle - Count;

        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, Count);
        WriteAddr +=  Count;
        WriteBuffer += Count;

        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, tmp);
      }
      else
      {
        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, NumOfWriteByte);
      }
    }
    else
    {
      NumOfWriteByte -= Count;
      NumOfPage =  NumOfWriteByte / SPI_FLASH_PAGESIZE;
      NumOfSingle = NumOfWriteByte % SPI_FLASH_PAGESIZE;

      SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, Count);
      WriteAddr +=  Count;
      WriteBuffer += Count;

      while (NumOfPage--)
      {
        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, SPI_FLASH_PAGESIZE);
        WriteAddr +=  SPI_FLASH_PAGESIZE;
        WriteBuffer += SPI_FLASH_PAGESIZE;
      }

      if (NumOfSingle)
      {
        SPI_FLASH_PageWrite(WriteBuffer, WriteAddr, NumOfSingle);
      }
     }
   }
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
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read from Memory " instruction                                                                   */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_READ);
  /* Send high byte address of ReadAddr                                                                     */
  SPI_FLASH_SendByte((ReadAddr & 0xFF0000) >> 16);
  /* Send medium byte address of ReadAddr                                                                   */
  SPI_FLASH_SendByte((ReadAddr& 0xFF00) >> 8);
  /* Send low byte address of ReadAddr                                                                      */
  SPI_FLASH_SendByte(ReadAddr & 0xFF);

  while (NumOfReadByte--)
  {
    /* Read a byte from the FLASH                                                                           */
    *ReadBuffer = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);
    /* Point to the next location where the byte read will be saved                                         */
    ReadBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Reads a block of data from the FLASH using Dual Output Mode.
  * @param  ReadBuffer : pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr : FLASH's internal address to read from.
  * @param  NumOfReadByte : number of half words to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferDualRead(u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read from Memory " instruction                                                                   */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_DREAD);
  /* Send high byte address of ReadAddr                                                                     */
  SPI_FLASH_SendByte((ReadAddr & 0xFF0000) >> 16);
  /* Send medium byte address of ReadAddr                                                                   */
  SPI_FLASH_SendByte((ReadAddr& 0xFF00) >> 8);
  /* Send low byte address of ReadAddr                                                                      */
  SPI_FLASH_SendByte(ReadAddr & 0xFF);
  /* Send dummy byte                                                                                        */
  SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);

  /* Enable Dual Port                                                                                       */
  SPI_DUALCmd(FLASH_SPI, ENABLE);

  while (NumOfReadByte--)
  {
    /* Read a byte from the FLASH                                                                           */
    *ReadBuffer = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);
    /* Point to the next location where the byte read will be saved                                         */
    ReadBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Disable Dual Port                                                                                      */
  SPI_DUALCmd(FLASH_SPI, DISABLE);
}

/*********************************************************************************************************//**
  * @brief  Reads JEDEC ID.
  * @retval JEDEC ID value.
  ***********************************************************************************************************/
u32 SPI_FLASH_ReadJEDECID(void)
{
  u32 Temp = 0, Temp0 = 0, Temp1 = 0, Temp2 = 0;

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "JEDEC Read-ID" instruction                                                                       */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_RDID);

  /* Read a byte from the FLASH                                                                             */
  Temp0 = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);

  /* Read a byte from the FLASH                                                                             */
  Temp1 = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);

  /* Read a byte from the FLASH                                                                             */
  Temp2 = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  Temp = (Temp0 << 16) | (Temp1 << 8) | Temp2;

  return Temp;

}

/*********************************************************************************************************//**
  * @brief  Writes the new value to the Status Register.
  * @param  Value : the new value to be written to the Status Register.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteStatus(u32 Value)
{
  SPI_FLASH_WriteEnable();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Status Register" instruction                                                               */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_WRSR);
  /* Writes to the Status Register                                                                          */
  SPI_FLASH_SendByte(Value);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Sends a byte through the SPI interface and return the byte received from the SPI bus.
  * @param  byte : byte to send.
  * @retval The value of the received byte.
  ***********************************************************************************************************/
u16 SPI_FLASH_SendByte(u8 byte)
{
  /* Loop while Tx buffer register is empty                                                                 */
  while (!SPI_GetFlagStatus(FLASH_SPI, SPI_FLAG_TXBE));

  /* Send byte through the SPIx peripheral                                                                  */
  SPI_SendData(FLASH_SPI, byte);

  /* Loop while Rx is not empty                                                                             */
  while (!SPI_GetFlagStatus(FLASH_SPI, SPI_FLAG_RXBNE));

  /* Return the byte read from the SPI                                                                      */
  return SPI_ReceiveData(FLASH_SPI);
}

/*********************************************************************************************************//**
  * @brief  Enables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteEnable(void)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Enable" instruction                                                                        */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_WREN);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Disables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteDisable(void)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Disable" instruction                                                                       */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_WRDI);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Polls the status of the BUSY flag in the FLASH's status register and waits for the end of Flash
            writing.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WaitForWriteEnd(void)
{
  u8 FLASH_Status = 0;

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read Status Register" instruction                                                                */
  SPI_FLASH_SendByte(SPI_FLASH_CMD_RDSR);

  /* Loop as long as the busy flag is set                                                                   */
  do
  {
    /* Send a dummy byte to generate the clock to read the value of the status register                     */
    FLASH_Status = SPI_FLASH_SendByte(SPI_FLASH_DUMMY_BYTE);

  } while ((FLASH_Status & SPI_FLASH_BUSY_FLAG) == SET);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
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

/**
  * @}
  */
#else
  #include "spi_flash_auto.c"
#endif
