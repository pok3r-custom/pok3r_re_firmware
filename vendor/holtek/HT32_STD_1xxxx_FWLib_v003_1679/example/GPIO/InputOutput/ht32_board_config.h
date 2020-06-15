/*********************************************************************************************************//**
 * @file    GPIO/InputOutput/ht32_board_config.h
 * @version $Rev:: 171          $
 * @date    $Date:: 2017-06-16#$
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
  #define HTCFG_OUTPUT_LED0_ID                                  (GPIO_PD)
  #define HTCFG_OUTPUT_LED1_ID                                  (GPIO_PD)
  #define HTCFG_OUTPUT_LED2_ID                                  (GPIO_PB)
  #define HTCFG_INPUT_WAKE_ID                                   (GPIO_PC)
  #define HTCFG_INPUT_KEY1_ID                                   (GPIO_PD)
  #define HTCFG_INPUT_KEY2_ID                                   (GPIO_PB)

  #define HTCFG_OUTPUT_LED0_CLK(CK)                             (CK.Bit.PD)
  #define HTCFG_OUTPUT_LED1_CLK(CK)                             (CK.Bit.PD)
  #define HTCFG_OUTPUT_LED2_CLK(CK)                             (CK.Bit.PB)
  #define HTCFG_INPUT_WAKE_CLK(CK)                              (CK.Bit.PC)
  #define HTCFG_INPUT_KEY1_CLK(CK)                              (CK.Bit.PD)
  #define HTCFG_INPUT_KEY2_CLK(CK)                              (CK.Bit.PB)

  #define HTCFG_LED0                                            (HT_GPIOD)
  #define HTCFG_LED1                                            (HT_GPIOD)
  #define HTCFG_LED2                                            (HT_GPIOB)
  #define HTCFG_WAKE                                            (HT_GPIOC)
  #define HTCFG_KEY1                                            (HT_GPIOD)
  #define HTCFG_KEY2                                            (HT_GPIOB)

  #define HTCFG_OUTPUT_LED0_AFIO_PIN                            (AFIO_PIN_0)
  #define HTCFG_OUTPUT_LED1_AFIO_PIN                            (AFIO_PIN_2)
  #define HTCFG_OUTPUT_LED2_AFIO_PIN                            (AFIO_PIN_6)
  #define HTCFG_INPUT_WAKE_AFIO_PIN                             (AFIO_PIN_15)
  #define HTCFG_INPUT_KEY1_AFIO_PIN                             (AFIO_PIN_1)
  #define HTCFG_INPUT_KEY2_AFIO_PIN                             (AFIO_PIN_9)

  #define HTCFG_OUTPUT_LED0_GPIO_PIN                            (GPIO_PIN_0)
  #define HTCFG_OUTPUT_LED1_GPIO_PIN                            (GPIO_PIN_2)
  #define HTCFG_OUTPUT_LED2_GPIO_PIN                            (GPIO_PIN_6)
  #define HTCFG_INPUT_WAKE_GPIO_PIN                             (GPIO_PIN_15)
  #define HTCFG_INPUT_KEY1_GPIO_PIN                             (GPIO_PIN_1)
  #define HTCFG_INPUT_KEY2_GPIO_PIN                             (GPIO_PIN_9)
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_OUTPUT_LED0_ID                                  (GPIO_PD)
  #define HTCFG_OUTPUT_LED1_ID                                  (GPIO_PD)
  #define HTCFG_OUTPUT_LED2_ID                                  (GPIO_PA)
  #define HTCFG_INPUT_WAKE_ID                                   (GPIO_PC)
  #define HTCFG_INPUT_KEY1_ID                                   (GPIO_PE)
  #define HTCFG_INPUT_KEY2_ID                                   (GPIO_PE)

  #define HTCFG_OUTPUT_LED0_CLK(CK)                             (CK.Bit.PD)
  #define HTCFG_OUTPUT_LED1_CLK(CK)                             (CK.Bit.PD)
  #define HTCFG_OUTPUT_LED2_CLK(CK)                             (CK.Bit.PA)
  #define HTCFG_INPUT_WAKE_CLK(CK)                              (CK.Bit.PC)
  #define HTCFG_INPUT_KEY1_CLK(CK)                              (CK.Bit.PE)
  #define HTCFG_INPUT_KEY2_CLK(CK)                              (CK.Bit.PE)

  #define HTCFG_LED0                                            (HT_GPIOD)
  #define HTCFG_LED1                                            (HT_GPIOD)
  #define HTCFG_LED2                                            (HT_GPIOA)
  #define HTCFG_WAKE                                            (HT_GPIOC)
  #define HTCFG_KEY1                                            (HT_GPIOE)
  #define HTCFG_KEY2                                            (HT_GPIOE)

  #define HTCFG_OUTPUT_LED0_AFIO_PIN                            (AFIO_PIN_7)
  #define HTCFG_OUTPUT_LED1_AFIO_PIN                            (AFIO_PIN_8)
  #define HTCFG_OUTPUT_LED2_AFIO_PIN                            (AFIO_PIN_10)
  #define HTCFG_INPUT_WAKE_AFIO_PIN                             (AFIO_PIN_15)
  #define HTCFG_INPUT_KEY1_AFIO_PIN                             (AFIO_PIN_1)
  #define HTCFG_INPUT_KEY2_AFIO_PIN                             (AFIO_PIN_2)

  #define HTCFG_OUTPUT_LED0_GPIO_PIN                            (GPIO_PIN_7)
  #define HTCFG_OUTPUT_LED1_GPIO_PIN                            (GPIO_PIN_8)
  #define HTCFG_OUTPUT_LED2_GPIO_PIN                            (GPIO_PIN_10)
  #define HTCFG_INPUT_WAKE_GPIO_PIN                             (GPIO_PIN_15)
  #define HTCFG_INPUT_KEY1_GPIO_PIN                             (GPIO_PIN_1)
  #define HTCFG_INPUT_KEY2_GPIO_PIN                             (GPIO_PIN_2)
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_OUTPUT_LED0_ID                                  (GPIO_PC)
  #define HTCFG_OUTPUT_LED1_ID                                  (GPIO_PC)
  #define HTCFG_OUTPUT_LED2_ID                                  (GPIO_PB)
  #define HTCFG_INPUT_WAKE_ID                                   (GPIO_PC)
  #define HTCFG_INPUT_KEY1_ID                                   (GPIO_PC)
  #define HTCFG_INPUT_KEY2_ID                                   (GPIO_PC)

  #define HTCFG_OUTPUT_LED0_CLK(CK)                             (CK.Bit.PC)
  #define HTCFG_OUTPUT_LED1_CLK(CK)                             (CK.Bit.PC)
  #define HTCFG_OUTPUT_LED2_CLK(CK)                             (CK.Bit.PB)
  #define HTCFG_INPUT_WAKE_CLK(CK)                              (CK.Bit.PC)
  #define HTCFG_INPUT_KEY1_CLK(CK)                              (CK.Bit.PC)
  #define HTCFG_INPUT_KEY2_CLK(CK)                              (CK.Bit.PC)

  #define HTCFG_LED0                                            (HT_GPIOC)
  #define HTCFG_LED1                                            (HT_GPIOC)
  #define HTCFG_LED2                                            (HT_GPIOB)
  #define HTCFG_WAKE                                            (HT_GPIOC)
  #define HTCFG_KEY1                                            (HT_GPIOC)
  #define HTCFG_KEY2                                            (HT_GPIOC)

  #define HTCFG_OUTPUT_LED0_AFIO_PIN                            (AFIO_PIN_7)
  #define HTCFG_OUTPUT_LED1_AFIO_PIN                            (AFIO_PIN_8)
  #define HTCFG_OUTPUT_LED2_AFIO_PIN                            (AFIO_PIN_6)
  #define HTCFG_INPUT_WAKE_AFIO_PIN                             (AFIO_PIN_15)
  #define HTCFG_INPUT_KEY1_AFIO_PIN                             (AFIO_PIN_4)
  #define HTCFG_INPUT_KEY2_AFIO_PIN                             (AFIO_PIN_5)

  #define HTCFG_OUTPUT_LED0_GPIO_PIN                            (GPIO_PIN_7)
  #define HTCFG_OUTPUT_LED1_GPIO_PIN                            (GPIO_PIN_8)
  #define HTCFG_OUTPUT_LED2_GPIO_PIN                            (GPIO_PIN_6)
  #define HTCFG_INPUT_WAKE_GPIO_PIN                             (GPIO_PIN_15)
  #define HTCFG_INPUT_KEY1_GPIO_PIN                             (GPIO_PIN_4)
  #define HTCFG_INPUT_KEY2_GPIO_PIN                             (GPIO_PIN_5)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_OUTPUT_LED0_ID                                  (GPIO_PD)
  #define HTCFG_OUTPUT_LED1_ID                                  (GPIO_PE)
  #define HTCFG_OUTPUT_LED2_ID                                  (GPIO_PE)
  #define HTCFG_INPUT_WAKE_ID                                   (GPIO_PC)
  #define HTCFG_INPUT_KEY1_ID                                   (GPIO_PD)
  #define HTCFG_INPUT_KEY2_ID                                   (GPIO_PD)

  #define HTCFG_OUTPUT_LED0_CLK(CK)                             (CK.Bit.PD)
  #define HTCFG_OUTPUT_LED1_CLK(CK)                             (CK.Bit.PE)
  #define HTCFG_OUTPUT_LED2_CLK(CK)                             (CK.Bit.PE)
  #define HTCFG_INPUT_WAKE_CLK(CK)                              (CK.Bit.PC)
  #define HTCFG_INPUT_KEY1_CLK(CK)                              (CK.Bit.PD)
  #define HTCFG_INPUT_KEY2_CLK(CK)                              (CK.Bit.PD)

  #define HTCFG_LED0                                            (HT_GPIOD)
  #define HTCFG_LED1                                            (HT_GPIOE)
  #define HTCFG_LED2                                            (HT_GPIOE)
  #define HTCFG_WAKE                                            (HT_GPIOC)
  #define HTCFG_KEY1                                            (HT_GPIOD)
  #define HTCFG_KEY2                                            (HT_GPIOD)

  #define HTCFG_OUTPUT_LED0_AFIO_PIN                            (AFIO_PIN_15)
  #define HTCFG_OUTPUT_LED1_AFIO_PIN                            (AFIO_PIN_0)
  #define HTCFG_OUTPUT_LED2_AFIO_PIN                            (AFIO_PIN_2)
  #define HTCFG_INPUT_WAKE_AFIO_PIN                             (AFIO_PIN_15)
  #define HTCFG_INPUT_KEY1_AFIO_PIN                             (AFIO_PIN_13)
  #define HTCFG_INPUT_KEY2_AFIO_PIN                             (AFIO_PIN_14)

  #define HTCFG_OUTPUT_LED0_GPIO_PIN                            (GPIO_PIN_15)
  #define HTCFG_OUTPUT_LED1_GPIO_PIN                            (GPIO_PIN_0)
  #define HTCFG_OUTPUT_LED2_GPIO_PIN                            (GPIO_PIN_2)
  #define HTCFG_INPUT_WAKE_GPIO_PIN                             (GPIO_PIN_15)
  #define HTCFG_INPUT_KEY1_GPIO_PIN                             (GPIO_PIN_13)
  #define HTCFG_INPUT_KEY2_GPIO_PIN                             (GPIO_PIN_14)
#endif

#ifdef __cplusplus
}
#endif

#endif
