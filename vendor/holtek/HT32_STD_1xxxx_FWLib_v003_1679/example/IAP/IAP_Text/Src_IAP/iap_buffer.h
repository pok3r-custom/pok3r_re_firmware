/*********************************************************************************************************//**
 * @file    IAP/IAP_Text/Src_IAP/iap_buffer.h
 * @version $Rev:: 329          $
 * @date    $Date:: 2017-06-29 #$
 * @brief   The header file of buffer for USART.
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
#ifndef __IAP_BUFFER_H
#define __IAP_BUFFER_H

/* Includes ------------------------------------------------------------------------------------------------*/

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


/* Exported types ------------------------------------------------------------------------------------------*/
/**
 * @brief Definition of buffer index
 */
typedef struct
{
  vu32 Write;
  u32 Read;
} IAP_BufferIndexTypeDef;

/* Exported constants --------------------------------------------------------------------------------------*/
#define BUFFER_SIZE             (540)     /* 540 for 115200, For higher baud rate, you should modify it.    */

/* Exported macro ------------------------------------------------------------------------------------------*/
#define IS_BUFFER_FULL()        ((BufferIndex.Write + 1) % BUFFER_SIZE == BufferIndex.Read)
#define IS_BUFFER_EMPTY()       (BufferIndex.Write == BufferIndex.Read)

/* Exported variables --------------------------------------------------------------------------------------*/
extern u8 u8Buffer[BUFFER_SIZE];
extern IAP_BufferIndexTypeDef BufferIndex;

/* Exported functions --------------------------------------------------------------------------------------*/
u8 ReadBuffer(void);


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

#endif /* __IAP_BUFFER_H -----------------------------------------------------------------------------------*/
