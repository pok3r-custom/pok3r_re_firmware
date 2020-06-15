/*********************************************************************************************************//**
 * @file    MCTM/ComplementaryOutput/main.c
 * @version $Rev:: 171          $
 * @date    $Date:: 2017-06-16 #$
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

/** @addtogroup ComplementaryOutput
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
TM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
TM_OutputInitTypeDef MCTM_OutputInitStructure;
MCTM_CHBRKCTRInitTypeDef MCTM_CHBRKCTRInitStructure;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */

  /* MCTM Time Base configuration                                                                           */
  MCTM_TimeBaseInitStructure.CounterReload = HTCFG_MCTM_COUNTER_RELOARD;
  MCTM_TimeBaseInitStructure.Prescaler = 0;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 0;
  MCTM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_MCTM1, &MCTM_TimeBaseInitStructure);

  /* MCTM Channel 0, 1, 2 output configuration                                                              */
  MCTM_OutputInitStructure.Channel = TM_CH_0;
  MCTM_OutputInitStructure.OutputMode = TM_OM_PWM1;
  MCTM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = (HTCFG_MCTM_COUNTER_RELOARD+1)*3/4;
  TM_OutputInit(HT_MCTM1, &MCTM_OutputInitStructure);


  MCTM_OutputInitStructure.Channel = TM_CH_1;
#if 0
  MCTM_OutputInitStructure.Control = MCTM_CHCTL_DISABLE;    //Buzzer off
#endif
  MCTM_OutputInitStructure.Compare = (HTCFG_MCTM_COUNTER_RELOARD+1)/2;
  TM_OutputInit(HT_MCTM1, &MCTM_OutputInitStructure);

  MCTM_OutputInitStructure.Channel = TM_CH_2;
#if 0
  MCTM_OutputInitStructure.Control = MCTM_CHCTL_ENABLE;
#endif
  MCTM_OutputInitStructure.Compare = (HTCFG_MCTM_COUNTER_RELOARD+1)/4;
  TM_OutputInit(HT_MCTM1, &MCTM_OutputInitStructure);

  /* MCTM Off State, lock, Break, Automatic Output enable, dead time configuration                          */
  MCTM_CHBRKCTRInitStructure.OSSRState = MCTM_OSSR_STATE_ENABLE;
  MCTM_CHBRKCTRInitStructure.OSSIState = MCTM_OSSI_STATE_ENABLE;
  MCTM_CHBRKCTRInitStructure.LockLevel = MCTM_LOCK_LEVEL_2;
  MCTM_CHBRKCTRInitStructure.Break0 = MCTM_BREAK_ENABLE;
  MCTM_CHBRKCTRInitStructure.Break0Polarity = MCTM_BREAK_POLARITY_LOW;
  MCTM_CHBRKCTRInitStructure.AutomaticOutput = MCTM_CHAOE_ENABLE;
  MCTM_CHBRKCTRInitStructure.DeadTime = 108;
  MCTM_CHBRKCTRInitStructure.BreakFilter = 0;
  MCTM_CHBRKCTRConfig(HT_MCTM1, &MCTM_CHBRKCTRInitStructure);

  /* MCTM counter enable                                                                                    */
  TM_Cmd(HT_MCTM1, ENABLE);

  /* MCTM Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HT_MCTM1, ENABLE);


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
  /* Configure MCTM Channel 0, 1, 2 output pin                                                              */
  AFIO_GPxConfig(HTCFG_MCTM_CH0_ID ,HTCFG_MCTM_CH0_PIN , AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CH0N_ID, HTCFG_MCTM_CH0N_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CH1_ID , HTCFG_MCTM_CH1_PIN , AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CH1N_ID, HTCFG_MCTM_CH1N_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CH2_ID , HTCFG_MCTM_CH2_PIN , AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CH2N_ID, HTCFG_MCTM_CH2N_PIN, AFIO_MODE_4);

  /* Configure MCTM Break pin                                                                               */
  AFIO_GPxConfig(HTCFG_MCTM_CBRK_ID, HTCFG_MCTM_CBRK_PIN, AFIO_MODE_4);
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
