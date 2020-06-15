/*********************************************************************************************************//**
 * @file    IAP/IAP_Text_RAM/Src_IAP/iap_xmodem.c
 * @version $Rev:: 763          $
 * @date    $Date:: 2017-08-29 #$
 * @brief   This file contains xmodem transmission protocol.
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
#include "iap_xmodem.h"
#include "iap_buffer.h"
#include "iap_crc16.h"
#include "iap_handler.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup Text_mode_RAM Text mode(execute on RAM)
  * @{
  */

/** @addtogroup Text_mode_RAM_IAP IAP
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------*/
/* Increase XMODEM_ACK_CNT to speed up, but may cause transfer error on USB to UART cable.                  */
/*----------------------------------------------------------------------------------------------------------*/
#define XMODEM_ACK_CNT                  (40)

/* Private constants ---------------------------------------------------------------------------------------*/
#define SOH                             (0x1)
#define EOT                             (0x4)
#define ACK                             (0x6)
#define NAK                             (0x15)
#define CANCEL                          (0x18)
#define XMODEM_C_DELAY                  (0xFFFFF)

/* Private macro -------------------------------------------------------------------------------------------*/
#define WriteByte                       SERIAL_PutChar

/* Private function prototypes -----------------------------------------------------------------------------*/
static void xmodem_stop(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  The Xmodem transmission function.
  * @param  bptr: Buffer address for save data
  * @param  address: Program/compare start address
  * @param  mode: Program/compare mode
  *         @arg PROGRAM_MODE:  Program the received data into the main Flash
  *         @arg COMPARE_MODE:  Compare the received data with the main Flash
  * @retval X_SSUCCESS: The transmission is successful
  * @retval X_SUSERCANCEL: Received CANCEL (0x18) command from Host
  * @retval X_SPACKET_NUM_ERROR: Packet number is not correct
  * @retval X_CRC_ERROR: CRC error
  * @retval X_VERIFY_ERROR: Compare error
  ***********************************************************************************************************/
u32 xmodem(u8 *bptr, u32 address, u32 mode)
{
  u32 i = 0;
  #if (USING_CRC == 1)
  u16 crcWord;
  #endif
  u8 packetNo = 1;
  u32 startPacket = 1;

  while (1)
  {
    if (!IS_BUFFER_EMPTY())
    {
      bptr[1] = ReadBuffer();

      if (bptr[1] == SOH)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /*  bptr[0]: Reserved (Let Data word aligned)                                                       */
        /*  bptr[1]: Start of frame (SOH)                                                                   */
        /*  bptr[2]: Packet number                                                                          */
        /*  bptr[3]: Complement of packet number                                                            */
        /*  bptr[4~131]: Data                                                                               */
        /*  bptr[132~133]: CRC16                                                                            */
        /*--------------------------------------------------------------------------------------------------*/
        for (i = 2; i < 134; i++)
        {
          bptr[i] = ReadBuffer();
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Discard repeat package silently                                                                  */
        /*--------------------------------------------------------------------------------------------------*/
        if ((bptr[2] == packetNo - 1) && (bptr[2] + bptr[3] == 0xFF))
        {
          continue;
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Check packet number                                                                              */
        /*--------------------------------------------------------------------------------------------------*/
        if ((bptr[2] != packetNo) || (bptr[2] + bptr[3] != 0xFF))
        {
          xmodem_stop();
          return X_SPACKET_NUM_ERROR;
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Check CRC value of Xmodem packet                                                                 */
        /*--------------------------------------------------------------------------------------------------*/
        #if (USING_CRC == 1)
        crcWord = (bptr[132] << 8) | bptr[133];
        if (crcWord != CRC16(0, (u8 *)(&(bptr[4])), 128))
        {
          xmodem_stop();
          return X_CRC_ERROR;
        }
        #endif

        /*--------------------------------------------------------------------------------------------------*/
        /* Send numerous ACK after first packet to speed up Xmodem                                          */
        /*--------------------------------------------------------------------------------------------------*/
        if (startPacket)
        {
          for (i = 0; i < XMODEM_ACK_CNT; i++)
          {
            WriteByte(ACK);
          }
          startPacket = 0;            /* Stop 'C' sending                                                   */
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Send back ACK to start next packet                                                               */
        /*--------------------------------------------------------------------------------------------------*/
        WriteByte(ACK);
        packetNo++;

        if (mode == XMODEM_PROGRAM)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Start Flash programming                                                                        */
          /*------------------------------------------------------------------------------------------------*/
          for (i = 4; i < 132; i += 4)
          {
            if (address >= IAP_APFLASH_END)
            {
              xmodem_stop();
              return X_OVER_RANGE;
            }
            if (*(u32 *)(bptr + i) != 0xFFFFFFFF)
            {
              FLASH_State Result;
              Result = FLASH_ProgramWordData(address, *(u32 *)(bptr + i));
              if(Result != FLASH_COMPLETE)
              {
                xmodem_stop();
                return X_PROGRAM_ERROR;
              }
            }
            address += 4;
          }
        }
        else
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Start Flash verification                                                                       */
          /*------------------------------------------------------------------------------------------------*/
          for (i = 4; i < 132; i += 4)
          {
            if (*(u32 *)(bptr + i) != rw(address))
            {
              xmodem_stop();
              return X_VERIFY_ERROR;
            }
            address += 4;
          }
        }
      }
      else if (bptr[1] == EOT)            /* Transmission is finished                                       */
      {
        WriteByte(ACK);
        break;
      }
      else if (bptr[1] == CANCEL)         /* User cancel the transmission                                   */
      {
        return X_SUSERCANCEL;
      }
    }
    else
    {
      if (startPacket)
      {
        if ((i & XMODEM_C_DELAY) == 0)
        {
          WriteByte('C');
        }
        i++;
      }
    }
  }

  return X_SSUCCESS;
}

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  This function is used to stop Xmodem transmission.
  * @retval None
  ***********************************************************************************************************/
static void xmodem_stop(void)
{
  u32 i;
  for (i = 3; i != 0; i--)
  {
    WriteByte(CANCEL);
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

/**
  * @}
  */
