/*********************************************************************************************************//**
 * @file    PWRCU/PowerDownMode/main.c
 * @version $Rev:: 953          $
 * @date    $Date:: 2017-12-11 #$
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

/** @addtogroup PWRCU_Examples PWRCU
  * @{
  */

/** @addtogroup PowerDownMode
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);
void SysTick_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting is already configured,
  *       this is done through SystemInit() function which is called from startup
  *       file (startup_ht32fxxxx.s) before branching to application main.
  *       To reconfigure the default setting of SystemInit() function, refer to
  *       system_ht32fxxxx.c file
  * @details The main program as following:
  *   - Initialize LEDs and turn on LED1.
  *   - Check the backup domain(RTC & PWRCU) is ready for access.
  *   - Enable and set EXTI Event Wakeup interrupt to the lowest priority.
  *   - If backup domain power reset : Configure RTC clock source and prescaler.
  *   - Configure KEY1 pin used to Enter Power Down Mode.
  *   - Configure the SysTick to generate an interrupt each 250 millisecond.
  *   - Infinite loop do nothing.
  *
  ***********************************************************************************************************/
int main(void)
{
  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Turn on LED1                                                                                           */
  HT32F_DVB_LEDOn(HT_LED1);

  /* Check the backup domain(RTC & PWRCU) is ready for access                                               */
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.BKP = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }
  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }

  /* Enable and set EXTI Event Wakeup interrupt to the lowest priority                                      */
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.EXTI = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  NVIC_SetPriority(EVWUP_IRQn, 0xF);
  EXTI_WakeupEventIntConfig(ENABLE);
  NVIC_EnableIRQ(EVWUP_IRQn);

  /* If backup domain power reset : Configure RTC clock source and prescaler                                */
  if (PWRCU_GetFlagStatus() == PWRCU_FLAG_BAKPOR)
  {
    RTC_Configuration();
  }

  /* Configure the SysTick to generate an interrupt every 250 millisecond                                   */
  SysTick_Configuration();

  /* Configure KEY1 pin used to Enter Power Down Mode                                                       */
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_EXTI);

  /* Infinite loop                                                                                          */
  while (1)
  {
  }
}

/*********************************************************************************************************//**
  * @brief  Configures the SysTick to generate an interrupt every 250 millisecond.
  * @retval None
  ***********************************************************************************************************/
void SysTick_Configuration(void)
{
  /* Setup SysTick Timer for 250 msec interrupts                                                            */
  SYSTICK_ClockSourceConfig(SYSTICK_SRC_STCLK);
  if (SysTick_Config((SystemCoreClock / 8) / 4))
  {
    /* Capture error                                                                                        */
    while (1);
  }
  /* Set SysTick Priority to 2                                                                              */
  NVIC_SetPriority(SysTick_IRQn, 0x2);
}

/*********************************************************************************************************//**
  * @brief  Configures RTC clock source and prescaler.
  * @retval None
  * @details The RTC configuration as following:
  *   - Enable the LSE OSC and wait till LSE is ready.
  *   - Select the RTC Clock Source as LSE.
  *   - Set the RTC time base to 1 second.
  *   - Set Compare value.
  *   - Enable the RTC.
  *   - Enable the RTC Compare Match wakeup event.
  *
  ***********************************************************************************************************/
void RTC_Configuration(void)
{
  /* Check LSE Status                                                                                       */
  if(GetBit_BB((u32)(&HT_CKCU->GCSR), 4))
  {
    /* Configure Low Speed External clock (LSE)                                                             */
    RTC_LSESMConfig(RTC_LSESM_NORMAL);
    RTC_LSECmd(ENABLE);
    /* Wait till LSI is ready                                                                               */
    while (CKCU_GetClockReadyStatus(CKCU_FLAG_LSERDY) == RESET);
    /* Select the RTC Clock Source as LSE                                                                   */
    RTC_ClockSourceConfig(RTC_SRC_LSE);
  }
  else
  {
    /* Select the RTC Clock Source as LSI                                                                   */
    RTC_ClockSourceConfig(RTC_SRC_LSI);
  }

  /* Set the RTC time base to 1s                                                                            */
  RTC_SetPrescaler(RTC_RPRE_32768);

  /* Set Compare value                                                                                      */
  RTC_SetCompare(0xFFFFFFFF);

  /* Enable the RTC                                                                                         */
  RTC_Cmd(ENABLE);

  /* Enable the RTC Compare Match wakeup event                                                              */
  RTC_WakeupConfig(RTC_WAKEUP_CM, ENABLE);
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
