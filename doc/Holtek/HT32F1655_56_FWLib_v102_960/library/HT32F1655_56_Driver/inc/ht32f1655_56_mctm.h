/*********************************************************************************************************//**
 * @file    ht32f1655_56_mctm.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of the MCTM library.
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

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F1655_56_MCTM_H
#define __HT32F1655_56_MCTM_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @addtogroup MCTM
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Exported_Types MCTM exported types
  * @{
  */
/**
 * @brief  Enumeration of MCTM counter mode.
 */
typedef enum
{
  MCTM_CNT_MODE_UP   = 0x00000000,  /*!< Edge up-counting mode                                              */
  MCTM_CNT_MODE_CA1  = 0x00010000,  /*!< Center-align mode 1                                                */
  MCTM_CNT_MODE_CA2  = 0x00020000,  /*!< Center-align mode 2                                                */
  MCTM_CNT_MODE_CA3  = 0x00030000,  /*!< Center-align mode 3                                                */
  MCTM_CNT_MODE_DOWN = 0x01000000   /*!< Edge down-counting mode                                            */
} MCTM_CNT_MODE_Enum;
/**
 * @brief Enumeration of  MCTM prescaler reload time.
 */
typedef enum
{
  MCTM_PSC_RLD_UPDATE    = 0x0000,  /*!< Reload prescaler at next update event                              */
  MCTM_PSC_RLD_IMMEDIATE = 0x0100   /*!< Reload prescaler immediately                                       */
} MCTM_PSC_RLD_Enum;
/**
 * @brief Enumeration of MCTM channel.
 */
typedef enum
{
  MCTM_CH_0 = 0,                    /*!< MCTM channel 0                                                     */
  MCTM_CH_1,                        /*!< MCTM channel 1                                                     */
  MCTM_CH_2,                        /*!< MCTM channel 2                                                     */
  MCTM_CH_3                         /*!< MCTM channel 3                                                     */
} MCTM_CH_Enum;
/**
 * @brief Enumeration of MCTM channel output mode.
 */
typedef enum
{
  MCTM_OM_MATCH_NOCHANGE  = 0x0000, /*!< MCTM channel output no change on match                             */
  MCTM_OM_MATCH_INACTIVE  = 0x0001, /*!< MCTM channel output inactive level on match                        */
  MCTM_OM_MATCH_ACTIVE    = 0x0002, /*!< MCTM channel output active level on match                          */
  MCTM_OM_MATCH_TOGGLE    = 0x0003, /*!< MCTM channel output toggle on match                                */
  MCTM_OM_FORCED_INACTIVE = 0x0004, /*!< MCTM channel output forced inactive level                          */
  MCTM_OM_FORCED_ACTIVE   = 0x0005, /*!< MCTM channel output forced active level                            */
  MCTM_OM_PWM1            = 0x0006, /*!< MCTM channel pwm1 output mode                                      */
  MCTM_OM_PWM2            = 0x0007, /*!< MCTM channel pwm2 output mode                                      */
  MCTM_OM_ASYMMETRIC_PWM1 = 0x0106, /*!< MCTM channel asymmetric pwm1 output mode                           */
  MCTM_OM_ASYMMETRIC_PWM2 = 0x0107  /*!< MCTM channel asymmetric pwm2 output mode                           */
} MCTM_OM_Enum;
/**
 * @brief Enumeration of MCTM channel control.
 */
typedef enum
{
  MCTM_CHCTL_DISABLE = 0,           /*!< MCTM channel disable                                               */
  MCTM_CHCTL_ENABLE                 /*!< MCTM channel enable                                                */
} MCTM_CHCTL_Enum;
/**
 * @brief Enumeration of MCTM channel polarity.
 */
typedef enum
{
  MCTM_CHP_NONINVERTED = 0,         /*!< MCTM channel polarity is active high or rising edge                */
  MCTM_CHP_INVERTED                 /*!< MCTM channel polarity is active low or falling edge                */
} MCTM_CHP_Enum;
/**
 * @brief Enumeration of MCTM channel output idle state.
 */
typedef enum
{
  MCTM_OIS_LOW = 0,                 /*!< MCTM channel output low when CHMOE equal to 0                      */
  MCTM_OIS_HIGH                     /*!< MCTM channel output high when CHMOE equal to 0                     */
} MCTM_OIS_Enum;
/**
 * @brief Enumeration of MCTM COMUS.
 */
typedef enum
{
  MCTM_COMUS_STIOFF = 0,            /*!< MCTM capture/compare control bits are updated by
                                         setting the UEV2G bit only */
  MCTM_COMUS_STION                  /*!< MCTM capture/compare control bits are updated by both
                                         setting the UEV2G bit or when a rising edge occurs on STI */
} MCTM_COMUS_Enum;
/**
 * @brief Enumeration of MCTM channel capture source selection.
 */
typedef enum
{
  MCTM_CHCCS_DIRECT   = 0x00010000,  /*!< MCTM channel capture selection direct input                       */
  MCTM_CHCCS_INDIRECT = 0x00020000,  /*!< MCTM channel capture selection indirect input                     */
  MCTM_CHCCS_TRCED    = 0x00030000   /*!< MCTM channel capture selection TRCED of trigger control block     */
} MCTM_CHCCS_Enum;
/**
 * @brief Enumeration of MCTM channel capture prescaler.
 */
typedef enum
{
  MCTM_CHPSC_OFF = 0x00000000,     /*!< MCTM channel capture no prescaler, capture is done each event       */
  MCTM_CHPSC_2   = 0x00040000,     /*!< MCTM channel capture is done once every 2 event                     */
  MCTM_CHPSC_4   = 0x00080000,     /*!< MCTM channel capture is done once every 4 event                     */
  MCTM_CHPSC_8   = 0x000C0000      /*!< MCTM channel capture is done once every 8 event                     */
} MCTM_CHPSC_Enum;
/**
 * @brief Enumeration of MCTM fDTS clock divider.
 */
typedef enum
{
  MCTM_CKDIV_OFF = 0x0000,          /*!< fDTS = fCLKIN                                                      */
  MCTM_CKDIV_2   = 0x0100,          /*!< fDTS = fCLKIN / 2                                                  */
  MCTM_CKDIV_4   = 0x0200           /*!< fDTS = fCLKIN / 4                                                  */
} MCTM_CKDIV_Enum;
/**
 * @brief Enumeration of MCTM ETI input prescaler.
 */
typedef enum
{
  MCTM_ETIPSC_OFF = 0x00000000,     /*!< ETI prescaler off                                                  */
  MCTM_ETIPSC_2   = 0x00001000,     /*!< ETIP frequency divided by 2                                        */
  MCTM_ETIPSC_4   = 0x00002000,     /*!< ETIP frequency divided by 4                                        */
  MCTM_ETIPSC_8   = 0x00003000      /*!< ETIP frequency divided by 8                                        */
} MCTM_ETIPSC_Enum;
/**
 * @brief Enumeration of MCTM ETI input polarity.
 */
typedef enum
{
  MCTM_ETIPOL_NONINVERTED = 0x00000000, /*!< MCTM ETI polarity is active high or rising edge                */
  MCTM_ETIPOL_INVERTED    = 0x00010000  /*!< MCTM ETI polarity is active low or falling edge                */
} MCTM_ETIPOL_Enum;
/**
 * @brief Enumeration of MCTM slave trigger input selection.
 */
typedef enum
{
  MCTM_TRSEL_UEV1G  = 0x0,         /*!< Software trigger by setting UEV1G                                   */
  MCTM_TRSEL_TI0S0  = 0x1,         /*!< Filtered channel 0 input                                            */
  MCTM_TRSEL_TI1S1  = 0x2,         /*!< Filtered channel 1 input                                            */
  MCTM_TRSEL_ETIF   = 0x3,         /*!< Filtered external trigger input                                     */
  MCTM_TRSEL_TI0BED = 0x8,         /*!< Trigger input 0 both edge detector                                  */
  MCTM_TRSEL_ITI0   = 0x9,         /*!< Internal trigger input 0                                            */
  MCTM_TRSEL_ITI1   = 0xA,         /*!< Internal trigger input 1                                            */
  MCTM_TRSEL_ITI2   = 0xB          /*!< Internal trigger input 2                                            */
} MCTM_TRSEL_Enum;
/**
 * @brief Enumeration of MCTM slave mode selection.
 */
typedef enum
{
  MCTM_SMSEL_DISABLE  = 0x0000,     /*!< The prescaler is clocked directly by the internal clock            */
  MCTM_SMSEL_DECODER1 = 0x0100,     /*!< Counter counts up/down on CH0 edge depending on CH1 level          */
  MCTM_SMSEL_DECODER2 = 0x0200,     /*!< Counter counts up/down on CH1 edge depending on CH0 level          */
  MCTM_SMSEL_DECODER3 = 0x0300,     /*!< Counter counts up/down on both CH0 & CH1 edges depending on the
                                       level of the other input */
  MCTM_SMSEL_RESTART  = 0x0400,     /*!< Slave restart mode                                                 */
  MCTM_SMSEL_PAUSE    = 0x0500,     /*!< Slave pause mode                                                   */
  MCTM_SMSEL_TRIGGER  = 0x0600,     /*!< Slave trigger mode                                                 */
  MCTM_SMSEL_STIED    = 0x0700      /*!< Rising edge of the selected trigger(STI) clock the counter         */
} MCTM_SMSEL_Enum;
/**
 * @brief  Enumeration of MCTM master mode selection.
 */
typedef enum
{
  MCTM_MMSEL_RESET   = 0x00000000,  /*!< Send trigger signal when S/W setting UEV1G or slave restart        */
  MCTM_MMSEL_ENABLE  = 0x00010000,  /*!< The counter enable signal is used as trigger output.               */
  MCTM_MMSEL_UPDATE  = 0x00020000,  /*!< The update event 1 is used as trigger output.                      */
  MCTM_MMSEL_CH0CC   = 0x00030000,  /*!< Channel 0 capture or compare match occurred as trigger output.     */
  MCTM_MMSEL_CH0OREF = 0x00040000,  /*!< The CH0OREF signal is used as trigger output.                      */
  MCTM_MMSEL_CH1OREF = 0x00050000,  /*!< The CH1OREF signal is used as trigger output.                      */
  MCTM_MMSEL_CH2OREF = 0x00060000,  /*!< The CH2OREF signal is used as trigger output.                      */
  MCTM_MMSEL_CH3OREF = 0x00070000   /*!< The CH3OREF signal is used as trigger output.                      */
} MCTM_MMSEL_Enum;
/**
 * @brief Enumeration of GPTM channel Capture / Compare PDMA selection.
 */
typedef enum
{
  MCTM_CHCCDS_CHCCEV = 0,       /*!< Send CHx PDMA request when channel capture/compare event occurs        */
  MCTM_CHCCDS_UEV1              /*!< Send CHx PDMA request when update event 1 occurs                       */
} MCTM_CHCCDS_Enum;
/**
 * @brief Definition of MCTM timebase init structure.
 */
typedef struct
{
  u16                CounterReload;         /*!< Period (Value for CRR register)                            */
  u16                Prescaler;             /*!< Prescaler (Value for PSCR register)                        */
  u8                 RepetitionCounter;     /*!< Repetition counter                                         */
  MCTM_CNT_MODE_Enum CounterMode;           /*!< Counter mode refer to \ref MCTM_CNT_MODE_Enum              */
  MCTM_PSC_RLD_Enum  PSCReloadTime;         /*!< Prescaler reload mode refer to \ref MCTM_PSC_RLD_Enum      */
} MCTM_TimeBaseInitTypeDef;
/**
 * @brief Definition of MCTM channel output init structure.
 */
typedef struct
{
  MCTM_CH_Enum      Channel;              /*!< Channel selection refer to \ref MCTM_CH_Enum                 */
  MCTM_OM_Enum      OutputMode;           /*!< Channel output mode selection refer to \ref MCTM_OM_Enum     */
  MCTM_CHCTL_Enum   Control;              /*!< CHxO output state refer to \ref MCTM_CHCTL_Enum              */
  MCTM_CHCTL_Enum   ControlN;             /*!< CHxO output state refer to \ref MCTM_CHCTL_Enum              */
  MCTM_CHP_Enum     Polarity;             /*!< CHxO polarity refer to \ref MCTM_CHP_Enum                    */
  MCTM_CHP_Enum     PolarityN;            /*!< CHxO polarity refer to \ref MCTM_CHP_Enum                    */
  MCTM_OIS_Enum     IdleState;            /*!< CHxO polarity refer to \ref MCTM_CHP_Enum                    */
  MCTM_OIS_Enum     IdleStateN;           /*!< CHxO polarity refer to \ref MCTM_CHP_Enum                    */
  u16               Compare;              /*!< Value for CHxCCR register                                    */
  u16               AsymmetricCompare;    /*!< Value for CHxCCR register                                    */
} MCTM_OutputInitTypeDef;
/**
 * @brief Definition of MCTM channel input init structure.
 */
typedef struct
{
  MCTM_CH_Enum    Channel;         /*!< Channel selection refer to \ref MCTM_CH_Enum                        */
  MCTM_CHP_Enum   Polarity;        /*!< Channel input polarity refer to \ref MCTM_CHP_Enum                  */
  MCTM_CHCCS_Enum Selection;       /*!< Channel capture source selection refer to \ref MCTM_CHCCS_Enum      */
  MCTM_CHPSC_Enum Prescaler;       /*!< Channel Capture prescaler refer to \ref MCTM_CHPSC_Enum             */
  u8              Filter;          /*!< Digital filter Configuration, it must between 0x0 ~ 0xF.            */
} MCTM_CaptureInitTypeDef;

/**
 * @brief Definition of Break & DeadTime init structure.
 */
typedef struct
{
  u32 OSSRState;
  u32 OSSIState;
  u32 LockLevel;
  u32 Break0;
  u32 Break0Polarity;
  u32 Break1;
  u32 Break1Polarity;
  u32 AutomaticOutput;
  u8 DeadTime;
  u8 BreakFilter;
} MCTM_CHBRKCTRInitTypeDef;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Exported_Constants MCTM exported constants
  * @{
  */

/** @defgroup MCTM_INT Definitions of MCTM_INT
  * @{
  */
#define MCTM_INT_CH0CC        0x0001  /*!< Channel 0 capture/compare interrupt                              */
#define MCTM_INT_CH1CC        0x0002  /*!< Channel 1 capture/compare interrupt                              */
#define MCTM_INT_CH2CC        0x0004  /*!< Channel 2 capture/compare interrupt                              */
#define MCTM_INT_CH3CC        0x0008  /*!< Channel 3 capture/compare interrupt                              */
#define MCTM_INT_UEV1         0x0100  /*!< Update interrupt 1                                               */
#define MCTM_INT_UEV2         0x0200  /*!< Update interrupt 2                                               */
#define MCTM_INT_TEV          0x0400  /*!< Trigger interrupt                                                */
#define MCTM_INT_BRKEV        0x0800  /*!< Break interrupt                                                  */
/**
  * @}
  */

/** @defgroup MCTM_PDMA Definitions of MCTM_PDMA
  * @{
  */
#define MCTM_PDMA_CH0CC        0x00010000  /*!< Channel 0 capture/compare PDMA request                      */
#define MCTM_PDMA_CH1CC        0x00020000  /*!< Channel 1 capture/compare PDMA request                      */
#define MCTM_PDMA_CH2CC        0x00040000  /*!< Channel 2 capture/compare PDMA request                      */
#define MCTM_PDMA_CH3CC        0x00080000  /*!< Channel 3 capture/compare PDMA request                      */
#define MCTM_PDMA_UEV1         0x01000000  /*!< Update 1 PDMA request                                       */
#define MCTM_PDMA_UEV2         0x02000000  /*!< Update 2 PDMA request                                       */
#define MCTM_PDMA_TEV          0x04000000  /*!< Trigger PDMA request                                        */
/**
  * @}
  */

/** @defgroup MCTM_EVENT Definitions of MCTM_EVENT
  * @{
  */
#define MCTM_EVENT_CH0CC      0x0001  /*!< Channel 0 capture/compare event                                  */
#define MCTM_EVENT_CH1CC      0x0002  /*!< Channel 1 capture/compare event                                  */
#define MCTM_EVENT_CH2CC      0x0004  /*!< Channel 2 capture/compare event                                  */
#define MCTM_EVENT_CH3CC      0x0008  /*!< Channel 3 capture/compare event                                  */
#define MCTM_EVENT_UEV1       0x0100  /*!< Update event 1                                                   */
#define MCTM_EVENT_UEV2       0x0200  /*!< Update event 2                                                   */
#define MCTM_EVENT_TEV        0x0400  /*!< Trigger event                                                    */
#define MCTM_EVENT_BRKEV      0x0800  /*!< Break event                                                      */
/**
  * @}
  */

/** @defgroup MCTM_FLAG Definitions of MCTM_FLAG
  * @{
  */
#define MCTM_FLAG_CH0CC       0x0001  /*!< Channel 0 capture/compare flag                                   */
#define MCTM_FLAG_CH1CC       0x0002  /*!< Channel 1 capture/compare flag                                   */
#define MCTM_FLAG_CH2CC       0x0004  /*!< Channel 2 capture/compare flag                                   */
#define MCTM_FLAG_CH3CC       0x0008  /*!< Channel 3 capture/compare flag                                   */
#define MCTM_FLAG_CH0OC       0x0010  /*!< Channel 0 over capture flag                                      */
#define MCTM_FLAG_CH1OC       0x0020  /*!< Channel 1 over capture flag                                      */
#define MCTM_FLAG_CH2OC       0x0040  /*!< Channel 2 over capture flag                                      */
#define MCTM_FLAG_CH3OC       0x0080  /*!< Channel 3 over capture flag                                      */
#define MCTM_FLAG_UEV1        0x0100  /*!< Update 1 flag                                                    */
#define MCTM_FLAG_UEV2        0x0200  /*!< Update 2 flag                                                    */
#define MCTM_FLAG_TEV         0x0400  /*!< Trigger flag                                                     */
#define MCTM_FLAG_BRK0        0x0800  /*!< Break 0 flag                                                     */
#define MCTM_FLAG_BRK1        0x1000  /*!< Break 1 flag                                                     */
/**
  * @}
  */

/** @defgroup MCTM_BKE Definitions of MCTM break control
  * @{
  */
#define MCTM_BREAK_ENABLE           0x00000001 /*!< Break enable                                            */
#define MCTM_BREAK_DISABLE          0x00000000 /*!< Break disable                                           */
/**
  * @}
  */

/** @defgroup MCTM_BKP Definitions of MCTM break polarity
  * @{
  */
#define MCTM_BREAK_POLARITY_LOW     0x00000000 /*!< Break input pin active low level                        */
#define MCTM_BREAK_POLARITY_HIGH    0x00000002 /*!< Break input pin active high level                       */
/**
  * @}
  */

/** @defgroup MCTM_CHMOE Definitions of MCTM main output enable function state
  * @{
  */
#define MCTM_CHMOE_DISABLE          0x00000000 /*!< main output disable                                     */
#define MCTM_CHMOE_ENABLE           0x00000010 /*!< Main output enable                                      */
/**
  * @}
  */

/** @defgroup MCTM_CHAOE Definitions of MCTM automatic output enable function state
  * @{
  */
#define MCTM_CHAOE_DISABLE          0x00000000 /*!< Automatic output enable function disable                */
#define MCTM_CHAOE_ENABLE           0x00000020 /*!< Automatic output enable function enable                 */
/**
  * @}
  */

/** @defgroup MCTM_LOCK_LEVEL Definitions of MCTM lock level selection
  * @{
  */
#define MCTM_LOCK_LEVEL_OFF                 0x00000000 /*!< Lock Off                                        */
#define MCTM_LOCK_LEVEL_1                   0x00010000 /*!< Lock level 1                                    */
#define MCTM_LOCK_LEVEL_2                   0x00020000 /*!< Lock level 2                                    */
#define MCTM_LOCK_LEVEL_3                   0x00030000 /*!< Lock level 3                                    */
/**
  * @}
  */

/** @defgroup MCTM_OSSI Definitions of Off-State Selection for Idle mode states
  * @{
  */
#define MCTM_OSSI_STATE_ENABLE              0x00100000
#define MCTM_OSSI_STATE_DISABLE             0x00000000
/**
  * @}
  */

/** @defgroup MCTM_OSSR Definitions of Off-State Selection for Run mode states
  * @{
  */
#define MCTM_OSSR_STATE_ENABLE              0x00200000
#define MCTM_OSSR_STATE_DISABLE             0x00000000
/**
  * @}
  */

/** @defgroup MCTM_Check_Parameter Check parameter
  * @{
  */

/**
 * @brief Used to check parameter of the MCTMx.
 */
#define IS_MCTM(x) ((x == HT_MCTM0) || (x == HT_MCTM1))
/**
 * @brief Used to check parameter of the output compare mode.
 */
#define IS_MCTM_OM_CMP(x) (((x) == MCTM_OM_MATCH_NOCHANGE) || \
                           ((x) == MCTM_OM_MATCH_INACTIVE) || \
                           ((x) == MCTM_OM_MATCH_ACTIVE) || \
                           ((x) == MCTM_OM_MATCH_TOGGLE) || \
                           ((x) == MCTM_OM_PWM1) || \
                           ((x) == MCTM_OM_PWM2))

/**
 * @brief Used to check parameter of the output mode.
 */
#define IS_MCTM_OM(x) (((x) == MCTM_OM_MATCH_NOCHANGE) || \
                       ((x) == MCTM_OM_MATCH_INACTIVE) || \
                       ((x) == MCTM_OM_MATCH_ACTIVE) || \
                       ((x) == MCTM_OM_MATCH_TOGGLE) || \
                       ((x) == MCTM_OM_PWM1) || \
                       ((x) == MCTM_OM_PWM2) || \
                       ((x) == MCTM_OM_FORCED_INACTIVE) || \
                       ((x) == MCTM_OM_FORCED_ACTIVE) || \
                       ((x) == MCTM_OM_ASYMMETRIC_PWM1) || \
                       ((x) == MCTM_OM_ASYMMETRIC_PWM2))
/**
 * @brief Used to check parameter of the channel.
 */
#define IS_MCTM_CH(x) (((x) == MCTM_CH_0) || ((x) == MCTM_CH_1) || \
                       ((x) == MCTM_CH_2) || ((x) == MCTM_CH_3))
/**
 * @brief Used to check parameter of the complementary output channel.
 */
#define IS_MCTM_COMPLEMENTARY_CH(x) (((x) == MCTM_CH_0) || ((x) == MCTM_CH_1) || \
                                     ((x) == MCTM_CH_2))
/**
 * @brief Used to check parameter of the channel for PWM input function.
 */
#define IS_MCTM_CH_PWMI(x) (((x) == MCTM_CH_0) || ((x) == MCTM_CH_1))
/**
 * @brief Used to check parameter of the clock divider.
 */
#define IS_MCTM_CKDIV(x)  ((x == MCTM_CKDIV_OFF) || \
                           (x == MCTM_CKDIV_2) || \
                           (x == MCTM_CKDIV_4))
/**
 * @brief Used to check parameter of the counter mode.
 */
#define IS_MCTM_CNT_MODE(x) ((x == MCTM_CNT_MODE_UP) ||  \
                             (x == MCTM_CNT_MODE_CA1) || \
                             (x == MCTM_CNT_MODE_CA2) || \
                             (x == MCTM_CNT_MODE_CA3) || \
                             (x == MCTM_CNT_MODE_DOWN))
/**
 * @brief Used to check parameter of the channel polarity.
 */
#define IS_MCTM_CHP(x)  ((x == MCTM_CHP_NONINVERTED) || (x == MCTM_CHP_INVERTED))
/**
 * @brief Used to check parameter of the COMUS.
 */
#define IS_MCTM_COMUS(x)  ((x == MCTM_COMUS_STIOFF) || (x == MCTM_COMUS_STION))
/**
 * @brief Used to check parameter of the channel output idle state.
 */
#define IS_MCTM_OIS(x)  ((x == MCTM_OIS_LOW) || (x == MCTM_OIS_HIGH))
/**
 * @brief Used to check parameter of the channel control.
 */
#define IS_MCTM_CHCTL(x)  ((x == MCTM_CHCTL_DISABLE) || (x == MCTM_CHCTL_ENABLE))
/**
 * @brief Used to check parameter of the channel capture / compare PDMA selection.
 */
#define IS_MCTM_CHCCDS(x) ((x == MCTM_CHCCDS_CHCCEV) || (x == MCTM_CHCCDS_UEV1))
/**
 * @brief Used to check parameter of the channel input selection.
 */
#define IS_MCTM_CHCCS(x) ((x == MCTM_CHCCS_DIRECT) || \
                           (x == MCTM_CHCCS_INDIRECT) || \
                           (x == MCTM_CHCCS_TRCED))
/**
 * @brief Used to check parameter of the channel capture prescaler.
 */
#define IS_MCTM_CHPSC(x) ((x == MCTM_CHPSC_OFF) || \
                           (x == MCTM_CHPSC_2) || \
                           (x == MCTM_CHPSC_4) || \
                           (x == MCTM_CHPSC_8))
/**
 * @brief Used to check parameter of the ETI prescaler.
 */
#define IS_MCTM_ETIPSC(x) ((x == MCTM_ETIPSC_OFF) || \
                           (x == MCTM_ETIPSC_2) || \
                           (x == MCTM_ETIPSC_4) || \
                           (x == MCTM_ETIPSC_8))
/**
 * @brief Used to check parameter of the MCTM interrupt.
 */
#define IS_MCTM_INT(x) (((x & 0xFFFFF0F0) == 0x0) && (x != 0))
/**
 * @brief Used to check parameter of the MCTM PDMA request.
 */
#define IS_MCTM_PDMA(x) (((x & 0xF8F0FFFF) == 0x0) && (x != 0))
/**
 * @brief Used to check parameter of the MCTM interrupt for \ref MCTM_GetIntStatus function.
 */
#define IS_MCTM_GET_INT(x)  ((x == MCTM_INT_CH0CC) || \
                             (x == MCTM_INT_CH1CC) || \
                             (x == MCTM_INT_CH2CC) || \
                             (x == MCTM_INT_CH3CC) || \
                             (x == MCTM_INT_UEV1) || \
                             (x == MCTM_INT_UEV2) || \
                             (x == MCTM_INT_TEV) || \
                             (x == MCTM_INT_BRKEV))
/**
 * @brief Used to check parameter of the MCTM STI selection.
 */
#define IS_MCTM_TRSEL(x) ((x == MCTM_TRSEL_UEV1G) || \
                           (x == MCTM_TRSEL_TI0S0) || \
                           (x == MCTM_TRSEL_TI1S1) || \
                           (x == MCTM_TRSEL_ETIF) || \
                           (x == MCTM_TRSEL_TI0BED) || \
                           (x == MCTM_TRSEL_ITI0) || \
                           (x == MCTM_TRSEL_ITI1) || \
                           (x == MCTM_TRSEL_ITI2))
/**
 * @brief Used to check parameter of the ITI.
 */
#define IS_MCTM_ITI(x)  ((x == MCTM_TRSEL_ITI0) || (x == MCTM_TRSEL_ITI1) || (x == MCTM_TRSEL_ITI2))
/**
 * @brief Used to check parameter of the MCTM_TRSEL for \ref MCTM_ChExternalClockConfig function.
 */
#define IS_MCTM_TRSEL_CH(x)  ((x == MCTM_TRSEL_TI0S0) || (x == MCTM_TRSEL_TI1S1) || \
                              (x == MCTM_TRSEL_TI0BED))
/**
 * @brief Used to check parameter of the MCTM ETI polarity.
 */
#define IS_MCTM_ETIPOL(x) ((x == MCTM_ETIPOL_NONINVERTED) || (x == MCTM_ETIPOL_INVERTED))
/**
 * @brief Used to check parameter of the MCTM prescaler reload time.
 */
#define IS_MCTM_PSC_RLD(x) ((x == MCTM_PSC_RLD_UPDATE) || (x == MCTM_PSC_RLD_IMMEDIATE))
/**
 * @brief Used to check parameter of the forced action.
 */
#define IS_MCTM_OM_FORCED(x) ((x == MCTM_OM_FORCED_ACTIVE) || (x == MCTM_OM_FORCED_INACTIVE) )
/**
 * @brief Used to check parameter of the decoder mode.
 */
#define IS_MCTM_SMSEL_DECODER(x)  ((x == MCTM_SMSEL_DECODER1) || (x == MCTM_SMSEL_DECODER2) || \
                                   (x == MCTM_SMSEL_DECODER3))
/**
 * @brief Used to check parameter of the event.
 */
#define IS_MCTM_EVENT(x)  (((x & 0xFFFFF0F0) == 0x0000) && (x != 0x0000))
/**
 * @brief Used to check parameter of the MCTM master mode selection.
 */
#define IS_MCTM_MMSEL(x)  (((x) == MCTM_MMSEL_RESET) || \
                           ((x) == MCTM_MMSEL_ENABLE) || \
                           ((x) == MCTM_MMSEL_UPDATE) || \
                           ((x) == MCTM_MMSEL_CH0CC) || \
                           ((x) == MCTM_MMSEL_CH0OREF) || \
                           ((x) == MCTM_MMSEL_CH1OREF) || \
                           ((x) == MCTM_MMSEL_CH2OREF) || \
                           ((x) == MCTM_MMSEL_CH3OREF))
/**
 * @brief Used to check parameter of the MCTM slave mode.
 */
#define IS_MCTM_SLAVE_MODE(x) ((x == MCTM_SMSEL_RESTART) || (x == MCTM_SMSEL_PAUSE) || \
                               (x == MCTM_SMSEL_TRIGGER) || (x == MCTM_SMSEL_STIED))
/**
 * @brief Used to check parameter of the MCTM flag.
 */
#define IS_MCTM_FLAG(x) ((x == MCTM_FLAG_CH0CC) || \
                         (x == MCTM_FLAG_CH1CC) || \
                         (x == MCTM_FLAG_CH2CC) || \
                         (x == MCTM_FLAG_CH3CC) || \
                         (x == MCTM_FLAG_CH0OC) || \
                         (x == MCTM_FLAG_CH1OC) || \
                         (x == MCTM_FLAG_CH2OC) || \
                         (x == MCTM_FLAG_CH3OC) || \
                         (x == MCTM_FLAG_UEV1) || \
                         (x == MCTM_FLAG_UEV2) || \
                         (x == MCTM_FLAG_TEV) || \
                         (x == MCTM_FLAG_BRK0) || \
                         (x == MCTM_FLAG_BRK1))
/**
 * @brief Used to check parameter of the MCTM flag for \ref MCTM_ClearFlag function.
 */
#define IS_MCTM_FLAG_CLR(x) (((x & 0xFFFFE000) == 0) && (x != 0))
/**
 * @brief Used to check value of MCTM digital filter.
 */
#define IS_MCTM_FILTER(x) (x <= 0xF)
/**
 * @brief Used to check value of MCTM break control state.
 */
#define IS_MCTM_BREAK_STATE(STATE)  (((STATE) == MCTM_BREAK_ENABLE) || \
                                     ((STATE) == MCTM_BREAK_DISABLE))
/**
 * @brief Used to check value of MCTM break polarity.
 */
#define IS_MCTM_BREAK_POLARITY(POLARITY)    (((POLARITY) == MCTM_BREAK_POLARITY_LOW) || \
                                             ((POLARITY) == MCTM_BREAK_POLARITY_HIGH))
/**
 * @brief Used to check value of MCTM automatic output enable control state.
 */
#define IS_MCTM_CHAOE_STATE(STATE)  (((STATE) == MCTM_CHAOE_ENABLE) || \
                                     ((STATE) == MCTM_CHAOE_DISABLE))
/**
 * @brief Used to check value of MCTM lock level.
 */
#define IS_MCTM_LOCK_LEVEL(LEVEL)   (((LEVEL) == MCTM_LOCK_LEVEL_OFF) || \
                                     ((LEVEL) == MCTM_LOCK_LEVEL_1) || \
                                     ((LEVEL) == MCTM_LOCK_LEVEL_2) || \
                                     ((LEVEL) == MCTM_LOCK_LEVEL_3))
/**
 * @brief Used to check value of MCTM OSSI state.
 */
#define IS_MCTM_OSSI_STATE(STATE)   (((STATE) == MCTM_OSSI_STATE_ENABLE) || \
                                     ((STATE) == MCTM_OSSI_STATE_DISABLE))
/**
 * @brief Used to check value of MCTM OSSR state.
 */
#define IS_MCTM_OSSR_STATE(STATE)   (((STATE) == MCTM_OSSR_STATE_ENABLE) || \
                                     ((STATE) == MCTM_OSSR_STATE_DISABLE))
/**
  * @}
  */

/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup MCTM_Exported_Functions MCTM exported functions
  * @{
  */
void MCTM_DeInit(HT_MCTM_TypeDef* MCTMx);
void MCTM_TimeBaseInit(HT_MCTM_TypeDef* MCTMx, MCTM_TimeBaseInitTypeDef* TimeBaseInit);
void MCTM_OutputInit(HT_MCTM_TypeDef* MCTMx, MCTM_OutputInitTypeDef* OutInit);
void MCTM_CaptureInit(HT_MCTM_TypeDef* MCTMx, MCTM_CaptureInitTypeDef* CapInit);
void MCTM_PwmInputInit(HT_MCTM_TypeDef* MCTMx, MCTM_CaptureInitTypeDef* CapInit);
void MCTM_TimeBaseStructInit(MCTM_TimeBaseInitTypeDef* TimeBaseInit);
void MCTM_OutputStructInit(MCTM_OutputInitTypeDef* OutInit);
void MCTM_CaptureStructInit(MCTM_CaptureInitTypeDef* CapInit);
void MCTM_Cmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_ItiExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Iti);
void MCTM_ChExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Sel, MCTM_CHP_Enum Pol, u8 Filter);
void MCTM_EtiExternalClockConfig(HT_MCTM_TypeDef* MCTMx, MCTM_ETIPSC_Enum Psc, MCTM_ETIPOL_Enum Pol, u8 Filter);
void MCTM_EtiConfig(HT_MCTM_TypeDef* MCTMx, MCTM_ETIPSC_Enum Psc, MCTM_ETIPOL_Enum Pol, u8 Filter);
void MCTM_PrescalerConfig(HT_MCTM_TypeDef* MCTMx, u16 Psc, MCTM_PSC_RLD_Enum PscReloadTime);
void MCTM_CounterModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CNT_MODE_Enum Mod);
void MCTM_StiConfig(HT_MCTM_TypeDef* MCTMx, MCTM_TRSEL_Enum Sel);
void MCTM_DecoderConfig(HT_MCTM_TypeDef* MCTMx, MCTM_SMSEL_Enum DecoderMod,
                        MCTM_CHP_Enum CH0P, MCTM_CHP_Enum CH1P);
void MCTM_ForcedOREF0(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction);
void MCTM_ForcedOREF1(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction);
void MCTM_ForcedOREF2(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction);
void MCTM_ForcedOREF3(HT_MCTM_TypeDef* MCTMx, MCTM_OM_Enum ForcedAction);
void MCTM_CRRPreloadCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_CHCCRPreloadConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState);
void MCTM_ClearOREFConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState);
void MCTM_ChPolarityConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHP_Enum Pol);
void MCTM_ChNPolarityConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHP_Enum Pol);
void MCTM_ImmActiveConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, ControlStatus NewState);
void MCTM_ChannelConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHCTL_Enum Control);
void MCTM_ChannelNConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHCTL_Enum Control);
void MCTM_OutputModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_OM_Enum Mod);
void MCTM_UpdateCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_UEV1G_IntConfig(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_HallInterfaceCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_SinglePulseModeCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_MMSELConfig(HT_MCTM_TypeDef* MCTMx, MCTM_MMSEL_Enum Sel);
void MCTM_SlaveModeConfig(HT_MCTM_TypeDef* MCTMx, MCTM_SMSEL_Enum Sel);
void MCTM_TimSyncCmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_SetCounter(HT_MCTM_TypeDef* MCTMx, u16 Counter);
void MCTM_SetCounterReload(HT_MCTM_TypeDef* MCTMx, u16 Reload);
void MCTM_SetCaptureCompare0(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetCaptureCompare1(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetCaptureCompare2(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetCaptureCompare3(HT_MCTM_TypeDef* MCTMx, u16 Cmp);

void MCTM_SetAsymmetricCompare0(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetAsymmetricCompare1(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetAsymmetricCompare2(HT_MCTM_TypeDef* MCTMx, u16 Cmp);
void MCTM_SetAsymmetricCompare3(HT_MCTM_TypeDef* MCTMx, u16 Cmp);

void MCTM_CHPSCConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CH_Enum Channel, MCTM_CHPSC_Enum Psc);
void MCTM_CKDIVConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CKDIV_Enum Div);
u32 MCTM_GetCaptureCompare0(HT_MCTM_TypeDef* MCTMx);
u32 MCTM_GetCaptureCompare1(HT_MCTM_TypeDef* MCTMx);
u32 MCTM_GetCaptureCompare2(HT_MCTM_TypeDef* MCTMx);
u32 MCTM_GetCaptureCompare3(HT_MCTM_TypeDef* MCTMx);
u32 MCTM_GetCounter(HT_MCTM_TypeDef* MCTMx);
u32 MCTM_GetPrescaler(HT_MCTM_TypeDef* MCTMx);
void MCTM_GenerateEvent(HT_MCTM_TypeDef* MCTMx, u32 MCTM_EVENT);
FlagStatus MCTM_GetFlagStatus(HT_MCTM_TypeDef* MCTMx, u32 MCTM_FLAG);
void MCTM_ClearFlag(HT_MCTM_TypeDef* MCTMx, u32 MCTM_FLAG);
void MCTM_IntConfig(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT, ControlStatus NewState);
FlagStatus MCTM_GetIntStatus(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT);
void MCTM_ClearIntPendingBit(HT_MCTM_TypeDef* MCTMx, u32 MCTM_INT);
void MCTM_InternalClockConfig(HT_MCTM_TypeDef* MCTMx);

void MCTM_CHMOECmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_CHBRKCTRConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CHBRKCTRInitTypeDef *CHBRKCTRInit);
void MCTM_CHBRKCTRStructInit(MCTM_CHBRKCTRInitTypeDef* CHBRKCTRInit);
void MCTM_COMPRECmd(HT_MCTM_TypeDef* MCTMx, ControlStatus NewState);
void MCTM_COMUSConfig(HT_MCTM_TypeDef* MCTMx, MCTM_COMUS_Enum Sel);

void MCTM_CHCCDSConfig(HT_MCTM_TypeDef* MCTMx, MCTM_CHCCDS_Enum Selection);
void MCTM_PDMAConfig(HT_MCTM_TypeDef* MCTMx, u32 MCTM_PDMA, ControlStatus NewState);
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
