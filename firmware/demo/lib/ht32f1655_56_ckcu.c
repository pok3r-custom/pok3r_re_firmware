/*********************************************************************************************************//**
 * @file    ht32f1655_56_ckcu.c
 * @version $Rev:: 939          $
 * @date    $Date:: 2015-09-17 #$
 * @brief   This file provides all the Clock Control Unit firmware functions.
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56_ckcu.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup CKCU CKCU
  * @brief CKCU driver modules
  * @{
  */


/* Private definitions -------------------------------------------------------------------------------------*/
/** @defgroup CKCU_Private_Define CKCU private definitions
  * @{
  */

/* GCFGR bit field definition                                                                               */
#define CKCU_POS_CKOUTSRC       0
#define CKCU_MASK_CKOUTSRC      ((u32)0x7 << CKCU_POS_CKOUTSRC)

#define CKCU_POS_CKREFPRE       11
#define CKCU_MASK_CKREFPRE      ((u32)0x1F << CKCU_POS_CKREFPRE)

#define CKCU_POS_URPRE          20
#define CKCU_MASK_URPRE         ((u32)0x3 << CKCU_POS_URPRE)

#define CKCU_POS_USBPRE         22
#define CKCU_MASK_USBPRE        ((u32)0x3 << CKCU_POS_USBPRE)

/* GCCR bit field definition                                                                                */
#define CKCU_POS_SW             0
#define CKCU_MASK_SW            ((u32)0x3 << CKCU_POS_SW)

/* PLLCFGR bit field definition                                                                             */
#define CKCU_POS_POTD           21
#define CKCU_MASK_POTD          ((u32)0x3 << CKCU_POS_POTD)

#define CKCU_POS_PFBD           23
#define CKCU_MASK_PFBD          ((u32)0x3F << CKCU_POS_PFBD)

/* APBCFGR bit field definition                                                                             */
#define CKCU_POS_ADCDIV         16
#define CKCU_MASK_ADCDIV        ((u32)0x7 << CKCU_POS_ADCDIV)

/* CKST bit field definition                                                                                */
#define CKCU_POS_PLLST          8
#define CKCU_MASK_PLLST         ((u32)0xF << CKCU_POS_PLLST)

#define CKCU_POS_HSEST          16
#define CKCU_MASK_HSEST         ((u32)0x3 << CKCU_POS_HSEST)

#define CKCU_POS_HSIST          24
#define CKCU_MASK_HSIST         ((u32)0x7 << CKCU_POS_HSIST)

#define CKCU_POS_CKSWST         30
#define CKCU_MASK_CKSWST        ((u32)0x3 << CKCU_POS_CKSWST)

/* GCFGR Bit Band Alias                                                                                     */
#define CKCU_BB_PLLSRC          BitBand((u32)&HT_CKCU->GCFGR, 8)

/* GCCR Bit Band Alias                                                                                      */
#define CKCU_BB_PLLEN           BitBand((u32)&HT_CKCU->GCCR, 9)
#define CKCU_BB_HSEEN           BitBand((u32)&HT_CKCU->GCCR, 10)
#define CKCU_BB_HSIEN           BitBand((u32)&HT_CKCU->GCCR, 11)
#define CKCU_BB_CKMEN           BitBand((u32)&HT_CKCU->GCCR, 16)
#define CKCU_BB_PSRCEN          BitBand((u32)&HT_CKCU->GCCR, 17)

/* GCIR Bit Band Alias                                                                                      */
#define CKCU_BB_CKSF            BitBand((u32)&HT_CKCU->GCIR, 0)
#define CKCU_BB_CKSIE           BitBand((u32)&HT_CKCU->GCIR, 16)

/* PLLCR Bit Band Alias                                                                                     */
#define CKCU_BB_PLLBYPASS       BitBand((u32)&HT_CKCU->PLLCR, 31)

/* LPCR Bit Band Alias                                                                                      */
#define CKCU_BB_BKISO           BitBand((u32)&HT_CKCU->LPCR, 0)
/**
  * @}
  */

/* Private macro -------------------------------------------------------------------------------------------*/
/** @defgroup CKCU_Private_Macro CKCU private macros
  * @{
  */
#define CKCU_BF_WRITE(Reg, Mask, Pos, WriteValue)   (Reg = ((Reg & ~((u32)Mask)) | ((u32)WriteValue << Pos)))
#define CKCU_BF_READ(Reg, Mask, Pos)                ((Reg & (u32)Mask) >> Pos)
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @addtogroup CKCU_Exported_Functions CKCU exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief  Deinitialize the CKCU registers to the reset values.
 * @retval None
 ************************************************************************************************************/
void CKCU_DeInit(void)
{
  /* Reset system clock                                                                                     */
  CKCU_HSICmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSIRDY) == RESET);
  CKCU_SysClockConfig(CKCU_SW_HSI);

  HT_CKCU->GCFGR = 0x00000102;                   /* Reset value of GCFGR                                    */
  HT_CKCU->GCCR = 0x00000803;                    /* Reset value of GCCR                                     */
  HT_CKCU->GCIR = 0x0000007D;                    /* Clear all interrupt flags                               */
  HT_CKCU->PLLCFGR = 0;                          /* Reset value of PLLCFGR                                  */
  HT_CKCU->PLLCR = 0;                            /* Reset value of PLLCR                                    */
  HT_CKCU->AHBCFGR = 0;                          /* Reset value of AHBCFGR                                  */
  HT_CKCU->AHBCCR = 0x000000E5;                  /* Reset value of AHBCCR                                   */
  HT_CKCU->APBCFGR = 0x00010000;                 /* Reset value of APBCFGR                                  */
  HT_CKCU->APBCCR0 = 0;                          /* Reset value of APBCCR0                                  */
  HT_CKCU->APBCCR1 = 0;                          /* Reset value of APBCCR1                                  */
  HT_CKCU->LPCR = 0;                             /* Reset value of LPCR                                     */
  HT_CKCU->MCUDBGCR = 0;                         /* Reset value of MCUDBGCR                                 */
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the external high speed oscillator (HSE).
 * @note  HSE can not be stopped if it is used by system clock or PLL.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_HSECmd(EventStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  CKCU_BB_HSEEN = Cmd;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the internal high speed oscillator (HSI).
 * @note  HSI can not be stopped if it is used by system clock or PLL.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_HSICmd(EventStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  CKCU_BB_HSIEN = Cmd;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the PLL clock.
 * @note  PLL can not be stopped if it is used by system clock or CK_REF.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_PLLCmd(EventStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  CKCU_BB_PLLEN = Cmd;
}

/*********************************************************************************************************//**
 * @brief  Wait for HSE is ready to be used.
 * @retval SUCCESS or ERROR
 ************************************************************************************************************/
ErrStatus CKCU_WaitHSEReady(void)
{
  u32 ReadyCnt = 0;

  /* Wait until HSE is ready or time-out occurred                                                           */
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY) != SET)
  {
    if (++ReadyCnt >= HSE_READY_TIME)
    {
      return ERROR;
    }
  }

  return SUCCESS;
}

/*********************************************************************************************************//**
 * @brief Check whether the specific clock ready flag is set or not.
 * @param CKCU_FLAG: specify the clock ready flag.
 *        This parameter can be:
 *        @arg CKCU_FLAG_PLLRDY: PLL ready flag.
 *        @arg CKCU_FLAG_HSERDY: HSE ready flag.
 *        @arg CKCU_FLAG_HSIRDY: HSI ready flag.
 *        @arg CKCU_FLAG_LSERDY: LSE ready flag.
 *        @arg CKCU_FLAG_LSIRDY: LSI ready flag.
 * @retval SET or RESET
 ************************************************************************************************************/
FlagStatus CKCU_GetClockReadyStatus(u32 CKCU_FLAG)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_FLAG(CKCU_FLAG));

  if (HT_CKCU->GCSR & CKCU_FLAG)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief This function is used to configure PLL.
 * @param PLLInit: pointer to CKCU_PLLInitTypeDef structure that contains the configuration information for PLL.
 * @retval None
 ************************************************************************************************************/
void CKCU_PLLInit(CKCU_PLLInitTypeDef *PLLInit)
{
  CKCU_BB_PLLSRC = PLLInit->ClockSource;
  HT_CKCU->PLLCFGR = ((u32)PLLInit->CFG) << 16;
  CKCU_BB_PLLBYPASS = PLLInit->BYPASSCmd;
}

/*********************************************************************************************************//**
 * @brief Configure the CK_SYS source.
 * @param CLKSRC: specify the system clock source.
 *        This parameter can be:
 *        @arg CKCU_SW_PLL: PLL is selected as CK_SYS
 *        @arg CKCU_SW_HSE: HSE is selected as CK_SYS
 *        @arg CKCU_SW_HSI: HSI is selected as CK_SYS
 * @retval None
 ************************************************************************************************************/
ErrStatus CKCU_SysClockConfig(CKCU_SW_TypeDef CLKSRC)
{
  u32 cnt = 0xFF;

  CKCU_BF_WRITE(HT_CKCU->GCCR, CKCU_MASK_SW, CKCU_POS_SW, CLKSRC);

  /* Wait until new system clock source is applied or time-out                                              */
  while (--cnt)
  {
    if (CKCU_GetSysClockSource() == CLKSRC)
    {
      return SUCCESS;
    }
  }

  return ERROR;
}

/*********************************************************************************************************//**
 * @brief  Return the source clock which is used as system clock.
 * @retval The source clock used as system clock.
 *         0x01: PLL is selected as system clock
 *         0x02: HSE is selected as system clock
 *         0x03: HSI is selected as system clock
 ************************************************************************************************************/
u32 CKCU_GetSysClockSource(void)
{
  return ((u32)CKCU_BF_READ(HT_CKCU->CKST, CKCU_MASK_CKSWST, CKCU_POS_CKSWST));
}

/*********************************************************************************************************//**
 * @brief Configure the CK_AHB prescaler.
 * @param HCLKPRE: specify the value of divider.
 *        This parameter can be:
 *        @arg CKCU_SYSCLK_DIV1: HCLK = CK_SYS
 *        @arg CKCU_SYSCLK_DIV2: HCLK = CK_SYS / 2
 *        @arg CKCU_SYSCLK_DIV4: HCLK = CK_SYS / 4
 *        @arg CKCU_SYSCLK_DIV8: HCLK = CK_SYS / 8
 * @retval None
 ************************************************************************************************************/
void CKCU_SetHCLKPrescaler(CKCU_SYSCLKDIV_TypeDef HCLKPRE)
{
  HT_CKCU->AHBCFGR = HCLKPRE;
}

/*********************************************************************************************************//**
 * @brief Configure the CK_REF prescaler.
 * @param CKREFPRE: CKCU_CKREFPRE_DIV2 ~ CKCU_CKREFPRE_DIV64 (CK_REF = CK_PLL / 2N)
 * @retval None
 ************************************************************************************************************/
void CKCU_SetCKREFPrescaler(CKCU_CKREFPRE_TypeDef CKREFPRE)
{
  CKCU_BF_WRITE(HT_CKCU->GCFGR, CKCU_MASK_CKREFPRE, CKCU_POS_CKREFPRE, CKREFPRE);
}

/*********************************************************************************************************//**
 * @brief Configure the CK_USART prescaler.
 * @param URPRE: specify the prescaler value.
 *        This parameter can be:
 *        @arg CKCU_URPRE_DIV1: USART clock divided by 1
 *        @arg CKCU_URPRE_DIV2: USART clock divided by 2
 * @retval None
 ************************************************************************************************************/
void CKCU_SetUSARTPrescaler(CKCU_URPRE_TypeDef URPRE)
{
  CKCU_BF_WRITE(HT_CKCU->GCFGR, CKCU_MASK_URPRE, CKCU_POS_URPRE, URPRE);
}

/*********************************************************************************************************//**
 * @brief Configure the CK_USB prescaler.
 * @param USBPRE: specify the value of divider.
 *        This parameter can be:
 *        @arg CKCU_USBPRE_DIV1: CK_USB = CK_PLL / 1
 *        @arg CKCU_USBPRE_DIV2: CK_USB = CK_PLL / 2
 *        @arg CKCU_USBPRE_DIV3: CK_USB = CK_PLL / 3
 * @retval None
 ************************************************************************************************************/
void CKCU_SetUSBPrescaler(CKCU_USBPRE_TypeDef USBPRE)
{
  CKCU_BF_WRITE(HT_CKCU->GCFGR, CKCU_MASK_USBPRE, CKCU_POS_USBPRE, USBPRE);
}

/*********************************************************************************************************//**
 * @brief Configure the CK_ADC prescaler.
 * @param ADCPRE: specify the prescaler value.
 *        This parameter can be:
 *        @arg CKCU_ADCPRE_DIV2 : CK_ADC = HCLK / 2
 *        @arg CKCU_ADCPRE_DIV4 : CK_ADC = HCLK / 4
 *        @arg CKCU_ADCPRE_DIV6 : CK_ADC = HCLK / 6
 *        @arg CKCU_ADCPRE_DIV8 : CK_ADC = HCLK / 8
 *        @arg CKCU_ADCPRE_DIV16: CK_ADC = HCLK / 16
 *        @arg CKCU_ADCPRE_DIV32: CK_ADC = HCLK / 32
 *        @arg CKCU_ADCPRE_DIV64: CK_ADC = HCLK / 64
 * @retval None
 ************************************************************************************************************/
void CKCU_SetADCPrescaler(CKCU_ADCPRE_TypeDef ADCPRE)
{
  CKCU_BF_WRITE(HT_CKCU->APBCFGR, CKCU_MASK_ADCDIV, CKCU_POS_ADCDIV, ADCPRE);
}

/*********************************************************************************************************//**
 * @brief Return the frequency of the different clocks.
 * @param CKCU_Clk: pointer to CKCU_ClocksTypeDef structure to get the clocks frequency.
 * @retval None
 ************************************************************************************************************/
void CKCU_GetClocksFrequency(CKCU_ClocksTypeDef* CKCU_Clk)
{
  u32 urpre, div;
  u32 SystemCoreClockSrc = (HT_CKCU->CKST >> 30) & 3UL;

  CKCU_Clk->PLL_Freq = CKCU_GetPLLFrequency();

  /* Get system frequency                                                                                   */
  switch (SystemCoreClockSrc)
  {
    case CKCU_SW_PLL:
      CKCU_Clk->SYSCK_Freq = CKCU_Clk->PLL_Freq;
      break;
    case CKCU_SW_HSE:
      CKCU_Clk->SYSCK_Freq = HSE_VALUE;
      break;
    case CKCU_SW_HSI:
      CKCU_Clk->SYSCK_Freq = HSI_VALUE;
      break;
    default:
      CKCU_Clk->SYSCK_Freq = 0;
      break;
  }

  /* Get HCLK frequency                                                                                     */
  CKCU_Clk->HCLK_Freq = (CKCU_Clk->SYSCK_Freq) >> (HT_CKCU->AHBCFGR);

  /* Get USART frequency                                                                                    */
  urpre = CKCU_BF_READ(HT_CKCU->GCFGR, CKCU_MASK_URPRE, CKCU_POS_URPRE);
  CKCU_Clk->USART_Freq = (CKCU_Clk->HCLK_Freq) >> urpre;

  /* Get ADC frequency                                                                                      */
  div = CKCU_BF_READ(HT_CKCU->APBCFGR, CKCU_MASK_ADCDIV, CKCU_POS_ADCDIV);
  if (div == 7)
  {
    CKCU_Clk->ADC_Freq = (CKCU_Clk->HCLK_Freq) / 6;
  }
  else
  {
    CKCU_Clk->ADC_Freq = (CKCU_Clk->HCLK_Freq) >> div;
  }
}

/*********************************************************************************************************//**
 * @brief Return the operating frequency of the USART.
 * @retval Frequency in Hz
 ************************************************************************************************************/
u32 CKCU_GetUSARTClockFreq(void)
{
  CKCU_ClocksTypeDef Clock;

  CKCU_GetClocksFrequency(&Clock);

  return Clock.USART_Freq;
}

/*********************************************************************************************************//**
 * @brief Return the frequency of the PLL.
 * @retval PLL Frequency
 ************************************************************************************************************/
u32 CKCU_GetPLLFrequency(void)
{
  u32 pllNO, pllNF, ClockSrc;

  /* Get PLL frequency                                                                                      */
  if (CKCU_BB_PLLEN == DISABLE)
  {
    return 0;
  }

  ClockSrc = (CKCU_BB_PLLSRC == CKCU_PLLSRC_HSE) ? HSE_VALUE : HSI_VALUE;

  if (CKCU_BB_PLLBYPASS == ENABLE)
  {
    return ClockSrc;
  }

  pllNF = CKCU_BF_READ(HT_CKCU->PLLCFGR, CKCU_MASK_PFBD, CKCU_POS_PFBD);
  if (pllNF == 0)
    pllNF = 64;

  pllNO = CKCU_BF_READ(HT_CKCU->PLLCFGR, CKCU_MASK_POTD, CKCU_POS_POTD);
  pllNO = (u8)0x1 << pllNO;

  return ((ClockSrc / pllNO) * pllNF);
}

#ifdef HT32_USE_VER100
/*********************************************************************************************************//**
 * @brief Enable or Disable the APB peripheral 0 clock.
 * @param CKCU_APBP: specify the APB peripheral 0.
 *        This parameter can be:
 *        @arg CKCU_APBEN0_I2C0,   CKCU_APBEN0_I2C1,  CKCU_APBEN0_SPI0,  CKCU_APBEN0_SPI1, CKCU_APBEN0_USART0,
 *             CKCU_APBEN0_USART1, CKCU_APBEN0_UART0, CKCU_APBEN0_UART1, CKCU_APBEN0_AFIO, CKCU_APBEN0_EXTI,
 *             CKCU_APBEN0_SCI,    CKCU_APBEN0_I2S
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_APBPerip0ClockConfig(u32 CKCU_APBP, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_APBEN0(CKCU_APBP));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    HT_CKCU->APBCCR0 |= CKCU_APBP;
  }
  else
  {
    HT_CKCU->APBCCR0 &= ~CKCU_APBP;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the APB peripheral 1 clock.
 * @param CKCU_APBP: specify the APB peripheral 1.
 *        This parameter can be:
 *        @arg CKCU_APBEN1_MCTM0, CKCU_APBEN1_MCTM1, CKCU_APBEN1_WDTR,  CKCU_APBEN1_RTC,  CKCU_APBEN1_GPTM0,
 *             CKCU_APBEN1_GPTM1, CKCU_APBEN1_BFTM0, CKCU_APBEN1_BFTM1, CKCU_APBEN1_OPA0, CKCU_APBEN1_OPA1,
 *             CKCU_APBEN1_ADC
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_APBPerip1ClockConfig(u32 CKCU_APBP, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_APBEN1(CKCU_APBP));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    HT_CKCU->APBCCR1 |= CKCU_APBP;
  }
  else
  {
    HT_CKCU->APBCCR1 &= ~CKCU_APBP;
  }
}
#endif

/*********************************************************************************************************//**
 * @brief Enable or Disable the HSE Clock Monitor function.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_CKMCmd(ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  CKCU_BB_CKMEN = Cmd;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the power saving wakeup RC clock.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_PSRCWKUPCmd(ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  CKCU_BB_PSRCEN = Cmd;
}

/*********************************************************************************************************//**
 * @brief Select the output clock source through the CKOUT pin.
 * @param CKOUTInit: pointer to CKCU_CKOUTInitTypeDef structure that
 *                   contains the configuration information for the specific output clock source.
 * @retval None
 ************************************************************************************************************/
void CKCU_CKOUTConfig(CKCU_CKOUTInitTypeDef *CKOUTInit)
{
  CKCU_BF_WRITE(HT_CKCU->GCFGR, CKCU_MASK_CKOUTSRC, CKCU_POS_CKOUTSRC, CKOUTInit->CKOUTSRC);
}

/*********************************************************************************************************//**
 * @brief Check whether the specific CKCU interrupt has occurred or not.
 * @param CKCU_INT: specify the CKCU interrupt source.
 *        This parameter can be:
 *        @arg CKCU_INT_CKS, CKCU_INT_PLLRDY, CKCU_INT_HSERDY, CKCU_INT_HSIRDY, CKCU_INT_LSERDY,
 *             CKCU_INT_LSIRDY
 * @retval SET or RESET
 ************************************************************************************************************/
FlagStatus CKCU_GetIntStatus(u8 CKCU_INT)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_INT_FLAG(CKCU_INT));

  if (HT_CKCU->GCIR & CKCU_INT)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear the CKCU interrupt flag.
 * @param CKCU_INT: specify the CKCU interrupt flag to clear.
 *        This parameter can be:
 *        @arg CKCU_INT_CKS   : HSE clock failure interrupt flag (NMI)
 *        @arg CKCU_INT_PLLRDY: PLL ready interrupt flag
 *        @arg CKCU_INT_HSERDY: HSE ready interrupt flag
 *        @arg CKCU_INT_HSIRDY: HSI ready interrupt flag
 *        @arg CKCU_INT_LSERDY: LSE ready interrupt flag
 *        @arg CKCU_INT_LSIRDY: LSI ready interrupt flag
 * @retval None
 ************************************************************************************************************/
void CKCU_ClearIntFlag(u8 CKCU_INT)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_INT_FLAG(CKCU_INT));

  HT_CKCU->GCIR |= CKCU_INT;
}

/*********************************************************************************************************//**
 * @brief Enables or Disable the specific CKCU interrupts.
 * @param CKCU_INT: specify the CKCU interrupt source which is enabled or disabled.
 *        This parameter can be:
 *        @arg CKCU_INT_CKSIE   : HSE clock failure interrupt (NMI)
 *        @arg CKCU_INT_PLLRDYIE: PLL ready interrupt
 *        @arg CKCU_INT_HSERDYIE: HSE ready interrupt
 *        @arg CKCU_INT_HSIRDYIE: HSI ready interrupt
 *        @arg CKCU_INT_LSERDYIE: LSE ready interrupt
 *        @arg CKCU_INT_LSIRDYIE: LSI ready interrupt
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_IntConfig(u32 CKCU_INT, ControlStatus Cmd)
{
  u32 tmp1 = HT_CKCU->GCIR;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_INT(CKCU_INT));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    tmp1 |= CKCU_INT;
  }
  else
  {
    tmp1 &= ~CKCU_INT;
  }

  /* Note: CKCU interrupt flags will be cleared by writing "1"                                              */
  tmp1 &= ~0x0000007D;
  HT_CKCU->GCIR = tmp1;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the AHB peripheral clock during SLEEP mode.
 * @param CKCU_CLK: specify the clock which is enabled or disabled.
 *        This parameter can be:
 *        @arg CKCU_AHBEN_SLEEP_FMC, CKCU_AHBEN_SLEEP_SRAM, CKCU_AHBEN_SLEEP_BM, CKCU_AHBEN_SLEEP_APB0,
 *             CKCU_AHBEN_SLEEP_APB1
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_SleepClockConfig(u32 CKCU_CLK, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_SLEEP_AHB(CKCU_CLK));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    HT_CKCU->AHBCCR |= CKCU_CLK;
  }
  else
  {
    HT_CKCU->AHBCCR &= ~CKCU_CLK;
  }
}

#ifdef HT32_USE_VER100
/*********************************************************************************************************//**
 * @brief Enable or Disable the AHB peripheral clock.
 * @param CKCU_CLK: specify the clock which is enabled or disabled.
 *        This parameter can be:
 *        @arg CKCU_AHBEN_PDMA, CKCU_AHBEN_USB, CKCU_AHBEN_CKREF, CKCU_AHBEN_EBI, CKCU_AHBEN_CRC,
 *             CKCU_AHBEN_PA,   CKCU_AHBEN_PB,  CKCU_AHBEN_PC,    CKCU_AHBEN_PD,  CKCU_AHBEN_PE
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_AHBPeripClockConfig(u32 CKCU_CLK, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_AHBEN(CKCU_CLK));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    HT_CKCU->AHBCCR |= CKCU_CLK;
  }
  else
  {
    HT_CKCU->AHBCCR &= ~CKCU_CLK;
  }
}
#endif

/*********************************************************************************************************//**
 * @brief Check if PLL clock used by the specific target source or not.
 * @param Target: specify the target clock.
 *        This parameter can be:
 *        @arg CKCU_PLLST_SYSCK : Is PLL used by system clock
 *        @arg CKCU_PLLST_USB   : Is PLL used by USB
 *        @arg CKCU_PLLST_REFCK : Is PLL used by CK_REF
 * @retval TRUE or FALSE
 ************************************************************************************************************/
bool CKCU_IS_PLL_USED(CKCU_PLLST_TypeDef Target)
{
  if ((HT_CKCU->CKST >> CKCU_POS_PLLST) & (u32)Target)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

/*********************************************************************************************************//**
 * @brief Check HSI clock used by the specific target source or not.
 * @param Target: specify the target clock.
 *        This parameter can be:
 *        @arg CKCU_HSIST_SYSCK: Is HSI used by system clock
 *        @arg CKCU_HSIST_PLL  : Is HSI used by PLL
 *        @arg CKCU_HSIST_CKM  : Is HSI used by clock monitor
 * @retval TRUE or FALSE
 ************************************************************************************************************/
bool CKCU_IS_HSI_USED(CKCU_HSIST_TypeDef Target)
{
  if ((HT_CKCU->CKST >> CKCU_POS_HSIST) & (u32)Target)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

/*********************************************************************************************************//**
 * @brief Check HSE clock used by the specific target source or not.
 * @param Target: specify the target clock.
 *        This parameter can be:
 *        @arg CKCU_HSEST_SYSCK : Is HSE used by system clock
 *        @arg CKCU_HSEST_PLL   : Is HSE used by PLL
 * @retval TRUE or FALSE
 ************************************************************************************************************/
bool CKCU_IS_HSE_USED(CKCU_HSEST_TypeDef Target)
{
  if ((HT_CKCU->CKST >> CKCU_POS_HSEST) & (u32)Target)
  {
    return TRUE;
  }
  else
  {
    return FALSE;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specific debug function.
 * @param CKCU_DBGx: specify the debug functions to be enabled or disabled.
 *        This parameter can be:
 *        @arg CKCU_DBG_SLEEP,      CKCU_DBG_DEEPSLEEP1, CKCU_DBG_DEEPSLEEP2,  CKCU_DBG_POWERDOWN,
 *             CKCU_DBG_MCTM0_HALT, CKCU_DBG_MCTM1_HALT, CKCU_DBG_GPTM0_HALT,  CKCU_DBG_GPTM1_HALT,
 *             CKCU_DBG_BFTM0_HALT, CKCU_DBG_BFTM1_HALT, CKCU_DBG_USART0_HALT, CKCU_DBG_USART1_HALT,
 *             CKCU_DBG_UART0_HALT, CKCU_DBG_UART1_HALT, CKCU_DBG_SPI0_HALT,   CKCU_DBG_SPI1_HALT,
 *             CKCU_DBG_I2C0_HALT,  CKCU_DBG_I2C1_HALT,  CKCU_DBG_SCI_HALT,    CKCU_DBG_WDT_HALT,
 *             CKCU_DBG_TRACE_ON
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_MCUDBGConfig(u32 CKCU_DBGx, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CKCU_DBG(CKCU_DBGx));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    HT_CKCU->MCUDBGCR |= CKCU_DBGx;
  }
  else
  {
    HT_CKCU->MCUDBGCR &= ~CKCU_DBGx;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the Backup domain isolation control.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_BKISOCmd(EventStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd != DISABLE)
  {
    CKCU_BB_BKISO = 0;  /* Backup domain is isolated                                                        */
  }
  else
  {
    CKCU_BB_BKISO = 1;  /* Backup domain is accessible                                                      */
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the peripheral clock.
 * @param Clock: specify the peripheral clock enable bits.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void CKCU_PeripClockConfig(CKCU_PeripClockConfig_TypeDef Clock, ControlStatus Cmd)
{
  u32 uAHBCCR;
  u32 uAPBCCR0;
  u32 uAPBCCR1;

  uAHBCCR  = HT_CKCU->AHBCCR;
  uAPBCCR0 = HT_CKCU->APBCCR0;
  uAPBCCR1 = HT_CKCU->APBCCR1;

  uAHBCCR  &= ~(Clock.Reg[0]);
  uAPBCCR0 &= ~(Clock.Reg[1]);
  uAPBCCR1 &= ~(Clock.Reg[2]);

  if (Cmd != DISABLE)
  {
    uAHBCCR  |= Clock.Reg[0];
    uAPBCCR0 |= Clock.Reg[1];
    uAPBCCR1 |= Clock.Reg[2];
  }

  HT_CKCU->AHBCCR  = uAHBCCR;
  HT_CKCU->APBCCR0 = uAPBCCR0;
  HT_CKCU->APBCCR1 = uAPBCCR1;
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
