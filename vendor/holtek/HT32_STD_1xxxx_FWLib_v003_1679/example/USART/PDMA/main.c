/*********************************************************************************************************//**
 * @file    USART/PDMA/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   Main program.
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
#include "ht32_board.h"
#include "usart_pdma_buffer.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup USART_PDMA
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
USART_InitTypeDef USART_InitStructure;
PDMACH_InitTypeDef PDMACH_TxStructure;
PDMACH_InitTypeDef PDMACH_RxStructure;
vu8 USART_PDMA_TxState = USART_PDMA_IDLE;
u8 RxBuffer[RX_BUFFER_SIZE];
u32 RxBufferReadIndex = 0;
const char HelloString[] = "Hello, this is USART PDMA Tx/Rx example.\r\n";

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* Enable peripheral clock of AFIO, UART, PDMA                                                            */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO   = 1;
  HTCFG_USART_CLK(CKCUClock) = 1;
  CKCUClock.Bit.PDMA   = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as Rx and Tx function.                                                                */
  AFIO_GPxConfig(HTCFG_USART_TX_GPIO_ID, HTCFG_USART_TX_PIN, AFIO_MODE_6);
  AFIO_GPxConfig(HTCFG_USART_RX_GPIO_ID, HTCFG_USART_RX_PIN, AFIO_MODE_6);

  /* UART configuration ------------------------------------------------------------------------------------*/
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;
  USART_Init(HTCFG_USART, &USART_InitStructure);
  USART_TxCmd(HTCFG_USART, ENABLE);
  USART_RxCmd(HTCFG_USART, ENABLE);

  /* UART Tx PDMA channel configuration                                                                     */
  PDMACH_TxStructure.PDMACH_SrcAddr = (u32)NULL;
  PDMACH_TxStructure.PDMACH_DstAddr = (u32)&HTCFG_USART->DR;
  PDMACH_TxStructure.PDMACH_BlkCnt = 0;
  PDMACH_TxStructure.PDMACH_BlkLen = 1;
  PDMACH_TxStructure.PDMACH_DataSize = WIDTH_8BIT;
  PDMACH_TxStructure.PDMACH_Priority = M_PRIO;
  PDMACH_TxStructure.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX;
  PDMA_IntConfig(PDMA_CH3, PDMA_INT_GE | PDMA_INT_TC, ENABLE);
  NVIC_EnableIRQ(PDMACH3_IRQn);

  /* UART Rx PDMA channel configuration                                                                     */
  PDMACH_RxStructure.PDMACH_SrcAddr = (u32)&HTCFG_USART->DR;
  PDMACH_RxStructure.PDMACH_DstAddr = (u32)RxBuffer;
  PDMACH_RxStructure.PDMACH_BlkCnt = RX_BUFFER_SIZE;
  PDMACH_RxStructure.PDMACH_BlkLen = 1;
  PDMACH_RxStructure.PDMACH_DataSize = WIDTH_8BIT;
  PDMACH_RxStructure.PDMACH_Priority = H_PRIO;
  PDMACH_RxStructure.PDMACH_AdrMod = SRC_ADR_FIX | DST_ADR_LIN_INC;
  PDMA_Config(PDMA_CH2, &PDMACH_RxStructure);
  PDMA_EnaCmd(PDMA_CH2, ENABLE);
  USART_PDMACmd(HTCFG_USART, USART_PDMAREQ_RX, ENABLE);
  PDMA_IntConfig(PDMA_CH2, PDMA_INT_GE | PDMA_INT_TC, ENABLE);
  NVIC_EnableIRQ(PDMACH2_IRQn);

  /* USART0 send hello information used PDMA mode                                                           */
  USART_PDMA_Tx((char *)HelloString, sizeof(HelloString)-1);

  /* Read data from Rx buffer and write to Tx buffer via polling mode in an infinite loop                   */
  while (1)
  {
    u8 tmp = RxBufferBlockedRead();
    USART_PDMA_Tx((char *)&tmp, 1);
  }
}

/*********************************************************************************************************//**
  * @brief  USART send a buffer used PDMA mode.
  * @retval None
  ***********************************************************************************************************/
u32 USART_PDMA_Tx(char *TxBuffer, u32 length)
{
  while (USART_PDMA_TxState != USART_PDMA_IDLE);

  /* USART0 Tx PDMA channel configuration                                                                   */
  PDMACH_TxStructure.PDMACH_SrcAddr = (u32)TxBuffer;
  PDMACH_TxStructure.PDMACH_BlkCnt = length;
  PDMA_Config(PDMA_CH3, &PDMACH_TxStructure);
  PDMA_EnaCmd(PDMA_CH3, ENABLE);
  USART_PDMACmd(HTCFG_USART, USART_PDMAREQ_TX, ENABLE);
  USART_PDMA_TxState = USART_PDMA_BUSY;

  return 0;
}

/*********************************************************************************************************//**
  * @brief  To read a byte from Rx buffer. This is a blocked function.
  * @retval Rx data
  ***********************************************************************************************************/
u8 RxBufferBlockedRead(void)
{
  u8 retval;
  while (IsRxBufferEmpty());
  
  retval = RxBuffer[RxBufferReadIndex++];
  RxBufferReadIndex %= RX_BUFFER_SIZE;
  return retval;
}

#if (HT32_LIB_DEBUG == 1)
/*********************************************************************************************************//**
  * @brief  Report both the error name of the source file and the source line number.
  * @param  filename: pointer to the source file name.
  * @param  uline: error line source number.
  * @retval None
  ***********************************************************************************************************/
void assert_error(u8* filename, u32 uline)
{
  /*
     This function is called by IP library that the invalid parameters has been passed to the library API.
     Debug message can be added here.
     Example: printf("Parameter Error: file %s on line %d\r\n", filename, uline);
  */

  while (1)
  {
  }
}
#endif


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
