/*********************************************************************************************************//**
 * @file    ADC/PDMA_ADCResult/ht32_board_config.h
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
  #define HTCFG_VR_GPIO_ID                 (GPIO_PC)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_9)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_8)

  #define HTCFG_LED_GPIO_ID                (GPIO_PB)
  #define HTCFG_LED_GPIO_PIN               (AFIO_PIN_6)
  #define HTCFG_LED_TM_CH_NUM              (TM_CH_0)
  #define HTCFG_LED_TM_CCR                 CH0CCR
  #define HTCFG_LED_TM_CH_CTL              (TM_CHCTL_ENABLE)
  #define HTCFG_LED_TM_CH_CTL_N            (TM_CHCTL_DISABLE)
  #define HTCFG_ADC_PRESCALER              (CKCU_ADCPRE_DIV6)

  #define HTCFG_PDMA_CH                    (PDMA_CH0)
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PC)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_11)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_15)

  #define HTCFG_LED_GPIO_ID                (GPIO_PA)
  #define HTCFG_LED_GPIO_PIN               (AFIO_PIN_10)
  #define HTCFG_LED_TM_CH_NUM              (TM_CH_1)
  #define HTCFG_LED_TM_CCR                 CH1CCR
  #define HTCFG_LED_TM_CH_CTL              (TM_CHCTL_ENABLE)
  #define HTCFG_LED_TM_CH_CTL_N            (TM_CHCTL_DISABLE)
  #define HTCFG_ADC_PRESCALER              (CKCU_ADCPRE_DIV6)

  #define HTCFG_PDMA_CH                    (PDMA_CH0)
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_6)

  #define HTCFG_LED_GPIO_ID                (GPIO_PB)
  #define HTCFG_LED_GPIO_PIN               (AFIO_PIN_6)
  #define HTCFG_LED_TM_CH_NUM              (TM_CH_0)
  #define HTCFG_LED_TM_CCR                 CH0CCR
  #define HTCFG_LED_TM_CH_CTL              (TM_CHCTL_ENABLE)
  #define HTCFG_LED_TM_CH_CTL_N            (TM_CHCTL_DISABLE)
  #define HTCFG_ADC_PRESCALER              (CKCU_ADCPRE_DIV8)

  #define HTCFG_PDMA_CH                    (PDMA_CH0)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PE)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_12)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_12)

  #define HTCFG_LED_GPIO_ID                (GPIO_PE)
  #define HTCFG_LED_GPIO_PIN               (AFIO_PIN_2)
  #define HTCFG_LED_TM_CH_NUM              (TM_CH_0)
  #define HTCFG_LED_TM_CCR                 CH0CCR
  #define HTCFG_LED_TM_CH_CTL              (TM_CHCTL_DISABLE)
  #define HTCFG_LED_TM_CH_CTL_N            (TM_CHCTL_ENABLE)
  #define HTCFG_ADC_PRESCALER              (CKCU_ADCPRE_DIV8)

  #define HTCFG_PDMA_CH                    (PDMA_CH0)
#endif

#ifdef __cplusplus
}
#endif

#endif
