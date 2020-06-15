/*********************************************************************************************************//**
 * @file    ADC/InternalReferenceVoltage/main.c
 * @version $Rev:: 3492         $
 * @date    $Date:: 2019-03-12 #$
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

/** @addtogroup InternalReferenceVoltage

  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void ADC_Configuration(void);
void TM_Configuration(void);

/* Global variables ----------------------------------------------------------------------------------------*/
u32 gADC_Result[3];
volatile bool gADC_CycleEndOfConversion;
u32 ReferenceVoltage = 1215;    //Internal VREF Generator Output Voltage = 1215 mV
//u32 ReferenceVoltage = 2000;    //Internal VREF Generator Output Voltage = 2000 mV
//u32 ReferenceVoltage = 2500;    //Internal VREF Generator Output Voltage = 2500 mV
//u32 ReferenceVoltage = 2700;    //Internal VREF Generator Output Voltage = 2700 mV

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* RETARGET Related configuration                                                                         */
  RETARGET_Configuration();

  /* Enable peripheral clocks of ADC, GMTM0                                                                 */
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCUClock.Bit.ADC        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  ADC_Configuration();
  TM_Configuration();

  ADC_MVDDACmd(HT_ADC, ENABLE);  // Enable MVDDA as Measure VDD Reference
  ADC_VREFCmd(HT_ADC, ENABLE);   // Enable Internal VREF Generator Output Level

  /* Enable GPTM which will trigger ADC start of conversion every 1 second                                  */
  ADC_Cmd(HT_ADC, ENABLE);
  TM_Cmd(HT_GPTM0, ENABLE);

  while (1)
  {
    if (gADC_CycleEndOfConversion)
    {
      /* Output Internal Reference Voltage & Calibration as ADC calculation                                 */
      printf("VREF=   %4dmV  Value= %4d\n\r", ReferenceVoltage, gADC_Result[1]);

      /* Output VDD, MVDD, Potentiometer conversion Voltage & Calibration Result                            */
      printf("VDDA=   %4dmV  \n\r", ReferenceVoltage * 4095/gADC_Result[1]);
      printf("MVDDA=  %4dmV  Value= %4d\n\r", ReferenceVoltage * gADC_Result[0]/gADC_Result[1], gADC_Result[0]);
      printf("VR=     %4dmV  Value= %4d\n\n\r", gADC_Result[2] * ReferenceVoltage/gADC_Result[1], gADC_Result[2]);
      gADC_CycleEndOfConversion = FALSE;
    }
  }
}

/*********************************************************************************************************//**
  * @brief  ADC Configuration.
  * @retval None
  ***********************************************************************************************************/
void ADC_Configuration(void)
{
  /* Configure specify IO's AFIO mode as ADC, VREF function                                                 */
  AFIO_GPxConfig(HTCFG_VREF_GPIO_ID, HTCFG_VREF_AFIO_PIN, AFIO_FUN_SYSTEM);
  AFIO_GPxConfig(HTCFG_VR_GPIO_ID, HTCFG_VR_AFIO_PIN, AFIO_FUN_ADC);

  /* ADCLK frequency is set to CK_AHB / 64                                                                  */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* Select the Voltage Reference Output level                                                              */
  ADC_VREFConfig(HT_ADC, ADC_VREF_1V215);
  //ADC_VREFConfig(HT_ADC, ADC_VREF_2V0);
  //ADC_VREFConfig(HT_ADC, ADC_VREF_2V5);
  //ADC_VREFConfig(HT_ADC, ADC_VREF_2V7);

  /* One Shot Mode, Conversion/Sequence Length 3, SubLength 0                                               */
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, 3, 0);

  /* Set sampling time as 1.5 + 36 ADCCLK, Conversion = 12.5 + 1.5 + 36 = 50 ADCCLK                         */
  ADC_SamplingTimeConfig(HT_ADC, 36);

  /* Set ADC Channel of Sequence                                                                            */
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_MVDDA, 0);
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_IVREF, 1);
  ADC_RegularChannelConfig(HT_ADC, HTCFG_VR_ADC_CH, 2);

  /* Enable ADC single/cycle end of conversion interrupt                                                    */
  ADC_IntConfig(HT_ADC, ADC_INT_SINGLE_EOC | ADC_INT_CYCLE_EOC, ENABLE);

  /* Enable the ADC Interrupts                                                                              */
  NVIC_EnableIRQ(ADC_IRQn);

  /* Use GPTM0 CH3O as ADC trigger source                                                                   */
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_GPTM0_CH3O);
}

/*********************************************************************************************************//**
  * @brief  Timer Configuration.
  * @retval None
  ***********************************************************************************************************/
void TM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;

  /* Configure GPTM0 Channel 3 as PWM output mode used to trigger ADC start of conversion every 1 second    */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 40000 - 1 ;
  TimeBaseInit.Prescaler = (SystemCoreClock / 40000) - 1; // GPTM Clock is 40K
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  OutInit.Channel = TM_CH_3;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = 20000 - 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  TM_IntConfig(HT_GPTM0, TM_INT_CH3CC, ENABLE);
  NVIC_EnableIRQ(GPTM0_IRQn);
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
