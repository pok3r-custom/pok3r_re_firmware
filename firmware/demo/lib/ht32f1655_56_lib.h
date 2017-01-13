/*********************************************************************************************************//**
 * @file    ht32f1655_56_lib.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file includes all the header files of the libraries.
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

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F1655_56_LIB_H
#define __HT32F1655_56_LIB_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "ht32f1655_56_conf.h"

#if (HT32_LIB_DEBUG == 1)
/**
  * @brief  The assert_param macro is used for function's parameters check.
  * @param  expr: If expr is false, it calls assert_failed function
  *   which reports the name of the source file and the source
  *   line number of the call that failed.
  *   If expr is true, it returns no value.
  * @retval None
  */
#define Assert_Param(expr) ((expr) ? (void)0 : assert_error((u8 *)__FILE__, __LINE__))
/* Exported functions ------------------------------------------------------- ------------------------------*/
void assert_error(u8* file, u32 line);
#else

#define Assert_Param(expr) ((void)0)

#endif /* DEBUG --------------------------------------------------------------------------------------------*/


#if _USART
  #include "ht32f1655_56_usart.h"
#endif

#if _SPI
  #include "ht32f1655_56_spi.h"
#endif

#if _ADC
  #include "ht32f1655_56_adc.h"
#endif

#if _CMP_OP
  #include "ht32f1655_56_cmp_op.h"
#endif

#if _GPIO
  #include "ht32f1655_56_gpio.h"
#endif

#if _EXTI
  #include "ht32f1655_56_exti.h"
#endif

#if _MCTM
  #include "ht32f1655_56_mctm.h"
#endif

#if _SCI
  #include "ht32f1655_56_sci.h"
#endif

#if _I2S
  #include "ht32f1655_56_i2s.h"
#endif

#if _I2C
  #include "ht32f1655_56_i2c.h"
#endif

#if _USB
  #include "ht32f1655_56_usbd.h"
#endif

#if _WDT
  #include "ht32f1655_56_wdt.h"
#endif

#if _RTC
  #include "ht32f1655_56_rtc.h"
#endif

#if _PWRCU
  #include "ht32f1655_56_pwrcu.h"
#endif

#if _GPTM
  #include "ht32f1655_56_gptm.h"
#endif

#if _BFTM
  #include "ht32f1655_56_bftm.h"
#endif

#if _FLASH
  #include "ht32f1655_56_flash.h"
#endif

#if _CKCU
  #include "ht32f1655_56_ckcu.h"
#endif

#if _RSTCU
  #include "ht32f1655_56_rstcu.h"
#endif

#if _CRC
  #include "ht32f1655_56_crc.h"
#endif

#if _PDMA
  #include "ht32f1655_56_pdma.h"
#endif

#if _EBI
  #include "ht32f1655_56_ebi.h"
#endif

#if _MISC
  #include "ht32_cm3_misc.h"
#endif

#if (_RETARGET)
  #if defined (__GNUC__)
    #undef getchar
    #define getchar SERIAL_GetChar
  #endif
#endif

#include "ht32_serial.h"

#ifdef __cplusplus
}
#endif

#endif
