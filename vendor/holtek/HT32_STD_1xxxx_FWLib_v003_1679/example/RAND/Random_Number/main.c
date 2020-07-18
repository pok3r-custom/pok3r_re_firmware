/*********************************************************************************************************//**
 * @file    RAND/Random_Number/main.c
 * @version $Rev:: 1382         $
 * @date    $Date:: 2018-08-15 #$
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

/** @addtogroup RAND_Examples RAND
  * @{
  */

/** @addtogroup Random_Number
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
u32 uRandSeed;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  u32 i = 0;
  u32 uRand[4];

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  CKCUClock.Bit.BKP       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  RTC_ClockSourceConfig(RTC_SRC_LSI);
  RTC_SetPrescaler(RTC_RPRE_1);
  RTC_Cmd(ENABLE);

  Rand_Init(&uRandSeed, HT_RTC->CNT, 10, 11);

  for (i = 0 ; i < 4; i++)
  {
    uRand[i] = Rand_Get(&uRandSeed, HT_RTC->CNT);
  }

  printf("%08X", uRand[0]);
  printf("%08X", uRand[1]);
  printf("%08X", uRand[2]);
  printf("%08X", uRand[3]);
  printf("\r\n");

  while(1);

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
