/*********************************************************************************************************//**
 * @file    ht32f1655_56_mctm.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the MCTM firmware functions.
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
#include "ht32f1655_56_mctm.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup MCTM MCTM
  * @brief MCTM driver modules
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Private_Define MCTM private definitions
  * @{
  */
#define CNTCFR_UEV1DIS      0x00000001ul
#define CNTCFR_UGDIS        0x00000002ul
#define CNTCFR_DIR          0x01000000ul
#define CNTCFR_CMSEL_MASK   ~0x00030000ul
#define CNTCFR_CKDIV_MASK   ~0x00000300ul

#define MDCFR_SPMSET        0x01000000ul
#define MDCFR_TSE           0x00000001ul
#define MDCFR_SMSEL_MASK    ~0x00000700ul
#define MDCFR_MMSEL_MASK    ~0x00070000ul

#define TRCFR_ECME          0x01000000ul
#define TRCFR_ETI_POL       0x00010000ul
#define TRCFR_ETI_PSC_MASK  ~0x00003000ul
#define TRCFR_ETIF_MASK     ~0x00000F00ul
#define TRCFR_TRSEL_MASK    ~0x0000000Ful
#define TRCFR_ETI_CONF_MASK ~0x00013F00ul

#define CTR_TME             0x00000001ul
#define CTR_CRBE            0x00000002ul
#define CTR_COMPRE          0x00000100ul
#define CTR_COMUS           0x00000200ul
#define CTR_CHCCDS          0x00010000ul

#define CH0ICFR_CH0SRC      0x80000000ul
#define CHICFR_CHF_MASK     ~0x0000000Ful
#define CHICFR_CHCCS_MASK   ~0x00030000ul
#define CHICFR_CHPSC_MASK   ~0x000C0000ul

#define CHOCFR_REFCE        0x00000008ul
#define CHOCFR_CHPRE        0x00000010ul
#define CHOCFR_IMAE         0x00000020ul
#define CHOCFR_CHOM_MASK    ~0x00000107ul

#define CHPOLR_CH0P         0x00000001ul
#define CHPOLR_CH1P         0x00000004ul

#define CHBRKCTR_CHMOE      0x00000010ul
/**
  * @}
  */

/* Private function prototypes -----------------------------------------------------------------------------*/
static void
mctm_CHx_Config(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Ch, MCTM_CHP_Enum Pol, MCTM_CHCCS_Enum Sel, u8 Filter);

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Exported_Functions MCTM exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize the MCTMx peripheral registers to their default reset values.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @retval None
 ************************************************************************************************************/
void MCTM_DeInit(HT_MCTM_TypeDef* MCTMx)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  if (MCTMx == HT_MCTM0)
  {
    RSTCUReset.Bit.MCTM0 = 1;
  }
  else
  {
    RSTCUReset.Bit.MCTM1 = 1;
  }

  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Initialize the MCTMx counter to reload, prescaler, counter mode and repetition counter.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param TimeBaseInit: Point to a \ref MCTM_TimeBaseInitTypeDef that contains the configuration information.
 * @retval None
 ************************************************************************************************************/
void MCTM_TimeBaseInit(HT_MCTM_TypeDef* MCTMx, MCTM_TimeBaseInitTypeDef* TimeBaseInit)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CNT_MODE(TimeBaseInit->CounterMode));
  Assert_Param(IS_MCTM_PSC_RLD(TimeBaseInit->PSCReloadTime));

  /* Set the counter reload value                                                                           */
  MCTMx->CRR = TimeBaseInit->CounterReload;

  /* Set the Prescaler value                                                                                */
  MCTMx->PSCR = TimeBaseInit->Prescaler;

  /* Select the Counter Mode                                                                                */
  MCTMx->CNTCFR &= CNTCFR_CMSEL_MASK;        /* CNTCFR_DIR is read only when the timer configured as        */
  MCTMx->CNTCFR &= ~(u32)CNTCFR_DIR;         /* Center-aligned mode. Reset mode first and then reset the    */
                                             /* CNTCFR_DIR bit (separate as two steps).                     */

  MCTMx->CNTCFR |= TimeBaseInit->CounterMode;

  /* Set the Repetition value                                                                               */
  MCTMx->REPR = TimeBaseInit->RepetitionCounter;

  /* To reload the Prescaler value immediatly or next update event 1                                        */
  MCTMx->EVGR = TimeBaseInit->PSCReloadTime;
}

/*********************************************************************************************************//**
 * @brief Initialize the MCTMx channel N output.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param OutInit: Point to a \ref MCTM_OutputInitTypeDef structure that contains
                   the configuration information.
 * @retval None
 ************************************************************************************************************/
void MCTM_OutputInit(HT_MCTM_TypeDef* MCTMx, MCTM_OutputInitTypeDef* OutInit)
{
  vu32 *pOcfr = (vu32*)&MCTMx->CH0OCFR + OutInit->Channel;
  vu32 *pCcr = (vu32*)&MCTMx->CH0CCR + OutInit->Channel;
  vu32 *pAcr = (vu32*)&MCTMx->CH0ACR + OutInit->Channel;
  u8 bChPos = OutInit->Channel << 1;
  u32 wTmpMask = ~(0x3ul << bChPos);
  u32 wTmpReg;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(OutInit->Channel));
  Assert_Param(IS_MCTM_OM(OutInit->OutputMode));
  Assert_Param(IS_MCTM_CHCTL(OutInit->Control));
  Assert_Param(IS_MCTM_CHCTL(OutInit->ControlN));
  Assert_Param(IS_MCTM_CHP(OutInit->Polarity));
  Assert_Param(IS_MCTM_CHP(OutInit->PolarityN));
  Assert_Param(IS_MCTM_OIS(OutInit->IdleState));
  Assert_Param(IS_MCTM_OIS(OutInit->IdleStateN));

  /* Disable the Channel                                                                                    */
  MCTMx->CHCTR &= wTmpMask;

  /* Set the Output Compare Polarity                                                                        */
  wTmpReg = MCTMx->CHPOLR & wTmpMask;
  wTmpReg |= (u32)(OutInit->Polarity | (OutInit->PolarityN << 1)) << bChPos;
  MCTMx->CHPOLR = wTmpReg;

  /* Set the Output Idle State                                                                              */
  wTmpReg = MCTMx->CHBRKCFR & wTmpMask;
  wTmpReg |= (u32)(OutInit->IdleState | (OutInit->IdleStateN << 1)) << bChPos;
  MCTMx->CHBRKCFR = wTmpReg;

  /* Select the Output Compare Mode                                                                         */
  *pOcfr &= CHOCFR_CHOM_MASK;
  *pOcfr |= OutInit->OutputMode;

  /* Set the Capture Compare Register value                                                                 */
  *pCcr = OutInit->Compare;

  /* Set the Asymmetric Compare Register value                                                              */
  *pAcr = OutInit->AsymmetricCompare;

  /* Set the channel state                                                                                  */
  MCTMx->CHCTR |= (u32)(OutInit->Control | (OutInit->ControlN << 1)) << bChPos;
}

/*********************************************************************************************************//**
 * @brief Initialize input capture of the MCTMx channel.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param CapInit: Point to a \ref MCTM_CaptureInitTypeDef structure that contains the configuration
 *                information.
 * @retval None
 ************************************************************************************************************/
void MCTM_CaptureInit(HT_MCTM_TypeDef* MCTMx, MCTM_CaptureInitTypeDef* CapInit)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(CapInit->Channel));
  Assert_Param(IS_MCTM_CHP(CapInit->Polarity));
  Assert_Param(IS_MCTM_CHCCS(CapInit->Selection));
  Assert_Param(IS_MCTM_CHPSC(CapInit->Prescaler));
  Assert_Param(IS_MCTM_FILTER(CapInit->Filter));

  mctm_CHx_Config(MCTMx, CapInit->Channel, CapInit->Polarity, CapInit->Selection, CapInit->Filter);

  /* Set the Input Capture Prescaler value                                                                  */
  MCTM_CHPSCConfig(MCTMx, CapInit->Channel, CapInit->Prescaler);
}

/*********************************************************************************************************//**
 * @brief Configure the MCTMx to measure an external PWM signal.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param CapInit: Point to a \ref MCTM_CaptureInitTypeDef structure that contains the configuration
 *                information.
 * @retval None
 ************************************************************************************************************/
void MCTM_PwmInputInit(HT_MCTM_TypeDef* MCTMx, MCTM_CaptureInitTypeDef* CapInit)
{
  MCTM_CHP_Enum OppositePol;
  MCTM_CHCCS_Enum OppositeSel;
  MCTM_CH_Enum OppositeChannel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH_PWMI(CapInit->Channel));
  Assert_Param(IS_MCTM_CHP(CapInit->Polarity));
  Assert_Param(IS_MCTM_CHCCS(CapInit->Selection));
  Assert_Param(IS_MCTM_CHPSC(CapInit->Prescaler));
  Assert_Param(IS_MCTM_FILTER(CapInit->Filter));

  /* Select the Opposite Input Polarity                                                                     */
  if (CapInit->Polarity == MCTM_CHP_NONINVERTED)
  {
    OppositePol = MCTM_CHP_INVERTED;
  }
  else
  {
    OppositePol = MCTM_CHP_NONINVERTED;
  }

  /* Select the Opposite Input                                                                              */
  if (CapInit->Selection == MCTM_CHCCS_DIRECT)
  {
    OppositeSel = MCTM_CHCCS_INDIRECT;
  }
  else
  {
    OppositeSel = MCTM_CHCCS_DIRECT;
  }

  if (CapInit->Channel == MCTM_CH_0)
  {
    OppositeChannel = MCTM_CH_1;
  }
  else
  {
    OppositeChannel = MCTM_CH_0;
  }

  /* CH0 Configuration                                                                                    */
  mctm_CHx_Config(MCTMx, CapInit->Channel, CapInit->Polarity, CapInit->Selection, CapInit->Filter);

  /* Set the Input Capture Prescaler value                                                                */
  MCTM_CHPSCConfig(MCTMx, CapInit->Channel, CapInit->Prescaler);

  /* CH1 Configuration                                                                                    */
  mctm_CHx_Config(MCTMx, OppositeChannel, OppositePol, OppositeSel, CapInit->Filter);

  /* Set the Input Capture Prescaler value                                                                */
  MCTM_CHPSCConfig(MCTMx, OppositeChannel, CapInit->Prescaler);
}

/*********************************************************************************************************//**
 * @brief Fill each TimeBaseInit member with its default value.
 * @param TimeBaseInit: Point to a \ref MCTM_TimeBaseInitTypeDef structure.
 * @retval None
 ************************************************************************************************************/
void MCTM_TimeBaseStructInit(MCTM_TimeBaseInitTypeDef* TimeBaseInit)
{
  /* Set the default configuration                                                                          */
  TimeBaseInit->CounterMode = MCTM_CNT_MODE_UP;
  TimeBaseInit->CounterReload = 0xFFFF;
  TimeBaseInit->Prescaler = 0x0000;
  TimeBaseInit->PSCReloadTime = MCTM_PSC_RLD_IMMEDIATE;
  TimeBaseInit->RepetitionCounter = 0;
}

/*********************************************************************************************************//**
 * @brief Fill each OutInit member with its default value.
 * @param OutInit: Point to a \ref MCTM_OutputInitTypeDef structure.
 * @retval None
 ************************************************************************************************************/
void MCTM_OutputStructInit(MCTM_OutputInitTypeDef* OutInit)
{
  /* Set the default configuration                                                                          */
  OutInit->Channel = MCTM_CH_0;
  OutInit->OutputMode = MCTM_OM_MATCH_NOCHANGE;
  OutInit->Control = MCTM_CHCTL_DISABLE;
  OutInit->ControlN = MCTM_CHCTL_DISABLE;
  OutInit->Polarity = MCTM_CHP_NONINVERTED;
  OutInit->PolarityN = MCTM_CHP_NONINVERTED;
  OutInit->IdleState = MCTM_OIS_LOW;
  OutInit->IdleStateN = MCTM_OIS_LOW;
  OutInit->Compare = 0x0000;
  OutInit->AsymmetricCompare = 0x0000;
}

/*********************************************************************************************************//**
 * @brief Fill each CapInit member with its default value.
 * @param CapInit: Point to a \ref MCTM_CaptureInitTypeDef structure.
 * @retval None
 ************************************************************************************************************/
void MCTM_CaptureStructInit(MCTM_CaptureInitTypeDef* CapInit)
{
  /* Set the default configuration                                                                          */
  CapInit->Channel = MCTM_CH_0;
  CapInit->Polarity = MCTM_CHP_NONINVERTED;
  CapInit->Selection = MCTM_CHCCS_DIRECT;
  CapInit->Prescaler = MCTM_CHPSC_OFF;
  CapInit->Filter = 0x00;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable MCTMx counter.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_Cmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the MCTM Counter                                                                              */
    MCTMx->CTR |= CTR_TME;
  }
  else
  {
    /* Disable the MCTM Counter                                                                             */
    MCTMx->CTR &= ~CTR_TME;
  }
}

/*********************************************************************************************************//**
 * @brief Configure external clock mode of the MCTMx. Used ITIx as the clock source.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Iti: Trigger source.
 *        This parameter can be one of the following values:
 *        @arg MCTM_TRSEL_ITI0: Internal trigger 0
 *        @arg MCTM_TRSEL_ITI1: Internal trigger 1
 *        @arg MCTM_TRSEL_ITI2: Internal trigger 2
 * @retval None
 ************************************************************************************************************/
void MCTM_ItiExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Iti)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_ITI(Iti));

  /* Select the Internal Trigger. Slave mode will be disable in this function                               */
  MCTM_StiConfig(MCTMx, Iti);

  /* Select the STIED as external clock source                                                              */
  MCTMx->MDCFR |= MCTM_SMSEL_STIED;
}

/*********************************************************************************************************//**
 * @brief Configure external clock mode of the MCTMx. Used CHx as the clock source.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Sel: Specify the channel source.
 *        This parameter can be one of the following values:
 *        @arg MCTM_TRSEL_TI0BED : TI0 both edge detector
 *        @arg MCTM_TRSEL_TI0S0 : Filtered timer input 0
 *        @arg MCTM_TRSEL_TI1S1 : Filtered timer input 1
 * @param Pol: Specify the CHx Polarity.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : active high.
 *        @arg MCTM_CHP_INVERTED    : active low.
 * @param Filter: Specify the filter value.
 *        This parameter must be a value between 0x0 and 0xF.
 * @retval None
 ************************************************************************************************************/
void MCTM_ChExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Sel, MCTM_CHP_Enum Pol, u8 Filter)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_TRSEL_CH(Sel));
  Assert_Param(IS_MCTM_CHP(Pol));
  Assert_Param(IS_MCTM_FILTER(Filter));

  /* Configure the Timer Input Clock Source                                                                 */
  if (Sel == MCTM_TRSEL_TI1S1)
  {
    mctm_CHx_Config(MCTMx, MCTM_CH_1, Pol, MCTM_CHCCS_DIRECT, Filter);
  }
  else
  {
    mctm_CHx_Config(MCTMx, MCTM_CH_0, Pol, MCTM_CHCCS_DIRECT, Filter);
  }

  /* Select the external clock source. Slave mode will be disable in this function                          */
  MCTM_StiConfig(MCTMx, Sel);

  /* Select the STIED as external clock source                                                              */
  MCTMx->MDCFR |= MCTM_SMSEL_STIED;
}

/*********************************************************************************************************//**
 * @brief Configure external clock mode of the MCTMx. Used ETI as the clock source.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Psc: The external Trigger Prescaler.
 *        It can be one of the following values:
 *        @arg MCTM_ETIPSC_OFF : ETI prescaler off
 *        @arg MCTM_ETIPSC_2   : ETIP frequency divided by 2
 *        @arg MCTM_ETIPSC_4   : ETIP frequency divided by 4
 *        @arg MCTM_ETIPSC_8   : ETIP frequency divided by 8
 * @param Pol: The external trigger input polarity.
 *        It can be one of the following values:
 *        @arg MCTM_ETIPOL_NONINVERTED : Active high level or rising edge
 *        @arg MCTM_ETIPOL_INVERTED    : Active low level or falling edge
 * @param Filter: Filter for ETI input.
 *        This parameter must be a value between 0x00 and 0x0F
 * @retval None
 ************************************************************************************************************/
void MCTM_EtiExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_ETIPSC_Enum Psc, MCTM_ETIPOL_Enum Pol, u8 Filter)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_ETIPSC(Psc));
  Assert_Param(IS_MCTM_ETIPOL(Pol));
  Assert_Param(IS_MCTM_FILTER(Filter));

  /* Configure the ETI Clock source                                                                         */
  MCTM_EtiConfig(MCTMx, Psc, Pol, Filter);

  /* Enable the external clock mode                                                                         */
  MCTMx->TRCFR |= TRCFR_ECME;
}

/*********************************************************************************************************//**
 * @brief Configure external trigger input (ETI) of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Psc: The external Trigger Prescaler.
 *        It can be one of the following values:
 *        @arg MCTM_ETIPSC_OFF : ETI prescaler off
 *        @arg MCTM_ETIPSC_2   : ETIP frequency divided by 2
 *        @arg MCTM_ETIPSC_4   : ETIP frequency divided by 4
 *        @arg MCTM_ETIPSC_8   : ETIP frequency divided by 8
 * @param Pol: The external trigger input polarity.
 *        It can be one of the following values:
 *        @arg MCTM_ETIPOL_NONINVERTED : Active high level or rising edge
 *        @arg MCTM_ETIPOL_INVERTED    : Active low level or falling edge
 * @param Filter: Filter for ETI input.
 *        This parameter must be a value between 0x00 and 0x0F
 * @retval None
 ************************************************************************************************************/
void MCTM_EtiConfig(HT_MCTM_TypeDef* MCTMx, MCTM_ETIPSC_Enum Psc, MCTM_ETIPOL_Enum Pol, u8 Filter)
{
  u32 wTrcfr;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_ETIPSC(Psc));
  Assert_Param(IS_MCTM_ETIPOL(Pol));
  Assert_Param(IS_MCTM_FILTER(Filter));

  /* Get TRCFR value with cleared ETI configuration bits                                                    */
  wTrcfr = MCTMx->TRCFR & TRCFR_ETI_CONF_MASK;

  /* Set the prescaler, filter and polarity for ETI input                                                   */
  wTrcfr |= (u32)Psc | Pol | ((u32)Filter << 8);

  /* Write to MCTMx TRCFR                                                                                   */
  MCTMx->TRCFR = wTrcfr;
}

/*********************************************************************************************************//**
 * @brief Configure prescaler of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Psc: Specify the prescaler value.
 * @param PscReloadTime: Specify the MCTM prescaler reload time.
 *        This parameter can be one of the following values:
 *        @arg MCTM_PSC_RLD_UPDATE    : The prescaler is loaded at the next update event 1.
 *        @arg MCTM_PSC_RLD_IMMEDIATE : The prescaler is loaded immediatly.
 * @retval None
 ************************************************************************************************************/
void MCTM_PrescalerConfig(HT_MCTM_TypeDef* MCTMx, u16 Psc, MCTM_PSC_RLD_Enum PscReloadTime)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_PSC_RLD(PscReloadTime));

  /* Set the prescaler value                                                                                */
  MCTMx->PSCR = Psc;

  /* Set the UEV1G bit or not                                                                               */
  MCTMx->EVGR = PscReloadTime;
}

/*********************************************************************************************************//**
 * @brief Configure counter mode of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Mod: Specify the counter mode to be used.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CNT_MODE_UP   : MCTM up counting mode.
 *        @arg MCTM_CNT_MODE_DOWN : MCTM down counting mode.
 *        @arg MCTM_CNT_MODE_CA1  : MCTM center aligned mode 1.
 *        @arg MCTM_CNT_MODE_CA2  : MCTM center aligned mode 2.
 *        @arg MCTM_CNT_MODE_CA3  : MCTM center aligned mode 3.
 * @retval None
 ************************************************************************************************************/
void MCTM_CounterModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CNT_MODE_Enum Mod)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CNT_MODE(Mod));

  /* Reset the CMSEL and DIR Bits                                                                           */
  MCTMx->CNTCFR &= CNTCFR_CMSEL_MASK;        /* CNTCFR_DIR is read only when the timer configured as        */
  MCTMx->CNTCFR &= ~(u32)CNTCFR_DIR;         /* Center-aligned mode. Reset mode first and then reset the    */
                                             /* CNTCFR_DIR bit (separate as two steps).                     */

  /* Set the Counter Mode                                                                                   */
  MCTMx->CNTCFR |= Mod;
}

/*********************************************************************************************************//**
 * @brief Select the STI source.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Sel: Store the STI source.
 *        This parameter can be one of the following:
 *        @arg MCTM_TRSEL_ITI0  : Internal trigger 0.
 *        @arg MCTM_TRSEL_ITI1  : Internal trigger 1.
 *        @arg MCTM_TRSEL_ITI2  : Internal trigger 2.
 *        @arg MCTM_TRSEL_TI0BED : TI0 both edge detector.
 *        @arg MCTM_TRSEL_TI0S0 : Filtered channel 0 input.
 *        @arg MCTM_TRSEL_TI1S1 : Filtered channel 1 input.
 *        @arg MCTM_TRSEL_ETIF  : External trigger input.
 *        @arg MCTM_TRSEL_UEV1G : Trigger by setting UEV1G bit.
 * @retval None
 ************************************************************************************************************/
void MCTM_StiConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Sel)
{
  u32 wTrcfr;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_TRSEL(Sel));

  /* Disable slave mode                                                                                     */
  MCTMx->MDCFR &= MDCFR_SMSEL_MASK;

  /* Get the TRCFR value with cleared TRSEL                                                                 */
  wTrcfr = MCTMx->TRCFR & TRCFR_TRSEL_MASK;

  /* Set the STI source                                                                                     */
  MCTMx->TRCFR |= wTrcfr | Sel;
}

/*********************************************************************************************************//**
 * @brief Configure encoder interface of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param DecoderMod: Specify the MCTMx decoder mode.
 *        This parameter can be one of the following values:
 *        @arg MCTM_SMSEL_DECODER1 : Counter counts on CH0 edge depending on CH1 level.
 *        @arg MCTM_SMSEL_DECODER2 : Counter counts on CH1 edge depending on CH0 level.
 *        @arg MCTM_SMSEL_DECODER3 : Counter counts on both CH0 and CH1 edges depending on
 *             the level of the other input.
 * @param CH0P: Specify the CH0 polarity.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : Active high level or rising edge
 *        @arg MCTM_CHP_INVERTED    : Active low level or falling edge
 * @param CH1P: Specify the CH1 polarity.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : Active high level or rising edge
 *        @arg MCTM_CHP_INVERTED    : Active low level or falling edge
 * @retval None
 ************************************************************************************************************/
void MCTM_DecoderConfig(HT_MCTM_TypeDef* MCTMx, MCTM_SMSEL_Enum DecoderMod,
                        MCTM_CHP_Enum CH0P, MCTM_CHP_Enum CH1P)
{
  u32 wMdcfr, wCh0Icfr, wCh1Icfr, wChpolr;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_SMSEL_DECODER(DecoderMod));
  Assert_Param(IS_MCTM_CHP(CH0P));
  Assert_Param(IS_MCTM_CHP(CH1P));

  /* Get the MCTMx MDCFR register value                                                                     */
  wMdcfr = MCTMx->MDCFR;

  /* Get the MCTMx CH0ICFR & CH1ICFR register value                                                         */
  wCh0Icfr = MCTMx->CH0ICFR;
  wCh1Icfr = MCTMx->CH1ICFR;

  /* Get the MCTMx CHPOLR register value                                                                    */
  wChpolr = MCTMx->CHPOLR;

  /* Set the decoder mode                                                                                   */
  wMdcfr &= MDCFR_SMSEL_MASK;
  wMdcfr |= DecoderMod;

  /* Select the channel 0 and the channel 1 as input and clear CH0SRC                                       */
  wCh0Icfr &= CHICFR_CHCCS_MASK & (~CH0ICFR_CH0SRC);
  wCh1Icfr &= CHICFR_CHCCS_MASK;
  wCh0Icfr |= MCTM_CHCCS_DIRECT;
  wCh1Icfr |= MCTM_CHCCS_DIRECT;

  /* Set the CH0 and the CH1 polarities                                                                     */
  wChpolr &= ~(CHPOLR_CH0P | CHPOLR_CH1P);
  wChpolr |= (CH0P | (CH1P << 2));

  /* Write to MCTMx MDCFR                                                                                   */
  MCTMx->MDCFR = wMdcfr;

  /* Write to MCTMx CH0ICFR & CH1ICFR                                                                       */
  MCTMx->CH0ICFR = wCh0Icfr;
  MCTMx->CH1ICFR = wCh1Icfr;

  /* Write to MCTMx CHPOLR                                                                                  */
  MCTMx->CHPOLR = wChpolr;
}

/*********************************************************************************************************//**
 * @brief Force the MCTMx CH0OREF waveform to active or inactive level.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param ForcedAction: Specify the forced action to be set to the output waveform.
 *        This parameter can be one of the following values:
 *        @arg MCTM_OM_FORCED_ACTIVE   : Forced active level on CH0OREF
 *        @arg MCTM_OM_FORCED_INACTIVE : Forced inactive level on CH0OREF.
 * @retval None
 ************************************************************************************************************/
void MCTM_ForcedOREF0(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_OM_FORCED(ForcedAction));

  /* Configure The forced output mode                                                                       */
  MCTMx->CH0OCFR = (MCTMx->CH0OCFR & CHOCFR_CHOM_MASK) | ForcedAction;
}

/*********************************************************************************************************//**
 * @brief Force the MCTMx CH1OREF waveform to active or inactive level.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param ForcedAction: Specify the forced action to be set to the output waveform.
 *        This parameter can be one of the following values:
 *        @arg MCTM_OM_FORCED_ACTIVE   : Force active level on CH1OREF
 *        @arg MCTM_OM_FORCED_INACTIVE : Force inactive level on CH1OREF.
 * @retval None
 ************************************************************************************************************/
void MCTM_ForcedOREF1(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_OM_FORCED(ForcedAction));

  /* Configure The forced output mode                                                                       */
  MCTMx->CH1OCFR = (MCTMx->CH1OCFR & CHOCFR_CHOM_MASK) | ForcedAction;
}

/*********************************************************************************************************//**
 * @brief Force the MCTMx CH2OREF waveform to active or inactive level.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param ForcedAction: Specify the forced action to be set to the output waveform.
 *        This parameter can be one of the following values:
 *        @arg MCTM_OM_FORCED_ACTIVE   : Force active level on CH2OREF
 *        @arg MCTM_OM_FORCED_INACTIVE : Force inactive level on CH2OREF.
 * @retval None
 ************************************************************************************************************/
void MCTM_ForcedOREF2(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_OM_FORCED(ForcedAction));

  /* Configure The forced output mode                                                                       */
  MCTMx->CH2OCFR = (MCTMx->CH2OCFR & CHOCFR_CHOM_MASK) | ForcedAction;
}

/*********************************************************************************************************//**
 * @brief Force the MCTMx CH3OREF waveform to active or inactive level.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param ForcedAction: Specify the forced action to be set to the output waveform.
 *        This parameter can be one of the following values:
 *        @arg MCTM_OM_FORCED_ACTIVE   : Force active level on CH3OREF
 *        @arg MCTM_OM_FORCED_INACTIVE : Force inactive level on CH3OREF.
 * @retval None
 ************************************************************************************************************/
void MCTM_ForcedOREF3(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_OM_FORCED(ForcedAction));

  /* Configure The forced output mode                                                                       */
  MCTMx->CH3OCFR = (MCTMx->CH3OCFR & CHOCFR_CHOM_MASK) | ForcedAction;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the MCTMx CRR preload function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_CRRPreloadCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Set the CRR preload control bit                                                                      */
    MCTMx->CTR |= CTR_CRBE;
  }
  else
  {
    /* Reset the CRR preload control bit                                                                    */
    MCTMx->CTR &= ~CTR_CRBE;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the MCTMx CHxCCR preload function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param NewState This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_CHCCRPreloadConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState)
{
  vu32 *pOcfr = (vu32*)&MCTMx->CH0OCFR + Channel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  /* Enable or disable the channel N CCR preload feature                                                    */
  if (NewState != DISABLE)
  {
    *pOcfr |= CHOCFR_CHPRE;
  }
  else
  {
    *pOcfr &= ~CHOCFR_CHPRE;
  }
}

/*********************************************************************************************************//**
 * @brief Clear or Safeguard the CHxOREF signal when ETI is active.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param NewState This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_ClearOREFConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState)
{
  vu32 *pOcfr = (vu32*)&MCTMx->CH0OCFR + Channel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  /* Enable or Disable the channel N clear Oref at ETI active function                                      */
  if (NewState != DISABLE)
  {
    *pOcfr |= CHOCFR_REFCE;
  }
  else
  {
    *pOcfr &= ~CHOCFR_REFCE;
  }
}

/*********************************************************************************************************//**
 * @brief Configure polarity of the MCTMx channel N.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Pol: Specify the polarity of channel N.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : active high
 *        @arg MCTM_CHP_INVERTED    : active low
 * @retval None
 ************************************************************************************************************/
void MCTM_ChPolarityConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHP_Enum Pol)
{
  u32 wChpolr;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_MCTM_CHP(Pol));

  /* Set or reset the CHx polarity                                                                          */
  wChpolr = MCTMx->CHPOLR & (~(u32)(0x1 << (Channel << 1)));
  MCTMx->CHPOLR = wChpolr | (Pol << (Channel << 1));
}

/*********************************************************************************************************//**
 * @brief Configure polarity of the MCTMx channel N.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Pol: Specify the polarity of channel N.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : active high
 *        @arg MCTM_CHP_INVERTED    : active low
 * @retval None
 ************************************************************************************************************/
void MCTM_ChNPolarityConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHP_Enum Pol)
{
  u32 wChpolr;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_COMPLEMENTARY_CH(Channel));
  Assert_Param(IS_MCTM_CHP(Pol));

  /* Set or reset the CHxN polarity                                                                         */
  wChpolr = MCTMx->CHPOLR & (~(u32)(0x2 << (Channel << 1)));
  MCTMx->CHPOLR = wChpolr | ((Pol << 1) << (Channel << 1));
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the single pulse immediate active function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 * @note Must configure output mode to PWM1 or PWM2 before invoke this function.
 ************************************************************************************************************/
void MCTM_ImmActiveConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState)
{
  vu32 *pOcfr = (vu32*)&MCTMx->CH0OCFR + Channel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  /* Enable or disable the channel N clear CHxOREF at ETI active function                                   */
  if (NewState != DISABLE)
  {
    *pOcfr |= CHOCFR_IMAE;
  }
  else
  {
    *pOcfr &= ~CHOCFR_IMAE;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the MCTMx channel N.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Control: This parameter can be MCTM_CHCTL_ENABLE or MCTM_CHCTL_DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_ChannelConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHCTL_Enum Control)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_MCTM_CHCTL(Control));

  /* Reset the CHxE Bit                                                                                     */
  MCTMx->CHCTR &= ~(u32)(0x1 << (Channel << 1));

  /* Set or reset the CHxE Bit                                                                              */
  MCTMx->CHCTR |= (u32)Control << (Channel << 1);
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the MCTMx channel N.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Control: This parameter can be MCTM_CHCTL_ENABLE or MCTM_CHCTL_DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_ChannelNConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHCTL_Enum Control)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_COMPLEMENTARY_CH(Channel));
  Assert_Param(IS_MCTM_CHCTL(Control));

  /* Reset the CHxNE Bit                                                                                    */
  MCTMx->CHCTR &= ~(u32)(0x2 << (Channel << 1));

  /* Set or reset the CHxNE Bit                                                                             */
  MCTMx->CHCTR |= (u32)(Control << 1) << (Channel << 1);
}

/*********************************************************************************************************//**
 * @brief Configure output mode of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Mod: Specify the MCTM output mode.
 *        This parameter can be one of the following values:
 *        @arg MCTM_OM_MATCH_NOCHANGE  : Output dont change on match
 *        @arg MCTM_OM_MATCH_INACTIVE  : Output inactive on compare match
 *        @arg MCTM_OM_MATCH_ACTIVE    : Output active on compare match
 *        @arg MCTM_OM_MATCH_TOGGLE    : Output toggle on compare match
 *        @arg MCTM_OM_FORCED_INACTIVE : Output forced inactive
 *        @arg MCTM_OM_FORCED_ACTIVE   : Output forced active
 *        @arg MCTM_OM_PWM1            : PWM1 mode
 *        @arg MCTM_OM_PWM2            : PWM2 mode
 *        @arg MCTM_OM_ASYMMETRIC_PWM1 : Asymmetric PWM1 mode
 *        @arg MCTM_OM_ASYMMETRIC_PWM2 : Asymmetric PWM2 mode
 * @retval None
 * @note This function disables the selected channel before changing the output mode.
 ************************************************************************************************************/
void MCTM_OutputModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_OM_Enum Mod)
{
  vu32 *pOcfr = (vu32*)&MCTMx->CH0OCFR + Channel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_MCTM_OM(Mod));

  /* Disable the channel: Reset the CHxE Bit                                                                */
  MCTMx->CHCTR &= ~(u32)(0x1 << (Channel << 1));

  /* Selects the MCTM output mode                                                                           */
  *pOcfr = (*pOcfr & CHOCFR_CHOM_MASK) | Mod;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable update event of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE(default) or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_UpdateCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState == DISABLE)
  {
    /* Set the update disable bit                                                                           */
    MCTMx->CNTCFR |= CNTCFR_UEV1DIS;
  }
  else
  {
    /* Reset the update disable bit                                                                         */
    MCTMx->CNTCFR &= ~CNTCFR_UEV1DIS;
  }
}

/*********************************************************************************************************//**
 * @brief Configure UEV1G interrupt function of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be one of the following value:
 *    @arg ENABLE  : Default value. Any of the following events will generate an update event 1 interrupt:
 *                   - Counter overflow/underflow
 *                   - Setting the UEV1G bit
 *                   - Update generation through the slave restart mode
 *    @arg DISABLE : Only counter overflow/underflow generations an update event 1 interrupt.
 * @retval None
 ************************************************************************************************************/
void MCTM_UEV1G_IntConfig(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState == DISABLE)
  {
    /* Set the UEV1G interrupt disable bit                                                                  */
    MCTMx->CNTCFR |= CNTCFR_UGDIS;
  }
  else
  {
    /* Reset the UEV1G interrupt disable bit                                                                */
    MCTMx->CNTCFR &= ~CNTCFR_UGDIS;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable hall sensor interface of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_HallInterfaceCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Set the CH0SRC Bit                                                                                   */
    MCTMx->CH0ICFR |= CH0ICFR_CH0SRC;
  }
  else
  {
    /* Reset the CH0SRC Bit                                                                                 */
    MCTMx->CH0ICFR &= ~CH0ICFR_CH0SRC;
  }
}

/*********************************************************************************************************//**
 * @brief Select single pulse mode of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_SinglePulseModeCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    MCTMx->MDCFR |= MDCFR_SPMSET;
  }
  else
  {
    MCTMx->MDCFR &= ~MDCFR_SPMSET;
  }
}

/*********************************************************************************************************//**
 * @brief Select master trigger output source of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Sel: Specify the master trigger output source.
 *        This parameter can be as follow:
 *        @arg MCTM_MMSEL_RESET   : Send trigger signal when S/W setting UEV1G or slave restart
 *        @arg MCTM_MMSEL_ENABLE  : The counter enable signal is used as trigger output.
 *        @arg MCTM_MMSEL_UPDATE  : The update event 1 is used as trigger output.
 *        @arg MCTM_MMSEL_CH0CC   : Channel 0 capture or compare match occurred as trigger output.
 *        @arg MCTM_MMSEL_CH0OREF : The CH0OREF signal is used as trigger output.
 *        @arg MCTM_MMSEL_CH1OREF : The CH1OREF signal is used as trigger output.
 *        @arg MCTM_MMSEL_CH2OREF : The CH2OREF signal is used as trigger output.
 *        @arg MCTM_MMSEL_CH3OREF : The CH3OREF signal is used as trigger output.
 * @retval None
 ************************************************************************************************************/
void MCTM_MMSELConfig(HT_MCTM_TypeDef* MCTMx, MCTM_MMSEL_Enum Sel)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_MMSEL(Sel));

  /* Select the MTO source                                                                                  */
  MCTMx->MDCFR = (MCTMx->MDCFR & MDCFR_MMSEL_MASK) | Sel;
}

/*********************************************************************************************************//**
 * @brief Select slave mode of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Sel: Specify the timer slave mode.
 *        This parameter can be one of the following values:
 *        @arg MCTM_SMSEL_RESTART : Slave restart counter mode.
 *        @arg MCTM_SMSEL_PAUSE   : Slave pause counter mode.
 *        @arg MCTM_SMSEL_TRIGGER : Slave trigger counter start mode.
 *        @arg MCTM_SMSEL_STIED   : Used rising edge of STI as prescaler clock source.
 * @retval None
 ************************************************************************************************************/
void MCTM_SlaveModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_SMSEL_Enum Sel)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_SLAVE_MODE(Sel));

  /* Select the slave mode                                                                                  */
  MCTMx->MDCFR = (MCTMx->MDCFR & MDCFR_SMSEL_MASK) | Sel;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the master & slave MCTMx synchronous function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_TimSyncCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Set the TSE Bit                                                                                      */
    MCTMx->MDCFR |= MDCFR_TSE;
  }
  else
  {
    /* Reset the TSE Bit                                                                                    */
    MCTMx->MDCFR &= ~MDCFR_TSE;
  }
}

/*********************************************************************************************************//**
 * @brief Set counter register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Counter: Specify the counter register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCounter(HT_MCTM_TypeDef* MCTMx, u16 Counter)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the Counter Register value                                                                         */
  MCTMx->CNTR = Counter;
}

/*********************************************************************************************************//**
 * @brief Set counter reload register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Reload: Specify the counter reload register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCounterReload(HT_MCTM_TypeDef* MCTMx, u16 Reload)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the counter reload register value                                                                  */
  MCTMx->CRR = Reload;
}

/*********************************************************************************************************//**
 * @brief Set channel 0 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH0CCR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCaptureCompare0(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH0CCR register new value                                                                      */
  MCTMx->CH0CCR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 1 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH1CCR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCaptureCompare1(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH1CCR register new value                                                                      */
  MCTMx->CH1CCR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 2 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH2CCR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCaptureCompare2(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH2CCR register new value                                                                      */
  MCTMx->CH2CCR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 3 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH3CCR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetCaptureCompare3(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH3CCR register new value                                                                      */
  MCTMx->CH3CCR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 0 asymmetric compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH0ACR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetAsymmetricCompare0(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH0ACR register new value                                                                      */
  MCTMx->CH0ACR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 1 asymmetric compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH1ACCR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetAsymmetricCompare1(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH1ACR register new value                                                                      */
  MCTMx->CH1ACR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 2 asymmetric compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH2ACR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetAsymmetricCompare2(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH2ACR register new value                                                                      */
  MCTMx->CH2ACR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Set channel 3 asymmetric compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Cmp: Specify the CH3ACR register new value.
 * @retval None
 ************************************************************************************************************/
void MCTM_SetAsymmetricCompare3(HT_MCTM_TypeDef* MCTMx, u16 Cmp)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Set the CH3ACR register new value                                                                      */
  MCTMx->CH3ACR = Cmp;
}

/*********************************************************************************************************//**
 * @brief Configure input capture prescaler.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Channel: Specify the MCTM channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Psc: Specify the input capture prescaler new value.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHPSC_OFF : No prescaler
 *        @arg MCTM_CHPSC_2   : Capture is done once every 2 events
 *        @arg MCTM_CHPSC_4   : Capture is done once every 4 events
 *        @arg MCTM_CHPSC_8   : Capture is done once every 8 events
 * @retval None
 ************************************************************************************************************/
void MCTM_CHPSCConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHPSC_Enum Psc)
{
  vu32 *pIcfr = (vu32*)&MCTMx->CH0ICFR + Channel;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CH(Channel));
  Assert_Param(IS_MCTM_CHPSC(Psc));

  /* Reset the CHxPSC bits                                                                                  */
  *pIcfr &= CHICFR_CHPSC_MASK;

  /* Set the capture input prescaler value                                                                  */
  *pIcfr |= Psc;
}

/*********************************************************************************************************//**
 * @brief Set clock division value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Div: Specify the clock division value.
 *        This parameter can be one of the following value:
 *        @arg MCTM_CKDIV_OFF : fDTS = fCLKIN
 *        @arg MCTM_CKDIV_2   : fDTS = fCLKIN / 2
 *        @arg MCTM_CKDIV_4   : fDTS = fCLKIN / 4
 * @retval None
 ************************************************************************************************************/
void MCTM_CKDIVConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CKDIV_Enum Div)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CKDIV(Div));

  /* Reset the CKDIV Bits                                                                                   */
  MCTMx->CNTCFR &= CNTCFR_CKDIV_MASK;

  /* Set the CKDIV value                                                                                    */
  MCTMx->CNTCFR |= Div;
}

/*********************************************************************************************************//**
 * @brief Get channel 0 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of CH0CCR register
 ************************************************************************************************************/
u32 MCTM_GetCaptureCompare0(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the CH0CCR register value                                                                          */
  return MCTMx->CH0CCR;
}

/*********************************************************************************************************//**
 * @brief Get channel 1 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of CH1CCR register
 ************************************************************************************************************/
u32 MCTM_GetCaptureCompare1(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the CH1CCR register value                                                                          */
  return MCTMx->CH1CCR;
}

/*********************************************************************************************************//**
 * @brief Get channel 2 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of CH2CCR register
 ************************************************************************************************************/
u32 MCTM_GetCaptureCompare2(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the CH2CCR register value                                                                          */
  return MCTMx->CH2CCR;
}

/*********************************************************************************************************//**
 * @brief Get channel 3 capture/compare register value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of CH3CCR register
 ************************************************************************************************************/
u32 MCTM_GetCaptureCompare3(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the CH3CCR register value                                                                          */
  return MCTMx->CH3CCR;
}

/*********************************************************************************************************//**
 * @brief Get counter value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of Counter register
 ************************************************************************************************************/
u32 MCTM_GetCounter(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the Counter Register value                                                                         */
  return MCTMx->CNTR;
}

/*********************************************************************************************************//**
 * @brief Get prescaler value of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @return Value of Prescaler register
 ************************************************************************************************************/
u32 MCTM_GetPrescaler(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Get the Prescaler Register value                                                                       */
  return MCTMx->PSCR;
}

/*********************************************************************************************************//**
 * @brief Generate MCTMx events.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_EVENT: Stores the event source.
 *        This parameter can be any combination of following:
 *        @arg MCTM_EVENT_CH0CC     : Timer Capture/compare 0 event
 *        @arg MCTM_EVENT_CH1CC     : Timer Capture/compare 1 event
 *        @arg MCTM_EVENT_CH2CC     : Timer Capture/compare 2 event
 *        @arg MCTM_EVENT_CH3CC     : Timer Capture/compare 3 event
 *        @arg MCTM_EVENT_UEV1      : Timer update event 1
 *        @arg MCTM_EVENT_UEV2      : Timer update event 2
 *        @arg MCTM_EVENT_TEV       : Timer trigger event
 *        @arg MCTM_EVENT_BRKEV     : Timer break event
 * @retval None
 ************************************************************************************************************/
void MCTM_GenerateEvent(HT_MCTM_TypeDef* MCTMx, u32 MCTM_EVENT)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_EVENT(MCTM_EVENT));

  /* Set the event sources                                                                                  */
  MCTMx->EVGR = MCTM_EVENT;
}

/*********************************************************************************************************//**
 * @brief Check whether the specified MCTMx flag has been set.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_FLAG: Specify the flag to be checked.
 *        This parameter can be one of the following values:
 *        @arg MCTM_FLAG_CH0CC    : MCTM Capture/compare 0 flag
 *        @arg MCTM_FLAG_CH1CC    : MCTM Capture/compare 1 flag
 *        @arg MCTM_FLAG_CH2CC    : MCTM Capture/compare 2 flag
 *        @arg MCTM_FLAG_CH3CC    : MCTM Capture/compare 3 flag
 *        @arg MCTM_FLAG_CH0OC    : MCTM channel 0 overcapture flag
 *        @arg MCTM_FLAG_CH1OC    : MCTM channel 1 overcapture flag
 *        @arg MCTM_FLAG_CH2OC    : MCTM channel 2 overcapture flag
 *        @arg MCTM_FLAG_CH3OC    : MCTM channel 3 overcapture flag
 *        @arg MCTM_FLAG_UEV1     : MCTM update 1 flag
 *        @arg MCTM_FLAG_UEV2     : MCTM update 2 flag
 *        @arg MCTM_FLAG_TEV      : MCTM trigger flag
 *        @arg MCTM_FLAG_BRK0     : MCTM break 0 flag
 *        @arg MCTM_FLAG_BRK1     : MCTM break 1 flag
 * @return The new state of MCTM_FLAG (SET or RESET).
 ************************************************************************************************************/
FlagStatus MCTM_GetFlagStatus(HT_MCTM_TypeDef* MCTMx, u32 MCTM_FLAG)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_FLAG(MCTM_FLAG));

  if ((MCTMx->INTSR & MCTM_FLAG) != 0)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear flags of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_FLAG: Specify the flag to be cleared.
 *        This parameter can be any combination of the following values:
 *        @arg MCTM_FLAG_CH0CC    : MCTM Capture/compare 0 flag
 *        @arg MCTM_FLAG_CH1CC    : MCTM Capture/compare 1 flag
 *        @arg MCTM_FLAG_CH2CC    : MCTM Capture/compare 2 flag
 *        @arg MCTM_FLAG_CH3CC    : MCTM Capture/compare 3 flag
 *        @arg MCTM_FLAG_CH0OC    : MCTM channel 0 overcapture flag
 *        @arg MCTM_FLAG_CH1OC    : MCTM channel 1 overcapture flag
 *        @arg MCTM_FLAG_CH2OC    : MCTM channel 2 overcapture flag
 *        @arg MCTM_FLAG_CH3OC    : MCTM channel 3 overcapture flag
 *        @arg MCTM_FLAG_UEV1     : MCTM update 1 flag
 *        @arg MCTM_FLAG_UEV2     : MCTM update 2 flag
 *        @arg MCTM_FLAG_TEV      : MCTM trigger flag
 *        @arg MCTM_FLAG_BRK0     : MCTM break 0 flag
 *        @arg MCTM_FLAG_BRK1     : MCTM break 1 flag
 * @retval None
 ************************************************************************************************************/
void MCTM_ClearFlag(HT_MCTM_TypeDef* MCTMx, u32 MCTM_FLAG)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_FLAG_CLR(MCTM_FLAG));

  /* Clear the flags                                                                                        */
  MCTMx->INTSR = ~MCTM_FLAG;

  /*--------------------------------------------------------------------------------------------------------*/
  /* DSB instruction is added in this function to ensure the write operation which is for clearing interrupt*/
  /* flag is actually completed before exiting ISR. It prevents the NVIC from detecting the interrupt again */
  /* since the write register operation may be pended in the internal write buffer of Cortex-M3 when program*/
  /* has exited interrupt routine. This DSB instruction may be masked if this function is called in the     */
  /* beginning of ISR and there are still some instructions before exiting ISR.                             */
  /*--------------------------------------------------------------------------------------------------------*/
  __DSB();
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified interrupts of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_INT: Specify the MCTM interrupts sources to be enabled or disabled.
 *        This parameter can be any combination of the following values:
 *        @arg MCTM_INT_CH0CC     : MCTM Capture/compare 0 interrupt
 *        @arg MCTM_INT_CH1CC     : MCTM Capture/compare 1 interrupt
 *        @arg MCTM_INT_CH2CC     : MCTM Capture/compare 2 interrupt
 *        @arg MCTM_INT_CH3CC     : MCTM Capture/compare 3 interrupt
 *        @arg MCTM_INT_UEV1      : MCTM update 1 interrupt
 *        @arg MCTM_INT_UEV2      : MCTM update 2 interrupt
 *        @arg MCTM_INT_TEV       : MCTM trigger interrupt
 *        @arg MCTM_INT_BRKEV     : MCTM break interrupt
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_IntConfig(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_INT(MCTM_INT));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the interrupt sources                                                                         */
    MCTMx->DICTR |= MCTM_INT;
  }
  else
  {
    /* Disable the interrupt sources                                                                        */
    MCTMx->DICTR &= ~MCTM_INT;
  }
}

/*********************************************************************************************************//**
 * @brief Check whether the MCTMx interrupt has occurred.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_INT: Specify the MCTM interrupt source to be checked.
 *        This parameter can be one of the following values:
 *        @arg MCTM_INT_CH0CC     : MCTM Capture/compare 0 interrupt
 *        @arg MCTM_INT_CH1CC     : MCTM Capture/compare 1 interrupt
 *        @arg MCTM_INT_CH2CC     : MCTM Capture/compare 2 interrupt
 *        @arg MCTM_INT_CH3CC     : MCTM Capture/compare 3 interrupt
 *        @arg MCTM_INT_UEV1      : MCTM update 1 interrupt
 *        @arg MCTM_INT_UEV2      : MCTM update 2 interrupt
 *        @arg MCTM_INT_TEV       : MCTM trigger interrupt
 *        @arg MCTM_INT_BRKEV     : MCTM break interrupt
 * @return The new state of the MCTM_INT(SET or RESET)
 ************************************************************************************************************/
FlagStatus MCTM_GetIntStatus(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT)
{
  u32 itstatus, itenable;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_GET_INT(MCTM_INT));

  itstatus = MCTMx->INTSR & MCTM_INT;
  itenable = MCTMx->DICTR & MCTM_INT;

  if ((itstatus != 0) && (itenable != 0))
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear interrupt pending bits of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_INT: Specify the MCTM interrupt to be cleared.
 *        This parameter can be any combination of the following values:
 *        @arg MCTM_INT_CH0CC     : MCTM Capture/compare 0 interrupt
 *        @arg MCTM_INT_CH1CC     : MCTM Capture/compare 1 interrupt
 *        @arg MCTM_INT_CH2CC     : MCTM Capture/compare 2 interrupt
 *        @arg MCTM_INT_CH3CC     : MCTM Capture/compare 3 interrupt
 *        @arg MCTM_INT_UEV1      : MCTM update 1 interrupt
 *        @arg MCTM_INT_UEV2      : MCTM update 2 interrupt
 *        @arg MCTM_INT_TEV       : MCTM trigger interrupt
 *        @arg MCTM_INT_BRKEV     : MCTM break interrupt
 * @retval None
 ************************************************************************************************************/
void MCTM_ClearIntPendingBit(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_INT(MCTM_INT));

  /* Clear the interrupt pending Bit                                                                        */
  MCTMx->INTSR = ~MCTM_INT;

  /*--------------------------------------------------------------------------------------------------------*/
  /* DSB instruction is added in this function to ensure the write operation which is for clearing interrupt*/
  /* flag is actually completed before exiting ISR. It prevents the NVIC from detecting the interrupt again */
  /* since the write register operation may be pended in the internal write buffer of Cortex-M3 when program*/
  /* has exited interrupt routine. This DSB instruction may be masked if this function is called in the     */
  /* beginning of ISR and there are still some instructions before exiting ISR.                             */
  /*--------------------------------------------------------------------------------------------------------*/
  __DSB();
}

/*********************************************************************************************************//**
 * @brief Disable slave mode to clock the prescaler directly with the internal clock.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @retval None
 ************************************************************************************************************/
void MCTM_InternalClockConfig(HT_MCTM_TypeDef* MCTMx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));

  /* Disable slave mode to clock the prescaler directly with the internal clock                             */
  MCTMx->MDCFR &= MDCFR_SMSEL_MASK;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the channels main output of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_CHMOECmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the MCTM Main Output                                                                          */
    MCTMx->CHBRKCTR |= CHBRKCTR_CHMOE;
  }
  else
  {
    /* Disable the MCTM Main Output                                                                         */
    MCTMx->CHBRKCTR &= ~CHBRKCTR_CHMOE;
  }
}

/*********************************************************************************************************//**
 * @brief Configure the break feature, dead time, Lock level, the OSSI, the OSSR State
 *        and the CHAOE(automatic output enable).
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param CHBRKCTRInit: Point to a MCTM_CHBRKCTRInitTypeDef structure that contains
 *        the CHBRKCTR Register configuration information for the MCTM peripheral.
 * @retval None
 ************************************************************************************************************/
void MCTM_CHBRKCTRConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CHBRKCTRInitTypeDef *CHBRKCTRInit)
{
  u32 wTmpReg;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_OSSR_STATE(CHBRKCTRInit->OSSRState));
  Assert_Param(IS_MCTM_OSSI_STATE(CHBRKCTRInit->OSSIState));
  Assert_Param(IS_MCTM_LOCK_LEVEL(CHBRKCTRInit->LockLevel));
  Assert_Param(IS_MCTM_BREAK_STATE(CHBRKCTRInit->Break0));
  Assert_Param(IS_MCTM_BREAK_POLARITY(CHBRKCTRInit->Break0Polarity));
  Assert_Param(IS_MCTM_BREAK_STATE(CHBRKCTRInit->Break1));
  Assert_Param(IS_MCTM_BREAK_POLARITY(CHBRKCTRInit->Break1Polarity));
  Assert_Param(IS_MCTM_CHAOE_STATE(CHBRKCTRInit->AutomaticOutput));
  Assert_Param(IS_MCTM_FILTER(CHBRKCTRInit->BreakFilter));

  wTmpReg = (u32)CHBRKCTRInit->BreakFilter << 8;
  wTmpReg |= (u32)CHBRKCTRInit->DeadTime << 24;
  wTmpReg |= CHBRKCTRInit->LockLevel | CHBRKCTRInit->OSSRState | CHBRKCTRInit->OSSIState;
  wTmpReg |= CHBRKCTRInit->Break0 | CHBRKCTRInit->Break0Polarity | CHBRKCTRInit->AutomaticOutput;
  wTmpReg |= (CHBRKCTRInit->Break1 << 2) | (CHBRKCTRInit->Break1Polarity << 2);

  MCTMx->CHBRKCTR = wTmpReg;
}

/*********************************************************************************************************//**
 * @brief Fill each CHBRKCTRInitStruct member with its default value.
 * @param CHBRKCTRInitStruct: Point to a \ref MCTM_CHBRKCTRInitTypeDef structure.
 * @retval None
 ************************************************************************************************************/
void MCTM_CHBRKCTRStructInit(MCTM_CHBRKCTRInitTypeDef* CHBRKCTRInitStruct)
{
  /* Set the default configuration                                                                          */
  CHBRKCTRInitStruct->OSSRState = MCTM_OSSR_STATE_DISABLE;
  CHBRKCTRInitStruct->OSSIState = MCTM_OSSI_STATE_DISABLE;
  CHBRKCTRInitStruct->LockLevel = MCTM_LOCK_LEVEL_OFF;
  CHBRKCTRInitStruct->DeadTime = 0x00;
  CHBRKCTRInitStruct->Break0 = MCTM_BREAK_DISABLE;
  CHBRKCTRInitStruct->Break0Polarity = MCTM_BREAK_POLARITY_LOW;
  CHBRKCTRInitStruct->Break1 = MCTM_BREAK_DISABLE;
  CHBRKCTRInitStruct->Break1Polarity = MCTM_BREAK_POLARITY_LOW;
  CHBRKCTRInitStruct->BreakFilter = 0;
  CHBRKCTRInitStruct->AutomaticOutput = MCTM_CHAOE_DISABLE;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable MCTMx COMPRE function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_COMPRECmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the MCTM COMPRE                                                                               */
    MCTMx->CTR |= CTR_COMPRE;
  }
  else
  {
    /* Disable the MCTM COMPRE                                                                              */
    MCTMx->CTR &= ~CTR_COMPRE;
  }
}

/*********************************************************************************************************//**
 * @brief Configure the MCTMx COMUS function.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Sel: Specify the COMUS value.
 *        This parameter can be one of the following value:
 *        @arg MCTM_COMUS_STIOFF : MCTM capture/compare control bits are updated by
 *             setting the UEV2G bit only
 *        @arg MCTM_COMUS_STION  : MCTM capture/compare control bits are updated by both
 *             setting the UEV2G bit or when a rising edge occurs on STI
 * @retval None
 ************************************************************************************************************/
void MCTM_COMUSConfig(HT_MCTM_TypeDef* MCTMx, MCTM_COMUS_Enum Sel)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_COMUS(Sel));

  if (Sel != MCTM_COMUS_STIOFF)
  {
    /* Set the MCTM COMUS bit                                                                               */
    MCTMx->CTR |= CTR_COMUS;
  }
  else
  {
    /* Clear the MCTM COMUS bit                                                                             */
    MCTMx->CTR &= ~CTR_COMUS;
  }
}

/*********************************************************************************************************//**
 * @brief Select Channel Capture/Compare PDMA event of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Selection: This parameter can be MCTM_CHCCDS_CHCCEV or MCTM_CHCCDS_UEV1.
 * @retval None
 ************************************************************************************************************/
void MCTM_CHCCDSConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CHCCDS_Enum Selection)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_CHCCDS(Selection));

  if (Selection != MCTM_CHCCDS_CHCCEV)
  {
    MCTMx->CTR |= CTR_CHCCDS;
  }
  else
  {
    MCTMx->CTR &= ~CTR_CHCCDS;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified PDMA requests of the MCTMx.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param MCTM_PDMA: Specify the MCTM PDMA requests to be enabled or disabled.
 *        This parameter can be any combination of the following values:
 *        @arg MCTM_PDMA_CH0CC     : MCTM Capture/compare 0 PDMA request
 *        @arg MCTM_PDMA_CH1CC     : MCTM Capture/compare 1 PDMA request
 *        @arg MCTM_PDMA_CH2CC     : MCTM Capture/compare 2 PDMA request
 *        @arg MCTM_PDMA_CH3CC     : MCTM Capture/compare 3 PDMA request
 *        @arg MCTM_PDMA_UEV1      : MCTM update 1 PDMA request
 *        @arg MCTM_PDMA_UEV2      : MCTM update 2 PDMA request
 *        @arg MCTM_PDMA_TEV       : MCTM trigger PDMA request
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MCTM_PDMAConfig(HT_MCTM_TypeDef* MCTMx, u32 MCTM_PDMA, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MCTM(MCTMx));
  Assert_Param(IS_MCTM_PDMA(MCTM_PDMA));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the PDMA request                                                                              */
    MCTMx->DICTR |= MCTM_PDMA;
  }
  else
  {
    /* Disable the PDMA request                                                                             */
    MCTMx->DICTR &= ~MCTM_PDMA;
  }
}
/**
  * @}
  */

/* Private functions ---------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Private_Functions MCTM private functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Configure the CHx as input.
 * @param MCTMx: where MCTMx is the selected MCTM from the MCTM peripheral.
 * @param Ch: Specify the MCTM Channel.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CH_0 : MCTM channel 0
 *        @arg MCTM_CH_1 : MCTM channel 1
 *        @arg MCTM_CH_2 : MCTM channel 2
 *        @arg MCTM_CH_3 : MCTM channel 3
 * @param Pol: The input polarity.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHP_NONINVERTED : Active high level or rising edge
 *        @arg MCTM_CHP_INVERTED    : Active low level or falling edge
 * @param Sel: Specify the input to be used.
 *        This parameter can be one of the following values:
 *        @arg MCTM_CHCCS_DIRECT   : MCTM CHxI is mapped on CHx.
 *        @arg MCTM_CHCCS_INDIRECT : MCTM CH1I is mapped on CH0 (or CH0I->CH1 or CH2I->CH3 or CH3I->CH2).
 *        @arg MCTM_CHCCS_TRCED    : MCTM CHx is mapped on TRC.
 * @param Filter: Specify the input capture filter.
 *        This parameter must be a value between 0x00 and 0x0F.
 * @retval None
 ************************************************************************************************************/
static void
mctm_CHx_Config(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Ch, MCTM_CHP_Enum Pol, MCTM_CHCCS_Enum Sel, u8 Filter)
{
  vu32* pIcfr = (vu32*)&MCTMx->CH0ICFR + Ch;
  u32 wIcfr, wChpolr;

  /* Disable the channel N: reset the CHxE bit                                                              */
  MCTMx->CHCTR &= ~((u32)0x1 << (Ch << 1));

  wIcfr = *pIcfr;
  wChpolr = MCTMx->CHPOLR;

  /* Select the input and set the filter                                                                    */
  wIcfr &= CHICFR_CHCCS_MASK & CHICFR_CHF_MASK;
  wIcfr |= Sel | Filter;
  *pIcfr = wIcfr;

  /* Select the polarity bit                                                                                */
  wChpolr &= ~((u32)0x1 << (Ch << 1));
  wChpolr |= (u32)Pol << (Ch << 1);
  MCTMx->CHPOLR = wChpolr;

  /* Set the CHxE Bit                                                                                       */
  MCTMx->CHCTR |= (u32)0x1 << (Ch << 1);
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
