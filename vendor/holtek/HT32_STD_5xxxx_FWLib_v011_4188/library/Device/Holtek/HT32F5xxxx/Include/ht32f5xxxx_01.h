/***************************************************************************//**
 * @file    ht32f5xxxx_01.h
 * @brief   CMSIS Cortex-M0+ Device Peripheral Access Layer Header File
 * @version $Rev:: 4186         $
 * @date    $Date:: 2019-08-05 #$
 *
 * @note
 * Copyright (C) Holtek Semiconductor Inc. All rights reserved.
 *
 * @par
 * Holtek supplies this software for Cortex-M processor-based
 * microcontrollers.  This file can be freely distributed within
 * development tools that are supporting such ARM-based processors.
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/

// Supported Device
// ========================================
//   HT32F52220, HT32F2230
//   HT32F52231, HT32F52241
//   HT32F52331, HT32F52341
//   HT32F52342, HT32F52352
//   HT32F52243, HT32F52253
//   HT32F5826,
//   HT32F0008,
//   HT32F50220, HT32F50230
//   HT32F50231, HT32F50241
//   HT32F52344, HT32F52354
//   HT32F0006,
//   HT32F52344, HT32F52354
//   HT32F52357, HT32F52367
//   HT32F65240
//   HT32F57331, HT32F57341
//   HT32F57342, HT32F57352
//   HT32F50343

/** @addtogroup CMSIS
  * @{
  */

/** @addtogroup HT32F5xxxx HT32F5xxxx
  * @{
  */


#ifndef __HT32F5XXXX_01_H__
#define __HT32F5XXXX_01_H__

#include "ht32_config.h"

#ifdef __cplusplus
 extern "C" {
#endif

#if !defined(USE_HT32F52220_30) && \
    !defined(USE_HT32F52231_41) && \
    !defined(USE_HT32F52331_41) && \
    !defined(USE_HT32F52342_52) && \
    !defined(USE_HT32F52243_53) && \
    !defined(USE_HT32F5826) && \
    !defined(USE_HT32F0008) && \
    !defined(USE_HT32F50220_30) && \
    !defined(USE_HT32F50231_41) && \
    !defined(USE_HT32F52344_54) && \
    !defined(USE_HT32F0006) && \
    !defined(USE_HT32F52357_67) && \
    !defined(USE_HT32F65240) && \
    !defined(USE_HT32F57331_41) && \
    !defined(USE_HT32F57342_52) && \
    !defined(USE_HT32F50343)

  //#define USE_HT32F52220_30
  //#define USE_HT32F52231_41
  //#define USE_HT32F52331_41
  //#define USE_HT32F52342_52
  //#define USE_HT32F52243_53
  //#define USE_HT32F5826
  //#define USE_HT32F0008
  //#define USE_HT32F50220_30
  //#define USE_HT32F50231_41
  //#define USE_HT32F52344_54
  //#define USE_HT32F0006
  //#define USE_HT32F52357_67
  //#define USE_HT32F65240
  //#define USE_HT32F57331_41
  //#define USE_HT32F57342_52
  //#define USE_HT32F50343

#endif

#if !defined(USE_HT32F52220_30) && \
    !defined(USE_HT32F52231_41) && \
    !defined(USE_HT32F52331_41) && \
    !defined(USE_HT32F52342_52) && \
    !defined(USE_HT32F52243_53) && \
    !defined(USE_HT32F5826) && \
    !defined(USE_HT32F0008) && \
    !defined(USE_HT32F50220_30) && \
    !defined(USE_HT32F50231_41) && \
    !defined(USE_HT32F52344_54) && \
    !defined(USE_HT32F0006) && \
    !defined(USE_HT32F52357_67) && \
    !defined(USE_HT32F65240) && \
    !defined(USE_HT32F57331_41) && \
    !defined(USE_HT32F57342_52) && \
    !defined(USE_HT32F50343)

  #error "Please add "USE_HT32Fxxxxx_xx" define into C Preprocessor Symbols of the Project configuration."

#endif

/** @addtogroup Library_configuration_section
  * @{
  */
/**
 * @brief Value of the High Speed Internal oscillator in Hz
  */
#if defined(USE_HT32F50220_30) || defined(USE_HT32F50231_41)
  #define HSI_VALUE      20000000UL  /*!< Value of the Internal High Speed oscillator in Hz                 */
#else
  #define HSI_VALUE      8000000UL   /*!< Value of the High Speed Internal oscillator in Hz                 */
#endif

/**
 * @brief Value of the Low Speed Internal oscillator in Hz
  */
#define LSI_VALUE         32000UL     /*!< Value of the Low Speed Internal oscillator in Hz                 */

#if !defined(USE_HT32F52220_30)
/**
 * @brief Value of the Low Speed External oscillator in Hz
  */
#define LSE_VALUE         32768UL     /*!< Value of the Low Speed External oscillator in Hz                 */
#endif

/**
 * @brief Adjust the value of External High Speed oscillator (HSE)
          Tip: To avoid from modifying every time for different HSE, please define
          the HSE value in your own toolchain compiler preprocessor.
  */
#if !defined  HSE_VALUE
  #if defined(USE_HT32F50220_30) || defined(USE_HT32F50231_41)
    /* Available HSE_VALUE: 4 MHz ~ 20 MHz                                                                  */
    #define HSE_VALUE       20000000UL /*!< Value of the External oscillator in Hz                          */
  #elif defined(USE_HT32F0006)
    /* Available HSE_VALUE: 4 MHz ~ 16 MHz                                                                  */
    #define HSE_VALUE       12000000UL  /*!< Value of the External oscillator in Hz                         */
  #else
    /* Available HSE_VALUE: 4 MHz ~ 16 MHz                                                                  */
    #define HSE_VALUE       8000000UL  /*!< Value of the External oscillator in Hz                          */
  #endif
#endif

/**
 * @brief Adjust the External High Speed oscillator (HSE) Startup Timeout value
   */
#define HSE_READY_TIME    ((uint16_t)0xFFFF)    /*!< Time out for HSE start up                              */
/**
  * @}
  */

/** @addtogroup Configuration_section_for_CMSIS
  * @{
  */
#define __MPU_PRESENT             0    /*!< MPU present or not                                              */
#define __VTOR_PRESENT            1    /*!< VTOR present or not                                             */
#define __NVIC_PRIO_BITS          2    /*!< Number of Bits used for Priority Levels                         */
#define __Vendor_SysTickConfig    0    /*!< Set to 1 if different SysTick Config is used                    */

/**
  * @}
  */


/** @addtogroup Configuration_for_Interrupt_Number
  * @{
  */
typedef enum IRQn
{
/****** Cortex-M0+ Processor Exceptions Numbers ********************************                            */
  NonMaskableInt_IRQn     = -14,    /*!< 2 Non Maskable Interrupt                                           */
  HardFault_IRQn          = -13,    /*!< 3 Cortex-M0+ Hard Fault Interrupt                                  */
  SVCall_IRQn             = -5,     /*!< 11 Cortex-M0+ SV Call Interrupt                                    */
  PendSV_IRQn             = -2,     /*!< 14 Cortex-M0+ Pend SV Interrupt                                    */
  SysTick_IRQn            = -1,     /*!< 15 Cortex-M0+ System Tick Interrupt                                */

/******  HT32 Specific Interrupt Numbers ***************************************                            */
  LVD_BOD_IRQn            = 0,      /*!< Low voltage & Brown-out detection interrupt                        */
  #if !defined(USE_HT32F52220_30)
  RTC_IRQn                = 1,      /*!< RTC Wake-up Interrupt                                              */
  #endif
  FLASH_IRQn              = 2,      /*!< FLASH global Interrupt                                             */
  EVWUP_IRQn              = 3,      /*!< EXTI Event Wake-up & WAKEUP pin Interrupt                          */
  EXTI0_1_IRQn            = 4,      /*!< EXTI0-1 Line detection Interrupt                                   */
  EXTI2_3_IRQn            = 5,      /*!< EXTI2-3 Line detection Interrupt                                   */
  #if defined(USE_HT32F65240)
  EXTI4_9_IRQn            = 6,      /*!< EXTI4-9 Line detection Interrupt                                   */
  EXTI10_15_IRQn          = 7,      /*!< EXTI10-15 Line detection Interrupt                                 */
  ADC0_IRQn               = 8,      /*!< ADC0 Interrupt                                                     */
  ADC1_IRQn               = 9,      /*!< ADC1 Interrupt                                                     */
  MCTM_BRK_IRQn           = 10,     /*!< MCTM BRK Interrupt                                                 */
  MCTM_UP_IRQn            = 11,     /*!< MCTM UP Interrupt                                                  */
  MCTM_TR_UP2_IRQn        = 12,     /*!< MCTM TR & UP2 Interrupt                                            */
  MCTM_CC_IRQn            = 13,     /*!< MCTM CC Interrupt                                                  */
  GPTM_G_IRQn             = 14,     /*!< GPTM G Interrupt                                                   */
  GPTM_VCLK_IRQn          = 15,     /*!< GPTM VCLK Interrupt                                                */
  BFTM0_IRQn              = 16,     /*!< Basic Function Timer0 Interrupt                                    */
  BFTM1_IRQn              = 17,     /*!< Basic Function Timer1 Interrupt                                    */
  CMP0_IRQn               = 18,     /*!< Comparator0 Interrupt                                              */
  CMP1_IRQn               = 19,     /*!< Comparator1 Interrupt                                              */
  CMP2_IRQn               = 20,     /*!< Comparator2 Interrupt                                              */
  I2C0_IRQn                = 21,     /*!< I2C global Interrupt                                               */
  SPI0_IRQn                = 22,     /*!< SPI global Interrupt                                               */
  UART0_IRQn               = 23,     /*!< UART global Interrupt                                              */
  USART0_IRQn              = 24,     /*!< USART global Interrupt                                             */
  PDMACH0_1_IRQn          = 25,     /*!< PDMA channel 0-1 Interrupt                                         */
  PDMACH2_3_IRQn          = 26,     /*!< PDMA channel 2-3 Interrupt                                         */
  PDMACH4_5_IRQn          = 27,     /*!< PDMA channel 4-5 Interrupt                                         */
  SCTM0_IRQn              = 28,     /*!< Single Channel Timer0 Interrupt                                    */
  SCTM1_IRQn              = 29,     /*!< Single Channel Timer1 Interrupt                                    */
  SCTM2_IRQn              = 30,     /*!< Single Channel Timer2 Interrupt                                    */
  SCTM3_IRQn              = 31,     /*!< Single Channel Timer3 Interrupt                                    */
  #else
  EXTI4_15_IRQn           = 6,      /*!< EXTI4-15 Line detection Interrupt                                  */
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F5826) ||  defined(USE_HT32F52344_54)
  COMP_IRQn               = 7,      /*!< Comparator global Interrupt                                        */
  #endif
  #if defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52)
  COMP_DAC_IRQn           = 7,      /*!< Comparator & DAC global Interrupt                                  */
  #endif
  #if !defined(USE_HT32F0008)
  ADC0_IRQn               = 8,      /*!< ADC Interrupt                                                      */
  #endif
  #if defined(USE_HT32F2243_53)
  I2C2_IRQn               = 9,      /*!< I2C2 global Interrupt                                              */
  #endif
  #if defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52)
  AES_IRQn                = 9,      /*!< AES global Interrupt                                               */
  #endif
  #if !defined(USE_HT32F52220_30) && !defined(USE_HT32F0008) && !defined(USE_HT32F50220_30) && !defined(USE_HT32F0006) && !defined(USE_HT32F57342_52) && !defined(USE_HT32F57331_41) && !defined(USE_HT32F50343)
  MCTM0_IRQn              = 10,     /*!< Motor Control Timer0 interrupt                                     */
  #endif
  #if defined(USE_HT32F50343)
  PWM2_IRQn               = 10,     /*!< PWM Timer2 interrupt                                               */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F5826)
  GPTM1_IRQn              = 11,     /*!< General-Purpose Timer1 Interrupt                                   */
  #endif
  #if defined(USE_HT32F52357_67)
  QSPI_IRQn               = 11,     /*!< QSPI global Interrupt                                              */
  #endif
  #if defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
  LCD_IRQn                = 11,     /*!< LCD global Interrupt                                               */
  #endif
  GPTM0_IRQn              = 12,     /*!< General-Purpose Timer0 Interrupt                                   */
  #if !defined(USE_HT32F0008) && !defined(USE_HT32F50220_30) && !defined(USE_HT32F50231_41) && !defined(USE_HT32F57331_41)
  SCTM0_IRQn              = 13,     /*!< Single Channel Timer0 Interrupt                                    */
  SCTM1_IRQn              = 14,     /*!< Single Channel Timer1 Interrupt                                    */
  #endif
  #if defined(USE_HT32F52231_41) || defined(USE_HT32F52331_41) || defined(USE_HT32F52243_53) || defined(USE_HT32F0006)
  SCTM2_IRQn              = 15,     /*!< Single Channel Timer2 Interrupt                                    */
  SCTM3_IRQn              = 16,     /*!< Single Channel Timer3 Interrupt                                    */
  #endif
  #if defined(USE_HT32F0008) || defined(USE_HT32F50220_30) || defined(USE_HT32F50231_41) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41) || defined(USE_HT32F50343)
  PWM0_IRQn               = 15,     /*!< PWM Timer0 Interrupt                                               */
  PWM1_IRQn               = 16,     /*!< PWM Timer1 Interrupt                                               */
  #endif
  BFTM0_IRQn              = 17,     /*!< Basic Function Timer0 Interrupt                                    */
  #if !defined(USE_HT32F52220_30) && !defined(USE_HT32F50220_30)
  BFTM1_IRQn              = 18,     /*!< Basic Function Timer1 Interrupt                                    */
  #endif
  I2C0_IRQn               = 19,     /*!< I2C0 global Interrupt                                              */
  #if !defined(USE_HT32F52220_30) && !defined(USE_HT32F0008) && !defined(USE_HT32F50220_30) && !defined(USE_HT32F52344_54) && !defined(USE_HT32F0006)
  I2C1_IRQn               = 20,     /*!< I2C1 global Interrupt                                              */
  #endif
  SPI0_IRQn               = 21,     /*!< SPI0 global Interrupt                                              */
  #if !defined(USE_HT32F52220_30) && !defined(USE_HT32F0008) && !defined(USE_HT32F0006)
  SPI1_IRQn               = 22,     /*!< SPI1 global Interrupt                                              */
  #endif
  #if defined(USE_HT32F0006)
  QSPI_IRQn               = 22,     /*!< QSPI global Interrupt                                              */
  #endif
  #if !defined(USE_HT32F50220_30) && !defined(USE_HT32F52344_54) && !defined(USE_HT32F50343)
  USART0_IRQn             = 23,     /*!< USART0 global Interrupt                                            */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F52243_53) || defined(USE_HT32F5826) || defined(USE_HT32F52357_67)
  USART1_IRQn             = 24,     /*!< USART1 global Interrupt                                            */
  #endif
  UART0_IRQn              = 25,     /*!< UART0 global Interrupt                                             */
  #if !defined(USE_HT32F52220_30) && !defined(USE_HT32F0008) && !defined(USE_HT32F0006)
  UART1_IRQn              = 26,     /*!< UART1 global Interrupt                                             */
  #endif
  #if defined(USE_HT32F52357_67)
  UART0_UART2_IRQn        = 25,     /*!< UART0 & UART2 global Interrupt                                     */
  UART1_UART3_IRQn        = 26,     /*!< UART1 & UART3 global Interrupt                                     */
  #endif
  #if defined(USE_HT32F52331_41) || defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
  SCI_IRQn                = 27,     /*!< Smart Card Interface Interrupt                                     */
  #endif
  #if defined(USE_HT32F0006)
  MIDI_IRQn               = 27,     /*!< MIDI global Interrupt                                              */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52)
  I2S_IRQn                = 28,     /*!< I2S global Interrupt                                               */
  #endif
  #if defined(USE_HT32F52243_53)
  UART2_IRQn              = 27,     /*!< UART2 global Interrupt                                             */
  UART3_IRQn              = 28,     /*!< UART3 global Interrupt                                             */
  #endif
  #if defined(USE_HT32F0008)
  AES_IRQn                = 28,     /*!< AES global Interrupt                                               */
  #endif
  #if defined(USE_HT32F50343)
  SLED0_IRQn              = 27,     /*!< SLED0 global Interrupt                                             */
  SLED1_IRQn              = 28,     /*!< SLED1 global Interrupt                                             */
  #endif
  #if defined(USE_HT32F52331_41) || defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F0008) || defined(USE_HT32F52344_54) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41) || defined(USE_HT32F50343)
  USB_IRQn                = 29,     /*!< USB interrupt                                                      */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F52243_53) || defined(USE_HT32F5826) || defined(USE_HT32F0008) || defined(USE_HT32F52344_54) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F50343)
  PDMACH0_1_IRQn          = 30,     /*!< PDMA channel 0-1 interrupt                                         */
  PDMACH2_5_IRQn          = 31,     /*!< PDMA channel 2-5 interrupt                                         */
  #endif
  #endif
} IRQn_Type;

#define EXTI0_IRQn EXTI0_1_IRQn
#define EXTI1_IRQn EXTI0_1_IRQn
#define EXTI2_IRQn EXTI2_3_IRQn
#define EXTI3_IRQn EXTI2_3_IRQn
#define EXTI4_IRQn EXTI4_15_IRQn
#define EXTI5_IRQn EXTI4_15_IRQn
#define EXTI6_IRQn EXTI4_15_IRQn
#define EXTI7_IRQn EXTI4_15_IRQn
#define EXTI8_IRQn EXTI4_15_IRQn
#define EXTI9_IRQn EXTI4_15_IRQn
#define EXTI10_IRQn EXTI4_15_IRQn
#define EXTI11_IRQn EXTI4_15_IRQn
#define EXTI12_IRQn EXTI4_15_IRQn
#define EXTI13_IRQn EXTI4_15_IRQn
#define EXTI14_IRQn EXTI4_15_IRQn
#define EXTI15_IRQn EXTI4_15_IRQn

/**
  * @}
  */

#include "core_cm0plus.h"              /* Cortex-M0+ processor and core peripherals                         */
#include "system_ht32f5xxxx_01.h"      /* HT32 system                                                       */


/** @addtogroup Exported_Types
  * @{
  */

typedef signed int     s32;
typedef signed short   s16;
typedef signed char    s8;
typedef signed long long  s64;

typedef const s32      sc32;          /*!< Read Only                                                        */
typedef const s16      sc16;          /*!< Read Only                                                        */
typedef const s8       sc8;           /*!< Read Only                                                        */

typedef __IO s32       vs32;
typedef __IO s16       vs16;
typedef __IO s8        vs8;

typedef __I s32        vsc32;         /*!< Read Only                                                        */
typedef __I s16        vsc16;         /*!< Read Only                                                        */
typedef __I s8         vsc8;          /*!< Read Only                                                        */

typedef unsigned int   u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef const u32      uc32;          /*!< Read Only                                                        */
typedef const u16      uc16;          /*!< Read Only                                                        */
typedef const u8       uc8;           /*!< Read Only                                                        */

typedef __IO u32       vu32;
typedef __IO u16       vu16;
typedef __IO u8        vu8;

typedef __I u32        vuc32;         /*!< Read Only                                                        */
typedef __I u16        vuc16;         /*!< Read Only                                                        */
typedef __I u8         vuc8;          /*!< Read Only                                                        */


typedef enum {DISABLE = 0, ENABLE = !DISABLE} EventStatus, ControlStatus;

typedef enum {FALSE = 0, TRUE = !FALSE} bool;

typedef enum {RESET = 0, SET = !RESET} FlagStatus;

typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrStatus;

/**
  * @}
  */

#if defined (__CC_ARM)
  #define __ALIGN4 __align(4)
#elif defined (__ICCARM__)
  #define __ALIGN4 _Pragma("data_alignment = 4")
#elif defined (__GNUC__)
  #define __ALIGN4  __attribute__((aligned(4)))
#endif

#if defined (__GNUC__)
  #define __PACKED_H
  #define __PACKED_F __attribute__ ((packed))
#elif defined (__ICCARM__) || (__CC_ARM)
  #define __PACKED_H __packed
  #define __PACKED_F
#endif

#if defined (__CC_ARM)
#pragma anon_unions
#endif


#define U8_MAX     ((u8)255)
#define S8_MAX     ((s8)127)
#define S8_MIN     ((s8)-128)
#define U16_MAX    ((u16)65535u)
#define S16_MAX    ((s16)32767)
#define S16_MIN    ((s16)-32768)
#define U32_MAX    ((u32)4294967295uL)
#define S32_MAX    ((s32)2147483647)
#define S32_MIN    ((s32)-2147483648)


/**
 * @brief Exported constants and macro
 */
#define IS_CONTROL_STATUS(STATUS) ((STATUS == DISABLE) || (STATUS == ENABLE))

#define wb(addr, value)     (*((u8  volatile *) (addr)) = value)
#define rb(addr)            (*((u8  volatile *) (addr)))
#define whw(addr, value)    (*((u16 volatile *) (addr)) = value)
#define rhw(addr)           (*((u16 volatile *) (addr)))
#define ww(addr, value)     (*((u32 volatile *) (addr)) = value)
#define rw(addr)            (*((u32 volatile *) (addr)))


#define ResetBit_BB(Addr, BitNumber)        (rw(Addr) &= ~(1UL << BitNumber))
#define SetBit_BB(Addr, BitNumber)          (rw(Addr) |= (1UL << BitNumber))
#define GetBit_BB(Addr, BitNumber)          ((rw(Addr) >> BitNumber) & 1UL)
#define WriteBit_BB(Addr, BitNumber, Value) (Addr = ((Addr & ~((u32)1 << BitNumber)) | ((u32)Value << BitNumber)))

#define STRCAT2_(a, b)       a##b
#define STRCAT2(a, b)        STRCAT2_(a, b)
#define STRCAT3_(a, b, c)    a##b##c
#define STRCAT3(a, b, c)     STRCAT3_(a, b, c)


/** @addtogroup Peripheral_Registers_Structures
  * @{
  */


/**
 * @brief Universal Synchronous Asynchronous Receiver Transmitter
 */
typedef struct
{
                                 /* USART0: 0x40000000                                                      */
                                 /* USART1: 0x40040000                                                      */
                                 /* UART0:  0x40001000                                                      */
                                 /* UART2:  0x40002000                                                      */
                                 /* UART1:  0x40041000                                                      */
                                 /* UART3:  0x40042000                                                      */
  __IO uint32_t DR;              /*!< 0x000         Data Register                                           */
  __IO uint32_t CR;              /*!< 0x004         Control Register                                        */
  __IO uint32_t FCR;             /*!< 0x008         FIFO Control Register                                   */
  __IO uint32_t IER;             /*!< 0x00C         Interrupt Enable Register                               */
  __IO uint32_t SR;              /*!< 0x010         Status Register                                         */
  __IO uint32_t TPR;             /*!< 0x014         Timing Parameter Register                               */
  __IO uint32_t ICR;             /*!< 0x018         IrDA COntrol Register                                   */
  __IO uint32_t RCR;             /*!< 0x01C         RS485 Control Register                                  */
  __IO uint32_t SCR;             /*!< 0x020         Synchronous Control Register                            */
  __IO uint32_t DLR;             /*!< 0x024         Divisor Latch Register                                  */
  __IO uint32_t DTR;             /*!< 0x028         Debug/Test Register                                     */
} HT_USART_TypeDef;


/**
 * @brief SPI
 */
typedef struct
{
                                 /* SPI0: 0x40004000                                                        */
                                 /* SPI1: 0x40044000                                                        */
  __IO uint32_t CR0;             /*!< 0x000         Control Register 0                                      */
  __IO uint32_t CR1;             /*!< 0x004         Control Register 1                                      */
  __IO uint32_t IER;             /*!< 0x008         Interrupt Enable Register                               */
  __IO uint32_t CPR;             /*!< 0x00C         Clock Prescaler Register                                */
  __IO uint32_t DR;              /*!< 0x010         Data Register                                           */
  __IO uint32_t SR;              /*!< 0x014         Status Register                                         */
  __IO uint32_t FCR;             /*!< 0x018         FIFO Control Register                                   */
  __IO uint32_t FSR;             /*!< 0x01C         FIFO Status Register                                    */
  __IO uint32_t FTOCR;           /*!< 0x020         FIFO Time Out Counter Register                          */
#if defined(USE_HT32F0006)
  __IO uint32_t MIDICR0;         /*!< 0x040         MIDI Control Register 0                                 */
  __IO uint32_t MIDICR1;         /*!< 0x044         MIDI Control Register 1                                 */
#endif
} HT_SPI_TypeDef;


#if defined(USE_HT32F65240)
/**
 * @brief Analog to Digital Converter
 */
typedef struct
{
                                 /* ADC0: 0x40010000                                                        */
                                 /* ADC1: 0x40050000                                                        */
  __IO uint32_t CFGR;            /*!< 0x000         ADC Configuration Register (ADC1 only)                  */
  __IO uint32_t RST;             /*!< 0x004         ADC Reset Register                                      */
  __IO uint32_t CONV;            /*!< 0x008         ADC Regular Conversion Mode Register                    */
  __IO uint32_t HCONV;           /*!< 0x00C         ADC High-priority Conversion Mode Register              */
  __IO uint32_t LST[2];          /*!< 0x010 - 0x014 ADC Conversion List Register                            */
       uint32_t RESERVE0[2];     /*!< 0x018 - 0x01C Reserved                                                */
  __IO uint32_t HLST;            /*!< 0x020         ADC High-priority Conversion List Register              */
       uint32_t RESERVE1[3];     /*!< 0x024 - 0x02C Reserved                                                */
  __IO uint32_t OFR[8];          /*!< 0x030 - 0x04C ADC Input Offset Register 0-7                           */
       uint32_t RESERVE2[8];     /*!< 0x050 - 0x06C Reserved                                                */
  __IO uint32_t STR[12];         /*!< 0x070 - 0x08C ADC Input Sampling Time Register 0-7                    */
       uint32_t RESERVE3[4];     /*!< 0x090 - 0x0AC Reserved                                                */
  __IO uint32_t DR[8];           /*!< 0x0B0 - 0x0CC ADC Regular Conversion Data Register 0-7                */
       uint32_t RESERVE4[8];     /*!< 0x0D0 - 0x0EC Reserved                                                */
  __IO uint32_t HDR[4];          /*!< 0x0F0 - 0x0FC ADC High-priority Conversion Data Register 0-3          */
  __IO uint32_t TCR;             /*!< 0x100         ADC Trigger Control Register                            */
  __IO uint32_t TSR;             /*!< 0x104         ADC Trigger Source Register                             */
       uint32_t RESERVE5[2];     /*!< 0x108 - 0x10C Reserved                                                */
  __IO uint32_t HTCR;            /*!< 0x110         ADC High-priority Trigger Control Register              */
  __IO uint32_t HTSR;            /*!< 0x114         ADC High-priority Trigger Source Register               */
       uint32_t RESERVE6[2];     /*!< 0x118 - 0x11C Reserved                                                */
  __IO uint32_t WCR;             /*!< 0x120         ADC Watchdog Control Register                           */
  __IO uint32_t LTR;             /*!< 0x124         ADC Watchdog Threshold Register                         */
  __IO uint32_t UTR;             /*!< 0x128         ADC Watchdog Threshold Register                         */
       uint32_t RESERVE7[1];     /*!< 0x12C         Reserved                                                */
  __IO uint32_t IER;             /*!< 0x130         ADC Interrupt Enable Register                           */
  __IO uint32_t IRAW;            /*!< 0x134         ADC Interrupt Raw Status Register                       */
  __IO uint32_t ISR;             /*!< 0x138         ADC Interrupt Status Register                           */
  __IO uint32_t ICLR;            /*!< 0x13C         ADC Interrupt Clear Register                            */
  __IO uint32_t PDMAR;           /*!< 0x140         ADC PDMA Request Register                               */
       uint32_t RESERVE8[3];     /*!< 0x144 - 0x14C Reserved                                                */
  __IO uint32_t DIESR;           /*!< 0x150         Dual ADC Interrupt Enable/Status Register (ADC1 only)   */
  __IO uint32_t DPDMAR;          /*!< 0x154         Dual ADC PDMA Request Register (ADC1 only)              */
} HT_ADC_TypeDef;
#else
/**
 * @brief Analog to Digital Converter
 */
typedef struct
{
                                 /* ADC: 0x40010000                                                         */
  __IO uint32_t CR;              /*!< 0x000         ADC Conversion Control Register                         */
  __IO uint32_t LST[2];          /*!< 0x004 - 0x008 ADC Conversion List Register 0-1                        */
       uint32_t RESERVE0[5];     /*!< 0x00C - 0x01C Reserved                                                */
  __IO uint32_t STR;             /*!< 0x020         ADC Input Sampling Time Register                        */
       uint32_t RESERVE1[3];     /*!< 0x024 - 0x02C Reserved                                                */
  __IO uint32_t DR[8];           /*!< 0x030 - 0x04C ADC Conversion Data Register 0-7                        */
       uint32_t RESERVE2[8];     /*!< 0x050 - 0x06C Reserved                                                */
  __IO uint32_t TCR;             /*!< 0x070         ADC Trigger Control Register                            */
  __IO uint32_t TSR;             /*!< 0x074         ADC Trigger Source Register                             */
  __IO uint32_t WCR;             /*!< 0x078         ADC Watchdog Control Register                           */
  __IO uint32_t WTR;             /*!< 0x07C         ADC Watchdog Threshold Register                         */
  __IO uint32_t IER;             /*!< 0x080         ADC Interrupt Enable Register                           */
  __IO uint32_t IRAW;            /*!< 0x084         ADC Interrupt Raw Status Register                       */
  __IO uint32_t ISR;             /*!< 0x088         ADC Interrupt Status Register                           */
  __IO uint32_t ICLR;            /*!< 0x08C         ADC Interrupt Clear Register                            */
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F52243_53) || defined(USE_HT32F5826) || defined(USE_HT32F52344_54) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F50343)
  __IO uint32_t PDMAR;           /*!< 0x090         ADC PDMA Request Register                               */
  #else
       uint32_t RESERVE3;        /*!< 0x090         Reserved                                                */
  #endif
  #if defined(USE_HT32F52344_54) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
       uint32_t RESERVE4[3];     /*!< 0x094 - 0x09C Reserved                                                */
  __IO uint32_t VREFCR;          /*!< 0x0A0         ADC Reference Voltage Control Register                  */
  __IO uint32_t VREFVALR;        /*!< 0x0A4         ADC Reference Voltage Value Register                    */
  #endif
} HT_ADC_TypeDef;
#endif


/**
 * @brief Digital to Analog Converter
 */
typedef struct
{
                                 /* DACDUAL16: 0x40054000                                                   */
  __IO uint32_t CR;              /*!< 0x000         D/A Converter Control Register                          */
  __IO uint32_t RH;              /*!< 0x004         D/A R-channel data register                             */
  __IO uint32_t LH;              /*!< 0x008         D/A L-channel data register                             */
  __IO uint32_t TG;              /*!< 0x00c         D/A data trigger Register                               */
} HT_DAC_DUAL16_TypeDef;


/**
 * @brief Digital to Analog Converter
 */
typedef struct
{
                                 /* DAC: 0x40054000                                                         */
  __IO uint32_t CFGR;            /*!< 0x000         DAC Configuration Register                              */
  __IO uint32_t IER;             /*!< 0x004         DAC Interrupt Enable Register                           */
  __IO uint32_t ISR;             /*!< 0x008         DAC Interrupt Status Register                           */
       uint32_t RESERVE0[1];     /*!< 0x00C         Reserved                                                */
  __IO uint32_t CH0CR;           /*!< 0x010         DAC Channel 0 Control Register                          */
  __IO uint32_t CH0TCR;          /*!< 0x014         DAC Channel 0 Trigger Control Register                  */
  __IO uint32_t CH0TSR;          /*!< 0x018         DAC Channel 0 Trigger Source Register                   */
  __IO uint32_t CH0DHR;          /*!< 0x01C         DAC Channel 0 Data Holding Register                     */
  __IO uint32_t CH0DOR;          /*!< 0x020         DAC Channel 0 Data Output Register                      */
       uint32_t RESERVE1[3];     /*!< 0x024 - 0x02C Reserved                                                */
  __IO uint32_t CH1CR;           /*!< 0x030         DAC Channel 1 Control Register                          */
  __IO uint32_t CH1TCR;          /*!< 0x034         DAC Channel 1 Trigger Control Register                  */
  __IO uint32_t CH1TSR;          /*!< 0x038         DAC Channel 1 Trigger Source Register                   */
  __IO uint32_t CH1DHR;          /*!< 0x03C         DAC Channel 1 Data Holding Register                     */
  __IO uint32_t CH1DOR;          /*!< 0x040         DAC Channel 1 Data Output Register                      */
} HT_DAC_TypeDef;


/**
 * @brief Comparator
 */
typedef struct
{
                                 /* CMP0: 0x40058000                                                        */
                                 /* CMP1: 0x40058100                                                        */
                                 /* CMP2: 0x40058200                                                        */
  __IO uint32_t CR;              /*!< 0x000          Comparator Control Register                            */
  __IO uint32_t VALR;            /*!< 0x004          Comparator Voltage Reference Value Register            */
  __IO uint32_t IER;             /*!< 0x008          Comparator Interrupt Enable Register                   */
  __IO uint32_t TFR;             /*!< 0x00C          Comparator Transition Flag Register                    */
  #if defined(USE_HT32F65240)
  __IO uint32_t ICR;             /*!< 0x010          Comparator Input Control Register                      */
  #endif
} HT_CMP_TypeDef;


/**
 * @brief Operational Amplifier
 */
typedef struct
{
                                 /* OPA0: 0x40018000                                                        */
                                 /* OPA1: 0x40018100                                                        */
  __IO uint32_t CR ;             /*!< 0x000         Operational Amplifier Control Register                  */
  __IO uint32_t OFVCR ;          /*!< 0x004         Input Offset Voltage Cancellation Register              */
} HT_OPA_TypeDef;


/**
 * @brief General Purpose I/O
 */
typedef struct
{
                                 /* GPIOA: 0x400B0000                                                       */
                                 /* GPIOB: 0x400B2000                                                       */
                                 /* GPIOC: 0x400B4000                                                       */
                                 /* GPIOD: 0x400B6000                                                       */
                                 /* GPIOE: 0x400B8000                                                       */
                                 /* GPIOF: 0x400BA000                                                       */
  __IO uint32_t DIRCR;           /*!< 0x000         Data Direction Control Register                         */
  __IO uint32_t INER;            /*!< 0x004         Input function enable register                          */
  __IO uint32_t PUR;             /*!< 0x008         Pull-Up Selection Register                              */
  __IO uint32_t PDR;             /*!< 0x00C         Pull-Down Selection Register                            */
  __IO uint32_t ODR;             /*!< 0x010         Open Drain Selection Register                           */
  __IO uint32_t DRVR;            /*!< 0x014         Drive Current Selection Register                        */
  __IO uint32_t LOCKR;           /*!< 0x018         Lock Register                                           */
  __IO uint32_t DINR;            /*!< 0x01c         Data Input Register                                     */
  __IO uint32_t DOUTR;           /*!< 0x020         Data Output Register                                    */
  __IO uint32_t SRR;             /*!< 0x024         Output Set and Reset Control Register                   */
  __IO uint32_t RR;              /*!< 0x028         Output Reset Control Register                           */
  #if defined(USE_HT32F50220_30) || defined(USE_HT32F50231_41)
  __IO uint32_t SCER;            /*!< 0x02C         Sink Current Enhanced Selection Register                */
  #endif
} HT_GPIO_TypeDef;


/**
 * @brief AFIO
 */
typedef struct
{
                                 /* AFIO: 0x40022000                                                        */
  __IO uint32_t ESSR[2];         /*!< 0x000         EXTI Source Selection Register 0 ~ 1                    */
       uint32_t RESERVE0[6];     /*!< 0x008 - 0x01C Reserved                                                */
  __IO uint32_t GPACFGR[2];      /*!< 0x020         GPIO Port A Configuration Register 0 ~ 1                */
  __IO uint32_t GPBCFGR[2];      /*!< 0x028         GPIO Port B Configuration Register 0 ~ 1                */
  #if !defined(USE_HT32F52220_30)
  __IO uint32_t GPCCFGR[2];      /*!< 0x030         GPIO Port C Configuration Register 0 ~ 1                */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F52243_53) || defined(USE_HT32F5826) || defined(USE_HT32F52344_54) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
  __IO uint32_t GPDCFGR[2];      /*!< 0x038         GPIO Port D Configuration Register 0 ~ 1                */
  #endif
  #if defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
  __IO uint32_t GPECFGR[2];      /*!< 0x040         GPIO Port E Configuration Register 0 ~ 1                */
  #endif
  #if defined(USE_HT32F0008)
       uint32_t RESERVE1[4];     /*!< 0x038 - 0x044 Reserved                                                */
  __IO uint32_t GPFCFGR[2];      /*!< 0x048         GPIO Port F Configuration Register 0 ~ 1                */
  #endif
} HT_AFIO_TypeDef;


/**
 * @brief External Interrupt/Event Controller
 */
typedef struct
{
                                 /* EXTI: 0x40024000                                                        */
  __IO uint32_t CFGR0;           /*!< 0x000         EXTI Interrupt 0 Configuration Register                 */
  __IO uint32_t CFGR1;           /*!< 0x004         EXTI Interrupt 1 Configuration Register                 */
  __IO uint32_t CFGR2;           /*!< 0x008         EXTI Interrupt 2 Configuration Register                 */
  __IO uint32_t CFGR3;           /*!< 0x00C         EXTI Interrupt 3 Configuration Register                 */
  __IO uint32_t CFGR4;           /*!< 0x010         EXTI Interrupt 4 Configuration Register                 */
  __IO uint32_t CFGR5;           /*!< 0x014         EXTI Interrupt 5 Configuration Register                 */
  __IO uint32_t CFGR6;           /*!< 0x018         EXTI Interrupt 6 Configuration Register                 */
  __IO uint32_t CFGR7;           /*!< 0x01C         EXTI Interrupt 7 Configuration Register                 */
  __IO uint32_t CFGR8;           /*!< 0x020         EXTI Interrupt 8 Configuration Register                 */
  __IO uint32_t CFGR9;           /*!< 0x024         EXTI Interrupt 9 Configuration Register                 */
  __IO uint32_t CFGR10;          /*!< 0x028         EXTI Interrupt 10 Configuration Register                */
  __IO uint32_t CFGR11;          /*!< 0x02C         EXTI Interrupt 11 Configuration Register                */
  __IO uint32_t CFGR12;          /*!< 0x030         EXTI Interrupt 12 Configuration Register                */
  __IO uint32_t CFGR13;          /*!< 0x034         EXTI Interrupt 13 Configuration Register                */
  __IO uint32_t CFGR14;          /*!< 0x038         EXTI Interrupt 14 Configuration Register                */
  __IO uint32_t CFGR15;          /*!< 0x03C         EXTI Interrupt 15 Configuration Register                */
  __IO uint32_t CR;              /*!< 0x040         EXTI Interrupt Control Register                         */
  __IO uint32_t EDGEFLGR;        /*!< 0x044         EXTI Interrupt Edge Flag Register                       */
  __IO uint32_t EDGESR;          /*!< 0x048         EXTI Interrupt Edge Status Register                     */
  __IO uint32_t SSCR;            /*!< 0x04C         EXTI Interrupt Software Set Command Register            */
  __IO uint32_t WAKUPCR;         /*!< 0x050         EXTI Interrupt Wakeup Control Register                  */
  __IO uint32_t WAKUPPOLR;       /*!< 0x054         EXTI Interrupt Wakeup Polarity Register                 */
  __IO uint32_t WAKUPFLG;        /*!< 0x058         EXTI Interrupt Wakeup Flag Register                     */
} HT_EXTI_TypeDef;


/**
 * @brief Inter-integrated Circuit Interface
 */
typedef struct
{
                                 /* I2C2: 0x40008000                                                        */
                                 /* I2C0: 0x40048000                                                        */
                                 /* I2C1: 0x40049000                                                        */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t IER;             /*!< 0x004         Interrupt Enable Register                               */
  __IO uint32_t ADDR;            /*!< 0x008         Address Register                                        */
  __IO uint32_t SR;              /*!< 0x00C         Status Register                                         */
  __IO uint32_t SHPGR;           /*!< 0x010         SCL High Period Generation Register                     */
  __IO uint32_t SLPGR;           /*!< 0x014         SCL Low Period Generation Register                      */
  __IO uint32_t DR;              /*!< 0x018         Data Register                                           */
  __IO uint32_t TAR;             /*!< 0x01C         Target Register                                         */
  __IO uint32_t ADDMR;           /*!< 0x020         Address Mask Register                                   */
  __IO uint32_t ADDSR;           /*!< 0x024         Address Snoop Register                                  */
  __IO uint32_t TOUT;            /*!< 0x028         Timeout Register                                        */
} HT_I2C_TypeDef;


/**
 * @brief WATCHDOG
 */
typedef struct
{
                                 /* WDT: 0x40068000                                                         */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t MR0;             /*!< 0x004         Mode 0 Register                                         */
  __IO uint32_t MR1;             /*!< 0x008         Mode 1 Register                                         */
  __IO uint32_t SR;              /*!< 0x00C         Status Register                                         */
  __IO uint32_t PR;              /*!< 0x010         Write Protect Register                                  */
       uint32_t RESERVED0[1];    /*!< 0x014         Reserved                                                */
  __IO uint32_t CSR;             /*!< 0x018         Clock Selection Register                                */
} HT_WDT_TypeDef;


/**
 * @brief Real-Time Clock
 */
typedef struct
{
                                 /* RTC: 0x4006A000                                                         */
  __IO uint32_t CNT;             /*!< 0x000         RTC Counter Register                                    */
  __IO uint32_t CMP;             /*!< 0x004         RTC Compare Register                                    */
  __IO uint32_t CR;              /*!< 0x008         RTC Control Register                                    */
  __IO uint32_t SR;              /*!< 0x00C         RTC Status Register                                     */
  __IO uint32_t IWEN;            /*!< 0x010         RTC Interrupt/Wake-up Enable Register                   */
} HT_RTC_TypeDef;


/**
 * @brief Power Control Unit
 */
typedef struct
{
                                 /* PWRCU: 0x4006A100                                                       */
  __IO uint32_t SR;              /*!< 0x000         Status Register                                         */
  __IO uint32_t CR;              /*!< 0x004         Control Register                                        */
  #if !defined(USE_HT32F50220_30) && !defined(USE_HT32F50231_41)
  __IO uint32_t TEST;            /*!< 0x008         Test Register                                           */
  #else
  uint32_t RESERVE0[1];          /*!< 0x008         Reserved                                                */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F52357_67)

  __IO uint32_t HSIRCR;          /*!< 0x00C         HSI Ready Counter Control Register                      */
  #else
       uint32_t RESERVE1[1];     /*!< 0x00C         Reserved                                                */
  #endif
  __IO uint32_t LVDCSR;          /*!< 0x010         Low Voltage/Brown Out Detect Control and Status Register*/
  #if defined(USE_HT32F57342_52)
       uint32_t RESERVE2[2];     /*!< 0x014 ~ 0x18  Reserved                                                */
  __IO uint32_t BAKPSR   ;       /*!< 0x01C         Backup Domain Privileged Status Register                */
  #endif
  #if defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F52357_67)
       uint32_t RESERVE3[59];    /*!< 0x014 ~ 0x0FC Reserved                                                */
  __IO uint32_t BAKREG[10];      /*!< 0x100 ~ 0x124 Backup Register 0 ~ 9                                   */
  #endif
} HT_PWRCU_TypeDef;


/**
 * @brief General-Purpose Timer
 */
typedef struct
{
                                 /* GPTM0: 0x4006E000                                                       */
                                 /* GPTM1: 0x4006F000                                                       */
  __IO uint32_t CNTCFR;          /*!< 0x000          Counter Configuration Register                         */
  __IO uint32_t MDCFR;           /*!< 0x004          Mode Configuration Register                            */
  __IO uint32_t TRCFR;           /*!< 0x008          Trigger Configuration Register                         */
       uint32_t RESERVED0[1];    /*!< 0x00C          Reserved                                               */
  __IO uint32_t CTR;             /*!< 0x010          Control Register                                       */
       uint32_t RESERVED1[3];    /*!< 0x014 - 0x01C  Reserved                                               */
  __IO uint32_t CH0ICFR;         /*!< 0x020          Channel-0 Input Configuration Register                 */
  __IO uint32_t CH1ICFR;         /*!< 0x024          Channel-1 Input Configuration Register                 */
  __IO uint32_t CH2ICFR;         /*!< 0x028          Channel-2 Input Configuration Register                 */
  __IO uint32_t CH3ICFR;         /*!< 0x02C          Channel-3 Input Configuration Register                 */
       uint32_t RESERVED2[4];    /*!< 0x030 - 0x03C  Reserved                                               */
  __IO uint32_t CH0OCFR;         /*!< 0x040          Channel-0 Output Configuration Register                */
  __IO uint32_t CH1OCFR;         /*!< 0x044          Channel-1 Output Configuration Register                */
  __IO uint32_t CH2OCFR;         /*!< 0x048          Channel-2 Output Configuration Register                */
  __IO uint32_t CH3OCFR;         /*!< 0x04C          Channel-3 Output Configuration Register                */
  __IO uint32_t CHCTR;           /*!< 0x050          Channel Control Register                               */
  __IO uint32_t CHPOLR;          /*!< 0x054          Channel Polarity Configuration Register                */
       uint32_t RESERVED3[7];    /*!< 0x058 - 0x070  Reserved                                               */
  __IO uint32_t DICTR;           /*!< 0x074          DMA / Interrupt Control Register                       */
  __IO uint32_t EVGR;            /*!< 0x078          Event Generator Register                               */
  __IO uint32_t INTSR;           /*!< 0x07C          Interrupt Status Register                              */
  __IO uint32_t CNTR;            /*!< 0x080          Counter Register                                       */
  __IO uint32_t PSCR;            /*!< 0x084          Prescaler Register                                     */
  __IO uint32_t CRR;             /*!< 0x088          Counter Reload Register                                */
       uint32_t RESERVED4[1];    /*!< 0x08C          Reserved                                               */
  __IO uint32_t CH0CCR;          /*!< 0x090          Channel 0 Capture/Compare Register                     */
  __IO uint32_t CH1CCR;          /*!< 0x094          Channel 1 Capture/Compare Register                     */
  __IO uint32_t CH2CCR;          /*!< 0x098          Channel 2 Capture/Compare Register                     */
  __IO uint32_t CH3CCR;          /*!< 0x09C          Channel 3 Capture/Compare Register                     */
  __IO uint32_t CH0ACR;          /*!< 0x0A0          Channel 0 Asymmetric Compare Register                  */
  __IO uint32_t CH1ACR;          /*!< 0x0A4          Channel 1 Asymmetric Compare Register                  */
  __IO uint32_t CH2ACR;          /*!< 0x0A8          Channel 2 Asymmetric Compare Register                  */
  __IO uint32_t CH3ACR;          /*!< 0x0AC          Channel 3 Asymmetric Compare Register                  */
} HT_GPTM_TypeDef;


/**
 * @brief Flash Memory Controller
 */
typedef struct
{
                                 /* FLASH: 0x40080000                                                       */
  __IO uint32_t TADR;            /*!< 0x000         Flash Target Address Register                           */
  __IO uint32_t WRDR;            /*!< 0x004         Flash Write Data Register                               */
       uint32_t RESERVED0[1];    /*!< 0x008         Reserved                                                */
  __IO uint32_t OCMR;            /*!< 0x00C         Flash Operation Command Register                        */
  __IO uint32_t OPCR;            /*!< 0x010         Flash Operation Control Register                        */
  __IO uint32_t OIER;            /*!< 0x014         Flash Operation Interrupt Enable Register               */
  __IO uint32_t OISR;            /*!< 0x018         Flash Operation Interrupt and Status Register           */
       uint32_t RESERVED1[1];    /*!< 0x01C         Reserved                                                */
  __IO uint32_t PPSR[4];         /*!< 0x020 ~ 0x02C Flash Page Erase/Program Protection Status Register     */
  __IO uint32_t CPSR;            /*!< 0x030         Flash Security Protection Status Register               */
       uint32_t RESERVED2[51];   /*!< 0x034 ~ 0x0FC Reserved                                                */
  __IO uint32_t VMCR;            /*!< 0x100         Flash Vector Mapping Control Register                   */
       uint32_t RESERVED3[31];   /*!< 0x104 ~ 0x17C Reserved                                                */
  __IO uint32_t MDID;            /*!< 0x180         Manufacturer and Device ID Register                     */
  __IO uint32_t PNSR;            /*!< 0x184         Flash Page Number Status Register                       */
  __IO uint32_t PSSR;            /*!< 0x188         Flash Page Size Status Register                         */
  __IO uint32_t DID;             /*!< 0x18C         Device ID Register                                      */
       uint32_t RESERVED4[28];   /*!< 0x190 ~ 0x1FC Reserved                                                */
  __IO uint32_t CFCR;            /*!< 0x200         Flash Cache and Pre-fetch Control Register              */
       uint32_t RESERVED5[67];   /*!< 0x204 ~ 0x30C Reserved                                                */
  __IO uint32_t CID[4];          /*!< 0x310 ~ 0x31C Custom ID Register                                      */
} HT_FLASH_TypeDef;


/**
 * @brief Clock Control Unit
 */
typedef struct
{
                                 /* CKCU: 0x40088000                                                        */
  __IO uint32_t GCFGR;           /*!< 0x000         Global Clock Configuration Register                     */
  __IO uint32_t GCCR;            /*!< 0x004         Global Clock Control Register                           */
  __IO uint32_t GCSR;            /*!< 0x008         Global Clock Status Register                            */
  __IO uint32_t GCIR;            /*!< 0x00C         Global Clock Interrupt Register                         */
       uint32_t RESERVED0[2];    /*!< 0x010 ~ 0x14  Reserved                                                */
  #if !defined(USE_HT32F50220_30) && !defined(USE_HT32F50231_41)
  __IO uint32_t PLLCFGR;         /*!< 0x018         PLL Configuration Register                              */
  __IO uint32_t PLLCR;           /*!< 0x01C         PLL Control Register                                    */
  #else
  uint32_t RESERVED1[2];         /*!< 0x018 ~ 0x1C  Reserved                                                */
  #endif
  __IO uint32_t AHBCFGR;         /*!< 0x020         AHB Configuration Register                              */
  __IO uint32_t AHBCCR;          /*!< 0x024         AHB Clock Control Register                              */
  #if defined(USE_HT32F0008)
       uint32_t RESERVED1[1];    /*!< 0x028         Reserved                                                */
  #else
  __IO uint32_t APBCFGR;         /*!< 0x028         APB Configuration Register                              */
  #endif
  __IO uint32_t APBCCR0;         /*!< 0x02C         APB Clock Control Register 0                            */
  __IO uint32_t APBCCR1;         /*!< 0x030         APB Clock Control Register 1                            */
  __IO uint32_t CKST;            /*!< 0x034         Clock source status Register                            */
  __IO uint32_t APBPCSR0;        /*!< 0x038         APB Peripheral Clock Selection Register 0               */
  __IO uint32_t APBPCSR1;        /*!< 0x03C         APB Peripheral Clock Selection Register 1               */
  __IO uint32_t HSICR;           /*!< 0x040         HSI Control Register                                    */
  __IO uint32_t HSIATCR;         /*!< 0x044         HSI Auto Trimming Counter Register                      */
  #if defined(USE_HT32F0008) || defined(USE_HT32F50220_30) || defined(USE_HT32F50231_41) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41) || defined(USE_HT32F50343)
  __IO uint32_t APBPCSR2;        /*!< 0x048         APB Peripheral Clock Selection Register 2               */
       uint32_t RESERVED2[173];  /*!< 0x04C ~ 0x2FC Reserved                                                */
  #else
       uint32_t RESERVED2[174];  /*!< 0x048 ~ 0x2FC Reserved                                                */
  #endif
  __IO uint32_t LPCR;            /*!< 0x300         Low Power Control Register                              */
  __IO uint32_t MCUDBGCR;        /*!< 0x304         MCU Debug Control Register                              */
} HT_CKCU_TypeDef;


/**
 * @brief Reset Control Unit
 */
typedef struct
{
                                 /* RSTCU: 0x40088100                                                       */
  __IO uint32_t GRSR;            /*!< 0x000         Global Reset Status Register                            */
  __IO uint32_t AHBPRST;         /*!< 0x004         AHB Peripheral Reset Register                           */
  __IO uint32_t APBPRST0;        /*!< 0x008         APB Peripheral Reset Register 0                         */
  __IO uint32_t APBPRST1;        /*!< 0x00C         APB Peripheral Reset Register 1                         */
} HT_RSTCU_TypeDef;


/**
 * @brief Smart Card Interface
 */
typedef struct
{
                                 /* SCI0: 0x40043000                                                        */
                                 /* SCI1: 0x4003A000                                                        */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t SR;              /*!< 0x004         Status Register                                         */
  __IO uint32_t CCR;             /*!< 0x008         Contact Control Register                                */
  __IO uint32_t ETU;             /*!< 0x00C         Elementary Time Unit Register                           */
  __IO uint32_t GT;              /*!< 0x010         Guardtime Register                                      */
  __IO uint32_t WT;              /*!< 0x014         Waiting Time Register                                   */
  __IO uint32_t IER;             /*!< 0x018         Interrupt Enable Register                               */
  __IO uint32_t IPR;             /*!< 0x01C         Interrupt Pending Register                              */
  __IO uint32_t TXB;             /*!< 0x020         Transmit Buffer Register                                */
  __IO uint32_t RXB;             /*!< 0x024         Receive Buffer Register                                 */
  __IO uint32_t PSC;             /*!< 0x028         Prescaler Register                                      */
} HT_SCI_TypeDef;


/**
 * @brief Basic Function Timer
 */
typedef struct
{
                                 /* BFTM0: 0x40076000                                                       */
                                 /* BFTM1: 0x40077000                                                       */
  __IO uint32_t CR;              /*!< 0x000          Control Register                                       */
  __IO uint32_t SR;              /*!< 0x004          Status Register                                        */
  __IO uint32_t CNTR;            /*!< 0x008          Counter Value Register                                 */
  __IO uint32_t CMP;             /*!< 0x00C          Compare Value Register                                 */
} HT_BFTM_TypeDef;


/**
 * @brief Motor Control Timer
 */
typedef struct
{
                                 /* MCTM0: 0x4002C000                                                       */
  __IO uint32_t CNTCFR;          /*!< 0x000          Counter Configuration Register                         */
  __IO uint32_t MDCFR;           /*!< 0x004          Mode Configuration Register                            */
  __IO uint32_t TRCFR;           /*!< 0x008          Trigger Configuration Register                         */
       uint32_t RESERVED0[1];    /*!< 0x00C          Reserved                                               */
  __IO uint32_t CTR;             /*!< 0x010          Control Register                                       */
       uint32_t RESERVED1[3];    /*!< 0x014 - 0x01C  Reserved                                               */
  __IO uint32_t CH0ICFR;         /*!< 0x020          Channel-0 Input Configuration Register                 */
  __IO uint32_t CH1ICFR;         /*!< 0x024          Channel-1 Input Configuration Register                 */
  __IO uint32_t CH2ICFR;         /*!< 0x028          Channel-2 Input Configuration Register                 */
  __IO uint32_t CH3ICFR;         /*!< 0x02C          Channel-3 Input Configuration Register                 */
       uint32_t RESERVED2[4];    /*!< 0x030 - 0x03C  Reserved                                               */
  __IO uint32_t CH0OCFR;         /*!< 0x040          Channel-0 Output Configuration Register                */
  __IO uint32_t CH1OCFR;         /*!< 0x044          Channel-1 Output Configuration Register                */
  __IO uint32_t CH2OCFR;         /*!< 0x048          Channel-2 Output Configuration Register                */
  __IO uint32_t CH3OCFR;         /*!< 0x04C          Channel-3 Output Configuration Register                */
  __IO uint32_t CHCTR;           /*!< 0x050          Channel Control Register                               */
  __IO uint32_t CHPOLR;          /*!< 0x054          Channel Polarity Configuration Register                */
       uint32_t RESERVED3[5];    /*!< 0x058 - 0x068  Reserved                                               */
  __IO uint32_t CHBRKCFR;        /*!< 0x06C          Channel Break Configuration Register                   */
  __IO uint32_t CHBRKCTR;        /*!< 0x070          Channel Break Control Register                         */
  __IO uint32_t DICTR;           /*!< 0x074          DMA / Interrupt Control Register                       */
  __IO uint32_t EVGR;            /*!< 0x078          Event Generator Register                               */
  __IO uint32_t INTSR;           /*!< 0x07C          Interrupt Status Register                              */
  __IO uint32_t CNTR;            /*!< 0x080          Counter Register                                       */
  __IO uint32_t PSCR;            /*!< 0x084          Prescaler Register                                     */
  __IO uint32_t CRR;             /*!< 0x088          Counter Reload Register                                */
  __IO uint32_t REPR;            /*!< 0x08C          Repetition Register                                    */
  __IO uint32_t CH0CCR;          /*!< 0x090          Channel 0 Capture/Compare Register                     */
  __IO uint32_t CH1CCR;          /*!< 0x094          Channel 1 Capture/Compare Register                     */
  __IO uint32_t CH2CCR;          /*!< 0x098          Channel 2 Capture/Compare Register                     */
  __IO uint32_t CH3CCR;          /*!< 0x09C          Channel 3 Capture/Compare Register                     */
  __IO uint32_t CH0ACR;          /*!< 0x0A0          Channel 0 Asymmetric Compare Register                  */
  __IO uint32_t CH1ACR;          /*!< 0x0A4          Channel 1 Asymmetric Compare Register                  */
  __IO uint32_t CH2ACR;          /*!< 0x0A8          Channel 2 Asymmetric Compare Register                  */
  __IO uint32_t CH3ACR;          /*!< 0x0AC          Channel 3 Asymmetric Compare Register                  */
} HT_MCTM_TypeDef;


/**
 * @brief Timer
 */
typedef struct
{
  __IO uint32_t CNTCFR;          /*!< 0x000          Counter Configuration Register                         */
  __IO uint32_t MDCFR;           /*!< 0x004          Mode Configuration Register                            */
  __IO uint32_t TRCFR;           /*!< 0x008          Trigger Configuration Register                         */
       uint32_t RESERVED0[1];    /*!< 0x00C          Reserved                                               */
  __IO uint32_t CTR;             /*!< 0x010          Control Register                                       */
       uint32_t RESERVED1[3];    /*!< 0x014 - 0x01C  Reserved                                               */
  __IO uint32_t CH0ICFR;         /*!< 0x020          Channel-0 Input Configuration Register                 */
  __IO uint32_t CH1ICFR;         /*!< 0x024          Channel-1 Input Configuration Register                 */
  __IO uint32_t CH2ICFR;         /*!< 0x028          Channel-2 Input Configuration Register                 */
  __IO uint32_t CH3ICFR;         /*!< 0x02C          Channel-3 Input Configuration Register                 */
       uint32_t RESERVED2[4];    /*!< 0x030 - 0x03C  Reserved                                               */
  __IO uint32_t CH0OCFR;         /*!< 0x040          Channel-0 Output Configuration Register                */
  __IO uint32_t CH1OCFR;         /*!< 0x044          Channel-1 Output Configuration Register                */
  __IO uint32_t CH2OCFR;         /*!< 0x048          Channel-2 Output Configuration Register                */
  __IO uint32_t CH3OCFR;         /*!< 0x04C          Channel-3 Output Configuration Register                */
  __IO uint32_t CHCTR;           /*!< 0x050          Channel Control Register                               */
  __IO uint32_t CHPOLR;          /*!< 0x054          Channel Polarity Configuration Register                */
       uint32_t RESERVED3[5];    /*!< 0x058 - 0x068  Reserved                                               */
  __IO uint32_t CHBRKCFR;        /*!< 0x06C          Channel Break Configuration Register                   */
  __IO uint32_t CHBRKCTR;        /*!< 0x070          Channel Break Control Register                         */
  __IO uint32_t DICTR;           /*!< 0x074          DMA / Interrupt Control Register                       */
  __IO uint32_t EVGR;            /*!< 0x078          Event Generator Register                               */
  __IO uint32_t INTSR;           /*!< 0x07C          Interrupt Status Register                              */
  __IO uint32_t CNTR;            /*!< 0x080          Counter Register                                       */
  __IO uint32_t PSCR;            /*!< 0x084          Prescaler Register                                     */
  __IO uint32_t CRR;             /*!< 0x088          Counter Reload Register                                */
  __IO uint32_t REPR;            /*!< 0x08C          Repetition Register                                    */
  __IO uint32_t CH0CCR;          /*!< 0x090          Channel 0 Capture/Compare Register                     */
  __IO uint32_t CH1CCR;          /*!< 0x094          Channel 1 Capture/Compare Register                     */
  __IO uint32_t CH2CCR;          /*!< 0x098          Channel 2 Capture/Compare Register                     */
  __IO uint32_t CH3CCR;          /*!< 0x09C          Channel 3 Capture/Compare Register                     */
  __IO uint32_t CH0ACR;          /*!< 0x0A0          Channel 0 Asymmetric Compare Register                  */
  __IO uint32_t CH1ACR;          /*!< 0x0A4          Channel 1 Asymmetric Compare Register                  */
  __IO uint32_t CH2ACR;          /*!< 0x0A8          Channel 2 Asymmetric Compare Register                  */
  __IO uint32_t CH3ACR;          /*!< 0x0AC          Channel 3 Asymmetric Compare Register                  */
  #if defined(USE_HT32F50343)
       uint32_t RESERVED4[20];   /*!< 0x0B0 - 0x0FC  Reserved                                               */
  __IO uint32_t CH4OCFR;         /*!< 0x100          Channel-4 Output Configuration Register                */
  __IO uint32_t CH5OCFR;         /*!< 0x104          Channel-5 Output Configuration Register                */
  __IO uint32_t CH6OCFR;         /*!< 0x108          Channel-6 Output Configuration Register                */
  __IO uint32_t CH7OCFR;         /*!< 0x10C          Channel-7 Output Configuration Register                */
  __IO uint32_t CH4CR;           /*!< 0x110          Channel 4 Compare Register                             */
  __IO uint32_t CH5CR;           /*!< 0x114          Channel 5 Compare Register                             */
  __IO uint32_t CH6CR;           /*!< 0x118          Channel 6 Compare Register                             */
  __IO uint32_t CH7CR;           /*!< 0x11C          Channel 7 Compare Register                             */
  #endif
} HT_TM_TypeDef;


/**
 * @brief Peripheral Direct Memory Access Channel
 */
typedef struct
{
  __IO uint32_t CR;              /*!< 0x000    PDMA Channel Control Register                                */
  __IO uint32_t SADR;            /*!< 0x004    PDMA Channel Source Address Register                         */
  __IO uint32_t DADR;            /*!< 0x008    PDMA Channel Destination Address Register                    */
       uint32_t RESERVED0[1];    /*!< 0x00C    Reserved                                                     */
  __IO uint32_t TSR;             /*!< 0x010    PDMA Channel Transfer Size Register                          */
  __IO uint32_t CTSR;            /*!< 0x014    PDMA Channel Current Transfer Size Register                  */
} HT_PDMACH_TypeDef;


/**
 * @brief Peripheral Direct Memory Access Global
 */
typedef struct
{
                                  /* PDMA: 0x40090000                                                       */
  HT_PDMACH_TypeDef PDMACH0;      /*!< 0x000          PDMA channel  0 registers                             */
  HT_PDMACH_TypeDef PDMACH1;      /*!< 0x018          PDMA channel  1 registers                             */
  HT_PDMACH_TypeDef PDMACH2;      /*!< 0x030          PDMA channel  2 registers                             */
  HT_PDMACH_TypeDef PDMACH3;      /*!< 0x048          PDMA channel  3 registers                             */
  HT_PDMACH_TypeDef PDMACH4;      /*!< 0x060          PDMA channel  4 registers                             */
  HT_PDMACH_TypeDef PDMACH5;      /*!< 0x078          PDMA channel  5 registers                             */
       uint32_t     RESERVED0[36];/*!< 0x090 - 0x011C Reserved                                              */
  __IO uint32_t     ISR;          /*!< 0x120          PDMA Interrupt Status Register                        */
       uint32_t     RESERVED1[1]; /*!< 0x124          Reserved                                              */
  __IO uint32_t     ISCR;         /*!< 0x128          PDMA Interrupt Status Clear Register                  */
       uint32_t     RESERVED2[1]; /*!< 0x12C          Reserved                                              */
  __IO uint32_t     IER;          /*!< 0x130          PDMA Interrupt Enable Register                        */
} HT_PDMA_TypeDef;


/**
 * @brief Universal Serial Bus Global
 */
typedef struct
{
                                 /* USB: 0x400A8000                                                         */
  __IO uint32_t CSR;             /*!< 0x000 USB Control and Status Register                                 */
  __IO uint32_t IER;             /*!< 0x004 USB Interrupt Enable Register                                   */
  __IO uint32_t ISR;             /*!< 0x008 USB Interrupt Status Register                                   */
  __IO uint32_t FCR;             /*!< 0x00C USB Frame Count Register                                        */
  __IO uint32_t DEVAR;           /*!< 0x010 USB Device Address Register                                     */
  __IO uint32_t EP0CSR;          /*!< 0x014 USB Endpoint 0 Control and Status Register                      */
  __IO uint32_t EP0IER;          /*!< 0x018 USB Endpoint 0 Interrupt Enable Register                        */
  __IO uint32_t EP0ISR;          /*!< 0x01C USB Endpoint 0 Interrupt Status Register                        */
  __IO uint32_t EP0TCR;          /*!< 0x020 USB Endpoint 0 Transfer Count Register                          */
  __IO uint32_t EP0CFGR;         /*!< 0x024 USB Endpoint 0 Configuration Register                           */
  __IO uint32_t EP1CSR;          /*!< 0x028 USB Endpoint 1 Control and Status Register                      */
  __IO uint32_t EP1IER;          /*!< 0x02C USB Endpoint 1 Interrupt Enable Register                        */
  __IO uint32_t EP1ISR;          /*!< 0x030 USB Endpoint 1 Interrupt Status Register                        */
  __IO uint32_t EP1TCR;          /*!< 0x034 USB Endpoint 1 Transfer Count Register                          */
  __IO uint32_t EP1CFGR;         /*!< 0x038 USB Endpoint 1 Configuration Register                           */
  __IO uint32_t EP2CSR;          /*!< 0x03C USB Endpoint 2 Control and Status Register                      */
  __IO uint32_t EP2IER;          /*!< 0x040 USB Endpoint 2 Interrupt Enable Register                        */
  __IO uint32_t EP2ISR;          /*!< 0x044 USB Endpoint 2 Interrupt Status Register                        */
  __IO uint32_t EP2TCR;          /*!< 0x048 USB Endpoint 2 Transfer Count Register                          */
  __IO uint32_t EP2CFGR;         /*!< 0x04C USB Endpoint 2 Configuration Register                           */
  __IO uint32_t EP3CSR;          /*!< 0x050 USB Endpoint 3 Control and Status Register                      */
  __IO uint32_t EP3IER;          /*!< 0x054 USB Endpoint 3 Interrupt Enable Register                        */
  __IO uint32_t EP3ISR;          /*!< 0x058 USB Endpoint 3 Interrupt Status Register                        */
  __IO uint32_t EP3TCR;          /*!< 0x05C USB Endpoint 3 Transfer Count Register                          */
  __IO uint32_t EP3CFGR;         /*!< 0x060 USB Endpoint 3 Configuration Register                           */
  __IO uint32_t EP4CSR;          /*!< 0x064 USB Endpoint 4 Control and Status Register                      */
  __IO uint32_t EP4IER;          /*!< 0x068 USB Endpoint 4 Interrupt Enable Register                        */
  __IO uint32_t EP4ISR;          /*!< 0x06C USB Endpoint 4 Interrupt Status Register                        */
  __IO uint32_t EP4TCR;          /*!< 0x070 USB Endpoint 4 Transfer Count Register                          */
  __IO uint32_t EP4CFGR;         /*!< 0x074 USB Endpoint 4 Configuration Register                           */
  __IO uint32_t EP5CSR;          /*!< 0x078 USB Endpoint 5 Control and Status Register                      */
  __IO uint32_t EP5IER;          /*!< 0x07C USB Endpoint 5 Interrupt Enable Register                        */
  __IO uint32_t EP5ISR;          /*!< 0x080 USB Endpoint 5 Interrupt Status Register                        */
  __IO uint32_t EP5TCR;          /*!< 0x084 USB Endpoint 5 Transfer Count Register                          */
  __IO uint32_t EP5CFGR;         /*!< 0x088 USB Endpoint 5 Configuration Register                           */
  __IO uint32_t EP6CSR;          /*!< 0x08C USB Endpoint 6 Control and Status Register                      */
  __IO uint32_t EP6IER;          /*!< 0x090 USB Endpoint 6 Interrupt Enable Register                        */
  __IO uint32_t EP6ISR;          /*!< 0x094 USB Endpoint 6 Interrupt Status Register                        */
  __IO uint32_t EP6TCR;          /*!< 0x098 USB Endpoint 6 Transfer Count Register                          */
  __IO uint32_t EP6CFGR;         /*!< 0x09C USB Endpoint 6 Configuration Register                           */
  __IO uint32_t EP7CSR;          /*!< 0x0A0 USB Endpoint 7 Control and Status Register                      */
  __IO uint32_t EP7IER;          /*!< 0x0A4 USB Endpoint 7 Interrupt Enable Register                        */
  __IO uint32_t EP7ISR;          /*!< 0x0A8 USB Endpoint 7 Interrupt Status Register                        */
  __IO uint32_t EP7TCR;          /*!< 0x0AC USB Endpoint 7 Transfer Count Register                          */
  __IO uint32_t EP7CFGR;         /*!< 0x0B0 USB Endpoint 7 Configuration Register                           */
} HT_USB_TypeDef;


/**
 * @brief Universal Serial Bus Endpoint
 */
typedef struct
{
                                 /* USB Endpoint0: 0x400A8014                                               */
                                 /* USB Endpoint1: 0x400A8028                                               */
                                 /* USB Endpoint2: 0x400A803C                                               */
                                 /* USB Endpoint3: 0x400A8050                                               */
                                 /* USB Endpoint4: 0x400A8064                                               */
                                 /* USB Endpoint5: 0x400A8078                                               */
                                 /* USB Endpoint6: 0x400A808C                                               */
                                 /* USB Endpoint7: 0x400A80A0                                               */
  __IO uint32_t CSR;             /*!< 0x000 USB Endpoint n Control and Status Register                      */
  __IO uint32_t IER;             /*!< 0x004 USB Endpoint n Interrupt Enable Register                        */
  __IO uint32_t ISR;             /*!< 0x008 USB Endpoint n Interrupt Status Register                        */
  __IO uint32_t TCR;             /*!< 0x00C USB Endpoint n Transfer Count Register                          */
  __IO uint32_t CFGR;            /*!< 0x010 USB Endpoint n Configuration Register                           */
} HT_USBEP_TypeDef;


/**
 * @brief External Bus Interface
 */
typedef struct
{
                                 /* EBI: 0x40098000                                                         */
  __IO uint32_t CR;              /*!< 0x000    EBI Control Register                                         */
       uint32_t RESERVED0[1];    /*!< 0x004    Reserved                                                     */
  __IO uint32_t SR;              /*!< 0x008    EBI Status Register                                          */
       uint32_t RESERVED1[1];    /*!< 0x00C    Reserved                                                     */
  __IO uint32_t ATR;             /*!< 0x010    EBI Address Timing Register                                  */
  __IO uint32_t RTR;             /*!< 0x014    EBI Read Timing Register                                     */
  __IO uint32_t WTR;             /*!< 0x018    EBI Write Timing Register                                    */
  __IO uint32_t PR;              /*!< 0x01C    EBI Parity Register                                          */
} HT_EBI_TypeDef;


/**
 * @brief Cyclic Redundancy Check
 */
typedef struct
{
                                 /* CRC: 0x4008A000                                                         */
  __IO uint32_t CR;              /*!< 0x000 CRC Control Register                                            */
  __IO uint32_t SDR;             /*!< 0x004 CRC Seed Register                                               */
  __IO uint32_t CSR;             /*!< 0x008 CRC Checksum Register                                           */
  __IO uint32_t DR;              /*!< 0x00C CRC Data Register                                               */
} HT_CRC_TypeDef;


/**
 * @brief Integrated Interchip Sound
 */
typedef struct
{
                                 /* I2S: 0x40026000                                                         */
  __IO uint32_t CR;              /*!< 0x000 I2S Control Register                                            */
  __IO uint32_t IER;             /*!< 0x004 I2S Interrupt Enable Register                                   */
  __IO uint32_t CDR;             /*!< 0x008 I2S Clock Divider Register                                      */
  __IO uint32_t TXDR;            /*!< 0x00C I2S TX Data Register                                            */
  __IO uint32_t RXDR;            /*!< 0x010 I2S RX Data Register                                            */
  __IO uint32_t FCR;             /*!< 0x014 I2S FIFO Control Register                                       */
  __IO uint32_t SR;              /*!< 0x018 I2S Status Register                                             */
  __IO uint32_t RCNTR;           /*!< 0x01C I2S Rate Counter Register                                       */
} HT_I2S_TypeDef;


/**
 * @brief PWM Timer
 */
typedef struct
{
                                 /* PWM0: 0x40031000                                                        */
                                 /* PWM1: 0x40071000                                                        */
  __IO uint32_t CNTCFR;          /*!< 0x000          Counter Configuration Register                         */
  __IO uint32_t MDCFR;           /*!< 0x004          Mode Configuration Register                            */
  __IO uint32_t TRCFR;           /*!< 0x008          Trigger Configuration Register                         */
       uint32_t RESERVED0[1];    /*!< 0x00C          Reserved                                               */
  __IO uint32_t CTR;             /*!< 0x010          Control Register                                       */
       uint32_t RESERVED1[11];   /*!< 0x014 - 0x03C  Reserved                                               */
  __IO uint32_t CH0OCFR;         /*!< 0x040          Channel-0 Output Configuration Register                */
  __IO uint32_t CH1OCFR;         /*!< 0x044          Channel-1 Output Configuration Register                */
  __IO uint32_t CH2OCFR;         /*!< 0x048          Channel-2 Output Configuration Register                */
  __IO uint32_t CH3OCFR;         /*!< 0x04C          Channel-3 Output Configuration Register                */
  __IO uint32_t CHCTR;           /*!< 0x050          Channel Control Register                               */
  __IO uint32_t CHPOLR;          /*!< 0x054          Channel Polarity Configuration Register                */
       uint32_t RESERVED2[7];    /*!< 0x058 - 0x070  Reserved                                               */
  __IO uint32_t DICTR;           /*!< 0x074          DMA / Interrupt Control Register                       */
  __IO uint32_t EVGR;            /*!< 0x078          Event Generator Register                               */
  __IO uint32_t INTSR;           /*!< 0x07C          Interrupt Status Register                              */
  __IO uint32_t CNTR;            /*!< 0x080          Counter Register                                       */
  __IO uint32_t PSCR;            /*!< 0x084          Prescaler Register                                     */
  __IO uint32_t CRR;             /*!< 0x088          Counter Reload Register                                */
       uint32_t RESERVED3[1];    /*!< 0x08C          Reserved                                               */
  __IO uint32_t CH0CR;           /*!< 0x090          Channel 0 Compare Register                             */
  __IO uint32_t CH1CR;           /*!< 0x094          Channel 1 Compare Register                             */
  __IO uint32_t CH2CR;           /*!< 0x098          Channel 2 Compare Register                             */
  __IO uint32_t CH3CR;           /*!< 0x09C          Channel 3 Compare Register                             */
  __IO uint32_t CH0ACR;          /*!< 0x0A0          Channel 0 Asymmetric Compare Register                  */
  __IO uint32_t CH1ACR;          /*!< 0x0A4          Channel 1 Asymmetric Compare Register                  */
  __IO uint32_t CH2ACR;          /*!< 0x0A8          Channel 2 Asymmetric Compare Register                  */
  __IO uint32_t CH3ACR;          /*!< 0x0AC          Channel 3 Asymmetric Compare Register                  */
  #if defined(USE_HT32F50343)
       uint32_t RESERVED4[20];   /*!< 0x0B0 - 0x0FC  Reserved                                               */
  __IO uint32_t CH4OCFR;         /*!< 0x100          Channel-4 Output Configuration Register                */
  __IO uint32_t CH5OCFR;         /*!< 0x104          Channel-5 Output Configuration Register                */
  __IO uint32_t CH6OCFR;         /*!< 0x108          Channel-6 Output Configuration Register                */
  __IO uint32_t CH7OCFR;         /*!< 0x10C          Channel-7 Output Configuration Register                */
  __IO uint32_t CH4CR;           /*!< 0x110          Channel 4 Compare Register                             */
  __IO uint32_t CH5CR;           /*!< 0x114          Channel 5 Compare Register                             */
  __IO uint32_t CH6CR;           /*!< 0x118          Channel 6 Compare Register                             */
  __IO uint32_t CH7CR;           /*!< 0x11C          Channel 7 Compare Register                             */
  #endif
} HT_PWM_TypeDef;


/**
 * @brief Single Channel Timer
 */
typedef struct
{
                                 /* SCTM0: 0x40034000                                                       */
                                 /* SCTM1: 0x40074000                                                       */
                                 /* SCTM2: 0x40035000                                                       */
                                 /* SCTM3: 0x40075000                                                       */
  __IO uint32_t CNTCFR;          /*!< 0x000          Counter Configuration Register                         */
  __IO uint32_t MDCFR;           /*!< 0x004          Mode Configuration Register                            */
  __IO uint32_t TRCFR;           /*!< 0x008          Trigger Configuration Register                         */
       uint32_t RESERVED0[1];    /*!< 0x00C          Reserved                                               */
  __IO uint32_t CTR;             /*!< 0x010          Control Register                                       */
       uint32_t RESERVED1[3];    /*!< 0x014 - 0x01C  Reserved                                               */
  __IO uint32_t CH0ICFR;         /*!< 0x020          Channel 0 Input Configuration Register                 */
  #if defined(USE_HT32F65240)
  __IO uint32_t CH1ICFR;         /*!< 0x024          Channel 1 Input Configuration Register                 */
       uint32_t RESERVED2[6];    /*!< 0x028 - 0x03C  Reserved                                               */
  #else
       uint32_t RESERVED2[7];    /*!< 0x024 - 0x03C  Reserved                                               */
  #endif
  __IO uint32_t CHOCFR;          /*!< 0x040          Channel Output Configuration Register                  */
       uint32_t RESERVED3[3];    /*!< 0x044 - 0x04C  Reserved                                               */
  __IO uint32_t CHCTR;           /*!< 0x050          Channel Control Register                               */
  __IO uint32_t CHPOLR;          /*!< 0x054          Channel Polarity Configuration Register                */
       uint32_t RESERVED4[7];    /*!< 0x058 - 0x070  Reserved                                               */
  __IO uint32_t DICTR;           /*!< 0x074          Interrupt Control Register                             */
  __IO uint32_t EVGR;            /*!< 0x078          Event Generator Register                               */
  __IO uint32_t INTSR;           /*!< 0x07C          Interrupt Status Register                              */
  __IO uint32_t CNTR;            /*!< 0x080          Counter Register                                       */
  __IO uint32_t PSCR;            /*!< 0x084          Prescaler Register                                     */
  __IO uint32_t CRR;             /*!< 0x088          Counter Reload Register                                */
       uint32_t RESERVED5[1];    /*!< 0x08C          Reserved                                               */
  __IO uint32_t CH0CCR;          /*!< 0x090          Channel 0 Capture/Compare Register                     */
  #if defined(USE_HT32F65240)
  __IO uint32_t CH1CCR;          /*!< 0x094          Channel 1 Capture Register                             */
  #endif
} HT_SCTM_TypeDef;


/**
 * @brief Divider
 */
typedef struct
{
                                 /* DIV: 0x400CA000                                                         */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t DDR;             /*!< 0x004         Dividend register                                       */
  __IO uint32_t DSR;             /*!< 0x008         Divisor Register                                        */
  __IO uint32_t QTR;             /*!< 0x00C         Quotient Register                                       */
  __IO uint32_t RMR;             /*!< 0x010         Remainder Register                                      */
} HT_DIV_TypeDef;


/**
 * @brief Advanced Encryption Standard
 */
typedef struct
{
                                 /* AES: 0x400C8000                                                         */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t SR;              /*!< 0x004         Status Register                                         */
  __IO uint32_t PDMAR;           /*!< 0x008         PDMA Register                                           */
  __IO uint32_t ISR;             /*!< 0x00C         Interrupt Status Register                               */
  __IO uint32_t IER;             /*!< 0x010         Interrupt Enable Register                               */
  __IO uint32_t DINR;            /*!< 0x014         Data Input Register                                     */
  __IO uint32_t DOUTR;           /*!< 0x018         Data Output Register                                    */
  __IO uint32_t KEYR[8];         /*!< 0x01C - 0x038 Key Register 0~7                                        */
  __IO uint32_t IVR[4];          /*!< 0x03C - 0x048 Initial Vector Register 0~3                             */
} HT_AES_TypeDef;


/**
 * @brief MIDI
 */
typedef struct
{
                                 /* MIDI: 0x40060000                                                        */
  __IO uint32_t CHAN;            /*!< 0x000 MIDI Channel Number Select                                      */
  __IO uint32_t FREQ;            /*!< 0x004 MIDI Frequency Number                                           */
  __IO uint32_t VOL;             /*!< 0x008 MIDI Volume Control                                             */
  __IO uint32_t ST_ADDR;         /*!< 0x00C MIDI Start Address                                              */
  __IO uint32_t RE_NUM;          /*!< 0x010 MIDI Repeat Number                                              */
  __IO uint32_t END_ADDR;        /*!< 0x014 MIDI End Address                                                */
  __IO uint32_t IER;             /*!< 0x018 MIDI Interrupt/DMA Enable Register                              */
  __IO uint32_t SR;              /*!< 0x01C MIDI Status Register                                            */
  __IO uint32_t MCU_CH0;         /*!< 0x020 MIDI MCU Channel0 data                                          */
  __IO uint32_t MCU_CH1;         /*!< 0x024 MIDI MCU Channel1 data                                          */
  __IO uint32_t MCU_CH2;         /*!< 0x028 MIDI MCU Channel2 data                                          */
  __IO uint32_t MCU_CH3;         /*!< 0x02C MIDI MCU Channel3 data                                          */
  __IO uint32_t MIDIL;           /*!< 0x030 MIDI Engine Waveform of Left Channel                            */
  __IO uint32_t MIDIR;           /*!< 0x034 MIDI Engine Waveform of Right Channel                           */
  __IO uint32_t SPI_DATA;        /*!< 0x038 MIDI SPI Flash data read                                        */
  __IO uint32_t SPI_ADDR;        /*!< 0x03C MIDI SPI Flash address read                                     */
  __IO uint32_t CTRL;            /*!< 0x040 MIDI Control Register                                           */
} HT_MIDI_TypeDef;


/**
 * @brief LCD
 */
typedef struct
{
                                 /* LCD: 0x4001A000                                                         */
  __IO uint32_t CR;              /*!< 0x000         Control Register                                        */
  __IO uint32_t FCR;             /*!< 0x004         Frame Control Register                                  */
  __IO uint32_t IER;             /*!< 0x008         Interrupt Enable Register                               */
  __IO uint32_t SR;              /*!< 0x00C         Status Register                                         */
  __IO uint32_t CLR;             /*!< 0x010         Clear Register                                          */
       uint32_t RESERVED[3];     /*!< 0x014 - 0x020 Reserved                                                */
  __IO uint32_t RAM[16];         /*!< 0x020 - 0x05C Display Memory                                          */
} HT_LCD_TypeDef;


/**
 * @brief Serial SLED Interface
 */
typedef struct
{
                                 /* SLED0: 0x4000E000                                                       */
                                 /* SLED1: 0x4004E000                                                       */
  __IO uint32_t CR;              /*!< 0x000          Control Register                                       */
  __IO uint32_t SR;              /*!< 0x004          Status Register                                        */
  __IO uint32_t CDR;             /*!< 0x008          Clock Divider Register                                 */
  __IO uint32_t TCR;             /*!< 0x00C          Timne Code Register                                    */
  __IO uint32_t DR;              /*!< 0x010          Data Register                                          */
  __IO uint32_t FCR;             /*!< 0x014          FIFO Control Register                                  */
} HT_SLED_TypeDef;
/**
  * @}
  */


/** @addtogroup Peripheral_Memory_Map
  * @{
  */

#define HT_SRAM_BASE             ((u32)0x20000000)

#define HT_PERIPH_BASE           ((u32)0x40000000)

#define HT_APBPERIPH_BASE        (HT_PERIPH_BASE)                 /* 0x40000000                             */
#define HT_AHBPERIPH_BASE        (HT_PERIPH_BASE + 0x80000)       /* 0x40080000                             */

/* APB                                                                                                      */
#define HT_USART0_BASE           (HT_APBPERIPH_BASE + 0x0000)     /* 0x40000000                             */
#define HT_UART0_BASE            (HT_APBPERIPH_BASE + 0x1000)     /* 0x40001000                             */
#define HT_UART2_BASE            (HT_APBPERIPH_BASE + 0x2000)     /* 0x40002000                             */
#define HT_SPI0_BASE             (HT_APBPERIPH_BASE + 0x4000)     /* 0x40004000                             */
#define HT_I2C2_BASE             (HT_APBPERIPH_BASE + 0x8000)     /* 0x40008000                             */
#define HT_SLED0_BASE            (HT_APBPERIPH_BASE + 0xE000)     /* 0x4000E000                             */
#define HT_ADC0_BASE             (HT_APBPERIPH_BASE + 0x10000)    /* 0x40010000                             */
#define HT_OPA0_BASE             (HT_APBPERIPH_BASE + 0x18000)    /* 0x40018000                             */
#define HT_OPA1_BASE             (HT_APBPERIPH_BASE + 0x18100)    /* 0x40018100                             */
#define HT_LCD_BASE              (HT_APBPERIPH_BASE + 0x1A000)    /* 0x4001A000                             */
#define HT_AFIO_BASE             (HT_APBPERIPH_BASE + 0x22000)    /* 0x40022000                             */
#define HT_EXTI_BASE             (HT_APBPERIPH_BASE + 0x24000)    /* 0x40024000                             */
#define HT_I2S_BASE              (HT_APBPERIPH_BASE + 0x26000)    /* 0x40026000                             */
#define HT_MCTM0_BASE            (HT_APBPERIPH_BASE + 0x2C000)    /* 0x4002C000                             */
#define HT_PWM0_BASE             (HT_APBPERIPH_BASE + 0x31000)    /* 0x40031000                             */
#define HT_SCTM0_BASE            (HT_APBPERIPH_BASE + 0x34000)    /* 0x40034000                             */
#define HT_PWM2_BASE             (HT_APBPERIPH_BASE + 0x32000)    /* 0x40031000                             */
#define HT_SCTM2_BASE            (HT_APBPERIPH_BASE + 0x35000)    /* 0x40035000                             */
#define HT_SCI1_BASE             (HT_APBPERIPH_BASE + 0x3A000)    /* 0x4003A000                             */
#define HT_USART1_BASE           (HT_APBPERIPH_BASE + 0x40000)    /* 0x40040000                             */
#define HT_UART1_BASE            (HT_APBPERIPH_BASE + 0x41000)    /* 0x40041000                             */
#define HT_UART3_BASE            (HT_APBPERIPH_BASE + 0x42000)    /* 0x40042000                             */
#define HT_SCI0_BASE             (HT_APBPERIPH_BASE + 0x43000)    /* 0x40043000                             */
#define HT_SPI1_BASE             (HT_APBPERIPH_BASE + 0x44000)    /* 0x40044000                             */
#define HT_I2C0_BASE             (HT_APBPERIPH_BASE + 0x48000)    /* 0x40048000                             */
#define HT_I2C1_BASE             (HT_APBPERIPH_BASE + 0x49000)    /* 0x40049000                             */
#define HT_SLED1_BASE            (HT_APBPERIPH_BASE + 0x4E000)    /* 0x4004E000                             */
#define HT_ADC1_BASE             (HT_APBPERIPH_BASE + 0x50000)    /* 0x40050000                             */
#define HT_DACDUAL16_BASE        (HT_APBPERIPH_BASE + 0x54000)    /* 0x40054000                             */
#define HT_DAC_BASE              (HT_APBPERIPH_BASE + 0x54000)    /* 0x40054000                             */
#define HT_CMP0_BASE             (HT_APBPERIPH_BASE + 0x58000)    /* 0x40058000                             */
#define HT_CMP1_BASE             (HT_APBPERIPH_BASE + 0x58100)    /* 0x40058100                             */
#define HT_CMP2_BASE             (HT_APBPERIPH_BASE + 0x58200)    /* 0x40058200                             */
#define HT_MIDI_BASE             (HT_APBPERIPH_BASE + 0x60000)    /* 0x40060000                             */
#define HT_WDT_BASE              (HT_APBPERIPH_BASE + 0x68000)    /* 0x40068000                             */
#define HT_RTC_BASE              (HT_APBPERIPH_BASE + 0x6A000)    /* 0x4006A000                             */
#define HT_PWRCU_BASE            (HT_APBPERIPH_BASE + 0x6A100)    /* 0x4006A100                             */
#define HT_GPTM0_BASE            (HT_APBPERIPH_BASE + 0x6E000)    /* 0x4006E000                             */
#define HT_GPTM1_BASE            (HT_APBPERIPH_BASE + 0x6F000)    /* 0x4006F000                             */
#define HT_PWM1_BASE             (HT_APBPERIPH_BASE + 0x71000)    /* 0x40071000                             */
#define HT_SCTM1_BASE            (HT_APBPERIPH_BASE + 0x74000)    /* 0x40074000                             */
#define HT_SCTM3_BASE            (HT_APBPERIPH_BASE + 0x75000)    /* 0x40075000                             */
#define HT_BFTM0_BASE            (HT_APBPERIPH_BASE + 0x76000)    /* 0x40076000                             */
#define HT_BFTM1_BASE            (HT_APBPERIPH_BASE + 0x77000)    /* 0x40077000                             */

/* AHB                                                                                                      */
#define HT_FLASH_BASE            (HT_AHBPERIPH_BASE + 0x0000)     /* 0x40080000                             */
#define HT_CKCU_BASE             (HT_AHBPERIPH_BASE + 0x8000)     /* 0x40088000                             */
#define HT_RSTCU_BASE            (HT_AHBPERIPH_BASE + 0x8100)     /* 0x40088100                             */
#define HT_CRC_BASE              (HT_AHBPERIPH_BASE + 0xA000)     /* 0x4008A000                             */
#define HT_PDMA_BASE             (HT_AHBPERIPH_BASE + 0x10000)    /* 0x40090000                             */
#define HT_EBI_BASE              (HT_AHBPERIPH_BASE + 0x18000)    /* 0x40098000                             */
#define HT_USB_BASE              (HT_AHBPERIPH_BASE + 0x28000)    /* 0x400A8000                             */
#define HT_USB_EP0_BASE          (HT_USB_BASE       + 0x0014)     /* 0x400A8014                             */
#define HT_USB_EP1_BASE          (HT_USB_BASE       + 0x0028)     /* 0x400A8028                             */
#define HT_USB_EP2_BASE          (HT_USB_BASE       + 0x003C)     /* 0x400A803C                             */
#define HT_USB_EP3_BASE          (HT_USB_BASE       + 0x0050)     /* 0x400A8050                             */
#define HT_USB_EP4_BASE          (HT_USB_BASE       + 0x0064)     /* 0x400A8064                             */
#define HT_USB_EP5_BASE          (HT_USB_BASE       + 0x0078)     /* 0x400A8078                             */
#define HT_USB_EP6_BASE          (HT_USB_BASE       + 0x008C)     /* 0x400A808C                             */
#define HT_USB_EP7_BASE          (HT_USB_BASE       + 0x00A0)     /* 0x400A80A0                             */
#define HT_USB_SRAM_BASE         (HT_AHBPERIPH_BASE + 0x2A000)    /* 0x400AA000                             */
#define HT_GPIOA_BASE            (HT_AHBPERIPH_BASE + 0x30000)    /* 0x400B0000                             */
#define HT_GPIOB_BASE            (HT_AHBPERIPH_BASE + 0x32000)    /* 0x400B2000                             */
#define HT_GPIOC_BASE            (HT_AHBPERIPH_BASE + 0x34000)    /* 0x400B4000                             */
#define HT_GPIOD_BASE            (HT_AHBPERIPH_BASE + 0x36000)    /* 0x400B6000                             */
#define HT_GPIOE_BASE            (HT_AHBPERIPH_BASE + 0x38000)    /* 0x400B8000                             */
#define HT_GPIOF_BASE            (HT_AHBPERIPH_BASE + 0x3A000)    /* 0x400BA000                             */
#define HT_AES_BASE              (HT_AHBPERIPH_BASE + 0x48000)    /* 0x400C8000                             */
#define HT_DIV_BASE              (HT_AHBPERIPH_BASE + 0x4A000)    /* 0x400CA000                             */
#define HT_QSPI_BASE             (HT_AHBPERIPH_BASE + 0x60000)    /* 0x400E0000                             */

/**
  * @}
  */

/* Peripheral declaration                                                                                   */
#define HT_FLASH                 ((HT_FLASH_TypeDef *) HT_FLASH_BASE)
#define HT_CKCU                  ((HT_CKCU_TypeDef *) HT_CKCU_BASE)
#define HT_PWRCU                 ((HT_PWRCU_TypeDef *) HT_PWRCU_BASE)
#define HT_RSTCU                 ((HT_RSTCU_TypeDef *) HT_RSTCU_BASE)
#define HT_AFIO                  ((HT_AFIO_TypeDef *) HT_AFIO_BASE)
#define HT_EXTI                  ((HT_EXTI_TypeDef *) HT_EXTI_BASE)
#define HT_GPIOA                 ((HT_GPIO_TypeDef *) HT_GPIOA_BASE)
#define HT_GPIOB                 ((HT_GPIO_TypeDef *) HT_GPIOB_BASE)
#define HT_BFTM0                 ((HT_BFTM_TypeDef *) HT_BFTM0_BASE)
#define HT_GPTM0                 ((HT_TM_TypeDef *) HT_GPTM0_BASE)
#define HT_WDT                   ((HT_WDT_TypeDef *) HT_WDT_BASE)
#define HT_UART0                 ((HT_USART_TypeDef *) HT_UART0_BASE)
#define HT_SPI0                  ((HT_SPI_TypeDef *) HT_SPI0_BASE)
#define HT_I2C0                  ((HT_I2C_TypeDef *) HT_I2C0_BASE)

#if !defined(USE_HT32F0008)
#define HT_ADC0                  ((HT_ADC_TypeDef *) HT_ADC0_BASE)
#endif

#if !defined(USE_HT32F0008) && !defined(USE_HT32F50220_30) && !defined(USE_HT32F50231_41)
#define HT_SCTM0                 ((HT_TM_TypeDef *) HT_SCTM0_BASE)
#define HT_SCTM1                 ((HT_TM_TypeDef *) HT_SCTM1_BASE)
#endif

#if defined(USE_HT32F52231_41) || defined(USE_HT32F52331_41) || defined(USE_HT32F52243_53) || defined(USE_HT32F0006) || defined(USE_HT32F65240)
#define HT_SCTM2                 ((HT_TM_TypeDef *) HT_SCTM2_BASE)
#define HT_SCTM3                 ((HT_TM_TypeDef *) HT_SCTM3_BASE)
#endif

#if !defined(USE_HT32F50220_30) && !defined(USE_HT32F52344_54) && !defined(USE_HT32F50343)
#define HT_USART0                ((HT_USART_TypeDef *) HT_USART0_BASE)
#endif

#if defined(USE_HT32F52331_41) || defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41)
#define HT_SCI0                  ((HT_SCI_TypeDef *) HT_SCI0_BASE)
#endif

#if defined(USE_HT32F52331_41) || defined(USE_HT32F52342_52) || defined(USE_HT32F5826) || defined(USE_HT32F0008) || defined(USE_HT32F52344_54) || defined(USE_HT32F0006) || defined(USE_HT32F52357_67) || defined(USE_HT32F57342_52) || defined(USE_HT32F57331_41) || defined(USE_HT32F50343)
#define HT_USB                   ((HT_USB_TypeDef *) HT_USB_BASE)
#define HT_USBEP0                ((HT_USBEP_TypeDef *) HT_USB_EP0_BASE)
#define HT_USBEP1                ((HT_USBEP_TypeDef *) HT_USB_EP1_BASE)
#define HT_USBEP2                ((HT_USBEP_TypeDef *) HT_USB_EP2_BASE)
#define HT_USBEP3                ((HT_USBEP_TypeDef *) HT_USB_EP3_BASE)
#define HT_USBEP4                ((HT_USBEP_TypeDef *) HT_USB_EP4_BASE)
#define HT_USBEP5                ((HT_USBEP_TypeDef *) HT_USB_EP5_BASE)
#define HT_USBEP6                ((HT_USBEP_TypeDef *) HT_USB_EP6_BASE)
#define HT_USBEP7                ((HT_USBEP_TypeDef *) HT_USB_EP7_BASE)
#endif

#if defined(USE_HT32F52231_41) || defined(USE_HT32F52331_41)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#endif

#if defined(USE_HT32F52342_52) || defined(USE_HT32F5826)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_CMP0                  ((HT_CMP_TypeDef *) HT_CMP0_BASE)
#define HT_CMP1                  ((HT_CMP_TypeDef *) HT_CMP1_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_GPTM1                 ((HT_TM_TypeDef *) HT_GPTM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_SCI1                  ((HT_SCI_TypeDef *) HT_SCI1_BASE)
#define HT_EBI                   ((HT_EBI_TypeDef *) HT_EBI_BASE)
#define HT_I2S                   ((HT_I2S_TypeDef *) HT_I2S_BASE)
#define HT_USART1                ((HT_USART_TypeDef *) HT_USART1_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#endif

#if defined(USE_HT32F52243_53)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_USART1                ((HT_USART_TypeDef *) HT_USART1_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_UART2                 ((HT_USART_TypeDef *) HT_UART2_BASE)
#define HT_UART3                 ((HT_USART_TypeDef *) HT_UART3_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_I2C2                  ((HT_I2C_TypeDef *) HT_I2C2_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#endif

#if defined(USE_HT32F0008)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_AES                   ((HT_AES_TypeDef *) HT_AES_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOF                 ((HT_GPIO_TypeDef *) HT_GPIOF_BASE)
#endif

#if defined(USE_HT32F50220_30)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#endif

#if defined(USE_HT32F50231_41)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#endif

#if defined(USE_HT32F52344_54)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_CMP0                  ((HT_CMP_TypeDef *) HT_CMP0_BASE)
#define HT_CMP1                  ((HT_CMP_TypeDef *) HT_CMP1_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_EBI                   ((HT_EBI_TypeDef *) HT_EBI_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#endif

#if defined(USE_HT32F0006)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#define HT_QSPI                  ((HT_SPI_TypeDef *) HT_QSPI_BASE)
#define HT_I2S                   ((HT_I2S_TypeDef *) HT_I2S_BASE)
#define HT_DACDUAL16             ((HT_DAC_DUAL16_TypeDef *) HT_DACDUAL16_BASE)
#define HT_MIDI                  ((HT_MIDI_TypeDef *) HT_MIDI_BASE)
#endif

#if defined(USE_HT32F52357_67)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_DAC                   ((HT_DAC_TypeDef *) HT_DAC_BASE)
#define HT_CMP0                  ((HT_CMP_TypeDef *) HT_CMP0_BASE)
#define HT_CMP1                  ((HT_CMP_TypeDef *) HT_CMP1_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_SCI1                  ((HT_SCI_TypeDef *) HT_SCI1_BASE)
#define HT_EBI                   ((HT_EBI_TypeDef *) HT_EBI_BASE)
#define HT_I2S                   ((HT_I2S_TypeDef *) HT_I2S_BASE)
#define HT_USART1                ((HT_USART_TypeDef *) HT_USART1_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_UART2                 ((HT_USART_TypeDef *) HT_UART2_BASE)
#define HT_UART3                 ((HT_USART_TypeDef *) HT_UART3_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_QSPI                  ((HT_SPI_TypeDef *) HT_QSPI_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_AES                   ((HT_AES_TypeDef *) HT_AES_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#define HT_GPIOE                 ((HT_GPIO_TypeDef *) HT_GPIOE_BASE)
#endif

#if defined(USE_HT32F57342_52)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_DAC                   ((HT_DAC_TypeDef *) HT_DAC_BASE)
#define HT_CMP0                  ((HT_CMP_TypeDef *) HT_CMP0_BASE)
#define HT_CMP1                  ((HT_CMP_TypeDef *) HT_CMP1_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_SCI1                  ((HT_SCI_TypeDef *) HT_SCI1_BASE)
#define HT_I2S                   ((HT_I2S_TypeDef *) HT_I2S_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_AES                   ((HT_AES_TypeDef *) HT_AES_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#define HT_GPIOE                 ((HT_GPIO_TypeDef *) HT_GPIOE_BASE)
#define HT_LCD                   ((HT_LCD_TypeDef *) HT_LCD_BASE)
#endif

#if defined(USE_HT32F57331_41)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#define HT_LCD                   ((HT_LCD_TypeDef *) HT_LCD_BASE)
#endif

#if defined(USE_HT32F65240)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#define HT_ADC1                  ((HT_ADC_TypeDef *) HT_ADC1_BASE)
#define HT_CMP0                  ((HT_CMP_TypeDef *) HT_CMP0_BASE)
#define HT_CMP1                  ((HT_CMP_TypeDef *) HT_CMP1_BASE)
#define HT_CMP2                  ((HT_CMP_TypeDef *) HT_CMP2_BASE)
#define HT_OPA0                  ((HT_OPA_TypeDef *) HT_OPA0_BASE)
#define HT_OPA1                  ((HT_OPA_TypeDef *) HT_OPA1_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_MCTM0                 ((HT_TM_TypeDef *) HT_MCTM0_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#endif

#if defined(USE_HT32F50343)
#define HT_UART1                 ((HT_USART_TypeDef *) HT_UART1_BASE)
#define HT_SPI1                  ((HT_SPI_TypeDef *) HT_SPI1_BASE)
#define HT_I2C1                  ((HT_I2C_TypeDef *) HT_I2C1_BASE)
#define HT_RTC                   ((HT_RTC_TypeDef *) HT_RTC_BASE)
#define HT_PWM0                  ((HT_TM_TypeDef *) HT_PWM0_BASE)
#define HT_PWM1                  ((HT_TM_TypeDef *) HT_PWM1_BASE)
#define HT_PWM2                  ((HT_TM_TypeDef *) HT_PWM2_BASE)
#define HT_BFTM1                 ((HT_BFTM_TypeDef *) HT_BFTM1_BASE)
#define HT_SLED0                 ((HT_SLED_TypeDef *) HT_SLED0_BASE)
#define HT_SLED1                 ((HT_SLED_TypeDef *) HT_SLED1_BASE)
#define HT_GPIOC                 ((HT_GPIO_TypeDef *) HT_GPIOC_BASE)
#define HT_GPIOD                 ((HT_GPIO_TypeDef *) HT_GPIOD_BASE)
#define HT_CRC                   ((HT_CRC_TypeDef *) HT_CRC_BASE)
#define HT_DIV                   ((HT_DIV_TypeDef *) HT_DIV_BASE)
#define HT_PDMA                  ((HT_PDMA_TypeDef *) HT_PDMA_BASE)
#endif


#if defined USE_HT32_DRIVER
  #include "ht32f5xxxx_lib.h"
#endif

/**
 * @brief Define for backward compatibility
 */
#define HT_ADC       HT_ADC0
#define ADC          ADC0
#define ADC_IRQn     ADC0_IRQn


/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif


/**
  * @}
  */

/**
  * @}
  */

/******************* (C) COPYRIGHT Holtek Semiconductor Inc. *****END OF FILE***                            */
