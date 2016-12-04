/*********************************************************************************************************//**
 * @file    ht32f1655_56_rstcu.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of the Reset Control Unit library.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F1655_56_RSTCU_H
#define __HT32F1655_56_RSTCU_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @addtogroup RSTCU
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup RSTCU_Exported_Types RSTCU exported types
  * @{
  */

/**
 * @brief Enumeration of Global reset status.
 */
typedef enum
{
  RSTCU_FLAG_SYSRST = 0,
  RSTCU_FLAG_EXTRST,
  RSTCU_FLAG_WDTRST,
  RSTCU_FLAG_PORST
} RSTCU_RSTF_TypeDef;

/**
 * @brief Definition of initial structure of peripheral reset.
 */
typedef union
{
  struct
  {
    unsigned long PDMA       :1;
    unsigned long            :4;
    unsigned long USBD       :1;
    unsigned long EBI        :1;
    unsigned long CRC        :1;
    unsigned long PA         :1;
    unsigned long PB         :1;
    unsigned long PC         :1;
    unsigned long PD         :1;
    unsigned long PE         :1;
    unsigned long            :19;

    unsigned long I2C0       :1;
    unsigned long I2C1       :1;
    unsigned long            :2;
    unsigned long SPI0       :1;
    unsigned long SPI1       :1;
    unsigned long            :2;
    unsigned long USART0     :1;
    unsigned long USART1     :1;
    unsigned long UART0      :1;
    unsigned long UART1      :1;
    unsigned long            :2;
    unsigned long AFIO       :1;
    unsigned long EXTI       :1;
    unsigned long            :8;
    unsigned long SCI        :1;
    unsigned long I2S        :1;
    unsigned long            :6;

    unsigned long MCTM0      :1;
    unsigned long MCTM1      :1;
    unsigned long            :2;
    unsigned long WDT        :1;
    unsigned long            :3;
    unsigned long GPTM0      :1;
    unsigned long GPTM1      :1;
    unsigned long            :6;
    unsigned long BFTM0      :1;
    unsigned long BFTM1      :1;
    unsigned long            :4;
    unsigned long OPA0       :1;
    unsigned long OPA1       :1;
    unsigned long ADC        :1;
    unsigned long            :7;
  } Bit;
  u32 Reg[3];
} RSTCU_PeripReset_TypeDef;

/**
  * @}
  */


/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup RSTCU_Exported_Constants RSTCU exported constants
  * @{
  */
#ifdef HT32_USE_VER100
/*  Definitions of AHB peripheral reset                                                                     */
#define RSTCU_AHBRST_PDMA         (1UL)
#define RSTCU_AHBRST_USB          (1UL << 5)
#define RSTCU_AHBRST_EBI          (1UL << 6)
#define RSTCU_AHBRST_CRC          (1UL << 7)
#define RSTCU_AHBRST_PA           (1UL << 8)
#define RSTCU_AHBRST_PB           (1UL << 9)
#define RSTCU_AHBRST_PC           (1UL << 10)
#define RSTCU_AHBRST_PD           (1UL << 11)
#define RSTCU_AHBRST_PE           (1UL << 12)

#define IS_RSTCU_AHBRST(PERIPH)   ((PERIPH == RSTCU_AHBRST_PDMA) ||\
                                   (PERIPH == RSTCU_AHBRST_USB) || \
                                   (PERIPH == RSTCU_AHBRST_EBI) || \
                                   (PERIPH == RSTCU_AHBRST_CRC) || \
                                   (PERIPH == RSTCU_AHBRST_PA) || \
                                   (PERIPH == RSTCU_AHBRST_PB) || \
                                   (PERIPH == RSTCU_AHBRST_PC) || \
                                   (PERIPH == RSTCU_AHBRST_PD) || \
                                   (PERIPH == RSTCU_AHBRST_PE))

/*  Definitions of APB peripheral 0 reset                                                                   */
#define RSTCU_APBRST0_I2C0         (1UL)
#define RSTCU_APBRST0_I2C1         (1UL << 1)
#define RSTCU_APBRST0_SPI0         (1UL << 4)
#define RSTCU_APBRST0_SPI1         (1UL << 5)
#define RSTCU_APBRST0_USART0       (1UL << 8)
#define RSTCU_APBRST0_USART1       (1UL << 9)
#define RSTCU_APBRST0_UART0        (1UL << 10)
#define RSTCU_APBRST0_UART1        (1UL << 11)
#define RSTCU_APBRST0_AFIO         (1UL << 14)
#define RSTCU_APBRST0_EXTI         (1UL << 15)
#define RSTCU_APBRST0_SCI          (1UL << 24)
#define RSTCU_APBRST0_I2S          (1UL << 25)

#define IS_RSTCU_APBRST0(PERIPH)   ((PERIPH == RSTCU_APBRST0_I2C0) ||\
                                    (PERIPH == RSTCU_APBRST0_I2C1) ||\
                                    (PERIPH == RSTCU_APBRST0_SPI0) ||\
                                    (PERIPH == RSTCU_APBRST0_SPI1) ||\
                                    (PERIPH == RSTCU_APBRST0_USART0) ||\
                                    (PERIPH == RSTCU_APBRST0_USART1) ||\
                                    (PERIPH == RSTCU_APBRST0_UART0) ||\
                                    (PERIPH == RSTCU_APBRST0_UART1) ||\
                                    (PERIPH == RSTCU_APBRST0_AFIO) || \
                                    (PERIPH == RSTCU_APBRST0_EXTI) || \
                                    (PERIPH == RSTCU_APBRST0_SCI) || \
                                    (PERIPH == RSTCU_APBRST0_I2S))

/* Definitions of APB peripheral 1 reset                                                                    */
#define RSTCU_APBRST1_MCTM0       (1UL)
#define RSTCU_APBRST1_MCTM1       (1UL << 1)
#define RSTCU_APBRST1_WDT         (1UL << 4)
#define RSTCU_APBRST1_GPTM0       (1UL << 8)
#define RSTCU_APBRST1_GPTM1       (1UL << 9)
#define RSTCU_APBRST1_BFTM0       (1UL << 16)
#define RSTCU_APBRST1_BFTM1       (1UL << 17)
#define RSTCU_APBRST1_OPA0        (1UL << 22)
#define RSTCU_APBRST1_OPA1        (1UL << 23)
#define RSTCU_APBRST1_ADC         (1UL << 24)

#define IS_RSTCU_APBRST1(PERIPH)  ((PERIPH == RSTCU_APBRST1_MCTM0) || \
                                    (PERIPH == RSTCU_APBRST1_MCTM1) || \
                                    (PERIPH == RSTCU_APBRST1_WDT) || \
                                    (PERIPH == RSTCU_APBRST1_GPTM0) || \
                                    (PERIPH == RSTCU_APBRST1_GPTM1) || \
                                    (PERIPH == RSTCU_APBRST1_BFTM0) || \
                                    (PERIPH == RSTCU_APBRST1_BFTM1) || \
                                    (PERIPH == RSTCU_APBRST1_OPA0) || \
                                    (PERIPH == RSTCU_APBRST1_OPA1) || \
                                    (PERIPH == RSTCU_APBRST1_ADC))
#endif

/* Other definitions                                                                                        */
#define IS_RSTCU_FLAG(FLAG)       ((FLAG == RSTCU_FLAG_SYSRST) || \
                                   (FLAG == RSTCU_FLAG_EXTRST) || \
                                   (FLAG == RSTCU_FLAG_WDTRST) || \
                                   (FLAG == RSTCU_FLAG_PORST))

/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup RSTCU_Exported_Functions RSTCU exported functions
  * @{
  */
FlagStatus RSTCU_GetResetFlagStatus(RSTCU_RSTF_TypeDef RSTCU_RSTF);
void RSTCU_ClearResetFlag(RSTCU_RSTF_TypeDef RSTCU_RSTF);
void RSTCU_ClearAllResetFlag(void);
#ifdef HT32_USE_VER100
void RSTCU_AHBPeripReset(u32 RSTCU_AHBP, ControlStatus Cmd);
void RSTCU_APBPerip0Reset(u32 RSTCU_APBP, ControlStatus Cmd);
void RSTCU_APBPerip1Reset(u32 RSTCU_APBP, ControlStatus Cmd);
#endif
void RSTCU_PeripReset(RSTCU_PeripReset_TypeDef Reset, ControlStatus Cmd);

/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif
