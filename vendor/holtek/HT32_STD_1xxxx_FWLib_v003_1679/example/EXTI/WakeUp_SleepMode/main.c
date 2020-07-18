/*********************************************************************************************************//**
 * @file    EXTI/WakeUp_SleepMode/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EXTI_Examples EXTI
  * @{
  */

/** @addtogroup WakeUp_SleepMode
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
  EXTI_InitTypeDef EXTI_InitStruct;

  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Turn on LEDs                                                                                           */
  HT32F_DVB_LEDOn(HT_LED1);
  HT32F_DVB_LEDOn(HT_LED2);
  HT32F_DVB_LEDOn(HT_LED3);

  /* Enable the AFIO, GPIO and EXTI Clock                                                                   */
  CKCUClock.Bit.PC         = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure WAKEUP button as input enable                                                                */
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_15, AFIO_MODE_1);
  GPIO_InputConfig(HT_GPIOC, GPIO_PIN_15, ENABLE);

  /* Configure EXTI channel n on rising edge                                                                */
  EXTI_InitStruct.EXTI_Channel = EXTI_CHANNEL_15;
  EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_DISABLE;
  EXTI_InitStruct.EXTI_DebounceCnt = 0;  /* 28bits counter, 0x0 ~ 0x0FFF_FFFF                               */
  EXTI_InitStruct.EXTI_IntType = EXTI_POSITIVE_EDGE;
  EXTI_Init(&EXTI_InitStruct);

  /* Connect EXTI Channel n to GPIO Port                                                                    */
  AFIO_EXTISourceConfig(AFIO_EXTI_CH_15, AFIO_ESS_PC);

  /* Enable EXTI channel n interrupt                                                                        */
  EXTI_IntConfig(EXTI_CHANNEL_15, ENABLE);
  NVIC_EnableIRQ(EXTI15_IRQn);

  /* Enter sleep mode & Wait For Interrupt                                                                  */
  __WFI();

  /* Configure SysTick in order to toggle LEDs                                                              */
  SysTick_Config(0xFFFFFF);

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
