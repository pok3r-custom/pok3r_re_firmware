/*********************************************************************
*               (c) SEGGER Microcontroller GmbH & Co. KG             *
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

#define ONCHIP     (1)             // On-chip Flash Memory

#define MAX_NUM_SECTORS (512)      // Max. number of sectors, must not be modified.
#define ALGO_VERSION    (0x0101)   // Algo version, must not be modified.

struct SECTOR_INFO  {
  U32 SectorSize;       // Sector Size in bytes
  U32 SectorStartAddr;  // Start address of the sector area (relative to the "BaseAddr" of the flash)
};

struct FlashDevice  {
   U16 AlgoVer;       // Algo version number
   U8  Name[128];     // Flash device name
   U16 Type;          // Flash device type
   U32 BaseAddr;      // Flash base address
   U32 TotalSize;     // Total flash device size in Bytes (256 KB)
   U32 PageSize;      // Page Size (number of bytes that will be passed to ProgramPage(). MinAlig is 8 byte
   U32 Reserved;      // Reserved, should be 0
   U8  ErasedVal;     // Flash erased value
   U32 TimeoutProg;   // Program page timeout in ms
   U32 TimeoutErase;  // Erase sector timeout in ms
   struct SECTOR_INFO SectorInfo[MAX_NUM_SECTORS]; // Flash sector layout definition
};

//
// Flash module functions
//
extern int Init        (U32 Addr, U32 Freq, U32 Func);
extern int UnInit      (U32 Func);
extern int BlankCheck  (U32 Addr, U32 NumBytes, U8 BlankData);
extern int EraseChip   (void);
extern int EraseSector (U32 Addr);
extern int ProgramPage (U32 Addr, U32 NumBytes, U8 *pSrcBuff);
extern U32 Verify      (U32 Addr, U32 NumBytes, U8 *pSrcBuff);

//
// SEGGER defined functions
//
extern int SEGGER_OPEN_Read (U32 Addr, U32 NumBytes, U8 *pDestBuff);