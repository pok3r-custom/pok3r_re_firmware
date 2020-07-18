/*********************************************************************************************************//**
 * @file    ht32f5xxxx_midi.h
 * @version $Rev:: 1704         $
 * @date    $Date:: 2017-08-17 #$
 * @brief   The header file of the MIDI library.
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

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F5XXXX_MIDI_H
#define __HT32F5XXXX_MIDI_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"


/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @addtogroup MIDI
  * @{
  */

#define VOL_MAX 0
#define VOL_MUTE 0x3FF

/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup MIDI_Exported_Types MIDI exported types
  * @{
  */
typedef struct
{
  u32 MIDI_MCUCHEN;
  u32 MIDI_DACDS;
  u32 MIDI_MUSIC_EN;
  u32 MIDI_SPI_RDEN;
  u32 MIDI_SPI_DISLOOP;
  u32 MIDI_CHS;
} MIDI_InitTypeDef;

/**
 * @brief  Enumeration of MIDI CTRL CHS.
 */
typedef enum
{
  CHS16 = 0,  /*!< Select 16-Channel                                                                        */
  CHS20,      /*!< Select 20-Channel                                                                        */
  CHS24,      /*!< Select 24-Channel                                                                        */
  CHS28,      /*!< Select 28-Channel                                                                        */
  CHS32,      /*!< Select 32-Channel                                                                        */
} MIDI_CTRL_CHS_Enum;

/**
 * @brief  Enumeration of MIDI Note.
 */
typedef enum
{
  BL0   = 0,
  BL1,
  BL2,
  BL3,
  BL4,
  BL5,
  BL6,
  BL7,
  BL8,
  BL9,
  BL10,
  BL11,
  BL12,
  BL13,
  BL14,
  BL15,
} MIDI_FREQ_BL_Enum;

/**
 * @brief  Enumeration of MIDI VOL AR.
 */
typedef enum
{
  ENV_ATTACK = SET,
  ENV_RELEASE = RESET,
} MIDI_VOL_AR_Enum;
/**
 * @brief  Enumeration of MIDI VOL ENV.
 */
typedef enum
{
  ENV_TYPE0 = 0,
  ENV_TYPE1,
  ENV_TYPE2,
  ENV_NO,
} MIDI_VOL_ENV_Enum;

/**
 * @brief  Enumeration of MIDI RE_NUM WBS.
 */
typedef enum
{
  WBS8   = 0,  /*!< WBS 8-bit                                                                               */
  WBS12,       /*!< WBS 12-bit                                                                              */
  WBS16,       /*!< WBS 16-bit                                                                              */
} MIDI_RENUM_WBS_Enum;

/**
 * @brief  Enumeration of MIDI CHAN ST.
 */
typedef enum
{
  ST_OFF = DISABLE,
  ST_ON = ENABLE,
} MIDI_CHAN_ST_Enum;
/**
 * @brief  Enumeration of MIDI CHAN VM.
 */
typedef enum
{
  VM_OFF = DISABLE,
  VM_ON = ENABLE,
} MIDI_CHAN_VM_Enum;
/**
 * @brief  Enumeration of MIDI CHAN FR.
 */
typedef enum
{
  FR_OFF = DISABLE,
  FR_ON = ENABLE,
} MIDI_CHAN_FR_Enum;
/**
 * @brief  Enumeration of MIDI CHAN CHx.
 */
typedef enum
{
  MIDI_CHx0  = 0,
  MIDI_CHx1,
  MIDI_CHx2,
  MIDI_CHx3,
  MIDI_CHx4,
  MIDI_CHx5,
  MIDI_CHx6,
  MIDI_CHx7,
  MIDI_CHx8,
  MIDI_CHx9,
  MIDI_CHx10,
  MIDI_CHx11,
  MIDI_CHx12,
  MIDI_CHx13,
  MIDI_CHx14,
  MIDI_CHx15,
  MIDI_CHx16,
  MIDI_CHx17,
  MIDI_CHx18,
  MIDI_CHx19,
  MIDI_CHx20,
  MIDI_CHx21,
  MIDI_CHx22,
  MIDI_CHx23,
  MIDI_CHx24,
  MIDI_CHx25,
  MIDI_CHx26,
  MIDI_CHx27,
  MIDI_CHx28,
  MIDI_CHx29,
  MIDI_CHx30,
  MIDI_CHx31,
} MIDI_CHAN_CHx_Enum;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup MIDI_Exported_Constants MIDI exported constants
  * @{
  */
#define MIDI_FLAG_INTF                               ((u32)0x00000001)

#define MIDI_INT_INTEN                               ((u32)0x00000001)
#define MIDI_INT_MIDII_DMAEN                         ((u32)0x00000002)
#define MIDI_INT_MIDIO_DMAEN                         ((u32)0x00000004)

#define IS_MIDI(x)                                   (x == HT_MIDI)

///***Initialize the MIDIx peripheral according to the specified parameters in the MIDI_InitStruct.*        */

 /**      Channel 11~14 Waveform Data Source Selection  *                                                   */
 /**      0: External SPI Flash memory                  *                                                   */
 /**      1: CHxA and CHxB Registers                    *                                                   */

#define MIDI_MCUCHEN_0                                (0)
#define MIDI_MCUCHEN_1                                (1)
#define MIDI_MCUCHEN_2                                (2)
#define MIDI_MCUCHEN_3                                (3)    /**Channel 11~12: CHxA and CHxB Registers, Channel 13~14: External SPI Flash memory **/
#define MIDI_MCUCHEN_4                                (4)
#define MIDI_MCUCHEN_5                                (5)
#define MIDI_MCUCHEN_6                                (6)
#define MIDI_MCUCHEN_7                                (7)
#define MIDI_MCUCHEN_8                                (8)
#define MIDI_MCUCHEN_9                                (9)
#define MIDI_MCUCHEN_10                               (10)
#define MIDI_MCUCHEN_11                               (11)
#define MIDI_MCUCHEN_12                               (12)
#define MIDI_MCUCHEN_13                               (13)
#define MIDI_MCUCHEN_14                               (14)
#define MIDI_MCUCHEN_15                               (15)

#define IS_MIDI_MCUCHEN(CHANNEL)                (((CHANNEL) == MIDI_MCUCHEN_0) || ((CHANNEL) == MIDI_MCUCHEN_1) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_2) || ((CHANNEL) == MIDI_MCUCHEN_3) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_4) || ((CHANNEL) == MIDI_MCUCHEN_5) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_6) || ((CHANNEL) == MIDI_MCUCHEN_7) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_8) || ((CHANNEL) == MIDI_MCUCHEN_9) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_10) || ((CHANNEL) == MIDI_MCUCHEN_11) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_12) || ((CHANNEL) == MIDI_MCUCHEN_13) || \
                                                 ((CHANNEL) == MIDI_MCUCHEN_14) || ((CHANNEL) == MIDI_MCUCHEN_15))


#define MIDI_DACDS_OSD                           ((u32)0x00000000)//Data Processing Method in Each Channel before Data Accumulation
#define MIDI_DACDS_SR1Bit                        ((u32)0x00000001)
#define MIDI_DACDS_SR2Bit                        ((u32)0x00000002)
#define MIDI_DACDS_SR3Bit                        ((u32)0x00000003)
#define MIDI_DACDS_SR4Bit                        ((u32)0x00000004)
#define MIDI_DACDS_SR5Bit                        ((u32)0x00000005)

#define IS_MIDI_DACDS(x)    ((x == MIDI_DACDS_OSD)    || \
                             (x == MIDI_DACDS_SR1Bit) || \
                             (x == MIDI_DACDS_SR2Bit) || \
                             (x == MIDI_DACDS_SR3Bit) || \
                             (x == MIDI_DACDS_SR4Bit) || \
                             (x == MIDI_DACDS_SR5Bit))

#define IS_MIDI_MUSIC_EN(x)     ((x == DISABLE)    || \
                                 (x == ENABLE))

#define IS_MIDI_SPI_RDEN(x)     ((x == DISABLE)    || \
                                 (x == ENABLE))

#define MIDI_SPI_DISLOOP_AddReturn                        ((u32)0x00000000)
#define MIDI_SPI_DISLOOP_AddIncrement                     ((u32)0x00000001)
#define IS_MIDI_SPI_DISLOOP(x)     ((x == MIDI_SPI_DISLOOP_AddReturn)    || \
                                    (x == MIDI_SPI_DISLOOP_AddIncrement))

//Select multiple Channel numbers to play music simultaneously
#define MIDI_CHS_16Channel                        ((u32)0x00000000)
#define MIDI_CHS_20Channel                        ((u32)0x00000001)
#define MIDI_CHS_24Channel                        ((u32)0x00000002)
#define MIDI_CHS_28Channel                        ((u32)0x00000003)
#define MIDI_CHS_32Channel                        ((u32)0x00000004)
#define IS_MIDI_MIDI_CHS(x)                     ((x == MIDI_CHS_16Channel)    || \
                                                 (x == MIDI_CHS_20Channel)    || \
                                                 (x == MIDI_CHS_24Channel)    || \
                                                 (x == MIDI_CHS_28Channel)    || \
                                                 (x == MIDI_CHS_32Channel))

/* check parameter of the MIDI flag                                                                         */
#define MIDI_INT_FLAG                                    ((u32)0x00000001)
#define IS_MIDI_FLAG(x)                                  (x == MIDI_INT_FLAG)
#define IS_MIDI_FLAG_CLEAR(x)                            (x == MIDI_INT_FLAG)

#define MIDI_INT                                         ((u32)0x00000001)
#define IS_MIDI_INT(x)                                   (x == MIDI_INT)

/* check parameter of the Octave Frequency Point                                                            */
#define IS_MIDI_BL(x)                (((x) == BL0)  || ((x) == BL1)  || \
                                      ((x) == BL2)  || ((x) == BL3)  || \
                                      ((x) == BL4)  || ((x) == BL5)  || \
                                      ((x) == BL6)  || ((x) == BL7)  || \
                                      ((x) == BL8)  || ((x) == BL9)  || \
                                      ((x) == BL10) || ((x) == BL11) || \
                                      ((x) == BL12) || ((x) == BL13) || \
                                      ((x) == BL14) || ((x) == BL15))
#define IS_MIDI_FR(x)                 ((x) < 4096)

#define IS_MIDI_ENV(x)               ((x == ENV_TYPE0)   || \
                                      (x == ENV_TYPE1)  || \
                                      (x == ENV_TYPE2)  || \
                                      (x == ENV_NO))
#define IS_MIDI_VL(x)                ((x) < 1024)
#define IS_MIDI_VR(x)                ((x) < 1024)

#define IS_MIDI_RENUM_WBS(x)         ((x == WBS8)   || \
                                      (x == WBS12)  || \
                                      (x == WBS16))

#define IS_MIDI_CHAN_ST(x)           ((x == ST_OFF)   || \
                                      (x == ST_ON))

#define IS_MIDI_CHAN_VM(x)           ((x == VM_OFF)   || \
                                      (x == VM_ON))

#define IS_MIDI_CHAN_FR(x)           ((x == FR_OFF)   || \
                                      (x == FR_ON))
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup MIDI_Exported_Functions MIDI exported functions
  * @{
  */
void MIDI_Init(HT_MIDI_TypeDef* MIDIx, MIDI_InitTypeDef* MIDI_InitStruct);
FlagStatus MIDI_GetFlagStatus(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Flag);
void MIDI_ClearFlag(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Flag);
void MIDI_IntConfig(HT_MIDI_TypeDef* MIDIx, u32 MIDI_Int, ControlStatus NewState);

void MIDI_FREQ(HT_MIDI_TypeDef* MIDIx, MIDI_FREQ_BL_Enum BL, u16 FR);
void MIDI_VOL(HT_MIDI_TypeDef* MIDIx, MIDI_VOL_AR_Enum A_R, MIDI_VOL_ENV_Enum ENV, u16 VL, u16 VR);
void MIDI_STADDT(HT_MIDI_TypeDef* MIDIx, u32 ST_ADDR);
void MIDI_RENUM(HT_MIDI_TypeDef* MIDIx, MIDI_RENUM_WBS_Enum WBS, u16 RE);
void MIDI_ENDADDT(HT_MIDI_TypeDef* MIDIx, u32 END_ADDR);
void MIDI_CHAN(HT_MIDI_TypeDef* MIDIx, MIDI_CHAN_ST_Enum ST, MIDI_CHAN_VM_Enum VM, MIDI_CHAN_FR_Enum FR, u8 CHx);

void MIDI_MCU_CHxB_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH0B, u16 CH0A);
void MIDI_MCU_CHxC_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH1B, u16 CH1A);
void MIDI_MCU_CHxD_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH2B, u16 CH2A);
void MIDI_MCU_CHxE_DATA(HT_MIDI_TypeDef* MIDIx, u16 CH3B, u16 CH3A);

u32 MIDI_GetLeftChannelOutputData(HT_MIDI_TypeDef* MIDIx);
u32 MIDI_GetRightChannelOutputData(HT_MIDI_TypeDef* MIDIx);
u32 MIDI_GetExtSPIFlashData(HT_MIDI_TypeDef* MIDIx);
u32 MIDI_GetExtSPIFlashDataAddress(HT_MIDI_TypeDef* MIDIx);
/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif
