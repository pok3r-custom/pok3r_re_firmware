/*********************************************************************************************************//**
 * @file    IAP/IAP_UI/Src_AP/main.c
 * @version $Rev:: 765          $
 * @date    $Date:: 2017-08-30 #$
 * @brief   The main program of IAP example.
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

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup UI_mode UI mode
  * @{
  */

/** @addtogroup UI_mode_AP AP
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  int input;

  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, IAP_APFLASH_START);     /* Set the Vector Table Offset          */

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  SYSTICK_ClockSourceConfig(SYSTICK_SRC_STCLK);         /* Default : CK_SYS/8                               */
  SYSTICK_SetReloadValue(SystemCoreClock / 8 / 2);      /* (CK_SYS/8/2) = 500ms                             */
  SYSTICK_IntConfig(ENABLE);                            /* Enable SYSTICK Interrupt                         */
  SYSTICK_CounterCmd(SYSTICK_COUNTER_ENABLE);

  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  while (1)                           /* Infinite loop                                                      */
  {
    printf("\r\n\r\n");
    printf(" Application\r\n");
    printf("--------------------------------\r\n");
    printf(" [1] Start IAP mode\r\n");
    printf(" [2] Hello World\r\n");
    printf(" [3] Enable Write Protection\r\n");

    input = getchar();
    printf("\r\n\r\n");

    if (input == '1')
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Set BOOT_MODE as BOOT_MODE_IAP and trigger a reset to start IAP mode.                              */
      /*----------------------------------------------------------------------------------------------------*/
      BOOT_MODE = BOOT_MODE_IAP;
      NVIC_SystemReset();           /* Trigger reset                                                        */
    }
    else if (input == '2')
    {
      printf("\r\n");
      for (input = 0; input < 10; input++)
      {
        printf("Hello World %02d!\r\n", input);
      }
      printf("Press any key to continue...");
      getchar();
    }
    else if (input == '3')
    {
      FLASH_OptionByte Option;
      FLASH_GetOptionByteStatus(&Option);

      if (Option.MainSecurity == ENABLE || Option.OptionProtect == ENABLE)
      {
        printf("Security or Option Protection is enabled. Can not modify Option.\r\n");
      }
      else
      {
        FLASH_EraseOptionByte();
        FLASH_ProgramWordData(OB_PP0, 0x00000000);
        FLASH_ProgramWordData(OB_PP1, 0x00000000);
        FLASH_ProgramWordData(OB_PP2, 0x00000000);
        FLASH_ProgramWordData(OB_PP3, 0x00000000);
        FLASH_ProgramWordData(OB_CHECKSUM, 0x0 + 0x0 + 0x0 + 0x0 + 0xFFFFFFFF);

        printf("Write Protection enabled. Trigger reset to reload Option Byte\r\n");

        NVIC_SystemReset();
      }
    }
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

/**
  * @}
  */
