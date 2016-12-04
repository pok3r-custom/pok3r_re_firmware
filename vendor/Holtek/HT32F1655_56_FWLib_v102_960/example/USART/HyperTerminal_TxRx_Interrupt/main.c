/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx_Interrupt/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
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


/* Private variables ---------------------------------------------------------------------------------------*/
u8 input;

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
  *  - USART0 Tx "Hello World!" string 10 times.
  *  - USART0 Rx character and transform to hex.(Loop)
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  USART_InitTypeDef USART_InitStructure;
  int i, j, k;
  vu8 temp[10] = {0}, temp1[10] = {0};

  /* Initialize LED1 & LED2 on HT32 board                                                                   */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  /* Enable peripheral clock of AFIO, USART0, USART1                                                        */
  CKCUClock.Bit.USART0     = 1;
  CKCUClock.Bit.UART0      = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /*
        USARTx configured as follow:
            - BaudRate = 115200 baud
            - Word Length = 8 Bits
            - One Stop Bit
            - None parity bit
  */

  /* Config AFIO mode as USART0_Rx and USART0_Tx function.                                                  */
  AFIO_GPAConfig(AFIO_PIN_2 | AFIO_PIN_3, AFIO_MODE_6);

  /* Config AFIO mode as UART0_Rx and UART0_Tx function.                                                    */
  AFIO_GPCConfig(AFIO_PIN_9 | AFIO_PIN_10, AFIO_MODE_6);

  /* Config AFIO mode as USARTx function                                                                    */
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;

  /* Configure USART0 & UART0 interrupt                                                                     */
  USART_Interrupt_Init(HT_USART0, &USART_InitStructure, USART_ALL_INT);
  USART_Interrupt_Init(HT_UART0, &USART_InitStructure, USART_ALL_INT);

  /* UR0 Tx > UR1 Tx > UR0 Rx > UR1 Rx interrupt mode                                                       */
  i = j = k = 0;
  while (1)
  {
    /* UR0 Tx                                                                                               */
    for (i = 0; i < 5; i++)
    {
      if (!IS_BUFFER_FULL(UR0TxReadIndex, UR0TxWriteIndex))
      {
        /* 0x41 = ASCII "0"                                                                                 */
        UR0TxBuf[UR0TxWriteIndex] = 0x30;
        UR0TxWriteIndex = (UR0TxWriteIndex + 1) % USART_BUFSIZE;
      }
    }
    USART_IntConfig(HT_USART0, USART_IER_THREIE, ENABLE);

    /* UR1 Tx                                                                                               */
    for (i = 0; i < 5; i++)
    {
      if (!IS_BUFFER_FULL(UR1TxReadIndex, UR1TxWriteIndex))
      {
        /* 0x41 = ASCII "A"                                                                                 */
        UR1TxBuf[UR1TxWriteIndex] = 0x41;
        UR1TxWriteIndex = (UR1TxWriteIndex + 1) % USART_BUFSIZE;
      }
    }
    USART_IntConfig(HT_UART0, USART_IER_THREIE, ENABLE);

    /* UR0 Rx                                                                                               */
    if (!IS_BUFFER_EMPTY(UR0RxReadIndex, UR0RxWriteIndex))
    {
      temp[j++] = UR0RxBuf[UR0RxReadIndex];
      UR0RxReadIndex = (UR0RxReadIndex + 1) % USART_BUFSIZE;
      if (j == 5)
      {
        j = 0;
      }
    }

    /* UR1 Rx                                                                                               */
    if (!IS_BUFFER_EMPTY(UR1RxReadIndex, UR1RxWriteIndex))
    {
      temp1[k++] = UR1RxBuf[UR1RxReadIndex];
      UR1RxReadIndex = (UR1RxReadIndex + 1) % USART_BUFSIZE;
      if (k == 5)
      {
        k = 0;
      }
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
