/*********************************************************************
*            (c) 1995 - 2018 SEGGER Microcontroller GmbH             *
*                        The Embedded Experts                        *
*                           www.segger.com                           *
**********************************************************************
*/

#define U8  unsigned char
#define U16 unsigned short
#define U32 unsigned long

#define I8  signed char
#define I16 signed short
#define I32 signed long

struct SEGGER_OPEN_CMD_INFO;  // Forward declaration of OFL lib private struct

typedef struct {
  //
  // Optional functions may be be NULL
  //
  void (*pfFeedWatchdog)   (void);                                            // Optional
  int  (*pfInit)           (U32 Addr, U32 Freq, U32 Func);                    // Mandatory
  int  (*pfUnInit)         (U32 Func);                                        // Mandatory
  int  (*pfEraseSector)    (U32 Addr);                                        // Mandatory
  int  (*pfProgramPage)    (U32 Addr, U32 NumBytes, U8 *pSrcBuff);            // Mandatory
  int  (*pfBlankCheck)     (U32 Addr, U32 NumBytes, U8 BlankData);            // Optional
  int  (*pfEraseChip)      (void);                                            // Optional
  U32  (*pfVerify)         (U32 Addr, U32 NumBytes, U8 *pSrcBuff);            // Optional
  U32  (*pfSEGGERCalcCRC)  (U32 CRC, U32 Addr, U32 NumBytes, U32 Polynom);    // Optional
  int  (*pfSEGGERRead)     (U32 Addr, U32 NumBytes, U8 *pDestBuff);           // Optional
  int  (*pfSEGGERProgram)  (U32 DestAddr, U32 NumBytes, U8 *pSrcBuff);        // Optional
  int  (*pfSEGGERErase)    (U32 SectorAddr, U32 SectorIndex, U32 NumSectors); // Optional
  void (*pfSEGGERStart)    (volatile struct SEGGER_OPEN_CMD_INFO* pInfo);     // Optional
} SEGGER_OFL_API;

//
// Keil / CMSIS API
//
int  Init                 (U32 Addr, U32 Freq, U32 Func);                    // Mandatory
int  UnInit               (U32 Func);                                        // Mandatory
int  EraseSector          (U32 Addr);                                        // Mandatory
int  ProgramPage          (U32 Addr, U32 NumBytes, U8 *pSrcBuff);            // Mandatory
int  BlankCheck           (U32 Addr, U32 NumBytes, U8 BlankData);            // Optional
int  EraseChip            (void);                                            // Optional
U32  Verify               (U32 Addr, U32 NumBytes, U8 *pSrcBuff);            // Optional
//
// SEGGER extensions
//
U32  SEGGER_OPEN_CalcCRC  (U32 CRC, U32 Addr, U32 NumBytes, U32 Polynom);    // Optional
int  SEGGER_OPEN_Read     (U32 Addr, U32 NumBytes, U8 *pDestBuff);           // Optional
int  SEGGER_OPEN_Program  (U32 DestAddr, U32 NumBytes, U8 *pSrcBuff);        // Optional
int  SEGGER_OPEN_Erase    (U32 SectorAddr, U32 SectorIndex, U32 NumSectors); // Optional
void SEGGER_OPEN_Start    (volatile struct SEGGER_OPEN_CMD_INFO* pInfo);     // Optional
//
// SEGGER OFL lib helper functions that may be called by specific algo part
//
U32  SEGGER_OFL_Lib_CalcCRC     (const SEGGER_OFL_API* pAPI, U32 CRC, U32 Addr, U32 NumBytes, U32 Polynom);
void SEGGER_OFL_Lib_StartTurbo  (const SEGGER_OFL_API* pAPI, volatile struct SEGGER_OPEN_CMD_INFO* pInfo);

/**************************** End of file ***************************/
