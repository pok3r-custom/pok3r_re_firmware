/*********************************************************************************************************//**
 * @file    spi_flash_SST25VF016B.c
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   This file provides a set of functions needed to manage the
 *          communication between SPI peripheral and SPI SST25VF016B FLASH.
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
  * @brief  Writes one byte to the FLASH.
  * @param  DataByte : the data byte to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @retval None
  ***********************************************************************************************************/
void SST25VF016B_ByteWrite(u8 DataByte, u32 WriteAddr)
{
  /* Enable the write access to the FLASH                                                                   */
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Program one data byte " instruction                                                              */
  SPI_FLASH_SendByte_0(SST25V016B_CMD_BP);
  /* Send high byte address of WriteAddr                                                                    */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF0000) >> 16);
  /* Send medium byte address of WriteAddr                                                                  */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF00) >> 8);
  /* Send low byte address of WriteAddr                                                                     */
  SPI_FLASH_SendByte_0(WriteAddr & 0xFF);

  /* Send a byte to the FLASH                                                                               */
  SPI_FLASH_SendByte_0(DataByte);

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd_0();
}

/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH using Automatic Address Increment Programming.
  * @param  WriteBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SST25VF016B_AAIWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  u16 temp, NumOfWrite = NumOfWriteByte/2;

  /* Enable the write access to the FLASH                                                                   */
  SPI_FLASH_WriteEnable_0();

  /* Select the SPI FLASH                                                                                   */
  SPI_FLASH_SEL_ACTIVE();
  /* Send "Automatic Address Increment Programming" instruction                                             */
  SPI_FLASH_SendByte_0(SST25V016B_CMD_AAI);
  /* Send high byte address of WriteAddr                                                                    */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF0000) >> 16);
  /* Send medium byte address of WriteAddr                                                                  */
  SPI_FLASH_SendByte_0((WriteAddr & 0xFF00) >> 8);
  /* Send low byte address of WriteAddr                                                                     */
  SPI_FLASH_SendByte_0(WriteAddr & 0xFF);

  for (temp = 0; temp < 2; temp++)
  {
    /* Send the current byte                                                                                */
    SPI_FLASH_SendByte_0(*WriteBuffer);
    /* Point on the next byte to be written                                                                 */
    WriteBuffer++;
  }

  NumOfWrite--;

  /* Deselect the SPI FLASH                                                                                 */
  SPI_FLASH_SEL_INACTIVE();

  /* Wait the write operation has completed                                                                 */
  SPI_FLASH_WaitForWriteEnd_0();

  if (NumOfWrite)
  {
    while (NumOfWrite--)
    {
      /* Select the SPI FLASH                                                                               */
      SPI_FLASH_SEL_ACTIVE();
      /* Send "Automatic Address Increment Programming" instruction                                         */
      SPI_FLASH_SendByte_0(SST25V016B_CMD_AAI);

      for (temp = 0; temp < 2; temp++)
      {
        /* Send the current byte                                                                            */
        SPI_FLASH_SendByte_0(*WriteBuffer);
        /* Point on the next byte to be written                                                             */
        WriteBuffer++;
      }

      /* Deselect the SPI FLASH                                                                             */
      SPI_FLASH_SEL_INACTIVE();

      /* Wait the end of Flash writing                                                                      */
      SPI_FLASH_WaitForWriteEnd_0();

    }
  }

  /* Disable the write access to the FLASH                                                                  */
  SPI_FLASH_WriteDisable_0();
}

/*********************************************************************************************************//**
  * @brief  Writes block of data to the FLASH.
  * @param  WriteBuffer : pointer to the buffer  containing the data to be written to the FLASH.
  * @param  WriteAddr : FLASH's internal address to write to.
  * @param  NumOfWriteByte : number of bytes to write to the FLASH.
  * @retval None
  ***********************************************************************************************************/
void SST25VF016B_BufferWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte)
{
  u8 NumOfSingle = 0, Addr = 0;
  u16 NumOfPage = 0;

  Addr = WriteAddr % 2;
  NumOfPage =  NumOfWriteByte / 2;
  NumOfSingle = NumOfWriteByte % 2;

  if (Addr == 0)
  {
    if (NumOfPage == 0) /* Only one byte to be written to                                                   */
    {
      SST25VF016B_ByteWrite(*WriteBuffer, WriteAddr);
    }
    else
    {
      SST25VF016B_AAIWrite(WriteBuffer, WriteAddr, NumOfWriteByte);
      WriteAddr +=  NumOfWriteByte;
      WriteBuffer += NumOfWriteByte;
    }

    if (NumOfSingle)
    {
      SST25VF016B_ByteWrite(*WriteBuffer, WriteAddr);
    }
  }
  else
  {
    if (NumOfPage== 0) /* Only one byte to be written to                                                    */
    {
      SST25VF016B_ByteWrite(*WriteBuffer, WriteAddr);
    }
    else
    {
      SST25VF016B_ByteWrite(*WriteBuffer, WriteAddr);
      WriteAddr +=  1;
      WriteBuffer += 1;

      SST25VF016B_AAIWrite(WriteBuffer, WriteAddr, NumOfWriteByte);
      WriteAddr +=  NumOfWriteByte;
      WriteBuffer += NumOfWriteByte;

      if (NumOfSingle)
      {
        SST25VF016B_ByteWrite(*WriteBuffer, WriteAddr);
      }
     }
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
