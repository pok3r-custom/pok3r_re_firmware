/*********************************************************************************************************//**
 * @file    SCI/ATR/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2017-11-13 #$
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
#if defined(USE_HT32F1654_DVB)
  #error "This example code does not apply to ESK32-360/ESK32-370 (the Development Board)."
#endif

#if defined(USE_HT32F1656_DVB)
  #error "This example code does not apply to ESK32-300/ESK32-310 (the Development Board)."
#endif

#if defined(USE_HT32F12366_SK)
  #define HTCFG_SMARTCARD_SCI                 (HT_SCI1)
  #define HTCFG_SMARTCARD_CLK(CK)             (CK.Bit.SCI1)
  #define HTCFG_SMARTCARD_IRQn                (SCI_IRQn)

  #define HTCFG_SMARTCARD_CMD_GPIO_ID         (GPIO_PA)
  #define HTCFG_SMARTCARD_CMD_GPIO_PIN        (GPIO_PIN_0)
  #define HTCFG_SMARTCARD_CMD_AFIO_PIN        (AFIO_PIN_0)
  #define HTCFG_SMARTCARD_CMD_AFIO_MODE       (AFIO_FUN_GPIO)
  #define HTCFG_SMARTCARD_CMD_CLK(CK)         (CK.Bit.PA)
  #define HTCFG_SMARTCARD_RSTN_GPIO_ID        (GPIO_PB)
  #define HTCFG_SMARTCARD_RSTN_GPIO_PIN       (GPIO_PIN_6)
  #define HTCFG_SMARTCARD_RSTN_AFIO_PIN       (AFIO_PIN_6)
  #define HTCFG_SMARTCARD_RSTN_AFIO_MODE      (AFIO_FUN_GPIO)
  #define HTCFG_SMARTCARD_RSTN_CLK(CK)        (CK.Bit.PB)

  #define HTCFG_SMARTCARD_CLK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SMARTCARD_CLK_AFIO_PIN        (AFIO_PIN_9)
  #define HTCFG_SMARTCARD_CLK_AFIO_MODE       (AFIO_FUN_SCI)
  #define HTCFG_SMARTCARD_CLK_CLK(CK)         (CK.Bit.PB)
  #define HTCFG_SMARTCARD_DET_GPIO_ID         (GPIO_PB)
  #define HTCFG_SMARTCARD_DET_AFIO_PIN        (AFIO_PIN_10)
  #define HTCFG_SMARTCARD_DET_AFIO_MODE       (AFIO_FUN_SCI)
  #define HTCFG_SMARTCARD_DET_CLK(CK)         (CK.Bit.PB)
  #define HTCFG_SMARTCARD_DIO_GPIO_ID         (GPIO_PB)
  #define HTCFG_SMARTCARD_DIO_AFIO_PIN        (AFIO_PIN_11)
  #define HTCFG_SMARTCARD_DIO_AFIO_MODE       (AFIO_FUN_SCI)
  #define HTCFG_SMARTCARD_DIO_CLK(CK)         (CK.Bit.PB)
#endif

#if defined(USE_HT32F12345_SK)
  #error "This exsample code does not apply to the chip you selected."
#endif

#ifdef __cplusplus
}
#endif

#endif
