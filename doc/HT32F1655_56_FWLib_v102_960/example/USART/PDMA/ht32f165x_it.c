/*********************************************************************************************************//**
 * @file    USART/PDMA/ht32f165x_it.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all interrupt service routine.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "usart_pdma_buffer.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup USART_PDMA
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
 * @brief   This function handles NMI exception.
 * @retval  None
 ************************************************************************************************************/
void NMI_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Hard Fault exception.
 * @retval  None
 ************************************************************************************************************/
void HardFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Memory Manage exception.
 * @retval  None
 ************************************************************************************************************/
void MemManage_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Bus Fault exception.
 * @retval  None
 ************************************************************************************************************/
void BusFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Usage Fault exception.
 * @retval  None
 ************************************************************************************************************/
void UsageFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles SVCall exception.
 * @retval  None
 ************************************************************************************************************/
void SVC_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Debug Monitor exception.
 * @retval  None
 ************************************************************************************************************/
void DebugMon_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles PendSVC exception.
 * @retval  None
 ************************************************************************************************************/
void PendSV_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles SysTick Handler.
 * @retval  None
 ************************************************************************************************************/
void SysTick_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles USART0 interrupt.
 * @retval  None
 ************************************************************************************************************/
void USART0_IRQHandler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles USART1 interrupt.
 * @retval  None
 ************************************************************************************************************/
void USART1_IRQHandler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles PDMA channel 3 interrupt.
 * @retval  None
 ************************************************************************************************************/
void PDMA_CH3_IRQHandler(void)
{
  PDMA_ClearFlag(PDMA_CH3, PDMA_FLAG_GE|PDMA_FLAG_TE);
  USART_PDMA_TxState = USART_PDMA_IDLE;
  USART_TxPDMACmd(HT_USART0, DISABLE);  
}

/*********************************************************************************************************//**
 * @brief   This function handles PDMA channel 2 interrupt.
 * @retval  None
 ************************************************************************************************************/
void PDMA_CH2_IRQHandler(void)
{
  /* Get the write index */
  u32 WriteIndex = GetRxBufferWriteIndex();
  u32 ReadIndex = GetRxBufferReadIndex();
  
  /* Clear interrupt flags */
  PDMA_ClearFlag(PDMA_CH2, PDMA_FLAG_GE|PDMA_FLAG_TE);

  PDMACH_RxStructure.PDMACH_DstAddr = (u32)RxBuffer + WriteIndex;
  if(WriteIndex >= ReadIndex)
  {
    PDMACH_RxStructure.PDMACH_BlkCnt = RX_BUFFER_SIZE - WriteIndex;
    if(ReadIndex == 0) PDMACH_RxStructure.PDMACH_BlkCnt--;
  }
  else
  {
    PDMACH_RxStructure.PDMACH_BlkCnt = RxBufferReadIndex - WriteIndex - 1;    
  } 
  
  if(PDMACH_RxStructure.PDMACH_BlkCnt == 0)
  {
    /* Buffer Full */
    USART_PDMA_Tx("\r\nRx buffer full !!!\r\n", 20);
    while(1);
  } 
    
  PDMA_Config(PDMA_CH2, &PDMACH_RxStructure); 
  PDMA_EnaCmd(PDMA_CH2, ENABLE);
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
