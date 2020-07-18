/*********************************************************************************************************//**
 * @file    CRC/CRC-CCITT/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup CRC_Examples CRC
  * @{
  */

/** @addtogroup CRC_CCITT CRC-CCITT
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
u16 crc_ccitt_fast(u16 crc, u8 *buffer, u32 length);

/* Private variables ---------------------------------------------------------------------------------------*/

/* CRC table for the CRC-CCITT(ITU-T V.41). The poly is 0x1021 (x^16 + x^12 + x^5 + 1)                      */
const u16 crc_ccitt_tab[256] = {
  0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
  0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
  0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
  0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
  0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
  0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
  0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
  0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
  0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
  0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
  0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
  0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
  0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
  0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
  0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
  0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
  0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
  0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
  0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
  0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
  0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
  0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
  0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
  0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
  0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
  0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
  0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
  0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
  0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
  0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
  0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
  0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CRC_InitTypeDef CRC_InitStructure;
  PDMACH_InitTypeDef PDMACH_InitStructure;
  u32 seed = 0x0000;
  unsigned int SW_sum, HW_sum;
  u8 crc_dat[9] = {'1','2','3','4','5','6','7','8','9'};

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* Enable CRC and PDMA Peripheral clock                                                                   */
  CKCUClock.Bit.PDMA       = 1;
  CKCUClock.Bit.CRC        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* CRC-CCITT
   * width:   16-bit
   * poly:    0x1021
   * seed:    0xFFFF
   * XOROut:  0x0000
   * RefIn:   No
   * RefOut:  No
   */

  printf("\r\n[CRC-CCITT]");

  /* SW CRC                                                                                                 */
  printf("\r\n>  SW: ");

  SW_sum = crc_ccitt_fast((u16)seed, crc_dat, sizeof(crc_dat));
  printf("sum = 0x%04X", SW_sum);


  /* HW1 CRC                                                                                                */
  printf("\r\n> HW1: ");

  HW_sum = CRC_CCITT(seed, crc_dat, sizeof(crc_dat));
  printf("sum = 0x%04X", HW_sum);


  /* HW2 CRC, move data by CPU                                                                              */
  printf("\r\n> HW2: ");

  CRC_InitStructure.Mode = CRC_CCITT_POLY;
  CRC_InitStructure.uSeed = seed;
  CRC_Init(HT_CRC, &CRC_InitStructure);
  CRC_Process(HT_CRC, crc_dat, 5);
  HW_sum = CRC_Process(HT_CRC, crc_dat + 5, 4);
  printf("sum = 0x%04X", HW_sum);

  /* HW3 CRC, move data by PDMA                                                                             */
  printf("\r\n> HW3: ");

  CRC_InitStructure.Mode = CRC_CCITT_POLY;
  CRC_InitStructure.uSeed = seed;
  CRC_Init(HT_CRC, &CRC_InitStructure);

  PDMACH_InitStructure.PDMACH_SrcAddr   = (u32)crc_dat;
  PDMACH_InitStructure.PDMACH_DstAddr   = (u32)&HT_CRC->DR;
  PDMACH_InitStructure.PDMACH_AdrMod    = (SRC_ADR_LIN_INC | DST_ADR_FIX);
  PDMACH_InitStructure.PDMACH_Priority  = L_PRIO;
  PDMACH_InitStructure.PDMACH_BlkCnt    = sizeof(crc_dat)/3;
  PDMACH_InitStructure.PDMACH_BlkLen    = 3;
  PDMACH_InitStructure.PDMACH_DataSize  = WIDTH_8BIT;
  PDMA_Config(PDMA_CH0, &PDMACH_InitStructure);
  PDMA_IntConfig(PDMA_CH0, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);
  PDMA_EnaCmd(PDMA_CH0, ENABLE);
  PDMA_SwTrigCmd(PDMA_CH0, ENABLE);

  while (PDMA_GetFlagStatus(PDMA_CH0, PDMA_FLAG_TC) == RESET);
  PDMA_ClearFlag(PDMA_CH0, PDMA_FLAG_TC);
  HW_sum = CRC_Process(HT_CRC, NULL, 0);
  printf("sum = 0x%04X", HW_sum);

  while (1);
}

/*********************************************************************************************************//**
  * @brief  crc_ccitt_fast.
  * @retval None
  ***********************************************************************************************************/
u16 crc_ccitt_fast(u16 crc, u8* buffer, u32 length)
{
  while (length--)
    crc = crc_ccitt_tab[(crc >> 8 ^ *buffer++) & 0xFF] ^ (crc << 8);

  return crc;
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
