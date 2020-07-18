/*********************************************************************************************************//**
 * @file    EXTI/GPIO_Interrupt/main.c
 * @version $Rev:: 2814         $
 * @date    $Date:: 2018-05-17 #$
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EXTI_Examples EXTI
  * @{
  */

/** @addtogroup Interrupt
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void KEYW_Config(void);
void KEY1_Config(void);
void KEY2_Config(void);
void Key_Process(void);

/* Global variables ----------------------------------------------------------------------------------------*/
vu32 guKeyState[3];

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);
  HT32F_DVB_PBInit(BUTTON_WAKEUP, BUTTON_MODE_EXTI);
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_EXTI);
  HT32F_DVB_PBInit(BUTTON_KEY2, BUTTON_MODE_EXTI);

  while (1)                           /* Infinite loop                                                      */
  {
    Key_Process();
  }
}

/*********************************************************************************************************//**
  * @brief  Key Process
  * @retval None
  ***********************************************************************************************************/
void Key_Process(void)
{
  if (guKeyState[0] == TRUE)
  {
    guKeyState[0] = FALSE;
    HT32F_DVB_LEDToggle(HT_LED1);
  }
  if (guKeyState[1] == TRUE)
  {
    guKeyState[1] = FALSE;
    HT32F_DVB_LEDToggle(HT_LED2);
  }
  if (guKeyState[2] == TRUE)
  {
    guKeyState[2] = FALSE;
    HT32F_DVB_LEDToggle(HT_LED3);
  }
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
