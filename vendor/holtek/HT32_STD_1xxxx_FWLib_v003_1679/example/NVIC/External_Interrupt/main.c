/*********************************************************************************************************//**
 * @file    NVIC/External_Interrupt/main.c
 * @version $Rev:: 160          $
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup NVIC_Examples NVIC
  * @{
  */

/** @addtogroup External_Interrupt
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define NVIC_PRIORITY_GROUP_3          3 /* Preemption: 4 bits / Subpriority: 0 bits                        */
#define NVIC_PRIORITY_GROUP_4          4 /* Preemption: 3 bits / Subpriority: 1 bits                        */
#define NVIC_PRIORITY_GROUP_5          5 /* Preemption: 2 bits / Subpriority: 2 bits                        */
#define NVIC_PRIORITY_GROUP_6          6 /* Preemption: 1 bits / Subpriority: 3 bits                        */
#define NVIC_PRIORITY_GROUP_7          7 /* Preemption: 0 bits / Subpriority: 4 bits                        */

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  /* Enable the Interrupts                                                                                  */
  NVIC_EnableIRQ(LVD_IRQn);
  NVIC_EnableIRQ(BOD_IRQn);
  NVIC_EnableIRQ(CKRDY_IRQn);

  /* Configure 2 bits for preemption priority 2 bits for subpriority                                        */
  NVIC_SetPriorityGrouping(NVIC_PRIORITY_GROUP_5);

  /* Configure the External Interrupts Priority                                                             */
  NVIC_SetPriority(LVD_IRQn, NVIC_EncodePriority(NVIC_PRIORITY_GROUP_5, 2, 0));
  NVIC_SetPriority(BOD_IRQn, NVIC_EncodePriority(NVIC_PRIORITY_GROUP_5, 1, 0));
  NVIC_SetPriority(CKRDY_IRQn, NVIC_EncodePriority(NVIC_PRIORITY_GROUP_5, 0, 0));

  /* Generate LVD Interrupt                                                                                 */
  NVIC_SetPendingIRQ(LVD_IRQn);

  /* Check on the LEDs flash sequence                                                                       */
  while (1);
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
