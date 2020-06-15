/*********************************************************************************************************//**
 * @file    Mono_LCD/8CHAR_14SEG_Demo/ht32_board_config.h
 * @version $Rev:: 3157         $
 * @date    $Date:: 2018-10-18 #$
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
#if defined(USE_HT32F57341_SK)
  #define HTCFG_LCD_COM0_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_COM0_AFIO_PIN             (AFIO_PIN_15)
  #define HTCFG_LCD_COM1_GPIO_ID              (GPIO_PC)
  #define HTCFG_LCD_COM1_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_LCD_COM2_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_COM2_AFIO_PIN             (AFIO_PIN_8)
  #define HTCFG_LCD_COM3_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_COM3_AFIO_PIN             (AFIO_PIN_10)

  #define HTCFG_LCD_SEG0_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG0_AFIO_PIN             (AFIO_PIN_11)
  #define HTCFG_LCD_SEG1_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG1_AFIO_PIN             (AFIO_PIN_14)
  #define HTCFG_LCD_SEG2_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG2_AFIO_PIN             (AFIO_PIN_15)
  #define HTCFG_LCD_SEG3_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG3_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_LCD_SEG4_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG4_AFIO_PIN             (AFIO_PIN_1)
  #define HTCFG_LCD_SEG5_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG5_AFIO_PIN             (AFIO_PIN_2)
  #define HTCFG_LCD_SEG6_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG6_AFIO_PIN             (AFIO_PIN_3)
  #define HTCFG_LCD_SEG7_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG7_AFIO_PIN             (AFIO_PIN_4)
  #define HTCFG_LCD_SEG8_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG8_AFIO_PIN             (AFIO_PIN_5)
  #define HTCFG_LCD_SEG9_GPIO_ID              (GPIO_PC)
  #define HTCFG_LCD_SEG9_AFIO_PIN             (AFIO_PIN_14)
  #define HTCFG_LCD_SEG10_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG10_AFIO_PIN            (AFIO_PIN_15)
  #define HTCFG_LCD_SEG11_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG11_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_LCD_SEG12_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG12_AFIO_PIN            (AFIO_PIN_5)
  #define HTCFG_LCD_SEG13_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG13_AFIO_PIN            (AFIO_PIN_8)
  #define HTCFG_LCD_SEG14_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG14_AFIO_PIN            (AFIO_PIN_9)
  #define HTCFG_LCD_SEG15_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG15_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_LCD_SEG16_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG16_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_LCD_SEG17_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG17_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_LCD_SEG18_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG18_AFIO_PIN            (AFIO_PIN_3)
  #define HTCFG_LCD_SEG19_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG19_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_LCD_SEG20_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG20_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_LCD_SEG21_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG21_AFIO_PIN            (AFIO_PIN_3)
  #define HTCFG_LCD_SEG22_GPIO_ID             (GPIO_PB)
  #define HTCFG_LCD_SEG22_AFIO_PIN            (AFIO_PIN_6)
  #define HTCFG_LCD_SEG23_GPIO_ID             (GPIO_PB)
  #define HTCFG_LCD_SEG23_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_LCD_SEG24_GPIO_ID             (GPIO_PB)
  #define HTCFG_LCD_SEG24_AFIO_PIN            (AFIO_PIN_8)
  #define HTCFG_LCD_SEG25_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG25_AFIO_PIN            (AFIO_PIN_10)
  #define HTCFG_LCD_SEG26_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG26_AFIO_PIN            (AFIO_PIN_11)
  #define HTCFG_LCD_SEG27_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG27_AFIO_PIN            (AFIO_PIN_12)
  #define HTCFG_LCD_SEG28_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG28_AFIO_PIN            (AFIO_PIN_13)
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_LCD_SEG32_MODE
  #define HTCFG_LCD_COM0_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_COM0_AFIO_PIN             (AFIO_PIN_15)
  #define HTCFG_LCD_COM1_GPIO_ID              (GPIO_PC)
  #define HTCFG_LCD_COM1_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_LCD_COM2_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_COM2_AFIO_PIN             (AFIO_PIN_8)
  #define HTCFG_LCD_COM3_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_COM3_AFIO_PIN             (AFIO_PIN_10)

  #define HTCFG_LCD_SEG0_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG0_AFIO_PIN             (AFIO_PIN_11)
  #define HTCFG_LCD_SEG1_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG1_AFIO_PIN             (AFIO_PIN_14)
  #define HTCFG_LCD_SEG2_GPIO_ID              (GPIO_PA)
  #define HTCFG_LCD_SEG2_AFIO_PIN             (AFIO_PIN_15)
  #define HTCFG_LCD_SEG3_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG3_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_LCD_SEG4_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG4_AFIO_PIN             (AFIO_PIN_1)
  #define HTCFG_LCD_SEG5_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG5_AFIO_PIN             (AFIO_PIN_2)
  #define HTCFG_LCD_SEG6_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG6_AFIO_PIN             (AFIO_PIN_3)
  #define HTCFG_LCD_SEG7_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG7_AFIO_PIN             (AFIO_PIN_4)
  #define HTCFG_LCD_SEG8_GPIO_ID              (GPIO_PB)
  #define HTCFG_LCD_SEG8_AFIO_PIN             (AFIO_PIN_5)
  #define HTCFG_LCD_SEG9_GPIO_ID              (GPIO_PC)
  #define HTCFG_LCD_SEG9_AFIO_PIN             (AFIO_PIN_14)
  #define HTCFG_LCD_SEG10_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG10_AFIO_PIN            (AFIO_PIN_15)
  #define HTCFG_LCD_SEG11_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG11_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_LCD_SEG12_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG12_AFIO_PIN            (AFIO_PIN_5)
  #define HTCFG_LCD_SEG13_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG13_AFIO_PIN            (AFIO_PIN_8)
  #define HTCFG_LCD_SEG14_GPIO_ID             (GPIO_PC)
  #define HTCFG_LCD_SEG14_AFIO_PIN            (AFIO_PIN_9)
  #define HTCFG_LCD_SEG15_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG15_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_LCD_SEG16_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG16_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_LCD_SEG17_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG17_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_LCD_SEG18_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG18_AFIO_PIN            (AFIO_PIN_3)
  #define HTCFG_LCD_SEG19_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG19_AFIO_PIN            (AFIO_PIN_11)
  #define HTCFG_LCD_SEG20_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG20_AFIO_PIN            (AFIO_PIN_12)
  #define HTCFG_LCD_SEG21_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG21_AFIO_PIN            (AFIO_PIN_13)
  #define HTCFG_LCD_SEG22_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG22_AFIO_PIN            (AFIO_PIN_14)
  #define HTCFG_LCD_SEG23_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG23_AFIO_PIN            (AFIO_PIN_15)
  #define HTCFG_LCD_SEG24_GPIO_ID             (GPIO_PE)
  #define HTCFG_LCD_SEG24_AFIO_PIN            (AFIO_PIN_0)
  #define HTCFG_LCD_SEG25_GPIO_ID             (GPIO_PE)
  #define HTCFG_LCD_SEG25_AFIO_PIN            (AFIO_PIN_1)
  #define HTCFG_LCD_SEG26_GPIO_ID             (GPIO_PE)
  #define HTCFG_LCD_SEG26_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_LCD_SEG27_GPIO_ID             (GPIO_PE)
  #define HTCFG_LCD_SEG27_AFIO_PIN            (AFIO_PIN_3)
  #define HTCFG_LCD_SEG28_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG28_AFIO_PIN            (AFIO_PIN_6)
  #define HTCFG_LCD_SEG29_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG29_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_LCD_SEG30_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG30_AFIO_PIN            (AFIO_PIN_8)
  #define HTCFG_LCD_SEG31_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG31_AFIO_PIN            (AFIO_PIN_9)
  #define HTCFG_LCD_SEG32_GPIO_ID             (GPIO_PD)
  #define HTCFG_LCD_SEG32_AFIO_PIN            (AFIO_PIN_10)
#endif
#ifdef __cplusplus
}
#endif

#endif
