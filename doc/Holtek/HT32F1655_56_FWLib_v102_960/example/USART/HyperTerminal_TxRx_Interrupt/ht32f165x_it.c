/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx_Interrupt/ht32f165x_it.c
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
#include "ht32_board.h"
#include "usart_int.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup HyperTerminal_TxRx_Interrupt
  * @{
  */


/* Private define ------------------------------------------------------------------------------------------*/
#define USART_TIMEOUT_ON          ((u32)0x00000080)

/* Private variables ---------------------------------------------------------------------------------------*/

/* USART0 definitions                                                                                       */
u8 UR0TxBuf[USART_BUFSIZE];
u8 UR0RxBuf[USART_BUFSIZE];
u32 UR0TxReadIndex = 0;
vu32 UR0TxWriteIndex = 0;
u32 UR0RxReadIndex = 0;
vu32 UR0RxWriteIndex = 0;

/* USART1 definitions                                                                                       */
u8 UR1TxBuf[USART_BUFSIZE];
u8 UR1RxBuf[USART_BUFSIZE];
u32 UR1TxReadIndex = 0;
vu32 UR1TxWriteIndex = 0;
u32 UR1RxReadIndex = 0;
vu32 UR1RxWriteIndex = 0;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Initialize the USARTx peripheral in interrupt mode.
  * @param  USARTx: where USARTx is USART to select the USART peripheral, x can be 0 or 1.
  * @param  USART_InitStructure: pointer to a USART_InitTypeDef structure that contains the configuration information
  *         for the specified USART peripheral.
  * @param  Mode: where Mode is USART to select the USART interrupt initial setting.
  * @retval None.
  ***********************************************************************************************************/
void USART_Interrupt_Init(HT_USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStructure, USART_INT_Mode Mode)
{
  /* Configures USARTx                                                                                      */
  USART_Init(USARTx, USART_InitStructure);
  USART_FIFOReset(USARTx, USART_FIFO_TX | USART_FIFO_RX);

  if (Mode == USART_TX_INT)
  {
    /* Set TX FIFO Level, empty in FIFO                                                                     */
    USART_TFITLConfig(USARTx, USART_TFITL_00);
    USART_TxCmd(USARTx, ENABLE);
  }
  else if (Mode == USART_RX_INT)
  {
    /* Set RX FIFO Level, 1 byte in FIFO                                                                    */
    USART_RFITLConfig(USARTx, USART_RFITL_01);
    /* Enable RX FIFO Interrupt                                                                             */
    USART_IntConfig(USARTx, USART_IER_RDAIE, ENABLE);
    /* Set RX Timeout                                                                                       */
    USARTx->TPR = USART_TIMEOUT_ON | 40;
    USART_RxCmd(USARTx, ENABLE);
  }
  else if (Mode == USART_ALL_INT)
  {
    USART_TFITLConfig(USARTx, USART_TFITL_00);
    USART_TxCmd(USARTx, ENABLE);
    USART_RFITLConfig(USARTx, USART_RFITL_01);
    USART_IntConfig(USARTx, USART_IER_ALL, ENABLE);
    USARTx->TPR = USART_TIMEOUT_ON | 40;
    USART_RxCmd(USARTx, ENABLE);
  }

  if (USARTx == HT_USART0)
  {
    NVIC_EnableIRQ(USART0_IRQn);
  }
  else
  {
    NVIC_EnableIRQ(UART0_IRQn);
  }
}

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
  u32 i;

  /* Tx, move data from buffer to USART FIFO                                                                */
  if (((HT_USART0->IIR) & USART_IID_THRE ) == USART_IID_THRE )
  {
    if (IS_BUFFER_EMPTY(UR0TxReadIndex, UR0TxWriteIndex))
    {
      USART_IntConfig(HT_USART0, USART_IER_THREIE, DISABLE);
    }
    else
    {
      for (i = 0; i < 8; i++)
      {
        USART_SendData(HT_USART0, UR0TxBuf[UR0TxReadIndex]);
        UR0TxReadIndex = (UR0TxReadIndex + 1) % USART_BUFSIZE;
        HT32F_DVB_LEDOff(HT_LED1);
        if (IS_BUFFER_EMPTY(UR0TxReadIndex, UR0TxWriteIndex))
        {
          break;
        }
      }
    }
  }

  /* Rx, move data from USART FIFO to buffer                                                                */
  if (((HT_USART0->IIR) & USART_IID_RDA ) == USART_IID_RDA )
  {
    if (IS_BUFFER_FULL(UR0RxReadIndex, UR0RxWriteIndex))
    {
      /* USART Rx buffer is full                                                                            */
      return;
    }

    UR0RxBuf[UR0RxWriteIndex] = USART_ReceiveData(HT_USART0);
    UR0RxWriteIndex = (UR0RxWriteIndex + 1) % USART_BUFSIZE;
    HT32F_DVB_LEDOn(HT_LED1);
  }
}

/*********************************************************************************************************//**
 * @brief   This function handles UART0 interrupt.
 * @retval  None
 ************************************************************************************************************/
void UART0_IRQHandler(void)
{
  u32 i;

  /* Tx, move data from buffer to USART FIFO                                                                */
  if (((HT_UART0->IIR) & USART_IID_THRE ) == USART_IID_THRE )
  {
    if (IS_BUFFER_EMPTY(UR1TxReadIndex, UR1TxWriteIndex))
    {
      USART_IntConfig(HT_UART0, USART_IER_THREIE, DISABLE);
    }
    else
    {
      for (i = 0; i < 8; i++)
      {
        USART_SendData(HT_UART0, UR1TxBuf[UR1TxReadIndex]);
        UR1TxReadIndex = (UR1TxReadIndex + 1) % USART_BUFSIZE;
        HT32F_DVB_LEDOff(HT_LED2);
        if (IS_BUFFER_EMPTY(UR1TxReadIndex, UR1TxWriteIndex))
        {
          break;
        }
      }
    }
  }

  /* Rx, move data from USART FIFO to buffer                                                                */
  if (((HT_UART0->IIR) & USART_IID_RDA ) == USART_IID_RDA )
  {
    if (IS_BUFFER_FULL(UR1RxReadIndex, UR1RxWriteIndex))
    {
      /* USART Rx buffer is full                                                                            */
      return;
    }

    UR1RxBuf[UR1RxWriteIndex] = USART_ReceiveData(HT_UART0);
    UR1RxWriteIndex = (UR1RxWriteIndex + 1) % USART_BUFSIZE;
    HT32F_DVB_LEDOn(HT_LED2);
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
