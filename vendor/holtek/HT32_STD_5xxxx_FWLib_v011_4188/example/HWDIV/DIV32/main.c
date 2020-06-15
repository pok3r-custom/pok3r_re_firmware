/*********************************************************************************************************//**
 * @file    HWDIV/DIV32/main.c
 * @version $Rev:: 1524         $
 * @date    $Date:: 2017-07-03 #$
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
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup DIV_Examples DIV
  * @{
  */

/** @addtogroup DIV32
  * @{
  */

/* Global variables ----------------------------------------------------------------------------------------*/
u32 ua, ub, uc;
s32 sa, sb, sc, smod;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.DIV = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  RETARGET_Configuration();           /* Retarget Related configuration                                     */


  ua = 52352;
  ub = 2;
  uc = DIV_Div32(ua, ub);
  printf("\r\nUnsigned %d / %d = %d\r\n", ua, ub, uc);

  sa = 52241;
  sb = -7;
  sc = DIV_Div32(sa, sb);
  printf("Signed  %d / %d = %d\r\n", sa, sb, sc);

  sa = 52241;
  sb = -6;
  sc = DIV_Div32(sa, sb);
  smod = DIV_GetLastRemainder(); 
  printf("Signed  %d / %d = %d, Remainder = %d\r\n", sa, sb, sc, smod);
  
  sa = 52241;
  sb = -6;
  sc = DIV_Mod(sa, sb);
  printf("Signed  %d mod %d = %d\r\n", sa, sb, sc);

  DIV_Div32(100, 0);

while (1)
  {
    printf("Dividend=");
    scanf("%d", &ua);
    printf("%d", ua);
    printf("\r\nDivisor=");
    scanf("%d", &ub);
    printf("%d", ub);

    uc = DIV_Div32(ua, ub);

    printf("\r\n%d / %d = %d\r\n\r\n", ua, ub, uc);
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
