/*********************************************************************************************************//**
 * @file    I2C/Interrupt/ht32f165x_it.c
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

/** @addtogroup I2C_Examples I2C
  * @{
  */

/** @addtogroup I2C_Interrupt
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define I2C1_SLAVE_ADDRESS     0x60
#define BufferSize             4

/* Private variables ---------------------------------------------------------------------------------------*/
extern u8 I2C0_Buffer_Tx[];
extern u8 I2C0_Buffer_Rx[];
extern u8 I2C1_Buffer_Rx[];
extern vu8 Tx_Index, Rx_Index;

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
 * @brief   This function handles I2C0 interrupt.
 * @retval  None
 ************************************************************************************************************/
void I2C0_IRQHandler(void)
{
  switch (I2C_ReadRegister(HT_I2C0, I2C_REGISTER_SR))
  {
    /*-----------------------------Master Transmitter ------------------------------------------------------*/
    case I2C_MASTER_SEND_START:
      break;

    case I2C_MASTER_TRANSMITTER_MODE:
      /* Send the first data to I2C1                                                                        */
      I2C_SendData(HT_I2C0, I2C0_Buffer_Tx[Tx_Index ++]);
      break;

    case I2C_MASTER_TX_EMPTY:
      if (Tx_Index < BufferSize)
        /* Send the remainder data to I2C1                                                                  */
        I2C_SendData(HT_I2C0, I2C0_Buffer_Tx[Tx_Index ++]);
      else
      {
        /* Reset Indexes for next transmission                                                              */
        Tx_Index = 0;
        Rx_Index = 0;
        /* Send I2C0 re-START & I2C1 slave address for read                                                 */
        I2C_TargetAddressConfig(HT_I2C0, I2C1_SLAVE_ADDRESS, I2C_MASTER_READ);
      }
      break;

    /*-----------------------------Master Receiver ---------------------------------------------------------*/
    case I2C_MASTER_RECEIVER_MODE:
      /* Enable I2C0 ACK for receiving data                                                                 */
      I2C_AckCmd(HT_I2C0, ENABLE);
      break;

    case I2C_MASTER_RX_NOT_EMPTY:
      /* Receive data sent from I2C1                                                                        */
      I2C0_Buffer_Rx[Rx_Index ++] = I2C_ReceiveData(HT_I2C0);
      if (Rx_Index == BufferSize - 1)
      {
        /* Disable I2C0 ACK                                                                                 */
        I2C_AckCmd(HT_I2C0, DISABLE);
      }
      if (Rx_Index == BufferSize)
      {
        /* Generate STOP                                                                                    */
        I2C_GenerateSTOP(HT_I2C0);
      }
      break;

    default:
      break;
  }
}

/*********************************************************************************************************//**
 * @brief   This function handles I2C1 interrupt.
 * @retval  None
 ************************************************************************************************************/
void I2C1_IRQHandler(void)
{
  switch (I2C_ReadRegister(HT_I2C1, I2C_REGISTER_SR))
  {
    /*-----------------------------Slave Receiver ----------------------------------------------------------*/
    case I2C_SLAVE_ACK_RECEIVER_ADDRESS:
      break;

    case I2C_SLAVE_RX_NOT_EMPTY:
      if (Rx_Index < BufferSize)
      /* Receive data sent from I2C0                                                                        */
      I2C1_Buffer_Rx[Rx_Index ++] = I2C_ReceiveData(HT_I2C1);
      break;

    /*-----------------------------Slave Transmitter -------------------------------------------------------*/
    case I2C_SLAVE_ACK_TRANSMITTER_ADDRESS:
      /* Send the first data to I2C0                                                                        */
      I2C_SendData(HT_I2C1, I2C1_Buffer_Rx[Tx_Index ++]);
      break;

    case I2C_SLAVE_TX_EMPTY:
      if (Tx_Index < BufferSize)
        /* Send the remainder data to I2C0                                                                  */
        I2C_SendData(HT_I2C1, I2C1_Buffer_Rx[Tx_Index ++]);
      else
        /* Disable I2C1 TXDE interrupt                                                                      */
        I2C_IntConfig(HT_I2C1, I2C_INT_TXDE, DISABLE);
      break;

    case I2C_SLAVE_RECEIVED_NACK_STOP:
      /* Clear RXNACK flag                                                                                  */
      I2C_ClearFlag(HT_I2C1, I2C_FLAG_RXNACK);
      break;

    default:
      break;
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
