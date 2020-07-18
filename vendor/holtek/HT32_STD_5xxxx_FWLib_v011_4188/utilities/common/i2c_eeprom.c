/*********************************************************************************************************//**
 * @file    i2c_eeprom.c
 * @version $Rev:: 2611         $
 * @date    $Date:: 2018-02-26 #$
 * @brief   The source file of i2c_eeprom.
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
#include "i2c_eeprom.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup I2C_EEPROM I2C_EEPROM
  * @brief The source file of i2c_eeprom.
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void _I2C_EEPROM_AckPolling(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup I2C_EEPROM_Exported_Functions I2C EEPROM exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Initializes peripherals used by the I2C EEPROM driver.
  * @retval None
  ***********************************************************************************************************/
void I2C_EEPROM_Init(void)
{
  I2C_InitTypeDef I2C_InitStructure = { 0 };

  /* Enable AFIO & I2C clock                                                                                */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  EEPROM_I2C_CLK(CKCUClock) = 1;
  CKCUClock.Bit.AFIO        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure I2C SCL pin, I2C SDA pin                                                                     */
  HT32F_DVB_GPxConfig(EEPROM_I2C_SCL_GPIO_ID, EEPROM_I2C_SCL_AFIO_PIN, EEPROM_I2C_SCL_AFIO_MODE);
  HT32F_DVB_GPxConfig(EEPROM_I2C_SDA_GPIO_ID, EEPROM_I2C_SDA_AFIO_PIN, EEPROM_I2C_SDA_AFIO_MODE);

  /* I2C configuration                                                                                      */
  I2C_InitStructure.I2C_GeneralCall = I2C_GENERALCALL_DISABLE;
  I2C_InitStructure.I2C_AddressingMode = I2C_ADDRESSING_7BIT;
  I2C_InitStructure.I2C_Acknowledge = I2C_ACK_DISABLE;
  I2C_InitStructure.I2C_OwnAddress = 0x00;
  I2C_InitStructure.I2C_Speed = I2C_EEPROM_SPEED;
  I2C_InitStructure.I2C_SpeedOffset = 0;
  I2C_Init(EEPROM_I2C, &I2C_InitStructure);
}

/*********************************************************************************************************//**
  * @brief  EEPROM page write.
  * @param  pBuffer : a pointer pointing to data source buffer.
  * @param  WriteAddr : destination EEPROM address.
  * @param  NumByteToWrite : numbers of byte.
  * @retval None
  ***********************************************************************************************************/
void I2C_EEPROM_PageWrite(u8* pBuffer, u8 WriteAddr, u16 NumByteToWrite)
{
  /* check parameters                                                                                       */
  Assert_Param((NumByteToWrite > 0) && ((NumByteToWrite <= (I2C_EEPROM_PAGE_SIZE - (WriteAddr & I2C_EEPROM_PAGE_MASK)))));

  /* acknowledge polling                                                                                    */
  _I2C_EEPROM_AckPolling();

  /* set EEPROM address                                                                                     */
  while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_TX_EMPTY));
  I2C_SendData(EEPROM_I2C, WriteAddr);

  /* page write                                                                                             */
  while (NumByteToWrite--)
  {
    while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_TX_EMPTY));
    I2C_SendData(EEPROM_I2C, *pBuffer);
    pBuffer++;
  }

  /* end of write                                                                                           */
  while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_TX_EMPTY));
  I2C_GenerateSTOP(EEPROM_I2C);
}

/*********************************************************************************************************//**
  * @brief  Write numbers of sequential data to EEPROM.
  * @param  pBuffer : a pointer pointing to data source buffer.
  * @param  WriteAddr : destination EEPROM address.
  * @param  NumByteToWrite : numbers of byte.
  * @retval None
  ***********************************************************************************************************/
void I2C_EEPROM_BufferWrite(u8* pBuffer, u8 WriteAddr, u16 NumByteToWrite)
{
  u16 Byte2Wr, AvailableByte;

  /* check parameters                                                                                       */
  Assert_Param(NumByteToWrite <= I2C_EEPROM_CAPACITY);

  /* sequential write                                                                                       */
  while (NumByteToWrite)
  {
    AvailableByte = I2C_EEPROM_PAGE_SIZE - (WriteAddr & I2C_EEPROM_PAGE_MASK);
    Byte2Wr = (NumByteToWrite > AvailableByte)?(AvailableByte):(NumByteToWrite);
    I2C_EEPROM_PageWrite(pBuffer, WriteAddr, Byte2Wr);
    pBuffer += Byte2Wr;
    WriteAddr = (WriteAddr + Byte2Wr) & I2C_EEPROM_ADDR_MASK;
    NumByteToWrite -= Byte2Wr;
  }
}

/*********************************************************************************************************//**
  * @brief  Read numbers of sequential data from EEPROM.
  * @param  pBuffer : a pointer pointing to data destination buffer.
  * @param  ReadAddr : source EEPROM address.
  * @param  NumByteToRead : numbers of byte.
  * @retval None
  ***********************************************************************************************************/
void I2C_EEPROM_BufferRead(u8* pBuffer, u8 ReadAddr, u16 NumByteToRead)
{
  /* check parameters                                                                                       */
  Assert_Param(NumByteToRead > 0);

  /* acknowledge polling                                                                                    */
  _I2C_EEPROM_AckPolling();

  /* set EEPROM address                                                                                     */
  while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_TX_EMPTY));
  I2C_SendData(EEPROM_I2C, ReadAddr);

  /* send read command                                                                                      */
  I2C_TargetAddressConfig(EEPROM_I2C, I2C_EEPROM_DEV_ADDR, I2C_MASTER_READ);
  while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_SEND_START));
  while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_RECEIVER_MODE));

  /* enable master receiver ACK                                                                             */
  if (NumByteToRead > 1)
  {
    I2C_AckCmd(EEPROM_I2C, ENABLE);
  }

  /* sequential read                                                                                        */
  while (NumByteToRead)
  {
    while (!I2C_CheckStatus(EEPROM_I2C, I2C_MASTER_RX_NOT_EMPTY));
    *pBuffer = I2C_ReceiveData(EEPROM_I2C);

    pBuffer++;
    NumByteToRead--;

    if (NumByteToRead == 1)
    {
      I2C_AckCmd(EEPROM_I2C, DISABLE);
    }
  }

  /* end of read                                                                                            */
  I2C_GenerateSTOP(EEPROM_I2C);
}
/**
  * @}
  */

/* Private functions ---------------------------------------------------------------------------------------*/
/** @defgroup I2C_EEPROM_Private_Functions I2C EEPROM private functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  EEPROM acknowledge polling.
  * @retval None
  ***********************************************************************************************************/
void _I2C_EEPROM_AckPolling(void)
{
  u32 reg;

  /* wait if bus busy                                                                                       */
  while (I2C_GetFlagStatus(EEPROM_I2C, I2C_FLAG_BUSBUSY));

  while (1)
  {
    /* send slave address                                                                                   */
    I2C_TargetAddressConfig(EEPROM_I2C, I2C_EEPROM_DEV_ADDR, I2C_MASTER_WRITE);

    /* check status                                                                                         */
    while (1)
    {
      reg = EEPROM_I2C->SR;

      if (reg & I2C_FLAG_ADRS)
      {
        return;
      }

      if (reg & I2C_FLAG_RXNACK)
      {
        I2C_ClearFlag(EEPROM_I2C, I2C_FLAG_RXNACK);
        break;
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
