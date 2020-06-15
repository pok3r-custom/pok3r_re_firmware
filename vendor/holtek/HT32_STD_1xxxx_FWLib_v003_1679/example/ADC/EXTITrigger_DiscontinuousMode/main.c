/*********************************************************************************************************//**
 * @file    ADC/EXTITrigger_DiscontinuousMode/main.c
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

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup EXTITrigger_DiscontinuousMode
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
extern u32 gADC_Result[3];
extern u32 gADC_ResultIndex;
extern volatile bool gADC_CycleEndOfConversion;
extern volatile bool gADC_SubGroupEndOfConversion;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @details Main program as following
  *  - Configure Retarget used to output gPotentiometerLevel.
  *  - Enable the NVIC ADC Interrupt
  *  - Enable peripherals clock of ADC, EXTI, AFIO, GPIOE.
  *  - Configure KEY1 for EXTI Channel input. Use EXTI Channel to trigger ADC.
  *    Therefore, press KEY1 on the development board will send signal to ADC peripheral.
  *  - Set ADC Divider as 6 or 8, therefore ADCLK frequency is 12 MHz (72 MHz /6 or 96 MHz /8).
  *  - Configure AFIO mode as ADC function.
  *  - ADC configure as Discontinuous Mode, Length 3, SubLength 2
  *  - Configure ADC Sequence 0 to convert ADC channel n with 1.5 sampling clock.
  *  - Configure ADC Sequence 1 to convert ADC channel n with 1.5 sampling clock.
  *  - Configure ADC Sequence 2 to convert ADC channel n with 1.5 sampling clock.
  *  - Configure EXTI channel n as ADC trigger source
  *  - Enable ADC cycle and subgroup end of conversion interrupt,
  *    The ADC ISR will store the ADC result into global variable gADC_Result and
  *    set gADC_CycleEndOfConversion and gADC_SubGroup EndOfConversion as TRUE.
  *  - Print gADC_Result in a infinite loop if needed.
  *
  ***********************************************************************************************************/
int main(void)
{
  EXTI_InitTypeDef EXTI_InitStruct = {0};

  /* RETARGET Related configuration                                                                         */
  RETARGET_Configuration();

  /* Enable the ADC Interrupts                                                                              */
  NVIC_EnableIRQ(ADC_IRQn);

  /* Enable peripheral clocks of ADC, EXTI                                                                  */
  CKCU_Configuration();

  /* Configure EXTI Channel n input. Use EXTI Channel n to trigger ADC                                      */
  /* Configure button EXTI Line on falling edge                                                             */
  EXTI_InitStruct.EXTI_Channel = HTCFG_EXTI_CH;
  EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_ENABLE;
  EXTI_InitStruct.EXTI_DebounceCnt = HTCFG_DEBOUNCE_COUNT;   /* ~ 1 uS                                      */
  EXTI_InitStruct.EXTI_IntType = EXTI_NEGATIVE_EDGE;
  EXTI_Init(&EXTI_InitStruct);

  /* Enable GPIO input                                                                                      */
  GPIO_InputConfig(HTCFG_EXTI_GPIO_PORT, HTCFG_EXTI_GPIO_PIN, ENABLE);

  /* Connect EXTI Channel to GPIO Pin                                                                       */
  AFIO_EXTISourceConfig(HTCFG_EXTI_AFIO, HTCFG_EXTI_ESS);

  /* Enable EXTI channel                                                                                    */
  EXTI_IntConfig(HTCFG_EXTI_CH, ENABLE);

  /* ADCLK frequency is set to 12 MHz (72 MHz /6 or 96 MHz /8)                                              */
  CKCU_SetADCPrescaler(HTCFG_ADC_PRESCALER);

  /* Configure specify IO's AFIO mode as ADC function                                                       */
  AFIO_GPxConfig(HTCFG_OTHER0_GPIO_ID, HTCFG_OTHER0_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_OTHER1_GPIO_ID, HTCFG_OTHER1_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_VR_GPIO_ID, HTCFG_VR_AFIO_PIN, AFIO_FUN_ADC);

  /* Discontinuous Mode, Length 3, SubLength 2                                                              */
  ADC_RegularGroupConfig(HT_ADC, DISCONTINUOUS_MODE, 3, 2);

  /* ADC Channel n, Sequence 0, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 1.167u*/
  ADC_RegularChannelConfig(HT_ADC, HTCFG_VR_ADC_CH, 0, 0);

  /* ADC Channel n, Sequence 1, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 1.167u*/
  ADC_RegularChannelConfig(HT_ADC, HTCFG_OTHER0_ADC_CH, 1, 0);

  /* ADC Channel n, Sequence 2, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 1.167u*/
  ADC_RegularChannelConfig(HT_ADC, HTCFG_OTHER1_ADC_CH, 2, 0);

  /* Use EXTI channel n as ADC trigger source                                                               */
  ADC_RegularTrigConfig(HT_ADC, HTCFG_ADC_TRIG_EXTI);

  /* Enable ADC cycle and subgroup end of conversion interrupt,
     The ADC ISR will store the ADC result into global variable gADC_Result and
     set gADC_CycleEndOfConversion or gADC_SubGroupEndOfConversion as TRUE */
  ADC_IntConfig(HT_ADC, ADC_INT_CYCLE_EOC | ADC_INT_SUB_GROUP_EOC, ENABLE);

  while (1)
  {
    if (gADC_CycleEndOfConversion)
    {
      /* Output gADC_Result if needed.                                                                      */
      printf("Sequence2:%4u\r\n", (int)gADC_Result[2]);
      gADC_CycleEndOfConversion = FALSE;
    }
    if (gADC_SubGroupEndOfConversion)
    {
      /* Output gADC_Result if needed.                                                                      */
      printf("Sequence0:%4u Sequence1:%4u\r\n", (int)gADC_Result[0], (int)gADC_Result[1]);
      gADC_SubGroupEndOfConversion = FALSE;
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  HTCFG_EXTI_CK(CKCUClock)         = 1;
  CKCUClock.Bit.AFIO               = 1;
  CKCUClock.Bit.EXTI               = 1;
  CKCUClock.Bit.ADC                = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

#if (ENABLE_CKOUT == 1)
  CKOUTConfig();
#endif
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
