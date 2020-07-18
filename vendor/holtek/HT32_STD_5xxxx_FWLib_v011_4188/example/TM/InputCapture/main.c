/*********************************************************************************************************//**
 * @file    TM/InputCapture/main.c
 * @version $Rev:: 2246         $
 * @date    $Date:: 2017-11-30#$
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

/** @addtogroup InputCapture
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef struct
{
  u32 OverflowCounter;
  u32 StartValue;
  u32 CapturePulse;
  TM_CHP_Enum ChannelPolarity;
  bool DataValid;
  bool DataOverwrite;
} sPulseCaptureStructure;

/* Private function prototypes -----------------------------------------------------------------------------*/
void SCTM_Configuration(void);
void GTCM_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
extern sPulseCaptureStructure CaptureCHx;

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
  *  - Configure SCTM/PWM to output pulse every 1 second for test purpose.
  *    CH0:2500uS
  *  - Enable AFIO, GPIO and GPTM PCLK
  *  - Connect GPIOs with internal pull-high resistor.
  *  - Configure GPIO's AFIO mode as GPTM function.
  *  - Configure GPTM channel as input capture mode.
  *  - Enable GPTM.
  *  - Enable GPTM Channel Capture interrupts and Update Event interrupt.
  *    The interrupt service routine will store capture value
  *    or compute the measurement pulse width in PCLK unit
  *  - Print pulse width duration via USART in an infinite loop if needed.
  *
  ***********************************************************************************************************/
int main(void)
{
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* Configure SCTM to output pulse every 1 second for test purpose.CH0:250us                               */
  SCTM_Configuration();
  /* Configure GPTM to capture pulse for test purpose.                                                      */
  GTCM_Configuration();
  while (1)
  {
    if (CaptureCHx.DataValid)
    {
      printf("Capture : %u uS\r\n", (int)(CaptureCHx.CapturePulse / (SystemCoreClock/1000000ul)));
      CaptureCHx.DataValid = FALSE;
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configures STM to output PWM waveform.
  * @retval None
  * @details  configuration as following:
  *   - SCTM : frequency 1Hz and duty 2500 uS
  *
  ***********************************************************************************************************/
void SCTM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TM_TimeBaseInitStructure;
  TM_OutputInitTypeDef TM_OutputInitStructure;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO                            = 1;
  HTCFG_OUTPUT_PWM_BY_SCTM_CLK(CKCUClock)       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  AFIO_GPxConfig(HTCFG_OUTPUT_PWM_BY_SCTM_GPIO_ID, HTCFG_OUTPUT_PWM_BY_SCTM_AFIO_PIN, HTCFG_OUTPUT_PWM_BY_AFIO_MODE) ;
  /* Init SCTM0 time-base for PWM                                                                           */
  TM_TimeBaseInitStructure.Prescaler = HTCFG_INPUT_CAPTURE_PRESCALER-1;
  TM_TimeBaseInitStructure.CounterReload = SystemCoreClock/(TM_TimeBaseInitStructure.Prescaler + 1)-1;
  TM_TimeBaseInitStructure.RepetitionCounter = 0;
  TM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  TM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HTCFG_OUTPUT_PWM_BY_SCTM, &TM_TimeBaseInitStructure);

  /* Clear Update Event Interrupt flag                                                                      */
  TM_ClearFlag(HTCFG_OUTPUT_PWM_BY_SCTM, TM_FLAG_UEV);

  TM_OutputInitStructure.Channel = HTCFG_OUTPUT_PWM_BY_SCTM_CHANNEL;
  TM_OutputInitStructure.OutputMode = TM_OM_PWM2;
  TM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  TM_OutputInitStructure.ControlN = TM_CHCTL_DISABLE;//TM_CHCTL_ENABLE;
  TM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  TM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  TM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  TM_OutputInitStructure.Compare = SystemCoreClock/(TM_TimeBaseInitStructure.Prescaler + 1)-10;
  TM_OutputInit(HTCFG_OUTPUT_PWM_BY_SCTM, &TM_OutputInitStructure);

  /* SCTM0/PWM counter enable                                                                               */
  TM_Cmd(HTCFG_OUTPUT_PWM_BY_SCTM, ENABLE);
}
/*********************************************************************************************************//**
  * @brief  Configures GPTM to capture waveform.
  * @retval None
  * @details  None
  *
  ***********************************************************************************************************/
void GTCM_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_CaptureInitTypeDef  CapInit;
  /* Enable AFIO, GPIO and GPTM PCLK                                                                        */
  CKCUClock.Bit.AFIO       = 1;
  HTCFG_INPUT_CAPTURE_GPTM_CLK(CKCUClock)      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  AFIO_GPxConfig(HTCFG_INPUT_CAPTURE_GPTM_GPIO_ID, HTCFG_INPUT_CAPTURE_GPTM_AFIO_PIN, HTCFG_INPUT_CAPTURE_GPTM_AFIO_MODE) ;
  CapInit.Channel = HTCFG_INPUT_CAPTURE_GPTM_CHANNEL;
  CapInit.Polarity = TM_CHP_NONINVERTED;
  CapInit.Selection = TM_CHCCS_DIRECT;
  CapInit.Prescaler = TM_CHPSC_OFF;
  CapInit.Filter = 0x0;
  TM_CaptureInit(HTCFG_INPUT_CAPTURE_GPTM, &CapInit);
  /* Enable GPTM                                                                                            */
  TM_Cmd(HTCFG_INPUT_CAPTURE_GPTM, ENABLE);
  /* Enable GPTM Channel Capture interrupts and Update Event interrupt                                      */
  NVIC_EnableIRQ(HTCFG_INPUT_CAPTURE_GPTM_IRQn);
  TM_IntConfig(HTCFG_INPUT_CAPTURE_GPTM, HTCFG_INPUT_CAPTURE_GPTM_CCR | TM_INT_UEV, ENABLE);
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
