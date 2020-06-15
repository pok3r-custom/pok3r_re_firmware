/*********************************************************************************************************//**
 * @file    GPIO/InputOutput/main.c
 * @version $Rev:: 153          $
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

/** @addtogroup GPIO_Examples GPIO
  * @{
  */

/** @addtogroup InputOutput
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting should has already been configured.
  *       This can be done through SystemInit() function which is called from startup
  *       file (startup_ht32fxxxx.s) before branching to application main().
  *       To reconfigure the default setting of SystemInit() function, please refer to
  *       system_ht32fxxxx.c file
  * @details The main function works as the following:
  *    - Check if the backup domain is ready for access so as to disable isolation.
  *      Because some GPIO pins are located in the backup domain.
  *    - Enable AFIO peripheral clock
  *    - Configure WEAKUP, KEY1, KEY2 pins as the input function
  *      - Enable GPIO peripheral clock of input pins
  *      - Configure AFIO mode of input pins
  *      - Configure GPIO direction of input pins
  *    - Configure LED1, LED2, LED3 pins as the output function
  *      - Enable GPIO peripheral clock of output pins
  *      - Configure AFIO mode of output pins
  *      - Configure GPIO direction of output pins
  *    - Infinite loop to read data from the input pin and then output to LED
  *      - Read WEAKUP and then output via LED1
  *      - Read KEY1 and then output via LED2
  *      - Read KEY2 and then output via LED3
  *
  ***********************************************************************************************************/
int main(void)
{
  FlagStatus TmpStatus = RESET;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  HTCFG_OUTPUT_LED0_CLK(CKCUClock)    = 1;
  HTCFG_OUTPUT_LED1_CLK(CKCUClock)    = 1;
  HTCFG_OUTPUT_LED2_CLK(CKCUClock)    = 1;
  HTCFG_INPUT_WAKE_CLK(CKCUClock)     = 1;
  HTCFG_INPUT_KEY1_CLK(CKCUClock)     = 1;
  HTCFG_INPUT_KEY2_CLK(CKCUClock)     = 1;
  CKCUClock.Bit.AFIO                  = 1;
  CKCUClock.Bit.BKP                   = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Check if the backup domain is ready for access so as to disable isolation.
     Because some GPIO pins are located in backup domain. */
  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }

  /* Configure WEAKUP, KEY1, KEY2 pins as the input function                                                */

  /* Configure AFIO mode of input pins                                                                      */
  AFIO_GPxConfig(HTCFG_INPUT_WAKE_ID, HTCFG_INPUT_WAKE_AFIO_PIN, AFIO_MODE_1);
  AFIO_GPxConfig(HTCFG_INPUT_KEY1_ID, HTCFG_INPUT_KEY1_AFIO_PIN, AFIO_MODE_DEFAULT);
  AFIO_GPxConfig(HTCFG_INPUT_KEY2_ID, HTCFG_INPUT_KEY2_AFIO_PIN, AFIO_MODE_DEFAULT);

  /* Configure GPIO direction of input pins                                                                 */
  GPIO_DirectionConfig(HTCFG_WAKE, HTCFG_INPUT_WAKE_GPIO_PIN, GPIO_DIR_IN);
  GPIO_DirectionConfig(HTCFG_KEY1, HTCFG_INPUT_KEY1_GPIO_PIN, GPIO_DIR_IN);
  GPIO_DirectionConfig(HTCFG_KEY2, HTCFG_INPUT_KEY2_GPIO_PIN, GPIO_DIR_IN);

  /* Configure GPIO pull resistor of input pins                                                             */
  GPIO_PullResistorConfig(HTCFG_WAKE, HTCFG_INPUT_WAKE_GPIO_PIN, GPIO_PR_DOWN);
  GPIO_PullResistorConfig(HTCFG_KEY1, HTCFG_INPUT_KEY1_GPIO_PIN, GPIO_PR_UP);
  GPIO_PullResistorConfig(HTCFG_KEY2, HTCFG_INPUT_KEY2_GPIO_PIN, GPIO_PR_UP);

  GPIO_InputConfig(HTCFG_WAKE, HTCFG_INPUT_WAKE_GPIO_PIN, ENABLE);
  GPIO_InputConfig(HTCFG_KEY1, HTCFG_INPUT_KEY1_GPIO_PIN, ENABLE);
  GPIO_InputConfig(HTCFG_KEY2, HTCFG_INPUT_KEY2_GPIO_PIN, ENABLE);


  /* Configure LED1, LED2, LED3 pins as output function                                                     */

  /* Configure AFIO mode of output pins                                                                     */
  AFIO_GPxConfig(HTCFG_OUTPUT_LED0_ID, HTCFG_OUTPUT_LED0_AFIO_PIN, AFIO_MODE_DEFAULT);
  AFIO_GPxConfig(HTCFG_OUTPUT_LED1_ID, HTCFG_OUTPUT_LED1_AFIO_PIN, AFIO_MODE_DEFAULT);
  AFIO_GPxConfig(HTCFG_OUTPUT_LED2_ID, HTCFG_OUTPUT_LED2_AFIO_PIN, AFIO_MODE_DEFAULT);

  /* Configure GPIO direction of output pins                                                                */
  GPIO_DirectionConfig(HTCFG_LED0, HTCFG_OUTPUT_LED0_GPIO_PIN, GPIO_DIR_OUT);
  GPIO_DirectionConfig(HTCFG_LED1, HTCFG_OUTPUT_LED1_GPIO_PIN, GPIO_DIR_OUT);
  GPIO_DirectionConfig(HTCFG_LED2, HTCFG_OUTPUT_LED2_GPIO_PIN, GPIO_DIR_OUT);

  /* Infinite loop to read data from input pin and then output to LED                                       */
  while (1)
  {
    /* Read WEAKUP and then output to LED1                                                                  */
    TmpStatus = GPIO_ReadInBit(HTCFG_WAKE, HTCFG_INPUT_WAKE_GPIO_PIN);
    GPIO_WriteOutBits(HTCFG_LED0, HTCFG_OUTPUT_LED0_GPIO_PIN, TmpStatus);

    /* Read KEY1 and then output to LED2                                                                    */
    TmpStatus = GPIO_ReadInBit(HTCFG_KEY1, HTCFG_INPUT_KEY1_GPIO_PIN);
    GPIO_WriteOutBits(HTCFG_LED1, HTCFG_OUTPUT_LED1_GPIO_PIN, TmpStatus);

    /* Read KEY2 and then output to LED3                                                                    */
    TmpStatus = GPIO_ReadInBit(HTCFG_KEY2, HTCFG_INPUT_KEY2_GPIO_PIN);
    GPIO_WriteOutBits(HTCFG_LED2, HTCFG_OUTPUT_LED2_GPIO_PIN, TmpStatus);
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
