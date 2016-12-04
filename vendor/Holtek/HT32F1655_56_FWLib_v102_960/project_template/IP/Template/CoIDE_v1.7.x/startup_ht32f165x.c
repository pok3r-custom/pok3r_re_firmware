/*********************************************************************************************************//**
 * @file    startup_ht32f165x.c
 * @version $Rev:: 863          $
 * @date    $Date:: 2015-04-06 #$
 * @brief   HT32F165x Devices Startup code.
 *************************************************************************************************************
 *
 * <h2><center>Copyright (C) 2014 Holtek. All rights reserved</center></h2>
 *
 ************************************************************************************************************/

/*----------Stack Configuration-----------------------------------------------------------------------------*/
#define STACK_SIZE       0x00000100      /*!< Stack size (in Words)                                         */
__attribute__ ((section(".co_stack")))
unsigned long pulStack[STACK_SIZE];

/*----------Macro definition--------------------------------------------------------------------------------*/
#define WEAK __attribute__ ((weak))


/*----------Declaration of the default fault handlers-------------------------------------------------------*/
/* System exception vector handler                                                                          */
void WEAK  Reset_Handler(void);
void WEAK  NMI_Handler(void);
void WEAK  HardFault_Handler(void);
void WEAK  MemManage_Handler(void);
void WEAK  BusFault_Handler(void);
void WEAK  UsageFault_Handler(void);
void WEAK  SVC_Handler(void);
void WEAK  DebugMon_Handler(void);
void WEAK  PendSV_Handler(void);
void WEAK  SysTick_Handler(void);

void WEAK  CKRDY_IRQHandler(void);
void WEAK  LVD_IRQHandler(void);
void WEAK  BOD_IRQHandler(void);
void WEAK  WDT_IRQHandler(void);
void WEAK  RTC_IRQHandler(void);
void WEAK  FLASH_IRQHandler(void);
void WEAK  EVWUP_IRQHandler(void);
void WEAK  LPWUP_IRQHandler(void);
void WEAK  EXTI0_IRQHandler(void);
void WEAK  EXTI1_IRQHandler(void);
void WEAK  EXTI2_IRQHandler(void);
void WEAK  EXTI3_IRQHandler(void);
void WEAK  EXTI4_IRQHandler(void);
void WEAK  EXTI5_IRQHandler(void);
void WEAK  EXTI6_IRQHandler(void);
void WEAK  EXTI7_IRQHandler(void);
void WEAK  EXTI8_IRQHandler(void);
void WEAK  EXTI9_IRQHandler(void);
void WEAK  EXTI10_IRQHandler(void);
void WEAK  EXTI11_IRQHandler(void);
void WEAK  EXTI12_IRQHandler(void);
void WEAK  EXTI13_IRQHandler(void);
void WEAK  EXTI14_IRQHandler(void);
void WEAK  EXTI15_IRQHandler(void);
void WEAK  COMP_IRQHandler(void);
void WEAK  ADC_IRQHandler(void);
void WEAK  MCTM0BRK_IRQHandler(void);
void WEAK  MCTM0UP_IRQHandler(void);
void WEAK  MCTM0TR_IRQHandler(void);
void WEAK  MCTM0CC_IRQHandler(void);
void WEAK  MCTM1BRK_IRQHandler(void);
void WEAK  MCTM1UP_IRQHandler(void);
void WEAK  MCTM1TR_IRQHandler(void);
void WEAK  MCTM1CC_IRQHandler(void);
void WEAK  GPTM0_IRQHandler(void);
void WEAK  GPTM1_IRQHandler(void);
void WEAK  BFTM0_IRQHandler(void);
void WEAK  BFTM1_IRQHandler(void);
void WEAK  I2C0_IRQHandler(void);
void WEAK  I2C1_IRQHandler(void);
void WEAK  SPI0_IRQHandler(void);
void WEAK  SPI1_IRQHandler(void);
void WEAK  USART0_IRQHandler(void);
void WEAK  USART1_IRQHandler(void);
void WEAK  UART0_IRQHandler(void);
void WEAK  UART1_IRQHandler(void);
void WEAK  SCI_IRQHandler(void);
void WEAK  I2S_IRQHandler(void);
void WEAK  USB_IRQHandler(void);
void WEAK  PDMA_CH0_IRQHandler(void);
void WEAK  PDMA_CH1_IRQHandler(void);
void WEAK  PDMA_CH2_IRQHandler(void);
void WEAK  PDMA_CH3_IRQHandler(void);
void WEAK  PDMA_CH4_IRQHandler(void);
void WEAK  PDMA_CH5_IRQHandler(void);
void WEAK  PDMA_CH6_IRQHandler(void);
void WEAK  PDMA_CH7_IRQHandler(void);
void WEAK  EBI_IRQHandler(void);

/*----------Symbols defined in linker script----------------------------------------------------------------*/
extern unsigned long _sidata;    /*!< Start address for the initialization values of the .data section.     */
extern unsigned long _sdata;     /*!< Start address for the .data section                                   */
extern unsigned long _edata;     /*!< End address for the .data section                                     */
extern unsigned long _sbss;      /*!< Start address for the .bss section                                    */
extern unsigned long _ebss;      /*!< End address for the .bss section                                      */
extern void _eram;               /*!< End address for ram                                                   */


/*----------Function prototypes-----------------------------------------------------------------------------*/
extern int main(void);              /*!< The entry point for the application.                               */
extern void SystemInit(void);       /*!< Setup the microcontroller system(CMSIS)                            */
void Default_Reset_Handler(void);   /*!< Default reset handler                                              */
static void Default_Handler(void);  /*!< Default exception handler                                          */


/**
  *@brief The minimal vector table for a Cortex M3. Note that the proper constructs
  *       must be placed on this to ensure that it ends up at physical address
  *       0x00000000.
  */
__attribute__ ((section(".isr_vector")))
void (* const g_pfnVectors[])(void) =
{
  /*----------Core Exceptions------------------------------------------------ ------------------------------*/
  (void *)&pulStack[STACK_SIZE-1],  /*!< The initial stack pointer                                          */
  Reset_Handler,                    /*!< Reset Handler                                                      */
  NMI_Handler,                      /*!< NMI Handler                                                        */
  HardFault_Handler,                /*!< Hard Fault Handler                                                 */
  MemManage_Handler,                /*!< MPU Fault Handler                                                  */
  BusFault_Handler,                 /*!< Bus Fault Handler                                                  */
  UsageFault_Handler,               /*!< Usage Fault Handler                                                */
  0,                                /*!< Reserved                                                           */
  0,                                /*!< Reserved                                                           */
  0,                                /*!< Reserved                                                           */
  0,                                /*!< Reserved                                                           */
  SVC_Handler,                      /*!< SVCall Handler                                                     */
  DebugMon_Handler,                 /*!< Debug Monitor Handler                                              */
  0,                                /*!< Reserved                                                           */
  PendSV_Handler,                   /*!< PendSV Handler                                                     */
  SysTick_Handler,                  /*!< SysTick Handler                                                    */

  /*----------External Exceptions---------------------------------------------------------------------------*/
  CKRDY_IRQHandler,                 /*!<  0: Clock Ready                                                    */
  LVD_IRQHandler,                   /*!<  1: Lovel Voltage Detect                                           */
  BOD_IRQHandler,                   /*!<  2: Brown Out Detector                                             */
  WDT_IRQHandler,                   /*!<  3: WatchDog Timer                                                 */
  RTC_IRQHandler,                   /*!<  4: Real Time Clock                                                */
  FLASH_IRQHandler,                 /*!<  5: Flash                                                          */
  EVWUP_IRQHandler,                 /*!<  6: EXTI Event wakeup                                              */
  LPWUP_IRQHandler,                 /*!<  7: WAKEUP pin                                                     */
  EXTI0_IRQHandler,                 /*!<  8: External Interrupt 0                                           */
  EXTI1_IRQHandler,                 /*!<  9: External Interrupt 1                                           */
  EXTI2_IRQHandler,                 /*!< 10: External Interrupt 2                                           */
  EXTI3_IRQHandler,                 /*!< 11: External Interrupt 3                                           */
  EXTI4_IRQHandler,                 /*!< 12: External Interrupt 4                                           */
  EXTI5_IRQHandler,                 /*!< 13: External Interrupt 5                                           */
  EXTI6_IRQHandler,                 /*!< 14: External Interrupt 6                                           */
  EXTI7_IRQHandler,                 /*!< 15: External Interrupt 7                                           */
  EXTI8_IRQHandler,                 /*!< 16: External Interrupt 8                                           */
  EXTI9_IRQHandler,                 /*!< 17: External Interrupt 9                                           */
  EXTI10_IRQHandler,                /*!< 18: External Interrupt 10                                          */
  EXTI11_IRQHandler,                /*!< 19: External Interrupt 11                                          */
  EXTI12_IRQHandler,                /*!< 20: External Interrupt 12                                          */
  EXTI13_IRQHandler,                /*!< 21: External Interrupt 13                                          */
  EXTI14_IRQHandler,                /*!< 22: External Interrupt 14                                          */
  EXTI15_IRQHandler,                /*!< 23: External Interrupt 15                                          */
  COMP_IRQHandler,                  /*!< 24: Comparator                                                     */
  ADC_IRQHandler,                   /*!< 25: Analog to Digital Converter                                    */
  0,                                /*!< 26: Reserved                                                       */
  MCTM0BRK_IRQHandler,              /*!< 27: Motor Timer Break                                              */
  MCTM0UP_IRQHandler,               /*!< 28: Motor Timer Update                                             */
  MCTM0TR_IRQHandler,               /*!< 29: Motor Timer Trigger                                            */
  MCTM0CC_IRQHandler,               /*!< 30: Motor Timer Capture/Compare                                    */
  MCTM1BRK_IRQHandler,              /*!< 31: Motor Timer Break                                              */
  MCTM1UP_IRQHandler,               /*!< 32: Motor Timer Update                                             */
  MCTM1TR_IRQHandler,               /*!< 33: Motor Timer Trigger                                            */
  MCTM1CC_IRQHandler,               /*!< 34: Motor Timer Capture/Compare                                    */
  GPTM0_IRQHandler,                 /*!< 35: General-Purpose Timer0                                         */
  GPTM1_IRQHandler,                 /*!< 36: General-Purpose Timer1                                         */
  0,                                /*!< 37: Reserved                                                       */
  0,                                /*!< 38: Reserved                                                       */
  0,                                /*!< 39: Reserved                                                       */
  0,                                /*!< 40: Reserved                                                       */
  BFTM0_IRQHandler,                 /*!< 41: Basic Function Timer0                                          */
  BFTM1_IRQHandler,                 /*!< 42: Basic Function Timer1                                          */
  I2C0_IRQHandler,                  /*!< 43: I2C0                                                           */
  I2C1_IRQHandler,                  /*!< 44: I2C1                                                           */
  SPI0_IRQHandler,                  /*!< 45: SPI0                                                           */
  SPI1_IRQHandler,                  /*!< 46: SPI1                                                           */
  USART0_IRQHandler,                /*!< 47: USART0                                                         */
  USART1_IRQHandler,                /*!< 48: USART1                                                         */
  UART0_IRQHandler,                 /*!< 49: UART0                                                          */
  UART1_IRQHandler,                 /*!< 50: UART1                                                          */
  SCI_IRQHandler,                   /*!< 51: Smart Card Interface                                           */
  I2S_IRQHandler,                   /*!< 52: I2S                                                            */
  USB_IRQHandler,                   /*!< 53: USB                                                            */
  0,                                /*!< 54: Reserved                                                       */
  PDMA_CH0_IRQHandler,              /*!< 51: PDMA Channel 0                                                 */
  PDMA_CH1_IRQHandler,              /*!< 52: PDMA Channel 1                                                 */
  PDMA_CH2_IRQHandler,              /*!< 53: PDMA Channel 2                                                 */
  PDMA_CH3_IRQHandler,              /*!< 54: PDMA Channel 3                                                 */
  PDMA_CH4_IRQHandler,              /*!< 55: PDMA Channel 4                                                 */
  PDMA_CH5_IRQHandler,              /*!< 56: PDMA Channel 5                                                 */
  PDMA_CH6_IRQHandler,              /*!< 57: PDMA Channel 6                                                 */
  PDMA_CH7_IRQHandler,              /*!< 58: PDMA Channel 7                                                 */
  0,                                /*!< 59: Reserved                                                       */
  0,                                /*!< 60: Reserved                                                       */
  0,                                /*!< 61: Reserved                                                       */
  0,                                /*!< 59-62: Reserved                                                    */
  EBI_IRQHandler,                   /*!< 63: CMOS Sensor Interface                                          */
};



/**
  * @brief  This is the code that gets called when the processor first
  *         starts execution following a reset event. Only the absolutely
  *         necessary set is performed, after which the application
  *         supplied main() routine is called.
  * @retval None
  */
void Default_Reset_Handler(void)
{
  /* Initialize data and bss                                                                                */
  unsigned long *pulSrc, *pulDest;

  /* Copy the data segment initializers from flash to SRAM                                                  */
  pulSrc = &_sidata;

  for (pulDest = &_sdata; pulDest < &_edata; )
  {
    *(pulDest++) = *(pulSrc++);
  }

  /* Zero fill the bss segment.  This is done with inline assembly since this
     will clear the value of pulDest if it is not kept in a register. */
  __asm("  ldr     r0, =_sbss\n"
        "  ldr     r1, =_ebss\n"
        "  mov     r2, #0\n"
        "  .thumb_func\n"
        "zero_loop:\n"
        "    cmp     r0, r1\n"
        "    it      lt\n"
        "    strlt   r2, [r0], #4\n"
        "    blt     zero_loop");

  /* Setup Microcontroller                                                                                  */
  SystemInit();

  /* Call the application's entry point.                                                                    */
  main();
}


/**
  *@brief Provide weak aliases for each Exception handler to the Default_Handler.
  *       As they are weak aliases, any function with the same name will override
  *       this definition.
  */
#pragma weak Reset_Handler = Default_Reset_Handler
#pragma weak NMI_Handler = Default_Handler
#pragma weak HardFault_Handler = Default_Handler
#pragma weak MemManage_Handler = Default_Handler
#pragma weak BusFault_Handler = Default_Handler
#pragma weak UsageFault_Handler = Default_Handler
#pragma weak SVC_Handler = Default_Handler
#pragma weak DebugMon_Handler = Default_Handler
#pragma weak PendSV_Handler = Default_Handler
#pragma weak SysTick_Handler = Default_Handler

#pragma weak CKRDY_IRQHandler = Default_Handler
#pragma weak TLVD_IRQHandler = Default_Handler
#pragma weak BOD_IRQHandler = Default_Handler
#pragma weak WDT_IRQHandler = Default_Handler
#pragma weak RTC_IRQHandler = Default_Handler
#pragma weak FLASH_IRQHandler = Default_Handler
#pragma weak EVWUP_IRQHandler = Default_Handler
#pragma weak LPWUP_IRQHandler = Default_Handler
#pragma weak EXTI0_IRQHandler = Default_Handler
#pragma weak EXTI1_IRQHandler = Default_Handler
#pragma weak EXTI2_IRQHandler = Default_Handler
#pragma weak EXTI3_IRQHandler = Default_Handler
#pragma weak EXTI4_IRQHandler = Default_Handler
#pragma weak EXTI5_IRQHandler = Default_Handler
#pragma weak EXTI6_IRQHandler = Default_Handler
#pragma weak EXTI7_IRQHandler = Default_Handler
#pragma weak EXTI8_IRQHandler = Default_Handler
#pragma weak EXTI9_IRQHandler = Default_Handler
#pragma weak EXTI10_IRQHandler = Default_Handler
#pragma weak EXTI11_IRQHandler = Default_Handler
#pragma weak EXTI12_IRQHandler = Default_Handler
#pragma weak EXTI13_IRQHandler = Default_Handler
#pragma weak EXTI14_IRQHandler = Default_Handler
#pragma weak EXTI15_IRQHandler = Default_Handler
#pragma weak COMP_IRQHandler = Default_Handler
#pragma weak ADC_IRQHandler = Default_Handler
#pragma weak MCTM0BRK_IRQHandler = Default_Handler
#pragma weak MCTM0UP_IRQHandler = Default_Handler
#pragma weak MCTM0TR_IRQHandler = Default_Handler
#pragma weak MCTM0CC_IRQHandler = Default_Handler
#pragma weak MCTM1BRK_IRQHandler = Default_Handler
#pragma weak MCTM1UP_IRQHandler = Default_Handler
#pragma weak MCTM1TR_IRQHandler = Default_Handler
#pragma weak MCTM1CC_IRQHandler = Default_Handler
#pragma weak GPTM0_IRQHandler = Default_Handler
#pragma weak GPTM1_IRQHandler = Default_Handler
#pragma weak BFTM0_IRQHandler = Default_Handler
#pragma weak BFTM1_IRQHandler = Default_Handler
#pragma weak I2C0_IRQHandler = Default_Handler
#pragma weak I2C1_IRQHandler = Default_Handler
#pragma weak SPI0_IRQHandler = Default_Handler
#pragma weak SPI1_IRQHandler = Default_Handler
#pragma weak USART0_IRQHandler = Default_Handler
#pragma weak USART1_IRQHandler = Default_Handler
#pragma weak UART0_IRQHandler = Default_Handler
#pragma weak UART1_IRQHandler = Default_Handler
#pragma weak SCI_IRQHandler = Default_Handler
#pragma weak I2S_IRQHandler = Default_Handler
#pragma weak USB_IRQHandler = Default_Handler
#pragma weak PDMA_CH0_IRQHandler = Default_Handler
#pragma weak PDMA_CH1_IRQHandler = Default_Handler
#pragma weak PDMA_CH2_IRQHandler = Default_Handler
#pragma weak PDMA_CH3_IRQHandler = Default_Handler
#pragma weak PDMA_CH4_IRQHandler = Default_Handler
#pragma weak PDMA_CH5_IRQHandler = Default_Handler
#pragma weak PDMA_CH6_IRQHandler = Default_Handler
#pragma weak PDMA_CH7_IRQHandler = Default_Handler
#pragma weak EBI_IRQHandler = Default_Handler


/**
  * @brief  This is the code that gets called when the processor receives an
  *         unexpected interrupt.  This simply enters an infinite loop,
  *         preserving the system state for examination by a debugger.
  * @retval None
  */
static void Default_Handler(void)
{
  /* Go into an infinite loop.                                                                              */
  while (1)
  {
  }
}
