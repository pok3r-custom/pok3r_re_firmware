/*********************************************************************************************************//**
 * @file    ht32f1656_sk.c
 * @version $Rev:: 923          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides firmware functions to manage LEDs, push-buttons
 *          and COM ports and is available on HT32F1656 Starter kit.
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
#include "ht32f1656_sk.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup HT32_Board
  * @{
  */

/** @defgroup HT32F1656_SK HT32F1656_SK
  * @brief Provides firmware functions to manage LEDs, push-buttons
  *        and COM ports and is available on HT32F1656 Starter kit.
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
/** @defgroup HT32F1656_SK_Private_TypesDefinitions HT32F1656 Starter kit private types definitions
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
/** @defgroup HT32F1656_SK_Global_Variable HT32F1656 Starter kit global variables
  * @{
  */

  HT_GPIO_TypeDef* const GPIO_PORT[GPIO_PORT_NUM] = {
    HT_GPIOA, HT_GPIOB, HT_GPIOC, HT_GPIOD, HT_GPIOE
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

  const HT32_Board_COM_TypeDef gCOMInfo[COMn] =
  {
    {
      COM1_PORT,
      { COM1_TX_GPIO_ID, COM1_TX_AFIO_PIN, COM1_TX_AFIO_MODE },
      { COM1_RX_GPIO_ID, COM1_RX_AFIO_PIN, COM1_RX_AFIO_MODE },
    },
    {
      COM2_PORT,
      { COM2_TX_GPIO_ID, COM2_TX_AFIO_PIN, COM2_TX_AFIO_MODE },
      { COM2_RX_GPIO_ID, COM2_RX_AFIO_PIN, COM2_RX_AFIO_MODE },
    },
  };

/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup HT32F1656_SK_Global_Functions HT32F1656 Starter kit global functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Configures LED GPIO.
 * @param Led: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDInit(LED_TypeDef Led)
{
  u32 bGpioId = LED_GPIO_ID[Led];
  u32 uGPIOPin = LED_GPIO_PIN[Led];
  AFIO_MODE_Enum uGPIOMode = LED_AFIO_MODE[Led];
  HT_GPIO_TypeDef* GPIOx = GPIO_PORT[bGpioId];

  /* Enable the GPIO_LED Clock                                                                              */
  /* Enable the AFIO Clock                                                                                  */
  _HT32F_DVB_ClockConfig(bGpioId);

  /* Configure the AFIO mode                                                                                */
  HT32F_DVB_GPxConfig(bGpioId, uGPIOPin, uGPIOMode);

  /* LED is off by default                                                                                  */
  HT32F_DVB_LEDOff(Led);

  /* Configure the GPIO pin                                                                                 */
  GPIO_PullResistorConfig(GPIOx, uGPIOPin, GPIO_PR_DISABLE);
  GPIO_DriveConfig(GPIOx, uGPIOPin, GPIO_DV_8MA);
  GPIO_DirectionConfig(GPIOx, uGPIOPin, GPIO_DIR_OUT);
}

/*********************************************************************************************************//**
 * @brief Turns selected LED On.
 * @param Led: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDOn(LED_TypeDef Led)
{
  GPIO_PORT[LED_GPIO_ID[Led]]->SRR = LED_GPIO_PIN[Led];
}

/*********************************************************************************************************//**
 * @brief Turns selected LED Off.
 * @param Led: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDOff(LED_TypeDef Led)
{
  GPIO_PORT[LED_GPIO_ID[Led]]->RR = LED_GPIO_PIN[Led];
}

/*********************************************************************************************************//**
 * @brief Toggles the selected LED.
 * @param Led: Specifies the LED to be configured. This parameter can be one of the following values:
 *    @arg HT_LED1
 *    @arg HT_LED2
 *    @arg HT_LED3
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_LEDToggle(LED_TypeDef Led)
{
  GPIO_PORT[LED_GPIO_ID[Led]]->DOUTR ^= LED_GPIO_PIN[Led];
}

/*********************************************************************************************************//**
 * @brief Configures Button GPIO and EXTI.
 * @param  Button: Specifies the Button to be configured.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_WAKEUP: Wakeup Push Button
 *     @arg BUTTON_KEY1: Key1 Push Button
 *     @arg BUTTON_KEY2: Key2 Push Button
 * @param  Button_Mode: Specifies Button mode.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_MODE_GPIO: Button will be used as simple IO
 *     @arg BUTTON_MODE_EXTI: Button will be connected to EXTI channel with interrupt generation capability
 * @retval None
 ************************************************************************************************************/
void HT32F_DVB_PBInit(BUTTON_TypeDef Button, BUTTON_MODE_TypeDef Button_Mode)
{
  u32 bGpioId  = BUTTON_GPIO_ID[Button];
  u32 uGpioPin = BUTTON_GPIO_PIN[Button];
  HT_GPIO_TypeDef* GPIOx = GPIO_PORT[bGpioId];

  /* Enable the GPIO Clock                                                                                  */
  /* Enable the AFIO Clock                                                                                  */
  _HT32F_DVB_ClockConfig(bGpioId);

  /* Configure Button pin as input floating                                                                 */
  HT32F_DVB_GPxConfig(bGpioId, uGpioPin, BUTTON_AFIO_MODE[Button]);
  GPIO_PullResistorConfig(GPIOx, uGpioPin, GPIO_PR_DISABLE);
  GPIO_DirectionConfig(GPIOx, uGpioPin, GPIO_DIR_IN);
  GPIO_InputConfig(GPIOx, uGpioPin, ENABLE);

  if (Button_Mode == BUTTON_MODE_EXTI)
  {
    EXTI_InitTypeDef EXTI_InitStruct = {0};
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

    /* Enable the EXTI Clock                                                                                */
    CKCUClock.Bit.EXTI       = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);

    /* Configure button EXTI Line on falling edge                                                           */
    EXTI_InitStruct.EXTI_Channel = BUTTON_EXTI_CH[Button];
    EXTI_InitStruct.EXTI_Debounce = EXTI_DEBOUNCE_DISABLE;
    EXTI_InitStruct.EXTI_DebounceCnt = 0;  /* 28bits counter, 0x0 ~ 0x0FFF_FFFF                             */
    EXTI_InitStruct.EXTI_IntType = (Button == BUTTON_WAKEUP) ? EXTI_POSITIVE_EDGE : EXTI_NEGATIVE_EDGE;
    EXTI_Init(&EXTI_InitStruct);

    /* Connect Button EXTI Channel to Button GPIO Pin                                                       */
    AFIO_EXTISourceConfig((AFIO_EXTI_CH_Enum)BUTTON_EXTI_CH[Button], (AFIO_ESS_Enum)bGpioId);

    /* Enable Button EXTI Interrupt                                                                         */
    EXTI_IntConfig(BUTTON_EXTI_CH[Button], ENABLE);
    NVIC_EnableIRQ((IRQn_Type)(EXTI0_IRQn + BUTTON_EXTI_CH[Button]));
  }
}

/*********************************************************************************************************//**
 * @brief Returns the selected Button state.
 * @param  Button: Specifies the Button to be configured.
 *   This parameter can be one of following parameters:
 *     @arg BUTTON_WAKEUP: Wakeup Push Button
 *     @arg BUTTON_KEY1: Key1 Push Button
 *     @arg BUTTON_KEY2: Key2 Push Button
 * @return The Button GPIO pin value.
 ************************************************************************************************************/
u32 HT32F_DVB_PBGetState(BUTTON_TypeDef Button)
{
  return GPIO_ReadInBit(GPIO_PORT[BUTTON_GPIO_ID[Button]], BUTTON_GPIO_PIN[Button]);
}

/*********************************************************************************************************//**
 * @brief Configures COM port.
 * @param  COM: Specifies the COM port to be configured.
 *   This parameter can be one of following parameters:
 *     @arg COM1
 *     @arg COM2
 * @param USART_InitStructure: Pointer to a USART_InitTypeDef structure that contains the configuration
 *        information for the specified USART peripheral.
 * @return None
 ************************************************************************************************************/
void HT32F_DVB_COMInit(COM_TypeDef COM, USART_InitTypeDef* USART_InitStructure)
{
  const HT32_Board_COM_TypeDef *COMInfo = &gCOMInfo[COM];
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable the AFIO Clock                                                                                  */
  /* Enable USART clock                                                                                     */
  (COM == COM1) ? (COM1_CLK(CKCUClock) = 1) : (COM2_CLK(CKCUClock) = 1);
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
  MCTM_TimeBaseInitTypeDef TimeBaseInit = {0};
  MCTM_OutputInitTypeDef OutInit;
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
    MCTM_DeInit(BUZZER_TM);

    /* Enable Timer Clock of BUZZER                                                                         */
    BUZZER_TM_CLK(CKCUClock)    = 1;
    BUZZER_GPIO_CLK(CKCUClock)  = 1;
    CKCUClock.Bit.AFIO          = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);

    /* Configure the BUZZER_GPIO_PIN as Timer channel output AFIO function                                  */
    HT32F_DVB_GPxConfig(BUZZER_GPIO_ID, BUZZER_AFIO_PIN, BUZZER_AFIO_MODE);
    GPIO_DriveConfig(GPIO_PORT[BUZZER_GPIO_ID], BUZZER_AFIO_PIN, GPIO_DV_8MA);

    /* Init BUZZER Timer time-base                                                                          */
    MCTM_TimeBaseStructInit(&TimeBaseInit);
    TimeBaseInit.CounterMode = MCTM_CNT_MODE_UP;
    TimeBaseInit.CounterReload = wCRR;
    TimeBaseInit.Prescaler = wPSCR;
    TimeBaseInit.PSCReloadTime = MCTM_PSC_RLD_IMMEDIATE;
    MCTM_TimeBaseInit(BUZZER_TM, &TimeBaseInit);

    /* Clear Update Event 1 Interrupt flag                                                                  */
    MCTM_ClearFlag(BUZZER_TM, MCTM_FLAG_UEV1);

    /* Init BUZZER Timer Channel x to output PWM waveform with 33% duty                                     */
    MCTM_OutputStructInit(&OutInit);
    OutInit.Channel = BUZZER_TM_CHANNEL;
    OutInit.OutputMode = MCTM_OM_PWM2;
    OutInit.Control = MCTM_CHCTL_DISABLE;
    OutInit.Polarity = MCTM_CHP_NONINVERTED;
    OutInit.Compare = wCHCCR;
    MCTM_OutputInit(BUZZER_TM, &OutInit);

    /* Enable CHCCR and CRR preload function                                                                */
    MCTM_CHCCRPreloadConfig(BUZZER_TM, BUZZER_TM_CHANNEL, ENABLE);
    MCTM_CRRPreloadCmd(BUZZER_TM, ENABLE);

    /* BUZZER Timer Channel Main Output enable                                                              */
    MCTM_CHMOECmd(BUZZER_TM, ENABLE);

    /* Enable BUZZER Timer                                                                                  */
    MCTM_Cmd(BUZZER_TM, ENABLE);
  }
  else
  {
    vu32 *pCHxCCR = ((vu32*)&BUZZER_TM->CH0CCR) + BUZZER_TM_CHANNEL;
    MCTM_UpdateCmd(BUZZER_TM, DISABLE);
    BUZZER_TM->CRR = wCRR;
    BUZZER_TM->PSCR = wPSCR;
    *pCHxCCR = wCHCCR;
    MCTM_UpdateCmd(BUZZER_TM, ENABLE);
  }
}

/*********************************************************************************************************//**
 * @brief Configure BUZZER PWM Frequency and Duty.
 * @param Control: This parameter can be ENABLE or DISABLE.
 * @return None
 ************************************************************************************************************/
void HT32F_DVB_BuzzerOutputCmd(ControlStatus Control)
{
  MCTM_ChannelConfig(BUZZER_TM, BUZZER_TM_CHANNEL, (MCTM_CHCTL_Enum) Control);
}
/**
  * @}
  */

/* Private functions ---------------------------------------------------------------------------------------*/
/** @defgroup HT32F1656_SK_Private_Functions HT32F1656 Starter kit private functions
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
  CKCUClock.Bit.PC         = RegCK[2];
  CKCUClock.Bit.PD         = RegCK[3];
  CKCUClock.Bit.PE         = RegCK[4];
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
