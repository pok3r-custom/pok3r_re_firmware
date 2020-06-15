/*********************************************************************************************************//**
 * @file    TM/MatchOutputToggle/ht32_board_config.h
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
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52241_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52253_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52341_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_4)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_5)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_8)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_9)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F0008_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F50230_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F50241_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52354_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_4)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_5)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_8)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_9)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F57341_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_10)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_11)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_12)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_13)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_10)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_11)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_12)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_13)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PC)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F50343_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_ID                    (GPIO_PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH0_PIN               (AFIO_PIN_0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH1_PIN               (AFIO_PIN_1)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH2_PIN               (AFIO_PIN_2)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_CH3_PIN               (AFIO_PIN_3)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_GPIO_CLK(CK)               (CK.Bit.PA)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_IRQn                       (GPTM0_IRQn)
  #define HTCFG_OUTPUT_TOGGLE_GPTM                            (HT_GPTM0)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_AFIO_MODE                  (AFIO_FUN_MCTM_GPTM)
  #define HTCFG_OUTPUT_TOGGLE_GPTM_CLK(CK)                    (CK.Bit.GPTM0)
#endif

#ifdef __cplusplus
}
#endif

#endif
