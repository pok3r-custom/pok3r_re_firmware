/*********************************************************************************************************//**
 * @file    ADC/PDMA_ADCResult/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup PDMA_ADCResult
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
MCTM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
MCTM_OutputInitTypeDef MCTM_OutputInitStructure;
PDMACH_InitTypeDef PDMACH_InitStructure;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Enable peripherals clock of ADC, MCTM, PDMA.
  *  - Configure LEDn AFIO mode as MCTM function
  *  - Configure MCTM Channel n as PWM output mode used to represent potentiometer's level.
  *  - Configure MCTM MTO output update event used to trigger ADC.
  *  - Configure PDMA channel 0 to move ADC result from ADC->DR[0] to MCTM CHnCCR.
  *  - Set ADC Divider as 64, therefore ADCLK frequency as 72MHz /64 = 1.125MHz
  *  - Configure GPIO/AFIO mode as ADC function.
  *  - ADC configure as One Shot Mode, Length 1, SubLength 1
  *  - Configure ADC Rank 0 to convert ADC channel 15 with 1.5 sampling clock.
  *  - Configure MCTM MTO as ADC trigger source.
  *  - Configure ADC to issue ADC DMA request when cycle end of conversion occur
  *  - Enable MCTM which will trigger ADC start of conversion periodically
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  /* Enable peripherals clock of ADC, MCTM1, PDMA                                                           */
  CKCUClock.Bit.ADC   = 1;
  CKCUClock.Bit.MCTM1 = 1;
  CKCUClock.Bit.AFIO  = 1;
  CKCUClock.Bit.PDMA  = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure LED AFIO mode as MCTM function                                                               */
  AFIO_GPAConfig(AFIO_PIN_10, AFIO_MODE_4);

  /* Configure MCTM Channel n as PWM output mode used to represent potentiometer's level                    */
  /* MCTM Time Base configuration                                                                           */
  MCTM_TimeBaseInitStructure.CounterReload = 4095;
  MCTM_TimeBaseInitStructure.Prescaler = 100;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 0;
  MCTM_TimeBaseInitStructure.CounterMode = MCTM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = MCTM_PSC_RLD_IMMEDIATE;
  MCTM_TimeBaseInit(HT_MCTM1, &MCTM_TimeBaseInitStructure);

  /* MCTM Channel n output configuration                                                                    */
  MCTM_OutputInitStructure.Channel = MCTM_CH_1;
  MCTM_OutputInitStructure.OutputMode = MCTM_OM_PWM2;
  MCTM_OutputInitStructure.Control = MCTM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = MCTM_CHCTL_DISABLE;
  MCTM_OutputInitStructure.Polarity = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = 0;
  MCTM_OutputInit(HT_MCTM1, &MCTM_OutputInitStructure);

  /* MCTM the update event 1 is used as trigger output.                                                     */
  MCTM_MMSELConfig(HT_MCTM1, MCTM_MMSEL_UPDATE);

  /* Configure PDMA channel 0 to move ADC result from ADC->DR[0] to MCTM CHnCCR                             */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)&HT_ADC->DR[0];
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&HT_MCTM1->CH1CCR;
  PDMACH_InitStructure.PDMACH_BlkCnt = 1;
  PDMACH_InitStructure.PDMACH_BlkLen = 1;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_FIX | DST_ADR_FIX | AUTO_RELOAD;
  PDMA_Config(PDMA_CH0, &PDMACH_InitStructure);
  PDMA_EnaCmd(PDMA_CH0, ENABLE);

  /* ADCLK frequency is set to 72/64 MHz = 1.125MHz                                                         */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* Configure GPIO/AFIO mode as ADC function                                                               */
  AFIO_GPCConfig(AFIO_PIN_11, AFIO_MODE_2);

  /* One Shot Mode, Length 1, SubLength 1                                                                   */
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, 1, 1);

  /* ADC Channel n, Rank 0, Sampling clock is 1.5 ADCLK. Conversion time = 14.4uS                           */
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_15, 0, 0);

  /* Use MCTM1 MTO as ADC trigger source                                                                    */
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_MCTM1_MTO);

  /* Issue ADC DMA request when cycle end of conversion occur                                               */
  ADC_PDMAConfig(HT_ADC, ADC_PDMA_REGULAR_CYCLE, ENABLE);


  /* MCTM Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HT_MCTM1, ENABLE);

  /* Enable MCTM which will trigger ADC start of conversion periodically                                    */
  MCTM_Cmd(HT_MCTM1, ENABLE);

  while (1)
  {
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
