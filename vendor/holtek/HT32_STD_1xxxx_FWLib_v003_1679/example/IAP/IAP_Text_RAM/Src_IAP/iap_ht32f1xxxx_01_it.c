/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/Src_IAP/iap_ht32f1xxxx_01_it.c
 * @version $Rev:: 1372         $
 * @date    $Date:: 2018-08-03 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"
#include "iap_buffer.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup Text_mode_RAM Text mode(execute on RAM)
  * @{
  */

/** @addtogroup Text_mode_RAM_IAP IAP
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
 * @brief   This function handles Hard Fault exception.
 * @retval  None
 ************************************************************************************************************/
void HardFault_Handler(void)
{
  #if 1

  static vu32 gIsContinue = 0;
  /*--------------------------------------------------------------------------------------------------------*/
  /* For development FW, MCU run into the while loop when the hardfault occurred.                           */
  /* 1. Stack Checking                                                                                      */
  /*    When a hard fault exception occurs, MCU push following register into the stack (main or process     */
  /*    stack). Confirm R13(SP) value in the Register Window and typing it to the Memory Windows, you can   */
  /*    check following register, especially the PC value (indicate the last instruction before hard fault).*/
  /*    SP + 0x00    0x04    0x08    0x0C    0x10    0x14    0x18    0x1C                                   */
  /*           R0      R1      R2      R3     R12      LR      PC    xPSR                                   */
  while (gIsContinue == 0)
  {
  }
  /* 2. Step Out to Find the Clue                                                                           */
  /*    Change the variable "gIsContinue" to any other value than zero in a Local or Watch Window, then     */
  /*    step out the HardFault_Handler to reach the first instruction after the instruction which caused    */
  /*    the hard fault.                                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/

  #else

  /*--------------------------------------------------------------------------------------------------------*/
  /* For production FW, you shall consider to reboot the system when hardfault occurred.                    */
  /*--------------------------------------------------------------------------------------------------------*/
  NVIC_SystemReset();

  #endif
}

/*********************************************************************************************************//**
 * @brief   This function handles UxART interrupt.
 * @retval  None
 ************************************************************************************************************/
void UxART_IRQHandler(void)
{
  u32 j;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Move data from USART FIFO to buffer when Rx timeout                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
  if (USART_GetFlagStatus(HTCFG_UART_PORT, USART_FLAG_TOUT))
  {

    while(USART_GetFlagStatus(HTCFG_UART_PORT, USART_FLAG_RXDNE))
    {
      #if 0
      if (IS_BUFFER_FULL())
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Should not reach here! It means the buffer for USART is full.                                    */
        /*--------------------------------------------------------------------------------------------------*/
        while (1);
      }
      #endif
      j = BufferIndex.Write;
      u8Buffer[j] = (HTCFG_UART_PORT->DR & (u32)0x000000FF);
      BufferIndex.Write = (j + 1) % BUFFER_SIZE;
    }
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* Move data from USART FIFO to buffer when Rx FIFO level reached                                         */
  /*--------------------------------------------------------------------------------------------------------*/
  if (USART_GetFlagStatus(HTCFG_UART_PORT, USART_FLAG_RXDR))
  {
    u32 i;
    for (i = HTCFG_IAP_RX_FIFO_SIZE; i != 0; i--)
    {
      #if 0
      if (IS_BUFFER_FULL())
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Should not reach here! It means the buffer for USART is full.                                    */
        /*--------------------------------------------------------------------------------------------------*/
        while (1);
      }
      #endif
      j = BufferIndex.Write;
      u8Buffer[j] = (HTCFG_UART_PORT->DR & (u32)0x000000FF);
      BufferIndex.Write = (j + 1) % BUFFER_SIZE;
    }
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

/**
  * @}
  */
