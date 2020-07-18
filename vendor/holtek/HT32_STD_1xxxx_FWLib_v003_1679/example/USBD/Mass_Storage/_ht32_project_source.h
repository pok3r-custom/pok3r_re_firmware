/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/_ht32_project_source.h
 * @version $Rev:: 1759         $
 * @date    $Date:: 2017-09-05 #$
 * @brief   The project source code setting.
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
#ifndef __HT32_PROJECT_SOURCE_H
#define __HT32_PROJECT_SOURCE_H

#ifdef __cplusplus
 extern "C" {
#endif

/*----------------------------------------------------------------------------------------------------------*/
/* Following source code files is a part of the example/application code. We add those file here to reduce  */
/* extra project file maintenance effort. The file, "_ht32_project_source.h" is included by "main.c". User  */
/* shall add files below into 'User" group of project compiling list when create/modify their own project.  */
/*----------------------------------------------------------------------------------------------------------*/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ram_disk.c"
#include "sd_disk.c"
#include "spi_sd.c"
#include "usb_bulk_only_transport.c"
#include "usb_scsi_block_command.c"


#ifdef __cplusplus
}
#endif

#endif
