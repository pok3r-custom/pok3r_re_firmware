/*********************************************************************************************************//**
 * @file    ADC/EXTITrigger_DiscontinuousMode/main.c
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

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
  *  - Set ADC Divider as 64, therefore ADCLK frequency as 72MHz /64 = 1.125MHz
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
  EXTI_InitStruct.EXTI_Channel = EXTI_CHANNEL_1;
  EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_ENABLE;
  EXTI_InitStruct.EXTI_DebounceCnt = 720000;   /* ~ 1 mS                                                    */
  EXTI_InitStruct.EXTI_IntType = EXTI_NEGATIVE_EDGE;
  EXTI_Init(&EXTI_InitStruct);

  /* Enable GPIO input                                                                                      */
  GPIO_InputConfig(HT_GPIOE, GPIO_PIN_1, ENABLE);

  /* Connect EXTI Channel to GPIO Pin                                                                       */
  AFIO_EXTISourceConfig(AFIO_EXTI_CH_1, AFIO_ESS_PE);

  /* Enable EXTI channel                                                                                    */
  EXTI_IntConfig(EXTI_CHANNEL_1, ENABLE);

  /* ADCLK frequency is set to 72/64 MHz = 1.125MHz                                                         */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* Configure specify IO's AFIO mode as ADC function                                                       */
  AFIO_GPAConfig(AFIO_PIN_0 | AFIO_PIN_1, AFIO_MODE_2);
  AFIO_GPCConfig(AFIO_PIN_11, AFIO_MODE_2);

  /* Discontinuous Mode, Length 3, SubLength 2                                                              */
  ADC_RegularGroupConfig(HT_ADC, DISCONTINUOUS_MODE, 3, 2);

  /* ADC Channel n, Sequence 0, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 12.4 u*/
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_15, 0, 0);

  /* ADC Channel n, Sequence 1, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 12.4 u*/
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_0, 1, 0);

  /* ADC Channel n, Sequence 2, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5) / ADCLK = 12.4 u*/
  ADC_RegularChannelConfig(HT_ADC, ADC_CH_1, 2, 0);

  /* Use EXTI channel n as ADC trigger source                                                               */
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_EXTI_1);

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
/*
//<e0> Enable Peripheral Clock
//  <h> Communication
//    <q5> EBI
//    <q12> I2C0   <q13> I2C1
//    <q23> I2S
//    <q22> SCI
//    <q14> SPI0   <q15> SPI1
//    <q18> UART0  <q19> UART1
//    <q16> USART0 <q17> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D <q11>  GPIO Port E
//    <q20> AFIO
//    <q21> EXTI
//  </h>
//  <h> System
//    <q34> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q32> OPA/CMP0 <q33> OPA/CMP1
//    <q2>  PDMA
//    <q27> PWRCU
//  </h>
//  <h> Timer
//    <q30> BFTM0 <q31> BFTM1
//    <q28> GPTM0 <q29> GPTM1
//    <q24> MCTM0 <q25> MCTM1
//    <q27> RTC   <q26> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 0;
  CKCUClock.Bit.USBD       = 0;
  CKCUClock.Bit.CKREF      = 0;
  CKCUClock.Bit.EBI        = 0;
  CKCUClock.Bit.CRC        = 0;
  CKCUClock.Bit.PA         = 0;
  CKCUClock.Bit.PB         = 0;
  CKCUClock.Bit.PC         = 0;
  CKCUClock.Bit.PD         = 0;
  CKCUClock.Bit.PE         = 1;
  CKCUClock.Bit.I2C0       = 0;
  CKCUClock.Bit.I2C1       = 0;
  CKCUClock.Bit.SPI0       = 0;
  CKCUClock.Bit.SPI1       = 0;
  CKCUClock.Bit.USART0     = 0;
  CKCUClock.Bit.USART1     = 0;
  CKCUClock.Bit.UART0      = 0;
  CKCUClock.Bit.UART1      = 0;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 1;
  CKCUClock.Bit.SCI        = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.MCTM1      = 0;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.OPA0       = 0;
  CKCUClock.Bit.OPA1       = 0;
  CKCUClock.Bit.ADC        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

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
