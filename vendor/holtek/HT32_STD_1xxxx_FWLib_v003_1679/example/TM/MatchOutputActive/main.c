/*********************************************************************************************************//**
 * @file    TM/MatchOutputActive/main.c
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

/** @addtogroup MatchOutputActive
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
  *  - Configure KEY1 used to start GPTM.
  *  - Enable peripheral's clock of AFIO and GPTM.
  *  - Configure AFIO mode as GT0_CH3 function.
  *  - GPTM0 Time base configuration:
  *     - GPTM0_PCLK = 72 MHz or 96 MHz
  *     - Prescaler = 9
  *     - CounterReload = 65535
  *     - GPTM0_CounterClock = (GPTM0_PCLK / (Prescaler + 1))
  *  - Force channel output reference to inactive level.
  *  - GPTM0 Match Output Active Mode configuration: Channel3.
  *  - Waits for KEY1 is pressed to start GPTM.
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
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure AFIO mode as GT0_CH3 function.                                                               */
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_7, AFIO_MODE_4);

  /* Time base configuration                                                                                */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 65535;
  TimeBaseInit.Prescaler = 9;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  /* Force channel output reference to inactive level                                                       */
  TM_OutputModeConfig(HT_GPTM0, TM_CH_3, TM_OM_FORCED_INACTIVE);

  /* GPTM0 Match Output Active Mode configuration: Channel3                                                 */
  OutInit.Channel = TM_CH_3;
  OutInit.OutputMode = TM_OM_MATCH_ACTIVE;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = HTCFG_MATCH_OUTPUT_COMPARE;
  TM_OutputInit(HT_GPTM0, &OutInit);

  /* Waits for KEY1 is pressed to start GPTM                                                                */
  while (HT32F_DVB_PBGetState(BUTTON_KEY1));
  TM_Cmd(HT_GPTM0, ENABLE);

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
