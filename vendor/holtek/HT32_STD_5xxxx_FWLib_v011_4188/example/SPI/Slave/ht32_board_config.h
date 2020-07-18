/*********************************************************************************************************//**
 * @file    SPI/Slave/ht32_board_config.h
 * @version $Rev:: 4177         $
 * @date    $Date:: 2019-08-03 #$
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
  #define HTCFG_INT_GPIO_ID                   (GPIO_PA)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PA)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_2)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_3)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PA)
#endif

#if defined(USE_HT32F52241_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_10)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_11)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F52253_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PC)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PC)

  #define HTCFG_SLAVE_SPI                     (HT_SPI1)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI1_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_15)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_0)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_1)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_14)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PA)
#endif

#if defined(USE_HT32F52341_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PC)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PC)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_10)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_11)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F52352_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F0008_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F50230_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F50241_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F52354_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F0006_DVB)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PC)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PC)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_6)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_7)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PA)
#endif

#if defined(USE_HT32F57341_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F57352_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F50343_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_3)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PB)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PB)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_2)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PB)
#endif

#if defined(USE_HT32F52367_SK)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PB)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PB)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PE)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_1)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_9)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_6)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_7)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PA)
#endif

#if defined(USE_HT32F65240_DVB)
  #define HTCFG_INT_GPIO_ID                   (GPIO_PA)
  #define HTCFG_INT_GPIO_PIN                  (GPIO_PIN_0)
  #define HTCFG_INT_CLK(CK)                   (CK.Bit.PA)

  #define HTCFG_SLAVE_SPI                     (HT_SPI0)
  #define HTCFG_SLAVE_SPI_IRQ                 (SPI0_IRQn)

  #define HTCFG_SLAVE_SPI_SCK_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SCK_AFIO_PIN        (AFIO_PIN_2)

  #define HTCFG_SLAVE_SPI_MOSI_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MOSI_AFIO_PIN       (AFIO_PIN_5)

  #define HTCFG_SLAVE_SPI_MISO_GPIO_ID        (GPIO_PA)
  #define HTCFG_SLAVE_SPI_MISO_AFIO_PIN       (AFIO_PIN_4)

  #define HTCFG_SLAVE_SPI_SEL_GPIO_ID         (GPIO_PA)
  #define HTCFG_SLAVE_SPI_SEL_AFIO_PIN        (GPIO_PIN_3)
  #define HTCFG_SLAVE_CLK(CK)                 (CK.Bit.PA)
#endif

#ifdef __cplusplus
}
#endif

#endif
