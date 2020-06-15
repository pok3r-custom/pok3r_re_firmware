/*********************************************************************************************************//**
 * @file    EXTI/WakeUp_DeepSleepMode1/main.c
 * @version $Rev:: 1513         $
 * @date    $Date:: 2019-01-25 #$
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
#define ENABLE_EVWUP_INT_FOR_WFI                  (1)

/* Private function prototypes -----------------------------------------------------------------------------*/
void EXTI_WakeUp_Configuration(void);
void EnterLowPowerMode(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i;

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  EXTI_WakeUp_Configuration();

  while (1)
  {
    HT32F_DVB_LEDOff(HT_LED1);
    HT32F_DVB_LEDOff(HT_LED2);
    HT32F_DVB_LEDOff(HT_LED3);

    EnterLowPowerMode();

    HT32F_DVB_LEDOn(HT_LED3);

    for (i = 0; i < 80000000; i++){};
  }
}

/*********************************************************************************************************//**
  * @brief  Enter low power mode.
  * @retval None
  ***********************************************************************************************************/
void EnterLowPowerMode(void)
{
  EXTI_ClearWakeupFlag(EXTI_CHANNEL_15);

  #if (ENABLE_EVWUP_INT_FOR_WFI == 1)
  EXTI_WakeupEventIntConfig(ENABLE);
  #endif

  #if (ENABLE_EVWUP_INT_FOR_WFI == 1)
  PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_WFI); // WFI: wakeup by interrupt only
  #else
  PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_WFE); // WFE: wakeup by interrupt or EXTI event
  #endif
}

/*********************************************************************************************************//**
  * @brief  EXTI Wakeup configuration.
  * @retval None
  ***********************************************************************************************************/
void EXTI_WakeUp_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable EXTI & GPIO IP clock                                                                            */
  CKCUClock.Bit.PC         = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure GPIO pull down, AFIO mode, and Input Enable                                                  */
  GPIO_PullResistorConfig(HT_GPIOC, GPIO_PIN_15, GPIO_PR_DOWN);
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_15, AFIO_MODE_1);
  GPIO_InputConfig(HT_GPIOC, GPIO_PIN_15, ENABLE);

  /* Select Port as EXTI Trigger Source                                                                     */
  AFIO_EXTISourceConfig(AFIO_EXTI_CH_15, AFIO_ESS_PC);

  /* EXTI Event Related Configuration                                                                       */
  EXTI_WakeupEventConfig(EXTI_CHANNEL_15, EXTI_WAKEUP_HIGH_LEVEL, ENABLE);

  #if (ENABLE_EVWUP_INT_FOR_WFI == 1)
  /* Configure Event Wake Up Interrupt Channel                                                              */
  EXTI_WakeupEventIntConfig(ENABLE);
  NVIC_EnableIRQ(EVWUP_IRQn);
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
