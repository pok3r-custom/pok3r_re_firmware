/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx_Interrupt_FIFO/main.c
 * @version $Rev:: 2351         $
 * @date    $Date:: 2017-12-12 #$
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
#include <string.h>

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup HyperTerminal_TxRx_Interrupt_FIFO
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
const char HelloString[] = "Hello, this is USART Tx/Rx FIFO example. Please enter 4 characters...\r\n";
void USART_Tx(const char* TxBuffer, u32 length);
/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Enable peripheral clock of AFIO, USART0.
  *  - Config AFIO mode as USARTx_Rx, USARTx_Tx function.
  *  - USARTx configuration:
  *     - BaudRate = 115200 baud
  *     - Word Length = 8 Bits
  *     - One Stop Bit
  *     - None parity bit
  *  - Config FIOF level
  *  - Waiting for inputs from HyperTerminal.
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  USART_InitTypeDef USART_InitStructure;
  /* Initialize LED1 & LED2 on HT32 board                                                                   */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  /* Enable peripheral clock of AFIO, USART0                                                                */
  HTCFG_USART_CLK(CKCUClock)      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  /* Config AFIO mode as HTCFG_USART_Tx function.                                                           */
  AFIO_GPxConfig(HTCFG_USART_TX_GPIO_ID, HTCFG_USART_TX_AFIO, AFIO_FUN_USART_UART);
  AFIO_GPxConfig(HTCFG_USART_RX_GPIO_ID, HTCFG_USART_RX_AFIO, AFIO_FUN_USART_UART);
  /*
        USARTx configured as follow:
            - BaudRate = 115200 baud
            - Word Length = 8 Bits
            - One Stop Bit
            - None parity bit
  */
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;
  USART_Init(HTCFG_USART, &USART_InitStructure);
  /* Seting HTCFG_USART interrupt-flag                                                                      */
  USART_IntConfig(HTCFG_USART, USART_INT_RXDR, ENABLE);
  USART_IntConfig(HTCFG_USART, USART_INT_TOUT, ENABLE);
  /* Seting Rx FIFO Level                                                                                   */
  USART_RXTLConfig(HTCFG_USART, USART_RXTL_04);
  /*Seting TimeOut Counter                                                                                  */
  //USART_SetTimeOutValue(HTCFG_USART, 0x7F);
  /* Enable HTCFG_USART                                                                                     */
  USART_TxCmd(HTCFG_USART, ENABLE);
  USART_RxCmd(HTCFG_USART, ENABLE);
  /* Configure USARTx interrupt                                                                             */
  NVIC_EnableIRQ(HTCFG_USART_IRQn);
  USART_Tx(HelloString, sizeof(HelloString));
  while (1);
}

/*********************************************************************************************************//**
  * @brief  USART send a buffer.
  * @retval None
  ***********************************************************************************************************/
void USART_Tx(const char* TxBuffer, u32 length)
{
  int i;

  for (i = 0; i < length; i++)
  {
    while (!USART_GetFlagStatus(HTCFG_USART, USART_FLAG_TXC));
    USART_SendData(HTCFG_USART, TxBuffer[i]);
  }
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
