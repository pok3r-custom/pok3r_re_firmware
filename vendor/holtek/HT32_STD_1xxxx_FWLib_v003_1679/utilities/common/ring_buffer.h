/*********************************************************************************************************//**
 * @file    ring_buffer.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of ring buffer.
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
#ifndef __RING_BUFFER_H
#define __RING_BUFFER_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup RING_BUFFER RING_BUFFER
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup RING_BUFFER_Exported_Types Ring Buffer exported types
  * @{
  */
typedef struct
{
  u32 uRead;
  vu32 uWrite;
  u8 *puMemory;
  u32 uSize;
} Buffer_TypeDef;
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup RING_BUFFER_Exported_Functions Ring Buffer exported functions
  * @{
  */
void Buffer_Init(Buffer_TypeDef *pBuffer, u8 *puMemory, u32 uSize);
u32 Buffer_ReadByte(Buffer_TypeDef *pBuffer, u8 *puData);
u32 Buffer_WriteByte(Buffer_TypeDef *pBuffer, u32 uData);
u32 Buffer_Read(Buffer_TypeDef *pBuffer, u8 *puData, u32 uLength);
u32 Buffer_Write(Buffer_TypeDef *pBuffer, u8 *puData, u32 uLength);
u32 Buffer_isEmpty(Buffer_TypeDef *pBuffer);
u32 Buffer_isFull(Buffer_TypeDef *pBuffer);
u32 Buffer_GetLength(Buffer_TypeDef *pBuffer);
void Buffer_Discard(Buffer_TypeDef *pBuffer);
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

#endif
