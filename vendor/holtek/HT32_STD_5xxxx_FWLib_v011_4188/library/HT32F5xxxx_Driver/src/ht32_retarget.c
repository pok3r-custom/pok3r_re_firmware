/*********************************************************************************************************//**
 * @file    ht32_retarget.c
 * @version $Rev:: 1468         $
 * @date    $Date:: 2017-06-29 #$
 * @brief   Retarget layer for target-dependent low level functions.
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

#if defined (__CC_ARM)
  #pragma import(__use_no_semihosting_swi)
#endif

#if (_RETARGET == 1)
#include <stdio.h>

#if defined (__CC_ARM)
  #include <rt_misc.h>
#endif

/** @addtogroup HT32_Peripheral_Driver HT32 Peripheral Driver
  * @{
  */

/** @defgroup RETARGET Retarget
  * @brief Retarget related functions
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
/** @defgroup RETARGET_Private_Define Retarget private definitions
  * @{
  */

#if (RETARGET_PORT == RETARGET_ITM)
#define ITM_PORT8(n)    (*((vu8 *)(0xE0000000 + 4 * n)))
#define ITM_PORT16(n)   (*((vu16 *)(0xE0000000 + 4 * n)))
#define ITM_PORT32(n)   (*((vu32 *)(0xE0000000 + 4 * n)))

#define DEMCR           (*((vu32 *)(0xE000EDFC)))
#define TRCENA          (0x01000000)
volatile int32_t ITM_RxBuffer = ITM_RXBUFFER_EMPTY; /* For Keil MDK-ARM only                                */
#endif
/**
  * @}
  */

/* Global variables ----------------------------------------------------------------------------------------*/
/** @defgroup RETARGET_Global_Variable Retarget global variables
  * @{
  */
#if defined (__CC_ARM)
struct __FILE { int handle; /* Add whatever you need here */ };
FILE __stdout;
FILE __stdin;
#endif
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup RETARGET_Exported_Functions Retarget exported functions
  * @{
  */

void RETARGET_Configuration(void)
{
#ifdef RETARGET_IS_UART
  USART_InitTypeDef USART_InitStructure;

  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;

  #ifdef RETARGET_COM_PORT
  HT32F_DVB_COMInit(RETARGET_COM_PORT, &USART_InitStructure);
  #else
  USART_Init(RETARGET_USART_PORT, &USART_InitStructure);
  USART_TxCmd(RETARGET_USART_PORT, ENABLE);
  USART_RxCmd(RETARGET_USART_PORT, ENABLE);
  #if (RETARGET_INT_MODE == 1)
  USART_TXTLConfig(RETARGET_USART_PORT, USART_TXTL_00);
  //USART_RXTLConfig(RETARGET_USART_PORT, USART_RXTL_01);
  //USART_IntConfig(RETARGET_USART_PORT, USART_INT_RXDR, ENABLE);
  NVIC_EnableIRQ(RETARGET_UART_IRQn);
  #endif
  #endif
#endif

#ifdef NON_USB_IN_APP
  SERIAL_USBDInit();
#endif
}

int __backspace(FILE *stream)
{
  return 0;
}

int fputc (int ch, FILE *f)
{
  #if (RETARGET_PORT == RETARGET_ITM)
  if (DEMCR & TRCENA)
  {
    while (ITM_PORT32(0) == 0);
    ITM_PORT8(0) = ch;
  }
  return (ch);
  #else
  #ifdef AUTO_RETURN
  if (ch == '\n')
  {
    SERIAL_PutChar('\r');
  }
  #endif
  return (SERIAL_PutChar(ch));
  #endif
}

#if defined (__ICCARM__)
int __read(int Handle, unsigned char *Buf, size_t BufSize)
{
  #if (RETARGET_PORT != RETARGET_ITM)
  int nChars = 0;

  if (Handle != 0)
  {
    return -1;
  }

  for(/* Empty */; BufSize > 0; --BufSize)
  {
    unsigned char c = NULL;
    c = SERIAL_GetChar();
    if(c == 0)
      break;
    *Buf++ = c;
    ++nChars;
  }
  #endif
  return nChars;
}
#else
int fgetc (FILE *f)
{
  #if (RETARGET_PORT == RETARGET_ITM)
  /* For Keil MDK-ARM only                                                                                  */
  while (ITM_CheckChar() == 0);
  return (ITM_ReceiveChar());
  #else
  return (SERIAL_GetChar());
  #endif
}
#endif

void _ttywrch(int ch)
{
  #if (RETARGET_PORT == RETARGET_ITM)
  if (DEMCR & TRCENA)
  {
    while (ITM_PORT32(0) == 0);
    ITM_PORT8(0) = ch;
  }
  #else
  SERIAL_PutChar(ch);
  #endif
}

void _sys_exit(int return_code)
{
label:  goto label;  /* endless loop                                                                        */
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
#endif
