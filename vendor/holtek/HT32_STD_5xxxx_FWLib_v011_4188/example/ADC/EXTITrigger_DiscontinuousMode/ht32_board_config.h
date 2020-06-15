/*********************************************************************************************************//**
 * @file    ADC/EXTITrigger_DiscontinuousMode/ht32_board_config.h
 * @version $Rev:: 4003         $
 * @date    $Date:: 2019-07-05 #$
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
#if (LIBCFG_NO_ADC)
  #error "This example code does not apply to the chip you selected."
#endif

#if defined(USE_HT32F52230_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_7)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_7)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               B
  #define _HTCFG_EXTI_GPIO_PIN              2
#endif

#if defined(USE_HT32F52241_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_8)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_2)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_3)

  #define _HTCFG_EXTI_GPIO_ID               B
  #define _HTCFG_EXTI_GPIO_PIN              7
#endif

#if defined(USE_HT32F52253_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_6)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               D
  #define _HTCFG_EXTI_GPIO_PIN              1
#endif

#if defined(USE_HT32F52341_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_8)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_2)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_3)

  #define _HTCFG_EXTI_GPIO_ID               B
  #define _HTCFG_EXTI_GPIO_PIN              0
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_6)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               D
  #define _HTCFG_EXTI_GPIO_PIN              1
#endif

#if defined(USE_HT32F50230_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_2)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_4)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_2)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_3)

  #define _HTCFG_EXTI_GPIO_ID               C
  #define _HTCFG_EXTI_GPIO_PIN              2
#endif

#if defined(USE_HT32F50241_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_8)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_2)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_3)

  #define _HTCFG_EXTI_GPIO_ID               C
  #define _HTCFG_EXTI_GPIO_PIN              2
#endif

#if defined(USE_HT32F52354_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_6)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               C
  #define _HTCFG_EXTI_GPIO_PIN              14
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_6)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_10)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PC)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_12)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PC)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_5)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_13)

  #define _HTCFG_EXTI_GPIO_ID               A
  #define _HTCFG_EXTI_GPIO_PIN              0
#endif

#if defined(USE_HT32F57341_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_3)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_3)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               A
  #define _HTCFG_EXTI_GPIO_PIN              9
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PA)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_2)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_2)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               A
  #define _HTCFG_EXTI_GPIO_PIN              9
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_VR_GPIO_ID                 (GPIO_PD)
  #define HTCFG_VR_AFIO_PIN                (AFIO_PIN_4)
  #define HTCFG_VR_ADC_CH                  (ADC_CH_8)

  #define HTCFG_OTHER0_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER0_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_OTHER0_ADC_CH              (ADC_CH_0)

  #define HTCFG_OTHER1_GPIO_ID             (GPIO_PA)
  #define HTCFG_OTHER1_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_OTHER1_ADC_CH              (ADC_CH_1)

  #define _HTCFG_EXTI_GPIO_ID               C
  #define _HTCFG_EXTI_GPIO_PIN              15
#endif

#define HTCFG_EXTI_GPIO_PORT           STRCAT2(HT_GPIO, _HTCFG_EXTI_GPIO_ID)
#define HTCFG_EXTI_GPIO_PIN            STRCAT2(GPIO_PIN_, _HTCFG_EXTI_GPIO_PIN)
#define HTCFG_EXTI_CH                  STRCAT2(EXTI_CHANNEL_, _HTCFG_EXTI_GPIO_PIN)
#define HTCFG_EXTI_AFIO                STRCAT2(AFIO_EXTI_CH_, _HTCFG_EXTI_GPIO_PIN)
#define HTCFG_EXTI_ESS                 STRCAT2(AFIO_ESS_P, _HTCFG_EXTI_GPIO_ID)
#define HTCFG_EXTI_CK                  STRCAT2(P, _HTCFG_EXTI_GPIO_ID)
#define HTCFG_ADC_EXTI                 STRCAT2(ADC_TRIG_EXTI_, _HTCFG_EXTI_GPIO_PIN)

#ifdef __cplusplus
}
#endif

#endif
