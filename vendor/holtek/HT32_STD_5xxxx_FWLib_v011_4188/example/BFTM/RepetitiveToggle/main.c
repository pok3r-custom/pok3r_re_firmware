/*********************************************************************************************************//**
 * @file    BFTM/RepetitiveToggle/main.c
 * @version $Rev:: 3913         $
 * @date    $Date:: 2019-05-23 #$
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

/** @addtogroup BFTM_Examples BFTM
  * @{
  */

/** @addtogroup RepetitiveToggle
  * @{
  */

/* Private function prototypes -----------------------------------------------------------------------------*/
void BFTM_Configuration(void);
void MainRoutine(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /*
     Configures the system clock in startup file (startup_ht32fxxxx.s)
     by calling SystemInit function. Please refer to system_ht32fxxxx.c.
  */  
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  BFTM_Configuration();
  
  while (1)
  {
    MainRoutine();
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the Timer.
  * @retval None
  ***********************************************************************************************************/
void BFTM_Configuration(void)
{
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.BFTM0      = 1;
  #if !defined (USE_HT32F52230_SK) && !defined (USE_HT32F50230_SK)
  CKCUClock.Bit.BFTM1      = 1;
  #endif
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  NVIC_EnableIRQ(BFTM0_IRQn);

  /* toggel LED1 every 0.5 second by match interrupt                                                        */
  BFTM_SetCompare(HT_BFTM0, SystemCoreClock/10 * 5);
  BFTM_SetCounter(HT_BFTM0, 0);
  BFTM_IntConfig(HT_BFTM0, ENABLE);
  BFTM_EnaCmd(HT_BFTM0, ENABLE);

  /* toggel LED2 every second by polling                                                                    */
#if defined(HT_BFTM1)
  BFTM_SetCompare(HT_BFTM1, SystemCoreClock);
  BFTM_SetCounter(HT_BFTM1, 0);
  BFTM_OneShotModeCmd(HT_BFTM1, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Main Routine.
  * @retval None
  ***********************************************************************************************************/
void MainRoutine(void)
{
#if defined(HT_BFTM1)
    BFTM_EnaCmd(HT_BFTM1, ENABLE);

    while (BFTM_GetFlagStatus(HT_BFTM1) != SET);
    BFTM_ClearFlag(HT_BFTM1);

    HT32F_DVB_LEDToggle(HT_LED2);
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
