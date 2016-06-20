/*********************************************************************************************************//**
 * @file    GPTM/SinglePulseMode/main.c
 * @version $Rev:: 942          $
 * @date    $Date:: 2015-09-19 #$
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

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
  *  - Enable peripheral clock of AFIO, GPIOA, GPIOD.
  *  - Config AFIO mode as GT0_ETI and GT0_CH3 function.
  *  - Enable peripheral clock of GPTM0.
  *  - GPTM0 Time base configuration:
  *     - GPTM0_PCLK = 72 MHz
  *     - Prescaler = 1
  *     - CounterReload = 65535
  *     - GPTM0_CounterClock = (GPTM0_PCLK / (Prescaler + 1)) = 36 MHz
  *  - GPTM0 single pulse mode configuration:
  *    - The external signal is connected to GT0_ETI pin,
  *    - The rising edge is used as active edge,
  *    - The Single Pulse signal is output on GT0_CH3 pin
  *    - The CounterReload value is 65535 , so the maximum
  *       frequency value to trigger the GPTM0 input is 36MHz/65536= 550 Hz.
  *    - The Compare value decides the delay value, the delay value is fixed to 455.08 us:
  *      delay =  Compare / GPTM0_CounterClock = 455.08 us.
  *    - The (CounterReload - Compare + 1) value decides the Single Pulse value,
  *      the pulse value is fixed to 1.365ms:
  *      Single Pulse value = (CounterReload - Compare + 1)/GPTM0_CounterClock = 1.365 ms.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  GPTM_TimeBaseInitTypeDef TimeBaseInit;
  GPTM_OutputInitTypeDef OutInit;

  /* Enable peripheral clock of AFIO, GPIOD                                                                 */
  CKCUClock.Bit.PA         = 1;
  CKCUClock.Bit.PD         = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as GT0_ETI and GT0_CH3 function.                                                      */
  AFIO_GPDConfig(AFIO_PIN_6, AFIO_MODE_4);  //Joystick UP
  AFIO_GPAConfig(AFIO_PIN_7, AFIO_MODE_4);

  /* Time base configuration                                                                                */
  GPTM_TimeBaseStructInit(&TimeBaseInit);
  TimeBaseInit.CounterMode = GPTM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 65535;
  TimeBaseInit.Prescaler = 1;
  TimeBaseInit.PSCReloadTime = GPTM_PSC_RLD_IMMEDIATE;
  GPTM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  /* GPTM0 PWM2 Mode configuration: Channel3                                                                */
  GPTM_OutputStructInit(&OutInit);
  OutInit.Channel = GPTM_CH_3;
  OutInit.OutputMode = GPTM_OM_PWM2;
  OutInit.Control = GPTM_CHCTL_ENABLE;
  OutInit.Polarity = GPTM_CHP_NONINVERTED;
  OutInit.Compare = 16383;
  GPTM_OutputInit(HT_GPTM0, &OutInit);

  /* GPTM0 ETI active at rising edge                                                                        */
  GPTM_EtiConfig(HT_GPTM0, GPTM_ETIPSC_OFF, GPTM_ETIPOL_NONINVERTED, 0);

  /* Single Pulse Mode selection                                                                            */
  GPTM_SinglePulseModeCmd(HT_GPTM0, ENABLE);

  /* Slave Trigger Input selection                                                                          */
  GPTM_StiConfig(HT_GPTM0, GPTM_TRSEL_ETIF);

  /* Slave Mode selection: Trigger Mode                                                                     */
  GPTM_SlaveModeConfig(HT_GPTM0, GPTM_SMSEL_TRIGGER);

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
