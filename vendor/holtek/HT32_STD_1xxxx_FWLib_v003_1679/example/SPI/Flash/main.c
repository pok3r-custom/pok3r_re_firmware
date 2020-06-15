/*********************************************************************************************************//**
 * @file    SPI/Flash/main.c
 * @version $Rev:: 1349         $
 * @date    $Date:: 2018-08-02 #$
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup SPI_Examples SPI
  * @{
  */

/** @addtogroup SPI_Flash Flash
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define BufferSize  256

#define FLASH_WriteAddress     0x100000
#define FLASH_ReadAddress      FLASH_WriteAddress
#define FLASH_SectorToErase    FLASH_WriteAddress

/* Global variables ----------------------------------------------------------------------------------------*/
u8 Tx_Buffer[BufferSize];
u8 Rx_Buffer[BufferSize];
vu32 FLASH_ID = 0;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i, err = 0, result;

  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  for (i = 0; i < BufferSize; i++)
  {
    Tx_Buffer[i] = i;
  }

  /* Initialize the SPI_FLASH driver                                                                        */
  result = SPI_FLASH_Init();

  /* Check the SPI Flash ID                                                                                 */
  if (result == TRUE)
  {
    /* Turn on LED1                                                                                         */
    HT32F_DVB_LEDOn(HT_LED1);
  }
  else
  {
    /* Turn off LED1                                                                                        */
    HT32F_DVB_LEDOff(HT_LED1);
  }

  /* Read SPI Flash ID                                                                                      */
  FLASH_ID = SPI_FLASH_ReadJEDECID();

  /* Clear the Block Protection bit                                                                         */
  SPI_FLASH_WriteStatus(0x00);

  /* Erase SPI FLASH Sector to write on                                                                     */
  SPI_FLASH_SectorErase(FLASH_SectorToErase);

  /* Write Tx_Buffer data to SPI FLASH memory                                                               */
  SPI_FLASH_BufferWrite(Tx_Buffer, FLASH_WriteAddress, BufferSize);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  SPI_FLASH_BufferDualRead((u16*)Rx_Buffer, FLASH_ReadAddress, BufferSize/2);

  /* Check the correctness of written data                                                                  */
  for (i = 0; i < BufferSize; i++)
  {
    if (Rx_Buffer[i] != Tx_Buffer[i])
    {
      err++;
    }
  }

  if (err == 0)
  {
    /*  Turn on LED2                                                                                        */
    HT32F_DVB_LEDOn(HT_LED2);
  }
  else
  {
    /*  Turn off LED2                                                                                       */
    HT32F_DVB_LEDOff(HT_LED2);
  }

  err = 0;

  /* Erase SPI FLASH Sector to write on                                                                     */
  SPI_FLASH_SectorErase(FLASH_SectorToErase);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  SPI_FLASH_BufferRead(Rx_Buffer, FLASH_ReadAddress, BufferSize);

  /* Check the correctness of written data                                                                  */
  for (i = 0; i < BufferSize; i++)
  {
    if (Rx_Buffer[i] != 0xFF)
    {
      err++;
    }
  }

  if (err == 0)
  {
    /*  Turn on LED3                                                                                        */
    HT32F_DVB_LEDOn(HT_LED3);
  }
  else
  {
    /*  Turn off LED3                                                                                       */
    HT32F_DVB_LEDOff(HT_LED3);
  }

  while (1);
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
