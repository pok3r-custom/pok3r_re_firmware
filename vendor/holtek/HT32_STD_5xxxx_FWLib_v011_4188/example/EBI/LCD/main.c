/*********************************************************************************************************//**
 * @file    EBI/LCD/main.c
 * @version $Rev:: 2829         $
 * @date    $Date:: 2018-06-04 #$
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

/* Const ---------------------------------------------------------------------------------------------------*/
#define DISPLAY_WORD    1
#define DISPLAY_PICTURE 1
/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "picture.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EBI_Examples EBI
  * @{
  */

/** @addtogroup LCD
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* Initialize LCD related peripheral                                                                      */
  LCD_Init();

  /* LCD driver configuration                                                                               */
  LCD_Config();

  /* Set back color as black                                                                                */
  LCD_BackColorSet(Black);

  /* Set text color as yellow                                                                               */
  LCD_TextColorSet(Yellow);
#if DISPLAY_WORD
  /* Display words on LCD                                                                                   */
  LCD_StringLineDisplay(Line3, "       Holtek       ");
  LCD_StringLineDisplay(Line4, "     HT32 Series    ");
  LCD_StringLineDisplay(Line5, "     LCD Example    ");
#endif
#if DISPLAY_PICTURE
  /* Show pictures on LCD                                                                                   */
  LCD_PicDraw((144), (100), 48, 100, HT32_Table);
#endif
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
