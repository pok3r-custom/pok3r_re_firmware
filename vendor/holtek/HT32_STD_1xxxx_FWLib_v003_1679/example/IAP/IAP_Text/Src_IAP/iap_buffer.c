/*********************************************************************************************************//**
 * @file    IAP/IAP_Text/Src_IAP/iap_buffer.c
 * @version $Rev:: 329          $
 * @date    $Date:: 2017-06-29 #$
 * @brief   This file contains buffer for USART.
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
#include "iap_buffer.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup Text_mode Text mode
  * @{
  */

/** @addtogroup Text_mode_IAP IAP
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
IAP_BufferIndexTypeDef BufferIndex = {0, 0};
u8 u8Buffer[BUFFER_SIZE];

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  This function is used to read data from buffer.
  * @retval value: 8-bit data from buffer
  ***********************************************************************************************************/
u8 ReadBuffer(void)
{
  u8 value;

  while (IS_BUFFER_EMPTY());

  value = u8Buffer[BufferIndex.Read];
  BufferIndex.Read = (BufferIndex.Read + 1) % BUFFER_SIZE;

  return value;
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
