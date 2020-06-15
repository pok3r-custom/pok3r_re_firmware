/*********************************************************************************************************//**
 * @file    AES/CTR/main.c
 * @version $Rev:: 1373         $
 * @date    $Date:: 2018-08-06 #$
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
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup AES_Examples AES
  * @{
  */

/** @addtogroup CTR
  * @{
  */

/* Private constants ---------------------------------------------------------------------------------------*/
#define BUFF_SIZE             (96)
uc8 gu8KeyTable[] =
{
  0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF,
  0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF
};

uc8 u8OrgData[BUFF_SIZE] =
{
  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
  0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
  0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
  0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
  0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
  0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
  0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
  0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
  0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
  0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F,
  0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
  0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F
};

uc8 u8IntialVector[] = {
  0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xF0,
  0x10, 0x32, 0x54, 0x76, 0x98, 0xBA, 0xDC, 0x0F
};

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u8 u8DecodeData[BUFF_SIZE];
  u8 u8EncodeData[BUFF_SIZE];
  AES_InitTypeDef AES_InitStruct = { 0 };
  NVIC_Configuration();                   /* NVIC configuration                                             */
  CKCU_Configuration();                   /* System Related configuration                                   */
  RETARGET_Configuration();               /* Retarget Related configuration                                 */
  AES_CTR_Init(HT_AES, &AES_InitStruct);  /* AES CTR Init                                                   */
  BFTM_EnaCmd(HT_BFTM0, ENABLE);

  /* Set key table, AES only supports key size of 128, 192 and 256 bits.                                    */
  AES_SetKeyTable(HT_AES, gu8KeyTable, sizeof(gu8KeyTable));

  /* Time Zero                                                                                              */
  BFTM_SetCounter(HT_BFTM0, 0);

  /* Encryption                                                                                             */
  if (!AES_CTR_CryptData(HT_AES, u8IntialVector, BUFF_SIZE, u8OrgData, u8EncodeData))
  {
    /* Input length must be a multiple of 16                                                                */
     printf("ENCRYPT Error\r\n");
     while (1);
  }

  /* Decryption                                                                                             */
  if (!AES_CTR_CryptData(HT_AES, u8IntialVector, BUFF_SIZE, u8EncodeData, u8DecodeData))
  {
    /* Input length must be a multiple of 16                                                                */
    printf("DECRYPT Error\r\n");
    while (1);
  }

  /* Display Result                                                                                         */
  {
    int i;
    int TestTime = BFTM_GetCounter(HT_BFTM0)/(SystemCoreClock/1000000);
    printf("index   OrgData   Ciphertext   Plaintext \r\n");
    printf("--------------------------------------\r\n");
    for (i = 0; i < BUFF_SIZE; i++)
    {
      printf("%03d     |0x%02X     |0x%02X        |0x%02X\r\n", i + 1, u8OrgData[i], u8EncodeData[i], u8DecodeData[i]);
    }
    printf("\r\n");
    printf("--------------------------------------\r\n");
    printf("Encryption/Decryption time = %d us\r\n", TestTime);
  }
  while (1);                           /* Infinite loop                                                     */
}

/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.AES        = 1;
  CKCUClock.Bit.BFTM0      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

#if (ENABLE_CKOUT == 1)
  CKOUTConfig();
#endif
}

#if (ENABLE_CKOUT == 1)
/*********************************************************************************************************//**
  * @brief  Configure the debug output clock.
  * @retval None
  ***********************************************************************************************************/
void CKOUTConfig(void)
{
  CKCU_CKOUTInitTypeDef CKOUTInit;

  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_8, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLK_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);
}
#endif

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

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
