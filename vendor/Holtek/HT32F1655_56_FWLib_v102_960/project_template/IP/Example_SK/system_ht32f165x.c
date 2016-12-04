/**************************************************************************//**
 * @file    IP/Example_SK/system_ht32f165x.c
 * @brief   CMSIS Cortex-M3 Device Peripheral Access Layer Source File
 *          for the Holtek HT32F165x Device Series
 * @version $Rev:: 818          $
 * @date    $Date:: 2015-01-14 #$
 *
 * @note
 * Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved.
 *
 * @par
 * ARM Limited (ARM) supplies this software for Cortex-M processor-based
 * microcontrollers. This file can be freely distributed within development
 * tools that are supporting such ARM based processors.
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/

/** @addtogroup CMSIS
  * @{
  */

/** @addtogroup HT32F165x_system HT32F165x System
  * @{
  */


#include "ht32.h"

/** @addtogroup HT32F165x_System_Private_Defines
  * @{
  */
/*
//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
*/

/*--------------------- Clock Configuration ----------------------------------
//
//    <h> High Speed Internal RC Oscillator Configuration (HSI)
//      <q0>    HSI Enable
//                <i> Default HSI = ENABLE
//    </h>
//
//    <h> High Speed External Crystal Oscillator Configuration (HSE)
//      <e1>    HSE Enable
//                <i> Default HSE = DISABLE
//      </e>
//    </h>
//
//    <h> PLL Configuration
//      <e2>    PLL Enable
//                <i> Default PLL = DISABLE
//        <o3>  PLL Clock Source
//                <0=> CK_HSE
//                <1=> CK_HSI
//                <i> Default PLL clock source = CK_HSI
//                <i> PLL source clock must be in the range of 4 MHz to 16 MHz
//        <o4>  PLL Feedback Clock Divider (NF2): 1 ~ 64
//                <1-64:1>
//                <i> PLL feedback clock = PLL clock source x NF2
//                <i> PLL feedback clock must be in the range of 64 MHz to 144 MHz
//        <o5>  PLL Output Clock Divider (NO2)
//                <0=> 1
//                <1=> 2
//                <2=> 4
//                <3=> 8
//                <i> PLL output clock = PLL feedback clock / NO2
//                <i> PLL output clock must be in the range of 8 MHz to 144 MHz
//      </e>
//    </h>
//
//    <h> SystemCoreClock Configuration (CK_AHB)
//      <o6>    SystemCoreClock Source
//                <1=> CK_PLL
//                <2=> CK_HSE
//                <3=> CK_HSI
//                <i> Default SystemCoreClock source = CK_HSI
//      <o7>    SystemCoreClock Source Divider
//                <0=> 1
//                <1=> 2
//                <2=> 4
//                <3=> 8
//                <i> Default SystemCoreClock source divider = 1
//    </h>
//
//    <h> FLASH Configuration
//      <o8>    Wait state
//                <0=> Force WS = 0
//                <1=> Force WS = 1
//                <2=> Force WS = 2
//                <3=> AUTO WS
//                <i> AUTO WS = 0 ( 1 MHz <= CK_AHB <= 24 MHz)
//                <i> AUTO WS = 1 (24 MHz <  CK_AHB <= 48 MHz)
//                <i> AUTO WS = 2 (48 MHz <  CK_AHB <= 72 MHz)
//
//      <q9>   Dcode cache Enable
//                <i> Default Dcode cache = DISABLE
//
//      <q10>   Icode cache Enable
//                <i> Default Icode cache = ENABLE
//
//      <e11>   Pre-fetch Buffer Enable
//                <i> Default pre-fetch buffer = ENABLE
//      </e>
//    </h>
//
//    <h> Backup Domain Isolation Configuration
//      <o12>    Isolation State
//                <0=> ENABLE
//                <1=> DISABLE
//                <i> Default Isolation = ENABLE
//    </h>
*/
#define HSI_ENABLE        (1)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define HSE_ENABLE        (1)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define PLL_ENABLE        (1)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define PLL_CLK_SRC       (0)     /*!< 0: HSE,     1: HSI                                                   */
#define PLL_NF2_DIV       (18)    /*!< 1~64: DIV1~DIV64                                                     */
#define PLL_NO2_DIV       (0)     /*!< 0: DIV1,    1: DIV2,   2: DIV4,   3: DIV8                            */
#define HCLK_SRC          (1)     /*!< 0: PLL,     1: PLL,    2: HSE,    3: HSI                             */
#define HCLK_DIV          (1)     /*!< 0: DIV1,    1: DIV2,   2: DIV4,   3: DIV8                            */
#define WAIT_STATE        (3)     /*!< 0: WS = 0,  1: WS = 1, 2: WS = 2, 3: WS = AUTO                       */
#define DCACHE_ENABLE     (0)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define ICACHE_ENABLE     (1)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define PRE_FETCH_ENABLE  (1)     /*!< 0: DISABLE, 1: ENABLE                                                */
#define BAKUP_ISO         (1)     /*!< 0: ENABLE,  1: DISABLE                                               */

/**
 * @brief Check HSI frequency
 */
#if (HSI_VALUE != 8000000UL)
  #error "CK_HSI clock issue: must be 8 MHz!"
#endif

/**
 * @brief Check HSE frequency
 */
#if ((HSE_VALUE < 4000000UL) || (HSE_VALUE > 16000000UL))
  #error "CK_HSE clock issue: must be in the range of 4 MHz to 16 MHz!"
#endif

/**
 * @brief CK_PLL definition
 */
#if (PLL_ENABLE == 1)
  /* Get CK_VCO frequency                                                                                   */
  #if (PLL_CLK_SRC == 1)
    #if (HSI_ENABLE == 0)
      #error "CK_PLL clock source issue: HSI has not been enabled"
    #else
      #define __CK_VCO    (HSI_VALUE * PLL_NF2_DIV)             /*!< Select HSI as PLL source               */
    #endif
  #else
    #if (HSE_ENABLE == 0)
      #error "CK_PLL clock source issue: HSE has not been enabled!"
    #else
      #define __CK_VCO    (HSE_VALUE * PLL_NF2_DIV)             /*!< Select HSE as PLL source               */
    #endif
  #endif

  /* Check CK_VCO frequency                                                                                 */
  #if ((__CK_VCO < 64000000) || (__CK_VCO > 144000000))
    #error "CK_VCO clock issue: must be in the range of 64 MHz to 144 MHz!"
  #endif

  #define __CK_PLL    (__CK_VCO >> PLL_NO2_DIV)                 /*!< Get CK_PLL frequency                   */

  /* Check CK_PLL frequency                                                                                 */
  #if ((__CK_PLL < 8000000UL) || (__CK_PLL > 144000000UL))
    #error "CK_PLL clock issue: must be in the range of 8 MHz to 144 MHz!"
  #endif
#endif

/**
 * @brief CK_SYS definition
 */
#if (HCLK_SRC == 2)
  #if (HSE_ENABLE == 1)
    #define __CK_SYS    HSE_VALUE             /*!< Select HSE as CK_SYS source                              */
  #else
    #error "CK_SYS clock source issue: HSE is not enable!"
  #endif
#elif (HCLK_SRC == 3)
  #if (HSI_ENABLE == 1)
    #define __CK_SYS    HSI_VALUE             /*!< Select HSI as CK_SYS source                              */
  #else
    #error "CK_SYS clock source issue: HSI is not enable!"
  #endif
#else
  #if (PLL_ENABLE == 1)
    #define __CK_SYS    __CK_PLL              /*!< Select PLL as CK_SYS source                              */
  #else
    #error "CK_SYS clock source issue: PLL is not enable!"
  #endif
#endif

/**
 * @brief CK_AHB definition
 */
#define __CK_AHB    (__CK_SYS >> HCLK_DIV)    /*!< Get CK_AHB frequency                                     */

/* Check CK_AHB frequency                                                                                   */
#if ((__CK_AHB < 1000000UL) || (__CK_AHB > 72000000UL))
  #error "CK_AHB clock issue: must be in the range of 1 MHz to 72 MHz!"
#endif

/**
 * @brief CKCU & Flash register definition
 */
  #define CKCU_GCFGR    HT_CKCU->GCFGR                       /*!< global clock configuration register       */
  #define CKCU_GCCR     HT_CKCU->GCCR                        /*!< global clock control register             */
  #define CKCU_GCSR     HT_CKCU->GCSR                        /*!< global clock status register              */
  #define CKCU_PLLCFGR  HT_CKCU->PLLCFGR                     /*!< PLL configuration register                */
  #define CKCU_PLLCR    HT_CKCU->PLLCR                       /*!< PLL control register                      */
  #define CKCU_AHBCFGR  HT_CKCU->AHBCFGR                     /*!< AHB configuration register                */
  #define CKCU_CKST     HT_CKCU->CKST                        /*!< Clock Source Status register              */
  #define CKCU_LPCR     HT_CKCU->LPCR                        /*!< Low Power Control Register                */
  #define FLASH_CFCR    HT_FLASH->CFCR                       /*!< flash pre-fetch control register          */
/**
  * @}
  */

/** @addtogroup HT32F165x_System_Private_Variables
  * @{
  */
__IO uint32_t SystemCoreClock = __CK_AHB;   /*!< SystemCoreClock = CK_AHB                                   */
/**
  * @}
  */

/** @addtogroup HT32F165x_System_Private_Functions
  * @{
  */

/**
  * @brief  Setup the microcontroller system.
  *         Initializes the system clocks and the embedded Flash.
  * @note   This function should be used after reset.
  * @retval None
  */
void SystemInit (void)
{
  CKCU_LPCR = BAKUP_ISO;                                        /* configure Backup domain isolation        */

  /* HSE initiation                                                                                         */
#if (HSE_ENABLE == 1)
  SetBit_BB((u32)(&CKCU_GCCR), 10);                             /* enable HSE                               */
  while (!GetBit_BB((u32)(&CKCU_GCSR), 2));                     /* wait for HSE ready                       */
#endif

  /* PLL initiation                                                                                         */
#if (PLL_ENABLE == 1)
  #if (PLL_CLK_SRC == 1)
    SetBit_BB((u32)(&CKCU_GCFGR), 8);                           /* select PLL source as HSI                 */
  #else
    ResetBit_BB((u32)(&CKCU_GCFGR), 8);                         /* select PLL source as HSE                 */
  #endif

  CKCU_PLLCFGR = ((PLL_NF2_DIV & 0x3F) << 23) | (PLL_NO2_DIV << 21);  /* set PLL divider                    */
  SetBit_BB((u32)(&CKCU_GCCR), 9);                                    /* enable PLL                         */
  while (!GetBit_BB((u32)(&CKCU_GCSR), 1));                           /* wait for PLL ready                 */
#endif

  /* CK_AHB initiation                                                                                      */
#if (WAIT_STATE == 3)
  #if (__CK_AHB > 48000000)
    FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFFFF8) | 3UL);           /* FLASH wait state = 2                     */
  #elif (__CK_AHB > 24000000)
    FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFFFF8) | 2UL);           /* FLASH wait state = 1                     */
  #endif
#else
  FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFFFF8) | (WAIT_STATE + 1));  /* force wait state                       */
#endif

  CKCU_AHBCFGR = HCLK_DIV;                                      /* set CK_AHB prescaler                     */

#if (HCLK_SRC != 3)
  CKCU_GCCR = ((CKCU_GCCR & 0xFFFFFFFC) | HCLK_SRC);            /* select CK_SYS source                     */
  while (((CKCU_CKST >> 30) & 3UL) != HCLK_SRC);                /* wait for clock switch complete           */
#endif

  /* HSI power down                                                                                         */
#if ((HSI_ENABLE == 0) && (HCLK_SRC != 3) && ((PLL_ENABLE == 0) || (PLL_CLK_SRC == 0)))
  ResetBit_BB((u32)(&CKCU_GCCR), 11);
#endif

  /* Cache & Pre-fetch buffer configuration                                                                 */
#if (DCACHE_ENABLE == 1)
  FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFFF7F) | 0);       /* 0: DCODE cache enable, 1: DCODE cache disable    */
#endif

#if (ICACHE_ENABLE == 0)
  FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFEFFF) | 0);       /* 0: ICODE cache disable, 1: DCODE cache enable    */
#endif

#if (PRE_FETCH_ENABLE == 0)
  FLASH_CFCR = (((FLASH_CFCR) & 0xFFFFFFEF) | 0);       /* 0: pre-fetch disable, 1: pre-fetch enable        */
#endif
}

/**
  * @brief  Update SystemCoreClock
  * @retval None
  */
void SystemCoreClockUpdate(void)
{
  u32 SystemCoreClockDiv = CKCU_AHBCFGR & 3UL;
  u32 PllFeedbackClockDiv = ((CKCU_PLLCFGR >> 23) == 0) ? (64) : (CKCU_PLLCFGR >> 23);
  u32 PllOutputClockDiv = (CKCU_PLLCFGR >> 21) & 3UL;
  u32 SystemCoreClockSrc = (CKCU_CKST >> 30) & 3UL;

  /* Get system core clock according to global clock control & configuration registers                      */
  if (SystemCoreClockSrc == 3)
  {
    SystemCoreClock = HSI_VALUE >> SystemCoreClockDiv;
  }
  else if (SystemCoreClockSrc == 2)
  {
    SystemCoreClock = HSE_VALUE >> SystemCoreClockDiv;
  }
  else
  {
    if (GetBit_BB((u32)(&CKCU_PLLCR), 31))
    {
      PllFeedbackClockDiv = 1;
      PllOutputClockDiv = 0;
    }

    if (GetBit_BB((u32)(&CKCU_GCFGR), 8))
    {
      SystemCoreClock = ((HSI_VALUE * PllFeedbackClockDiv) >> PllOutputClockDiv) >> SystemCoreClockDiv;
    }
    else
    {
      SystemCoreClock = ((HSE_VALUE * PllFeedbackClockDiv) >> PllOutputClockDiv) >> SystemCoreClockDiv;
    }
  }
}

/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2014 Holtek Semiconductor Inc. *****END OF FILE***                       */
