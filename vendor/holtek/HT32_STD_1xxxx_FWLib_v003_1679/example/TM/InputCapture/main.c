/*********************************************************************************************************//**
 * @file    TM/InputCapture/main.c
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
void GPTM0_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
extern sPulseCaptureStructure CaptureCH0;
extern sPulseCaptureStructure CaptureCH1;
extern sPulseCaptureStructure CaptureCH2;
extern sPulseCaptureStructure CaptureCH3;

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
  *  - Configure GPTM0 to output pulse every 1 second for test purpose.
  *    CH0:25uS, CH1:250uS, CH2:25mS, CH3:950mS
  *  - Enable AFIO, GPIO and GPTM1 PCLK
  *  - Connect GPIOs with internal pull-high resistor.
  *  - Configure GPIO's AFIO mode as GPTM1 function.
  *  - Configure GPTM1 channel as input capture mode.
  *  - Enable GPTM1.
  *  - Enable GPTM1 Channel Capture interrupts and Update Event interrupt.
  *    The interrupt service routine will store capture value
  *    or compute the measurement pulse width in PCLK unit
  *  - Print pulse width duration via USART in an infinite loop if needed.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_CaptureInitTypeDef  CapInit;

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* Configure GPTM0 to output pulse every 1 second for test purpose.
     CH0:25uS, CH1:250uS, CH2:25mS, CH3:950mS  */
  GPTM0_Configuration();

  /* Enable AFIO, GPIO and GPTM1 PCLK                                                                       */
  CKCUClock.Bit.PA         = 1;
  CKCUClock.Bit.PC         = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM1      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Connect GPIO with internal pull-high resistor                                                          */
  GPIO_PullResistorConfig(HT_GPIOC, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_PR_UP);

  /* Configure GPIO's AFIO mode as GPTM1 function                                                           */
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_0 | AFIO_PIN_1 | AFIO_PIN_2 | AFIO_PIN_3, AFIO_MODE_4);

  /* Configure GPTM1 channel0 ~ channel3 as input capture mode                                              */
  CapInit.Channel = TM_CH_0;
  CapInit.Polarity = TM_CHP_NONINVERTED;
  CapInit.Selection = TM_CHCCS_DIRECT;
  CapInit.Prescaler = TM_CHPSC_OFF;
  CapInit.Filter = 0x0;
  TM_CaptureInit(HT_GPTM1, &CapInit);

  CapInit.Channel = TM_CH_1;
  TM_CaptureInit(HT_GPTM1, &CapInit);

  CapInit.Channel = TM_CH_2;
  TM_CaptureInit(HT_GPTM1, &CapInit);

  CapInit.Channel = TM_CH_3;
  TM_CaptureInit(HT_GPTM1, &CapInit);

  /* Enable GPTM1                                                                                           */
  TM_Cmd(HT_GPTM1, ENABLE);

  /* Enable GPTM1 Channel Capture interrupts and Update Event interrupt                                     */
  NVIC_EnableIRQ(GPTM1_IRQn);
  TM_IntConfig(HT_GPTM1, TM_INT_CH0CC | TM_INT_CH1CC | TM_INT_CH2CC |
                           TM_INT_CH3CC | TM_INT_UEV, ENABLE);

  /* Print pulse width duration via USART in an infinite loop if needed                                     */
  while (1)
  {
    if (CaptureCH0.DataValid)
    {
      printf("CH0 : %u uS\r\n", (int)(CaptureCH0.CapturePulse / (SystemCoreClock/1000000ul)));
      CaptureCH0.DataValid = FALSE;
    }

    if (CaptureCH1.DataValid)
    {
      printf("CH1 : %u uS\r\n", (int)(CaptureCH1.CapturePulse / (SystemCoreClock/1000000ul)));
      CaptureCH1.DataValid = FALSE;
    }

    if (CaptureCH2.DataValid)
    {
      printf("CH2 : %u uS\r\n", (int)(CaptureCH2.CapturePulse / (SystemCoreClock/1000000ul)));
      CaptureCH2.DataValid = FALSE;
    }

    if (CaptureCH3.DataValid)
    {
      printf("CH3 : %u uS\r\n", (int)(CaptureCH3.CapturePulse / (SystemCoreClock/1000000ul)));
      CaptureCH3.DataValid = FALSE;
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configures GPTM0 to output PWM waveform.
  * @retval None
  * @details GPTM0 configuration as following:
  *   - CH0 : frequency 1 Hz and duty 25 uS
  *   - CH1 : frequency 1 Hz and duty 250 uS
  *   - CH2 : frequency 1 Hz and duty 25 mS
  *   - CH3 : frequency 1 Hz and duty 950 mS
  *
  ***********************************************************************************************************/
void GPTM0_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable AFIO and GPTM0 PCLK                                                                             */
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config GPIO's AFIO mode as GPTM0 function                                                              */
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_4 | AFIO_PIN_5 | AFIO_PIN_6 | AFIO_PIN_7, AFIO_MODE_4);

  /* GPTM0 Time-Base configuration                                                                          */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 39999;
  TimeBaseInit.Prescaler = HTCFG_TIME_BASE_PRESCALER;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  /* GPTM0 Channel 0 output PWM (frequency 1 Hz and duty 25 uS)                                             */
  OutInit.Channel = TM_CH_0;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = TimeBaseInit.CounterReload;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* GPTM0 Channel 1 output PWM (frequency 1 Hz and duty 250 uS)                                            */
  OutInit.Channel = TM_CH_1;
  OutInit.Compare = TimeBaseInit.CounterReload - 10 + 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* GPTM0 Channel 2 output PWM (frequency 1 Hz and duty 25 mS)                                             */
  OutInit.Channel = TM_CH_2;
  OutInit.Compare = TimeBaseInit.CounterReload - 1000 + 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* GPTM0 Channel 3 output PWM (frequency 1 Hz and duty 950 mS)                                            */
  OutInit.Channel = TM_CH_3;
  OutInit.Compare = TimeBaseInit.CounterReload - 38000 + 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* Enable GPTM0                                                                                           */
  TM_Cmd(HT_GPTM0, ENABLE);
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
