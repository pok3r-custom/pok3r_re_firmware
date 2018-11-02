.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x3400*/  .word 0x20001eb0
/*0x3404*/  .word reset
/*0x3408*/  .word nmi
/*0x340c*/  .word hard_fault
/*0x3410*/  .word mcu_fault
/*0x3414*/  .word bus_fault
/*0x3418*/  .word usage_fault

/*0x341c*/  .byte 0x00
/*0x341d*/  .byte 0x00
/*0x341e*/  .byte 0x00
/*0x341f*/  .byte 0x00
/*0x3420*/  .byte 0x00
/*0x3421*/  .byte 0x00
/*0x3422*/  .byte 0x00
/*0x3423*/  .byte 0x00
/*0x3424*/  .byte 0x00
/*0x3425*/  .byte 0x00
/*0x3426*/  .byte 0x00
/*0x3427*/  .byte 0x00
/*0x3428*/  .byte 0x00
/*0x3429*/  .byte 0x00
/*0x342a*/  .byte 0x00
/*0x342b*/  .byte 0x00

/*0x342c*/  .word svccall_intr
/*0x3430*/  .word debug_intr

/*0x3434*/  .byte 0x00
/*0x3435*/  .byte 0x00
/*0x3436*/  .byte 0x00
/*0x3437*/  .byte 0x00

/*0x3438*/  .word pendsv_intr
/*0x343c*/  .word systick_intr
/*0x3440*/  .word generic_intr
/*0x3444*/  .word generic_intr
/*0x3448*/  .word generic_intr
/*0x344c*/  .word generic_intr
/*0x3450*/  .word generic_intr
/*0x3454*/  .word generic_intr
/*0x3458*/  .word generic_intr
/*0x345c*/  .word generic_intr
/*0x3460*/  .word generic_intr
/*0x3464*/  .word generic_intr
/*0x3468*/  .word generic_intr
/*0x346c*/  .word generic_intr
/*0x3470*/  .word generic_intr
/*0x3474*/  .word generic_intr
/*0x3478*/  .word generic_intr
/*0x347c*/  .word generic_intr
/*0x3480*/  .word generic_intr
/*0x3484*/  .word generic_intr
/*0x3488*/  .word generic_intr
/*0x348c*/  .word generic_intr
/*0x3490*/  .word generic_intr
/*0x3494*/  .word generic_intr
/*0x3498*/  .word generic_intr
/*0x349c*/  .word generic_intr
/*0x34a0*/  .word generic_intr
/*0x34a4*/  .word generic_intr

/*0x34a8*/  .byte 0x00
/*0x34a9*/  .byte 0x00
/*0x34aa*/  .byte 0x00
/*0x34ab*/  .byte 0x00

/*0x34ac*/  .word generic_intr
/*0x34b0*/  .word generic_intr
/*0x34b4*/  .word generic_intr
/*0x34b8*/  .word generic_intr
/*0x34bc*/  .word generic_intr
/*0x34c0*/  .word generic_intr
/*0x34c4*/  .word generic_intr
/*0x34c8*/  .word generic_intr
/*0x34cc*/  .word generic_intr
/*0x34d0*/  .word generic_intr

/*0x34d4*/  .byte 0x00
/*0x34d5*/  .byte 0x00
/*0x34d6*/  .byte 0x00
/*0x34d7*/  .byte 0x00
/*0x34d8*/  .byte 0x00
/*0x34d9*/  .byte 0x00
/*0x34da*/  .byte 0x00
/*0x34db*/  .byte 0x00
/*0x34dc*/  .byte 0x00
/*0x34dd*/  .byte 0x00
/*0x34de*/  .byte 0x00
/*0x34df*/  .byte 0x00
/*0x34e0*/  .byte 0x00
/*0x34e1*/  .byte 0x00
/*0x34e2*/  .byte 0x00
/*0x34e3*/  .byte 0x00

/*0x34e4*/  .word bftm0_intr
/*0x34e8*/  .word bftm1_intr
/*0x34ec*/  .word generic_intr
/*0x34f0*/  .word generic_intr
/*0x34f4*/  .word generic_intr
/*0x34f8*/  .word generic_intr
/*0x34fc*/  .word generic_intr
/*0x3500*/  .word generic_intr
/*0x3504*/  .word generic_intr
/*0x3508*/  .word generic_intr
/*0x350c*/  .word generic_intr
/*0x3510*/  .word generic_intr
/*0x3514*/  .word usb_intr

/*0x3518*/  .byte 0x00
/*0x3519*/  .byte 0x00
/*0x351a*/  .byte 0x00
/*0x351b*/  .byte 0x00

/*0x351c*/  .word generic_intr
/*0x3520*/  .word generic_intr
/*0x3524*/  .word generic_intr
/*0x3528*/  .word generic_intr
/*0x352c*/  .word generic_intr
/*0x3530*/  .word generic_intr
/*0x3534*/  .word generic_intr
/*0x3538*/  .word generic_intr

/*0x353c*/  .byte 0x00
/*0x353d*/  .byte 0x00
/*0x353e*/  .byte 0x00
/*0x353f*/  .byte 0x00
/*0x3540*/  .byte 0x00
/*0x3541*/  .byte 0x00
/*0x3542*/  .byte 0x00
/*0x3543*/  .byte 0x00
/*0x3544*/  .byte 0x00
/*0x3545*/  .byte 0x00
/*0x3546*/  .byte 0x00
/*0x3547*/  .byte 0x00
/*0x3548*/  .byte 0x00
/*0x3549*/  .byte 0x00
/*0x354a*/  .byte 0x00
/*0x354b*/  .byte 0x00
/*0x354c*/  .byte 0x00
/*0x354d*/  .byte 0x00
/*0x354e*/  .byte 0x00
/*0x354f*/  .byte 0x00

/*0x3550*/  .word generic_intr


            .thumb_func
            reset:
/*0x3554*/      ldr r0, [pc, #0x1c] /* data_3574 */
/*0x3556*/      blx r0 /* call_6a0c */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /* call_6034 */
/*0x355c*/      ldr r0, [pc, #0x1c] /* data_357c */
/*0x355e*/      bx r0 /* entry */

            .thumb_func
            nmi:
/*0x3560*/      b nmi

            .thumb_func
            hard_fault:
/*0x3562*/      b hard_fault

            .thumb_func
            mcu_fault:
/*0x3564*/      b mcu_fault

            .thumb_func
            bus_fault:
/*0x3566*/      b bus_fault

            .thumb_func
            usage_fault:
/*0x3568*/      b usage_fault

            .thumb_func
            svccall_intr:
/*0x356a*/      b svccall_intr

            .thumb_func
            debug_intr:
/*0x356c*/      b debug_intr

            .thumb_func
            pendsv_intr:
/*0x356e*/      b pendsv_intr

            .thumb_func
            systick_intr:
/*0x3570*/      b systick_intr

            .thumb_func
            generic_intr:
/*0x3572*/      b generic_intr

            data_3574:
/*0x3574*/  .word call_6a0c
            data_3578:
/*0x3578*/  .word call_6034
            data_357c:
/*0x357c*/  .word entry


            .thumb_func
            entry:
/*0x3580*/      ldr.w sp, [pc, #0xc] /* data_3590 */
/*0x3584*/      bl sram_init

            .thumb_func
            call_3588:
/*0x3588*/      ldr r0, [pc, #0] /* data_358c */
/*0x358a*/      bx r0 /* main */

            data_358c:
/*0x358c*/  .word main
            data_3590:
/*0x3590*/  .word 0x20001eb0


            .thumb_func
            rand:
/*0x3594*/      ldr r1, [pc, #0x18] /* data_35b0 */
/*0x3596*/      ldr r2, [pc, #0x1c] /* data_35b4 */
/*0x3598*/      ldr r0, [r1]
/*0x359a*/      muls r0, r2, r0
/*0x359c*/      movw r2, #0x3039
/*0x35a0*/      add r0, r2
/*0x35a2*/      str r0, [r1]
/*0x35a4*/      lsrs r0, r0, #1
/*0x35a6*/      bx lr

            .thumb_func
            srand: /* (seed) */
/*0x35a8*/      ldr r1, [pc, #4] /* data_35b0 */
/*0x35aa*/      str r0, [r1]
/*0x35ac*/      bx lr

/*0x35ae*/  .byte 0x00
/*0x35af*/  .byte 0x00

            data_35b0:
/*0x35b0*/  .word 0x20000068
            data_35b4:
/*0x35b4*/  .word 0x41c64e6d


            .thumb_func
            memcpy: /* (dest, src, size) */
/*0x35b8*/      orr.w r3, r0, r1
/*0x35bc*/      lsls r3, r3, #0x1e
/*0x35be*/      beq jump_35c8
/*0x35c0*/      b jump_35d6
            jump_35c2:
/*0x35c2*/      ldm r1!, {r3}
/*0x35c4*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x35c6*/      stm r0!, {r3}
            jump_35c8:
/*0x35c8*/      cmp r2, #4
/*0x35ca*/      bhs jump_35c2
/*0x35cc*/      b jump_35d6
            jump_35ce:
/*0x35ce*/      ldrb r3, [r1], #1
/*0x35d2*/      strb r3, [r0], #1
            jump_35d6:
/*0x35d6*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x35d8*/      bhs jump_35ce
/*0x35da*/      bx lr

            .thumb_func
            mem_set: /* (dest, size, val) */
/*0x35dc*/      uxtb r2, r2
/*0x35de*/      b jump_35e4
            jump_35e0:
/*0x35e0*/      strb r2, [r0], #1
            jump_35e4:
/*0x35e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x35e6*/      bhs jump_35e0
/*0x35e8*/      bx lr

            .thumb_func
            mem_zero: /* (dest, size) */
/*0x35ea*/      movs r2, #0
/*0x35ec*/      b mem_set /* (dest, size, val) */

            .thumb_func
            mem_set2: /* (dest, val, size) */
/*0x35ee*/      push {r4, lr}
/*0x35f0*/      mov r3, r2
/*0x35f2*/      mov r2, r1
/*0x35f4*/      mov r4, r0
/*0x35f6*/      mov r1, r3
/*0x35f8*/      bl mem_set /* (dest, size, val) */
/*0x35fc*/      mov r0, r4
/*0x35fe*/      pop {r4, pc}

            .thumb_func
            memcmp: /* (ptr1, ptr2, size) */
/*0x3600*/      push {r4, r5, lr}
/*0x3602*/      mov r4, r0
/*0x3604*/      movs r0, #0
/*0x3606*/      mov r3, r0
/*0x3608*/      b jump_360c
            jump_360a:
/*0x360a*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_360c:
/*0x360c*/      cmp r3, r2
/*0x360e*/      bhs jump_3618
/*0x3610*/      ldrb r0, [r4, r3]
/*0x3612*/      ldrb r5, [r1, r3]
/*0x3614*/      subs r0, r0, r5
/*0x3616*/      beq jump_360a
            jump_3618:
/*0x3618*/      pop {r4, r5, pc}

/*0x361a*/  .byte 0x00
/*0x361b*/  .byte 0x00


            .thumb_func
            sram_init:
/*0x361c*/      ldr r4, [pc, #0x18] /* data_3638 */
/*0x361e*/      ldr r5, [pc, #0x1c] /* data_363c */
/*0x3620*/      b jump_3630
            jump_3622:
/*0x3622*/      ldr r0, [r4, #0xc]
/*0x3624*/      orr r3, r0, #1
/*0x3628*/      ldm.w r4, {r0, r1, r2}
/*0x362c*/      blx r3
/*0x362e*/      adds r4, #0x10
            jump_3630:
/*0x3630*/      cmp r4, r5
/*0x3632*/      blo jump_3622
/*0x3634*/      bl call_3588

            data_3638:
/*0x3638*/  .word sram_defs
            data_363c:
/*0x363c*/  .word sram_init_data


            .thumb_func
            call_3640:
/*0x3640*/      push {r4, lr}
/*0x3642*/      movs r2, #0
/*0x3644*/      cmp r0, #7
/*0x3646*/      bls jump_364e
/*0x3648*/      movs r2, #1
/*0x364a*/      subs r0, #8
/*0x364c*/      uxtb r0, r0
            jump_364e:
/*0x364e*/      lsls r3, r2, #2
/*0x3650*/      ldr r2, [pc, #0x14] /* data_3668 */
/*0x3652*/      add r2, r3
/*0x3654*/      ldr r3, [r2]
/*0x3656*/      lsls r0, r0, #2
/*0x3658*/      movs r4, #0xf
/*0x365a*/      lsls r4, r0
/*0x365c*/      bics r3, r4
/*0x365e*/      lsls r1, r0
/*0x3660*/      orrs r1, r3
/*0x3662*/      str r1, [r2]
/*0x3664*/      pop {r4, pc}

/*0x3666*/  .byte 0x00
/*0x3667*/  .byte 0x00

            data_3668:
/*0x3668*/  .word 0x40022000


            .thumb_func
            call_366c:
/*0x366c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x3670*/      mov sb, r2
/*0x3672*/      ldr r2, [pc, #0x58] /* data_36cc */
/*0x3674*/      mov.w sl, #0xff
/*0x3678*/      add.w r5, r2, r0, lsl #3
/*0x367c*/      movs r2, #0
            jump_367e:
/*0x367e*/      movs r4, #0
/*0x3680*/      lsl.w r0, sl, r2
/*0x3684*/      mov r3, r4
/*0x3686*/      tst r0, r1
/*0x3688*/      beq jump_36be
/*0x368a*/      mov.w ip, #1
/*0x368e*/      movs r0, #0
/*0x3690*/      lsl.w ip, ip, r2
/*0x3694*/      mov.w r8, #0xf
            jump_3698:
/*0x3698*/      lsr.w r6, r1, r0
/*0x369c*/      tst.w r6, ip
/*0x36a0*/      beq jump_36b0
/*0x36a2*/      lsls r6, r0, #2
/*0x36a4*/      lsl.w r7, r8, r6
/*0x36a8*/      orrs r4, r7
/*0x36aa*/      lsl.w r7, sb, r6
/*0x36ae*/      orrs r3, r7
            jump_36b0:
/*0x36b0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x36b2*/      cmp r0, #8
/*0x36b4*/      blo jump_3698
/*0x36b6*/      ldr r0, [r5]
/*0x36b8*/      bics r0, r4
/*0x36ba*/      orrs r0, r3
/*0x36bc*/      str r0, [r5]
            jump_36be:
/*0x36be*/      adds r2, #8
/*0x36c0*/      .short 0x1d2d /* adds r5, r5, #4 */ 
/*0x36c2*/      cmp r2, #8
/*0x36c4*/      ble jump_367e
/*0x36c6*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

/*0x36ca*/  .byte 0x00
/*0x36cb*/  .byte 0x00

            data_36cc:
/*0x36cc*/  .word 0x40022020


            .thumb_func
            bftm0_intr:
/*0x36d0*/      push {r4, lr}
/*0x36d2*/      ldr r0, [pc, #0x58] /* data_372c */
/*0x36d4*/      bl call_37a4
/*0x36d8*/      bl call_5a30
/*0x36dc*/      ldr r0, [pc, #0x50] /* data_3730 */
/*0x36de*/      ldr r1, [r0]
/*0x36e0*/      cbz r1, jump_36e8
/*0x36e2*/      ldr r1, [r0]
/*0x36e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x36e6*/      str r1, [r0]
            jump_36e8:
/*0x36e8*/      ldr r1, [r0, #4]
/*0x36ea*/      cbz r1, jump_36f2
/*0x36ec*/      ldr r1, [r0, #4]
/*0x36ee*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x36f0*/      str r1, [r0, #4]
            jump_36f2:
/*0x36f2*/      ldr r0, [pc, #0x40] /* data_3734 */
/*0x36f4*/      ldr r1, [r0]
/*0x36f6*/      cbz r1, jump_36fe
/*0x36f8*/      ldr r1, [r0]
/*0x36fa*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36fc*/      str r1, [r0]
            jump_36fe:
/*0x36fe*/      ldr r0, [pc, #0x38] /* data_3738 */
/*0x3700*/      ldr r1, [r0]
/*0x3702*/      cbz r1, jump_370a
/*0x3704*/      ldr r1, [r0]
/*0x3706*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3708*/      str r1, [r0]
            jump_370a:
/*0x370a*/      ldr r1, [pc, #0x30] /* data_373c */
/*0x370c*/      ldrb r0, [r1]
/*0x370e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x3710*/      strb r0, [r1]
/*0x3712*/      ldr r0, [pc, #0x2c] /* data_3740 */
/*0x3714*/      ldrh r1, [r0]
/*0x3716*/      cmp r1, #0
/*0x3718*/      beq jump_3728
/*0x371a*/      ldrh r1, [r0]
/*0x371c*/      cmp.w r1, #0xff00
/*0x3720*/      bhs jump_3728
/*0x3722*/      ldrh r1, [r0]
/*0x3724*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3726*/      strh r1, [r0]
            jump_3728:
/*0x3728*/      pop {r4, pc}

/*0x372a*/  .byte 0x00
/*0x372b*/  .byte 0x00

            data_372c:
/*0x372c*/  .word 0x40076000
            data_3730:
/*0x3730*/  .word 0x200003a0
            data_3734:
/*0x3734*/  .word 0x20000004
            data_3738:
/*0x3738*/  .word 0x20000064
            data_373c:
/*0x373c*/  .word 0x2000004d
            data_3740:
/*0x3740*/  .word 0x20000018


            .thumb_func
            bftm1_intr:
/*0x3744*/      push {r4, lr}
/*0x3746*/      ldr r0, [pc, #0x4c] /* data_3794 */
/*0x3748*/      bl call_37a4
/*0x374c*/      ldr r4, [pc, #0x48] /* data_3798 */
/*0x374e*/      ldr r0, [r4, #4]
/*0x3750*/      ldrh r1, [r0, #4]
/*0x3752*/      ldr r0, [r0]
/*0x3754*/      uxth r1, r1
/*0x3756*/      bl call_3bf4
/*0x375a*/      movs r0, #0xa
/*0x375c*/      bl spin_wait /* (time) */
/*0x3760*/      movs r0, #2
/*0x3762*/      bl call_7034
/*0x3766*/      ldr r1, [pc, #0x34] /* data_379c */
/*0x3768*/      mov.w r0, #0x8000
/*0x376c*/      str r0, [r1, #0x24]
/*0x376e*/      ldr r0, [pc, #0x30] /* data_37a0 */
/*0x3770*/      ldrb r1, [r4, #1]
/*0x3772*/      add.w r0, r0, r1, lsl #3
/*0x3776*/      str r0, [r4, #4]
/*0x3778*/      ldrh r1, [r0, #4]
/*0x377a*/      ldr r0, [r0]
/*0x377c*/      uxth r1, r1
/*0x377e*/      bl call_3bf0
/*0x3782*/      ldrb r0, [r4, #1]
/*0x3784*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x3786*/      and r0, r0, #7
/*0x378a*/      strb r0, [r4, #1]
/*0x378c*/      pop.w {r4, lr}
/*0x3790*/      b.w call_5f00

            data_3794:
/*0x3794*/  .word 0x40077000
            data_3798:
/*0x3798*/  .word 0x20000020
            data_379c:
/*0x379c*/  .word 0x400b0000
            data_37a0:
/*0x37a0*/  .word gpio_map_3


            .thumb_func
            call_37a4:
/*0x37a4*/      ldr r1, [r0, #4]
/*0x37a6*/      bic r1, r1, #1
/*0x37aa*/      str r1, [r0, #4]
/*0x37ac*/      dsb sy
/*0x37b0*/      bx lr

            .thumb_func
            call_37b2:
/*0x37b2*/      cmp r1, #0
/*0x37b4*/      ldr r1, [r0]
/*0x37b6*/      beq jump_37be
/*0x37b8*/      orr r1, r1, #4
/*0x37bc*/      b jump_37c2
            jump_37be:
/*0x37be*/      bic r1, r1, #4
            jump_37c2:
/*0x37c2*/      str r1, [r0]
/*0x37c4*/      bx lr

            .thumb_func
            call_37c6:
/*0x37c6*/      cmp r1, #0
/*0x37c8*/      ldr r1, [r0]
/*0x37ca*/      beq jump_37d2
/*0x37cc*/      orr r1, r1, #1
/*0x37d0*/      b jump_37d6
            jump_37d2:
/*0x37d2*/      bic r1, r1, #1
            jump_37d6:
/*0x37d6*/      str r1, [r0]
/*0x37d8*/      bx lr

            .thumb_func
            call_37da:
/*0x37da*/      str r1, [r0, #0xc]
/*0x37dc*/      bx lr

            .thumb_func
            call_37de:
/*0x37de*/      str r1, [r0, #8]
/*0x37e0*/      bx lr

/*0x37e2*/  .byte 0x00
/*0x37e3*/  .byte 0x00


            .thumb_func
            call_37e4:
/*0x37e4*/      lsls r0, r0, #3
/*0x37e6*/      lsrs r3, r1, #3
/*0x37e8*/      add.w r0, r0, r3, lsl #2
/*0x37ec*/      ldr r3, [pc, #0x18] /* data_3808 */
/*0x37ee*/      push {r4, lr}
/*0x37f0*/      add r0, r3
/*0x37f2*/      lsls r1, r1, #0x1d
/*0x37f4*/      ldr r3, [r0]
/*0x37f6*/      lsrs r1, r1, #0x1b
/*0x37f8*/      movs r4, #0xf
/*0x37fa*/      lsls r4, r1
/*0x37fc*/      bics r3, r4
/*0x37fe*/      lsls r2, r1
/*0x3800*/      orrs r3, r2
/*0x3802*/      str r3, [r0]
/*0x3804*/      pop {r4, pc}

/*0x3806*/  .byte 0x00
/*0x3807*/  .byte 0x00

            data_3808:
/*0x3808*/  .word 0x40022020


            .thumb_func
            spin_wait: /* (time) */
/*0x380c*/      add.w r0, r0, r0, lsl #2
/*0x3810*/      lsls r0, r0, #2
            jump_3812:
/*0x3812*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3814*/      bhs jump_3812
/*0x3816*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x3818*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x381c*/      mov.w r5, #0x4000
/*0x3820*/      movs r4, #0
/*0x3822*/      lsls r0, r5, #2
/*0x3824*/      mov r2, r4
/*0x3826*/      mov r8, r0
/*0x3828*/      movs r3, #1
/*0x382a*/      mov r1, r5
/*0x382c*/      bl call_398c
/*0x3830*/      ldr r6, [pc, #0x94] /* data_38c8 */
/*0x3832*/      movs r2, #0
/*0x3834*/      mov r1, r5
/*0x3836*/      mov r0, r6
/*0x3838*/      bl call_4224
/*0x383c*/      lsls r7, r5, #1
/*0x383e*/      movs r2, #0
/*0x3840*/      mov r1, r7
/*0x3842*/      mov r0, r6
/*0x3844*/      bl call_4224
/*0x3848*/      movs r2, #2
/*0x384a*/      mov r1, r5
/*0x384c*/      mov r0, r6
/*0x384e*/      bl call_4244
/*0x3852*/      movs r2, #2
/*0x3854*/      mov r1, r7
/*0x3856*/      mov r0, r6
/*0x3858*/      bl call_4244
/*0x385c*/      asrs r5, r5, #3
/*0x385e*/      movs r2, #0
/*0x3860*/      mov r1, r5
/*0x3862*/      mov r0, r6
/*0x3864*/      bl call_4224
/*0x3868*/      movs r2, #2
/*0x386a*/      mov r1, r5
/*0x386c*/      mov r0, r6
/*0x386e*/      bl call_4244
/*0x3872*/      movs r2, #1
/*0x3874*/      movs r1, #0xb
/*0x3876*/      movs r0, #0
/*0x3878*/      bl call_37e4
/*0x387c*/      movs r2, #1
/*0x387e*/      movs r1, #0xd
/*0x3880*/      movs r0, #2
/*0x3882*/      bl call_37e4
/*0x3886*/      movs r2, #1
/*0x3888*/      movs r1, #0xe
/*0x388a*/      movs r0, #2
/*0x388c*/      bl call_37e4
/*0x3890*/      movs r2, #1
/*0x3892*/      movs r1, #0xf
/*0x3894*/      movs r0, #2
/*0x3896*/      bl call_37e4
/*0x389a*/      ldr r0, [pc, #0x30] /* data_38cc */
/*0x389c*/      ldr r0, [r0, #4]
/*0x389e*/      lsls r0, r0, #0x15
/*0x38a0*/      bmi jump_38b6
/*0x38a2*/      movs r2, #1
/*0x38a4*/      movs r1, #0xe
/*0x38a6*/      mov r0, r2
/*0x38a8*/      bl call_37e4
/*0x38ac*/      movs r2, #1
/*0x38ae*/      movs r1, #0xf
/*0x38b0*/      mov r0, r2
/*0x38b2*/      bl call_37e4
            jump_38b6:
/*0x38b6*/      mov r1, r4
/*0x38b8*/      movs r3, #0
/*0x38ba*/      mov r2, r4
/*0x38bc*/      mov r0, r8
/*0x38be*/      bl call_398c
/*0x38c2*/      movs r0, #1
/*0x38c4*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_38c8:
/*0x38c8*/  .word 0x400b0000
            data_38cc:
/*0x38cc*/  .word 0x40088000


            .thumb_func
            call_38d0:
/*0x38d0*/      push {r4, r5, r6, lr}
/*0x38d2*/      ldr r6, [pc, #0x3c] /* data_3910 */
/*0x38d4*/      mov r4, r0
/*0x38d6*/      ldr r0, [r6, #0x34]
/*0x38d8*/      lsrs r5, r0, #0x1e
/*0x38da*/      bl call_3918
/*0x38de*/      str r0, [r4]
/*0x38e0*/      cmp r5, #1
/*0x38e2*/      beq jump_38f0
/*0x38e4*/      ldr r0, [pc, #0x2c] /* data_3914 */
/*0x38e6*/      cmp r5, #2
/*0x38e8*/      beq jump_38f0
/*0x38ea*/      cmp r5, #3
/*0x38ec*/      beq jump_38f0
/*0x38ee*/      movs r0, #0
            jump_38f0:
/*0x38f0*/      str r0, [r4, #4]
/*0x38f2*/      ldr r1, [r6, #0x20]
/*0x38f4*/      lsrs r0, r1
/*0x38f6*/      str r0, [r4, #8]
/*0x38f8*/      ldr r1, [r6, #0x28]
/*0x38fa*/      ubfx r1, r1, #0x10, #3
/*0x38fe*/      cmp r1, #7
/*0x3900*/      beq jump_3908
/*0x3902*/      lsrs r0, r1
            jump_3904:
/*0x3904*/      str r0, [r4, #0xc]
/*0x3906*/      pop {r4, r5, r6, pc}
            jump_3908:
/*0x3908*/      movs r1, #6
/*0x390a*/      udiv r0, r0, r1
/*0x390e*/      b jump_3904

            data_3910:
/*0x3910*/  .word 0x40088000
            data_3914:
/*0x3914*/  .word 0x007a1200


            .thumb_func
            call_3918:
/*0x3918*/      ldr r1, [pc, #0x30] /* data_394c */
/*0x391a*/      ldr.w r0, [r1, #0xa4]
/*0x391e*/      cmp r0, #0
/*0x3920*/      beq jump_394a
/*0x3922*/      ldr r0, [r1, #0x20]
/*0x3924*/      ldr r0, [pc, #0x28] /* data_3950 */
/*0x3926*/      ldr.w r1, [r1, #0x3fc]
/*0x392a*/      cmp r1, #1
/*0x392c*/      beq jump_394a
/*0x392e*/      ldr r2, [pc, #0x24] /* data_3954 */
/*0x3930*/      ldr r1, [r2, #0x18]
/*0x3932*/      ubfx r1, r1, #0x17, #6
/*0x3936*/      cbnz r1, jump_393a
/*0x3938*/      movs r1, #0x40
            jump_393a:
/*0x393a*/      ldr r2, [r2, #0x18]
/*0x393c*/      ubfx r3, r2, #0x15, #2
/*0x3940*/      movs r2, #1
/*0x3942*/      lsls r2, r3
/*0x3944*/      udiv r0, r0, r2
/*0x3948*/      muls r0, r1, r0
            jump_394a:
/*0x394a*/      bx lr

            data_394c:
/*0x394c*/  .word 0x43100000
            data_3950:
/*0x3950*/  .word 0x007a1200
            data_3954:
/*0x3954*/  .word 0x40088000


            .thumb_func
            call_3958:
/*0x3958*/      push {r0, r1, r2, r3, r4, lr}
/*0x395a*/      ldr r2, [pc, #0x2c] /* data_3988 */
/*0x395c*/      lsrs r1, r0, #5
/*0x395e*/      add.w r2, r2, r1, lsl #2
/*0x3962*/      movs r1, #0
/*0x3964*/      cmp r0, #0x2e
/*0x3966*/      bne jump_396a
/*0x3968*/      movs r1, #2
            jump_396a:
/*0x396a*/      ldr r2, [r2]
/*0x396c*/      movs r3, #3
/*0x396e*/      subs r0, #0x20
/*0x3970*/      lsls r3, r0
/*0x3972*/      ands r2, r3
/*0x3974*/      lsrs r2, r0
/*0x3976*/      adds r4, r2, r1
/*0x3978*/      mov r0, sp
/*0x397a*/      bl call_38d0
/*0x397e*/      ldr r0, [sp, #8]
/*0x3980*/      add sp, #0x10
/*0x3982*/      lsrs r0, r4
/*0x3984*/      pop {r4, pc}

/*0x3986*/  .byte 0x00
/*0x3987*/  .byte 0x00

            data_3988:
/*0x3988*/  .word 0x40088038


            .thumb_func
            call_398c:
/*0x398c*/      push {r4, r5, r6, r7, lr}
/*0x398e*/      ldr r7, [pc, #0x1c] /* data_39ac */
/*0x3990*/      ldr r4, [r7, #0x24]
/*0x3992*/      ldr r5, [r7, #0x2c]
/*0x3994*/      ldr r6, [r7, #0x30]
/*0x3996*/      bics r4, r0
/*0x3998*/      bics r5, r1
/*0x399a*/      bics r6, r2
/*0x399c*/      cbz r3, jump_39a4
/*0x399e*/      orrs r4, r0
/*0x39a0*/      orrs r5, r1
/*0x39a2*/      orrs r6, r2
            jump_39a4:
/*0x39a4*/      str r4, [r7, #0x24]
/*0x39a6*/      str r5, [r7, #0x2c]
/*0x39a8*/      str r6, [r7, #0x30]
/*0x39aa*/      pop {r4, r5, r6, r7, pc}

            data_39ac:
/*0x39ac*/  .word 0x40088000


            .thumb_func
            call_39b0:
/*0x39b0*/      ldr r1, [pc, #0xc] /* data_39c0 */
/*0x39b2*/      ldr r2, [r1]
/*0x39b4*/      bic r2, r2, #0xc00000
/*0x39b8*/      orr.w r0, r2, r0, lsl #22
/*0x39bc*/      str r0, [r1]
/*0x39be*/      bx lr

            data_39c0:
/*0x39c0*/  .word 0x40088000


            .thumb_func
            call_39c4:
/*0x39c4*/      ldr r3, [pc, #0x18] /* data_39e0 */
/*0x39c6*/      str r0, [r3, #4]
/*0x39c8*/      movs r0, #0
/*0x39ca*/      str r0, [r3]
/*0x39cc*/      b jump_39d4
            jump_39ce:
/*0x39ce*/      ldrb r0, [r1], #1
/*0x39d2*/      strb r0, [r3, #0xc]
            jump_39d4:
/*0x39d4*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x39d6*/      bhs jump_39ce
/*0x39d8*/      ldr r0, [r3, #8]
/*0x39da*/      uxth r0, r0
/*0x39dc*/      bx lr

/*0x39de*/  .byte 0x00
/*0x39df*/  .byte 0x00

            data_39e0:
/*0x39e0*/  .word 0x4008a000


            .thumb_func
            call_39e4:
/*0x39e4*/      push {r4, r5, r6, lr}
/*0x39e6*/      ldr r2, [pc, #0x9c] /* data_3a84 */
/*0x39e8*/      ldrb r0, [r2, #7]
/*0x39ea*/      lsls r0, r0, #0x1f
/*0x39ec*/      beq jump_3a28
/*0x39ee*/      ldr r5, [pc, #0x98] /* data_3a88 */
/*0x39f0*/      movs r1, #1
/*0x39f2*/      str r1, [r5, #4]
/*0x39f4*/      ldr r0, [pc, #0x94] /* data_3a8c */
/*0x39f6*/      ldrb r3, [r0, #3]
/*0x39f8*/      lsls r3, r3, #0x1e
/*0x39fa*/      bpl jump_3a28
/*0x39fc*/      ldrb r0, [r0, #1]
/*0x39fe*/      lsls r3, r0, #0x1f
/*0x3a00*/      ldr r0, [pc, #0x88] /* data_3a8c */
/*0x3a02*/      ldrb r0, [r0]
/*0x3a04*/      beq jump_3a3e
/*0x3a06*/      cmp r0, #0x3b
/*0x3a08*/      beq jump_3a2a
/*0x3a0a*/      bgt jump_3a16
/*0x3a0c*/      cmp r0, #0x29
/*0x3a0e*/      beq jump_3a26
/*0x3a10*/      cmp r0, #0x3a
/*0x3a12*/      bne jump_3a28
/*0x3a14*/      b jump_3a2a
            jump_3a16:
/*0x3a16*/      cmp r0, #0x3c
/*0x3a18*/      beq jump_3a2a
/*0x3a1a*/      cmp r0, #0x4d
/*0x3a1c*/      bne jump_3a28
/*0x3a1e*/      pop.w {r4, r5, r6, lr}
/*0x3a22*/      b.w jump_6a4c
            jump_3a26:
/*0x3a26*/      strb r1, [r2, #2]
            jump_3a28:
/*0x3a28*/      pop {r4, r5, r6, pc}
            jump_3a2a:
/*0x3a2a*/      subs r0, #0x3a
/*0x3a2c*/      uxtb r1, r0
/*0x3a2e*/      ldr r0, [pc, #0x58] /* data_3a88 */
/*0x3a30*/      movs r2, #1
/*0x3a32*/      adds r4, r0, r1
/*0x3a34*/      ldrb r0, [r4]
/*0x3a36*/      bl call_4be4
/*0x3a3a*/      strb r0, [r4]
            jump_3a3c:
/*0x3a3c*/      pop {r4, r5, r6, pc}
            jump_3a3e:
/*0x3a3e*/      cmp r0, #0xe8
/*0x3a40*/      beq jump_3a3c
/*0x3a42*/      ldr r1, [pc, #0x4c] /* data_3a90 */
/*0x3a44*/      ldr r2, [pc, #0x4c] /* data_3a94 */
/*0x3a46*/      ldrb r3, [r1, #3]
/*0x3a48*/      ldrb r0, [r2, r0]
/*0x3a4a*/      cmp r3, #5
/*0x3a4c*/      beq jump_3a6c
/*0x3a4e*/      add.w r0, r0, r0, lsl #1
/*0x3a52*/      adds r4, r0, r1
/*0x3a54*/      adds r4, #0x58
            jump_3a56:
/*0x3a56*/      movs r2, #3
/*0x3a58*/      mov r1, r4
/*0x3a5a*/      ldr r0, [pc, #0x2c] /* data_3a88 */
/*0x3a5c*/      bl memcmp /* (ptr1, ptr2, size) */
/*0x3a60*/      cbz r0, jump_3a7e
/*0x3a62*/      ldrh r0, [r5]
/*0x3a64*/      strh r0, [r4]
/*0x3a66*/      ldrb r0, [r5, #2]
            jump_3a68:
/*0x3a68*/      strb r0, [r4, #2]
/*0x3a6a*/      pop {r4, r5, r6, pc}
            jump_3a6c:
/*0x3a6c*/      ldr r2, [pc, #0x28] /* data_3a98 */
/*0x3a6e*/      ldrb r0, [r2, r0]
/*0x3a70*/      and r0, r0, #7
/*0x3a74*/      add.w r0, r0, r0, lsl #1
/*0x3a78*/      adds r4, r0, r1
/*0x3a7a*/      adds r4, #0xb8
/*0x3a7c*/      b jump_3a56
            jump_3a7e:
/*0x3a7e*/      movs r0, #0
/*0x3a80*/      strh r0, [r4]
/*0x3a82*/      b jump_3a68

            data_3a84:
/*0x3a84*/  .word 0x20000054
            data_3a88:
/*0x3a88*/  .word 0x20000000
            data_3a8c:
/*0x3a8c*/  .word 0x20000060
            data_3a90:
/*0x3a90*/  .word 0x20000478
            data_3a94:
/*0x3a94*/  .word 0x20000114
            data_3a98:
/*0x3a98*/  .word data_79cb


            .thumb_func
            call_3a9c:
/*0x3a9c*/      movs r1, #3
/*0x3a9e*/      ldr r2, [pc, #0x10] /* data_3ab0 */
/*0x3aa0*/      b jump_3aa6
            jump_3aa2:
/*0x3aa2*/      ldrb r3, [r0, r1]
/*0x3aa4*/      strb r3, [r2, r1]
            jump_3aa6:
/*0x3aa6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3aa8*/      uxtb r1, r1
/*0x3aaa*/      bhs jump_3aa2
/*0x3aac*/      bx lr

/*0x3aae*/  .byte 0x00
/*0x3aaf*/  .byte 0x00

            data_3ab0:
/*0x3ab0*/  .word 0x20000000


            .thumb_func
            call_3ab4:
/*0x3ab4*/      ldr r0, [pc, #0x18] /* data_3ad0 */
/*0x3ab6*/      ldrb r0, [r0, #7]
/*0x3ab8*/      lsls r0, r0, #0x1f
/*0x3aba*/      beq jump_3acc
/*0x3abc*/      ldr r0, [pc, #0x14] /* data_3ad4 */
/*0x3abe*/      ldr r0, [r0, #4]
/*0x3ac0*/      movw r1, #0x9c40
/*0x3ac4*/      cmp r0, r1
/*0x3ac6*/      blo jump_3acc
/*0x3ac8*/      b.w jump_6a4c
            jump_3acc:
/*0x3acc*/      bx lr

/*0x3ace*/  .byte 0x00
/*0x3acf*/  .byte 0x00

            data_3ad0:
/*0x3ad0*/  .word 0x20000054
            data_3ad4:
/*0x3ad4*/  .word 0x20000000

            jump_3ad8:
/*0x3ad8*/      push {r4, r5, r6, lr}
/*0x3ada*/      cbz r0, jump_3b02
/*0x3adc*/      ldr r5, [pc, #0x3c] /* data_3b1c */
/*0x3ade*/      movs r4, #0x20
/*0x3ae0*/      ldr r6, [pc, #0x3c] /* data_3b20 */
/*0x3ae2*/      b jump_3afa
            jump_3ae4:
/*0x3ae4*/      ldrb r0, [r5], #-1
/*0x3ae8*/      and r0, r0, #7
/*0x3aec*/      add.w r0, r0, r0, lsl #1
/*0x3af0*/      adds r1, r0, r6
/*0x3af2*/      mov r0, r4
/*0x3af4*/      adds r1, #0xb8
/*0x3af6*/      bl call_3d80
            jump_3afa:
/*0x3afa*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3afc*/      uxtb r4, r4
/*0x3afe*/      bhs jump_3ae4
/*0x3b00*/      pop {r4, r5, r6, pc}
            jump_3b02:
/*0x3b02*/      ldr r5, [pc, #0x1c] /* data_3b20 */
/*0x3b04*/      adds r5, #0xb5
/*0x3b06*/      movs r4, #0x20
/*0x3b08*/      b jump_3b14
            jump_3b0a:
/*0x3b0a*/      mov r1, r5
/*0x3b0c*/      mov r0, r4
/*0x3b0e*/      bl call_3d80
/*0x3b12*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3b14:
/*0x3b14*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3b16*/      uxtb r4, r4
/*0x3b18*/      bhs jump_3b0a
/*0x3b1a*/      pop {r4, r5, r6, pc}

            data_3b1c:
/*0x3b1c*/  .word data_79ea
            data_3b20:
/*0x3b20*/  .word 0x20000478


            .thumb_func
            call_3b24:
/*0x3b24*/      cmp r0, #1
/*0x3b26*/      beq jump_3b32
/*0x3b28*/      movs r0, #5
            jump_3b2a:
/*0x3b2a*/      ldr r1, [pc, #0xc] /* data_3b38 */
/*0x3b2c*/      strb r0, [r1, #3]
/*0x3b2e*/      b.w call_3c8c
            jump_3b32:
/*0x3b32*/      movs r0, #4
/*0x3b34*/      b jump_3b2a

/*0x3b36*/  .byte 0x00
/*0x3b37*/  .byte 0x00

            data_3b38:
/*0x3b38*/  .word 0x20000478

            jump_3b3c:
/*0x3b3c*/      push {r4, lr}
/*0x3b3e*/      bl call_3b24
/*0x3b42*/      ldr r0, [pc, #0x1c] /* data_3b60 */
/*0x3b44*/      ldrb r1, [r0, #7]
/*0x3b46*/      orr r1, r1, #1
/*0x3b4a*/      strb r1, [r0, #7]
/*0x3b4c*/      ldr r0, [pc, #0x14] /* data_3b64 */
/*0x3b4e*/      movs r1, #1
/*0x3b50*/      str r1, [r0, #4]
/*0x3b52*/      ldr r1, [pc, #0x14] /* data_3b68 */
/*0x3b54*/      ldrh r2, [r1]
/*0x3b56*/      strh r2, [r0]
/*0x3b58*/      ldrb r1, [r1, #2]
/*0x3b5a*/      strb r1, [r0, #2]
/*0x3b5c*/      pop {r4, pc}

/*0x3b5e*/  .byte 0x00
/*0x3b5f*/  .byte 0x00

            data_3b60:
/*0x3b60*/  .word 0x20000054
            data_3b64:
/*0x3b64*/  .word 0x20000000
            data_3b68:
/*0x3b68*/  .word data_7950


            .thumb_func
            call_3b6c:
/*0x3b6c*/      push {r4, lr}
/*0x3b6e*/      mov r3, r1
/*0x3b70*/      movs r1, #0
/*0x3b72*/      bl call_6a70
/*0x3b76*/      mov r1, r0
/*0x3b78*/      ldr r0, [pc, #0x14] /* data_3b90 */
/*0x3b7a*/      mov.w r2, #0x1000
/*0x3b7e*/      cbz r3, jump_3b88
/*0x3b80*/      pop.w {r4, lr}
/*0x3b84*/      b.w jump_6a7c
            jump_3b88:
/*0x3b88*/      pop.w {r4, lr}
/*0x3b8c*/      b.w call_4044

            data_3b90:
/*0x3b90*/  .word 0x20000542


            .thumb_func
            call_3b94:
/*0x3b94*/      push {r3, r4, r5, lr}
/*0x3b96*/      mov r4, r0
/*0x3b98*/      movs r2, #2
/*0x3b9a*/      movs r1, #0
/*0x3b9c*/      mov r0, sp
/*0x3b9e*/      bl call_4044
/*0x3ba2*/      ldrh.w r1, [sp]
/*0x3ba6*/      cmp r1, #3
/*0x3ba8*/      beq jump_3bc6
/*0x3baa*/      cbz r4, jump_3bc2
/*0x3bac*/      bl call_3bcc
/*0x3bb0*/      movs r2, #2
/*0x3bb2*/      movs r1, #0
/*0x3bb4*/      mov r0, sp
/*0x3bb6*/      bl call_4044
/*0x3bba*/      ldrh.w r0, [sp]
/*0x3bbe*/      cmp r0, #3
/*0x3bc0*/      beq jump_3bc6
            jump_3bc2:
/*0x3bc2*/      movs r0, #0
/*0x3bc4*/      pop {r3, r4, r5, pc}
            jump_3bc6:
/*0x3bc6*/      movs r0, #1
/*0x3bc8*/      pop {r3, r4, r5, pc}

/*0x3bca*/  .byte 0x00
/*0x3bcb*/  .byte 0x00


            .thumb_func
            call_3bcc:
/*0x3bcc*/      ldr r1, [pc, #0x1c] /* data_3bec */
/*0x3bce*/      push {r4, lr}
/*0x3bd0*/      movs r0, #3
/*0x3bd2*/      strh r0, [r1]
/*0x3bd4*/      ldr r0, [pc, #0x14] /* data_3bec */
/*0x3bd6*/      movs r2, #0xff
/*0x3bd8*/      movs r1, #0x30
/*0x3bda*/      adds r0, #0x28
/*0x3bdc*/      bl mem_set /* (dest, size, val) */
/*0x3be0*/      bl call_3c34
/*0x3be4*/      pop.w {r4, lr}
/*0x3be8*/      b.w call_3c8c

            data_3bec:
/*0x3bec*/  .word 0x20000478


            .thumb_func
            call_3bf0:
/*0x3bf0*/      str r1, [r0, #0x28]
/*0x3bf2*/      bx lr

            .thumb_func
            call_3bf4:
/*0x3bf4*/      str r1, [r0, #0x24]
/*0x3bf6*/      bx lr

            bootloader_crc_magic:
/*0x3bf8*/  .byte 0x80
/*0x3bf9*/  .byte 0x20
/*0x3bfa*/  .byte 0x04
/*0x3bfb*/  .byte 0x03
/*0x3bfc*/  .byte 0x01
/*0x3bfd*/  .byte 0x00
/*0x3bfe*/  .byte 0x00
/*0x3bff*/  .byte 0x34
            flash_3c00_data:
/*0x3c00*/  .byte 0x04
/*0x3c01*/  .byte 0x00
/*0x3c02*/  .byte 0x02
/*0x3c03*/  .byte 0x00


            .thumb_func
            call_3c04:
/*0x3c04*/      push {r4, lr}
/*0x3c06*/      movs r2, #2
/*0x3c08*/      movs r1, #0
/*0x3c0a*/      ldr r0, [pc, #0x24] /* data_3c30 */
/*0x3c0c*/      bl call_4044
/*0x3c10*/      ldr r0, [pc, #0x1c] /* data_3c30 */
/*0x3c12*/      ldrh r0, [r0]
/*0x3c14*/      cmp r0, #3
/*0x3c16*/      beq jump_3c20
/*0x3c18*/      pop.w {r4, lr}
/*0x3c1c*/      b.w call_3bcc
            jump_3c20:
/*0x3c20*/      movs r2, #0xca
/*0x3c22*/      pop.w {r4, lr}
/*0x3c26*/      movs r1, #0
/*0x3c28*/      ldr r0, [pc, #4] /* data_3c30 */
/*0x3c2a*/      b.w call_4044

/*0x3c2e*/  .byte 0x00
/*0x3c2f*/  .byte 0x00

            data_3c30:
/*0x3c30*/  .word 0x20000478


            .thumb_func
            call_3c34:
/*0x3c34*/      push {r4, r5, r6, lr}
/*0x3c36*/      ldr r4, [pc, #0x4c] /* data_3c84 */
/*0x3c38*/      movs r5, #3
/*0x3c3a*/      movs r0, #0
/*0x3c3c*/      strh r5, [r4]
/*0x3c3e*/      strb r0, [r4, #2]
/*0x3c40*/      movs r0, #7
/*0x3c42*/      strb r0, [r4, #3]
/*0x3c44*/      adds r2, r4, #4
/*0x3c46*/      mov r3, r0
/*0x3c48*/      b jump_3c5e
            jump_3c4a:
/*0x3c4a*/      ldr r1, [pc, #0x3c] /* data_3c88 */
/*0x3c4c*/      movs r0, #5
/*0x3c4e*/      b jump_3c58
            jump_3c50:
/*0x3c50*/      ldrb r6, [r1], #1
/*0x3c54*/      strb r6, [r2], #1
            jump_3c58:
/*0x3c58*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3c5a*/      uxtb r0, r0
/*0x3c5c*/      bhs jump_3c50
            jump_3c5e:
/*0x3c5e*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x3c60*/      uxtb r3, r3
/*0x3c62*/      bhs jump_3c4a
/*0x3c64*/      ldr r0, [pc, #0x1c] /* data_3c84 */
/*0x3c66*/      strb r5, [r4, #0x11]
/*0x3c68*/      movs r1, #0x60
/*0x3c6a*/      adds r0, #0x58
/*0x3c6c*/      bl mem_zero /* (dest, size) */
/*0x3c70*/      ldr r0, [pc, #0x10] /* data_3c84 */
/*0x3c72*/      movs r1, #0x12
/*0x3c74*/      adds r0, #0xb8
/*0x3c76*/      bl mem_zero /* (dest, size) */
/*0x3c7a*/      pop.w {r4, r5, r6, lr}
/*0x3c7e*/      b.w call_3c8c

/*0x3c82*/  .byte 0x00
/*0x3c83*/  .byte 0x00

            data_3c84:
/*0x3c84*/  .word 0x20000478
            data_3c88:
/*0x3c88*/  .word data_7e74


            .thumb_func
            call_3c8c:
/*0x3c8c*/      movs r2, #0xca
/*0x3c8e*/      movs r1, #0
/*0x3c90*/      ldr r0, [pc, #4] /* data_3c98 */
/*0x3c92*/      b.w jump_6a7c

/*0x3c96*/  .byte 0x00
/*0x3c97*/  .byte 0x00

            data_3c98:
/*0x3c98*/  .word 0x20000478


            .thumb_func
            call_3c9c:
/*0x3c9c*/      add.w r0, r0, r1, lsr #3
/*0x3ca0*/      and r3, r1, #7
/*0x3ca4*/      movs r1, #1
/*0x3ca6*/      lsls r1, r3
/*0x3ca8*/      cmp r2, #0
/*0x3caa*/      ldrb r2, [r0]
/*0x3cac*/      uxtb r1, r1
/*0x3cae*/      beq jump_3cb4
/*0x3cb0*/      orrs r2, r1
/*0x3cb2*/      b jump_3cb6
            jump_3cb4:
/*0x3cb4*/      bics r2, r1
            jump_3cb6:
/*0x3cb6*/      strb r2, [r0]
/*0x3cb8*/      bx lr

            .thumb_func
            call_3cba:
/*0x3cba*/      push {r4, r5, r6, lr}
/*0x3cbc*/      mov r6, r0
            jump_3cbe:
/*0x3cbe*/      movs r5, #0
/*0x3cc0*/      movs r4, #3
/*0x3cc2*/      b jump_3cd0
            jump_3cc4:
/*0x3cc4*/      bl rand
/*0x3cc8*/      uxtb r0, r0
/*0x3cca*/      strb r0, [r6, r4]
/*0x3ccc*/      add r0, r5
/*0x3cce*/      uxth r5, r0
            jump_3cd0:
/*0x3cd0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3cd2*/      uxtb r4, r4
/*0x3cd4*/      bhs jump_3cc4
/*0x3cd6*/      cmp r5, #0xe0
/*0x3cd8*/      blo jump_3cbe
/*0x3cda*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_3cdc:
/*0x3cdc*/      push {r4, r5, lr}
/*0x3cde*/      lsls r3, r1, #1
/*0x3ce0*/      cmp r3, #0xff
/*0x3ce2*/      bls jump_3cea
/*0x3ce4*/      rsb.w r3, r3, #0x1fe
/*0x3ce8*/      uxth r3, r3
            jump_3cea:
/*0x3cea*/      movs r4, #0x2b
/*0x3cec*/      udiv r4, r0, r4
/*0x3cf0*/      movs r5, #0x55
/*0x3cf2*/      mla r0, r4, r5, r0
/*0x3cf6*/      sub.w r1, r1, r3, lsr #1
/*0x3cfa*/      uxtb r1, r1
/*0x3cfc*/      add.w r0, r0, r0, lsl #1
/*0x3d00*/      strb r1, [r2]
/*0x3d02*/      lsls r0, r0, #0x19
/*0x3d04*/      strb r1, [r2, #1]
/*0x3d06*/      lsrs r0, r0, #0x18
/*0x3d08*/      strb r1, [r2, #2]
/*0x3d0a*/      lsls r5, r4, #0x1f
/*0x3d0c*/      beq jump_3d12
/*0x3d0e*/      rsb.w r0, r0, #0xff
            jump_3d12:
/*0x3d12*/      muls r0, r3, r0
/*0x3d14*/      ubfx r0, r0, #8, #8
/*0x3d18*/      cmp r4, #5
/*0x3d1a*/      bhs jump_3d50
/*0x3d1c*/      tbb [pc, r4]

/*0x3d20*/  .byte 0x03 /* case switch_3d26 */
/*0x3d21*/  .byte 0x07 /* case switch_3d2e */
/*0x3d22*/  .byte 0x0c /* case switch_3d38 */
/*0x3d23*/  .byte 0x10 /* case switch_3d40 */
/*0x3d24*/  .byte 0x13 /* case switch_3d46 */
/*0x3d25*/  .byte 0x00

            switch_3d26:
/*0x3d26*/      add r3, r1
/*0x3d28*/      strb r3, [r2]
/*0x3d2a*/      add r0, r1
/*0x3d2c*/      b jump_3d34
            switch_3d2e:
/*0x3d2e*/      add r0, r1
/*0x3d30*/      strb r0, [r2]
/*0x3d32*/      adds r0, r1, r3
            jump_3d34:
/*0x3d34*/      strb r0, [r2, #1]
/*0x3d36*/      pop {r4, r5, pc}
            switch_3d38:
/*0x3d38*/      add r3, r1
/*0x3d3a*/      strb r3, [r2, #1]
            jump_3d3c:
/*0x3d3c*/      add r0, r1
/*0x3d3e*/      b jump_3d4c
            switch_3d40:
/*0x3d40*/      add r0, r1
/*0x3d42*/      strb r0, [r2, #1]
/*0x3d44*/      b jump_3d4a
            switch_3d46:
/*0x3d46*/      add r0, r1
/*0x3d48*/      strb r0, [r2]
            jump_3d4a:
/*0x3d4a*/      adds r0, r1, r3
            jump_3d4c:
/*0x3d4c*/      strb r0, [r2, #2]
/*0x3d4e*/      pop {r4, r5, pc}
            jump_3d50:
/*0x3d50*/      add r3, r1
/*0x3d52*/      strb r3, [r2]
/*0x3d54*/      b jump_3d3c

/*0x3d56*/  .byte 0x00
/*0x3d57*/  .byte 0x00

            jump_3d58:
/*0x3d58*/      push {r4, lr}
/*0x3d5a*/      ldr r1, [pc, #0x20] /* data_3d7c */
/*0x3d5c*/      movs r3, #0x20
/*0x3d5e*/      b jump_3d74
            jump_3d60:
/*0x3d60*/      movs r2, #3
/*0x3d62*/      b jump_3d6c
            jump_3d64:
/*0x3d64*/      ldrb r4, [r0], #1
/*0x3d68*/      strb r4, [r1], #0x20
            jump_3d6c:
/*0x3d6c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x3d6e*/      uxtb r2, r2
/*0x3d70*/      bhs jump_3d64
/*0x3d72*/      subs r1, #0x5f
            jump_3d74:
/*0x3d74*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x3d76*/      uxtb r3, r3
/*0x3d78*/      bhs jump_3d60
/*0x3d7a*/      pop {r4, pc}

            data_3d7c:
/*0x3d7c*/  .word 0x20000240


            .thumb_func
            call_3d80:
/*0x3d80*/      cmp r0, #0xff
/*0x3d82*/      beq jump_3d9a
/*0x3d84*/      ldr r2, [pc, #0x14] /* data_3d9c */
/*0x3d86*/      add r2, r0
/*0x3d88*/      movs r0, #0
            jump_3d8a:
/*0x3d8a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x3d8c*/      ldrb r3, [r1], #1
/*0x3d90*/      uxtb r0, r0
/*0x3d92*/      strb r3, [r2], #0x20
/*0x3d96*/      cmp r0, #3
/*0x3d98*/      blo jump_3d8a
            jump_3d9a:
/*0x3d9a*/      bx lr

            data_3d9c:
/*0x3d9c*/  .word 0x20000240


            .thumb_func
            call_3da0:
/*0x3da0*/      cmp r0, #0xff
/*0x3da2*/      beq jump_3db6
/*0x3da4*/      ldr r2, [pc, #0x10] /* data_3db8 */
/*0x3da6*/      add r0, r2
/*0x3da8*/      movs r2, #3
/*0x3daa*/      b jump_3db0
            jump_3dac:
/*0x3dac*/      strb r1, [r0], #0x20
            jump_3db0:
/*0x3db0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x3db2*/      uxtb r2, r2
/*0x3db4*/      bhs jump_3dac
            jump_3db6:
/*0x3db6*/      bx lr

            data_3db8:
/*0x3db8*/  .word 0x20000240


            .thumb_func
            call_3dbc:
/*0x3dbc*/      push {r2, r3, r4, r5, r6, lr}
/*0x3dbe*/      ldr r4, [pc, #0x20] /* data_3de0 */
/*0x3dc0*/      movs r0, #5
/*0x3dc2*/      strh.w r0, [sp]
/*0x3dc6*/      mov.w r5, #0x400
/*0x3dca*/      str r5, [r4, #0x28]
/*0x3dcc*/      movs r2, #2
/*0x3dce*/      add r1, sp, #4
/*0x3dd0*/      mov r0, sp
/*0x3dd2*/      bl call_4084
/*0x3dd6*/      str r5, [r4, #0x24]
/*0x3dd8*/      ldrb.w r0, [sp, #5]
/*0x3ddc*/      pop {r2, r3, r4, r5, r6, pc}

/*0x3dde*/  .byte 0x00
/*0x3ddf*/  .byte 0x00

            data_3de0:
/*0x3de0*/  .word 0x400b2000


            .thumb_func
            call_3de4:
/*0x3de4*/      push {r4, r5, r6, lr}
/*0x3de6*/      sub sp, #0x30
/*0x3de8*/      bl call_3e68
/*0x3dec*/      ldr r6, [pc, #0x60] /* data_3e50 */
/*0x3dee*/      ldrb r0, [r6]
/*0x3df0*/      cmp r0, #1
/*0x3df2*/      bne jump_3e48
/*0x3df4*/      movs r4, #0
/*0x3df6*/      mov r2, r4
/*0x3df8*/      movs r1, #0x20
/*0x3dfa*/      movs r3, #1
/*0x3dfc*/      mov r0, r2
/*0x3dfe*/      bl call_398c
/*0x3e02*/      mov.w r0, #0x4000
/*0x3e06*/      asrs r5, r0, #4
/*0x3e08*/      strd r0, r5, [sp]
/*0x3e0c*/      movs r0, #8
/*0x3e0e*/      strd r0, r4, [sp, #8]
/*0x3e12*/      str r4, [sp, #0x10]
/*0x3e14*/      str r4, [sp, #0x14]
/*0x3e16*/      movs r0, #4
/*0x3e18*/      str r4, [sp, #0x18]
/*0x3e1a*/      strd r4, r0, [sp, #0x1c]
/*0x3e1e*/      ldr r4, [pc, #0x34] /* data_3e54 */
/*0x3e20*/      str r0, [sp, #0x24]
/*0x3e22*/      str r0, [sp, #0x28]
/*0x3e24*/      mov r1, sp
/*0x3e26*/      mov r0, r4
/*0x3e28*/      bl call_5f98
/*0x3e2c*/      movs r1, #1
/*0x3e2e*/      mov r0, r4
/*0x3e30*/      bl call_5fe2
/*0x3e34*/      ldr r0, [pc, #0x20] /* data_3e58 */
/*0x3e36*/      str r5, [r0, #0x24]
/*0x3e38*/      movs r1, #1
/*0x3e3a*/      mov r0, r4
/*0x3e3c*/      bl call_5f84
/*0x3e40*/      bl call_3f04
/*0x3e44*/      movs r0, #2
/*0x3e46*/      strb r0, [r6]
            jump_3e48:
/*0x3e48*/      add sp, #0x30
/*0x3e4a*/      movs r0, #1
/*0x3e4c*/      pop {r4, r5, r6, pc}

/*0x3e4e*/  .byte 0x00
/*0x3e4f*/  .byte 0x00

            data_3e50:
/*0x3e50*/  .word 0x20000014
            data_3e54:
/*0x3e54*/  .word 0x40044000
            data_3e58:
/*0x3e58*/  .word 0x400b2000


            .thumb_func
            call_3e5c:
/*0x3e5c*/      push {r4, lr}
/*0x3e5e*/      bl call_3dbc
/*0x3e62*/      ubfx r0, r0, #0, #1
/*0x3e66*/      pop {r4, pc}

            .thumb_func
            call_3e68:
/*0x3e68*/      push {r4, r5, r6, lr}
/*0x3e6a*/      ldr r4, [pc, #0x48] /* data_3eb4 */
/*0x3e6c*/      ldrb r0, [r4]
/*0x3e6e*/      cbnz r0, jump_3eb0
/*0x3e70*/      movs r1, #0
/*0x3e72*/      mov.w r0, #0x20000
/*0x3e76*/      movs r3, #1
/*0x3e78*/      mov r2, r1
/*0x3e7a*/      bl call_398c
/*0x3e7e*/      ldr r6, [pc, #0x38] /* data_3eb8 */
/*0x3e80*/      mov.w r5, #0x400
/*0x3e84*/      movs r2, #0
/*0x3e86*/      mov r1, r5
/*0x3e88*/      mov r0, r6
/*0x3e8a*/      bl call_4244
/*0x3e8e*/      movs r2, #1
/*0x3e90*/      mov r1, r5
/*0x3e92*/      mov r0, r6
/*0x3e94*/      bl call_4214
/*0x3e98*/      movs r2, #1
/*0x3e9a*/      movs r1, #0x80
/*0x3e9c*/      mov r0, r6
/*0x3e9e*/      bl call_4214
/*0x3ea2*/      movs r2, #1
/*0x3ea4*/      lsls r1, r2, #8
/*0x3ea6*/      mov r0, r6
/*0x3ea8*/      bl call_4214
/*0x3eac*/      movs r0, #1
/*0x3eae*/      strb r0, [r4]
            jump_3eb0:
/*0x3eb0*/      movs r0, #1
/*0x3eb2*/      pop {r4, r5, r6, pc}

            data_3eb4:
/*0x3eb4*/  .word 0x20000014
            data_3eb8:
/*0x3eb8*/  .word 0x400b2000

            jump_3ebc:
/*0x3ebc*/      push {r4, r5, r6, lr}
/*0x3ebe*/      bl call_401c
/*0x3ec2*/      ldr r5, [pc, #0x3c] /* data_3f00 */
/*0x3ec4*/      mov.w r4, #0x400
/*0x3ec8*/      movs r2, #0
/*0x3eca*/      mov r1, r4
/*0x3ecc*/      mov r0, r5
/*0x3ece*/      bl call_4244
/*0x3ed2*/      movs r2, #0
/*0x3ed4*/      mov r1, r4
/*0x3ed6*/      mov r0, r5
/*0x3ed8*/      bl call_4204
/*0x3edc*/      movs r2, #0
/*0x3ede*/      movs r1, #7
/*0x3ee0*/      movs r0, #1
/*0x3ee2*/      bl call_37e4
/*0x3ee6*/      movs r2, #0
/*0x3ee8*/      movs r1, #8
/*0x3eea*/      movs r0, #1
/*0x3eec*/      bl call_37e4
/*0x3ef0*/      pop.w {r4, r5, r6, lr}
/*0x3ef4*/      movs r2, #0
/*0x3ef6*/      movs r1, #9
/*0x3ef8*/      movs r0, #1
/*0x3efa*/      b.w call_37e4

/*0x3efe*/  .byte 0x00
/*0x3eff*/  .byte 0x00

            data_3f00:
/*0x3f00*/  .word 0x400b2000


            .thumb_func
            call_3f04:
/*0x3f04*/      push {r4, r5, r6, lr}
/*0x3f06*/      movs r2, #1
/*0x3f08*/      ldr r5, [pc, #0x38] /* data_3f44 */
/*0x3f0a*/      lsls r4, r2, #0xa
/*0x3f0c*/      mov r1, r4
/*0x3f0e*/      mov r0, r5
/*0x3f10*/      bl call_4204
/*0x3f14*/      movs r2, #2
/*0x3f16*/      mov r1, r4
/*0x3f18*/      mov r0, r5
/*0x3f1a*/      bl call_4244
/*0x3f1e*/      movs r2, #5
/*0x3f20*/      movs r1, #7
/*0x3f22*/      movs r0, #1
/*0x3f24*/      bl call_37e4
/*0x3f28*/      movs r2, #5
/*0x3f2a*/      movs r1, #8
/*0x3f2c*/      movs r0, #1
/*0x3f2e*/      bl call_37e4
/*0x3f32*/      movs r2, #5
/*0x3f34*/      movs r1, #9
/*0x3f36*/      movs r0, #1
/*0x3f38*/      bl call_37e4
/*0x3f3c*/      pop.w {r4, r5, r6, lr}
/*0x3f40*/      b.w jump_411c

            data_3f44:
/*0x3f44*/  .word 0x400b2000


            .thumb_func
            call_3f48:
/*0x3f48*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x3f4c*/      mov r7, r2
/*0x3f4e*/      mov r4, r1
/*0x3f50*/      mov r8, r0
/*0x3f52*/      bl call_41bc
/*0x3f56*/      ldr r6, [pc, #0x38] /* data_3f90 */
/*0x3f58*/      mov.w r5, #0x400
/*0x3f5c*/      str r5, [r6, #0x28]
/*0x3f5e*/      movs r0, #2
/*0x3f60*/      strb.w r0, [sp]
/*0x3f64*/      lsrs r0, r4, #0x10
/*0x3f66*/      strb.w r0, [sp, #1]
/*0x3f6a*/      lsrs r0, r4, #8
/*0x3f6c*/      strb.w r0, [sp, #2]
/*0x3f70*/      strb.w r4, [sp, #3]
/*0x3f74*/      movs r2, #4
/*0x3f76*/      movs r1, #0
/*0x3f78*/      mov r0, sp
/*0x3f7a*/      bl call_4084
/*0x3f7e*/      mov r2, r7
/*0x3f80*/      movs r1, #0
/*0x3f82*/      mov r0, r8
/*0x3f84*/      bl call_4084
/*0x3f88*/      str r5, [r6, #0x24]
/*0x3f8a*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

/*0x3f8e*/  .byte 0x00
/*0x3f8f*/  .byte 0x00

            data_3f90:
/*0x3f90*/  .word 0x400b2000


            .thumb_func
            call_3f94:
/*0x3f94*/      push {r3, r4, r5, r6, r7, lr}
/*0x3f96*/      mov r4, r0
/*0x3f98*/      bl call_41bc
/*0x3f9c*/      ldr r6, [pc, #0x28] /* data_3fc8 */
/*0x3f9e*/      mov.w r5, #0x400
/*0x3fa2*/      str r5, [r6, #0x28]
/*0x3fa4*/      movs r0, #0x20
/*0x3fa6*/      strb.w r0, [sp]
/*0x3faa*/      lsrs r0, r4, #0x10
/*0x3fac*/      strb.w r0, [sp, #1]
/*0x3fb0*/      lsrs r0, r4, #8
/*0x3fb2*/      strb.w r0, [sp, #2]
/*0x3fb6*/      strb.w r4, [sp, #3]
/*0x3fba*/      movs r2, #4
/*0x3fbc*/      movs r1, #0
/*0x3fbe*/      mov r0, sp
/*0x3fc0*/      bl call_4084
/*0x3fc4*/      str r5, [r6, #0x24]
/*0x3fc6*/      pop {r3, r4, r5, r6, r7, pc}

            data_3fc8:
/*0x3fc8*/  .word 0x400b2000


            .thumb_func
            call_3fcc:
/*0x3fcc*/      push {r3, r4, r5, r6, r7, lr}
/*0x3fce*/      mov r6, r0
/*0x3fd0*/      bl call_41bc
/*0x3fd4*/      ldr r4, [pc, #0x1c] /* data_3ff4 */
/*0x3fd6*/      mov.w r5, #0x400
/*0x3fda*/      str r5, [r4, #0x28]
/*0x3fdc*/      movs r0, #1
/*0x3fde*/      strb.w r0, [sp]
/*0x3fe2*/      strb.w r6, [sp, #1]
/*0x3fe6*/      movs r2, #2
/*0x3fe8*/      movs r1, #0
/*0x3fea*/      mov r0, sp
/*0x3fec*/      bl call_4084
/*0x3ff0*/      str r5, [r4, #0x24]
/*0x3ff2*/      pop {r3, r4, r5, r6, r7, pc}

            data_3ff4:
/*0x3ff4*/  .word 0x400b2000


            .thumb_func
            call_3ff8:
/*0x3ff8*/      push {r4, lr}
/*0x3ffa*/      movs r4, #0x3c
/*0x3ffc*/      bl call_3f48
/*0x4000*/      b jump_400e
            jump_4002:
/*0x4002*/      movs r0, #0x64
/*0x4004*/      bl spin_wait /* (time) */
/*0x4008*/      bl call_3e5c
/*0x400c*/      cbz r0, jump_4016
            jump_400e:
/*0x400e*/      mov r0, r4
/*0x4010*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4012*/      bhs jump_4002
/*0x4014*/      pop {r4, pc}
            jump_4016:
/*0x4016*/      movs r0, #1
/*0x4018*/      pop {r4, pc}

/*0x401a*/  .byte 0x00
/*0x401b*/  .byte 0x00


            .thumb_func
            call_401c:
/*0x401c*/      push {r3, r4, r5, lr}
/*0x401e*/      ldr r4, [pc, #0x20] /* data_4040 */
/*0x4020*/      movs r0, #0xb9
/*0x4022*/      strb.w r0, [sp]
/*0x4026*/      mov.w r5, #0x400
/*0x402a*/      str r5, [r4, #0x28]
/*0x402c*/      movs r2, #1
/*0x402e*/      movs r1, #0
/*0x4030*/      mov r0, sp
/*0x4032*/      bl call_4084
/*0x4036*/      str r5, [r4, #0x24]
/*0x4038*/      movs r0, #0xa
/*0x403a*/      bl spin_wait /* (time) */
/*0x403e*/      pop {r3, r4, r5, pc}

            data_4040:
/*0x4040*/  .word 0x400b2000


            .thumb_func
            call_4044:
/*0x4044*/      push {r3, r4, r5, r6, r7, lr}
/*0x4046*/      ldr r5, [pc, #0x38] /* data_4080 */
/*0x4048*/      mov.w r4, #0x400
/*0x404c*/      mov r7, r2
/*0x404e*/      mov r6, r0
/*0x4050*/      str r4, [r5, #0x28]
/*0x4052*/      movs r0, #3
/*0x4054*/      strb.w r0, [sp]
/*0x4058*/      lsrs r0, r1, #0x10
/*0x405a*/      strb.w r0, [sp, #1]
/*0x405e*/      lsrs r0, r1, #8
/*0x4060*/      strb.w r0, [sp, #2]
/*0x4064*/      strb.w r1, [sp, #3]
/*0x4068*/      movs r2, #4
/*0x406a*/      movs r1, #0
/*0x406c*/      mov r0, sp
/*0x406e*/      bl call_4084
/*0x4072*/      mov r2, r7
/*0x4074*/      mov r1, r6
/*0x4076*/      movs r0, #0
/*0x4078*/      bl call_4084
/*0x407c*/      str r4, [r5, #0x24]
/*0x407e*/      pop {r3, r4, r5, r6, r7, pc}

            data_4080:
/*0x4080*/  .word 0x400b2000


            .thumb_func
            call_4084:
/*0x4084*/      push {r4, r5, r6, r7, lr}
/*0x4086*/      movs r3, #0
/*0x4088*/      cmp r2, #8
/*0x408a*/      bls jump_4090
/*0x408c*/      movs r4, #8
/*0x408e*/      b jump_4092
            jump_4090:
/*0x4090*/      mov r4, r2
            jump_4092:
/*0x4092*/      movs r5, #0
/*0x4094*/      mov r7, r5
/*0x4096*/      ldr r6, [pc, #0x58] /* data_40f0 */
/*0x4098*/      b jump_40a6
            jump_409a:
/*0x409a*/      cbz r0, jump_40ac
/*0x409c*/      ldrb.w ip, [r0, r5]
/*0x40a0*/      str.w ip, [r6, #0x10]
            jump_40a4:
/*0x40a4*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_40a6:
/*0x40a6*/      cmp r5, r4
/*0x40a8*/      blo jump_409a
/*0x40aa*/      b jump_40ce
            jump_40ac:
/*0x40ac*/      str r7, [r6, #0x10]
/*0x40ae*/      b jump_40a4
            jump_40b0:
/*0x40b0*/      ldr r5, [r6, #0x1c]
/*0x40b2*/      tst.w r5, #0xf0
/*0x40b6*/      beq jump_40b0
/*0x40b8*/      ldr r5, [r6, #0x10]
/*0x40ba*/      uxtb r5, r5
/*0x40bc*/      cbz r0, jump_40d4
/*0x40be*/      ldrb.w ip, [r0, r4]
/*0x40c2*/      str.w ip, [r6, #0x10]
            jump_40c6:
/*0x40c6*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x40c8*/      cbz r1, jump_40cc
/*0x40ca*/      strb r5, [r1, r3]
            jump_40cc:
/*0x40cc*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_40ce:
/*0x40ce*/      cmp r4, r2
/*0x40d0*/      blo jump_40b0
/*0x40d2*/      b jump_40ea
            jump_40d4:
/*0x40d4*/      str r7, [r6, #0x10]
/*0x40d6*/      b jump_40c6
            jump_40d8:
/*0x40d8*/      ldr r0, [r6, #0x1c]
/*0x40da*/      tst.w r0, #0xf0
/*0x40de*/      beq jump_40d8
/*0x40e0*/      ldr r0, [r6, #0x10]
/*0x40e2*/      uxtb r0, r0
/*0x40e4*/      cbz r1, jump_40e8
/*0x40e6*/      strb r0, [r1, r3]
            jump_40e8:
/*0x40e8*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_40ea:
/*0x40ea*/      cmp r3, r2
/*0x40ec*/      blo jump_40d8
/*0x40ee*/      pop {r4, r5, r6, r7, pc}

            data_40f0:
/*0x40f0*/  .word 0x40044000


            .thumb_func
            call_40f4:
/*0x40f4*/      push {r4, r5, r6, lr}
/*0x40f6*/      movw r4, #0x12d
/*0x40fa*/      bl call_3f94
/*0x40fe*/      mov.w r5, #0x3e8
/*0x4102*/      b jump_4110
            jump_4104:
/*0x4104*/      mov r0, r5
/*0x4106*/      bl spin_wait /* (time) */
/*0x410a*/      bl call_3e5c
/*0x410e*/      cbz r0, jump_4118
            jump_4110:
/*0x4110*/      mov r0, r4
/*0x4112*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4114*/      bhs jump_4104
/*0x4116*/      pop {r4, r5, r6, pc}
            jump_4118:
/*0x4118*/      movs r0, #1
/*0x411a*/      pop {r4, r5, r6, pc}
            jump_411c:
/*0x411c*/      push {r3, r4, r5, lr}
/*0x411e*/      ldr r4, [pc, #0x20] /* data_4140 */
/*0x4120*/      movs r0, #0xab
/*0x4122*/      strb.w r0, [sp]
/*0x4126*/      mov.w r5, #0x400
/*0x412a*/      str r5, [r4, #0x28]
/*0x412c*/      movs r2, #1
/*0x412e*/      movs r1, #0
/*0x4130*/      mov r0, sp
/*0x4132*/      bl call_4084
/*0x4136*/      str r5, [r4, #0x24]
/*0x4138*/      movs r0, #0xa
/*0x413a*/      bl spin_wait /* (time) */
/*0x413e*/      pop {r3, r4, r5, pc}

            data_4140:
/*0x4140*/  .word 0x400b2000

            jump_4144:
/*0x4144*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4148*/      mov r5, r1
/*0x414a*/      mov r6, r0
/*0x414c*/      rsbs r0, r5, #0
/*0x414e*/      uxtb r4, r0
/*0x4150*/      cmp r4, r2
/*0x4152*/      bhs jump_415e
/*0x4154*/      subs r0, r2, r4
/*0x4156*/      ubfx r7, r0, #8, #0x10
/*0x415a*/      uxtb r0, r0
/*0x415c*/      b jump_4164
            jump_415e:
/*0x415e*/      movs r7, #0
/*0x4160*/      uxth r4, r2
/*0x4162*/      mov r0, r7
            jump_4164:
/*0x4164*/      mov r8, r0
/*0x4166*/      cbz r4, jump_4178
/*0x4168*/      mov r2, r4
/*0x416a*/      mov r0, r6
/*0x416c*/      bl call_3ff8
/*0x4170*/      cmp r0, #1
/*0x4172*/      bne jump_41b0
/*0x4174*/      add r5, r4
/*0x4176*/      add r6, r4
            jump_4178:
/*0x4178*/      movs r4, #0
/*0x417a*/      mov.w sb, #0x100
/*0x417e*/      b jump_4198
            jump_4180:
/*0x4180*/      mov r2, sb
/*0x4182*/      mov r1, r5
/*0x4184*/      mov r0, r6
/*0x4186*/      bl call_3ff8
/*0x418a*/      cmp r0, #1
/*0x418c*/      bne jump_41b0
/*0x418e*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4190*/      add.w r5, r5, #0x100
/*0x4194*/      add.w r6, r6, #0x100
            jump_4198:
/*0x4198*/      cmp r4, r7
/*0x419a*/      blt jump_4180
/*0x419c*/      subs.w r0, r8, #0
/*0x41a0*/      beq jump_41b6
/*0x41a2*/      mov r2, r0
/*0x41a4*/      mov r1, r5
/*0x41a6*/      mov r0, r6
/*0x41a8*/      bl call_3ff8
/*0x41ac*/      cmp r0, #1
/*0x41ae*/      beq jump_41b6
            jump_41b0:
/*0x41b0*/      movs r0, #0
            jump_41b2:
/*0x41b2*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_41b6:
/*0x41b6*/      movs r0, #1
/*0x41b8*/      b jump_41b2

/*0x41ba*/  .byte 0x00
/*0x41bb*/  .byte 0x00


            .thumb_func
            call_41bc:
/*0x41bc*/      push {r3, r4, r5, lr}
/*0x41be*/      ldr r4, [pc, #0x1c] /* data_41dc */
/*0x41c0*/      movs r0, #6
/*0x41c2*/      strb.w r0, [sp]
/*0x41c6*/      mov.w r5, #0x400
/*0x41ca*/      str r5, [r4, #0x28]
/*0x41cc*/      movs r2, #1
/*0x41ce*/      movs r1, #0
/*0x41d0*/      mov r0, sp
/*0x41d2*/      bl call_4084
/*0x41d6*/      str r5, [r4, #0x24]
/*0x41d8*/      pop {r3, r4, r5, pc}

/*0x41da*/  .byte 0x00
/*0x41db*/  .byte 0x00

            data_41dc:
/*0x41dc*/  .word 0x400b2000


            .thumb_func
            call_41e0:
/*0x41e0*/      push {r4, lr}
/*0x41e2*/      mov.w r4, #0x19a
/*0x41e6*/      bl call_3fcc
/*0x41ea*/      b jump_41f8
            jump_41ec:
/*0x41ec*/      movs r0, #0x64
/*0x41ee*/      bl spin_wait /* (time) */
/*0x41f2*/      bl call_3e5c
/*0x41f6*/      cbz r0, jump_4200
            jump_41f8:
/*0x41f8*/      mov r0, r4
/*0x41fa*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x41fc*/      bhs jump_41ec
/*0x41fe*/      pop {r4, pc}
            jump_4200:
/*0x4200*/      movs r0, #1
/*0x4202*/      pop {r4, pc}

            .thumb_func
            call_4204:
/*0x4204*/      cmp r2, #0
/*0x4206*/      ldr r2, [r0]
/*0x4208*/      beq jump_420e
/*0x420a*/      orrs r2, r1
/*0x420c*/      b jump_4210
            jump_420e:
/*0x420e*/      bics r2, r1
            jump_4210:
/*0x4210*/      str r2, [r0]
/*0x4212*/      bx lr

            .thumb_func
            call_4214:
/*0x4214*/      cmp r2, #0
/*0x4216*/      ldr r2, [r0, #0x14]
/*0x4218*/      beq jump_421e
/*0x421a*/      orrs r2, r1
/*0x421c*/      b jump_4220
            jump_421e:
/*0x421e*/      bics r2, r1
            jump_4220:
/*0x4220*/      str r2, [r0, #0x14]
/*0x4222*/      bx lr

            .thumb_func
            call_4224:
/*0x4224*/      cmp r2, #0
/*0x4226*/      ldr r2, [r0, #4]
/*0x4228*/      beq jump_422e
/*0x422a*/      orrs r2, r1
/*0x422c*/      b jump_4230
            jump_422e:
/*0x422e*/      bics r2, r1
            jump_4230:
/*0x4230*/      str r2, [r0, #4]
/*0x4232*/      bx lr

            .thumb_func
            call_4234:
/*0x4234*/      cmp r2, #0
/*0x4236*/      ldr r2, [r0, #0x10]
/*0x4238*/      beq jump_423e
/*0x423a*/      orrs r2, r1
/*0x423c*/      b jump_4240
            jump_423e:
/*0x423e*/      bics r2, r1
            jump_4240:
/*0x4240*/      str r2, [r0, #0x10]
/*0x4242*/      bx lr

            .thumb_func
            call_4244:
/*0x4244*/      cbz r2, jump_4258
/*0x4246*/      cmp r2, #1
/*0x4248*/      beq jump_425e
/*0x424a*/      ldr r2, [r0, #8]
/*0x424c*/      bics r2, r1
            jump_424e:
/*0x424e*/      str r2, [r0, #8]
/*0x4250*/      ldr r2, [r0, #0xc]
/*0x4252*/      bics r2, r1
/*0x4254*/      str r2, [r0, #0xc]
/*0x4256*/      bx lr
            jump_4258:
/*0x4258*/      ldr r2, [r0, #8]
/*0x425a*/      orrs r2, r1
/*0x425c*/      b jump_424e
            jump_425e:
/*0x425e*/      ldr r2, [r0, #0xc]
/*0x4260*/      orrs r2, r1
/*0x4262*/      str r2, [r0, #0xc]
/*0x4264*/      ldr r2, [r0, #8]
/*0x4266*/      bics r2, r1
/*0x4268*/      str r2, [r0, #8]
/*0x426a*/      bx lr

            .thumb_func
            call_426c:
/*0x426c*/      ldr r0, [r0, #0x1c]
/*0x426e*/      ands r0, r1
/*0x4270*/      beq jump_4274
/*0x4272*/      movs r0, #1
            jump_4274:
/*0x4274*/      bx lr

            .thumb_func
            call_4276:
/*0x4276*/      cbz r2, jump_427c
/*0x4278*/      str r1, [r0, #0x24]
/*0x427a*/      bx lr
            jump_427c:
/*0x427c*/      str r1, [r0, #0x28]
/*0x427e*/      bx lr

            .thumb_func
            call_4280:
/*0x4280*/      cmp r1, #0
/*0x4282*/      ldr r1, [r0, #0x10]
/*0x4284*/      beq jump_428c
/*0x4286*/      orr r1, r1, #1
/*0x428a*/      b jump_4290
            jump_428c:
/*0x428c*/      bic r1, r1, #1
            jump_4290:
/*0x4290*/      str r1, [r0, #0x10]
/*0x4292*/      bx lr

            .thumb_func
            call_4294:
/*0x4294*/      push {r4, r5, r6, r7, lr}
/*0x4296*/      ldrb r3, [r1]
/*0x4298*/      ldr r7, [r0, #0x50]
/*0x429a*/      add.w r4, r0, r3, lsl #2
/*0x429e*/      add.w r2, r4, #0x40
/*0x42a2*/      add.w r5, r4, #0x90
/*0x42a6*/      add.w r6, r4, #0xa0
/*0x42aa*/      lsls r3, r3, #1
/*0x42ac*/      movs r4, #1
/*0x42ae*/      lsls r4, r3
/*0x42b0*/      mvns r4, r4
/*0x42b2*/      ands r7, r4
/*0x42b4*/      str r7, [r0, #0x50]
/*0x42b6*/      ldr r7, [r0, #0x54]
/*0x42b8*/      ands r7, r4
/*0x42ba*/      str r7, [r0, #0x54]
/*0x42bc*/      ldr r4, [r0, #0x54]
/*0x42be*/      ldrb r7, [r1, #5]
/*0x42c0*/      lsls r7, r3
/*0x42c2*/      orrs r4, r7
/*0x42c4*/      str r4, [r0, #0x54]
/*0x42c6*/      ldr r4, [r2]
/*0x42c8*/      movw r7, #0x107
/*0x42cc*/      bics r4, r7
/*0x42ce*/      str r4, [r2]
/*0x42d0*/      ldr r4, [r2]
/*0x42d2*/      ldrh r7, [r1, #2]
/*0x42d4*/      orrs r4, r7
/*0x42d6*/      str r4, [r2]
/*0x42d8*/      ldrh r2, [r1, #6]
/*0x42da*/      str r2, [r5]
/*0x42dc*/      ldrh r2, [r1, #8]
/*0x42de*/      str r2, [r6]
/*0x42e0*/      ldr r2, [r0, #0x50]
/*0x42e2*/      ldrb r1, [r1, #4]
/*0x42e4*/      lsls r1, r3
/*0x42e6*/      orrs r2, r1
/*0x42e8*/      str r2, [r0, #0x50]
/*0x42ea*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_42ec:
/*0x42ec*/      ldrh r2, [r1]
/*0x42ee*/      str.w r2, [r0, #0x88]
/*0x42f2*/      ldrh r2, [r1, #2]
/*0x42f4*/      str.w r2, [r0, #0x84]
/*0x42f8*/      ldr r2, [r0]
/*0x42fa*/      bic r2, r2, #0x30000
/*0x42fe*/      str r2, [r0]
/*0x4300*/      ldr r2, [r0]
/*0x4302*/      bic r2, r2, #0x1000000
/*0x4306*/      str r2, [r0]
/*0x4308*/      ldr r2, [r0]
/*0x430a*/      ldr r3, [r1, #4]
/*0x430c*/      orrs r2, r3
/*0x430e*/      str r2, [r0]
/*0x4310*/      ldrh r1, [r1, #8]
/*0x4312*/      str r1, [r0, #0x78]
/*0x4314*/      bx lr

/*0x4316*/  .byte 0x00
/*0x4317*/  .byte 0x00


            .thumb_func
            call_4318:
/*0x4318*/      push {r4, lr}
/*0x431a*/      cbz r0, jump_433c
/*0x431c*/      bl call_46fc
/*0x4320*/      cmp r0, #0
/*0x4322*/      beq jump_4352
/*0x4324*/      ldr r0, [pc, #0x2c] /* data_4354 */
/*0x4326*/      movs r1, #0
/*0x4328*/      str r1, [r0]
/*0x432a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x432c*/      ldrb r2, [r0, #1]
/*0x432e*/      str r1, [r0]
/*0x4330*/      lsls r2, r2, #0x19
/*0x4332*/      bpl jump_433c
/*0x4334*/      ldrb r1, [r0, #1]
/*0x4336*/      orr r1, r1, #0x40
/*0x433a*/      strb r1, [r0, #1]
            jump_433c:
/*0x433c*/      bl call_63e8
/*0x4340*/      ldr r1, [pc, #0x14] /* data_4358 */
/*0x4342*/      movs r0, #1
/*0x4344*/      strb r0, [r1]
/*0x4346*/      ldr r1, [pc, #0x14] /* data_435c */
/*0x4348*/      strb r0, [r1]
/*0x434a*/      ldr r1, [pc, #0x14] /* data_4360 */
/*0x434c*/      strb r0, [r1]
/*0x434e*/      ldr r1, [pc, #0x14] /* data_4364 */
/*0x4350*/      strb r0, [r1]
            jump_4352:
/*0x4352*/      pop {r4, pc}

            data_4354:
/*0x4354*/  .word 0x2000005c
            data_4358:
/*0x4358*/  .word 0x20000028
            data_435c:
/*0x435c*/  .word 0x2000002b
            data_4360:
/*0x4360*/  .word 0x20000029
            data_4364:
/*0x4364*/  .word 0x2000002a


            .thumb_func
            call_4368:
/*0x4368*/      movs r1, #0x20
/*0x436a*/      ldr r2, [pc, #0x18] /* data_4384 */
/*0x436c*/      b jump_4378
            jump_436e:
/*0x436e*/      ldrb r3, [r2, r1]
/*0x4370*/      cmp r3, r0
/*0x4372*/      bne jump_4378
/*0x4374*/      uxtb r0, r1
/*0x4376*/      bx lr
            jump_4378:
/*0x4378*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x437a*/      uxth r1, r1
/*0x437c*/      bhs jump_436e
/*0x437e*/      movs r0, #0
/*0x4380*/      bx lr

/*0x4382*/  .byte 0x00
/*0x4383*/  .byte 0x00

            data_4384:
/*0x4384*/  .word 0x20000458


            .thumb_func
            call_4388:
/*0x4388*/      ldr r3, [pc, #0x2c] /* data_43b8 */
/*0x438a*/      push {r4, lr}
/*0x438c*/      ldrb r2, [r3, r0]
/*0x438e*/      cbz r2, jump_43b0
/*0x4390*/      cbz r1, jump_4394
/*0x4392*/      strb r2, [r1]
            jump_4394:
/*0x4394*/      ldr r2, [pc, #0x20] /* data_43b8 */
/*0x4396*/      lsrs r1, r0, #5
/*0x4398*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x439a*/      and r4, r0, #0x1f
/*0x439e*/      ldr.w r1, [r2, r1, lsl #2]
/*0x43a2*/      movs r2, #1
/*0x43a4*/      lsls r2, r4
/*0x43a6*/      tst r1, r2
/*0x43a8*/      beq jump_43b0
/*0x43aa*/      ldrb r0, [r3, r0]
/*0x43ac*/      cmp r0, #0x2f
/*0x43ae*/      blo jump_43b4
            jump_43b0:
/*0x43b0*/      movs r0, #1
/*0x43b2*/      pop {r4, pc}
            jump_43b4:
/*0x43b4*/      movs r0, #0
/*0x43b6*/      pop {r4, pc}

            data_43b8:
/*0x43b8*/  .word 0x20000458

            jump_43bc:
/*0x43bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x43c0*/      mov r5, r1
/*0x43c2*/      mov r4, r0
/*0x43c4*/      movs r1, #0x20
/*0x43c6*/      ldr r0, [pc, #0x40] /* data_4408 */
/*0x43c8*/      bl mem_zero /* (dest, size) */
/*0x43cc*/      ldr r2, [pc, #0x38] /* data_4408 */
/*0x43ce*/      movs r0, #0
/*0x43d0*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x43d2*/      adds r6, r2, #4
/*0x43d4*/      movs r3, #1
/*0x43d6*/      str r0, [r2]
/*0x43d8*/      b jump_43fc
            jump_43da:
/*0x43da*/      ldrb r1, [r4]
/*0x43dc*/      ldrb r0, [r4, #1]
/*0x43de*/      strb r0, [r6, r1]
/*0x43e0*/      ldrb r0, [r4, #2]
/*0x43e2*/      cbz r0, jump_43fa
/*0x43e4*/      ldrb r1, [r4]
/*0x43e6*/      lsrs r0, r1, #5
/*0x43e8*/      and r1, r1, #0x1f
/*0x43ec*/      ldr.w r7, [r2, r0, lsl #2]
/*0x43f0*/      lsl.w r1, r3, r1
/*0x43f4*/      orrs r7, r1
/*0x43f6*/      str.w r7, [r2, r0, lsl #2]
            jump_43fa:
/*0x43fa*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_43fc:
/*0x43fc*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x43fe*/      uxtb r5, r5
/*0x4400*/      bhs jump_43da
/*0x4402*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x4406*/  .byte 0x00
/*0x4407*/  .byte 0x00

            data_4408:
/*0x4408*/  .word 0x20000458


            .thumb_func
            call_440c:
/*0x440c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4410*/      lsrs r1, r0, #8
/*0x4412*/      lsls r1, r1, #0x1f
/*0x4414*/      beq jump_441c
/*0x4416*/      bl call_4acc
/*0x441a*/      b jump_44dc
            jump_441c:
/*0x441c*/      uxtb r3, r0
/*0x441e*/      lsrs r2, r0, #0x18
/*0x4420*/      movs r4, #1
/*0x4422*/      cmp r3, #0xe8
/*0x4424*/      bls jump_4450
/*0x4426*/      lsrs r0, r0, #0x18
/*0x4428*/      ubfx r2, r0, #1, #1
/*0x442c*/      cmp r3, #0xec
/*0x442e*/      bhs jump_443e
/*0x4430*/      subs r3, #0xe9
/*0x4432*/      uxtb r1, r3
/*0x4434*/      ldr r0, [pc, #0xac] /* data_44e4 */
/*0x4436*/      bl call_3c9c
/*0x443a*/      ldr r0, [pc, #0xac] /* data_44e8 */
/*0x443c*/      b jump_44da
            jump_443e:
/*0x443e*/      cmp r3, #0xfd
/*0x4440*/      bhi jump_44dc
/*0x4442*/      subs r3, #0xec
/*0x4444*/      uxtb r1, r3
/*0x4446*/      ldr r0, [pc, #0xa4] /* data_44ec */
/*0x4448*/      bl call_3c9c
/*0x444c*/      ldr r0, [pc, #0xa0] /* data_44f0 */
/*0x444e*/      b jump_44da
            jump_4450:
/*0x4450*/      and r1, r0, #7
/*0x4454*/      movs r6, #1
/*0x4456*/      sub.w ip, r3, #0xe0
/*0x445a*/      lsls r6, r1
/*0x445c*/      ldr r7, [pc, #0x94] /* data_44f4 */
/*0x445e*/      ldr r5, [pc, #0x98] /* data_44f8 */
/*0x4460*/      cmp.w ip, #7
/*0x4464*/      bhi jump_447c
/*0x4466*/      mov r0, r5
/*0x4468*/      uxtb r1, r6
/*0x446a*/      ldrb r0, [r0]
/*0x446c*/      lsls r2, r2, #0x1e
/*0x446e*/      bpl jump_4474
/*0x4470*/      orrs r0, r1
/*0x4472*/      b jump_4476
            jump_4474:
/*0x4474*/      bics r0, r1
            jump_4476:
/*0x4476*/      strb r0, [r5]
            jump_4478:
/*0x4478*/      strb r4, [r7]
/*0x447a*/      b jump_44dc
            jump_447c:
/*0x447c*/      movs r1, #0
            jump_447e:
/*0x447e*/      add.w ip, r5, r1
/*0x4482*/      ldrb.w ip, [ip, #2]
/*0x4486*/      cmp ip, r3
/*0x4488*/      bne jump_4496
/*0x448a*/      lsls r0, r2, #0x1e
/*0x448c*/      bmi jump_4478
/*0x448e*/      add r1, r5
/*0x4490*/      movs r0, #0
/*0x4492*/      strb r0, [r1, #2]
/*0x4494*/      b jump_4478
            jump_4496:
/*0x4496*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4498*/      uxtb r1, r1
/*0x449a*/      cmp r1, #6
/*0x449c*/      blo jump_447e
/*0x449e*/      lsls r1, r2, #0x1e
/*0x44a0*/      bpl jump_44ba
/*0x44a2*/      movs r1, #0
            jump_44a4:
/*0x44a4*/      add.w ip, r5, r1
/*0x44a8*/      ldrb.w ip, [ip, #2]
/*0x44ac*/      cmp.w ip, #0
/*0x44b0*/      beq jump_44ce
/*0x44b2*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x44b4*/      uxtb r1, r1
/*0x44b6*/      cmp r1, #6
/*0x44b8*/      blo jump_44a4
            jump_44ba:
/*0x44ba*/      lsls r3, r2, #0x1e
/*0x44bc*/      ldr r2, [pc, #0x3c] /* data_44fc */
/*0x44be*/      ubfx r0, r0, #3, #5
/*0x44c2*/      add r0, r2
/*0x44c4*/      uxtb r1, r6
/*0x44c6*/      ldrb r2, [r0, #2]
/*0x44c8*/      bpl jump_44d4
/*0x44ca*/      orrs r2, r1
/*0x44cc*/      b jump_44d6
            jump_44ce:
/*0x44ce*/      adds r0, r5, r1
/*0x44d0*/      strb r3, [r0, #2]
/*0x44d2*/      b jump_4478
            jump_44d4:
/*0x44d4*/      bics r2, r1
            jump_44d6:
/*0x44d6*/      strb r2, [r0, #2]
/*0x44d8*/      ldr r0, [pc, #0x24] /* data_4500 */
            jump_44da:
/*0x44da*/      strb r4, [r0]
            jump_44dc:
/*0x44dc*/      movs r0, #1
/*0x44de*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x44e2*/  .byte 0x00
/*0x44e3*/  .byte 0x00

            data_44e4:
/*0x44e4*/  .word 0x20000031
            data_44e8:
/*0x44e8*/  .word 0x20000029
            data_44ec:
/*0x44ec*/  .word 0x2000003d
            data_44f0:
/*0x44f0*/  .word 0x2000002a
            data_44f4:
/*0x44f4*/  .word 0x20000028
            data_44f8:
/*0x44f8*/  .word 0x20000044
            data_44fc:
/*0x44fc*/  .word 0x200003b8
            data_4500:
/*0x4500*/  .word 0x2000002b


            .thumb_func
            call_4504:
/*0x4504*/      push {r3, r4, r5, r6, r7, lr}
/*0x4506*/      ldr r4, [pc, #0x144] /* data_464c */
/*0x4508*/      ldr r2, [pc, #0x144] /* data_4650 */
/*0x450a*/      lsrs r3, r0, #3
/*0x450c*/      strb r0, [r4, #2]
/*0x450e*/      ldrb r5, [r2, r0]
/*0x4510*/      strb r5, [r4]
/*0x4512*/      ldrb r2, [r4, #3]
/*0x4514*/      movs r6, #1
/*0x4516*/      bic r2, r2, #1
/*0x451a*/      bfi r2, r1, #1, #1
/*0x451e*/      strb r2, [r4, #3]
/*0x4520*/      mov r2, r4
/*0x4522*/      and r7, r0, #7
/*0x4526*/      ldrb r2, [r2, #1]
/*0x4528*/      cmp r5, #0xe8
/*0x452a*/      beq jump_4550
/*0x452c*/      lsl.w r7, r6, r7
/*0x4530*/      mov.w ip, #0x1c
/*0x4534*/      uxtb r7, r7
/*0x4536*/      cmp.w ip, r5, lsr #3
/*0x453a*/      bne jump_456e
/*0x453c*/      ands r5, r5, #3
/*0x4540*/      beq jump_4556
/*0x4542*/      cmp r5, #1
/*0x4544*/      beq jump_455c
/*0x4546*/      cmp r5, #2
/*0x4548*/      beq jump_4562
/*0x454a*/      cmp r5, #3
/*0x454c*/      bne jump_4578
/*0x454e*/      b jump_4568
            jump_4550:
/*0x4550*/      bfi r2, r1, #6, #1
/*0x4554*/      b jump_45c2
            jump_4556:
/*0x4556*/      bfi r2, r1, #2, #1
/*0x455a*/      b jump_4576
            jump_455c:
/*0x455c*/      bfi r2, r1, #4, #1
/*0x4560*/      b jump_4576
            jump_4562:
/*0x4562*/      bfi r2, r1, #3, #1
/*0x4566*/      b jump_4576
            jump_4568:
/*0x4568*/      bfi r2, r1, #5, #1
/*0x456c*/      b jump_4576
            jump_456e:
/*0x456e*/      cmp r5, #0x39
/*0x4570*/      bne jump_4578
/*0x4572*/      bfi r2, r1, #7, #1
            jump_4576:
/*0x4576*/      strb r2, [r4, #1]
            jump_4578:
/*0x4578*/      ldr r5, [pc, #0xd0] /* data_464c */
/*0x457a*/      .short 0x1f2d /* subs r5, r5, #4 */ 
/*0x457c*/      cbz r1, jump_45ae
/*0x457e*/      ldrb r2, [r4, #1]
/*0x4580*/      lsls.w ip, r2, #0x19
/*0x4584*/      bpl jump_45c2
/*0x4586*/      ldrb r2, [r5, r3]
/*0x4588*/      orrs r2, r7
/*0x458a*/      b jump_45b6
            jump_458c:
/*0x458c*/      ldr r5, [pc, #0xc4] /* data_4654 */
/*0x458e*/      strb r2, [r4, #1]
/*0x4590*/      movs r7, #0
/*0x4592*/      ldrb r2, [r5, #2]
/*0x4594*/      cbz r2, jump_45ce
/*0x4596*/      cbz r1, jump_45ce
/*0x4598*/      strb r7, [r5, #2]
/*0x459a*/      mov r1, sp
/*0x459c*/      bl call_550c
/*0x45a0*/      ldrb r0, [r5, #7]
/*0x45a2*/      lsls r0, r0, #0x1f
/*0x45a4*/      mov r0, sp
/*0x45a6*/      beq jump_45c8
/*0x45a8*/      bl call_3a9c
/*0x45ac*/      b jump_4604
            jump_45ae:
/*0x45ae*/      ldrb r2, [r5, r3]
/*0x45b0*/      tst r2, r7
/*0x45b2*/      beq jump_45c0
/*0x45b4*/      bics r2, r7
            jump_45b6:
/*0x45b6*/      strb r2, [r5, r3]
/*0x45b8*/      ldrb r2, [r4, #1]
/*0x45ba*/      orr r2, r2, #1
/*0x45be*/      b jump_458c
            jump_45c0:
/*0x45c0*/      ldrb r2, [r4, #1]
            jump_45c2:
/*0x45c2*/      bic r2, r2, #1
/*0x45c6*/      b jump_458c
            jump_45c8:
/*0x45c8*/      bl call_4bc4
/*0x45cc*/      b jump_4604
            jump_45ce:
/*0x45ce*/      ldrb r0, [r4]
/*0x45d0*/      cbz r0, jump_4604
/*0x45d2*/      ldr r0, [r4]
/*0x45d4*/      bl call_4dfc
/*0x45d8*/      bl call_4b18
/*0x45dc*/      cbz r0, jump_45ec
/*0x45de*/      ldrb r0, [r4]
/*0x45e0*/      cbz r0, jump_4604
            jump_45e2:
/*0x45e2*/      ldr r0, [r4]
/*0x45e4*/      pop.w {r3, r4, r5, r6, r7, lr}
/*0x45e8*/      b.w call_440c
            jump_45ec:
/*0x45ec*/      ldrb r0, [r5, #7]
/*0x45ee*/      lsls r0, r0, #0x1f
/*0x45f0*/      beq jump_45f8
/*0x45f2*/      bl call_39e4
/*0x45f6*/      b jump_4604
            jump_45f8:
/*0x45f8*/      ldrb r0, [r4]
/*0x45fa*/      cmp r0, #0xe8
/*0x45fc*/      beq jump_4604
/*0x45fe*/      bl call_533c
/*0x4602*/      cbz r0, jump_4608
            jump_4604:
/*0x4604*/      movs r0, #1
/*0x4606*/      pop {r3, r4, r5, r6, r7, pc}
            jump_4608:
/*0x4608*/      ldrb r0, [r4, #1]
/*0x460a*/      lsls r1, r0, #0x1f
/*0x460c*/      beq jump_45e2
/*0x460e*/      ldrb r1, [r4, #3]
/*0x4610*/      lsls r1, r1, #0x1f
/*0x4612*/      bne jump_45e2
/*0x4614*/      ldrb r1, [r4, #2]
/*0x4616*/      ldr r2, [pc, #0x40] /* data_4658 */
/*0x4618*/      ldrb r2, [r2, r1]
/*0x461a*/      cbz r2, jump_4640
/*0x461c*/      ldr r5, [pc, #0x38] /* data_4658 */
/*0x461e*/      lsrs r3, r1, #5
/*0x4620*/      .short 0x1f2d /* subs r5, r5, #4 */ 
/*0x4622*/      and r1, r1, #0x1f
/*0x4626*/      ldr.w r3, [r5, r3, lsl #2]
/*0x462a*/      lsls r6, r1
/*0x462c*/      tst r3, r6
/*0x462e*/      beq jump_4636
/*0x4630*/      orr r0, r0, #1
/*0x4634*/      b jump_463a
            jump_4636:
/*0x4636*/      bic r0, r0, #1
            jump_463a:
/*0x463a*/      strb r0, [r4, #1]
/*0x463c*/      strb r2, [r4]
/*0x463e*/      b jump_45e2
            jump_4640:
/*0x4640*/      bic r0, r0, #1
/*0x4644*/      strb r0, [r4, #1]
/*0x4646*/      strb r7, [r4]
/*0x4648*/      b jump_45e2

/*0x464a*/  .byte 0x00
/*0x464b*/  .byte 0x00

            data_464c:
/*0x464c*/  .word 0x20000060
            data_4650:
/*0x4650*/  .word 0x20000214
            data_4654:
/*0x4654*/  .word 0x20000054
            data_4658:
/*0x4658*/  .word 0x20000458


            .thumb_func
            call_465c:
/*0x465c*/      ldrh r2, [r1]
/*0x465e*/      bfi r2, r0, #0, #9
/*0x4662*/      strh r2, [r1]
/*0x4664*/      bx lr

            .thumb_func
            call_4666:
/*0x4666*/      ubfx r0, r0, #0, #9
/*0x466a*/      bx lr

            .thumb_func
            call_466c:
/*0x466c*/      push {r4, r5, r6, r7, lr}
/*0x466e*/      movs r5, #0
/*0x4670*/      b jump_4692
            jump_4672:
/*0x4672*/      movs r4, #0
/*0x4674*/      b jump_4682
            jump_4676:
/*0x4676*/      ldrb r6, [r0, r5]
/*0x4678*/      ldrb r7, [r1, r4]
/*0x467a*/      cmp r6, r7
/*0x467c*/      beq jump_4686
/*0x467e*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4680*/      uxtb r4, r4
            jump_4682:
/*0x4682*/      cmp r4, r3
/*0x4684*/      blo jump_4676
            jump_4686:
/*0x4686*/      cmp r4, r3
/*0x4688*/      bne jump_468e
/*0x468a*/      movs r0, #0
/*0x468c*/      pop {r4, r5, r6, r7, pc}
            jump_468e:
/*0x468e*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4690*/      uxtb r5, r5
            jump_4692:
/*0x4692*/      cmp r5, r2
/*0x4694*/      blo jump_4672
/*0x4696*/      movs r0, #1
/*0x4698*/      pop {r4, r5, r6, r7, pc}

/*0x469a*/  .byte 0x00
/*0x469b*/  .byte 0x00


            .thumb_func
            call_469c:
/*0x469c*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x46a0*/      movs r3, #4
/*0x46a2*/      movs r4, #0
/*0x46a4*/      ldr.w sb, [pc, #0x4c] /* data_46f4 */
/*0x46a8*/      mov.w ip, #1
/*0x46ac*/      ldr.w r8, [pc, #0x48] /* data_46f8 */
/*0x46b0*/      b jump_46e2
            jump_46b2:
/*0x46b2*/      ldrb.w r5, [sb, r3]
/*0x46b6*/      cmp r5, #0xff
/*0x46b8*/      beq jump_46e2
/*0x46ba*/      movs r2, #8
/*0x46bc*/      add.w r7, r8, r3, lsl #3
/*0x46c0*/      b jump_46dc
            jump_46c2:
/*0x46c2*/      lsl.w r6, ip, r2
/*0x46c6*/      uxtb r6, r6
/*0x46c8*/      tst r5, r6
/*0x46ca*/      bne jump_46dc
/*0x46cc*/      cbz r1, jump_46ee
/*0x46ce*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x46d0*/      ldrb r6, [r7, r2]
/*0x46d2*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x46d4*/      strb r6, [r0], #1
/*0x46d8*/      uxtb r1, r1
/*0x46da*/      uxtb r4, r4
            jump_46dc:
/*0x46dc*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x46de*/      uxtb r2, r2
/*0x46e0*/      bhs jump_46c2
            jump_46e2:
/*0x46e2*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x46e4*/      uxtb r3, r3
/*0x46e6*/      bhs jump_46b2
/*0x46e8*/      mov r0, r4
            jump_46ea:
/*0x46ea*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_46ee:
/*0x46ee*/      movs r0, #0xff
/*0x46f0*/      b jump_46ea

/*0x46f2*/  .byte 0x00
/*0x46f3*/  .byte 0x00

            data_46f4:
/*0x46f4*/  .word 0x2000001a
            data_46f8:
/*0x46f8*/  .word 0x20000214


            .thumb_func
            call_46fc:
/*0x46fc*/      push {r4, lr}
/*0x46fe*/      bl call_5b04
/*0x4702*/      cmp r0, #0
/*0x4704*/      beq jump_471c
/*0x4706*/      movs r1, #4
/*0x4708*/      ldr r0, [pc, #0x24] /* data_4730 */
/*0x470a*/      movs r3, #0x7f
/*0x470c*/      b jump_4724
            jump_470e:
/*0x470e*/      ldrb r2, [r0, #-0x1]!
/*0x4712*/      cmp r1, #3
/*0x4714*/      beq jump_471e
/*0x4716*/      cmp r2, #0xff
/*0x4718*/      beq jump_4724
            jump_471a:
/*0x471a*/      movs r0, #0
            jump_471c:
/*0x471c*/      pop {r4, pc}
            jump_471e:
/*0x471e*/      cmp.w r3, r2, lsr #1
/*0x4722*/      bne jump_471a
            jump_4724:
/*0x4724*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4726*/      uxtb r1, r1
/*0x4728*/      bhs jump_470e
/*0x472a*/      movs r0, #1
/*0x472c*/      pop {r4, pc}

/*0x472e*/  .byte 0x00
/*0x472f*/  .byte 0x00

            data_4730:
/*0x4730*/  .word 0x2000001e


            .thumb_func
            call_4734:
/*0x4734*/      movs r0, #0
/*0x4736*/      b.w call_5b34

/*0x473a*/  .byte 0x00
/*0x473b*/  .byte 0x00


            .thumb_func
            call_473c:
/*0x473c*/      push.w {r2, r3, r4, r5, r6, r7, r8, lr}
/*0x4740*/      ldr r4, [pc, #0x88] /* data_47cc */
/*0x4742*/      ldrh r0, [r4]
/*0x4744*/      movw r6, #0x1770
/*0x4748*/      cmp r0, r6
/*0x474a*/      bls jump_47a0
/*0x474c*/      ldrh r0, [r4]
/*0x474e*/      movw r7, #0xffff
/*0x4752*/      cmp r0, r7
/*0x4754*/      bhs jump_47a0
/*0x4756*/      movs r1, #3
/*0x4758*/      add r0, sp, #4
/*0x475a*/      bl call_469c
/*0x475e*/      ldr r5, [pc, #0x70] /* data_47d0 */
/*0x4760*/      mov.w r8, #1
/*0x4764*/      cmp r0, #2
/*0x4766*/      beq jump_47a4
/*0x4768*/      cmp r0, #3
/*0x476a*/      bne jump_47a0
/*0x476c*/      movs r0, #0x18
/*0x476e*/      str r0, [sp]
/*0x4770*/      movs r3, #0x1a
/*0x4772*/      movs r2, #5
/*0x4774*/      movs r1, #3
/*0x4776*/      add r0, sp, #4
/*0x4778*/      bl call_7700
/*0x477c*/      cmp r0, #0
/*0x477e*/      beq jump_47a0
/*0x4780*/      ldrh r0, [r4]
/*0x4782*/      cmp r0, r6
/*0x4784*/      bls jump_47a0
/*0x4786*/      strh r7, [r4]
/*0x4788*/      ldrb r0, [r5, #6]
/*0x478a*/      cmp r0, #0
/*0x478c*/      bne jump_47a0
/*0x478e*/      movs r1, #7
/*0x4790*/      udiv r2, r0, r1
/*0x4794*/      mls r0, r1, r2, r0
/*0x4798*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x479a*/      strb r0, [r5, #6]
/*0x479c*/      strb.w r8, [r5]
            jump_47a0:
/*0x47a0*/      pop.w {r2, r3, r4, r5, r6, r7, r8, pc}
            jump_47a4:
/*0x47a4*/      movs r0, #0
/*0x47a6*/      str r0, [sp]
/*0x47a8*/      movs r3, #0x10
/*0x47aa*/      movs r2, #5
/*0x47ac*/      movs r1, #2
/*0x47ae*/      add r0, sp, #4
/*0x47b0*/      bl call_7700
/*0x47b4*/      cmp r0, #0
/*0x47b6*/      beq jump_47a0
/*0x47b8*/      ldrh r0, [r4]
/*0x47ba*/      cmp r0, r6
/*0x47bc*/      bls jump_47a0
/*0x47be*/      strh r7, [r4]
/*0x47c0*/      strb.w r8, [r5, #3]
/*0x47c4*/      bl call_4e98
/*0x47c8*/      b jump_47a0

/*0x47ca*/  .byte 0x00
/*0x47cb*/  .byte 0x00

            data_47cc:
/*0x47cc*/  .word 0x20000018
            data_47d0:
/*0x47d0*/  .word 0x20000054


            .thumb_func
            call_47d4:
/*0x47d4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x47d8*/      ldr r0, [pc, #0x24c] /* data_4a28 */
/*0x47da*/      ldrb r1, [r0, #5]
/*0x47dc*/      cbz r1, jump_47e4
/*0x47de*/      movs r1, #2
/*0x47e0*/      strb r1, [r0, #5]
            jump_47e2:
/*0x47e2*/      b jump_4a1e
            jump_47e4:
/*0x47e4*/      ldr.w ip, [pc, #0x244] /* data_4a2c */
/*0x47e8*/      ldrb r2, [r0, #6]
/*0x47ea*/      movs r5, #0
/*0x47ec*/      ldrb.w r1, [ip, #4]
/*0x47f0*/      cbz r2, jump_482a
/*0x47f2*/      ldrb.w r0, [ip, #6]
/*0x47f6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x47f8*/      uxtb r0, r0
/*0x47fa*/      strb.w r0, [ip, #6]
/*0x47fe*/      cmp r0, #3
/*0x4800*/      bls jump_47e2
/*0x4802*/      mov r0, ip
/*0x4804*/      strb.w r5, [ip, #6]
/*0x4808*/      ldrb r0, [r0, #4]
/*0x480a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x480c*/      cmp r2, #6
/*0x480e*/      beq jump_4816
/*0x4810*/      cmp r2, #7
/*0x4812*/      bne jump_47e2
/*0x4814*/      b jump_481e
            jump_4816:
/*0x4816*/      strb.w r1, [ip, #5]
/*0x481a*/      movs r1, #0x16
/*0x481c*/      b jump_4820
            jump_481e:
/*0x481e*/      movs r1, #0x18
            jump_4820:
/*0x4820*/      udiv r2, r0, r1
/*0x4824*/      mls r0, r1, r2, r0
/*0x4828*/      b jump_48ba
            jump_482a:
/*0x482a*/      ldr r0, [pc, #0x204] /* data_4a30 */
/*0x482c*/      ldr r3, [pc, #0x1fc] /* data_4a2c */
/*0x482e*/      ldr r2, [pc, #0x204] /* data_4a34 */
/*0x4830*/      ldrb r0, [r0, #3]
/*0x4832*/      add.w r6, r3, #0x63
/*0x4836*/      ldr r3, [r3]
/*0x4838*/      add.w r4, r2, #0xe
/*0x483c*/      mov.w sb, #1
/*0x4840*/      cmp r0, #3
/*0x4842*/      bhi jump_4900
/*0x4844*/      ldrb r2, [r2, r0]
/*0x4846*/      cmp r0, #1
/*0x4848*/      add.w r2, r2, r2, lsl #1
/*0x484c*/      add.w r2, r4, r2, lsl #1
/*0x4850*/      ldrb r4, [r3, #4]
/*0x4852*/      and r4, r4, #0xf
/*0x4856*/      ldrb r4, [r2, r4]
/*0x4858*/      beq jump_4864
/*0x485a*/      cmp r0, #2
/*0x485c*/      beq jump_48b8
/*0x485e*/      cmp r0, #3
/*0x4860*/      bne jump_47e2
/*0x4862*/      b jump_48c0
            jump_4864:
/*0x4864*/      movs r1, #3
/*0x4866*/      add.w r0, ip, #7
/*0x486a*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x486c*/      b jump_48b0
            jump_486e:
/*0x486e*/      lsl.w r2, sb, r1
/*0x4872*/      ldrb.w r6, [ip, #7]
/*0x4876*/      uxtb r2, r2
/*0x4878*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x487a*/      tst r6, r2
/*0x487c*/      ldrb r6, [r0, #-0x1]!
/*0x4880*/      beq jump_4894
/*0x4882*/      cmp r6, r4
/*0x4884*/      bhi jump_4890
/*0x4886*/      strb r5, [r0]
/*0x4888*/      ldrb.w r6, [ip, #7]
/*0x488c*/      bics r6, r2
/*0x488e*/      b jump_48a6
            jump_4890:
/*0x4890*/      subs r2, r6, r4
/*0x4892*/      b jump_48ae
            jump_4894:
/*0x4894*/      ldrb r7, [r3]
/*0x4896*/      sub.w r8, r7, r4
/*0x489a*/      cmp r6, r8
/*0x489c*/      blt jump_48ac
/*0x489e*/      strb r7, [r0]
/*0x48a0*/      ldrb.w r6, [ip, #7]
/*0x48a4*/      orrs r6, r2
            jump_48a6:
/*0x48a6*/      strb.w r6, [ip, #7]
/*0x48aa*/      b jump_48b0
            jump_48ac:
/*0x48ac*/      adds r2, r6, r4
            jump_48ae:
/*0x48ae*/      strb r2, [r0]
            jump_48b0:
/*0x48b0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x48b2*/      uxtb r1, r1
/*0x48b4*/      bhs jump_486e
/*0x48b6*/      b jump_4a1e
            jump_48b8:
/*0x48b8*/      adds r0, r1, r4
            jump_48ba:
/*0x48ba*/      strb.w r0, [ip, #4]
/*0x48be*/      b jump_4a1e
            jump_48c0:
/*0x48c0*/      movs r7, #0x20
/*0x48c2*/      b jump_48f8
            jump_48c4:
/*0x48c4*/      bl rand
/*0x48c8*/      sdiv r1, r0, r4
/*0x48cc*/      mls r0, r4, r1, r0
/*0x48d0*/      cbz r0, jump_48d6
/*0x48d2*/      movs r0, #3
/*0x48d4*/      b jump_48f2
            jump_48d6:
/*0x48d6*/      subs r0, r6, #2
/*0x48d8*/      movs r1, #0
/*0x48da*/      bl call_6c98
/*0x48de*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x48e0*/      b jump_48f8
            jump_48e2:
/*0x48e2*/      ldrb r1, [r6]
/*0x48e4*/      cmp r1, #2
/*0x48e6*/      bhi jump_48ec
/*0x48e8*/      strb r5, [r6]
/*0x48ea*/      b jump_48f0
            jump_48ec:
/*0x48ec*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x48ee*/      strb r1, [r6]
            jump_48f0:
/*0x48f0*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_48f2:
/*0x48f2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x48f4*/      uxtb r0, r0
/*0x48f6*/      bhs jump_48e2
            jump_48f8:
/*0x48f8*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x48fa*/      uxtb r7, r7
/*0x48fc*/      bhs jump_48c4
/*0x48fe*/      b jump_4a1e
            jump_4900:
/*0x4900*/      cmp r0, #7
/*0x4902*/      bls jump_497c
/*0x4904*/      ldrb r1, [r2, r0]
/*0x4906*/      ldrb r2, [r3, #4]
/*0x4908*/      add.w r1, r1, r1, lsl #1
/*0x490c*/      add.w r1, r4, r1, lsl #1
/*0x4910*/      and r2, r2, #0xf
/*0x4914*/      bic r0, r0, #1
/*0x4918*/      ldrb r2, [r1, r2]
/*0x491a*/      cmp r0, #8
/*0x491c*/      beq jump_4928
/*0x491e*/      cmp r0, #0xa
/*0x4920*/      beq jump_497e
/*0x4922*/      cmp r0, #0xc
/*0x4924*/      bne jump_4a1e
/*0x4926*/      b jump_49dc
            jump_4928:
/*0x4928*/      movs r0, #0x20
/*0x492a*/      b jump_4976
            jump_492c:
/*0x492c*/      ldrb r1, [r6], #-1
/*0x4930*/      cbz r1, jump_4936
/*0x4932*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4934*/      b jump_4946
            jump_4936:
/*0x4936*/      ldrb r1, [r6], #-1
/*0x493a*/      cbz r1, jump_4940
/*0x493c*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x493e*/      b jump_4946
            jump_4940:
/*0x4940*/      ldrb r1, [r6], #-1
/*0x4944*/      cbz r1, jump_4976
            jump_4946:
/*0x4946*/      ldr r1, [pc, #0xf0] /* data_4a38 */
/*0x4948*/      and r4, r0, #7
/*0x494c*/      add.w r1, r1, r0, lsr #3
/*0x4950*/      ldrb r3, [r1]
/*0x4952*/      lsl.w r1, sb, r4
/*0x4956*/      tst r3, r1
/*0x4958*/      beq jump_4976
/*0x495a*/      movs r1, #3
/*0x495c*/      b jump_496e
            jump_495e:
/*0x495e*/      ldrb r3, [r6, #1]!
/*0x4962*/      cmp r3, r2
/*0x4964*/      bhi jump_496a
/*0x4966*/      strb r5, [r6]
/*0x4968*/      b jump_496e
            jump_496a:
/*0x496a*/      subs r3, r3, r2
/*0x496c*/      strb r3, [r6]
            jump_496e:
/*0x496e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4970*/      uxtb r1, r1
/*0x4972*/      bhs jump_495e
/*0x4974*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4976:
/*0x4976*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4978*/      uxtb r0, r0
/*0x497a*/      bhs jump_492c
            jump_497c:
/*0x497c*/      b jump_4a1e
            jump_497e:
/*0x497e*/      ldrb.w r0, [ip, #0x22]
/*0x4982*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4984*/      uxtb r0, r0
/*0x4986*/      strb.w r0, [ip, #0x22]
/*0x498a*/      cmp r0, r2
/*0x498c*/      blo jump_4a1e
/*0x498e*/      strb.w r5, [ip, #0x22]
/*0x4992*/      movs r0, #1
            jump_4994:
/*0x4994*/      add.w r1, r0, r0, lsl #1
/*0x4998*/      add.w r1, ip, r1, lsl #1
/*0x499c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x499e*/      ldrh r2, [r1, #4]
/*0x49a0*/      strh r2, [r1, #-0x2]
/*0x49a4*/      ldrb r2, [r1, #6]
/*0x49a6*/      uxtb r0, r0
/*0x49a8*/      strb r2, [r1]
/*0x49aa*/      cmp r0, #5
/*0x49ac*/      blo jump_4994
/*0x49ae*/      strh.w r5, [ip, #0x1c]
/*0x49b2*/      strb.w r5, [ip, #0x1e]
/*0x49b6*/      movs r0, #5
/*0x49b8*/      b jump_49cc
            jump_49ba:
/*0x49ba*/      add.w r1, r0, r0, lsl #1
/*0x49be*/      add.w r1, ip, r1, lsl #1
/*0x49c2*/      ldrh r2, [r1, #1]!
/*0x49c6*/      strh r2, [r1, #6]
/*0x49c8*/      ldrb r2, [r1, #2]
/*0x49ca*/      strb r2, [r1, #8]
            jump_49cc:
/*0x49cc*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x49ce*/      uxtb r0, r0
/*0x49d0*/      bhs jump_49ba
/*0x49d2*/      strh.w r5, [ip, #7]
/*0x49d6*/      strb.w r5, [ip, #9]
/*0x49da*/      b jump_4a1e
            jump_49dc:
/*0x49dc*/      ldrb.w r0, [ip, #0x2c]
/*0x49e0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x49e2*/      uxtb r0, r0
/*0x49e4*/      strb.w r0, [ip, #0x2c]
/*0x49e8*/      cmp r0, r2
/*0x49ea*/      blo jump_4a1e
/*0x49ec*/      ldr r0, [pc, #0x3c] /* data_4a2c */
/*0x49ee*/      strb.w r5, [ip, #0x2c]
/*0x49f2*/      adds r0, #0x2c
/*0x49f4*/      movs r2, #6
/*0x49f6*/      b jump_4a18
            jump_49f8:
/*0x49f8*/      ldrsb r1, [r0, #-0x1]
/*0x49fc*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x49fe*/      cbz r1, jump_4a18
/*0x4a00*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4a02*/      sxtb r1, r1
/*0x4a04*/      strb r1, [r0, #4]
/*0x4a06*/      ldrb r3, [r0, #3]
/*0x4a08*/      adds r4, r1, r3
/*0x4a0a*/      subs r4, #0xa
/*0x4a0c*/      cmp r4, #4
/*0x4a0e*/      ble jump_4a18
/*0x4a10*/      subs r1, r3, r1
/*0x4a12*/      adds r1, #0xa
/*0x4a14*/      bpl jump_4a18
/*0x4a16*/      strb r5, [r0, #4]
            jump_4a18:
/*0x4a18*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4a1a*/      uxtb r2, r2
/*0x4a1c*/      bhs jump_49f8
            jump_4a1e:
/*0x4a1e*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4a22*/      b.w call_4ea4

/*0x4a26*/  .byte 0x00
/*0x4a27*/  .byte 0x00

            data_4a28:
/*0x4a28*/  .word 0x20000054
            data_4a2c:
/*0x4a2c*/  .word 0x2000006c
            data_4a30:
/*0x4a30*/  .word 0x20000478
            data_4a34:
/*0x4a34*/  .word data_7953
            data_4a38:
/*0x4a38*/  .word 0x2000001a


            .thumb_func
            call_4a3c:
/*0x4a3c*/      movs r1, #0xc
/*0x4a3e*/      ldr r0, [pc, #4] /* data_4a44 */
/*0x4a40*/      b.w jump_43bc

            data_4a44:
/*0x4a44*/  .word data_78dc


            .thumb_func
            call_4a48:
/*0x4a48*/      push {r3, r4, r5, lr}
/*0x4a4a*/      movs r1, #0
/*0x4a4c*/      mov.w r0, #0x20000
/*0x4a50*/      movs r3, #1
/*0x4a52*/      mov r2, r1
/*0x4a54*/      bl call_398c
/*0x4a58*/      ldr r4, [pc, #0x60] /* data_4abc */
/*0x4a5a*/      movs r2, #0
/*0x4a5c*/      movs r1, #0x40
/*0x4a5e*/      mov r0, r4
/*0x4a60*/      bl call_4244
/*0x4a64*/      movs r2, #1
/*0x4a66*/      movs r1, #0x40
/*0x4a68*/      mov r0, r4
/*0x4a6a*/      bl call_4224
/*0x4a6e*/      movs r0, #2
/*0x4a70*/      bl spin_wait /* (time) */
/*0x4a74*/      movs r1, #0x40
/*0x4a76*/      mov r0, r4
/*0x4a78*/      bl call_426c
/*0x4a7c*/      cbz r0, jump_4a8e
/*0x4a7e*/      movs r1, #3
/*0x4a80*/      mov r0, sp
/*0x4a82*/      bl call_469c
/*0x4a86*/      ldr r4, [pc, #0x38] /* data_4ac0 */
/*0x4a88*/      cmp r0, #3
/*0x4a8a*/      beq jump_4a96
/*0x4a8c*/      b jump_4ab4
            jump_4a8e:
/*0x4a8e*/      ldr r1, [pc, #0x34] /* data_4ac4 */
/*0x4a90*/      movs r0, #1
/*0x4a92*/      strb r0, [r1, #5]
/*0x4a94*/      pop {r3, r4, r5, pc}
            jump_4a96:
/*0x4a96*/      movs r3, #3
/*0x4a98*/      mov r2, r3
/*0x4a9a*/      ldr r1, [pc, #0x2c] /* data_4ac8 */
/*0x4a9c*/      mov r0, sp
/*0x4a9e*/      bl call_466c
/*0x4aa2*/      cbz r0, jump_4ab4
/*0x4aa4*/      ldrb r0, [r4, #2]
/*0x4aa6*/      mvn.w r1, r0, lsr #1
/*0x4aaa*/      bfi r0, r1, #1, #1
/*0x4aae*/      strb r0, [r4, #2]
/*0x4ab0*/      bl call_3c8c
            jump_4ab4:
/*0x4ab4*/      ldrb r0, [r4, #2]
/*0x4ab6*/      ubfx r0, r0, #1, #1
/*0x4aba*/      pop {r3, r4, r5, pc}

            data_4abc:
/*0x4abc*/  .word 0x400b2000
            data_4ac0:
/*0x4ac0*/  .word 0x20000478
            data_4ac4:
/*0x4ac4*/  .word 0x20000054
            data_4ac8:
/*0x4ac8*/  .word data_78c8


            .thumb_func
            call_4acc:
/*0x4acc*/      push {r4, lr}
/*0x4ace*/      lsrs r1, r0, #0x18
/*0x4ad0*/      lsls r1, r1, #0x1e
/*0x4ad2*/      bpl jump_4b0e
/*0x4ad4*/      uxtb r1, r0
/*0x4ad6*/      movs r4, #1
/*0x4ad8*/      cmp r1, #0xa8
/*0x4ada*/      beq jump_4afe
/*0x4adc*/      cmp r1, #0xa9
/*0x4ade*/      beq jump_4afe
/*0x4ae0*/      cmp r1, #0xac
/*0x4ae2*/      beq jump_4af0
/*0x4ae4*/      cmp r1, #0xad
/*0x4ae6*/      beq jump_4af0
/*0x4ae8*/      pop.w {r4, lr}
/*0x4aec*/      b.w jump_4cd8
            jump_4af0:
/*0x4af0*/      subs r1, #0xac
/*0x4af2*/      lsls r4, r1
/*0x4af4*/      uxtb r0, r4
/*0x4af6*/      pop.w {r4, lr}
/*0x4afa*/      b.w jump_3b3c
            jump_4afe:
/*0x4afe*/      subs r1, #0xa8
/*0x4b00*/      lsl.w r0, r4, r1
/*0x4b04*/      uxtb r0, r0
/*0x4b06*/      bl call_3b24
/*0x4b0a*/      ldr r0, [pc, #4] /* data_4b10 */
/*0x4b0c*/      strb r4, [r0]
            jump_4b0e:
/*0x4b0e*/      pop {r4, pc}

            data_4b10:
/*0x4b10*/  .word 0x20000054


            .thumb_func
            call_4b14:
/*0x4b14*/      movs r0, #0
/*0x4b16*/      bx lr

            .thumb_func
            call_4b18:
/*0x4b18*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4b1c*/      ldr r5, [pc, #0x94] /* data_4bb4 */
/*0x4b1e*/      ldr r4, [pc, #0x98] /* data_4bb8 */
/*0x4b20*/      movs r6, #0
/*0x4b22*/      ldrb r0, [r5, #5]
/*0x4b24*/      cbnz r0, jump_4b88
/*0x4b26*/      ldrb r0, [r4, #1]
/*0x4b28*/      mov.w r8, #1
/*0x4b2c*/      lsls r2, r0, #0x1f
/*0x4b2e*/      mov r0, r4
/*0x4b30*/      mov.w r7, #7
/*0x4b34*/      ldrb r1, [r0, #3]
/*0x4b36*/      ldrb r0, [r0]
/*0x4b38*/      beq jump_4b4a
/*0x4b3a*/      lsls r1, r1, #0x1e
/*0x4b3c*/      bpl jump_4bae
/*0x4b3e*/      ldrb r1, [r4, #2]
/*0x4b40*/      cmp r1, #0x1d
/*0x4b42*/      beq jump_4b90
/*0x4b44*/      cmp r0, #0xe8
/*0x4b46*/      beq jump_4b9a
/*0x4b48*/      b jump_4bae
            jump_4b4a:
/*0x4b4a*/      ldrb r2, [r5, #7]
/*0x4b4c*/      lsls r2, r2, #0x1e
/*0x4b4e*/      bmi jump_4b68
/*0x4b50*/      ldr r2, [pc, #0x68] /* data_4bbc */
/*0x4b52*/      ldrb r2, [r2, #2]
/*0x4b54*/      cmp r2, #1
/*0x4b56*/      beq jump_4b68
/*0x4b58*/      lsls r1, r1, #0x1e
/*0x4b5a*/      bpl jump_4bae
/*0x4b5c*/      cmp r0, #0xc0
/*0x4b5e*/      bne jump_4b6e
/*0x4b60*/      cbnz r2, jump_4b6e
/*0x4b62*/      ldr r0, [pc, #0x5c] /* data_4bc0 */
/*0x4b64*/      bl call_5210
            jump_4b68:
/*0x4b68*/      ldrb r0, [r4, #3]
/*0x4b6a*/      lsls r0, r0, #0x1e
/*0x4b6c*/      bpl jump_4bae
            jump_4b6e:
/*0x4b6e*/      ldrb r0, [r5, #6]
/*0x4b70*/      cbz r0, jump_4b78
/*0x4b72*/      ldrb r1, [r4]
/*0x4b74*/      cmp r1, #0xe8
/*0x4b76*/      beq jump_4b9e
            jump_4b78:
/*0x4b78*/      ldrb r0, [r5, #7]
/*0x4b7a*/      lsls r0, r0, #0x1e
/*0x4b7c*/      bpl jump_4bae
/*0x4b7e*/      ldrb r0, [r4]
/*0x4b80*/      cmp r0, #0xc0
/*0x4b82*/      beq jump_4b88
/*0x4b84*/      bl call_54ac
            jump_4b88:
/*0x4b88*/      strb r6, [r4]
/*0x4b8a*/      movs r0, #1
            jump_4b8c:
/*0x4b8c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_4b90:
/*0x4b90*/      ldr r0, [pc, #0x2c] /* data_4bc0 */
/*0x4b92*/      adds r0, #8
/*0x4b94*/      bl call_5210
/*0x4b98*/      b jump_4bae
            jump_4b9a:
/*0x4b9a*/      ldrb r0, [r5, #6]
/*0x4b9c*/      cbz r0, jump_4bae
            jump_4b9e:
/*0x4b9e*/      udiv r1, r0, r7
/*0x4ba2*/      mls r0, r7, r1, r0
/*0x4ba6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4ba8*/      strb r0, [r5, #6]
/*0x4baa*/      strb.w r8, [r5]
            jump_4bae:
/*0x4bae*/      movs r0, #0
/*0x4bb0*/      b jump_4b8c

/*0x4bb2*/  .byte 0x00
/*0x4bb3*/  .byte 0x00

            data_4bb4:
/*0x4bb4*/  .word 0x20000054
            data_4bb8:
/*0x4bb8*/  .word 0x20000060
            data_4bbc:
/*0x4bbc*/  .word 0x20001542
            data_4bc0:
/*0x4bc0*/  .word data_78cc


            .thumb_func
            call_4bc4:
/*0x4bc4*/      ldr r1, [pc, #0x18] /* data_4be0 */
/*0x4bc6*/      push {r4, lr}
/*0x4bc8*/      ldr r1, [r1]
/*0x4bca*/      ldrh r2, [r0]
/*0x4bcc*/      strh r2, [r1]
/*0x4bce*/      ldrb r0, [r0, #2]
/*0x4bd0*/      strb r0, [r1, #2]
/*0x4bd2*/      bl call_4ea4
/*0x4bd6*/      pop.w {r4, lr}
/*0x4bda*/      b.w call_3c8c

/*0x4bde*/  .byte 0x00
/*0x4bdf*/  .byte 0x00

            data_4be0:
/*0x4be0*/  .word 0x2000006c


            .thumb_func
            call_4be4:
/*0x4be4*/      cmp r0, #0xff
/*0x4be6*/      bhs jump_4bf6
/*0x4be8*/      adds r0, #0x2b
/*0x4bea*/      cmp r0, #0xff
/*0x4bec*/      bls jump_4bf2
/*0x4bee*/      movs r0, #0xff
/*0x4bf0*/      bx lr
            jump_4bf2:
/*0x4bf2*/      uxtb r0, r0
/*0x4bf4*/      bx lr
            jump_4bf6:
/*0x4bf6*/      movs r0, #0
/*0x4bf8*/      bx lr

/*0x4bfa*/  .byte 0x00
/*0x4bfb*/  .byte 0x00


            .thumb_func
            call_4bfc:
/*0x4bfc*/      ldr r0, [pc, #0x10] /* data_4c10 */
/*0x4bfe*/      ldrb r0, [r0]
/*0x4c00*/      cmp r0, #0
/*0x4c02*/      bne jump_4c0c
/*0x4c04*/      ldr r1, [pc, #0xc] /* data_4c14 */
/*0x4c06*/      movs r0, #0xf
/*0x4c08*/      b.w jump_5bcc
            jump_4c0c:
/*0x4c0c*/      bx lr

/*0x4c0e*/  .byte 0x00
/*0x4c0f*/  .byte 0x00

            data_4c10:
/*0x4c10*/  .word 0x20000009
            data_4c14:
/*0x4c14*/  .word data_7900


            .thumb_func
            call_4c18:
/*0x4c18*/      ldr r3, [pc, #0x84] /* data_4ca0 */
/*0x4c1a*/      push {r4, lr}
/*0x4c1c*/      ldrb r0, [r3, #3]
/*0x4c1e*/      ldr r1, [pc, #0x84] /* data_4ca4 */
/*0x4c20*/      ldrb r0, [r1, r0]
/*0x4c22*/      add.w r0, r0, r0, lsl #2
/*0x4c26*/      adds r1, r0, r3
/*0x4c28*/      ldr r0, [pc, #0x7c] /* data_4ca8 */
/*0x4c2a*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x4c2c*/      str r1, [r0]
/*0x4c2e*/      ldrb r2, [r1]
/*0x4c30*/      cbnz r2, jump_4c46
/*0x4c32*/      ldrb r2, [r1, #1]
/*0x4c34*/      cbnz r2, jump_4c46
/*0x4c36*/      ldrb r2, [r1, #2]
/*0x4c38*/      cbnz r2, jump_4c46
/*0x4c3a*/      movs r2, #0xff
/*0x4c3c*/      strb r2, [r1]
/*0x4c3e*/      ldr r1, [r0]
/*0x4c40*/      strb r2, [r1, #1]
/*0x4c42*/      ldr r1, [r0]
/*0x4c44*/      strb r2, [r1, #2]
            jump_4c46:
/*0x4c46*/      ldrb r1, [r3, #3]
/*0x4c48*/      cmp r1, #3
/*0x4c4a*/      bhi jump_4c6a
/*0x4c4c*/      movs r2, #0
/*0x4c4e*/      cmp r1, #1
/*0x4c50*/      beq jump_4c5c
/*0x4c52*/      cmp r1, #2
/*0x4c54*/      beq jump_4c60
/*0x4c56*/      cmp r1, #3
/*0x4c58*/      bne jump_4c96
/*0x4c5a*/      b jump_4c66
            jump_4c5c:
/*0x4c5c*/      str r2, [r0, #4]
/*0x4c5e*/      b jump_4c96
            jump_4c60:
/*0x4c60*/      strb r2, [r0, #4]
/*0x4c62*/      strb r2, [r0, #5]
/*0x4c64*/      b jump_4c96
            jump_4c66:
/*0x4c66*/      movs r1, #0x60
/*0x4c68*/      b jump_4c82
            jump_4c6a:
/*0x4c6a*/      cmp r1, #7
/*0x4c6c*/      bls jump_4c96
/*0x4c6e*/      bic r1, r1, #1
/*0x4c72*/      cmp r1, #8
/*0x4c74*/      beq jump_4c66
/*0x4c76*/      cmp r1, #0xa
/*0x4c78*/      beq jump_4c80
/*0x4c7a*/      cmp r1, #0xc
/*0x4c7c*/      bne jump_4c96
/*0x4c7e*/      b jump_4c8a
            jump_4c80:
/*0x4c80*/      movs r1, #0x1f
            jump_4c82:
/*0x4c82*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x4c84*/      bl mem_zero /* (dest, size) */
/*0x4c88*/      b jump_4c96
            jump_4c8a:
/*0x4c8a*/      movs r1, #0x29
/*0x4c8c*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x4c8e*/      bl mem_zero /* (dest, size) */
/*0x4c92*/      bl call_6a98
            jump_4c96:
/*0x4c96*/      ldr r1, [pc, #0x14] /* data_4cac */
/*0x4c98*/      movs r0, #1
/*0x4c9a*/      strb r0, [r1]
/*0x4c9c*/      pop {r4, pc}

/*0x4c9e*/  .byte 0x00
/*0x4c9f*/  .byte 0x00

            data_4ca0:
/*0x4ca0*/  .word 0x20000478
            data_4ca4:
/*0x4ca4*/  .word data_7953
            data_4ca8:
/*0x4ca8*/  .word 0x2000006c
            data_4cac:
/*0x4cac*/  .word 0x20000054


            .thumb_func
            call_4cb0:
/*0x4cb0*/      ldr r0, [pc, #0x20] /* data_4cd4 */
/*0x4cb2*/      ldrb r0, [r0, #3]
/*0x4cb4*/      cmp r0, #8
/*0x4cb6*/      beq jump_4cce
/*0x4cb8*/      bgt jump_4cc2
/*0x4cba*/      cbz r0, jump_4cce
/*0x4cbc*/      cmp r0, #1
/*0x4cbe*/      bne jump_4cca
/*0x4cc0*/      b jump_4cce
            jump_4cc2:
/*0x4cc2*/      cmp r0, #0xa
/*0x4cc4*/      beq jump_4cce
/*0x4cc6*/      cmp r0, #0xc
/*0x4cc8*/      beq jump_4cce
            jump_4cca:
/*0x4cca*/      movs r0, #0
/*0x4ccc*/      bx lr
            jump_4cce:
/*0x4cce*/      movs r0, #1
/*0x4cd0*/      bx lr

/*0x4cd2*/  .byte 0x00
/*0x4cd3*/  .byte 0x00

            data_4cd4:
/*0x4cd4*/  .word 0x20000478

            jump_4cd8:
/*0x4cd8*/      push {r4, r5, r6, lr}
/*0x4cda*/      ldr r5, [pc, #0x110] /* data_4dec */
/*0x4cdc*/      uxtb r1, r0
/*0x4cde*/      ldr r3, [pc, #0x110] /* data_4df0 */
/*0x4ce0*/      ldrb r6, [r5, #3]
/*0x4ce2*/      mov r4, r0
/*0x4ce4*/      cmp r1, #0x92
/*0x4ce6*/      beq jump_4d76
/*0x4ce8*/      bgt jump_4d16
/*0x4cea*/      mov r0, r5
/*0x4cec*/      cmp r1, #0x82
/*0x4cee*/      ldrb r0, [r0, #3]
/*0x4cf0*/      add.w r0, r0, #1
/*0x4cf4*/      uxtb r2, r0
/*0x4cf6*/      beq jump_4d5a
/*0x4cf8*/      bgt jump_4d0c
/*0x4cfa*/      cmp r1, #0x70
/*0x4cfc*/      beq jump_4d26
/*0x4cfe*/      cmp r1, #0x81
/*0x4d00*/      bne jump_4d58
/*0x4d02*/      strb r2, [r5, #3]
/*0x4d04*/      cmp r2, #3
/*0x4d06*/      bls jump_4d66
/*0x4d08*/      movs r0, #0
/*0x4d0a*/      b jump_4d64
            jump_4d0c:
/*0x4d0c*/      cmp r1, #0x90
/*0x4d0e*/      beq jump_4d76
/*0x4d10*/      cmp r1, #0x91
/*0x4d12*/      bne jump_4d58
/*0x4d14*/      b jump_4d76
            jump_4d16:
/*0x4d16*/      cmp r1, #0x93
/*0x4d18*/      beq jump_4d76
/*0x4d1a*/      cmp r1, #0xa0
/*0x4d1c*/      beq jump_4d26
/*0x4d1e*/      cmp r1, #0xa1
/*0x4d20*/      beq jump_4d26
/*0x4d22*/      cmp r1, #0xa2
/*0x4d24*/      bne jump_4d58
            jump_4d26:
/*0x4d26*/      bl call_4cb0
/*0x4d2a*/      cmp r0, #0
/*0x4d2c*/      beq jump_4d58
/*0x4d2e*/      cmp r1, #0x70
/*0x4d30*/      beq jump_4d52
/*0x4d32*/      cmp r1, #0xa0
/*0x4d34*/      beq jump_4d3e
/*0x4d36*/      cmp r1, #0xa1
/*0x4d38*/      beq jump_4d3e
/*0x4d3a*/      cmp r1, #0xa2
/*0x4d3c*/      bne jump_4d58
            jump_4d3e:
/*0x4d3e*/      subs r1, #0xa0
/*0x4d40*/      ldr r0, [r3]
/*0x4d42*/      uxtb r1, r1
/*0x4d44*/      adds r4, r0, r1
/*0x4d46*/      movs r2, #1
/*0x4d48*/      ldrb r0, [r4]
/*0x4d4a*/      bl call_4be4
/*0x4d4e*/      strb r0, [r4]
/*0x4d50*/      b jump_4dde
            jump_4d52:
/*0x4d52*/      ldr r1, [pc, #0xa0] /* data_4df4 */
/*0x4d54*/      movs r0, #1
/*0x4d56*/      strb r0, [r1, #2]
            jump_4d58:
/*0x4d58*/      pop {r4, r5, r6, pc}
            jump_4d5a:
/*0x4d5a*/      strb r2, [r5, #3]
/*0x4d5c*/      .short 0x1fd2 /* subs r2, r2, #7 */ 
/*0x4d5e*/      cmp r2, #7
/*0x4d60*/      blo jump_4d66
/*0x4d62*/      movs r0, #7
            jump_4d64:
/*0x4d64*/      strb r0, [r5, #3]
            jump_4d66:
/*0x4d66*/      bl call_4c18
/*0x4d6a*/      bl call_4e98
/*0x4d6e*/      mov r0, r4
/*0x4d70*/      bl call_4dfc
/*0x4d74*/      b jump_4dde
            jump_4d76:
/*0x4d76*/      ldr r0, [pc, #0x80] /* data_4df8 */
/*0x4d78*/      ldrb r0, [r0, r6]
/*0x4d7a*/      cmp r0, #0xff
/*0x4d7c*/      beq jump_4dde
/*0x4d7e*/      ldr r0, [pc, #0x70] /* data_4df0 */
/*0x4d80*/      cmp r1, #0x90
/*0x4d82*/      ldr r0, [r0]
/*0x4d84*/      beq jump_4dd0
/*0x4d86*/      cmp r1, #0x91
/*0x4d88*/      beq jump_4db8
/*0x4d8a*/      movs r2, #6
/*0x4d8c*/      cmp r1, #0x92
/*0x4d8e*/      beq jump_4da4
/*0x4d90*/      cmp r1, #0x93
/*0x4d92*/      bne jump_4dde
/*0x4d94*/      ldrb r1, [r0, #3]
/*0x4d96*/      cmp r1, #8
/*0x4d98*/      bhs jump_4dde
/*0x4d9a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4d9c*/      b jump_4dac
            jump_4d9e:
/*0x4d9e*/      bl call_6a98
/*0x4da2*/      b jump_4dde
            jump_4da4:
/*0x4da4*/      ldrb r1, [r0, #3]
/*0x4da6*/      cmp r1, #1
/*0x4da8*/      bls jump_4dde
/*0x4daa*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_4dac:
/*0x4dac*/      strb r1, [r0, #3]
/*0x4dae*/      ldrb r0, [r5, #3]
/*0x4db0*/      cmp.w r2, r0, lsr #1
/*0x4db4*/      beq jump_4d9e
/*0x4db6*/      b jump_4dde
            jump_4db8:
/*0x4db8*/      ldrb r1, [r0, #4]
/*0x4dba*/      and r2, r1, #0xf
/*0x4dbe*/      cmp r2, #5
/*0x4dc0*/      bhs jump_4dde
/*0x4dc2*/      mov.w r2, #0x10000000
/*0x4dc6*/      add.w r1, r2, r1, ror #4
/*0x4dca*/      ror.w r1, r1, #0x1c
/*0x4dce*/      b jump_4ddc
            jump_4dd0:
/*0x4dd0*/      ldrb r1, [r0, #4]
/*0x4dd2*/      lsls r2, r1, #0x1c
/*0x4dd4*/      beq jump_4dde
/*0x4dd6*/      subs r2, r1, #1
/*0x4dd8*/      bfi r1, r2, #0, #4
            jump_4ddc:
/*0x4ddc*/      strb r1, [r0, #4]
            jump_4dde:
/*0x4dde*/      bl call_4ea4
/*0x4de2*/      pop.w {r4, r5, r6, lr}
/*0x4de6*/      b.w call_3c8c

/*0x4dea*/  .byte 0x00
/*0x4deb*/  .byte 0x00

            data_4dec:
/*0x4dec*/  .word 0x20000478
            data_4df0:
/*0x4df0*/  .word 0x2000006c
            data_4df4:
/*0x4df4*/  .word 0x20000054
            data_4df8:
/*0x4df8*/  .word data_7953


            .thumb_func
            call_4dfc:
/*0x4dfc*/      push {r4, r5, r6, lr}
/*0x4dfe*/      lsrs r1, r0, #0x18
/*0x4e00*/      lsls r1, r1, #0x1e
/*0x4e02*/      bpl jump_4e4e
/*0x4e04*/      ldr r1, [pc, #0x84] /* data_4e8c */
/*0x4e06*/      ldrb r1, [r1, #3]
/*0x4e08*/      cmp r1, #7
/*0x4e0a*/      bls jump_4e4e
/*0x4e0c*/      ldr r5, [pc, #0x80] /* data_4e90 */
/*0x4e0e*/      and r2, r1, #1
/*0x4e12*/      bic r3, r1, #1
/*0x4e16*/      ldr r1, [r5]
/*0x4e18*/      ubfx r0, r0, #0x10, #8
/*0x4e1c*/      cmp r3, #8
/*0x4e1e*/      beq jump_4e50
/*0x4e20*/      cmp r3, #0xa
/*0x4e22*/      beq jump_4e64
/*0x4e24*/      cmp r3, #0xc
/*0x4e26*/      bne jump_4e4e
/*0x4e28*/      ldr r3, [pc, #0x68] /* data_4e94 */
/*0x4e2a*/      ldrb r4, [r3, r0]
/*0x4e2c*/      cmp r4, #0xff
/*0x4e2e*/      beq jump_4e4e
/*0x4e30*/      and r0, r4, #7
/*0x4e34*/      add.w r0, r0, r0, lsl #2
/*0x4e38*/      add r5, r0
/*0x4e3a*/      adds r5, #0xe
/*0x4e3c*/      cbz r2, jump_4e40
/*0x4e3e*/      movs r1, #0
            jump_4e40:
/*0x4e40*/      mov r0, r5
/*0x4e42*/      bl call_6c98
/*0x4e46*/      lsrs r0, r4, #3
/*0x4e48*/      strb r0, [r5, #3]
/*0x4e4a*/      movs r0, #1
/*0x4e4c*/      strb r0, [r5, #4]
            jump_4e4e:
/*0x4e4e*/      pop {r4, r5, r6, pc}
            jump_4e50:
/*0x4e50*/      cbz r2, jump_4e54
/*0x4e52*/      movs r1, #0
            jump_4e54:
/*0x4e54*/      add.w r0, r0, r0, lsl #1
/*0x4e58*/      add r0, r5
/*0x4e5a*/      pop.w {r4, r5, r6, lr}
/*0x4e5e*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x4e60*/      b.w call_6c98
            jump_4e64:
/*0x4e64*/      ldr r3, [pc, #0x2c] /* data_4e94 */
/*0x4e66*/      subs r3, #0x20
/*0x4e68*/      ldrb r0, [r3, r0]
/*0x4e6a*/      cmp r0, #0xff
/*0x4e6c*/      beq jump_4e4e
/*0x4e6e*/      cbz r2, jump_4e72
/*0x4e70*/      movs r1, #0
            jump_4e72:
/*0x4e72*/      add.w r0, r0, r0, lsl #1
/*0x4e76*/      add.w r4, r5, r0, lsl #1
/*0x4e7a*/      adds r0, r4, #4
/*0x4e7c*/      bl call_6c98
/*0x4e80*/      ldrh r0, [r4, #4]
/*0x4e82*/      strh.w r0, [r4, #7]
/*0x4e86*/      ldrb r0, [r4, #6]
/*0x4e88*/      strb r0, [r4, #9]
/*0x4e8a*/      pop {r4, r5, r6, pc}

            data_4e8c:
/*0x4e8c*/  .word 0x20000478
            data_4e90:
/*0x4e90*/  .word 0x2000006c
            data_4e94:
/*0x4e94*/  .word data_79cb


            .thumb_func
            call_4e98:
/*0x4e98*/      movs r1, #0x60
/*0x4e9a*/      ldr r0, [pc, #4] /* data_4ea0 */
/*0x4e9c*/      b.w mem_zero /* (dest, size) */

            data_4ea0:
/*0x4ea0*/  .word 0x20000240


            .thumb_func
            call_4ea4:
/*0x4ea4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4ea8*/      ldr r4, [pc, #0x118] /* data_4fc4 */
/*0x4eaa*/      ldrb r0, [r4, #5]
/*0x4eac*/      cmp r0, #0
/*0x4eae*/      bne jump_4eb8
/*0x4eb0*/      ldrb r0, [r4, #3]
/*0x4eb2*/      movs r7, #1
/*0x4eb4*/      cbz r0, jump_4ebc
/*0x4eb6*/      strb r7, [r4, #1]
            jump_4eb8:
/*0x4eb8*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_4ebc:
/*0x4ebc*/      ldrb r0, [r4, #2]
/*0x4ebe*/      cbz r0, jump_4ed2
/*0x4ec0*/      bl call_54d4
/*0x4ec4*/      movs r1, #0
/*0x4ec6*/      movs r0, #0x31
/*0x4ec8*/      bl call_3da0
/*0x4ecc*/      movs r1, #0
/*0x4ece*/      movs r0, #0x32
/*0x4ed0*/      b jump_4f58
            jump_4ed2:
/*0x4ed2*/      ldrb r0, [r4, #6]
/*0x4ed4*/      ldr r6, [pc, #0xf0] /* data_4fc8 */
/*0x4ed6*/      ldr r5, [pc, #0xf4] /* data_4fcc */
/*0x4ed8*/      ldr.w r8, [pc, #0xf4] /* data_4fd0 */
/*0x4edc*/      cbz r0, jump_4f4a
/*0x4ede*/      cmp r0, #8
/*0x4ee0*/      bhs switch_4fbc
/*0x4ee2*/      tbb [pc, r0]

/*0x4ee6*/  .byte 0x6b /* case switch_4fbc */
/*0x4ee7*/  .byte 0x04 /* case switch_4eee */
/*0x4ee8*/  .byte 0x04 /* case switch_4eee */
/*0x4ee9*/  .byte 0x04 /* case switch_4eee */
/*0x4eea*/  .byte 0x0a /* case switch_4efa */
/*0x4eeb*/  .byte 0x0c /* case switch_4efe */
/*0x4eec*/  .byte 0x12 /* case switch_4f0a */
/*0x4eed*/  .byte 0x26 /* case switch_4f32 */

            switch_4eee:
/*0x4eee*/      add.w r0, r8, r0, lsl #5
/*0x4ef2*/      movs r2, #0xff
/*0x4ef4*/      movs r1, #0x20
/*0x4ef6*/      subs r0, #0x20
/*0x4ef8*/      b jump_4f04
            switch_4efa:
/*0x4efa*/      movs r2, #0x80
/*0x4efc*/      b jump_4f00
            switch_4efe:
/*0x4efe*/      movs r2, #0xff
            jump_4f00:
/*0x4f00*/      movs r1, #0x60
/*0x4f02*/      ldr r0, [pc, #0xcc] /* data_4fd0 */
            jump_4f04:
/*0x4f04*/      bl mem_set /* (dest, size, val) */
/*0x4f08*/      b switch_4fbc
            switch_4f0a:
/*0x4f0a*/      movs r4, #0x20
/*0x4f0c*/      ldr r5, [pc, #0xc4] /* data_4fd4 */
/*0x4f0e*/      b jump_4f2a
            jump_4f10:
/*0x4f10*/      ldrb r0, [r5, r4]
/*0x4f12*/      ldrb r1, [r6, #5]
/*0x4f14*/      cmp r1, r0
/*0x4f16*/      bne jump_4f1c
/*0x4f18*/      movs r1, #0
/*0x4f1a*/      b jump_4f24
            jump_4f1c:
/*0x4f1c*/      ldrb r1, [r6, #4]
/*0x4f1e*/      cmp r1, r0
/*0x4f20*/      bne jump_4f2a
/*0x4f22*/      movs r1, #0xff
            jump_4f24:
/*0x4f24*/      mov r0, r4
/*0x4f26*/      bl call_3da0
            jump_4f2a:
/*0x4f2a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4f2c*/      uxtb r4, r4
/*0x4f2e*/      bhs jump_4f10
/*0x4f30*/      b switch_4fbc
            switch_4f32:
/*0x4f32*/      movs r1, #0x60
/*0x4f34*/      ldr r0, [pc, #0x98] /* data_4fd0 */
/*0x4f36*/      bl mem_zero /* (dest, size) */
/*0x4f3a*/      ldrb r0, [r6, #4]
/*0x4f3c*/      cbz r0, jump_4f4c
/*0x4f3e*/      movs r0, #0
            jump_4f40:
/*0x4f40*/      bl call_3b94
/*0x4f44*/      cbz r0, jump_4f52
/*0x4f46*/      movs r0, #0x57
/*0x4f48*/      b jump_4f54
            jump_4f4a:
/*0x4f4a*/      b jump_4f5e
            jump_4f4c:
/*0x4f4c*/      strb r7, [r6, #4]
/*0x4f4e*/      movs r0, #1
/*0x4f50*/      b jump_4f40
            jump_4f52:
/*0x4f52*/      movs r0, #0x56
            jump_4f54:
/*0x4f54*/      movs r1, #0xb4
/*0x4f56*/      ldrb r0, [r5, r0]
            jump_4f58:
/*0x4f58*/      bl call_3da0
/*0x4f5c*/      b switch_4fbc
            jump_4f5e:
/*0x4f5e*/      bl call_6ac8
/*0x4f62*/      ldr r0, [pc, #0x74] /* data_4fd8 */
/*0x4f64*/      ldrb r0, [r0, #1]
/*0x4f66*/      lsls r0, r0, #0x19
/*0x4f68*/      bpl jump_4fae
/*0x4f6a*/      ldrb r0, [r4, #7]
/*0x4f6c*/      lsls r0, r0, #0x1f
/*0x4f6e*/      bne jump_4f76
/*0x4f70*/      bl call_4cb0
/*0x4f74*/      cbz r0, jump_4fae
            jump_4f76:
/*0x4f76*/      ldrb r0, [r4, #7]
/*0x4f78*/      lsls r0, r0, #0x1f
/*0x4f7a*/      beq jump_4f80
/*0x4f7c*/      ldr r7, [pc, #0x5c] /* data_4fdc */
/*0x4f7e*/      b jump_4f82
            jump_4f80:
/*0x4f80*/      ldr r7, [r6]
            jump_4f82:
/*0x4f82*/      movs r1, #3
/*0x4f84*/      mov ip, r8
/*0x4f86*/      b jump_4fa8
            jump_4f88:
/*0x4f88*/      adds r0, r5, r1
/*0x4f8a*/      ldrb.w r6, [r0, #0x54]
/*0x4f8e*/      movs r0, #3
/*0x4f90*/      b jump_4fa2
            jump_4f92:
/*0x4f92*/      cmp r1, r0
/*0x4f94*/      bne jump_4f9a
/*0x4f96*/      ldrb r2, [r7, r0]
/*0x4f98*/      b jump_4f9c
            jump_4f9a:
/*0x4f9a*/      movs r2, #0
            jump_4f9c:
/*0x4f9c*/      add.w r3, ip, r0, lsl #5
/*0x4fa0*/      strb r2, [r3, r6]
            jump_4fa2:
/*0x4fa2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4fa4*/      uxtb r0, r0
/*0x4fa6*/      bhs jump_4f92
            jump_4fa8:
/*0x4fa8*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4faa*/      uxtb r1, r1
/*0x4fac*/      bhs jump_4f88
            jump_4fae:
/*0x4fae*/      ldrb r0, [r4, #7]
/*0x4fb0*/      lsls r0, r0, #0x1f
/*0x4fb2*/      beq switch_4fbc
/*0x4fb4*/      ldr r1, [pc, #0x24] /* data_4fdc */
/*0x4fb6*/      movs r0, #0x3c
/*0x4fb8*/      bl call_3d80
            switch_4fbc:
/*0x4fbc*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x4fc0*/      b.w jump_4fe0

            data_4fc4:
/*0x4fc4*/  .word 0x20000054
            data_4fc8:
/*0x4fc8*/  .word 0x2000006c
            data_4fcc:
/*0x4fcc*/  .word 0x20000114
            data_4fd0:
/*0x4fd0*/  .word 0x20000240
            data_4fd4:
/*0x4fd4*/  .word data_798b
            data_4fd8:
/*0x4fd8*/  .word 0x20000060
            data_4fdc:
/*0x4fdc*/  .word 0x20000000

            jump_4fe0:
/*0x4fe0*/      push {r4, lr}
/*0x4fe2*/      ldr r4, [pc, #0x24] /* data_5008 */
/*0x4fe4*/      ldrb r0, [r4, #6]
/*0x4fe6*/      cbnz r0, jump_5000
/*0x4fe8*/      ldr r0, [pc, #0x20] /* data_500c */
/*0x4fea*/      ldrb r0, [r0]
/*0x4fec*/      lsls r0, r0, #0x1f
/*0x4fee*/      beq jump_4ff4
/*0x4ff0*/      movs r1, #0xff
/*0x4ff2*/      b jump_4ff6
            jump_4ff4:
/*0x4ff4*/      movs r1, #0
            jump_4ff6:
/*0x4ff6*/      ldr r0, [pc, #0x18] /* data_5010 */
/*0x4ff8*/      ldrb.w r0, [r0, #0x53]
/*0x4ffc*/      bl call_3da0
            jump_5000:
/*0x5000*/      movs r0, #1
/*0x5002*/      strb r0, [r4, #1]
/*0x5004*/      pop {r4, pc}

/*0x5006*/  .byte 0x00
/*0x5007*/  .byte 0x00

            data_5008:
/*0x5008*/  .word 0x20000054
            data_500c:
/*0x500c*/  .word 0x20000008
            data_5010:
/*0x5010*/  .word 0x20000114


            .thumb_func
            call_5014:
/*0x5014*/      push {r4, lr}
/*0x5016*/      ldr r4, [pc, #0x74] /* data_508c */
/*0x5018*/      cbz r0, jump_5052
/*0x501a*/      movs r1, #0
/*0x501c*/      mov r0, r4
/*0x501e*/      bl call_37c6
/*0x5022*/      movs r1, #0
/*0x5024*/      mov r0, r4
/*0x5026*/      bl call_37b2
/*0x502a*/      mov r0, r4
/*0x502c*/      bl call_37a4
/*0x5030*/      movs r0, #0x29
/*0x5032*/      bl call_5170
/*0x5036*/      bl call_5664
/*0x503a*/      bl call_5208
/*0x503e*/      movs r0, #1
/*0x5040*/      bl call_5b60
/*0x5044*/      bl call_5d2c
/*0x5048*/      pop.w {r4, lr}
/*0x504c*/      movs r0, #1
/*0x504e*/      b.w call_6184
            jump_5052:
/*0x5052*/      bl call_520c
/*0x5056*/      movs r0, #0
/*0x5058*/      bl call_5b60
/*0x505c*/      movs r0, #0
/*0x505e*/      bl call_6184
/*0x5062*/      movs r1, #0
/*0x5064*/      mov r0, r4
/*0x5066*/      bl call_37de
/*0x506a*/      mov r0, r4
/*0x506c*/      bl call_37a4
/*0x5070*/      movs r1, #1
/*0x5072*/      mov r0, r4
/*0x5074*/      bl call_37b2
/*0x5078*/      movs r1, #1
/*0x507a*/      mov r0, r4
/*0x507c*/      bl call_37c6
/*0x5080*/      ldr r1, [pc, #0xc] /* data_5090 */
/*0x5082*/      mov.w r0, #0x200
/*0x5086*/      str.w r0, [r1, #0x100]
/*0x508a*/      pop {r4, pc}

            data_508c:
/*0x508c*/  .word 0x40076000
            data_5090:
/*0x5090*/  .word 0xe000e004


            .thumb_func
            call_5094:
/*0x5094*/      push {r4, lr}
/*0x5096*/      movs r4, #0
/*0x5098*/      cmp r0, #2
/*0x509a*/      beq jump_50a2
/*0x509c*/      ldr r1, [pc, #0x20] /* data_50c0 */
/*0x509e*/      str r4, [r1, #8]
/*0x50a0*/      str r4, [r1, #0xc]
            jump_50a2:
/*0x50a2*/      cbz r0, jump_50bc
/*0x50a4*/      movs r0, #2
            jump_50a6:
/*0x50a6*/      bl call_4734
/*0x50aa*/      ldr r0, [pc, #0x14] /* data_50c0 */
/*0x50ac*/      adds r0, #8
/*0x50ae*/      strb r4, [r0, #4]
/*0x50b0*/      bl call_4c18
/*0x50b4*/      pop.w {r4, lr}
/*0x50b8*/      b.w call_5494
            jump_50bc:
/*0x50bc*/      movs r0, #1
/*0x50be*/      b jump_50a6

            data_50c0:
/*0x50c0*/  .word 0x2000004c


            .thumb_func
            call_50c4:
/*0x50c4*/      push {r4, lr}
/*0x50c6*/      movs r0, #0
/*0x50c8*/      mov.w r2, #0x10000
/*0x50cc*/      movs r3, #1
/*0x50ce*/      mov r1, r0
/*0x50d0*/      bl call_398c
/*0x50d4*/      pop.w {r4, lr}
/*0x50d8*/      movw r1, #0x8c9f
/*0x50dc*/      ldr r0, [pc, #4] /* data_50e4 */
/*0x50de*/      b.w call_37da

/*0x50e2*/  .byte 0x00
/*0x50e3*/  .byte 0x00

            data_50e4:
/*0x50e4*/  .word 0x40076000


            .thumb_func
            setup_intr_priority:
/*0x50e8*/      push {r4, lr}
/*0x50ea*/      mov.w r1, #0x3400
/*0x50ee*/      movs r0, #0
/*0x50f0*/      bl call_51d8
/*0x50f4*/      ldr r1, [pc, #0x70] /* data_5168 */
/*0x50f6*/      ldr r0, [r1]
/*0x50f8*/      movw r2, #0xf8ff
/*0x50fc*/      ands r0, r2
/*0x50fe*/      ldr r2, [pc, #0x6c] /* data_516c */
/*0x5100*/      orr r0, r0, #0x300
/*0x5104*/      orrs r0, r2
/*0x5106*/      str r0, [r1]
/*0x5108*/      movs r2, #0
/*0x510a*/      mov r1, r2
/*0x510c*/      movs r0, #3
/*0x510e*/      bl call_5186
/*0x5112*/      mov r1, r0
/*0x5114*/      movs r0, #0x2b
/*0x5116*/      bl call_51b8
/*0x511a*/      movs r2, #0
/*0x511c*/      mov r1, r2
/*0x511e*/      movs r0, #3
/*0x5120*/      bl call_5186
/*0x5124*/      mov r1, r0
/*0x5126*/      movs r0, #0x2c
/*0x5128*/      bl call_51b8
/*0x512c*/      movs r2, #0
/*0x512e*/      movs r1, #1
/*0x5130*/      movs r0, #3
/*0x5132*/      bl call_5186
/*0x5136*/      mov r1, r0
/*0x5138*/      movs r0, #0x2a
/*0x513a*/      bl call_51b8
/*0x513e*/      movs r2, #0
/*0x5140*/      movs r1, #2
/*0x5142*/      movs r0, #3
/*0x5144*/      bl call_5186
/*0x5148*/      mov r1, r0
/*0x514a*/      movs r0, #0x29
/*0x514c*/      bl call_51b8
/*0x5150*/      movs r2, #0
/*0x5152*/      movs r1, #2
/*0x5154*/      movs r0, #3
/*0x5156*/      bl call_5186
/*0x515a*/      mov r1, r0
/*0x515c*/      pop.w {r4, lr}
/*0x5160*/      movs r0, #0x35
/*0x5162*/      b.w call_51b8

/*0x5166*/  .byte 0x00
/*0x5167*/  .byte 0x00

            data_5168:
/*0x5168*/  .word 0xe000ed0c
            data_516c:
/*0x516c*/  .word 0x05fa0000


            .thumb_func
            call_5170:
/*0x5170*/      and r2, r0, #0x1f
/*0x5174*/      movs r1, #1
/*0x5176*/      lsls r1, r2
/*0x5178*/      lsrs r0, r0, #5
/*0x517a*/      lsls r0, r0, #2
/*0x517c*/      add.w r0, r0, #-0x1fff2000
/*0x5180*/      str.w r1, [r0, #0x180]
/*0x5184*/      bx lr

            .thumb_func
            call_5186:
/*0x5186*/      push {r4, r5, lr}
/*0x5188*/      and r3, r0, #7
/*0x518c*/      rsb.w r4, r3, #7
/*0x5190*/      cmp r4, #4
/*0x5192*/      bls jump_5196
/*0x5194*/      movs r4, #4
            jump_5196:
/*0x5196*/      adds r0, r3, #4
/*0x5198*/      cmp r0, #7
/*0x519a*/      bhs jump_51a0
/*0x519c*/      movs r3, #0
/*0x519e*/      b jump_51a2
            jump_51a0:
/*0x51a0*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_51a2:
/*0x51a2*/      movs r5, #1
/*0x51a4*/      lsl.w r0, r5, r4
/*0x51a8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x51aa*/      ands r0, r1
/*0x51ac*/      lsls r0, r3
/*0x51ae*/      lsls r5, r3
/*0x51b0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x51b2*/      ands r5, r2
/*0x51b4*/      orrs r0, r5
/*0x51b6*/      pop {r4, r5, pc}

            .thumb_func
            call_51b8:
/*0x51b8*/      lsls r1, r1, #0x1c
/*0x51ba*/      lsrs r1, r1, #0x18
/*0x51bc*/      cmp r0, #0
/*0x51be*/      bge jump_51ce
/*0x51c0*/      and r0, r0, #0xf
/*0x51c4*/      add.w r0, r0, #-0x1fff2000
/*0x51c8*/      strb.w r1, [r0, #0xd14]
/*0x51cc*/      bx lr
            jump_51ce:
/*0x51ce*/      add.w r0, r0, #-0x1fff2000
/*0x51d2*/      strb.w r1, [r0, #0x400]
/*0x51d6*/      bx lr

            .thumb_func
            call_51d8:
/*0x51d8*/      ldr r2, [pc, #8] /* data_51e4 */
/*0x51da*/      ands r1, r2
/*0x51dc*/      orrs r1, r0
/*0x51de*/      ldr r0, [pc, #8] /* data_51e8 */
/*0x51e0*/      str r1, [r0]
/*0x51e2*/      bx lr

            data_51e4:
/*0x51e4*/  .word 0x1fffff80
            data_51e8:
/*0x51e8*/  .word 0xe000ed08


            .thumb_func
            call_51ec:
/*0x51ec*/      push {r4, lr}
/*0x51ee*/      bl call_3e68
/*0x51f2*/      bl call_3de4
/*0x51f6*/      cmp r0, #1
/*0x51f8*/      bne jump_5204
/*0x51fa*/      movs r0, #2
/*0x51fc*/      bl call_5ff6
/*0x5200*/      cmp r0, #1
/*0x5202*/      beq jump_5206
            jump_5204:
/*0x5204*/      movs r0, #0
            jump_5206:
/*0x5206*/      pop {r4, pc}

            .thumb_func
            call_5208:
/*0x5208*/      b.w jump_3ebc

            .thumb_func
            call_520c:
/*0x520c*/      b.w call_3f04

            .thumb_func
            call_5210:
/*0x5210*/      push {r4, r5, r6, lr}
/*0x5212*/      ldr r5, [pc, #0x3c] /* data_5250 */
/*0x5214*/      mov r4, r0
/*0x5216*/      ldrb r0, [r5, #2]
/*0x5218*/      cmp r0, #2
/*0x521a*/      bne jump_5222
/*0x521c*/      movs r0, #1
/*0x521e*/      bl call_4318
            jump_5222:
/*0x5222*/      ldrh r0, [r4, #4]
/*0x5224*/      ldr r1, [pc, #0x28] /* data_5250 */
/*0x5226*/      ubfx r0, r0, #0, #0xa
/*0x522a*/      strh r0, [r5]
/*0x522c*/      movs r0, #2
/*0x522e*/      strb r0, [r5, #2]
/*0x5230*/      ldrb r0, [r4, #5]
/*0x5232*/      .short 0x1d89 /* adds r1, r1, #6 */ 
/*0x5234*/      lsrs r0, r0, #5
/*0x5236*/      strb r0, [r5, #4]
/*0x5238*/      movs r0, #0
/*0x523a*/      strb r0, [r1, #5]
/*0x523c*/      strh r0, [r1]
/*0x523e*/      ldrb r2, [r4, #6]
/*0x5240*/      ldr r0, [pc, #0x10] /* data_5254 */
/*0x5242*/      ldr r1, [r4]
/*0x5244*/      bl memcpy /* (dest, src, size) */
/*0x5248*/      pop.w {r4, r5, r6, lr}
/*0x524c*/      b.w jump_6de0

            data_5250:
/*0x5250*/  .word 0x20001542
            data_5254:
/*0x5254*/  .word 0x20000542


            .thumb_func
            call_5258:
/*0x5258*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x525c*/      ldr r4, [pc, #0xc4] /* data_5324 */
/*0x525e*/      movs r5, #0
/*0x5260*/      ldr r7, [pc, #0xc4] /* data_5328 */
/*0x5262*/      ldrb r0, [r4, #2]
/*0x5264*/      adds r6, r4, #6
/*0x5266*/      cmp r0, #1
/*0x5268*/      beq jump_5282
/*0x526a*/      cmp r0, #2
/*0x526c*/      beq jump_52e0
/*0x526e*/      cmp r0, #3
/*0x5270*/      bne jump_527e
/*0x5272*/      movs r0, #1
/*0x5274*/      bl call_4318
/*0x5278*/      cmp r0, #0
/*0x527a*/      beq jump_527e
/*0x527c*/      strb r5, [r4, #2]
            jump_527e:
/*0x527e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5282:
/*0x5282*/      ldr r0, [pc, #0xa8] /* data_532c */
/*0x5284*/      ldrb r0, [r0, #3]
/*0x5286*/      lsls r0, r0, #0x1e
/*0x5288*/      bmi jump_52a0
/*0x528a*/      ldrb r0, [r4, #3]
/*0x528c*/      cmp r0, #1
/*0x528e*/      bne jump_52a0
/*0x5290*/      bl call_46fc
/*0x5294*/      cmp r0, #1
/*0x5296*/      bne jump_52a0
/*0x5298*/      movs r0, #2
/*0x529a*/      strb r0, [r4, #3]
/*0x529c*/      ldr r0, [pc, #0x90] /* data_5330 */
/*0x529e*/      strh r5, [r0]
            jump_52a0:
/*0x52a0*/      ldr r0, [r7]
/*0x52a2*/      ldr r1, [pc, #0x90] /* data_5334 */
/*0x52a4*/      cmp r0, r1
/*0x52a6*/      bhs jump_52b4
/*0x52a8*/      movs r0, #8
/*0x52aa*/      strb r0, [r4, #3]
/*0x52ac*/      movs r0, #0
/*0x52ae*/      bl call_4318
/*0x52b2*/      b jump_52c2
            jump_52b4:
/*0x52b4*/      ldrb r0, [r6, #5]
/*0x52b6*/      lsls r0, r0, #0x1f
/*0x52b8*/      beq jump_52c2
/*0x52ba*/      mvn r0, #2
/*0x52be*/      str r0, [r7]
/*0x52c0*/      strb r5, [r6, #5]
            jump_52c2:
/*0x52c2*/      ldrb r0, [r4, #3]
/*0x52c4*/      cmp r0, #6
/*0x52c6*/      beq jump_52d0
/*0x52c8*/      cmp r0, #7
/*0x52ca*/      beq jump_52d0
/*0x52cc*/      cmp r0, #8
/*0x52ce*/      bne jump_527e
            jump_52d0:
/*0x52d0*/      bl call_46fc
/*0x52d4*/      cmp r0, #1
/*0x52d6*/      bne jump_527e
/*0x52d8*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x52dc*/      b.w jump_53ec
            jump_52e0:
/*0x52e0*/      ldrh r0, [r6]
/*0x52e2*/      cbz r0, jump_530a
/*0x52e4*/      ldr r1, [r7]
/*0x52e6*/      cmp r1, #0
/*0x52e8*/      bne jump_527e
/*0x52ea*/      cmp.w r0, #0x400
/*0x52ee*/      bhs jump_5300
/*0x52f0*/      ldr r1, [pc, #0x44] /* data_5338 */
/*0x52f2*/      add.w r0, r1, r0, lsl #2
/*0x52f6*/      movs r1, #7
/*0x52f8*/      ldrb r0, [r0, #1]
/*0x52fa*/      cmp.w r1, r0, lsr #5
/*0x52fe*/      bne jump_5312
            jump_5300:
/*0x5300*/      ldrb r0, [r4, #4]
/*0x5302*/      cmp r0, #1
/*0x5304*/      beq jump_531a
/*0x5306*/      strh r5, [r6]
/*0x5308*/      b jump_5312
            jump_530a:
/*0x530a*/      ldrb r0, [r6, #4]
/*0x530c*/      movs r1, #0
/*0x530e*/      bl call_3b6c
            jump_5312:
/*0x5312*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5316*/      b.w jump_6de0
            jump_531a:
/*0x531a*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x531e*/      b.w call_5494

/*0x5322*/  .byte 0x00
/*0x5323*/  .byte 0x00

            data_5324:
/*0x5324*/  .word 0x20001542
            data_5328:
/*0x5328*/  .word 0x20000064
            data_532c:
/*0x532c*/  .word 0x20000060
            data_5330:
/*0x5330*/  .word 0x20000018
            data_5334:
/*0x5334*/  .word 0xfffe2b3f
            data_5338:
/*0x5338*/  .word 0x20000542


            .thumb_func
            call_533c:
/*0x533c*/      push {r4, r5, r6, lr}
/*0x533e*/      ldr r5, [pc, #0xa0] /* data_53e0 */
/*0x5340*/      ldr r6, [pc, #0xa0] /* data_53e4 */
/*0x5342*/      ldrb r0, [r5, #2]
/*0x5344*/      cbz r0, jump_5354
/*0x5346*/      cmp r0, #1
/*0x5348*/      beq jump_53d4
/*0x534a*/      cmp r0, #2
/*0x534c*/      beq jump_5396
/*0x534e*/      cmp r0, #3
/*0x5350*/      bne jump_53dc
/*0x5352*/      b jump_53c8
            jump_5354:
/*0x5354*/      bl call_6cc8
/*0x5358*/      mov r4, r0
/*0x535a*/      cmp r0, #0x18
/*0x535c*/      bhs jump_53dc
/*0x535e*/      ldrb r0, [r6, #3]
/*0x5360*/      lsls r0, r0, #0x1e
/*0x5362*/      bpl jump_53d0
/*0x5364*/      ldrb r0, [r5, #2]
/*0x5366*/      cbz r0, jump_536e
/*0x5368*/      movs r0, #0
/*0x536a*/      bl call_4318
            jump_536e:
/*0x536e*/      ldr r0, [r6]
/*0x5370*/      bl call_4666
/*0x5374*/      strh r0, [r5]
/*0x5376*/      movs r0, #2
/*0x5378*/      strb r0, [r5, #2]
/*0x537a*/      ldr r0, [pc, #0x64] /* data_53e0 */
/*0x537c*/      ldr r2, [pc, #0x68] /* data_53e8 */
/*0x537e*/      .short 0x1d80 /* adds r0, r0, #6 */ 
/*0x5380*/      movs r1, #0
/*0x5382*/      add.w r2, r2, r4, lsl #1
/*0x5386*/      strb r1, [r0, #5]
/*0x5388*/      ldrb.w r2, [r2, #0x29]
/*0x538c*/      lsrs r2, r2, #5
/*0x538e*/      strb r2, [r5, #4]
/*0x5390*/      strh r1, [r0]
/*0x5392*/      strb r4, [r0, #4]
/*0x5394*/      b jump_53d0
            jump_5396:
/*0x5396*/      ldrb r0, [r6, #3]
/*0x5398*/      lsls r1, r0, #0x1e
/*0x539a*/      ldr r0, [pc, #0x48] /* data_53e4 */
/*0x539c*/      ldr r0, [r0]
/*0x539e*/      bpl jump_53b6
/*0x53a0*/      bl call_4666
/*0x53a4*/      ldrh r1, [r5]
/*0x53a6*/      cmp r0, r1
/*0x53a8*/      bne jump_5354
/*0x53aa*/      ldrb r0, [r5, #4]
/*0x53ac*/      cmp r0, #3
/*0x53ae*/      bne jump_5354
            jump_53b0:
/*0x53b0*/      bl call_5494
/*0x53b4*/      b jump_53d0
            jump_53b6:
/*0x53b6*/      bl call_4666
/*0x53ba*/      ldrh r1, [r5]
/*0x53bc*/      cmp r0, r1
/*0x53be*/      bne jump_53dc
/*0x53c0*/      ldrb r0, [r5, #4]
/*0x53c2*/      cmp r0, #2
/*0x53c4*/      beq jump_53b0
/*0x53c6*/      b jump_53d0
            jump_53c8:
/*0x53c8*/      bl call_6cc8
/*0x53cc*/      cmp r0, #0x18
/*0x53ce*/      bhs jump_53dc
            jump_53d0:
/*0x53d0*/      movs r0, #1
/*0x53d2*/      pop {r4, r5, r6, pc}
            jump_53d4:
/*0x53d4*/      pop.w {r4, r5, r6, lr}
/*0x53d8*/      b.w jump_6d4c
            jump_53dc:
/*0x53dc*/      movs r0, #0
/*0x53de*/      pop {r4, r5, r6, pc}

            data_53e0:
/*0x53e0*/  .word 0x20001542
            data_53e4:
/*0x53e4*/  .word 0x20000060
            data_53e8:
/*0x53e8*/  .word 0x20000478

            jump_53ec:
/*0x53ec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x53f0*/      ldr r4, [pc, #0x8c] /* data_5480 */
/*0x53f2*/      ldr r5, [pc, #0x90] /* data_5484 */
/*0x53f4*/      mov.w r8, #1
/*0x53f8*/      ldrb r0, [r4, #3]
/*0x53fa*/      cmp r0, #8
/*0x53fc*/      beq jump_546a
/*0x53fe*/      adds r3, r4, #6
/*0x5400*/      ldr r1, [pc, #0x84] /* data_5488 */
/*0x5402*/      ldrb r0, [r3, #4]
/*0x5404*/      add.w r2, r1, r0, lsl #1
/*0x5408*/      ldrb r0, [r4, #4]
/*0x540a*/      adds r2, #0x28
/*0x540c*/      cmp r0, #1
/*0x540e*/      beq jump_5462
/*0x5410*/      ldr r1, [r5]
/*0x5412*/      mvns r1, r1
/*0x5414*/      ubfx r1, r1, #1, #0x10
            jump_5418:
/*0x5418*/      ldrh r7, [r3]
/*0x541a*/      ldr r6, [pc, #0x70] /* data_548c */
/*0x541c*/      add.w r7, r6, r7, lsl #2
/*0x5420*/      strh r1, [r7, #-0x2]
/*0x5424*/      ldrh r1, [r4]
/*0x5426*/      mov.w r7, #0x1c00
/*0x542a*/      orr.w r0, r7, r0, lsl #13
/*0x542e*/      orrs r1, r0
/*0x5430*/      strh r1, [r2]
/*0x5432*/      ldrh r0, [r3]
/*0x5434*/      cmp.w r0, #0x400
/*0x5438*/      bhs jump_5442
/*0x543a*/      mov.w r1, #0xfc00
/*0x543e*/      strh.w r1, [r6, r0, lsl #2]
            jump_5442:
/*0x5442*/      ldrb r0, [r3, #4]
/*0x5444*/      movs r1, #1
/*0x5446*/      bl call_3b6c
/*0x544a*/      bl call_3c8c
/*0x544e*/      ldrb r0, [r4, #3]
/*0x5450*/      cmp r0, #7
/*0x5452*/      beq jump_5466
/*0x5454*/      movs r0, #0
/*0x5456*/      bl call_4318
/*0x545a*/      strb.w r8, [r4, #3]
            jump_545e:
/*0x545e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5462:
/*0x5462*/      movs r1, #0
/*0x5464*/      b jump_5418
            jump_5466:
/*0x5466*/      movs r0, #8
/*0x5468*/      strb r0, [r4, #3]
            jump_546a:
/*0x546a*/      movs r6, #0
/*0x546c*/      strb r6, [r4, #2]
/*0x546e*/      mov r0, r6
/*0x5470*/      bl call_4318
/*0x5474*/      str r6, [r5]
/*0x5476*/      ldr r1, [pc, #0x18] /* data_5490 */
/*0x5478*/      strb r6, [r4, #3]
/*0x547a*/      strb.w r8, [r1]
/*0x547e*/      b jump_545e

            data_5480:
/*0x5480*/  .word 0x20001542
            data_5484:
/*0x5484*/  .word 0x20000064
            data_5488:
/*0x5488*/  .word 0x20000478
            data_548c:
/*0x548c*/  .word 0x20000542
            data_5490:
/*0x5490*/  .word 0x20000054


            .thumb_func
            call_5494:
/*0x5494*/      ldr r1, [pc, #0x10] /* data_54a8 */
/*0x5496*/      ldrb r0, [r1, #2]
/*0x5498*/      cmp r0, #0
/*0x549a*/      beq jump_54a4
/*0x549c*/      cmp r0, #3
/*0x549e*/      beq jump_54a4
/*0x54a0*/      movs r0, #3
/*0x54a2*/      strb r0, [r1, #2]
            jump_54a4:
/*0x54a4*/      bx lr

/*0x54a6*/  .byte 0x00
/*0x54a7*/  .byte 0x00

            data_54a8:
/*0x54a8*/  .word 0x20001542


            .thumb_func
            call_54ac:
/*0x54ac*/      push {r4, lr}
/*0x54ae*/      bl call_6cc8
/*0x54b2*/      cmp r0, #0x18
/*0x54b4*/      bhs jump_54ca
/*0x54b6*/      ldr r2, [pc, #0x18] /* data_54d0 */
/*0x54b8*/      movw r1, #0xffff
/*0x54bc*/      add.w r0, r2, r0, lsl #1
/*0x54c0*/      strh r1, [r0, #0x28]
/*0x54c2*/      bl call_3c8c
/*0x54c6*/      movs r0, #1
/*0x54c8*/      pop {r4, pc}
            jump_54ca:
/*0x54ca*/      movs r0, #0
/*0x54cc*/      pop {r4, pc}

/*0x54ce*/  .byte 0x00
/*0x54cf*/  .byte 0x00

            data_54d0:
/*0x54d0*/  .word 0x20000478


            .thumb_func
            call_54d4:
/*0x54d4*/      push {r3, r4, r5, lr}
/*0x54d6*/      ldr r4, [pc, #0x30] /* data_5508 */
/*0x54d8*/      movs r5, #0x20
/*0x54da*/      b jump_54fe
            jump_54dc:
/*0x54dc*/      mov r1, sp
/*0x54de*/      mov r0, r5
/*0x54e0*/      bl call_550c
/*0x54e4*/      ldrb.w r0, [sp, #2]
/*0x54e8*/      strb r0, [r4]
/*0x54ea*/      sub.w r0, r4, #0x20
/*0x54ee*/      ldrb.w r1, [sp, #1]
/*0x54f2*/      strb r1, [r0]
/*0x54f4*/      subs r0, #0x20
/*0x54f6*/      ldrb.w r1, [sp]
/*0x54fa*/      strb r1, [r0]
/*0x54fc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_54fe:
/*0x54fe*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5500*/      uxtb r5, r5
/*0x5502*/      bhs jump_54dc
/*0x5504*/      pop {r3, r4, r5, pc}

/*0x5506*/  .byte 0x00
/*0x5507*/  .byte 0x00

            data_5508:
/*0x5508*/  .word 0x2000029f


            .thumb_func
            call_550c:
/*0x550c*/      ldr r2, [pc, #0x30] /* data_5540 */
/*0x550e*/      movs r3, #3
/*0x5510*/      ldrb r0, [r2, r0]
/*0x5512*/      and r2, r0, #7
/*0x5516*/      lsrs r0, r0, #3
/*0x5518*/      rsb r0, r0, r0, lsl #8
/*0x551c*/      udiv r0, r0, r3
/*0x5520*/      uxtb r0, r0
/*0x5522*/      strb r0, [r1]
/*0x5524*/      cmp r2, #5
/*0x5526*/      beq jump_553a
/*0x5528*/      rsb.w r2, r2, #5
/*0x552c*/      movs r3, #0x2b
/*0x552e*/      muls r2, r3, r2
/*0x5530*/      uxtb r3, r2
/*0x5532*/      mov r2, r1
/*0x5534*/      mov r1, r3
/*0x5536*/      b.w call_3cdc
            jump_553a:
/*0x553a*/      strb r0, [r1, #1]
/*0x553c*/      strb r0, [r1, #2]
/*0x553e*/      bx lr

            data_5540:
/*0x5540*/  .word data_79cb


            .thumb_func
            call_5544:
/*0x5544*/      ldr r1, [pc, #0x1c] /* data_5564 */
/*0x5546*/      strb r0, [r1]
/*0x5548*/      ldrb r0, [r1]
/*0x554a*/      and r0, r0, #1
/*0x554e*/      strb r0, [r1, #1]
/*0x5550*/      ldrb r2, [r1, #2]
/*0x5552*/      cmp r2, r0
/*0x5554*/      beq jump_555e
/*0x5556*/      strb r0, [r1, #2]
/*0x5558*/      ldr r1, [pc, #0xc] /* data_5568 */
/*0x555a*/      movs r0, #3
/*0x555c*/      strb r0, [r1, #4]
            jump_555e:
/*0x555e*/      b.w jump_4fe0

/*0x5562*/  .byte 0x00
/*0x5563*/  .byte 0x00

            data_5564:
/*0x5564*/  .word 0x20000008
            data_5568:
/*0x5568*/  .word 0x20000054


            .thumb_func
            call_556c:
/*0x556c*/      cmp r0, #6
/*0x556e*/      bhs jump_5574
/*0x5570*/      ldr r2, [pc, #0x1c] /* data_5590 */
/*0x5572*/      b jump_5576
            jump_5574:
/*0x5574*/      ldr r2, [pc, #0x1c] /* data_5594 */
            jump_5576:
/*0x5576*/      blo jump_557c
/*0x5578*/      sub.w r0, r0, #6
            jump_557c:
/*0x557c*/      add.w r0, r0, r0, lsl #2
/*0x5580*/      ldr r3, [r2]
/*0x5582*/      lsl.w r1, r1, r0
/*0x5586*/      orr.w r3, r3, r1
/*0x558a*/      str r3, [r2]
/*0x558c*/      bx lr

/*0x558e*/  .byte 0x00
/*0x558f*/  .byte 0x00

            data_5590:
/*0x5590*/  .word 0x40090128
            data_5594:
/*0x5594*/  .word 0x4009012c


            .thumb_func
            call_5598:
/*0x5598*/      ldr r2, [pc, #0x28] /* data_55c4 */
/*0x559a*/      add.w r0, r0, r0, lsl #1
/*0x559e*/      add.w r0, r2, r0, lsl #3
/*0x55a2*/      ldrd r2, r3, [r1, #0x10]
/*0x55a6*/      orrs r2, r3
/*0x55a8*/      ldr r3, [r1, #0x18]
/*0x55aa*/      orrs r2, r3
/*0x55ac*/      str r2, [r0]
/*0x55ae*/      ldr r2, [r1]
/*0x55b0*/      str r2, [r0, #4]
/*0x55b2*/      ldr r2, [r1, #4]
/*0x55b4*/      str r2, [r0, #8]
/*0x55b6*/      ldr r2, [r1, #0xc]
/*0x55b8*/      ldrh r1, [r1, #8]
/*0x55ba*/      orr.w r1, r2, r1, lsl #16
/*0x55be*/      str r1, [r0, #0x10]
/*0x55c0*/      bx lr

/*0x55c2*/  .byte 0x00
/*0x55c3*/  .byte 0x00

            data_55c4:
/*0x55c4*/  .word 0x40090000


            .thumb_func
            call_55c8:
/*0x55c8*/      ldr r2, [pc, #0x20] /* data_55ec */
/*0x55ca*/      add.w r0, r0, r0, lsl #1
/*0x55ce*/      add.w r0, r2, r0, lsl #3
/*0x55d2*/      and r2, r0, #0xf0000000
/*0x55d6*/      ubfx r0, r0, #0, #0x14
/*0x55da*/      add.w r0, r2, r0, lsl #5
/*0x55de*/      add.w r0, r0, #0x2000000
/*0x55e2*/      cbz r1, jump_55e6
/*0x55e4*/      movs r1, #1
            jump_55e6:
/*0x55e6*/      str r1, [r0]
/*0x55e8*/      bx lr

/*0x55ea*/  .byte 0x00
/*0x55eb*/  .byte 0x00

            data_55ec:
/*0x55ec*/  .word 0x40090000


            .thumb_func
            call_55f0:
/*0x55f0*/      cmp r0, #6
/*0x55f2*/      bhs jump_55f8
/*0x55f4*/      ldr r2, [pc, #0x24] /* data_561c */
/*0x55f6*/      b jump_55fa
            jump_55f8:
/*0x55f8*/      ldr r2, [pc, #0x24] /* data_5620 */
            jump_55fa:
/*0x55fa*/      blo jump_5600
/*0x55fc*/      sub.w r0, r0, #6
            jump_5600:
/*0x5600*/      add.w r0, r0, r0, lsl #2
/*0x5604*/      ldr r2, [r2]
/*0x5606*/      lsl.w r1, r1, r0
/*0x560a*/      tst r2, r1
/*0x560c*/      beq jump_5614
/*0x560e*/      mov.w r0, #1
/*0x5612*/      bx lr
            jump_5614:
/*0x5614*/      mov.w r0, #0
/*0x5618*/      bx lr

/*0x561a*/  .byte 0x00
/*0x561b*/  .byte 0x00

            data_561c:
/*0x561c*/  .word 0x40090120
            data_5620:
/*0x5620*/  .word 0x40090124


            .thumb_func
            call_5624:
/*0x5624*/      cmp r0, #6
/*0x5626*/      bhs jump_562c
/*0x5628*/      ldr r3, [pc, #0x20] /* data_564c */
/*0x562a*/      b jump_562e
            jump_562c:
/*0x562c*/      ldr r3, [pc, #0x20] /* data_5650 */
            jump_562e:
/*0x562e*/      blo jump_5634
/*0x5630*/      sub.w r0, r0, #6
            jump_5634:
/*0x5634*/      cmp r2, #0
/*0x5636*/      add.w r0, r0, r0, lsl #2
/*0x563a*/      ldr r2, [r3]
/*0x563c*/      lsl.w r1, r1, r0
/*0x5640*/      beq jump_5646
/*0x5642*/      orrs r2, r1
/*0x5644*/      b jump_5648
            jump_5646:
/*0x5646*/      bics r2, r1
            jump_5648:
/*0x5648*/      str r2, [r3]
/*0x564a*/      bx lr

            data_564c:
/*0x564c*/  .word 0x40090130
            data_5650:
/*0x5650*/  .word 0x40090134


            .thumb_func
            call_5654:
/*0x5654*/      mov.w r2, #0x200
/*0x5658*/      movs r1, #0
/*0x565a*/      lsls r0, r2, #9
/*0x565c*/      movs r3, #1
/*0x565e*/      b.w call_398c

/*0x5662*/  .byte 0x00
/*0x5663*/  .byte 0x00


            .thumb_func
            call_5664:
/*0x5664*/      push {r4, lr}
/*0x5666*/      movs r2, #0
/*0x5668*/      movs r1, #1
/*0x566a*/      ldr r0, [pc, #0x14] /* data_5680 */
/*0x566c*/      bl call_4244
/*0x5670*/      movs r2, #0
/*0x5672*/      pop.w {r4, lr}
/*0x5676*/      mov r1, r2
/*0x5678*/      movs r0, #2
/*0x567a*/      b.w call_37e4

/*0x567e*/  .byte 0x00
/*0x567f*/  .byte 0x00

            data_5680:
/*0x5680*/  .word 0x400b4000


            .thumb_func
            call_5684:
/*0x5684*/      push {r4, lr}
/*0x5686*/      movs r2, #2
/*0x5688*/      movs r1, #1
/*0x568a*/      ldr r0, [pc, #0x14] /* data_56a0 */
/*0x568c*/      bl call_4244
/*0x5690*/      movs r2, #4
/*0x5692*/      movs r1, #0
/*0x5694*/      pop.w {r4, lr}
/*0x5698*/      movs r0, #2
/*0x569a*/      b.w call_37e4

/*0x569e*/  .byte 0x00
/*0x569f*/  .byte 0x00

            data_56a0:
/*0x56a0*/  .word 0x400b4000


            .thumb_func
            call_56a4:
/*0x56a4*/      push {r4, r5, r6, lr}
/*0x56a6*/      ldr r1, [pc, #0x34] /* data_56dc */
/*0x56a8*/      ldr r4, [r1]
/*0x56aa*/      ldr r5, [pc, #0x30] /* data_56dc */
/*0x56ac*/      adds r5, #0x48
/*0x56ae*/      ldr r3, [r5]
/*0x56b0*/      movs r2, #1
/*0x56b2*/      str r2, [r1]
/*0x56b4*/      movs r2, #0
/*0x56b6*/      str r2, [r5]
/*0x56b8*/      ldr r6, [pc, #0x24] /* data_56e0 */
/*0x56ba*/      str.w r2, [r6, #0x9c]
/*0x56be*/      str.w r2, [r6, #0x8c]
/*0x56c2*/      str r4, [r1]
/*0x56c4*/      ldr r1, [pc, #0x1c] /* data_56e4 */
/*0x56c6*/      ldr r2, [r1]
/*0x56c8*/      orr r2, r2, #4
/*0x56cc*/      str r2, [r1]
/*0x56ce*/      cbz r0, jump_56d6
/*0x56d0*/      wfi 
            jump_56d2:
/*0x56d2*/      str r3, [r5]
/*0x56d4*/      pop {r4, r5, r6, pc}
            jump_56d6:
/*0x56d6*/      wfe 
/*0x56d8*/      b jump_56d2

/*0x56da*/  .byte 0x00
/*0x56db*/  .byte 0x00

            data_56dc:
/*0x56dc*/  .word 0x43100618
            data_56e0:
/*0x56e0*/  .word 0x42d42000
            data_56e4:
/*0x56e4*/  .word 0xe000ed10

            jump_56e8:
/*0x56e8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x56ec*/      ldr r4, [pc, #0x38] /* data_5728 */
/*0x56ee*/      ldr r7, [r4]
/*0x56f0*/      ldr r5, [pc, #0x34] /* data_5728 */
/*0x56f2*/      adds r5, #0x48
/*0x56f4*/      ldr r6, [r5]
/*0x56f6*/      mov.w sb, #1
/*0x56fa*/      str.w sb, [r4]
/*0x56fe*/      mov.w r8, #0
/*0x5702*/      str.w r8, [r5]
/*0x5706*/      bl call_5918
/*0x570a*/      ldr r0, [pc, #0x20] /* data_572c */
/*0x570c*/      str.w r8, [r0, #0x9c]
/*0x5710*/      str.w sb, [r0, #0x8c]
/*0x5714*/      str r7, [r4]
/*0x5716*/      ldr r0, [pc, #0x18] /* data_5730 */
/*0x5718*/      ldr r1, [r0]
/*0x571a*/      orr r1, r1, #4
/*0x571e*/      str r1, [r0]
/*0x5720*/      wfe 
/*0x5722*/      str r6, [r5]
/*0x5724*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5728:
/*0x5728*/  .word 0x43100618
            data_572c:
/*0x572c*/  .word 0x42d42000
            data_5730:
/*0x5730*/  .word 0xe000ed10


            .thumb_func
            call_5734:
/*0x5734*/      ldr r1, [pc, #0x10] /* data_5748 */
/*0x5736*/      ldr r2, [r1]
/*0x5738*/      bic r2, r2, #4
/*0x573c*/      str r2, [r1]
/*0x573e*/      cbz r0, jump_5744
/*0x5740*/      wfi 
/*0x5742*/      bx lr
            jump_5744:
/*0x5744*/      wfe 
/*0x5746*/      bx lr

            data_5748:
/*0x5748*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x574c*/      push {r4, r5, r6, lr}
/*0x574e*/      ldr r6, [pc, #0xd4] /* data_5824 */
/*0x5750*/      ldrb r0, [r6]
/*0x5752*/      cmp r0, #1
/*0x5754*/      bne jump_5810
/*0x5756*/      ldr r5, [pc, #0xd0] /* data_5828 */
/*0x5758*/      movs r4, #0
/*0x575a*/      mov r0, r5
/*0x575c*/      ldrb r2, [r5]
/*0x575e*/      ldrb r0, [r0, #1]
/*0x5760*/      mov r1, r4
/*0x5762*/      cmp r2, #0x10
/*0x5764*/      beq jump_5770
/*0x5766*/      cmp r2, #0x11
/*0x5768*/      beq jump_577a
/*0x576a*/      cmp r2, #0x12
/*0x576c*/      bne jump_5812
/*0x576e*/      b jump_5780
            jump_5770:
/*0x5770*/      cmp r0, #2
/*0x5772*/      bne jump_5812
/*0x5774*/      str r1, [r5, #4]
/*0x5776*/      movs r1, #4
/*0x5778*/      b jump_57f4
            jump_577a:
/*0x577a*/      bl reset_builtin
/*0x577e*/      b jump_57fc
            jump_5780:
/*0x5780*/      mov.w r3, #0x400
/*0x5784*/      cmp r0, #0x20
/*0x5786*/      blo jump_57a6
/*0x5788*/      sub.w r2, r0, #0x1f
/*0x578c*/      rsb r2, r2, r2, lsl #4
/*0x5790*/      cmp.w r3, r2, lsl #2
/*0x5794*/      blt jump_57a6
/*0x5796*/      rsb r0, r0, r0, lsl #4
/*0x579a*/      mov.w r1, #0x2880
/*0x579e*/      add.w r0, r1, r0, lsl #2
/*0x57a2*/      movs r1, #0x3c
/*0x57a4*/      b jump_57f6
            jump_57a6:
/*0x57a6*/      cbz r0, jump_57b2
/*0x57a8*/      cmp r0, #1
/*0x57aa*/      beq jump_57e8
/*0x57ac*/      cmp r0, #2
/*0x57ae*/      bne jump_5812
/*0x57b0*/      b jump_57f0
            jump_57b2:
/*0x57b2*/      ldrb.w r0, [r1, #0x10f]
/*0x57b6*/      cmp r0, #0xaa
/*0x57b8*/      beq jump_57de
/*0x57ba*/      ldrb r2, [r3]
/*0x57bc*/      mov r0, r3
/*0x57be*/      cmp r2, #4
/*0x57c0*/      beq jump_57e4
/*0x57c2*/      movs r2, #0x20
/*0x57c4*/      mov r1, r3
/*0x57c6*/      adds r0, r5, #4
/*0x57c8*/      bl memcpy /* (dest, src, size) */
/*0x57cc*/      ldr r0, [pc, #0x5c] /* data_582c */
/*0x57ce*/      ldr.w r1, [r0, #0x180]
/*0x57d2*/      str r1, [r5, #0x24]
/*0x57d4*/      ldr.w r0, [r0, #0x18c]
/*0x57d8*/      movs r1, #0x28
/*0x57da*/      str r0, [r5, #0x28]
/*0x57dc*/      b jump_57f4
            jump_57de:
/*0x57de*/      movs r1, #0x10
/*0x57e0*/      lsls r0, r1, #4
/*0x57e2*/      b jump_57f6
            jump_57e4:
/*0x57e4*/      movs r1, #0x34
/*0x57e6*/      b jump_57f6
            jump_57e8:
/*0x57e8*/      movs r1, #4
/*0x57ea*/      mov.w r0, #0x3c00
/*0x57ee*/      b jump_57f6
            jump_57f0:
/*0x57f0*/      movs r1, #1
/*0x57f2*/      strb r1, [r5, #4]
            jump_57f4:
/*0x57f4*/      adds r0, r5, #4
            jump_57f6:
/*0x57f6*/      bl call_58b4
/*0x57fa*/      movs r4, #1
            jump_57fc:
/*0x57fc*/      ldrb r0, [r6]
/*0x57fe*/      cmp r0, #1
/*0x5800*/      bne jump_5810
/*0x5802*/      cbz r4, jump_5812
/*0x5804*/      movs r1, #0x3c
/*0x5806*/      adds r0, r5, #4
            jump_5808:
/*0x5808*/      bl mem_zero /* (dest, size) */
/*0x580c*/      movs r0, #2
/*0x580e*/      strb r0, [r6]
            jump_5810:
/*0x5810*/      pop {r4, r5, r6, pc}
            jump_5812:
/*0x5812*/      ldr r0, [r5]
/*0x5814*/      str r0, [r5, #4]
/*0x5816*/      movw r0, #0xaaff
/*0x581a*/      str r0, [r5]
/*0x581c*/      ldr r0, [pc, #8] /* data_5828 */
/*0x581e*/      movs r1, #0x38
/*0x5820*/      adds r0, #8
/*0x5822*/      b jump_5808

            data_5824:
/*0x5824*/  .word 0x2000004c
            data_5828:
/*0x5828*/  .word 0x20000414
            data_582c:
/*0x582c*/  .word 0x40080000


            .thumb_func
            reset_builtin:
/*0x5830*/      push {r4, lr}
/*0x5832*/      ldr r1, [pc, #0x6c] /* data_58a0 */
/*0x5834*/      cbz r0, jump_5852
/*0x5836*/      cmp r0, #1
/*0x5838*/      beq jump_5856
/*0x583a*/      cmp r0, #2
/*0x583c*/      bne jump_589e
/*0x583e*/      movs r0, #0x35
/*0x5840*/      bl call_5170
/*0x5844*/      movs r0, #0
/*0x5846*/      bl call_6678
/*0x584a*/      pop.w {r4, lr}
/*0x584e*/      b.w jump_56e8
            jump_5852:
/*0x5852*/      ldr r0, [pc, #0x50] /* data_58a4 */
/*0x5854*/      b jump_585a
            jump_5856:
/*0x5856*/      ldr r0, [pc, #0x4c] /* data_58a4 */
/*0x5858*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_585a:
/*0x585a*/      str r0, [r1]
/*0x585c*/      movs r1, #0
/*0x585e*/      mov.w r0, #0x10000
/*0x5862*/      movs r3, #1
/*0x5864*/      mov r2, r1
/*0x5866*/      bl call_398c
/*0x586a*/      ldr r1, [pc, #0x3c] /* data_58a8 */
/*0x586c*/      mov.w r0, #0x200
/*0x5870*/      str r0, [r1, #0x24]
/*0x5872*/      movs r0, #0x35
/*0x5874*/      bl call_5170
/*0x5878*/      movs r0, #0
/*0x587a*/      bl call_6678
/*0x587e*/      movw r0, #0x4e20
/*0x5882*/      bl spin_wait /* (time) */
/*0x5886*/      dsb sy
/*0x588a*/      ldr r0, [pc, #0x20] /* data_58ac */
/*0x588c*/      ldr r1, [r0]
/*0x588e*/      ldr r2, [pc, #0x20] /* data_58b0 */
/*0x5890*/      and r1, r1, #0x700
/*0x5894*/      orrs r1, r2
/*0x5896*/      str r1, [r0]
/*0x5898*/      dsb sy
            jump_589c:
/*0x589c*/      b jump_589c
            jump_589e:
/*0x589e*/      pop {r4, pc}

            data_58a0:
/*0x58a0*/  .word 0x20003ffc
            data_58a4:
/*0x58a4*/  .word 0x55aafaf5
            data_58a8:
/*0x58a8*/  .word 0x400b0000
            data_58ac:
/*0x58ac*/  .word 0xe000ed0c
            data_58b0:
/*0x58b0*/  .word 0x05fa0004


            .thumb_func
            call_58b4:
/*0x58b4*/      push {r4, r5, r6, lr}
/*0x58b6*/      mov r4, r1
/*0x58b8*/      ldr r2, [pc, #0x24] /* data_58e0 */
/*0x58ba*/      mov r1, r0
/*0x58bc*/      movs r0, #2
/*0x58be*/      strb r0, [r2]
/*0x58c0*/      ldr r0, [pc, #0x20] /* data_58e4 */
/*0x58c2*/      subs r5, r0, #4
/*0x58c4*/      cmp r1, r0
/*0x58c6*/      beq jump_58d0
/*0x58c8*/      mov r2, r4
/*0x58ca*/      adds r0, r5, #4
/*0x58cc*/      bl memcpy /* (dest, src, size) */
            jump_58d0:
/*0x58d0*/      adds r0, r5, r4
/*0x58d2*/      rsb.w r1, r4, #0x3c
/*0x58d6*/      pop.w {r4, r5, r6, lr}
/*0x58da*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x58dc*/      b.w mem_zero /* (dest, size) */

            data_58e0:
/*0x58e0*/  .word 0x2000004c
            data_58e4:
/*0x58e4*/  .word 0x20000418

            jump_58e8:
/*0x58e8*/      push {r4, r5, r6, r7, lr}
/*0x58ea*/      ldr r7, [pc, #0x28] /* data_5914 */
/*0x58ec*/      ldr.w r4, [r7, #0x104]
/*0x58f0*/      ldr.w r5, [r7, #0x108]
/*0x58f4*/      ldr.w r6, [r7, #0x10c]
/*0x58f8*/      bics r4, r0
/*0x58fa*/      bics r5, r1
/*0x58fc*/      bics r6, r2
/*0x58fe*/      cbz r3, jump_5906
/*0x5900*/      orrs r4, r0
/*0x5902*/      orrs r5, r1
/*0x5904*/      orrs r6, r2
            jump_5906:
/*0x5906*/      str.w r4, [r7, #0x104]
/*0x590a*/      str.w r5, [r7, #0x108]
/*0x590e*/      str.w r6, [r7, #0x10c]
/*0x5912*/      pop {r4, r5, r6, r7, pc}

            data_5914:
/*0x5914*/  .word 0x40088000


            .thumb_func
            call_5918:
/*0x5918*/      ldr r2, [pc, #0x1c] /* data_5938 */
/*0x591a*/      movs r1, #0
/*0x591c*/      mov.w r0, #0x1c20
/*0x5920*/      str.w r1, [r2, #0x108]
            jump_5924:
/*0x5924*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5926*/      bhs jump_5924
/*0x5928*/      movs r0, #1
/*0x592a*/      str.w r0, [r2, #0x108]
/*0x592e*/      ldr r0, [pc, #0xc] /* data_593c */
            jump_5930:
/*0x5930*/      ldr r1, [r0, #8]
/*0x5932*/      lsls r1, r1, #0x1a
/*0x5934*/      bpl jump_5930
/*0x5936*/      bx lr

            data_5938:
/*0x5938*/  .word 0x42d40000
            data_593c:
/*0x593c*/  .word 0x40088000


            .thumb_func
            call_5940:
/*0x5940*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5944*/      movs r7, #4
/*0x5946*/      ldr r5, [pc, #0x6c] /* data_59b4 */
/*0x5948*/      b jump_59a8
            jump_594a:
/*0x594a*/      ldr r1, [pc, #0x6c] /* data_59b8 */
/*0x594c*/      add.w r0, r7, r7, lsl #1
/*0x5950*/      add r0, r1
/*0x5952*/      ldrb r1, [r5, #-0x1]!
/*0x5956*/      ldrb r0, [r0, #2]
/*0x5958*/      eors r0, r1
/*0x595a*/      movs.w r8, r0
/*0x595e*/      beq jump_59a8
/*0x5960*/      movs r4, #0x80
/*0x5962*/      movs r6, #8
/*0x5964*/      b jump_59a2
            jump_5966:
/*0x5966*/      tst.w r8, r4
/*0x596a*/      beq jump_59a0
/*0x596c*/      ldrb r0, [r5]
/*0x596e*/      eors r0, r4
/*0x5970*/      strb r0, [r5]
/*0x5972*/      tst r0, r4
/*0x5974*/      bne jump_597a
/*0x5976*/      movs r0, #1
/*0x5978*/      b jump_597c
            jump_597a:
/*0x597a*/      movs r0, #0
            jump_597c:
/*0x597c*/      mov sb, r0
/*0x597e*/      add.w r0, r6, r7, lsl #3
/*0x5982*/      uxtb r0, r0
/*0x5984*/      mov r1, sb
/*0x5986*/      bl call_4504
/*0x598a*/      cbnz r0, jump_5992
/*0x598c*/      ldrb r0, [r5]
/*0x598e*/      eors r0, r4
/*0x5990*/      strb r0, [r5]
            jump_5992:
/*0x5992*/      movs.w r0, sb
/*0x5996*/      beq jump_599a
/*0x5998*/      movs r0, #1
            jump_599a:
/*0x599a*/      ldr r1, [pc, #0x18] /* data_59b4 */
/*0x599c*/      subs r1, #8
/*0x599e*/      strh r0, [r1, #2]
            jump_59a0:
/*0x59a0*/      lsrs r4, r4, #1
            jump_59a2:
/*0x59a2*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x59a4*/      uxtb r6, r6
/*0x59a6*/      bhs jump_5966
            jump_59a8:
/*0x59a8*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x59aa*/      uxtb r7, r7
/*0x59ac*/      bhs jump_594a
/*0x59ae*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

/*0x59b2*/  .byte 0x00
/*0x59b3*/  .byte 0x00

            data_59b4:
/*0x59b4*/  .word 0x2000001e
            data_59b8:
/*0x59b8*/  .word 0x20000234


            .thumb_func
            call_59bc:
/*0x59bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x59c0*/      mov r6, r0
/*0x59c2*/      movs r4, #2
/*0x59c4*/      ldr r5, [pc, #0x50] /* data_5a18 */
/*0x59c6*/      mov.w r7, #0x1f4
            jump_59ca:
/*0x59ca*/      bl call_6f28
/*0x59ce*/      movs r0, #4
/*0x59d0*/      b jump_59da
            jump_59d2:
/*0x59d2*/      add.w r1, r0, r0, lsl #1
/*0x59d6*/      ldrb r1, [r5, r1]
/*0x59d8*/      cbnz r1, jump_59e0
            jump_59da:
/*0x59da*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x59dc*/      uxtb r0, r0
/*0x59de*/      bhs jump_59d2
            jump_59e0:
/*0x59e0*/      cmp r0, #0xff
/*0x59e2*/      beq jump_59f4
/*0x59e4*/      cmp r4, #0
/*0x59e6*/      bne jump_59ca
            jump_59e8:
/*0x59e8*/      cmp r6, #0
/*0x59ea*/      beq jump_5a12
/*0x59ec*/      ldr r2, [pc, #0x2c] /* data_5a1c */
/*0x59ee*/      ldr r1, [pc, #0x28] /* data_5a18 */
/*0x59f0*/      movs r0, #4
/*0x59f2*/      b jump_5a0c
            jump_59f4:
/*0x59f4*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x59f6*/      ands r4, r4, #0xff
/*0x59fa*/      beq jump_59e8
/*0x59fc*/      mov r0, r7
/*0x59fe*/      bl spin_wait /* (time) */
/*0x5a02*/      b jump_59ca
            jump_5a04:
/*0x5a04*/      ldrb r3, [r1, #2]
/*0x5a06*/      strb r3, [r2], #1
/*0x5a0a*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_5a0c:
/*0x5a0c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5a0e*/      uxtb r0, r0
/*0x5a10*/      bhs jump_5a04
            jump_5a12:
/*0x5a12*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x5a16*/  .byte 0x00
/*0x5a17*/  .byte 0x00

            data_5a18:
/*0x5a18*/  .word 0x20000234
            data_5a1c:
/*0x5a1c*/  .word 0x2000001a


            .thumb_func
            call_5a20:
/*0x5a20*/      ldr r1, [pc, #8] /* data_5a2c */
/*0x5a22*/      add.w r0, r0, r0, lsl #1
/*0x5a26*/      add r0, r1
/*0x5a28*/      ldrb r0, [r0, #2]
/*0x5a2a*/      bx lr

            data_5a2c:
/*0x5a2c*/  .word 0x20000234


            .thumb_func
            call_5a30:
/*0x5a30*/      ldr r1, [pc, #0x10] /* data_5a44 */
/*0x5a32*/      ldrb r0, [r1]
/*0x5a34*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5a36*/      strb r0, [r1]
/*0x5a38*/      lsls r0, r0, #0x1e
/*0x5a3a*/      bne jump_5a40
/*0x5a3c*/      b.w call_6f28
            jump_5a40:
/*0x5a40*/      bx lr

/*0x5a42*/  .byte 0x00
/*0x5a43*/  .byte 0x00

            data_5a44:
/*0x5a44*/  .word 0x20000016


            .thumb_func
            call_5a48:
/*0x5a48*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5a4c*/      movs r6, #0
/*0x5a4e*/      mov r1, r6
/*0x5a50*/      mov.w r0, #0xd0000
/*0x5a54*/      movs r3, #1
/*0x5a56*/      mov r2, r6
/*0x5a58*/      bl call_398c
/*0x5a5c*/      movs r4, #8
/*0x5a5e*/      b jump_5a90
            jump_5a60:
/*0x5a60*/      ldr r0, [pc, #0x94] /* data_5af8 */
/*0x5a62*/      movs r2, #0
/*0x5a64*/      add.w r1, r0, r4, lsl #3
/*0x5a68*/      ldrh r5, [r1, #4]
/*0x5a6a*/      ldr r0, [r1]
/*0x5a6c*/      uxth r1, r5
/*0x5a6e*/      mov r7, r0
/*0x5a70*/      bl call_4244
/*0x5a74*/      uxth r1, r5
/*0x5a76*/      mov r0, r7
/*0x5a78*/      movs r2, #1
/*0x5a7a*/      bl call_4224
/*0x5a7e*/      ldr r0, [pc, #0x78] /* data_5af8 */
/*0x5a80*/      adds r0, #0x40
/*0x5a82*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x5a86*/      add.w r0, r0, r4, lsl #1
/*0x5a8a*/      ldrb r0, [r0, #1]
/*0x5a8c*/      bl call_3640
            jump_5a90:
/*0x5a90*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5a92*/      uxtb r4, r4
/*0x5a94*/      bhs jump_5a60
/*0x5a96*/      movs r4, #4
/*0x5a98*/      b jump_5ac2
            jump_5a9a:
/*0x5a9a*/      ldr r0, [pc, #0x5c] /* data_5af8 */
/*0x5a9c*/      adds r0, #0x50
/*0x5a9e*/      add.w r1, r0, r4, lsl #3
/*0x5aa2*/      ldrh r5, [r1, #4]
/*0x5aa4*/      ldr r7, [r1]
/*0x5aa6*/      uxth r1, r5
/*0x5aa8*/      mov r0, r7
/*0x5aaa*/      bl call_3bf4
/*0x5aae*/      uxth r1, r5
/*0x5ab0*/      mov r0, r7
/*0x5ab2*/      movs r2, #0
/*0x5ab4*/      bl call_4234
/*0x5ab8*/      uxth r1, r5
/*0x5aba*/      mov r0, r7
/*0x5abc*/      movs r2, #1
/*0x5abe*/      bl call_4204
            jump_5ac2:
/*0x5ac2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5ac4*/      uxtb r4, r4
/*0x5ac6*/      bhs jump_5a9a
/*0x5ac8*/      movs r2, #0xff
/*0x5aca*/      movs r1, #4
/*0x5acc*/      ldr r0, [pc, #0x2c] /* data_5afc */
/*0x5ace*/      bl mem_set /* (dest, size, val) */
/*0x5ad2*/      movs r0, #0
/*0x5ad4*/      bl call_5b34
/*0x5ad8*/      movs r1, #4
/*0x5ada*/      ldr r0, [pc, #0x24] /* data_5b00 */
/*0x5adc*/      movs r2, #0xff
/*0x5ade*/      b jump_5aec
            jump_5ae0:
/*0x5ae0*/      strb r6, [r0], #1
/*0x5ae4*/      strb r2, [r0], #1
/*0x5ae8*/      strb r2, [r0], #1
            jump_5aec:
/*0x5aec*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x5aee*/      uxtb r1, r1
/*0x5af0*/      bhs jump_5ae0
/*0x5af2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x5af6*/  .byte 0x00
/*0x5af7*/  .byte 0x00

            data_5af8:
/*0x5af8*/  .word gpio_map_1
            data_5afc:
/*0x5afc*/  .word 0x2000001a
            data_5b00:
/*0x5b00*/  .word 0x20000234


            .thumb_func
            call_5b04:
/*0x5b04*/      push {r4, lr}
/*0x5b06*/      ldr r1, [pc, #0x24] /* data_5b2c */
/*0x5b08*/      ldr r0, [pc, #0x24] /* data_5b30 */
/*0x5b0a*/      movs r2, #4
/*0x5b0c*/      b jump_5b22
            jump_5b0e:
/*0x5b0e*/      ldrb r3, [r0]
/*0x5b10*/      cbnz r3, jump_5b1a
/*0x5b12*/      ldrb r3, [r0, #2]
/*0x5b14*/      ldrb r4, [r1]
/*0x5b16*/      cmp r3, r4
/*0x5b18*/      beq jump_5b1e
            jump_5b1a:
/*0x5b1a*/      movs r0, #0
/*0x5b1c*/      pop {r4, pc}
            jump_5b1e:
/*0x5b1e*/      .short 0x1cc0 /* adds r0, r0, #3 */ 
/*0x5b20*/      .short 0x1c49 /* adds r1, r1, #1 */ 
            jump_5b22:
/*0x5b22*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x5b24*/      uxtb r2, r2
/*0x5b26*/      bhs jump_5b0e
/*0x5b28*/      movs r0, #1
/*0x5b2a*/      pop {r4, pc}

            data_5b2c:
/*0x5b2c*/  .word 0x2000001a
            data_5b30:
/*0x5b30*/  .word 0x20000234


            .thumb_func
            call_5b34:
/*0x5b34*/      push {r4, lr}
/*0x5b36*/      mov r4, r0
/*0x5b38*/      movs r2, #0x20
/*0x5b3a*/      ldr r1, [pc, #0x1c] /* data_5b58 */
/*0x5b3c*/      ldr r0, [pc, #0x1c] /* data_5b5c */
/*0x5b3e*/      bl memcpy /* (dest, src, size) */
/*0x5b42*/      cbz r4, jump_5b48
/*0x5b44*/      bl call_5ba0
            jump_5b48:
/*0x5b48*/      bl call_5ba0
/*0x5b4c*/      bl call_4bfc
/*0x5b50*/      pop.w {r4, lr}
/*0x5b54*/      b.w call_5ba0

            data_5b58:
/*0x5b58*/  .word data_79f8
            data_5b5c:
/*0x5b5c*/  .word 0x20000214


            .thumb_func
            call_5b60:
/*0x5b60*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5b64*/      movs r4, #4
/*0x5b66*/      cbz r0, jump_5b6e
/*0x5b68*/      movs r7, #0
            jump_5b6a:
/*0x5b6a*/      ldr r5, [pc, #0x30] /* data_5b9c */
/*0x5b6c*/      b jump_5b92
            jump_5b6e:
/*0x5b6e*/      movs r7, #1
/*0x5b70*/      b jump_5b6a
            jump_5b72:
/*0x5b72*/      add.w r6, r5, r4, lsl #3
/*0x5b76*/      mov r2, r7
/*0x5b78*/      ldrh r0, [r6, #4]
/*0x5b7a*/      uxth r1, r0
/*0x5b7c*/      ldr.w r0, [r5, r4, lsl #3]
/*0x5b80*/      bl call_4276
/*0x5b84*/      ldrh r0, [r6, #4]
/*0x5b86*/      movs r2, #1
/*0x5b88*/      uxth r1, r0
/*0x5b8a*/      ldr.w r0, [r5, r4, lsl #3]
/*0x5b8e*/      bl call_4204
            jump_5b92:
/*0x5b92*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5b94*/      uxtb r4, r4
/*0x5b96*/      bhs jump_5b72
/*0x5b98*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5b9c:
/*0x5b9c*/  .word gpio_map_2


            .thumb_func
            call_5ba0:
/*0x5ba0*/      push {r4, lr}
/*0x5ba2*/      ldr r4, [pc, #0x24] /* data_5bc8 */
/*0x5ba4*/      movs r2, #0xff
/*0x5ba6*/      adds r1, r2, #1
/*0x5ba8*/      subw r0, r4, #0x11f
/*0x5bac*/      bl mem_set /* (dest, size, val) */
/*0x5bb0*/      movs r0, #0x20
/*0x5bb2*/      subw r1, r4, #0x11f
/*0x5bb6*/      b jump_5bbe
            jump_5bb8:
/*0x5bb8*/      ldrb r2, [r4], #-1
/*0x5bbc*/      strb r0, [r1, r2]
            jump_5bbe:
/*0x5bbe*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5bc0*/      uxtb r0, r0
/*0x5bc2*/      bhs jump_5bb8
/*0x5bc4*/      pop {r4, pc}

/*0x5bc6*/  .byte 0x00
/*0x5bc7*/  .byte 0x00

            data_5bc8:
/*0x5bc8*/  .word 0x20000233

            jump_5bcc:
/*0x5bcc*/      push {r4, r5, lr}
/*0x5bce*/      ldr r3, [pc, #0x18] /* data_5be8 */
/*0x5bd0*/      sub.w r4, r3, #0x100
/*0x5bd4*/      b jump_5be0
            jump_5bd6:
/*0x5bd6*/      ldrb r2, [r1, #1]
/*0x5bd8*/      ldrb r5, [r1], #2
/*0x5bdc*/      ldrb r5, [r4, r5]
/*0x5bde*/      strb r2, [r3, r5]
            jump_5be0:
/*0x5be0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5be2*/      uxtb r0, r0
/*0x5be4*/      bhs jump_5bd6
/*0x5be6*/      pop {r4, r5, pc}

            data_5be8:
/*0x5be8*/  .word 0x20000214


            .thumb_func
            call_5bec:
/*0x5bec*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x5bf0*/      ldr.w sb, [pc, #0x74] /* data_5c68 */
/*0x5bf4*/      ldr.w ip, [pc, #0x74] /* data_5c6c */
/*0x5bf8*/      movs r5, #0
/*0x5bfa*/      sub.w r8, sb, #0x60
            jump_5bfe:
/*0x5bfe*/      movs r1, #0x10
/*0x5c00*/      add.w r0, sb, r5, lsl #5
/*0x5c04*/      movs r4, #0
            jump_5c06:
/*0x5c06*/      ldr r7, [pc, #0x64] /* data_5c6c */
/*0x5c08*/      ldrb.w r2, [ip, r4]
/*0x5c0c*/      add.w r2, r8, r2, lsl #5
/*0x5c10*/      adds r3, r2, r5
/*0x5c12*/      movs r2, #4
/*0x5c14*/      adds r7, #0x44
/*0x5c16*/      b jump_5c2c
            jump_5c18:
/*0x5c18*/      ldrb r6, [r3], #8
/*0x5c1c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x5c1e*/      ands r1, r1, #0xff
/*0x5c22*/      ldrh.w r6, [r7, r6, lsl #1]
/*0x5c26*/      strh r6, [r0]
/*0x5c28*/      beq jump_5c36
/*0x5c2a*/      .short 0x1c80 /* adds r0, r0, #2 */ 
            jump_5c2c:
/*0x5c2c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x5c2e*/      uxtb r2, r2
/*0x5c30*/      bhs jump_5c18
/*0x5c32*/      movs r2, #1
/*0x5c34*/      b jump_5c46
            jump_5c36:
/*0x5c36*/      movs r1, #0x10
/*0x5c38*/      subs r0, #0x1c
/*0x5c3a*/      b jump_5c2c
            jump_5c3c:
/*0x5c3c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x5c3e*/      ands r1, r1, #0xff
/*0x5c42*/      beq jump_5c60
/*0x5c44*/      .short 0x1c80 /* adds r0, r0, #2 */ 
            jump_5c46:
/*0x5c46*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x5c48*/      uxtb r2, r2
/*0x5c4a*/      bhs jump_5c3c
/*0x5c4c*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x5c4e*/      uxtb r4, r4
/*0x5c50*/      cmp r4, #3
/*0x5c52*/      blo jump_5c06
/*0x5c54*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x5c56*/      uxtb r5, r5
/*0x5c58*/      cmp r5, #8
/*0x5c5a*/      blo jump_5bfe
/*0x5c5c*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_5c60:
/*0x5c60*/      movs r1, #0x10
/*0x5c62*/      subs r0, #0x1c
/*0x5c64*/      b jump_5c46

/*0x5c66*/  .byte 0x00
/*0x5c67*/  .byte 0x00

            data_5c68:
/*0x5c68*/  .word 0x200002a0
            data_5c6c:
/*0x5c6c*/  .word data_7a88


            .thumb_func
            call_5c70:
/*0x5c70*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5c74*/      movs r1, #0
/*0x5c76*/      mov.w r2, #0x20000
/*0x5c7a*/      mov.w r0, #0x70000
/*0x5c7e*/      movs r3, #1
/*0x5c80*/      bl call_398c
/*0x5c84*/      movw r1, #0xea60
/*0x5c88*/      ldr r0, [pc, #0x90] /* data_5d1c */
/*0x5c8a*/      bl call_37da
/*0x5c8e*/      ldr r4, [pc, #0x90] /* data_5d20 */
/*0x5c90*/      movs r1, #2
/*0x5c92*/      mov r0, r4
/*0x5c94*/      bl call_3bf4
/*0x5c98*/      movs r2, #0
/*0x5c9a*/      movs r1, #2
/*0x5c9c*/      mov r0, r4
/*0x5c9e*/      bl call_4234
/*0x5ca2*/      movs r2, #1
/*0x5ca4*/      movs r1, #2
/*0x5ca6*/      mov r0, r4
/*0x5ca8*/      bl call_4204
/*0x5cac*/      movs r1, #4
/*0x5cae*/      mov r0, r4
/*0x5cb0*/      bl call_3bf4
/*0x5cb4*/      ldr r6, [pc, #0x6c] /* data_5d24 */
/*0x5cb6*/      mov.w r5, #0x4000
/*0x5cba*/      mov r1, r5
/*0x5cbc*/      mov r0, r6
/*0x5cbe*/      bl call_3bf4
/*0x5cc2*/      lsls r7, r5, #1
/*0x5cc4*/      mov r1, r7
/*0x5cc6*/      mov r0, r6
/*0x5cc8*/      bl call_3bf4
/*0x5ccc*/      movs r2, #0
/*0x5cce*/      movs r1, #4
/*0x5cd0*/      mov r0, r4
/*0x5cd2*/      bl call_4234
/*0x5cd6*/      movs r2, #0
/*0x5cd8*/      mov r1, r5
/*0x5cda*/      mov r0, r6
/*0x5cdc*/      bl call_4234
/*0x5ce0*/      movs r2, #0
/*0x5ce2*/      mov r1, r7
/*0x5ce4*/      mov r0, r6
/*0x5ce6*/      bl call_4234
/*0x5cea*/      movs r2, #1
/*0x5cec*/      movs r1, #4
/*0x5cee*/      mov r0, r4
/*0x5cf0*/      bl call_4204
/*0x5cf4*/      movs r2, #1
/*0x5cf6*/      mov r1, r5
/*0x5cf8*/      mov r0, r6
/*0x5cfa*/      bl call_4204
/*0x5cfe*/      movs r2, #1
/*0x5d00*/      mov r1, r7
/*0x5d02*/      mov r0, r6
/*0x5d04*/      bl call_4204
/*0x5d08*/      movs r2, #1
/*0x5d0a*/      mov r1, r2
/*0x5d0c*/      ldr r0, [pc, #0x18] /* data_5d28 */
/*0x5d0e*/      bl call_4224
/*0x5d12*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5d16*/      b.w jump_6fe0

/*0x5d1a*/  .byte 0x00
/*0x5d1b*/  .byte 0x00

            data_5d1c:
/*0x5d1c*/  .word 0x40077000
            data_5d20:
/*0x5d20*/  .word 0x400b4000
            data_5d24:
/*0x5d24*/  .word 0x400b0000
            data_5d28:
/*0x5d28*/  .word 0x400b2000


            .thumb_func
            call_5d2c:
/*0x5d2c*/      push {r4, r5, r6, lr}
/*0x5d2e*/      ldr r4, [pc, #0x84] /* data_5db4 */
/*0x5d30*/      movs r1, #0
/*0x5d32*/      mov r0, r4
/*0x5d34*/      bl call_37c6
/*0x5d38*/      movs r1, #0
/*0x5d3a*/      mov r0, r4
/*0x5d3c*/      bl call_37b2
/*0x5d40*/      mov r0, r4
/*0x5d42*/      bl call_37a4
/*0x5d46*/      ldr r1, [pc, #0x70] /* data_5db8 */
/*0x5d48*/      asrs r0, r4, #0x14
/*0x5d4a*/      str.w r0, [r1, #0x180]
/*0x5d4e*/      movs r1, #0
/*0x5d50*/      ldr r0, [pc, #0x68] /* data_5dbc */
/*0x5d52*/      bl call_4280
/*0x5d56*/      ldr r6, [pc, #0x68] /* data_5dc0 */
/*0x5d58*/      movs r0, #2
/*0x5d5a*/      str r0, [r6, #0x24]
/*0x5d5c*/      ldr r4, [pc, #0x64] /* data_5dc4 */
/*0x5d5e*/      movs r5, #8
/*0x5d60*/      b jump_5d88
            jump_5d62:
/*0x5d62*/      ldrh r0, [r4, #4]
/*0x5d64*/      movs r2, #0
/*0x5d66*/      uxth r1, r0
/*0x5d68*/      ldr r0, [r4]
/*0x5d6a*/      bl call_4204
/*0x5d6e*/      ldrh r0, [r4, #4]
/*0x5d70*/      movs r2, #1
/*0x5d72*/      uxth r1, r0
/*0x5d74*/      ldr r0, [r4]
/*0x5d76*/      bl call_4224
/*0x5d7a*/      ldrh r0, [r4, #4]
/*0x5d7c*/      movs r2, #2
/*0x5d7e*/      uxth r1, r0
/*0x5d80*/      ldr r0, [r4]
/*0x5d82*/      bl call_4244
/*0x5d86*/      adds r4, #8
            jump_5d88:
/*0x5d88*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5d8a*/      uxtb r5, r5
/*0x5d8c*/      bhs jump_5d62
/*0x5d8e*/      movs r2, #1
/*0x5d90*/      movs r1, #4
/*0x5d92*/      mov r0, r6
/*0x5d94*/      bl call_4234
/*0x5d98*/      ldr r4, [pc, #0x2c] /* data_5dc8 */
/*0x5d9a*/      movs r2, #1
/*0x5d9c*/      lsls r1, r2, #0xe
/*0x5d9e*/      mov r0, r4
/*0x5da0*/      bl call_4234
/*0x5da4*/      mov r0, r4
/*0x5da6*/      pop.w {r4, r5, r6, lr}
/*0x5daa*/      movs r2, #1
/*0x5dac*/      lsls r1, r2, #0xf
/*0x5dae*/      b.w call_4234

/*0x5db2*/  .byte 0x00
/*0x5db3*/  .byte 0x00

            data_5db4:
/*0x5db4*/  .word 0x40077000
            data_5db8:
/*0x5db8*/  .word 0xe000e004
            data_5dbc:
/*0x5dbc*/  .word 0x4006f000
            data_5dc0:
/*0x5dc0*/  .word 0x400b4000
            data_5dc4:
/*0x5dc4*/  .word gpio_map_3
            data_5dc8:
/*0x5dc8*/  .word 0x400b0000


            .thumb_func
            call_5dcc:
/*0x5dcc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5dd0*/      ldr r4, [pc, #0xcc] /* data_5ea0 */
/*0x5dd2*/      movs r5, #8
/*0x5dd4*/      b jump_5dfa
            jump_5dd6:
/*0x5dd6*/      ldrh r0, [r4, #4]
/*0x5dd8*/      uxth r1, r0
/*0x5dda*/      ldr r0, [r4]
/*0x5ddc*/      bl call_3bf4
/*0x5de0*/      ldrh r0, [r4, #4]
/*0x5de2*/      movs r2, #1
/*0x5de4*/      uxth r1, r0
/*0x5de6*/      ldr r0, [r4]
/*0x5de8*/      bl call_4234
/*0x5dec*/      ldrh r0, [r4, #4]
/*0x5dee*/      movs r2, #1
/*0x5df0*/      uxth r1, r0
/*0x5df2*/      ldr r0, [r4]
/*0x5df4*/      bl call_4204
/*0x5df8*/      adds r4, #8
            jump_5dfa:
/*0x5dfa*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5dfc*/      uxtb r5, r5
/*0x5dfe*/      bhs jump_5dd6
/*0x5e00*/      ldr r5, [pc, #0xa0] /* data_5ea4 */
/*0x5e02*/      movs r1, #4
/*0x5e04*/      mov r0, r5
/*0x5e06*/      bl call_3bf4
/*0x5e0a*/      ldr r6, [pc, #0x9c] /* data_5ea8 */
/*0x5e0c*/      mov.w r7, #0x4000
/*0x5e10*/      mov r1, r7
/*0x5e12*/      mov r0, r6
/*0x5e14*/      bl call_3bf4
/*0x5e18*/      lsls r4, r7, #1
/*0x5e1a*/      mov r1, r4
/*0x5e1c*/      mov r0, r6
/*0x5e1e*/      bl call_3bf4
/*0x5e22*/      movs r2, #0
/*0x5e24*/      movs r1, #4
/*0x5e26*/      mov r0, r5
/*0x5e28*/      bl call_4234
/*0x5e2c*/      movs r2, #0
/*0x5e2e*/      mov r1, r7
/*0x5e30*/      mov r0, r6
/*0x5e32*/      bl call_4234
/*0x5e36*/      movs r2, #0
/*0x5e38*/      mov r1, r4
/*0x5e3a*/      mov r0, r6
/*0x5e3c*/      bl call_4234
/*0x5e40*/      movw r0, #0x2710
/*0x5e44*/      bl spin_wait /* (time) */
/*0x5e48*/      movs r0, #2
/*0x5e4a*/      str r0, [r5, #0x28]
/*0x5e4c*/      lsls r1, r0, #7
/*0x5e4e*/      ldr r0, [pc, #0x5c] /* data_5eac */
/*0x5e50*/      bl mem_zero /* (dest, size) */
/*0x5e54*/      ldr r1, [pc, #0x58] /* data_5eb0 */
/*0x5e56*/      movs r0, #0
/*0x5e58*/      strb r0, [r1, #1]
/*0x5e5a*/      movs r0, #0x64
/*0x5e5c*/      bl spin_wait /* (time) */
/*0x5e60*/      bl call_5f00
/*0x5e64*/      movs r0, #2
/*0x5e66*/      bl call_7034
/*0x5e6a*/      str r4, [r6, #0x24]
/*0x5e6c*/      movs r1, #1
/*0x5e6e*/      ldr r0, [pc, #0x44] /* data_5eb4 */
/*0x5e70*/      bl call_4280
/*0x5e74*/      ldr r4, [pc, #0x40] /* data_5eb8 */
/*0x5e76*/      movs r1, #0
/*0x5e78*/      mov r0, r4
/*0x5e7a*/      bl call_37de
/*0x5e7e*/      mov r0, r4
/*0x5e80*/      bl call_37a4
/*0x5e84*/      movs r1, #1
/*0x5e86*/      mov r0, r4
/*0x5e88*/      bl call_37b2
/*0x5e8c*/      movs r1, #1
/*0x5e8e*/      mov r0, r4
/*0x5e90*/      bl call_37c6
/*0x5e94*/      ldr r1, [pc, #0x24] /* data_5ebc */
/*0x5e96*/      asrs r0, r4, #0x14
/*0x5e98*/      str.w r0, [r1, #0x100]
/*0x5e9c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5ea0:
/*0x5ea0*/  .word gpio_map_3
            data_5ea4:
/*0x5ea4*/  .word 0x400b4000
            data_5ea8:
/*0x5ea8*/  .word 0x400b0000
            data_5eac:
/*0x5eac*/  .word 0x200002a0
            data_5eb0:
/*0x5eb0*/  .word 0x20000020
            data_5eb4:
/*0x5eb4*/  .word 0x4006f000
            data_5eb8:
/*0x5eb8*/  .word 0x40077000
            data_5ebc:
/*0x5ebc*/  .word 0xe000e004


            .thumb_func
            call_5ec0:
/*0x5ec0*/      push {r4, r5, lr}
/*0x5ec2*/      movs r0, #0x12
/*0x5ec4*/      bl call_7034
/*0x5ec8*/      movs r1, #2
/*0x5eca*/      movs r0, #0
/*0x5ecc*/      bl call_7064
/*0x5ed0*/      ldr r4, [pc, #0x24] /* data_5ef8 */
/*0x5ed2*/      mov.w r0, #0x4000
/*0x5ed6*/      str r0, [r4, #0x28]
/*0x5ed8*/      lsls r5, r0, #1
/*0x5eda*/      str r5, [r4, #0x24]
/*0x5edc*/      movs r1, #8
/*0x5ede*/      mov.w r0, #0xc00
/*0x5ee2*/      bl call_7064
/*0x5ee6*/      ldr r1, [pc, #0x14] /* data_5efc */
/*0x5ee8*/      movs r0, #4
/*0x5eea*/      str r0, [r1, #0x24]
/*0x5eec*/      str r5, [r4, #0x28]
/*0x5eee*/      nop 
/*0x5ef0*/      nop 
/*0x5ef2*/      str r5, [r4, #0x24]
/*0x5ef4*/      pop {r4, r5, pc}

/*0x5ef6*/  .byte 0x00
/*0x5ef7*/  .byte 0x00

            data_5ef8:
/*0x5ef8*/  .word 0x400b0000
            data_5efc:
/*0x5efc*/  .word 0x400b4000


            .thumb_func
            call_5f00:
/*0x5f00*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x5f04*/      ldr r1, [pc, #0x70] /* data_5f78 */
/*0x5f06*/      ldr r0, [pc, #0x6c] /* data_5f74 */
/*0x5f08*/      movs r4, #0x10
/*0x5f0a*/      ldrb r2, [r1, #1]
/*0x5f0c*/      movs r6, #4
/*0x5f0e*/      add.w r5, r0, r2, lsl #5
/*0x5f12*/      ldrb r0, [r1]
/*0x5f14*/      ldr r7, [pc, #0x64] /* data_5f7c */
/*0x5f16*/      ldr.w fp, [pc, #0x68] /* data_5f80 */
/*0x5f1a*/      adds r5, #0x1e
/*0x5f1c*/      cbz r0, jump_5f2c
/*0x5f1e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5f20*/      ands r0, r0, #0xff
/*0x5f24*/      strb r0, [r1]
/*0x5f26*/      bne jump_5f2c
/*0x5f28*/      bl call_5ec0
            jump_5f2c:
/*0x5f2c*/      mov sb, r6
/*0x5f2e*/      mov r6, fp
/*0x5f30*/      mov.w r8, #0x8000
/*0x5f34*/      mov sl, r7
/*0x5f36*/      mov.w fp, #0x4000
            jump_5f3a:
/*0x5f3a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5f3c*/      uxtb r4, r4
/*0x5f3e*/      blo jump_5f6c
/*0x5f40*/      str.w r8, [r6, #0x28]
/*0x5f44*/      ldrh r0, [r5], #-2
/*0x5f48*/      movs r1, #9
/*0x5f4a*/      ubfx r7, r0, #6, #1
/*0x5f4e*/      bl call_7064
/*0x5f52*/      mov r0, fp
/*0x5f54*/      str.w fp, [r6, #0x28]
/*0x5f58*/      str.w r8, [r6, #0x24]
/*0x5f5c*/      mov r1, sb
/*0x5f5e*/      mov r2, sl
/*0x5f60*/      cbz r7, jump_5f66
/*0x5f62*/      str r1, [r2, #0x24]
/*0x5f64*/      b jump_5f68
            jump_5f66:
/*0x5f66*/      str r1, [r2, #0x28]
            jump_5f68:
/*0x5f68*/      str r0, [r6, #0x24]
/*0x5f6a*/      b jump_5f3a
            jump_5f6c:
/*0x5f6c*/      str.w sb, [sl, #0x24]
/*0x5f70*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

            data_5f74:
/*0x5f74*/  .word 0x200002a0
            data_5f78:
/*0x5f78*/  .word 0x20000020
            data_5f7c:
/*0x5f7c*/  .word 0x400b4000
            data_5f80:
/*0x5f80*/  .word 0x400b0000


            .thumb_func
            call_5f84:
/*0x5f84*/      cmp r1, #0
/*0x5f86*/      ldr r1, [r0]
/*0x5f88*/      beq jump_5f90
/*0x5f8a*/      orr r1, r1, #1
/*0x5f8e*/      b jump_5f94
            jump_5f90:
/*0x5f90*/      bic r1, r1, #1
            jump_5f94:
/*0x5f94*/      str r1, [r0]
/*0x5f96*/      bx lr

            .thumb_func
            call_5f98:
/*0x5f98*/      push {r4, r5, lr}
/*0x5f9a*/      ldrd r4, r3, [r1, #0x14]
/*0x5f9e*/      cbz r4, jump_5fda
/*0x5fa0*/      mov.w r2, #0x200
/*0x5fa4*/      lsrs r2, r3
/*0x5fa6*/      orrs r2, r4
            jump_5fa8:
/*0x5fa8*/      ldr r4, [r1, #8]
/*0x5faa*/      ldr r3, [r1]
/*0x5fac*/      orrs r3, r4
/*0x5fae*/      ldrd r4, r5, [r1, #0xc]
/*0x5fb2*/      orrs r4, r5
/*0x5fb4*/      orrs r3, r4
/*0x5fb6*/      ldr r4, [r1, #0x1c]
/*0x5fb8*/      orrs r3, r4
/*0x5fba*/      orrs r3, r2
/*0x5fbc*/      str r3, [r0, #4]
/*0x5fbe*/      ldr r3, [r1, #0x24]
/*0x5fc0*/      ldr r2, [r1, #4]
/*0x5fc2*/      orrs r2, r3
/*0x5fc4*/      ldr r3, [r1, #0x20]
/*0x5fc6*/      orr.w r2, r2, r3, lsl #4
/*0x5fca*/      str r2, [r0, #0x18]
/*0x5fcc*/      ldr r1, [r1, #0x28]
/*0x5fce*/      mov.w r2, #-1
/*0x5fd2*/      add.w r1, r2, r1, lsr #1
/*0x5fd6*/      str r1, [r0, #0xc]
/*0x5fd8*/      pop {r4, r5, pc}
            jump_5fda:
/*0x5fda*/      mov.w r2, #0x100
/*0x5fde*/      lsls r2, r3
/*0x5fe0*/      b jump_5fa8

            .thumb_func
            call_5fe2:
/*0x5fe2*/      cmp r1, #0
/*0x5fe4*/      ldr r1, [r0]
/*0x5fe6*/      beq jump_5fee
/*0x5fe8*/      orr r1, r1, #8
/*0x5fec*/      b jump_5ff2
            jump_5fee:
/*0x5fee*/      bic r1, r1, #8
            jump_5ff2:
/*0x5ff2*/      str r1, [r0]
/*0x5ff4*/      bx lr

            .thumb_func
            call_5ff6:
/*0x5ff6*/      push {r4, r5, r6, lr}
/*0x5ff8*/      mov r5, r0
/*0x5ffa*/      bl call_3dbc
/*0x5ffe*/      bfi r4, r0, #0, #8
/*0x6002*/      cbz r5, jump_6028
/*0x6004*/      cmp r5, #1
/*0x6006*/      beq jump_6014
/*0x6008*/      cmp r5, #2
/*0x600a*/      bne jump_601a
/*0x600c*/      uxth r0, r4
/*0x600e*/      orr r4, r0, #2
/*0x6012*/      b jump_601a
            jump_6014:
/*0x6014*/      uxth r0, r4
/*0x6016*/      bic r4, r0, #2
            jump_601a:
/*0x601a*/      uxtb r0, r4
/*0x601c*/      bl call_41e0
/*0x6020*/      bl call_3dbc
/*0x6024*/      bfi r4, r0, #0, #8
            jump_6028:
/*0x6028*/      lsls r0, r4, #0x1e
/*0x602a*/      bpl jump_6030
/*0x602c*/      movs r0, #1
/*0x602e*/      pop {r4, r5, r6, pc}
            jump_6030:
/*0x6030*/      movs r0, #0
/*0x6032*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6034:
/*0x6034*/      ldr r0, [pc, #0x50] /* data_6088 */
/*0x6036*/      movs r1, #1
/*0x6038*/      str.w r1, [r0, #0x300]
/*0x603c*/      ldr r2, [pc, #0x4c] /* data_608c */
/*0x603e*/      str.w r1, [r2, #0xa8]
            jump_6042:
/*0x6042*/      ldr.w r3, [r2, #0x108]
/*0x6046*/      cmp r3, #0
/*0x6048*/      beq jump_6042
/*0x604a*/      movs r3, #0
/*0x604c*/      str r3, [r2, #0x20]
/*0x604e*/      mov.w r3, #0x9000000
/*0x6052*/      str r3, [r0, #0x18]
/*0x6054*/      str.w r1, [r2, #0xa4]
            jump_6058:
/*0x6058*/      ldr.w r3, [r2, #0x104]
/*0x605c*/      cmp r3, #0
/*0x605e*/      beq jump_6058
/*0x6060*/      ldr r2, [pc, #0x2c] /* data_6090 */
/*0x6062*/      ldr.w r3, [r2, #0x200]
/*0x6066*/      bic r3, r3, #7
/*0x606a*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x606c*/      str.w r3, [r2, #0x200]
/*0x6070*/      str r1, [r0, #0x20]
/*0x6072*/      ldr r2, [r0, #4]
/*0x6074*/      bic r2, r2, #3
/*0x6078*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x607a*/      str r2, [r0, #4]
            jump_607c:
/*0x607c*/      ldr r2, [r0, #0x34]
/*0x607e*/      cmp.w r1, r2, lsr #30
/*0x6082*/      bne jump_607c
/*0x6084*/      bx lr

/*0x6086*/  .byte 0x00
/*0x6087*/  .byte 0x00

            data_6088:
/*0x6088*/  .word 0x40088000
            data_608c:
/*0x608c*/  .word 0x43100000
            data_6090:
/*0x6090*/  .word 0x40080000


            .thumb_func
            call_6094:
/*0x6094*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6098*/      movs r3, #3
/*0x609a*/      ldr.w lr, [pc, #0x44] /* data_60e0 */
/*0x609e*/      b jump_60d0
            jump_60a0:
/*0x60a0*/      add.w r0, r3, r3, lsl #1
/*0x60a4*/      movs r1, #4
/*0x60a6*/      add.w ip, r2, r0, lsl #3
/*0x60aa*/      add.w r7, lr, r3, lsl #5
/*0x60ae*/      b jump_60ca
            jump_60b0:
/*0x60b0*/      add.w r4, r1, r1, lsl #1
/*0x60b4*/      add.w r6, ip, r4, lsl #1
/*0x60b8*/      movs r0, #6
/*0x60ba*/      add.w r4, r7, r1, lsl #3
/*0x60be*/      b jump_60c4
            jump_60c0:
/*0x60c0*/      ldrb r5, [r6, r0]
/*0x60c2*/      strb r5, [r4, r0]
            jump_60c4:
/*0x60c4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x60c6*/      uxtb r0, r0
/*0x60c8*/      bhs jump_60c0
            jump_60ca:
/*0x60ca*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x60cc*/      uxtb r1, r1
/*0x60ce*/      bhs jump_60b0
            jump_60d0:
/*0x60d0*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x60d2*/      uxtb r3, r3
/*0x60d4*/      bhs jump_60a0
/*0x60d6*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x60da*/      b.w call_5bec

/*0x60de*/  .byte 0x00
/*0x60df*/  .byte 0x00

            data_60e0:
/*0x60e0*/  .word 0x20000240


            .thumb_func
            call_60e4:
/*0x60e4*/      push {r4, r5, r6, lr}
/*0x60e6*/      ldr r0, [pc, #0x28] /* data_6110 */
/*0x60e8*/      mov r5, r1
/*0x60ea*/      ldrb r1, [r0, #5]
/*0x60ec*/      cmp r1, #2
/*0x60ee*/      beq jump_60f4
/*0x60f0*/      movs r0, #0xff
/*0x60f2*/      pop {r4, r5, r6, pc}
            jump_60f4:
/*0x60f4*/      movs r1, #1
/*0x60f6*/      strb r1, [r0, #5]
/*0x60f8*/      movs r4, #4
/*0x60fa*/      b jump_6104
            jump_60fc:
/*0x60fc*/      mov r0, r4
/*0x60fe*/      bl call_5a20
/*0x6102*/      strb r0, [r5, r4]
            jump_6104:
/*0x6104*/      mov r0, r4
/*0x6106*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6108*/      uxtb r4, r4
/*0x610a*/      bhs jump_60fc
/*0x610c*/      pop {r4, r5, r6, pc}

/*0x610e*/  .byte 0x00
/*0x610f*/  .byte 0x00

            data_6110:
/*0x6110*/  .word 0x20000054


            .thumb_func
            call_6114:
/*0x6114*/      push {r4, r5, r6, lr}
/*0x6116*/      movs r4, #0
/*0x6118*/      sub sp, #0x48
/*0x611a*/      mov.w r1, #0x4100
/*0x611e*/      movw r0, #0x2010
/*0x6122*/      movs r3, #1
/*0x6124*/      mov r2, r4
/*0x6126*/      bl call_398c
/*0x612a*/      movs r0, #1
/*0x612c*/      strh.w r0, [sp, #4]
/*0x6130*/      strh.w r4, [sp, #8]
/*0x6134*/      strh.w r4, [sp, #6]
/*0x6138*/      strh.w r4, [sp, #0xa]
/*0x613c*/      strd r4, r0, [sp, #0x14]
/*0x6140*/      lsls r1, r0, #8
/*0x6142*/      mov.w r2, #0x420
/*0x6146*/      strd r1, r2, [sp, #0x20]
/*0x614a*/      str r4, [sp, #0x1c]
/*0x614c*/      strd r1, r0, [sp, #0x30]
/*0x6150*/      lsls r0, r0, #9
/*0x6152*/      strd r4, r0, [sp, #0x38]
/*0x6156*/      mov.w r0, #0xc80
/*0x615a*/      movs r4, #1
/*0x615c*/      movs r5, #0xff
/*0x615e*/      ldr r6, [pc, #0x20] /* data_6180 */
/*0x6160*/      str r0, [sp, #0x40]
/*0x6162*/      b jump_6176
            jump_6164:
/*0x6164*/      add.w r0, r4, r4, lsl #1
/*0x6168*/      add.w r0, r6, r0, lsl #2
/*0x616c*/      mov r1, sp
/*0x616e*/      strb r5, [r0, #6]
/*0x6170*/      mov r0, r4
/*0x6172*/      bl call_7098
            jump_6176:
/*0x6176*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6178*/      uxtb r4, r4
/*0x617a*/      bhs jump_6164
/*0x617c*/      add sp, #0x48
/*0x617e*/      pop {r4, r5, r6, pc}

            data_6180:
/*0x6180*/  .word 0x200016a4


            .thumb_func
            call_6184:
/*0x6184*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6188*/      ldr r4, [pc, #0x34] /* data_61c0 */
/*0x618a*/      cbz r0, jump_6194
/*0x618c*/      movs r7, #0
            jump_618e:
/*0x618e*/      movs r5, #1
/*0x6190*/      mov r6, r5
/*0x6192*/      b jump_61b6
            jump_6194:
/*0x6194*/      movs r7, #6
/*0x6196*/      b jump_618e
            jump_6198:
/*0x6198*/      ldrb r0, [r4, #0x13]
/*0x619a*/      mov r2, r7
/*0x619c*/      lsl.w r1, r6, r0
/*0x61a0*/      ldrb r0, [r4, #0x12]
/*0x61a2*/      bl call_366c
/*0x61a6*/      ldrb r0, [r4, #0x15]
/*0x61a8*/      mov r2, r7
/*0x61aa*/      lsl.w r1, r6, r0
/*0x61ae*/      ldrb r0, [r4, #0x14]
/*0x61b0*/      bl call_366c
/*0x61b4*/      adds r4, #0x18
            jump_61b6:
/*0x61b6*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x61b8*/      uxtb r5, r5
/*0x61ba*/      bhs jump_6198
/*0x61bc*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_61c0:
/*0x61c0*/  .word data_7e80


            .thumb_func
            call_61c4:
/*0x61c4*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x61c8*/      ldr.w sb, [pc, #0x160] /* data_632c */
/*0x61cc*/      movs r4, #1
/*0x61ce*/      add.w sl, sb, #0x100
/*0x61d2*/      sub.w fp, sb, #4
/*0x61d6*/      b jump_6320
            jump_61d8:
/*0x61d8*/      ldr r1, [pc, #0x154] /* data_6330 */
/*0x61da*/      add.w r0, r4, r4, lsl #1
/*0x61de*/      add.w r5, r1, r0, lsl #3
/*0x61e2*/      ldr r1, [pc, #0x150] /* data_6334 */
/*0x61e4*/      add.w r6, r1, r0, lsl #2
/*0x61e8*/      ldrb r0, [r5, #0x11]
/*0x61ea*/      movs r1, #0x11
/*0x61ec*/      bl call_55f0
/*0x61f0*/      cbz r0, jump_61fa
/*0x61f2*/      ldrb r0, [r5, #0x11]
/*0x61f4*/      movs r1, #0x11
/*0x61f6*/      bl call_556c
            jump_61fa:
/*0x61fa*/      ldrb r0, [r5, #0x10]
/*0x61fc*/      movs r1, #0x11
/*0x61fe*/      bl call_55f0
/*0x6202*/      cbz r0, jump_6218
/*0x6204*/      ldrb r0, [r5, #0x10]
/*0x6206*/      movs r1, #0x11
/*0x6208*/      bl call_556c
/*0x620c*/      movs r0, #0xff
/*0x620e*/      strb r0, [r6, #6]
/*0x6210*/      movs r1, #0
/*0x6212*/      ldr r0, [r5, #4]
/*0x6214*/      bl call_63d4
            jump_6218:
/*0x6218*/      ldrb r0, [r6, #6]
/*0x621a*/      cmp r0, #0xff
/*0x621c*/      bne jump_626c
/*0x621e*/      add.w r1, r6, #8
/*0x6222*/      mov r0, r4
/*0x6224*/      bl call_60e4
/*0x6228*/      strb r0, [r6, #6]
/*0x622a*/      cmp r0, #0xff
/*0x622c*/      beq jump_626c
/*0x622e*/      ldr r1, [pc, #0x100] /* data_6330 */
/*0x6230*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x6232*/      add r1, r4
/*0x6234*/      ldrb r7, [r0, r1]
/*0x6236*/      mvns r0, r0
/*0x6238*/      strb r0, [r6, #7]
/*0x623a*/      adds r2, r7, #2
/*0x623c*/      adds r1, r6, #6
/*0x623e*/      movs r0, #0
/*0x6240*/      bl call_39c4
/*0x6244*/      strh r0, [r6, #2]!
/*0x6248*/      mvns r0, r0
/*0x624a*/      strh r0, [r6, #2]
/*0x624c*/      ldr r0, [r5, #8]
/*0x624e*/      str r6, [r0, #-0xc]
/*0x6252*/      ldr r0, [pc, #0xe4] /* data_6338 */
/*0x6254*/      ldr r1, [r5, #8]
/*0x6256*/      add.w r0, r0, r7, lsl #16
/*0x625a*/      str r0, [r1]
/*0x625c*/      ldrb r0, [r5, #0x10]
/*0x625e*/      movs r1, #1
/*0x6260*/      bl call_55c8
/*0x6264*/      movs r1, #1
/*0x6266*/      ldr r0, [r5, #4]
/*0x6268*/      bl call_63d4
            jump_626c:
/*0x626c*/      ldr r0, [r5, #0xc]
/*0x626e*/      ldr r0, [r0]
/*0x6270*/      movs r1, #0
/*0x6272*/      sub.w r0, r1, r0, lsr #16
/*0x6276*/      ldrb.w r1, [fp, r4]
/*0x627a*/      mov r6, fp
/*0x627c*/      subs r0, r0, r1
/*0x627e*/      uxtb r3, r0
/*0x6280*/      cmp r3, #6
/*0x6282*/      blo jump_6320
/*0x6284*/      mov r8, sl
            jump_6286:
/*0x6286*/      mov r1, r8
/*0x6288*/      adds r0, r1, #2
/*0x628a*/      ldrb r5, [r6, r4]
/*0x628c*/      movs r2, #6
/*0x628e*/      add.w r7, sb, r4, lsl #8
/*0x6292*/      b jump_62a0
            jump_6294:
/*0x6294*/      ldrb.w ip, [r7, r5]
/*0x6298*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x629a*/      strb ip, [r0], #1
/*0x629e*/      uxtb r5, r5
            jump_62a0:
/*0x62a0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x62a2*/      uxtb r2, r2
/*0x62a4*/      bhs jump_6294
/*0x62a6*/      ldrh r2, [r1, #2]
/*0x62a8*/      ldrh.w ip, [r1, #4]
/*0x62ac*/      add r2, ip
/*0x62ae*/      sub.w ip, r2, #0xff00
/*0x62b2*/      subs.w ip, ip, #0xff
/*0x62b6*/      bne jump_62c2
/*0x62b8*/      ldrb r2, [r1, #6]
/*0x62ba*/      ldrb r1, [r1, #7]
/*0x62bc*/      add r1, r2
/*0x62be*/      cmp r1, #0xff
/*0x62c0*/      beq jump_62d2
            jump_62c2:
/*0x62c2*/      ldrb r0, [r6, r4]
/*0x62c4*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x62c6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x62c8*/      uxtb r3, r3
/*0x62ca*/      strb r0, [r6, r4]
/*0x62cc*/      cmp r3, #6
/*0x62ce*/      bhs jump_6286
/*0x62d0*/      b jump_6320
            jump_62d2:
/*0x62d2*/      cmp r3, #6
/*0x62d4*/      blo jump_6320
/*0x62d6*/      ldr r2, [pc, #0x58] /* data_6330 */
/*0x62d8*/      ldrb.w r1, [r8, #6]
/*0x62dc*/      .short 0x1ed2 /* subs r2, r2, #3 */ 
/*0x62de*/      add r2, r4
/*0x62e0*/      ldrb r2, [r1, r2]
/*0x62e2*/      adds r1, r2, #6
/*0x62e4*/      cmp r3, r1
/*0x62e6*/      blo jump_6320
/*0x62e8*/      mov r1, r2
/*0x62ea*/      b jump_62f6
            jump_62ec:
/*0x62ec*/      ldrb r3, [r7, r5]
/*0x62ee*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x62f0*/      strb r3, [r0], #1
/*0x62f4*/      uxtb r5, r5
            jump_62f6:
/*0x62f6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x62f8*/      uxtb r1, r1
/*0x62fa*/      bhs jump_62ec
/*0x62fc*/      add.w r1, r8, #6
/*0x6300*/      movs r0, #0
/*0x6302*/      .short 0x1c92 /* adds r2, r2, #2 */ 
/*0x6304*/      bl call_39c4
/*0x6308*/      ldrh.w r1, [r8, #2]
/*0x630c*/      cmp r0, r1
/*0x630e*/      bne jump_631e
/*0x6310*/      ldr r2, [pc, #0x20] /* data_6334 */
/*0x6312*/      ldrb.w r1, [r8, #6]
/*0x6316*/      subs r2, #0x48
/*0x6318*/      mov r0, r4
/*0x631a*/      bl call_6094
            jump_631e:
/*0x631e*/      strb r5, [r6, r4]
            jump_6320:
/*0x6320*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6322*/      uxtb r4, r4
/*0x6324*/      bhs.w jump_61d8
/*0x6328*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_632c:
/*0x632c*/  .word 0x20001554
            data_6330:
/*0x6330*/  .word data_7e80
            data_6334:
/*0x6334*/  .word 0x200016a4
            data_6338:
/*0x6338*/  .word 0x00060001


            .thumb_func
            call_633c:
/*0x633c*/      push {r4, r5, r6, lr}
/*0x633e*/      mov r4, r0
/*0x6340*/      mov r5, r1
/*0x6342*/      ldrh r0, [r1, #6]
/*0x6344*/      ldrh r1, [r1, #4]
/*0x6346*/      ldr r2, [r4, #0x10]
/*0x6348*/      orrs r0, r1
/*0x634a*/      ldrh r1, [r5, #8]
/*0x634c*/      bic r2, r2, #0x1f
/*0x6350*/      orrs r1, r2
/*0x6352*/      orrs r0, r1
/*0x6354*/      str r0, [r4, #0x10]
/*0x6356*/      ldr r0, [r4, #0x24]
/*0x6358*/      ldrh r1, [r5, #0xa]
/*0x635a*/      bic r0, r0, #3
/*0x635e*/      orrs r0, r1
/*0x6360*/      str r0, [r4, #0x24]
/*0x6362*/      cmp.w r4, #0x40000000
/*0x6366*/      beq jump_637e
/*0x6368*/      ldr r0, [pc, #0x24] /* data_6390 */
/*0x636a*/      cmp r4, r0
/*0x636c*/      bne jump_6382
/*0x636e*/      movs r0, #0x1a
            jump_6370:
/*0x6370*/      bl call_3958
/*0x6374*/      ldr r1, [r5]
/*0x6376*/      udiv r0, r0, r1
/*0x637a*/      str r0, [r4, #0x38]
/*0x637c*/      pop {r4, r5, r6, pc}
            jump_637e:
/*0x637e*/      movs r0, #0x18
/*0x6380*/      b jump_6370
            jump_6382:
/*0x6382*/      ldr r0, [pc, #0x10] /* data_6394 */
/*0x6384*/      cmp r4, r0
/*0x6386*/      bne jump_638c
/*0x6388*/      movs r0, #0x1c
/*0x638a*/      b jump_6370
            jump_638c:
/*0x638c*/      movs r0, #0x1e
/*0x638e*/      b jump_6370

            data_6390:
/*0x6390*/  .word 0x40040000
            data_6394:
/*0x6394*/  .word 0x40001000


            .thumb_func
            call_6398:
/*0x6398*/      cmp r1, #0
/*0x639a*/      ldr r1, [r0, #0xc]
/*0x639c*/      beq jump_63a4
/*0x639e*/      orr r1, r1, #0x200
/*0x63a2*/      b jump_63a8
            jump_63a4:
/*0x63a4*/      bic r1, r1, #0x200
            jump_63a8:
/*0x63a8*/      str r1, [r0, #0xc]
/*0x63aa*/      bx lr

            .thumb_func
            call_63ac:
/*0x63ac*/      cmp r1, #0
/*0x63ae*/      ldr r1, [r0, #0x24]
/*0x63b0*/      beq jump_63b8
/*0x63b2*/      orr r1, r1, #0x20
/*0x63b6*/      b jump_63bc
            jump_63b8:
/*0x63b8*/      bic r1, r1, #0x20
            jump_63bc:
/*0x63bc*/      str r1, [r0, #0x24]
/*0x63be*/      bx lr

            .thumb_func
            call_63c0:
/*0x63c0*/      cmp r1, #0
/*0x63c2*/      ldr r1, [r0, #0xc]
/*0x63c4*/      beq jump_63cc
/*0x63c6*/      orr r1, r1, #0x100
/*0x63ca*/      b jump_63d0
            jump_63cc:
/*0x63cc*/      bic r1, r1, #0x100
            jump_63d0:
/*0x63d0*/      str r1, [r0, #0xc]
/*0x63d2*/      bx lr

            .thumb_func
            call_63d4:
/*0x63d4*/      cmp r1, #0
/*0x63d6*/      ldr r1, [r0, #0x24]
/*0x63d8*/      beq jump_63e0
/*0x63da*/      orr r1, r1, #0x10
/*0x63de*/      b jump_63e4
            jump_63e0:
/*0x63e0*/      bic r1, r1, #0x10
            jump_63e4:
/*0x63e4*/      str r1, [r0, #0x24]
/*0x63e6*/      bx lr

            .thumb_func
            call_63e8:
/*0x63e8*/      ldr r0, [pc, #0x18] /* data_6404 */
/*0x63ea*/      movs r1, #0
/*0x63ec*/      add.w r2, r0, #8
/*0x63f0*/      str r1, [r0, #0x1c]
/*0x63f2*/      str r1, [r0, #0x20]
/*0x63f4*/      strb r1, [r2, #1]
/*0x63f6*/      str.w r1, [r0, #0x15]
/*0x63fa*/      movs r1, #0x1d
/*0x63fc*/      ldr r0, [pc, #8] /* data_6408 */
/*0x63fe*/      b.w mem_zero /* (dest, size) */

/*0x6402*/  .byte 0x00
/*0x6403*/  .byte 0x00

            data_6404:
/*0x6404*/  .word 0x20000028
            data_6408:
/*0x6408*/  .word 0x200003ba


            .thumb_func
            loc_640c:
/*0x640c*/      push {r4, lr}
/*0x640e*/      ldr r0, [pc, #0x20] /* data_6430 */
/*0x6410*/      ldr r1, [pc, #0x1c] /* data_6430 */
/*0x6412*/      movs r4, #1
/*0x6414*/      strb r4, [r0]
/*0x6416*/      adds r1, #0xc
/*0x6418*/      movs r0, #2
/*0x641a*/      strb r0, [r1]
/*0x641c*/      ldr r1, [pc, #0x14] /* data_6434 */
/*0x641e*/      movs r0, #4
/*0x6420*/      strb r0, [r1]
/*0x6422*/      bl call_63e8
/*0x6426*/      ldr r0, [pc, #8] /* data_6430 */
/*0x6428*/      subs r0, #8
/*0x642a*/      strb r4, [r0, #5]
/*0x642c*/      pop {r4, pc}

/*0x642e*/  .byte 0x00
/*0x642f*/  .byte 0x00

            data_6430:
/*0x6430*/  .word 0x20000030
            data_6434:
/*0x6434*/  .word 0x200003b8


            .thumb_func
            call_6438:
/*0x6438*/      ldrb.w r0, [r0, #0x34]
/*0x643c*/      ubfx r0, r0, #1, #1
/*0x6440*/      bx lr

/*0x6442*/  .byte 0x00
/*0x6443*/  .byte 0x00

            jump_6444:
/*0x6444*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6448*/      mov r4, r0
/*0x644a*/      bl call_6888
/*0x644e*/      mov r5, r0
/*0x6450*/      ldr r6, [pc, #0x158] /* data_65ac */
/*0x6452*/      lsls r0, r0, #0x1e
/*0x6454*/      bpl jump_6462
/*0x6456*/      ldr r0, [r6, #4]
/*0x6458*/      cbz r0, jump_645c
/*0x645a*/      blx r0
            jump_645c:
/*0x645c*/      movs r0, #2
/*0x645e*/      bl call_65e4
            jump_6462:
/*0x6462*/      lsls r0, r5, #0x1b
/*0x6464*/      bpl jump_6486
/*0x6466*/      movs r0, #0x10
/*0x6468*/      bl call_65e4
/*0x646c*/      ldrb.w r0, [r4, #0x32]
/*0x6470*/      cmp r0, #2
/*0x6472*/      blo jump_6486
/*0x6474*/      bl call_689c
/*0x6478*/      ldrb.w r0, [r4, #0x32]
/*0x647c*/      strb.w r0, [r4, #0x33]
/*0x6480*/      movs r0, #3
/*0x6482*/      strb.w r0, [r4, #0x32]
            jump_6486:
/*0x6486*/      lsls r0, r5, #0x1d
/*0x6488*/      mov.w r7, #0
/*0x648c*/      bpl jump_64d2
/*0x648e*/      subs r0, r7, #1
/*0x6490*/      str r0, [r4, #0x20]
/*0x6492*/      strb.w r7, [r4, #0x30]
/*0x6496*/      strb.w r7, [r4, #0x31]
/*0x649a*/      ldrb.w r0, [r4, #0x34]
/*0x649e*/      bic r0, r0, #2
/*0x64a2*/      strb.w r0, [r4, #0x34]
/*0x64a6*/      movs r0, #4
/*0x64a8*/      strb.w r0, [r4, #0x32]
/*0x64ac*/      str r7, [r4, #0x38]
/*0x64ae*/      bl call_6694
/*0x64b2*/      bl call_68ac
/*0x64b6*/      ldr r1, [pc, #0xf8] /* data_65b0 */
/*0x64b8*/      movs r0, #0
/*0x64ba*/      bl call_6750
/*0x64be*/      ldr r0, [pc, #0xf0] /* data_65b0 */
/*0x64c0*/      ldr r0, [r0]
/*0x64c2*/      bl call_6858
/*0x64c6*/      ldr r0, [r6]
/*0x64c8*/      cbz r0, jump_64cc
/*0x64ca*/      blx r0
            jump_64cc:
/*0x64cc*/      movs r0, #4
/*0x64ce*/      bl call_65e4
            jump_64d2:
/*0x64d2*/      lsls r0, r5, #0x1c
/*0x64d4*/      bpl jump_64e8
/*0x64d6*/      bl call_68ac
/*0x64da*/      ldrb.w r0, [r4, #0x33]
/*0x64de*/      strb.w r0, [r4, #0x32]
/*0x64e2*/      movs r0, #8
/*0x64e4*/      bl call_65e4
            jump_64e8:
/*0x64e8*/      lsls r0, r5, #0x17
/*0x64ea*/      mov.w r8, #0x100
/*0x64ee*/      bpl jump_656c
/*0x64f0*/      movs r0, #0
/*0x64f2*/      bl call_6730
/*0x64f6*/      mov r5, r0
/*0x64f8*/      lsls r0, r0, #0x16
/*0x64fa*/      bpl jump_6512
/*0x64fc*/      mov r0, r4
/*0x64fe*/      bl call_69cc
/*0x6502*/      mov r0, r4
/*0x6504*/      bl call_73f4
/*0x6508*/      mov.w r1, #0x200
/*0x650c*/      movs r0, #0
/*0x650e*/      bl call_66c0
            jump_6512:
/*0x6512*/      lsls r0, r5, #0x1e
/*0x6514*/      bpl jump_6554
/*0x6516*/      movs r1, #2
/*0x6518*/      movs r0, #0
/*0x651a*/      bl call_66c0
/*0x651e*/      ldr r0, [r4, #0x20]
/*0x6520*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6522*/      beq jump_6554
/*0x6524*/      ldrb.w r0, [r4, #0x24]
/*0x6528*/      cmp r0, #2
/*0x652a*/      bne jump_6554
/*0x652c*/      movs r2, #0x40
/*0x652e*/      movs r0, #0
/*0x6530*/      ldr r1, [r4, #0x1c]
/*0x6532*/      bl call_67b0
/*0x6536*/      ldr r1, [r4, #0x1c]
/*0x6538*/      add r1, r0
/*0x653a*/      str r1, [r4, #0x1c]
/*0x653c*/      ldr r1, [r4, #0x20]
/*0x653e*/      subs r0, r1, r0
/*0x6540*/      str r0, [r4, #0x20]
/*0x6542*/      bne jump_6554
/*0x6544*/      movs r0, #1
/*0x6546*/      strb.w r0, [r4, #0x24]
/*0x654a*/      ldr r1, [r4, #0x28]
/*0x654c*/      cbz r1, jump_6554
/*0x654e*/      ldr r0, [r4, #0x2c]
/*0x6550*/      blx r1
/*0x6552*/      str r7, [r4, #0x28]
            jump_6554:
/*0x6554*/      lsls r0, r5, #0x1b
/*0x6556*/      bpl jump_6566
/*0x6558*/      mov r0, r4
/*0x655a*/      bl call_73b0
/*0x655e*/      movs r1, #0x10
/*0x6560*/      movs r0, #0
/*0x6562*/      bl call_66c0
            jump_6566:
/*0x6566*/      mov r0, r8
/*0x6568*/      bl call_65e4
            jump_656c:
/*0x656c*/      mov r4, r8
            jump_656e:
/*0x656e*/      bl call_6888
/*0x6572*/      bl call_6868
/*0x6576*/      mov r5, r0
/*0x6578*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x657a*/      beq jump_65a6
/*0x657c*/      mov r0, r5
/*0x657e*/      bl call_6730
/*0x6582*/      tst.w r0, #0x12
/*0x6586*/      beq jump_656e
/*0x6588*/      movs r1, #0x12
/*0x658a*/      mov r0, r5
/*0x658c*/      bl call_66c0
/*0x6590*/      lsl.w r0, r4, r5
/*0x6594*/      bl call_65e4
/*0x6598*/      ldr r0, [r6, #0x18]
/*0x659a*/      cmp r0, #0
/*0x659c*/      beq jump_656e
/*0x659e*/      mov r1, r0
/*0x65a0*/      mov r0, r5
/*0x65a2*/      blx r1
/*0x65a4*/      b jump_656e
            jump_65a6:
/*0x65a6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x65aa*/  .byte 0x00
/*0x65ab*/  .byte 0x00

            data_65ac:
/*0x65ac*/  .word data_7e58
            data_65b0:
/*0x65b0*/  .word 0x200000d0


            .thumb_func
            call_65b4:
/*0x65b4*/      movs r1, #2
/*0x65b6*/      strb.w r1, [r0, #0x32]
/*0x65ba*/      ldr r0, [pc, #4] /* data_65c0 */
/*0x65bc*/      b.w jump_6898

            data_65c0:
/*0x65c0*/  .word 0x200000d0


            .thumb_func
            call_65c4:
/*0x65c4*/      ldrb.w r0, [r0, #0x32]
/*0x65c8*/      cmp r0, #3
/*0x65ca*/      beq jump_65d0
/*0x65cc*/      movs r0, #0
/*0x65ce*/      bx lr
            jump_65d0:
/*0x65d0*/      movs r0, #1
/*0x65d2*/      bx lr

            .thumb_func
            call_65d4:
/*0x65d4*/      push {r4, lr}
/*0x65d6*/      bl call_68ac
/*0x65da*/      pop.w {r4, lr}
/*0x65de*/      b.w jump_69dc

/*0x65e2*/  .byte 0x00
/*0x65e3*/  .byte 0x00


            .thumb_func
            call_65e4:
/*0x65e4*/      ldr r1, [pc, #4] /* data_65ec */
/*0x65e6*/      str r0, [r1, #8]
/*0x65e8*/      bx lr

/*0x65ea*/  .byte 0x00
/*0x65eb*/  .byte 0x00

            data_65ec:
/*0x65ec*/  .word 0x400a8000


            .thumb_func
            call_65f0:
/*0x65f0*/      push {r4, lr}
/*0x65f2*/      movs r1, #0
/*0x65f4*/      mov.w r0, #0x400
/*0x65f8*/      movs r2, #0x40
/*0x65fa*/      movs r3, #1
/*0x65fc*/      bl call_398c
/*0x6600*/      movs r0, #2
/*0x6602*/      bl call_39b0
/*0x6606*/      ldr r4, [pc, #0x48] /* data_6650 */
/*0x6608*/      ldr r0, [pc, #0x40] /* data_664c */
/*0x660a*/      str r0, [r4, #8]
/*0x660c*/      subs r0, #0x5c
/*0x660e*/      str r0, [r4, #0xc]
/*0x6610*/      adds r0, #0x70
/*0x6612*/      str r0, [r4, #0x10]
/*0x6614*/      movs r0, #3
/*0x6616*/      str r0, [r4, #0x14]
/*0x6618*/      bl loc_640c
/*0x661c*/      mov r0, r4
/*0x661e*/      bl call_65b4
/*0x6622*/      ldr r1, [pc, #0x30] /* data_6654 */
/*0x6624*/      mov.w r0, #0x200000
/*0x6628*/      str.w r0, [r1, #0x100]
/*0x662c*/      movs r0, #1
/*0x662e*/      bl call_6678
/*0x6632*/      movs r0, #0xfa
/*0x6634*/      bl spin_wait /* (time) */
/*0x6638*/      ldrb.w r0, [r4, #0x34]
/*0x663c*/      pop.w {r4, lr}
/*0x6640*/      and r1, r0, #1
/*0x6644*/      ldr r0, [pc, #0x10] /* data_6658 */
/*0x6646*/      b.w jump_68bc

/*0x664a*/  .byte 0x00
/*0x664b*/  .byte 0x00

            data_664c:
/*0x664c*/  .word data_7e14
            data_6650:
/*0x6650*/  .word 0x200003d8
            data_6654:
/*0x6654*/  .word 0xe000e004
            data_6658:
/*0x6658*/  .word 0x200000d0


            .thumb_func
            call_665c:
/*0x665c*/      ldr r1, [pc, #0x14] /* data_6674 */
/*0x665e*/      cmp r0, #1
/*0x6660*/      ldr r0, [r1]
/*0x6662*/      beq jump_666c
/*0x6664*/      bic r0, r0, #0x800
            jump_6668:
/*0x6668*/      str r0, [r1]
/*0x666a*/      bx lr
            jump_666c:
/*0x666c*/      orr r0, r0, #0x800
/*0x6670*/      b jump_6668

/*0x6672*/  .byte 0x00
/*0x6673*/  .byte 0x00

            data_6674:
/*0x6674*/  .word 0x400a8000


            .thumb_func
            call_6678:
/*0x6678*/      ldr r1, [pc, #0x14] /* data_6690 */
/*0x667a*/      cmp r0, #1
/*0x667c*/      ldr r0, [r1]
/*0x667e*/      beq jump_6688
/*0x6680*/      bic r0, r0, #0x400
            jump_6684:
/*0x6684*/      str r0, [r1]
/*0x6686*/      bx lr
            jump_6688:
/*0x6688*/      orr r0, r0, #0x400
/*0x668c*/      b jump_6684

/*0x668e*/  .byte 0x00
/*0x668f*/  .byte 0x00

            data_6690:
/*0x6690*/  .word 0x400a8000


            .thumb_func
            call_6694:
/*0x6694*/      movs r1, #0
/*0x6696*/      movs r0, #0x20
/*0x6698*/      movs r3, #1
/*0x669a*/      mov r2, r1
/*0x669c*/      b.w jump_58e8

            .thumb_func
            call_66a0:
/*0x66a0*/      push {r4, lr}
/*0x66a2*/      bl call_7618
/*0x66a6*/      ldr r1, [r0]
/*0x66a8*/      and r1, r1, #9
/*0x66ac*/      str r1, [r0]
/*0x66ae*/      pop {r4, pc}

            .thumb_func
            call_66b0:
/*0x66b0*/      push {r4, lr}
/*0x66b2*/      bl call_7618
/*0x66b6*/      ldr r1, [r0]
/*0x66b8*/      and r1, r1, #0x24
/*0x66bc*/      str r1, [r0]
/*0x66be*/      pop {r4, pc}

            .thumb_func
            call_66c0:
/*0x66c0*/      push {r4, lr}
/*0x66c2*/      mov r4, r1
/*0x66c4*/      bl call_7618
/*0x66c8*/      str r4, [r0, #8]
/*0x66ca*/      pop {r4, pc}

            .thumb_func
            call_66cc:
/*0x66cc*/      push {r4, lr}
/*0x66ce*/      bl call_7618
/*0x66d2*/      ldr r0, [r0, #0x10]
/*0x66d4*/      ldr r1, [pc, #8] /* data_66e0 */
/*0x66d6*/      ubfx r0, r0, #0, #0xa
/*0x66da*/      add r0, r1
/*0x66dc*/      pop {r4, pc}

/*0x66de*/  .byte 0x00
/*0x66df*/  .byte 0x00

            data_66e0:
/*0x66e0*/  .word 0x400aa000


            .thumb_func
            call_66e4:
/*0x66e4*/      push {r4, r5, r6, lr}
/*0x66e6*/      mov r5, r0
/*0x66e8*/      bl call_7618
/*0x66ec*/      mov r4, r0
/*0x66ee*/      mov r0, r5
/*0x66f0*/      bl call_6708
/*0x66f4*/      ldr r1, [r4, #0x10]
/*0x66f6*/      ubfx r1, r1, #0, #0xa
/*0x66fa*/      add r0, r1
/*0x66fc*/      ldr r1, [pc, #4] /* data_6704 */
/*0x66fe*/      add r0, r1
/*0x6700*/      pop {r4, r5, r6, pc}

/*0x6702*/  .byte 0x00
/*0x6703*/  .byte 0x00

            data_6704:
/*0x6704*/  .word 0x400aa000


            .thumb_func
            call_6708:
/*0x6708*/      push {r4, lr}
/*0x670a*/      bl call_7618
/*0x670e*/      ldr r0, [r0, #0x10]
/*0x6710*/      ubfx r0, r0, #0xa, #0xa
/*0x6714*/      pop {r4, pc}

            .thumb_func
            call_6716:
/*0x6716*/      push {r4, lr}
/*0x6718*/      bl call_7618
/*0x671c*/      ldr r1, [r0, #0x10]
/*0x671e*/      ldr r0, [r0]
/*0x6720*/      lsls r1, r1, #3
/*0x6722*/      bpl jump_672a
/*0x6724*/      ubfx r0, r0, #2, #1
/*0x6728*/      pop {r4, pc}
            jump_672a:
/*0x672a*/      ubfx r0, r0, #5, #1
/*0x672e*/      pop {r4, pc}

            .thumb_func
            call_6730:
/*0x6730*/      push {r4, lr}
/*0x6732*/      bl call_7618
/*0x6736*/      ldr r1, [r0, #4]
/*0x6738*/      ldr r0, [r0, #8]
/*0x673a*/      ands r0, r1
/*0x673c*/      pop {r4, pc}

            .thumb_func
            call_673e:
/*0x673e*/      push {r4, lr}
/*0x6740*/      mov r4, r1
/*0x6742*/      bl call_7618
/*0x6746*/      ldr r0, [r0, #0xc]
/*0x6748*/      lsrs r0, r4
/*0x674a*/      ubfx r0, r0, #0, #9
/*0x674e*/      pop {r4, pc}

            .thumb_func
            call_6750:
/*0x6750*/      push {r4, r5, r6, lr}
/*0x6752*/      mov r4, r1
/*0x6754*/      mov r5, r0
/*0x6756*/      bl call_7618
/*0x675a*/      add.w r1, r4, r5, lsl #3
/*0x675e*/      ldr r2, [r1, #4]
/*0x6760*/      str r2, [r0, #0x10]
/*0x6762*/      ldr r1, [r1, #8]
/*0x6764*/      str r1, [r0, #4]
/*0x6766*/      mov.w r1, #-1
/*0x676a*/      str r1, [r0, #8]
/*0x676c*/      mov r0, r5
/*0x676e*/      pop.w {r4, r5, r6, lr}
/*0x6772*/      b.w jump_67e0

            .thumb_func
            call_6776:
/*0x6776*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x677a*/      mov r6, r2
/*0x677c*/      mov r7, r1
/*0x677e*/      movs r5, r0
/*0x6780*/      beq jump_67a6
/*0x6782*/      movs r1, #0
            jump_6784:
/*0x6784*/      bl call_673e
/*0x6788*/      mov r4, r0
/*0x678a*/      cmp r0, r6
/*0x678c*/      bhi jump_67a0
/*0x678e*/      mov r0, r5
/*0x6790*/      cbz r5, jump_67aa
/*0x6792*/      bl call_66cc
            jump_6796:
/*0x6796*/      adds r1, r4, #3
/*0x6798*/      lsrs r2, r1, #2
/*0x679a*/      mov r1, r7
/*0x679c*/      bl call_7608
            jump_67a0:
/*0x67a0*/      mov r0, r4
/*0x67a2*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_67a6:
/*0x67a6*/      movs r1, #0x10
/*0x67a8*/      b jump_6784
            jump_67aa:
/*0x67aa*/      bl call_66e4
/*0x67ae*/      b jump_6796

            .thumb_func
            call_67b0:
/*0x67b0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x67b4*/      mov r5, r2
/*0x67b6*/      mov r6, r1
/*0x67b8*/      mov r7, r0
/*0x67ba*/      bl call_7618
/*0x67be*/      mov r4, r0
/*0x67c0*/      movs r0, #0
/*0x67c2*/      cbz r5, jump_67d4
/*0x67c4*/      mov r2, r5
/*0x67c6*/      mov r1, r6
/*0x67c8*/      mov r0, r7
/*0x67ca*/      bl call_6776
/*0x67ce*/      cbnz r0, jump_67d4
/*0x67d0*/      cmp r5, #0
/*0x67d2*/      bne jump_67dc
            jump_67d4:
/*0x67d4*/      ldr r1, [r4]
/*0x67d6*/      and r1, r1, #0x10
/*0x67da*/      str r1, [r4]
            jump_67dc:
/*0x67dc*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_67e0:
/*0x67e0*/      push {r4, lr}
/*0x67e2*/      bl call_7618
/*0x67e6*/      ldr r1, [r0]
/*0x67e8*/      and r1, r1, #0x19
/*0x67ec*/      str r1, [r0]
/*0x67ee*/      pop {r4, pc}
            jump_67f0:
/*0x67f0*/      push {r4, lr}
/*0x67f2*/      bl call_7618
/*0x67f6*/      movs r1, #4
/*0x67f8*/      str r1, [r0]
/*0x67fa*/      pop {r4, pc}

            .thumb_func
            call_67fc:
/*0x67fc*/      push {r4, lr}
/*0x67fe*/      bl call_7618
/*0x6802*/      movs r1, #0x40
/*0x6804*/      str r1, [r0, #8]
/*0x6806*/      ldr r2, [r0]
/*0x6808*/      movs r1, #0x24
/*0x680a*/      bics r1, r2
/*0x680c*/      str r1, [r0]
/*0x680e*/      pop {r4, pc}

            .thumb_func
            call_6810:
/*0x6810*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6814*/      mov r4, r2
/*0x6816*/      mov r8, r1
/*0x6818*/      mov r7, r0
/*0x681a*/      bl call_6708
/*0x681e*/      mov r6, r0
/*0x6820*/      mov r0, r7
/*0x6822*/      bl call_7618
/*0x6826*/      mov r5, r0
/*0x6828*/      movs r1, #0
/*0x682a*/      mov r0, r7
/*0x682c*/      bl call_673e
/*0x6830*/      cmp r4, r6
/*0x6832*/      bhi jump_6836
/*0x6834*/      cbz r0, jump_683c
            jump_6836:
/*0x6836*/      movs r0, #0
            jump_6838:
/*0x6838*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_683c:
/*0x683c*/      mov r0, r7
/*0x683e*/      bl call_66cc
/*0x6842*/      mov r1, r0
/*0x6844*/      adds r0, r4, #3
/*0x6846*/      lsrs r2, r0, #2
/*0x6848*/      mov r0, r8
/*0x684a*/      bl call_7608
/*0x684e*/      str r4, [r5, #0xc]
/*0x6850*/      movs r0, #2
/*0x6852*/      str r0, [r5]
/*0x6854*/      mov r0, r4
/*0x6856*/      b jump_6838

            .thumb_func
            call_6858:
/*0x6858*/      ldr r1, [pc, #8] /* data_6864 */
/*0x685a*/      ldr r2, [r1, #4]
/*0x685c*/      orrs r2, r0
/*0x685e*/      str r2, [r1, #4]
/*0x6860*/      bx lr

/*0x6862*/  .byte 0x00
/*0x6863*/  .byte 0x00

            data_6864:
/*0x6864*/  .word 0x400a8000


            .thumb_func
            call_6868:
/*0x6868*/      mov r3, r0
/*0x686a*/      movs r1, #7
            jump_686c:
/*0x686c*/      add.w r2, r1, #8
/*0x6870*/      lsr.w r0, r3, r2
/*0x6874*/      lsls r2, r0, #0x1f
/*0x6876*/      beq jump_687c
/*0x6878*/      sxtb r0, r1
/*0x687a*/      bx lr
            jump_687c:
/*0x687c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x687e*/      cmp r1, #0
/*0x6880*/      bgt jump_686c
/*0x6882*/      mov.w r0, #-1
/*0x6886*/      bx lr

            .thumb_func
            call_6888:
/*0x6888*/      ldr r0, [pc, #8] /* data_6894 */
/*0x688a*/      ldr r1, [r0, #4]
/*0x688c*/      ldr r0, [r0, #8]
/*0x688e*/      ands r0, r1
/*0x6890*/      bx lr

/*0x6892*/  .byte 0x00
/*0x6893*/  .byte 0x00

            data_6894:
/*0x6894*/  .word 0x400a8000

            jump_6898:
/*0x6898*/      b.w jump_6934

            .thumb_func
            call_689c:
/*0x689c*/      ldr r0, [pc, #8] /* data_68a8 */
/*0x689e*/      ldr r1, [r0]
/*0x68a0*/      orr r1, r1, #0xc
/*0x68a4*/      str r1, [r0]
/*0x68a6*/      bx lr

            data_68a8:
/*0x68a8*/  .word 0x400a8000


            .thumb_func
            call_68ac:
/*0x68ac*/      ldr r0, [pc, #8] /* data_68b8 */
/*0x68ae*/      ldr r1, [r0]
/*0x68b0*/      and r1, r1, #0x400
/*0x68b4*/      str r1, [r0]
/*0x68b6*/      bx lr

            data_68b8:
/*0x68b8*/  .word 0x400a8000

            jump_68bc:
/*0x68bc*/      push {r4, lr}
/*0x68be*/      mov r4, r0
/*0x68c0*/      ldr r0, [pc, #0x68] /* data_692c */
/*0x68c2*/      ldr r2, [r0]
/*0x68c4*/      cmp r2, #1
/*0x68c6*/      bne jump_6928
/*0x68c8*/      movs r2, #0
/*0x68ca*/      str r2, [r0]
/*0x68cc*/      ldr r0, [pc, #0x60] /* data_6930 */
/*0x68ce*/      ldr r2, [r0]
/*0x68d0*/      lsls r3, r2, #0x19
/*0x68d2*/      mov.w r2, #-1
/*0x68d6*/      bpl jump_68f2
/*0x68d8*/      movw r3, #0x40c
/*0x68dc*/      str r3, [r0]
/*0x68de*/      str r2, [r0, #8]
/*0x68e0*/      cbnz r1, jump_68e8
/*0x68e2*/      movs r0, #0
/*0x68e4*/      bl call_56a4
            jump_68e8:
/*0x68e8*/      ldr r0, [r4]
/*0x68ea*/      pop.w {r4, lr}
/*0x68ee*/      b.w call_6858
            jump_68f2:
/*0x68f2*/      movw r3, #0xc0c
/*0x68f6*/      str r3, [r0]
/*0x68f8*/      str r2, [r0, #8]
/*0x68fa*/      cbnz r1, jump_6902
/*0x68fc*/      movs r0, #0
/*0x68fe*/      bl call_56a4
            jump_6902:
/*0x6902*/      movs r0, #0
/*0x6904*/      bl call_665c
/*0x6908*/      ldr r0, [r4]
/*0x690a*/      bl call_6858
/*0x690e*/      movs r0, #0
/*0x6910*/      bl call_6678
/*0x6914*/      movs r1, #0xc8
/*0x6916*/      movs r0, #0
            jump_6918:
/*0x6918*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x691a*/      cmp r0, r1
/*0x691c*/      blo jump_6918
/*0x691e*/      pop.w {r4, lr}
/*0x6922*/      movs r0, #1
/*0x6924*/      b.w call_6678
            jump_6928:
/*0x6928*/      pop {r4, pc}

/*0x692a*/  .byte 0x00
/*0x692b*/  .byte 0x00

            data_692c:
/*0x692c*/  .word 0x20000010
            data_6930:
/*0x6930*/  .word 0x400a8000

            jump_6934:
/*0x6934*/      movw r1, #0x111d
/*0x6938*/      str r1, [r0]
/*0x693a*/      ldr r1, [pc, #0x28] /* data_6964 */
/*0x693c*/      str r1, [r0, #4]
/*0x693e*/      movw r1, #0x212
/*0x6942*/      str r1, [r0, #8]
/*0x6944*/      ldr r1, [pc, #0x20] /* data_6968 */
/*0x6946*/      str r1, [r0, #0xc]
/*0x6948*/      ldr r2, [pc, #0x20] /* data_696c */
/*0x694a*/      movs r1, #0x10
/*0x694c*/      strd r1, r2, [r0, #0x10]
/*0x6950*/      str r1, [r0, #0x18]
/*0x6952*/      ldr r1, [pc, #0x1c] /* data_6970 */
/*0x6954*/      str r1, [r0, #0x1c]
/*0x6956*/      movs r1, #0
/*0x6958*/      str r1, [r0, #0x20]
/*0x695a*/      ldr r1, [pc, #0x18] /* data_6974 */
/*0x695c*/      str r1, [r0, #0x24]
/*0x695e*/      movs r1, #2
/*0x6960*/      str r1, [r0, #0x28]
/*0x6962*/      bx lr

            data_6964:
/*0x6964*/  .word 0x80010008
            data_6968:
/*0x6968*/  .word 0x91002088
            data_696c:
/*0x696c*/  .word 0x92010090
            data_6970:
/*0x6970*/  .word 0x930100d0
            data_6974:
/*0x6974*/  .word 0x84010110


            .thumb_func
            call_6978:
/*0x6978*/      push {r4, lr}
/*0x697a*/      ldr r4, [pc, #0x48] /* data_69c4 */
/*0x697c*/      ldrb.w r0, [r4, #0x32]
/*0x6980*/      cmp r0, #3
/*0x6982*/      bne jump_6988
/*0x6984*/      bl call_7628
            jump_6988:
/*0x6988*/      ldr r1, [pc, #0x3c] /* data_69c8 */
/*0x698a*/      ldrb r0, [r1, #5]
/*0x698c*/      cbz r0, jump_69ae
/*0x698e*/      cmp r0, #1
/*0x6990*/      beq jump_69a6
/*0x6992*/      cmp r0, #2
/*0x6994*/      bne jump_69b6
/*0x6996*/      ldrb.w r0, [r4, #0x32]
/*0x699a*/      cmp r0, #6
/*0x699c*/      bne jump_69a2
/*0x699e*/      bl call_7154
            jump_69a2:
/*0x69a2*/      movs r0, #2
/*0x69a4*/      pop {r4, pc}
            jump_69a6:
/*0x69a6*/      movs r0, #0
/*0x69a8*/      strb r0, [r1, #5]
/*0x69aa*/      movs r0, #3
/*0x69ac*/      pop {r4, pc}
            jump_69ae:
/*0x69ae*/      ldrb.w r0, [r4, #0x32]
/*0x69b2*/      cmp r0, #6
/*0x69b4*/      beq jump_69ba
            jump_69b6:
/*0x69b6*/      movs r0, #0
/*0x69b8*/      pop {r4, pc}
            jump_69ba:
/*0x69ba*/      movs r0, #2
/*0x69bc*/      strb r0, [r1, #5]
/*0x69be*/      movs r0, #1
/*0x69c0*/      pop {r4, pc}

/*0x69c2*/  .byte 0x00
/*0x69c3*/  .byte 0x00

            data_69c4:
/*0x69c4*/  .word 0x200003d8
            data_69c8:
/*0x69c8*/  .word 0x20000028


            .thumb_func
            call_69cc:
/*0x69cc*/      ldr r1, [pc, #8] /* data_69d8 */
/*0x69ce*/      ldr r2, [r1]
/*0x69d0*/      str r2, [r0]
/*0x69d2*/      ldr r1, [r1, #4]
/*0x69d4*/      str r1, [r0, #4]
/*0x69d6*/      bx lr

            data_69d8:
/*0x69d8*/  .word 0x400aa000

            jump_69dc:
/*0x69dc*/      ldr r0, [pc, #8] /* data_69e8 */
/*0x69de*/      ldr r1, [r0]
/*0x69e0*/      orr r1, r1, #0x20
/*0x69e4*/      str r1, [r0]
/*0x69e6*/      bx lr

            data_69e8:
/*0x69e8*/  .word 0x400a8000


            .thumb_func
            call_69ec:
/*0x69ec*/      ldr r1, [pc, #0xc] /* data_69fc */
/*0x69ee*/      ldr r2, [r1]
/*0x69f0*/      orr r2, r2, #0x100
/*0x69f4*/      str r2, [r1]
/*0x69f6*/      str r0, [r1, #0x10]
/*0x69f8*/      bx lr

/*0x69fa*/  .byte 0x00
/*0x69fb*/  .byte 0x00

            data_69fc:
/*0x69fc*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x6a00*/      ldr r0, [pc, #4] /* data_6a08 */
/*0x6a02*/      b.w jump_6444

/*0x6a06*/  .byte 0x00
/*0x6a07*/  .byte 0x00

            data_6a08:
/*0x6a08*/  .word 0x200003d8


            .thumb_func
            call_6a0c:
/*0x6a0c*/      ldr r1, [pc, #0x1c] /* data_6a2c */
/*0x6a0e*/      movs r0, #0x10
/*0x6a10*/      str.w r0, [r1, #0x10c]
/*0x6a14*/      ldr r0, [pc, #0x18] /* data_6a30 */
/*0x6a16*/      movw r1, #0x5fff
/*0x6a1a*/      str r1, [r0, #8]
/*0x6a1c*/      ldr r1, [pc, #0x14] /* data_6a34 */
/*0x6a1e*/      str r1, [r0, #4]
/*0x6a20*/      movw r1, #0xca35
/*0x6a24*/      str r1, [r0, #0x10]
/*0x6a26*/      ldr r1, [pc, #0x10] /* data_6a38 */
/*0x6a28*/      str r1, [r0]
/*0x6a2a*/      bx lr

            data_6a2c:
/*0x6a2c*/  .word 0x40088000
            data_6a30:
/*0x6a30*/  .word 0x40068000
            data_6a34:
/*0x6a34*/  .word 0x0001a7d0
            data_6a38:
/*0x6a38*/  .word 0x5fa00001


            .thumb_func
            call_6a3c:
/*0x6a3c*/      ldr r1, [pc, #8] /* data_6a48 */
/*0x6a3e*/      ldr r0, [pc, #4] /* data_6a44 */
/*0x6a40*/      str r0, [r1]
/*0x6a42*/      bx lr

            data_6a44:
/*0x6a44*/  .word 0x5fa00001
            data_6a48:
/*0x6a48*/  .word 0x40068000

            jump_6a4c:
/*0x6a4c*/      push {r4, lr}
/*0x6a4e*/      bl call_3c8c
/*0x6a52*/      ldr r1, [pc, #0x14] /* data_6a68 */
/*0x6a54*/      movs r0, #0
/*0x6a56*/      str r0, [r1, #4]
/*0x6a58*/      ldr r0, [pc, #0x10] /* data_6a6c */
/*0x6a5a*/      ldrb r1, [r0, #7]
/*0x6a5c*/      bic r1, r1, #1
/*0x6a60*/      strb r1, [r0, #7]
/*0x6a62*/      movs r1, #1
/*0x6a64*/      strb r1, [r0]
/*0x6a66*/      pop {r4, pc}

            data_6a68:
/*0x6a68*/  .word 0x20000000
            data_6a6c:
/*0x6a6c*/  .word 0x20000054


            .thumb_func
            call_6a70:
/*0x6a70*/      lsls r0, r0, #0xc
/*0x6a72*/      add.w r0, r0, #0x1000
/*0x6a76*/      add.w r0, r0, r1, lsl #2
/*0x6a7a*/      bx lr
            jump_6a7c:
/*0x6a7c*/      push {r4, r5, r6, lr}
/*0x6a7e*/      mov r6, r0
/*0x6a80*/      mov r5, r2
/*0x6a82*/      mov r4, r1
/*0x6a84*/      mov r0, r1
/*0x6a86*/      bl call_40f4
/*0x6a8a*/      mov r2, r5
/*0x6a8c*/      mov r1, r4
/*0x6a8e*/      mov r0, r6
/*0x6a90*/      pop.w {r4, r5, r6, lr}
/*0x6a94*/      b.w jump_4144

            .thumb_func
            call_6a98:
/*0x6a98*/      push {r4, r5, lr}
/*0x6a9a*/      ldr r1, [pc, #0x24] /* data_6ac0 */
/*0x6a9c*/      movs r0, #0xa
/*0x6a9e*/      ldr r2, [pc, #0x1c] /* data_6abc */
/*0x6aa0*/      ldr r3, [pc, #0x20] /* data_6ac4 */
/*0x6aa2*/      ldrb.w r1, [r1, #0x25]
/*0x6aa6*/      b jump_6ab2
            jump_6aa8:
/*0x6aa8*/      ldrb r4, [r2, r0]
/*0x6aaa*/      muls r4, r1, r4
/*0x6aac*/      lsrs r4, r4, #3
/*0x6aae*/      adds r5, r3, r0
/*0x6ab0*/      strb r4, [r5, #4]
            jump_6ab2:
/*0x6ab2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6ab4*/      uxtb r0, r0
/*0x6ab6*/      bhs jump_6aa8
/*0x6ab8*/      pop {r4, r5, pc}

/*0x6aba*/  .byte 0x00
/*0x6abb*/  .byte 0x00

            data_6abc:
/*0x6abc*/  .word data_79eb
            data_6ac0:
/*0x6ac0*/  .word 0x20000478
            data_6ac4:
/*0x6ac4*/  .word 0x2000006c


            .thumb_func
            call_6ac8:
/*0x6ac8*/      push.w {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
/*0x6acc*/      ldr r6, [pc, #0x18c] /* data_6c5c */
/*0x6ace*/      ldr r4, [pc, #0x190] /* data_6c60 */
/*0x6ad0*/      ldrb r0, [r6, #3]
/*0x6ad2*/      cmp r0, #5
/*0x6ad4*/      bhi jump_6b6e
/*0x6ad6*/      cmp r0, #6
/*0x6ad8*/      bhs jump_6b0a
/*0x6ada*/      tbb [pc, r0]

/*0x6ade*/  .byte 0x03 /* case switch_6ae4 */
/*0x6adf*/  .byte 0x03 /* case switch_6ae4 */
/*0x6ae0*/  .byte 0x1b /* case switch_6b14 */
/*0x6ae1*/  .byte 0x54 /* case switch_6b86 */
/*0x6ae2*/  .byte 0x41 /* case switch_6b60 */
/*0x6ae3*/  .byte 0x41 /* case switch_6b60 */

            switch_6ae4:
/*0x6ae4*/      movs r5, #3
/*0x6ae6*/      ldr r7, [pc, #0x17c] /* data_6c64 */
/*0x6ae8*/      b jump_6b04
            jump_6aea:
/*0x6aea*/      ldrb r0, [r6, #3]
/*0x6aec*/      cbz r0, jump_6b0e
/*0x6aee*/      adds r0, r4, r5
/*0x6af0*/      ldrb r0, [r0, #4]
            jump_6af2:
/*0x6af2*/      ldr r1, [r4]
/*0x6af4*/      ldrb r1, [r1, #3]
/*0x6af6*/      muls r0, r1, r0
/*0x6af8*/      lsrs r2, r0, #3
/*0x6afa*/      add.w r0, r7, r5, lsl #5
/*0x6afe*/      movs r1, #0x20
/*0x6b00*/      bl mem_set /* (dest, size, val) */
            jump_6b04:
/*0x6b04*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6b06*/      uxtb r5, r5
/*0x6b08*/      bhs jump_6aea
            jump_6b0a:
/*0x6b0a*/      pop.w {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}
            jump_6b0e:
/*0x6b0e*/      ldr r0, [r4]
/*0x6b10*/      ldrb r0, [r0, r5]
/*0x6b12*/      b jump_6af2
            switch_6b14:
/*0x6b14*/      ldrb r7, [r4, #4]
/*0x6b16*/      movs r5, #5
/*0x6b18*/      mov r6, sp
/*0x6b1a*/      b jump_6b38
            jump_6b1c:
/*0x6b1c*/      ldr r0, [r4]
/*0x6b1e*/      ldrb r0, [r0, #3]
/*0x6b20*/      lsls r1, r0, #5
/*0x6b22*/      sub.w r0, r1, r0, lsl #1
/*0x6b26*/      uxtb r1, r0
/*0x6b28*/      add.w r0, r5, r5, lsl #1
/*0x6b2c*/      adds r2, r0, r6
/*0x6b2e*/      mov r0, r7
/*0x6b30*/      bl call_3cdc
/*0x6b34*/      adds r7, #0xa
/*0x6b36*/      uxtb r7, r7
            jump_6b38:
/*0x6b38*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6b3a*/      uxtb r5, r5
/*0x6b3c*/      bhs jump_6b1c
/*0x6b3e*/      ldr r5, [pc, #0x128] /* data_6c68 */
/*0x6b40*/      movs r4, #0x20
/*0x6b42*/      b jump_6b58
            jump_6b44:
/*0x6b44*/      ldrb r0, [r5]
/*0x6b46*/      cmp r0, #5
/*0x6b48*/      bhs jump_6b56
/*0x6b4a*/      add.w r0, r0, r0, lsl #1
/*0x6b4e*/      adds r1, r0, r6
/*0x6b50*/      mov r0, r4
/*0x6b52*/      bl call_3d80
            jump_6b56:
/*0x6b56*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6b58:
/*0x6b58*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6b5a*/      uxtb r4, r4
/*0x6b5c*/      bhs jump_6b44
/*0x6b5e*/      b jump_6b0a
            switch_6b60:
/*0x6b60*/      add sp, #0x10
/*0x6b62*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x6b64*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6b68*/      uxtb r0, r0
/*0x6b6a*/      b.w jump_3ad8
            jump_6b6e:
/*0x6b6e*/      cmp r0, #7
/*0x6b70*/      bls jump_6b0a
/*0x6b72*/      bic r0, r0, #1
/*0x6b76*/      cmp r0, #8
/*0x6b78*/      beq switch_6b86
/*0x6b7a*/      cmp r0, #0xa
/*0x6b7c*/      beq jump_6b92
/*0x6b7e*/      cmp r0, #0xc
/*0x6b80*/      bne jump_6b0a
/*0x6b82*/      movs r5, #0x20
/*0x6b84*/      b jump_6c52
            switch_6b86:
/*0x6b86*/      add sp, #0x10
/*0x6b88*/      adds r0, r4, #4
/*0x6b8a*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6b8e*/      b.w jump_3d58
            jump_6b92:
/*0x6b92*/      movs r0, #0
/*0x6b94*/      movs r5, #5
/*0x6b96*/      str r0, [sp, #4]
/*0x6b98*/      b jump_6bf0
            jump_6b9a:
/*0x6b9a*/      add.w r0, r5, r5, lsl #1
/*0x6b9e*/      add.w r1, r4, r0, lsl #1
/*0x6ba2*/      ldrb r0, [r1, #4]!
/*0x6ba6*/      cbnz r0, jump_6bb0
/*0x6ba8*/      ldrb r0, [r1, #1]
/*0x6baa*/      cbnz r0, jump_6bb0
/*0x6bac*/      ldrb r0, [r1, #2]
/*0x6bae*/      cbz r0, jump_6bdc
            jump_6bb0:
/*0x6bb0*/      ldrb r0, [r1, #3]
/*0x6bb2*/      cbnz r0, jump_6bbc
/*0x6bb4*/      ldrb r0, [r1, #4]
/*0x6bb6*/      cbnz r0, jump_6bbc
/*0x6bb8*/      ldrb r0, [r1, #5]
/*0x6bba*/      cbz r0, jump_6bd8
            jump_6bbc:
/*0x6bbc*/      movs r2, #3
/*0x6bbe*/      mov r6, sp
/*0x6bc0*/      b jump_6bd0
            jump_6bc2:
/*0x6bc2*/      adds r3, r1, r2
/*0x6bc4*/      ldrb r0, [r1, r2]
/*0x6bc6*/      ldrb r3, [r3, #3]
/*0x6bc8*/      cmp r0, r3
/*0x6bca*/      bhi jump_6bce
/*0x6bcc*/      mov r0, r3
            jump_6bce:
/*0x6bce*/      strb r0, [r6, r2]
            jump_6bd0:
/*0x6bd0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6bd2*/      uxtb r2, r2
/*0x6bd4*/      bhs jump_6bc2
/*0x6bd6*/      mov r1, r6
            jump_6bd8:
/*0x6bd8*/      mov r0, r5
/*0x6bda*/      b jump_6bec
            jump_6bdc:
/*0x6bdc*/      ldrb r0, [r1, #3]
/*0x6bde*/      cbnz r0, jump_6be8
/*0x6be0*/      ldrb r0, [r1, #4]
/*0x6be2*/      cbnz r0, jump_6be8
/*0x6be4*/      ldrb r0, [r1, #5]
/*0x6be6*/      cbz r0, jump_6bf8
            jump_6be8:
/*0x6be8*/      mov r0, r5
/*0x6bea*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6bec:
/*0x6bec*/      bl call_6c6c
            jump_6bf0:
/*0x6bf0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6bf2*/      uxtb r5, r5
/*0x6bf4*/      bhs jump_6b9a
/*0x6bf6*/      b jump_6b0a
            jump_6bf8:
/*0x6bf8*/      add r1, sp, #4
/*0x6bfa*/      b jump_6bd8
            jump_6bfc:
/*0x6bfc*/      ldr r0, [pc, #0x68] /* data_6c68 */
/*0x6bfe*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6c00*/      ldrb r1, [r0, r5]
/*0x6c02*/      and r0, r1, #7
/*0x6c06*/      add.w r0, r0, r0, lsl #2
/*0x6c0a*/      add r0, r4
/*0x6c0c*/      ldrsb.w r2, [r0, #0x12]
/*0x6c10*/      adds r0, #0xe
/*0x6c12*/      cbz r2, jump_6c4a
/*0x6c14*/      ldrb r3, [r0, #3]
/*0x6c16*/      rsbs r1, r3, r1, lsr #3
/*0x6c1a*/      bpl jump_6c1e
/*0x6c1c*/      rsbs r1, r1, #0
            jump_6c1e:
/*0x6c1e*/      subs r1, r1, r2
/*0x6c20*/      adds r1, #0xa
/*0x6c22*/      uxtb r2, r1
/*0x6c24*/      cmp r2, #0xa
/*0x6c26*/      bhs jump_6c4a
/*0x6c28*/      movs r1, #3
/*0x6c2a*/      mov r3, sp
/*0x6c2c*/      add r2, r4
/*0x6c2e*/      b jump_6c3a
            jump_6c30:
/*0x6c30*/      ldrb r6, [r0, r1]
/*0x6c32*/      ldrb r7, [r2, #4]
/*0x6c34*/      muls r6, r7, r6
/*0x6c36*/      lsrs r6, r6, #8
/*0x6c38*/      strb r6, [r3, r1]
            jump_6c3a:
/*0x6c3a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6c3c*/      uxtb r1, r1
/*0x6c3e*/      bhs jump_6c30
/*0x6c40*/      mov r1, r3
/*0x6c42*/      mov r0, r5
/*0x6c44*/      bl call_3d80
/*0x6c48*/      b jump_6c52
            jump_6c4a:
/*0x6c4a*/      movs r1, #0
/*0x6c4c*/      mov r0, r5
/*0x6c4e*/      bl call_3da0
            jump_6c52:
/*0x6c52*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6c54*/      uxtb r5, r5
/*0x6c56*/      bhs jump_6bfc
/*0x6c58*/      b jump_6b0a

/*0x6c5a*/  .byte 0x00
/*0x6c5b*/  .byte 0x00

            data_6c5c:
/*0x6c5c*/  .word 0x20000478
            data_6c60:
/*0x6c60*/  .word 0x2000006c
            data_6c64:
/*0x6c64*/  .word 0x20000240
            data_6c68:
/*0x6c68*/  .word data_79ca


            .thumb_func
            call_6c6c:
/*0x6c6c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6c70*/      mov r7, r1
/*0x6c72*/      mov r6, r0
/*0x6c74*/      movs r4, #0x20
/*0x6c76*/      ldr r5, [pc, #0x1c] /* data_6c94 */
/*0x6c78*/      b jump_6c8a
            jump_6c7a:
/*0x6c7a*/      ldrb r0, [r5]
/*0x6c7c*/      cmp r0, r6
/*0x6c7e*/      bne jump_6c88
/*0x6c80*/      mov r1, r7
/*0x6c82*/      mov r0, r4
/*0x6c84*/      bl call_3d80
            jump_6c88:
/*0x6c88*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6c8a:
/*0x6c8a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6c8c*/      uxtb r4, r4
/*0x6c8e*/      bhs jump_6c7a
/*0x6c90*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6c94:
/*0x6c94*/  .word data_79ca


            .thumb_func
            call_6c98:
/*0x6c98*/      push {r3, r4, r5, lr}
/*0x6c9a*/      mov r4, r0
/*0x6c9c*/      ldr r0, [pc, #0x24] /* data_6cc4 */
/*0x6c9e*/      ldr r0, [r0]
/*0x6ca0*/      ldrb r5, [r0, #3]
/*0x6ca2*/      cbnz r1, jump_6cac
/*0x6ca4*/      mov r0, sp
/*0x6ca6*/      bl call_3cba
/*0x6caa*/      mov r1, sp
            jump_6cac:
/*0x6cac*/      movs r2, #3
/*0x6cae*/      b jump_6cbc
            jump_6cb0:
/*0x6cb0*/      ldrb r0, [r1], #1
/*0x6cb4*/      muls r0, r5, r0
/*0x6cb6*/      lsrs r0, r0, #3
/*0x6cb8*/      strb r0, [r4], #1
            jump_6cbc:
/*0x6cbc*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6cbe*/      uxtb r2, r2
/*0x6cc0*/      bhs jump_6cb0
/*0x6cc2*/      pop {r3, r4, r5, pc}

            data_6cc4:
/*0x6cc4*/  .word 0x2000006c


            .thumb_func
            call_6cc8:
/*0x6cc8*/      ldr r0, [pc, #0x24] /* data_6cf0 */
/*0x6cca*/      push {r4, lr}
/*0x6ccc*/      ldr r0, [r0]
/*0x6cce*/      bl call_4666
/*0x6cd2*/      mov r1, r0
/*0x6cd4*/      ldr r2, [pc, #0x1c] /* data_6cf4 */
/*0x6cd6*/      movs r0, #0
            jump_6cd8:
/*0x6cd8*/      add.w r3, r2, r0, lsl #1
/*0x6cdc*/      ldrh r3, [r3, #0x28]
/*0x6cde*/      ubfx r3, r3, #0, #0xa
/*0x6ce2*/      cmp r3, r1
/*0x6ce4*/      beq jump_6cee
/*0x6ce6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6ce8*/      uxtb r0, r0
/*0x6cea*/      cmp r0, #0x18
/*0x6cec*/      blo jump_6cd8
            jump_6cee:
/*0x6cee*/      pop {r4, pc}

            data_6cf0:
/*0x6cf0*/  .word 0x20000060
            data_6cf4:
/*0x6cf4*/  .word 0x20000478


            .thumb_func
            call_6cf8:
/*0x6cf8*/      push {r4, lr}
/*0x6cfa*/      ldr r4, [pc, #0x40] /* data_6d3c */
/*0x6cfc*/      movs r0, #0x18
/*0x6cfe*/      strb r0, [r4, #4]
/*0x6d00*/      ldr r0, [pc, #0x3c] /* data_6d40 */
/*0x6d02*/      ldrb r1, [r0, #1]
/*0x6d04*/      lsls r1, r1, #0x1f
/*0x6d06*/      beq jump_6d14
/*0x6d08*/      ldrb r0, [r0, #2]
/*0x6d0a*/      movs r1, #0
/*0x6d0c*/      bl call_4388
/*0x6d10*/      cmp r0, #0
/*0x6d12*/      beq jump_6d3a
            jump_6d14:
/*0x6d14*/      bl call_54ac
/*0x6d18*/      cmp r0, #0
/*0x6d1a*/      bne jump_6d3a
/*0x6d1c*/      ldr r1, [pc, #0x24] /* data_6d44 */
/*0x6d1e*/      ldr r2, [pc, #0x28] /* data_6d48 */
/*0x6d20*/      strb r0, [r4, #4]
            jump_6d22:
/*0x6d22*/      uxtb r0, r0
/*0x6d24*/      add.w r3, r1, r0, lsl #1
/*0x6d28*/      ldrh r3, [r3, #0x28]
/*0x6d2a*/      cmp.w r2, r3, lsl #22
/*0x6d2e*/      beq jump_6d3a
/*0x6d30*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6d32*/      uxtb r0, r0
/*0x6d34*/      strb r0, [r4, #4]
/*0x6d36*/      cmp r0, #0x18
/*0x6d38*/      blo jump_6d22
            jump_6d3a:
/*0x6d3a*/      pop {r4, pc}

            data_6d3c:
/*0x6d3c*/  .word 0x20001548
            data_6d40:
/*0x6d40*/  .word 0x20000060
            data_6d44:
/*0x6d44*/  .word 0x20000478
            data_6d48:
/*0x6d48*/  .word 0xffc00000

            jump_6d4c:
/*0x6d4c*/      push {r4, r5, r6, lr}
/*0x6d4e*/      ldr r4, [pc, #0x80] /* data_6dd0 */
/*0x6d50*/      ldrb r0, [r4, #3]
/*0x6d52*/      cmp r0, #5
/*0x6d54*/      beq jump_6d5e
/*0x6d56*/      ldr r1, [pc, #0x7c] /* data_6dd4 */
/*0x6d58*/      mov.w r0, #-1
/*0x6d5c*/      str r0, [r1]
            jump_6d5e:
/*0x6d5e*/      bl call_4b14
/*0x6d62*/      cbnz r0, jump_6dac
/*0x6d64*/      ldrb r0, [r4, #3]
/*0x6d66*/      cmp r0, #5
/*0x6d68*/      beq jump_6d86
/*0x6d6a*/      ldr r5, [pc, #0x6c] /* data_6dd8 */
/*0x6d6c*/      ldrb r1, [r5, #3]
/*0x6d6e*/      lsls r1, r1, #0x1e
/*0x6d70*/      bpl jump_6db8
/*0x6d72*/      cmp r0, #1
/*0x6d74*/      beq jump_6dcc
/*0x6d76*/      movs r6, #1
/*0x6d78*/      cmp r0, #2
/*0x6d7a*/      beq jump_6d8e
/*0x6d7c*/      cmp r0, #3
/*0x6d7e*/      beq jump_6dae
/*0x6d80*/      cmp r0, #4
/*0x6d82*/      bne jump_6dbc
/*0x6d84*/      b jump_6db2
            jump_6d86:
/*0x6d86*/      pop.w {r4, r5, r6, lr}
/*0x6d8a*/      b.w jump_6e78
            jump_6d8e:
/*0x6d8e*/      bl call_6cf8
/*0x6d92*/      ldr r0, [pc, #0x3c] /* data_6dd0 */
/*0x6d94*/      .short 0x1d80 /* adds r0, r0, #6 */ 
/*0x6d96*/      ldrb r0, [r0, #4]
/*0x6d98*/      cmp r0, #0x18
/*0x6d9a*/      beq jump_6dae
/*0x6d9c*/      ldr r0, [r5]
/*0x6d9e*/      bl call_4666
/*0x6da2*/      strh r0, [r4]
/*0x6da4*/      movs r0, #3
/*0x6da6*/      strb r0, [r4, #3]
/*0x6da8*/      ldr r0, [pc, #0x30] /* data_6ddc */
/*0x6daa*/      strb r6, [r0]
            jump_6dac:
/*0x6dac*/      b jump_6dcc
            jump_6dae:
/*0x6dae*/      strb r6, [r4, #3]
/*0x6db0*/      b jump_6dcc
            jump_6db2:
/*0x6db2*/      movs r0, #5
/*0x6db4*/      strb r0, [r4, #3]
/*0x6db6*/      b jump_6d86
            jump_6db8:
/*0x6db8*/      cmp r0, #3
/*0x6dba*/      beq jump_6dc0
            jump_6dbc:
/*0x6dbc*/      movs r0, #0
/*0x6dbe*/      pop {r4, r5, r6, pc}
            jump_6dc0:
/*0x6dc0*/      bl call_46fc
/*0x6dc4*/      cmp r0, #1
/*0x6dc6*/      bne jump_6dcc
/*0x6dc8*/      bl call_6f00
            jump_6dcc:
/*0x6dcc*/      movs r0, #1
/*0x6dce*/      pop {r4, r5, r6, pc}

            data_6dd0:
/*0x6dd0*/  .word 0x20001542
            data_6dd4:
/*0x6dd4*/  .word 0x20000064
            data_6dd8:
/*0x6dd8*/  .word 0x20000060
            data_6ddc:
/*0x6ddc*/  .word 0x20000054

            jump_6de0:
/*0x6de0*/      push {r3, r4, r5, lr}
/*0x6de2*/      ldr r1, [pc, #0x84] /* data_6e68 */
/*0x6de4*/      movs r0, #0
/*0x6de6*/      str r0, [sp]
/*0x6de8*/      ldrh r0, [r1]
/*0x6dea*/      ldr r2, [pc, #0x80] /* data_6e6c */
/*0x6dec*/      add.w r4, r2, r0, lsl #2
/*0x6df0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6df2*/      strh r0, [r1]
/*0x6df4*/      ldrh r0, [r4]
/*0x6df6*/      mov r1, sp
/*0x6df8*/      bl call_465c
/*0x6dfc*/      ldrb r0, [r4, #1]
/*0x6dfe*/      lsrs r0, r0, #5
/*0x6e00*/      cmp r0, #1
/*0x6e02*/      beq jump_6e0a
/*0x6e04*/      cmp r0, #2
/*0x6e06*/      bne jump_6e20
/*0x6e08*/      b jump_6e14
            jump_6e0a:
/*0x6e0a*/      ldrb.w r0, [sp, #3]
/*0x6e0e*/      orr r0, r0, #2
/*0x6e12*/      b jump_6e1c
            jump_6e14:
/*0x6e14*/      ldrb.w r0, [sp, #3]
/*0x6e18*/      bic r0, r0, #2
            jump_6e1c:
/*0x6e1c*/      strb.w r0, [sp, #3]
            jump_6e20:
/*0x6e20*/      ldrb.w r0, [sp, #1]
/*0x6e24*/      lsls r0, r0, #0x1f
/*0x6e26*/      beq jump_6e32
/*0x6e28*/      ldrb.w r0, [sp]
/*0x6e2c*/      bl call_4368
/*0x6e30*/      b jump_6e3a
            jump_6e32:
/*0x6e32*/      ldrb.w r1, [sp]
/*0x6e36*/      ldr r0, [pc, #0x38] /* data_6e70 */
/*0x6e38*/      ldrb r0, [r0, r1]
            jump_6e3a:
/*0x6e3a*/      strb.w r0, [sp, #2]
/*0x6e3e*/      ldrb.w r0, [sp, #3]
/*0x6e42*/      orr r0, r0, #5
/*0x6e46*/      strb.w r0, [sp, #3]
/*0x6e4a*/      ldr r0, [sp]
/*0x6e4c*/      bl call_440c
/*0x6e50*/      ldrh r0, [r4]
/*0x6e52*/      lsls r1, r0, #0x13
/*0x6e54*/      ldr r0, [pc, #0x1c] /* data_6e74 */
/*0x6e56*/      ldrh r1, [r4, #2]
/*0x6e58*/      bpl jump_6e5e
/*0x6e5a*/      lsls r1, r1, #1
/*0x6e5c*/      b jump_6e64
            jump_6e5e:
/*0x6e5e*/      mov.w r2, #0x1f4
/*0x6e62*/      muls r1, r2, r1
            jump_6e64:
/*0x6e64*/      str r1, [r0]
/*0x6e66*/      pop {r3, r4, r5, pc}

            data_6e68:
/*0x6e68*/  .word 0x20001548
            data_6e6c:
/*0x6e6c*/  .word 0x20000542
            data_6e70:
/*0x6e70*/  .word 0x20000114
            data_6e74:
/*0x6e74*/  .word 0x20000064

            jump_6e78:
/*0x6e78*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6e7c*/      ldr r5, [pc, #0x70] /* data_6ef0 */
/*0x6e7e*/      movs r7, #1
/*0x6e80*/      ldrh r0, [r5]
/*0x6e82*/      cmp.w r0, #0x400
/*0x6e86*/      blo jump_6e8e
/*0x6e88*/      subs r0, r5, #6
/*0x6e8a*/      strb r7, [r0, #3]
/*0x6e8c*/      b jump_6e9c
            jump_6e8e:
/*0x6e8e*/      ldr r6, [pc, #0x64] /* data_6ef4 */
/*0x6e90*/      ldrb r1, [r6, #1]
/*0x6e92*/      lsls r1, r1, #0x1f
/*0x6e94*/      beq jump_6ea2
/*0x6e96*/      ldrb r1, [r6]
/*0x6e98*/      cmp r1, #0xc0
/*0x6e9a*/      bhs jump_6ea2
            jump_6e9c:
/*0x6e9c*/      movs r0, #1
            jump_6e9e:
/*0x6e9e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6ea2:
/*0x6ea2*/      ldr r1, [pc, #0x54] /* data_6ef8 */
/*0x6ea4*/      add.w r4, r1, r0, lsl #2
/*0x6ea8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6eaa*/      strh r0, [r5]
/*0x6eac*/      ldr r0, [r6]
/*0x6eae*/      bl call_4666
/*0x6eb2*/      strh r0, [r4]
/*0x6eb4*/      ldrb r1, [r6, #3]
/*0x6eb6*/      lsls r1, r1, #0x1e
/*0x6eb8*/      bpl jump_6ec0
/*0x6eba*/      add.w r0, r0, #0x3c00
/*0x6ebe*/      b jump_6ec4
            jump_6ec0:
/*0x6ec0*/      add.w r0, r0, #0x5c00
            jump_6ec4:
/*0x6ec4*/      strh r0, [r4]
/*0x6ec6*/      ldrh r0, [r5]
/*0x6ec8*/      ldr r1, [pc, #0x30] /* data_6efc */
/*0x6eca*/      cmp r0, #1
/*0x6ecc*/      bls jump_6ee4
/*0x6ece*/      ldrh r0, [r5, #2]
/*0x6ed0*/      .short 0x1ea4 /* subs r4, r4, #2 */ 
/*0x6ed2*/      cbz r0, jump_6edc
/*0x6ed4*/      strh r0, [r4]
/*0x6ed6*/      movs r0, #0
/*0x6ed8*/      strh r0, [r5, #2]
/*0x6eda*/      b jump_6ee4
            jump_6edc:
/*0x6edc*/      ldr r0, [r1]
/*0x6ede*/      mvns r0, r0
/*0x6ee0*/      lsrs r0, r0, #1
/*0x6ee2*/      strh r0, [r4]
            jump_6ee4:
/*0x6ee4*/      mov.w r0, #-1
/*0x6ee8*/      str r0, [r1]
/*0x6eea*/      strb r7, [r5, #5]
/*0x6eec*/      movs r0, #0
/*0x6eee*/      b jump_6e9e

            data_6ef0:
/*0x6ef0*/  .word 0x20001548
            data_6ef4:
/*0x6ef4*/  .word 0x20000060
            data_6ef8:
/*0x6ef8*/  .word 0x20000542
            data_6efc:
/*0x6efc*/  .word 0x20000064


            .thumb_func
            call_6f00:
/*0x6f00*/      push {r4, lr}
/*0x6f02*/      mov.w r1, #0x1000
/*0x6f06*/      ldr r0, [pc, #0x18] /* data_6f20 */
/*0x6f08*/      bl mem_zero /* (dest, size) */
/*0x6f0c*/      ldr r0, [pc, #0x14] /* data_6f24 */
/*0x6f0e*/      movs r1, #0
/*0x6f10*/      strh r1, [r0]
/*0x6f12*/      strh r1, [r0, #2]
/*0x6f14*/      ldr r1, [pc, #0xc] /* data_6f24 */
/*0x6f16*/      movs r0, #4
/*0x6f18*/      .short 0x1f89 /* subs r1, r1, #6 */ 
/*0x6f1a*/      strb r0, [r1, #3]
/*0x6f1c*/      pop {r4, pc}

/*0x6f1e*/  .byte 0x00
/*0x6f1f*/  .byte 0x00

            data_6f20:
/*0x6f20*/  .word 0x20000542
            data_6f24:
/*0x6f24*/  .word 0x20001548


            .thumb_func
            call_6f28:
/*0x6f28*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6f2c*/      ldr r4, [pc, #0xa0] /* data_6fd0 */
/*0x6f2e*/      ldr r5, [pc, #0xa4] /* data_6fd4 */
/*0x6f30*/      ldr.w r8, [pc, #0xa4] /* data_6fd8 */
/*0x6f34*/      ldr r7, [pc, #0xa4] /* data_6fdc */
/*0x6f36*/      movs r6, #4
            jump_6f38:
/*0x6f38*/      ldrd r0, r1, [r5]
/*0x6f3c*/      str r1, [r0, #0x28]
/*0x6f3e*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x6f40*/      uxtb r6, r6
/*0x6f42*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x6f44*/      nop 
/*0x6f46*/      nop 
/*0x6f48*/      movs r0, #0xff
/*0x6f4a*/      ldr r1, [r7, #0x1c]
/*0x6f4c*/      lsls r1, r1, #0x16
/*0x6f4e*/      bmi jump_6f52
/*0x6f50*/      movs r0, #0xfe
            jump_6f52:
/*0x6f52*/      ldr.w r2, [r8, #0x1c]
/*0x6f56*/      mov r1, r8
/*0x6f58*/      lsls r2, r2, #0x1a
/*0x6f5a*/      bmi jump_6f60
/*0x6f5c*/      bic r0, r0, #2
            jump_6f60:
/*0x6f60*/      ldr r2, [r1, #0x1c]
/*0x6f62*/      lsls r2, r2, #0x19
/*0x6f64*/      bmi jump_6f6a
/*0x6f66*/      bic r0, r0, #4
            jump_6f6a:
/*0x6f6a*/      ldr r1, [r1, #0x1c]
/*0x6f6c*/      lsls r1, r1, #0x18
/*0x6f6e*/      bmi jump_6f74
/*0x6f70*/      bic r0, r0, #8
            jump_6f74:
/*0x6f74*/      ldr r1, [r7, #0x1c]
/*0x6f76*/      lsls r1, r1, #0x14
/*0x6f78*/      bmi jump_6f7e
/*0x6f7a*/      bic r0, r0, #0x10
            jump_6f7e:
/*0x6f7e*/      ldr r1, [r7, #0x1c]
/*0x6f80*/      lsls r1, r1, #0x12
/*0x6f82*/      bmi jump_6f88
/*0x6f84*/      bic r0, r0, #0x20
            jump_6f88:
/*0x6f88*/      ldr r1, [r7, #0x1c]
/*0x6f8a*/      lsls r1, r1, #0x11
/*0x6f8c*/      bmi jump_6f92
/*0x6f8e*/      bic r0, r0, #0x40
            jump_6f92:
/*0x6f92*/      ldr r1, [r7, #0x1c]
/*0x6f94*/      lsls r1, r1, #0x10
/*0x6f96*/      bmi jump_6f9c
/*0x6f98*/      bic r0, r0, #0x80
            jump_6f9c:
/*0x6f9c*/      ldrd r1, r2, [r5]
/*0x6fa0*/      str r2, [r1, #0x24]
/*0x6fa2*/      ldrb r1, [r4, #1]
/*0x6fa4*/      cmp r1, r0
/*0x6fa6*/      beq jump_6fae
/*0x6fa8*/      strb r0, [r4, #1]
/*0x6faa*/      movs r0, #3
/*0x6fac*/      b jump_6fba
            jump_6fae:
/*0x6fae*/      ldrb r0, [r4]
/*0x6fb0*/      cbz r0, jump_6fbc
/*0x6fb2*/      cmp r0, #1
/*0x6fb4*/      bne jump_6fb8
/*0x6fb6*/      strb r1, [r4, #2]
            jump_6fb8:
/*0x6fb8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_6fba:
/*0x6fba*/      strb r0, [r4]
            jump_6fbc:
/*0x6fbc*/      cmp r6, #0
/*0x6fbe*/      beq jump_6fca
/*0x6fc0*/      movs r0, #5
/*0x6fc2*/      bl spin_wait /* (time) */
/*0x6fc6*/      subs r5, #8
/*0x6fc8*/      b jump_6f38
            jump_6fca:
/*0x6fca*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x6fce*/  .byte 0x00
/*0x6fcf*/  .byte 0x00

            data_6fd0:
/*0x6fd0*/  .word 0x20000240
            data_6fd4:
/*0x6fd4*/  .word data_7a80
            data_6fd8:
/*0x6fd8*/  .word 0x400b0000
            data_6fdc:
/*0x6fdc*/  .word 0x400b4000

            jump_6fe0:
/*0x6fe0*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x6fe2*/      ldr r0, [pc, #0x44] /* data_7028 */
/*0x6fe4*/      ldr r0, [r0]
/*0x6fe6*/      ldr r1, [pc, #0x44] /* data_702c */
/*0x6fe8*/      ldr r6, [pc, #0x44] /* data_7030 */
/*0x6fea*/      udiv r4, r0, r1
/*0x6fee*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6ff0*/      strh.w r4, [sp]
/*0x6ff4*/      movs r5, #0
/*0x6ff6*/      strh.w r5, [sp, #2]
/*0x6ffa*/      mov r1, sp
/*0x6ffc*/      mov r0, r6
/*0x6ffe*/      bl call_42ec
/*0x7002*/      strb.w r5, [sp]
/*0x7006*/      movs r0, #7
/*0x7008*/      strh.w r0, [sp, #2]
/*0x700c*/      movs r0, #1
/*0x700e*/      strb.w r0, [sp, #4]
/*0x7012*/      strb.w r5, [sp, #5]
/*0x7016*/      lsrs r0, r4, #1
/*0x7018*/      strh.w r0, [sp, #6]
/*0x701c*/      mov r1, sp
/*0x701e*/      mov r0, r6
/*0x7020*/      bl call_4294
/*0x7024*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x7026*/  .byte 0x00
/*0x7027*/  .byte 0x00

            data_7028:
/*0x7028*/  .word 0x2000000c
            data_702c:
/*0x702c*/  .word 0x00dbba00
            data_7030:
/*0x7030*/  .word 0x4006f000


            .thumb_func
            call_7034:
/*0x7034*/      push {r4, lr}
/*0x7036*/      ldr r1, [pc, #0x28] /* data_7060 */
/*0x7038*/      mov.w r4, #0x8000
/*0x703c*/      str r4, [r1, #0x28]
/*0x703e*/      nop 
/*0x7040*/      nop 
/*0x7042*/      str r4, [r1, #0x24]
/*0x7044*/      mov.w r2, #0x4000
/*0x7048*/      b jump_7054
            jump_704a:
/*0x704a*/      str r2, [r1, #0x28]
/*0x704c*/      nop 
/*0x704e*/      nop 
/*0x7050*/      str r2, [r1, #0x24]
/*0x7052*/      nop 
            jump_7054:
/*0x7054*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7056*/      uxtb r0, r0
/*0x7058*/      bhs jump_704a
/*0x705a*/      str r4, [r1, #0x28]
/*0x705c*/      pop {r4, pc}

/*0x705e*/  .byte 0x00
/*0x705f*/  .byte 0x00

            data_7060:
/*0x7060*/  .word 0x400b0000


            .thumb_func
            call_7064:
/*0x7064*/      push {r4, r5, r6, r7, lr}
/*0x7066*/      movs r2, #4
/*0x7068*/      ldr r3, [pc, #0x24] /* data_7090 */
/*0x706a*/      lsls r4, r2, #0xc
/*0x706c*/      ldr r5, [pc, #0x24] /* data_7094 */
/*0x706e*/      movw r6, #0xffff
/*0x7072*/      b jump_7088
            jump_7074:
/*0x7074*/      nop 
/*0x7076*/      str r4, [r5, #0x28]
/*0x7078*/      lsls r7, r0, #0x10
/*0x707a*/      bpl jump_7080
/*0x707c*/      str r2, [r3, #0x24]
/*0x707e*/      b jump_7082
            jump_7080:
/*0x7080*/      str r2, [r3, #0x28]
            jump_7082:
/*0x7082*/      str r4, [r5, #0x24]
/*0x7084*/      and.w r0, r6, r0, lsl #1
            jump_7088:
/*0x7088*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x708a*/      uxtb r1, r1
/*0x708c*/      bhs jump_7074
/*0x708e*/      pop {r4, r5, r6, r7, pc}

            data_7090:
/*0x7090*/  .word 0x400b4000
            data_7094:
/*0x7094*/  .word 0x400b0000


            .thumb_func
            call_7098:
/*0x7098*/      push {r4, r5, r6, lr}
/*0x709a*/      mov r5, r1
/*0x709c*/      ldr r2, [pc, #0x98] /* data_7138 */
/*0x709e*/      add.w r1, r0, r0, lsl #1
/*0x70a2*/      add.w r4, r2, r1, lsl #3
/*0x70a6*/      movs r6, #1
/*0x70a8*/      ldr r2, [r4]
/*0x70aa*/      str r2, [r5]
/*0x70ac*/      ldr r2, [pc, #0x8c] /* data_713c */
/*0x70ae*/      add.w r1, r2, r1, lsl #2
/*0x70b2*/      .short 0x1c89 /* adds r1, r1, #2 */ 
/*0x70b4*/      str r1, [r5, #0xc]
/*0x70b6*/      ldr r1, [r4, #4]
/*0x70b8*/      str r1, [r5, #0x10]
/*0x70ba*/      ldr r1, [r4, #4]
/*0x70bc*/      str r1, [r5, #0x28]
/*0x70be*/      sub.w r1, r2, #0x150
/*0x70c2*/      add.w r0, r1, r0, lsl #8
/*0x70c6*/      str r0, [r5, #0x2c]
/*0x70c8*/      ldrb r0, [r4, #0x13]
/*0x70ca*/      movs r2, #6
/*0x70cc*/      lsl.w r1, r6, r0
/*0x70d0*/      ldrb r0, [r4, #0x12]
/*0x70d2*/      bl call_366c
/*0x70d6*/      ldrb r0, [r4, #0x15]
/*0x70d8*/      movs r2, #6
/*0x70da*/      lsl.w r1, r6, r0
/*0x70de*/      ldrb r0, [r4, #0x14]
/*0x70e0*/      bl call_366c
/*0x70e4*/      mov r1, r5
/*0x70e6*/      ldr r0, [r4, #4]
/*0x70e8*/      bl call_633c
/*0x70ec*/      movs r1, #1
/*0x70ee*/      ldr r0, [r4, #4]
/*0x70f0*/      bl call_63c0
/*0x70f4*/      movs r1, #1
/*0x70f6*/      ldr r0, [r4, #4]
/*0x70f8*/      bl call_6398
/*0x70fc*/      ldrb r0, [r4, #0x10]
/*0x70fe*/      add.w r1, r5, #0xc
/*0x7102*/      bl call_5598
/*0x7106*/      ldrb r0, [r4, #0x10]
/*0x7108*/      movs r2, #1
/*0x710a*/      movs r1, #9
/*0x710c*/      bl call_5624
/*0x7110*/      ldrb r0, [r4, #0x11]
/*0x7112*/      add.w r1, r5, #0x28
/*0x7116*/      bl call_5598
/*0x711a*/      ldrb r0, [r4, #0x11]
/*0x711c*/      movs r1, #1
/*0x711e*/      bl call_55c8
/*0x7122*/      movs r1, #1
/*0x7124*/      ldr r0, [r4, #4]
/*0x7126*/      bl call_63ac
/*0x712a*/      ldrb r0, [r4, #0x11]
/*0x712c*/      pop.w {r4, r5, r6, lr}
/*0x7130*/      movs r2, #1
/*0x7132*/      movs r1, #9
/*0x7134*/      b.w call_5624

            data_7138:
/*0x7138*/  .word data_7e80
            data_713c:
/*0x713c*/  .word 0x200016a4


            .thumb_func
            loc_7140:
/*0x7140*/      movs r1, #1
/*0x7142*/      lsls r1, r0
/*0x7144*/      ldr r0, [pc, #8] /* data_7150 */
/*0x7146*/      ldrb r2, [r0, #6]
/*0x7148*/      orrs r1, r2
/*0x714a*/      strb r1, [r0, #6]
/*0x714c*/      bx lr

/*0x714e*/  .byte 0x00
/*0x714f*/  .byte 0x00

            data_7150:
/*0x7150*/  .word 0x20000028


            .thumb_func
            call_7154:
/*0x7154*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7158*/      ldr r0, [pc, #0xdc] /* data_7238 */
/*0x715a*/      ldrb r1, [r0]
/*0x715c*/      movs r4, #0
/*0x715e*/      sub.w r5, r0, #0xa
/*0x7162*/      cmp r1, #1
/*0x7164*/      bne jump_7172
/*0x7166*/      strb r4, [r0]
/*0x7168*/      ldrb r0, [r5, #0x10]
/*0x716a*/      and r0, r0, #7
/*0x716e*/      bl call_5544
            jump_7172:
/*0x7172*/      ldr r6, [pc, #0xc8] /* data_723c */
/*0x7174*/      ldr r7, [pc, #0xc8] /* data_7240 */
/*0x7176*/      ldrb r0, [r6]
/*0x7178*/      cbz r0, jump_7186
/*0x717a*/      cmp r0, #2
/*0x717c*/      beq jump_71b0
/*0x717e*/      cmp r0, #4
/*0x7180*/      beq jump_7186
/*0x7182*/      cmp r0, #5
/*0x7184*/      bne jump_71c2
            jump_7186:
/*0x7186*/      ldrb r0, [r5, #6]
/*0x7188*/      lsls r0, r0, #0x1b
/*0x718a*/      bpl jump_71c2
/*0x718c*/      movs r0, #1
/*0x718e*/      strb r0, [r6]
/*0x7190*/      movs r2, #0x40
/*0x7192*/      ldr r1, [pc, #0xb0] /* data_7244 */
/*0x7194*/      movs r0, #4
/*0x7196*/      bl call_67b0
/*0x719a*/      ldr r2, [pc, #0xa8] /* data_7244 */
/*0x719c*/      rsb.w r1, r0, #0x40
/*0x71a0*/      add r0, r2
/*0x71a2*/      bl mem_zero /* (dest, size) */
/*0x71a6*/      ldrb r0, [r5, #6]
/*0x71a8*/      bic r0, r0, #0x10
/*0x71ac*/      strb r0, [r5, #6]
/*0x71ae*/      b jump_71c2
            jump_71b0:
/*0x71b0*/      ldr r0, [r7, #0x50]
/*0x71b2*/      lsls r0, r0, #0x1e
/*0x71b4*/      bpl jump_71c2
/*0x71b6*/      movs r2, #0x40
/*0x71b8*/      ldr r1, [pc, #0x88] /* data_7244 */
/*0x71ba*/      movs r0, #3
/*0x71bc*/      bl call_6810
/*0x71c0*/      strb r4, [r6]
            jump_71c2:
/*0x71c2*/      ldr r0, [r7, #0x28]
/*0x71c4*/      lsls r0, r0, #0x1e
/*0x71c6*/      bpl jump_71f8
/*0x71c8*/      ldrb r0, [r5]
/*0x71ca*/      cbz r0, jump_71d0
/*0x71cc*/      strb r4, [r5]
/*0x71ce*/      b jump_71ec
            jump_71d0:
/*0x71d0*/      ldr r1, [pc, #0x74] /* data_7248 */
/*0x71d2*/      ldr r0, [r1]
/*0x71d4*/      cbnz r0, jump_71f8
/*0x71d6*/      add.w r0, r1, #0xc
/*0x71da*/      ldr r0, [r0]
/*0x71dc*/      cbz r0, jump_71f8
/*0x71de*/      mov.w r2, #0xfa0
/*0x71e2*/      muls r0, r2, r0
/*0x71e4*/      asrs r2, r2, #3
/*0x71e6*/      udiv r0, r0, r2
/*0x71ea*/      str r0, [r1]
            jump_71ec:
/*0x71ec*/      ldr r1, [pc, #0x48] /* data_7238 */
/*0x71ee*/      movs r2, #8
/*0x71f0*/      adds r1, #0x12
/*0x71f2*/      movs r0, #1
/*0x71f4*/      bl call_6810
            jump_71f8:
/*0x71f8*/      ldr r0, [r7, #0x3c]
/*0x71fa*/      lsls r0, r0, #0x1e
/*0x71fc*/      bpl jump_7232
/*0x71fe*/      ldrb r0, [r5, #2]
/*0x7200*/      cbz r0, jump_720c
/*0x7202*/      ldr r1, [pc, #0x34] /* data_7238 */
/*0x7204*/      movs r2, #5
/*0x7206*/      strb r4, [r5, #2]
/*0x7208*/      adds r1, #0xa
/*0x720a*/      b jump_7228
            jump_720c:
/*0x720c*/      ldrb r0, [r5, #1]
/*0x720e*/      cbz r0, jump_721a
/*0x7210*/      ldr r1, [pc, #0x24] /* data_7238 */
/*0x7212*/      movs r2, #2
/*0x7214*/      strb r4, [r5, #1]
/*0x7216*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x7218*/      b jump_7228
            jump_721a:
/*0x721a*/      ldrb r0, [r5, #3]
/*0x721c*/      cmp r0, #0
/*0x721e*/      beq jump_7232
/*0x7220*/      ldr r1, [pc, #0x24] /* data_7248 */
/*0x7222*/      movs r2, #0x1f
/*0x7224*/      strb r4, [r5, #3]
/*0x7226*/      adds r1, #0x18
            jump_7228:
/*0x7228*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x722c*/      movs r0, #2
/*0x722e*/      b.w call_6810
            jump_7232:
/*0x7232*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7236*/  .byte 0x00
/*0x7237*/  .byte 0x00

            data_7238:
/*0x7238*/  .word 0x20000032
            data_723c:
/*0x723c*/  .word 0x2000004c
            data_7240:
/*0x7240*/  .word 0x400a8000
            data_7244:
/*0x7244*/  .word 0x20000414
            data_7248:
/*0x7248*/  .word 0x200003a0


            .thumb_func
            loc_724c:
/*0x724c*/      push {r4, r5, r6, r7, lr}
/*0x724e*/      ldrh r1, [r0]
/*0x7250*/      mov.w r6, #0x100
/*0x7254*/      movw r5, #0x921
/*0x7258*/      lsls r7, r6, #1
/*0x725a*/      movs r3, #1
/*0x725c*/      ldr r4, [pc, #0xd4] /* data_7334 */
/*0x725e*/      subw r2, r1, #0x921
/*0x7262*/      cmp r1, r5
/*0x7264*/      beq jump_72e0
/*0x7266*/      bgt jump_7284
/*0x7268*/      adds.w r1, r2, #0x780
/*0x726c*/      beq jump_7296
/*0x726e*/      cmp r1, r6
/*0x7270*/      beq jump_72d4
/*0x7272*/      cmp r1, r7
/*0x7274*/      bne jump_7302
/*0x7276*/      ldrh r1, [r0, #4]
/*0x7278*/      cmp r1, #0
/*0x727a*/      bne jump_7302
/*0x727c*/      ldr r1, [pc, #0xb8] /* data_7338 */
/*0x727e*/      strd r1, r3, [r0, #0x1c]
/*0x7282*/      b jump_732c
            jump_7284:
/*0x7284*/      movs r5, #0
/*0x7286*/      cmp r2, r6
/*0x7288*/      beq jump_7306
/*0x728a*/      cmp r2, r7
/*0x728c*/      bne jump_7302
/*0x728e*/      ldrh r2, [r0, #4]
/*0x7290*/      ldrb r1, [r0, #2]
/*0x7292*/      cbz r2, jump_7304
/*0x7294*/      b jump_732a
            jump_7296:
/*0x7296*/      ldrb r5, [r0, #3]
/*0x7298*/      ldrb r2, [r0, #2]
/*0x729a*/      ldrh r4, [r0, #6]
/*0x729c*/      ldrh r1, [r0, #4]
/*0x729e*/      cmp r5, #1
/*0x72a0*/      bne jump_7302
/*0x72a2*/      cbz r1, jump_72be
/*0x72a4*/      cmp r1, #1
/*0x72a6*/      beq jump_7302
/*0x72a8*/      cmp r1, #2
/*0x72aa*/      bne jump_7302
/*0x72ac*/      cmp r2, #1
/*0x72ae*/      beq jump_72c4
/*0x72b0*/      cmp r2, #2
/*0x72b2*/      beq jump_72ce
/*0x72b4*/      cmp r2, #4
/*0x72b6*/      bne jump_7302
/*0x72b8*/      ldr r1, [pc, #0x78] /* data_7334 */
/*0x72ba*/      adds r1, #0xc
/*0x72bc*/      b jump_72c8
            jump_72be:
/*0x72be*/      ldr r1, [pc, #0x78] /* data_7338 */
/*0x72c0*/      adds r1, #0x18
/*0x72c2*/      b jump_72c8
            jump_72c4:
/*0x72c4*/      ldr r1, [pc, #0x70] /* data_7338 */
/*0x72c6*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_72c8:
/*0x72c8*/      strd r1, r4, [r0, #0x1c]
/*0x72cc*/      b jump_732c
            jump_72ce:
/*0x72ce*/      ldr r1, [pc, #0x68] /* data_7338 */
/*0x72d0*/      adds r1, #0x10
/*0x72d2*/      b jump_72c8
            jump_72d4:
/*0x72d4*/      ldrh r1, [r0, #4]
/*0x72d6*/      cmp r1, #0
/*0x72d8*/      bne jump_7302
/*0x72da*/      strd r4, r3, [r0, #0x1c]
/*0x72de*/      b jump_732c
            jump_72e0:
/*0x72e0*/      ldrb r3, [r0, #3]
/*0x72e2*/      ldrh r2, [r0, #6]
/*0x72e4*/      ldrh r1, [r0, #4]
/*0x72e6*/      str r2, [r0, #0x20]
/*0x72e8*/      cmp r3, #2
/*0x72ea*/      bne jump_7302
/*0x72ec*/      cmp r1, #0
/*0x72ee*/      bne jump_7302
/*0x72f0*/      ldr r2, [pc, #0x44] /* data_7338 */
/*0x72f2*/      adds r2, #0xc
/*0x72f4*/      str r2, [r0, #0x1c]
/*0x72f6*/      ldr r2, [pc, #0x44] /* data_733c */
/*0x72f8*/      strd r2, r1, [r0, #0x28]
/*0x72fc*/      movs r1, #2
/*0x72fe*/      strb.w r1, [r0, #0x24]
            jump_7302:
/*0x7302*/      pop {r4, r5, r6, r7, pc}
            jump_7304:
/*0x7304*/      b jump_7324
            jump_7306:
/*0x7306*/      ldrh r2, [r0, #4]
/*0x7308*/      ldrb r1, [r0, #3]
/*0x730a*/      cmp r2, #0
/*0x730c*/      bne jump_7302
/*0x730e*/      mov.w r2, #0xfa0
/*0x7312*/      str r1, [r4]
/*0x7314*/      muls r1, r2, r1
/*0x7316*/      asrs r2, r2, #3
/*0x7318*/      udiv r1, r1, r2
/*0x731c*/      ldr r2, [pc, #0x14] /* data_7334 */
/*0x731e*/      subs r2, #0xc
/*0x7320*/      str r1, [r2]
/*0x7322*/      b jump_732a
            jump_7324:
/*0x7324*/      ldr r2, [pc, #0x10] /* data_7338 */
/*0x7326*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x7328*/      strb r1, [r2, #4]
            jump_732a:
/*0x732a*/      str r5, [r0, #0x20]
            jump_732c:
/*0x732c*/      strb.w r3, [r0, #0x24]
/*0x7330*/      b jump_7302

/*0x7332*/  .byte 0x00
/*0x7333*/  .byte 0x00

            data_7334:
/*0x7334*/  .word 0x200003ac
            data_7338:
/*0x7338*/  .word 0x2000002c
            data_733c:
/*0x733c*/  .word 0x00007341 /* possible pointer */


            .thumb_func
            orphan_7340:
/*0x7340*/      ldr r2, [pc, #4] /* data_7348 */
/*0x7342*/      movs r1, #1
/*0x7344*/      strb r1, [r2, r0]
/*0x7346*/      bx lr

            data_7348:
/*0x7348*/  .word 0x20000032


            .thumb_func
            loc_734c:
/*0x734c*/      ldrb r2, [r0, #3]
/*0x734e*/      ldrh r1, [r0, #4]
/*0x7350*/      movs r3, #1
/*0x7352*/      cmp r2, #0x21
/*0x7354*/      beq jump_7366
/*0x7356*/      cmp r2, #0x22
/*0x7358*/      bne jump_739e
/*0x735a*/      cbz r1, jump_7388
/*0x735c*/      cmp r1, #1
/*0x735e*/      beq jump_7390
/*0x7360*/      cmp r1, #2
/*0x7362*/      bne jump_739a
/*0x7364*/      b jump_73a0
            jump_7366:
/*0x7366*/      cbz r1, jump_7372
/*0x7368*/      cmp r1, #1
/*0x736a*/      beq jump_7378
/*0x736c*/      cmp r1, #2
/*0x736e*/      bne jump_737e
/*0x7370*/      b jump_7382
            jump_7372:
/*0x7372*/      ldr r1, [r0, #0xc]
/*0x7374*/      adds r1, #0x12
/*0x7376*/      b jump_737c
            jump_7378:
/*0x7378*/      ldr r1, [r0, #0xc]
/*0x737a*/      adds r1, #0x2b
            jump_737c:
/*0x737c*/      str r1, [r0, #0x1c]
            jump_737e:
/*0x737e*/      movs r1, #9
/*0x7380*/      b jump_7398
            jump_7382:
/*0x7382*/      ldr r1, [r0, #0xc]
/*0x7384*/      adds r1, #0x4b
/*0x7386*/      b jump_737c
            jump_7388:
/*0x7388*/      ldr r1, [pc, #0x20] /* data_73ac */
/*0x738a*/      str r1, [r0, #0x1c]
/*0x738c*/      movs r1, #0x40
/*0x738e*/      b jump_7398
            jump_7390:
/*0x7390*/      ldr r1, [pc, #0x18] /* data_73ac */
/*0x7392*/      subs r1, #0xac
/*0x7394*/      str r1, [r0, #0x1c]
/*0x7396*/      movs r1, #0x22
            jump_7398:
/*0x7398*/      str r1, [r0, #0x20]
            jump_739a:
/*0x739a*/      strb.w r3, [r0, #0x24]
            jump_739e:
/*0x739e*/      bx lr
            jump_73a0:
/*0x73a0*/      ldr r1, [pc, #8] /* data_73ac */
/*0x73a2*/      subs r1, #0x88
/*0x73a4*/      str r1, [r0, #0x1c]
/*0x73a6*/      movs r1, #0x86
/*0x73a8*/      b jump_7398

/*0x73aa*/  .byte 0x00
/*0x73ab*/  .byte 0x00

            data_73ac:
/*0x73ac*/  .word 0x00007d78 /* possible pointer */


            .thumb_func
            call_73b0:
/*0x73b0*/      push {r4, r5, r6, lr}
/*0x73b2*/      mov r4, r0
/*0x73b4*/      movs r0, #0
/*0x73b6*/      bl call_6708
/*0x73ba*/      mov r5, r0
/*0x73bc*/      ldr r0, [r4, #0x20]
/*0x73be*/      adds r1, r0, #1
/*0x73c0*/      beq jump_73f0
/*0x73c2*/      ldrb.w r1, [r4, #0x24]
/*0x73c6*/      cmp r1, #1
/*0x73c8*/      bne jump_73f0
/*0x73ca*/      cmp r0, r5
/*0x73cc*/      blo jump_73d4
/*0x73ce*/      subs r0, r0, r5
/*0x73d0*/      str r0, [r4, #0x20]
/*0x73d2*/      b jump_73e0
            jump_73d4:
/*0x73d4*/      mov r5, r0
/*0x73d6*/      movs r0, #0
/*0x73d8*/      str r0, [r4, #0x20]
/*0x73da*/      movs r0, #2
/*0x73dc*/      strb.w r0, [r4, #0x24]
            jump_73e0:
/*0x73e0*/      mov r2, r5
/*0x73e2*/      movs r0, #0
/*0x73e4*/      ldr r1, [r4, #0x1c]
/*0x73e6*/      bl call_6810
/*0x73ea*/      ldr r0, [r4, #0x1c]
/*0x73ec*/      add r0, r5
/*0x73ee*/      str r0, [r4, #0x1c]
            jump_73f0:
/*0x73f0*/      pop {r4, r5, r6, pc}

/*0x73f2*/  .byte 0x00
/*0x73f3*/  .byte 0x00


            .thumb_func
            call_73f4:
/*0x73f4*/      push {r4, lr}
/*0x73f6*/      mov r4, r0
/*0x73f8*/      movs r0, #0
/*0x73fa*/      strb.w r0, [r4, #0x24]
/*0x73fe*/      str r0, [r4, #0x20]
/*0x7400*/      ldrb r0, [r4]
/*0x7402*/      ands r0, r0, #0x60
/*0x7406*/      beq jump_740e
/*0x7408*/      cmp r0, #0x20
/*0x740a*/      bne jump_7420
/*0x740c*/      b jump_7416
            jump_740e:
/*0x740e*/      mov r0, r4
/*0x7410*/      bl call_7494
/*0x7414*/      b jump_7420
            jump_7416:
/*0x7416*/      ldr r0, [pc, #0x40] /* data_7458 */
/*0x7418*/      ldr r1, [r0, #0x14]
/*0x741a*/      cbz r1, jump_7420
/*0x741c*/      mov r0, r4
/*0x741e*/      blx r1
            jump_7420:
/*0x7420*/      ldrb.w r0, [r4, #0x24]
/*0x7424*/      cmp r0, #1
/*0x7426*/      beq jump_7436
/*0x7428*/      cmp r0, #2
/*0x742a*/      beq jump_744a
/*0x742c*/      pop.w {r4, lr}
/*0x7430*/      movs r0, #0
/*0x7432*/      b.w jump_67f0
            jump_7436:
/*0x7436*/      ldrh r0, [r4, #6]
/*0x7438*/      ldr r1, [r4, #0x20]
/*0x743a*/      cmp r1, r0
/*0x743c*/      ble jump_7440
/*0x743e*/      str r0, [r4, #0x20]
            jump_7440:
/*0x7440*/      mov r0, r4
/*0x7442*/      pop.w {r4, lr}
/*0x7446*/      b.w call_73b0
            jump_744a:
/*0x744a*/      movs r2, #0
/*0x744c*/      pop.w {r4, lr}
/*0x7450*/      mov r1, r2
/*0x7452*/      mov r0, r2
/*0x7454*/      b.w call_6810

            data_7458:
/*0x7458*/  .word data_7e58

            jump_745c:
/*0x745c*/      push {r4, lr}
/*0x745e*/      mov r4, r0
/*0x7460*/      movs r0, #0
/*0x7462*/      strb r0, [r4, #0x19]
/*0x7464*/      cbz r1, jump_747a
/*0x7466*/      cmp r1, #1
/*0x7468*/      beq jump_747e
/*0x746a*/      cmp r1, #2
/*0x746c*/      bne jump_7490
/*0x746e*/      ldrb r0, [r4, #4]
/*0x7470*/      and r0, r0, #0xf
/*0x7474*/      bl call_6716
/*0x7478*/      b jump_747e
            jump_747a:
/*0x747a*/      ldrb.w r0, [r4, #0x34]
            jump_747e:
/*0x747e*/      strb r0, [r4, #0x18]
/*0x7480*/      add.w r0, r4, #0x18
/*0x7484*/      str r0, [r4, #0x1c]
/*0x7486*/      movs r0, #2
/*0x7488*/      str r0, [r4, #0x20]
/*0x748a*/      movs r0, #1
/*0x748c*/      strb.w r0, [r4, #0x24]
            jump_7490:
/*0x7490*/      pop {r4, pc}

/*0x7492*/  .byte 0x00
/*0x7493*/  .byte 0x00


            .thumb_func
            call_7494:
/*0x7494*/      push {r4, r5, r6, lr}
/*0x7496*/      mov r4, r0
/*0x7498*/      ldrh r0, [r0]
/*0x749a*/      movs r5, #1
/*0x749c*/      cmp.w r0, #0x500
/*0x74a0*/      beq jump_7542
/*0x74a2*/      bgt jump_74e6
/*0x74a4*/      cmp.w r0, #0x100
/*0x74a8*/      beq jump_7534
/*0x74aa*/      bgt jump_74c4
/*0x74ac*/      cmp r0, #0x80
/*0x74ae*/      beq jump_752c
/*0x74b0*/      cmp r0, #0x81
/*0x74b2*/      beq jump_7530
/*0x74b4*/      cmp r0, #0x82
/*0x74b6*/      bne jump_7586
/*0x74b8*/      movs r1, #2
            jump_74ba:
/*0x74ba*/      mov r0, r4
/*0x74bc*/      pop.w {r4, r5, r6, lr}
/*0x74c0*/      b.w jump_745c
            jump_74c4:
/*0x74c4*/      cmp.w r0, #0x102
/*0x74c8*/      beq jump_7538
/*0x74ca*/      cmp.w r0, #0x300
/*0x74ce*/      beq jump_753c
/*0x74d0*/      sub.w r0, r0, #0x300
/*0x74d4*/      subs r0, #2
/*0x74d6*/      bne jump_7586
/*0x74d8*/      movs r2, #1
            jump_74da:
/*0x74da*/      movs r1, #2
            jump_74dc:
/*0x74dc*/      mov r0, r4
/*0x74de*/      pop.w {r4, r5, r6, lr}
/*0x74e2*/      b.w jump_75bc
            jump_74e6:
/*0x74e6*/      ldr r1, [pc, #0xcc] /* data_75b4 */
/*0x74e8*/      cmp.w r0, #0x900
/*0x74ec*/      beq jump_758c
/*0x74ee*/      bgt jump_7510
/*0x74f0*/      cmp.w r0, #0x680
/*0x74f4*/      beq jump_7550
/*0x74f6*/      sub.w r0, r0, #0x600
/*0x74fa*/      subs r0, #0x81
/*0x74fc*/      beq jump_7588
/*0x74fe*/      sub.w r0, r0, #0x100
/*0x7502*/      subs r0, #0xff
/*0x7504*/      bne jump_7586
/*0x7506*/      add.w r0, r4, #0x30
/*0x750a*/      strd r0, r5, [r4, #0x1c]
/*0x750e*/      b jump_7582
            jump_7510:
/*0x7510*/      sub.w r0, r0, #0xa00
/*0x7514*/      subs r0, #0x81
/*0x7516*/      beq jump_75ae
/*0x7518*/      cmp r0, #0x80
/*0x751a*/      bne jump_7586
/*0x751c*/      ldr r0, [r1, #0xc]
            jump_751e:
/*0x751e*/      cmp r0, #0
/*0x7520*/      beq jump_7586
/*0x7522*/      mov r1, r0
/*0x7524*/      mov r0, r4
/*0x7526*/      pop.w {r4, r5, r6, lr}
/*0x752a*/      bx r1
            jump_752c:
/*0x752c*/      movs r1, #0
/*0x752e*/      b jump_74ba
            jump_7530:
/*0x7530*/      movs r1, #1
/*0x7532*/      b jump_74ba
            jump_7534:
/*0x7534*/      movs r2, #0
/*0x7536*/      b jump_753e
            jump_7538:
/*0x7538*/      movs r2, #0
/*0x753a*/      b jump_74da
            jump_753c:
/*0x753c*/      movs r2, #1
            jump_753e:
/*0x753e*/      movs r1, #0
/*0x7540*/      b jump_74dc
            jump_7542:
/*0x7542*/      ldrb r0, [r4, #2]
/*0x7544*/      bl call_69ec
/*0x7548*/      strb.w r5, [r4, #0x24]
/*0x754c*/      movs r0, #5
/*0x754e*/      b jump_75a8
            jump_7550:
/*0x7550*/      ldrb r0, [r4, #3]
/*0x7552*/      cmp r0, #1
/*0x7554*/      beq jump_7576
/*0x7556*/      cmp r0, #2
/*0x7558*/      beq jump_757a
/*0x755a*/      cmp r0, #3
/*0x755c*/      bne jump_7586
/*0x755e*/      ldrb r0, [r4, #2]
/*0x7560*/      ldr r1, [r4, #0x14]
/*0x7562*/      cmp r1, r0
/*0x7564*/      bls jump_7586
/*0x7566*/      ldr r1, [r4, #0x10]
/*0x7568*/      ldr.w r0, [r1, r0, lsl #2]
/*0x756c*/      cmp r0, #0
/*0x756e*/      beq jump_7586
            jump_7570:
/*0x7570*/      str r0, [r4, #0x1c]
/*0x7572*/      ldrb r0, [r0]
/*0x7574*/      b jump_7580
            jump_7576:
/*0x7576*/      ldr r0, [r4, #8]
/*0x7578*/      b jump_7570
            jump_757a:
/*0x757a*/      ldr r0, [r4, #0xc]
/*0x757c*/      str r0, [r4, #0x1c]
/*0x757e*/      ldrh r0, [r0, #2]
            jump_7580:
/*0x7580*/      str r0, [r4, #0x20]
            jump_7582:
/*0x7582*/      strb.w r5, [r4, #0x24]
            jump_7586:
/*0x7586*/      pop {r4, r5, r6, pc}
            jump_7588:
/*0x7588*/      ldr r0, [r1, #8]
/*0x758a*/      b jump_751e
            jump_758c:
/*0x758c*/      ldrb r0, [r4, #2]
/*0x758e*/      strb.w r0, [r4, #0x30]
/*0x7592*/      strb.w r5, [r4, #0x24]
/*0x7596*/      movs r5, #1
            jump_7598:
/*0x7598*/      ldr r1, [pc, #0x1c] /* data_75b8 */
/*0x759a*/      sxtb r0, r5
/*0x759c*/      bl call_6750
/*0x75a0*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x75a2*/      cmp r5, #8
/*0x75a4*/      blo jump_7598
/*0x75a6*/      movs r0, #6
            jump_75a8:
/*0x75a8*/      strb.w r0, [r4, #0x32]
/*0x75ac*/      pop {r4, r5, r6, pc}
            jump_75ae:
/*0x75ae*/      ldr r0, [r1, #0x10]
/*0x75b0*/      b jump_751e

/*0x75b2*/  .byte 0x00
/*0x75b3*/  .byte 0x00

            data_75b4:
/*0x75b4*/  .word data_7e58
            data_75b8:
/*0x75b8*/  .word 0x200000d0

            jump_75bc:
/*0x75bc*/      push {r4, r5, r6, lr}
/*0x75be*/      mov r4, r0
/*0x75c0*/      movs r6, #1
/*0x75c2*/      cbz r1, jump_75de
/*0x75c4*/      cmp r1, #2
/*0x75c6*/      bne jump_75dc
/*0x75c8*/      ldrb r0, [r4, #4]
/*0x75ca*/      ands r5, r0, #0xf
/*0x75ce*/      beq jump_75d8
/*0x75d0*/      cbz r2, jump_75f4
/*0x75d2*/      mov r0, r5
/*0x75d4*/      bl call_67fc
            jump_75d8:
/*0x75d8*/      strb.w r6, [r4, #0x24]
            jump_75dc:
/*0x75dc*/      pop {r4, r5, r6, pc}
            jump_75de:
/*0x75de*/      ldrb r0, [r4, #2]
/*0x75e0*/      cmp r0, #1
/*0x75e2*/      bne jump_75dc
/*0x75e4*/      ldrb r0, [r4, #0x34]!
/*0x75e8*/      bfi r0, r2, #1, #1
/*0x75ec*/      strb r0, [r4], #-0x10
/*0x75f0*/      strb r6, [r4]
/*0x75f2*/      pop {r4, r5, r6, pc}
            jump_75f4:
/*0x75f4*/      ldr r0, [r4, #0x38]
/*0x75f6*/      cmp r0, #0
/*0x75f8*/      bne jump_75d8
/*0x75fa*/      mov r0, r5
/*0x75fc*/      bl call_66b0
/*0x7600*/      mov r0, r5
/*0x7602*/      bl call_66a0
/*0x7606*/      b jump_75d8

            .thumb_func
            call_7608:
/*0x7608*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x760a*/      bmi jump_7616
/*0x760c*/      ldr.w r3, [r0, r2, lsl #2]
/*0x7610*/      str.w r3, [r1, r2, lsl #2]
/*0x7614*/      b call_7608
            jump_7616:
/*0x7616*/      bx lr

            .thumb_func
            call_7618:
/*0x7618*/      ldr r1, [pc, #8] /* data_7624 */
/*0x761a*/      add.w r0, r0, r0, lsl #2
/*0x761e*/      add.w r0, r1, r0, lsl #2
/*0x7622*/      bx lr

            data_7624:
/*0x7624*/  .word 0x400a8014


            .thumb_func
            call_7628:
/*0x7628*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x762c*/      movs r7, #0
/*0x762e*/      mov.w r1, #0x8000
/*0x7632*/      mov r2, r7
/*0x7634*/      mov sl, r1
/*0x7636*/      movs r3, #1
/*0x7638*/      mov r0, r2
/*0x763a*/      bl call_398c
/*0x763e*/      ldr r0, [pc, #0x90] /* data_76d0 */
/*0x7640*/      bl call_6438
/*0x7644*/      ldr r5, [pc, #0x8c] /* data_76d4 */
/*0x7646*/      mov r4, r0
/*0x7648*/      movw r6, #0xeae0
/*0x764c*/      cmp r0, #1
/*0x764e*/      bne jump_765e
/*0x7650*/      ldr r0, [r5, #0x54]
/*0x7652*/      orrs r0, r6
/*0x7654*/      str r0, [r5, #0x54]
/*0x7656*/      str r6, [r5, #0x58]
/*0x7658*/      ldr r0, [r5, #0x50]
/*0x765a*/      orrs r0, r6
/*0x765c*/      str r0, [r5, #0x50]
            jump_765e:
/*0x765e*/      ldr.w r8, [pc, #0x70] /* data_76d0 */
/*0x7662*/      ldrb.w r0, [r8, #0x32]
/*0x7666*/      cmp r0, #3
/*0x7668*/      bne jump_76a8
/*0x766a*/      ldr.w sb, [pc, #0x6c] /* data_76d8 */
/*0x766e*/      ldr.w r0, [sb]
/*0x7672*/      tst.w r0, #0xc0
/*0x7676*/      beq jump_76a8
/*0x7678*/      movs r0, #1
/*0x767a*/      bl call_5014
/*0x767e*/      ldr r1, [pc, #0x5c] /* data_76dc */
/*0x7680*/      strb r7, [r1, #5]
/*0x7682*/      ldrb.w r0, [r8, #0x32]
/*0x7686*/      cmp r0, #3
/*0x7688*/      bne jump_76a8
/*0x768a*/      ldr.w r0, [sb]
/*0x768e*/      tst.w r0, #0xc0
/*0x7692*/      beq jump_76a8
/*0x7694*/      bl call_6a3c
/*0x7698*/      mov.w r0, #0x3e8
/*0x769c*/      bl spin_wait /* (time) */
/*0x76a0*/      str r6, [r5, #0x58]
/*0x76a2*/      movs r0, #0
/*0x76a4*/      bl call_56a4
            jump_76a8:
/*0x76a8*/      ldr r0, [r5, #0x58]
/*0x76aa*/      tst r0, r6
/*0x76ac*/      beq jump_76c0
/*0x76ae*/      cmp r4, #1
/*0x76b0*/      bne jump_76c0
/*0x76b2*/      ldr r0, [pc, #0x1c] /* data_76d0 */
/*0x76b4*/      bl call_65c4
/*0x76b8*/      cmp r0, #1
/*0x76ba*/      bne jump_76c0
/*0x76bc*/      bl call_65d4
            jump_76c0:
/*0x76c0*/      mov r2, r7
/*0x76c2*/      mov r1, sl
/*0x76c4*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x76c8*/      movs r3, #0
/*0x76ca*/      mov r0, r2
/*0x76cc*/      b.w call_398c

            data_76d0:
/*0x76d0*/  .word 0x200003d8
            data_76d4:
/*0x76d4*/  .word 0x40024000
            data_76d8:
/*0x76d8*/  .word 0x400a8000
            data_76dc:
/*0x76dc*/  .word 0x20000028

/*0x76e0*/  .byte 0x02
/*0x76e1*/  .byte 0xe0
/*0x76e2*/  .byte 0x08
/*0x76e3*/  .byte 0xc8
/*0x76e4*/  .byte 0x12
/*0x76e5*/  .byte 0x1f
/*0x76e6*/  .byte 0x08
/*0x76e7*/  .byte 0xc1
/*0x76e8*/  .byte 0x00
/*0x76e9*/  .byte 0x2a
/*0x76ea*/  .byte 0xfa
/*0x76eb*/  .byte 0xd1
/*0x76ec*/  .byte 0x70
/*0x76ed*/  .byte 0x47
/*0x76ee*/  .byte 0x70
/*0x76ef*/  .byte 0x47
/*0x76f0*/  .byte 0x00
/*0x76f1*/  .byte 0x20
/*0x76f2*/  .byte 0x01
/*0x76f3*/  .byte 0xe0
/*0x76f4*/  .byte 0x01
/*0x76f5*/  .byte 0xc1
/*0x76f6*/  .byte 0x12
/*0x76f7*/  .byte 0x1f
/*0x76f8*/  .byte 0x00
/*0x76f9*/  .byte 0x2a
/*0x76fa*/  .byte 0xfb
/*0x76fb*/  .byte 0xd1
/*0x76fc*/  .byte 0x70
/*0x76fd*/  .byte 0x47
/*0x76fe*/  .byte 0x00
/*0x76ff*/  .byte 0x00


            .thumb_func
            call_7700:
/*0x7700*/      push {r3, r4, r5, lr}
/*0x7702*/      movs r4, #0
/*0x7704*/      str r4, [sp]
/*0x7706*/      ldr r4, [pc, #0x20] /* data_7728 */
/*0x7708*/      ldr r5, [sp, #0x10]
/*0x770a*/      ldrb r2, [r4, r2]
/*0x770c*/      strb.w r2, [sp]
/*0x7710*/      ldrb r2, [r4, r3]
/*0x7712*/      strb.w r2, [sp, #1]
/*0x7716*/      ldrb r2, [r4, r5]
/*0x7718*/      mov r3, r1
/*0x771a*/      strb.w r2, [sp, #2]
/*0x771e*/      mov r2, r3
/*0x7720*/      mov r1, sp
/*0x7722*/      bl call_466c
/*0x7726*/      pop {r3, r4, r5, pc}

            data_7728:
/*0x7728*/  .word 0x20000214


            .thumb_func
            main:
/*0x772c*/      bl setup_intr_priority
/*0x7730*/      bl setup_afio_gpio
/*0x7734*/      bl call_51ec
/*0x7738*/      bl call_3c04
/*0x773c*/      bl call_6114
/*0x7740*/      bl call_5a48
/*0x7744*/      bl call_5654
/*0x7748*/      bl call_5c70
/*0x774c*/      bl call_4a3c
/*0x7750*/      movs r0, #0
/*0x7752*/      bl call_4318
/*0x7756*/      ldr r1, [pc, #0xbc] /* data_7814 */
/*0x7758*/      movs r0, #0
/*0x775a*/      str r0, [r1]
/*0x775c*/      bl call_5094
/*0x7760*/      bl call_50c4
/*0x7764*/      movs r0, #0
/*0x7766*/      bl call_5014
/*0x776a*/      movs r0, #0xa
/*0x776c*/      bl spin_wait /* (time) */
/*0x7770*/      movs r0, #1
/*0x7772*/      bl call_59bc
/*0x7776*/      bl call_4a48
/*0x777a*/      ldr r4, [pc, #0x9c] /* data_7818 */
/*0x777c*/      cbz r0, jump_7782
/*0x777e*/      movs r0, #1
/*0x7780*/      strh r0, [r4, #4]
            jump_7782:
/*0x7782*/      ldrh r0, [r4, #4]
/*0x7784*/      cbz r0, jump_77aa
/*0x7786*/      bl call_5dcc
/*0x778a*/      bl call_5684
/*0x778e*/      movs r0, #0
/*0x7790*/      bl call_59bc
            jump_7794:
/*0x7794*/      ldrh r0, [r4, #4]
/*0x7796*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7798*/      strh r0, [r4, #4]
/*0x779a*/      bl call_7824
/*0x779e*/      movs r0, #1
/*0x77a0*/      bl call_5734
/*0x77a4*/      bl call_6a3c
/*0x77a8*/      b jump_7794
            jump_77aa:
/*0x77aa*/      movs r0, #1
/*0x77ac*/      bl call_5014
/*0x77b0*/      bl call_65f0
/*0x77b4*/      ldr r6, [pc, #0x64] /* data_781c */
/*0x77b6*/      ldr r5, [pc, #0x68] /* data_7820 */
            jump_77b8:
/*0x77b8*/      bl call_6978
/*0x77bc*/      cmp r0, #1
/*0x77be*/      beq jump_77d0
/*0x77c0*/      cmp r0, #2
/*0x77c2*/      beq jump_77e4
/*0x77c4*/      cmp r0, #3
/*0x77c6*/      bne jump_780e
/*0x77c8*/      movs r0, #1
/*0x77ca*/      bl call_5014
/*0x77ce*/      b jump_780e
            jump_77d0:
/*0x77d0*/      movs r0, #0
/*0x77d2*/      bl call_5014
/*0x77d6*/      bl call_5dcc
/*0x77da*/      bl call_5684
/*0x77de*/      movs r0, #0
/*0x77e0*/      bl call_59bc
            jump_77e4:
/*0x77e4*/      ldrh r0, [r4, #4]
/*0x77e6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x77e8*/      lsls r0, r0, #0x10
/*0x77ea*/      lsrs r0, r0, #0x10
/*0x77ec*/      strh r0, [r4, #4]
/*0x77ee*/      bne jump_77fc
/*0x77f0*/      ldr r0, [r5]
/*0x77f2*/      cmp r0, r6
/*0x77f4*/      bls jump_77fc
/*0x77f6*/      ldr r0, [r5]
/*0x77f8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x77fa*/      str r0, [r5]
            jump_77fc:
/*0x77fc*/      bl handle_frame
/*0x7800*/      bl call_7824
/*0x7804*/      ldrb r0, [r4]
/*0x7806*/      cbnz r0, jump_780e
/*0x7808*/      movs r0, #1
/*0x780a*/      bl call_5734
            jump_780e:
/*0x780e*/      bl call_6a3c
/*0x7812*/      b jump_77b8

            data_7814:
/*0x7814*/  .word 0x20000060
            data_7818:
/*0x7818*/  .word 0x2000004c
            data_781c:
/*0x781c*/  .word 0x55aafaf0
            data_7820:
/*0x7820*/  .word 0x20003ffc


            .thumb_func
            call_7824:
/*0x7824*/      push {r4, r5, r6, lr}
/*0x7826*/      ldr r6, [pc, #0x98] /* data_78c0 */
/*0x7828*/      movs r4, #0
/*0x782a*/      ldrb r0, [r6, #3]
/*0x782c*/      cbz r0, jump_7842
/*0x782e*/      movs r0, #1
/*0x7830*/      bl call_4318
/*0x7834*/      cbz r0, jump_7842
/*0x7836*/      bl call_3bcc
/*0x783a*/      strb r4, [r6, #3]
/*0x783c*/      movs r0, #1
/*0x783e*/      bl call_5094
            jump_7842:
/*0x7842*/      ldr r5, [pc, #0x7c] /* data_78c0 */
/*0x7844*/      subs r5, #8
/*0x7846*/      ldrb r0, [r5, #1]
/*0x7848*/      cmp r0, #0x20
/*0x784a*/      blo jump_7854
/*0x784c*/      subs r0, #0x20
/*0x784e*/      strb r0, [r5, #1]
/*0x7850*/      movs r0, #1
/*0x7852*/      strb r0, [r5, #2]
            jump_7854:
/*0x7854*/      ldrb r0, [r6, #4]
/*0x7856*/      cbz r0, jump_7868
/*0x7858*/      bl call_46fc
/*0x785c*/      cmp r0, #1
/*0x785e*/      bne jump_7868
/*0x7860*/      ldrb r0, [r6, #4]
/*0x7862*/      bl call_4734
/*0x7866*/      strb r4, [r6, #4]
            jump_7868:
/*0x7868*/      bl call_5940
/*0x786c*/      bl call_5258
/*0x7870*/      bl call_61c4
/*0x7874*/      ldr r0, [pc, #0x4c] /* data_78c4 */
/*0x7876*/      ldrb r0, [r0, #2]
/*0x7878*/      cmp r0, #1
/*0x787a*/      beq jump_7884
/*0x787c*/      bl call_473c
/*0x7880*/      bl call_3ab4
            jump_7884:
/*0x7884*/      ldrb r0, [r5, #2]
/*0x7886*/      cbz r0, jump_788c
/*0x7888*/      bl call_47d4
            jump_788c:
/*0x788c*/      ldrb r0, [r6]
/*0x788e*/      cbz r0, jump_789a
/*0x7890*/      strb r4, [r6]
/*0x7892*/      bl call_4e98
/*0x7896*/      bl call_4ea4
            jump_789a:
/*0x789a*/      ldrb r0, [r6, #1]
/*0x789c*/      cbz r0, jump_78a4
/*0x789e*/      strb r4, [r6, #1]
/*0x78a0*/      bl call_5bec
            jump_78a4:
/*0x78a4*/      ldrb r0, [r5, #2]
/*0x78a6*/      cmp r0, #0
/*0x78a8*/      beq jump_78be
/*0x78aa*/      ldr r0, [pc, #0x14] /* data_78c0 */
/*0x78ac*/      ldrb r2, [r5, #1]
/*0x78ae*/      .short 0x1e80 /* subs r0, r0, #2 */ 
/*0x78b0*/      ldrb r1, [r0, #1]
/*0x78b2*/      add r1, r2
/*0x78b4*/      strb r1, [r0, #1]
/*0x78b6*/      ldrh r0, [r5, #6]
/*0x78b8*/      lsrs r0, r0, #1
/*0x78ba*/      strh r0, [r5, #6]
/*0x78bc*/      strb r4, [r5, #2]
            jump_78be:
/*0x78be*/      pop {r4, r5, r6, pc}

            data_78c0:
/*0x78c0*/  .word 0x20000054
            data_78c4:
/*0x78c4*/  .word 0x20001542

            data_78c8:
/*0x78c8*/  .byte 0x62
/*0x78c9*/  .byte 0xc0
/*0x78ca*/  .byte 0x63
/*0x78cb*/  .byte 0x00
            data_78cc:
/*0x78cc*/  .byte 0x20
/*0x78cd*/  .byte 0x79
/*0x78ce*/  .byte 0x00
/*0x78cf*/  .byte 0x00
/*0x78d0*/  .byte 0xc0
/*0x78d1*/  .byte 0x5c
/*0x78d2*/  .byte 0x14
/*0x78d3*/  .byte 0x00
/*0x78d4*/  .byte 0x34
/*0x78d5*/  .byte 0x79
/*0x78d6*/  .byte 0x00
/*0x78d7*/  .byte 0x00
/*0x78d8*/  .byte 0xee
/*0x78d9*/  .byte 0x3c
/*0x78da*/  .byte 0x1c
/*0x78db*/  .byte 0x00
            data_78dc:
/*0x78dc*/  .byte 0x0d
/*0x78dd*/  .byte 0x2b
/*0x78de*/  .byte 0x00
/*0x78df*/  .byte 0x15
/*0x78e0*/  .byte 0x2a
/*0x78e1*/  .byte 0x00
/*0x78e2*/  .byte 0x1d
/*0x78e3*/  .byte 0x2e
/*0x78e4*/  .byte 0x01
/*0x78e5*/  .byte 0x01
/*0x78e6*/  .byte 0x81
/*0x78e7*/  .byte 0x01
/*0x78e8*/  .byte 0x11
/*0x78e9*/  .byte 0x82
/*0x78ea*/  .byte 0x01
/*0x78eb*/  .byte 0x02
/*0x78ec*/  .byte 0x90
/*0x78ed*/  .byte 0x01
/*0x78ee*/  .byte 0x12
/*0x78ef*/  .byte 0x91
/*0x78f0*/  .byte 0x01
/*0x78f1*/  .byte 0x09
/*0x78f2*/  .byte 0x92
/*0x78f3*/  .byte 0x01
/*0x78f4*/  .byte 0x0b
/*0x78f5*/  .byte 0x93
/*0x78f6*/  .byte 0x01
/*0x78f7*/  .byte 0x0c
/*0x78f8*/  .byte 0xa0
/*0x78f9*/  .byte 0x01
/*0x78fa*/  .byte 0x14
/*0x78fb*/  .byte 0xa1
/*0x78fc*/  .byte 0x01
/*0x78fd*/  .byte 0x1c
/*0x78fe*/  .byte 0xa2
/*0x78ff*/  .byte 0x01
            data_7900:
/*0x7900*/  .byte 0x54
/*0x7901*/  .byte 0x46
/*0x7902*/  .byte 0x55
/*0x7903*/  .byte 0x47
/*0x7904*/  .byte 0x56
/*0x7905*/  .byte 0x48
/*0x7906*/  .byte 0x59
/*0x7907*/  .byte 0xc7
/*0x7908*/  .byte 0x5a
/*0x7909*/  .byte 0x52
/*0x790a*/  .byte 0x5b
/*0x790b*/  .byte 0xc7
/*0x790c*/  .byte 0x5c
/*0x790d*/  .byte 0x4c
/*0x790e*/  .byte 0x5d
/*0x790f*/  .byte 0x4d
/*0x7910*/  .byte 0x5e
/*0x7911*/  .byte 0x4e
/*0x7912*/  .byte 0x5f
/*0x7913*/  .byte 0x49
/*0x7914*/  .byte 0x60
/*0x7915*/  .byte 0x4a
/*0x7916*/  .byte 0x61
/*0x7917*/  .byte 0x4b
/*0x7918*/  .byte 0x62
/*0x7919*/  .byte 0x50
/*0x791a*/  .byte 0x63
/*0x791b*/  .byte 0x4f
/*0x791c*/  .byte 0xc0
/*0x791d*/  .byte 0x51
/*0x791e*/  .byte 0x00
/*0x791f*/  .byte 0x00
/*0x7920*/  .byte 0x62
/*0x7921*/  .byte 0x3c
/*0x7922*/  .byte 0x08
/*0x7923*/  .byte 0x00
/*0x7924*/  .byte 0x62
/*0x7925*/  .byte 0x5c
/*0x7926*/  .byte 0x08
/*0x7927*/  .byte 0x00
/*0x7928*/  .byte 0x62
/*0x7929*/  .byte 0x3c
/*0x792a*/  .byte 0x08
/*0x792b*/  .byte 0x00
/*0x792c*/  .byte 0x62
/*0x792d*/  .byte 0x5c
/*0x792e*/  .byte 0x50
/*0x792f*/  .byte 0x03
/*0x7930*/  .byte 0x00
/*0x7931*/  .byte 0xfc
/*0x7932*/  .byte 0x00
/*0x7933*/  .byte 0x00
/*0x7934*/  .byte 0xe6
/*0x7935*/  .byte 0x3c
/*0x7936*/  .byte 0x08
/*0x7937*/  .byte 0x00
/*0x7938*/  .byte 0x5e
/*0x7939*/  .byte 0x3c
/*0x793a*/  .byte 0x08
/*0x793b*/  .byte 0x00
/*0x793c*/  .byte 0x5e
/*0x793d*/  .byte 0x5c
/*0x793e*/  .byte 0x08
/*0x793f*/  .byte 0x00
/*0x7940*/  .byte 0x59
/*0x7941*/  .byte 0x3c
/*0x7942*/  .byte 0x08
/*0x7943*/  .byte 0x00
/*0x7944*/  .byte 0x59
/*0x7945*/  .byte 0x5c
/*0x7946*/  .byte 0x08
/*0x7947*/  .byte 0x00
/*0x7948*/  .byte 0xe6
/*0x7949*/  .byte 0x5c
/*0x794a*/  .byte 0x08
/*0x794b*/  .byte 0x00
/*0x794c*/  .byte 0x00
/*0x794d*/  .byte 0xfc
/*0x794e*/  .byte 0x00
/*0x794f*/  .byte 0x00
            data_7950:
/*0x7950*/  .byte 0xff
/*0x7951*/  .byte 0xff
/*0x7952*/  .byte 0xff
            data_7953:
/*0x7953*/  .byte 0x00
/*0x7954*/  .byte 0x01
/*0x7955*/  .byte 0x02
/*0x7956*/  .byte 0x03
/*0x7957*/  .byte 0xff
/*0x7958*/  .byte 0xff
/*0x7959*/  .byte 0xff
/*0x795a*/  .byte 0xff
/*0x795b*/  .byte 0x04
/*0x795c*/  .byte 0x04
/*0x795d*/  .byte 0x05
/*0x795e*/  .byte 0x05
/*0x795f*/  .byte 0x06
/*0x7960*/  .byte 0x06
/*0x7961*/  .byte 0x01
/*0x7962*/  .byte 0x01
/*0x7963*/  .byte 0x01
/*0x7964*/  .byte 0x01
/*0x7965*/  .byte 0x01
/*0x7966*/  .byte 0x01
/*0x7967*/  .byte 0x01
/*0x7968*/  .byte 0x03
/*0x7969*/  .byte 0x05
/*0x796a*/  .byte 0x07
/*0x796b*/  .byte 0x09
/*0x796c*/  .byte 0x0b
/*0x796d*/  .byte 0x01
/*0x796e*/  .byte 0x03
/*0x796f*/  .byte 0x05
/*0x7970*/  .byte 0x07
/*0x7971*/  .byte 0x09
/*0x7972*/  .byte 0x0b
/*0x7973*/  .byte 0xaa
/*0x7974*/  .byte 0x6e
/*0x7975*/  .byte 0x46
/*0x7976*/  .byte 0x28
/*0x7977*/  .byte 0x14
/*0x7978*/  .byte 0x0a
/*0x7979*/  .byte 0x01
/*0x797a*/  .byte 0x02
/*0x797b*/  .byte 0x03
/*0x797c*/  .byte 0x04
/*0x797d*/  .byte 0x06
/*0x797e*/  .byte 0x09
/*0x797f*/  .byte 0x10
/*0x7980*/  .byte 0x0b
/*0x7981*/  .byte 0x07
/*0x7982*/  .byte 0x04
/*0x7983*/  .byte 0x02
/*0x7984*/  .byte 0x01
/*0x7985*/  .byte 0x10
/*0x7986*/  .byte 0x0b
/*0x7987*/  .byte 0x07
/*0x7988*/  .byte 0x04
/*0x7989*/  .byte 0x02
/*0x798a*/  .byte 0x01
            data_798b:
/*0x798b*/  .byte 0x15
/*0x798c*/  .byte 0x0f
/*0x798d*/  .byte 0x0e
/*0x798e*/  .byte 0x08
/*0x798f*/  .byte 0x07
/*0x7990*/  .byte 0x00
/*0x7991*/  .byte 0xff
/*0x7992*/  .byte 0xff
/*0x7993*/  .byte 0x14
/*0x7994*/  .byte 0x10
/*0x7995*/  .byte 0x0d
/*0x7996*/  .byte 0x09
/*0x7997*/  .byte 0x06
/*0x7998*/  .byte 0x01
/*0x7999*/  .byte 0xff
/*0x799a*/  .byte 0xff
/*0x799b*/  .byte 0x13
/*0x799c*/  .byte 0x11
/*0x799d*/  .byte 0x0c
/*0x799e*/  .byte 0x0a
/*0x799f*/  .byte 0x05
/*0x79a0*/  .byte 0x02
/*0x79a1*/  .byte 0xff
/*0x79a2*/  .byte 0xff
/*0x79a3*/  .byte 0x12
/*0x79a4*/  .byte 0xff
/*0x79a5*/  .byte 0x0b
/*0x79a6*/  .byte 0xff
/*0x79a7*/  .byte 0x04
/*0x79a8*/  .byte 0x03
/*0x79a9*/  .byte 0xff
/*0x79aa*/  .byte 0xff
/*0x79ab*/  .byte 0x01
/*0x79ac*/  .byte 0x01
/*0x79ad*/  .byte 0x01
/*0x79ae*/  .byte 0x01
/*0x79af*/  .byte 0x01
/*0x79b0*/  .byte 0x01
/*0x79b1*/  .byte 0xff
/*0x79b2*/  .byte 0xff
/*0x79b3*/  .byte 0x02
/*0x79b4*/  .byte 0x02
/*0x79b5*/  .byte 0x02
/*0x79b6*/  .byte 0x02
/*0x79b7*/  .byte 0x02
/*0x79b8*/  .byte 0x02
/*0x79b9*/  .byte 0xff
/*0x79ba*/  .byte 0xff
/*0x79bb*/  .byte 0x03
/*0x79bc*/  .byte 0x03
/*0x79bd*/  .byte 0x03
/*0x79be*/  .byte 0x03
/*0x79bf*/  .byte 0x03
/*0x79c0*/  .byte 0x03
/*0x79c1*/  .byte 0xff
/*0x79c2*/  .byte 0xff
/*0x79c3*/  .byte 0x04
/*0x79c4*/  .byte 0xff
/*0x79c5*/  .byte 0x04
/*0x79c6*/  .byte 0xff
/*0x79c7*/  .byte 0x04
/*0x79c8*/  .byte 0x04
/*0x79c9*/  .byte 0xff
            data_79ca:
/*0x79ca*/  .byte 0xff
            data_79cb:
/*0x79cb*/  .byte 0x05
/*0x79cc*/  .byte 0x04
/*0x79cd*/  .byte 0x03
/*0x79ce*/  .byte 0x02
/*0x79cf*/  .byte 0x01
/*0x79d0*/  .byte 0x00
/*0x79d1*/  .byte 0xff
/*0x79d2*/  .byte 0xff
/*0x79d3*/  .byte 0x0d
/*0x79d4*/  .byte 0x0c
/*0x79d5*/  .byte 0x0b
/*0x79d6*/  .byte 0x0a
/*0x79d7*/  .byte 0x09
/*0x79d8*/  .byte 0x08
/*0x79d9*/  .byte 0xff
/*0x79da*/  .byte 0xff
/*0x79db*/  .byte 0x15
/*0x79dc*/  .byte 0x14
/*0x79dd*/  .byte 0x13
/*0x79de*/  .byte 0x12
/*0x79df*/  .byte 0x11
/*0x79e0*/  .byte 0x10
/*0x79e1*/  .byte 0xff
/*0x79e2*/  .byte 0xff
/*0x79e3*/  .byte 0x1d
/*0x79e4*/  .byte 0xff
/*0x79e5*/  .byte 0x1b
/*0x79e6*/  .byte 0xff
/*0x79e7*/  .byte 0x19
/*0x79e8*/  .byte 0x18
/*0x79e9*/  .byte 0xff
            data_79ea:
/*0x79ea*/  .byte 0xff
            data_79eb:
/*0x79eb*/  .byte 0x00
/*0x79ec*/  .byte 0x24
/*0x79ed*/  .byte 0x49
/*0x79ee*/  .byte 0x6d
/*0x79ef*/  .byte 0x92
/*0x79f0*/  .byte 0xb6
/*0x79f1*/  .byte 0xdb
/*0x79f2*/  .byte 0xff
/*0x79f3*/  .byte 0xaa
/*0x79f4*/  .byte 0x55
/*0x79f5*/  .byte 0x00
/*0x79f6*/  .byte 0x00
/*0x79f7*/  .byte 0x00
            data_79f8:
/*0x79f8*/  .byte 0x62
/*0x79f9*/  .byte 0x59
/*0x79fa*/  .byte 0x5c
/*0x79fb*/  .byte 0x5f
/*0x79fc*/  .byte 0x53
/*0x79fd*/  .byte 0xe8
/*0x79fe*/  .byte 0x00
/*0x79ff*/  .byte 0x00
/*0x7a00*/  .byte 0xc0
/*0x7a01*/  .byte 0x5a
/*0x7a02*/  .byte 0x5d
/*0x7a03*/  .byte 0x60
/*0x7a04*/  .byte 0x54
/*0x7a05*/  .byte 0xf5
/*0x7a06*/  .byte 0x00
/*0x7a07*/  .byte 0x00
/*0x7a08*/  .byte 0x63
/*0x7a09*/  .byte 0x5b
/*0x7a0a*/  .byte 0x5e
/*0x7a0b*/  .byte 0x61
/*0x7a0c*/  .byte 0x55
/*0x7a0d*/  .byte 0xf6
/*0x7a0e*/  .byte 0x00
/*0x7a0f*/  .byte 0x00
/*0x7a10*/  .byte 0x58
/*0x7a11*/  .byte 0x00
/*0x7a12*/  .byte 0x57
/*0x7a13*/  .byte 0x00
/*0x7a14*/  .byte 0x56
/*0x7a15*/  .byte 0xee
/*0x7a16*/  .byte 0x00
/*0x7a17*/  .byte 0x00

            gpio_map_1:
/*0x7a18*/  .word 0x400b4000
/*0x7a1c*/  .word 0x00000200
/*0x7a20*/  .word 0x400b0000
/*0x7a24*/  .word 0x00000020
/*0x7a28*/  .word 0x400b0000
/*0x7a2c*/  .word 0x00000040
/*0x7a30*/  .word 0x400b0000
/*0x7a34*/  .word 0x00000080
/*0x7a38*/  .word 0x400b4000
/*0x7a3c*/  .word 0x00000800
/*0x7a40*/  .word 0x400b4000
/*0x7a44*/  .word 0x00002000
/*0x7a48*/  .word 0x400b4000
/*0x7a4c*/  .word 0x00004000 /* possible pointer */
/*0x7a50*/  .word 0x400b4000
/*0x7a54*/  .word 0x00008000

/*0x7a58*/  .byte 0x02
/*0x7a59*/  .byte 0x09
/*0x7a5a*/  .byte 0x00
/*0x7a5b*/  .byte 0x05
/*0x7a5c*/  .byte 0x00
/*0x7a5d*/  .byte 0x06
/*0x7a5e*/  .byte 0x00
/*0x7a5f*/  .byte 0x07
/*0x7a60*/  .byte 0x02
/*0x7a61*/  .byte 0x0b
/*0x7a62*/  .byte 0x02
/*0x7a63*/  .byte 0x0d
/*0x7a64*/  .byte 0x02
/*0x7a65*/  .byte 0x0e
/*0x7a66*/  .byte 0x02
/*0x7a67*/  .byte 0x0f

            gpio_map_2:
/*0x7a68*/  .word 0x400b0000
/*0x7a6c*/  .word 0x00000001
/*0x7a70*/  .word 0x400b0000
/*0x7a74*/  .word 0x00000002
/*0x7a78*/  .word 0x400b6000
/*0x7a7c*/  .word 0x00000001
            data_7a80:
/*0x7a80*/  .word 0x400b0000
/*0x7a84*/  .word 0x00000400

            data_7a88:
/*0x7a88*/  .byte 0x00
/*0x7a89*/  .byte 0x01
/*0x7a8a*/  .byte 0x02
/*0x7a8b*/  .byte 0x00

            gpio_map_3:
/*0x7a8c*/  .word 0x400b4000
/*0x7a90*/  .word 0x00000100
/*0x7a94*/  .word 0x400b4000
/*0x7a98*/  .word 0x00000080
/*0x7a9c*/  .word 0x400b2000
/*0x7aa0*/  .word 0x00000020
/*0x7aa4*/  .word 0x400b2000
/*0x7aa8*/  .word 0x00000010
/*0x7aac*/  .word 0x400b2000
/*0x7ab0*/  .word 0x00000008
/*0x7ab4*/  .word 0x400b2000
/*0x7ab8*/  .word 0x00000004
/*0x7abc*/  .word 0x400b4000
/*0x7ac0*/  .word 0x00000040
/*0x7ac4*/  .word 0x400b4000
/*0x7ac8*/  .word 0x00000020

/*0x7acc*/  .byte 0x00
/*0x7acd*/  .byte 0x00
/*0x7ace*/  .byte 0x13
/*0x7acf*/  .byte 0x00
/*0x7ad0*/  .byte 0x26
/*0x7ad1*/  .byte 0x00
/*0x7ad2*/  .byte 0x3a
/*0x7ad3*/  .byte 0x00
/*0x7ad4*/  .byte 0x4e
/*0x7ad5*/  .byte 0x00
/*0x7ad6*/  .byte 0x62
/*0x7ad7*/  .byte 0x00
/*0x7ad8*/  .byte 0x77
/*0x7ad9*/  .byte 0x00
/*0x7ada*/  .byte 0x8c
/*0x7adb*/  .byte 0x00
/*0x7adc*/  .byte 0xa1
/*0x7add*/  .byte 0x00
/*0x7ade*/  .byte 0xb7
/*0x7adf*/  .byte 0x00
/*0x7ae0*/  .byte 0xcd
/*0x7ae1*/  .byte 0x00
/*0x7ae2*/  .byte 0xe3
/*0x7ae3*/  .byte 0x00
/*0x7ae4*/  .byte 0xfa
/*0x7ae5*/  .byte 0x00
/*0x7ae6*/  .byte 0x11
/*0x7ae7*/  .byte 0x01
/*0x7ae8*/  .byte 0x28
/*0x7ae9*/  .byte 0x01
/*0x7aea*/  .byte 0x40
/*0x7aeb*/  .byte 0x01
/*0x7aec*/  .byte 0x58
/*0x7aed*/  .byte 0x01
/*0x7aee*/  .byte 0x71
/*0x7aef*/  .byte 0x01
/*0x7af0*/  .byte 0x8a
/*0x7af1*/  .byte 0x01
/*0x7af2*/  .byte 0xa3
/*0x7af3*/  .byte 0x01
/*0x7af4*/  .byte 0xbd
/*0x7af5*/  .byte 0x01
/*0x7af6*/  .byte 0xd7
/*0x7af7*/  .byte 0x01
/*0x7af8*/  .byte 0xf1
/*0x7af9*/  .byte 0x01
/*0x7afa*/  .byte 0x0c
/*0x7afb*/  .byte 0x02
/*0x7afc*/  .byte 0x28
/*0x7afd*/  .byte 0x02
/*0x7afe*/  .byte 0x43
/*0x7aff*/  .byte 0x02
/*0x7b00*/  .byte 0x60
/*0x7b01*/  .byte 0x02
/*0x7b02*/  .byte 0x7c
/*0x7b03*/  .byte 0x02
/*0x7b04*/  .byte 0x9a
/*0x7b05*/  .byte 0x02
/*0x7b06*/  .byte 0xb7
/*0x7b07*/  .byte 0x02
/*0x7b08*/  .byte 0xd5
/*0x7b09*/  .byte 0x02
/*0x7b0a*/  .byte 0xf4
/*0x7b0b*/  .byte 0x02
/*0x7b0c*/  .byte 0x13
/*0x7b0d*/  .byte 0x03
/*0x7b0e*/  .byte 0x32
/*0x7b0f*/  .byte 0x03
/*0x7b10*/  .byte 0x53
/*0x7b11*/  .byte 0x03
/*0x7b12*/  .byte 0x73
/*0x7b13*/  .byte 0x03
/*0x7b14*/  .byte 0x94
/*0x7b15*/  .byte 0x03
/*0x7b16*/  .byte 0xb6
/*0x7b17*/  .byte 0x03
/*0x7b18*/  .byte 0xd8
/*0x7b19*/  .byte 0x03
/*0x7b1a*/  .byte 0xfb
/*0x7b1b*/  .byte 0x03
/*0x7b1c*/  .byte 0x1e
/*0x7b1d*/  .byte 0x04
/*0x7b1e*/  .byte 0x42
/*0x7b1f*/  .byte 0x04
/*0x7b20*/  .byte 0x66
/*0x7b21*/  .byte 0x04
/*0x7b22*/  .byte 0x8b
/*0x7b23*/  .byte 0x04
/*0x7b24*/  .byte 0xb1
/*0x7b25*/  .byte 0x04
/*0x7b26*/  .byte 0xd7
/*0x7b27*/  .byte 0x04
/*0x7b28*/  .byte 0xfd
/*0x7b29*/  .byte 0x04
/*0x7b2a*/  .byte 0x25
/*0x7b2b*/  .byte 0x05
/*0x7b2c*/  .byte 0x4d
/*0x7b2d*/  .byte 0x05
/*0x7b2e*/  .byte 0x75
/*0x7b2f*/  .byte 0x05
/*0x7b30*/  .byte 0x9f
/*0x7b31*/  .byte 0x05
/*0x7b32*/  .byte 0xc8
/*0x7b33*/  .byte 0x05
/*0x7b34*/  .byte 0xf3
/*0x7b35*/  .byte 0x05
/*0x7b36*/  .byte 0x1e
/*0x7b37*/  .byte 0x06
/*0x7b38*/  .byte 0x4a
/*0x7b39*/  .byte 0x06
/*0x7b3a*/  .byte 0x77
/*0x7b3b*/  .byte 0x06
/*0x7b3c*/  .byte 0xa4
/*0x7b3d*/  .byte 0x06
/*0x7b3e*/  .byte 0xd2
/*0x7b3f*/  .byte 0x06
/*0x7b40*/  .byte 0x01
/*0x7b41*/  .byte 0x07
/*0x7b42*/  .byte 0x31
/*0x7b43*/  .byte 0x07
/*0x7b44*/  .byte 0x61
/*0x7b45*/  .byte 0x07
/*0x7b46*/  .byte 0x92
/*0x7b47*/  .byte 0x07
/*0x7b48*/  .byte 0xc4
/*0x7b49*/  .byte 0x07
/*0x7b4a*/  .byte 0xf6
/*0x7b4b*/  .byte 0x07
/*0x7b4c*/  .byte 0x2a
/*0x7b4d*/  .byte 0x08
/*0x7b4e*/  .byte 0x5e
/*0x7b4f*/  .byte 0x08
/*0x7b50*/  .byte 0x93
/*0x7b51*/  .byte 0x08
/*0x7b52*/  .byte 0xc9
/*0x7b53*/  .byte 0x08
/*0x7b54*/  .byte 0x00
/*0x7b55*/  .byte 0x09
/*0x7b56*/  .byte 0x38
/*0x7b57*/  .byte 0x09
/*0x7b58*/  .byte 0x70
/*0x7b59*/  .byte 0x09
/*0x7b5a*/  .byte 0xaa
/*0x7b5b*/  .byte 0x09
/*0x7b5c*/  .byte 0xe4
/*0x7b5d*/  .byte 0x09
/*0x7b5e*/  .byte 0x1f
/*0x7b5f*/  .byte 0x0a
/*0x7b60*/  .byte 0x5b
/*0x7b61*/  .byte 0x0a
/*0x7b62*/  .byte 0x99
/*0x7b63*/  .byte 0x0a
/*0x7b64*/  .byte 0xd7
/*0x7b65*/  .byte 0x0a
/*0x7b66*/  .byte 0x16
/*0x7b67*/  .byte 0x0b
/*0x7b68*/  .byte 0x56
/*0x7b69*/  .byte 0x0b
/*0x7b6a*/  .byte 0x97
/*0x7b6b*/  .byte 0x0b
/*0x7b6c*/  .byte 0xd9
/*0x7b6d*/  .byte 0x0b
/*0x7b6e*/  .byte 0x1d
/*0x7b6f*/  .byte 0x0c
/*0x7b70*/  .byte 0x61
/*0x7b71*/  .byte 0x0c
/*0x7b72*/  .byte 0xa6
/*0x7b73*/  .byte 0x0c
/*0x7b74*/  .byte 0xed
/*0x7b75*/  .byte 0x0c
/*0x7b76*/  .byte 0x34
/*0x7b77*/  .byte 0x0d
/*0x7b78*/  .byte 0x7d
/*0x7b79*/  .byte 0x0d
/*0x7b7a*/  .byte 0xc7
/*0x7b7b*/  .byte 0x0d
/*0x7b7c*/  .byte 0x12
/*0x7b7d*/  .byte 0x0e
/*0x7b7e*/  .byte 0x5e
/*0x7b7f*/  .byte 0x0e
/*0x7b80*/  .byte 0xac
/*0x7b81*/  .byte 0x0e
/*0x7b82*/  .byte 0xfb
/*0x7b83*/  .byte 0x0e
/*0x7b84*/  .byte 0x4b
/*0x7b85*/  .byte 0x0f
/*0x7b86*/  .byte 0x9c
/*0x7b87*/  .byte 0x0f
/*0x7b88*/  .byte 0xee
/*0x7b89*/  .byte 0x0f
/*0x7b8a*/  .byte 0x42
/*0x7b8b*/  .byte 0x10
/*0x7b8c*/  .byte 0x97
/*0x7b8d*/  .byte 0x10
/*0x7b8e*/  .byte 0xee
/*0x7b8f*/  .byte 0x10
/*0x7b90*/  .byte 0x46
/*0x7b91*/  .byte 0x11
/*0x7b92*/  .byte 0x9f
/*0x7b93*/  .byte 0x11
/*0x7b94*/  .byte 0xfa
/*0x7b95*/  .byte 0x11
/*0x7b96*/  .byte 0x56
/*0x7b97*/  .byte 0x12
/*0x7b98*/  .byte 0xb4
/*0x7b99*/  .byte 0x12
/*0x7b9a*/  .byte 0x13
/*0x7b9b*/  .byte 0x13
/*0x7b9c*/  .byte 0x73
/*0x7b9d*/  .byte 0x13
/*0x7b9e*/  .byte 0xd5
/*0x7b9f*/  .byte 0x13
/*0x7ba0*/  .byte 0x39
/*0x7ba1*/  .byte 0x14
/*0x7ba2*/  .byte 0x9e
/*0x7ba3*/  .byte 0x14
/*0x7ba4*/  .byte 0x05
/*0x7ba5*/  .byte 0x15
/*0x7ba6*/  .byte 0x6e
/*0x7ba7*/  .byte 0x15
/*0x7ba8*/  .byte 0xd8
/*0x7ba9*/  .byte 0x15
/*0x7baa*/  .byte 0x44
/*0x7bab*/  .byte 0x16
/*0x7bac*/  .byte 0xb2
/*0x7bad*/  .byte 0x16
/*0x7bae*/  .byte 0x21
/*0x7baf*/  .byte 0x17
/*0x7bb0*/  .byte 0x92
/*0x7bb1*/  .byte 0x17
/*0x7bb2*/  .byte 0x05
/*0x7bb3*/  .byte 0x18
/*0x7bb4*/  .byte 0x7a
/*0x7bb5*/  .byte 0x18
/*0x7bb6*/  .byte 0xf0
/*0x7bb7*/  .byte 0x18
/*0x7bb8*/  .byte 0x69
/*0x7bb9*/  .byte 0x19
/*0x7bba*/  .byte 0xe3
/*0x7bbb*/  .byte 0x19
/*0x7bbc*/  .byte 0x5f
/*0x7bbd*/  .byte 0x1a
/*0x7bbe*/  .byte 0xde
/*0x7bbf*/  .byte 0x1a
/*0x7bc0*/  .byte 0x5e
/*0x7bc1*/  .byte 0x1b
/*0x7bc2*/  .byte 0xe0
/*0x7bc3*/  .byte 0x1b
/*0x7bc4*/  .byte 0x65
/*0x7bc5*/  .byte 0x1c
/*0x7bc6*/  .byte 0xeb
/*0x7bc7*/  .byte 0x1c
/*0x7bc8*/  .byte 0x74
/*0x7bc9*/  .byte 0x1d
/*0x7bca*/  .byte 0xff
/*0x7bcb*/  .byte 0x1d
/*0x7bcc*/  .byte 0x8c
/*0x7bcd*/  .byte 0x1e
/*0x7bce*/  .byte 0x1b
/*0x7bcf*/  .byte 0x1f
/*0x7bd0*/  .byte 0xac
/*0x7bd1*/  .byte 0x1f
/*0x7bd2*/  .byte 0x40
/*0x7bd3*/  .byte 0x20
/*0x7bd4*/  .byte 0xd6
/*0x7bd5*/  .byte 0x20
/*0x7bd6*/  .byte 0x6f
/*0x7bd7*/  .byte 0x21
/*0x7bd8*/  .byte 0x0a
/*0x7bd9*/  .byte 0x22
/*0x7bda*/  .byte 0xa8
/*0x7bdb*/  .byte 0x22
/*0x7bdc*/  .byte 0x48
/*0x7bdd*/  .byte 0x23
/*0x7bde*/  .byte 0xea
/*0x7bdf*/  .byte 0x23
/*0x7be0*/  .byte 0x8f
/*0x7be1*/  .byte 0x24
/*0x7be2*/  .byte 0x37
/*0x7be3*/  .byte 0x25
/*0x7be4*/  .byte 0xe1
/*0x7be5*/  .byte 0x25
/*0x7be6*/  .byte 0x8e
/*0x7be7*/  .byte 0x26
/*0x7be8*/  .byte 0x3e
/*0x7be9*/  .byte 0x27
/*0x7bea*/  .byte 0xf1
/*0x7beb*/  .byte 0x27
/*0x7bec*/  .byte 0xa6
/*0x7bed*/  .byte 0x28
/*0x7bee*/  .byte 0x5f
/*0x7bef*/  .byte 0x29
/*0x7bf0*/  .byte 0x1a
/*0x7bf1*/  .byte 0x2a
/*0x7bf2*/  .byte 0xd8
/*0x7bf3*/  .byte 0x2a
/*0x7bf4*/  .byte 0x99
/*0x7bf5*/  .byte 0x2b
/*0x7bf6*/  .byte 0x5e
/*0x7bf7*/  .byte 0x2c
/*0x7bf8*/  .byte 0x25
/*0x7bf9*/  .byte 0x2d
/*0x7bfa*/  .byte 0xf0
/*0x7bfb*/  .byte 0x2d
/*0x7bfc*/  .byte 0xbe
/*0x7bfd*/  .byte 0x2e
/*0x7bfe*/  .byte 0x8f
/*0x7bff*/  .byte 0x2f
/*0x7c00*/  .byte 0x63
/*0x7c01*/  .byte 0x30
/*0x7c02*/  .byte 0x3b
/*0x7c03*/  .byte 0x31
/*0x7c04*/  .byte 0x16
/*0x7c05*/  .byte 0x32
/*0x7c06*/  .byte 0xf5
/*0x7c07*/  .byte 0x32
/*0x7c08*/  .byte 0xd7
/*0x7c09*/  .byte 0x33
/*0x7c0a*/  .byte 0xbd
/*0x7c0b*/  .byte 0x34
/*0x7c0c*/  .byte 0xa7
/*0x7c0d*/  .byte 0x35
/*0x7c0e*/  .byte 0x94
/*0x7c0f*/  .byte 0x36
/*0x7c10*/  .byte 0x85
/*0x7c11*/  .byte 0x37
/*0x7c12*/  .byte 0x7a
/*0x7c13*/  .byte 0x38
/*0x7c14*/  .byte 0x72
/*0x7c15*/  .byte 0x39
/*0x7c16*/  .byte 0x6f
/*0x7c17*/  .byte 0x3a
/*0x7c18*/  .byte 0x70
/*0x7c19*/  .byte 0x3b
/*0x7c1a*/  .byte 0x74
/*0x7c1b*/  .byte 0x3c
/*0x7c1c*/  .byte 0x7d
/*0x7c1d*/  .byte 0x3d
/*0x7c1e*/  .byte 0x8a
/*0x7c1f*/  .byte 0x3e
/*0x7c20*/  .byte 0x9c
/*0x7c21*/  .byte 0x3f
/*0x7c22*/  .byte 0xb1
/*0x7c23*/  .byte 0x40
/*0x7c24*/  .byte 0xcb
/*0x7c25*/  .byte 0x41
/*0x7c26*/  .byte 0xea
/*0x7c27*/  .byte 0x42
/*0x7c28*/  .byte 0x0d
/*0x7c29*/  .byte 0x44
/*0x7c2a*/  .byte 0x35
/*0x7c2b*/  .byte 0x45
/*0x7c2c*/  .byte 0x61
/*0x7c2d*/  .byte 0x46
/*0x7c2e*/  .byte 0x93
/*0x7c2f*/  .byte 0x47
/*0x7c30*/  .byte 0xc9
/*0x7c31*/  .byte 0x48
/*0x7c32*/  .byte 0x04
/*0x7c33*/  .byte 0x4a
/*0x7c34*/  .byte 0x44
/*0x7c35*/  .byte 0x4b
/*0x7c36*/  .byte 0x89
/*0x7c37*/  .byte 0x4c
/*0x7c38*/  .byte 0xd3
/*0x7c39*/  .byte 0x4d
/*0x7c3a*/  .byte 0x22
/*0x7c3b*/  .byte 0x4f
/*0x7c3c*/  .byte 0x77
/*0x7c3d*/  .byte 0x50
/*0x7c3e*/  .byte 0xd2
/*0x7c3f*/  .byte 0x51
/*0x7c40*/  .byte 0x31
/*0x7c41*/  .byte 0x53
/*0x7c42*/  .byte 0x97
/*0x7c43*/  .byte 0x54
/*0x7c44*/  .byte 0x02
/*0x7c45*/  .byte 0x56
/*0x7c46*/  .byte 0x72
/*0x7c47*/  .byte 0x57
/*0x7c48*/  .byte 0xe9
/*0x7c49*/  .byte 0x58
/*0x7c4a*/  .byte 0x66
/*0x7c4b*/  .byte 0x5a
/*0x7c4c*/  .byte 0xe8
/*0x7c4d*/  .byte 0x5b
/*0x7c4e*/  .byte 0x71
/*0x7c4f*/  .byte 0x5d
/*0x7c50*/  .byte 0x00
/*0x7c51*/  .byte 0x5f
/*0x7c52*/  .byte 0x95
/*0x7c53*/  .byte 0x60
/*0x7c54*/  .byte 0x31
/*0x7c55*/  .byte 0x62
/*0x7c56*/  .byte 0xd3
/*0x7c57*/  .byte 0x63
/*0x7c58*/  .byte 0x7c
/*0x7c59*/  .byte 0x65
/*0x7c5a*/  .byte 0x2c
/*0x7c5b*/  .byte 0x67
/*0x7c5c*/  .byte 0xe3
/*0x7c5d*/  .byte 0x68
/*0x7c5e*/  .byte 0xa0
/*0x7c5f*/  .byte 0x6a
/*0x7c60*/  .byte 0x65
/*0x7c61*/  .byte 0x6c
/*0x7c62*/  .byte 0x31
/*0x7c63*/  .byte 0x6e
/*0x7c64*/  .byte 0x04
/*0x7c65*/  .byte 0x70
/*0x7c66*/  .byte 0xde
/*0x7c67*/  .byte 0x71
/*0x7c68*/  .byte 0xc0
/*0x7c69*/  .byte 0x73
/*0x7c6a*/  .byte 0xaa
/*0x7c6b*/  .byte 0x75
/*0x7c6c*/  .byte 0x9c
/*0x7c6d*/  .byte 0x77
/*0x7c6e*/  .byte 0x95
/*0x7c6f*/  .byte 0x79
/*0x7c70*/  .byte 0x96
/*0x7c71*/  .byte 0x7b
/*0x7c72*/  .byte 0xa0
/*0x7c73*/  .byte 0x7d
/*0x7c74*/  .byte 0xb2
/*0x7c75*/  .byte 0x7f
/*0x7c76*/  .byte 0xcc
/*0x7c77*/  .byte 0x81
/*0x7c78*/  .byte 0xef
/*0x7c79*/  .byte 0x83
/*0x7c7a*/  .byte 0x1a
/*0x7c7b*/  .byte 0x86
/*0x7c7c*/  .byte 0x4f
/*0x7c7d*/  .byte 0x88
/*0x7c7e*/  .byte 0x8c
/*0x7c7f*/  .byte 0x8a
/*0x7c80*/  .byte 0xd3
/*0x7c81*/  .byte 0x8c
/*0x7c82*/  .byte 0x22
/*0x7c83*/  .byte 0x8f
/*0x7c84*/  .byte 0x7b
/*0x7c85*/  .byte 0x91
/*0x7c86*/  .byte 0xde
/*0x7c87*/  .byte 0x93
/*0x7c88*/  .byte 0x4a
/*0x7c89*/  .byte 0x96
/*0x7c8a*/  .byte 0xc0
/*0x7c8b*/  .byte 0x98
/*0x7c8c*/  .byte 0x40
/*0x7c8d*/  .byte 0x9b
/*0x7c8e*/  .byte 0xcb
/*0x7c8f*/  .byte 0x9d
/*0x7c90*/  .byte 0x5f
/*0x7c91*/  .byte 0xa0
/*0x7c92*/  .byte 0xff
/*0x7c93*/  .byte 0xa2
/*0x7c94*/  .byte 0xa8
/*0x7c95*/  .byte 0xa5
/*0x7c96*/  .byte 0x5d
/*0x7c97*/  .byte 0xa8
/*0x7c98*/  .byte 0x1d
/*0x7c99*/  .byte 0xab
/*0x7c9a*/  .byte 0xe8
/*0x7c9b*/  .byte 0xad
/*0x7c9c*/  .byte 0xbe
/*0x7c9d*/  .byte 0xb0
/*0x7c9e*/  .byte 0x9f
/*0x7c9f*/  .byte 0xb3
/*0x7ca0*/  .byte 0x8d
/*0x7ca1*/  .byte 0xb6
/*0x7ca2*/  .byte 0x86
/*0x7ca3*/  .byte 0xb9
/*0x7ca4*/  .byte 0x8c
/*0x7ca5*/  .byte 0xbc
/*0x7ca6*/  .byte 0x9d
/*0x7ca7*/  .byte 0xbf
/*0x7ca8*/  .byte 0xbc
/*0x7ca9*/  .byte 0xc2
/*0x7caa*/  .byte 0xe6
/*0x7cab*/  .byte 0xc5
/*0x7cac*/  .byte 0x1e
/*0x7cad*/  .byte 0xc9
/*0x7cae*/  .byte 0x63
/*0x7caf*/  .byte 0xcc
/*0x7cb0*/  .byte 0xb5
/*0x7cb1*/  .byte 0xcf
/*0x7cb2*/  .byte 0x15
/*0x7cb3*/  .byte 0xd3
/*0x7cb4*/  .byte 0x82
/*0x7cb5*/  .byte 0xd6
/*0x7cb6*/  .byte 0xfd
/*0x7cb7*/  .byte 0xd9
/*0x7cb8*/  .byte 0x87
/*0x7cb9*/  .byte 0xdd
/*0x7cba*/  .byte 0x1f
/*0x7cbb*/  .byte 0xe1
/*0x7cbc*/  .byte 0xc5
/*0x7cbd*/  .byte 0xe4
/*0x7cbe*/  .byte 0x7a
/*0x7cbf*/  .byte 0xe8
/*0x7cc0*/  .byte 0x3f
/*0x7cc1*/  .byte 0xec
/*0x7cc2*/  .byte 0x12
/*0x7cc3*/  .byte 0xf0
/*0x7cc4*/  .byte 0xf5
/*0x7cc5*/  .byte 0xf3
/*0x7cc6*/  .byte 0xe9
/*0x7cc7*/  .byte 0xf7
/*0x7cc8*/  .byte 0xec
/*0x7cc9*/  .byte 0xfb
/*0x7cca*/  .byte 0xff
/*0x7ccb*/  .byte 0xff
/*0x7ccc*/  .byte 0x06
/*0x7ccd*/  .byte 0x00
/*0x7cce*/  .byte 0xff
/*0x7ccf*/  .byte 0x09
/*0x7cd0*/  .byte 0x01
/*0x7cd1*/  .byte 0xa1
/*0x7cd2*/  .byte 0x01
/*0x7cd3*/  .byte 0x09
/*0x7cd4*/  .byte 0x02
/*0x7cd5*/  .byte 0x15
/*0x7cd6*/  .byte 0x00
/*0x7cd7*/  .byte 0x26
/*0x7cd8*/  .byte 0xff
/*0x7cd9*/  .byte 0x00
/*0x7cda*/  .byte 0x75
/*0x7cdb*/  .byte 0x08
/*0x7cdc*/  .byte 0x95
/*0x7cdd*/  .byte 0x40
/*0x7cde*/  .byte 0x81
/*0x7cdf*/  .byte 0x02
/*0x7ce0*/  .byte 0x09
/*0x7ce1*/  .byte 0x03
/*0x7ce2*/  .byte 0x15
/*0x7ce3*/  .byte 0x00
/*0x7ce4*/  .byte 0x26
/*0x7ce5*/  .byte 0xff
/*0x7ce6*/  .byte 0x00
/*0x7ce7*/  .byte 0x75
/*0x7ce8*/  .byte 0x08
/*0x7ce9*/  .byte 0x95
/*0x7cea*/  .byte 0x40
/*0x7ceb*/  .byte 0x91
/*0x7cec*/  .byte 0x02
/*0x7ced*/  .byte 0xc0
/*0x7cee*/  .byte 0x00
/*0x7cef*/  .byte 0x00
/*0x7cf0*/  .byte 0x05
/*0x7cf1*/  .byte 0x01
/*0x7cf2*/  .byte 0x09
/*0x7cf3*/  .byte 0x80
/*0x7cf4*/  .byte 0xa1
/*0x7cf5*/  .byte 0x01
/*0x7cf6*/  .byte 0x85
/*0x7cf7*/  .byte 0x01
/*0x7cf8*/  .byte 0x19
/*0x7cf9*/  .byte 0x81
/*0x7cfa*/  .byte 0x29
/*0x7cfb*/  .byte 0x83
/*0x7cfc*/  .byte 0x15
/*0x7cfd*/  .byte 0x00
/*0x7cfe*/  .byte 0x25
/*0x7cff*/  .byte 0x01
/*0x7d00*/  .byte 0x95
/*0x7d01*/  .byte 0x03
/*0x7d02*/  .byte 0x75
/*0x7d03*/  .byte 0x01
/*0x7d04*/  .byte 0x81
/*0x7d05*/  .byte 0x02
/*0x7d06*/  .byte 0x95
/*0x7d07*/  .byte 0x01
/*0x7d08*/  .byte 0x75
/*0x7d09*/  .byte 0x05
/*0x7d0a*/  .byte 0x81
/*0x7d0b*/  .byte 0x01
/*0x7d0c*/  .byte 0xc0
/*0x7d0d*/  .byte 0x05
/*0x7d0e*/  .byte 0x0c
/*0x7d0f*/  .byte 0x09
/*0x7d10*/  .byte 0x01
/*0x7d11*/  .byte 0xa1
/*0x7d12*/  .byte 0x01
/*0x7d13*/  .byte 0x85
/*0x7d14*/  .byte 0x02
/*0x7d15*/  .byte 0x15
/*0x7d16*/  .byte 0x00
/*0x7d17*/  .byte 0x25
/*0x7d18*/  .byte 0x01
/*0x7d19*/  .byte 0x95
/*0x7d1a*/  .byte 0x12
/*0x7d1b*/  .byte 0x75
/*0x7d1c*/  .byte 0x01
/*0x7d1d*/  .byte 0x0a
/*0x7d1e*/  .byte 0x83
/*0x7d1f*/  .byte 0x01
/*0x7d20*/  .byte 0x0a
/*0x7d21*/  .byte 0x8a
/*0x7d22*/  .byte 0x01
/*0x7d23*/  .byte 0x0a
/*0x7d24*/  .byte 0x92
/*0x7d25*/  .byte 0x01
/*0x7d26*/  .byte 0x0a
/*0x7d27*/  .byte 0x94
/*0x7d28*/  .byte 0x01
/*0x7d29*/  .byte 0x09
/*0x7d2a*/  .byte 0xcd
/*0x7d2b*/  .byte 0x09
/*0x7d2c*/  .byte 0xb7
/*0x7d2d*/  .byte 0x09
/*0x7d2e*/  .byte 0xb6
/*0x7d2f*/  .byte 0x09
/*0x7d30*/  .byte 0xb5
/*0x7d31*/  .byte 0x09
/*0x7d32*/  .byte 0xe2
/*0x7d33*/  .byte 0x09
/*0x7d34*/  .byte 0xea
/*0x7d35*/  .byte 0x09
/*0x7d36*/  .byte 0xe9
/*0x7d37*/  .byte 0x0a
/*0x7d38*/  .byte 0x21
/*0x7d39*/  .byte 0x02
/*0x7d3a*/  .byte 0x0a
/*0x7d3b*/  .byte 0x23
/*0x7d3c*/  .byte 0x02
/*0x7d3d*/  .byte 0x0a
/*0x7d3e*/  .byte 0x24
/*0x7d3f*/  .byte 0x02
/*0x7d40*/  .byte 0x0a
/*0x7d41*/  .byte 0x25
/*0x7d42*/  .byte 0x02
/*0x7d43*/  .byte 0x0a
/*0x7d44*/  .byte 0x26
/*0x7d45*/  .byte 0x02
/*0x7d46*/  .byte 0x0a
/*0x7d47*/  .byte 0x27
/*0x7d48*/  .byte 0x02
/*0x7d49*/  .byte 0x0a
/*0x7d4a*/  .byte 0x2a
/*0x7d4b*/  .byte 0x02
/*0x7d4c*/  .byte 0x81
/*0x7d4d*/  .byte 0x02
/*0x7d4e*/  .byte 0x95
/*0x7d4f*/  .byte 0x01
/*0x7d50*/  .byte 0x75
/*0x7d51*/  .byte 0x0e
/*0x7d52*/  .byte 0x81
/*0x7d53*/  .byte 0x01
/*0x7d54*/  .byte 0xc0
/*0x7d55*/  .byte 0x05
/*0x7d56*/  .byte 0x01
/*0x7d57*/  .byte 0x09
/*0x7d58*/  .byte 0x06
/*0x7d59*/  .byte 0xa1
/*0x7d5a*/  .byte 0x01
/*0x7d5b*/  .byte 0x85
/*0x7d5c*/  .byte 0x04
/*0x7d5d*/  .byte 0x05
/*0x7d5e*/  .byte 0x07
/*0x7d5f*/  .byte 0x95
/*0x7d60*/  .byte 0x01
/*0x7d61*/  .byte 0x75
/*0x7d62*/  .byte 0x08
/*0x7d63*/  .byte 0x81
/*0x7d64*/  .byte 0x03
/*0x7d65*/  .byte 0x95
/*0x7d66*/  .byte 0xe8
/*0x7d67*/  .byte 0x75
/*0x7d68*/  .byte 0x01
/*0x7d69*/  .byte 0x15
/*0x7d6a*/  .byte 0x00
/*0x7d6b*/  .byte 0x25
/*0x7d6c*/  .byte 0x01
/*0x7d6d*/  .byte 0x05
/*0x7d6e*/  .byte 0x07
/*0x7d6f*/  .byte 0x19
/*0x7d70*/  .byte 0x00
/*0x7d71*/  .byte 0x29
/*0x7d72*/  .byte 0xe7
/*0x7d73*/  .byte 0x81
/*0x7d74*/  .byte 0x00
/*0x7d75*/  .byte 0xc0
/*0x7d76*/  .byte 0x00
/*0x7d77*/  .byte 0x00
/*0x7d78*/  .byte 0x05
/*0x7d79*/  .byte 0x01
/*0x7d7a*/  .byte 0x09
/*0x7d7b*/  .byte 0x06
/*0x7d7c*/  .byte 0xa1
/*0x7d7d*/  .byte 0x01
/*0x7d7e*/  .byte 0x05
/*0x7d7f*/  .byte 0x07
/*0x7d80*/  .byte 0x19
/*0x7d81*/  .byte 0xe0
/*0x7d82*/  .byte 0x29
/*0x7d83*/  .byte 0xe7
/*0x7d84*/  .byte 0x15
/*0x7d85*/  .byte 0x00
/*0x7d86*/  .byte 0x25
/*0x7d87*/  .byte 0x01
/*0x7d88*/  .byte 0x75
/*0x7d89*/  .byte 0x01
/*0x7d8a*/  .byte 0x95
/*0x7d8b*/  .byte 0x08
/*0x7d8c*/  .byte 0x81
/*0x7d8d*/  .byte 0x02
/*0x7d8e*/  .byte 0x95
/*0x7d8f*/  .byte 0x01
/*0x7d90*/  .byte 0x75
/*0x7d91*/  .byte 0x08
/*0x7d92*/  .byte 0x81
/*0x7d93*/  .byte 0x03
/*0x7d94*/  .byte 0x95
/*0x7d95*/  .byte 0x03
/*0x7d96*/  .byte 0x75
/*0x7d97*/  .byte 0x01
/*0x7d98*/  .byte 0x05
/*0x7d99*/  .byte 0x08
/*0x7d9a*/  .byte 0x19
/*0x7d9b*/  .byte 0x01
/*0x7d9c*/  .byte 0x29
/*0x7d9d*/  .byte 0x03
/*0x7d9e*/  .byte 0x91
/*0x7d9f*/  .byte 0x02
/*0x7da0*/  .byte 0x95
/*0x7da1*/  .byte 0x01
/*0x7da2*/  .byte 0x75
/*0x7da3*/  .byte 0x05
/*0x7da4*/  .byte 0x91
/*0x7da5*/  .byte 0x03
/*0x7da6*/  .byte 0x95
/*0x7da7*/  .byte 0x06
/*0x7da8*/  .byte 0x75
/*0x7da9*/  .byte 0x08
/*0x7daa*/  .byte 0x15
/*0x7dab*/  .byte 0x00
/*0x7dac*/  .byte 0x26
/*0x7dad*/  .byte 0xa4
/*0x7dae*/  .byte 0x00
/*0x7daf*/  .byte 0x05
/*0x7db0*/  .byte 0x07
/*0x7db1*/  .byte 0x19
/*0x7db2*/  .byte 0x00
/*0x7db3*/  .byte 0x29
/*0x7db4*/  .byte 0xa4
/*0x7db5*/  .byte 0x81
/*0x7db6*/  .byte 0x00
/*0x7db7*/  .byte 0xc0
/*0x7db8*/  .byte 0x09
/*0x7db9*/  .byte 0x02
/*0x7dba*/  .byte 0x5b
/*0x7dbb*/  .byte 0x00
/*0x7dbc*/  .byte 0x03
/*0x7dbd*/  .byte 0x01
/*0x7dbe*/  .byte 0x00
/*0x7dbf*/  .byte 0xa0
/*0x7dc0*/  .byte 0x32
/*0x7dc1*/  .byte 0x09
/*0x7dc2*/  .byte 0x04
/*0x7dc3*/  .byte 0x00
/*0x7dc4*/  .byte 0x00
/*0x7dc5*/  .byte 0x01
/*0x7dc6*/  .byte 0x03
/*0x7dc7*/  .byte 0x01
/*0x7dc8*/  .byte 0x01
/*0x7dc9*/  .byte 0x00
/*0x7dca*/  .byte 0x09
/*0x7dcb*/  .byte 0x21
/*0x7dcc*/  .byte 0x11
/*0x7dcd*/  .byte 0x01
/*0x7dce*/  .byte 0x00
/*0x7dcf*/  .byte 0x01
/*0x7dd0*/  .byte 0x22
/*0x7dd1*/  .byte 0x40
/*0x7dd2*/  .byte 0x00
/*0x7dd3*/  .byte 0x07
/*0x7dd4*/  .byte 0x05
/*0x7dd5*/  .byte 0x81
/*0x7dd6*/  .byte 0x03
/*0x7dd7*/  .byte 0x08
/*0x7dd8*/  .byte 0x00
/*0x7dd9*/  .byte 0x01
/*0x7dda*/  .byte 0x09
/*0x7ddb*/  .byte 0x04
/*0x7ddc*/  .byte 0x01
/*0x7ddd*/  .byte 0x00
/*0x7dde*/  .byte 0x02
/*0x7ddf*/  .byte 0x03
/*0x7de0*/  .byte 0x00
/*0x7de1*/  .byte 0x00
/*0x7de2*/  .byte 0x00
/*0x7de3*/  .byte 0x09
/*0x7de4*/  .byte 0x21
/*0x7de5*/  .byte 0x11
/*0x7de6*/  .byte 0x01
/*0x7de7*/  .byte 0x00
/*0x7de8*/  .byte 0x01
/*0x7de9*/  .byte 0x22
/*0x7dea*/  .byte 0x22
/*0x7deb*/  .byte 0x00
/*0x7dec*/  .byte 0x07
/*0x7ded*/  .byte 0x05
/*0x7dee*/  .byte 0x83
/*0x7def*/  .byte 0x03
/*0x7df0*/  .byte 0x40
/*0x7df1*/  .byte 0x00
/*0x7df2*/  .byte 0x01
/*0x7df3*/  .byte 0x07
/*0x7df4*/  .byte 0x05
/*0x7df5*/  .byte 0x04
/*0x7df6*/  .byte 0x03
/*0x7df7*/  .byte 0x40
/*0x7df8*/  .byte 0x00
/*0x7df9*/  .byte 0x01
/*0x7dfa*/  .byte 0x09
/*0x7dfb*/  .byte 0x04
/*0x7dfc*/  .byte 0x02
/*0x7dfd*/  .byte 0x00
/*0x7dfe*/  .byte 0x01
/*0x7dff*/  .byte 0x03
/*0x7e00*/  .byte 0x00
/*0x7e01*/  .byte 0x00
/*0x7e02*/  .byte 0x00
/*0x7e03*/  .byte 0x09
/*0x7e04*/  .byte 0x21
/*0x7e05*/  .byte 0x11
/*0x7e06*/  .byte 0x01
/*0x7e07*/  .byte 0x00
/*0x7e08*/  .byte 0x01
/*0x7e09*/  .byte 0x22
/*0x7e0a*/  .byte 0x86
/*0x7e0b*/  .byte 0x00
/*0x7e0c*/  .byte 0x07
/*0x7e0d*/  .byte 0x05
/*0x7e0e*/  .byte 0x82
/*0x7e0f*/  .byte 0x03
/*0x7e10*/  .byte 0x40
/*0x7e11*/  .byte 0x00
/*0x7e12*/  .byte 0x01
/*0x7e13*/  .byte 0x00
            data_7e14:
/*0x7e14*/  .byte 0x12
/*0x7e15*/  .byte 0x01
/*0x7e16*/  .byte 0x10
/*0x7e17*/  .byte 0x01
/*0x7e18*/  .byte 0x00
/*0x7e19*/  .byte 0x00
/*0x7e1a*/  .byte 0x00
/*0x7e1b*/  .byte 0x40
/*0x7e1c*/  .byte 0xd9
/*0x7e1d*/  .byte 0x04
/*0x7e1e*/  .byte 0x00
/*0x7e1f*/  .byte 0x02
/*0x7e20*/  .byte 0x01
/*0x7e21*/  .byte 0x11
/*0x7e22*/  .byte 0x01
/*0x7e23*/  .byte 0x02
/*0x7e24*/  .byte 0x00
/*0x7e25*/  .byte 0x01
/*0x7e26*/  .byte 0x00
/*0x7e27*/  .byte 0x00
/*0x7e28*/  .byte 0x34
/*0x7e29*/  .byte 0x7e
/*0x7e2a*/  .byte 0x00
/*0x7e2b*/  .byte 0x00
/*0x7e2c*/  .byte 0x38
/*0x7e2d*/  .byte 0x7e
/*0x7e2e*/  .byte 0x00
/*0x7e2f*/  .byte 0x00
/*0x7e30*/  .byte 0x48
/*0x7e31*/  .byte 0x7e
/*0x7e32*/  .byte 0x00
/*0x7e33*/  .byte 0x00
/*0x7e34*/  .byte 0x04
/*0x7e35*/  .byte 0x03
/*0x7e36*/  .byte 0x09
/*0x7e37*/  .byte 0x04
/*0x7e38*/  .byte 0x0e
/*0x7e39*/  .byte 0x03
/*0x7e3a*/  .byte 0x4d
/*0x7e3b*/  .byte 0x00
/*0x7e3c*/  .byte 0x69
/*0x7e3d*/  .byte 0x00
/*0x7e3e*/  .byte 0x73
/*0x7e3f*/  .byte 0x00
/*0x7e40*/  .byte 0x74
/*0x7e41*/  .byte 0x00
/*0x7e42*/  .byte 0x65
/*0x7e43*/  .byte 0x00
/*0x7e44*/  .byte 0x6c
/*0x7e45*/  .byte 0x00
/*0x7e46*/  .byte 0x00
/*0x7e47*/  .byte 0x00
/*0x7e48*/  .byte 0x0c
/*0x7e49*/  .byte 0x03
/*0x7e4a*/  .byte 0x4d
/*0x7e4b*/  .byte 0x00
/*0x7e4c*/  .byte 0x44
/*0x7e4d*/  .byte 0x00
/*0x7e4e*/  .byte 0x32
/*0x7e4f*/  .byte 0x00
/*0x7e50*/  .byte 0x30
/*0x7e51*/  .byte 0x00
/*0x7e52*/  .byte 0x30
/*0x7e53*/  .byte 0x00
/*0x7e54*/  .byte 0x00
/*0x7e55*/  .byte 0x00
/*0x7e56*/  .byte 0x00
/*0x7e57*/  .byte 0x00

            data_7e58:
/*0x7e58*/  .word loc_640c

/*0x7e5c*/  .byte 0x00
/*0x7e5d*/  .byte 0x00
/*0x7e5e*/  .byte 0x00
/*0x7e5f*/  .byte 0x00

/*0x7e60*/  .word loc_734c

/*0x7e64*/  .byte 0x00
/*0x7e65*/  .byte 0x00
/*0x7e66*/  .byte 0x00
/*0x7e67*/  .byte 0x00
/*0x7e68*/  .byte 0x00
/*0x7e69*/  .byte 0x00
/*0x7e6a*/  .byte 0x00
/*0x7e6b*/  .byte 0x00

/*0x7e6c*/  .word loc_724c
/*0x7e70*/  .word loc_7140

            data_7e74:
/*0x7e74*/  .byte 0xff
/*0x7e75*/  .byte 0xff
/*0x7e76*/  .byte 0xff
/*0x7e77*/  .byte 0x08
/*0x7e78*/  .byte 0x03
/*0x7e79*/  .byte 0x00
/*0x7e7a*/  .byte 0x00
/*0x7e7b*/  .byte 0x00
/*0x7e7c*/  .byte 0x04
/*0x7e7d*/  .byte 0x48
/*0x7e7e*/  .byte 0x00
/*0x7e7f*/  .byte 0x00
            data_7e80:
/*0x7e80*/  .byte 0x80
/*0x7e81*/  .byte 0x84
/*0x7e82*/  .byte 0x1e
/*0x7e83*/  .byte 0x00
/*0x7e84*/  .byte 0x00
/*0x7e85*/  .byte 0x00
/*0x7e86*/  .byte 0x00
/*0x7e87*/  .byte 0x40
/*0x7e88*/  .byte 0x58
/*0x7e89*/  .byte 0x00
/*0x7e8a*/  .byte 0x09
/*0x7e8b*/  .byte 0x40
/*0x7e8c*/  .byte 0x44
/*0x7e8d*/  .byte 0x00
/*0x7e8e*/  .byte 0x09
/*0x7e8f*/  .byte 0x40
/*0x7e90*/  .byte 0x03
/*0x7e91*/  .byte 0x02
/*0x7e92*/  .byte 0x00
/*0x7e93*/  .byte 0x02
/*0x7e94*/  .byte 0x00
/*0x7e95*/  .byte 0x03
/*0x7e96*/  .byte 0x00
/*0x7e97*/  .byte 0x00

            sram_defs:
/*0x7e98*/  .word 0x00007eb8 /* possible pointer */
/*0x7e9c*/  .word 0x20000000
/*0x7ea0*/  .word 0x0000006c
/*0x7ea4*/  .word 0x000076e0 /* possible pointer */
/*0x7ea8*/  .word 0x00007f24
/*0x7eac*/  .word 0x2000006c
/*0x7eb0*/  .word 0x00001e44
/*0x7eb4*/  .word 0x000076f0 /* possible pointer */

            sram_init_data:
/*0x7eb8*/  .byte 0x00
/*0x7eb9*/  .byte 0x00
/*0x7eba*/  .byte 0x00
/*0x7ebb*/  .byte 0x00
/*0x7ebc*/  .byte 0x00
/*0x7ebd*/  .byte 0x00
/*0x7ebe*/  .byte 0x00
/*0x7ebf*/  .byte 0x00
/*0x7ec0*/  .byte 0x00
/*0x7ec1*/  .byte 0xff
/*0x7ec2*/  .byte 0xff
/*0x7ec3*/  .byte 0x00
/*0x7ec4*/  .byte 0x00
/*0x7ec5*/  .byte 0xa2
/*0x7ec6*/  .byte 0x4a
/*0x7ec7*/  .byte 0x04
/*0x7ec8*/  .byte 0x01
/*0x7ec9*/  .byte 0x00
/*0x7eca*/  .byte 0x00
/*0x7ecb*/  .byte 0x00
/*0x7ecc*/  .byte 0x00
/*0x7ecd*/  .byte 0x00
/*0x7ece*/  .byte 0x00
/*0x7ecf*/  .byte 0x00
/*0x7ed0*/  .byte 0x00
/*0x7ed1*/  .byte 0x00
/*0x7ed2*/  .byte 0x00
/*0x7ed3*/  .byte 0x00
/*0x7ed4*/  .byte 0x00
/*0x7ed5*/  .byte 0x00
/*0x7ed6*/  .byte 0x00
/*0x7ed7*/  .byte 0x00
/*0x7ed8*/  .byte 0xff
/*0x7ed9*/  .byte 0x00
/*0x7eda*/  .byte 0x00
/*0x7edb*/  .byte 0x00
/*0x7edc*/  .byte 0xc4
/*0x7edd*/  .byte 0x7a
/*0x7ede*/  .byte 0x00
/*0x7edf*/  .byte 0x00
/*0x7ee0*/  .byte 0x00
/*0x7ee1*/  .byte 0x00
/*0x7ee2*/  .byte 0x00
/*0x7ee3*/  .byte 0x00
/*0x7ee4*/  .byte 0x01
/*0x7ee5*/  .byte 0x00
/*0x7ee6*/  .byte 0x00
/*0x7ee7*/  .byte 0x00
/*0x7ee8*/  .byte 0x00
/*0x7ee9*/  .byte 0x00
/*0x7eea*/  .byte 0x00
/*0x7eeb*/  .byte 0x00
/*0x7eec*/  .byte 0x00
/*0x7eed*/  .byte 0x00
/*0x7eee*/  .byte 0x00
/*0x7eef*/  .byte 0x00
/*0x7ef0*/  .byte 0x00
/*0x7ef1*/  .byte 0x00
/*0x7ef2*/  .byte 0x00
/*0x7ef3*/  .byte 0x00
/*0x7ef4*/  .byte 0x00
/*0x7ef5*/  .byte 0x00
/*0x7ef6*/  .byte 0x00
/*0x7ef7*/  .byte 0x00
/*0x7ef8*/  .byte 0x00
/*0x7ef9*/  .byte 0x00
/*0x7efa*/  .byte 0x00
/*0x7efb*/  .byte 0x00
/*0x7efc*/  .byte 0x00
/*0x7efd*/  .byte 0x00
/*0x7efe*/  .byte 0x00
/*0x7eff*/  .byte 0x00
/*0x7f00*/  .byte 0x00
/*0x7f01*/  .byte 0x00
/*0x7f02*/  .byte 0x00
/*0x7f03*/  .byte 0x00
/*0x7f04*/  .byte 0x00
/*0x7f05*/  .byte 0x00
/*0x7f06*/  .byte 0x00
/*0x7f07*/  .byte 0x00
/*0x7f08*/  .byte 0x00
/*0x7f09*/  .byte 0x00
/*0x7f0a*/  .byte 0x00
/*0x7f0b*/  .byte 0x00
/*0x7f0c*/  .byte 0x00
/*0x7f0d*/  .byte 0x00
/*0x7f0e*/  .byte 0x00
/*0x7f0f*/  .byte 0x00
/*0x7f10*/  .byte 0x00
/*0x7f11*/  .byte 0x00
/*0x7f12*/  .byte 0x00
/*0x7f13*/  .byte 0x00
/*0x7f14*/  .byte 0x00
/*0x7f15*/  .byte 0x00
/*0x7f16*/  .byte 0x00
/*0x7f17*/  .byte 0x00
/*0x7f18*/  .byte 0x00
/*0x7f19*/  .byte 0x00
/*0x7f1a*/  .byte 0x00
/*0x7f1b*/  .byte 0x00
/*0x7f1c*/  .byte 0x00
/*0x7f1d*/  .byte 0x00
/*0x7f1e*/  .byte 0x00
/*0x7f1f*/  .byte 0x00
/*0x7f20*/  .byte 0x00
/*0x7f21*/  .byte 0x00
/*0x7f22*/  .byte 0x00
/*0x7f23*/  .byte 0x00
