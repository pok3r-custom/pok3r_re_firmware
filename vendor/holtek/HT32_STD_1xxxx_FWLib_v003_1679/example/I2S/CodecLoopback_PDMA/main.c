/*********************************************************************************************************//**
 * @file    I2S/CodecLoopback_PDMA/main.c
 * @version $Rev:: 1364         $
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
#include "i2cm.h"
#include "wm8978.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup I2S_Examples I2S
  * @{
  */

/** @addtogroup CodecLoopback_PDMA
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define HALF_BUF_SIZE   (32 * 5)
#define BUF_SIZE        (HALF_BUF_SIZE * 2)

#define SOURCE_TYPE_VOICE   0
#define SOURCE_TYPE_MUSIC   1
#define SOURCE_TYPE_SEL     SOURCE_TYPE_VOICE

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
vu32 TxBuf[2][HALF_BUF_SIZE];
u32 RxBuf[2][HALF_BUF_SIZE];

I2CM_TransferType I2CM_Transfer;
volatile u8 AltBuf = 0;
volatile bool IsRxTrigLevelReach = FALSE;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  DelayXuS.
  * @retval None
  ***********************************************************************************************************/
void DelayXuS(u32 uS)
{
  uS *= 20;
  while (uS--);
}

/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  I2S_InitTypeDef I2S_InitStructure;
  PDMACH_InitTypeDef PDMACH_InitStructure;

  NVIC_Configuration();
  CKCU_Configuration();
  GPIO_Configuration();
  RETARGET_Configuration();
  I2CM_Init();
  WM8978_Init();

  printf("\r\n\r\nHT32 I2S and WM8978 Loopback ...\r\n");

  /* Config I2S                                                                                             */
  I2S_InitStructure.I2S_Mode = I2S_MASTER_TX_RX;
  I2S_InitStructure.I2S_Format = I2S_JUSTIFIED_STEREO;
  I2S_InitStructure.I2S_WordWidth = I2S_WORDWIDTH_16;
  I2S_InitStructure.I2S_MclkOut = ENABLE;
  I2S_InitStructure.I2S_BclkInv = DISABLE;
#if (SOURCE_TYPE_SEL == SOURCE_TYPE_VOICE)
  I2S_InitStructure.I2S_X_Div = HTCFG_I2S_VOICE_X_DIV;            // MCLK = (PCLK * X_DIV / Y_DIV) / 2 = 2.047 MHz (256 x 8 kHz)
  I2S_InitStructure.I2S_Y_Div = HTCFG_I2S_VOICE_Y_DIV;
  I2S_InitStructure.I2S_N_Div = 256 / (2 * 16) - 1;               // BCLK = 2.047 MHz / 8 = 255.924 kHz (32 x 8 kHz)
#else
  I2S_InitStructure.I2S_X_Div = HTCFG_I2S_MUSIC_X_DIV;            // MCLK = (PCLK * X_DIV / Y_DIV) / 2 = 12.28x MHz (256 x 48 kHz)
  I2S_InitStructure.I2S_Y_Div = HTCFG_I2S_MUSIC_Y_DIV;
  I2S_InitStructure.I2S_N_Div = 256 / (2 * 16) - 1;               // BCLK = 12.28x MHz / 8 = 1536 kHz (32 x 48 kHz)
#endif
  I2S_Init(&I2S_InitStructure);

  /* I2S TX                                                                                                 */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)&TxBuf[0][0];
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&HT_I2S->TXDR;
  PDMACH_InitStructure.PDMACH_AdrMod = (SRC_ADR_LIN_INC | DST_ADR_FIX | AUTO_RELOAD);
  PDMACH_InitStructure.PDMACH_BlkCnt = BUF_SIZE/5;
  PDMACH_InitStructure.PDMACH_BlkLen = 5;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = M_PRIO;
  PDMA_Config(PDMA_CH3, &PDMACH_InitStructure);
  PDMA_EnaCmd(PDMA_CH3, ENABLE);

  I2S_FIFOTrigLevelConfig(I2S_TX_FIFO, 3);  // Tx FIFO data '<' or '=' 3
  I2S_PDMACmd(I2S_PDMAREQ_TX, ENABLE);
  I2S_IntConfig(I2S_INT_TXFIFO_UDF, ENABLE);

  /* I2S RX                                                                                                 */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)&HT_I2S->RXDR;
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&RxBuf[0][0];
  PDMACH_InitStructure.PDMACH_AdrMod = (SRC_ADR_FIX | DST_ADR_LIN_INC | AUTO_RELOAD);
  PDMACH_InitStructure.PDMACH_BlkCnt = BUF_SIZE/5;
  PDMACH_InitStructure.PDMACH_BlkLen = 5;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = H_PRIO;
  PDMA_Config(PDMA_CH2, &PDMACH_InitStructure);
  PDMA_IntConfig(PDMA_CH2, (PDMA_INT_GE | PDMA_INT_TC | PDMA_INT_HT), ENABLE);
  PDMA_EnaCmd(PDMA_CH2, ENABLE);

  I2S_FIFOTrigLevelConfig(I2S_RX_FIFO, 5);  // Rx FIFO data '>' or '=' 5
  I2S_PDMACmd(I2S_PDMAREQ_RX, ENABLE);
  I2S_IntConfig(I2S_INT_RXFIFO_OVF, ENABLE);

  I2S_Cmd(ENABLE);

  while (1)
  {
    int i;

    while (IsRxTrigLevelReach == FALSE);
    IsRxTrigLevelReach = FALSE;
    for (i = 0; i < HALF_BUF_SIZE; i++)
    {
      u32 tmp = RxBuf[AltBuf][i];
      TxBuf[AltBuf][i] = (tmp & 0xFFFF0000) | (tmp >> 16);
    }
  }
}

/*********************************************************************************************************//**
  * @brief  WM8978 register read
  * @retval None
  ***********************************************************************************************************/
void WM8978_RegWrite(u16 Address, u16 Data)
{
  Address = (Address | Data) >> 8;
  I2CM_BlockedBufferWrite(WM8978_ID, Address, (u8*)&Data, 1);
}

/*********************************************************************************************************//**
  * @brief  Init WM8978.
  * @retval None
  ***********************************************************************************************************/
void WM8978_Init(void)
{
  /********************************************
   * Power On Sequence
   ********************************************/
  /* REG_00                                                                                                 */
  WM8978_RegWrite(REG_SOFTWARE_RESET, 0);
  /* REG_34 (Headphone)                                                                                     */
  WM8978_RegWrite(REG_LOUT1_VOL, LOUT1MUTE);
  /* REG_35 (Headphone)                                                                                     */
  WM8978_RegWrite(REG_ROUT1_VOL, ROUT1MUTE);
  /* REG_36 (SPK)                                                                                           */
  WM8978_RegWrite(REG_LOUT2_VOL, LOUT2MUTE);
  /* REG_37 (SPK)                                                                                           */
  WM8978_RegWrite(REG_ROUT2_VOL, ROUT2MUTE);
  /* REG_38                                                                                                 */
  WM8978_RegWrite(REG_OUT3_MIXER, OUT3MUTE);
  /* REG_39                                                                                                 */
  WM8978_RegWrite(REG_OUT4_MIXER, OUT4MUTE);
  /* REG_01                                                                                                 */
  WM8978_RegWrite(REG_POWER_MANAGEMENT1, BUFDCOPEN | BUFIOEN | VMIDSEL_75K | BIASEN | MICBEN);
  /* REG_31                                                                                                 */
  WM8978_RegWrite(REG_OUTPUT, SPKBOOST);
  /* REG_03                                                                                                 */
  WM8978_RegWrite(REG_POWER_MANAGEMENT3, LMIXEN | DACENL | RMIXEN | DACENR | LOUT2EN | ROUT2EN);
  /* REG_02                                                                                                 */
  WM8978_RegWrite(REG_POWER_MANAGEMENT2, LOUT1EN | ROUT1EN | INPPGAENL | INPPGAENR | ADCENL | ADCENR);

  /********************************************
   * Digital Audio Interfaces
   ********************************************/
  /* REG_04                                                                                                 */
  WM8978_RegWrite(REG_AUDIO_INTERFACE, /*FMT_I2S FMT_RIGHT_JUSTIFIED*/ FMT_I2S | WL_16BITS);
  /* REG_06                                                                                                 */
  WM8978_RegWrite(REG_CLOCK_GEN, CLKSEL_MCLK | MCLK_DIV1);

  /********************************************
   * Analogue Sample Rates & Analogue Outputs
   ********************************************/
  /* REG_07                                                                                                 */
#if (SOURCE_TYPE_SEL == SOURCE_TYPE_VOICE)
  WM8978_RegWrite(REG_ADDITIONAL, SR_8KHZ);
#else
  WM8978_RegWrite(REG_ADDITIONAL, SR_48KHZ);
#endif
  /********************************************
   * GPIO
   ********************************************/
  /* REG_08                                                                                                 */
  //WM8978_RegWrite(REG_GPIO, 0);

  /********************************************
   * Output Switching
   ********************************************/
  /* REG_09                                                                                                 */
  //WM8978_RegWrite(REG_JACK_DETECT1, 0);

  /********************************************
   * Output Signal Path & Power Management
   ********************************************/
  /* REG_0A                                                                                                 */
  //WM8978_RegWrite(REG_DAC, 0);

  /********************************************
   * Analogue to Digital Converter
   ********************************************/
  /* REG_0B                                                                                                 */
  WM8978_RegWrite(REG_LEFT_DAC_VOL, DACVU | 0xFF);  /* 0xFF = 0dB, 0xFE = -0.5dB, 0xFD = -1dB, ...          */

  /********************************************
   * Output Signal Path
   ********************************************/
  /* REG_0C                                                                                                 */
  WM8978_RegWrite(REG_RIGHT_DAC_VOL, DACVU | 0xFF); /* 0xFF = 0dB, 0xFE = -0.5dB, 0xFD = -1dB, ...          */

  /********************************************
   * Output Switching
   ********************************************/
  /* REG_0D                                                                                                 */
  //WM8978_RegWrite(REG_JACK_DETECT2, 0);

  /********************************************
   * Analogue to Digital Converter
   ********************************************/
  /* REG_0E                                                                                                 */
  WM8978_RegWrite(REG_ADC, HPFEN | HPFAPP | HPFCUT_0 | ADCOSR128);
  /* REG_0F                                                                                                 */
  WM8978_RegWrite(REG_LEFT_ADC_VOL, ADCVU | 0xFF);  /* 0xFF = 0dB, 0xFE = -0.5dB, 0xFD = -1dB, ...          */
  /* REG_10                                                                                                 */
  WM8978_RegWrite(REG_RIGHT_ADC_VOL, ADCVU | 0xFF); /* 0xFF = 0dB, 0xFE = -0.5dB, 0xFD = -1dB, ...          */

  /********************************************
   * Output Signal Path
   ********************************************/
  /* REG_12                                                                                                 */
  //WM8978_RegWrite(REG_EQ1, EQ3DMODE_DAC | EQ1C_80HZ | 0x0C);
  /* REG_13                                                                                                 */
  //WM8978_RegWrite(REG_EQ2, EQ2BW_NARROW | EQ2C_230HZ | 0x0C);
  /* REG_14                                                                                                 */
  //WM8978_RegWrite(REG_EQ3, EQ3BW_NARROW | EQ3C_650HZ | 0x0C);
  /* REG_15                                                                                                 */
  //WM8978_RegWrite(REG_EQ4, EQ4BW_NARROW | EQ4C_1_8KHZ | 0x0C);
  /* REG_16                                                                                                 */
  //WM8978_RegWrite(REG_EQ5, EQ5C_5_3KHZ | 0x0C);
  /* REG_18                                                                                                 */
  //WM8978_RegWrite(REG_DAC_LIMITER1, LIMDCY_750US | LIMATK_94US);
  /* REG_19                                                                                                 */
  //WM8978_RegWrite(REG_DAC_LIMITER2, LIMLVL_N1DB | LIMBOOST_0DB);

  /********************************************
   * Analogue to Digital Converter
   ********************************************/
  /* REG_1B                                                                                                 */
  //WM8978_RegWrite(REG_NOTCH_FILTER1, 0);
  /* REG_1C                                                                                                 */
  //WM8978_RegWrite(REG_NOTCH_FILTER2, 0);
  /* REG_1D                                                                                                 */
  //WM8978_RegWrite(REG_NOTCH_FILTER3, 0);
  /* REG_1E                                                                                                 */
  //WM8978_RegWrite(REG_NOTCH_FILTER4, 0);

  /********************************************
   * Input Limiter Automatic Level Control
   ********************************************/
  /* REG_20                                                                                                 */
  WM8978_RegWrite(REG_ALC1, ALCSEL_BOTH_ON | ALCMAXGAIN_35_25DB | ALCMINGAIN_N12DB);
  /* REG_21                                                                                                 */
  WM8978_RegWrite(REG_ALC2, ALCHLD_0MS | ALCLVL_N12DBFS);
  /* REG_22                                                                                                 */
#if (SOURCE_TYPE_SEL == SOURCE_TYPE_VOICE)
  WM8978_RegWrite(REG_ALC3, ALCMODE_ALC | ALCDCY_3 | ALCATK_2);   // 8 kHz
#else
  WM8978_RegWrite(REG_ALC3, ALCMODE_ALC | ALCDCY_10 | ALCATK_6);  // 44.1 kHz
#endif
  /* REG_23                                                                                                 */
  WM8978_RegWrite(REG_NOISE_GATE, NGEN | NGTH_N75DB);

  /********************************************
   * Analogue Outputs
   ********************************************/
  /* REG_2B                                                                                                 */
  WM8978_RegWrite(REG_BEEP, INVROUT2);

  /********************************************
   * Input Signal Path
   ********************************************/
  /* REG_2C                                                                                                 */
  WM8978_RegWrite(REG_INPUT, MBVSEL_0_65AVDD | RIN2INPVGA | RIP2INPVGA | LIN2INPVGA | LIP2INPVGA);
  /* REG_2D                                                                                                 */
  WM8978_RegWrite(REG_LEFT_PGA_GAIN, INPPGAUPDATE | 0x10);
  /* REG_2E                                                                                                 */
  WM8978_RegWrite(REG_RIGHT_PGA_GAIN, INPPGAUPDATE | 0x10);
  /* REG_2F                                                                                                 */
  WM8978_RegWrite(REG_LEFT_ADC_BOOST, /* PGABOOSTL | */ L2_2BOOSTVOL_DISABLED | AUXL2BOOSTVOL_DISABLED);
  /* REG_30                                                                                                 */
  WM8978_RegWrite(REG_RIGHT_ADC_BOOST, /* PGABOOSTR | */ R2_2BOOSTVOL_DISABLED | AUXR2BOOSTVOL_DISABLED);

  /********************************************
   * Analogue Output
   ********************************************/
  /* REG_31                                                                                                 */
  WM8978_RegWrite(REG_OUTPUT, TSDEN | SPKBOOST);
  /* REG_32                                                                                                 */
  WM8978_RegWrite(REG_LEFT_MIXER, /* BYPLMIXVOL_6DB | BYPL2LMIX */ DACL2LMIX);
  /* REG_33                                                                                                 */
  WM8978_RegWrite(REG_RIGHT_MIXER, /* BYPRMIXVOL_6DB | BYPR2RMIX */ DACR2RMIX);
  /* REG_34                                                                                                 */
  WM8978_RegWrite(REG_LOUT1_VOL, HPVU | (0x39 + 0));    // +0 dB range from -57dB to +6dB
  /* REG_35                                                                                                 */
  WM8978_RegWrite(REG_ROUT1_VOL, HPVU | (0x39 + 0));    // +0 dB range from -57dB to +6dB
  /* REG_36                                                                                                 */
  WM8978_RegWrite(REG_LOUT2_VOL, SPKVU | (0x39 + 0));    // +0 dB range from -57dB to +6dB
  /* REG_37                                                                                                 */
  WM8978_RegWrite(REG_ROUT2_VOL, SPKVU | (0x39 + 0));    // +0 dB range from -57dB to +6dB
  /* REG_38                                                                                                 */
  //WM8978_RegWrite(REG_OUT3_MIXER, OUT3MUTE);
  /* REG_39                                                                                                 */
  //WM8978_RegWrite(REG_OUT4_MIXER, OUT4MUTE);
}

/*********************************************************************************************************//**
  * @brief  Configure USART.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* I2S                                                                                                    */
  AFIO_GPxConfig(HTCFG_I2S_BCLK_GPIO_ID, HTCFG_I2S_BCLK_AFIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_SDO_GPIO_ID, HTCFG_I2S_SDO_AFIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_SDI_GPIO_ID, HTCFG_I2S_SDI_AFIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_MCLK_GPIO_ID, HTCFG_I2S_MCLK_AFIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_WS_GPIO_ID, HTCFG_I2S_WS_AFIO_PIN, AFIO_MODE_10);

  /* I2C                                                                                                    */
  AFIO_GPxConfig(HTCFG_I2CM_MASTER_SCK_ID, HTCFG_I2CM_MASTER_SCK_AFIO_PIN, AFIO_MODE_7);
  AFIO_GPxConfig(HTCFG_I2CM_MASTER_SDA_ID, HTCFG_I2CM_MASTER_SDA_AFIO_PIN, AFIO_MODE_7);
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA         = 1;
  CKCUClock.Bit.AFIO         = 1;
  CKCUClock.Bit.I2S          = 1;
  HTCFG_I2CM_CKCU(CKCUClock) = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */

  NVIC_EnableIRQ(I2S_IRQn);
  NVIC_EnableIRQ(PDMACH2_IRQn);
  NVIC_EnableIRQ(HTCFG_I2CM_IRQ);
}

/*********************************************************************************************************//**
 * @brief   This function is used to init the I2C master.
 * @retval  None
 ************************************************************************************************************/
void I2CM_Init(void)
{
  I2C_InitTypeDef  I2C_InitStructure = { 0 };

  /* I2C configuration                                                                                      */
  I2C_InitStructure.I2C_GeneralCall     = I2C_GENERALCALL_DISABLE;
  I2C_InitStructure.I2C_AddressingMode  = I2C_ADDRESSING_7BIT;
  I2C_InitStructure.I2C_Acknowledge     = I2C_ACK_DISABLE;
  I2C_InitStructure.I2C_OwnAddress      = I2CM_OWN_ADDR;
  I2C_InitStructure.I2C_Speed           = I2CM_SPEED;
  I2C_InitStructure.I2C_SpeedOffset     = 0;
  I2C_Init(I2CM, &I2C_InitStructure);

  I2C_SetTimeOutPrescaler(I2CM, I2C_PRESCALER_128);
  I2C_SetTimeOutValue(I2CM, ((SystemCoreClock/128) * 8 * 10) / I2CM_SPEED); /* Must within 10 Bytes Time               */

  /* Enable I2C                                                                                             */
  I2C_Cmd(I2CM, ENABLE);
  I2C_TimeOutCmd(I2CM, ENABLE);

  /* Enable I2C interrupts                                                                                  */
  I2C_IntConfig(I2CM, I2C_INT_STA | I2C_INT_ADRS | I2C_INT_RXDNE | I2C_INT_TXDE |\
                      I2C_INT_RXNACK | I2C_INT_TOUT | I2C_INT_BUSERR | I2C_INT_ARBLOS, ENABLE);
}

/*********************************************************************************************************//**
 * @brief   Set the word address mode used 8 bits or 16 bits.
 * @param   word_addr_mode: Specify addressing mode. This parameter can be one of the following values:
 *    @arg   I2CM_WORD_ADDR_MODE_1BYTE
 *    @arg   I2CM_WORD_ADDR_MODE_2BYTE
 * @retval  none
 ************************************************************************************************************/
void I2CM_WordAddressModeConfig(u32 word_addr_mode)
{
  I2CM_Transfer.RegAddrMode = word_addr_mode;
}

/*********************************************************************************************************//**
 * @brief   Install the I2C master transfer end callback function.
 * @param   callback: Specify a pointer that point to callback function.
 * @retval  none
 ************************************************************************************************************/
void I2CM_InstallTransferEndCallback(void (*callback)(void))
{
  I2CM_Transfer.TransferEndCallback = callback;
}

/*********************************************************************************************************//**
 * @brief   Uninstall the I2C master transfer end callback function
 * @retval  none
 ************************************************************************************************************/
void I2CM_UninstallTransferEndCallback(void)
{
  I2CM_Transfer.TransferEndCallback = NULL;
}

/*********************************************************************************************************//**
 * @brief   Get the I2C master transfer status.
 * @retval  SUCCESS or ERROR
 ************************************************************************************************************/
u32 I2CM_GetTransferStatus(void)
{
  u32 return_value = I2CM_BUSY;
  I2CM_TransferType* pTransfer = &I2CM_Transfer;

  if (pTransfer->Status != I2CM_BUSY)
  {
    u32 timeout = 500; /* 50 mS                                                                             */
    while (I2C_GetFlagStatus(I2CM, I2C_FLAG_BUSBUSY))
    {
      I2CM_DelayXuS(100);
      timeout--;
      if (timeout == 0)
      {
        pTransfer->Status = I2CM_TOUTF;
        I2C_GenerateSTOP(I2CM);
        I2CM_DelayXuS(1000);
        I2C_DeInit(I2CM);
        break;
      }
    }
    return_value = pTransfer->Status;
  }

  return return_value;
}

/*********************************************************************************************************//**
 * @brief   Waits until the transfer is completed.
 * @retval  SUCCESS or ERROR
 ************************************************************************************************************/
ErrStatus I2CM_WaitTransferEnd(void)
{
  ErrStatus retv = ERROR;

  while (1)
  {
    u32 status = I2CM_GetTransferStatus();
    if (status != I2CM_BUSY)
    {
      if (status == I2CM_OK)
      {
        retv = SUCCESS;
      }
      else
      {
        I2CM_DBG_PRINTF("\r\nI2CM Error state 0x%X at line %u\r\n", status, __LINE__);
      }
      break;
    }
  }

  return retv;
}

/*********************************************************************************************************//**
 * @brief   Read data from I2C.
 * @param   dev: Specify the target I2C device address.
 * @param   word_addr: Specify the word address of target I2C device.
 * @param   data: Specify pointer that point to the receive buffer.
 * @param   count: Specify the read data length.
 * @retval  None
 ************************************************************************************************************/
void I2CM_BufferRead(u16 dev, u16 word_addr, u8* data, u16 count)
{
  I2CM_TransferType* pTransfer = &I2CM_Transfer;

  while (I2CM_GetTransferStatus() == I2CM_BUSY);

  pTransfer->RegAddr     = word_addr;
  pTransfer->Buffer      = data;
  pTransfer->Length      = count;
  pTransfer->Counter     = 0;
  pTransfer->Direction   = I2CM_DIRECTION_IN;
  pTransfer->DevAddr     = dev;
  pTransfer->Status      = I2CM_BUSY;
  pTransfer->RetryDownCounter = I2CM_BUS_MAX_RETRY;

  /* Send I2C START                                                                                         */
  I2C_TargetAddressConfig(I2CM, pTransfer->DevAddr, I2C_MASTER_WRITE);
}

/*********************************************************************************************************//**
 * @brief   Blocked Read data from I2C.
 * @param   dev: Specify the target I2C device address.
 * @param   word_addr: Specify the word address of target I2C device.
 * @param   data: Specify pointer that point to the receiver buffer.
 * @param   count: Specify the read data length.
 * @retval  SUCCESS or ERROR
 ************************************************************************************************************/
ErrStatus I2CM_BlockedBufferRead(u16 dev, u16 word_addr, u8* data, u16 count)
{
  I2CM_BufferRead(dev, word_addr, data, count);
  return I2CM_WaitTransferEnd();
}

/*********************************************************************************************************//**
 * @brief   Write data to I2C.
 * @param   dev: Specify the target I2C device address.
 * @param   word_addr: Specify the word address of target I2C device.
 * @param   data: Specify pointer that point to the transmitter buffer.
 * @param   count: Specify the write data length.
 * @retval  None
 ************************************************************************************************************/
void I2CM_BufferWrite(u16 dev, u16 word_addr, u8* data, u16 count)
{
  I2CM_TransferType* pTransfer = &I2CM_Transfer;

  while (I2CM_GetTransferStatus() == I2CM_BUSY);

  pTransfer->RegAddr     = word_addr;
  pTransfer->Buffer      = data;
  pTransfer->Length      = count;
  pTransfer->Counter     = 0;
  pTransfer->Direction   = I2CM_DIRECTION_OUT;
  pTransfer->DevAddr     = dev;
  pTransfer->Status      = I2CM_BUSY;
  pTransfer->RetryDownCounter = I2CM_BUS_MAX_RETRY;

  /* Send I2C START                                                                                         */
  I2C_TargetAddressConfig(I2CM, pTransfer->DevAddr, I2C_MASTER_WRITE);

}

/*********************************************************************************************************//**
 * @brief   Blocked write data to I2C.
 * @param   dev: Specify the target I2C device address.
 * @param   word_addr: Specify the word address of target I2C device.
 * @param   data: Specify pointer that point to the transmitter buffer.
 * @param   count: Specify the write data length.
 * @retval  SUCCESS or ERROR
 ************************************************************************************************************/
ErrStatus I2CM_BlockedBufferWrite(u16 dev, u16 word_addr, u8* data, u16 count)
{
  I2CM_BufferWrite(dev, word_addr, data, count);
  return I2CM_WaitTransferEnd();
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
