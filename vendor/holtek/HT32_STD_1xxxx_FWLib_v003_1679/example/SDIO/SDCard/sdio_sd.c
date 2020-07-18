/*********************************************************************************************************//**
 * @file    SDIO/SDCard/sdio_sd.c
 * @version $Rev:: 1354         $
 * @date    $Date:: 2018-08-02 #$
 * @brief   The source file of sdio_sd.
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
#include "sdio_sd.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup SDIO_SD SDIO_SD
  * @brief The source file of sdio_sd.
  * @{
  */


/* Private define ------------------------------------------------------------------------------------------*/
#define SDIO_CMD_TIMEOUT                (0x00010000)

/* Mask for errors Card Status R1 (OCR Register)                                                            */
#define CARD_STATUS_OUT_OF_RANGE        (0x80000000)
#define CARD_STATUS_ADDRESS_ERROR       (0x40000000)
#define CARD_STATUS_BLOCK_LEN_ERROR     (0x20000000)
#define CARD_STATUS_ERASE_SEQ_ERROR     (0x10000000)
#define CARD_STATUS_ERASE_PARAM         (0x08000000)
#define CARD_STATUS_WP_VIOLATION        (0x04000000)
#define CARD_STATUS_LOCK_UNLOCK_FAILED  (0x01000000)
#define CARD_STATUS_COM_CRC_ERROR       (0x00800000)
#define CARD_STATUS_ILLEGAL_COMMAND     (0x00400000)
#define CARD_STATUS_CARD_ECC_FAILED     (0x00200000)
#define CARD_STATUS_CC_ERROR            (0x00100000)
#define CARD_STATUS_UNKNOWN_ERROR       (0x00080000)
#define CARD_STATUS_STREAM_READ_UDRUN   (0x00040000)
#define CARD_STATUS_STREAM_WRITE_OVRUN  (0x00020000)
#define CARD_STATUS_CID_CSD_OVERWRITE   (0x00010000)
#define CARD_STATUS_WP_ERASE_SKIP       (0x00008000)
#define CARD_STATUS_CARD_ECC_DISABLED   (0x00004000)
#define CARD_STATUS_ERASE_RESET         (0x00002000)
#define CARD_STATUS_AKE_SEQ_ERROR       (0x00000008)
#define CARD_STATUS_ERROR_BITS          (0xFDFFE008)

/* Mask for Card Status R1                                                                                  */
#define CARD_STATUS_CARD_IS_LOCKED      (0x02000000)
#define CARD_STATUS_CURRENT_STATE       (0x00001E00)
#define CARD_STATUS_READY_FOR_DATA      (0x00000100)
#define CARD_STATUS_APP_CMD             (0x00000020)

/* Masks for R6 Response                                                                                    */
#define SD_R6_GENERAL_UNKNOWN_ERROR     (0x00002000)
#define SD_R6_ILLEGAL_CMD               (0x00004000)
#define SD_R6_COM_CRC_FAILED            (0x00008000)

#define SD_VOLTAGE_WINDOW_SD            (0x80100000)
#define SD_HIGH_CAPACITY                (0x40000000)
#define SD_STD_CAPACITY                 (0x00000000)
#define SD_CHECK_PATTERN                (0x000001AA)

#define SD_MAX_VOLT_TRIAL               (0x0000FFFF)

#define SD_WIDE_BUS_SUPPORT             (0x00040000)
#define SD_SINGLE_BUS_SUPPORT           (0x00010000)
#define SD_SPEC3_SUPPORT                (0x00008000)
#define SD_CARD_LOCKED                  (0x02000000)
#define SD_CARD_PROGRAMMING             (0x00000007)
#define SD_CARD_RECEIVING               (0x00000006)
#define SD_DATATIMEOUT                  (0x000FFFFF)
#define SD_MAX_DATA_LENGTH              (0x01FFFFFF)

/* Command Class Supported                                                                                  */
#define SD_CCCC_SWITCH                  (0x00000400)
#define SD_CCCC_IO_MODE                 (0x00000200)
#define SD_CCCC_APP_SPEC                (0x00000100)
#define SD_CCCC_LOCK_UNLOCK             (0x00000080)
#define SD_CCCC_WRITE_PROT              (0x00000040)
#define SD_CCCC_ERASE                   (0x00000020)
#define SD_CCCC_BLOCK_WRITE             (0x00000010)
#define SD_CCCC_BLOCK_READ              (0x00000004)

/* SD clock freq                                                                                            */
#define SDIO_INIT_CLK_DIV               ((u32)(SystemCoreClock/600000))
#define SDIO_HIGH_SPEED_CLK_DIV         ((u32)3)
#define SDIO_NORMAL_SPEED_CLK_DIV       ((u32)5)

/* Private variables ---------------------------------------------------------------------------------------*/
static u32 CID_Tab[4], CSD_Tab[4], SCR[2];
vu32 TransferEnd, TransferSize, TransferStopCmd;
__IO SD_Error TransferStatus;

SDIO_InitTypeDef SDIO_InitStructure;
SDIO_CmdInitTypeDef SDIO_CmdInitStructure;
SDIO_DataInitTypeDef SDIO_DataInitStructure;

/* Private function prototypes -----------------------------------------------------------------------------*/
static SD_Error CmdError(void);
static SD_Error CmdResp1Error(void);
static SD_Error CmdResp2Error(void);
static SD_Error CmdResp3Error(void);
static SD_Error CmdResp6Error(u16 *pRCA);
static SD_Error CmdResp7Error(void);

static SD_Error GetCardInfo(SD_CardInfo *cardinfo);
static SD_Error FindSCR(SD_CardInfo *cardinfo);
static SD_Error IsCardProgramming(SD_CardInfo *cardinfo, u8 *pstatus);
//#define SD_DEBUG
#if defined(SD_DEBUG)
#define _DEBUG_PRINTF  printf
#else
#define _DEBUG_PRINTF(...)
#endif
/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup SDIO_SD_Exported_Functions SDIO_SD exported functions
  * @{
  */
void _DEBUG_DUMP(u32 *data,int len)
{
#if defined(SD_DEBUG)
  int i=0;
  for(i=0;i<len;i++)
  {
    printf("[%d]0x%08X \r\n",i,(unsigned int)data[i]);
    
  }
#endif
}
/*********************************************************************************************************//**
  * @brief  Detect if SD card is correctly plugged in the memory slot.
  * @return The result of SD card detection
  ***********************************************************************************************************/
bool SD_Detect(void)
{
  bool status = TRUE;

  /* SD card detection */
  if (GPIO_ReadInBit(GPIO_PORT[SDCARD_SD_CD_GPIO_ID], SDCARD_SD_CD_GPIO_PIN))
  {
    status = FALSE;
  }

  return(status);
}

/*********************************************************************************************************//**
  * @brief  Configure the PDMA CH6 for SDIO Rx request.
  * @param  BufferDST: pointer to the destination buffer
  * @param  BufferSize: buffer size
  * @retval None
  ***********************************************************************************************************/
void SD_LowLevel_DMA_RxConfig(u32 *BufferDST, u32 BufferSize)
{
  PDMACH_InitTypeDef PDMACH_InitStruct;

  /* Configure */
  PDMACH_InitStruct.PDMACH_SrcAddr = (u32)&HT_SDIO->DR;
  PDMACH_InitStruct.PDMACH_DstAddr = (u32)BufferDST;
  PDMACH_InitStruct.PDMACH_AdrMod = SRC_ADR_FIX | DST_ADR_LIN_INC;
  PDMACH_InitStruct.PDMACH_BlkCnt = BufferSize / 16;
  PDMACH_InitStruct.PDMACH_BlkLen = 4;
  PDMACH_InitStruct.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStruct.PDMACH_Priority = H_PRIO;
  PDMA_Config(PDMA_SDIO_RX, &PDMACH_InitStruct);

  PDMA_IntConfig(PDMA_SDIO_RX, (PDMA_INT_GE | PDMA_INT_TC | PDMA_INT_TE), ENABLE);

  PDMA_EnaCmd(PDMA_SDIO_RX, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configure the PDMA CH7 for SDIO Tx request.
  * @param  BufferSRC: pointer to the source buffer
  * @param  BufferSize: buffer size
  * @retval None
  ***********************************************************************************************************/
void SD_LowLevel_DMA_TxConfig(u32 *BufferSRC, u32 BufferSize)
{
  PDMACH_InitTypeDef PDMACH_InitStruct;

  /* Configure */
  PDMACH_InitStruct.PDMACH_SrcAddr = (u32)BufferSRC;
  PDMACH_InitStruct.PDMACH_DstAddr = (u32)&HT_SDIO->DR;
  PDMACH_InitStruct.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX;
  PDMACH_InitStruct.PDMACH_BlkCnt = BufferSize / 16;
  PDMACH_InitStruct.PDMACH_BlkLen = 4;
  PDMACH_InitStruct.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStruct.PDMACH_Priority = H_PRIO;
  PDMA_Config(PDMA_SDIO_TX, &PDMACH_InitStruct);
  PDMA_IntConfig(PDMA_SDIO_TX, (PDMA_INT_GE | PDMA_INT_TC | PDMA_INT_TE), ENABLE);
  PDMA_EnaCmd(PDMA_SDIO_TX, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Initialize the SD card and make it ready for data transfer.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_Init(SD_CardInfo *cardinfo)
{
  SD_Error errorstatus;

  /* Enable AFIO, SDIO, PDMA & SD_GPIO clock                                                                */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  SDCARD_SD_CD_GPIO_CLK(CKCUClock)   = 1;
  SDCARD_SD_CLK_GPIO_CLK(CKCUClock)  = 1;
  SDCARD_SD_CMD_GPIO_CLK(CKCUClock)  = 1;
  SDCARD_SD_DAT0_GPIO_CLK(CKCUClock) = 1;
  SDCARD_SD_DAT1_GPIO_CLK(CKCUClock) = 1;
  SDCARD_SD_DAT2_GPIO_CLK(CKCUClock) = 1;
  SDCARD_SD_DAT3_GPIO_CLK(CKCUClock) = 1;
  CKCUClock.Bit.SDIO                 = 1;
  CKCUClock.Bit.PDMA                 = 1;
  CKCUClock.Bit.AFIO                 = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Configure SD card detect pin                                                                           */
  GPIO_DirectionConfig(GPIO_PORT[SDCARD_SD_CD_GPIO_ID], SDCARD_SD_CD_GPIO_PIN, GPIO_DIR_IN);

  /* Configure SDIO pins                                                                                    */
  HT32F_DVB_GPxConfig(SDCARD_SD_CLK_GPIO_ID, SDCARD_SD_CLK_AFIO_PIN, SDCARD_SD_CLK_AFIO_MODE);
  HT32F_DVB_GPxConfig(SDCARD_SD_CMD_GPIO_ID, SDCARD_SD_CMD_AFIO_PIN, SDCARD_SD_CMD_AFIO_MODE);
  HT32F_DVB_GPxConfig(SDCARD_SD_DAT0_GPIO_ID, SDCARD_SD_DAT0_AFIO_PIN, SDCARD_SD_DAT0_AFIO_MODE);
  HT32F_DVB_GPxConfig(SDCARD_SD_DAT1_GPIO_ID, SDCARD_SD_DAT1_AFIO_PIN, SDCARD_SD_DAT1_AFIO_MODE);
  HT32F_DVB_GPxConfig(SDCARD_SD_DAT2_GPIO_ID, SDCARD_SD_DAT2_AFIO_PIN, SDCARD_SD_DAT2_AFIO_MODE);
  HT32F_DVB_GPxConfig(SDCARD_SD_DAT3_GPIO_ID, SDCARD_SD_DAT3_AFIO_PIN, SDCARD_SD_DAT3_AFIO_MODE);

  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_CLK_GPIO_ID], SDCARD_SD_CLK_AFIO_PIN, GPIO_DV_8MA);
  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_CMD_GPIO_ID], SDCARD_SD_CMD_AFIO_PIN, GPIO_DV_8MA);
  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_DAT0_GPIO_ID], SDCARD_SD_DAT0_AFIO_PIN, GPIO_DV_8MA);
  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_DAT1_GPIO_ID], SDCARD_SD_DAT1_AFIO_PIN, GPIO_DV_8MA);
  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_DAT2_GPIO_ID], SDCARD_SD_DAT2_AFIO_PIN, GPIO_DV_8MA);
  GPIO_DriveConfig(GPIO_PORT[SDCARD_SD_DAT3_GPIO_ID], SDCARD_SD_DAT3_AFIO_PIN, GPIO_DV_8MA);
  SDIO_DeInit();
  /* SD card power on */
  errorstatus = SD_PowerON(cardinfo);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* SD card init */
  errorstatus = SD_InitializeCards(cardinfo);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Select card */
  errorstatus = SD_SelectDeselect(cardinfo->RCA << 16);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* Enable 4-bit bus mode */
  errorstatus = SD_BusModeConfig(cardinfo, SD_4BIT_BUS_MODE);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Enquire SD card about their operating voltage and configure clock controls.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_PowerON(SD_CardInfo *cardinfo)
{
  SD_Error errorstatus;
  u32 SDType, count = 0, response;
  bool validvoltage = FALSE;

  /* Configure SDCLK to 600 kHz and 1-bit normal speed mode */
  SDIO_InitStructure.SDIO_ClockDiv       = SDIO_INIT_CLK_DIV;
  SDIO_InitStructure.SDIO_ClockPeriod    = SDIO_Clock_LowPeriod_Longer;
  SDIO_InitStructure.SDIO_ClockPowerSave = SDIO_Clock_PowerSave_Disable;
  SDIO_InitStructure.SDIO_BusWide        = SDIO_BusWide_1b;
  SDIO_InitStructure.SDIO_BusMode        = SDIO_BusMode_NormalSpeed;
  SDIO_Init(&SDIO_InitStructure);

  SDIO_FlagConfig(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR | SDIO_FLAG_CMD_IDXERR, ENABLE);

  /* CMD0 */
  SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD0_GO_IDLE_STATE;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_No;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdError();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* CMD8 */
  SDIO_CmdInitStructure.SDIO_Argument   = SD_CHECK_PATTERN;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD8_SEND_IF_COND;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp7Error();

  if (errorstatus == SD_OK)
  {
    /* SD card 2.0 */
    SDType = SD_HIGH_CAPACITY;
    cardinfo->CardType = SDIO_STD_CAPACITY_SD_CARD_V2_0;
  }
  else
  {
    SDType = SD_STD_CAPACITY;
    cardinfo->CardType =  SDIO_STD_CAPACITY_SD_CARD_V1_1;

    /* CMD55 */
    SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();
  }

  /* CMD55 */
  SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus == SD_OK)
  {
    /* SD card */
    while ((!validvoltage) && (count < SD_MAX_VOLT_TRIAL))
    {
      /* CMD55 for ACMD */
      SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
      SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
      SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
      SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
      SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
      SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
      SDIO_SendCommand(&SDIO_CmdInitStructure);
      errorstatus = CmdResp1Error();

      if (errorstatus != SD_OK)
      {
        return(errorstatus);
      }

      /* ACMD41 */
      SDIO_CmdInitStructure.SDIO_Argument   = SD_VOLTAGE_WINDOW_SD | SDType;
      SDIO_CmdInitStructure.SDIO_CmdIndex   = ACMD41_SD_SEND_OP_COND;
      SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
      SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
      SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
      SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_No;
      SDIO_SendCommand(&SDIO_CmdInitStructure);
      errorstatus = CmdResp3Error();

      if (errorstatus != SD_OK)
      {
        return(errorstatus);
      }

      response = SDIO_GetResponse(SDIO_RESP1);
      validvoltage = (response & (1UL << 31))?(TRUE):(FALSE);
      count++;
    }

    if (count >= SD_MAX_VOLT_TRIAL)
    {
      return(SD_INVALID_VOLTRANGE);
    }
    if (response & SD_HIGH_CAPACITY)
    {
      cardinfo->CardType = SDIO_HIGH_CAPACITY_SD_CARD;
    }
  }
  else
  {
    /* MMC Card */
  }

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Initialize all cards or single card as the case may be Card(s) come into standby state.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_InitializeCards(SD_CardInfo *cardinfo)
{
  SD_Error errorstatus;

  if (cardinfo->CardType != SDIO_SECURE_DIGITAL_IO_CARD)
  {
    /* CMD2 */
    SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD2_ALL_SEND_CID;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Long;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp2Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

    CID_Tab[0] = SDIO_GetResponse(SDIO_RESP1);
    CID_Tab[1] = SDIO_GetResponse(SDIO_RESP2);
    CID_Tab[2] = SDIO_GetResponse(SDIO_RESP3);
    CID_Tab[3] = SDIO_GetResponse(SDIO_RESP4);
  }

  if ((cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V1_1) ||
      (cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V2_0) ||
      (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)     ||
      (cardinfo->CardType == SDIO_SECURE_DIGITAL_IO_COMBO_CARD))
  {
    /* CMD3 */
    SDIO_CmdInitStructure.SDIO_Argument   = 0x0;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD3_SEND_RELATIVE_ADDR;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp6Error(&cardinfo->RCA);

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }

  if (cardinfo->CardType != SDIO_SECURE_DIGITAL_IO_CARD)
  {
    /* CMD9 */
    SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD9_SEND_CSD;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Long;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp2Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

    CSD_Tab[0] = SDIO_GetResponse(SDIO_RESP1);
    CSD_Tab[1] = SDIO_GetResponse(SDIO_RESP2);
    CSD_Tab[2] = SDIO_GetResponse(SDIO_RESP3);
    CSD_Tab[3] = SDIO_GetResponse(SDIO_RESP4);
  }

  errorstatus = GetCardInfo(cardinfo);

  return(errorstatus);
}

/*********************************************************************************************************//**
  * @brief  Select or Deselect the corresponding card.
  * @param  CardAddr: Address of the Card to be selected
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_SelectDeselect(u32 CardAddr)
{
  SD_Error errorstatus;

  /* CMD7 */
  SDIO_CmdInitStructure.SDIO_Argument   = CardAddr;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD7_SELECT_DESELECT_CARD;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  return(errorstatus);
}

/*********************************************************************************************************//**
  * @brief  Enable wide bus opeartion for the requeseted card if supported by card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  BusMode: Specify the SD card wide bus mode
  *         This parameter can be one of the following values:
  *         @arg SD_4BIT_BUS_MODE: 4-bit data transfer
  *         @arg SD_1BIT_BUS_MODE: 1-bit data transfer
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_BusModeConfig(SD_CardInfo *cardinfo, u32 BusMode)
{
  SD_Error errorstatus;
  u32 sdstatus[16], *pBuf = sdstatus, i;

  /* For SD card only */
  if ((cardinfo->CardType != SDIO_STD_CAPACITY_SD_CARD_V1_1) &&
      (cardinfo->CardType != SDIO_STD_CAPACITY_SD_CARD_V2_0) &&
      (cardinfo->CardType != SDIO_HIGH_CAPACITY_SD_CARD))
  {
    return(SD_UNSUPPORTED_FEATURE);
  }

  if (SDIO_GetResponse(SDIO_RESP1) & SD_CARD_LOCKED)
  {
    return(SD_LOCK_UNLOCK_FAILED);
  }

  /* Get SCR register */
  errorstatus = FindSCR(cardinfo);

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* If wide bus operation to be enabled */
  if (BusMode == SD_4BIT_BUS_MODE)
  {
    /* If requested card supports wide bus operation */
    if (SCR[0] & SD_WIDE_BUS_SUPPORT)
    {
      /* CMD55 for ACMD */
      SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
      SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
      SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
      SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
      SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
      SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
      SDIO_SendCommand(&SDIO_CmdInitStructure);
      errorstatus = CmdResp1Error();

      if (errorstatus != SD_OK)
      {
        return(errorstatus);
      }

      /* ACMD6 */
      SDIO_CmdInitStructure.SDIO_Argument   = SD_4BIT_BUS_MODE;
      SDIO_CmdInitStructure.SDIO_CmdIndex   = ACMD6_SET_BUS_WIDTH;
      SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
      SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
      SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
      SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
      SDIO_SendCommand(&SDIO_CmdInitStructure);
      errorstatus = CmdResp1Error();

      if (errorstatus != SD_OK)
      {
        return(errorstatus);
      }

      /* Configure normal speed & 4-bit bus mode */
      SDIO_InitStructure.SDIO_ClockDiv       = SDIO_NORMAL_SPEED_CLK_DIV;
      SDIO_InitStructure.SDIO_ClockPeriod    = SDIO_Clock_LowPeriod_Longer;
      SDIO_InitStructure.SDIO_ClockPowerSave = SDIO_Clock_PowerSave_Disable;
      SDIO_InitStructure.SDIO_BusWide        = SDIO_BusWide_4b;
      SDIO_InitStructure.SDIO_BusMode        = SDIO_BusMode_NormalSpeed;
      SDIO_Init(&SDIO_InitStructure);

      /* check SD 3.0 & class 10 */
      if ((SCR[0] & SD_SPEC3_SUPPORT) && ((CSD_Tab[1] >> 20) & SD_CCCC_SWITCH))
      {
        /* CMD16 */
        SDIO_CmdInitStructure.SDIO_Argument   = 64;
        SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
        SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
        SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
        SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
        SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
        SDIO_SendCommand(&SDIO_CmdInitStructure);
        errorstatus = CmdResp1Error();

        if (errorstatus != SD_OK)
        {
          return(errorstatus);
        }

        SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

        /* Configure DPSM */
        SDIO_DataInitStructure.SDIO_DataBlockCount = 1;
        SDIO_DataInitStructure.SDIO_DataBlockSize  = 64;
        SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_SingleBlock_Transfer;
        SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToSDIO;
        SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
        SDIO_DataConfig(&SDIO_DataInitStructure);

        /* CMD6 */
        SDIO_CmdInitStructure.SDIO_Argument   = (1UL << 31) | 0x00FFFFF0 | SD_HIGH_SPEED;
        SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD6_SWITCH_FUNC;
        SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
        SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
        SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
        SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
        SDIO_SendCommand(&SDIO_CmdInitStructure);
        errorstatus = CmdResp1Error();

        if (errorstatus != SD_OK)
        {
          return(errorstatus);
        }

        /* wait for transfer end */
        while (!SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END))
        {
          if (SDIO_GetFIFOCount() >= 4)
          {
            for (i=0; i<4; i++)
            {
              *pBuf++ = __REV(SDIO_ReadData()); // big-endian to little-endian
            }
          }
        }

        if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_TIMEOUT))
        {
          SDIO_ClearFlag(SDIO_FLAG_DATA_TIMEOUT);
          return(SD_DATA_TIMEOUT);
        }
        if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_CRCERR))
        {
          SDIO_ClearFlag(SDIO_FLAG_DATA_CRCERR);
          return(SD_DATA_CRC_FAIL);
        }
        if (SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW))
        {
          SDIO_ClearFlag(SDIO_FLAG_BUF_OVERFLOW);
          return(SD_RX_OVERRUN);
        }

        while (SDIO_GetFIFOCount() != 0)
        {
          *pBuf++ = __REV(SDIO_ReadData()); // big-endian to little-endian
        }

        SDIO_ClearFlag(SDIO_FLAG_TRANS_END);

        /* Configure high speed & 4-bit bus mode */
        SDIO_InitStructure.SDIO_ClockDiv       = SDIO_HIGH_SPEED_CLK_DIV;
        SDIO_InitStructure.SDIO_ClockPeriod    = SDIO_Clock_LowPeriod_Longer;
        SDIO_InitStructure.SDIO_ClockPowerSave = SDIO_Clock_PowerSave_Disable;
        SDIO_InitStructure.SDIO_BusWide        = SDIO_BusWide_4b;
        SDIO_InitStructure.SDIO_BusMode        = SDIO_BusMode_HighSpeed;
        SDIO_Init(&SDIO_InitStructure);
      }

      return(SD_OK);
    }
  }

  /* Configure normal speed & 1-bit bus mode */
  SDIO_InitStructure.SDIO_ClockDiv       = SDIO_NORMAL_SPEED_CLK_DIV;
  SDIO_InitStructure.SDIO_ClockPeriod    = SDIO_Clock_LowPeriod_Longer;
  SDIO_InitStructure.SDIO_ClockPowerSave = SDIO_Clock_PowerSave_Disable;
  SDIO_InitStructure.SDIO_BusWide        = SDIO_BusWide_1b;
  SDIO_InitStructure.SDIO_BusMode        = SDIO_BusMode_NormalSpeed;
  SDIO_Init(&SDIO_InitStructure);

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  SD_GetSDStatus()
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_GetSDStatus(SD_CardInfo *cardinfo)
{
  SD_Error errorstatus;
  u8 tmp;
  u32 sdstatus[16], *pBuf = sdstatus, i;

  if (SDIO_GetResponse(SDIO_RESP1) & SD_CARD_LOCKED)
  {
    return(SD_LOCK_UNLOCK_FAILED);
  }

  /* CMD16 */
  SDIO_CmdInitStructure.SDIO_Argument   = 64;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* CMD55 for ACMD */
  SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = 1;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = 64;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_SingleBlock_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToSDIO;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  /* ACMD51 */
  SDIO_CmdInitStructure.SDIO_Argument   = 0;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = ACMD13_SD_STATUS;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  while (!SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END))
  {
    if (SDIO_GetFIFOCount() >= 4)
    {
      for (i=0; i<4; i++)
      {
        *pBuf++ = __REV(SDIO_ReadData()); // big-endian to little-endian
      }
    }
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_DATA_TIMEOUT);
    return(SD_DATA_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_DATA_CRCERR);
    return(SD_DATA_CRC_FAIL);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW))
  {
    SDIO_ClearFlag(SDIO_FLAG_BUF_OVERFLOW);
    return(SD_RX_OVERRUN);
  }

  while ((HT_SDIO->PSR >> 20) != 0)
  {
    *pBuf++ = __REV(SDIO_ReadData()); // big-endian to little-endian
  }

  SDIO_ClearFlag(SDIO_FLAG_TRANS_END);

  /* Byte 0 */
  tmp = (u8)((sdstatus[0] & 0xFF000000) >> 24);
  cardinfo->CardStatus.DataBusWidth = (tmp & 0xC0) >> 6;
  cardinfo->CardStatus.SecuredMode = (tmp & 0x20) >> 5;

  /* Byte 2 */
  tmp = (u8)((sdstatus[0] & 0x0000FF00) >> 8);
  cardinfo->CardStatus.SDCardType = tmp << 8;

  /* Byte 3 */
  tmp = (u8)(sdstatus[0] & 0x000000FF);
  cardinfo->CardStatus.SDCardType |= (tmp);

  /* Byte 4 */
  tmp = (u8)((sdstatus[1] & 0xFF000000) >> 24);
  cardinfo->CardStatus.ProtectedAreaSize = tmp << 24;

  /* Byte 5 */
  tmp = (u8)((sdstatus[1] & 0x00FF0000) >> 16);
  cardinfo->CardStatus.ProtectedAreaSize |= (tmp << 16);

  /* Byte 6 */
  tmp = (u8)((sdstatus[1] & 0x0000FF00) >> 8);
  cardinfo->CardStatus.ProtectedAreaSize |= (tmp << 8);

  /* Byte 7 */
  tmp = (u8)(sdstatus[1] & 0x000000FF);
  cardinfo->CardStatus.ProtectedAreaSize |= (tmp);

  /* Byte 8 */
  tmp = (u8)((sdstatus[2] & 0xFF000000) >> 24);
  cardinfo->CardStatus.SpeedClass = tmp;

  /* Byte 9 */
  tmp = (u8)((sdstatus[2] & 0x00FF0000) >> 16);
  cardinfo->CardStatus.PerformanceMove = tmp;

  /* Byte 10 */
  tmp = (u8)((sdstatus[2] & 0x0000FF00) >> 8);
  cardinfo->CardStatus.AUSize = (tmp & 0xF0) >> 4;

  /* Byte 11 */
  tmp = (u8)(sdstatus[2] & 0x000000FF);
  cardinfo->CardStatus.EraseSize = tmp << 8;

  /* Byte 12 */
  tmp = (u8)((sdstatus[3] & 0xFF000000) >> 24);
  cardinfo->CardStatus.EraseSize |= (tmp);

  /* Byte 13 */
  tmp = (u8)((sdstatus[3] & 0x00FF0000) >> 16);
  cardinfo->CardStatus.EraseTimeout = (tmp & 0xFC) >> 2;
  cardinfo->CardStatus.EraseOffset = (tmp & 0x3);

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Allow to read one block from a specified address in a card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  ReadAddr: Address from where data are to be read
  * @param  readbuff: pointer to the buffer that will contain the received data
  * @param  BlockSize: the SD card data block size
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_ReadBlock(SD_CardInfo *cardinfo, u32 ReadAddr, u32 *readbuff, u16 BlockSize)
{
  SD_Error errorstatus;
  _DEBUG_PRINTF("SD_ReadBlock\r\n");
  _DEBUG_PRINTF("BlockSize:%d\r\n",BlockSize);
  _DEBUG_PRINTF("ReadAddr:%d\r\n",(unsigned int)ReadAddr);
  if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    BlockSize = 512;
    ReadAddr /= 512;
  }

  if ((BlockSize > 0) && (BlockSize <= 2048) && ((BlockSize & 3UL) == 0))
  {
    /* CMD16 */
    SDIO_CmdInitStructure.SDIO_Argument   = BlockSize;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }
  else
  {
    /* BlockSize must be 4-byte alignment */
    return(SD_INVALID_PARAMETER);
  }

  SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = 1;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = BlockSize;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_SingleBlock_DMA_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToSDIO;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  TransferEnd = 0;
  TransferStopCmd = 0;
  TransferStatus = SD_OK;

  SD_LowLevel_DMA_RxConfig(readbuff, BlockSize);

  /* CMD17 */
  SDIO_CmdInitStructure.SDIO_Argument   = ReadAddr;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD17_READ_SINGLE_BLOCK;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  SDIO_IntConfig(SDIO_INT_BUF_OVERFLOW | SDIO_INT_DATA_CRCERR | SDIO_INT_DATA_TIMEOUT | SDIO_INT_TRANS_END, ENABLE);
  while ((TransferEnd == 0) && (TransferStatus == SD_OK))
  {
  }

  if (TransferStatus != SD_OK)
  {
    return(TransferStatus);
  }

  while (SDIO_GetFIFOCount() != 0)
  {
    while (1);
  }
  _DEBUG_PRINTF("Data:\r\n");
  _DEBUG_DUMP(readbuff,BlockSize/4);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Allow to read blocks from a specified address in a card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  ReadAddr: Address from where data are to be read
  * @param  readbuff: pointer to the buffer that will contain the received data
  * @param  BlockSize: the SD card data block size
  * @param  BlockCount: number of blocks to be read
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_ReadMultiBlocks(SD_CardInfo *cardinfo, u32 ReadAddr, u32 *readbuff, u16 BlockSize, u16 BlockCount)
{
  SD_Error errorstatus;
  int debug_len=BlockCount*BlockSize;
  _DEBUG_PRINTF("SD_ReadMultiBlocks\r\n");
  _DEBUG_PRINTF("BlockSize:%d\r\n",BlockSize);
  _DEBUG_PRINTF("ReadAddr:%d\r\n",(unsigned int)ReadAddr);
  if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    BlockSize = 512;
    ReadAddr /= 512;
  }

  if ((BlockCount * BlockSize) > SD_MAX_DATA_LENGTH)  // 32GB
  {
    return(SD_INVALID_PARAMETER);
  }

  if ((BlockSize > 0) && (BlockSize <= 2048) && ((BlockSize & 3UL) == 0))
  {
    /* CMD16 */
    SDIO_CmdInitStructure.SDIO_Argument   = BlockSize;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }
  else
  {
    /* BlockSize must be 4-byte alignment */
    return(SD_INVALID_PARAMETER);
  }

  SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = BlockCount;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = BlockSize;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_MultiBlock_DMA_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToSDIO;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  TransferEnd = 0;
  TransferStopCmd = 1;
  TransferStatus = SD_OK;

  SD_LowLevel_DMA_RxConfig(readbuff, (BlockSize * BlockCount));

  /* CMD18 */
  SDIO_CmdInitStructure.SDIO_Argument   = ReadAddr;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD18_READ_MULTIPLE_BLOCK;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  SDIO_IntConfig(SDIO_INT_BUF_OVERFLOW | SDIO_INT_DATA_CRCERR | SDIO_INT_DATA_TIMEOUT | SDIO_INT_TRANS_END, ENABLE);
  while ((TransferEnd == 0) && (TransferStatus == SD_OK))
  {
  }

  if (TransferStatus != SD_OK)
  {
    return(TransferStatus);
  }

  while (SDIO_GetFIFOCount() != 0)
  {
    while (1);
  }
  _DEBUG_PRINTF("Data:\r\n");
  _DEBUG_DUMP(readbuff,debug_len/4);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Allow to erase memory area specified for the given card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  StartAddr: the start address
  * @param  EndAddr: the end address
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_Erase(SD_CardInfo *cardinfo, u32 StartAddr, u32 EndAddr)
{
  SD_Error errorstatus;
  u32 maxdelay;
  u8 cardstate;
  u32 sido_ck;
  /* Check if the card command class supports erase */
  if (((CSD_Tab[1] >> 20) & SD_CCCC_ERASE) == 0)
  {
    return(SD_REQUEST_NOT_APPLICABLE);
  }

  if (SDIO_GetResponse(SDIO_RESP1) & SD_CARD_LOCKED)
  {
    return(SD_LOCK_UNLOCK_FAILED);
  }

  if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    StartAddr /= 512;
    EndAddr /= 512;
  }

  if ((cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V1_1) ||
      (cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V2_0) ||
      (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD))
  {
    /* CMD32 */
    SDIO_CmdInitStructure.SDIO_Argument   = StartAddr;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD32_ERASE_WR_BLK_START;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

    /* CMD33 */
    SDIO_CmdInitStructure.SDIO_Argument   = EndAddr;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD33_ERASE_WR_BLK_END;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }

  /* CMD38 */
  SDIO_CmdInitStructure.SDIO_Argument   = 0;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD38_ERASE;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }
  sido_ck = HT_SDIO->CLKCR >> 8;
  maxdelay = (SystemCoreClock / (sido_ck + 1) * 5) / 1000;  // 5 ms
  while (--maxdelay > 0)
  {
  }

  /* wait for card programming */
  do {
    errorstatus = IsCardProgramming(cardinfo, &cardstate);
  } while ((errorstatus == SD_OK) && ((cardstate == SD_CARD_PROGRAMMING) || (cardstate == SD_CARD_RECEIVING)));

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Allow to write one block starting from a specified address in a card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  WriteAddr: Address from where data are to be read
  * @param  writebuff: pointer to the buffer that contain the data to be transferred
  * @param  BlockSize: the SD card data block size
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_WriteBlock(SD_CardInfo *cardinfo, u32 WriteAddr, u32 *writebuff, u16 BlockSize)
{
  SD_Error errorstatus;
  u8 cardstate;
  u32 timeout=1000;
  _DEBUG_PRINTF("SD_WriteBlock\r\n");
  _DEBUG_PRINTF("BlockSize:%d\r\n",BlockSize);
  _DEBUG_PRINTF("WriteAddr:%d\r\n",(unsigned int)WriteAddr);
  if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    BlockSize = 512;
    WriteAddr /= 512;
  }

  if ((BlockSize > 0) && (BlockSize <= 2048) && ((BlockSize & 3UL) == 0))
  {
    /* CMD16 */
    SDIO_CmdInitStructure.SDIO_Argument   = BlockSize;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }
  else
  {
    /* BlockSize must be 4-byte alignment */
    return(SD_INVALID_PARAMETER);
  }

  /* wait until card is ready for data added */
  do {
    if (--timeout == 0)
    {
      return(SD_ERROR);
    }

    /* CMD13 */
    SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD13_SEND_STATUS;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

  } while (!(SDIO_GetResponse(SDIO_RESP1) & CARD_STATUS_READY_FOR_DATA));

  SDIO_FlagConfig(SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = 1;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = BlockSize;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_SingleBlock_DMA_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToCard;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  TransferEnd = 0;
  TransferStopCmd = 0;
  TransferStatus = SD_OK;

  SD_LowLevel_DMA_TxConfig(writebuff, BlockSize);

  /* CMD24 */
  SDIO_CmdInitStructure.SDIO_Argument   = WriteAddr;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD24_WRITE_BLOCK;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  SDIO_IntConfig(SDIO_INT_BUF_OVERFLOW | SDIO_INT_DATA_CRCERR | SDIO_INT_DATA_TIMEOUT | SDIO_INT_TRANS_END, ENABLE);
  while ((TransferEnd == 0) && (TransferStatus == SD_OK))
  {
  }

  if (TransferStatus != SD_OK)
  {
    return(TransferStatus);
  }

  /* wait for card programming */
  do {
    errorstatus = IsCardProgramming(cardinfo, &cardstate);
  } while ((errorstatus == SD_OK) && ((cardstate == SD_CARD_PROGRAMMING) || (cardstate == SD_CARD_RECEIVING)));

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Allow to write blocks starting from a specified address in a card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  WriteAddr: Address from where data are to be read
  * @param  writebuff: pointer to the buffer that contain the data to be transferred
  * @param  BlockSize: the SD card data block size
  * @param  BlockCount: number of blocks to be written
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_WriteMultiBlocks(SD_CardInfo *cardinfo, u32 WriteAddr, u32 *writebuff, u16 BlockSize, u16 BlockCount)
{
  SD_Error errorstatus;
  u8 cardstate;
  u32 timeout=1000;
  if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    BlockSize = 512;
    WriteAddr /= 512;
  }
  _DEBUG_PRINTF("SD_WriteMultiBlocks\r\n");
  _DEBUG_PRINTF("BlockSize:%d\r\n",BlockSize);
  _DEBUG_PRINTF("WriteAddr:%d\r\n",(unsigned int)WriteAddr);
  if (TransferSize > SD_MAX_DATA_LENGTH)  // 32GB
  {
    return(SD_INVALID_PARAMETER);
  }

  if ((BlockSize > 0) && (BlockSize <= 2048) && ((BlockSize & 3UL) == 0))
  {
    /* CMD16 */
    SDIO_CmdInitStructure.SDIO_Argument   = BlockSize;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }
  else
  {
    /* BlockSize must be 4-byte alignment */
    return(SD_INVALID_PARAMETER);
  }

  /* wait until card is ready for data added */
  do {
    if (--timeout == 0)
    {
      return(SD_ERROR);
    }

    /* CMD13 */
    SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD13_SEND_STATUS;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

  } while (!(SDIO_GetResponse(SDIO_RESP1) & CARD_STATUS_READY_FOR_DATA));

  if ((cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V1_1) ||
      (cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V2_0) ||
      (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD))
  {
    /* CMD55 for ACMD */
    SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

    /* CMD23 */
    SDIO_CmdInitStructure.SDIO_Argument   = BlockCount;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = ACMD23_SET_WR_BLK_ERASE_COUNT;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp1Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }
  }

  SDIO_FlagConfig(SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = BlockCount;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = BlockSize;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_MultiBlock_DMA_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToCard;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  TransferEnd = 0;
  TransferStopCmd = 1;
  TransferStatus = SD_OK;

  SD_LowLevel_DMA_TxConfig(writebuff, (BlockSize * BlockCount));

  /* CMD25 */
  SDIO_CmdInitStructure.SDIO_Argument   = WriteAddr;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD25_WRITE_MULTIPLE_BLOCK;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  SDIO_IntConfig(SDIO_INT_BUF_OVERFLOW | SDIO_INT_DATA_CRCERR | SDIO_INT_DATA_TIMEOUT | SDIO_INT_TRANS_END, ENABLE);
  while ((TransferEnd == 0) && (TransferStatus == SD_OK))
  {
  }

  if (TransferStatus != SD_OK)
  {
    return(TransferStatus);
  }

  /* wait for card programming */
  do {
    errorstatus = IsCardProgramming(cardinfo, &cardstate);
  } while ((errorstatus == SD_OK) && ((cardstate == SD_CARD_PROGRAMMING) || (cardstate == SD_CARD_RECEIVING)));

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Wait until the SDIO data transfer is finished.
  * @return The SD card error code
  ***********************************************************************************************************/
SD_Error SD_InterruptService(void)
{
  SD_Error errorstatus;

  if (SDIO_GetFlagStatus(SDIO_FLAG_TRANS_END))
  {
    if (TransferStopCmd)
    {
      /* CMD12 */
      SDIO_CmdInitStructure.SDIO_Argument   = 0;
      SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD12_STOP_TRANSMISSION;
      SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
      SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
      SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
      SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
      SDIO_SendCommand(&SDIO_CmdInitStructure);
      errorstatus = CmdResp1Error();

      if (errorstatus != SD_OK)
      {
        return(errorstatus);
      }
    }

    SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, DISABLE);
    SDIO_ClearFlag(SDIO_FLAG_TRANS_END);
    TransferEnd = 1;
    return(SD_OK);
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_TIMEOUT))
  {
    SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, DISABLE);
    SDIO_ClearFlag(SDIO_FLAG_DATA_TIMEOUT);
    return(SD_DATA_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_CRCERR))
  {
    SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, DISABLE);
    SDIO_ClearFlag(SDIO_FLAG_DATA_CRCERR);
    return(SD_DATA_CRC_FAIL);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW))
  {
    SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_BUF_UNDERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, DISABLE);
    SDIO_ClearFlag(SDIO_FLAG_BUF_OVERFLOW);
    return(SD_RX_OVERRUN);
  }

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for CMD0.
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdError(void)
{
  u32 timeout = SDIO_CMD_TIMEOUT;

  while ((timeout > 0) && (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND)))
  {
    timeout--;
  }

  if (timeout == 0)
  {
    return(SD_CMD_RSP_TIMEOUT);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for R1 response.
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdResp1Error(void)
{
  SD_Error errorstatus;
  u32 response;

  while (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR))
  {
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    RESET_CPSM();
    return(SD_CMD_RSP_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_CRCERR);
    return(SD_CMD_CRC_FAIL);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);

  response = SDIO_GetResponse(SDIO_RESP1);
  errorstatus = (SD_Error)(response & CARD_STATUS_ERROR_BITS);
  return(errorstatus);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for R2 (CID or CSD) response.
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdResp2Error(void)
{
  while (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR))
  {
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    RESET_CPSM();
    return(SD_CMD_RSP_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_CRCERR);
    return(SD_CMD_CRC_FAIL);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for R3 response.
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdResp3Error(void)
{
  while (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR))
  {
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    RESET_CPSM();
    return(SD_CMD_RSP_TIMEOUT);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_CRCERR);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for R6 (RCA) response.
  * @param  pRCA: pointer to the variable that will contain the SD card relative address (RCA)
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdResp6Error(u16 *pRCA)
{
  u32 response;

  while (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR | SDIO_FLAG_CMD_IDXERR))
  {
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    RESET_CPSM();
    return(SD_CMD_RSP_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_CRCERR);
    return(SD_CMD_CRC_FAIL);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_IDXERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_IDXERR);
    return(SD_ILLEGAL_CMD);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);

  response = SDIO_GetResponse(SDIO_RESP1);

  if (response & SD_R6_GENERAL_UNKNOWN_ERROR)
  {
    return(SD_GENERAL_UNKNOWN_ERROR);
  }
  if (response & SD_R6_ILLEGAL_CMD)
  {
    return(SD_ILLEGAL_CMD);
  }
  if (response & SD_R6_COM_CRC_FAILED)
  {
    return(SD_COM_CRC_FAILED);
  }

  *pRCA = (u16) (response >> 16);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check for error conditions for R7 response.
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error CmdResp7Error(void)
{
  u32 timeout = SDIO_CMD_TIMEOUT;

  while ((timeout > 0) && (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT)))
  {
    timeout--;
  }

  if ((timeout == 0) || (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT)))
  {
    /* SD card is not V2.0 complient or card does not support the set voltage range */
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    RESET_CPSM();
    return(SD_CMD_RSP_TIMEOUT);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Get information about specific card.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error GetCardInfo(SD_CardInfo *cardinfo)
{
  u8 tmp;

  //----------------------------------------------------------------------------------------------------------
  // CSD
  //----------------------------------------------------------------------------------------------------------
  /* Byte 0 */
  tmp = (u8)((CSD_Tab[0] & 0xFF000000) >> 24);
  cardinfo->SD_csd.CSDStruct = (tmp & 0xC0) >> 6;
  cardinfo->SD_csd.SysSpecVersion = (tmp & 0x3C) >> 2;
  cardinfo->SD_csd.Reserved1 = tmp & 0x03;

  /* Byte 1 */
  tmp = (u8)((CSD_Tab[0] & 0x00FF0000) >> 16);
  cardinfo->SD_csd.TAAC = tmp;

  /* Byte 2 */
  tmp = (u8)((CSD_Tab[0] & 0x0000FF00) >> 8);
  cardinfo->SD_csd.NSAC = tmp;

  /* Byte 3 */
  tmp = (u8)(CSD_Tab[0] & 0x000000FF);
  cardinfo->SD_csd.MaxBusClkFrec = tmp;

  /* Byte 4 */
  tmp = (u8)((CSD_Tab[1] & 0xFF000000) >> 24);
  cardinfo->SD_csd.CardComdClasses = tmp << 4;

  /* Byte 5 */
  tmp = (u8)((CSD_Tab[1] & 0x00FF0000) >> 16);
  cardinfo->SD_csd.CardComdClasses |= (tmp & 0xF0) >> 4;
  cardinfo->SD_csd.RdBlockLen = tmp & 0x0F;

  /* Byte 6 */
  tmp = (u8)((CSD_Tab[1] & 0x0000FF00) >> 8);
  cardinfo->SD_csd.PartBlockRead = (tmp & 0x80) >> 7;
  cardinfo->SD_csd.WrBlockMisalign = (tmp & 0x40) >> 6;
  cardinfo->SD_csd.RdBlockMisalign = (tmp & 0x20) >> 5;
  cardinfo->SD_csd.DSRImpl = (tmp & 0x10) >> 4;
  cardinfo->SD_csd.Reserved2 = 0; /* Reserved */

  if ((cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V1_1) ||
      (cardinfo->CardType == SDIO_STD_CAPACITY_SD_CARD_V2_0))
  {
    cardinfo->SD_csd.DeviceSize = (tmp & 0x03) << 10;

    /* Byte 7 */
    tmp = (u8)(CSD_Tab[1] & 0x000000FF);
    cardinfo->SD_csd.DeviceSize |= (tmp) << 2;

    /* Byte 8 */
    tmp = (u8)((CSD_Tab[2] & 0xFF000000) >> 24);
    cardinfo->SD_csd.DeviceSize |= (tmp & 0xC0) >> 6;

    cardinfo->SD_csd.MaxRdCurrentVDDMin = (tmp & 0x38) >> 3;
    cardinfo->SD_csd.MaxRdCurrentVDDMax = (tmp & 0x07);

    /* Byte 9 */
    tmp = (u8)((CSD_Tab[2] & 0x00FF0000) >> 16);
    cardinfo->SD_csd.MaxWrCurrentVDDMin = (tmp & 0xE0) >> 5;
    cardinfo->SD_csd.MaxWrCurrentVDDMax = (tmp & 0x1C) >> 2;
    cardinfo->SD_csd.DeviceSizeMul = (tmp & 0x03) << 1;

    /* Byte 10 */
    tmp = (u8)((CSD_Tab[2] & 0x0000FF00) >> 8);
    cardinfo->SD_csd.DeviceSizeMul |= (tmp & 0x80) >> 7;

    cardinfo->CardCapacity = (cardinfo->SD_csd.DeviceSize + 1) ;
    cardinfo->CardCapacity *= (1 << (cardinfo->SD_csd.DeviceSizeMul + 2));
    cardinfo->CardBlockSize = 1 << (cardinfo->SD_csd.RdBlockLen);
    cardinfo->CardCapacity *= cardinfo->CardBlockSize;
  }
  else if (cardinfo->CardType == SDIO_HIGH_CAPACITY_SD_CARD)
  {
    /* Byte 7 */
    tmp = (u8)(CSD_Tab[1] & 0x000000FF);
    cardinfo->SD_csd.DeviceSize = (tmp & 0x3F) << 16;

    /* Byte 8 */
    tmp = (u8)((CSD_Tab[2] & 0xFF000000) >> 24);

    cardinfo->SD_csd.DeviceSize |= (tmp << 8);

    /* Byte 9 */
    tmp = (u8)((CSD_Tab[2] & 0x00FF0000) >> 16);

    cardinfo->SD_csd.DeviceSize |= (tmp);

    /* Byte 10 */
    tmp = (u8)((CSD_Tab[2] & 0x0000FF00) >> 8);

    cardinfo->CardCapacity = (cardinfo->SD_csd.DeviceSize + 1) * 512 * 1024;
    cardinfo->CardBlockSize = 512;
  }


  cardinfo->SD_csd.EraseGrSize = (tmp & 0x40) >> 6;
  cardinfo->SD_csd.EraseGrMul = (tmp & 0x3F) << 1;

  /* Byte 11 */
  tmp = (u8)(CSD_Tab[2] & 0x000000FF);
  cardinfo->SD_csd.EraseGrMul |= (tmp & 0x80) >> 7;
  cardinfo->SD_csd.WrProtectGrSize = (tmp & 0x7F);

  /* Byte 12 */
  tmp = (u8)((CSD_Tab[3] & 0xFF000000) >> 24);
  cardinfo->SD_csd.WrProtectGrEnable = (tmp & 0x80) >> 7;
  cardinfo->SD_csd.ManDeflECC = (tmp & 0x60) >> 5;
  cardinfo->SD_csd.WrSpeedFact = (tmp & 0x1C) >> 2;
  cardinfo->SD_csd.MaxWrBlockLen = (tmp & 0x03) << 2;

  /* Byte 13 */
  tmp = (u8)((CSD_Tab[3] & 0x00FF0000) >> 16);
  cardinfo->SD_csd.MaxWrBlockLen |= (tmp & 0xC0) >> 6;
  cardinfo->SD_csd.WriteBlockPaPartial = (tmp & 0x20) >> 5;
  cardinfo->SD_csd.Reserved3 = 0;
  cardinfo->SD_csd.ContentProtectAppli = (tmp & 0x01);

  /* Byte 14 */
  tmp = (u8)((CSD_Tab[3] & 0x0000FF00) >> 8);
  cardinfo->SD_csd.FileFormatGrouop = (tmp & 0x80) >> 7;
  cardinfo->SD_csd.CopyFlag = (tmp & 0x40) >> 6;
  cardinfo->SD_csd.PermWrProtect = (tmp & 0x20) >> 5;
  cardinfo->SD_csd.TempWrProtect = (tmp & 0x10) >> 4;
  cardinfo->SD_csd.FileFormat = (tmp & 0x0C) >> 2;
  cardinfo->SD_csd.ECC = (tmp & 0x03);

  /* Byte 15 */
  tmp = (u8)(CSD_Tab[3] & 0x000000FF);
  cardinfo->SD_csd.CSD_CRC = (tmp & 0xFE) >> 1;
  cardinfo->SD_csd.Reserved4 = 1;

  //----------------------------------------------------------------------------------------------------------
  // CID
  //----------------------------------------------------------------------------------------------------------
  /* Byte 0 */
  tmp = (u8)((CID_Tab[0] & 0xFF000000) >> 24);
  cardinfo->SD_cid.ManufacturerID = tmp;

  /* Byte 1 */
  tmp = (u8)((CID_Tab[0] & 0x00FF0000) >> 16);
  cardinfo->SD_cid.OEM_AppliID = tmp << 8;

  /* Byte 2 */
  tmp = (u8)((CID_Tab[0] & 0x000000FF00) >> 8);
  cardinfo->SD_cid.OEM_AppliID |= tmp;

  /* Byte 3 */
  tmp = (u8)(CID_Tab[0] & 0x000000FF);
  cardinfo->SD_cid.ProdName1 = tmp << 24;

  /* Byte 4 */
  tmp = (u8)((CID_Tab[1] & 0xFF000000) >> 24);
  cardinfo->SD_cid.ProdName1 |= tmp << 16;

  /* Byte 5 */
  tmp = (u8)((CID_Tab[1] & 0x00FF0000) >> 16);
  cardinfo->SD_cid.ProdName1 |= tmp << 8;

  /* Byte 6 */
  tmp = (u8)((CID_Tab[1] & 0x0000FF00) >> 8);
  cardinfo->SD_cid.ProdName1 |= tmp;

  /* Byte 7 */
  tmp = (u8)(CID_Tab[1] & 0x000000FF);
  cardinfo->SD_cid.ProdName2 = tmp;

  /* Byte 8 */
  tmp = (u8)((CID_Tab[2] & 0xFF000000) >> 24);
  cardinfo->SD_cid.ProdRev = tmp;

  /* Byte 9 */
  tmp = (u8)((CID_Tab[2] & 0x00FF0000) >> 16);
  cardinfo->SD_cid.ProdSN = tmp << 24;

  /* Byte 10 */
  tmp = (u8)((CID_Tab[2] & 0x0000FF00) >> 8);
  cardinfo->SD_cid.ProdSN |= tmp << 16;

  /* Byte 11 */
  tmp = (u8)(CID_Tab[2] & 0x000000FF);
  cardinfo->SD_cid.ProdSN |= tmp << 8;

  /* Byte 12 */
  tmp = (u8)((CID_Tab[3] & 0xFF000000) >> 24);
  cardinfo->SD_cid.ProdSN |= tmp;

  /* Byte 13 */
  tmp = (u8)((CID_Tab[3] & 0x00FF0000) >> 16);
  cardinfo->SD_cid.Reserved1 |= (tmp & 0xF0) >> 4;
  cardinfo->SD_cid.ManufactDate = (tmp & 0x0F) << 8;

  /* Byte 14 */
  tmp = (u8)((CID_Tab[3] & 0x0000FF00) >> 8);
  cardinfo->SD_cid.ManufactDate |= tmp;

  /* Byte 15 */
  tmp = (u8)(CID_Tab[3] & 0x000000FF);
  cardinfo->SD_cid.CID_CRC = (tmp & 0xFE) >> 1;
  cardinfo->SD_cid.Reserved2 = 1;

  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Find the SD card SCR register value.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error FindSCR(SD_CardInfo *cardinfo)
{
  SD_Error errorstatus;

  /* CMD16 */
  SDIO_CmdInitStructure.SDIO_Argument   = 8;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD16_SET_BLOCKLEN;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* CMD55 for ACMD */
  SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD55_APP_CMD;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  SDIO_FlagConfig(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END, ENABLE);

  /* Configure DPSM */
  SDIO_DataInitStructure.SDIO_DataBlockCount = 1;
  SDIO_DataInitStructure.SDIO_DataBlockSize  = 8;
  SDIO_DataInitStructure.SDIO_TransferMode   = SDIO_SingleBlock_Transfer;
  SDIO_DataInitStructure.SDIO_TransferDir    = SDIO_TransferDir_ToSDIO;
  SDIO_DataInitStructure.SDIO_DataTimeOut    = SD_DATATIMEOUT;
  SDIO_DataConfig(&SDIO_DataInitStructure);

  /* ACMD51 */
  SDIO_CmdInitStructure.SDIO_Argument   = 0;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = ACMD51_SEND_SCR;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_Yes;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);
  errorstatus = CmdResp1Error();

  if (errorstatus != SD_OK)
  {
    return(errorstatus);
  }

  /* wait for transfer end */
  while (!SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW | SDIO_FLAG_DATA_CRCERR | SDIO_FLAG_DATA_TIMEOUT | SDIO_FLAG_TRANS_END));

  SCR[0] = __REV(HT_SDIO->DR); // big-endian to little-endian
  SCR[1] = __REV(HT_SDIO->DR);

  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_DATA_TIMEOUT);
    return(SD_DATA_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_DATA_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_DATA_CRCERR);
    return(SD_DATA_CRC_FAIL);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_BUF_OVERFLOW))
  {
    SDIO_ClearFlag(SDIO_FLAG_BUF_OVERFLOW);
    return(SD_RX_OVERRUN);
  }

  cardinfo->CardBlankValue = (((SCR[0] >> 23) & 1UL) == 0) ? (0) : (0xFFFFFFFF);

  SDIO_ClearFlag(SDIO_FLAG_TRANS_END);
  return(SD_OK);
}

/*********************************************************************************************************//**
  * @brief  Check if the SD card is in programming state.
  * @param  cardinfo: pointer to a SD_CardInfo structure that contains all SD card information
  * @param  pstatus: pointer to the variable that will contain the SD card state
  * @return The SD card error code
  ***********************************************************************************************************/
static SD_Error IsCardProgramming(SD_CardInfo *cardinfo, u8* pstatus)
{
  u32 response;

  /* CMD13: Get SD status */
  SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
  SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD13_SEND_STATUS;
  SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Short;
  SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
  SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_Yes;
  SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
  SDIO_SendCommand(&SDIO_CmdInitStructure);

  while (!SDIO_GetFlagStatus(SDIO_FLAG_CMD_SEND | SDIO_FLAG_CMD_TIMEOUT | SDIO_FLAG_CMD_CRCERR | SDIO_FLAG_CMD_IDXERR))
  {
  }

  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_TIMEOUT))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_TIMEOUT);
    return(SD_CMD_RSP_TIMEOUT);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_CRCERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_CRCERR);
    return(SD_CMD_CRC_FAIL);
  }
  if (SDIO_GetFlagStatus(SDIO_FLAG_CMD_IDXERR))
  {
    SDIO_ClearFlag(SDIO_FLAG_CMD_IDXERR);
    return(SD_ILLEGAL_CMD);
  }

  SDIO_ClearFlag(SDIO_FLAG_CMD_SEND);

  /* Find out card status */
  response = SDIO_GetResponse(SDIO_RESP1);
  *pstatus = (u8) ((response >> 9) & 0x0000000F);

  if (response & CARD_STATUS_ERROR_BITS)
  {
    if (response & CARD_STATUS_OUT_OF_RANGE)
    {
      return(SD_ADDR_OUT_OF_RANGE);
    }
    else if (response & CARD_STATUS_ADDRESS_ERROR)
    {
      return(SD_ADDR_MISALIGNED);
    }
    else if (response & CARD_STATUS_BLOCK_LEN_ERROR)
    {
      return(SD_BLOCK_LEN_ERR);
    }
    else if (response & CARD_STATUS_ERASE_SEQ_ERROR)
    {
      return(SD_ERASE_SEQ_ERR);
    }
    else if (response & CARD_STATUS_ERASE_PARAM)
    {
      return(SD_BAD_ERASE_PARAM);
    }
    else if (response & CARD_STATUS_WP_VIOLATION)
    {
      return(SD_WRITE_PROT_VIOLATION);
    }
    else if (response & CARD_STATUS_LOCK_UNLOCK_FAILED)
    {
      return(SD_LOCK_UNLOCK_FAILED);
    }
    else if (response & CARD_STATUS_COM_CRC_ERROR)
    {
      return(SD_COM_CRC_FAILED);
    }
    else if (response & CARD_STATUS_ILLEGAL_COMMAND)
    {
      return(SD_ILLEGAL_CMD);
    }
    else if (response & CARD_STATUS_CARD_ECC_FAILED)
    {
      return(SD_CARD_ECC_FAILED);
    }
    else if (response & CARD_STATUS_CC_ERROR)
    {
      return(SD_CC_ERROR);
    }
    else if (response & CARD_STATUS_UNKNOWN_ERROR)
    {
      return(SD_GENERAL_UNKNOWN_ERROR);
    }
    else if (response & CARD_STATUS_STREAM_READ_UDRUN)
    {
      return(SD_STREAM_READ_UNDERRUN);
    }
    else if (response & CARD_STATUS_STREAM_WRITE_OVRUN)
    {
      return(SD_STREAM_WRITE_OVERRUN);
    }
    else if (response & CARD_STATUS_CID_CSD_OVERWRITE)
    {
      return(SD_CID_CSD_OVERWRITE);
    }
    else if (response & CARD_STATUS_WP_ERASE_SKIP)
    {
      return(SD_WP_ERASE_SKIP);
    }
    else if (response & CARD_STATUS_CARD_ECC_DISABLED)
    {
      return(SD_CARD_ECC_DISABLED);
    }
    else if (response & CARD_STATUS_ERASE_RESET)
    {
      return(SD_ERASE_RESET);
    }
    else if (response & CARD_STATUS_AKE_SEQ_ERROR)
    {
      return(SD_AKE_SEQ_ERROR);
    }
  }

  return(SD_OK);
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

/**
  * @}
  */


/*********************************************************************************************************//**
  * @brief  Get CSD Register from Sd Card..
  * @param  cardinfo: structure point of CSD register.
  * @retval uStatus: SD_RESPONSE_ERR: SD card response failed.
  *                  SD_RESPONSE_NOERR: SD card response is successfully.
  ***********************************************************************************************************/
SD_Error SD_GetCSDRegister(SD_CardInfo* cardinfo)
{
  SD_Error errorstatus;
  if (cardinfo->CardType != SDIO_SECURE_DIGITAL_IO_CARD)
  {
    /* CMD9 */
    SDIO_CmdInitStructure.SDIO_Argument   = cardinfo->RCA << 16;
    SDIO_CmdInitStructure.SDIO_CmdIndex   = CMD9_SEND_CSD;
    SDIO_CmdInitStructure.SDIO_Response   = SDIO_Response_Long;
    SDIO_CmdInitStructure.SDIO_DatPresent = SDIO_Data_Present_No;
    SDIO_CmdInitStructure.SDIO_CmdIdxChk  = SDIO_CmdIdxChk_No;
    SDIO_CmdInitStructure.SDIO_CmdCrcChk  = SDIO_CmdCrcChk_Yes;
    SDIO_SendCommand(&SDIO_CmdInitStructure);
    errorstatus = CmdResp2Error();

    if (errorstatus != SD_OK)
    {
      return(errorstatus);
    }

    CSD_Tab[0] = SDIO_GetResponse(SDIO_RESP1);
    CSD_Tab[1] = SDIO_GetResponse(SDIO_RESP2);
    CSD_Tab[2] = SDIO_GetResponse(SDIO_RESP3);
    CSD_Tab[3] = SDIO_GetResponse(SDIO_RESP4);
  }
  errorstatus = GetCardInfo(cardinfo);
  return(errorstatus);
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

/**
  * @}
  */
