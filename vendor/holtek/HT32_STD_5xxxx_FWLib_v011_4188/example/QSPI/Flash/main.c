/*********************************************************************************************************//**
 * @file    QSPI/Flash/main.c
 * @version $Rev:: 3183         $
 * @date    $Date:: 2018-10-25 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup QSPI_Examples QSPI
  * @{
  */

/** @addtogroup Flash
  * @{
  */

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "qspi_flash_MX25L12835F.h"
#include "_ht32_project_source.h"

/* Settings ------------------------------------------------------------------------------------------------*/
#define QSPIx HT_QSPI
#define BufferSize  256

/* Private constants ---------------------------------------------------------------------------------------*/
#define FLASH_WriteAddress     0x100000
#define FLASH_ReadAddress      FLASH_WriteAddress
#define FLASH_SectorToErase    FLASH_WriteAddress

/* Private variables ---------------------------------------------------------------------------------------*/
u8 Tx_Buffer[BufferSize];
u8 Rx_Buffer[BufferSize];
u16 Rx_Buffer16[BufferSize/2];
vu32 FLASH_ID;

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u16 i, err = 0;
  u16 *pTx_Buffer16 = (u16*)Tx_Buffer;

  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configure                                             */

  /* Initialize LED                                                                                         */
  HT32F_DVB_LEDInit(HT_LED1);

  /* Inital Tx Buffer */
  for (i = 0; i < BufferSize; i++)
  {
    Tx_Buffer[i] = i;
  }

  /* initialize the QSPI flash driver */
  QSPI_FLASH_Init();

  /* Read SPI Flash ID                                                                                      */
  FLASH_ID = QSPI_FLASH_RDID();

  /* Set Status Reg and Configuration reg,                                                                  */
  /* Status Reg:        0x42, bit2: Write enable l tch, Bit6:Quad Enable.                                   */
  /* Configuration Reg: 0x07, Output driver stength: 30 Ohms.                                               */
  QSPI_FLASH_WRR(0x42, 0x7);

  /**********************************************************************************************************/
  /* Byte Write/Read Test                                                                                   */
  /**********************************************************************************************************/
  /* Erase SPI FLASH Sector to write on                                                                     */
  QSPI_FLASH_SE(FLASH_SectorToErase);

  /* Write Tx_Buffer data to SPI FLASH memory                                                               */
  QSPI_FLASH_BYTE_QPP(Tx_Buffer, FLASH_WriteAddress, BufferSize);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  QSPI_FLASH_BYTE_QOR(Rx_Buffer, FLASH_ReadAddress, BufferSize);

  /* Check the correctness of written data                                                                  */
  for (i = 0; i < BufferSize; i++)
  {
    if (Rx_Buffer[i] != Tx_Buffer[i])
    {
      err++;
    }
  }

  /* Erase SPI FLASH Sector to write on                                                                     */
  QSPI_FLASH_SE(FLASH_SectorToErase);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  QSPI_FLASH_BYTE_QOR(Rx_Buffer, FLASH_ReadAddress, BufferSize);

  /* Check the correctness of written data                                                                  */
  for (i = 0; i < BufferSize; i++)
  {
    if (Rx_Buffer[i] != 0xFF)
    {
      err++;
    }
  }

  /**********************************************************************************************************/
  /* Word Write/Read Test                                                                                   */
  /**********************************************************************************************************/
  /* Erase SPI FLASH Sector to write on                                                                     */
  QSPI_FLASH_SE(FLASH_SectorToErase);

  /* Write Tx_Buffer data to SPI FLASH memory                                                               */
  QSPI_FLASH_QPP((u16*)Tx_Buffer, FLASH_WriteAddress, BufferSize);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  QSPI_FLASH_QOR(Rx_Buffer16, FLASH_ReadAddress, BufferSize);

  /* Check the correctness of written data                                                                  */
  for (i = 0; i < BufferSize/2; i++)
  {
    if(pTx_Buffer16[i]!=(((Rx_Buffer16[i]&0xff)<<8)|((Rx_Buffer16[i]&0xff00)>>8)))
    {
      err++;
    }
  }

  /* Erase SPI FLASH Sector to write on                                                                     */
  QSPI_FLASH_SE(FLASH_SectorToErase);

  /* Read Rx_Buffer data from SPI FLASH memory                                                              */
  QSPI_FLASH_BYTE_QOR(Rx_Buffer, FLASH_ReadAddress, BufferSize);

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
    /*  Turn on LED1                                                                                        */
    HT32F_DVB_LEDOn(HT_LED1);
  }
  else
  {
    /*  Turn off LED1                                                                                       */
    HT32F_DVB_LEDOff(HT_LED1);
  }

  while(1)
  {
  }
}
/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */

  NVIC_EnableIRQ(QSPI_IRQn);
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
   CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
   CKCUClock.Bit.AFIO             = 1;
   CKCUClock.Bit.QSPI             = 1;
   CKCU_PeripClockConfig(CKCUClock, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* PA8: D2, PA10: D3, PA14: CSB, PA15: SCK */
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_8 | AFIO_PIN_10 | AFIO_PIN_14 | AFIO_PIN_15, AFIO_MODE_5);
  /* PB0: D0, PB1: D1 */
  AFIO_GPxConfig(GPIO_PB, AFIO_PIN_0 | AFIO_PIN_1, AFIO_MODE_5);
}

/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */
