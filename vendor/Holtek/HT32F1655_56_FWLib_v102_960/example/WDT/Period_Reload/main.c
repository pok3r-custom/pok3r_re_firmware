/*********************************************************************************************************//**
 * @file    WDT/Period_Reload/main.c
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

/** @addtogroup WDT_Examples WDT
  * @{
  */

/** @addtogroup Period_Reload
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

  /*----------------------------- SYSTICK configuration ----------------------------------------------------*/
  SYSTICK_ClockSourceConfig(SYSTICK_SRC_STCLK); // Default: 9MHz on chip
  SYSTICK_SetReloadValue(900000);               // (900k/9MHz) = 100ms on chip
  SYSTICK_IntConfig(ENABLE);                    // Enable SysTick Interrupt

  /* Enable WDT NVIC Interrupt Channel                                                                      */
  NVIC_EnableIRQ(WDT_IRQn);

  /* Enable WDT APB clock                                                                                   */
  CKCUClock.Bit.WDT = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /*----------------------------- WatchDog configuration ---------------------------------------------------*/
  WDT_IntConfig(ENABLE);             // Enable WDT Interrupt
  WDT_SetPrescaler(WDT_PRESCALER_4); // Set Prescaler Value as 2
  WDT_SetReloadValue(0xEFF);         // Set Reload Value as 0xEFF
  WDT_SetDeltaValue(0xEFF);          // Set Delta Value as 0xA00
  WDT_Cmd(ENABLE);

  WDT_Restart();                     // Reload Counter as WDTV Value
  //WDT_ProtectCmd(ENABLE);            // Enable Protection


  /* Enable SYSTICK Counter                                                                                 */
  SYSTICK_CounterCmd(SYSTICK_COUNTER_ENABLE);
  WDT_Restart();

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
