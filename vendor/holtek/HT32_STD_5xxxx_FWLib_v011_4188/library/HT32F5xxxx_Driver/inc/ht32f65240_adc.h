/*********************************************************************************************************//**
 * @file    ht32f65240_adc.h
 * @version $Rev:: 3778         $
 * @date    $Date:: 2019-04-22 #$
 * @brief   The header file of the ADC library.
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
#ifndef __HT32F65240_ADC_H
#define __HT32F65240_ADC_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @addtogroup ADC
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup ADC_Exported_Constants ADC exported constants
  * @{
  */
#define IS_ADC(x)                               ((x == HT_ADC0) || (x == HT_ADC1))

#define ONE_SHOT_MODE                           (0x00000000)
#define CONTINUOUS_MODE                         (0x00000002)
#define DISCONTINUOUS_MODE                      (0x00000003)

#define IS_ADC_CONVERSION_MODE(REGULAR_MODE)    (((REGULAR_MODE) == ONE_SHOT_MODE)   || \
                                                 ((REGULAR_MODE) == CONTINUOUS_MODE) || \
                                                 ((REGULAR_MODE) == DISCONTINUOUS_MODE))

#define IS_ADC_HP_CONVERSION_MODE(HP_MODE)      (((HP_MODE) == ONE_SHOT_MODE)   || \
                                                 ((HP_MODE) == CONTINUOUS_MODE) || \
                                                 ((HP_MODE) == DISCONTINUOUS_MODE))


#define ADC_CH_0                                (0)
#define ADC_CH_1                                (1)
#define ADC_CH_2                                (2)
#define ADC_CH_3                                (3)
#define ADC_CH_4                                (4)
#define ADC_CH_5                                (5)
#define ADC_CH_6                                (6)
#define ADC_CH_7                                (7)
#define ADC_CH_OPA0                             (8)
#define ADC_CH_OPA1                             (9)
#define ADC_CH_GND_VREF                         (16)
#define ADC_CH_VDD_VREF                         (17)

#define IS_ADC_CHANNEL(CHANNEL)                 (((CHANNEL) == ADC_CH_0) || ((CHANNEL) == ADC_CH_1) || \
                                                 ((CHANNEL) == ADC_CH_2) || ((CHANNEL) == ADC_CH_3) || \
                                                 ((CHANNEL) == ADC_CH_4) || ((CHANNEL) == ADC_CH_5) || \
                                                 ((CHANNEL) == ADC_CH_6) || ((CHANNEL) == ADC_CH_7) || \
                                                 ((CHANNEL) == ADC_CH_GND_VREF) || ((CHANNEL) == ADC_CH_VDD_VREF))

#define IS_ADC_INPUT_CHANNEL(CHANNEL)           (((CHANNEL) == ADC_CH_0) || ((CHANNEL) == ADC_CH_1) || \
                                                 ((CHANNEL) == ADC_CH_2) || ((CHANNEL) == ADC_CH_3) || \
                                                 ((CHANNEL) == ADC_CH_4) || ((CHANNEL) == ADC_CH_5) || \
                                                 ((CHANNEL) == ADC_CH_6) || ((CHANNEL) == ADC_CH_7))


#define ADC_TRIG_SOFTWARE                       (0x10000000)

#define ADC_TRIG_BFTM0                          (0x80000000)
#define ADC_TRIG_BFTM1                          (0x80080000)

#define ADC_TRIG_MCTM0_MTO                      (0x40000000)
#define ADC_TRIG_MCTM0_CH0O                     (0x41000000)
#define ADC_TRIG_MCTM0_CH1O                     (0x42000000)
#define ADC_TRIG_MCTM0_CH2O                     (0x43000000)
#define ADC_TRIG_MCTM0_CH3O                     (0x44000000)

#define ADC_TRIG_GPTM0_MTO                      (0x40010000)
#define ADC_TRIG_GPTM0_CH0O                     (0x41010000)
#define ADC_TRIG_GPTM0_CH1O                     (0x42010000)
#define ADC_TRIG_GPTM0_CH2O                     (0x43010000)
#define ADC_TRIG_GPTM0_CH3O                     (0x44010000)

#define ADC_TRIG_EXTI_0                         (0x20000000)
#define ADC_TRIG_EXTI_1                         (0x20000100)
#define ADC_TRIG_EXTI_2                         (0x20000200)
#define ADC_TRIG_EXTI_3                         (0x20000300)
#define ADC_TRIG_EXTI_4                         (0x20000400)
#define ADC_TRIG_EXTI_5                         (0x20000500)
#define ADC_TRIG_EXTI_6                         (0x20000600)
#define ADC_TRIG_EXTI_7                         (0x20000700)
#define ADC_TRIG_EXTI_8                         (0x20000800)
#define ADC_TRIG_EXTI_9                         (0x20000900)
#define ADC_TRIG_EXTI_10                        (0x20000A00)
#define ADC_TRIG_EXTI_11                        (0x20000B00)
#define ADC_TRIG_EXTI_12                        (0x20000C00)
#define ADC_TRIG_EXTI_13                        (0x20000D00)
#define ADC_TRIG_EXTI_14                        (0x20000E00)
#define ADC_TRIG_EXTI_15                        (0x20000F00)

#define IS_ADC_TRIG(REGTRIG)                    (((REGTRIG) == ADC_TRIG_GPTM0_MTO)  || \
                                                 ((REGTRIG) == ADC_TRIG_GPTM0_CH0O) || \
                                                 ((REGTRIG) == ADC_TRIG_GPTM0_CH1O) || \
                                                 ((REGTRIG) == ADC_TRIG_GPTM0_CH2O) || \
                                                 ((REGTRIG) == ADC_TRIG_GPTM0_CH3O) || \
                                                 ((REGTRIG) == ADC_TRIG_MCTM0_MTO)  || \
                                                 ((REGTRIG) == ADC_TRIG_MCTM0_CH0O) || \
                                                 ((REGTRIG) == ADC_TRIG_MCTM0_CH1O) || \
                                                 ((REGTRIG) == ADC_TRIG_MCTM0_CH2O) || \
                                                 ((REGTRIG) == ADC_TRIG_MCTM0_CH3O) || \
                                                 ((REGTRIG) == ADC_TRIG_BFTM0)     || \
                                                 ((REGTRIG) == ADC_TRIG_BFTM1)     || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_0)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_1)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_2)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_3)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_4)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_5)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_6)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_7)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_8)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_9)    || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_10)   || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_11)   || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_12)   || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_13)   || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_14)   || \
                                                 ((REGTRIG) == ADC_TRIG_EXTI_15)   || \
                                                 ((REGTRIG) == ADC_TRIG_SOFTWARE))


#define ADC_INT_SINGLE_EOC                      (0x00000001)
#define ADC_INT_SUB_GROUP_EOC                   (0x00000002)
#define ADC_INT_CYCLE_EOC                       (0x00000004)
#define ADC_INT_HP_SINGLE_EOC                   (0x00000100)
#define ADC_INT_HP_SUB_GROUP_EOC                (0x00000200)
#define ADC_INT_HP_CYCLE_EOC                    (0x00000400)
#define ADC_INT_AWD_LOWER                       (0x00010000)
#define ADC_INT_AWD_UPPER                       (0x00020000)
#define ADC_INT_DATA_OVERWRITE                  (0x01000000)
#define ADC_INT_HP_DATA_OVERWRITE               (0x02000000)

#define IS_ADC_INT(INT)                         ((((INT) & 0xFCFCFF88) == 0) && ((INT) != 0))


#define ADC_FLAG_SINGLE_EOC                     (0x00000001)
#define ADC_FLAG_SUB_GROUP_EOC                  (0x00000002)
#define ADC_FLAG_CYCLE_EOC                      (0x00000004)
#define ADC_FLAG_HP_SINGLE_EOC                  (0x00000100)
#define ADC_FLAG_HP_SUB_GROUP_EOC               (0x00000200)
#define ADC_FLAG_HP_CYCLE_EOC                   (0x00000400)
#define ADC_FLAG_AWD_LOWER                      (0x00010000)
#define ADC_FLAG_AWD_UPPER                      (0x00020000)
#define ADC_FLAG_DATA_OVERWRITE                 (0x01000000)
#define ADC_FLAG_HP_DATA_OVERWRITE              (0x02000000)

#define IS_ADC_FLAG(FLAG)                       ((((FLAG) & 0xFCFCFF88) == 0) && ((FLAG) != 0))


#define ADC_REGULAR_DATA0                       (0)
#define ADC_REGULAR_DATA1                       (1)
#define ADC_REGULAR_DATA2                       (2)
#define ADC_REGULAR_DATA3                       (3)
#define ADC_REGULAR_DATA4                       (4)
#define ADC_REGULAR_DATA5                       (5)
#define ADC_REGULAR_DATA6                       (6)
#define ADC_REGULAR_DATA7                       (7)

#define IS_ADC_REGULAR_DATA(DATA)               ((DATA) < 8)


#define ADC_HP_DATA0                            (0)
#define ADC_HP_DATA1                            (1)
#define ADC_HP_DATA2                            (2)
#define ADC_HP_DATA3                            (3)

#define IS_ADC_HP_DATA(DATA)                    ((DATA) < 4)


#define ADC_AWD_DISABLE                         (u8)0x00
#define ADC_AWD_ALL_LOWER                       (u8)0x05
#define ADC_AWD_ALL_UPPER                       (u8)0x06
#define ADC_AWD_ALL_LOWER_UPPER                 (u8)0x07
#define ADC_AWD_SINGLE_LOWER                    (u8)0x01
#define ADC_AWD_SINGLE_UPPER                    (u8)0x02
#define ADC_AWD_SINGLE_LOWER_UPPER              (u8)0x03

#define IS_ADC_AWD(AWD)                         (((AWD) == ADC_AWD_DISABLE)         || \
                                                 ((AWD) == ADC_AWD_ALL_LOWER)       || \
                                                 ((AWD) == ADC_AWD_ALL_UPPER)       || \
                                                 ((AWD) == ADC_AWD_ALL_LOWER_UPPER) || \
                                                 ((AWD) == ADC_AWD_SINGLE_LOWER)    || \
                                                 ((AWD) == ADC_AWD_SINGLE_UPPER)    || \
                                                 ((AWD) == ADC_AWD_SINGLE_LOWER_UPPER))

#define IS_ADC_THRESHOLD(THRESHOLD)             ((THRESHOLD) < 4096)

#define ADC_PDMA_REGULAR_SINGLE                 (0x00000001)
#define ADC_PDMA_REGULAR_SUBGROUP               (0x00000002)
#define ADC_PDMA_REGULAR_CYCLE                  (0x00000004)

#define ADC_PDMA_HP_SINGLE                      (0x00000100)
#define ADC_PDMA_HP_SUBGROUP                    (0x00000200)
#define ADC_PDMA_HP_CYCLE                       (0x00000400)

#define IS_ADC_PDMA(PDMA)                       (((PDMA) == ADC_PDMA_REGULAR_SINGLE)   || \
                                                 ((PDMA) == ADC_PDMA_REGULAR_SUBGROUP) || \
                                                 ((PDMA) == ADC_PDMA_REGULAR_CYCLE)    || \
                                                 ((PDMA) == ADC_PDMA_HP_SINGLE)        || \
                                                 ((PDMA) == ADC_PDMA_HP_SUBGROUP)      || \
                                                 ((PDMA) == ADC_PDMA_HP_CYCLE))


#define IS_ADC_INPUT_SAMPLING_TIME(TIME)        ((TIME) < 256)

#define IS_ADC_OFFSET(OFFSET)                   ((OFFSET) < 4096)

#define IS_ADC_REGULAR_RANK(RANK)               ((RANK) < 8)

#define IS_ADC_HP_RANK(RANK)                    ((RANK) < 4)

#define IS_ADC_REGULAR_LENGTH(LENGTH)           (((LENGTH) >= 1) && ((LENGTH) <= 8))
#define IS_ADC_REGULAR_SUB_LENGTH(SUB_LENGTH)   (((SUB_LENGTH) >= 1) && ((SUB_LENGTH) <= 8))

#define IS_ADC_HP_LENGTH(LENGTH)                (((LENGTH) >= 1) && ((LENGTH) <= 4))
#define IS_ADC_HP_SUB_LENGTH(SUB_LENGTH)        (((SUB_LENGTH) >= 1) && ((SUB_LENGTH) <= 4))

#define IS_ADC_TRIG_DELAY(DELAY)                ((DELAY) < 256)
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup ADC_Exported_Functions ADC exported functions
  * @{
  */
void ADC_DeInit(HT_ADC_TypeDef* HT_ADCn);
void ADC_Reset(HT_ADC_TypeDef* HT_ADCn);
void ADC_Cmd(HT_ADC_TypeDef* HT_ADCn, ControlStatus NewState);

void ADC_RegularChannelConfig(HT_ADC_TypeDef* HT_ADCn, u8 ADC_CH_n, u8 Rank, u8 SampleClock);
void ADC_RegularGroupConfig(HT_ADC_TypeDef* HT_ADCn, u8 ADC_MODE, u8 Length, u8 SubLength);
void ADC_RegularTrigConfig(HT_ADC_TypeDef* HT_ADCn, u32 ADC_TRIG_x);

void ADC_HPChannelConfig(HT_ADC_TypeDef* HT_ADCn, u8 ADC_CH_n, u8 Rank, u8 SampleClock);
void ADC_HPGroupConfig(HT_ADC_TypeDef* HT_ADCn, u8 ADC_MODE, u8 Length, u8 SubLength);
void ADC_HPTrigConfig(HT_ADC_TypeDef* HT_ADCn, u32 ADC_TRIG_x);

void ADC_SoftwareStartConvCmd(HT_ADC_TypeDef* HT_ADCn, ControlStatus NewState);
void ADC_HPSoftwareStartConvCmd(HT_ADC_TypeDef* HT_ADCn, ControlStatus NewState);

u16 ADC_GetConversionData(HT_ADC_TypeDef* HT_ADCn, u8 ADC_REGULAR_DATAn);
u16 ADC_GetHPConversionData(HT_ADC_TypeDef* HT_ADCn, u8 ADC_HP_DATAn);

void ADC_IntConfig(HT_ADC_TypeDef* HT_ADCn, u32 ADC_INT_x, ControlStatus NewState);
FlagStatus ADC_GetIntStatus(HT_ADC_TypeDef* HT_ADCn, u32 ADC_INT_x);
void ADC_ClearIntPendingBit(HT_ADC_TypeDef* HT_ADCn, u32 ADC_INT_x);
FlagStatus ADC_GetFlagStatus(HT_ADC_TypeDef* HT_ADCn, u32 ADC_FLAG_x);

void ADC_AWDConfig(HT_ADC_TypeDef* HT_ADCn, u32 ADC_AWD_x);
void ADC_AWDSingleChannelConfig(HT_ADC_TypeDef* HT_ADCn, u8 ADC_CH_n);
void ADC_AWDThresholdsConfig(HT_ADC_TypeDef* HT_ADCn, u16 UPPER, u16 LOWER);

void ADC_PDMAConfig(HT_ADC_TypeDef* HT_ADCn, u32 ADC_PDMA_x, ControlStatus NewState);

void ADC1_RegilarTrigDelayConfig(u32 ADC_TrigDelay);
void ADC1_HPTrigDelayConfig(u32 ADC_TrigDelay);
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
