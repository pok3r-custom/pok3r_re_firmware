/*********************************************************************************************************//**
 * @file    EXTI/WakeUp_DeepSleepMode1/main.c
 * @version $Rev:: 3957         $
 * @date    $Date:: 2019-06-04 #$
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

/** @addtogroup WakeUp_DeepSleepMode1
  * @{
  */

/* Settings ------------------------------------------------------------------------------------------------*/
#define LOWPOWER_MODE_WFI                        (1)

/* Private function prototypes -----------------------------------------------------------------------------*/
void LowPower_EXTI_Configuration(void);
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

  LowPower_EXTI_Configuration();

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);
  HT32F_DVB_LEDOn(HT_LED1);
  HT32F_DVB_LEDOn(HT_LED2);
  HT32F_DVB_LEDOn(HT_LED3);

  while (1)
  {
    for (i = 0; i < 40000000; i++){};

    // If the wakeup souce is active, skip the low power mode.
    if (GPIO_ReadInBit(HT_GPIOB, GPIO_PIN_12) == SET)
    {
      continue;
    }

    HT32F_DVB_LEDOff(HT_LED1);
    HT32F_DVB_LEDOff(HT_LED2);
    HT32F_DVB_LEDOff(HT_LED3);

    // You shall make sure the wakeup souce is inactive before enter the low power mode.
    LowPower_Enter();
    printf("main LOOP!\r\n");

    HT32F_DVB_LEDOn(HT_LED3);
  }
}

/*********************************************************************************************************//**
  * @brief  EXTI Wakeup configuration.
  * @retval None
  ***********************************************************************************************************/
void LowPower_EXTI_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable EXTI & GPIO IP clock                                                                            */
  CKCUClock.Bit.PB         = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure GPIO pull down, AFIO mode, and Input Enable                                                  */
  AFIO_GPxConfig(GPIO_PB, AFIO_PIN_12, AFIO_MODE_1);
  GPIO_PullResistorConfig(HT_GPIOB, GPIO_PIN_12, GPIO_PR_DOWN);
  GPIO_InputConfig(HT_GPIOB, GPIO_PIN_12, ENABLE);

  /* Select Port as EXTI Trigger Source                                                                     */
  AFIO_EXTISourceConfig(AFIO_EXTI_CH_12, AFIO_ESS_PB);

  /* EXTI Event Related Configuration                                                                       */
  EXTI_WakeupEventConfig(EXTI_CHANNEL_12, EXTI_WAKEUP_HIGH_LEVEL, ENABLE);

  #if (LOWPOWER_MODE_WFI == 1)
  /* Configure Event Wake Up Interrupt Channel                                                              */
  NVIC_EnableIRQ(EVWUP_IRQn);
  #endif
}

/*********************************************************************************************************//**
  * @brief  Enter low power mode.
  * @retval None
  ***********************************************************************************************************/
void LowPower_Enter(void)
{
  EXTI_ClearWakeupFlag(EXTI_CHANNEL_12);

  #if (LOWPOWER_MODE_WFI == 1)
  EXTI_WakeupEventIntConfig(ENABLE);
  PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_WFI); // WFI: wakeup by interrupt only
  #else
  PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_WFE); // WFE: wakeup by interrupt or EXTI event
  #endif
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
