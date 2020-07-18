/*********************************************************************************************************//**
 * @file    FMC/FLASH_Security/main.c
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

/** @addtogroup FMC_Examples FMC
  * @{
  */

/** @addtogroup FLASH_Security
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void EnableSecurity(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i;

  EnableSecurity();

  HT32F_DVB_LEDInit(HT_LED1);

  while (1)
  {
    for (i = 0; i < 10000000; i++);
    HT32F_DVB_LEDToggle(HT_LED1);
  }
}

/*********************************************************************************************************//**
  * @brief  Check and eanble security protection.
  * @retval None
  ***********************************************************************************************************/
void EnableSecurity(void)
{
  FLASH_OptionByte Option;

  /* Get Option Byte status                                                                                 */
  FLASH_GetOptionByteStatus(&Option);

  if (Option.MainSecurity == 0)
  {
    /* Before Option Byte programming, the erase operation should be performed                              */
    FLASH_EraseOptionByte();

    /* Enable Security protection                                                                           */
    Option.MainSecurity  = 1;
    FLASH_ProgramOptionByte(&Option);

    /* After system reset, the Option Byte value could be reloaded                                          */
    NVIC_SystemReset();
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
