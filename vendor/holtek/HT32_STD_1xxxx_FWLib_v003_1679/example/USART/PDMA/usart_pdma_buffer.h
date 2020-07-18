/*********************************************************************************************************//**
 * @file    USART/PDMA/usart_pdma_buffer.h
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   The header file of the USART PDMA buffer example.
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
#ifndef __USART_PDMA_BUFFER_H
#define __USART_PDMA_BUFFER_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup USART_PDMA
  * @{
  */


#define RX_BUFFER_SIZE  64

#define USART_PDMA_IDLE 0
#define USART_PDMA_BUSY 1

#define GetRxBufferReadIndex() RxBufferReadIndex
#define GetRxBufferWriteIndex() (RX_BUFFER_SIZE- (HT_PDMA->PDMACH2.CTSR>>16))

#define IsRxBufferEmpty() (GetRxBufferWriteIndex() == RxBufferReadIndex)

extern PDMACH_InitTypeDef PDMACH_TxStructure;
extern PDMACH_InitTypeDef PDMACH_RxStructure;
extern u8 RxBuffer[RX_BUFFER_SIZE];
extern u32 RxBufferReadIndex;
extern vu8 USART_PDMA_TxState;

u32 USART_PDMA_Tx(char *TxBuffer, u32 length);
u8 RxBufferBlockedRead(void);


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

#endif /* __USART_PDMA_BUFFER_H ----------------------------------------------------------------------------*/
