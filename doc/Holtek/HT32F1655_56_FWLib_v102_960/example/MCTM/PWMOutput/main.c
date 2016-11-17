/*********************************************************************************************************//**
 * @file    MCTM/PWMOutput/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
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

/** @addtogroup MCTM_Examples MCTM
  * @{
  */

/** @addtogroup PWMOutput
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define BEE_NBR           4                     /*!< Number of bee after reset                              */
#define BEE_FREQ          3000                  /*!< Frequency of bee                                       */
#define BEE_ACTIVE_TIME   (BEE_FREQ * 5) / 100  /*!< Active 50mS per bee cycle                              */
#define BEE_INACTIVE_TIME (BEE_FREQ * 5) / 100  /*!< Inactive 50mS per bee cycle                            */

/* Private variables ---------------------------------------------------------------------------------------*/
__IO uint32_t wMctmUpdateDownCounter = 0;   /*!< Used to save the numbers of Update Event occurred of MCTM1 */

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
  *  - Configure the BUZZER_GPIO_PIN as MCTM channel output AFIO function.
  *  - Compute CRR and PSCR value used for generate BEE_FREQ frequency.
  *  - Enable PCLK of BUZZER MCTM.
  *  - Init BUZZER MCTM time-base to generate BEE_FREQ frequency.
  *  - Clear Update Event Interrupt flag caused by S/W generate update event
  *    to reload prescaler immediately.
  *  - Init BUZZER MCTM Channel to output PWM waveform with 33% duty.
  *  - Enable interrupt of BUZZER MCTM update event.
  *    - The wMctmUpdateDownCounter will decrease one until it reach zero
  *      in MCTM1UP_IRQHandler.
  *  - Enable BUZZER MCTM.
  *  - Output Bee voice after reset.
  *
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  MCTM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
  MCTM_OutputInitTypeDef MCTM_OutputInitStructure;
  uint32_t wCRR = 0, wPSCR = 0, wBeeIndex = 0;

  /* Enable PCLK of BUZZER and AFIO                                                                         */
  BUZZER_TM_CLK(CKCUClock) = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure the BUZZER_GPIO_PIN as MCTM channel output AFIO function                                     */
  HT32F_DVB_GPxConfig(BUZZER_GPIO_ID, BUZZER_AFIO_PIN, BUZZER_AFIO_MODE);

  /* Compute CRR and PSCR value                                                                             */
  wCRR = (SystemCoreClock / BEE_FREQ) - 1;
  while ((wCRR / (wPSCR + 1)) > 0xFFFF)
  {
    wPSCR++;
  }
  wCRR = wCRR / (wPSCR + 1);

  /* Init BUZZER MCTM time-base                                                                             */
  MCTM_TimeBaseInitStructure.CounterReload = wCRR;
  MCTM_TimeBaseInitStructure.Prescaler = wPSCR;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 0;
  MCTM_TimeBaseInitStructure.CounterMode = MCTM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = MCTM_PSC_RLD_IMMEDIATE;
  MCTM_TimeBaseInit(BUZZER_TM, &MCTM_TimeBaseInitStructure);

  /* Clear Update Event Interrupt flag                                                                      */
  MCTM_ClearFlag(BUZZER_TM, MCTM_FLAG_UEV1);

  /* Init BUZZER MCTM Channel x to output PWM waveform with 33% duty                                        */
  MCTM_OutputInitStructure.Channel = BUZZER_TM_CHANNEL;
  MCTM_OutputInitStructure.OutputMode = MCTM_OM_PWM2;
  MCTM_OutputInitStructure.Control = MCTM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = MCTM_CHCTL_DISABLE;//MCTM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.Polarity = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = ((wCRR + 1) * (100 - 33)) / 100;
  MCTM_OutputInit(BUZZER_TM, &MCTM_OutputInitStructure);


  /* Enable interrupt of BUZZER MCTM update event                                                           */
  NVIC_EnableIRQ(BUZZER_IRQn);
  MCTM_IntConfig(BUZZER_TM, MCTM_INT_UEV1, ENABLE);

  /* BUZZER MCTM Channel Main Output enable                                                                 */
  MCTM_CHMOECmd(BUZZER_TM, ENABLE);
  /* BUZZER MCTM counter enable                                                                             */
  MCTM_Cmd(BUZZER_TM, ENABLE);

  /* Output Bee voice after reset                                                                           */
  for (wBeeIndex = 0; wBeeIndex < BEE_NBR; wBeeIndex++)
  {
    MCTM_ChannelConfig(BUZZER_TM, BUZZER_TM_CHANNEL, MCTM_CHCTL_ENABLE);
    wMctmUpdateDownCounter = BEE_ACTIVE_TIME;
    while (wMctmUpdateDownCounter);

    MCTM_ChannelConfig(BUZZER_TM, BUZZER_TM_CHANNEL, MCTM_CHCTL_DISABLE);
    wMctmUpdateDownCounter = BEE_INACTIVE_TIME;
    while (wMctmUpdateDownCounter);
  }

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
