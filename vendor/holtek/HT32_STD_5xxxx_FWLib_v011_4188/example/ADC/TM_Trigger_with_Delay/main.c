/*********************************************************************************************************//**
 * @file    ADC/TM_Trigger_with_Delay/main.c
 * @version $Rev:: 1209         $
 * @date    $Date:: 2016-10-17 #$
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

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup TM_Trigger_with_Delay

  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void ADC_Configuration(void);
void TM_Configuration(void);
void MainRoutine(void);

/* Global variables ----------------------------------------------------------------------------------------*/
u32 gADC_Result[3];
vu32 gADC_CycleEndOfConversion;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Enable GPTM which will trigger ADC start of conversion every 1 second                                  */
  ADC_Configuration();
  TM_Configuration();

  TM_SetCaptureCompare3(HT_GPTM0, 20000 - 1 + 20); // CH3O ADC trigger delay 20 GPTM clock after CH2
  TM_Cmd(HT_GPTM0, ENABLE);

  while (1)
  {
    MainRoutine();
  }
}

/*********************************************************************************************************//**
  * @brief  ADC Configuration.
  * @retval None
  ***********************************************************************************************************/
void ADC_Configuration(void)
{
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
    CKCUClock.Bit.AFIO       = 1;
    CKCUClock.Bit.ADC        = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Configure specify IO's AFIO mode as ADC function                                                       */
  AFIO_GPxConfig(HTCFG_AD0_GPIO_ID, HTCFG_AD0_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_AD1_GPIO_ID, HTCFG_AD1_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_AD2_GPIO_ID, HTCFG_AD2_AFIO_PIN, AFIO_FUN_ADC);

  /* ADCLK frequency is set to CK_AHB / 64                                                                  */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* One Shot Mode, Conversion/Sequence Length 3, SubLength 0                                               */
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, 3, 0);

  /* Set sampling time as 1.5 + 36 ADCCLK, Conversion = 12.5 + 1.5 + 36 = 50 ADCCLK                         */
  ADC_SamplingTimeConfig(HT_ADC, 36);

  /* Set ADC Channel of Sequence                                                                            */
  ADC_RegularChannelConfig(HT_ADC, HTCFG_AD0_ADC_CH, 0);
  ADC_RegularChannelConfig(HT_ADC, HTCFG_AD1_ADC_CH, 1);
  ADC_RegularChannelConfig(HT_ADC, HTCFG_AD2_ADC_CH, 2);

  /* Enable ADC single/cycle end of conversion interrupt                                                    */
  ADC_IntConfig(HT_ADC, ADC_INT_SINGLE_EOC | ADC_INT_CYCLE_EOC, ENABLE);

  /* Enable the ADC Interrupts                                                                              */
  NVIC_EnableIRQ(ADC_IRQn);

  /* Use GPTM0 CH3O as ADC trigger source                                                                   */
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_GPTM0_CH3O);

  ADC_Cmd(HT_ADC, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Timer Configuration.
  * @retval None
  ***********************************************************************************************************/
void TM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;

  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
    CKCUClock.Bit.GPTM0      = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  AFIO_GPxConfig(HTCFG_PWM_GPIO_ID, HTCFG_PWM_AFIO_PIN, AFIO_FUN_MCTM_GPTM);

  /* Configure GPTM0 Channel 3 as PWM output mode used to trigger ADC start of conversion every 1 second    */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 40000 - 1;
  TimeBaseInit.Prescaler = (SystemCoreClock / 40000) - 1; // GPTM Clock is 40K
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  OutInit.Channel = HTCFG_PWM_TM_CH;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = 20000 - 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  OutInit.Channel = TM_CH_3;
  TM_OutputInit(HT_GPTM0, &OutInit);

  TM_IntConfig(HT_GPTM0, TM_INT_CH3CC, ENABLE);
  NVIC_EnableIRQ(GPTM0_IRQn);
}
/*********************************************************************************************************//**
  * @brief  Main Routine.
  * @retval None
  ***********************************************************************************************************/
void MainRoutine(void)
{
  if (gADC_CycleEndOfConversion)
  {
    /* Output gADC_Result if needed.                                                                        */
    printf("ADC Result Seq0:%4u Seq1:%4u Seq2:%4u\r\n", gADC_Result[0], gADC_Result[1], gADC_Result[2]);
    gADC_CycleEndOfConversion = FALSE;
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
