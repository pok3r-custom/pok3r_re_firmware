/*********************************************************************************************************//**
 * @file    FMC/EnableProtectionByFW/main.c
 * @version $Rev:: 1482         $
 * @date    $Date:: 2018-11-20 #$
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

/** @addtogroup EnableProtectionByFW
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void EnableProtectionByFW(void);
void ShowOptionByteSetting(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  RETARGET_Configuration();

  EnableProtectionByFW();

  ShowOptionByteSetting();

  while (1)
  {
  }
}

/*********************************************************************************************************//**
  * @brief  Check and eanble security/write protection.
  * @retval None
  ***********************************************************************************************************/
void EnableProtectionByFW(void)
{
  FLASH_OptionByte Option;

  /* Get Option Byte status                                                                                 */
  FLASH_GetOptionByteStatus(&Option);

  if (Option.MainSecurity == 0)
  {
    FLASH_OptionByte OptionSetting;

    #if 0 // Enable for debug
    printf("Write Option Bytes....\r\n\r\n");
    #endif

    /* Before Option Byte programming, the erase operation should be performed                              */
    FLASH_EraseOptionByte();

    /* Enable Security protection                                                                           */
    OptionSetting.MainSecurity    = 1;          // Enable Security Lock

    #if (LIBCFG_FLASH_2PAGE_PER_WPBIT)
    OptionSetting.WriteProtect[0] = 0x0000FFFF; // Enable Write Protection, 2 Pages pre bit
    OptionSetting.WriteProtect[1] = 0x00000000;
    OptionSetting.WriteProtect[2] = 0x00000000;
    OptionSetting.WriteProtect[3] = 0x00000000;
    #else
    OptionSetting.WriteProtect[0] = 0xFFFFFFFF; // Enable Write Protection, 1 Pages pre bit
    OptionSetting.WriteProtect[1] = 0x00000000;
    OptionSetting.WriteProtect[2] = 0x00000000;
    OptionSetting.WriteProtect[3] = 0x00000000;
    #endif

    FLASH_ProgramOptionByte(&OptionSetting);

    /* After system reset, the Option Byte value could be reloaded                                          */
    NVIC_SystemReset();
  }
}

/*********************************************************************************************************//**
  * @brief  Show Option Byte Settings.
  * @retval None
  ***********************************************************************************************************/
void ShowOptionByteSetting(void)
{
  FLASH_OptionByte Option;

  /* Get Option Byte status                                                                                 */
  FLASH_GetOptionByteStatus(&Option);

  printf("\r\n\r\nHT32 Option Bytes Settings\r\n");
  printf("Option.WriteProtect[0] = 0x%08X\r\n", Option.WriteProtect[0]);
  printf("Option.WriteProtect[1] = 0x%08X\r\n", Option.WriteProtect[1]);
  printf("Option.WriteProtect[2] = 0x%08X\r\n", Option.WriteProtect[2]);
  printf("Option.WriteProtect[3] = 0x%08X\r\n", Option.WriteProtect[3]);
  printf("Option.MainSecurity    = 0x%08X\r\n", Option.MainSecurity);
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
