/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx_Interrupt/main.c
 * @version $Rev:: 1355         $
 * @date    $Date:: 2018-08-02 #$
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
#include "usart_int.h"
#include <string.h>

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup HyperTerminal_TxRx_Interrupt
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
const char HelloString[] = "Hello, this is USART Tx/Rx interrupt example. Please enter 5 characters...\r\n";

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Enable peripheral clock of AFIO, COM1.
  *  - Config AFIO mode as COM1_Rx, COM1_Tx function.
  *  - USART0, USART1 configuration:
  *     - BaudRate = 115200 baud
  *     - Word Length = 8 Bits
  *     - One Stop Bit
  *     - None parity bit
  *  - COM1 Rx character and move to URRxBuf, then copy to URTxBuf.
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  USART_InitTypeDef USART_InitStructure;
  /* Initialize LED1 & LED2 on HT32 board                                                                   */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  /* Enable peripheral clock of AFIO, USART0                                                                */
  CKCUClock.Bit.AFIO       = 1;
  COM1_CLK(CKCUClock)      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as COM1_Rx and COM1_Tx function.                                                      */
  AFIO_GPxConfig(COM1_TX_GPIO_ID, COM1_TX_AFIO_PIN, AFIO_FUN_USART_UART);
  AFIO_GPxConfig(COM1_RX_GPIO_ID, COM1_RX_AFIO_PIN, AFIO_FUN_USART_UART);

  /* COM1 configuration ------------------------------------------------------------------------------------*/
  /* COM1 configured as follow:
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
  USART_Init(COM1_PORT  , &USART_InitStructure);

  /* Seting COM1_PORT interrupt-flag                                                                        */
  USART_IntConfig(COM1_PORT, USART_INT_RXDR, ENABLE);
  /* Enable COM1_PORT                                                                                       */
  USART_TxCmd(COM1_PORT, ENABLE);
  USART_RxCmd(COM1_PORT, ENABLE);
  /* Configure USART0 & USART1 interrupt                                                                    */
  NVIC_EnableIRQ(COM1_IRQn);

  /* COM1 Tx                                                                                                 */
  URTxWriteIndex = sizeof(HelloString);
  memcpy(URTxBuf, HelloString, sizeof(HelloString));
  USART_IntConfig(COM1_PORT, USART_INT_TXDE, ENABLE);
  /* URx Tx > URx Rx
  COM1 Rx > COM1 Rx interrupt mode                                                                          */
  while (1)
  {
    /* COM1 Rx.waiting for receive the fifth data,
    then move date from UR1RxBuf to UR1TxBuf.                                                               */
    if (URRxWriteIndex >= 5)
    {
      memcpy(URTxBuf, URRxBuf, 5);
      URRxWriteIndex = 0;
      /* COM1 Tx                                                                                             */
      URTxWriteIndex = 5;
      USART_IntConfig(COM1_PORT, USART_INT_TXDE, ENABLE);
    }
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
