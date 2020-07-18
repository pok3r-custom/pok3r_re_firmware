/*********************************************************************************************************//**
 * @file    FMC/FLASH_Write_Protection/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   Main program.
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup FMC_Examples FMC
  * @{
  */

/** @addtogroup FLASH_Write_Protection
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define StartAddress    (1024 * 4)
#define EndAddress      (1024 * 8)

/* An alternative function in this example                                                                  */
#define WRITE_PROTECT_ENABLE   /* Enable Flash write protection                                             */
//#define WRITE_PROTECT_DISABLE  /* Disable Flash write protection                                          */

/* Private function prototypes -----------------------------------------------------------------------------*/
void EnableWriteProtect(void);
void DisableWriteProtect(void);

/* Global variables ----------------------------------------------------------------------------------------*/
u32 err;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i, Addr;
  FLASH_State FLASHState;

#ifdef WRITE_PROTECT_ENABLE

  EnableWriteProtect();

  err = 0;
  /* Check Erase Flash pages not work                                                                       */
  for (i = StartAddress; i < EndAddress; i += FLASH_PAGE_SIZE)
  {
    FLASHState = FLASH_ErasePage(i);
    if (FLASHState != FLASH_ERR_WRITE_PROTECTED)
    {
      err++;
    }
  }

  /* Check program word data not work                                                                       */
  for (Addr = StartAddress; Addr < EndAddress; Addr += 4)
  {
    FLASHState = FLASH_ProgramWordData(Addr, 0x00000000);
    if (FLASHState != FLASH_ERR_WRITE_PROTECTED)
    {
      err++;
    }
  }
  /* Check program word data not work                                                                       */
  for (Addr = StartAddress; Addr < EndAddress; Addr += 4)
  {
    if (rw(Addr) == 0x00000000)
    {
      err++;
    }
  }

  if (err != 0)
  {
    while (1); /* Test Failed                                                                               */
  }

  while (1); /* Test Passed                                                                                 */

#elif defined (WRITE_PROTECT_DISABLE)

  DisableWriteProtect();

  /* Erase Flash pages before program data                                                                  */
  for (i = StartAddress; i < EndAddress; i += FLASH_PAGE_SIZE)
  {
    FLASHState = FLASH_ErasePage(i);
    if (FLASHState != FLASH_COMPLETE)
    {
      err++;
    }
  }

  /* Program Word data                                                                                      */
  for (Addr = StartAddress; Addr < EndAddress; Addr += 4)
  {
    FLASHState = FLASH_ProgramWordData(Addr, Addr);
    if (FLASHState != FLASH_COMPLETE)
    {
      err++;
    }
  }
  /* Check Flash data                                                                                       */
  for (Addr = StartAddress; Addr < EndAddress; Addr += 4)
  {
    if (rw(Addr) != Addr)
    {
      err++;
    }
  }

  if (err != 0)
  {
    while (1); /* Test Failed                                                                               */
  }

  while (1); /* Test Passed                                                                                 */
#endif
}

/*********************************************************************************************************//**
  * @brief  Check and eanble write protect.
  * @retval None
  ***********************************************************************************************************/
void EnableWriteProtect(void)
{
  u32 uWPStatus;
  FLASH_OptionByte Option;

  /* Get Flash write protection status                                                                      */
  FLASH_GetOptionByteStatus(&Option);
  uWPStatus = FLASH_IS_WP_PAGE(Option, 4) |
              FLASH_IS_WP_PAGE(Option, 5) |
              FLASH_IS_WP_PAGE(Option, 6) |
              FLASH_IS_WP_PAGE(Option, 7) ;

  if (uWPStatus == 0)
  {
    /* Before Option Byte programming, the erase operation should be performed                              */
    FLASH_EraseOptionByte();

    /* Enable page write protection                                                                         */
    FLASH_WP_PAGE_SET(Option, 4);
    FLASH_WP_PAGE_SET(Option, 5);
    FLASH_WP_PAGE_SET(Option, 6);
    FLASH_WP_PAGE_SET(Option, 7);
    //FLASH_WP_ALLPAGE_SET(Option);
    FLASH_ProgramOptionByte(&Option);

    /* After system reset, the Option Byte value could be reloaded                                          */
    NVIC_SystemReset();
  }
}

/*********************************************************************************************************//**
  * @brief  Check and disable write protect.
  * @retval None
  ***********************************************************************************************************/
void DisableWriteProtect(void)
{
  u32 uWPStatus;
  FLASH_OptionByte Option;

  /* Get Flash write protection status                                                                      */
  FLASH_GetOptionByteStatus(&Option);
  uWPStatus = FLASH_IS_WP_PAGE(Option, 4) |
              FLASH_IS_WP_PAGE(Option, 5) |
              FLASH_IS_WP_PAGE(Option, 6) |
              FLASH_IS_WP_PAGE(Option, 7) ;

  if (uWPStatus != 0)
  {
    /* Before Option Byte programming, the erase operation should be performed                              */
    FLASH_EraseOptionByte();

    /* Enable page write protection                                                                         */
    FLASH_WP_PAGE_CLEAR(Option, 4);
    FLASH_WP_PAGE_CLEAR(Option, 5);
    FLASH_WP_PAGE_CLEAR(Option, 6);
    FLASH_WP_PAGE_CLEAR(Option, 7);
    FLASH_ProgramOptionByte(&Option);

    /* After system reset, the Option Byte value could be reloaded                                          */
    NVIC_SystemReset();
  }
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
