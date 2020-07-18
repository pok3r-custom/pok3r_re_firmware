/*********************************************************************************************************//**
 * @file    EBI/DM9000A_ReadID/dm9000a.h
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   The header file of DM9000A driver.
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
#ifndef __DM9000_H
#define __DM9000_H

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EBI_Examples EBI
  * @{
  */

/** @addtogroup DM9000A_ReadID
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define DM9000_MSG              (1)
#define DM9000_DEBUG            (0)

#define DM9K_CS_AFIOFUN         AFIO_GPBConfig
#define DM9K_CS_ID              (GPIO_PB)
#define DM9K_CS_AFIO            (AFIO_PIN_10)
#define DM9K_CS_AFMODE          (AFIO_MODE_9)

#define DM9K_CMD_AFIOFUN        AFIO_GPAConfig
#define DM9K_CMD_ID             (GPIO_PA)
#define DM9K_CMD_AFIO           (AFIO_PIN_11)
#define DM9K_CMD_AFMODE         (AFIO_MODE_9)

#define DM9K_WR_AFIOFUN         AFIO_GPBConfig
#define DM9K_WR_ID              (GPIO_PB)
#define DM9K_WR_AFIO            (AFIO_PIN_8)
#define DM9K_WR_AFMODE          (AFIO_MODE_9)

#define DM9K_RD_AFIOFUN         AFIO_GPBConfig
#define DM9K_RD_ID              (GPIO_PB)
#define DM9K_RD_AFIO            (AFIO_PIN_6)
#define DM9K_RD_AFMODE          (AFIO_MODE_9)

#define DM9K_RESET_AFIOFUN      AFIO_GPBConfig
#define DM9K_RESET_ID           (GPIO_PB)
#define DM9K_RESET_PORT         (HT_GPIOB)
#define DM9K_RESET_GPIO         (GPIO_PIN_11)
#define DM9K_RESET_AFIO         (AFIO_PIN_11)
#define DM9K_RESET_AFMODE       (AFIO_MODE_DEFAULT)
#define DM9K_RESET_GPIO_CK      (CKCUClock.Bit.PB)

#define DM9K_INT_AFIOFUN        AFIO_GPBConfig
#define DM9K_INT_ID             (GPIO_PB)
#define DM9K_INT_PORT           (HT_GPIOB)
#define DM9K_INT_GPIO           (GPIO_PIN_9)
#define DM9K_INT_AFIO           (AFIO_PIN_9)
#define DM9K_INT_AFMODE         (AFIO_MODE_DEFAULT)
#define DM9K_INT_GPIO_CK        (CKCUClock.Bit.PB)

#define DM9K_EXTI_CH            (EXTI_CHANNEL_9)
#define DM9K_EXTI_AFIOCH        (AFIO_EXTI_CH_9)
#define DM9K_EXTI_AFIOPORT      (AFIO_ESS_PB)
#define DM9K_NVIC_IRQ           (EXTI9_IRQn)
#define dm9000_IRQHandler       (EXTI9_IRQHandler)

/* Exported types ------------------------------------------------------------------------------------------*/
typedef enum
{
  DM9000_10MHD   = 0,
  DM9000_100MHD  = 1,
  DM9000_10MFD   = 4,
  DM9000_100MFD  = 5,
  DM9000_AUTO    = 8,
} DM9000_Speed_Mode;

typedef struct
{
  u32 uIOMode;
  DM9000_Speed_Mode SpeedMode;
  DM9000_Speed_Mode CurrentSpeedMode;
  u8 uIMR;
  u8 uMACAddress[6];                   /* hw address                                                        */
} DM9000_TypeDef;

/* Exported functions --------------------------------------------------------------------------------------*/
s32 dm9000_init(DM9000_TypeDef *DM9000Info);
u32 dm9000_close(void);
void dm9000_WriteReg(u16 uReg, u16 uData);
u8 dm9000_ReadReg(u16 uReg);


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

#endif /* __DM9000_H ---------------------------------------------------------------------------------------*/
