/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/ht32_board_config.h
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
//  #define HTCFG_SD_ENABLE_DISK

  #define HTCFG_EXTI_ESS                                (AFIO_ESS_PD)
  #define HTCFG_SD_SELECT_PIN_CLK(CK)                   (CK.Bit.PA)
  #define HTCFG_SD_SELECT                               (HT_GPIOA)
  #define HTCFG_SD_SELECT_PIN                           (AFIO_PIN_9)

  #define HTCFG_SD_SCK_PIN_ID                           (GPIO_PC)
  #define HTCFG_SD_SCK_PIN                              (AFIO_PIN_10)

  #define HTCFG_SD_MOSI_PIN_ID                          (GPIO_PC)
  #define HTCFG_SD_MOSI_PIN                             (AFIO_PIN_11)

  #define HTCFG_SD_MISO_PIN_ID                          (GPIO_PC)
  #define HTCFG_SD_MISO_PIN                             (AFIO_PIN_12)

  #define HTCFG_SDISK_READ_BUFFER                       (1024*4)

  #define HTCFG_SD_READ_FUN()                           (0)
  #define HTCFG_USBPRE_DIV                              (CKCU_USBPRE_DIV3)
#endif

#if defined(USE_HT32F1655_56)
//  #define HTCFG_SD_ENABLE_DISK

  #define HTCFG_EXTI_ESS                                (AFIO_ESS_PE)
  #define HTCFG_SD_SELECT_PIN_CLK(CK)                   (CK.Bit.PA)
  #define HTCFG_SD_SELECT                               (HT_GPIOA)
  #define HTCFG_SD_SELECT_PIN                           (AFIO_PIN_8)

  #define HTCFG_SD_SCK_PIN_ID                           (GPIO_PD)
  #define HTCFG_SD_SCK_PIN                              (AFIO_PIN_14)

  #define HTCFG_SD_MOSI_PIN_ID                          (GPIO_PD)
  #define HTCFG_SD_MOSI_PIN                             (AFIO_PIN_15)

  #define HTCFG_SD_MISO_PIN_ID                          (GPIO_PE)
  #define HTCFG_SD_MISO_PIN                             (AFIO_PIN_0)

  #define HTCFG_SDISK_READ_BUFFER                       (1024*8)
  
  #define HTCFG_SD_CD                                   (HT_GPIOA)
  #define HTCFG_SD_CD_PIN                               (AFIO_PIN_1)
  #define HTCFG_SD_READ_FUN()                           (HTCFG_SD_CD->DINR & HTCFG_SD_CD_PIN)

  #define HTCFG_USBPRE_DIV                              (CKCU_USBPRE_DIV3)
  #endif

#if defined(USE_HT32F12345)
  #define HTCFG_EXTI_ESS                                (AFIO_ESS_PC)
  #define HTCFG_SD_SELECT_PIN_CLK(CK)                   (CK.Bit.PB)
  #define HTCFG_SD_SELECT                               (HT_GPIOB)
  #define HTCFG_SD_SELECT_PIN                           (AFIO_PIN_8)

  #define HTCFG_SD_SCK_PIN_ID                           (GPIO_PB)
  #define HTCFG_SD_SCK_PIN                              (AFIO_PIN_9)

  #define HTCFG_SD_MOSI_PIN_ID                          (GPIO_PB)
  #define HTCFG_SD_MOSI_PIN                             (AFIO_PIN_10)

  #define HTCFG_SD_MISO_PIN_ID                          (GPIO_PB)
  #define HTCFG_SD_MISO_PIN                             (AFIO_PIN_11)

  #define HTCFG_SDISK_READ_BUFFER                       (1024*4)

  #define HTCFG_SD_READ_FUN()                           (0)
  #define HTCFG_USBPRE_DIV                              (CKCU_USBPRE_DIV2)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_EXTI_ESS                                (AFIO_ESS_PD)
  #define HTCFG_SD_SELECT_PIN_CLK(CK)                   (CK.Bit.PE)
  #define HTCFG_SD_SELECT                               (HT_GPIOE)
  #define HTCFG_SD_SELECT_PIN                           (AFIO_PIN_8)

  #define HTCFG_SD_SCK_PIN_ID                           (GPIO_PE)
  #define HTCFG_SD_SCK_PIN                              (AFIO_PIN_9)

  #define HTCFG_SD_MOSI_PIN_ID                          (GPIO_PE)
  #define HTCFG_SD_MOSI_PIN                             (AFIO_PIN_10)

  #define HTCFG_SD_MISO_PIN_ID                          (GPIO_PE)
  #define HTCFG_SD_MISO_PIN                             (AFIO_PIN_11)

  #define HTCFG_SDISK_READ_BUFFER                       (1024*8)

  #define HTCFG_SD_READ_FUN()                           (0)
  #define HTCFG_USBPRE_DIV                              (CKCU_USBPRE_DIV2)
#endif

#if defined(HTCFG_SD_ENABLE_DISK)
  #define HTCFG_LUN_NUM                                 (2)
  #define HTCFG_SD_DISK                                 (1)
#else
  #define HTCFG_LUN_NUM                                 (1)
  #define HTCFG_SD_DISK                                 (0)
#endif

#ifdef __cplusplus
}
#endif

#endif
