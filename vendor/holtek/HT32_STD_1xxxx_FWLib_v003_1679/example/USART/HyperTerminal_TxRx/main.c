/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx/main.c
 * @version $Rev:: 171          $
 * @date    $Date:: 2017-06-16 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USART_Examples USART
  * @{
  */

/** @addtogroup HyperTerminal_TxRx
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Enable peripheral clock of AFIO, HTCFG_USART.
  *  - Config AFIO mode as Rx and Tx function.
  *  - UART configuration:
  *     - BaudRate = 115200 baud
  *     - Word Length = 8 Bits
  *     - One Stop Bit
  *     - None parity bit
  *  - HTCFG_USART Tx "Hello World!" string 10 times.
  *  - HTCFG_USART Rx character and transform to hex.(Loop)
  *
  ***********************************************************************************************************/
int main(void)
{
  USART_InitTypeDef USART_InitStructure;
  int input;

  /* Enable peripheral clock of AFIO, UART                                                                  */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO   = 1;
  HTCFG_USART_CLK(CKCUClock) = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as Rx and Tx function.                                                                */
  AFIO_GPxConfig(HTCFG_USART_TX_GPIO_ID, HTCFG_USART_TX_PIN,AFIO_MODE_6);
  AFIO_GPxConfig(HTCFG_USART_RX_GPIO_ID, HTCFG_USART_RX_PIN,AFIO_MODE_6);

  /* UART configuration ------------------------------------------------------------------------------------*/
  /* UART configured as follow:
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
  USART_TxCmd(HTCFG_USART, ENABLE);
  USART_RxCmd(HTCFG_USART, ENABLE);

  /* HTCFG_USART Tx "Hello World!" string 10 times.                                                           */
  for (input = 0; input < 10; input++)
  {
    printf("Hello World! %d\r\n", (int)input);
  }

  /* HTCFG_USART Rx character and transform to hex.(Loop)                                                     */
  while (1)
  {
    printf("Please input key for printf....");
    input = getchar();
    printf("\r\nYour input is %c[0x%x]\r\n\r\n", input, input);
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
