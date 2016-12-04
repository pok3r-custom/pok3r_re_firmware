/*********************************************************************************************************//**
 * @file    ht32f1655_56_pwrcu.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the Power Control Unit firmware functions.
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
#include "ht32f1655_56_pwrcu.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup PWRCU PWRCU
  * @brief PWRCU driver modules
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
/** @defgroup PWRCU_Private_Define PWRCU private definitions
  * @{
  */
#define APBCCR1_ADDR      (HT_CKCU_BASE  + 0x30)
#define BAKCR_ADDR        (HT_PWRCU_BASE + 0x04)
#define LVDCSR_ADDR       (HT_PWRCU_BASE + 0x10)

#define BB_ADCEN          BitBand(APBCCR1_ADDR, 24)
#define BB_RTCEN          BitBand(APBCCR1_ADDR, 6)
#define BB_LDOOFF         BitBand(BAKCR_ADDR, 3)
#define BB_DMOSON         BitBand(BAKCR_ADDR, 7)
#define BB_WUPEN          BitBand(BAKCR_ADDR, 8)
#define BB_WUPIEN         BitBand(BAKCR_ADDR, 9)
#define BB_V18RDYSC       BitBand(BAKCR_ADDR, 12)
#define BB_DMOSSTS        BitBand(BAKCR_ADDR, 15)

#define BB_BODEN          BitBand(LVDCSR_ADDR, 0)
#define BB_BODRIS         BitBand(LVDCSR_ADDR, 1)
#define BB_BODF           BitBand(LVDCSR_ADDR, 3)
#define BB_LVDEN          BitBand(LVDCSR_ADDR, 16)
#define BB_LVDF           BitBand(LVDCSR_ADDR, 19)
#define BB_LVDIWEN        BitBand(LVDCSR_ADDR, 20)
#define BB_LVDEWEN        BitBand(LVDCSR_ADDR, 21)

#define LVDS_MASK         0xFFB9FFFF
#define BAKRST_SET        0x1
#define BAKTEST_READY     0x27
#define TIME_OUT          36000000

#define SLEEPDEEP_SET     0x04      /*!< Cortex SLEEPDEEP bit                                               */
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup PWRCU_Exported_Functions PWRCU exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitializes backup domain which contains PWRCU and RTC units.
 * @retval None
 ************************************************************************************************************/
void PWRCU_DeInit(void)
{
  HT_PWRCU->BAKCR = BAKRST_SET;
  while (HT_PWRCU->BAKCR);
  while (HT_PWRCU->BAKSR);    /* Waits until the BAKPORF be cleared by read                                 */
}

/*********************************************************************************************************//**
 * @brief Waits, until the RTC & PWRCU can be accessed.
 * @return PWRCU_TIMEOUT or PWRCU_OK
 ************************************************************************************************************/
PWRCU_Status PWRCU_CheckReadyAccessed(void)
{
  u32 wTimeOutCnt = TIME_OUT;

  /* Sets the BK_ISO bit                                                                                    */
  HT_CKCU->LPCR = 0x1;

  while (--wTimeOutCnt)
  {
    if (HT_PWRCU->BAKTEST == BAKTEST_READY)
    {
      u32 write = ~HT_PWRCU->BAKREG[9];
      u32 backup = HT_PWRCU->BAKREG[9];
      while (1)
      {
        HT_PWRCU->BAKREG[9] = write;
        if (HT_PWRCU->BAKREG[9] == write) break;
      }
      HT_PWRCU->BAKREG[9] = backup;
      return PWRCU_OK;
    }
  }
  return PWRCU_TIMEOUT;
}

/*********************************************************************************************************//**
 * @brief Returns the flags of PWRCU.
 * @return This function will return one of following:
 *   - 0x0000                                   : There is no flag is set.
 *   - 0x0001 (PWRCU_FLAG_BAKPOR)               : This is backup domain power on reset.
 *   - 0x0002 (PWRCU_FLAG_PD)                   : Power-Down flag has been set.
 *   - 0x0100 (PWRCU_FLAG_WUP)                  : External WAKEUP pin flag has been set.
 *   - 0x0102 (PWRCU_FLAG_PD | PWRCU_FLAG_WUP)  : Both PDF and WUPF flags have been set.
 ************************************************************************************************************/
u16 PWRCU_GetFlagStatus(void)
{
  u32 uRTCStatus = 0;
  u32 uStatus;
  uRTCStatus = BB_RTCEN;

  BB_RTCEN = 1;

  uStatus =  HT_PWRCU->BAKSR;
  BB_RTCEN = uRTCStatus;

  return uStatus;
}

/*********************************************************************************************************//**
 * @brief Returns the value of specified backup register.
 * @param BAKREGx: Number of backup register. Where x can be 0 ~ 9.
 * @return Between 0x0 ~ 0xFFFFFFFF.
 ************************************************************************************************************/
u32 PWRCU_ReadBackupRegister(PWRCU_BAKREG_Enum BAKREGx)
{
  Assert_Param(IS_PWRCU_BAKREG(BAKREGx));

  return HT_PWRCU->BAKREG[BAKREGx];
}

/*********************************************************************************************************//**
 * @brief Writes the DATA to specified backup register.
 * @param BAKREGx : Number of backup registers. Where x can be 0 ~ 9.
 * @param DATA : Must between 0x0 ~ 0xFFFFFFFF.
 * @retval None
 ************************************************************************************************************/
void PWRCU_WriteBackupRegister(PWRCU_BAKREG_Enum BAKREGx, u32 DATA)
{
  Assert_Param(IS_PWRCU_BAKREG(BAKREGx));

  HT_PWRCU->BAKREG[BAKREGx] = DATA;
}

/*********************************************************************************************************//**
 * @brief Enters SLEEP mode.
 * @param SleepEntry : Enters sleep mode instruction that is used to WFI or WFE.
 *   This parameter can be one of the following values:
 *   @arg PWRCU_SLEEP_ENTRY_WFE: Enters SLEEP mode via WFE instruction.
 *   @arg PWRCU_SLEEP_ENTRY_WFI: Enters SLEEP mode via WFI instruction.
 * @retval None
 ************************************************************************************************************/
void PWRCU_Sleep(PWRCU_SLEEP_ENTRY_Enum SleepEntry)
{
  Assert_Param(IS_PWRCU_SLEEP_ENTRY(SleepEntry));

  /* Clear SLEEPDEEP bit of Cortex System Control Register                                                  */
  SCB->SCR &= ~(u32)SLEEPDEEP_SET;

  if (SleepEntry == PWRCU_SLEEP_ENTRY_WFE)
  {
    /* Wait for event                                                                                       */
    __WFE();
  }
  else
  {
    /* Wait for interrupt                                                                                   */
    __WFI();
  }
}

/*********************************************************************************************************//**
 * @brief Enters DEEP-SLEEP Mode 1.
 * @param SleepEntry : Enters sleep mode instruction that is used to WFI or WFE.
 *   This parameter can be one of the following values:
 *   @arg PWRCU_SLEEP_ENTRY_WFE: Enters SLEEP mode via WFE instruction.
 *   @arg PWRCU_SLEEP_ENTRY_WFI: Enters SLEEP mode via WFI instruction.
 * @retval None
 ************************************************************************************************************/
void PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_Enum SleepEntry)
{
  u32 uRTCStatus = 0;
  u32 uADCStatus = 0;
  Assert_Param(IS_PWRCU_SLEEP_ENTRY(SleepEntry));

  uRTCStatus = BB_RTCEN;
  uADCStatus = BB_ADCEN;

  BB_RTCEN = 1;
  BB_ADCEN = 0;

  BB_DMOSON = 0x0;
  BB_LDOOFF = 0x0;

  BB_RTCEN = uRTCStatus;
  /* Sets SLEEPDEEP bit of Cortex System Control Register                                                   */
  SCB->SCR |= SLEEPDEEP_SET;

  if (SleepEntry == PWRCU_SLEEP_ENTRY_WFE)
  {
    /* Wait for event                                                                                       */
    __WFE();
  }
  else
  {
    /* Wait for interrupt                                                                                   */
    __WFI();
  }
  BB_ADCEN = uADCStatus;
}

/*********************************************************************************************************//**
 * @brief Enters DEEP-SLEEP Mode 2.
 * @param SleepEntry : Enters sleep mode instruction that is used to WFI or WFE.
 *   This parameter can be one of the following values:
 *   @arg PWRCU_SLEEP_ENTRY_WFE: Enters SLEEP mode via WFE instruction.
 *   @arg PWRCU_SLEEP_ENTRY_WFI: Enters SLEEP mode via WFI instruction.
 * @retval None
 ************************************************************************************************************/
void PWRCU_DeepSleep2(PWRCU_SLEEP_ENTRY_Enum SleepEntry)
{
  u32 uRTCStatus = 0;
  u32 uADCStatus = 0;
  Assert_Param(IS_PWRCU_SLEEP_ENTRY(SleepEntry));

  uRTCStatus = BB_RTCEN;
  uADCStatus = BB_ADCEN;

  BB_RTCEN = 1;
  BB_ADCEN = 0;

  if (BB_DMOSSTS == 0)
  {
    BB_DMOSON = 0x0;
    BB_DMOSON = 0x1;
  }
  BB_LDOOFF = 0x0;

  BB_RTCEN = uRTCStatus;

  /* Sets SLEEPDEEP bit of Cortex System Control Register                                                   */
  SCB->SCR |= SLEEPDEEP_SET;

  if (SleepEntry == PWRCU_SLEEP_ENTRY_WFE)
  {
    /* Wait for event                                                                                       */
    __WFE();
  }
  else
  {
    /* Wait for interrupt                                                                                   */
    __WFI();
  }
  BB_ADCEN = uADCStatus;
}

/*********************************************************************************************************//**
 * @brief Enters POWER-DOWN Mode.
 * @retval None
 ************************************************************************************************************/
void PWRCU_PowerDown(void)
{
  u32 uRTCStatus = 0;
  u32 uADCStatus = 0;

  uRTCStatus = BB_RTCEN;
  uADCStatus = BB_ADCEN;

  BB_RTCEN = 1;
  BB_ADCEN = 0;

  RTC_LSILoadTrimData();

  BB_DMOSON = 0x0;
  BB_LDOOFF = 0x1;

  BB_RTCEN = uRTCStatus;

  /* Sets SLEEPDEEP bit of Cortex System Control Register                                                   */
  SCB->SCR |= SLEEPDEEP_SET;

  /* Enters power-down mode.                                                                                */
  __WFE();

  BB_ADCEN = uADCStatus;
}

/*********************************************************************************************************//**
 * @brief Configures LVD voltage level.
 * @param Level: Low voltage detect level.
 *   This parameter can be one of following:
 *   @arg PWRCU_LVDS_2V7: 2.7 V
 *   @arg PWRCU_LVDS_2V8: 2.9 V
 *   @arg PWRCU_LVDS_2V9: 2.9 V
 *   @arg PWRCU_LVDS_3V : 3.0 V
 *   @arg PWRCU_LVDS_3V1: 3.1 V
 *   @arg PWRCU_LVDS_3V2: 3.2 V
 *   @arg PWRCU_LVDS_3V4: 3.4 V
 *   @arg PWRCU_LVDS_3V5: 3.5 V
 * @retval None
 ************************************************************************************************************/
void PWRCU_SetLVDS(PWRCU_LVDS_Enum Level)
{
  Assert_Param(IS_PWRCU_LVDS(Level));

  HT_PWRCU->LVDCSR = (HT_PWRCU->LVDCSR & LVDS_MASK) | Level;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables LVD function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_LVDCmd(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  BB_LVDEN = NewState;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables BOD reset function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_BODCmd(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  BB_BODEN = NewState;
}

/*********************************************************************************************************//**
 * @brief Select when the BOD occurs, the action for the cause Reset or Interrupt.
 * @param Selection: BOD reset or interrupt selection.
 *   This parameter can be one of following:
 *   @arg PWRCU_BODRIS_RESET: Reset the whole chip
 *   @arg PWRCU_BODRIS_INT: Assert interrupt
 * @retval None
 ************************************************************************************************************/
void PWRCU_BODRISConfig(PWRCU_BODRIS_Enum Selection)
{
  Assert_Param(IS_PWRCU_BODRIS(Selection));

  BB_BODRIS = Selection;
}

/*********************************************************************************************************//**
 * @brief Return the flag status of LVD.
 * @return SET or RESET.
 ************************************************************************************************************/
FlagStatus PWRCU_GetLVDFlagStatus(void)
{
  return (FlagStatus)BB_LVDF;
}

/*********************************************************************************************************//**
 * @brief Return the flag status of BOD.
 * @return SET or RESET.
 ************************************************************************************************************/
FlagStatus PWRCU_GetBODFlagStatus(void)
{
  return (FlagStatus)BB_BODF;
}

/*********************************************************************************************************//**
 * @brief Returns the DMOS status.
 * @return This function will return one of following:
 *    - PWRCU_DMOS_STS_ON              : DMOS on
 *    - PWRCU_DMOS_STS_OFF             : DMOS off
 *    - PWRCU_DMOS_STS_OFF_BY_BODRESET : DMOS off caused by brow out reset
 ************************************************************************************************************/
PWRCU_DMOSStatus PWRCU_GetDMOSStatus(void)
{
  u32 wDmosStatus = HT_PWRCU->BAKCR & 0x8080;

  if (wDmosStatus == 0x0)
  {
    return PWRCU_DMOS_STS_OFF;
  }
  else if (wDmosStatus == 0x8080)
  {
    return PWRCU_DMOS_STS_ON;
  }
  else
  {
    return PWRCU_DMOS_STS_OFF_BY_BODRESET;
  }
}

/*********************************************************************************************************//**
 * @brief Enables or Disables DMOS function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_DMOSCmd(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (BB_DMOSSTS == 0)
  {
    BB_DMOSON = 0;
  }

  BB_DMOSON = NewState;
}

/*********************************************************************************************************//**
 * @brief Configures VDD18 power good source.
 * @param Sel: Specifies VDD18 power good source.
 *    @arg PWRCU_V18RDYSC_BKISO  : Vdd18 power good source come from BK_ISO bit in CKCU unit
 *    @arg PWRCU_V18RDYSC_V18POR : Vdd18 power good source come from Vdd18 power on reset
 * @retval None
 ************************************************************************************************************/
void PWRCU_V18RDYSourceConfig(PWRCU_V18RDYSC_Enum Sel)
{
  Assert_Param(IS_PWRCU_V18RDYSC(Sel));

  BB_V18RDYSC = Sel;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables LVD interrupt wakeup function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_LVDIntWakeupConfig(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  BB_LVDIWEN = NewState;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables LVD event wakeup function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_LVDEventWakeupConfig(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  BB_LVDEWEN = NewState;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables external WAKEUP pin function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_WakeupPinCmd(ControlStatus NewState)
{
  u32 uRTCStatus = 0;
  Assert_Param(IS_CONTROL_STATUS(NewState));

  uRTCStatus = BB_RTCEN;
  
  BB_RTCEN = 1;
  
  BB_WUPEN = NewState;
  
  BB_RTCEN = uRTCStatus;
}

/*********************************************************************************************************//**
 * @brief Enables or Disables external WAKEUP pin interrupt function.
 * @param NewState: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PWRCU_WakeupPinIntConfig(ControlStatus NewState)
{
  Assert_Param(IS_CONTROL_STATUS(NewState));

  BB_WUPIEN = NewState;
}

/*********************************************************************************************************//**
 * @brief Configure HSI ready counter bit length.
 * @param BitLength: HSI ready counter bit length.
 *   This parameter can be one of following:
 *   @arg PWRCU_HSIRCBL_4: 4 bits
 *   @arg PWRCU_HSIRCBL_5: 5 bits
 *   @arg PWRCU_HSIRCBL_6: 6 bits
 *   @arg PWRCU_HSIRCBL_7: 7 bits (Default)
 * @retval None
 ************************************************************************************************************/
void PWRCU_HSIReadyCounterBitLengthConfig(PWRCU_HSIRCBL_Enum BitLength)
{
  Assert_Param(IS_PWRCU_HSIRCBL(BitLength));

  HT_PWRCU->HSIRCR = BitLength;
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
