/*********************************************************************************************************//**
 * @file    PWRCU/BOD_LVD/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
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

/** @addtogroup BOD_LVD
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void delay(vu32 counter) { while (counter--); }

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting is already configured,
  *       this is done through SystemInit() function which is called from startup
  *       file (startup_ht32fxxxx.s) before branching to application main.
  *       To reconfigure the default setting of SystemInit() function, refer to
  *       system_ht32fxxxx.c file
  * @details Main program as following:
  *   - Init LED1, LED2 used to output state.
  *   - Enable RTC PCLK.
  *   - Wait till the backup domain could be accessed.
  *   - Enable NVIC LVD interrupt.
  *   - Enable BOD reset. The LDO will be turned off when VDD33 less then 2.6V.
  *   - Enable LVD and LVD interrupt. The LVD level is configured as 2.8V.
  *     The interrupt service routine will toggle LED2 till the VDD33 above 2.8V.
  *   - Toggle LED1 in an infinite loop.
  *
  ***********************************************************************************************************/
int main(void)
{
  /* Enable RTC clock                                                                                       */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.BKP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Wait for De-isolation, then backup domain could be accessed                                            */
  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }

  /* Init LED1, LED2 used to output state                                                                   */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  /* Enable NVIC LVD interrupt                                                                              */
  NVIC_EnableIRQ(LVD_IRQn);

  /* Enable BOD reset. The LDO will be turned off when VDD33 less then 2.6V                                 */
  PWRCU_BODRISConfig(PWRCU_BODRIS_RESET);
  PWRCU_BODCmd(ENABLE);

  /* Enable LVD. The LVD level is configured as 2.8V.
     The interrupt service routine will toggle LED2 till the VDD33 above 2.8V */
  PWRCU_SetLVDS(PWRCU_LVDS_2V7);
  PWRCU_LVDIntWakeupConfig(ENABLE);
  PWRCU_LVDCmd(ENABLE);

  /* Toggle LED1 in an infinite loop                                                                        */
  while (1)
  {
    HT32F_DVB_LEDToggle(HT_LED1);
    delay(7200000);
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
