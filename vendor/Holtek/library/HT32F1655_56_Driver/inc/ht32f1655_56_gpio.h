/*********************************************************************************************************//**
 * @file    ht32f1655_56_gpio.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of the GPIO and AFIO library.
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
#ifndef __HT32F1655_56_GPIO_H
#define __HT32F1655_56_GPIO_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @addtogroup GPIO
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Settings GPIO settings
  * @{
  */
#define AUTO_CK_CONTROL      (0)
/**
  * @}
  */

/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Exported_Types GPIO exported types
  * @{
  */

/**
 * @brief  Enumeration of GPIO pull resistor.
 */
typedef enum
{
  GPIO_PR_UP = 0,   /*!< weak pull-up resistor                                                              */
  GPIO_PR_DOWN,     /*!< weak pull-down resistor                                                            */
  GPIO_PR_DISABLE   /*!< Tri-state                                                                          */
}GPIO_PR_Enum;
/**
 * @brief  Enumeration of GPIO output drive current.
 */
typedef enum
{
  GPIO_DV_4MA = 0,   /*!< 4mA source/sink current                                                           */
  GPIO_DV_8MA        /*!< 8mA source/sink current                                                           */
}GPIO_DV_Enum;
/**
 * @brief  Enumeration of GPIO direction.
 */
typedef enum
{
  GPIO_DIR_IN = 0,    /*!< input mode                                                                       */
  GPIO_DIR_OUT        /*!< output mode                                                                      */
}GPIO_DIR_Enum;
/**
 * @brief  Enumeration of GPIO port source for EXTI channel.
 */
typedef enum
{
  AFIO_ESS_PA = 0,  /*!< EXTI channel x source come from GPIO Port A                                        */
  AFIO_ESS_PB,      /*!< EXTI channel x source come from GPIO Port B                                        */
  AFIO_ESS_PC,      /*!< EXTI channel x source come from GPIO Port C                                        */
  AFIO_ESS_PD,      /*!< EXTI channel x source come from GPIO Port D                                        */
  AFIO_ESS_PE       /*!< EXTI channel x source come from GPIO Port E                                        */
}AFIO_ESS_Enum;
/**
 * @brief  Enumeration of AFIO for EXTI channel.
 */
typedef enum
{
  AFIO_EXTI_CH_0 = 0,     /*!< EXTI channel 0                                                               */
  AFIO_EXTI_CH_1,         /*!< EXTI channel 1                                                               */
  AFIO_EXTI_CH_2,         /*!< EXTI channel 2                                                               */
  AFIO_EXTI_CH_3,         /*!< EXTI channel 3                                                               */
  AFIO_EXTI_CH_4,         /*!< EXTI channel 4                                                               */
  AFIO_EXTI_CH_5,         /*!< EXTI channel 5                                                               */
  AFIO_EXTI_CH_6,         /*!< EXTI channel 6                                                               */
  AFIO_EXTI_CH_7,         /*!< EXTI channel 7                                                               */
  AFIO_EXTI_CH_8,         /*!< EXTI channel 8                                                               */
  AFIO_EXTI_CH_9,         /*!< EXTI channel 9                                                               */
  AFIO_EXTI_CH_10,        /*!< EXTI channel 10                                                              */
  AFIO_EXTI_CH_11,        /*!< EXTI channel 11                                                              */
  AFIO_EXTI_CH_12,        /*!< EXTI channel 12                                                              */
  AFIO_EXTI_CH_13,        /*!< EXTI channel 13                                                              */
  AFIO_EXTI_CH_14,        /*!< EXTI channel 14                                                              */
  AFIO_EXTI_CH_15         /*!< EXTI channel 15                                                              */
}AFIO_EXTI_CH_Enum;
/**
 * @brief Enumeration of AFIO_MODE.
 */
typedef enum
{
 AFIO_MODE_DEFAULT = 0,   /*!< Default AFIO mode                                                            */
 AFIO_MODE_1,             /*!< AFIO mode 1                                                                  */
 AFIO_MODE_2,             /*!< AFIO mode 2                                                                  */
 AFIO_MODE_3,             /*!< AFIO mode 3                                                                  */
 AFIO_MODE_4,             /*!< AFIO mode 4                                                                  */
 AFIO_MODE_5,             /*!< AFIO mode 5                                                                  */
 AFIO_MODE_6,             /*!< AFIO mode 6                                                                  */
 AFIO_MODE_7,             /*!< AFIO mode 7                                                                  */
 AFIO_MODE_8,             /*!< AFIO mode 8                                                                  */
 AFIO_MODE_9,             /*!< AFIO mode 9                                                                  */
 AFIO_MODE_10,            /*!< AFIO mode 10                                                                 */
 AFIO_MODE_11,            /*!< AFIO mode 11                                                                 */
 AFIO_MODE_12,            /*!< AFIO mode 12                                                                 */
 AFIO_MODE_13,            /*!< AFIO mode 13                                                                 */
 AFIO_MODE_14,            /*!< AFIO mode 14                                                                 */
 AFIO_MODE_15             /*!< AFIO mode 15                                                                 */
}AFIO_MODE_Enum;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Exported_Constants GPIO exported constants
  * @{
  */
#define AFIO_FUN_DEFAULT    AFIO_MODE_DEFAULT  /*!< Default AFIO mode                                       */
#define AFIO_FUN_GPIO       AFIO_MODE_1        /*!< AFIO mode GPIO                                          */
#define AFIO_FUN_ADC        AFIO_MODE_2        /*!< AFIO mode ADC                                           */
#define AFIO_FUN_CMP        AFIO_MODE_3        /*!< AFIO mode CMP                                           */
#define AFIO_FUN_MCTM_GPTM  AFIO_MODE_4        /*!< AFIO mode MCTM/GPTM                                     */
#define AFIO_FUN_SPI        AFIO_MODE_5        /*!< AFIO mode SPI                                           */
#define AFIO_FUN_USART_UART AFIO_MODE_6        /*!< AFIO mode USART/UART                                    */
#define AFIO_FUN_I2C        AFIO_MODE_7        /*!< AFIO mode I2C                                           */
#define AFIO_FUN_SCI        AFIO_MODE_8        /*!< AFIO mode SMC                                           */
#define AFIO_FUN_EBI        AFIO_MODE_9        /*!< AFIO mode EBI                                           */
#define AFIO_FUN_I2S        AFIO_MODE_10       /*!< AFIO mode I2S                                           */
#define AFIO_FUN_SYSTEM     AFIO_MODE_15       /*!< AFIO mode System                                        */

#define GPIO_PORT_NUM   (5)
#define GPIO_PIN_NUM    (16)
#define GPIO_PA         (0)
#define GPIO_PB         (1)
#define GPIO_PC         (2)
#define GPIO_PD         (3)
#define GPIO_PE         (4)


/* Definitions of GPIO_PIN                                                                                  */
#define GPIO_PIN_0    0x0001   /*!< GPIO pin 0 selected                                                     */
#define GPIO_PIN_1    0x0002   /*!< GPIO pin 1 selected                                                     */
#define GPIO_PIN_2    0x0004   /*!< GPIO pin 2 selected                                                     */
#define GPIO_PIN_3    0x0008   /*!< GPIO pin 3 selected                                                     */
#define GPIO_PIN_4    0x0010   /*!< GPIO pin 4 selected                                                     */
#define GPIO_PIN_5    0x0020   /*!< GPIO pin 5 selected                                                     */
#define GPIO_PIN_6    0x0040   /*!< GPIO pin 6 selected                                                     */
#define GPIO_PIN_7    0x0080   /*!< GPIO pin 7 selected                                                     */
#define GPIO_PIN_8    0x0100   /*!< GPIO pin 8 selected                                                     */
#define GPIO_PIN_9    0x0200   /*!< GPIO pin 9 selected                                                     */
#define GPIO_PIN_10   0x0400   /*!< GPIO pin 10 selected                                                    */
#define GPIO_PIN_11   0x0800   /*!< GPIO pin 11 selected                                                    */
#define GPIO_PIN_12   0x1000   /*!< GPIO pin 12 selected                                                    */
#define GPIO_PIN_13   0x2000   /*!< GPIO pin 13 selected                                                    */
#define GPIO_PIN_14   0x4000   /*!< GPIO pin 14 selected                                                    */
#define GPIO_PIN_15   0x8000   /*!< GPIO pin 15 selected                                                    */
#define GPIO_PIN_ALL  0xFFFF   /*!< GPIO all pins selected                                                  */

/* Definitions of AFIO_PIN                                                                                  */
#define AFIO_PIN_0    0x0001   /*!< AFIO pin 0 selected                                                     */
#define AFIO_PIN_1    0x0002   /*!< AFIO pin 1 selected                                                     */
#define AFIO_PIN_2    0x0004   /*!< AFIO pin 2 selected                                                     */
#define AFIO_PIN_3    0x0008   /*!< AFIO pin 3 selected                                                     */
#define AFIO_PIN_4    0x0010   /*!< AFIO pin 4 selected                                                     */
#define AFIO_PIN_5    0x0020   /*!< AFIO pin 5 selected                                                     */
#define AFIO_PIN_6    0x0040   /*!< AFIO pin 6 selected                                                     */
#define AFIO_PIN_7    0x0080   /*!< AFIO pin 7 selected                                                     */
#define AFIO_PIN_8    0x0100   /*!< AFIO pin 8 selected                                                     */
#define AFIO_PIN_9    0x0200   /*!< AFIO pin 9 selected                                                     */
#define AFIO_PIN_10   0x0400   /*!< AFIO pin 10 selected                                                    */
#define AFIO_PIN_11   0x0800   /*!< AFIO pin 11 selected                                                    */
#define AFIO_PIN_12   0x1000   /*!< AFIO pin 12 selected                                                    */
#define AFIO_PIN_13   0x2000   /*!< AFIO pin 13 selected                                                    */
#define AFIO_PIN_14   0x4000   /*!< AFIO pin 14 selected                                                    */
#define AFIO_PIN_15   0x8000   /*!< AFIO pin 15 selected                                                    */
#define AFIO_PIN_ALL  0xFFFF   /*!< All AFIO pins selected                                                  */
/**
  * @}
  */

/* Exported macro ------------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Exported_Macro GPIO exported macro
  * @{
  */
/* check parameter of the GPIOx                                                                             */
#define IS_GPIO(x)          ((x == HT_GPIOA) || (x == HT_GPIOB) || (x == HT_GPIOC) || (x == HT_GPIOD) || \
                             (x == HT_GPIOE))

/* check parameter of the GPIOx pull resistor                                                               */
#define IS_GPIO_PR(x)       (((x) == GPIO_PR_UP) || ((x) == GPIO_PR_DOWN) || ((x) == GPIO_PR_DISABLE))

/* check parameter of the GPIOx driving current                                                             */
#define IS_GPIO_DV(x)       (((x) == GPIO_DV_4MA) || ((x) == GPIO_DV_8MA) )

/* check parameter of the GPIOx input/output direction                                                      */
#define IS_GPIO_DIR(x)      (((x) == GPIO_DIR_IN) || ((x) == GPIO_DIR_OUT) )

/* check parameter of the EXTI source port                                                                  */
#define IS_AFIO_ESS(x)      ((x == AFIO_ESS_PA) || (x == AFIO_ESS_PB) || (x == AFIO_ESS_PC) || (x == AFIO_ESS_PD)\
                             || (x == AFIO_ESS_PE))

/* check parameter of the EXTI channel                                                                      */
#define IS_AFIO_EXTI_CH(x)  ((x == AFIO_EXTI_CH_0) || (x == AFIO_EXTI_CH_1) || \
                             (x == AFIO_EXTI_CH_2) || (x == AFIO_EXTI_CH_3) || \
                             (x == AFIO_EXTI_CH_4) || (x == AFIO_EXTI_CH_5) || \
                             (x == AFIO_EXTI_CH_6) || (x == AFIO_EXTI_CH_7) || \
                             (x == AFIO_EXTI_CH_8) || (x == AFIO_EXTI_CH_9) || \
                             (x == AFIO_EXTI_CH_10) || (x == AFIO_EXTI_CH_11) || \
                             (x == AFIO_EXTI_CH_12) || (x == AFIO_EXTI_CH_13) || \
                             (x == AFIO_EXTI_CH_14) || (x == AFIO_EXTI_CH_15))

/* check parameter of the AFIO mode                                                                         */
#define IS_AFIO_MODE(x)     ((x == AFIO_MODE_DEFAULT) || (x == AFIO_MODE_1) || \
                             (x == AFIO_MODE_2) || (x == AFIO_MODE_3) || \
                             (x == AFIO_MODE_4) || (x == AFIO_MODE_5) || \
                             (x == AFIO_MODE_6) || (x == AFIO_MODE_7) || \
                             (x == AFIO_MODE_8) || (x == AFIO_MODE_9) || \
                             (x == AFIO_MODE_10) || (x == AFIO_MODE_11) || \
                             (x == AFIO_MODE_12) || (x == AFIO_MODE_13) || \
                             (x == AFIO_MODE_14) || (x == AFIO_MODE_15))
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup GPIO_Exported_Functions GPIO exported functions
  * @{
  */
#define AFIO_GPAConfig(AFIO_PIN, AFIO_MODE) AFIO_GPxConfig(GPIO_PA, AFIO_PIN, AFIO_MODE)
#define AFIO_GPBConfig(AFIO_PIN, AFIO_MODE) AFIO_GPxConfig(GPIO_PB, AFIO_PIN, AFIO_MODE)
#define AFIO_GPCConfig(AFIO_PIN, AFIO_MODE) AFIO_GPxConfig(GPIO_PC, AFIO_PIN, AFIO_MODE)
#define AFIO_GPDConfig(AFIO_PIN, AFIO_MODE) AFIO_GPxConfig(GPIO_PD, AFIO_PIN, AFIO_MODE)
#define AFIO_GPEConfig(AFIO_PIN, AFIO_MODE) AFIO_GPxConfig(GPIO_PE, AFIO_PIN, AFIO_MODE)

/* Prototype of related GPIO function                                                                       */
void GPIO_DeInit(HT_GPIO_TypeDef* GPIOx);
void GPIO_DirectionConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_DIR_Enum Direction);
void GPIO_PullResistorConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_PR_Enum PR);
void GPIO_InputConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, ControlStatus Cmd);
void GPIO_DriveConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, GPIO_DV_Enum Drive);
void GPIO_OpenDrainConfig(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, ControlStatus Cmd);
FlagStatus GPIO_ReadInBit(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
FlagStatus GPIO_ReadOutBit(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
u16 GPIO_ReadInData(HT_GPIO_TypeDef* GPIOx);
u16 GPIO_ReadOutData(HT_GPIO_TypeDef* GPIOx);
void GPIO_SetOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
void GPIO_ClearOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
void GPIO_WriteOutBits(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN, FlagStatus Status);
void GPIO_WriteOutData(HT_GPIO_TypeDef* GPIOx, u16 Data);
void GPIO_PinLock(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
bool GPIO_IsPortLocked(HT_GPIO_TypeDef* GPIOx);
bool GPIO_IsPinLocked(HT_GPIO_TypeDef* GPIOx, u16 GPIO_PIN);
u32 GPIO_Base2ID(HT_GPIO_TypeDef* GPIOx);

/* Prototype of related AFIO function                                                                       */
void AFIO_DeInit(void);
#if 1
void AFIO_GPxConfig(u32 AFIO_PORT, u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
#else
void AFIO_GPAConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
void AFIO_GPBConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
void AFIO_GPCConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
void AFIO_GPDConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
void AFIO_GPEConfig(u32 AFIO_PIN, AFIO_MODE_Enum AFIO_MODE);
#endif
void AFIO_EXTISourceConfig(AFIO_EXTI_CH_Enum Channel, AFIO_ESS_Enum Source);
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
