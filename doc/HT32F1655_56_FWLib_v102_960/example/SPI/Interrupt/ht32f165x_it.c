/*********************************************************************************************************//**
 * @file    SPI/Interrupt/ht32f165x_it.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all interrupt service routine.
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup SPI_Examples SPI
  * @{
  */

/** @addtogroup SPI_Interrupt
  * @{
  */


/* Private define ------------------------------------------------------------------------------------------*/
#define BufferSize        4

/* Private variables ---------------------------------------------------------------------------------------*/
extern vu8 SPI0_Buffer_Tx[];
extern vu8 SPI1_Buffer_Tx[];
extern vu8 SPI0_Buffer_Rx[];
extern vu8 SPI1_Buffer_Rx[];
extern vu8 SPI0_Tx_Index, SPI1_Tx_Index, SPI0_Rx_Index, SPI1_Rx_Index;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
 * @brief   This function handles NMI exception.
 * @retval  None
 ************************************************************************************************************/
void NMI_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Hard Fault exception.
 * @retval  None
 ************************************************************************************************************/
void HardFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Memory Manage exception.
 * @retval  None
 ************************************************************************************************************/
void MemManage_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Bus Fault exception.
 * @retval  None
 ************************************************************************************************************/
void BusFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Usage Fault exception.
 * @retval  None
 ************************************************************************************************************/
void UsageFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles SVCall exception.
 * @retval  None
 ************************************************************************************************************/
void SVC_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Debug Monitor exception.
 * @retval  None
 ************************************************************************************************************/
void DebugMon_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles PendSVC exception.
 * @retval  None
 ************************************************************************************************************/
void PendSV_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles SysTick Handler.
 * @retval  None
 ************************************************************************************************************/
void SysTick_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles SPI0 interrupt.
 * @retval  None
 ************************************************************************************************************/
void SPI0_IRQHandler(void)
{
  if (SPI_GetFlagStatus(HT_SPI0, SPI_FLAG_RXBNE))
  {
    /* Read received data                                                                                   */
    SPI0_Buffer_Rx[SPI0_Rx_Index++] = SPI_ReceiveData(HT_SPI0);
  }

  if (SPI_GetFlagStatus(HT_SPI0, SPI_FLAG_TXBE))
  {
    if (SPI0_Tx_Index < BufferSize)
    {
      /* Send SPI0 data                                                                                     */
      SPI_SendData(HT_SPI0, SPI0_Buffer_Tx[SPI0_Tx_Index++]);
    }
    else
    {
      /* Disable SPI0 TXBE interrupt                                                                        */
      SPI_IntConfig(HT_SPI0, SPI_INT_TXBE, DISABLE);
    }
  }
}

/*********************************************************************************************************//**
 * @brief   This function handles SPI1 interrupt.
 * @retval  None
 ************************************************************************************************************/
void SPI1_IRQHandler(void)
{
  if (SPI_GetFlagStatus(HT_SPI1, SPI_FLAG_RXBNE))
  {
    /* Read received data                                                                                   */
    SPI1_Buffer_Rx[SPI1_Rx_Index++] = SPI_ReceiveData(HT_SPI1);
  }

  if (SPI_GetFlagStatus(HT_SPI1, SPI_FLAG_TXBE))
  {
    if (SPI1_Tx_Index < BufferSize)
    {
      /* Send SPI1 data                                                                                     */
      SPI_SendData(HT_SPI1, SPI1_Buffer_Tx[SPI1_Tx_Index++]);
    }
    else
    {
      /* Disable SPI1 TXBE interrupt                                                                        */
      SPI_IntConfig(HT_SPI1, SPI_INT_TXBE, DISABLE);
    }
  }
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
