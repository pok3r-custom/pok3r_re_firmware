/*********************************************************************************************************//**
 * @file    ht32f5xxxx_midi.c
 * @version $Rev:: 1704         $
 * @date    $Date:: 2017-08-17 #$
 * @brief   This file provides all the MIDI firmware functions.
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
#include "ht32f5xxxx_midi.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @defgroup MIDI MIDI
  * @brief MIDI driver modules
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
/** @defgroup MIDI_Private_Define MIDI private definitions
  * @{
  */
#define FREQ_FR_Mask       ((u32)0x00000FFF)

#define VOL_A_R_Mask       ((u32)0x00000FFF)
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup MIDI_Exported_Functions MIDI exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize the MIDI peripheral registers to their default reset values.
 * @retval None
 ************************************************************************************************************/
void MIDI_DeInit(void)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  RSTCUReset.Bit.MIDI = 1;
  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Initialize the MIDIx peripheral according to the specified parameters in the MIDI_InitStruct.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param MIDI_InitStruct: pointer to a MIDI_InitTypeDef structure that contains the configuration
 *   information for the specified MIDI peripheral.
 * @retval None
 ************************************************************************************************************/
void MIDI_Init(HT_MIDI_TypeDef* MIDIx, MIDI_InitTypeDef* MIDI_InitStruct)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI_MCUCHEN(MIDI_InitStruct->MIDI_MCUCHEN));
  Assert_Param(IS_MIDI_DACDS(MIDI_InitStruct->MIDI_DACDS));
  Assert_Param(IS_MIDI_MUSIC_EN(MIDI_InitStruct->MIDI_MUSIC_EN));
  Assert_Param(IS_MIDI_SPI_RDEN(MIDI_InitStruct->MIDI_SPI_RDEN));
  Assert_Param(IS_MIDI_SPI_DISLOOP(MIDI_InitStruct->MIDI_SPI_DISLOOP));
  Assert_Param(IS_MIDI_MIDI_CHS(MIDI_InitStruct->MIDI_CHS));

  HT_MIDI->CTRL = ((MIDI_InitStruct->MIDI_MCUCHEN) << 12) | ((MIDI_InitStruct->MIDI_DACDS) << 8) |
                  ((MIDI_InitStruct->MIDI_MUSIC_EN) << 7) | ((MIDI_InitStruct->MIDI_SPI_RDEN) << 6) |
                  ((MIDI_InitStruct->MIDI_SPI_DISLOOP) << 5) | (MIDI_InitStruct->MIDI_CHS);
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified MIDI interrupt.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param MIDI_Int: specify if the MIDI interrupt source to be enabled or disabled.
 *   This parameter can be any combination of the following values:
 *     @arg MIDIO_DMAEN             : MIDIO DMAEN
 *     @arg MIDII_DMAEN             : MIDII DMAEN
 *     @arg MIDI_INTEN              : MIDI INTEN
 * @param NewState: new state of the MIDI interrupts.
 *   This parameter can be: ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void MIDI_IntConfig(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Int, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_INT(MIDI_Int));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    MIDIx->IER |= MIDI_Int;
  }
  else
  {
    MIDIx->IER &= (u32)~MIDI_Int;
  }
}

/*********************************************************************************************************//**
 * @brief Check whether the specified MIDI flag has been set or not.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param MIDI_Flag: specify the flag that is to be check.
 *   This parameter can be one of the following values:
 *     @arg MIDI_INTF             : MIDI int flag
 * @retval The new state of MIDI_Flag (SET or RESET).
 ************************************************************************************************************/
FlagStatus MIDI_GetFlagStatus(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Flag)
{
  FlagStatus bitstatus = RESET;
  u32 statusreg = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_FLAG(MIDI_Flag));

  statusreg = MIDIx->SR;

  if ((statusreg & MIDI_Flag) != (u32)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }

  return bitstatus;
}

/*********************************************************************************************************//**
 * @brief Clear the specified MIDI flag.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param MIDI_Flag: specify the flag that is to be cleared.
 *   This parameter can be one of the following values:
 *     @arg MIDI_INTF            : MIDI INTF
 * @retval None
 ************************************************************************************************************/
void MIDI_ClearFlag(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Flag)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_FLAG_CLEAR(MIDI_Flag));

  MIDIx->SR &= ~MIDI_Flag;
}

/*********************************************************************************************************//**
 * @brief Specified the channel frequency.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param BL: Set the Octave Frequency Point.
 *        This parameter can be one of the following values:
 *        @arg BL0~BL15 : The bit field value ranges from 0x00 to 0x0B.
 * @param FR: Set the Tone Scale Frequency Point.
 * @retval None
 ************************************************************************************************************/
void MIDI_FREQ(HT_MIDI_TypeDef* MIDIx, MIDI_FREQ_BL_Enum BL, u16 FR)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_BL(BL));
  Assert_Param(IS_MIDI_FR(FR));

  MIDIx->FREQ = (BL << 12) | FR;
}

/*********************************************************************************************************//**
 * @brief Specified the channel frequency..
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param A_R: Attack/Release Volume Control.
 *        This parameter can be one of the following values:
 *        @arg ENV_RELEASE : Release.
 *        @arg ENV_ATTACK  : Attack.
 * @param ENV: Volume Control LSB 3-bit Control Method.
 *        This parameter can be one of the following values:
 *        @arg ENV_TYPE0 :  By hardware.
 *        @arg ENV_TYPE1 :  By hardware.
 *        @arg ENV_TYPE2 :  By hardware.
 *        @arg ENV_NO    :  By software.
 * @param VL : Left Channel Volume Control.
 * @param VR : Right Channel Volume Control.
 * @retval None
 ************************************************************************************************************/
void MIDI_VOL(HT_MIDI_TypeDef* MIDIx, MIDI_VOL_AR_Enum A_R, MIDI_VOL_ENV_Enum ENV, u16 VL, u16 VR)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_ENV(ENV));
  Assert_Param(IS_MIDI_VL(VL));
  Assert_Param(IS_MIDI_VR(VR));

  MIDIx->VOL = (A_R << 31) | (ENV << 29) | (VL << 16) | VR;
}

/*********************************************************************************************************//**
 * @brief Specified the waveform start address.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param ST_ADDR: Waveform Start Address.
 * @retval None
 ************************************************************************************************************/
void MIDI_STADDT(HT_MIDI_TypeDef* MIDIx, u32 ST_ADDR)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->ST_ADDR = ST_ADDR;
}

/*********************************************************************************************************//**
 * @brief Specified the channel frequency..
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param WBS: Sample Format.
 *        This parameter can be one of the following values:
 *        @arg WBS8  : 8-bit format.
 *        @arg WBS12 : 12-bit format.
 *        @arg WBS16 : 16-bit format.
 * @param RE : Repeat Length of Waveform (2's Complement).
 * @retval None
 ************************************************************************************************************/
void MIDI_RENUM(HT_MIDI_TypeDef* MIDIx, MIDI_RENUM_WBS_Enum WBS, u16 RE)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_RENUM_WBS(WBS));

  MIDIx->RE_NUM = (WBS << 16) | RE;
}

/*********************************************************************************************************//**
 * @brief Specified the waveform end address.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param END_ADDR: Waveform End  Address.
 * @retval None
 ************************************************************************************************************/
void MIDI_ENDADDT(HT_MIDI_TypeDef* MIDIx, u32 END_ADDR)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->END_ADDR = END_ADDR;
}

/*********************************************************************************************************//**
 * @brief Specified the Midi-engine channel selection and setting.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param TRIG_ST: Update ST_ADDR, RE_NUM and END_ADDR Register Values.
 *        This parameter can be one of the following values:
 *        @arg ST_OFF : Not update.
 *        @arg ST_ON  : Update the ST_ADDR, RE_NUM and END_ADDR register values to the specified channel when writing CH[4:0].
 * @param TRIG_VM: Update VOL Register Value..
 *        This parameter can be one of the following values:
 *        @arg VM_OFF : Not update.
 *        @arg VM_ON  : Update the VOL register value to the specified channel when writing CH[4:0].
 * @param TRIG_FR : Update FREQ Register Value.
 *        This parameter can be one of the following values:
 *        @arg FR_OFF : Not update.
 *        @arg FR_ON  : Update the FREQ register value to the specified channel when writing CH[4:0].
 * @param CHx: MIDI Engine Channel Selection or the FREQ, VOL, ST_ADDR, RE_NUM and END_ADDR Register Setting.
 * @retval None
 ************************************************************************************************************/
void MIDI_CHAN(HT_MIDI_TypeDef* MIDIx,
               MIDI_CHAN_ST_Enum TRIG_ST, MIDI_CHAN_VM_Enum TRIG_VM, MIDI_CHAN_FR_Enum TRIG_FR,
               u8 CHx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));
  Assert_Param(IS_MIDI_CHAN_ST(TRIG_ST));
  Assert_Param(IS_MIDI_CHAN_VM(TRIG_VM));
  Assert_Param(IS_MIDI_CHAN_FR(TRIG_FR));

  MIDIx->CHAN = (TRIG_ST << 10) | (TRIG_VM << 9) | (TRIG_FR << 8) | CHx;
}

/*********************************************************************************************************//**
 * @brief Specified the MCU Channel 0 data input for interpolation.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param CH0B : MCU Channel 0 Data Input B (Used for Interpolation).
 * @param CH0A : MCU Channel 0 Data Input A (Used for Interpolation).
 * @retval None
 ************************************************************************************************************/
void MIDI_MCU_CHxB_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH0B, u16 CH0A)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->MCU_CH0 = (CH0B << 16) | CH0A;
}
/*********************************************************************************************************//**
 * @brief Specified the MCU Channel 1 data input for interpolation.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param CH1B : MCU Channel 1 Data Input B (Used for Interpolation).
 * @param CH1A : MCU Channel 1 Data Input A (Used for Interpolation).
 * @retval None
 ************************************************************************************************************/
void MIDI_MCU_CHxC_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH1B, u16 CH1A)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->MCU_CH1 = (CH1B << 16) | CH1A;
}

/*********************************************************************************************************//**
 * @brief Specified the MCU Channel 2 data input for interpolation.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param CH2B : MCU Channel 2 Data Input B (Used for Interpolation).
 * @param CH2A : MCU Channel 2 Data Input A (Used for Interpolation).
 * @retval None
 ************************************************************************************************************/
void MIDI_MCU_CHxD_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH2B, u16 CH2A)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->MCU_CH2 = (CH2B << 16) | CH2A;
}

/*********************************************************************************************************//**
 * @brief Specified the MCU Channel 3 data input for interpolation.
 * @param MIDIx: where MIDIx is the selected MIDI from the MIDI peripherals.
 * @param CH3B : MCU Channel 3 Data Input B (Used for Interpolation).
 * @param CH3A : MCU Channel 3 Data Input A (Used for Interpolation).
 * @retval None
 ************************************************************************************************************/
void MIDI_MCU_CHxE_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH3B, u16 CH3A)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  MIDIx->MCU_CH3 = (CH3B << 16) | CH3A;
}

/*********************************************************************************************************//**
 * @brief Specified the Left channel MIDI output data.
 * @param MIDIx  : where MIDIx is the selected MIDI from the MIDI peripherals.
 * @return Value of Left channel MIDI output data.
 ************************************************************************************************************/
u32 MIDI_GetLeftChannelOutputData(HT_MIDI_TypeDef* MIDIx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  /* Get the Left channel MIDI output data                                                                  */
  return  MIDIx->MIDIL;

}

/*********************************************************************************************************//**
 * @brief Specified the Right channel MIDI output data.
 * @param MIDIx  : where MIDIx is the selected MIDI from the MIDI peripherals.
 * @return Value of Right channel MIDI output data.
 ************************************************************************************************************/
u32 MIDI_GetRightChannelOutputData(HT_MIDI_TypeDef* MIDIx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

   return  MIDIx->MIDIR;
}

/*********************************************************************************************************//**
 * @brief Specified the  data read from external SPI Flash memory.
 * @param MIDIx  : where MIDIx is the selected MIDI from the MIDI peripherals.
 * @return The Data Read from External SPI Flash Memory.
 ************************************************************************************************************/
u32 MIDI_GetExtSPIFlashData(HT_MIDI_TypeDef* MIDIx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  /* Get the Left channel MIDI output data                                                                  */
  return  MIDIx->SPI_DATA;

}

/*********************************************************************************************************//**
 * @brief Specified the address of the SPI_DATA..
 * @param MIDIx  : where MIDIx is the selected MIDI from the MIDI peripherals.
 * @return The Address of the Data Read from External SPI Flash Memory.
 ************************************************************************************************************/
u32 MIDI_GetExtSPIFlashDataAddress(HT_MIDI_TypeDef* MIDIx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_MIDI(MIDIx));

  return  MIDIx->SPI_ADDR;
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
