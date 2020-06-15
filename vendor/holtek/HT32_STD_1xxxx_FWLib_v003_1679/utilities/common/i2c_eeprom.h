/*********************************************************************************************************//**
 * @file    i2c_eeprom.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of i2c_eeprom.
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

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __I2C_EEPROM_H
#define __I2C_EEPROM_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup I2C_EEPROM I2C_EEPROM
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup I2C_EEPROM_Exported_Constants I2C EEPROM exported constants
  * @{
  */
#define I2C_EEPROM_SPEED         (400000)                                       /*!< I2C speed              */
#define I2C_EEPROM_CAPACITY      (256)                                          /*!< capacity in bytes      */
#define I2C_EEPROM_PAGE_SIZE     (8)                                            /*!< page size in bytes     */
#define I2C_EEPROM_ADDR_MASK     (I2C_EEPROM_CAPACITY - 1)                      /*!< address mask           */
#define I2C_EEPROM_PAGE_MASK     (I2C_EEPROM_PAGE_SIZE - 1)                     /*!< page size mask         */
#define I2C_EEPROM_DEV_ADDR      (0x51)                                         /*!< I2C device address     */
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup I2C_EEPROM_Exported_Functions I2C EEPROM exported functions
  * @{
  */
void I2C_EEPROM_Init(void);
void I2C_EEPROM_PageWrite(u8* pBuffer, u8 WriteAddr, u16 NumByteToWrite);
void I2C_EEPROM_BufferWrite(u8* pBuffer, u8 WriteAddr, u16 NumByteToWrite);
void I2C_EEPROM_BufferRead(u8* pBuffer, u8 ReadAddr, u16 NumByteToRead);
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

#ifdef __cplusplus
}
#endif

#endif /* __I2C_EEPROM_H -----------------------------------------------------------------------------------*/
