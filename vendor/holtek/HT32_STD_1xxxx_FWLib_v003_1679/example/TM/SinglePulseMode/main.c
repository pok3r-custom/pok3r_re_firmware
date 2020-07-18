/*********************************************************************************************************//**
 * @file    TM/SinglePulseMode/main.c
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

/** @addtogroup SinglePulseMode
  * @{
  */


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
  *  - Config AFIO mode as GT0_ETI and GT0_CH3 function.
  *  - Enable peripheral clock of GPTM0.
  *  - GPTM0 Time base configuration:
  *     - GPTM0_PCLK = 72 MHz or 96 MHz
  *     - Prescaler = HTCFG_SINGLE_PULSE_TIME_BASE_PRESCALER
  *     - CounterReload = 50000
  *     - GPTM0_CounterClock = (GPTM0_PCLK / (Prescaler + 1)) = 1 MHz
  *  - GPTM0 single pulse mode configuration:
  *    - The external signal is connected to GT0_ETI pin,
  *    - The rising edge is used as active edge,
  *    - The Single Pulse signal is output on GT0_CH3 pin
  *    - The CounterReload value is 50000 , so the maximum
  *       frequency value to trigger the GPTM0 input is 1 MHz/50000= 20 Hz.
  *    - The Compare value decides the delay value, the delay value is fixed to 5 ms:
  *      delay =  Compare / GPTM0_CounterClock = 5 ms.
  *    - The (CounterReload - Compare + 1) value decides the Single Pulse value,
  *      the pulse value is fixed to 45 ms:
  *      Single Pulse value = (CounterReload - Compare + 1)/GPTM0_CounterClock = 45 ms.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;

  /* Enable peripheral clock of AFIO, GPIO                                                                  */
  HTCFG_SINGLE_PULSE_GPTM_ETI_CLK(CKCUClock)         = 1;
  HTCFG_SINGLE_PULSE_GPTM_CH3_CLK(CKCUClock)         = 1;
  CKCUClock.Bit.AFIO                                 = 1;
  CKCUClock.Bit.GPTM0                                = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as GT0_ETI and GT0_CH3 function.                                                      */
  AFIO_GPxConfig(HTCFG_SINGLE_PULSE_GPTM_ETI_ID, HTCFG_SINGLE_PULSE_GPTM_ETI_AFIO_PIN, AFIO_MODE_4);  //Joystick UP on the HT321656 Development Board
  AFIO_GPxConfig(HTCFG_SINGLE_PULSE_GPTM_CH3_ID, HTCFG_SINGLE_PULSE_GPTM_CH3_AFIO_PIN, AFIO_MODE_4);

  /* Time base configuration                                                                                */
  TM_TimeBaseStructInit(&TimeBaseInit);
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 50000;
  TimeBaseInit.Prescaler = HTCFG_SINGLE_PULSE_TIME_BASE_PRESCALER;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  /* GPTM0 PWM2 Mode configuration: Channel3                                                                */
  TM_OutputStructInit(&OutInit);
  OutInit.Channel = TM_CH_3;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = 5000;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* GPTM0 ETI active at rising edge                                                                        */
  TM_EtiConfig(HT_GPTM0, TM_ETIPSC_OFF, TM_ETIPOL_NONINVERTED, 0);

  /* Single Pulse Mode selection                                                                            */
  TM_SinglePulseModeCmd(HT_GPTM0, ENABLE);

  /* Slave Trigger Input selection                                                                          */
  TM_StiConfig(HT_GPTM0, TM_TRSEL_ETIF);

  /* Slave Mode selection: Trigger Mode                                                                     */
  TM_SlaveModeConfig(HT_GPTM0, TM_SMSEL_TRIGGER);

  while (1);
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
