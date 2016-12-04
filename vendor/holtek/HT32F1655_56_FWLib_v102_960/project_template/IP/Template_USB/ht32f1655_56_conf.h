/*********************************************************************************************************//**
 * @file    IP/Template/ht32f1655_56_conf.h
 * @version $Rev:: 922          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   Library configuration file.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/
//-------- <<< Use Configuration Wizard in Context Menu >>> -----------------

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F1655_56_CONF_H
#define __HT32F1655_56_CONF_H

/* Exported constants --------------------------------------------------------------------------------------*/

/* The DEBUG definition to enter debug mode for library                                                     */
/*
//<q> Library Debug mode
*/
#define HT32_LIB_DEBUG      0

#define RETARGET_ITM        0
#define RETARGET_USB        1
#define RETARGET_COM1       2
#define RETARGET_COM2       3
#define RETARGET_USART0     4
#define RETARGET_USART1     5
#define RETARGET_UART0      6
#define RETARGET_UART1      7

/* RETARGET definition to use USART function by C Library                                                   */
/*
//  <q> Enable Retarget
//  <o1> Retarget port
//      <0=> ITM
//      <1=> USB Virtual COM
//      <2=> COM1
//      <3=> COM2
//      <4=> USART0
//      <5=> USART1
//      <6=> UART0
//      <7=> UART1
*/
#define _RETARGET            1
#define RETARGET_PORT        2

#if (_RETARGET == 1)
#if (RETARGET_PORT == RETARGET_ITM)
#elif (RETARGET_PORT == RETARGET_USB)
  #define RETARGET_IS_USB
//  <h> Retarget USB Virtual COM Setting
//  <o0> Communication (Interrupt IN)
//      <1=> Endpoint 1
//      <2=> Endpoint 2
//      <3=> Endpoint 3
//      <4=> Endpoint 4
//      <5=> Endpoint 5
//      <6=> Endpoint 6
//      <7=> Endpoint 7
//  <o1> Data Rx (Bulk OUT)
//      <1=> Endpoint 1
//      <2=> Endpoint 2
//      <3=> Endpoint 3
//      <4=> Endpoint 4
//      <5=> Endpoint 5
//      <6=> Endpoint 6
//      <7=> Endpoint 7
//  <o2> Data Tx (Bulk IN)
//      <1=> Endpoint 1
//      <2=> Endpoint 2
//      <3=> Endpoint 3
//      <4=> Endpoint 4
//      <5=> Endpoint 5
//      <6=> Endpoint 6
//      <7=> Endpoint 7
//  <o3> Communication Endpoint Buffer Length (in byte) <4-64:4>
//  <o4> Data Rx Endpoint Buffer Length (in byte) <4-64:4>
//  <o5> Data Tx Endpoint Buffer Length (in byte) <4-64:4>
//  <o6> Rx Buffer Length (in byte) <64-1024:4>
  #define RETARGET_CTRL_EPT      (5)
  #define RETARGET_RX_EPT        (6)
  #define RETARGET_TX_EPT        (7)
  #define RETARGET_CTRL_EPTLEN   (8)
  #define RETARGET_RX_EPTLEN     (64)
  #define RETARGET_TX_EPTLEN     (64)
  #define RETARGET_BUFFER_SIZE   (512)
// </h>
#elif (RETARGET_PORT == RETARGET_COM1)
  #define RETARGET_USART_PORT       HT_USART0
  #define RETARGET_COM_PORT         COM1
  #define RETARGET_IS_UART
#elif (RETARGET_PORT == RETARGET_COM2)
  #define RETARGET_USART_PORT       HT_UART0
  #define RETARGET_COM_PORT         COM2
  #define RETARGET_IS_UART
#elif (RETARGET_PORT == RETARGET_USART0)
  #define RETARGET_USART_PORT       HT_USART0
  #define RETARGET_IS_UART
#elif (RETARGET_PORT == RETARGET_USART1)
  #define RETARGET_USART_PORT       HT_USART1
  #define RETARGET_IS_UART
#elif (RETARGET_PORT == RETARGET_UART0)
  #define RETARGET_USART_PORT       HT_UART0
  #define RETARGET_IS_UART
#elif (RETARGET_PORT == RETARGET_UART1)
  #define RETARGET_USART_PORT       HT_UART1
  #define RETARGET_IS_UART
#endif
  extern void RETARGET_Configuration(void);
#else
  #define RETARGET_Configuration(...)
  #undef printf
  #undef getchar
  #define printf(...)
  #define getchar()  (0)
#endif

/*
//<q> Enable CKOUT function
*/
#define ENABLE_CKOUT              0


/* Enable/disable the specific peripheral inclusion                                                         */

/* EBI -----------------------------------------------------------------------------------------------------*/
/*
//<q> EBI Library
*/
#define _EBI          1

/* I2C -----------------------------------------------------------------------------------------------------*/
/*
//<e0> I2C Library
//  <q1> I2C0
//  <q2> I2C1
//</e>
*/
#define _I2C          1
#if _I2C
#define _I2C0         1
#define _I2C1         1
#endif

/* I2S  ----------------------------------------------------------------------------------------------------*/
/*
//<q> I2S Library
*/
#define _I2S          1

/* SCI  ----------------------------------------------------------------------------------------------------*/
/*
//<q> SCI Library
*/
#define _SCI          1

/* SPI -----------------------------------------------------------------------------------------------------*/
/*
//<e0> SPI Library
//  <q1> SPI0
//  <q2> SPI1
//</e>
*/
#define _SPI          1
#if _SPI
#define _SPI0         1
#define _SPI1         1
#endif

/* USART ---------------------------------------------------------------------------------------------------*/
/*
//<e0> USART Library
//  <q1> USART0
//  <q2> USART1
//  <q3> UART0
//  <q4> UART1
//</e>
*/
#define _USART        1
#if _USART
#define _USART0       1
#define _USART1       1
#define _UART0        1
#define _UART1        1
#endif

/* USBD ----------------------------------------------------------------------------------------------------*/
/*
//<e0> USB Library
//</e>
*/
#define _USB          1
#if _USB
#define _USBEP0       1
#define _USBEP1       1
#define _USBEP2       1
#define _USBEP3       1
#define _USBEP4       1
#define _USBEP5       1
#define _USBEP6       1
#define _USBEP7       1
#endif

/* GPIO ----------------------------------------------------------------------------------------------------*/
/*
//<e0> GPIO Library
//  <q1> AFIO
//  <q2> GPIO Port A
//  <q3> GPIO Port B
//  <q4> GPIO Port C
//  <q5> GPIO Port D
//  <q6> GPIO Port E
//</e>
*/
#define _GPIO         1
#if _GPIO
#define _AFIO         1
#define _GPIOA        1
#define _GPIOB        1
#define _GPIOC        1
#define _GPIOD        1
#define _GPIOE        1
#endif

/* EXTI ----------------------------------------------------------------------------------------------------*/
/*
//<q> EXTI Library
*/
#define _EXTI         1

/* ADC -----------------------------------------------------------------------------------------------------*/
/*
//<q> ADC Library
*/
#define _ADC          1

/* Clock Control -------------------------------------------------------------------------------------------*/
/*
//<q> Clock Control Library
*/
#define _CKCU         1

/* CRC -----------------------------------------------------------------------------------------------------*/
/*
//<q> CRC Library
*/
#define _CRC          1

/* Comparator/OPA ------------------------------------------------------------------------------------------*/
/*
//<e0> Comparator Library
//  <q1> CMP_OP0
//  <q2> CMP_OP1
//</e>
*/
#define _CMP_OP       1
#if _CMP_OP
#define _CMP_OP0      1
#define _CMP_OP1      1
#endif

/* Flash control -------------------------------------------------------------------------------------------*/
/*
//<q> Flash Control Library
*/
#define _FLASH        1

/* Misc ----------------------------------------------------------------------------------------------------*/
/*
//<q> Misc Library
*/
#define _MISC         1

/* PDMA ----------------------------------------------------------------------------------------------------*/
/*
//<q> PDMA Library
*/
#define _PDMA         1

/* PWRCU ---------------------------------------------------------------------------------------------------*/
/*
//<q> PWRCU Library
*/
#define _PWRCU        1

/* RSTCU ---------------------------------------------------------------------------------------------------*/
/*
//<q> RSTCU Library
*/
#define _RSTCU        1

/* BFTM ----------------------------------------------------------------------------------------------------*/
/*
//<e0> BFTM Library
//  <q1> BFTM0
//  <q2> BFTM1
//</e>
*/
#define _BFTM         1
#if _BFTM
#define _BFTM0        1
#define _BFTM1        1
#endif

/* GPTM ----------------------------------------------------------------------------------------------------*/
/*
//<e0> GPTM Library
//  <q1> GPTM0
//  <q2> GPTM1
//</e>
*/
#define _GPTM         1
#if _GPTM
#define _GPTM0        1
#define _GPTM1        1
#endif

/* MCTM ----------------------------------------------------------------------------------------------------*/
/*
//<e0> MCTM Library
//  <q1> MCTM0
//  <q2> MCTM1
//</e>
*/
#define _MCTM         1
#if _MCTM
#define _MCTM0        1
#define _MCTM1        1
#endif

/* RTC -----------------------------------------------------------------------------------------------------*/
/*
//<q> RTC Library
*/
#define _RTC          1

/* WDT -----------------------------------------------------------------------------------------------------*/
/*
//<q> WDT Library
*/
#define _WDT          1

#endif
