/*********************************************************************************************************//**
 * @file    EBI/DM9000A_ReadID/dm9000a.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   The DM9000A driver.
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
#include "dm9000a.h"
#include "dm9000a_reg.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EBI_Examples EBI
  * @{
  */

/** @addtogroup DM9000A_ReadID
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef struct
{
  vu16 Reg;
  vu16 Data;
}EBI_DM9000_TypeDef;

/* Private constants ---------------------------------------------------------------------------------------*/
#define DM9000_PHY                (0x40)  /* PHY address 0x01                                               */
#define DM9000_IO_8BIT            (1)
#define DM9000_IO_16BIT           (0)

#define DM9000_Bank_ADDR          (0x64000000)
#define DM9000                    ((EBI_DM9000_TypeDef *) DM9000_Bank_ADDR)

/* Private function prototypes -----------------------------------------------------------------------------*/
static void _dm9000_Configuration(void);
static void _dm9000_Delay_ms(u32 uDelay);

static u16 phy_read(u32 uReg);
static void phy_write(u16 uReg, u16 uValue);
static void phy_mode_set(u32 uMediaMode);

/* Private macro -------------------------------------------------------------------------------------------*/
#define RESET_SET                     (DM9K_RESET_PORT->SRR = DM9K_RESET_GPIO)
#define RESET_CLR                     (DM9K_RESET_PORT->RR  = DM9K_RESET_GPIO)

#define _dm9000_WriteRegAddr(reg)     (DM9000->Reg = reg)
#define _dm9000_whw(data)             (DM9000->Data = data)
#define _dm9000_wb(data)              (DM9000->Data = data)
#define _dm9000_rhw()                 (DM9000->Data)
#define _dm9000_rb()                  (DM9000->Data)

#if (DM9000_DEBUG == 1)
  #define DM9000_TRACE  printf
#else
  #define DM9000_TRACE(...)
#endif

#if (DM9000_MSG == 1)
  #define DM9000_TRACE2  printf
#else
  #define DM9000_TRACE2(...)
#endif

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  DM9000 init function.
  * @retval -1 or 0
  ***********************************************************************************************************/
s32 dm9000_init(DM9000_TypeDef *DM9000Info)
{
  int i, oft, lnk;
  unsigned int value;
  DM9000Info->uIOMode = DM9000_IO_8BIT;

  /* SRAM Tx/Rx pointer automatically return to start address                                               */
  /* Packet Transmitted, Packet Received                                                                    */
  DM9000Info->uIMR = IMR_PAR | IMR_PTM | IMR_PRM;

  _dm9000_Configuration();

  /* RESET device                                                                                           */
  dm9000_WriteReg(DM9000_NCR, 0x03);
  _dm9000_Delay_ms(1000);
  dm9000_WriteReg(DM9000_NCR, 0);

  /* RESET device                                                                                           */
  dm9000_WriteReg(DM9000_NCR, 0x03);
  _dm9000_Delay_ms(1000);
  dm9000_WriteReg(DM9000_NCR, 0);

  /* Activate DM9000                                                                                        */
  dm9000_WriteReg(DM9000_NSR, 0x2C);
  dm9000_WriteReg(DM9000_ISR, 0x3F);
  dm9000_WriteReg(DM9000_IMR, 0x81);

  /* identify DM9000                                                                                        */
  value  = dm9000_ReadReg(DM9000_VIDL);
  value |= dm9000_ReadReg(DM9000_VIDH) << 8;
  value |= dm9000_ReadReg(DM9000_PIDL) << 16;
  value |= dm9000_ReadReg(DM9000_PIDH) << 24;
  if (value == DM9000_ID)
  {
    DM9000_TRACE2("DM9000A id: 0x%x\r\n", value);
  }
  else
  {
    DM9000_TRACE2("DM9000A id invalid: 0x%X\r\n", value);
    return -1;
  }

  DM9000Info->uIOMode = (dm9000_ReadReg(DM9000_ISR) >> 7);

  if (DM9000Info->uIOMode == DM9000_IO_8BIT)
  {
    DM9000_TRACE2("IO 8 bits mode\r\n");
  }
  else
  {
    DM9000_TRACE2("IO 16 bits mode\r\n");
    AFIO_GPxConfig(GPIO_PC, AFIO_PIN_0 | AFIO_PIN_1 | AFIO_PIN_2 | AFIO_PIN_4 |
                   AFIO_PIN_5 | AFIO_PIN_6 | AFIO_PIN_7 | AFIO_PIN_8, AFIO_MODE_9);
  }

  dm9000_WriteReg(DM9000_GPCR, GPCR_GEP_CNTL);
  dm9000_WriteReg(DM9000_GPR, 0x00);

  _dm9000_Delay_ms(10000);

  /* Set PHY                                                                                                */
  phy_mode_set(DM9000Info->SpeedMode);

  /* set mac address                                                                                        */
  for (i = 0, oft = 0x10; i < 6; i++, oft++)
  {
    dm9000_WriteReg(oft, DM9000Info->uMACAddress[i]);
  }

  /* set multicast address                                                                                  */
  for (i = 0, oft = 0x16; i < 8; i++, oft++)
  {
    dm9000_WriteReg(oft, 0xff);
  }

  DM9000_TRACE2("DM9000 MAC: ");
  for (i = 0, oft = 0x10; i < 6; i++, oft++)
  {
    DM9000_TRACE2("%02X:", dm9000_ReadReg(oft));
  }
  DM9000_TRACE2("\r\n");

  /* Program operating register                                                                             */
  dm9000_WriteReg(DM9000_ISR,  0x3f);
  dm9000_WriteReg(DM9000_NSR,  0x2C);

  dm9000_WriteReg(DM9000_NCR,  0x00);

  dm9000_WriteReg(DM9000_RCR,  0x39);
  dm9000_WriteReg(DM9000_TCR,  0x00);
  dm9000_WriteReg(DM9000_BPTR, 0x3f);
  dm9000_WriteReg(DM9000_FCTR, 0x3A);
  dm9000_WriteReg(DM9000_FCR,  0xFF);
  dm9000_WriteReg(DM9000_SMCR, 0x00);
  //dm9000_WriteReg(DM9000_IMR, DM9000Info->uIMR);    /* Enable TX/RX interrupt mask                        */

  if (DM9000Info->SpeedMode == DM9000_AUTO)
  {
    while (!(phy_read(1) & 0x20))
    {
      /* autonegation complete bit                                                                          */
      _dm9000_Delay_ms(10);
      i++;
      if (i == 255)
      {
        DM9000_TRACE2("could not establish link\r\n");
        return -2;
      }
    }
  }

  /* see what we've got                                                                                     */
  lnk = phy_read(17) >> 12;
  DM9000_TRACE2("operating at ");
  switch (lnk)
  {
    case 1:
      DM9000_TRACE2("10M half duplex ");
      DM9000Info->CurrentSpeedMode = DM9000_10MHD;
      break;
    case 2:
      DM9000_TRACE2("10M full duplex ");
      DM9000Info->CurrentSpeedMode = DM9000_10MFD;
      break;
    case 4:
      DM9000_TRACE2("100M half duplex ");
      DM9000Info->CurrentSpeedMode = DM9000_100MHD;
      break;
    case 8:
      DM9000_TRACE2("100M full duplex ");
      DM9000Info->CurrentSpeedMode = DM9000_100MFD;
      break;
    default:
      DM9000_TRACE2("unknown: %d ", lnk);
      break;
  }
  DM9000_TRACE2("mode\r\n");

  return 0;
}

/*********************************************************************************************************//**
  * @brief  Close DM9000.
  * @retval Always 0
  ***********************************************************************************************************/
u32 dm9000_close(void)
{
  /* RESET device                                                                                           */
  phy_write(0, 0x8000);                 /* PHY RESET                                                        */
  dm9000_WriteReg(DM9000_GPR, 0x01);    /* Power-Down PHY                                                   */
  dm9000_WriteReg(DM9000_IMR, 0x80);    /* Disable all interrupt                                            */
  dm9000_WriteReg(DM9000_RCR, 0x00);    /* Disable RX                                                       */

  return 0;
}

/*********************************************************************************************************//**
  * @brief  Read Register data from DM9000.
  * @param  uReg: Register address
  * @retval None
  ***********************************************************************************************************/
u8 dm9000_ReadReg(u16 uReg)
{
  u8 uData;
  _dm9000_WriteRegAddr(uReg);
  uData = DM9000->Data;

  return uData;
}

/*********************************************************************************************************//**
  * @brief  Write Register data to DM9000.
  * @param  uReg: Register address
  * @param  uData: Data of register
  * @retval None
  ***********************************************************************************************************/
void dm9000_WriteReg(u16 uReg, u16 uData)
{
  _dm9000_WriteRegAddr(uReg);
  _dm9000_wb(uData);
}

/* Private functions ---------------------------------------------------------------------------------------*/

/*********************************************************************************************************//**
  * @brief  Hardware related configuration.
  * @retval None
  ***********************************************************************************************************/
static void _dm9000_Configuration(void)
{
  EXTI_InitTypeDef EXTI_InitStruct;
  EBI_InitTypeDef  EBI_InitStructure;

  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  DM9K_RESET_GPIO_CK       = 1;
  DM9K_INT_GPIO_CK         = 1;
  CKCUClock.Bit.EBI        = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Configure Data pin as EBI                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_14 | AFIO_PIN_15, AFIO_MODE_9);
  AFIO_GPxConfig(GPIO_PB, AFIO_PIN_0 | AFIO_PIN_1 | AFIO_PIN_2 | AFIO_PIN_3 | AFIO_PIN_4 | AFIO_PIN_5, AFIO_MODE_9);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Configure CS, CMD, IOW, IOR as EBI                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/
  AFIO_GPxConfig(DM9K_CS_ID, DM9K_CS_AFIO, DM9K_CS_AFMODE);
  AFIO_GPxConfig(DM9K_CMD_ID, DM9K_CMD_AFIO, DM9K_CMD_AFMODE);
  AFIO_GPxConfig(DM9K_WR_ID, DM9K_WR_AFIO, DM9K_WR_AFMODE);
  AFIO_GPxConfig(DM9K_RD_ID, DM9K_RD_AFIO, DM9K_RD_AFMODE);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Configure RESET as GPIO output High                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
  AFIO_GPxConfig(DM9K_RESET_ID, DM9K_RESET_AFIO, DM9K_RESET_AFMODE);
  GPIO_WriteOutBits(DM9K_RESET_PORT, DM9K_RESET_GPIO, SET);
  GPIO_DirectionConfig(DM9K_RESET_PORT, DM9K_RESET_GPIO, GPIO_DIR_OUT);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Reset DM9000 by Reset pin                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
  GPIO_WriteOutBits(DM9K_RESET_PORT, DM9K_RESET_GPIO, RESET);
  _dm9000_Delay_ms(1000);
  GPIO_WriteOutBits(DM9K_RESET_PORT, DM9K_RESET_GPIO, SET);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Config interrupt pin                                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
  AFIO_GPxConfig(DM9K_INT_ID, DM9K_INT_AFIO, AFIO_MODE_DEFAULT);
  GPIO_DirectionConfig(DM9K_INT_PORT, DM9K_INT_GPIO, GPIO_DIR_IN);
  GPIO_InputConfig(DM9K_INT_PORT, DM9K_INT_GPIO, ENABLE);
  AFIO_EXTISourceConfig(DM9K_EXTI_AFIOCH, DM9K_EXTI_AFIOPORT);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Configure EXTI for interrupt pin                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
  EXTI_InitStruct.EXTI_Channel     = DM9K_EXTI_CH;
  EXTI_InitStruct.EXTI_Debounce    = EXTI_DEBOUNCE_DISABLE;
  EXTI_InitStruct.EXTI_DebounceCnt = 0;
  EXTI_InitStruct.EXTI_IntType     = EXTI_NEGATIVE_EDGE;
  EXTI_Init(&EXTI_InitStruct);
  //EXTI_IntConfig(DM9K_EXTI_CH, ENABLE);
  //NVIC_EnableIRQ(DM9K_NVIC_IRQ);

  /*  EBI Configuration                                                                                     */
  EBI_InitStructure.EBI_Bank = EBI_BANK_1;
  EBI_InitStructure.EBI_Mode = EBI_MODE_D16;
  EBI_InitStructure.EBI_ByteLane = EBI_BYTELANE_DISABLE;
  EBI_InitStructure.EBI_IdleCycle = EBI_IDLECYCLE_ENABLE;
  EBI_InitStructure.EBI_AsynchronousReady = EBI_ASYNCHRONOUSREADY_DISABLE;
  EBI_InitStructure.EBI_ARDYTimeOut = EBI_ARDYTIMEOUT_DISABLE;
  EBI_InitStructure.EBI_ChipSelectPolarity = EBI_CHIPSELECTPOLARITY_LOW;
  EBI_InitStructure.EBI_AddressLatchPolarity = EBI_ADDRESSLATCHPOLARITY_LOW;
  EBI_InitStructure.EBI_WriteEnablePolarity = EBI_WRITEENABLEPOLARITY_LOW;
  EBI_InitStructure.EBI_ReadEnablePolarity = EBI_READENABLEPOLARITY_LOW;
  EBI_InitStructure.EBI_ByteLanePolarity = EBI_BYTELANEPOLARITY_LOW;
  EBI_InitStructure.EBI_ReadySignalPolarity = EBI_READYSIGNALPOLARITY_LOW;
  EBI_InitStructure.EBI_AddressSetupTime = 0;
  EBI_InitStructure.EBI_AddressHoldTime = 0;
  EBI_InitStructure.EBI_IdleCycleTime = 4;
  EBI_InitStructure.EBI_WriteSetupTime = 1;
  EBI_InitStructure.EBI_WriteStrobeTime = 2;
  EBI_InitStructure.EBI_WriteHoldTime = 1;
  EBI_InitStructure.EBI_ReadSetupTime = 1;
  EBI_InitStructure.EBI_ReadStrobeTime = 2;
  EBI_InitStructure.EBI_ReadHoldTime = 1;
  EBI_InitStructure.EBI_PageMode = EBI_PAGEMODE_DISABLE;
  EBI_InitStructure.EBI_PageLength = EBI_PAGELENGTH_4;
  EBI_InitStructure.EBI_PageHitMode = EBI_PAGEHITMODE_ADDINC;
  EBI_InitStructure.EBI_PageAccessTime = 0xF;
  EBI_InitStructure.EBI_PageOpenTime = 0xFF;
  EBI_Init(&EBI_InitStructure);

  EBI_Cmd(EBI_BANK_1, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  mS level delay function.
  * @param  uDelay: delay time based on ms.
  * @retval None
  ***********************************************************************************************************/
static void _dm9000_Delay_ms(u32 uDelay)
{
  vu32 i, j;
  for (i = 0; i < uDelay; i++ )
  {
    for (j = 0; j < 1141; j++);
  }
}

/*********************************************************************************************************//**
  * @brief  Read function of PHY.
  * @param  uReg: PHY register
  * @retval uData: Data of register
  ***********************************************************************************************************/
static u16 phy_read(u32 uReg)
{
  u16 uData;

  /* Fill the phyxcer register into REG_0C                                                                  */
  dm9000_WriteReg(DM9000_EPAR, DM9000_PHY | uReg);
  dm9000_WriteReg(DM9000_EPCR, 0xc);            /* Issue phyxcer read command                               */

  _dm9000_Delay_ms(300);                        /* Wait read complete                                       */
  //while (dm9000_ReadReg(DM9000_EPCR) & 0x01);

  dm9000_WriteReg(DM9000_EPCR, 0x0);            /* Clear phyxcer read command                               */
  uData = (dm9000_ReadReg(DM9000_EPDRH) << 8) | dm9000_ReadReg(DM9000_EPDRL);

  return uData;
}

/*******************************************************************************
* Function Name  : phy_write
* Description    : Write a word to phyxcer
* Input          : - reg: reg
*                  - value: data
* Output         : None
* Return         : None
* Attention         : None
*******************************************************************************/
static void phy_write(uint16_t reg, uint16_t value)
{
  /* Fill the phyxcer register into REG_0C                                                                  */
  dm9000_WriteReg(DM9000_EPAR, DM9000_PHY | reg);

  /* Fill the written data into REG_0D & REG_0E                                                             */
  dm9000_WriteReg(DM9000_EPDRL, (value & 0xff));
  dm9000_WriteReg(DM9000_EPDRH, ((value >> 8) & 0xff));
  dm9000_WriteReg(DM9000_EPCR, 0xa);    /* Issue phyxcer write command                                      */

  while (dm9000_ReadReg(DM9000_EPCR) & 0x01);

  dm9000_WriteReg(DM9000_EPCR, 0x0);    /* Clear phyxcer write command                                      */
}

/*********************************************************************************************************//**
 * @brief Set PHY mode.
 * @param uMediaMode: Media mode.
     This parameter can be any combination of the following values:
       @arg DM9000_AUTO: Auto negotiation
       @arg DM9000_10MHD: 10 MHz, Half duplex
       @arg DM9000_10MFD: 10 MHz, Full duplex
       @arg DM9000_100MHD: 100 MHz, Half duplex
       @arg DM9000_100MFD: 100 MHz, Full duplex
 * @retval None
 ************************************************************************************************************/
static void phy_mode_set(u32 uMediaMode)
{
  uint16_t phy_reg4 = 0x01e1, phy_reg0 = 0x1000;
  if (!(uMediaMode & DM9000_AUTO) )
  {
    switch (uMediaMode)
    {
      case DM9000_10MHD:
      {
        phy_reg4 = 0x21;
        phy_reg0 = 0x0000;
        break;
      }
      case DM9000_10MFD:
      {
        phy_reg4 = 0x41;
        phy_reg0 = 0x1100;
        break;
      }
      case DM9000_100MHD:
      {
        phy_reg4 = 0x81;
        phy_reg0 = 0x2000;
        break;
      }
      case DM9000_100MFD:
      {
        phy_reg4 = 0x101;
        phy_reg0 = 0x3100;
        break;
      }
    }
    phy_write(4, phy_reg4);             /* Set PHY media mode                                               */
    phy_write(0, phy_reg0);             /* Tmp                                                              */
  }
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
