/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound_RateControl/ht32_board_config.h
 * @version $Rev:: 3999         $
 * @date    $Date:: 2019-07-04 #$
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
#if (LIBCFG_I2S) & (LIBCFG_USBD)
#else
  #error "This example code does not apply to the chip you selected."
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_I2CM_ID                                    (HT_I2C0)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C0)
  #define HTCFG_I2CM_IRQ                                   (I2C0_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_0)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_1)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PC)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_10)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_11)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_12)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PC)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_13)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PA)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_8)

  #define HTCFG_I2S_X_DIV                                  (64)
  #define HTCFG_I2S_Y_DIV                                  (125)

  #define HTCFG_FUN_I2C_IRQ                                (I2C0_IRQHandler)

  #define HTCFG_SYSTICK_1US_MUL                            (48)  /* HCLK/1MHz                               */
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_I2CM_ID                                    (HT_I2C1)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C1)
  #define HTCFG_I2CM_IRQ                                   (I2C1_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_0)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_1)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PC)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_11)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_12)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_13)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_8)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PC)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_10)

  #define HTCFG_I2S_X_DIV                                  (64)
  #define HTCFG_I2S_Y_DIV                                  (125)

  #define HTCFG_FUN_I2C_IRQ                                (I2C1_IRQHandler)

  #define HTCFG_SYSTICK_1US_MUL                            (48)  /* HCLK/1MHz                               */
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_I2CM_ID                                    (HT_I2C1)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C1)
  #define HTCFG_I2CM_IRQ                                   (I2C1_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_0)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_1)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PD)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_8)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_9)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_10)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_11)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PA)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_9)

  #define HTCFG_I2S_X_DIV                                  (51)
  #define HTCFG_I2S_Y_DIV                                  (125)

  #define HTCFG_FUN_I2C_IRQ                                (I2C1_IRQHandler)

  #define HTCFG_SYSTICK_1US_MUL                            (60)  /* HCLK/1MHz                               */
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_I2CM_ID                                    (HT_I2C1)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C1)
  #define HTCFG_I2CM_IRQ                                   (I2C1_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PB)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_15)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PC)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_0)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PD)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_8)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_9)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_10)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_8)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PA)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_9)

  #define HTCFG_I2S_X_DIV                                  (51)
  #define HTCFG_I2S_Y_DIV                                  (125)

  #define HTCFG_FUN_I2C_IRQ                                (I2C1_IRQHandler)

  #define HTCFG_SYSTICK_1US_MUL                            (60)  /* HCLK/1MHz                               */
#endif

#ifdef __cplusplus
}
#endif

#endif
