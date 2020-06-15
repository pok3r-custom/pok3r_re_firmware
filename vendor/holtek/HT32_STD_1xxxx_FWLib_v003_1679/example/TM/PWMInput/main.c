/*********************************************************************************************************//**
 * @file    TM/PWMInput/main.c
 * @version $Rev:: 542          $
 * @date    $Date:: 2017-07-17 #$
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

/** @addtogroup PWMInput
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
extern vu32 wDutyCycle;
extern vu32 wFrequency;

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
  *  - Config AFIO mode of GT0_CH1 and GT1_CH1 as GPTM function
  *  - Enable GPTM0 and GPTM1 PCLK
  *  - Configures GPTM0 Channel1 to output PWM signal.
  *    - wFrequency = 2 kHz
  *    - wDutyCycle = 33 %.
  *  - GPTM1 is configured in PWM Input Mode.
  *    - The GPTM1_PCLK frequency is set to 72 MHz or 96 MHz, the Prescaler is 0
  *      so the GPTM1_CounterClock = (GPTM1_PCLK / (0 + 1).
  *      so the minimum frequency value to measure is GPTM1_PCLK/65536.
  *    - The external signal is connected to GPTM1 Channel1 used as input pin.
  *    - The GPTM1 CH1CCR is used to compute the frequency value.
  *    - The GPTM1 CH0CCR is used to compute the duty cycle value.
  *  - The GPTM1 is configured as slave restart mode.
  *    - The trigger source is come from TI1S1
  *    - Enable the UGDIS function. Only counter overflow assert Update Event interrupt.
  *      The Slave Restart or setting the UEVG bit does not assert Update Event.
  *  - Enable GPTM1.
  *  - Enable GPTM1 Channel 1 Capture interrupt and Update Event interrupt.
  *    Please refer to GPTM1_IRQHandler for details.
  *  - Print wFrequency and wDutyCycle via USART.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;
  TM_CaptureInitTypeDef  CapInit;
  u32 wCRR = 0;

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  HTCFG_INPUT_PWM_GPTM_GPIO_CLK(CKCUClock)         = 1;
  CKCUClock.Bit.AFIO                               = 1;
  CKCUClock.Bit.GPTM0                              = 1;
  CKCUClock.Bit.GPTM1                              = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config with internal pull-high resistor                                                                */
  GPIO_PullResistorConfig(HTCFG_INPUT_PWM_GPTM, HTCFG_INPUT_PWM_GPTM_GPIO_PIN, GPIO_PR_UP);

  /* Config AFIO mode of GT0_CH1 and GT1_CH1 as GPTM function                                               */
  AFIO_GPxConfig(HTCFG_OUTPUT_PWM_GPTM_GPIO_ID, HTCFG_OUTPUT_PWM_GPTM_AFIO_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_INPUT_PWM_GPTM_GPIO_ID, HTCFG_INPUT_PWM_GPTM_AFIO_PIN, AFIO_MODE_4);

  /* GPTM0 Time-Base configuration                                                                          */
  wCRR = (SystemCoreClock / 2000) - 1;
  TM_TimeBaseStructInit(&TimeBaseInit);
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = wCRR;
  TimeBaseInit.Prescaler = 0;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_UPDATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  /* GPTM0 Channel 1 output configuration                                                                   */
  TM_OutputStructInit(&OutInit);
  OutInit.Channel = TM_CH_1;
  OutInit.OutputMode = TM_OM_PWM1;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = ((wCRR + 1) * 33) / 100;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* Enable GPTM0                                                                                           */
  TM_Cmd(HT_GPTM0, ENABLE);

  /* GPTM1 PWM input mode configuration                                                                     */
  TM_CaptureStructInit(&CapInit);
  CapInit.Channel = TM_CH_1;
  CapInit.Polarity = TM_CHP_NONINVERTED;
  CapInit.Selection = TM_CHCCS_DIRECT;
  CapInit.Prescaler = TM_CHPSC_OFF;
  CapInit.Filter = 0x0;

  TM_PwmInputInit(HT_GPTM1, &CapInit);

  /**
   * The trigger source is come from TI1S1
   * The GPTM1 is configured as slave restart mode.
   */
  TM_StiConfig(HT_GPTM1, TM_TRSEL_TI1S1);
  TM_SlaveModeConfig(HT_GPTM1, TM_SMSEL_RESTART);

  /* Enable the UGDIS function                                                                              */
  TM_UEVG_IntConfig(HT_GPTM1, DISABLE);

  /* Enable GPTM1                                                                                           */
  TM_Cmd(HT_GPTM1, ENABLE);

  /* Enable GPTM1 Channel 1 Capture interrupt and Update Event interrupt                                    */
  NVIC_EnableIRQ(GPTM1_IRQn);
  TM_IntConfig(HT_GPTM1, TM_INT_CH1CC | TM_INT_UEV, ENABLE);

  /* Print wFrequency and wDutyCycle via USART                                                              */
  while (1)
  {
    unsigned int wDutyCycleInteger = wDutyCycle >> 16;
    unsigned int wDutyCycleFraction = ((wDutyCycle & 0xFFFF) * 10000) / 0x10000;

    printf("wFrequency %u Hz, wDutyCycle %u.%04u %%                  \r",
      (unsigned int)wFrequency, wDutyCycleInteger, wDutyCycleFraction );
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
