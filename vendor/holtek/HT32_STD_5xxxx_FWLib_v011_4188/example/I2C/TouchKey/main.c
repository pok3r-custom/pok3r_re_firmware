/*********************************************************************************************************//**
 * @file    I2C/TouchKey/main.c
 * @version $Rev:: 2959         $
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
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup I2C_Examples I2C
  * @{
  */

/** @addtogroup TouchKey
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef union
{
  struct
  {
    unsigned long Key1     :1;
    unsigned long Key2     :1;
    unsigned long Key3     :1;
    unsigned long Key4     :1;
    unsigned long Key5     :1;
    unsigned long Key6     :1;
    unsigned long Key7     :1;
    unsigned long Key8     :1;
    unsigned long Key9     :1;
    unsigned long Key10    :1;
    unsigned long Key11    :1;
    unsigned long Key12    :1;
    unsigned long Key13    :1;
    unsigned long Key14    :1;
    unsigned long Key15    :1;
    unsigned long Key16    :1;
  } Bit;
  u16 Data;
} TouchKey_TypeDef;

/* Private constants ---------------------------------------------------------------------------------------*/
#define I2C_TOUCHKEY_SPEED         (50000)          /*!< I2C speed                                          */
#define I2C_TOUCHKEY_DEV_ADDR      (0x50)           /*!< I2C device address                                 */
#define KEYSTATUS_CMD              (0x08)

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void I2C_Configuration(void);
u32 Touchkey_ButtonRead(void);
void _I2C_Touchkey_AckPolling(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 uCounter;
  TouchKey_TypeDef Touch;

  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  I2C_Configuration();                /* I2C configuration                                                  */

  printf("\r\nTouchkey test start....\r\n");

  while (1)
  {
    Touch.Data = Touchkey_ButtonRead();
    printf("\rPADS: %d %d %d %d %d %d %d %d, DATA=%04x",
           Touch.Bit.Key9,
           Touch.Bit.Key10,
           Touch.Bit.Key2,
           Touch.Bit.Key3,
           Touch.Bit.Key4,
           Touch.Bit.Key5,
           Touch.Bit.Key7,
           Touch.Bit.Key8,
           Touch.Data);

    uCounter = (HSE_VALUE >> 2);
    while (uCounter--);
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
u32 Touchkey_ButtonRead(void)
{
  u32 uData;

  /* Touchkey addressread                                                                                   */
  _I2C_Touchkey_AckPolling();

  while (!I2C_CheckStatus(TOUCHKEY_I2C, I2C_MASTER_TX_EMPTY));
  I2C_SendData(TOUCHKEY_I2C, KEYSTATUS_CMD);

  /* Touchkey addressread                                                                                   */
  I2C_TargetAddressConfig(TOUCHKEY_I2C, I2C_TOUCHKEY_DEV_ADDR, I2C_MASTER_READ);
  while (!I2C_CheckStatus(TOUCHKEY_I2C, I2C_MASTER_RECEIVER_MODE));

  /* enable master receiver ACK                                                                             */
  I2C_AckCmd(TOUCHKEY_I2C, ENABLE);

  /* sequential read                                                                                        */
  while (!I2C_CheckStatus(TOUCHKEY_I2C, I2C_MASTER_RX_NOT_EMPTY));
  uData = I2C_ReceiveData(TOUCHKEY_I2C);
  I2C_AckCmd(TOUCHKEY_I2C, DISABLE);
  while (!I2C_CheckStatus(TOUCHKEY_I2C, I2C_MASTER_RX_NOT_EMPTY));
  uData |= (I2C_ReceiveData(TOUCHKEY_I2C) << 8);

  /* end of read                                                                                            */
  I2C_GenerateSTOP(TOUCHKEY_I2C);

  return uData;
}

/*********************************************************************************************************//**
  * @brief  EEPROM acknowledge polling.
  * @retval None
  ***********************************************************************************************************/
void _I2C_Touchkey_AckPolling(void)
{
  u32 reg;
  /* wait if bus busy                                                                                       */
  while (I2C_GetFlagStatus(TOUCHKEY_I2C, I2C_FLAG_BUSBUSY));

  /* send slave address until ack reply                                                                     */
  while (1)
  {
    /* send slave address                                                                                   */
    I2C_TargetAddressConfig(TOUCHKEY_I2C, I2C_TOUCHKEY_DEV_ADDR, I2C_MASTER_WRITE);

    while (1)
    {
      reg = TOUCHKEY_I2C->SR;
      if (reg & I2C_FLAG_ADRS)
        return;
      if (reg & I2C_FLAG_RXNACK)
      {
        I2C_ClearFlag(TOUCHKEY_I2C, I2C_FLAG_RXNACK);
        break;
      }
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
/*
//<e0> Enable Peripheral Clock
//  <h> Communication
//    <q5> EBI
//    <q11> I2C0   <q12> I2C1
//    <q23> I2S
//    <q21> SCI0 <q22> SCI1
//    <q13> SPI0   <q14> SPI1
//    <q17> UART0  <q18> UART1
//    <q15> USART0 <q16> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D
//    <q19> AFIO
//    <q20> EXTI
//  </h>
//  <h> System
//    <q32> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q31> CMP
//    <q2>  PDMA
//    <q26> PWRCU
//  </h>
//  <h> Timer
//    <q29> BFTM0 <q30> BFTM1
//    <q37> PWM0 <q38> PWM0
//    <q33> SCTM0 <q34> SCTM1 <q35> SCTM2 <q36> SCTM3
//    <q27> GPTM0 <q28> GPTM1
//    <q24> MCTM0
//    <q26> RTC   <q25> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 0;
  CKCUClock.Bit.USBD       = 0;
  CKCUClock.Bit.CKREF      = 0;
  CKCUClock.Bit.EBI        = 0;
  CKCUClock.Bit.CRC        = 0;
  CKCUClock.Bit.PA         = 0;
  CKCUClock.Bit.PB         = 0;
  CKCUClock.Bit.PC         = 0;
  CKCUClock.Bit.PD         = 0;
  CKCUClock.Bit.I2C0       = 0;
  CKCUClock.Bit.I2C1       = 0;
  CKCUClock.Bit.SPI0       = 0;
  CKCUClock.Bit.SPI1       = 0;
  CKCUClock.Bit.USART0     = 1;
  CKCUClock.Bit.USART1     = 1;
  CKCUClock.Bit.UART0      = 1;
  CKCUClock.Bit.UART1      = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 0;
  CKCUClock.Bit.SCI0       = 0;
  CKCUClock.Bit.SCI1       = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.CMP        = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCUClock.Bit.SCTM0      = 0;
  CKCUClock.Bit.SCTM1      = 0;
  CKCUClock.Bit.SCTM2      = 0;
  CKCUClock.Bit.SCTM3      = 0;
  CKCUClock.Bit.PWM0       = 0;
  CKCUClock.Bit.PWM1       = 0;

  TOUCHKEY_I2C_CLK(CKCUClock) = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

#if (ENABLE_CKOUT == 1)
  CKOUTConfig();
#endif
}

#if (ENABLE_CKOUT == 1)
/*********************************************************************************************************//**
  * @brief  Configure the debug output clock.
  * @retval None
  ***********************************************************************************************************/
void CKOUTConfig(void)
{
  CKCU_CKOUTInitTypeDef CKOUTInit;

  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_9, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLK_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);
}
#endif

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
#if (RETARGET_PORT == RETARGET_USART0)
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_2 | AFIO_PIN_3, AFIO_FUN_USART_UART);
#endif

#if (RETARGET_PORT == RETARGET_USART1)
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_4 | AFIO_PIN_5, AFIO_FUN_USART_UART);
#endif

#if (RETARGET_PORT == RETARGET_UART0)
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_4 | AFIO_PIN_5, AFIO_FUN_USART_UART);
#endif

#if (RETARGET_PORT == RETARGET_UART1)
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_1 | AFIO_PIN_3, AFIO_FUN_USART_UART);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure the I2C.
  * @retval None
  ***********************************************************************************************************/
void I2C_Configuration(void)
{
  I2C_InitTypeDef I2C_InitStructure = { 0 };

  /* Configure I2C SCL pin, I2C SDA pin                                                                     */
  AFIO_GPxConfig(TOUCHKEY_I2C_SCL_GPIO_ID, TOUCHKEY_I2C_SCL_AFIO_PIN, TOUCHKEY_I2C_SCL_AFIO_MODE);
  AFIO_GPxConfig(TOUCHKEY_I2C_SDA_GPIO_ID, TOUCHKEY_I2C_SDA_AFIO_PIN, TOUCHKEY_I2C_SDA_AFIO_MODE);

  /* I2C configuration                                                                                      */
  I2C_InitStructure.I2C_GeneralCall = I2C_GENERALCALL_DISABLE;
  I2C_InitStructure.I2C_AddressingMode = I2C_ADDRESSING_7BIT;
  I2C_InitStructure.I2C_Acknowledge = I2C_ACK_DISABLE;
  I2C_InitStructure.I2C_OwnAddress = 0x00;
  I2C_InitStructure.I2C_Speed = I2C_TOUCHKEY_SPEED;
  I2C_InitStructure.I2C_SpeedOffset = 0;
  I2C_Init(TOUCHKEY_I2C, &I2C_InitStructure);
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
