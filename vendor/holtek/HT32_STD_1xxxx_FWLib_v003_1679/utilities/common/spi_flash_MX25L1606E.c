/*********************************************************************************************************//**
 * @file    spi_flash_MX25L1606E.c
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

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


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH with a single WRITE cycle.
  * @param  WriteBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void MX25L1606E_PageWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  /* Enable the write access to the FLASH                                                                   */
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Page Program" instruction                                                                        */
  SPI_FLASH_SendByte_0(MX25L1606E_CMD_WRITE);
  /* Send high byte address of WriteAddr                                                                    */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF0000) >> 16);
  /* Send medium byte address of WriteAddr                                                                  */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF00) >> 8);
  /* Send low byte address of WriteAddr                                                                     */
  SPI_FLASH_SendByte_0(WriteAddr & 0xFF);

  while (NumOfWriteByte--)
  {
    /* Send the current byte                                                                                */
    SPI_FLASH_SendByte_0(*WriteBuffer);
    /* Point on the next byte to be written                                                                 */
    WriteBuffer++;
  }

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the end of Flash writing                                                                          */
  SPI_FLASH_WaitForWriteEnd_0();
}

/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH.
  * @param  WriteBuffer: pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr: FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void MX25L1606E_BufferWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  int i;
  u16 first_size, last_size, page_num;

  first_size = (MX25L1606E_PAGESIZE - (WriteAddr % MX25L1606E_PAGESIZE)) % MX25L1606E_PAGESIZE;

  if (first_size < NumOfWriteByte)
  {
    NumOfWriteByte -= first_size;
    page_num  = NumOfWriteByte / MX25L1606E_PAGESIZE;
    last_size = NumOfWriteByte % MX25L1606E_PAGESIZE;
  }
  else
  {
    first_size = NumOfWriteByte;
    page_num = 0;
    last_size = 0;
  }

  if (first_size)
  {
    MX25L1606E_PageWrite(WriteBuffer, WriteAddr, first_size);
    WriteAddr += first_size;
    WriteBuffer += first_size;
  }

  for (i = 0; i < page_num; i++)
  {
    MX25L1606E_PageWrite(WriteBuffer, WriteAddr, MX25L1606E_PAGESIZE);
    WriteAddr += MX25L1606E_PAGESIZE;
    WriteBuffer += MX25L1606E_PAGESIZE;
  }

  if (last_size)
  {
    MX25L1606E_PageWrite(WriteBuffer, WriteAddr, last_size);
  }
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
