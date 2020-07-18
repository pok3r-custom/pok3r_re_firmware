/*********************************************************************************************************//**
 * @file    USART/PDMA/main.c
 * @version $Rev:: 3151         $
 * @date    $Date:: 2018-10-18 #$
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
#include "ht32_board_config.h"
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
  /* Enable peripheral clock of AFIO, UxART, PDMA                                                           */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO   = 1;
  COM1_CLK(CKCUClock)  = 1;
  CKCUClock.Bit.PDMA   = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as USART0_Rx and USART0_Tx function.                                                  */
  HT32F_DVB_GPxConfig(COM1_TX_GPIO_ID, COM1_TX_AFIO_PIN, COM1_TX_AFIO_MODE);
  HT32F_DVB_GPxConfig(COM1_RX_GPIO_ID, COM1_RX_AFIO_PIN, COM1_RX_AFIO_MODE);

  /* COM1 configuration ------------------------------------------------------------------------------------*/
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;
  USART_Init(COM1_PORT, &USART_InitStructure);
  USART_TxCmd(COM1_PORT, ENABLE);
  USART_RxCmd(COM1_PORT, ENABLE);

  /* COM1 Tx PDMA channel configuration                                                                     */
  PDMACH_TxStructure.PDMACH_SrcAddr = (u32)NULL;
  PDMACH_TxStructure.PDMACH_DstAddr = (u32)&COM1_PORT->DR;
  PDMACH_TxStructure.PDMACH_BlkCnt = 0;
  PDMACH_TxStructure.PDMACH_BlkLen = 1;
  PDMACH_TxStructure.PDMACH_DataSize = WIDTH_8BIT;
  PDMACH_TxStructure.PDMACH_Priority = M_PRIO;
  PDMACH_TxStructure.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX;
  PDMA_IntConfig(HTCFG_TX_PDMA_CH, PDMA_INT_GE | PDMA_INT_TC, ENABLE);

  /* COM1 Rx PDMA channel configuration                                                                     */
  PDMACH_RxStructure.PDMACH_SrcAddr = (u32)&COM1_PORT->DR;
  PDMACH_RxStructure.PDMACH_DstAddr = (u32)RxBuffer;
  PDMACH_RxStructure.PDMACH_BlkCnt = RX_BUFFER_SIZE;
  PDMACH_RxStructure.PDMACH_BlkLen = 1;
  PDMACH_RxStructure.PDMACH_DataSize = WIDTH_8BIT;
  PDMACH_RxStructure.PDMACH_Priority = H_PRIO;
  PDMACH_RxStructure.PDMACH_AdrMod = SRC_ADR_FIX | DST_ADR_LIN_INC;
  PDMA_Config(HTCFG_RX_PDMA_CH, &PDMACH_RxStructure);
  PDMA_EnaCmd(HTCFG_RX_PDMA_CH, ENABLE);
  USART_PDMACmd(COM1_PORT, USART_PDMAREQ_RX, ENABLE);
  PDMA_IntConfig(HTCFG_RX_PDMA_CH, PDMA_INT_GE | PDMA_INT_TC, ENABLE);
  NVIC_EnableIRQ(HTCFG_PDMA_IRQ);

  /* COM1 send hello information used PDMA mode                                                             */
  USART_PDMA_Tx((char *)HelloString, sizeof(HelloString)-1);

  /* Read data from Rx buffer and write to Tx buffer via polling mode in an infinite loop                   */
  while (1)
  {
    if (!IsRxBufferEmpty())
    {
      USART_PDMA_Tx((char*)RxBuffer, GetRxBufferWriteIndex());

      PDMACH_RxStructure.PDMACH_DstAddr = (u32)RxBuffer;
      PDMA_Config(HTCFG_RX_PDMA_CH, &PDMACH_RxStructure);
      PDMA_EnaCmd(HTCFG_RX_PDMA_CH, ENABLE);
    }
  }
}

/*********************************************************************************************************//**
  * @brief  USART send a buffer used PDMA mode.
  * @retval None
  ***********************************************************************************************************/
u32 USART_PDMA_Tx(char* TxBuffer, u32 length)
{
  while (USART_PDMA_TxState != USART_PDMA_IDLE);

  /* USART0 Tx PDMA channel configuration                                                                   */
  PDMACH_TxStructure.PDMACH_SrcAddr = (u32)TxBuffer;
  PDMACH_TxStructure.PDMACH_BlkCnt = length + 1;
  PDMA_Config(HTCFG_TX_PDMA_CH, &PDMACH_TxStructure);
  PDMA_EnaCmd(HTCFG_TX_PDMA_CH, ENABLE);
  USART_PDMACmd(COM1_PORT, USART_PDMAREQ_TX, ENABLE);
  USART_PDMA_TxState = USART_PDMA_BUSY;

  return 0;
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
