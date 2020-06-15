/*********************************************************************************************************//**
 * @file    TM/SinglePulseMode/main.c
 * @version $Rev:: 2255         $
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

/** @addtogroup SinglePulseMode
  * @{
  */

/* Private variables ---------------------------------------------------------------------------------------*/
u32 CH0_Frequency;
u32 CH1_Frequency;
u32 CH2_Frequency;
u32 CH3_Frequency;
u32 CH0_DeltaCCR;
u32 CH1_DeltaCCR;
u32 CH2_DeltaCCR;
u32 CH3_DeltaCCR;

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
  *  - Enable peripheral clock of AFIO, GPIO.
  *  - Config AFIO mode as GT0_CHx function.
  *  - Enable peripheral clock of GPTM.
  *  - GPTM0 Time base configuration:
  *     - GPTM0_PCLK = 40 MHz(for 52230, 52241) or
  *       GPTM0_PCLK = 48 MHz(for 52341, 52352) or
  *       GPTM0_PCKL = 60 MHz(for 0008)
  *     - Prescaler = 1
  *     - CounterReload = 65535
  *     - GPTM_CounterClock = (GPTM0_PCLK / (Prescaler + 1)) = 20 , 24 or 30 MHz
  *  - GPTM0 single pulse mode configuration:
  *    - The Key1 is used as trigger the GPTM.
  *    - The Single Pulse signal is output on GT_CHx pin
  *    -  The maximum frequency value to trigger the GPTM input is
          GPTM_CounterClock/HTCFG_SINGLE_PULSE_GPTM_COUNTER_RELOAD = 500Hz
  *    - The Compare value decides the delay value, the delay value is fixed to 1.5 ms:
  *      delay =  HTCFG_SINGLE_PULSE_GPTM_COMPARE / GPTM_CounterClock = 1.5 ms.
  *    - The (CounterReload - Compare + 1) value decides the Single Pulse value,
  *      the pulse value is fixed to 0.5 ms:
  *      Single Pulse value = (CounterReload - Compare + 1)/GPTM0_CounterClock = 0.5 ms.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;
  /* Configure KEY1 used to start GPTM                                                                      */
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_GPIO);


  /* Enable peripheral's clock of AFIO and GPTM                                                             */
  CKCUClock.Bit.AFIO                              = 1;
  HTCFG_SINGLE_PULSE_GPTM_CLK(CKCUClock)          = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure AFIO mode as GT_CH function.                                                                 */
  AFIO_GPxConfig(HTCFG_SINGLE_PULSE_GPTM_GPIO_ID,
                 HTCFG_SINGLE_PULSE_GPTM_AFIO_PIN,
                 HTCFG_SINGLE_PULSE_GPTM_AFIO_MODE);

  /* Time base configuration                                                                                */
  TM_TimeBaseStructInit(&TimeBaseInit);
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = HTCFG_SINGLE_PULSE_COUNTER_RELOAD;
  TimeBaseInit.Prescaler = 1;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HTCFG_SINGLE_PULSE_GPTM, &TimeBaseInit);

  /* GPTM0 PWM2 Mode configuration: Channel3                                                                */
  TM_OutputStructInit(&OutInit);
  OutInit.Channel = HTCFG_SINGLE_PULSE_GPTM_CH;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = HTCFG_SINGLE_PULSE_COMPARE;
  TM_OutputInit(HTCFG_SINGLE_PULSE_GPTM, &OutInit);

  /* Enable GPTM                                                                                            */
  TM_SinglePulseModeCmd(HTCFG_SINGLE_PULSE_GPTM, ENABLE);

  while (1)
  {
    /*Waiting for key1 pressed                                                                              */
    while (HT32F_DVB_PBGetState(BUTTON_KEY1));
    /* Enable GPTM                                                                                          */
    TM_Cmd(HTCFG_SINGLE_PULSE_GPTM, ENABLE);
    /*Waiting for Update event                                                                              */
    while (!TM_GetFlagStatus(HTCFG_SINGLE_PULSE_GPTM, TM_FLAG_UEV));
    /*Clear flag of update event                                                                            */
    TM_ClearFlag(HTCFG_SINGLE_PULSE_GPTM, TM_FLAG_UEV);
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
