/*********************************************************************************************************//**
 * @file    TM/PWMInput/main.c
 * @version $Rev:: 2250         $
 * @date    $Date:: 2017-11-30 #$
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

/** @addtogroup TM_Examples TM
  * @{
  */

/** @addtogroup PWMInput
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
extern vu32 wDutyCycle;
extern vu32 wFrequency;
extern u16 u16Prescarler;

/* Private constants ---------------------------------------------------------------------------------------*/
#define OUTPUT_PWM_PERIOD    2000                /*!< PWM period 2 kHz by SCTM or PWM                       */

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting is already configured,
  *       this is done through SystemInit() function which is called from startup
  *       file (startup_ht32fxxxx.s) before branching to application main.
  *       To reconfigure the default setting of SystemInit() function, refer to
  *       system_ht32fxxxx.c file
  * @details Main program as following
  *  - USART Related configuration.
  *  - Config PA1 with internal pull-high resistor.
  *  - Config AFIO mode of SCTM0/PWM and GT1_CH1 as GPTM function
  *  - Enable SCTM0/PWM1 and GPTM1 PCLK
  *  - Configures SCTM/PWM Channel0 to output PWM signal.
  *    - wFrequency = 2 kHz
  *    - wDutyCycle = 33 %.
  *  - GPTM0 is configured in PWM Input Mode.
  *    - The GPTM0_PCLK frequency is set to 40, 48 or 60 MHz, the Prescaler is 20
  *      so the GPTM1 counter clock is GPTM0_PCLK / (20 + 1) MHz.
  *      so the minimum frequency value to measure is GPTM0_PCLK/65536 Hz.
  *    - The external signal is connected to GPTM0 Channel1 used as input pin.
  *    - The GPTM0 CH1CCR is used to compute the frequency value.
  *    - The GPTM0 CH0CCR is used to compute the duty cycle value.
  *  - The GPTM0 is configured as slave restart mode.
  *    - The trigger source is come from TI1S1
  *    - Enable the UGDIS function. Only counter overflow assert Update Event interrupt.
  *      The Slave Restart or setting the UEVG bit does not assert Update Event.
  *  - Enable GPTM0.
  *  - Enable GPTM0 Channel 1 Capture interrupt and Update Event interrupt.
  *    Please refer to GPTM0_IRQHandler for details.
  *  - Print wFrequency and wDutyCycle via USART.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_TimeBaseInitTypeDef TM_TimeBaseInitStructure;
  TM_OutputInitTypeDef TM_OutputInitStructure;
  TM_CaptureInitTypeDef TM_CatputrInitStructure;

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  HTCFG_OUTPUT_PWM_BY_SCTM_CLK(CKCUClock)        = 1;
  HTCFG_INPUT_PWM_GPTM_CLK(CKCUClock)            = 1;
  CKCUClock.Bit.AFIO                             = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode of GT0_CH0 as GPTM function                                                           */
  AFIO_GPxConfig(HTCFG_INPUT_PWM_GPTM_GPIO_ID, HTCFG_INPUT_PWM_GPTM_AFIO_PIN, HTCFG_INPUT_PWM_GPTM_AFIO_MODE);
  /* Config AFIO mode of SCTM1 as GPTM function                                                             */
  AFIO_GPxConfig(HTCFG_OUTPUT_PWM_BY_SCTM_GPIO_ID, HTCFG_OUTPUT_PWM_BY_SCTM_AFIO_PIN, HTCFG_OUTPUT_PWM_BY_AFIO_MODE);

  /* Init GPTM0 input mode configuration                                                                    */
  TM_CaptureStructInit(&TM_CatputrInitStructure);
  TM_CatputrInitStructure.Channel = HTCFG_INPUT_PWM_GPTM_CHANNEL;
  TM_CatputrInitStructure.Filter = 0x00;
  TM_CatputrInitStructure.Polarity  = TM_CHP_NONINVERTED;
  TM_CatputrInitStructure.Prescaler = TM_CHPSC_OFF;
  TM_CatputrInitStructure.Selection  = TM_CHCCS_DIRECT;

  TM_PwmInputInit(HTCFG_INPUT_PWM_GPTM,&TM_CatputrInitStructure);

  /*Prescaler frequency of GPTM0, fCK_CNT = SYS_CK/PRESCALER                                                */
  TM_PrescalerConfig(HTCFG_INPUT_PWM_GPTM, u16Prescarler - 1, TM_PSC_RLD_IMMEDIATE);
  /**
   * The trigger source is come from TI1S1
   * The GPTM1 is configured as slave restart mode.
   */
  TM_StiConfig(HTCFG_INPUT_PWM_GPTM, TM_TRSEL_TI1S1);
  TM_SlaveModeConfig(HTCFG_INPUT_PWM_GPTM, TM_SMSEL_RESTART);

  /* Enable the UGDIS function                                                                              */
  TM_UEVG_IntConfig(HTCFG_INPUT_PWM_GPTM, DISABLE);

  /* Enable GPTM0                                                                                           */
  TM_Cmd(HTCFG_INPUT_PWM_GPTM, ENABLE);

 /* Enable GPTM0 Channel 1 Capture interrupt and Update Event interrupt                                     */
  NVIC_EnableIRQ(HTCFG_INPUT_PWM_GPTM_IRQn);
  TM_IntConfig(HTCFG_INPUT_PWM_GPTM, TM_INT_CH1CC | TM_INT_UEV, ENABLE);

  /* Init SCTM0 time-base for PWM                                                                           */
  TM_TimeBaseInitStructure.CounterReload = SystemCoreClock / OUTPUT_PWM_PERIOD - 1;
  TM_TimeBaseInitStructure.Prescaler = 0;
  TM_TimeBaseInitStructure.RepetitionCounter = 0;
  TM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  TM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HTCFG_OUTPUT_PWM_BY_SCTM, &TM_TimeBaseInitStructure);

  /* Clear Update Event Interrupt flag                                                                      */
  TM_ClearFlag(HTCFG_OUTPUT_PWM_BY_SCTM, TM_FLAG_UEV);

  /* Init SCTM0 Channel x to output PWM waveform with 33% duty                                              */
  TM_OutputInitStructure.Channel = HTCFG_OUTPUT_PWM_BY_SCTM_CHANNEL;
  TM_OutputInitStructure.OutputMode = TM_OM_PWM2;
  TM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  TM_OutputInitStructure.ControlN = TM_CHCTL_DISABLE; //TM_CHCTL_ENABLE;
  TM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  TM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  TM_OutputInitStructure.Compare = ((SystemCoreClock / OUTPUT_PWM_PERIOD) * (100 - 33)) / 100;
  TM_OutputInit(HTCFG_OUTPUT_PWM_BY_SCTM, &TM_OutputInitStructure);

  /* SCTM0 counter enable                                                                                   */
  TM_Cmd(HTCFG_OUTPUT_PWM_BY_SCTM, ENABLE);

  while (1)
  {
    unsigned int wDutyCycleInteger = wDutyCycle >> 16;
    unsigned int wDutyCycleFraction = ((wDutyCycle & 0xFFFF) * 10000) / 0x10000;
    unsigned int wFrequencyInteger = wFrequency / 1000;
    unsigned int wFrequencyFraction = wFrequency % 1000;
    printf("wFrequency %u.%u Hz, wDutyCycle %u.%04u %%                  \r",
    wFrequencyInteger, wFrequencyFraction, wDutyCycleInteger, wDutyCycleFraction);
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
