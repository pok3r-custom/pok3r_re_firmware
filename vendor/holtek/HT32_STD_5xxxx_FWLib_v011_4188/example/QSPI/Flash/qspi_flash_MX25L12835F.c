/*********************************************************************************************************//**
 * @file    qspi_flash_MX25L12835F.c
 * @version $Rev:: 3312         $
 * @date    $Date:: 2018-12-12 #$
 * @brief   This file provides a set of functions needed to manage the
 *          communication between QSPI peripheral and SPI MX25L12835F FLASH.
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

 /** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup QSPI_Examples QSPI
  * @{
  */

/** @addtogroup Flash
  * @{
  */

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "qspi_flash_MX25L12835F.h"

/* Private define ------------------------------------------------------------------------------------------*/
#define QSPI_FLASH_PageSize 256

#define WRITE      0x02  /* Page Program instruction */
#define WREN       0x06  /* Write enable instruction */
#define WRR        0x01  /* Write Status Register instruction */

#define READ       0x03  /* Read from Memory instruction */
#define RDSR       0x05  /* Read Status Register instruction  */
#define RDID       0x9F  /* Read identification */
#define REMS       0x90  /* Read electronic manufacturer & device ID */
#define F_READ     0x0B  /* Read date bytes at high speed */

#define FRDO       0x3B  /* Read Memory with Dual Output */
#define DIOR       0xBB  /* Read Memory with 2xI/O Output */
#define QIOR       0xEB  /* Read Memory with 4xI/O Output */
#define QOR        0x6B  /* Read Memory with Quad Output */
#define QPP        0x32  /* Quad Page program */

#define SE         0x20  /* Sector Erase instruction */
#define BE64K      0x64  /* Block Erase 64KB instruction */
#define BE32K      0x52  /* Block Erase 32KB instruction */
#define CE         0xC7  /* Chip Erase instruction */
#define EQPI       0x35  /* QPI mode enable */
#define RSTQPI     0xF5  /* QPI mode disable */
#define WIP_Flag   0x01  /* Write In Progress (WIP) flag */

/* Private variables ---------------------------------------------------------------------------------------*/
SPI_InitTypeDef SPI_InitStructure;

/* Private const variables ---------------------------------------------------------------------------------*/
#define Dummy_Byte 0x00

/* Private functions type-----------------------------------------------------------------------------------*/
u8 _QSPI_FLASH_SendByte(u8 byte);
u16 _QSPI_FLASH_Send(u16 data);
void _QSPI_FLASH_WriteEnable(void);
void _QSPI_FLASH_WaitForWriteEnd(void);
void _QSPI_FLASH_WREN(void);

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Initializes peripherals used by the QSPI flash driver.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_Init(void)
{
  SPI_InitStructure.SPI_Mode = SPI_MASTER;
  SPI_InitStructure.SPI_FIFO = SPI_FIFO_DISABLE;
  SPI_InitStructure.SPI_DataLength = SPI_DATALENGTH_8;
  SPI_InitStructure.SPI_SELMode = SPI_SEL_SOFTWARE;
  SPI_InitStructure.SPI_SELPolarity = SPI_SELPOLARITY_LOW;
  SPI_InitStructure.SPI_FirstBit = SPI_FIRSTBIT_MSB;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_LOW;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_FIRST;
  SPI_InitStructure.SPI_RxFIFOTriggerLevel = 1;
  SPI_InitStructure.SPI_TxFIFOTriggerLevel = 0;
  SPI_InitStructure.SPI_ClockPrescaler = 2;
  SPI_Init(FLASH_QSPI, &SPI_InitStructure);

  SPI_SELOutputCmd(FLASH_QSPI, ENABLE);

  SPI_Cmd(FLASH_QSPI, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH sector.
  * @param  SectorAddr: address of the sector to erase.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_SE(u32 SectorAddr)
{
  /* Send write enable instruction */
  _QSPI_FLASH_WriteEnable();

  /* Sector Erase */
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);
  /* Send Sector Erase instruction */
  _QSPI_FLASH_SendByte(SE);
  /* Send SectorAddr high nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF0000) >> 16);
  /* Send SectorAddr medium nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF00) >> 8);
  /* Send SectorAddr low nibble address byte */
  _QSPI_FLASH_SendByte(SectorAddr & 0xFF);
  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH block(32K).
  * @param  SectorAddr: address of the block to erase.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_BE32K(u32 SectorAddr)
{
  /* Send write enable instruction */
  _QSPI_FLASH_WriteEnable();

  /* Sector Erase */
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);
  /* Send Sector Erase instruction */
  _QSPI_FLASH_SendByte(BE32K);
  /* Send SectorAddr high nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF0000) >> 16);
  /* Send SectorAddr medium nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF00) >> 8);
  /* Send SectorAddr low nibble address byte */
  _QSPI_FLASH_SendByte(SectorAddr & 0xFF);
  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH block(64K).
  * @param  SectorAddr: address of the block to erase.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_BE64K(u32 SectorAddr)
{
  /* Send write enable instruction */
  _QSPI_FLASH_WriteEnable();

  /* Sector Erase */
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);
  /* Send Sector Erase instruction */
  _QSPI_FLASH_SendByte(BE64K);
  /* Send SectorAddr high nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF0000) >> 16);
  /* Send SectorAddr medium nibble address byte */
  _QSPI_FLASH_SendByte((SectorAddr & 0xFF00) >> 8);
  /* Send SectorAddr low nibble address byte */
  _QSPI_FLASH_SendByte(SectorAddr & 0xFF);
  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}
/*********************************************************************************************************//**
  * @brief  Erases the entire FLASH.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_ChipErase(void)
{
  /* Send write enable instruction */
  _QSPI_FLASH_WriteEnable();

  /* Bulk Erase */
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);
  /* Send Chip Erase instruction  */
  _QSPI_FLASH_SendByte(CE);
  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Read electronic manufacturer & device ID.
  * @retval None
  ***********************************************************************************************************/
u32 QSPI_FLASH_ReadID(void)
{
  u16 Temp = 0;
  u8 Temp0 = 0, Temp1 = 0;

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send "READ ID " instruction */
  _QSPI_FLASH_SendByte(REMS);

  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(0);

  /* Read a byte from the FLASH */
  Temp0 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Read a byte from the FLASH */
  Temp1 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  Temp = (Temp0 << 8) | (Temp1);
  return Temp;

}

/*********************************************************************************************************//**
  * @brief  Read identification.
  * @retval None
  ***********************************************************************************************************/
u32 QSPI_FLASH_RDID(void)
{
  u32 Temp = 0;
  u8 Temp0 = 0, Temp1 = 0, Temp2 = 0, Temp3 = 0;

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send "READ ID " instruction */
  _QSPI_FLASH_SendByte(RDID);

  /* Read a byte from the FLASH */
  Temp0 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Read a byte from the FLASH */
  Temp1 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Read a byte from the FLASH */
  Temp2 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Read a byte from the FLASH */
  Temp3 = _QSPI_FLASH_SendByte(Dummy_Byte);

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  Temp = (Temp0 << 24) | (Temp1 << 16) | (Temp2 << 8) | Temp3;
  return Temp;
}

/*********************************************************************************************************//**
  * @brief  Write status/configuration register.
  * @param  Status_data: status register.
  * @param  Configuration_data: configuration register.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_WRR(u8 Status_data, u8 Configuration_data)
{
  _QSPI_FLASH_WREN();

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(WRR);

  _QSPI_FLASH_SendByte(Status_data);

  _QSPI_FLASH_SendByte(Configuration_data);

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Quard READ. Buffer's type is half word.
  * @param  pBuffer: pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr: FLASH's internal address to read from.
  * @param  NumByteToRead: number of bytes to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_QOR(u16* pBuffer, u32 ReadAddr, u16 NumByteToRead)
{
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(QOR);

  /* Send ReadAddr high nibble address byte to read from */
  _QSPI_FLASH_SendByte((ReadAddr & 0xFF0000) >> 16);
  /* Send ReadAddr medium nibble address byte to read from */
  _QSPI_FLASH_SendByte((ReadAddr& 0xFF00) >> 8);
  /* Send ReadAddr low nibble address byte to read from */
  _QSPI_FLASH_SendByte(ReadAddr & 0xFF);

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 4;

  //enable QSPI quad
  FLASH_QSPI->CR0 |= 0x20000;

  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(Dummy_Byte);

  //Quad mode: Send 4 clocks at a time, receive 16 bits data (2 bytes)
  NumByteToRead = (NumByteToRead+1)/2;

  while(NumByteToRead--) /* while there is data to be read */
  {
    /* Read 2 bytes from the FLASH */
    *pBuffer = _QSPI_FLASH_Send(Dummy_Byte);
    /* Point to the next location where the byte read will be saved */
    pBuffer++;
  }

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  //disable QSPI quad
  FLASH_QSPI->CR0 &= ~0x20000;

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 8;
}

/*********************************************************************************************************//**
  * @brief  Quard Write. Buffer's type is half word.
  * @param  pBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumByteToWrite : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_QPP(u16* pBuffer, u32 WriteAddr, u16 NumByteToWrite)
{
  /* Enable the write access to the FLASH */
  _QSPI_FLASH_WriteEnable();

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(QPP);

  /* Send WriteAddr high nibble address byte to write to */
  _QSPI_FLASH_SendByte((WriteAddr & 0xFF0000) >> 16);
  /* Send WriteAddr medium nibble address byte to write to */
  _QSPI_FLASH_SendByte((WriteAddr & 0xFF00) >> 8);
  /* Send WriteAddr low nibble address byte to write to */
  _QSPI_FLASH_SendByte(WriteAddr & 0xFF);

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 4;

  //(IO out)|(enable QSPI quad)
  FLASH_QSPI->CR0 |= 0x30000;

  NumByteToWrite = (NumByteToWrite+1)/2;

  /* while there is data to be written on the FLASH */
  while(NumByteToWrite--)
  {
    /* Send the current word */
    _QSPI_FLASH_Send(*pBuffer); //Send 4 clocks at a time, 16 bits (1 word)
    /* Point on the next byte to be written */
    pBuffer++;
  }

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  //disable QSPI quad
  FLASH_QSPI->CR0 &= ~0x30000;

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 8;

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Quard Write. Buffer's type is byte.
  * @param  pBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumByteToWrite : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_BYTE_QPP(u8* pBuffer, u32 WriteAddr, u16 NumByteToWrite)
{
  /* Enable the write access to the FLASH */
  _QSPI_FLASH_WriteEnable();

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(QPP);

  /* Send WriteAddr high nibble address byte to write to */
  _QSPI_FLASH_SendByte((WriteAddr & 0xFF0000) >> 16);
  /* Send WriteAddr medium nibble address byte to write to */
  _QSPI_FLASH_SendByte((WriteAddr & 0xFF00) >> 8);
  /* Send WriteAddr low nibble address byte to write to */
  _QSPI_FLASH_SendByte(WriteAddr & 0xFF);

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 2; //Send a byte at a time

  //(IO out)|(enable QSPI quad)
  FLASH_QSPI->CR0 |= 0x30000;

  /* while there is data to be written on the FLASH */
  while(NumByteToWrite--)
  {
    /* Send the current word */
    _QSPI_FLASH_SendByte(*pBuffer); //Quad mode: Send 2 clocks at a time, receive 8 bits data (1 bytes)
    /* Point on the next byte to be written */
    pBuffer++;
  }

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  //disable QSPI quad
  FLASH_QSPI->CR0 &= ~0x30000;

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 8;

  /* Wait the end of Flash writing */
  _QSPI_FLASH_WaitForWriteEnd();
}

/*********************************************************************************************************//**
  * @brief  Quard READ. Buffer's type is byte.
  * @param  pBuffer: pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr: FLASH's internal address to read from.
  * @param  NumByteToRead: number of bytes to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void QSPI_FLASH_BYTE_QOR(u8* pBuffer, u32 ReadAddr, u16 NumByteToRead)
{
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(QOR);

  /* Send ReadAddr high nibble address byte to read from */
  _QSPI_FLASH_SendByte((ReadAddr & 0xFF0000) >> 16);
  /* Send ReadAddr medium nibble address byte to read from */
  _QSPI_FLASH_SendByte((ReadAddr& 0xFF00) >> 8);
  /* Send ReadAddr low nibble address byte to read from */
  _QSPI_FLASH_SendByte(ReadAddr & 0xFF);

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 2;

  //enable QSPI quad
  FLASH_QSPI->CR0 |= 0x20000;


  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(Dummy_Byte);
  _QSPI_FLASH_SendByte(Dummy_Byte);

  while(NumByteToRead--) /* while there is data to be read */
  {
    /* Read 2 bytes from the FLASH */
    *pBuffer = _QSPI_FLASH_SendByte(Dummy_Byte);
    /* Point to the next location where the byte read will be saved */
    pBuffer++;
  }

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);

  //disable QSPI quad
  FLASH_QSPI->CR0 &= ~0x20000;

  FLASH_QSPI->CR1 &= 0xfffffff0;
  FLASH_QSPI->CR1 |= 8;
}

/*********************************************************************************************************//**
  * @brief  Sends a byte through the QSPI interface and return 2 bytes received from the QSPI bus in Dual mode.
  * @param  byte: byte to send.
  * @retval The value of the received byte.
  ***********************************************************************************************************/
u8 _QSPI_FLASH_SendByte(u8 byte)
{
  /* Loop while DR register in not emplty */
  while(!SPI_GetFlagStatus(FLASH_QSPI, SPI_FLAG_TXBE));

  /* Send byte through the FLASH_QSPI peripheral */
  SPI_SendData(FLASH_QSPI, byte);

  /* Wait to receive a byte */
  while(!SPI_GetFlagStatus(FLASH_QSPI, SPI_FLAG_RXBNE));

  /* Return the byte read from the QSPI bus */
  return ((u8)SPI_ReceiveData(FLASH_QSPI));
}

/*********************************************************************************************************//**
  * @brief  Sends data through the QSPI interface and return 2 bytes received from the QSPI bus.
  * @param  data: byte to send.
  * @retval The value of the received byte.
  ***********************************************************************************************************/
u16 _QSPI_FLASH_Send(u16 data)
{
  /* Loop while DR register in not emplty */
  while(!SPI_GetFlagStatus(FLASH_QSPI, SPI_FLAG_TXBE));

  /* Send byte through the FLASH_QSPI peripheral */
  SPI_SendData(FLASH_QSPI, data);

  /* Wait to receive data */
  while(!SPI_GetFlagStatus(FLASH_QSPI, SPI_FLAG_RXBNE));

  /* Return the data from the QSPI bus */
  return SPI_ReceiveData(FLASH_QSPI);
}

/*********************************************************************************************************//**
  * @brief  Enables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void _QSPI_FLASH_WriteEnable(void)
{
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send "Write Enable" instruction */
  _QSPI_FLASH_SendByte(WREN);

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);
}

/*********************************************************************************************************//**
  * @brief  Polls the status of the Write In Progress (WIP) flag in the FLASH's status register and
            loop until write  opertaion has completed.
  * @retval None
  ***********************************************************************************************************/
void _QSPI_FLASH_WaitForWriteEnd(void)
{
  u8 FLASH_Status = 0;

  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send "Read Status Register" instruction */
  _QSPI_FLASH_SendByte(RDSR);
   //SPI_FIFOReset(FLASH_QSPI, SPI_FIFO_RX);
  /* Loop as long as the memory is busy with a write cycle */
  do
  {
    /* Send a dummy byte to generate the clock needed by the FLASH
    and put the value of the status register in FLASH_Status variable */
    FLASH_Status = _QSPI_FLASH_SendByte(Dummy_Byte);

  } while((FLASH_Status & WIP_Flag) == SET); /* Write in progress */

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);
}

/*********************************************************************************************************//**
  * @brief  Quard Write enable
  * @retval None
  ***********************************************************************************************************/
void _QSPI_FLASH_WREN(void)
{
  /* Select the FLASH: Chip Select low */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_ACTIVE);

  /* Send instruction */
  _QSPI_FLASH_SendByte(WREN);

  /* Deselect the FLASH: Chip Select high */
  SPI_SoftwareSELCmd(FLASH_QSPI, SPI_SEL_INACTIVE);
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
