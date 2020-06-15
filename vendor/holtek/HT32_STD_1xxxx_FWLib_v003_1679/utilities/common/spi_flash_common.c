/*********************************************************************************************************//**
 * @file    spi_flash_common.c
 * @version $Rev:: 10           $
 * @date    $Date:: 2017-05-15 #$
 * @brief   This file provides a set of functions needed to manage the
 *          communication between SPI peripheral and SPI FLASH.
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
#include "ht32_board.h"
#include "spi_flash_auto.h"
#include "spi_flash_common.h"

#include "spi_flash_MX25L1606E.h"
#include "spi_flash_MX25L1606E.c"

#include "spi_flash_SST25VF016B.h"
#include "spi_flash_SST25VF016B.c"

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


/* Private macro -------------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Private_Macro SPI_FLASH_AUTO private macros
  * @{
  */
#define CMD_CHIP_ERASE        (SPIFlash[sSPI_FLASH_Index].Cmd.ChipErase)
#define CMD_SECTOR_ERASE      (SPIFlash[sSPI_FLASH_Index].Cmd.SectorErase)
#define CMD_WRITE             (SPIFlash[sSPI_FLASH_Index].Cmd.Write)
#define CMD_READ              (SPIFlash[sSPI_FLASH_Index].Cmd.Read)
#define CMD_DUALREAD          (SPIFlash[sSPI_FLASH_Index].Cmd.DualRead)
#define CMD_WRITE_STATUS      (SPIFlash[sSPI_FLASH_Index].Cmd.WriteStatus)
#define CMD_REAFD_STATUS      (SPIFlash[sSPI_FLASH_Index].Cmd.ReadStatus)
#define CMD_WRITE_ENABLE      (SPIFlash[sSPI_FLASH_Index].Cmd.WriteEnable)
#define CMD_WRITE_DISABLE     (SPIFlash[sSPI_FLASH_Index].Cmd.WriteDisable)
/**
  * @}
  */

/* Global variables ----------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Global_Variable SPI_FLASH_AUTO global variables
  * @{
  */
s32 sSPI_FLASH_Index = -1;
s32 sSPI_FLASH_Size = -1;
const SPI_Flash_TypeDef SPIFlash[SPI_FALSH_NUM] =
{
  {
    SPI_FLASH_ReadJEDECID_0,
    NULL,
    SPI_FLASH_ChipErase_0,
    SPI_FLASH_SectorErase_0,
    MX25L1606E_BufferWrite,
    SPI_FLASH_BufferRead_0,
#if (DUAL_READ_ENABLE==1)
    SPI_FLASH_BufferDualRead_0,
#else
    NULL,
#endif
    SPI_FLASH_WriteStatus_0,
    SPI_FLASH_WriteEnable_0,
    SPI_FLASH_WriteDisable_0,
    SPI_FLASH_WaitForWriteEnd_0,
    {
    MX25L1606E_CMD_CE,    MX25L1606E_CMD_SE,
    SPI_FLASH_CMD_NULL,
    MX25L1606E_CMD_READ,  MX25L1606E_CMD_DREAD,
    MX25L1606E_CMD_WRSR,  MX25L1606E_CMD_RDSR,
    MX25L1606E_CMD_WREN,  MX25L1606E_CMD_WRDI
    },
    MX25L1606E_JEDEC_ID,  MX25L1606E_JEDEC_IDMASK,
    1024 * 1024 * 2
  },
  {
    SPI_FLASH_ReadJEDECID_0,
    NULL,
    SPI_FLASH_ChipErase_0,
    SPI_FLASH_SectorErase_0,
    SST25VF016B_BufferWrite,
    SPI_FLASH_BufferRead_0,
    NULL,
    SPI_FLASH_WriteStatus_0,
    SPI_FLASH_WriteEnable_0,
    SPI_FLASH_WriteDisable_0,
    SPI_FLASH_WaitForWriteEnd_0,
    {
    SST25V016B_CMD_CE,    SST25V016B_CMD_SE,
    SPI_FLASH_CMD_NULL,
    SST25V016B_CMD_READ,  SPI_FLASH_CMD_NULL,
    SST25V016B_CMD_WRSR,  SST25V016B_CMD_RDSR,
    SST25V016B_CMD_WREN,  SST25V016B_CMD_WRDI
    },
    SST25V016B_JEDEC_ID,  SST25V016B_JEDEC_IDMASK,
    1024 * 1024 * 2
  },
};
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Reads JEDEC ID.
  * @retval JEDEC ID value.
  ***********************************************************************************************************/
u32 SPI_FLASH_ReadJEDECID_0(void)
{
  u32 Temp = 0, Temp0 = 0, Temp1 = 0, Temp2 = 0;

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "JEDEC Read-ID" instruction                                                                       */
  SPI_FLASH_SendByte_0(SPI_FLASH_CMD_JEDECID_0);

  /* Read a byte from the FLASH                                                                             */
  Temp0 = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  /* Read a byte from the FLASH                                                                             */
  Temp1 = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  /* Read a byte from the FLASH                                                                             */
  Temp2 = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  Temp = (Temp0 << 16) | (Temp1 << 8) | Temp2;

  return Temp;
}

/*********************************************************************************************************//**
  * @brief  Erases the entire FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_ChipErase_0(void)
{
  /* Send write enable instruction                                                                          */
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Chip Erase" instruction                                                                          */
  SPI_FLASH_SendByte_0(CMD_CHIP_ERASE);
  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd_0();
}

/*********************************************************************************************************//**
  * @brief  Erases the specified FLASH sector.
  * @param  SectorAddr: address of the sector to erase.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_SectorErase_0(u32 SectorAddr)
{
  /* Send write enable instruction                                                                          */
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Sector Erase" instruction                                                                        */
  SPI_FLASH_SendByte_0(CMD_SECTOR_ERASE);
  /* Send high byte address of SectorAddr                                                                   */
  SPI_FLASH_SendByte_0((SectorAddr & 0xFF0000) >> 16);
  /* Send medium byte address of SectorAddr                                                                 */
  SPI_FLASH_SendByte_0((SectorAddr & 0xFF00) >> 8);
  /* Send low byte address of SectorAddr                                                                    */
  SPI_FLASH_SendByte_0(SectorAddr & 0xFF);
  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd_0();
}

/*********************************************************************************************************//**
  * @brief  Reads a block of data from the FLASH.
  * @param  ReadBuffer : pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr : FLASH's internal address to read from.
  * @param  NumOfReadByte : number of bytes to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferRead_0(u8* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read from Memory " instruction                                                                   */
  SPI_FLASH_SendByte_0(CMD_READ);

  /* Send high byte address of ReadAddr                                                                     */
  SPI_FLASH_SendByte_0((ReadAddr & 0xFF0000) >> 16);
  /* Send medium byte address of ReadAddr                                                                   */
  SPI_FLASH_SendByte_0((ReadAddr& 0xFF00) >> 8);
  /* Send low byte address of ReadAddr                                                                      */
  SPI_FLASH_SendByte_0(ReadAddr & 0xFF);

  SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  while (NumOfReadByte--)
  {
    /* Read a byte from the FLASH                                                                           */
    *ReadBuffer = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);
    /* Point to the next location where the byte read will be saved                                         */
    ReadBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

#if (DUAL_READ_ENABLE==1)
/*********************************************************************************************************//**
  * @brief  Reads a block of data from the FLASH using Dual Output Mode.
  * @param  ReadBuffer : pointer to the buffer that receives the data read from the FLASH.
  * @param  ReadAddr : FLASH's internal address to read from.
  * @param  NumOfReadByte : number of half words to read from the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_BufferDualRead_0(u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read from Memory " instruction                                                                   */
  SPI_FLASH_SendByte_0(CMD_DUALREAD);
  /* Send high byte address of ReadAddr                                                                     */
  SPI_FLASH_SendByte_0((ReadAddr & 0xFF0000) >> 16);
  /* Send medium byte address of ReadAddr                                                                   */
  SPI_FLASH_SendByte_0((ReadAddr& 0xFF00) >> 8);
  /* Send low byte address of ReadAddr                                                                      */
  SPI_FLASH_SendByte_0(ReadAddr & 0xFF);

  /* Enable Dual Port                                                                                       */
  SPI_DUALCmd(FLASH_SPI, ENABLE);

  /* Send dummy byte                                                                                        */
  SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  while (NumOfReadByte--)
  {
    /* Read a byte from the FLASH                                                                           */
    *ReadBuffer = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);
    /* Point to the next location where the byte read will be saved                                         */
    ReadBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Disable Dual Port                                                                                      */
  SPI_DUALCmd(FLASH_SPI, DISABLE);
}
#endif

/*********************************************************************************************************//**
  * @brief  Writes the new value to the Status Register.
  * @param  Value : the new value to be written to the Status Register.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteStatus_0(u8 Value)
{
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Status Register" instruction                                                               */
  SPI_FLASH_SendByte_0(CMD_WRITE_STATUS);
  /* Writes to the Status Register                                                                          */
  SPI_FLASH_SendByte_0(Value);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Enables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteEnable_0(void)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Enable" instruction                                                                        */
  SPI_FLASH_SendByte_0(CMD_WRITE_ENABLE);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Disables the write access to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WriteDisable_0(void)
{
  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Write Disable" instruction                                                                       */
  SPI_FLASH_SendByte_0(CMD_WRITE_DISABLE);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Polls the status of the BUSY flag in the FLASH's status register and waits for the end of Flash
            writing.
  * @retval None
  ***********************************************************************************************************/
void SPI_FLASH_WaitForWriteEnd_0(void)
{
  u8 FLASH_Status = 0;

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();

  /* Send "Read Status Register" instruction                                                                */
  SPI_FLASH_SendByte_0(CMD_REAFD_STATUS);

  /* Loop as long as the busy flag is set                                                                   */
  do
  {
    /* Send a dummy byte to generate the clock to read the value of the status register                     */
    FLASH_Status = SPI_FLASH_SendByte_0(SPI_FLASH_DUMMY_BYTE);

  } while ((FLASH_Status & SPI_FLASH_BUSY_FLAG) == SET);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();
}

/*********************************************************************************************************//**
  * @brief  Sends a byte through the SPI interface and return the byte received from the SPI bus.
  * @param  byte : byte to send.
  * @retval The value of the received byte.
  ***********************************************************************************************************/
u16 SPI_FLASH_SendByte_0(u8 byte)
{
  /* Loop while Tx buffer register is empty                                                                 */
  while (!SPI_GetFlagStatus(FLASH_SPI, SPI_FLAG_TXBE));
  //while ((FLASH_SPI->SR & SPI_FLAG_TXBE) == 0);

  /* Send byte through the SPIx peripheral                                                                  */
  SPI_SendData(FLASH_SPI, byte);
  //FLASH_SPI->DR = byte;

  /* Loop while Rx is not empty                                                                             */
  while (!SPI_GetFlagStatus(FLASH_SPI, SPI_FLAG_RXBNE));
  //while ((FLASH_SPI->SR & SPI_FLAG_RXBNE) == 0);

  /* Return the byte read from the SPI                                                                      */
  return SPI_ReceiveData(FLASH_SPI);
  //return (u16)(FLASH_SPI->DR);
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
