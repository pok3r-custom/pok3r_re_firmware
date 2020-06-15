/*********************************************************************************************************//**
 * @file    IAP/IAP_UI/Src_IAP/iap_handler.c
 * @version $Rev:: 767          $
 * @date    $Date:: 2017-08-30 #$
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

/** @addtogroup UI_mode UI mode
  * @{
  */

/** @addtogroup UI_mode_IAP IAP
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef u32 (*pFunction)();

/* Private constants ---------------------------------------------------------------------------------------*/
#define ISP_PROMT           ("IAP>")
#define MAX_COMMAND_LEN     (28)
#define MAX_TOKENS          (3)
#define MAX_INFO_LEN        (12)
#define STRING_END          ('\0')
#define KEY_CR              ('\r')
#define KEY_LF              ('\n')
#define KEY_BACKSPACE       ('\b')
#define KEY_SPACE           (' ')
#define KEY_CRLF            ("\r\n")
#define CLEAR_CHAR          ("\b \b")

#define COMMAND_SUCCESS     ('O')
#define COMMAND_FAILED      ('F')
#define COMMAND_NOTFOUND    ('Z')

#define ADDRESS_OK          (1)
#define ADDRESS_ERROR       (0)

#define IAP_PAGE_ERASE      (1)
#define IAP_MASS_ERASE      (0)

#define COMMANDCOUNT        (7)
#define INFOCOUNT           (7)
#define CHECK_ADDR          (2)

#define WriteByte           SERIAL_PutChar

/* Private function prototypes -----------------------------------------------------------------------------*/
static u32 iapFindCommand(void);
static void iapParseParameter2Int(u8 *buffer, u32 *parameter);
static u32 iapCheckAddr(u32 saddr, u32 eaddr);

static u32 IAP_Erase(u32 type, u32 saddr, u32 eaddr);
static u32 IAP_Download(u32 type, u32 saddr, u32 eaddr);
static u32 IAP_Read(u32 reserved, u32 saddr, u32 eaddr);

static u32 IAP_Info(u32 type);
static u32 IAP_BlankCheck(u32 saddr, u32 eaddr);
static u32 IAP_CRC(u32 saddr, u32 eaddr);
void IAP_GoCMD(u32 address);

/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 static u8 gu8IAPBuffer[134];  /* Packet size 133 + 1 since Xmodem data put from 1 ~ 133            */

static uc8 guc8CommandSet[COMMANDCOUNT] =
{
  'e',
  'w',
  'r',

  'i',
  'b',
  'c',
  'g'

};

static uc8 gsc8Infotable[INFOCOUNT][MAX_INFO_LEN] =
{
  IAP_CHIP_NAME,
  IAP_FLASH_SIZE,
  "1024",
  IAP_PPBIT,
  "IAPV1.0.0",
  "2011-10-30",
  IAP_START
};

static const pFunction pFComHandlerTable[COMMANDCOUNT] =
{
  (pFunction)IAP_Erase,
  (pFunction)IAP_Download,
  (pFunction)IAP_Read,

  (pFunction)IAP_Info,
  (pFunction)IAP_BlankCheck,
  (pFunction)IAP_CRC,
  (pFunction)IAP_Go
};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  IAP mode handler.
  * @retval None
  ***********************************************************************************************************/
void IAP_Handler(void)
{
  u8 u8Data;
  u32 u32BufferIndex;
  u32 u32CommandIndex;
  u32 u32Parameter[MAX_TOKENS];
  u32 u32CommandExecuteResult;

  FLASH_IntConfig(FLASH_INT_ALL, ENABLE);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Reset BOOT_MODE which set by user's application, to avoid start IAP again                              */
  /*--------------------------------------------------------------------------------------------------------*/
  BOOT_MODE = 0;

  while (1)
  {
    iapSendString(ISP_PROMT);
    u32BufferIndex = 0;

    while (u32BufferIndex < MAX_COMMAND_LEN)
    {
      u8Data = ReadBuffer();

      if (u8Data == KEY_BACKSPACE)
      {
        if (u32BufferIndex != 0)
        {
          iapSendString(CLEAR_CHAR);
          u32BufferIndex--;
          gu8IAPBuffer[u32BufferIndex] = 0;
        }
      }
      else
      {
        gu8IAPBuffer[u32BufferIndex] = u8Data;
        u32BufferIndex++;

        if (u8Data == KEY_CR)
        {
          iapSendString(KEY_CRLF);
          break;
        }
        else
        {
          WriteByte(u8Data);
        }
      }
    }

    if (gu8IAPBuffer[0] != KEY_CR)
    {
      u32CommandIndex = iapFindCommand();
      if (u32CommandIndex == COMMANDCOUNT)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Command not found                                                                                */
        /*--------------------------------------------------------------------------------------------------*/
        WriteByte(COMMAND_NOTFOUND);
      }
      else
      {

        iapParseParameter2Int(&gu8IAPBuffer[2], u32Parameter);

        if ((u32CommandIndex > CHECK_ADDR) || (iapCheckAddr(u32Parameter[1], u32Parameter[2]) == ADDRESS_OK))
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Execute command                                                                                */
          /*------------------------------------------------------------------------------------------------*/
          u32CommandExecuteResult = (*pFComHandlerTable[u32CommandIndex])(u32Parameter[0],
                                                                          u32Parameter[1],
                                                                          u32Parameter[2]);
        }
        else
        {
          u32CommandExecuteResult = COMMAND_FAILED;
        }
        WriteByte(u32CommandExecuteResult);
        FLASH_ClearIntFlag(FLASH_INT_ALL);
      }
      iapSendString(KEY_CRLF);
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Search command.
  * @retval i: command index
  ***********************************************************************************************************/
static u32 iapFindCommand(void)
{
  int i;

  for (i = COMMANDCOUNT - 1; i >= 0; i--)
  {
    if (gu8IAPBuffer[0] == guc8CommandSet[i])
    {
      return i;
    }
  }

  return COMMANDCOUNT;
}

/*********************************************************************************************************//**
  * @brief  Parse string parameter to integer.
  * @param  buffer: Pointer of command line string buffer
  * @param  parameter: Parameter array pointer
  * @retval None
  ***********************************************************************************************************/
static void iapParseParameter2Int(u8 *buffer, u32 *parameter)
{
  u32 index = 0;
  u32 parIndex = 0;
  u32 mult;

  parameter[0] = 0;

  mult = 10;

  while (*(buffer + index) != KEY_CR && parIndex < MAX_TOKENS)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Meet first NON space character                                                                       */
    /*------------------------------------------------------------------------------------------------------*/
    if (*(buffer + index) != KEY_SPACE)
    {
      if (*(buffer + index) >= '0' && *(buffer + index) <= '9')
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* 0~9                                                                                              */
        /*--------------------------------------------------------------------------------------------------*/
        parameter[parIndex] = parameter[parIndex] * mult + *(buffer + index) - 0x30;
      }
      #if 0
      else if (*(buffer + index) >= 'A' && *(buffer + index) <= 'F' && mult == 16)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* A~F (valid after meet x or X)                                                                    */
        /*--------------------------------------------------------------------------------------------------*/
        parameter[parIndex] = parameter[parIndex] * mult + *(buffer + index) - 0x37;
      }
      #endif
      else if (*(buffer + index) >= 'a' && *(buffer + index) <= 'f' && mult == 16)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* a~f (valid after meet x or X)                                                                    */
        /*--------------------------------------------------------------------------------------------------*/
        parameter[parIndex] = parameter[parIndex] * mult + *(buffer + index) - 0x57;
      }
      else if (*(buffer + index) == 'x' || *(buffer + index) == 'X')
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* 0x????? convert as HEX                                                                           */
        /*--------------------------------------------------------------------------------------------------*/
        parameter[parIndex] = 0;
        mult = 16;
      }
      else
      {
        parameter[parIndex] = 0;
        return;
      }

      index++;

      if (*(buffer + index) == KEY_SPACE)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Meet next space, stop conversion                                                                 */
        /*--------------------------------------------------------------------------------------------------*/
        parIndex++;
        parameter[parIndex] = 0;
        mult = 10;
      }
    }
    else
    {
      index++;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  Send string to UART.
  * @param  String: Pointer of string
  * @retval None
  ***********************************************************************************************************/
void iapSendString(u8 *String)
{
  while (*(String) != STRING_END)
  {
    WriteByte(*(String));
    String++;
  }
}

/*********************************************************************************************************//**
  * @brief  Confirm address.
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 iapCheckAddr(u32 saddr, u32 eaddr)
{
  if ((saddr >= IAP_APFLASH_START && eaddr <= IAP_APFLASH_END) ||
      (saddr >= IAP_OB_START))
  {
    return ADDRESS_OK;
  }
  else
  {
    return ADDRESS_ERROR;
  }
}

/*********************************************************************************************************//**
  * @brief  Send back information.
  * @param  type: Information type
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_Info(u32 type)
{
  if (type < INFOCOUNT)
  {
    iapSendString((u8 *)&(gsc8Infotable[type][0]));
    return COMMAND_SUCCESS;
  }
  else
  {
    return COMMAND_FAILED;
  }
}

/*********************************************************************************************************//**
  * @brief  Mass/Page Erase.
  * @param  type: Erase type
  *         @arg IAP_MASS_ERASE: Mass Erase (Not support in IAP mode)
  *         @arg IAP_PAGE_ERASE: Page Erase
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_Erase(u32 type, u32 saddr, u32 eaddr)
{
  u32 i;
  if (eaddr > IAP_OB_END)
  {
    eaddr = IAP_OB_END;
  }
  for (i = saddr; i <= eaddr; i += FLASH_PAGE_SIZE)
  {
    if (FLASH_ErasePage(i) != FLASH_COMPLETE)
    {
      return COMMAND_FAILED;
    }
  }
  return COMMAND_SUCCESS;
}

/*********************************************************************************************************//**
  * @brief  Blank check.
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_BlankCheck(u32 saddr, u32 eaddr)
{
  u32 i;

  for (i = saddr; i <= eaddr; i += 4)
  {
    if (rw(i) != 0xFFFFFFFF)
    {
      return COMMAND_FAILED;
    }
  }

  return COMMAND_SUCCESS;
}

/*********************************************************************************************************//**
  * @brief  Download image to Flash.
  * @param  type: Program or verify
  *         @arg XMODEM_PROGRAM (1): Program mode
  *         @arg XMODEM_VERIFY (0): Verify mode
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_Download(u32 type, u32 saddr, u32 eaddr)
{
  FLASH_OptionByte Option;
  FLASH_GetOptionByteStatus(&Option);

  /*--------------------------------------------------------------------------------------------------------*/
  /* When Security protection is enabled, download is not allowed                                           */
  /*--------------------------------------------------------------------------------------------------------*/
  if (Option.MainSecurity == ENABLE)
  {
    return COMMAND_FAILED;
  }
  if (eaddr > IAP_OB_END)
  {
    eaddr = IAP_OB_END;
  }
  /*--------------------------------------------------------------------------------------------------------*/
  /* Start file download and programming                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
  if (xmodem(gu8IAPBuffer, saddr, eaddr, type) != X_SSUCCESS)
  {
    return COMMAND_FAILED;
  }

  return COMMAND_SUCCESS;
}

/*********************************************************************************************************//**
  * @brief  Calculate CRC value.
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_CRC(u32 saddr, u32 eaddr)
{
  u16 crc;

  crc = CRC16(0, (u8 *)saddr, eaddr - saddr + 1);
  WriteByte(crc);
  WriteByte(crc >> 8);

  return COMMAND_SUCCESS;
}

/*********************************************************************************************************//**
  * @brief  Jump to user application.
  * @param  type: Go, execution, or reset command
  * @retval Result
  ***********************************************************************************************************/
u32 IAP_Go(u32 type)
{
  u32 SP, PC;

  if (type == IAP_GO_EXIT)
  {
    while (1);
  }
  else if (type == IAP_GO_RESET)
  {
    BOOT_MODE = BOOT_MODE_IAP;
    NVIC_SystemReset();
  }
  else
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Check Stack Point in range                                                                           */
    /*------------------------------------------------------------------------------------------------------*/
    SP = rw(IAP_APFLASH_START);
    if (SP < IAP_APSRAM_START || SP > IAP_APSRAM_END)
    {
      return COMMAND_FAILED;      /* Stack Point is not in range, return and start IAP mode                 */
    }

    /*------------------------------------------------------------------------------------------------------*/
    /* Check PC in range                                                                                    */
    /*------------------------------------------------------------------------------------------------------*/
    PC = rw(IAP_APFLASH_START + 0x4);
    if (PC < IAP_APFLASH_START || PC > IAP_APFLASH_END)
    {
      return COMMAND_FAILED;      /* Program Counter is not in range, return and start IAP mode             */
    }

    /*------------------------------------------------------------------------------------------------------*/
    /* SP and PC is correct, jump to user application                                                       */
    /*------------------------------------------------------------------------------------------------------*/
    NVIC_DisableIRQ(HTCFG_UART_IRQn);
    NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, IAP_APFLASH_START); /* Set Vector Table Offset                */
    IAP_GoCMD(IAP_APFLASH_START);
  }

  return COMMAND_FAILED;
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
  * @brief  Read Memory.
  * @param  reserved: Reserved
  * @param  saddr: Start address
  * @param  eaddr: End address
  * @retval None
  ***********************************************************************************************************/
static u32 IAP_Read(u32 reserved, u32 saddr, u32 eaddr)
{
  u32 i, j, data;
  u32 isReadOption = 0;
  FLASH_OptionByte Option;
  FLASH_GetOptionByteStatus(&Option);

  /*--------------------------------------------------------------------------------------------------------*/
  /* When Security protection is enabled, only Option Byte can be read.                                     */
  /*--------------------------------------------------------------------------------------------------------*/
  if (Option.MainSecurity == ENABLE)
  {
    if (saddr < IAP_OB_START)
    {
      return COMMAND_FAILED;
    }
    else
    {
      isReadOption = 1;
    }
  }

  for (i = saddr; i <= eaddr; i += 4)
  {
    if ((isReadOption == 1 && i >= IAP_DATA_START) || (i > IAP_OB_END))
    {
        data = 0x0;
    }
    else
    {
      data = rw(i);
    }

    for (j = 0; j < 32; j += 8)
    {
      WriteByte(data >> j);
    }
  }

  return COMMAND_SUCCESS;
}


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
