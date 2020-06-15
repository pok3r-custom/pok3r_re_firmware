/*********************************************************************************************************//**
 * @file    IAP/IAP_UI/Src_IAP/iap_main.c
 * @version $Rev:: 769          $
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
#include "iap_handler.h"

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


/* When change UxART port, remember to change the vector address and NVIC settings.                         */
/* Please search keyword "IAP UART SETTING".                                                                */
/* Vector address of UxART                                                                                  */
/* Keil MDK-ARM: startup_ht32fxxxx_iap.s -> AREA    |.ARM.__AT_0x000000xx|, CODE, READONLY                  */
/* IAR EWARM: linker_iap.icf -> define symbol usart_vector_start     = 0x000000xx;                          */

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void USART_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{

  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */
  USART_Configuration();              /* USART Related configuration                                        */

  #if 0
  /*--------------------------------------------------------------------------------------------------------*/
  /* Example that using Key1 to decide start user application or IAP mode.                                  */
  /* Key1 = Release: User application, Key1 = Pressed: IAP mode,                                            */
  /*--------------------------------------------------------------------------------------------------------*/
  GPIO_DirectionConfig(HTCFG_KEY1_GPIO_ID, HTCFG_KEY1_GPIO_PIN, GPIO_DIR_IN);
  GPIO_InputConfig(HTCFG_KEY1_GPIO_ID, HTCFG_KEY1_GPIO_PIN, ENABLE);
  if (GPIO_ReadInBit(HTCFG_KEY1_GPIO_ID , HTCFG_KEY1_GPIO_PIN))
  #endif
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Check the register of FMC to decide start user application or IAP mode. User's application can       */
    /* set SBVT1 as 0x55AAFAF5 and trigger a reset to start IAP mode. SBVT registers only reset by          */
    /* Power-on-reset.                                                                                      */
    /*------------------------------------------------------------------------------------------------------*/
    if (BOOT_MODE != BOOT_MODE_IAP)
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Start user application when                                                                        */
      /*   1. GPIO = 1 and                                                                                  */
      /*   2. SBVT != 0x55AAFAF5 and                                                                        */
      /*   3. SP and PC of user's application is in range                                                   */
      /*----------------------------------------------------------------------------------------------------*/
      IAP_Go(IAP_GO_EXEC);            /* Never returned except SP or PC is out of range                     */
    }
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* Start IAP mode                                                                                         */
  /*   1. GPIO = 0 or                                                                                       */
  /*   2. SBVT == 0x55AAFAF5                                                                                */
  /*--------------------------------------------------------------------------------------------------------*/
  IAP_Handler();                      /* Start IAP mode                                                     */

  while (1)                           /* Infinite loop                                                      */
  {
  }
}

/*********************************************************************************************************//**
  * @brief  This function is used to configure NVIC.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_EnableIRQ(HTCFG_UART_IRQn);    /* IAP UART SETTING: Enable USART Interrupt                           */
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};

  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.HTCFG_UART = 1;
  CKCUClock.Bit.HTCFG_KEY1_CLK = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  AFIO_GPxConfig(HTCFG_TX_GPIO_ID, HTCFG_TX_AFIO_PIN, AFIO_FUN_USART_UART);
  AFIO_GPxConfig(HTCFG_RX_GPIO_ID, HTCFG_RX_AFIO_PIN, AFIO_FUN_USART_UART);
}

/*********************************************************************************************************//**
  * @brief  This function is used to configure USART.
  * @retval None
  ***********************************************************************************************************/
void USART_Configuration(void)
{
  USART_InitTypeDef USART_InitStructure;
  USART_InitStructure.USART_BaudRate = 115200;
  USART_InitStructure.USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStructure.USART_StopBits = USART_STOPBITS_1;
  USART_InitStructure.USART_Parity = USART_PARITY_NO;
  USART_InitStructure.USART_Mode = USART_MODE_NORMAL;
  USART_Init(HTCFG_UART_PORT, &USART_InitStructure);

  /* USART Tx enable                                                                                        */
  USART_TxCmd(HTCFG_UART_PORT, ENABLE);
  /* USART Rx enable                                                                                        */
  USART_RxCmd(HTCFG_UART_PORT, ENABLE);

  /* Set Rx FIFO Level = 6 or 8 */
  USART_RXTLConfig(HTCFG_UART_PORT, HTCFG_IAP_RX_FIFO);
  USART_IntConfig(HTCFG_UART_PORT, USART_INT_RXDR, ENABLE);   /* Enable RX FIFO Interrupt               */

  USART_SetTimeOutValue(HTCFG_UART_PORT, 40);                 /* Set Rx Timeout                         */
  USART_IntConfig(HTCFG_UART_PORT, USART_INT_RXDR|USART_INT_TOUT, ENABLE);
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
