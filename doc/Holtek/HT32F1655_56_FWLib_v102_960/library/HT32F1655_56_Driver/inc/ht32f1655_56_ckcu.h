/*********************************************************************************************************//**
 * @file    ht32f1655_56_ckcu.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of the Clock Control Unit library.
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
#ifndef __HT32F1655_56_CKCU_H
#define __HT32F1655_56_CKCU_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @addtogroup CKCU
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup CKCU_Exported_Types CKCU exported types
  * @{
  */

/**
 * @brief Enumeration of CK_REF prescaler.
 */
typedef enum
{
  CKCU_CKREFPRE_DIV2 = 0,
  CKCU_CKREFPRE_DIV4,
  CKCU_CKREFPRE_DIV6,
  CKCU_CKREFPRE_DIV8,
  CKCU_CKREFPRE_DIV10,
  CKCU_CKREFPRE_DIV12,
  CKCU_CKREFPRE_DIV14,
  CKCU_CKREFPRE_DIV16,
  CKCU_CKREFPRE_DIV18,
  CKCU_CKREFPRE_DIV20,
  CKCU_CKREFPRE_DIV22,
  CKCU_CKREFPRE_DIV24,
  CKCU_CKREFPRE_DIV26,
  CKCU_CKREFPRE_DIV28,
  CKCU_CKREFPRE_DIV30,
  CKCU_CKREFPRE_DIV32,
  CKCU_CKREFPRE_DIV34,
  CKCU_CKREFPRE_DIV36,
  CKCU_CKREFPRE_DIV38,
  CKCU_CKREFPRE_DIV40,
  CKCU_CKREFPRE_DIV42,
  CKCU_CKREFPRE_DIV44,
  CKCU_CKREFPRE_DIV46,
  CKCU_CKREFPRE_DIV48,
  CKCU_CKREFPRE_DIV50,
  CKCU_CKREFPRE_DIV52,
  CKCU_CKREFPRE_DIV54,
  CKCU_CKREFPRE_DIV56,
  CKCU_CKREFPRE_DIV58,
  CKCU_CKREFPRE_DIV60,
  CKCU_CKREFPRE_DIV62,
  CKCU_CKREFPRE_DIV64
} CKCU_CKREFPRE_TypeDef;

/**
 * @brief Enumeration of CK_USART prescaler.
 */
typedef enum
{
  CKCU_URPRE_DIV1 = 0,
  CKCU_URPRE_DIV2
} CKCU_URPRE_TypeDef;

/**
 * @brief Enumeration of CK_USB prescaler.
 */
typedef enum
{
  CKCU_USBPRE_DIV1 = 0,
  CKCU_USBPRE_DIV2,
  CKCU_USBPRE_DIV3
} CKCU_USBPRE_TypeDef;

/**
 * @brief Enumeration of WDT clock source.
 */
typedef enum
{
  CKCU_WDTSRC_LSI = 0,
  CKCU_WDTSRC_LSE
} CKCU_WDTSRC_TypeDef;

/**
 * @brief Enumeration of PLL clock source.
 */
typedef enum
{
  CKCU_PLLSRC_HSE = 0,
  CKCU_PLLSRC_HSI
} CKCU_PLLSRC_TypeDef;

/**
 * @brief Enumeration of CK_AHB prescaler.
 */
typedef enum
{
  CKCU_SYSCLK_DIV1 = 0,
  CKCU_SYSCLK_DIV2,
  CKCU_SYSCLK_DIV4,
  CKCU_SYSCLK_DIV8
} CKCU_SYSCLKDIV_TypeDef;

/**
 * @brief Enumeration of CK_ADC prescaler.
 */
typedef enum
{
  CKCU_ADCPRE_DIV2 = 1,
  CKCU_ADCPRE_DIV4,
  CKCU_ADCPRE_DIV8,
  CKCU_ADCPRE_DIV16,
  CKCU_ADCPRE_DIV32,
  CKCU_ADCPRE_DIV64,
  CKCU_ADCPRE_DIV6
} CKCU_ADCPRE_TypeDef;

/**
 * @brief Enumeration of System clock source.
 */
typedef enum
{
  CKCU_SW_PLL = 1,
  CKCU_SW_HSE,
  CKCU_SW_HSI
} CKCU_SW_TypeDef;

/**
 * @brief Enumeration of CKOUT clock source.
 */
typedef enum
{
  CKCU_CKOUTSRC_REFCK = 0,
  CKCU_CKOUTSRC_HCLK_DIV16,
  CKCU_CKOUTSRC_SYSCK_DIV16,
  CKCU_CKOUTSRC_HSECK_DIV16,
  CKCU_CKOUTSRC_HSICK_DIV16,
  CKCU_CKOUTSRC_LSECK,
  CKCU_CKOUTSRC_LSICK
} CKCU_CKOUTSRC_TypeDef;

/**
 * @brief Enumeration of PLL clock source status.
 */
typedef enum
{
  CKCU_PLLST_SYSCK  = 1,
  CKCU_PLLST_USB    = 4,
  CKCU_PLLST_REFCK  = 8
} CKCU_PLLST_TypeDef;

/**
 * @brief Enumeration of HSI clock source status.
 */
typedef enum
{
  CKCU_HSIST_SYSCK  = 1,
  CKCU_HSIST_PLL    = 2,
  CKCU_HSIST_CKM    = 4
} CKCU_HSIST_TypeDef;

/**
 * @brief Enumeration of HSE clock source status.
 */
typedef enum
{
  CKCU_HSEST_SYSCK  = 1,
  CKCU_HSEST_PLL
} CKCU_HSEST_TypeDef;

/**
 * @brief Definition of initial structure for CKOUT function.
 */
typedef struct
{
  CKCU_CKOUTSRC_TypeDef CKOUTSRC;
} CKCU_CKOUTInitTypeDef;

/**
 * @brief Definition of initial structure of PLL frequency.
 */
typedef struct
{
  u16 CFG;
  CKCU_PLLSRC_TypeDef ClockSource;
  EventStatus BYPASSCmd;
} CKCU_PLLInitTypeDef;

/**
 * @brief Definition of structure for clock frequency.
 */
typedef struct
{
  u32 PLL_Freq;
  u32 SYSCK_Freq;
  u32 HCLK_Freq;
  u32 USART_Freq;
  u32 ADC_Freq;
} CKCU_ClocksTypeDef;

/**
 * @brief Definition of initial structure of peripheral clock control.
 */
typedef union
{
  struct
  {
    unsigned long FMC        :1;
    unsigned long            :1;
    unsigned long SRAM       :1;
    unsigned long            :1;
    unsigned long PDMA       :1;
    unsigned long BM         :1;
    unsigned long APB0       :1;
    unsigned long APB1       :1;
    unsigned long            :2;
    unsigned long USBD       :1;
    unsigned long CKREF      :1;
    unsigned long EBI        :1;
    unsigned long CRC        :1;
    unsigned long            :2;
    unsigned long PA         :1;
    unsigned long PB         :1;
    unsigned long PC         :1;
    unsigned long PD         :1;
    unsigned long PE         :1;
    unsigned long            :11;

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
    unsigned long            :1;
    unsigned long BKP        :1;
    unsigned long            :1;
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
} CKCU_PeripClockConfig_TypeDef;

/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup CKCU_Exported_Constants CKCU exported constants
  * @{
  */

/* Definitions of clock ready flag                                                                          */
#define CKCU_FLAG_PLLRDY        (1UL << 1)
#define CKCU_FLAG_HSERDY        (1UL << 2)
#define CKCU_FLAG_HSIRDY        (1UL << 3)
#define CKCU_FLAG_LSERDY        (1UL << 4)
#define CKCU_FLAG_LSIRDY        (1UL << 5)

#define IS_CKCU_FLAG(FLAG)      (((FLAG & 0xFFFFFFC1) == 0) && (FLAG != 0))

/* Definitions of clock interrupt & flag                                                                    */
#define CKCU_INT_CKS            (1UL)
#define CKCU_INT_PLLRDY         (1UL << 2)
#define CKCU_INT_HSERDY         (1UL << 3)
#define CKCU_INT_HSIRDY         (1UL << 4)
#define CKCU_INT_LSERDY         (1UL << 5)
#define CKCU_INT_LSIRDY         (1UL << 6)

#define IS_CKCU_INT_FLAG(FLAG)  (((FLAG & 0xFFFFFF82) == 0) && (FLAG != 0))

#define CKCU_INT_CKSIE          (1UL << 16)
#define CKCU_INT_PLLRDYIE       (1UL << 18)
#define CKCU_INT_HSERDYIE       (1UL << 19)
#define CKCU_INT_HSIRDYIE       (1UL << 20)
#define CKCU_INT_LSERDYIE       (1UL << 21)
#define CKCU_INT_LSIRDYIE       (1UL << 22)

#define IS_CKCU_INT(IT)         (((IT & 0xFF82FFFF) == 0) && (IT != 0))

/* Definitions of PLL frequency                                                                             */
#define CKCU_PLL_4M_144M        ((u32)0x1200)
#define CKCU_PLL_4M_96M         ((u32)0x0C00)
#define CKCU_PLL_8M_144M        ((u32)0x0900)
#define CKCU_PLL_8M_96M         ((u32)0x0600)
#define CKCU_PLL_8M_72M         ((u32)0x0480)
#define CKCU_PLL_12M_144M       ((u32)0x0600)
#define CKCU_PLL_12M_96M        ((u32)0x0400)
#define CKCU_PLL_16M_144M       ((u32)0x0480)
#define CKCU_PLL_16M_96M        ((u32)0x0300)

#ifdef HT32_USE_VER100
/* Definitions of APB peripheral clock control                                                              */
#define CKCU_APBEN0_I2C0        (1UL)
#define CKCU_APBEN0_I2C1        (1UL << 1)
#define CKCU_APBEN0_SPI0        (1UL << 4)
#define CKCU_APBEN0_SPI1        (1UL << 5)
#define CKCU_APBEN0_USART0      (1UL << 8)
#define CKCU_APBEN0_USART1      (1UL << 9)
#define CKCU_APBEN0_UART0       (1UL << 10)
#define CKCU_APBEN0_UART1       (1UL << 11)
#define CKCU_APBEN0_AFIO        (1UL << 14)
#define CKCU_APBEN0_EXTI        (1UL << 15)
#define CKCU_APBEN0_SCI         (1UL << 24)
#define CKCU_APBEN0_I2S         (1UL << 25)

#define IS_CKCU_APBEN0(PERIPH)  (((PERIPH & 0xFCFF30CC) == 0) && (PERIPH != 0))

#define CKCU_APBEN1_MCTM0       (1UL)
#define CKCU_APBEN1_MCTM1       (1UL << 1)
#define CKCU_APBEN1_WDT         (1UL << 4)
#define CKCU_APBEN1_RTC         (1UL << 6)
#define CKCU_APBEN1_GPTM0       (1UL << 8)
#define CKCU_APBEN1_GPTM1       (1UL << 9)
#define CKCU_APBEN1_BFTM0       (1UL << 16)
#define CKCU_APBEN1_BFTM1       (1UL << 17)
#define CKCU_APBEN1_OPA0        (1UL << 22)
#define CKCU_APBEN1_OPA1        (1UL << 23)
#define CKCU_APBEN1_ADC         (1UL << 24)

#define IS_CKCU_APBEN1(PERIPH)  (((PERIPH & 0xFE3CFCAC) == 0) && (PERIPH != 0))

#define CKCU_APBEN0_ALL (CKCU_APBEN0_I2C0   | CKCU_APBEN0_I2C1   | CKCU_APBEN0_SPI0  | CKCU_APBEN0_SPI1  | \
                         CKCU_APBEN0_USART0 | CKCU_APBEN0_USART1 | CKCU_APBEN0_UART0 | CKCU_APBEN0_UART1 | \
                         CKCU_APBEN0_AFIO   | CKCU_APBEN0_EXTI   | CKCU_APBEN0_SCI   | CKCU_APBEN0_I2S)

#define CKCU_APBEN1_ALL (CKCU_APBEN1_MCTM0 | CKCU_APBEN1_MCTM1 | CKCU_APBEN1_WDT   | CKCU_APBEN1_RTC   | \
                         CKCU_APBEN1_GPTM0 | CKCU_APBEN1_GPTM1 | CKCU_APBEN1_BFTM0 | CKCU_APBEN1_BFTM1 | \
                         CKCU_APBEN1_OPA0  | CKCU_APBEN1_OPA1  | CKCU_APBEN1_ADC)
#endif

/* Definitions of MCU debug control                                                                         */
#define CKCU_DBG_SLEEP          (1UL)
#define CKCU_DBG_DEEPSLEEP1     (1UL << 1)
#define CKCU_DBG_POWERDOWN      (1UL << 2)
#define CKCU_DBG_WDT_HALT       (1UL << 3)
#define CKCU_DBG_MCTM0_HALT     (1UL << 4)
#define CKCU_DBG_MCTM1_HALT     (1UL << 5)
#define CKCU_DBG_GPTM0_HALT     (1UL << 6)
#define CKCU_DBG_GPTM1_HALT     (1UL << 7)
#define CKCU_DBG_USART0_HALT    (1UL << 8)
#define CKCU_DBG_USART1_HALT    (1UL << 9)
#define CKCU_DBG_SPI0_HALT      (1UL << 10)
#define CKCU_DBG_SPI1_HALT      (1UL << 11)
#define CKCU_DBG_I2C0_HALT      (1UL << 12)
#define CKCU_DBG_I2C1_HALT      (1UL << 13)
#define CKCU_DBG_DEEPSLEEP2     (1UL << 14)
#define CKCU_DBG_SCI_HALT       (1UL << 15)
#define CKCU_DBG_BFTM0_HALT     (1UL << 16)
#define CKCU_DBG_BFTM1_HALT     (1UL << 17)
#define CKCU_DBG_UART0_HALT     (1UL << 18)
#define CKCU_DBG_UART1_HALT     (1UL << 19)
#define CKCU_DBG_TRACE_ON       (1UL << 20)

#define IS_CKCU_DBG(MODE)       (((MODE & 0xFFE00000) == 0) && (MODE != 0))

/* Definitions of AHB clock control                                                                         */
#define CKCU_AHBEN_SLEEP_FMC    (1UL)
#define CKCU_AHBEN_SLEEP_SRAM   (1UL << 2)
#define CKCU_AHBEN_SLEEP_BM     (1UL << 5)
#define CKCU_AHBEN_SLEEP_APB0   (1UL << 6)
#define CKCU_AHBEN_SLEEP_APB1   (1UL << 7)

#define IS_CKCU_SLEEP_AHB(PERIPH)  (((PERIPH & 0xFFFFFF1A) == 0) && (PERIPH != 0))

#ifdef HT32_USE_VER100
#define CKCU_AHBEN_PDMA         (1UL << 4)
#define CKCU_AHBEN_USB          (1UL << 10)
#define CKCU_AHBEN_CKREF        (1UL << 11)
#define CKCU_AHBEN_EBI          (1UL << 12)
#define CKCU_AHBEN_CRC          (1UL << 13)
#define CKCU_AHBEN_PA           (1UL << 16)
#define CKCU_AHBEN_PB           (1UL << 17)
#define CKCU_AHBEN_PC           (1UL << 18)
#define CKCU_AHBEN_PD           (1UL << 19)
#define CKCU_AHBEN_PE           (1UL << 20)

#define IS_CKCU_AHBEN(PERIPH)   (((PERIPH & 0xFFE0CBEF) == 0) && (PERIPH != 0))
#endif
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup CKCU_Exported_Functions CKCU exported functions
  * @{
  */
void CKCU_DeInit(void);

void CKCU_HSICmd(EventStatus Cmd);
void CKCU_HSECmd(EventStatus Cmd);
void CKCU_PLLCmd(EventStatus Cmd);
bool CKCU_IS_HSI_USED(CKCU_HSIST_TypeDef Target);
bool CKCU_IS_HSE_USED(CKCU_HSEST_TypeDef Target);
bool CKCU_IS_PLL_USED(CKCU_PLLST_TypeDef Target);
FlagStatus CKCU_GetClockReadyStatus(u32 CKCU_FLAG);
ErrStatus CKCU_WaitHSEReady(void);

ErrStatus CKCU_SysClockConfig(CKCU_SW_TypeDef CLKSRC);
u32 CKCU_GetSysClockSource(void);

void CKCU_PLLInit(CKCU_PLLInitTypeDef *PLLInit);
void CKCU_PeripClockConfig(CKCU_PeripClockConfig_TypeDef Clock, ControlStatus Cmd);
void CKCU_SleepClockConfig(u32 CKCU_CLK, ControlStatus Cmd);

void CKCU_SetHCLKPrescaler(CKCU_SYSCLKDIV_TypeDef HCLKPRE);
void CKCU_SetCKREFPrescaler(CKCU_CKREFPRE_TypeDef CKREFPRE);
void CKCU_SetUSARTPrescaler(CKCU_URPRE_TypeDef URPRE);
void CKCU_SetUSBPrescaler(CKCU_USBPRE_TypeDef USBPRE);
void CKCU_SetADCPrescaler(CKCU_ADCPRE_TypeDef ADCPRE);

#ifdef HT32_USE_VER100
void CKCU_APBPerip0ClockConfig(u32 CKCU_APBP, ControlStatus Cmd);
void CKCU_APBPerip1ClockConfig(u32 CKCU_APBP, ControlStatus Cmd);
void CKCU_AHBPeripClockConfig(u32 CKCU_CLK, ControlStatus Cmd);
#endif

void CKCU_GetClocksFrequency(CKCU_ClocksTypeDef* CKCU_Clk);
u32 CKCU_GetUSARTClockFreq(void);
u32 CKCU_GetPLLFrequency(void);

void CKCU_CKMCmd(ControlStatus Cmd);
void CKCU_PSRCWKUPCmd(ControlStatus Cmd);
void CKCU_BKISOCmd(EventStatus Cmd);
void CKCU_CKOUTConfig(CKCU_CKOUTInitTypeDef *CKOUTInit);
void CKCU_MCUDBGConfig(u32 CKCU_DBGx, ControlStatus Cmd);

void CKCU_IntConfig(u32 CKCU_INT, ControlStatus Cmd);
FlagStatus CKCU_GetIntStatus(u8 CKCU_INT);
void CKCU_ClearIntFlag(u8 CKCU_INT);
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
