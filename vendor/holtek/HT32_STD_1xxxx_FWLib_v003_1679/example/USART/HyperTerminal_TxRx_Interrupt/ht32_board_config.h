/*********************************************************************************************************//**
 * @file    USART/HyperTerminal_TxRx_Interrupt/ht32_board_config.h
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   The header file of board configuration.
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
/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32_BOARD_CONFIG_H
#define __HT32_BOARD_CONFIG_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Settings ------------------------------------------------------------------------------------------------*/
#if defined(USE_HT32F1653_54)
  #define HTCFG_UART0_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_TX_PIN                (AFIO_PIN_2)
  #define HTCFG_UART0_RX_PIN                (AFIO_PIN_3)
  #define HTCFG_UART0                       (HT_USART0)
  #define HTCFG_UART0_CLK(CK)               (CK.Bit.USART0)

  #define HTCFG_UART1_TX_GPIO_ID            (GPIO_PC)
  #define HTCFG_UART1_RX_GPIO_ID            (GPIO_PC)
  #define HTCFG_UART1_TX_PIN                (AFIO_PIN_9)
  #define HTCFG_UART1_RX_PIN                (AFIO_PIN_10)
  #define HTCFG_UART1                       (HT_UART0)
  #define HTCFG_UART1_CLK(CK)               (CK.Bit.UART0)

  #define HTCFG_UART0_IRQ                   (USART0_IRQn)
  #define HTCFG_UART0_IRQ_FUN               USART0_IRQHandler
  #define HTCFG_UART1_IRQ                   (UART0_IRQn)
  #define HTCFG_UART1_IRQ_FUN               UART0_IRQHandler 

  #define _HTCFG_UART_RXTL_LEVEL             1
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_UART0_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_TX_PIN                (AFIO_PIN_2)
  #define HTCFG_UART0_RX_PIN                (AFIO_PIN_3)
  #define HTCFG_UART0                       (HT_USART0)
  #define HTCFG_UART0_CLK(CK)               (CK.Bit.USART0)
   
  #define HTCFG_UART1_TX_GPIO_ID            (GPIO_PC)
  #define HTCFG_UART1_RX_GPIO_ID            (GPIO_PC)
  #define HTCFG_UART1_TX_PIN                (AFIO_PIN_9)
  #define HTCFG_UART1_RX_PIN                (AFIO_PIN_10)
  #define HTCFG_UART1                       (HT_UART0)
  #define HTCFG_UART1_CLK(CK)               (CK.Bit.UART0)

  #define HTCFG_UART0_IRQ                   (USART0_IRQn)
  #define HTCFG_UART0_IRQ_FUN               USART0_IRQHandler
  #define HTCFG_UART1_IRQ                   (UART0_IRQn)
  #define HTCFG_UART1_IRQ_FUN               UART0_IRQHandler 

  #define _HTCFG_UART_RXTL_LEVEL             1
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_UART0_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_TX_PIN                (AFIO_PIN_2)
  #define HTCFG_UART0_RX_PIN                (AFIO_PIN_3)
  #define HTCFG_UART0                       (HT_USART0)
  #define HTCFG_UART0_CLK(CK)               (CK.Bit.USART0)

  #define HTCFG_UART1_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART1_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART1_TX_PIN                (AFIO_PIN_14)
  #define HTCFG_UART1_RX_PIN                (AFIO_PIN_15)
  #define HTCFG_UART1                       (HT_USART1)
  #define HTCFG_UART1_CLK(CK)               (CK.Bit.USART1)

  #define HTCFG_UART0_IRQ                   (USART0_IRQn)
  #define HTCFG_UART0_IRQ_FUN               USART0_IRQHandler
  #define HTCFG_UART1_IRQ                   (USART1_IRQn)
  #define HTCFG_UART1_IRQ_FUN               USART1_IRQHandler

  #define _HTCFG_UART_RXTL_LEVEL            1
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_UART0_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART0_TX_PIN                (AFIO_PIN_8)
  #define HTCFG_UART0_RX_PIN                (AFIO_PIN_10)
  #define HTCFG_UART0                       (HT_USART0)
  #define HTCFG_UART0_CLK(CK)               (CK.Bit.USART0)
   
  #define HTCFG_UART1_TX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART1_RX_GPIO_ID            (GPIO_PA)
  #define HTCFG_UART1_TX_PIN                (AFIO_PIN_14)
  #define HTCFG_UART1_RX_PIN                (AFIO_PIN_15)
  #define HTCFG_UART1                       (HT_USART1)
  #define HTCFG_UART1_CLK(CK)               (CK.Bit.USART1)

  #define HTCFG_UART0_IRQ                   (USART0_IRQn)
  #define HTCFG_UART0_IRQ_FUN               USART0_IRQHandler
  #define HTCFG_UART1_IRQ                   (USART1_IRQn)
  #define HTCFG_UART1_IRQ_FUN               USART1_IRQHandler 

  #define _HTCFG_UART_RXTL_LEVEL             1
#endif

#define HTCFG_UART_RXTL STRCAT2(USART_RXTL_0,_HTCFG_UART_RXTL_LEVEL)

#ifdef __cplusplus
}
#endif

#endif
