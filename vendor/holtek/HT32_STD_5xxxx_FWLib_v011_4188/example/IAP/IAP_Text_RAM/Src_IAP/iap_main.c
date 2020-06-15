/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/Src_IAP/iap_main.c
 * @version $Rev:: 1642         $
 * @date    $Date:: 2017-07-27 #$
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

/** @addtogroup Text_mode_RAM Text mode(execute on RAM)
  * @{
  */

/** @addtogroup Text_mode_RAM_IAP IAP
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

  SystemInit();

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
      IAP_Go();                       /* Never returned except SP or PC is out of range                     */
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
  NVIC_SetVectorTable(NVIC_VECTTABLE_RAM, 0x00000100); /* Set base location of the Vector Table at RAM      */

  NVIC_EnableIRQ(HTCFG_UART_IRQn);    /* IAP UART SETTING: Enable USART Interrupt                           */
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
/*
//<e0> Enable Peripheral Clock
//  <h> Communication
//    <q5> EBI
//    <q11> I2C0   <q12> I2C1
//    <q23> I2S
//    <q21> SCI0 <q22> SCI1
//    <q13> SPI0   <q14> SPI1
//    <q17> UART0  <q18> UART1
//    <q15> USART0 <q16> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D
//    <q19> AFIO
//    <q20> EXTI
//  </h>
//  <h> System
//    <q32> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q31> CMP
//    <q2>  PDMA
//    <q26> PWRCU
//  </h>
//  <h> Timer
//    <q29> BFTM0 <q30> BFTM1
//    <q33> SCTM0 <q34> SCTM1 <q35> SCTM2 <q36> SCTM3
//    <q27> GPTM0 <q28> GPTM1
//    <q24> MCTM0
//    <q26> RTC   <q25> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 0;
  CKCUClock.Bit.USBD       = 0;
  CKCUClock.Bit.CKREF      = 0;
  CKCUClock.Bit.EBI        = 0;
  CKCUClock.Bit.CRC        = 0;
  CKCUClock.Bit.PA         = 0;
  CKCUClock.Bit.PB         = 0;
  CKCUClock.Bit.PC         = 0;
  CKCUClock.Bit.PD         = 0;
  CKCUClock.Bit.I2C0       = 0;
  CKCUClock.Bit.I2C1       = 0;
  CKCUClock.Bit.SPI0       = 0;
  CKCUClock.Bit.SPI1       = 0;
  CKCUClock.Bit.USART0     = 0;
  CKCUClock.Bit.USART1     = 0;
  CKCUClock.Bit.UART0      = 0;
  CKCUClock.Bit.UART1      = 0;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 0;
  CKCUClock.Bit.SCI0       = 0;
  CKCUClock.Bit.SCI1       = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.CMP        = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCUClock.Bit.SCTM0      = 0;
  CKCUClock.Bit.SCTM1      = 0;
  CKCUClock.Bit.SCTM2      = 0;
  CKCUClock.Bit.SCTM3      = 0;
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

  #if (HTCFG_UART==USART0) || (HTCFG_UART==USART1)
  USART_RXTLConfig(HTCFG_UART_PORT, USART_RXTL_06);           /* Set Rx FIFO Level                      */
  #endif
  USART_IntConfig(HTCFG_UART_PORT, USART_INT_RXDR, ENABLE);   /* Enable RX FIFO Interrupt               */

  #if (HTCFG_UART==USART0) || (HTCFG_UART==USART1)
  USART_SetTimeOutValue(HTCFG_UART_PORT, 40);                 /* Set Rx Timeout                         */
  USART_IntConfig(HTCFG_UART_PORT, USART_INT_TOUT, ENABLE);
  #endif
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
