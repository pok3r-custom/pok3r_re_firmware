/*********************************************************************************************************//**
 * @file    MCTM/PWMOut_PDMA/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   Main program.
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup MCTM_Examples MCTM
  * @{
  */

/** @addtogroup PWMOut_PDMA
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void PDMA_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
TM_TimeBaseInitTypeDef TM_TimeBaseInitStructure;
TM_OutputInitTypeDef TM_OutputInitStructure;
PDMACH_InitTypeDef PDMACH_InitStructure;

u32 CCR_Buffer[3] = {(HTCFG_TM_COUNTER_RELOARD+1)*3/4, (HTCFG_TM_COUNTER_RELOARD+1)/2, (HTCFG_TM_COUNTER_RELOARD+1)/4};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */

  PDMA_Configuration();               /* PDMA Related configure                                             */

  /* MCTM Time Base configuration                                                                           */
  TM_TimeBaseInitStructure.CounterReload = HTCFG_TM_COUNTER_RELOARD;
  TM_TimeBaseInitStructure.Prescaler = 0;
  TM_TimeBaseInitStructure.RepetitionCounter = 2;
  TM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  TM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_MCTM1, &TM_TimeBaseInitStructure);

  /* MCTM Channel 0 output configuration                                                                    */
  TM_OutputInitStructure.Channel = HTCFG_TM_CH;
  TM_OutputInitStructure.OutputMode = TM_OM_PWM1;
  TM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  TM_OutputInitStructure.ControlN = TM_CHCTL_ENABLE;
  TM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  TM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  TM_OutputInitStructure.Compare = 256;
  TM_OutputInit(HT_MCTM1, &TM_OutputInitStructure);

  /* MCTM Update Event 1 PDMA request enable                                                                */
  TM_PDMAConfig(HT_MCTM1, TM_PDMA_UEV, ENABLE);

  /* MCTM Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HT_MCTM1, ENABLE);

  /* MCTM counter enable                                                                                    */
  TM_Cmd(HT_MCTM1, ENABLE);

  while (1);
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.MCTM1      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* Configure MCTM Channel output pin                                                                      */
  AFIO_GPxConfig(HTCFG_TM_CHX_ID,HTCFG_TM_CHX_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_TM_CHXN_ID,HTCFG_TM_CHXN_PIN, AFIO_MODE_4);
}

/*********************************************************************************************************//**
  * @brief  Configure the PDMA.
  * @retval None
  ***********************************************************************************************************/
void PDMA_Configuration(void)
{
  /* PDMA configuration                                                                                     */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)CCR_Buffer;
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&(HT_MCTM1->HTCFG_TM_CHXCCR);
  PDMACH_InitStructure.PDMACH_BlkCnt = 3;
  PDMACH_InitStructure.PDMACH_BlkLen = 1;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX | AUTO_RELOAD;
  PDMA_Config(PDMA_CH3, &PDMACH_InitStructure);

  /* Enable PDMA Channel 3                                                                                  */
  PDMA_EnaCmd(PDMA_CH3, ENABLE);
}

#if (HT32_LIB_DEBUG == 1)
/*********************************************************************************************************//**
  * @brief  Report both the error name of the source file and the source line number.
  * @param  filename: pointer to the source file name.
  * @param  uline: error line source number.
  * @retval None
  ***********************************************************************************************************/
void assert_error(u8* filename, u32 uline)
{
  /*
     This function is called by IP library that the invalid parameters has been passed to the library API.
     Debug message can be added here.
     Example: printf("Parameter Error: file %s on line %d\r\n", filename, uline);
  */

  while (1)
  {
  }
}
#endif


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
