/*********************************************************************************************************//**
 * @file    TM/TriggerCounter/main.c
 * @version $Rev:: 1560         $
 * @date    $Date:: 2019-03-13 #$
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup GPTM_Examples GPTM
  * @{
  */

/** @addtogroup TriggerCounter
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void TM_Configuration(void);
void TM_MainRoutine(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  RETARGET_Configuration();           /* Retarget Related configuration                                     */
  CKCU_Configuration();
  TM_Configuration();

  while (1)
  {
    TM_MainRoutine();
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.AFIO     = 1;
  CKCUClock.Bit.GPTM0    = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure the Timer.
  * @retval None
  ***********************************************************************************************************/
void TM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_CaptureInitTypeDef  CapInit;

  /* Time base configuration                                                                                */
  TM_TimeBaseStructInit(&TimeBaseInit);
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 65535;
  TimeBaseInit.Prescaler = 0;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  AFIO_GPxConfig(HTCFG_TM_CH0_GPIO_ID, HTCFG_TM_CH0_AFIO_PIN, AFIO_FUN_MCTM_GPTM);

  CapInit.Channel = TM_CH_0;
  CapInit.Polarity = TM_CHP_NONINVERTED;
  CapInit.Selection = TM_CHCCS_DIRECT;
  CapInit.Prescaler = TM_CHPSC_OFF;
  CapInit.Filter = 0x0;
  TM_CaptureInit(HT_GPTM0, &CapInit);

  /* Slave Trigger Input selection                                                                          */
  TM_StiConfig(HT_GPTM0, TM_TRSEL_TI0S0);

  /* Slave Mode selection: Trigger Mode                                                                     */
  TM_SlaveModeConfig(HT_GPTM0, TM_SMSEL_STIED);

  TM_Cmd(HT_GPTM0, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Timer Main Routine.
  * @retval None
  ***********************************************************************************************************/
void TM_MainRoutine(void)
{
  //if (TM_GetFlagStatus(HT_GPTM0, TM_INT_CH0CC | TM_INT_TEV))
  if (TM_GetFlagStatus(HT_GPTM0, TM_INT_TEV))
  {
    TM_ClearFlag(HT_GPTM0, TM_INT_TEV);
    printf("Capture! Counter = %05d\r\n", TM_GetCounter(HT_GPTM0));
  }
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
