/*********************************************************************************************************//**
 * @file    SLED/RGB/main.c
 * @version $Rev:: 4179         $
 * @date    $Date:: 2019-08-03 #$
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
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup SLED_Example SLED
  * @{
  */

/** @addtogroup SLED_RGB
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define LED_STRIP_DISP_LEN            (44)    /* 44 LEDs on the LED Strip                                   */
#define LED_GRB_DATA_LEN              (3)     /* 3 bytes                                                    */
#define LED_NUMBER_OF_COLOR_TYPES     (8)     /* 8 color type                                               */

/* Private function prototypes -----------------------------------------------------------------------------*/
static void __Delay(u32 count);

/* Global variables ----------------------------------------------------------------------------------------*/
u8 gGRBTable[LED_NUMBER_OF_COLOR_TYPES][LED_GRB_DATA_LEN]={
  { 0x00, 0xFF, 0x00 },     /* Red                                                                          */
  { 0xA5, 0xFF, 0x00 },     /* Otange                                                                       */
  { 0xFF, 0xFF, 0x00 },     /* Yellow                                                                       */
  { 0x80, 0x00, 0x00 },     /* Green                                                                        */
  { 0xFF, 0x00, 0xFF },     /* Cyan                                                                         */
  { 0x00, 0x00, 0xFF },     /* Blue                                                                         */
  { 0x00, 0x4B, 0x82 },     /* Indigo                                                                       */
  { 0x08, 0x80, 0x80 },     /* Violet                                                                       */
};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i, j, k =0;
  SLED_InitTypeDef SLED_InitStruct = { 0 };

  /* Enable SLED & AFIO APB clock                                                                           */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.AFIO             = 1;
  HTCFG_SLED_CLK(CKCUClock)      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure GPIO to SLED mode                                                                            */
  AFIO_GPxConfig(HTCFG_SLED_GPIO_ID, HTCFG_SLED_AFIO_PIN, AFIO_FUN_SLED);

  /* Configure SLED                                                                                         */
  SLED_InitStruct.ClockPrescaler = HTCFG_SLED_CK_PRESCALER;   /* F_PCLK / HTCFG_SLED_CK_PRESCALER= 20M Hz   */
  SLED_InitStruct.BaudRate       = HTCFG_SLED_BAUDRATE - 1;   /* F_SCLK/HTCFG_SLED_BAUDRATE      = 800K Hz  */
  SLED_InitStruct.T0H            = HTCFG_SLED_T0H - 1;        /* 5/25 = 20% Duty. 800K*(100/20)  = 4M Hz    */
  SLED_InitStruct.T1H            = HTCFG_SLED_TH1 - 1;        /* 20/25 = 80% Duty. 800K*(100/80) = 1M Hz    */
  SLED_InitStruct.SyncState      = SLED_SYNC_STATE_T0;
  SLED_InitStruct.IdleState      = SLED_IDLE_STATE_LOW;
  SLED_InitStruct.ResetState     = SLED_RESET_STATE_LOW;
  SLED_InitStruct.SyncMode       = SLED_SYNC_MODE_DISABLE;
  SLED_InitStruct.OutputPolarity = SLED_OUTPUT_NONINVERTING;
  SLED_Init(HTCFG_SLED, &SLED_InitStruct);

  /* Enable SLED                                                                                            */
  SLED_OutputCmd(HTCFG_SLED, ENABLE);
  SLED_FIFOTrigLevelConfig(HTCFG_SLED, SLED_FIFO_LEVEL_1);
  SLED_Cmd(HTCFG_SLED, ENABLE);

  while(1)
  {
    /* Select color type                                                                                    */
    for(i = 0; i < LED_NUMBER_OF_COLOR_TYPES; i++) 
    {
      /* Select LED                                                                                         */
      for(j = 0; j < LED_STRIP_DISP_LEN; j++)
      {
        /* Select RGB                                                                                       */
        for(k = 0; k < LED_GRB_DATA_LEN; k++)
        {
          /* Send data                                                                                      */
          HTCFG_SLED->DR = gGRBTable[i][k];  /* RGB Data                                                    */
        }
        /* Waiting for transfer to complete                                                                 */
        while(SLED_GetFIFOStatus(HTCFG_SLED) != 0){}
      }
     /* Delay                                                                                               */
      __Delay(SystemCoreClock/30);
    }
  }
}

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  delay function
  * @param  count: delay count for loop
  * @retval None
  ***********************************************************************************************************/
static void __Delay(u32 count)
{
  while(count--)
  {
    __NOP(); // Prevent delay loop be optimized
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
