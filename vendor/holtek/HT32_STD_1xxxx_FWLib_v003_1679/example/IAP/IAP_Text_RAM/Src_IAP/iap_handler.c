/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/Src_IAP/iap_handler.c
 * @version $Rev:: 763          $
 * @date    $Date:: 2017-08-29 #$
 * @brief   This file contains IAP handler.
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
#include "iap_handler.h"
#include "iap_xmodem.h"
#include "iap_buffer.h"
#include "iap_crc16.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup Text_mode_RAM Text mode(execute on RAM)
  * @{
  */

/** @addtogroup Text_mode_RAM_IAP IAP
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define IAP_START          (0x00000000)

/* Private function prototypes -----------------------------------------------------------------------------*/
void IAP_GoCMD(u32 address);
static void IAP_Download(u32 type);
#if defined (__ICCARM__)
static int PutString(const char *pString);
#define printf PutString
extern int fputc (int ch, FILE *f);
#endif

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Jump to user application.
  * @retval None
  ***********************************************************************************************************/
void IAP_Go(void)
{
  u32 SP, PC;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Check Stack Point in range                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
  SP = rw(IAP_APFLASH_START);
  if (SP < IAP_APSRAM_START || SP > IAP_APSRAM_END)
  {
    return;      /* Stack Point is not in range, return and start IAP mode                                  */
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* Check PC in range                                                                                      */
  /*--------------------------------------------------------------------------------------------------------*/
  PC = rw(IAP_APFLASH_START + 0x4);
  if (PC < IAP_APFLASH_START || PC > IAP_APFLASH_END)
  {
    return;      /* Program Counter is not in range, return and start IAP mode                              */
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* SP and PC is correct, jump to user application                                                         */
  /*--------------------------------------------------------------------------------------------------------*/

  NVIC_DisableIRQ(HTCFG_UART_IRQn);   /* IAP UART SETTING: Disable UxRT interrupt to prevent unwanted interrupt */
  USART_DeInit(HTCFG_UART_PORT);      /* IAP UART SETTING:                                                  */

  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, IAP_APFLASH_START); /* Set Vector Table Offset                  */
  IAP_GoCMD(IAP_APFLASH_START);

  return;
}

#if defined (__CC_ARM)
/*********************************************************************************************************//**
  * @brief  Jump to user application by change PC.
  * @param  address: Start address of user application
  * @retval None
  ***********************************************************************************************************/
__asm void IAP_GoCMD(u32 address)
{
  LDR R1, [R0]
  MOV SP, R1
  LDR R1, [R0, #4]
  BX R1
}
#elif defined (__ICCARM__)
void IAP_GoCMD(u32 address)
{
  __asm("LDR R1, [R0]");
  __asm("MOV SP, R1");
  __asm("LDR R1, [R0, #4]");
  __asm("BX R1");
}
#endif

/*********************************************************************************************************//**
  * @brief  Download image to Flash.
  * @param  type: IAP_UPDATE_IAP or IAP_UPDATE_AP
  * @retval None
  ***********************************************************************************************************/
static void IAP_Download(u32 type)
{
  u32 i;
  u32 result;
  u32 startAddr;
  u8 IAP_Buffer[134];                      /* Packet size 133 + 1 since Xmodem data put from 1 ~ 133        */

  printf("\r\nErasing Flash! Please Wait....\r\n");
  /*--------------------------------------------------------------------------------------------------------*/
  /* Erase Flash for application                                                                            */
  /*--------------------------------------------------------------------------------------------------------*/
  if(type == IAP_UPDATE_IAP)
  {
    for (i = IAP_START; i < IAP_APFLASH_END; i += FLASH_PAGE_SIZE)
    {
      FLASH_ErasePage(i);
    } 
    startAddr = IAP_START;
  }
  else
  {
    for (i = IAP_APFLASH_START; i < IAP_APFLASH_END; i += FLASH_PAGE_SIZE)
    {
      FLASH_ErasePage(i);
    }
    startAddr = IAP_APFLASH_START;
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* Start file download and programming                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
  result = xmodem(IAP_Buffer, startAddr,  XMODEM_PROGRAM);

  if (result == X_SSUCCESS)
  {
    printf("\r\n\r\nSuccessful!\r\n");
  }
  else
  {
    printf("\r\n\r\nFailed!\r\n");
    while (1);
  }

}

/*********************************************************************************************************//**
  * @brief  IAP mode handler.
  * @retval None
  ***********************************************************************************************************/
void IAP_Handler(void)
{
  u8 input;
  u32 isFlashProtection = FALSE;
  FLASH_OptionByte Option;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Reset BOOT_MODE which set by user's application, to avoid start IAP again                              */
  /*--------------------------------------------------------------------------------------------------------*/
  BOOT_MODE = 0x0;

  while (1)
  {
    /* Get Option Byte status                                                                               */
    FLASH_GetOptionByteStatus(&Option);

    /* Check Application page is protection or not                                                          */
    isFlashProtection = Option.WriteProtect[0];
    isFlashProtection |= Option.WriteProtect[1];
    isFlashProtection |= Option.WriteProtect[2];
    isFlashProtection |= Option.WriteProtect[3];

    printf("\r\n\r\nHoltek IAP Example Code\r\n");
    printf(" [1] Execute The New Program\r\n");
    printf(" [2] Disable Write Protection\r\n");
    printf(" [3] Update AP\r\n");
    printf(" [4] Update IAP\r\n");

    input = ReadBuffer();
    printf("\r\n");

    switch (input)
    {
      case '1':
      {
        IAP_Go();
        printf("\r\nImage format is incorrect!\r\n");
        break;
      }
      case '2':
      {
        if (isFlashProtection != 0)
        {
          if (Option.MainSecurity == ENABLE || Option.OptionProtect == ENABLE)
          {
            //printf("Security or Option Protection is enabled. Can not modify Option.\r\n");
          }
          else
          {
            FLASH_ErasePage(OPTION_BYTE_BASE);
            //Option.WriteProtect[0] = 0;
            //Option.WriteProtect[1] = 0;
            //Option.WriteProtect[2] = 0;
            //Option.WriteProtect[3] = 0;
            //FLASH_ProgramOptionByte(&Option);

            //printf("Write Protection disabled. Trigger reset to reload Option Byte\r\n");
            BOOT_MODE = BOOT_MODE_IAP;

            NVIC_SystemReset();
          }
        }
        else
        {
          //printf("Write Protection is not enabled!\r\n");
        }
        break;
      }
      case '3':
      {
        if (isFlashProtection == 0)
        {
          IAP_Download(IAP_UPDATE_AP);
        }
        else
        {
          printf("\r\nWrite Protection is enabled. Can not update image.\r\n");
        }
        break;
      }
      case '4':
      {
        if (isFlashProtection == 0)
        {
          //printf("------------ !!ATTENTION!! ------------\r\n");
          //printf(" All flash will be erased.\r\n"); 
          //printf(" Do not power off or reset the target during the download process.\r\n");
          //printf(" Are you sure you want to start the download?(y/n)");
          //if(getchar() == 'y')
          //{
          //  printf("\r\n");
            IAP_Download(IAP_UPDATE_IAP);
          //}
        }
        else
        {
          printf("\r\nWrite Protection is enabled. Can not update image.\r\n");
        }
        break;
      }
    }
  }
}

#if defined (__ICCARM__)
/*********************************************************************************************************//**
 * @brief Put string.
 * @param pString: String.
 * @retval String length.
 ************************************************************************************************************/
static int PutString(const char *pString)
{
  int i = 0;
  while (*pString != '\0')
  {
    fputc(*pString, (FILE *)1);
    pString++;
    i++;
  }

  return i;
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
