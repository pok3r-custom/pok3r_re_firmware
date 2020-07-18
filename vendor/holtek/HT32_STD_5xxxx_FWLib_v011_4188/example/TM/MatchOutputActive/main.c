/*********************************************************************************************************//**
 * @file    TM/MatchOutputActive/main.c
 * @version $Rev:: 2247         $
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
  *  - Configure KEY1 used to start SCTM/GPTM.
  *  - Enable peripheral's clock of AFIO and SCTM/GPTM.
  *  - Configure AFIO mode as GT0_CH3 function.
  *  - GPTM0 Time base configuration:
  *     - PCLK = 40 , 48 or 60 MHz
  *     - Prescaler = 9
  *     - CounterReload = 65535
  *     - CounterClock = (PCLK / (Prescaler + 1))
  *  - Force channel output reference to inactive level.
  *  - SCTM/GPTM Match Output Active Mode configuration: Channel0.
  *  - Waits for KEY1 is pressed to start SCTM/GPTM.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;

  /* Configure KEY1 used to start SCTM/GPTM                                                                      */
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_GPIO);

  /* Enable peripheral's clock of AFIO and SCTM/GPTM                                                             */
  CKCUClock.Bit.AFIO       = 1;
  HTCFG_MATCH_OUTPUT_BY_SCTM_CLK(CKCUClock) = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure AFIO mode as ST_CH/GT_CH function.                                                               */
  AFIO_GPxConfig(HTCFG_MATCH_OUTPUT_BY_SCTM_GPIO_ID,
                 HTCFG_MATCH_OUTPUT_BY_SCTM_AFIO_PIN,
                 HTCFG_MATCH_OUTPUT_BY_AFIO_MODE);

  /* Time base configuration                                                                                */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 65535;
  TimeBaseInit.Prescaler = 9;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HTCFG_MATCH_OUTPUT_BY_SCTM, &TimeBaseInit);

  /* Force channel output reference to inactive level                                                       */
  TM_OutputModeConfig(HTCFG_MATCH_OUTPUT_BY_SCTM,
                      HTCFG_MATCH_OUTPUT_BY_SCTM_CHANNEL,
                      TM_OM_FORCED_INACTIVE);

  /* GPTM0 Match Output Active Mode configuration: Channe l3                                                 */
  OutInit.Channel = HTCFG_MATCH_OUTPUT_BY_SCTM_CHANNEL;
  OutInit.OutputMode = TM_OM_MATCH_ACTIVE;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = SystemCoreClock / 10000;
  TM_OutputInit(HTCFG_MATCH_OUTPUT_BY_SCTM, &OutInit);

  /* Waits for KEY1 is pressed to start SCTM/GPTM                                                                */
  while (HT32F_DVB_PBGetState(BUTTON_KEY1));
  TM_Cmd(HTCFG_MATCH_OUTPUT_BY_SCTM, ENABLE);

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
