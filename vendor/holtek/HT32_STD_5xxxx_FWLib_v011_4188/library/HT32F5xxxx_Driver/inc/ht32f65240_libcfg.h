/*********************************************************************************************************//**
 * @file    ht32f65240_libcfg.h
 * @version $Rev:: 4177         $
 * @date    $Date:: 2019-08-03 #$
 * @brief   The library configuration file.
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
/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F65240_LIBCFG_H
#define __HT32F65240_LIBCFG_H

/* Settings ------------------------------------------------------------------------------------------------*/

#if !defined(USE_MEM_HT32F65240)
#define USE_MEM_HT32F65240
#endif

#define LIBCFG_FLASH_PAGESIZE             (1024)

#ifdef USE_MEM_HT32F65240
  #define LIBCFG_FLASH_SIZE               (LIBCFG_FLASH_PAGESIZE * 63)
  #define LIBCFG_RAM_SIZE                 (1024 * 8)
  #define LIBCFG_CHIPNAME                 (0x65240)
#endif

#define LIBCFG_ADC1                       (1)
#define LIBCFG_BFTM1                      (1)
#define LIBCFG_CACHE                      (1)
#define LIBCFG_CKCU_ATM_V01               (1)
#define LIBCFG_CKCU_NO_ADCPRE_DIV1        (1)
#define LIBCFG_CKCU_PLLSRCDIV             (1)
#define LIBCFG_CKCU_SYS_CK_60M            (1)
#define LIBCFG_CMP                        (1)
#define LIBCFG_CMP_NOSCALER_SRC           (1)
#define LIBCFG_CRC                        (1)
#define LIBCFG_DIV                        (1)
#define LIBCFG_FMC_WAIT_STATE_2           (1)
#define LIBCFG_GPIOC                      (1)
#define LIBCFG_LSE                        (1)
#define LIBCFG_MCTM0                      (1)
#define LIBCFG_NO_PWRCU_PDF               (1)
#define LIBCFG_NO_PWRCU_PORF              (1)
#define LIBCFG_NO_PWRCU_POWER_DOWN_MODE   (1)
#define LIBCFG_NO_PWRCU_TEST_REG          (1)
#define LIBCFG_NO_PWRCU_V15_READY_SOURCE  (1)
#define LIBCFG_OPA                        (1)
#define LIBCFG_PDMA                       (1)
#define LIBCFG_PDMA_CH3FIX                (1)
#define LIBCFG_SCTM_2CH                   (1)
#define LIBCFG_TM_65240                   (1)
#define LIBCFG_PWRCU_VDD_5V               (1)

#endif
