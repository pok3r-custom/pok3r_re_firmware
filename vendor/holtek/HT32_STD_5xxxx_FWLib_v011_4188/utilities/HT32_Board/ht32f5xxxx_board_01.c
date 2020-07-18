/*********************************************************************************************************//**
 * @file    ht32f5xxxx_board_01.c
 * @version $Rev:: 3766         $
 * @date    $Date:: 2019-04-14 #$
 * @brief   This file provides firmware functions to manage LEDs, push-buttons
 *          and COM ports and is available on HT32F5xxxx board.
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

// Supported Device
// ========================================
//   HT32F52220, HT32F52230
//   HT32F52231, HT32F52241
//   HT32F52331, HT32F52341
//   HT32F52342, HT32F52352
//   HT32F52243, HT32F52253
//   HT32F0008
//   HT32F50220, HT32F50230
//   HT32F50231, HT32F50241

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup HT32_Board
  * @{
  */

/** @defgroup HT32F5xxxx_BOARD HT32F5xxxx_BOARD
  * @brief Provides firmware functions to manage LEDs, push-buttons
  *        and COM ports and is available on HT32F5xxxx Starter kit/Development board.
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
/** @defgroup HT32F5xxxx_BOARD_Private_TypesDefinitions HT32F5xxxx Board private types definitions
  * @{
  */

typedef struct
{
  u8 ID;
  u16 Pin;
  AFIO_MODE_Enum Mode;
} HT32_Board_GPIO_TypeDef;

typedef struct
{
  HT_USART_TypeDef* USARTx;
  HT32_Board_GPIO_TypeDef Tx_IO;
  HT32_Board_GPIO_TypeDef Rx_IO;
} HT32_Board_COM_TypeDef;

/**
  * @}
  */

/* Private function prototypes -----------------------------------------------------------------------------*/
static void _HT32F_DVB_ClockConfig(u32 GpioId);

/* Global variables ----------------------------------------------------------------------------------------*/
/** @defgroup HT32F5xxxx_BOARD_Global_Variable HT32F5xxxx Board global variables
  * @{
  */

  HT_GPIO_TypeDef* const GPIO_PORT[GPIO_PORT_NUM] = {
    HT_GPIOA,
    HT_GPIOB,
    #if (LIBCFG_GPIOC)
    HT_GPIOC,
    #else
    0,
    #endif
    #if (LIBCFG_GPIOD)
    HT_GPIOD,
    #else
    0,
    #endif
    #if (LIBCFG_GPIOE)
    HT_GPIOE,
    #else
    0,
    #endif
    #if (LIBCFG_GPIOF)
    HT_GPIOF,
    #else
    0,
    #endif
  };

  const u8 LED_GPIO_ID[LEDn] = {LED1_GPIO_ID, LED2_GPIO_ID, LED3_GPIO_ID};
  const u16 LED_GPIO_PIN[LEDn] = {LED1_GPIO_PIN, LED2_GPIO_PIN, LED3_GPIO_PIN};
  const AFIO_MODE_Enum LED_AFIO_MODE[LEDn] = {LED1_AFIO_MODE, LED2_AFIO_MODE, LED3_AFIO_MODE};

  const u8 BUTTON_GPIO_ID[BUTTONn] = {WAKEUP_BUTTON_GPIO_ID, KEY1_BUTTON_GPIO_ID, KEY2_BUTTON_GPIO_ID};
  const u16 BUTTON_GPIO_PIN[BUTTONn] = {WAKEUP_BUTTON_GPIO_PIN, KEY1_BUTTON_GPIO_PIN, KEY2_BUTTON_GPIO_PIN};
  const AFIO_MODE_Enum BUTTON_AFIO_MODE[BUTTONn] = {
    WAKEUP_BUTTON_AFIO_MODE, KEY1_BUTTON_AFIO_MODE, KEY2_BUTTON_AFIO_MODE
  };

  const u8 BUTTON_EXTI_CH[BUTTONn] = {
    WAKEUP_BUTTON_EXTI_CHANNEL, KEY1_BUTTON_EXTI_CHANNEL, KEY2_BUTTON_EXTI_CHANNEL
  };

  const HT32_Board_COM_TypeDef gCOMInfo[COM_NUM] =
  {
    {
      COM1_PORT,
      { COM1_TX_GPIO_ID, COM1_TX_AFIO_PIN, COM1_TX_AFIO_MODE },
      { COM1_RX_GPIO_ID, COM1_RX_AFIO_PIN, COM1_RX_AFIO_MODE },
    },
  };

/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup HT32F5xxxx_BOARD_Global_Functions HT32F5xxxxBoard global functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Configures LED GPIO.
 * @param HT_LEDn: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDInit(LED_TypeDef HT_LEDn)
{
  u32 bGpioId = LED_GPIO_ID[HT_LEDn];
  u32 uGPIOPin = LED_GPIO_PIN[HT_LEDn];
  AFIO_MODE_Enum uGPIOMode = LED_AFIO_MODE[HT_LEDn];
  HT_GPIO_TypeDef* GPIOx = GPIO_PORT[bGpioId];

  /* Enable the GPIO_LED Clock                                                                              */
  /* Enable the AFIO Clock                                                                                  */
  _HT32F_DVB_ClockConfig(bGpioId);

  /* Configure the AFIO mode                                                                                */
  HT32F_DVB_GPxConfig(bGpioId, uGPIOPin, uGPIOMode);

  /* LED is off by default                                                                                  */
  HT32F_DVB_LEDOff(HT_LEDn);

  /* Configure the GPIO pin                                                                                 */
  GPIO_PullResistorConfig(GPIOx, uGPIOPin, GPIO_PR_DISABLE);
  GPIO_DriveConfig(GPIOx, uGPIOPin, GPIO_DV_8MA);
  GPIO_DirectionConfig(GPIOx, uGPIOPin, GPIO_DIR_OUT);
}

/*********************************************************************************************************//**
 * @brief Turns selected LED On.
 * @param HT_LEDn: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDOn(LED_TypeDef HT_LEDn)
{
  GPIO_PORT[LED_GPIO_ID[HT_LEDn]]->RR = LED_GPIO_PIN[HT_LEDn];
}

/*********************************************************************************************************//**
 * @brief Turns selected LED Off.
 * @param HT_LEDn: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDOff(LED_TypeDef HT_LEDn)
{
  GPIO_PORT[LED_GPIO_ID[HT_LEDn]]->SRR = LED_GPIO_PIN[HT_LEDn];
}

/*********************************************************************************************************//**
 * @brief Toggles the selected LED.
 * @param HT_LEDn: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDToggle(LED_TypeDef HT_LEDn)
{
  GPIO_PORT[LED_GPIO_ID[HT_LEDn]]->DOUTR ^= LED_GPIO_PIN[HT_LEDn];
}

/*********************************************************************************************************//**
 * @brief Configures Button GPIO and EXTI.
 * @param  BUTTON_x: Specifies the Button to be configured.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_WAKEUP: Wakeup Push Button
 *     @arg BUTTON_KEY1: Key1 Push Button
 *     @arg BUTTON_KEY2: Key2 Push Button
 * @param  BUTTON_MODE_x: Specifies Button mode.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_MODE_GPIO: Button will be used as simple IO
 *     @arg BUTTON_MODE_EXTI: Button will be connected to EXTI channel with interrupt generation capability
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_PBInit(BUTTON_TypeDef BUTTON_x, BUTTON_MODE_TypeDef BUTTON_MODE_x)
{
  u32 bGpioId  = BUTTON_GPIO_ID[BUTTON_x];
  u32 uGpioPin = BUTTON_GPIO_PIN[BUTTON_x];
  HT_GPIO_TypeDef* GPIOx = GPIO_PORT[bGpioId];

  /* Enable the GPIO Clock                                                                                  */
  /* Enable the AFIO Clock                                                                                  */
  _HT32F_DVB_ClockConfig(bGpioId);

  /* Configure Button pin as input floating                                                                 */
  HT32F_DVB_GPxConfig(bGpioId, uGpioPin, BUTTON_AFIO_MODE[BUTTON_x]);
  GPIO_PullResistorConfig(GPIOx, uGpioPin, GPIO_PR_DISABLE);
  GPIO_DirectionConfig(GPIOx, uGpioPin, GPIO_DIR_IN);
  GPIO_InputConfig(GPIOx, uGpioPin, ENABLE);

  if (BUTTON_MODE_x == BUTTON_MODE_EXTI)
  {
    EXTI_InitTypeDef EXTI_InitStruct = {0};
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

    /* Enable the EXTI Clock                                                                                */
    CKCUClock.Bit.EXTI       = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);

    /* Connect Button EXTI Channel to Button GPIO Pin                                                       */
    AFIO_EXTISourceConfig((AFIO_EXTI_CH_Enum)BUTTON_EXTI_CH[BUTTON_x], (AFIO_ESS_Enum)bGpioId);

    /* Configure button EXTI Line on falling edge                                                           */
    EXTI_InitStruct.EXTI_Channel = BUTTON_EXTI_CH[BUTTON_x];
    EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_DISABLE;
    EXTI_InitStruct.EXTI_DebounceCnt = 0;
    EXTI_InitStruct.EXTI_IntType = (BUTTON_x == BUTTON_WAKEUP) ? EXTI_POSITIVE_EDGE : EXTI_NEGATIVE_EDGE;
    EXTI_Init(&EXTI_InitStruct);

    /* Enable Button EXTI Interrupt                                                                         */
    EXTI_IntConfig(BUTTON_EXTI_CH[BUTTON_x], ENABLE);
    switch (BUTTON_EXTI_CH[BUTTON_x])
    {
      case 0:
      case 1:
        NVIC_EnableIRQ(EXTI0_1_IRQn);
        break;
      case 2:
      case 3:
        NVIC_EnableIRQ(EXTI2_3_IRQn);
        break;
      #if defined(USE_HT32F65240)
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      NVIC_EnableIRQ(EXTI4_9_IRQn);
        break;
      default:
        NVIC_EnableIRQ(EXTI10_15_IRQn);
        break;
      #else
      default:
        NVIC_EnableIRQ(EXTI4_15_IRQn);
        break;
      #endif
    }
  }
}

/*********************************************************************************************************//**
 * @brief Returns the selected Button state.
 * @param  BUTTON_x: Specifies the Button to be configured.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_WAKEUP: Wakeup Push Button
 *     @arg BUTTON_KEY1: Key1 Push Button
 *     @arg BUTTON_KEY2: Key2 Push Button
 * @return The Button GPIO pin value.
 ************************************************************************************************************/
u32 HT32F_DVB_PBGetState(BUTTON_TypeDef BUTTON_x)
{
  return GPIO_ReadInBit(GPIO_PORT[BUTTON_GPIO_ID[BUTTON_x]], BUTTON_GPIO_PIN[BUTTON_x]);
}

/*********************************************************************************************************//**
 * @brief Configures COM port.
 * @param  COMn: Specifies the COM port to be configured.
 *   This parameter can be one of following parameters:
 *     @arg COM1
 *     @arg COM2
 * @param USART_InitStructure: Pointer to a USART_InitTypeDef structure that contains the configuration
 *        information for the specified USART peripheral.
 * @return None
 ************************************************************************************************************/
void HT32F_DVB_COMInit(COM_TypeDef COMn, USART_InitTypeDef* USART_InitStructure)
{
  const HT32_Board_COM_TypeDef *COMInfo = &gCOMInfo[COMn];
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable the AFIO Clock                                                                                  */
  /* Enable USART clock                                                                                     */
  COM1_CLK(CKCUClock) = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure USART Tx/Rx as alternate function                                                            */
  HT32F_DVB_GPxConfig(COMInfo->Tx_IO.ID, COMInfo->Tx_IO.Pin, COMInfo->Tx_IO.Mode);
  HT32F_DVB_GPxConfig(COMInfo->Rx_IO.ID, COMInfo->Rx_IO.Pin, COMInfo->Rx_IO.Mode);

  /* USART configuration                                                                                    */
  USART_Init(COMInfo->USARTx, USART_InitStructure);

  /* USART Tx enable                                                                                        */
  USART_TxCmd(COMInfo->USARTx, ENABLE);
  /* USART Rx enable                                                                                        */
  USART_RxCmd(COMInfo->USARTx, ENABLE);

  #if (RETARGET_INT_MODE == 1)
  USART_RXTLConfig(COMInfo->USARTx, USART_RXTL_01);
  USART_IntConfig(COMInfo->USARTx, USART_INT_RXDR, ENABLE);
  NVIC_EnableIRQ(COM1_IRQn);
  #endif
}

/*********************************************************************************************************//**
 * @brief Init BUZZER.
 * @param  hFreq: the PWM frequency of buzzer to be configured.
 *   This parameter can be 1 ~ 6000 (Unit: Hz).
 * @param  bDuty: the PWM duty of buzzer to be configured.
 *   This parameter can be 0 ~ 100 (Unit: %).
 * @param  mode: 0 for init, 1 for config.
 * @return None
 ************************************************************************************************************/
void HT32F_DVB_BuzzerFun(u16 hFreq, u8 bDuty, u32 mode)
{
  CKCU_ClocksTypeDef Clocks;
  TM_TimeBaseInitTypeDef TimeBaseInit = {0};
  TM_OutputInitTypeDef OutInit;
  u32 wCRR = 0, wPSCR = 0, wCHCCR = 0;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  CKCU_GetClocksFrequency(&Clocks);
  /* Compute CRR and PSCR value                                                                             */
  wCRR = (Clocks.HCLK_Freq / hFreq) - 1;
  while ((wCRR / (wPSCR + 1)) > 0xFFFF)
  {
    wPSCR++;
  }
  wCRR = wCRR / (wPSCR + 1);
  wCHCCR = ((wCRR + 1) * (100 - bDuty)) / 100;

  if (mode == 0)
  {

    /* Reset buzzer Timer                                                                                   */
    TM_DeInit(BUZZER_TM);

    /* Enable Timer Clock of BUZZER                                                                         */
    BUZZER_TM_CLK(CKCUClock)    = 1;
    BUZZER_GPIO_CLK(CKCUClock)  = 1;
    CKCUClock.Bit.AFIO          = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);

    /* Configure the BUZZER_GPIO_PIN as Timer channel output AFIO function                                  */
    HT32F_DVB_GPxConfig(BUZZER_GPIO_ID, BUZZER_AFIO_PIN, BUZZER_AFIO_MODE);
    GPIO_DriveConfig(GPIO_PORT[BUZZER_GPIO_ID], BUZZER_AFIO_PIN, GPIO_DV_8MA);

    /* Init BUZZER Timer time-base                                                                          */
    TM_TimeBaseStructInit(&TimeBaseInit);
    TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
    TimeBaseInit.CounterReload = wCRR;
    TimeBaseInit.Prescaler = wPSCR;
    TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
    TM_TimeBaseInit(BUZZER_TM, &TimeBaseInit);

    /* Clear Update Event 1 Interrupt flag                                                                  */
    TM_ClearFlag(BUZZER_TM, TM_FLAG_UEV);

    /* Init BUZZER Timer Channel x to output PWM waveform with 33% duty                                     */
    TM_OutputStructInit(&OutInit);
    OutInit.Channel = BUZZER_TM_CHANNEL;
    OutInit.OutputMode = TM_OM_PWM2;
    OutInit.Control = TM_CHCTL_DISABLE;
    OutInit.Polarity = TM_CHP_NONINVERTED;
    OutInit.Compare = wCHCCR;
    TM_OutputInit(BUZZER_TM, &OutInit);

    /* Enable CHCCR and CRR preload function                                                                */
    TM_CHCCRPreloadConfig(BUZZER_TM, BUZZER_TM_CHANNEL, ENABLE);
    TM_CRRPreloadCmd(BUZZER_TM, ENABLE);
    #if (LIBCFG_MCTM0)
    if (BUZZER_TM == HT_MCTM0)
    {
      /* BUZZER Timer Channel Main Output enable                                                            */
      MCTM_CHMOECmd(BUZZER_TM, ENABLE);
    }
    #endif

    /* Enable BUZZER Timer                                                                                  */
    TM_Cmd(BUZZER_TM, ENABLE);
  }
  else
  {
    vu32 *pCHxCCR = ((vu32*)&BUZZER_TM->CH0CCR) + BUZZER_TM_CHANNEL;
    TM_UpdateCmd(BUZZER_TM, DISABLE);
    BUZZER_TM->CRR = wCRR;
    BUZZER_TM->PSCR = wPSCR;
    *pCHxCCR = wCHCCR;
    TM_UpdateCmd(BUZZER_TM, ENABLE);
  }
}

/*********************************************************************************************************//**
 * @brief Configure BUZZER PWM Frequency and Duty.
 * @param Control: This parameter can be ENABLE or DISABLE.
 * @return None
 ************************************************************************************************************/
void HT32F_DVB_BuzzerOutputCmd(ControlStatus Control)
{
  TM_ChannelConfig(BUZZER_TM, BUZZER_TM_CHANNEL, (TM_CHCTL_Enum) Control);
}
/**
  * @}
  */

/* Private functions ---------------------------------------------------------------------------------------*/
/** @defgroup HT32F5xxxx_BOARD_Private_Functions HT32F5xxxx Board private functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Enable GPIO and AFIO Clock.
 * @param  GpioId: Specifies the GPIO ID.
 * @retval None
 ************************************************************************************************************/
static void _HT32F_DVB_ClockConfig(u32 GpioId)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  u8 RegCK[GPIO_PORT_NUM] = {0};
  RegCK[GpioId] = 1;

  CKCUClock.Bit.PA         = RegCK[0];
  CKCUClock.Bit.PB         = RegCK[1];
  #if (LIBCFG_GPIOC)
  CKCUClock.Bit.PC         = RegCK[2];
  #endif
  #if (LIBCFG_GPIOD)
  CKCUClock.Bit.PD         = RegCK[3];
  #endif
  #if (LIBCFG_GPIOE)
  CKCUClock.Bit.PE         = RegCK[4];
  #endif
  #if (LIBCFG_GPIOF)
  CKCUClock.Bit.PF         = RegCK[5];
  #endif
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
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

/**
  * @}
  */
