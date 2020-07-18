/******************************************************************************//**
 * @file    I2C/EEPROM_Simulate/i2cm.h
 * @version $Rev:: 630          $
 * @date    $Date:: 2016-05-25 #$
 * @brief   The header file of the I2C library.
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
#ifndef __I2CM_H
#define __I2CM_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup I2C_Examples I2C
  * @{
  */

/** @addtogroup EEPROM_Simulate
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
typedef struct
{
  u8 DevAddr;
  u8 RegAddr;
  u16 Length;
  vu16 Counter;
  vu16 RetryDownCounter;
  vu8* Buffer;
  vu8 Direction;
  vu8 Status;
  volatile bool Locked;
} sI2CM_Transfer;

/* Exported constants --------------------------------------------------------------------------------------*/
#define I2CM_DIRECTION_OUT          0   /*!< I2C transfer is output direction                               */
#define I2CM_DIRECTION_IN           1   /*!< I2C transfer is output direction                               */

#define I2CM_OK                     0   /*!< I2C transfer status : OK                                       */
#define I2CM_SLAVE_NO_RESPONSE      1   /*!< I2C transfer status : Slave No Response                        */
#define I2CM_BUFFER_NULL            2   /*!< I2C transfer status : Error caused by buffer null              */
#define I2CM_ARBLOS                 3   /*!< I2C transfer status : Error caused by Arbitration Loss         */
#define I2CM_BUSERR                 4   /*!< I2C transfer status : Error caused by bus error                */
#define I2CM_TOUTF                  5   /*!< I2C transfer status : Error caused by timeout                  */

#define I2CM_BUS_MAX_RETRY          (0xFF)  /*!< Max retry count                                            */

/* Exported variables --------------------------------------------------------------------------------------*/
extern sI2CM_Transfer I2CM_Transfer;


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

#endif /* __I2CM_H -----------------------------------------------------------------------------------------*/
