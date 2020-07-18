/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound/ht32_board_config.h
 * @version $Rev:: 1020         $
 * @date    $Date:: 2017-12-30 #$
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
  #define HTCFG_I2CM_ID                                    (HT_I2C1)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C1)
  #define HTCFG_I2CM_IRQ                                   (I2C1_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_0)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_1)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PC)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_1)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PB)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_10)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PB)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_11)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_7)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PC)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_0)

  #define HTCFG_I2S_X_DIV                                  (86)
  #define HTCFG_I2S_Y_DIV                                  (252)
  #define HTCFG_USBPRE_DIV                                 (CKCU_USBPRE_DIV3)
  #define HTCFG_FUN_I2C_IRQ                                (I2C1_IRQHandler)
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_I2CM_ID                                    (HT_I2C0)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C0)
  #define HTCFG_I2CM_IRQ                                   (I2C0_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PB)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_12)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PB)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_13)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PD)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_1)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_2)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_3)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PD)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_4)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PE)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_14)

  #define HTCFG_I2S_X_DIV                                  (86)
  #define HTCFG_I2S_Y_DIV                                  (252)
  #define HTCFG_USBPRE_DIV                                 (CKCU_USBPRE_DIV3)
  #define HTCFG_FUN_I2C_IRQ                                (I2C0_IRQHandler)
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_I2CM_ID                                    (HT_I2C1)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C1)
  #define HTCFG_I2CM_IRQ                                   (I2C1_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_0)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PA)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_1)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PC)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_1)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_2)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PC)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_3)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_8)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PC)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_0)

  #define HTCFG_I2S_X_DIV                                  (32)
  #define HTCFG_I2S_Y_DIV                                  (125)
  #define HTCFG_USBPRE_DIV                                 (CKCU_USBPRE_DIV2)
  #define HTCFG_FUN_I2C_IRQ                                (I2C1_IRQHandler)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_I2CM_ID                                    (HT_I2C0)
  #define HTCFG_I2CM_CKCU(ck)                              (ck.Bit.I2C0)
  #define HTCFG_I2CM_IRQ                                   (I2C0_IRQn)
  #define HTCFG_I2CM_MASTER_SCK_ID                         (GPIO_PB)
  #define HTCFG_I2CM_MASTER_SCK_AFIO_PIN                   (AFIO_PIN_12)
  #define HTCFG_I2CM_MASTER_SDA_ID                         (GPIO_PB)
  #define HTCFG_I2CM_MASTER_SDA_AFIO_PIN                   (AFIO_PIN_13)

  #define HTCFG_I2S_BCLK_ID                                (GPIO_PD)
  #define HTCFG_I2S_BCLK_ADIO_PIN                          (AFIO_PIN_1)
  #define HTCFG_I2S_SDO_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDO_ADIO_PIN                           (AFIO_PIN_2)
  #define HTCFG_I2S_SDI_ID                                 (GPIO_PD)
  #define HTCFG_I2S_SDI_ADIO_PIN                           (AFIO_PIN_3)
  #define HTCFG_I2S_MCLK_ID                                (GPIO_PA)
  #define HTCFG_I2S_MCLK_ADIO_PIN                          (AFIO_PIN_11)
  #define HTCFG_I2S_WS_ID                                  (GPIO_PE)
  #define HTCFG_I2S_WS_ADIO_PIN                            (AFIO_PIN_14)

  #define HTCFG_I2S_X_DIV                                  (32)
  #define HTCFG_I2S_Y_DIV                                  (125)
  #define HTCFG_USBPRE_DIV                                 (CKCU_USBPRE_DIV2)
  #define HTCFG_FUN_I2C_IRQ                                (I2C0_IRQHandler)
#endif

#ifdef __cplusplus
}
#endif

#endif
