/*********************************************************************************************************//**
 * @file    SPI/PDMA/ht32_board_config.h
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
  #define HTCFG_SPI_ENABLE_ID                      (HT_GPIOA)

  #define HTCFG_SPI_MASTER_SEL_CLOCK(CKCUClock)    (CKCUClock.Bit.PA)
  #define HTCFG_SPI_MASTER_SEL_GPIO_PIN            (GPIO_PIN_7)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PORT          (GPIO_PA)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PORT          (GPIO_PA)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PIN           (AFIO_PIN_5)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PIN           (AFIO_PIN_6)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PORT           (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PORT           (GPIO_PC)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PIN             (AFIO_PIN_1)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PIN            (AFIO_PIN_3)
#endif

#if defined(USE_HT32F1655_56)
  #define HTCFG_SPI_ENABLE_ID                      (HT_GPIOA)

  #define HTCFG_SPI_MASTER_SEL_CLOCK(CKCUClock)    (CKCUClock.Bit.PA)
  #define HTCFG_SPI_MASTER_SEL_GPIO_PIN            (GPIO_PIN_7)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PORT          (GPIO_PA)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PORT          (GPIO_PA)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PIN           (AFIO_PIN_5)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PIN           (AFIO_PIN_6)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PORT            (GPIO_PD)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PORT            (GPIO_PD)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PORT           (GPIO_PD)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PORT           (GPIO_PE)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PIN             (AFIO_PIN_13)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PIN             (AFIO_PIN_14)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PIN            (AFIO_PIN_15)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PIN            (AFIO_PIN_0)
#endif

#if defined(USE_HT32F12345)
  #define HTCFG_SPI_ENABLE_ID                      (HT_GPIOA)

  #define HTCFG_SPI_MASTER_SEL_CLOCK(CKCUClock)    (CKCUClock.Bit.PA)
  #define HTCFG_SPI_MASTER_SEL_GPIO_PIN            (GPIO_PIN_7)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PORT          (GPIO_PA)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PORT          (GPIO_PA)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PIN           (AFIO_PIN_5)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PIN           (AFIO_PIN_6)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PORT           (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PORT           (GPIO_PC)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PIN             (AFIO_PIN_9)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PIN             (AFIO_PIN_10)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PIN            (AFIO_PIN_11)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PIN            (AFIO_PIN_12)
#endif

#if defined(USE_HT32F12365_66)
  #define HTCFG_SPI_ENABLE_ID                      (HT_GPIOA)

  #define HTCFG_SPI_MASTER_SEL_CLOCK(CKCUClock)    (CKCUClock.Bit.PA)
  #define HTCFG_SPI_MASTER_SEL_GPIO_PIN            (GPIO_PIN_7)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PORT           (GPIO_PA)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PORT          (GPIO_PA)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PORT          (GPIO_PA)

  #define HTCFG_SPI_MASTER_SEL_AFIO_PIN            (AFIO_PIN_7)
  #define HTCFG_SPI_MASTER_SCK_AFIO_PIN            (AFIO_PIN_4)
  #define HTCFG_SPI_MASTER_MOSI_AFIO_PIN           (AFIO_PIN_5)
  #define HTCFG_SPI_MASTER_MISO_AFIO_PIN           (AFIO_PIN_6)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PORT            (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PORT           (GPIO_PC)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PORT           (GPIO_PC)

  #define HTCFG_SPI_SLAVE_SEL_AFIO_PIN             (AFIO_PIN_0)
  #define HTCFG_SPI_SLAVE_SCK_AFIO_PIN             (AFIO_PIN_1)
  #define HTCFG_SPI_SLAVE_MOSI_AFIO_PIN            (AFIO_PIN_2)
  #define HTCFG_SPI_SLAVE_MISO_AFIO_PIN            (AFIO_PIN_3)
#endif

#ifdef __cplusplus
}
#endif

#endif
