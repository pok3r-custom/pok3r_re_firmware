/*********************************************************************************************************//**
 * @file    SCI/ATR/main.c
 * @version $Rev:: 204          $
 * @date    $Date:: 2017-06-20 #$
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

/** @addtogroup SCI_Examples SCI
  * @{
  */

/** @addtogroup ATR
  * @{
  */

#define SCI_RECEIVE_TIMEOUT   0x4000

SCI_InitTypeDef SCI_InitStructure;

vu32 Counter = 0;
vu8 CardDetected = 0;
vu8 ATR_Buffer[50] = {0};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u8 i;
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  CKCUClock.Bit.AFIO                      = 1;
  HTCFG_SMARTCARD_CLK(CKCUClock)          = 1;
  HTCFG_SMARTCARD_CMD_CLK(CKCUClock)      = 1;
  HTCFG_SMARTCARD_RSTN_CLK(CKCUClock)     = 1;
  HTCFG_SMARTCARD_CLK_CLK(CKCUClock)      = 1;
  HTCFG_SMARTCARD_DET_CLK(CKCUClock)      = 1;
  HTCFG_SMARTCARD_DIO_CLK(CKCUClock)      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  NVIC_EnableIRQ(HTCFG_SMARTCARD_IRQn);
	
  /*  Configure SCI CLK, SCI DIO, SCI DET pin  */
  HT32F_DVB_GPxConfig(HTCFG_SMARTCARD_CLK_GPIO_ID, HTCFG_SMARTCARD_CLK_AFIO_PIN, HTCFG_SMARTCARD_CLK_AFIO_MODE);
  HT32F_DVB_GPxConfig(HTCFG_SMARTCARD_DIO_GPIO_ID, HTCFG_SMARTCARD_DIO_AFIO_PIN, HTCFG_SMARTCARD_DIO_AFIO_MODE);
  HT32F_DVB_GPxConfig(HTCFG_SMARTCARD_DET_GPIO_ID, HTCFG_SMARTCARD_DET_AFIO_PIN, HTCFG_SMARTCARD_DET_AFIO_MODE);

  /*  Configure SmartCard interface CMD pin  */
  GPIO_SetOutBits(GPIO_PORT[HTCFG_SMARTCARD_CMD_GPIO_ID], HTCFG_SMARTCARD_CMD_GPIO_PIN);
  GPIO_DirectionConfig(GPIO_PORT[HTCFG_SMARTCARD_CMD_GPIO_ID], HTCFG_SMARTCARD_CMD_GPIO_PIN, GPIO_DIR_OUT);
  /*  Configure SmartCard interface RSTN pin  */
  GPIO_ClearOutBits(GPIO_PORT[HTCFG_SMARTCARD_RSTN_GPIO_ID], HTCFG_SMARTCARD_RSTN_GPIO_PIN);
  GPIO_DirectionConfig(GPIO_PORT[HTCFG_SMARTCARD_RSTN_GPIO_ID], HTCFG_SMARTCARD_RSTN_GPIO_PIN, GPIO_DIR_OUT);


  SCI_InitStructure.SCI_Mode = SCI_MODE_SCI;
  SCI_InitStructure.SCI_Retry = SCI_RETRY_NO;
  SCI_InitStructure.SCI_Convention = SCI_CONVENTION_DIRECT;
  SCI_InitStructure.SCI_CardPolarity = SCI_CARDPOLARITY_HIGH;
  SCI_InitStructure.SCI_ClockPrescale = SCI_CLKPRESCALER_12;    /* SCI CLK set to 48 MHz/12 = 4 MHz  */
  SCI_Init(HTCFG_SMARTCARD_SCI, &SCI_InitStructure);

  SCI_IntConfig(HTCFG_SMARTCARD_SCI, SCI_INT_PAR | SCI_INT_CARD, ENABLE);

  SCI_SetGuardTimeValue(HTCFG_SMARTCARD_SCI, 16);
  SCI_ETUConfig(HTCFG_SMARTCARD_SCI, 372, SCI_COMPENSATION_DISABLE);
  SCI_ClockModeConfig(HTCFG_SMARTCARD_SCI, SCI_CLK_HARDWARE);
  SCI_Cmd(HTCFG_SMARTCARD_SCI, ENABLE);

  /*  Loop while no SmartCard is detected  */
  while(!CardDetected);

  /* Get SmartCard ATR response  */
  for(i = 0; i < 50; i++, Counter = 0)
  {
    while((SCI_GetFlagStatus(HTCFG_SMARTCARD_SCI, SCI_FLAG_RXC) == RESET) && (Counter != SCI_RECEIVE_TIMEOUT))
    {
      Counter++;
    }

    if(Counter != SCI_RECEIVE_TIMEOUT)
    {
      ATR_Buffer[i] = SCI_ReceiveData(HTCFG_SMARTCARD_SCI);
    }
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
