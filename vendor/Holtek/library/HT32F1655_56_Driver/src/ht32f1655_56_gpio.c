/*********************************************************************************************************//**
 * @file    ht32f1655_56_gpio.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the GPIO and AFIO firmware functions.
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
#include "ht32f1655_56_gpio.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup GPIO GPIO
  * @brief GPIO driver modules
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
u32 _GPIO_ClockControl(HT_GPIO_TypeDef* GPIOx, ControlStatus Cmd);
u32 _AFIO_ClockControl(ControlStatus Cmd);

/* Private macro -------------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Private_Macro GPIO private macros
  * @{
  */
#if (AUTO_CK_CONTROL == 1)
  #define GPIO_CK_ST       u32 isAlreadyOn
  #define GPIO_CK_ON()     (isAlreadyOn = _GPIO_ClockControl(GPIOx, ENABLE))
  #define GPIO_CK_OFF()    if (isAlreadyOn == FALSE) _GPIO_ClockControl(GPIOx, DISABLE)
  #define AFIO_CK_ST       u32 isAlreadyOn
  #define AFIO_CK_ON()     (isAlreadyOn = _AFIO_ClockControl(ENABLE))
  #define AFIO_CK_OFF()    if (isAlreadyOn == FALSE) _AFIO_ClockControl(DISABLE)
#else
  #define GPIO_CK_ST
  #define GPIO_CK_ON(...)
  #define GPIO_CK_OFF(...)
  #define AFIO_CK_ST
  #define AFIO_CK_ON(...)
  #define AFIO_CK_OFF(...)
#endif
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @addtogroup GPIO_Exported_Functions GPIO exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitializes the GPIOx peripheral registers to their default reset values.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @retval None
 ************************************************************************************************************/
void GPIO_DeInit(HT_GPIO_TypeDef* GPIOx)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  Assert_Param(IS_GPIO(GPIOx));

  if (GPIOx == HT_GPIOA)
  {
    RSTCUReset.Bit.PA = 1;
  }
  else if (GPIOx == HT_GPIOB)
  {
    RSTCUReset.Bit.PB = 1;
  }
  else if (GPIOx == HT_GPIOC)
  {
    RSTCUReset.Bit.PC = 1;
  }
  else if (GPIOx == HT_GPIOD)
  {
    RSTCUReset.Bit.PD = 1;
  }
  else
  {
    RSTCUReset.Bit.PE = 1;
  }

  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Configure the direction of specified GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: The port pins.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param Direction: This parameter can be one of below:
 *        @arg GPIO_DIR_IN  : The pins are input mode.
 *        @arg GPIO_DIR_OUT : The pins are output mode.
 * @retval None
 ************************************************************************************************************/
void GPIO_DirectionConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_DIR_Enum Direction)
{
  GPIO_CK_ST;

  Assert_Param(IS_GPIO(GPIOx));
  Assert_Param(IS_GPIO_DIR(Direction));

  GPIO_CK_ON();

  if (Direction != GPIO_DIR_IN)
    GPIOx->DIRCR |= GPIO_PIN;
  else
    GPIOx->DIRCR &= ~GPIO_PIN;

  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Configure the pull resistor of specified GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: The port pins.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param PR: Selection of Pull resistor. This parameter can be one of below:
 *        @arg GPIO_PR_UP      : The pins with internal pull-up resistor
 *        @arg GPIO_PR_DOWN    : The pins with internal pull-down resistor
 *        @arg GPIO_PR_DISABLE : The pins without pull resistor
 * @retval None
 ************************************************************************************************************/
void GPIO_PullResistorConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_PR_Enum PR)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  Assert_Param(IS_GPIO_PR(PR));

  GPIO_CK_ON();
  if (PR == GPIO_PR_UP)
  {
    GPIOx->PUR |= GPIO_PIN;
    GPIOx->PDR &= ~GPIO_PIN;
  }
  else if (PR == GPIO_PR_DOWN)
  {
    GPIOx->PDR |= GPIO_PIN;
    GPIOx->PUR &= ~GPIO_PIN;
  }
  else
  {
    GPIOx->PUR &= ~GPIO_PIN;
    GPIOx->PDR &= ~GPIO_PIN;
  }
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the input control of specified GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: The port pins.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void GPIO_InputConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, ControlStatus Cmd)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  GPIO_CK_ON();
  if (Cmd != DISABLE)
    GPIOx->INER |= GPIO_PIN;
  else
    GPIOx->INER &= ~GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Select the driving current of specified GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: The port pins.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param Drive: This parameter can be one of below:
 *        @arg GPIO_DV_4MA  : Selects output driving current as 4 mA
 *        @arg GPIO_DV_8MA  : Selects output driving current as 8 mA
 * @retval None
 ************************************************************************************************************/
void GPIO_DriveConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_DV_Enum Drive)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  Assert_Param(IS_GPIO_DV(Drive));

  GPIO_CK_ON();
  if (Drive != GPIO_DV_4MA)
    GPIOx->DRVR |= GPIO_PIN;
  else
    GPIOx->DRVR &= ~GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the open drain function of specified GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: The port pins.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param Cmd: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void GPIO_OpenDrainConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, ControlStatus Cmd)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  Assert_Param(IS_CONTROL_STATUS(Cmd));

  GPIO_CK_ON();
  if (Cmd != DISABLE)
    GPIOx->ODR |= GPIO_PIN;
  else
    GPIOx->ODR &= ~GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Get the input data of specified port pin.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: This parameter can be GPIO_PIN_x.
 * @return SET or RESET
 ************************************************************************************************************/
FlagStatus GPIO_ReadInBit(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  FlagStatus result;
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));

  GPIO_CK_ON();
  if ((GPIOx->DINR & GPIO_PIN) != RESET)
    result = SET;
  else
    result = RESET;
  GPIO_CK_OFF();
  return result;
}

/*********************************************************************************************************//**
 * @brief Get the input data of specified GPIO port.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @return The value of input data register.
 ************************************************************************************************************/
u16 GPIO_ReadInData(HT_GPIO_TypeDef* GPIOx)
{
  u16 uValue;
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  uValue = (u16)GPIOx->DINR;
  GPIO_CK_OFF();
  return (uValue);
}

/*********************************************************************************************************//**
 * @brief Get the output data of specified port pin.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: This parameter can be GPIO_PIN_x.
 * @return SET or RESET
 ************************************************************************************************************/
FlagStatus GPIO_ReadOutBit(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  FlagStatus result;
  GPIO_CK_ST;

  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  if ((GPIOx->DOUTR & GPIO_PIN) != RESET)
    result =  SET;
  else
    result = RESET;
  GPIO_CK_OFF();
  return result;
}

/*********************************************************************************************************//**
 * @brief Get the output data of specified GPIO port.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @return The value of output data register.
 ************************************************************************************************************/
u16 GPIO_ReadOutData(HT_GPIO_TypeDef* GPIOx)
{
  u32 uValue;
  GPIO_CK_ST;

  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  uValue = (u16)GPIOx->DOUTR;
  GPIO_CK_OFF();
  return uValue;
}

/*********************************************************************************************************//**
 * @brief Set the selected port bits of output data.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: Specify the port bit to be set.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @retval None
 ************************************************************************************************************/
void GPIO_SetOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  GPIOx->SRR = GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Clear the selected port bits of output data.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: Specify the port bit to be clear.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @retval None
 ************************************************************************************************************/
void GPIO_ClearOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  GPIOx->RR = GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Set or Clear the selected port bits of data.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: Specify the port bits.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @param Status: Specify the value to be put to the selected bits.
 *        This parameter can be one of below:
 *        @arg RESET : To clear the port pins
 *        @arg SET   : To set the port pins
 * @retval None
 ************************************************************************************************************/
void GPIO_WriteOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, FlagStatus Status)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  if (Status != RESET)
    GPIOx->SRR = GPIO_PIN;
  else
    GPIOx->RR = GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Put data to the specified GPIO data port.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param Data: Specify the data to be written to the port data register.
 * @retval None
 ************************************************************************************************************/
void GPIO_WriteOutData(HT_GPIO_TypeDef* GPIOx, u16 Data)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  GPIOx->DOUTR = Data;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Lock configuration of GPIO pins.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: Specify the port bits.
 *        This parameter can be any combination of GPIO_PIN_x.
 * @retval None
 ************************************************************************************************************/
void GPIO_PinLock(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  GPIO_CK_ST;
  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  GPIOx->LOCKR = (u32)0x5FA00000 | GPIO_PIN;
  GPIO_CK_OFF();
}

/*********************************************************************************************************//**
 * @brief Get the lock state of specified GPIO port.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @return TRUE or FALSE
 ************************************************************************************************************/
bool GPIO_IsPortLocked(HT_GPIO_TypeDef* GPIOx)
{
  bool result;
  GPIO_CK_ST;

  Assert_Param(IS_GPIO(GPIOx));
  GPIO_CK_ON();
  if ((GPIOx->LOCKR >> 16) == 0)
    result = FALSE;
  else
    result = TRUE;
  GPIO_CK_OFF();
  return result;
}

/*********************************************************************************************************//**
 * @brief Get the lock state of specified GPIO port pin.
 * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
 * @param GPIO_PIN: This parameter can be GPIO_PIN_x.
 * @return TRUE or FALSE
 ************************************************************************************************************/
bool GPIO_IsPinLocked(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN)
{
  bool result;
  GPIO_CK_ST;

  Assert_Param(IS_GPIO(GPIOx));

  GPIO_CK_ON();
  if ((GPIOx->LOCKR & GPIO_PIN) == 0)
    result = FALSE;
  else
    result = TRUE;
  GPIO_CK_OFF();
  return result;
}

/*********************************************************************************************************//**
 * @brief Deinitialize the AFIO peripheral registers to their default reset values.
 * @retval None
 ************************************************************************************************************/
void AFIO_DeInit(void)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  RSTCUReset.Bit.AFIO = 1;
  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOx with specified pins.
 * @param AFIO_PORT: AFIO_PA ~ AFIO_PE.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
#if 1
void AFIO_GPxConfig(u32 AFIO_PORT, u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  vu32* pGPxCFGR = ((vu32*)&HT_AFIO->GPACFGR[0]) + AFIO_PORT * 2;
  u32 index = 0;
  u32 Mask = 0, PinMode = 0;
  s32 i;
  AFIO_CK_ST;

  Assert_Param(IS_AFIO_MODE(AFIO_MODE));
  AFIO_CK_ON();

  for (i = 0; i <= 8; i += 8)
  {
    Mask = 0;
    PinMode = 0;
    if (AFIO_PIN & (0x00FF << i))
    {
      for (index = 0; index < 8; index++)
      {
        if ((AFIO_PIN >> index) & (0x0001 << i))
        {
          Mask |= (0xF << (index * 4));
          PinMode |= (AFIO_MODE << (index * 4));
        }
      }
      *pGPxCFGR = (*pGPxCFGR & (~Mask)) | PinMode;
    }
    pGPxCFGR++;
  }

  AFIO_CK_OFF();
}
#else
/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOA with specified pins.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
void AFIO_GPAConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  u8 index = 0;
  u32 Mask = 0, PinMode = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_MODE(AFIO_MODE));

  if (AFIO_PIN & 0x00FF)
  {
    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0001)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPACFGR[0] =(HT_AFIO->GPACFGR[0] & ~Mask) | PinMode;
  }

  if (AFIO_PIN & 0xFF00)
  {
    Mask = 0;
    PinMode = 0;

    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0100)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPACFGR[1] =(HT_AFIO->GPACFGR[1] & ~Mask) | PinMode;
  }
}

/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOB with specified pins.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
void AFIO_GPBConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  u8 index = 0;
  u32 Mask = 0, PinMode = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_MODE(AFIO_MODE));

  if (AFIO_PIN & 0x00FF)
  {
    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0001)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPBCFGR[0] =(HT_AFIO->GPBCFGR[0] & ~Mask) | PinMode;
  }

  if (AFIO_PIN & 0xFF00)
  {
    Mask = 0;
    PinMode = 0;

    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0100)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPBCFGR[1] =(HT_AFIO->GPBCFGR[1] & ~Mask) | PinMode;
  }
}

/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOC with specified pins.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
void AFIO_GPCConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  u8 index = 0;
  u32 Mask = 0, PinMode = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_MODE(AFIO_MODE));

  if (AFIO_PIN & 0x00FF)
  {
    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0001)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPCCFGR[0] =(HT_AFIO->GPCCFGR[0] & ~Mask) | PinMode;
  }

  if (AFIO_PIN & 0xFF00)
  {
    Mask = 0;
    PinMode = 0;

    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0100)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPCCFGR[1] =(HT_AFIO->GPCCFGR[1] & ~Mask) | PinMode;
  }
}

/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOD with specified pins.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
void AFIO_GPDConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  u8 index = 0;
  u32 Mask = 0, PinMode = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_MODE(AFIO_MODE));

  if (AFIO_PIN & 0x00FF)
  {
    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0001)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPDCFGR[0] =(HT_AFIO->GPDCFGR[0] & ~Mask) | PinMode;
  }

  if (AFIO_PIN & 0xFF00)
  {
    Mask = 0;
    PinMode = 0;

    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0100)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPDCFGR[1] =(HT_AFIO->GPDCFGR[1] & ~Mask) | PinMode;
  }
}

/*********************************************************************************************************//**
 * @brief Configure alternated mode of GPIOE with specified pins.
 * @param AFIO_PIN: This parameter can be any combination of AFIO_PIN_x.
 * @param AFIO_MODE: This parameter can be one of the following values:
          @arg AFIO_MODE_DEFAULT : The default I/O function
          @arg AFIO_MODE_1       : Alternated mode 1
          @arg AFIO_MODE_2       : Alternated mode 2
          @arg AFIO_MODE_3       : Alternated mode 3
          @arg AFIO_MODE_4       : Alternated mode 4
          @arg AFIO_MODE_5       : Alternated mode 5
          @arg AFIO_MODE_6       : Alternated mode 6
          @arg AFIO_MODE_7       : Alternated mode 7
          @arg AFIO_MODE_8       : Alternated mode 8
          @arg AFIO_MODE_9       : Alternated mode 9
          @arg AFIO_MODE_10      : Alternated mode 10
          @arg AFIO_MODE_11      : Alternated mode 11
          @arg AFIO_MODE_12      : Alternated mode 12
          @arg AFIO_MODE_13      : Alternated mode 13
          @arg AFIO_MODE_14      : Alternated mode 14
          @arg AFIO_MODE_15      : Alternated mode 15
 * @retval None
 ************************************************************************************************************/
void AFIO_GPEConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE)
{
  u8 index = 0;
  u32 Mask = 0, PinMode = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_MODE(AFIO_MODE));

  if (AFIO_PIN & 0x00FF)
  {
    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0001)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPECFGR[0] =(HT_AFIO->GPECFGR[0] & ~Mask) | PinMode;
  }

  if (AFIO_PIN & 0xFF00)
  {
    Mask = 0;
    PinMode = 0;

    for (index = 0; index < 8; index++)
    {
      if ((AFIO_PIN >> index) & 0x0100)
      {
        Mask |= (0xF << (index * 4));
        PinMode |= (AFIO_MODE << (index * 4));
      }
    }
    HT_AFIO->GPECFGR[1] =(HT_AFIO->GPECFGR[1] & ~Mask) | PinMode;
  }
}
#endif

/*********************************************************************************************************//**
 * @brief Select the GPIO pin to be used as EXTI channel.
 * @param Channel: Specify the EXTI channel to be configured.
 *        This parameter can be AFIO_EXTI_CH_x.
 * @param Source: Specify the GPIO port to be used for EXTI channel.
 *        This parameter can be AFIO_ESS_Px where x can be A ~ E.
 * @retval None
 ************************************************************************************************************/
void AFIO_EXTISourceConfig(AFIO_EXTI_CH_Enum Channel, AFIO_ESS_Enum Source)
{
  u8 index = 0;
  u32 tmp = 0;
  AFIO_CK_ST;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_AFIO_ESS(Source));
  Assert_Param(IS_AFIO_EXTI_CH(Channel));
  AFIO_CK_ON();
  if (Channel > AFIO_EXTI_CH_7)
  {
    index = 1;
    Channel -= AFIO_EXTI_CH_8;
  }

  tmp = HT_AFIO->ESSR[index];
  tmp &= ~((u32)0x0F << (Channel * 4));
  tmp |= (u32)Source << (Channel * 4);
  HT_AFIO->ESSR[index] = tmp;
  AFIO_CK_OFF();
}
/**
  * @}
  */

/* Private functions ---------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Private_Functions GPIO private functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief Turn on/Turn off specify GPIO clock.
  * @param GPIOx: where GPIOx is the selected GPIO from the GPIO peripheral.
  * @param Cmd: This parameter can be ENABLE or DISABLE.
  * @retval TRUE or FALSE (TRUE: already turn on, FALSE, Turn on by this call)
  ***********************************************************************************************************/
u32 _GPIO_ClockControl(HT_GPIO_TypeDef* GPIOx, ControlStatus Cmd)
{
  u32 PxENStatus;
  /*--------------------------------------------------------------------------------------------------------*/
  /* ((0x400Bx000 & 0x0000F000) >> 12 ) / 2 + 6 =                                                           */
  /*  (0x0 ~ 0x4) + 16 = 16 ~ 20 for AHBCCR PAEN ~ PEEN bit offset                                          */
  /*--------------------------------------------------------------------------------------------------------*/
  u32 offset = ((((u32)GPIOx) & 0x0000F000) >> 12) / 2 + 6;

  PxENStatus = HT_CKCU->AHBCCR & (1 << offset);

  if (PxENStatus != 0)
  {
    if (Cmd == DISABLE)
    {
      HT_CKCU->AHBCCR &= (~(1 << offset));
    }
    return TRUE;
  }

  HT_CKCU->AHBCCR |= (1 << offset);
  return FALSE;
}

/*********************************************************************************************************//**
  * @brief Turn on/Turn off AFIO clock.
  * @param Cmd: This parameter can be ENABLE or DISABLE.
  * @retval TRUE or FALSE (TRUE: already turn on, FALSE, Turn on by this call)
  ***********************************************************************************************************/
u32 _AFIO_ClockControl(ControlStatus Cmd)
{
  u32 AFIOENStatus;

  AFIOENStatus = HT_CKCU->APBCCR0 & (1 << 14);

  if (AFIOENStatus != 0)
  {
    if (Cmd == DISABLE)
    {
      HT_CKCU->APBCCR0 &= (~(1 << 14));
    }
    return TRUE;
  }

  HT_CKCU->APBCCR0 |= (1 << 14);
  return FALSE;
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
