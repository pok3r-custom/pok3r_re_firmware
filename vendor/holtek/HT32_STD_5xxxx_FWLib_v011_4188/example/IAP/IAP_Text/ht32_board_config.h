/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/ht32_board_config.h
 * @version $Rev:: 1521         $
 * @date    $Date:: 2017-07-03 #$
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
#if defined(USE_HT32F52230_SK)
  #define HTCFG_UART                  UART0
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           B
  #define _HTCFG_KEY1_GPION           2
#endif

#if defined(USE_HT32F52241_SK)
  #define HTCFG_UART                  UART1
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           B
  #define _HTCFG_KEY1_GPION           7
#endif

#if defined(USE_HT32F52253_SK)
  #define HTCFG_UART                  USART1
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           D
  #define _HTCFG_KEY1_GPION           1
#endif

#if defined(USE_HT32F52341_SK)
  #define HTCFG_UART                  UART1
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           B
  #define _HTCFG_KEY1_GPION           0
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_UART                  USART1
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           D
  #define _HTCFG_KEY1_GPION           1
#endif

#if defined(USE_HT32F0008_SK)
  #define HTCFG_UART                  UART0
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           C
  #define _HTCFG_KEY1_GPION           2
#endif

#if defined(USE_HT32F50230_SK)
  #define HTCFG_UART                  UART1
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           C
  #define _HTCFG_KEY1_GPION           2
#endif

#if defined(USE_HT32F50241_SK)
  #define HTCFG_UART                  UART1
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           C
  #define _HTCFG_KEY1_GPION           2
#endif

#if defined(USE_HT32F52354_SK)
  #define HTCFG_UART                  UART1
  #define HTCFG_UART_FIFO             0
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           C
  #define _HTCFG_KEY1_GPION           14
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_UART                  USART0
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             2
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             3

  #define _HTCFG_KEY1_GPIOX           A
  #define _HTCFG_KEY1_GPION           0
#endif

#if defined(USE_HT32F57341_SK)
  #define HTCFG_UART                  USART0
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           A
  #define _HTCFG_KEY1_GPION           9
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_UART                  USART0
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           A
  #define _HTCFG_KEY1_GPION           9
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_UART                  USART1
  #define HTCFG_UART_FIFO             1
  #define _HTCFG_TX_GPIOX             A
  #define _HTCFG_TX_GPION             4
  #define _HTCFG_RX_GPIOX             A
  #define _HTCFG_RX_GPION             5

  #define _HTCFG_KEY1_GPIOX           C
  #define _HTCFG_KEY1_GPION           15
#endif

#define HTCFG_UART_PORT               STRCAT2(HT_, HTCFG_UART)
#define HTCFG_UART_IRQn               STRCAT2(HTCFG_UART, _IRQn)

#define HTCFG_TX_GPIO_ID              STRCAT2(GPIO_P, _HTCFG_TX_GPIOX)
#define HTCFG_TX_AFIO_PIN             STRCAT2(AFIO_PIN_, _HTCFG_TX_GPION)

#define HTCFG_RX_GPIO_ID              STRCAT2(GPIO_P, _HTCFG_RX_GPIOX)
#define HTCFG_RX_AFIO_PIN             STRCAT2(AFIO_PIN_, _HTCFG_RX_GPION)

#define HTCFG_KEY1_CLK                STRCAT2(P, _HTCFG_KEY1_GPIOX)
#define HTCFG_KEY1_GPIO_ID            STRCAT2(GPIO_P, _HTCFG_KEY1_GPIOX)
#define HTCFG_KEY1_GPIO_PIN           STRCAT2(GPIO_PIN_, HTCFG_KEY1_GPION)


#define IAP_CODE_SIZE                 (1024 * 4)

#define IAP_APFLASH_START             (IAP_CODE_SIZE + 0)
#define IAP_APSRAM_START              (HT_SRAM_BASE)

#define BOOT_MODE_AP                  (0x55AAFAF0)
#define BOOT_MODE_IAP                 (0x55AAFAF5)
#define BOOT_MODE                     ((*((u32 volatile *) (HT_SRAM_BASE))))


#ifdef __cplusplus
}
#endif

#endif
