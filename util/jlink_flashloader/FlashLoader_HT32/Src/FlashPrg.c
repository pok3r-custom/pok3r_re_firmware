/*********************************************************************
*               (c) SEGGER Microcontroller GmbH & Co. KG             *
*                        The Embedded Experts                        *
*                           www.segger.com                           *
**********************************************************************
----------------------------------------------------------------------
File    : FlashPrg.c
Purpose : Implementation of RAMCode template
--------  END-OF-HEADER  ---------------------------------------------
*/
#include "FlashOS.h"

/*********************************************************************
*
*       Defines (configurable)
*
**********************************************************************
*/
#define PAGE_SIZE_SHIFT          (2)      // The smallest program unit (one page) is 4 byte in size
//
// Some flash types require a native verify function as the memory is not memory mapped available (e.g. eMMC flashes).
// If the verify function is implemented in the algorithm, it will be used by the J-Link DLL during compare / verify
// independent of what verify type is configured in the J-Link DLL.
// Please note, that SEGGER does not recommend to use this function if the flash can be memory mapped read
// as this may can slow-down the compare / verify step.
//
#define SUPPORT_NATIVE_VERIFY    (0)
#define SUPPORT_NATIVE_READ_BACK (0)
#define SUPPORT_BLANK_CHECK      (0)


#define FMC_BASE 0x40080000UL
static const U32 FMC_TADR_A = FMC_BASE + 0x00;
static const U32 FMC_WRDR_A = FMC_BASE + 0x04;
static const U32 FMC_OCMR_A = FMC_BASE + 0x0C;
static const U32 FMC_OPCR_A = FMC_BASE + 0x10;

#define FMC_TADR *((volatile U32 *)FMC_TADR_A)
#define FMC_WRDR *((volatile U32 *)FMC_WRDR_A)
#define FMC_OCMR *((volatile U32 *)FMC_OCMR_A)
#define FMC_OPCR *((volatile U32 *)FMC_OPCR_A)

static const U32 FMC_OCMR_CMD_IL = 0x0;
static const U32 FMC_OCMR_CMD_WP = 0x4;
static const U32 FMC_OCMR_CMD_PE = 0x8;
static const U32 FMC_OCMR_CMD_ME = 0xA;

#define FMC_OPCR_OPM_MASK (0xF << 1)
static const U32 FMC_OPCR_OPM_IL = (0x6 << 1);
static const U32 FMC_OPCR_OPM_CM = (0xA << 1);
static const U32 FMC_OPCR_OPM_FN = (0xE << 1);

#define CKCU_MCUDBGCR *((volatile U32 *)0x40088304UL)

#define WDT_CR *((volatile U32 *)0x40068000UL)
static const U32 WDT_RELOAD = 0x5fa00001UL;

/*********************************************************************
*
*       Types
*
**********************************************************************
*/

/*********************************************************************
*
*       Static data
*
**********************************************************************
*/
//
// We use this dummy variable to make sure that the PrgData
// section is present in the output elf-file as this section
// is mandatory in current versions of the J-Link DLL 
//
static volatile int _Dummy;

/*********************************************************************
*
*       Static code
*
**********************************************************************
*/

/*********************************************************************
*
*       _FeedWatchdog
*
*  Function description
*    Feeds the watchdog. Needs to be called during RAMCode execution
*    in case of an watchdog is active.
*/
static void _FeedWatchdog(void) {
  //WDT_CR = WDT_RELOAD;
}

/*********************************************************************
*
*       Public code
*
**********************************************************************
*/

/*********************************************************************
*
*       Init
*
*  Function description
*    Handles the initialization of the flash module.
*
*  Parameters
*    Addr: Flash base address
*    Freq: Clock frequency in Hz
*    Func: Caller type (e.g.: 1 - Erase, 2 - Program, 3 - Verify)
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int Init(U32 Addr, U32 Freq, U32 Func) {
  (void)Addr;
  (void)Freq;
  (void)Func;
  //
  // Init code
  //
  //CKCU_MCUDBGCR |= (1 << 3);
  _FeedWatchdog();
  return 0;
}

/*********************************************************************
*
*       UnInit
*
*  Function description
*    Handles the de-initialization of the flash module.
*
*  Parameters
*    Func: Caller type (e.g.: 1 - Erase, 2 - Program, 3 - Verify)
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int UnInit(U32 Func) {
  (void)Func;
  //
  // Uninit code
  //
  //*(volatile U32*)(0x1234) = Func; // Dummy 
  return 0;
}

/*********************************************************************
*
*       EraseSector
*
*  Function description
*    Erases one flash sector.
*
*  Parameters
*    Addr: Address of the sector to be erased
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int EraseSector(U32 SectorAddr) {
  //
  // Erase sector code
  //

  FMC_TADR = SectorAddr;
  FMC_OCMR = FMC_OCMR_CMD_PE;
  FMC_OPCR = FMC_OPCR_OPM_CM;

  while((FMC_OPCR & FMC_OPCR_OPM_MASK) != FMC_OPCR_OPM_FN){
    _FeedWatchdog();
  }

  return 0;
}

/*********************************************************************
*
*       ProgramPage
*
*  Function description
*    Programs one flash page.
*
*  Parameters
*    DestAddr: Destination address
*    NumBytes: Number of bytes to be programmed (always a multiple of program page size, defined in FlashDev.c)
*    pSrcBuff: Point to the source buffer
*
*  Return value 
*    0 O.K.
*    1 Error
*/
int ProgramPage(U32 DestAddr, U32 NumBytes, U8 *pSrcBuff) {
  volatile U8 * pSrc;
  volatile U8 * pDest;
  U8 AccessWidth;
  U32 Status;
  U32 NumPages;
  U32 NumBytesAtOnce;
  int r;

  r           = -1;
  pSrc        = (volatile U8*)pSrcBuff;
  pDest       = (volatile U8*)DestAddr;
  //
  // RAMCode is able to program multiple pages
  //
  NumPages    = NumBytes >> PAGE_SIZE_SHIFT;
  //
  // Program page-wise
  //
  if (NumPages) {
    r = 0;
    do {
      NumBytesAtOnce = (1 << PAGE_SIZE_SHIFT);
      _FeedWatchdog();
      //
      // Program one page
      //
      FMC_TADR = (U32)pDest;
      FMC_WRDR = (U32)(*(volatile U32 *)pSrc);
      FMC_OCMR = FMC_OCMR_CMD_WP;
      FMC_OPCR = FMC_OPCR_OPM_CM;

      while((FMC_OPCR & FMC_OPCR_OPM_MASK) != FMC_OPCR_OPM_FN){
        _FeedWatchdog();
      }

      pSrc = pSrc + 4;
      pDest = pDest + 4;
    } while (--NumPages);
  }

  return r;
}

/*********************************************************************
*
*       Verify
*
*  Function description
*    Compares a specified number of bytes of a provided data
*    buffer with the content of the device
*
*  Parameters
*    Addr: Start address in memory which should be compared
*    NumBytes: Number of bytes to be compared
*    pBuff: Pointer to the data to be compared
*
*  Return value 
*    == (Addr + NumBytes): O.K.
*    != (Addr + NumBytes): *not* O.K.
*
*/
#if SUPPORT_NATIVE_VERIFY
U32 Verify(U32 Addr, U32 NumBytes, U8 *pBuff) {
  unsigned char *pFlash;
  unsigned long r;

  pFlash = (unsigned char *)Addr;
  r = Addr + NumBytes;
  do {
      if (*pFlash != *pBuff) {
        r = (unsigned long)pFlash;
        break;
      }
      pFlash++;
      pBuff++;
  } while (--NumBytes);
  return r;
}
#endif

/*********************************************************************
*
*       BlankCheck
*
*  Function description
*    Checks if a memory region is blank
*
*  Parameters
*    Addr: Blank check start address
*    NumBytes: Number of bytes to be checked
*    BlankData: Pointer to the destination data
*
*  Return value 
*    0 O.K., blank
*    1 O.K., *not* blank
*    <  0 Error
*
*/
#if SUPPORT_BLANK_CHECK
int BlankCheck(U32 Addr, U32 NumBytes, U8 BlankData) {
  U8* pData;
  
  pData = (U8 *)Addr;
  do {
    if (*pData++ != BlankData) {
      return 1;
    }
  } while (--NumBytes);
  return 0;
}
#endif

/*********************************************************************
*
*       SEGGER_OPEN_Read
*
*  Function description
*    Reads a specified number of bytes into the provided buffer
*
*  Parameters
*    Addr: Start read address
*    NumBytes: Number of bytes to be read
*    pBuff: Pointer to the destination data
*
*  Return value 
*    >= 0 O.K., NumBytes read
*    <  0 Error
*
*/
#if SUPPORT_NATIVE_READ_BACK
int SEGGER_OPEN_Read(U32 Addr, U32 NumBytes, U8 *pDestBuff) {
  //
  // Read function
  // Add your code here...
  //
  return NumBytes;
}
#endif
