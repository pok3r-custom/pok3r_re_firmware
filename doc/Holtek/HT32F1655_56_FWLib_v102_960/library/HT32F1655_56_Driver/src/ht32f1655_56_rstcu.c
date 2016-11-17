/*********************************************************************************************************//**
 * @file    ht32f1655_56_rstcu.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the Reset Control Unit firmware functions.
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
#include "ht32f1655_56_rstcu.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup RSTCU RSTCU
  * @brief RSTCU driver modules
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup RSTCU_Exported_Functions RSTCU exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Check whether the specific global reset flag is set or not.
 * @param RSTCU_RSTF: specify the reset flag.
 *        This parameter can be:
 *        @arg RSTCU_FLAG_SYSRST: Get system reset flag
 *        @arg RSTCU_FLAG_EXTRST: Get external pin reset flag
 *        @arg RSTCU_FLAG_WDTRST: Get WDT reset flag
 *        @arg RSTCU_FLAG_PORST : Get power on reset flag
 * @retval SET or RESET
 ************************************************************************************************************/
FlagStatus RSTCU_GetResetFlagStatus(RSTCU_RSTF_TypeDef RSTCU_RSTF)
{
  u32 tmp;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_RSTCU_FLAG(RSTCU_RSTF));

  tmp = (HT_RSTCU->GRSR & ((u32)0x1 << RSTCU_RSTF));
  if (tmp != RESET)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear the specific global reset flag.
 * @param RSTCU_RSTF: specify the reset flag.
 *        This parameter can be:
 *        @arg RSTCU_FLAG_SYSRST: Clear system reset flag
 *        @arg RSTCU_FLAG_EXTRST: Clear external pin reset flag
 *        @arg RSTCU_FLAG_WDTRST: Clear WDT reset flag
 *        @arg RSTCU_FLAG_PORST : Clear power on reset flag
 * @retval None
 ************************************************************************************************************/
void RSTCU_ClearResetFlag(RSTCU_RSTF_TypeDef RSTCU_RSTF)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_RSTCU_FLAG(RSTCU_RSTF));

  HT_RSTCU->GRSR = (u32)0x1 << RSTCU_RSTF;  /* Write 1 to clear                                             */
}

/*********************************************************************************************************//**
 * @brief Clear all of the global reset flag.
 * @retval None
 ************************************************************************************************************/
void RSTCU_ClearAllResetFlag(void)
{
  HT_RSTCU->GRSR = (vu32)0xF;   /* Write 1 to clear                                                         */
}

#ifdef HT32_USE_VER100
/*********************************************************************************************************//**
 * @brief Enable APB peripheral 0 reset function.
 * @param RSTCU_APBP: specifies the APB peripheral 0.
 *        This parameter can be:
 *        @arg RSTCU_APBRST0_I2C0,   RSTCU_APBRST0_I2C1,   RSTCU_APBRST0_SPI0,  RSTCU_APBRST0_SPI1,
 *             RSTCU_APBRST0_USART0, RSTCU_APBRST0_USART1, RSTCU_APBRST0_UART0, RSTCU_APBRST0_UART1,
 *             RSTCU_APBRST0_AFIO,   RSTCU_APBRST0_EXTI,   RSTCU_APBRST0_SCI,   RSTCU_APBRST0_I2S
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void RSTCU_APBPerip0Reset(u32 RSTCU_APBP, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_RSTCU_APBRST0(RSTCU_APBP));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd == ENABLE)
  {
    HT_RSTCU->APBPRST0 |= RSTCU_APBP;
  }
  else
  {
    HT_RSTCU->APBPRST0 &= ~RSTCU_APBP;
  }
}

/*********************************************************************************************************//**
 * @brief Enable APB peripheral 1 reset function.
 * @param RSTCU_APBP: specifies the APB peripheral 1.
 *        This parameter can be:
 *        @arg RSTCU_APBRST1_MCTM0, RSTCU_APBRST1_MCTM1, RSTCU_APBRST1_WDT,   RSTCU_APBRST1_GPTM0,
 *             RSTCU_APBRST1_GPTM1, RSTCU_APBRST1_BFTM0, RSTCU_APBRST1_BFTM1, RSTCU_APBRST1_OPA0,
 *             RSTCU_APBRST1_OPA1,  RSTCU_APBRST1_ADC
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void RSTCU_APBPerip1Reset(u32 RSTCU_APBP, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_RSTCU_APBRST1(RSTCU_APBP));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd == ENABLE)
  {
    HT_RSTCU->APBPRST1 |= RSTCU_APBP;
  }
  else
  {
    HT_RSTCU->APBPRST1 &= ~RSTCU_APBP;
  }
}

/*********************************************************************************************************//**
 * @brief Enable AHB peripheral reset function.
 * @param RSTCU_AHBP: specifies the AHB peripheral.
 *        This parameter can be:
 *        @arg RSTCU_AHBRST_PDMA, RSTCU_AHBRST_USB, RSTCU_AHBRST_EBI, RSTCU_AHBRST_CRC, RSTCU_AHBRST_PA,
 *             RSTCU_AHBRST_PB,   RSTCU_AHBRST_PC,  RSTCU_AHBRST_PD,  RSTCU_AHBRST_PE
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void RSTCU_AHBPeripReset(u32 RSTCU_AHBP, ControlStatus Cmd)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_RSTCU_AHBRST(RSTCU_AHBP));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  if (Cmd == ENABLE)
  {
    HT_RSTCU->AHBPRST |= RSTCU_AHBP;
  }
  else
  {
    HT_RSTCU->AHBPRST &= ~RSTCU_AHBP;
  }
}
#endif

/*********************************************************************************************************//**
 * @brief Peripheral reset function.
 * @param Reset: specify the peripheral clock enable bits.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void RSTCU_PeripReset(RSTCU_PeripReset_TypeDef Reset, ControlStatus Cmd)
{
  u32 uAHBPRST;
  u32 uAPBPRST0;
  u32 uAPBPRST1;

  uAHBPRST  = HT_RSTCU->AHBPRST;
  uAPBPRST0 = HT_RSTCU->APBPRST0;
  uAPBPRST1 = HT_RSTCU->APBPRST1;

  uAHBPRST  &= ~(Reset.Reg[0]);
  uAPBPRST0 &= ~(Reset.Reg[1]);
  uAPBPRST1 &= ~(Reset.Reg[2]);

  if (Cmd != DISABLE)
  {
    uAHBPRST  |= Reset.Reg[0];
    uAPBPRST0 |= Reset.Reg[1];
    uAPBPRST1 |= Reset.Reg[2];
  }

  HT_RSTCU->AHBPRST  = uAHBPRST;
  HT_RSTCU->APBPRST0 = uAPBPRST0;
  HT_RSTCU->APBPRST1 = uAPBPRST1;
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
