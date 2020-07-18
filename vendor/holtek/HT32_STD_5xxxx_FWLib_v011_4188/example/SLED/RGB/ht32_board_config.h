/*********************************************************************************************************//**
 * @file    SLED/RGB/ht32_board_config.h
 * @version $Rev:: 3964         $
 * @date    $Date:: 2019-06-05 #$
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
#if defined(USE_HT32F50343_SK)
  #define HTCFG_SLED                               (HT_SLED1)
  #define HTCFG_SLED_CLK(ck)                       (ck.Bit.SLED1)
  #define HTCFG_SLED_GPIO_ID                       (GPIO_PA)
  #define HTCFG_SLED_AFIO_PIN                      (AFIO_PIN_0)
  #define HTCFG_SLED_CK_PRESCALER                  (3)           /* 60M/HTCFG_SLED_CK_PRESCALER    = 20M Hz */
  #define HTCFG_SLED_BAUDRATE                      (25)          /* 20M/HTCFG_SLED_BAUDRATE        = 800K Hz*/
  #define HTCFG_SLED_T0H                           (5)           /* 5/25 = 20% Duty. 800K*(100/20) = 4M Hz  */
  #define HTCFG_SLED_TH1                           (20)          /* 20/25 = 80% Duty. 800K*(100/80)= 1M HZ  */
#endif

#ifdef __cplusplus
}
#endif

#endif
