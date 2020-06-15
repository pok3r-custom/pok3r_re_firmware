/*********************************************************************************************************//**
 * @file    USART/Polling/main.c
 * @version $Rev:: 946          $
 * @date    $Date:: 2016-08-08 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup Polling
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
const char HelloString[] = "Hello, this is USART Polling Tx/Rx example.\r\n";
u8 input[]="\r\n";
vu8 TxCounter;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Enable peripheral clock of AFIO, USART0.
  *  - Config AFIO mode as USART0_Rx and USART0_Tx function.
  *  - USART0 configuration:
  *     - BaudRate = 115200 baud
  *     - Word Length = 8 Bits
  *     - One Stop Bit
  *     - None parity bit
  *  - Read data from Rx buffer and write to Tx buffer used polling mode in an infinite loop
  *
  ***********************************************************************************************************/
int main(void)
{
  USART_InitTypeDef USART_InitStructure;

  /* Enable peripheral clock of AFIO, USART0                                                                */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO   = 1;
  COM1_CLK(CKCUClock)  = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as USART0_Rx and USART0_Tx function.                                                  */
  AFIO_GPxConfig(COM1_TX_GPIO_ID, COM1_TX_AFIO_PIN, AFIO_FUN_USART_UART);
  AFIO_GPxConfig(COM1_RX_GPIO_ID, COM1_RX_AFIO_PIN, AFIO_FUN_USART_UART);

  /* USART0 configuration ----------------------------------------------------------------------------------*/
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;
  USART_Init(COM1_PORT, &USART_InitStructure);
  USART_TxCmd(COM1_PORT, ENABLE);
  USART_RxCmd(COM1_PORT, ENABLE);

  /* Send a buffer from USART to hyperterminal                                                              */
  for (TxCounter = 0; TxCounter < sizeof(HelloString); TxCounter++)
  {
    USART_SendData(COM1_PORT, HelloString[TxCounter]);
    while (USART_GetFlagStatus(COM1_PORT, USART_FLAG_TXC) == RESET);
  }

  /* Read data from Rx buffer and write to Tx buffer via polling mode in an infinite loop                   */
  while (1)
  {
    /* Waits until the Rx FIFO/DR is not empty then get data from them                                      */
    while (USART_GetFlagStatus(COM1_PORT, USART_FLAG_RXDR) == RESET);
    input[0] = USART_ReceiveData(COM1_PORT);

    /* Send data to the Tx FIFO/DR then waits until the Tx FIFO/DR is empty                                 */
    USART_SendData(COM1_PORT, (u8)input[0]);
    while (USART_GetFlagStatus(COM1_PORT, USART_FLAG_TXC) == RESET);
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
