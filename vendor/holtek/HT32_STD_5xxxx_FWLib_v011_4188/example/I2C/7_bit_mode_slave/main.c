/*********************************************************************************************************//**
 * @file    I2C/7_bit_mode_slave/main.c
 * @version $Rev:: 793          $
 * @date    $Date:: 2016-06-18 #$
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
#include "ht32_board.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup I2C_Examples I2C
  * @{
  */

/** @addtogroup I2C_7_bit_mode_slave
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef enum {Fail = 0, Pass = !Fail} TestResult;

/* Private constants ---------------------------------------------------------------------------------------*/
#define I2C_MASTER_ADDRESS     0x0A
#define I2C_SLAVE_ADDRESS      0x60
#define BufferSize             4
#define ClockSpeed             1000000

/* Private function prototypes -----------------------------------------------------------------------------*/
TestResult CmpBuffer(u8* Buffer1, u8* Buffer2, u32 BufferLength);

/* Private variables ---------------------------------------------------------------------------------------*/
I2C_InitTypeDef  I2C_InitStructure;

u8 I2C_Master_Buffer_Tx[BufferSize] = {0x1, 0x2, 0x3, 0x4};
u8 I2C_Slave_Buffer_Rx[BufferSize] = {0x00};
vu8 Tx_Index = 0;
vu8 Rx_Index = 0;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Initialize LED1 & LED2 on HT32 board                                                                   */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  /* Enable I2C0 ,I2C1 & AFIO APB clock                                                                     */
  HTCFG_I2C_SLAVE_CLK(CKCUClock)  = 1;
  CKCUClock.Bit.AFIO              = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure GPIO to I2C mode for Slave                                                                   */
  AFIO_GPxConfig(HTCFG_I2C_SLAVE_SCL_GPIO_ID, HTCFG_I2C_SLAVE_SCL_AFIO_PIN, AFIO_FUN_I2C);
  AFIO_GPxConfig(HTCFG_I2C_SLAVE_SDA_GPIO_ID, HTCFG_I2C_SLAVE_SDA_AFIO_PIN, AFIO_FUN_I2C);

  /* I2C Slave configuration                                                                                */
  I2C_InitStructure.I2C_Acknowledge = ENABLE;
  I2C_InitStructure.I2C_OwnAddress = I2C_SLAVE_ADDRESS;
  I2C_Init(HTCFG_I2C_SLAVE_PORT, &I2C_InitStructure);

  /* Enable I2C                                                                                             */
  I2C_Cmd(HTCFG_I2C_SLAVE_PORT, ENABLE);


  /*--------------------------------------------------------------------------------------------------------*/
  /* Slave Receiver                                                                                         */
  /*--------------------------------------------------------------------------------------------------------*/
  /* Check on Slave Receiver ADRS condition and clear it                                                    */
  while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, I2C_SLAVE_ACK_RECEIVER_ADDRESS));

  /* Receive data                                                                                           */
  while (Rx_Index < BufferSize)
  {
    /* Check on Slave Receiver RXDNE condition                                                              */
    while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, I2C_SLAVE_RX_NOT_EMPTY));
    /* Store received data on I2Cx                                                                          */
    I2C_Slave_Buffer_Rx[Rx_Index ++] = I2C_ReceiveData(HTCFG_I2C_SLAVE_PORT);
  }

  /* Check on Slave Receiver STO condition                                                                  */
  while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, I2C_SLAVE_STOP_DETECTED));
  /* Check on validity of received data on I2C Slave                                                        */


  /*--------------------------------------------------------------------------------------------------------*/
  /* Slave Transmitter                                                                                      */
  /*--------------------------------------------------------------------------------------------------------*/
  /* Check on Slave Receiver ADRS condition and clear it                                                    */
  while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, I2C_SLAVE_ACK_TRANSMITTER_ADDRESS));

  /* Send data                                                                                              */
  while (Tx_Index < BufferSize)
  {
    /* Check on Master Transmitter TXDE condition                                                           */
    while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, I2C_SLAVE_TX_EMPTY));
    /* Send I2C0 data                                                                                       */
    I2C_SendData(HTCFG_I2C_SLAVE_PORT, I2C_Slave_Buffer_Rx[Tx_Index ++]);
  }

  /* Check on Slave Receiver STO condition                                                                  */
  while (!I2C_CheckStatus(HTCFG_I2C_SLAVE_PORT, 0x00000202));
  I2C_ClearFlag(HTCFG_I2C_SLAVE_PORT, I2C_FLAG_RXNACK);


  /* Check on validity of received data on I2Cx                                                             */
  if (CmpBuffer(I2C_Slave_Buffer_Rx, I2C_Master_Buffer_Tx, BufferSize))
  {
    HT32F_DVB_LEDOn(HT_LED1);
  }
  else
  {
    HT32F_DVB_LEDOn(HT_LED2);
  }

  while (1);

}

/*********************************************************************************************************//**
  * @brief  Compare two buffers.
  * @param  Buffer1, Buffer2: buffers to be compared.
  * @param  BufferLength: buffer's length
  * @retval None
  ***********************************************************************************************************/
TestResult CmpBuffer(u8* Buffer1, u8* Buffer2, u32 BufferLength)
{
  while (BufferLength--)
  {
    if (*Buffer1 != *Buffer2)
    {
      return Fail;
    }

    Buffer1++;
    Buffer2++;
  }

  return Pass;
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
