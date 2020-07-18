/*********************************************************************************************************//**
 * @file    CMP_OP/CancellationAndInterrupt/main.c
 * @version $Rev:: 175          $
 * @date    $Date:: 2017-06-16 #$
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

/** @addtogroup CMP_OP_Examples CMP_OP
  * @{
  */

/** @addtogroup CancellationAndInterrupt
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void GPTM_Configuration(void);
void DelayMS(u32 ms);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 offsetVoltageCancellation;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable AFIO, OPA0 and GPTM0 PCLK                                                                       */
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCUClock.Bit.OPA0       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  GPTM_Configuration();               /* GPTM configuration                                                 */
  HT32F_DVB_LEDInit(HT_LED1);

  /* Config CMP_OP0 pins function                                                                           */
  AFIO_GPxConfig(GPIO_PB, AFIO_PIN_6 | AFIO_PIN_7 | AFIO_PIN_8, AFIO_MODE_3);

  /**********************************************
   * An example for cancelation procedure
   *********************************************/
  CMP_OP_DeInit(HT_CMP_OP0);
  CMP_OP_CancellationModeConfig(HT_CMP_OP0, CMP_OP_NEGATIVE_INPUT);
  CMP_OP_Cmd(HT_CMP_OP0, ENABLE);

  for (offsetVoltageCancellation = 0; offsetVoltageCancellation < 64; offsetVoltageCancellation++)
  {
    CMP_OP_SetCancellationVaule(HT_CMP_OP0, offsetVoltageCancellation);
    DelayMS(1);
    if (CMP_OP_GetOutputStatus(HT_CMP_OP0))
    {
      break;
    }
  }
  if (offsetVoltageCancellation == 64)
  {
    offsetVoltageCancellation--;
  }

  /**********************************************
   * An example for Comparator interrupt
   *********************************************/
  CMP_OP_Config(HT_CMP_OP0, CMP_MODE, offsetVoltageCancellation);
  CMP_OP_Cmd(HT_CMP_OP0, ENABLE);

  /* Waits for stable                                                                                       */
  DelayMS(1);

  /* Enable CMP_OP0 interrupt                                                                               */
  NVIC_EnableIRQ(COMP_IRQn);
  CMP_OP_IntConfig(HT_CMP_OP0, CMP_OP_INT_FALLING | CMP_OP_INT_RISING, ENABLE);

  while (1)                           /* Infinite loop                                                      */
  {
  }
}

/*********************************************************************************************************//**
  * @brief  Used to delay x ms.
  * @retval None
  ***********************************************************************************************************/
void DelayMS(u32 ms)
{
  TM_SetCounter(HT_GPTM0, 0);

  while (ms--)
  {
    TM_ClearFlag(HT_GPTM0, TM_FLAG_UEV);
    while (!TM_GetFlagStatus(HT_GPTM0, TM_FLAG_UEV));
  }
}

/*********************************************************************************************************//**
  * @brief  Configures GPTM0 for time estimate.
  * @retval None
  ***********************************************************************************************************/
void GPTM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;

  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = SystemCoreClock / (1000 * 2);
  TimeBaseInit.Prescaler = 1;
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);
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
