/*********************************************************************************************************//**
 * @file    TM/SinglePulseMode/ht32_board_config.h
 * @version $Rev:: 4000         $
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
#if defined(USE_HT32F52230_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_0)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (39999)     //(40M/(Prescaler * 500)) -1        = 39999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (30000)     //40000 - (40M/(Prescaler * 2000))  = 30000
#endif

#if defined(USE_HT32F52241_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_0)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (39999)     //(40M/(Prescaler * 500)) -1        = 39999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (30000)     //40000 - (40M/(Prescaler * 2000))  = 30000
#endif

#if defined(USE_HT32F52253_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_0)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (39999)     //(40M/(Prescaler * 500)) -1        = 39999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (30000)     //40000 - (40M/(Prescaler * 2000))  = 30000
#endif

#if defined(USE_HT32F52341_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_0)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (47999)     //(40M/(Prescaler * 500)) -1        = 47999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (36000)     //48000 - (40M/(Prescaler * 2000))  = 36000
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PC)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_5)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (47999)     //(48M/(Prescaler * 500)) -1         = 47999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (36000)     //48000 - (48M/(Prescaler * 2000))   = 36000
#endif

#if defined(USE_HT32F0008_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_0)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (60M/(Prescaler * 2000))  = 45000
#endif

#if defined(USE_HT32F50230_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_8)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_PWM1)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_13)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.PWM1)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_3)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (19999)     //(20M/(Prescaler * 500)) -1        = 19999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (15000)     //20000 - (20M/(Prescaler * 2000))  = 15000
#endif

#if defined(USE_HT32F50241_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_8)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_PWM1)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_13)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.PWM1)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_3)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (19999)     //(20M/(Prescaler * 500)) -1        = 19999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (15000)     //20000 - (20M/(Prescaler * 2000))  = 15000
#endif

#if defined(USE_HT32F52354_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_8)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_SCTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_13)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.SCTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_0)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (20M/(Prescaler * 2000))  = 45000
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PC)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_5)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (47999)     //(48M/(Prescaler * 500)) -1         = 47999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (36000)     //48000 - (48M/(Prescaler * 2000))   = 36000
#endif

#if defined(USE_HT32F57341_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PC)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_11)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (60M/(Prescaler * 2000))  = 45000
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PC)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_11)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (60M/(Prescaler * 2000))  = 45000
#endif

#if defined(USE_HT32F50343_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_1)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (60M/(Prescaler * 2000))  = 45000
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_SINGLE_PULSE_GPTM_GPIO_ID                     (GPIO_PA)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN                    (AFIO_PIN_1)
  #define HTCFG_SINGLE_PULSE_GPTM                             (HT_GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE                   (AFIO_MODE_4)
  #define HTCFG_SINGLE_PULSE_GPTM_CLK(CK)                     (CK.Bit.GPTM0)
  #define HTCFG_SINGLE_PULSE_GPTM_CH                          (TM_CH_1)
  #define HTCFG_SINGLE_PULSE_COUNTER_RELOAD                   (59999)     //(60M/(Prescaler * 500)) -1        = 59999
  #define HTCFG_SINGLE_PULSE_COMPARE                          (45000)     //60000 - (60M/(Prescaler * 2000))  = 45000
#endif

#ifdef __cplusplus
}
#endif
#endif
