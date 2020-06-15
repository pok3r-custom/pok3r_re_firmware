/*********************************************************************************************************//**
 * @file    EXTI/Software_Trigger/ht32_board_config.h
 * @version $Rev:: 542          $
 * @date    $Date:: 2017-07-17 #$
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
  #define HTCFG_EXTI_CK(ck)              (ck.Bit.PD)
  #define HTCFG_EXTI_GPIO_PORT           (HT_GPIOD)
  #define HTCFG_EXTI_GPIO_PIN            (GPIO_PIN_1)
  #define HTCFG_EXTI_AFIO_CH             (AFIO_EXTI_CH_1)
  #define HTCFG_EXTI_CH                  (EXTI_CHANNEL_1)
  #define HTCFG_EXTI_ESS                 (AFIO_ESS_PD)
  #define HTCFG_EXIT_IRQn                (EXTI1_IRQn)
  #define HTCFG_FUN_EXTI_Handler         (EXTI1_IRQHandler)
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_EXTI_CK(ck)              (ck.Bit.PE)
  #define HTCFG_EXTI_GPIO_PORT           (HT_GPIOE)
  #define HTCFG_EXTI_GPIO_PIN            (GPIO_PIN_1)
  #define HTCFG_EXTI_AFIO_CH             (AFIO_EXTI_CH_1)
  #define HTCFG_EXTI_CH                  (EXTI_CHANNEL_1)
  #define HTCFG_EXTI_ESS                 (AFIO_ESS_PE)
  #define HTCFG_EXIT_IRQn                (EXTI1_IRQn)
  #define HTCFG_FUN_EXTI_Handler         (EXTI1_IRQHandler)
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_EXTI_CK(ck)              (ck.Bit.PC)
  #define HTCFG_EXTI_GPIO_PORT           (HT_GPIOC)
  #define HTCFG_EXTI_GPIO_PIN            (GPIO_PIN_4)
  #define HTCFG_EXTI_AFIO_CH             (AFIO_EXTI_CH_4)
  #define HTCFG_EXTI_CH                  (EXTI_CHANNEL_4)
  #define HTCFG_EXTI_ESS                 (AFIO_ESS_PC)
  #define HTCFG_EXIT_IRQn                (EXTI4_IRQn)
  #define HTCFG_FUN_EXTI_Handler         (EXTI4_IRQHandler)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_EXTI_CK(ck)              (ck.Bit.PD)
  #define HTCFG_EXTI_GPIO_PORT           (HT_GPIOD)
  #define HTCFG_EXTI_GPIO_PIN            (GPIO_PIN_13)
  #define HTCFG_EXTI_AFIO_CH             (AFIO_EXTI_CH_13)
  #define HTCFG_EXTI_CH                  (EXTI_CHANNEL_13)
  #define HTCFG_EXTI_ESS                 (AFIO_ESS_PD)
  #define HTCFG_EXIT_IRQn                (EXTI13_IRQn)
  #define HTCFG_FUN_EXTI_Handler         (EXTI13_IRQHandler)
#endif

#ifdef __cplusplus
}
#endif

#endif
