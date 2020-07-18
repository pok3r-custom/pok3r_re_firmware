/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/Src_IAP/iap_crc16.c
 * @version $Rev:: 329          $
 * @date    $Date:: 2017-06-29 #$
 * @brief   This file contains CRC16 algorithm.
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
#include "iap_crc16.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup Text_mode_RAM Text mode(execute on RAM)
  * @{
  */

/** @addtogroup Text_mode_RAM_IAP IAP
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define CCITT     (0x1021)

/* Private function prototypes -----------------------------------------------------------------------------*/
static u16 _crc(u32 n);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  The CRC16 algorithm.
  * @param  crc: Initial CRC value
  * @param  buffer: Start address of buffer for CRC calculation
  * @param  length: Length in byte for CRC calculation
  * @retval crc: The value of CRC16 algorithm
  ***********************************************************************************************************/
u16 CRC16(u16 crc, u8 *buffer, u32 length)
{
  u32 i, j;

  for (i = 0; i < length; i++)
  {
    j = (crc >> 8) ^ buffer[i];
    crc = (crc << 8) ^ _crc(j);
  }

  return crc;
}

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  This function is used to calculate value of CRC table.
  * @param  n: Index of CRC table
  * @retval acc: The value of CRC table[n]
  ***********************************************************************************************************/
static u16 _crc(u32 n)
{
  u32 i, acc;

  for (n <<= 8, acc = 0, i = 8; i > 0; i--, n <<= 1)
  {
    acc = ((n ^ acc) & 0x8000) ? ((acc << 1) ^ CCITT) : (acc << 1);
  }

  return (u16)(acc);
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
