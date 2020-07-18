/*********************************************************************************************************//**
 * @file    PWRCU/PowerDown_RTC/main.c
 * @version $Rev:: 3958         $
 * @date    $Date:: 2019-06-05 #$
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

/** @addtogroup PowerDown_RTC
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);
void LowPower_BootCheck(void);
void LowPower_RTC_Configuration(void);
void LowPower_Enter(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i;

  RETARGET_Configuration();

  LowPower_BootCheck();
  LowPower_RTC_Configuration();

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);
  HT32F_DVB_LEDOn(HT_LED1);
  HT32F_DVB_LEDOn(HT_LED2);
  HT32F_DVB_LEDOn(HT_LED3);

  while (1)
  {
    for (i = 0; i < 40000000; i++){};

    HT32F_DVB_LEDOff(HT_LED1);
    HT32F_DVB_LEDOff(HT_LED2);
    HT32F_DVB_LEDOff(HT_LED3);

    LowPower_Enter();

    // Never reacher here. Since the system will be restart when wakeup from the Power Down mode.

  }
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
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable EXTI & GPIO IP clock                                                                            */
  CKCUClock.Bit.BKP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  #if 0
  /* Enable the LSE OSC                                                                                     */
  RTC_LSESMConfig(RTC_LSESM_NORMAL);
  RTC_LSECmd(ENABLE);
  /* Wait till LSE is ready                                                                                 */
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_LSERDY) == RESET);

  /* Select the RTC Clock Source as LSE                                                                     */
  RTC_ClockSourceConfig(RTC_SRC_LSE);
  #else
  /* Select the RTC Clock Source as LSI                                                                     */
  RTC_ClockSourceConfig(RTC_SRC_LSI);
  #endif

  /* Set the RTC time base to 1s                                                                            */
  RTC_SetPrescaler(RTC_RPRE_32768);

  /* Set Compare value                                                                                      */
  RTC_SetCompare(0xFFFFFFFF);

  /* Enable the RTC                                                                                         */
  RTC_Cmd(ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Related checking when bootup.
  * @retval None
  ***********************************************************************************************************/
void LowPower_BootCheck(void)
{
  u32 uBAKSR;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  CKCUClock.Bit.BKP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  uBAKSR = PWRCU_GetFlagStatus();

  if (uBAKSR & PWRCU_FLAG_PWRPOR)
  {
    /* Configure RTC one time when power-on                                                                 */
    RTC_Configuration();
  }

  if (uBAKSR & PWRCU_FLAG_PD)
  {
    u32 uRTCSR = RTC_GetFlagStatus();
    if (uRTCSR & RTC_FLAG_CM)
    {
      // Means wakeup by RTC, do your own process here
      printf("WAKEUP!\r\n");
    }
  }

  /*
  // Since the flags read by PWRCU_GetFlagStatus() are read clear, you must check all the flag here
  if (uBAKSR & PWRCU_FLAG_XXXX)
  {

  }
  */

}

/*********************************************************************************************************//**
  * @brief  EXTI Wakeup configuration.
  * @retval None
  ***********************************************************************************************************/
void LowPower_RTC_Configuration(void)
{
  /* Enable the RTC Compare Match wakeup event                                                              */
  RTC_WakeupConfig(RTC_WAKEUP_CM, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Enter low power mode.
  * @retval None
  ***********************************************************************************************************/
void LowPower_Enter(void)
{
  /* Compare Match in 3 second                                                                              */
  RTC_SetCompare(RTC_GetCounter() + 3);

  PWRCU_PowerDown();
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
