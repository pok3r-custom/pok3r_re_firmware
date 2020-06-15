/*********************************************************************************************************//**
 * @file    ebi_lcd.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of ebi_lcd.c module.
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
#ifndef __EBI_LCD_H
#define __EBI_LCD_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup EBI_LCD EBI_LCD
  * @{
  */

/* Settings ------------------------------------------------------------------------------------------------*/
#define LCD_08_BIT_MODE               (8)
#define LCD_16_BIT_MODE               (16)

#define SPIDUALOUT_WITH_EBI_8BIT_MODE (0)
// Note: Connect RS to EBI_A1 if you want to use SPI dual output with EBI 8bit mode

#ifndef LCD_BIT_MODE
#define LCD_BIT_MODE                  (LCD_16_BIT_MODE)
#endif

/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup EBI_LCD_Exported_Types EBI LCD exported types
  * @{
  */
typedef struct
{
  #if (LCD_BIT_MODE == LCD_16_BIT_MODE)
  vu16 EBI_LCD_REG;
  vu16 EBI_LCD_RAM;
  #else
    #if (SPIDUALOUT_WITH_EBI_8BIT_MODE == 1)
    vu8 EBI_LCD_REG; // A1A0: b00, RS = 0
    vu8 _RESERVED;
    vu8 EBI_LCD_RAM; // A1A0: b10  RS = 1
    #else
    vu8 EBI_LCD_REG;
    vu8 EBI_LCD_RAM;
    #endif
  #endif
} EBI_LCD_TypeDef;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup EBI_LCD_Exported_Constants EBI LCD exported constants
  * @{
  */
#define LCD_Bank_ADDR             0x60000000
#define EBI_LCD                  ((EBI_LCD_TypeDef *) LCD_Bank_ADDR)

#ifndef LCD_DIRECTION
  #define LCD_DIRECTION   (0)
#endif
#define LCD_NORMAL        (0)
#define LCD_LEFT_90       (1)
#define LCD_RIGHT_90      (2)
#define LCD_ROTATE_180    (3)

/* LCD Registers                                                                                            */
#define REG0             0x00
#define REG1             0x01
#define REG2             0x02
#define REG3             0x03
#define REG4             0x04
#define REG5             0x05
#define REG6             0x06
#define REG7             0x07
#define REG8             0x08
#define REG9             0x09
#define REG10            0x0A
#define REG12            0x0C
#define REG13            0x0D
#define REG14            0x0E
#define REG15            0x0F
#define REG16            0x10
#define REG17            0x11
#define REG18            0x12
#define REG19            0x13
#define REG20            0x14
#define REG21            0x15
#define REG22            0x16
#define REG23            0x17
#define REG24            0x18
#define REG25            0x19
#define REG26            0x1A
#define REG27            0x1B
#define REG28            0x1C
#define REG29            0x1D
#define REG30            0x1E
#define REG31            0x1F
#define REG32            0x20
#define REG33            0x21
#define REG34            0x22
#define REG36            0x24
#define REG37            0x25
#define REG40            0x28
#define REG41            0x29
#define REG43            0x2B
#define REG45            0x2D
#define REG48            0x30
#define REG49            0x31
#define REG50            0x32
#define REG51            0x33
#define REG52            0x34
#define REG53            0x35
#define REG54            0x36
#define REG55            0x37
#define REG56            0x38
#define REG57            0x39
#define REG59            0x3B
#define REG60            0x3C
#define REG61            0x3D
#define REG62            0x3E
#define REG63            0x3F
#define REG64            0x40
#define REG65            0x41
#define REG66            0x42
#define REG67            0x43
#define REG68            0x44
#define REG69            0x45
#define REG70            0x46
#define REG71            0x47
#define REG72            0x48
#define REG73            0x49
#define REG74            0x4A
#define REG75            0x4B
#define REG76            0x4C
#define REG77            0x4D
#define REG78            0x4E
#define REG79            0x4F
#define REG80            0x50
#define REG81            0x51
#define REG82            0x52
#define REG83            0x53
#define REG96            0x60
#define REG97            0x61
#define REG106           0x6A
#define REG118           0x76
#define REG128           0x80
#define REG129           0x81
#define REG130           0x82
#define REG131           0x83
#define REG132           0x84
#define REG133           0x85
#define REG134           0x86
#define REG135           0x87
#define REG136           0x88
#define REG137           0x89
#define REG139           0x8B
#define REG140           0x8C
#define REG141           0x8D
#define REG143           0x8F
#define REG144           0x90
#define REG145           0x91
#define REG146           0x92
#define REG147           0x93
#define REG148           0x94
#define REG149           0x95
#define REG150           0x96
#define REG151           0x97
#define REG152           0x98
#define REG153           0x99
#define REG154           0x9A
#define REG157           0x9D
#define REG192           0xC0
#define REG193           0xC1
#define REG227           0xE3
#define REG229           0xE5
#define REG231           0xE7
#define REG239           0xEF

/* LCD color                                                                                                */
#define White          0xFFFF
#define Black          0x0000
#define Grey           0xF7DE
#define Blue           0x001F
#define Blue2          0x051F
#define Red            0xF800
#define Magenta        0xF81F
#define Green          0x07E0
#define Cyan           0x7FFF
#define Yellow         0xFFE0

#define Line0          0
#define Line1          24
#define Line2          48
#define Line3          72
#define Line4          96
#define Line5          120
#define Line6          144
#define Line7          168
#define Line8          192
#define Line9          216

#define Horizontal     0x00
#define Vertical       0x01

#define LCD_Width       320
#define LCD_Height      240
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup EBI_LCD_Exported_Functions EBI LCD exported functions
  * @{
  */
void LCD_Init(void);
void LCD_Config(void);
void LCD_WriteReg(u32 LCD_Reg_Index, u32 LCD_Reg_Value);
u16 LCD_ReadReg(u32 LCD_Reg_Index);
void LCD_StarterSet(u32 X_Location, u32 Y_Location);
void LCD_WriteRAMPrior(void);
void LCD_WriteRAM(u32 RGB_Set);
void LCD_Clear(u16 Color);
void LCD_BackColorSet(u16 Color);
void LCD_TextColorSet(u16 Color);
void LCD_CharDisplay(u32 Line_Num, u32 Column, u32 Ascii);
void LCD_DisplayOff(void);
void LCD_DisplayOn(void);
void LCD_StringLineDisplay(u32 Line_Num, char *Sptr);
void LCD_CharDraw(u32 X_Location, u32 Y_Location, u16 *Cptr);
void LCD_LineDraw(u32 X_Location, u32 Y_Location, u32 Length, u32 Direction);
void LCD_CircleDraw(u32 X_Location, u32 Y_Location, u32 Radius);
void LCD_RectDraw(u32 X_Location, u32 Y_Location, u32 Height, u32 Width);
void LCD_PicDraw(u8 X_Location, u16 Y_Location, u8 Height, u16 Width, uc8 *Pptr);
void LCD_WriteRAMWord(u32 RGB_Set);
void LCD_SetDisplayArea(u16 Column, u16 Page, u16 Height, u16 Width);
/**
  * @}
  */


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
