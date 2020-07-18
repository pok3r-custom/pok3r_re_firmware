/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound/main.c
 * @version $Rev:: 1364         $
 * @date    $Date:: 2018-08-02 #$
 * @brief   The main program of USB Device Audio example.
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
#include <string.h>
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"

#include "i2cm.h"
#include "wm8978.h"
#include "ht32_usbd_core.h"
#include "ht32_usbd_class.h"
#include "ht32_usbd_descriptor.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USB_UAC_Sound
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define HALF_BUF_SIZE       (_EP4LEN / 4)
#define BUF_SIZE            (HALF_BUF_SIZE * 2)

/* Global variables ----------------------------------------------------------------------------------------*/
__ALIGN4 USBDCore_TypeDef gUSBCore;
USBD_Driver_TypeDef gUSBDriver;
u32 gIsLowPowerAllowed = TRUE;

/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 u32 TxBuf[2][HALF_BUF_SIZE];
vu8 AltBuf = 1;

volatile bool IsRxTrigLevelReach = FALSE;

I2CM_TransferType I2CM_Transfer;

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void USB_Configuration(void);
void USBPLL_Configuration(void);
void Suspend(u32 uPara);
void DelayXuS(u32 uS);

/* Global functions ----------------------------------------------------------------------------------------*/
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
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  USB_Configuration();                /* USB Related configuration                                          */

  I2CM_Init();
  WM8978_Init();

  /* Config I2S                                                                                             */
  I2S_InitStructure.I2S_Mode = I2S_MASTER_TX_RX;
  I2S_InitStructure.I2S_Format = I2S_JUSTIFIED_STEREO;
  I2S_InitStructure.I2S_WordWidth = I2S_WORDWIDTH_16;
  I2S_InitStructure.I2S_MclkOut = ENABLE;
  I2S_InitStructure.I2S_BclkInv = DISABLE;
  I2S_InitStructure.I2S_X_Div = HTCFG_I2S_X_DIV;                // MCLK = (PCLK * X_DIV / Y_DIV) / 2 ~= 12.288 MHz (256 x 48 kHz)
  I2S_InitStructure.I2S_Y_Div = HTCFG_I2S_Y_DIV;
  I2S_InitStructure.I2S_N_Div = 256 / (2 * 16) - 1;             // BCLK = 12.288 MHz / 8 ~= 1536 kHz (32 x 48 kHz)
  I2S_Init(&I2S_InitStructure);

  /* I2S TX                                                                                                 */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)&TxBuf[0][0];
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&HT_I2S->TXDR;
  PDMACH_InitStructure.PDMACH_AdrMod = (SRC_ADR_LIN_INC | DST_ADR_FIX | AUTO_RELOAD);
  PDMACH_InitStructure.PDMACH_BlkCnt = BUF_SIZE / 4;
  PDMACH_InitStructure.PDMACH_BlkLen = 4;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = M_PRIO;
  PDMA_Config(PDMA_CH3, &PDMACH_InitStructure);
  PDMA_IntConfig(PDMA_CH3, (PDMA_INT_GE | PDMA_INT_TC | PDMA_INT_HT), ENABLE);
  PDMA_EnaCmd(PDMA_CH3, ENABLE);

  I2S_FIFOTrigLevelConfig(I2S_TX_FIFO, 4);  // Tx FIFO data '<' or '=' 3
  I2S_PDMACmd(I2S_PDMAREQ_TX, ENABLE);
  I2S_IntConfig(I2S_INT_TXFIFO_UDF, ENABLE);
  I2S_Cmd(ENABLE);

  HT32F_DVB_USBConnect();

  while (1)
  {
    USBDCore_MainRoutine(&gUSBCore);  /* USB core main routine                                              */

    if (UAC_bMuteControl == 0x00)
    {
      I2S_TxMuteCmd(DISABLE);
    }
    else
    {
      I2S_TxMuteCmd(ENABLE);
    }
  }
}

/*********************************************************************************************************//**
 * @brief  WM8978 register read
 * @retval None
 ************************************************************************************************************/
void WM8978_RegWrite(u16 Address, u16 Data)
{
  Address = (Address | Data) >> 8;
  I2CM_BlockedBufferWrite(WM8978_ID, Address, (u8*)&Data, 1);
}

/*********************************************************************************************************//**
 * @brief  Init WM8978.
 * @retval None
 ************************************************************************************************************/
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
  AFIO_GPxConfig(HTCFG_I2S_BCLK_ID, HTCFG_I2S_BCLK_ADIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_SDO_ID, HTCFG_I2S_SDO_ADIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_SDI_ID, HTCFG_I2S_SDI_ADIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_MCLK_ID, HTCFG_I2S_MCLK_ADIO_PIN, AFIO_MODE_10);
  AFIO_GPxConfig(HTCFG_I2S_WS_ID, HTCFG_I2S_WS_ADIO_PIN, AFIO_MODE_10);

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
  CKCUClock.Bit.PDMA             = 1;
  CKCUClock.Bit.USBD             = 1;
  CKCUClock.Bit.AFIO             = 1;
  CKCUClock.Bit.EXTI             = 1;
  CKCUClock.Bit.I2S              = 1;
  HTCFG_I2CM_CKCU(CKCUClock)     = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

  /*--------------------------------------------------------------------------------------------------------*/
  /* Set USB Clock as PLL / HTCFG_USBPRE_DIV                                                                */
  /*--------------------------------------------------------------------------------------------------------*/
  CKCU_SetUSBPrescaler(HTCFG_USBPRE_DIV);

}

/*********************************************************************************************************//**
  * @brief  Configure NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */

  NVIC_EnableIRQ(I2S_IRQn);
  NVIC_EnableIRQ(PDMACH3_IRQn);
  NVIC_EnableIRQ(HTCFG_I2CM_IRQ);
}

/*********************************************************************************************************//**
  * @brief  Configure USB.
  * @retval None
  ***********************************************************************************************************/
void USB_Configuration(void)
{
  #if (LIBCFG_CKCU_USB_PLL)
  USBPLL_Configuration();
  #endif

  gUSBCore.pDriver = (u32 *)&gUSBDriver;                /* Initiate memory pointer of USB driver            */
  gUSBCore.Power.CallBack_Suspend.func  = Suspend;      /* Install suspend call back function into USB core */
  //gUSBCore.Power.CallBack_Suspend.uPara = (u32)NULL;

  USBDDesc_Init(&gUSBCore.Device.Desc);                 /* Initiate memory pointer of descriptor            */
  USBDClass_Init(&gUSBCore.Class);                      /* Initiate USB Class layer                         */
  USBDCore_Init(&gUSBCore);                             /* Initiate USB Core layer                          */

#if (LIBCFG_CKCU_HSI_NO_AUTOTRIM)
#else
  // Need turn on if the USB clock source is from HSI (PLL clock Source)
  #if 0
  CKCU_HSIAutoTrimClkConfig(CKCU_ATC_USB);
  CKCU_HSIAutoTrimCmd(ENABLE);
  #endif
#endif

  NVIC_EnableIRQ(USB_IRQn);                             /* Enable USB device interrupt                      */
}

#if (LIBCFG_CKCU_USB_PLL)
/*********************************************************************************************************//**
 * @brief  Configure USB PLL
 * @retval None
 ************************************************************************************************************/
void USBPLL_Configuration(void)
{
  CKCU_PLLInitTypeDef PLLInit;

  PLLInit.ClockSource = CKCU_PLLSRC_HSE;
  //PLLInit.ClockSource = CKCU_PLLSRC_HSI;
  PLLInit.CFG = CKCU_USBPLL_8M_48M;
  PLLInit.BYPASSCmd = DISABLE;
  CKCU_USBPLLInit(&PLLInit);
  CKCU_USBPLLCmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_USBPLLRDY) == RESET);
  CKCU_USBClockConfig(CKCU_CKUSBPLL);
}
#endif

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
  I2C_SetTimeOutValue(I2CM, ((SystemCoreClock/128) * 8 * 10) / I2CM_SPEED); /* Must within 10 Bytes Time    */

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

/*********************************************************************************************************//**
  * @brief  Suspend call back function which enter DeepSleep1
  * @param  uPara: Parameter for Call back function
  * @retval None
  ***********************************************************************************************************/
void Suspend(u32 uPara)
{
  #if (REMOTE_WAKEUP == 1)
  u32 IsRemoteWakeupAllowed;
  #endif

  if (gIsLowPowerAllowed)
  {

    #if (REMOTE_WAKEUP == 1)
    /* Disable EXTI interrupt to prevent interrupt occurred after wakeup                                    */
    EXTI_IntConfig(KEY1_BUTTON_EXTI_CHANNEL, DISABLE);
    IsRemoteWakeupAllowed = USBDCore_GetRemoteWakeUpFeature(&gUSBCore);

    if (IsRemoteWakeupAllowed == TRUE)
    {
      /* Enable EXTI wake event and clear wakeup flag                                                       */
      EXTI_WakeupEventConfig(KEY1_BUTTON_EXTI_CHANNEL, EXTI_WAKEUP_LOW_LEVEL, ENABLE);
      EXTI_ClearWakeupFlag(KEY1_BUTTON_EXTI_CHANNEL);
    }
    #endif

    __DBG_USBPrintf("%06ld >DEEPSLEEP\r\n", ++__DBG_USBCount);

    // Add your procedure here which disable related IO to reduce power consumption
    // ..................
    //

    /* For Bus powered device, you must enter DeepSleep1 when device has been suspended. For self-powered   */
    /* device, you may decide to enter DeepSleep1 or not depended on your application.                      */

    /* For the convenient during debugging and evaluation stage, the USBDCore_LowPower() is map to a null   */
    /* function by default. In the real product, you must map this function to the low power function of    */
    /* firmware library by setting USBDCORE_ENABLE_LOW_POWER as 1 (in the ht32fxxxx_usbdconf.h file).       */
    USBDCore_LowPower();

    // Add your procedure here which recovery related IO for application
    // ..................
    //

    __DBG_USBPrintf("%06ld <DEEPSLEEP\r\n", ++__DBG_USBCount);

    #if (REMOTE_WAKEUP == 1)
    if (EXTI_GetWakeupFlagStatus(KEY1_BUTTON_EXTI_CHANNEL) == SET)
    {
      __DBG_USBPrintf("%06ld WAKEUP\r\n", ++__DBG_USBCount);
      if (IsRemoteWakeupAllowed == TRUE && USBDCore_IsSuspend(&gUSBCore) == TRUE)
      {
        USBDCore_TriggerRemoteWakeup();
      }
    }

    if (IsRemoteWakeupAllowed == TRUE)
    {
      /* Disable EXTI wake event and clear wakeup flag                                                      */
      EXTI_WakeupEventConfig(KEY1_BUTTON_EXTI_CHANNEL, EXTI_WAKEUP_LOW_LEVEL, DISABLE);
      EXTI_ClearWakeupFlag(KEY1_BUTTON_EXTI_CHANNEL);
    }

    /* Clear EXTI edge flag and enable EXTI interrupt                                                       */
    EXTI_ClearEdgeFlag(KEY1_BUTTON_EXTI_CHANNEL);
    EXTI_IntConfig(KEY1_BUTTON_EXTI_CHANNEL, ENABLE);
    #endif
  }

  return;
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

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  DelayXuS.
  * @retval None
  ***********************************************************************************************************/
void DelayXuS(u32 uS)
{
  uS *= 20;
  while (uS--);
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
