/*********************************************************************************************************//**
 * @file    CortexM3/BitBand/main.c
 * @version $Rev:: 145          $
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

/** @addtogroup CortexM3_Examples CortexM3
  * @{
  */

/** @addtogroup BitBand
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define LED1_GPIO_DOUT_BIT_BAND BitBand((u32)&HTCFG_GPIO_LED->DOUTR, HTCFG_GPIO_LED_BIT_NUMBER)

/* Private function prototypes -----------------------------------------------------------------------------*/
void delay(vu32 count){while (count--);}

/* Private variables ---------------------------------------------------------------------------------------*/
u32 gVariable, gVariableAddress;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting should has already been configured.
  *       This can be done through SystemInit() function which is called from startup
  *       file (startup_ht32xxxx.s) before branching to application main().
  *       To reconfigure the default setting of SystemInit() function, please refer to
  *       system_ht32fxxxx.c file
  * @details The main function works as the following:
  *    - Access SRAM via bit-band alias.
  *    - Access GPIOA peripheral DOUTR register bit 15 via bit-band alias.
  *
  ***********************************************************************************************************/
int main(void)
{
  u32 i;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Use bit-band to access SRAM                                                                            */
  gVariable = 0x5;
  gVariableAddress = (u32)&gVariable;
  for (i = 0; i < 4; i++)
  {
    if (GetBit_BB(gVariableAddress, i))
    {
      ResetBit_BB(gVariableAddress, i);
    }
    else
    {
      SetBit_BB(gVariableAddress, i);
    }
  }

  HTCFG_GPIO_LED_CK(CKCUClock) = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure GPIO as output function                                                                      */
  GPIO_DirectionConfig(HTCFG_GPIO_LED, HTCFG_GPIO_LED_PIN, GPIO_DIR_OUT);

  /* Infinite loop to toggle LED1 via bit-band alias                                                        */
  while (1)
  {
    delay(18000000);
    LED1_GPIO_DOUT_BIT_BAND = 1 - LED1_GPIO_DOUT_BIT_BAND;
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
