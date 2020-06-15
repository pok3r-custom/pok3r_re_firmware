/*********************************************************************************************************//**
 * @file    ADC/AnalogWatchdog/main.c
 * @version $Rev:: 4032         $
 * @date    $Date:: 2019-07-12 #$
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

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup AnalogWatchdog
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void ADC_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Configure LED1 and LED2 used to output analog watchdog state.
  *  - Enable the NVIC ADC Interrupt
  *  - Enable peripherals clock of ADC, AFIO.
  *  - Set ADC Divider as 64, therefore ADCLK frequency as CK_AHB / 64
  *  - Configure AFIO mode as ADC function.
  *  - ADC configure as Continuous Mode, Conversion Length 1, SubLength 1
  *  - Configure ADC Rank 0 to convert ADC channel n with 1.5 sampling clock.
  *  - Configure Software Trigger as ADC trigger source
  *  - Enable ADC analog watchdog lower and upper threshold interrupt.
  *    The ADC ISR will on/off LED1 or LED2 depending on what interrupt occur.
  *  - Configure Analog Watchdog to monitor ADC channel n.
  *    The upper threshold 3000, lower threshold 1000.
  *  - Software trigger to start continuous mode
  *
  ***********************************************************************************************************/
int main(void)
{
  /* LED Related configuration                                                                              */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  ADC_Configuration();

  /* Enable ADC                                                                                             */  
  ADC_Cmd(HT_ADC, ENABLE);

  /* Software trigger to start continuous mode                                                              */
  ADC_SoftwareStartConvCmd(HT_ADC, ENABLE);

  while (1)
  {
  }
}

/*********************************************************************************************************//**
  * @brief  ADC configuration.
  * @retval None
  ***********************************************************************************************************/
void ADC_Configuration(void)
{
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.ADC        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }
  
  /* Enable the ADC Interrupts                                                                              */
  NVIC_EnableIRQ(ADC_IRQn);

  /* ADCLK frequency is set to HCLK/64                                                                      */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* Config AFIO mode as ADC function                                                                       */
  AFIO_GPxConfig(HTCFG_VR_GPIO_ID, HTCFG_VR_AFIO_PIN, AFIO_FUN_ADC);

  /* Continuous Mode, Length 1, SubLength 1                                                                 */
  ADC_RegularGroupConfig(HT_ADC, CONTINUOUS_MODE, 1, 1);

  /* ADC Channel n, Rank 0, Sampling clock is (1.5 + 0) ADCLK
     Conversion time = (sampling clock + 12.5) / ADCLK = 12.4 uS */
  ADC_RegularChannelConfig(HT_ADC, HTCFG_VR_ADC_CH, 0);
  ADC_SamplingTimeConfig(HT_ADC, 0);

  /* Use Software Trigger as ADC trigger source                                                             */
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_SOFTWARE);

  /* Enable ADC analog watchdog lower and upper threshold interrupt,
     The ADC ISR will on/off LED1 or LED2 depending on what interrupt occur. */
  ADC_IntConfig(HT_ADC, ADC_INT_AWD_LOWER | ADC_INT_AWD_UPPER, ENABLE);

  /* Configure Analog Watchdog                                                                              */
  ADC_AWDSingleChannelConfig(HT_ADC, HTCFG_VR_ADC_CH);
  ADC_AWDConfig(HT_ADC, ADC_AWD_SINGLE_LOWER_UPPER);  /* Enable upper/lower threshold monitor               */
  ADC_AWDThresholdsConfig(HT_ADC, 3000, 1000);        /* Upper threshold 3000, lower threshold 1000         */
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
