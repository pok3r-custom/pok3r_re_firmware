/*********************************************************************************************************//**
 * @file    ADC/EXTITrigger_DiscontinuousMode/main.c
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

/** @addtogroup EXTITrigger_DiscontinuousMode
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void EXTI_Configuration(void);
void ADC_Configuration(void);
void MainRoutine(void);

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
  *  - Set ADC Divider as 64, therefore ADCLK frequency as CK_AHB / 64
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
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* Enable peripheral clocks of ADC, EXTI                                                                  */
  CKCU_Configuration();
  EXTI_Configuration();
  ADC_Configuration();

  /* Enable EXTI channel                                                                                    */
  EXTI_IntConfig(HTCFG_EXTI_CH, ENABLE);

  /* Enable ADC                                                                                             */
  ADC_Cmd(HT_ADC, ENABLE);

  while (1)
  {
    MainRoutine();
  }
}

/*********************************************************************************************************//**
  * @brief  EXTI configuration.
  * @retval None
  ***********************************************************************************************************/
void EXTI_Configuration(void)
{
  EXTI_InitTypeDef EXTI_InitStruct = {0};
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
    CKCUClock.Bit.PC         = 1;
    CKCUClock.Bit.EXTI       = 1;
    CKCUClock.Bit.HTCFG_EXTI_CK = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Connect EXTI Channel to GPIO Pin                                                                       */
  AFIO_EXTISourceConfig(HTCFG_EXTI_AFIO, HTCFG_EXTI_ESS);

  /* Enable GPIO input                                                                                      */
  GPIO_InputConfig(HTCFG_EXTI_GPIO_PORT, HTCFG_EXTI_GPIO_PIN, ENABLE);

  /* Configure EXTI Channel n input. Use EXTI Channel n to trigger ADC                                      */
  /* Configure button EXTI Line on falling edge                                                             */
  EXTI_InitStruct.EXTI_Channel = HTCFG_EXTI_CH;
  EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_ENABLE;
  EXTI_InitStruct.EXTI_DebounceCnt = SystemCoreClock / 1000;  /* ~ 1 mS                                     */
  EXTI_InitStruct.EXTI_IntType = EXTI_NEGATIVE_EDGE;
  EXTI_Init(&EXTI_InitStruct);
}

/*********************************************************************************************************//**
  * @brief  ADC configuration.
  * @retval None
  ***********************************************************************************************************/
void ADC_Configuration(void)
{
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
    CKCUClock.Bit.PA         = 1;
    CKCUClock.Bit.ADC        = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Enable the ADC Interrupts                                                                              */
  NVIC_EnableIRQ(ADC_IRQn);

  /* ADCLK frequency is set to CK_AHB/64                                                                    */
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);

  /* Configure specify IO's AFIO mode as ADC function                                                       */
  AFIO_GPxConfig(HTCFG_OTHER0_GPIO_ID, HTCFG_OTHER0_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_OTHER1_GPIO_ID, HTCFG_OTHER1_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_VR_GPIO_ID, HTCFG_VR_AFIO_PIN, AFIO_FUN_ADC);

  /* Discontinuous Mode, Length 3, SubLength 2                                                              */
  ADC_RegularGroupConfig(HT_ADC, DISCONTINUOUS_MODE, 3, 2);

  /* ADC Channel n, Sequence 0, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5)                 */
  ADC_RegularChannelConfig(HT_ADC, HTCFG_VR_ADC_CH, 0);

  /* ADC Channel n, Sequence 1, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5)                 */
  ADC_RegularChannelConfig(HT_ADC, HTCFG_OTHER0_ADC_CH, 1);

  /* ADC Channel n, Sequence 2, Sampling clock is 1.5 ADCLK. Conversion time = (1.5 + 12.5)                 */
  ADC_RegularChannelConfig(HT_ADC, HTCFG_OTHER1_ADC_CH, 2);

  ADC_SamplingTimeConfig(HT_ADC, 0);

  /* Use EXTI channel n as ADC trigger source                                                               */
  ADC_RegularTrigConfig(HT_ADC, HTCFG_ADC_EXTI);

  /* Enable ADC cycle and subgroup end of conversion interrupt,
     The ADC ISR will store the ADC result into global variable gADC_Result and
     set gADC_CycleEndOfConversion or gADC_SubGroupEndOfConversion as TRUE */
  ADC_IntConfig(HT_ADC, ADC_INT_CYCLE_EOC | ADC_INT_SUB_GROUP_EOC, ENABLE);
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
    printf("Sequence2:%4u\r\n", (int)gADC_Result[2]);
    gADC_CycleEndOfConversion = FALSE;
  }
  if (gADC_SubGroupEndOfConversion)
  {
    /* Output gADC_Result if needed.                                                                        */
    printf("Sequence0:%4u Sequence1:%4u\r\n", (int)gADC_Result[0], (int)gADC_Result[1]);
    gADC_SubGroupEndOfConversion = FALSE;
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
//    <q11> I2C0   <q12> I2C1
//    <q23> I2S
//    <q21> SCI0 <q22> SCI1
//    <q13> SPI0   <q14> SPI1
//    <q17> UART0  <q18> UART1
//    <q15> USART0 <q16> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D
//    <q19> AFIO
//    <q20> EXTI
//  </h>
//  <h> System
//    <q32> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q31> CMP
//    <q2>  PDMA
//    <q26> PWRCU
//  </h>
//  <h> Timer
//    <q29> BFTM0 <q30> BFTM1
//    <q33> SCTM0 <q34> SCTM1 <q35> SCTM2 <q36> SCTM3
//    <q27> GPTM0 <q28> GPTM1
//    <q24> MCTM0
//    <q26> RTC   <q25> WDT
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
  CKCUClock.Bit.I2C0       = 0;
  CKCUClock.Bit.I2C1       = 0;
  CKCUClock.Bit.SPI0       = 0;
  CKCUClock.Bit.SPI1       = 0;
  CKCUClock.Bit.USART0     = 0;
  CKCUClock.Bit.USART1     = 0;
  CKCUClock.Bit.UART0      = 0;
  CKCUClock.Bit.UART1      = 0;
  CKCUClock.Bit.AFIO       = 0;
  CKCUClock.Bit.EXTI       = 0;
  CKCUClock.Bit.SCI0       = 0;
  CKCUClock.Bit.SCI1       = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.CMP        = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCUClock.Bit.SCTM0      = 0;
  CKCUClock.Bit.SCTM1      = 0;
  CKCUClock.Bit.SCTM2      = 0;
  CKCUClock.Bit.SCTM3      = 0;
  CKCUClock.Bit.HTCFG_EXTI_CK = 0;
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
