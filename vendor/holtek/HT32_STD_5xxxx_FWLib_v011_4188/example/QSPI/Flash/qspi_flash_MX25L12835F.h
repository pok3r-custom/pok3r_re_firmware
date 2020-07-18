/*********************************************************************************************************//**
 * @file    qspi_flash_MX25L12835F.h
 * @version $Rev:: 3171         $
 * @date    $Date:: 2018-10-25 #$
 * @brief   The header file of MX25L12835F.
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
#ifndef __QSPI_FLASH_MX25L12835L_H
#define __QSPI_FLASH_MX25L12835L_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/* Setting -------------------------------------------------------------------------------------------------*/
#define FLASH_QSPI          HT_QSPI

/* Exported functions --------------------------------------------------------------------------------------*/
void QSPI_FLASH_Init(void);

void QSPI_FLASH_BE32K(u32 SectorAddr);
void QSPI_FLASH_BE64K(u32 SectorAddr);
void QSPI_FLASH_ChipErase(void);
void QSPI_FLASH_SE(u32 SectorAddr);

u32 QSPI_FLASH_RDID(void);
u32 QSPI_FLASH_ReadID(void);

void QSPI_FLASH_WRR(u8 Status_data, u8 Configuration_data);

void QSPI_FLASH_QOR(u16* pBuffer, u32 ReadAddr, u16 NumByteToRead);
void QSPI_FLASH_QPP(u16* pBuffer, u32 WriteAddr, u16 NumByteToWrite);
void QSPI_FLASH_BYTE_QOR(u8* pBuffer, u32 ReadAddr, u16 NumByteToRead);
void QSPI_FLASH_BYTE_QPP(u8* pBuffer, u32 WriteAddr, u16 NumByteToWrite);

#endif /* __QSPI_FLASH_MX25L12835L_H ---------------------------------------------------------------------------------*/
