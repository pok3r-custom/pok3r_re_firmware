/*********************************************************************************************************//**
 * @file    PWRCU/DeepSleepMode1/main.c
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup PWRCU_Examples PWRCU
  * @{
  */

/** @addtogroup DeepSleepMode1
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/

/* Set DISABLE_DEBUG_PIN as 1 to disable SWD debug pins as input floating. It is meaningful for measure     */
/* more accurate power consumption since those GPIOs are used as the debug port by default.                 */
/* Refer to the readme.txt for how to re-download the code after SWD debug pin have been disabled.          */
#define DISABLE_DEBUG_PIN       (0)

/* Private variables ---------------------------------------------------------------------------------------*/
extern vu32 wTimingDelay;

/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);
void EXTI_Configuration(void);
void SysTick_Configuration(void);
void Delay(u32 nTime);

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
  *   - Initialize LEDs.
  *   - Configure RTC clock source and prescaler.
  *   - Configure EXTI channel used to wakeup Deep Sleep Mode 1.
  *   - Configure the SysTick to generate an interrupt per millisecond.
  *   - Turn on LED1.
  *   - Wait for pressing KEY1 to enter the infinite loop.
  *   - In the infinite loop:
  *     - Insert 0.5 second delay.
  *     - Check the KEY1 button.
  *     - Wait till RTC count occurs.
  *     - Compare Match in 3 second.
  *     - Turn off LED1.
  *     - Configure button EXTI Channel on low level.
  *     - Request to enter Deep Sleep mode 1 (The LDO in low power mode).
  *     - Turn on LED1 when the system has resumed from Deep Sleep mode 1.
  *
  ***********************************************************************************************************/
int main(void)
{
  u32 wRtcCounterTmp = 0;

  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Configure RTC clock source and prescaler                                                               */
  RTC_Configuration();

  /* Configure EXTI channel (KEY1) used to wakeup Deep Sleep Mode 1                                         */
  EXTI_Configuration();

  /* Configure the SysTick to generate an interrupt per millisecond                                         */
  SysTick_Configuration();

  /* Turn on LED1                                                                                           */
  HT32F_DVB_LEDOn(HT_LED1);

  /* Set DISABLE_DEBUG_PIN as 1 to disable SWD debug pins as input floating. It is meaningful for measure   */
  /* more accurate power consumption since those GPIOs are used as the debug port by default.               */
  /* Refer to the readme.txt for how to re-download the code after SWD debug pin have been disabled.        */
#if (DISABLE_DEBUG_PIN == 1)
{
  /* Configure debug port GPIO pins to input floating                                                       */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.PA         = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_11 | AFIO_PIN_12 | AFIO_PIN_13, AFIO_MODE_1);
  GPIO_PullResistorConfig(HT_GPIOA, GPIO_PIN_11 | GPIO_PIN_12 | GPIO_PIN_13, GPIO_PR_DISABLE);
}
#endif

  /* Check KEY1 button. If pressed, enter the infinite loop                                                 */
  while (HT32F_DVB_PBGetState(BUTTON_KEY1) == 0x1);

  /* Infinite loop                                                                                          */
  while (1)
  {
    /* Insert 0.5 second delay                                                                              */
    Delay(500);

    /* Check the KEY1 button to prevent EXTI from waking the system up continuously.                        */
    while (HT32F_DVB_PBGetState(BUTTON_KEY1) == 0x0);

    /* Wait till RTC count occurs                                                                           */
    wRtcCounterTmp = RTC_GetCounter();
    while (RTC_GetCounter() == wRtcCounterTmp);

    /* Compare Match in 3 second                                                                            */
    RTC_SetCompare(RTC_GetCounter()+ 3);

    /* Configure button EXTI Channel on low level                                                           */
    EXTI_WakeupEventConfig(KEY1_BUTTON_EXTI_CHANNEL, EXTI_WAKEUP_LOW_LEVEL, ENABLE);

    /* Turn off LED1                                                                                        */
    HT32F_DVB_LEDOff(HT_LED1);
    HT32F_DVB_LEDOff(HT_LED2);
    HT32F_DVB_LEDOff(HT_LED3);

    /* Request to enter Deep Sleep mode 1 (The LDO in low power mode)                                       */
    PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_WFI);

    /* Turn on LED1 when the system has resumed from Deep Sleep mode 1                                      */
    HT32F_DVB_LEDOn(HT_LED1);
  }
}

/*********************************************************************************************************//**
  * @brief  Configures the SysTick to generate an interrupt each 1 millisecond.
  * @retval None
  ***********************************************************************************************************/
void SysTick_Configuration(void)
{
  /* Setup SysTick Timer for 1 msec interrupts                                                              */
  if (SysTick_Config(SystemCoreClock / 1000))
  {
    /* Capture error                                                                                        */
    while (1);
  }
  /* Set SysTick Priority to 3                                                                              */
  NVIC_SetPriority(SysTick_IRQn, 0x3);
}

/*********************************************************************************************************//**
  * @brief  Configures EXTI channel used to wakeup Deep Sleep Mode 1.
  * @retval None
  * @details The EXTI configuration as following:
  *   - Enable the EXTI and AFIO Clock.
  *   - Configure KEY1 button pin as input floating.
  *   - Connect KEY1 Button EXTI Channel to KEY1 Button GPIO Pin.
  *   - Enable and set EXTI Event Wakeup interrupt to the lowest priority.
  *
  ***********************************************************************************************************/
void EXTI_Configuration(void)
{
  /* Enable the AFIO and button GPIO Clock                                                                  */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO         = 1;
  CKCUClock.Bit.EXTI         = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure Button pin as input floating                                                                 */
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_GPIO);

  /* Connect Button EXTI Channel to Button GPIO Pin                                                         */
  AFIO_EXTISourceConfig((AFIO_EXTI_CH_Enum)KEY1_BUTTON_EXTI_CHANNEL, (AFIO_ESS_Enum)KEY1_BUTTON_GPIO_ID);

  /* Enable and set EXTI Event Wakeup interrupt to the lowest priority                                      */
  NVIC_SetPriority(EVWUP_IRQn, 0xF);
  NVIC_EnableIRQ(EVWUP_IRQn);
  EXTI_WakeupEventIntConfig(ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configures RTC clock source and prescaler.
  * @retval None
  * @details The RTC configuration as following:
  *   - Check the backup domain(RTC & PWRCU) is ready for access.
  *   - Reset Backup Domain.
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
  /* Check the backup domain(RTC & PWRCU) is ready for access                                               */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.BKP          = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }

  /* Reset Backup Domain                                                                                    */
  PWRCU_DeInit();

  /* Check LSE Status                                                                                       */
  if(GetBit_BB((u32)(&HT_CKCU->GCSR), 4))
  {
    /* Enable the LSE OSC                                                                                   */
    RTC_LSESMConfig(RTC_LSESM_NORMAL);
    RTC_LSECmd(ENABLE);
    /* Wait till LSE is ready                                                                               */
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

/*********************************************************************************************************//**
  * @brief  Inserts a delay time.
  * @param  nTime: specifies the delay time length, in milliseconds.
  * @retval None
  ***********************************************************************************************************/
void Delay(u32 nTime)
{
  wTimingDelay = nTime;

  while (wTimingDelay != 0);

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
