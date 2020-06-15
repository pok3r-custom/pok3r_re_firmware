/*********************************************************************************************************//**
 * @file    EXTI/Software_Trigger/main.c
 * @version $Rev:: 151          $
 * @date    $Date:: 2017-06-14 #$
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

/** @addtogroup EXTI_Examples EXTI
  * @{
  */

/** @addtogroup Software_Trigger
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Enable EXTI & PE APB clock                                                                             */
  HTCFG_EXTI_CK(CKCUClock)         = 1;
  CKCUClock.Bit.AFIO               = 1;
  CKCUClock.Bit.EXTI               = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Enable GPIO Input Function                                                                             */
  GPIO_InputConfig(HTCFG_EXTI_GPIO_PORT, HTCFG_EXTI_GPIO_PIN, ENABLE);

  /* Select Port as EXTI Trigger Source                                                                     */
  AFIO_EXTISourceConfig(HTCFG_EXTI_AFIO_CH, HTCFG_EXTI_ESS);

  /* Enable EXTI_CHANNEL NVIC Interrupt Channel                                                             */
  NVIC_EnableIRQ(HTCFG_EXIT_IRQn);

  /* Enable EXTI line Interrupt                                                                             */
  EXTI_IntConfig(HTCFG_EXTI_CH, ENABLE);

  /* Activate the corresponding EXTI interrupt                                                              */
  EXTI_SWIntCmd(HTCFG_EXTI_CH, ENABLE);

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
