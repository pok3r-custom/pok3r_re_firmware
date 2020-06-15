/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/ht32_board_config.h
 * @version $Rev:: 4096         $
 * @date    $Date:: 2019-07-16 #$
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
#if defined(USE_HT32F52341_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_0)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_1)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_2)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PA)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_1)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#if defined(USE_HT32F52352_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_5)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_8)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_9)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)
  
  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_4)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#if defined(USE_HT32F0008_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI0)
  #define SD_SPI                    (HT_SPI0)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_0)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_1)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_2)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PA)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_6)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PA)
  #define SD_SPI_SEL_PORT           (HT_GPIOA)
#endif

#if defined(USE_HT32F52354_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_5)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_8)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_9)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_4)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#if defined(USE_HT32F0006_DVB)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI0)
  #define SD_SPI                    (HT_SPI0)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_0)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_1)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PA)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_2)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PA)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_6)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PA)
  #define SD_SPI_SEL_PORT           (HT_GPIOA)
#endif

#if defined(USE_HT32F57341_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_5)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_8)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_9)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_4)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#if defined(USE_HT32F57352_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_5)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_8)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_9)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_4)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#if defined(USE_HT32F52367_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.QSPI)
  #define SD_SPI                    (HT_QSPI)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PD)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_11)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PD)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_12)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PD)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_13)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PA)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_7)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PD)
  #define SD_SPI_SEL_PORT           (HT_GPIOD)
#endif

#if defined(USE_HT32F50343_SK)
  #define SD_SPI_CLK(CK)            (CK.Bit.SPI1)
  #define SD_SPI                    (HT_SPI1)

  #define SD_SPI_SCK_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SCK_AFIO_PIN       (AFIO_PIN_5)
  #define SD_SPI_SCK_AFIO_MODE      (AFIO_FUN_SPI)

  #define SD_SPI_MOSI_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MOSI_AFIO_PIN      (AFIO_PIN_8)
  #define SD_SPI_MOSI_AFIO_MODE     (AFIO_FUN_SPI)

  #define SD_SPI_MISO_GPIO_ID       (GPIO_PC)
  #define SD_SPI_MISO_AFIO_PIN      (AFIO_PIN_9)
  #define SD_SPI_MISO_AFIO_MODE     (AFIO_FUN_SPI)
  #define SD_SPI_MISO_CLK(CK)       (CK.Bit.PC)

  #define SD_SPI_SEL_GPIO_ID        (GPIO_PC)
  #define SD_SPI_SEL_GPIO_PIN       (GPIO_PIN_4)
  #define SD_SPI_SEL_AFIO_MODE      (AFIO_MODE_DEFAULT)
  #define SD_SPI_SEL_CLK(CK)        (CK.Bit.PC)
  #define SD_SPI_SEL_PORT           (HT_GPIOC)
#endif

#ifdef __cplusplus
}
#endif

#endif
