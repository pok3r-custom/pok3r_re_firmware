/*********************************************************************************************************//**
 * @file    SLED/PDMA/main.c
 * @version $Rev:: 3964         $
 * @date    $Date:: 2019-06-05 #$
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

/** @addtogroup SLED_PDMA
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define LED_STRIP_DISP_LEN            (44)    /* strip */
#define LED_STRIP_PATN_LEN            (8)
#define LED_GRB_DATA_LEN              (3)     /* 3 bytes */

/* Private function prototypes -----------------------------------------------------------------------------*/
static void __Delay(u32 count);

/* Global variables ----------------------------------------------------------------------------------------*/
u8 gColorTable[LED_STRIP_PATN_LEN][LED_GRB_DATA_LEN] =
{
  { 0xFF, 0x66, 0x66 }, // HSL(120, 100%,  70%)
  { 0xFF, 0x38, 0x38 }, // HSL(120, 100%,  61%)
  { 0xFF, 0x0A, 0x0A }, // HSL(120, 100%,  52%)
  { 0xDB, 0x00, 0x00 }, // HSL(120, 100%,  43%)
  { 0xAD, 0x00, 0x00 }, // HSL(120, 100%,  34%)
  { 0x80, 0x00, 0x00 }, // HSL(120, 100%,  25%)
  { 0x52, 0x00, 0x00 }, // HSL(120, 100%,  16%)
  { 0x24, 0x00, 0x00 }, // HSL(120, 100%,   7%)
};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 i, new_pix_cnt=0;
  u8 gDispBuf[LED_STRIP_DISP_LEN][LED_GRB_DATA_LEN];
  SLED_InitTypeDef SLED_InitStruct     = { 0 };
  PDMACH_InitTypeDef PDMACH_InitStruct = { 0 };

  /* Enable SLED & AFIO APB clock                                                                           */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.AFIO             = 1;
  CKCUClock.Bit.PDMA             = 1;
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

  /* Enable PDMA                                                                                            */
  SLED_PDMACmd(HTCFG_SLED, ENABLE);
  /* HTCFG_SLED_PDMA_RAM_TO_DR_CH is used to move the RAM data to the  DR of SLED.                          */
  PDMA_IntConfig(HTCFG_SLED_PDMA_RAM_TO_DR_CH, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);
  /* HTCFG_SLED_PDMA_RAM_TO_RAM_CH is used to data shift.                                                   */
  PDMA_IntConfig(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);

  while (1)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Start lighting the LED strip by SLED                                                                 */
    /* PDMA Configuration : gDispBuf to HTCFG_SLED->DR, linear increment to fix, 8-bit.                     */
    /*------------------------------------------------------------------------------------------------------*/
    PDMACH_InitStruct.PDMACH_AdrMod   = SRC_ADR_LIN_INC | DST_ADR_FIX;
    PDMACH_InitStruct.PDMACH_SrcAddr  = (u32)&gDispBuf[0][0];
    PDMACH_InitStruct.PDMACH_DstAddr  = (u32)&HTCFG_SLED->DR;
    PDMACH_InitStruct.PDMACH_DataSize = WIDTH_8BIT;
    PDMACH_InitStruct.PDMACH_BlkLen   = LED_GRB_DATA_LEN;
    PDMACH_InitStruct.PDMACH_BlkCnt   = LED_STRIP_DISP_LEN;
    PDMACH_InitStruct.PDMACH_Priority = H_PRIO;
    PDMA_Config(HTCFG_SLED_PDMA_RAM_TO_DR_CH, &PDMACH_InitStruct);
    SLED_InsertResetCode(HTCFG_SLED);
    PDMA_EnaCmd(HTCFG_SLED_PDMA_RAM_TO_DR_CH, ENABLE);

    /* Check transfer finish                                                                                */
    while (PDMA_GetFlagStatus(HTCFG_SLED_PDMA_RAM_TO_DR_CH, PDMA_FLAG_TC) == RESET);
    PDMA_ClearFlag(HTCFG_SLED_PDMA_RAM_TO_DR_CH, PDMA_FLAG_TC);

    /*------------------------------------------------------------------------------------------------------*/
    /* Shift the pixel data.                                                                                */
    /* PDMA Configuration : gDispBuf to gDispBuf, linear decrement to linear decrement, 8-bit.              */
    /*------------------------------------------------------------------------------------------------------*/
    PDMACH_InitStruct.PDMACH_AdrMod   = SRC_ADR_LIN_DEC | DST_ADR_LIN_DEC;
    PDMACH_InitStruct.PDMACH_SrcAddr  = (u32)&gDispBuf[LED_STRIP_DISP_LEN-2][0];
    PDMACH_InitStruct.PDMACH_DstAddr  = (u32)&gDispBuf[LED_STRIP_DISP_LEN-1][0];
    PDMACH_InitStruct.PDMACH_DataSize = WIDTH_8BIT;
    PDMACH_InitStruct.PDMACH_BlkLen   = LED_GRB_DATA_LEN;
    PDMACH_InitStruct.PDMACH_BlkCnt   = LED_STRIP_DISP_LEN - 1;
    PDMACH_InitStruct.PDMACH_Priority = M_PRIO;
    PDMA_Config(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, &PDMACH_InitStruct);
    PDMA_EnaCmd(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, ENABLE);
    PDMA_SwTrigCmd(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, ENABLE);

    /* Check transfer finish                                                                                */
    while (PDMA_GetFlagStatus(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, PDMA_FLAG_TC) == RESET);
    PDMA_ClearFlag(HTCFG_SLED_PDMA_RAM_TO_RAM_CH, PDMA_FLAG_TC);

    /*------------------------------------------------------------------------------------------------------*/
    /* 1. Add new one pixel.                                                                                */
    /* 2. Shitf Color Table.                                                                                */
    /*------------------------------------------------------------------------------------------------------*/
    /* Add new one pixel                                                                                    */
    if (new_pix_cnt < LED_STRIP_PATN_LEN)
    {
      /* Turn on the LED                                                                                    */
      gDispBuf[0][0] = gColorTable[new_pix_cnt][0];
      gDispBuf[0][1] = gColorTable[new_pix_cnt][1];
      gDispBuf[0][2] = gColorTable[new_pix_cnt][2];
    }
    else
    {
      /* Turn off the LED                                                                                   */
      gDispBuf[0][0] = 0;
      gDispBuf[1][0] = 0;
      gDispBuf[2][0] = 0;
    }

    /* Shitf Color Table                                                                                    */
    if (++new_pix_cnt > (LED_STRIP_DISP_LEN-1))
    {
      /* Change color                                                                                       */
      for (i=0; i<LED_STRIP_PATN_LEN; i++)
      {
        u8 tmp;
        tmp = gColorTable[i][0];
        gColorTable[i][0] = gColorTable[i][1];
        gColorTable[i][1] = gColorTable[i][2];
        gColorTable[i][2] = tmp;
      }
      new_pix_cnt = 0;
    }
     /* Delay                                                                                               */
    __Delay(SystemCoreClock/1000);
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
