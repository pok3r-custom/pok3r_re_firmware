.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x3400*/  .word 0x20002538
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
/*0x3556*/      blx r0 /* call_767c */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /* call_6cac */
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
/*0x3574*/  .word call_767c
            data_3578:
/*0x3578*/  .word call_6cac
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
/*0x3590*/  .word 0x20002538


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
/*0x36d2*/      ldr r0, [pc, #0x6c] /* data_3740 */
/*0x36d4*/      bl call_37c0
/*0x36d8*/      bl call_6644
/*0x36dc*/      ldr r0, [pc, #0x64] /* data_3744 */
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
/*0x36f2*/      ldr r0, [pc, #0x54] /* data_3748 */
/*0x36f4*/      ldrh r1, [r0]
/*0x36f6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36f8*/      strh r1, [r0]
/*0x36fa*/      ldr r0, [pc, #0x50] /* data_374c */
/*0x36fc*/      ldr r1, [r0]
/*0x36fe*/      cbz r1, jump_3706
/*0x3700*/      ldr r1, [r0]
/*0x3702*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3704*/      str r1, [r0]
            jump_3706:
/*0x3706*/      ldr r0, [pc, #0x48] /* data_3750 */
/*0x3708*/      ldr r1, [r0]
/*0x370a*/      cbz r1, jump_3712
/*0x370c*/      ldr r1, [r0]
/*0x370e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3710*/      str r1, [r0]
            jump_3712:
/*0x3712*/      ldr r0, [pc, #0x40] /* data_3754 */
/*0x3714*/      ldrb r1, [r0]
/*0x3716*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3718*/      strb r1, [r0]
/*0x371a*/      ldr r1, [pc, #0x3c] /* data_3758 */
/*0x371c*/      ldrh r0, [r1]
/*0x371e*/      cmp r0, #1
/*0x3720*/      bls jump_3726
/*0x3722*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3724*/      strh r0, [r1]
            jump_3726:
/*0x3726*/      ldr r0, [pc, #0x34] /* data_375c */
/*0x3728*/      ldrh r1, [r0]
/*0x372a*/      cmp r1, #0
/*0x372c*/      beq jump_373c
/*0x372e*/      ldrh r1, [r0]
/*0x3730*/      cmp.w r1, #0xff00
/*0x3734*/      bhs jump_373c
/*0x3736*/      ldrh r1, [r0]
/*0x3738*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x373a*/      strh r1, [r0]
            jump_373c:
/*0x373c*/      pop {r4, pc}

/*0x373e*/  .byte 0x00
/*0x373f*/  .byte 0x00

            data_3740:
/*0x3740*/  .word 0x40076000
            data_3744:
/*0x3744*/  .word 0x200004c8
            data_3748:
/*0x3748*/  .word 0x20000066
            data_374c:
/*0x374c*/  .word 0x2000000c
            data_3750:
/*0x3750*/  .word 0x20000060
            data_3754:
/*0x3754*/  .word 0x2000004e
            data_3758:
/*0x3758*/  .word 0x20000006
            data_375c:
/*0x375c*/  .word 0x2000001c


            .thumb_func
            bftm1_intr:
/*0x3760*/      push {r4, lr}
/*0x3762*/      ldr r0, [pc, #0x4c] /* data_37b0 */
/*0x3764*/      bl call_37c0
/*0x3768*/      ldr r4, [pc, #0x48] /* data_37b4 */
/*0x376a*/      ldr r0, [r4, #4]
/*0x376c*/      ldrh r1, [r0, #4]
/*0x376e*/      ldr r0, [r0]
/*0x3770*/      uxth r1, r1
/*0x3772*/      bl call_4724
/*0x3776*/      movs r0, #0xa
/*0x3778*/      bl spin_wait /* (time) */
/*0x377c*/      movs r0, #2
/*0x377e*/      bl call_7c8c
/*0x3782*/      ldr r1, [pc, #0x34] /* data_37b8 */
/*0x3784*/      mov.w r0, #0x8000
/*0x3788*/      str r0, [r1, #0x24]
/*0x378a*/      ldr r0, [pc, #0x30] /* data_37bc */
/*0x378c*/      ldrb r1, [r4, #1]
/*0x378e*/      add.w r0, r0, r1, lsl #3
/*0x3792*/      str r0, [r4, #4]
/*0x3794*/      ldrh r1, [r0, #4]
/*0x3796*/      ldr r0, [r0]
/*0x3798*/      uxth r1, r1
/*0x379a*/      bl call_46b8
/*0x379e*/      ldrb r0, [r4, #1]
/*0x37a0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x37a2*/      and r0, r0, #7
/*0x37a6*/      strb r0, [r4, #1]
/*0x37a8*/      pop.w {r4, lr}
/*0x37ac*/      b.w call_6b60

            data_37b0:
/*0x37b0*/  .word 0x40077000
            data_37b4:
/*0x37b4*/  .word 0x20000020
            data_37b8:
/*0x37b8*/  .word 0x400b0000
            data_37bc:
/*0x37bc*/  .word 0x00008780 /* possible pointer */


            .thumb_func
            call_37c0:
/*0x37c0*/      ldr r1, [r0, #4]
/*0x37c2*/      bic r1, r1, #1
/*0x37c6*/      str r1, [r0, #4]
/*0x37c8*/      dsb sy
/*0x37cc*/      bx lr

            .thumb_func
            call_37ce:
/*0x37ce*/      cmp r1, #0
/*0x37d0*/      ldr r1, [r0]
/*0x37d2*/      beq jump_37da
/*0x37d4*/      orr r1, r1, #4
/*0x37d8*/      b jump_37de
            jump_37da:
/*0x37da*/      bic r1, r1, #4
            jump_37de:
/*0x37de*/      str r1, [r0]
/*0x37e0*/      bx lr

            .thumb_func
            call_37e2:
/*0x37e2*/      cmp r1, #0
/*0x37e4*/      ldr r1, [r0]
/*0x37e6*/      beq jump_37ee
/*0x37e8*/      orr r1, r1, #1
/*0x37ec*/      b jump_37f2
            jump_37ee:
/*0x37ee*/      bic r1, r1, #1
            jump_37f2:
/*0x37f2*/      str r1, [r0]
/*0x37f4*/      bx lr

            .thumb_func
            call_37f6:
/*0x37f6*/      str r1, [r0, #0xc]
/*0x37f8*/      bx lr

            .thumb_func
            call_37fa:
/*0x37fa*/      str r1, [r0, #8]
/*0x37fc*/      bx lr

/*0x37fe*/  .byte 0x00
/*0x37ff*/  .byte 0x00


            .thumb_func
            call_3800:
/*0x3800*/      lsls r0, r0, #3
/*0x3802*/      lsrs r3, r1, #3
/*0x3804*/      add.w r0, r0, r3, lsl #2
/*0x3808*/      ldr r3, [pc, #0x18] /* data_3824 */
/*0x380a*/      push {r4, lr}
/*0x380c*/      add r0, r3
/*0x380e*/      lsls r1, r1, #0x1d
/*0x3810*/      ldr r3, [r0]
/*0x3812*/      lsrs r1, r1, #0x1b
/*0x3814*/      movs r4, #0xf
/*0x3816*/      lsls r4, r1
/*0x3818*/      bics r3, r4
/*0x381a*/      lsls r2, r1
/*0x381c*/      orrs r3, r2
/*0x381e*/      str r3, [r0]
/*0x3820*/      pop {r4, pc}

/*0x3822*/  .byte 0x00
/*0x3823*/  .byte 0x00

            data_3824:
/*0x3824*/  .word 0x40022020


            .thumb_func
            spin_wait: /* (time) */
/*0x3828*/      add.w r0, r0, r0, lsl #2
/*0x382c*/      lsls r0, r0, #2
            jump_382e:
/*0x382e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3830*/      bhs jump_382e
/*0x3832*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x3834*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3838*/      mov.w r5, #0x4000
/*0x383c*/      movs r4, #0
/*0x383e*/      lsls r0, r5, #2
/*0x3840*/      mov r2, r4
/*0x3842*/      mov r8, r0
/*0x3844*/      movs r3, #1
/*0x3846*/      mov r1, r5
/*0x3848*/      bl call_39a8
/*0x384c*/      ldr r6, [pc, #0x94] /* data_38e4 */
/*0x384e*/      movs r2, #0
/*0x3850*/      mov r1, r5
/*0x3852*/      mov r0, r6
/*0x3854*/      bl call_46dc
/*0x3858*/      lsls r7, r5, #1
/*0x385a*/      movs r2, #0
/*0x385c*/      mov r1, r7
/*0x385e*/      mov r0, r6
/*0x3860*/      bl call_46dc
/*0x3864*/      movs r2, #2
/*0x3866*/      mov r1, r5
/*0x3868*/      mov r0, r6
/*0x386a*/      bl call_46fc
/*0x386e*/      movs r2, #2
/*0x3870*/      mov r1, r7
/*0x3872*/      mov r0, r6
/*0x3874*/      bl call_46fc
/*0x3878*/      asrs r5, r5, #3
/*0x387a*/      movs r2, #0
/*0x387c*/      mov r1, r5
/*0x387e*/      mov r0, r6
/*0x3880*/      bl call_46dc
/*0x3884*/      movs r2, #2
/*0x3886*/      mov r1, r5
/*0x3888*/      mov r0, r6
/*0x388a*/      bl call_46fc
/*0x388e*/      movs r2, #1
/*0x3890*/      movs r1, #0xb
/*0x3892*/      movs r0, #0
/*0x3894*/      bl call_3800
/*0x3898*/      movs r2, #1
/*0x389a*/      movs r1, #0xd
/*0x389c*/      movs r0, #2
/*0x389e*/      bl call_3800
/*0x38a2*/      movs r2, #1
/*0x38a4*/      movs r1, #0xe
/*0x38a6*/      movs r0, #2
/*0x38a8*/      bl call_3800
/*0x38ac*/      movs r2, #1
/*0x38ae*/      movs r1, #0xf
/*0x38b0*/      movs r0, #2
/*0x38b2*/      bl call_3800
/*0x38b6*/      ldr r0, [pc, #0x30] /* data_38e8 */
/*0x38b8*/      ldr r0, [r0, #4]
/*0x38ba*/      lsls r0, r0, #0x15
/*0x38bc*/      bmi jump_38d2
/*0x38be*/      movs r2, #1
/*0x38c0*/      movs r1, #0xe
/*0x38c2*/      mov r0, r2
/*0x38c4*/      bl call_3800
/*0x38c8*/      movs r2, #1
/*0x38ca*/      movs r1, #0xf
/*0x38cc*/      mov r0, r2
/*0x38ce*/      bl call_3800
            jump_38d2:
/*0x38d2*/      mov r1, r4
/*0x38d4*/      movs r3, #0
/*0x38d6*/      mov r2, r4
/*0x38d8*/      mov r0, r8
/*0x38da*/      bl call_39a8
/*0x38de*/      movs r0, #1
/*0x38e0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_38e4:
/*0x38e4*/  .word 0x400b0000
            data_38e8:
/*0x38e8*/  .word 0x40088000


            .thumb_func
            call_38ec:
/*0x38ec*/      push {r4, r5, r6, lr}
/*0x38ee*/      ldr r6, [pc, #0x3c] /* data_392c */
/*0x38f0*/      mov r4, r0
/*0x38f2*/      ldr r0, [r6, #0x34]
/*0x38f4*/      lsrs r5, r0, #0x1e
/*0x38f6*/      bl call_3934
/*0x38fa*/      str r0, [r4]
/*0x38fc*/      cmp r5, #1
/*0x38fe*/      beq jump_390c
/*0x3900*/      ldr r0, [pc, #0x2c] /* data_3930 */
/*0x3902*/      cmp r5, #2
/*0x3904*/      beq jump_390c
/*0x3906*/      cmp r5, #3
/*0x3908*/      beq jump_390c
/*0x390a*/      movs r0, #0
            jump_390c:
/*0x390c*/      str r0, [r4, #4]
/*0x390e*/      ldr r1, [r6, #0x20]
/*0x3910*/      lsrs r0, r1
/*0x3912*/      str r0, [r4, #8]
/*0x3914*/      ldr r1, [r6, #0x28]
/*0x3916*/      ubfx r1, r1, #0x10, #3
/*0x391a*/      cmp r1, #7
/*0x391c*/      beq jump_3924
/*0x391e*/      lsrs r0, r1
            jump_3920:
/*0x3920*/      str r0, [r4, #0xc]
/*0x3922*/      pop {r4, r5, r6, pc}
            jump_3924:
/*0x3924*/      movs r1, #6
/*0x3926*/      udiv r0, r0, r1
/*0x392a*/      b jump_3920

            data_392c:
/*0x392c*/  .word 0x40088000
            data_3930:
/*0x3930*/  .word 0x007a1200


            .thumb_func
            call_3934:
/*0x3934*/      ldr r1, [pc, #0x30] /* data_3968 */
/*0x3936*/      ldr.w r0, [r1, #0xa4]
/*0x393a*/      cmp r0, #0
/*0x393c*/      beq jump_3966
/*0x393e*/      ldr r0, [r1, #0x20]
/*0x3940*/      ldr r0, [pc, #0x28] /* data_396c */
/*0x3942*/      ldr.w r1, [r1, #0x3fc]
/*0x3946*/      cmp r1, #1
/*0x3948*/      beq jump_3966
/*0x394a*/      ldr r2, [pc, #0x24] /* data_3970 */
/*0x394c*/      ldr r1, [r2, #0x18]
/*0x394e*/      ubfx r1, r1, #0x17, #6
/*0x3952*/      cbnz r1, jump_3956
/*0x3954*/      movs r1, #0x40
            jump_3956:
/*0x3956*/      ldr r2, [r2, #0x18]
/*0x3958*/      ubfx r3, r2, #0x15, #2
/*0x395c*/      movs r2, #1
/*0x395e*/      lsls r2, r3
/*0x3960*/      udiv r0, r0, r2
/*0x3964*/      muls r0, r1, r0
            jump_3966:
/*0x3966*/      bx lr

            data_3968:
/*0x3968*/  .word 0x43100000
            data_396c:
/*0x396c*/  .word 0x007a1200
            data_3970:
/*0x3970*/  .word 0x40088000


            .thumb_func
            call_3974:
/*0x3974*/      push {r0, r1, r2, r3, r4, lr}
/*0x3976*/      ldr r2, [pc, #0x2c] /* data_39a4 */
/*0x3978*/      lsrs r1, r0, #5
/*0x397a*/      add.w r2, r2, r1, lsl #2
/*0x397e*/      movs r1, #0
/*0x3980*/      cmp r0, #0x2e
/*0x3982*/      bne jump_3986
/*0x3984*/      movs r1, #2
            jump_3986:
/*0x3986*/      ldr r2, [r2]
/*0x3988*/      movs r3, #3
/*0x398a*/      subs r0, #0x20
/*0x398c*/      lsls r3, r0
/*0x398e*/      ands r2, r3
/*0x3990*/      lsrs r2, r0
/*0x3992*/      adds r4, r2, r1
/*0x3994*/      mov r0, sp
/*0x3996*/      bl call_38ec
/*0x399a*/      ldr r0, [sp, #8]
/*0x399c*/      add sp, #0x10
/*0x399e*/      lsrs r0, r4
/*0x39a0*/      pop {r4, pc}

/*0x39a2*/  .byte 0x00
/*0x39a3*/  .byte 0x00

            data_39a4:
/*0x39a4*/  .word 0x40088038


            .thumb_func
            call_39a8:
/*0x39a8*/      push {r4, r5, r6, r7, lr}
/*0x39aa*/      ldr r7, [pc, #0x1c] /* data_39c8 */
/*0x39ac*/      ldr r4, [r7, #0x24]
/*0x39ae*/      ldr r5, [r7, #0x2c]
/*0x39b0*/      ldr r6, [r7, #0x30]
/*0x39b2*/      bics r4, r0
/*0x39b4*/      bics r5, r1
/*0x39b6*/      bics r6, r2
/*0x39b8*/      cbz r3, jump_39c0
/*0x39ba*/      orrs r4, r0
/*0x39bc*/      orrs r5, r1
/*0x39be*/      orrs r6, r2
            jump_39c0:
/*0x39c0*/      str r4, [r7, #0x24]
/*0x39c2*/      str r5, [r7, #0x2c]
/*0x39c4*/      str r6, [r7, #0x30]
/*0x39c6*/      pop {r4, r5, r6, r7, pc}

            data_39c8:
/*0x39c8*/  .word 0x40088000


            .thumb_func
            call_39cc:
/*0x39cc*/      ldr r1, [pc, #0xc] /* data_39dc */
/*0x39ce*/      ldr r2, [r1]
/*0x39d0*/      bic r2, r2, #0xc00000
/*0x39d4*/      orr.w r0, r2, r0, lsl #22
/*0x39d8*/      str r0, [r1]
/*0x39da*/      bx lr

            data_39dc:
/*0x39dc*/  .word 0x40088000


            .thumb_func
            call_39e0:
/*0x39e0*/      ldr r3, [pc, #0x18] /* data_39fc */
/*0x39e2*/      str r0, [r3, #4]
/*0x39e4*/      movs r0, #0
/*0x39e6*/      str r0, [r3]
/*0x39e8*/      b jump_39f0
            jump_39ea:
/*0x39ea*/      ldrb r0, [r1], #1
/*0x39ee*/      strb r0, [r3, #0xc]
            jump_39f0:
/*0x39f0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x39f2*/      bhs jump_39ea
/*0x39f4*/      ldr r0, [r3, #8]
/*0x39f6*/      uxth r0, r0
/*0x39f8*/      bx lr

/*0x39fa*/  .byte 0x00
/*0x39fb*/  .byte 0x00

            data_39fc:
/*0x39fc*/  .word 0x4008a000


            .thumb_func
            call_3a00:
/*0x3a00*/      push {r4, r5, r6, lr}
/*0x3a02*/      ldr r1, [pc, #0xac] /* data_3ab0 */
/*0x3a04*/      ldrb r0, [r1, #6]
/*0x3a06*/      cmp r0, #0
/*0x3a08*/      beq jump_3a4e
/*0x3a0a*/      ldr r5, [pc, #0xa8] /* data_3ab4 */
/*0x3a0c*/      movs r2, #1
/*0x3a0e*/      str r2, [r5, #4]
/*0x3a10*/      ldr r0, [pc, #0xa4] /* data_3ab8 */
/*0x3a12*/      ldrb r0, [r0, #3]
/*0x3a14*/      lsls r0, r0, #0x1e
/*0x3a16*/      bpl jump_3a4e
/*0x3a18*/      ldr r0, [pc, #0x9c] /* data_3ab8 */
/*0x3a1a*/      ldrb r3, [r1, #7]
/*0x3a1c*/      ldrb r0, [r0]
/*0x3a1e*/      cbz r3, jump_3a64
/*0x3a20*/      cmp r0, #0x27
/*0x3a22*/      beq jump_3a44
/*0x3a24*/      bgt jump_3a38
/*0x3a26*/      cmp r0, #0x1e
/*0x3a28*/      beq jump_3a50
/*0x3a2a*/      cmp r0, #0x1f
/*0x3a2c*/      beq jump_3a50
/*0x3a2e*/      cmp r0, #0x20
/*0x3a30*/      beq jump_3a50
/*0x3a32*/      cmp r0, #0x26
/*0x3a34*/      bne jump_3a4e
/*0x3a36*/      b jump_3a44
            jump_3a38:
/*0x3a38*/      cmp r0, #0x29
/*0x3a3a*/      beq jump_3a4c
/*0x3a3c*/      cmp r0, #0x2d
/*0x3a3e*/      beq jump_3a44
/*0x3a40*/      cmp r0, #0x2e
/*0x3a42*/      bne jump_3a4e
            jump_3a44:
/*0x3a44*/      pop.w {r4, r5, r6, lr}
/*0x3a48*/      b.w jump_76bc
            jump_3a4c:
/*0x3a4c*/      strb r2, [r1, #2]
            jump_3a4e:
/*0x3a4e*/      pop {r4, r5, r6, pc}
            jump_3a50:
/*0x3a50*/      subs r0, #0x1e
/*0x3a52*/      uxtb r1, r0
/*0x3a54*/      ldr r0, [pc, #0x5c] /* data_3ab4 */
/*0x3a56*/      movs r2, #1
/*0x3a58*/      adds r4, r0, r1
/*0x3a5a*/      ldrb r0, [r4]
/*0x3a5c*/      bl call_5558
/*0x3a60*/      strb r0, [r4]
            jump_3a62:
/*0x3a62*/      pop {r4, r5, r6, pc}
            jump_3a64:
/*0x3a64*/      cmp r0, #0xcf
/*0x3a66*/      beq jump_3a62
/*0x3a68*/      ldr r1, [pc, #0x50] /* data_3abc */
/*0x3a6a*/      ldr r2, [pc, #0x54] /* data_3ac0 */
/*0x3a6c*/      ldrb r3, [r1, #3]
/*0x3a6e*/      ldrb r0, [r2, r0]
/*0x3a70*/      cmp r3, #5
/*0x3a72*/      beq jump_3a94
/*0x3a74*/      add.w r0, r0, r0, lsl #1
/*0x3a78*/      adds r4, r0, r1
/*0x3a7a*/      add.w r4, r4, #0x172
            jump_3a7e:
/*0x3a7e*/      movs r2, #3
/*0x3a80*/      mov r1, r4
/*0x3a82*/      ldr r0, [pc, #0x30] /* data_3ab4 */
/*0x3a84*/      bl memcmp /* (ptr1, ptr2, size) */
/*0x3a88*/      cbz r0, jump_3aa8
/*0x3a8a*/      ldrh r0, [r5]
/*0x3a8c*/      strh r0, [r4]
/*0x3a8e*/      ldrb r0, [r5, #2]
            jump_3a90:
/*0x3a90*/      strb r0, [r4, #2]
/*0x3a92*/      pop {r4, r5, r6, pc}
            jump_3a94:
/*0x3a94*/      ldr r2, [pc, #0x2c] /* data_3ac4 */
/*0x3a96*/      ldrb r0, [r2, r0]
/*0x3a98*/      and r0, r0, #7
/*0x3a9c*/      add.w r0, r0, r0, lsl #1
/*0x3aa0*/      adds r4, r0, r1
/*0x3aa2*/      addw r4, r4, #0x2c2
/*0x3aa6*/      b jump_3a7e
            jump_3aa8:
/*0x3aa8*/      movs r0, #0
/*0x3aaa*/      strh r0, [r4]
/*0x3aac*/      b jump_3a90

/*0x3aae*/  .byte 0x00
/*0x3aaf*/  .byte 0x00

            data_3ab0:
/*0x3ab0*/  .word 0x20000580
            data_3ab4:
/*0x3ab4*/  .word 0x20000008
            data_3ab8:
/*0x3ab8*/  .word 0x20000054
            data_3abc:
/*0x3abc*/  .word 0x20000620
            data_3ac0:
/*0x3ac0*/  .word 0x200000f0
            data_3ac4:
/*0x3ac4*/  .word 0x00008c99 /* possible pointer */


            .thumb_func
            call_3ac8:
/*0x3ac8*/      movs r1, #3
/*0x3aca*/      ldr r2, [pc, #0x10] /* data_3adc */
/*0x3acc*/      b jump_3ad2
            jump_3ace:
/*0x3ace*/      ldrb r3, [r0, r1]
/*0x3ad0*/      strb r3, [r2, r1]
            jump_3ad2:
/*0x3ad2*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3ad4*/      uxtb r1, r1
/*0x3ad6*/      bhs jump_3ace
/*0x3ad8*/      bx lr

/*0x3ada*/  .byte 0x00
/*0x3adb*/  .byte 0x00

            data_3adc:
/*0x3adc*/  .word 0x20000008


            .thumb_func
            call_3ae0:
/*0x3ae0*/      ldr r0, [pc, #0x18] /* data_3afc */
/*0x3ae2*/      ldrb r0, [r0, #6]
/*0x3ae4*/      cmp r0, #0
/*0x3ae6*/      beq jump_3af8
/*0x3ae8*/      ldr r0, [pc, #0x14] /* data_3b00 */
/*0x3aea*/      ldr r0, [r0, #4]
/*0x3aec*/      movw r1, #0x9c40
/*0x3af0*/      cmp r0, r1
/*0x3af2*/      blo jump_3af8
/*0x3af4*/      b.w jump_76bc
            jump_3af8:
/*0x3af8*/      bx lr

/*0x3afa*/  .byte 0x00
/*0x3afb*/  .byte 0x00

            data_3afc:
/*0x3afc*/  .word 0x20000580
            data_3b00:
/*0x3b00*/  .word 0x20000008

            jump_3b04:
/*0x3b04*/      push {r4, r5, r6, lr}
/*0x3b06*/      cbz r0, jump_3b30
/*0x3b08*/      ldr r5, [pc, #0x3c] /* data_3b48 */
/*0x3b0a*/      movs r4, #0x70
/*0x3b0c*/      ldr r6, [pc, #0x3c] /* data_3b4c */
/*0x3b0e*/      b jump_3b28
            jump_3b10:
/*0x3b10*/      ldrb r0, [r5], #-1
/*0x3b14*/      and r0, r0, #7
/*0x3b18*/      add.w r0, r0, r0, lsl #1
/*0x3b1c*/      adds r1, r0, r6
/*0x3b1e*/      mov r0, r4
/*0x3b20*/      addw r1, r1, #0x2c2
/*0x3b24*/      bl call_4210
            jump_3b28:
/*0x3b28*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3b2a*/      uxtb r4, r4
/*0x3b2c*/      bhs jump_3b10
/*0x3b2e*/      pop {r4, r5, r6, pc}
            jump_3b30:
/*0x3b30*/      ldr r5, [pc, #0x1c] /* data_3b50 */
/*0x3b32*/      movs r4, #0x70
/*0x3b34*/      b jump_3b40
            jump_3b36:
/*0x3b36*/      mov r1, r5
/*0x3b38*/      mov r0, r4
/*0x3b3a*/      bl call_4210
/*0x3b3e*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3b40:
/*0x3b40*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3b42*/      uxtb r4, r4
/*0x3b44*/      bhs jump_3b36
/*0x3b46*/      pop {r4, r5, r6, pc}

            data_3b48:
/*0x3b48*/  .word 0x00008d08 /* possible pointer */
            data_3b4c:
/*0x3b4c*/  .word 0x20000620
            data_3b50:
/*0x3b50*/  .word 0x200008df


            .thumb_func
            call_3b54:
/*0x3b54*/      cmp r0, #1
/*0x3b56*/      beq jump_3b62
/*0x3b58*/      movs r0, #5
            jump_3b5a:
/*0x3b5a*/      ldr r1, [pc, #0xc] /* data_3b68 */
/*0x3b5c*/      strb r0, [r1, #3]
/*0x3b5e*/      b.w call_40d4
            jump_3b62:
/*0x3b62*/      movs r0, #4
/*0x3b64*/      b jump_3b5a

/*0x3b66*/  .byte 0x00
/*0x3b67*/  .byte 0x00

            data_3b68:
/*0x3b68*/  .word 0x20000620


            .thumb_func
            call_3b6c:
/*0x3b6c*/      push {r4, lr}
/*0x3b6e*/      bl call_3b54
/*0x3b72*/      ldr r0, [pc, #0x14] /* data_3b88 */
/*0x3b74*/      movs r1, #1
/*0x3b76*/      strb r1, [r0, #6]
/*0x3b78*/      ldr r0, [pc, #0x10] /* data_3b8c */
/*0x3b7a*/      str r1, [r0, #4]
/*0x3b7c*/      ldr r1, [pc, #0x10] /* data_3b90 */
/*0x3b7e*/      ldrh r2, [r1]
/*0x3b80*/      strh r2, [r0]
/*0x3b82*/      ldrb r1, [r1, #2]
/*0x3b84*/      strb r1, [r0, #2]
/*0x3b86*/      pop {r4, pc}

            data_3b88:
/*0x3b88*/  .word 0x20000580
            data_3b8c:
/*0x3b8c*/  .word 0x20000008
            data_3b90:
/*0x3b90*/  .word 0x00008628 /* possible pointer */


            .thumb_func
            call_3b94:
/*0x3b94*/      push {r4, lr}
/*0x3b96*/      bl call_5aec
/*0x3b9a*/      ldr r0, [pc, #0x48] /* data_3be4 */
/*0x3b9c*/      ldrb r0, [r0, #7]
/*0x3b9e*/      cmp r0, #4
/*0x3ba0*/      beq jump_3ba6
/*0x3ba2*/      cmp r0, #5
/*0x3ba4*/      bne jump_3bae
            jump_3ba6:
/*0x3ba6*/      ldr r0, [pc, #0x40] /* data_3be8 */
/*0x3ba8*/      ldrh r0, [r0, #2]
/*0x3baa*/      lsls r0, r0, #0x15
/*0x3bac*/      bpl jump_3bb8
            jump_3bae:
/*0x3bae*/      ldr r1, [pc, #0x3c] /* data_3bec */
/*0x3bb0*/      movs r0, #0x26
/*0x3bb2*/      bl call_4210
/*0x3bb6*/      b jump_3bc0
            jump_3bb8:
/*0x3bb8*/      movs r1, #0
/*0x3bba*/      movs r0, #0x26
/*0x3bbc*/      bl call_4254
            jump_3bc0:
/*0x3bc0*/      movs r1, #0
/*0x3bc2*/      movs r0, #0x1e
/*0x3bc4*/      bl call_4254
/*0x3bc8*/      ldr r0, [pc, #0x24] /* data_3bf0 */
/*0x3bca*/      ldrb r0, [r0, #2]
/*0x3bcc*/      cmp r0, #0
/*0x3bce*/      beq jump_3be0
/*0x3bd0*/      ldr r2, [pc, #0x20] /* data_3bf4 */
/*0x3bd2*/      rsb r0, r0, r0, lsl #3
/*0x3bd6*/      add.w r0, r2, r0, lsl #4
/*0x3bda*/      movs r1, #0xff
/*0x3bdc*/      strb r1, [r0, #-0x52]
            jump_3be0:
/*0x3be0*/      pop {r4, pc}

/*0x3be2*/  .byte 0x00
/*0x3be3*/  .byte 0x00

            data_3be4:
/*0x3be4*/  .word 0x200018fc
            data_3be8:
/*0x3be8*/  .word 0x20000064
            data_3bec:
/*0x3bec*/  .word 0x00008b75 /* possible pointer */
            data_3bf0:
/*0x3bf0*/  .word 0x2000005c
            data_3bf4:
/*0x3bf4*/  .word 0x20000278

            bootloader_crc_magic:
/*0x3bf8*/  .byte 0xc0
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
/*0x3c04*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3c08*/      ldr r6, [pc, #0xcc] /* data_3cd8 */
/*0x3c0a*/      ldr r4, [pc, #0xd0] /* data_3cdc */
/*0x3c0c*/      ldr r5, [pc, #0xd0] /* data_3ce0 */
/*0x3c0e*/      ldrb r0, [r6, #0xa]
/*0x3c10*/      cmp r0, #1
/*0x3c12*/      beq jump_3c26
/*0x3c14*/      ldr r0, [pc, #0xcc] /* data_3ce4 */
/*0x3c16*/      bl call_4230
/*0x3c1a*/      movs r0, #4
/*0x3c1c*/      movs r2, #0
/*0x3c1e*/      ldr r1, [pc, #0xc8] /* data_3ce8 */
/*0x3c20*/      ldr r3, [pc, #0xc8] /* data_3cec */
/*0x3c22*/      ldr r7, [pc, #0xcc] /* data_3cf0 */
/*0x3c24*/      b jump_3c60
            jump_3c26:
/*0x3c26*/      ldr r0, [pc, #0xc0] /* data_3ce8 */
/*0x3c28*/      mov.w r1, #0x150
/*0x3c2c*/      subs r0, #0xe0
/*0x3c2e*/      bl mem_zero /* (dest, size) */
/*0x3c32*/      ldrb r0, [r5]
/*0x3c34*/      cmp r0, #0x55
/*0x3c36*/      bne jump_3c42
/*0x3c38*/      ldrb.w r0, [r4, #0x58]
/*0x3c3c*/      ldr r1, [pc, #0xa4] /* data_3ce4 */
/*0x3c3e*/      bl call_4210
            jump_3c42:
/*0x3c42*/      ldrb r0, [r5]
/*0x3c44*/      cmp r0, #0x23
/*0x3c46*/      bne jump_3c7e
/*0x3c48*/      ldrb.w r0, [r4, #0x59]
/*0x3c4c*/      ldr r1, [pc, #0x94] /* data_3ce4 */
/*0x3c4e*/      bl call_4210
/*0x3c52*/      b jump_3c7e
            jump_3c54:
/*0x3c54*/      ldrb.w ip, [r3, r0]
/*0x3c58*/      ldrb.w ip, [r7, ip]
/*0x3c5c*/      strb.w r2, [ip, r1]
            jump_3c60:
/*0x3c60*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3c62*/      uxtb r0, r0
/*0x3c64*/      bhs jump_3c54
/*0x3c66*/      ldrb r0, [r6, #0xa]
/*0x3c68*/      cmp r0, #2
/*0x3c6a*/      beq jump_3c72
/*0x3c6c*/      cmp r0, #3
/*0x3c6e*/      beq jump_3c78
/*0x3c70*/      b jump_3c7e
            jump_3c72:
/*0x3c72*/      ldrb.w r0, [r4, #0x59]
/*0x3c76*/      b jump_3c7c
            jump_3c78:
/*0x3c78*/      ldrb.w r0, [r4, #0x58]
            jump_3c7c:
/*0x3c7c*/      strb r2, [r0, r1]
            jump_3c7e:
/*0x3c7e*/      ldr r0, [pc, #0x74] /* data_3cf4 */
/*0x3c80*/      ldrh r0, [r0, #2]
/*0x3c82*/      lsls r0, r0, #0x15
/*0x3c84*/      bpl jump_3ca8
/*0x3c86*/      ldrb r0, [r5]
/*0x3c88*/      cmp r0, #0x55
/*0x3c8a*/      bne jump_3c96
/*0x3c8c*/      ldr r1, [pc, #0x54] /* data_3ce4 */
/*0x3c8e*/      movs r0, #0x26
/*0x3c90*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
/*0x3c92*/      bl call_4210
            jump_3c96:
/*0x3c96*/      ldrb r0, [r5]
/*0x3c98*/      cmp r0, #0x23
/*0x3c9a*/      bne jump_3cb0
/*0x3c9c*/      ldr r1, [pc, #0x44] /* data_3ce4 */
/*0x3c9e*/      movs r0, #0x26
/*0x3ca0*/      .short 0x1d89 /* adds r1, r1, #6 */ 
/*0x3ca2*/      bl call_4210
/*0x3ca6*/      b jump_3cb0
            jump_3ca8:
/*0x3ca8*/      movs r1, #0
/*0x3caa*/      movs r0, #0x26
/*0x3cac*/      bl call_4254
            jump_3cb0:
/*0x3cb0*/      movs r1, #0
/*0x3cb2*/      movs r0, #0x1e
/*0x3cb4*/      bl call_4254
/*0x3cb8*/      ldr r0, [pc, #0x3c] /* data_3cf8 */
/*0x3cba*/      ldrb r0, [r0, #2]
/*0x3cbc*/      cmp r0, #0
/*0x3cbe*/      beq jump_3cd2
/*0x3cc0*/      ldr r2, [pc, #0x24] /* data_3ce8 */
/*0x3cc2*/      movs r1, #0xff
/*0x3cc4*/      rsb r0, r0, r0, lsl #3
/*0x3cc8*/      subs r2, #0xe0
/*0x3cca*/      add.w r0, r2, r0, lsl #4
/*0x3cce*/      strb r1, [r0, #-0x52]
            jump_3cd2:
/*0x3cd2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x3cd6*/  .byte 0x00
/*0x3cd7*/  .byte 0x00

            data_3cd8:
/*0x3cd8*/  .word 0x20000580
            data_3cdc:
/*0x3cdc*/  .word 0x20000620
            data_3ce0:
/*0x3ce0*/  .word 0x20000001
            data_3ce4:
/*0x3ce4*/  .word 0x00008b75 /* possible pointer */
            data_3ce8:
/*0x3ce8*/  .word 0x20000358
            data_3cec:
/*0x3cec*/  .word 0x000085a1 /* possible pointer */
            data_3cf0:
/*0x3cf0*/  .word 0x200000f0
            data_3cf4:
/*0x3cf4*/  .word 0x20000064
            data_3cf8:
/*0x3cf8*/  .word 0x2000005c


            .thumb_func
            call_3cfc:
/*0x3cfc*/      push {r4, r5, r6, lr}
/*0x3cfe*/      ldr r0, [pc, #0x90] /* data_3d90 */
/*0x3d00*/      ldr r5, [pc, #0x90] /* data_3d94 */
/*0x3d02*/      mov.w r1, #0x150
/*0x3d06*/      ldrb r0, [r0, #0xb]
/*0x3d08*/      cmp r0, #8
/*0x3d0a*/      bhs switch_3d60
/*0x3d0c*/      tbb [pc, r0]

/*0x3d10*/  .byte 0x28 /* case switch_3d60 */
/*0x3d11*/  .byte 0x04 /* case switch_3d18 */
/*0x3d12*/  .byte 0x04 /* case switch_3d18 */
/*0x3d13*/  .byte 0x04 /* case switch_3d18 */
/*0x3d14*/  .byte 0x0d /* case switch_3d2a */
/*0x3d15*/  .byte 0x0f /* case switch_3d2e */
/*0x3d16*/  .byte 0x15 /* case switch_3d3a */
/*0x3d17*/  .byte 0x29 /* case switch_3d62 */

            switch_3d18:
/*0x3d18*/      ldr r1, [pc, #0x7c] /* data_3d98 */
/*0x3d1a*/      rsb r0, r0, r0, lsl #3
/*0x3d1e*/      add.w r0, r1, r0, lsl #4
/*0x3d22*/      movs r2, #0xff
/*0x3d24*/      movs r1, #0x70
/*0x3d26*/      subs r0, #0x70
/*0x3d28*/      b jump_3d32
            switch_3d2a:
/*0x3d2a*/      movs r2, #0x80
/*0x3d2c*/      b jump_3d30
            switch_3d2e:
/*0x3d2e*/      movs r2, #0xff
            jump_3d30:
/*0x3d30*/      ldr r0, [pc, #0x64] /* data_3d98 */
            jump_3d32:
/*0x3d32*/      pop.w {r4, r5, r6, lr}
/*0x3d36*/      b.w mem_set /* (dest, size, val) */
            switch_3d3a:
/*0x3d3a*/      movs r4, #0x70
/*0x3d3c*/      ldr r6, [pc, #0x5c] /* data_3d9c */
/*0x3d3e*/      b jump_3d5a
            jump_3d40:
/*0x3d40*/      ldrb r0, [r6, r4]
/*0x3d42*/      ldrb r1, [r5, #5]
/*0x3d44*/      cmp r1, r0
/*0x3d46*/      bne jump_3d4c
/*0x3d48*/      movs r1, #0
/*0x3d4a*/      b jump_3d54
            jump_3d4c:
/*0x3d4c*/      ldrb r1, [r5, #4]
/*0x3d4e*/      cmp r1, r0
/*0x3d50*/      bne jump_3d5a
/*0x3d52*/      movs r1, #0xff
            jump_3d54:
/*0x3d54*/      mov r0, r4
/*0x3d56*/      bl call_4254
            jump_3d5a:
/*0x3d5a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3d5c*/      uxtb r4, r4
/*0x3d5e*/      bhs jump_3d40
            switch_3d60:
/*0x3d60*/      pop {r4, r5, r6, pc}
            switch_3d62:
/*0x3d62*/      ldr r0, [pc, #0x34] /* data_3d98 */
/*0x3d64*/      bl mem_zero /* (dest, size) */
/*0x3d68*/      ldrb r0, [r5, #4]
/*0x3d6a*/      cbz r0, jump_3d78
/*0x3d6c*/      movs r0, #0
            jump_3d6e:
/*0x3d6e*/      bl call_3f24
/*0x3d72*/      cbz r0, jump_3d7e
/*0x3d74*/      movs r0, #0x12
/*0x3d76*/      b jump_3d80
            jump_3d78:
/*0x3d78*/      movs r0, #1
/*0x3d7a*/      strb r0, [r5, #4]
/*0x3d7c*/      b jump_3d6e
            jump_3d7e:
/*0x3d7e*/      movs r0, #9
            jump_3d80:
/*0x3d80*/      ldr r1, [pc, #0x1c] /* data_3da0 */
/*0x3d82*/      ldrb r0, [r1, r0]
/*0x3d84*/      pop.w {r4, r5, r6, lr}
/*0x3d88*/      movs r1, #0xb4
/*0x3d8a*/      b.w call_4254

/*0x3d8e*/  .byte 0x00
/*0x3d8f*/  .byte 0x00

            data_3d90:
/*0x3d90*/  .word 0x20000580
            data_3d94:
/*0x3d94*/  .word 0x20001908
            data_3d98:
/*0x3d98*/  .word 0x20000278
            data_3d9c:
/*0x3d9c*/  .word 0x00008bb9 /* possible pointer */
            data_3da0:
/*0x3da0*/  .word 0x200000f0


            .thumb_func
            call_3da4:
/*0x3da4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3da8*/      ldr.w r8, [pc, #0xe4] /* data_3e90 */
/*0x3dac*/      ldrb.w r0, [r8, #2]
/*0x3db0*/      lsls r0, r0, #0x1d
/*0x3db2*/      bpl jump_3dba
/*0x3db4*/      bl call_590c
/*0x3db8*/      b jump_3dbe
            jump_3dba:
/*0x3dba*/      bl call_7728
            jump_3dbe:
/*0x3dbe*/      ldr r4, [pc, #0xd4] /* data_3e94 */
/*0x3dc0*/      ldr r5, [pc, #0xd4] /* data_3e98 */
/*0x3dc2*/      ldrb r0, [r4, #7]
/*0x3dc4*/      cbz r0, jump_3e0e
/*0x3dc6*/      ldrb r0, [r4, #6]
/*0x3dc8*/      cbnz r0, jump_3dd0
/*0x3dca*/      bl call_5704
/*0x3dce*/      cbz r0, jump_3e0e
            jump_3dd0:
/*0x3dd0*/      ldrb r0, [r4, #6]
/*0x3dd2*/      cbz r0, jump_3dd8
/*0x3dd4*/      ldr r7, [pc, #0xc4] /* data_3e9c */
/*0x3dd6*/      b jump_3ddc
            jump_3dd8:
/*0x3dd8*/      ldr r0, [pc, #0xc4] /* data_3ea0 */
/*0x3dda*/      ldr r7, [r0]
            jump_3ddc:
/*0x3ddc*/      movs r1, #3
/*0x3dde*/      ldr.w ip, [pc, #0xc4] /* data_3ea4 */
/*0x3de2*/      b jump_3e08
            jump_3de4:
/*0x3de4*/      add.w r0, ip, r1
/*0x3de8*/      ldrb r3, [r0, #0x1e]
/*0x3dea*/      movs r0, #3
/*0x3dec*/      b jump_3e02
            jump_3dee:
/*0x3dee*/      cmp r1, r0
/*0x3df0*/      bne jump_3df6
/*0x3df2*/      ldrb r2, [r7, r0]
/*0x3df4*/      b jump_3df8
            jump_3df6:
/*0x3df6*/      movs r2, #0
            jump_3df8:
/*0x3df8*/      rsb r6, r0, r0, lsl #3
/*0x3dfc*/      add.w r6, r5, r6, lsl #4
/*0x3e00*/      strb r2, [r6, r3]
            jump_3e02:
/*0x3e02*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3e04*/      uxtb r0, r0
/*0x3e06*/      bhs jump_3dee
            jump_3e08:
/*0x3e08*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3e0a*/      uxtb r1, r1
/*0x3e0c*/      bhs jump_3de4
            jump_3e0e:
/*0x3e0e*/      ldrb r0, [r4, #6]
/*0x3e10*/      cbz r0, jump_3e1c
/*0x3e12*/      ldrb.w r0, [r8, #0x59]
/*0x3e16*/      ldr r1, [pc, #0x84] /* data_3e9c */
/*0x3e18*/      bl call_4210
            jump_3e1c:
/*0x3e1c*/      ldrb r0, [r4, #9]
/*0x3e1e*/      cbz r0, jump_3e32
/*0x3e20*/      ldr r0, [pc, #0x84] /* data_3ea8 */
/*0x3e22*/      ldrh r0, [r0]
/*0x3e24*/      lsls r0, r0, #0x15
/*0x3e26*/      asrs r0, r0, #8
/*0x3e28*/      lsrs r1, r0, #0x18
/*0x3e2a*/      movs r0, #0x1e
/*0x3e2c*/      bl call_4254
/*0x3e30*/      b jump_3e4e
            jump_3e32:
/*0x3e32*/      movs r1, #0
/*0x3e34*/      movs r0, #0x1e
/*0x3e36*/      bl call_4254
/*0x3e3a*/      ldr r0, [pc, #0x70] /* data_3eac */
/*0x3e3c*/      ldrb r0, [r0, #2]
/*0x3e3e*/      cbz r0, jump_3e4e
/*0x3e40*/      rsb r0, r0, r0, lsl #3
/*0x3e44*/      add.w r0, r5, r0, lsl #4
/*0x3e48*/      movs r1, #0xff
/*0x3e4a*/      strb r1, [r0, #-0x52]
            jump_3e4e:
/*0x3e4e*/      ldr r0, [pc, #0x60] /* data_3eb0 */
/*0x3e50*/      ldrb r0, [r0]
/*0x3e52*/      cbz r0, jump_3e80
/*0x3e54*/      ldr r0, [pc, #0x5c] /* data_3eb4 */
/*0x3e56*/      ldrh r0, [r0, #2]
/*0x3e58*/      lsls r0, r0, #0x15
/*0x3e5a*/      bpl jump_3e80
/*0x3e5c*/      ldr r4, [pc, #0x58] /* data_3eb8 */
/*0x3e5e*/      ldrb r0, [r4]
/*0x3e60*/      cmp r0, #0x55
/*0x3e62*/      bne jump_3e6c
/*0x3e64*/      ldr r1, [pc, #0x54] /* data_3ebc */
/*0x3e66*/      movs r0, #0x26
/*0x3e68*/      bl call_4210
            jump_3e6c:
/*0x3e6c*/      ldrb r0, [r4]
/*0x3e6e*/      cmp r0, #0x23
/*0x3e70*/      bne jump_3e8c
/*0x3e72*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x3e76*/      ldr r1, [pc, #0x44] /* data_3ebc */
/*0x3e78*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
/*0x3e7a*/      movs r0, #0x26
/*0x3e7c*/      b.w call_4210
            jump_3e80:
/*0x3e80*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x3e84*/      movs r1, #0
/*0x3e86*/      movs r0, #0x26
/*0x3e88*/      b.w call_4254
            jump_3e8c:
/*0x3e8c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_3e90:
/*0x3e90*/  .word 0x20000620
            data_3e94:
/*0x3e94*/  .word 0x20000580
            data_3e98:
/*0x3e98*/  .word 0x20000278
            data_3e9c:
/*0x3e9c*/  .word 0x20000008
            data_3ea0:
/*0x3ea0*/  .word 0x20001908
            data_3ea4:
/*0x3ea4*/  .word 0x200000f0
            data_3ea8:
/*0x3ea8*/  .word 0x2000001c
            data_3eac:
/*0x3eac*/  .word 0x2000005c
            data_3eb0:
/*0x3eb0*/  .word 0x20000000
            data_3eb4:
/*0x3eb4*/  .word 0x20000064
            data_3eb8:
/*0x3eb8*/  .word 0x20000001
            data_3ebc:
/*0x3ebc*/  .word 0x00008b78 /* possible pointer */


            .thumb_func
            call_3ec0:
/*0x3ec0*/      push {r3, lr}
/*0x3ec2*/      bl call_60c8
/*0x3ec6*/      mov r1, sp
/*0x3ec8*/      movs r0, #0x20
/*0x3eca*/      bl call_4124
/*0x3ece*/      mov r1, sp
/*0x3ed0*/      movs r0, #0x4b
/*0x3ed2*/      bl call_4210
/*0x3ed6*/      pop {r3, pc}

            .thumb_func
            call_3ed8:
/*0x3ed8*/      mov r3, r1
/*0x3eda*/      ldr r1, [pc, #0x40] /* data_3f1c */
/*0x3edc*/      push {r4, lr}
/*0x3ede*/      ldrb r1, [r1, #2]
/*0x3ee0*/      cmp r1, #0
/*0x3ee2*/      beq jump_3f1a
/*0x3ee4*/      add.w r1, r1, r1, lsl #1
/*0x3ee8*/      add.w r4, r0, r1, lsl #3
/*0x3eec*/      subs r4, #0x18
/*0x3eee*/      lsrs r0, r4, #2
/*0x3ef0*/      lsls r1, r0, #0xc
/*0x3ef2*/      ldr r0, [pc, #0x2c] /* data_3f20 */
/*0x3ef4*/      mov.w r2, #0x1000
/*0x3ef8*/      add.w r1, r1, #0x5000
/*0x3efc*/      cbz r3, jump_3f06
/*0x3efe*/      pop.w {r4, lr}
/*0x3f02*/      b.w jump_76dc
            jump_3f06:
/*0x3f06*/      bl call_44f8
/*0x3f0a*/      ldr r1, [pc, #0x14] /* data_3f20 */
/*0x3f0c*/      and r0, r4, #3
/*0x3f10*/      add.w r0, r1, r0, lsl #10
/*0x3f14*/      ldr r1, [pc, #4] /* data_3f1c */
/*0x3f16*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x3f18*/      str r0, [r1]
            jump_3f1a:
/*0x3f1a*/      pop {r4, pc}

            data_3f1c:
/*0x3f1c*/  .word 0x2000005c
            data_3f20:
/*0x3f20*/  .word 0x200008f6


            .thumb_func
            call_3f24:
/*0x3f24*/      push {r3, r4, r5, lr}
/*0x3f26*/      mov r5, r0
/*0x3f28*/      movs r2, #2
/*0x3f2a*/      movs r1, #0
/*0x3f2c*/      mov r0, sp
/*0x3f2e*/      bl call_44f8
/*0x3f32*/      ldrh.w r1, [sp]
/*0x3f36*/      movw r4, #0x8001
/*0x3f3a*/      cmp r1, r4
/*0x3f3c*/      beq jump_3f5e
/*0x3f3e*/      cbz r5, jump_3f5a
/*0x3f40*/      ldr r0, [pc, #0x20] /* data_3f64 */
/*0x3f42*/      ldrb r0, [r0, #2]
/*0x3f44*/      bl call_4050
/*0x3f48*/      movs r2, #2
/*0x3f4a*/      movs r1, #0
/*0x3f4c*/      mov r0, sp
/*0x3f4e*/      bl call_44f8
/*0x3f52*/      ldrh.w r0, [sp]
/*0x3f56*/      cmp r0, r4
/*0x3f58*/      beq jump_3f5e
            jump_3f5a:
/*0x3f5a*/      movs r0, #0
/*0x3f5c*/      pop {r3, r4, r5, pc}
            jump_3f5e:
/*0x3f5e*/      movs r0, #1
/*0x3f60*/      pop {r3, r4, r5, pc}

/*0x3f62*/  .byte 0x00
/*0x3f63*/  .byte 0x00

            data_3f64:
/*0x3f64*/  .word 0x2000005c


            .thumb_func
            call_3f68:
/*0x3f68*/      push {r4, r5, r6, lr}
/*0x3f6a*/      mov r4, r0
/*0x3f6c*/      movs r2, #4
/*0x3f6e*/      movs r1, #0
/*0x3f70*/      ldr r0, [pc, #0x6c] /* data_3fe0 */
/*0x3f72*/      bl call_44f8
/*0x3f76*/      ldr r5, [pc, #0x68] /* data_3fe0 */
/*0x3f78*/      movw r1, #0x8001
/*0x3f7c*/      ldrh r0, [r5]
/*0x3f7e*/      cmp r0, r1
/*0x3f80*/      beq jump_3f9a
/*0x3f82*/      cmp.w r0, #0x1000
/*0x3f86*/      bhs jump_3f8c
/*0x3f88*/      ldrb r4, [r5, #2]
/*0x3f8a*/      b jump_3f92
            jump_3f8c:
/*0x3f8c*/      cmp r4, #0xff
/*0x3f8e*/      bne jump_3f92
/*0x3f90*/      movs r4, #0
            jump_3f92:
/*0x3f92*/      mov r0, r4
/*0x3f94*/      bl call_4050
/*0x3f98*/      b jump_3faa
            jump_3f9a:
/*0x3f9a*/      cmp r4, #0xff
/*0x3f9c*/      beq jump_3faa
/*0x3f9e*/      ldrb r0, [r5, #2]
/*0x3fa0*/      cmp r0, r4
/*0x3fa2*/      beq jump_3faa
/*0x3fa4*/      strb r4, [r5, #2]
/*0x3fa6*/      bl call_40f4
            jump_3faa:
/*0x3faa*/      ldrb r0, [r5, #2]
/*0x3fac*/      movs r2, #2
/*0x3fae*/      lsls r1, r0, #0xc
/*0x3fb0*/      ldr r0, [pc, #0x30] /* data_3fe4 */
/*0x3fb2*/      add.w r1, r1, #0x1000
/*0x3fb6*/      bl call_44f8
/*0x3fba*/      ldr r0, [pc, #0x28] /* data_3fe4 */
/*0x3fbc*/      ldrh r0, [r0]
/*0x3fbe*/      cmp r0, #3
/*0x3fc0*/      beq jump_3fca
/*0x3fc2*/      pop.w {r4, r5, r6, lr}
/*0x3fc6*/      b.w call_3fe8
            jump_3fca:
/*0x3fca*/      ldrb r0, [r5, #2]
/*0x3fcc*/      pop.w {r4, r5, r6, lr}
/*0x3fd0*/      lsls r1, r0, #0xc
/*0x3fd2*/      movw r2, #0x2d6
/*0x3fd6*/      ldr r0, [pc, #0xc] /* data_3fe4 */
/*0x3fd8*/      add.w r1, r1, #0x1000
/*0x3fdc*/      b.w call_44f8

            data_3fe0:
/*0x3fe0*/  .word 0x2000005c
            data_3fe4:
/*0x3fe4*/  .word 0x20000620


            .thumb_func
            call_3fe8:
/*0x3fe8*/      ldr r1, [pc, #0x2c] /* data_4018 */
/*0x3fea*/      push {r4, lr}
/*0x3fec*/      movs r0, #3
/*0x3fee*/      strh r0, [r1]
/*0x3ff0*/      ldr r0, [pc, #0x24] /* data_4018 */
/*0x3ff2*/      movs r2, #0xff
/*0x3ff4*/      movs r1, #0x30
/*0x3ff6*/      adds r0, #0x28
/*0x3ff8*/      bl mem_set /* (dest, size, val) */
/*0x3ffc*/      ldr r0, [pc, #0x18] /* data_4018 */
/*0x3ffe*/      movs r2, #0xff
/*0x4000*/      mov.w r1, #0x118
/*0x4004*/      adds r0, #0x5a
/*0x4006*/      bl mem_set /* (dest, size, val) */
/*0x400a*/      bl call_4068
/*0x400e*/      pop.w {r4, lr}
/*0x4012*/      b.w call_40d4

/*0x4016*/  .byte 0x00
/*0x4017*/  .byte 0x00

            data_4018:
/*0x4018*/  .word 0x20000620


            .thumb_func
            call_401c:
/*0x401c*/      push {r4, lr}
/*0x401e*/      ldr r4, [pc, #0x2c] /* data_404c */
/*0x4020*/      movs r0, #0
/*0x4022*/      strb r0, [r4, #2]
/*0x4024*/      bl call_3fe8
            jump_4028:
/*0x4028*/      ldrb r0, [r4, #2]
/*0x402a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x402c*/      uxtb r0, r0
/*0x402e*/      strb r0, [r4, #2]
/*0x4030*/      cmp r0, #4
/*0x4032*/      bhs jump_403a
/*0x4034*/      bl call_40d4
/*0x4038*/      b jump_4028
            jump_403a:
/*0x403a*/      movs r0, #0
/*0x403c*/      bl call_4050
/*0x4040*/      pop.w {r4, lr}
/*0x4044*/      movs r0, #0xff
/*0x4046*/      b.w call_3f68

/*0x404a*/  .byte 0x00
/*0x404b*/  .byte 0x00

            data_404c:
/*0x404c*/  .word 0x2000005c


            .thumb_func
            call_4050:
/*0x4050*/      ldr r1, [pc, #0x10] /* data_4064 */
/*0x4052*/      movw r2, #0x8001
/*0x4056*/      strh r2, [r1]
/*0x4058*/      strb r0, [r1, #2]
/*0x405a*/      movs r0, #0xff
/*0x405c*/      strb r0, [r1, #3]
/*0x405e*/      b.w call_40f4

/*0x4062*/  .byte 0x00
/*0x4063*/  .byte 0x00

            data_4064:
/*0x4064*/  .word 0x2000005c


            .thumb_func
            call_4068:
/*0x4068*/      push {r4, r5, r6, lr}
/*0x406a*/      ldr r5, [pc, #0x54] /* data_40c0 */
/*0x406c*/      movs r3, #0
/*0x406e*/      movs r0, #2
/*0x4070*/      strb r3, [r5, #2]
/*0x4072*/      adds r4, r5, #4
/*0x4074*/      strb r0, [r5, #3]
/*0x4076*/      movs r2, #7
/*0x4078*/      b jump_408e
            jump_407a:
/*0x407a*/      ldr r1, [pc, #0x48] /* data_40c4 */
/*0x407c*/      movs r0, #5
/*0x407e*/      b jump_4088
            jump_4080:
/*0x4080*/      ldrb r6, [r1], #1
/*0x4084*/      strb r6, [r4], #1
            jump_4088:
/*0x4088*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x408a*/      uxtb r0, r0
/*0x408c*/      bhs jump_4080
            jump_408e:
/*0x408e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4090*/      uxtb r2, r2
/*0x4092*/      bhs jump_407a
/*0x4094*/      strb.w r3, [r5, #0x2d4]
/*0x4098*/      movs r0, #0
/*0x409a*/      bl call_678c
/*0x409e*/      ldr r0, [pc, #0x28] /* data_40c8 */
/*0x40a0*/      mov.w r1, #0x150
/*0x40a4*/      ldrh r0, [r0]
/*0x40a6*/      strh.w r0, [r5, #0x58]
/*0x40aa*/      movs r0, #3
/*0x40ac*/      strb r0, [r5, #0x11]
/*0x40ae*/      ldr r0, [pc, #0x1c] /* data_40cc */
/*0x40b0*/      bl mem_zero /* (dest, size) */
/*0x40b4*/      pop.w {r4, r5, r6, lr}
/*0x40b8*/      movs r1, #0x12
/*0x40ba*/      ldr r0, [pc, #0x14] /* data_40d0 */
/*0x40bc*/      b.w mem_zero /* (dest, size) */

            data_40c0:
/*0x40c0*/  .word 0x20000620
            data_40c4:
/*0x40c4*/  .word 0x00008b70 /* possible pointer */
            data_40c8:
/*0x40c8*/  .word 0x00008598 /* possible pointer */
            data_40cc:
/*0x40cc*/  .word 0x20000792
            data_40d0:
/*0x40d0*/  .word 0x200008e2


            .thumb_func
            call_40d4:
/*0x40d4*/      ldr r0, [pc, #4] /* data_40dc */
/*0x40d6*/      ldrb r0, [r0, #2]
/*0x40d8*/      b.w jump_40e0

            data_40dc:
/*0x40dc*/  .word 0x2000005c

            jump_40e0:
/*0x40e0*/      lsls r1, r0, #0xc
/*0x40e2*/      movw r2, #0x2d6
/*0x40e6*/      ldr r0, [pc, #8] /* data_40f0 */
/*0x40e8*/      add.w r1, r1, #0x1000
/*0x40ec*/      b.w jump_76dc

            data_40f0:
/*0x40f0*/  .word 0x20000620


            .thumb_func
            call_40f4:
/*0x40f4*/      movs r2, #4
/*0x40f6*/      movs r1, #0
/*0x40f8*/      ldr r0, [pc, #4] /* data_4100 */
/*0x40fa*/      b.w jump_76dc

/*0x40fe*/  .byte 0x00
/*0x40ff*/  .byte 0x00

            data_4100:
/*0x4100*/  .word 0x2000005c


            .thumb_func
            call_4104:
/*0x4104*/      add.w r0, r0, r1, lsr #3
/*0x4108*/      and r3, r1, #7
/*0x410c*/      movs r1, #1
/*0x410e*/      lsls r1, r3
/*0x4110*/      cmp r2, #0
/*0x4112*/      ldrb r2, [r0]
/*0x4114*/      uxtb r1, r1
/*0x4116*/      beq jump_411c
/*0x4118*/      orrs r2, r1
/*0x411a*/      b jump_411e
            jump_411c:
/*0x411c*/      bics r2, r1
            jump_411e:
/*0x411e*/      strb r2, [r0]
/*0x4120*/      bx lr

/*0x4122*/  .byte 0x00
/*0x4123*/  .byte 0x00


            .thumb_func
            call_4124:
/*0x4124*/      ldr r2, [pc, #0x14] /* data_413c */
/*0x4126*/      add r2, r0
/*0x4128*/      movs r0, #0
            jump_412a:
/*0x412a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x412c*/      ldrb r3, [r2], #0x70
/*0x4130*/      uxtb r0, r0
/*0x4132*/      strb r3, [r1], #1
/*0x4136*/      cmp r0, #3
/*0x4138*/      blo jump_412a
/*0x413a*/      bx lr

            data_413c:
/*0x413c*/  .word 0x20000278


            .thumb_func
            call_4140:
/*0x4140*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4144*/      mov r6, r0
/*0x4146*/      mov.w r7, #0x180
            jump_414a:
/*0x414a*/      movs r5, #0
/*0x414c*/      movs r4, #3
/*0x414e*/      b jump_415c
            jump_4150:
/*0x4150*/      bl rand
/*0x4154*/      uxtb r0, r0
/*0x4156*/      strb r0, [r6, r4]
/*0x4158*/      add r0, r5
/*0x415a*/      uxth r5, r0
            jump_415c:
/*0x415c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x415e*/      uxtb r4, r4
/*0x4160*/      bhs jump_4150
/*0x4162*/      cmp r5, r7
/*0x4164*/      blo jump_414a
/*0x4166*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            call_416a:
/*0x416a*/      push {r4, r5, lr}
/*0x416c*/      lsls r3, r1, #1
/*0x416e*/      cmp r3, #0xff
/*0x4170*/      bls jump_4178
/*0x4172*/      rsb.w r3, r3, #0x1fe
/*0x4176*/      uxth r3, r3
            jump_4178:
/*0x4178*/      movs r4, #0x2b
/*0x417a*/      udiv r4, r0, r4
/*0x417e*/      movs r5, #0x55
/*0x4180*/      mla r0, r4, r5, r0
/*0x4184*/      sub.w r1, r1, r3, lsr #1
/*0x4188*/      uxtb r1, r1
/*0x418a*/      add.w r0, r0, r0, lsl #1
/*0x418e*/      strb r1, [r2]
/*0x4190*/      lsls r0, r0, #0x19
/*0x4192*/      strb r1, [r2, #1]
/*0x4194*/      lsrs r0, r0, #0x18
/*0x4196*/      strb r1, [r2, #2]
/*0x4198*/      lsls r5, r4, #0x1f
/*0x419a*/      beq jump_41a0
/*0x419c*/      rsb.w r0, r0, #0xff
            jump_41a0:
/*0x41a0*/      muls r0, r3, r0
/*0x41a2*/      ubfx r0, r0, #8, #8
/*0x41a6*/      cmp r4, #5
/*0x41a8*/      bhs jump_41de
/*0x41aa*/      tbb [pc, r4]

/*0x41ae*/  .byte 0x03 /* case switch_41b4 */
/*0x41af*/  .byte 0x07 /* case switch_41bc */
/*0x41b0*/  .byte 0x0c /* case switch_41c6 */
/*0x41b1*/  .byte 0x10 /* case switch_41ce */
/*0x41b2*/  .byte 0x13 /* case switch_41d4 */
/*0x41b3*/  .byte 0x00

            switch_41b4:
/*0x41b4*/      add r3, r1
/*0x41b6*/      strb r3, [r2]
/*0x41b8*/      add r0, r1
/*0x41ba*/      b jump_41c2
            switch_41bc:
/*0x41bc*/      add r0, r1
/*0x41be*/      strb r0, [r2]
/*0x41c0*/      adds r0, r1, r3
            jump_41c2:
/*0x41c2*/      strb r0, [r2, #1]
/*0x41c4*/      pop {r4, r5, pc}
            switch_41c6:
/*0x41c6*/      add r3, r1
/*0x41c8*/      strb r3, [r2, #1]
            jump_41ca:
/*0x41ca*/      add r0, r1
/*0x41cc*/      b jump_41da
            switch_41ce:
/*0x41ce*/      add r0, r1
/*0x41d0*/      strb r0, [r2, #1]
/*0x41d2*/      b jump_41d8
            switch_41d4:
/*0x41d4*/      add r0, r1
/*0x41d6*/      strb r0, [r2]
            jump_41d8:
/*0x41d8*/      adds r0, r1, r3
            jump_41da:
/*0x41da*/      strb r0, [r2, #2]
/*0x41dc*/      pop {r4, r5, pc}
            jump_41de:
/*0x41de*/      add r3, r1
/*0x41e0*/      strb r3, [r2]
/*0x41e2*/      b jump_41ca
            jump_41e4:
/*0x41e4*/      push {r4, lr}
/*0x41e6*/      ldr r1, [pc, #0x24] /* data_420c */
/*0x41e8*/      movs r3, #0x70
/*0x41ea*/      b jump_4202
            jump_41ec:
/*0x41ec*/      movs r2, #3
/*0x41ee*/      b jump_41f8
            jump_41f0:
/*0x41f0*/      ldrb r4, [r0], #1
/*0x41f4*/      strb r4, [r1], #0x70
            jump_41f8:
/*0x41f8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x41fa*/      uxtb r2, r2
/*0x41fc*/      bhs jump_41f0
/*0x41fe*/      subw r1, r1, #0x14f
            jump_4202:
/*0x4202*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4204*/      uxtb r3, r3
/*0x4206*/      bhs jump_41ec
/*0x4208*/      pop {r4, pc}

/*0x420a*/  .byte 0x00
/*0x420b*/  .byte 0x00

            data_420c:
/*0x420c*/  .word 0x20000278


            .thumb_func
            call_4210:
/*0x4210*/      cmp r0, #0xff
/*0x4212*/      beq jump_422a
/*0x4214*/      ldr r2, [pc, #0x14] /* data_422c */
/*0x4216*/      add r2, r0
/*0x4218*/      movs r0, #0
            jump_421a:
/*0x421a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x421c*/      ldrb r3, [r1], #1
/*0x4220*/      uxtb r0, r0
/*0x4222*/      strb r3, [r2], #0x70
/*0x4226*/      cmp r0, #3
/*0x4228*/      blo jump_421a
            jump_422a:
/*0x422a*/      bx lr

            data_422c:
/*0x422c*/  .word 0x20000278


            .thumb_func
            call_4230:
/*0x4230*/      push {r4, r5, r6, lr}
/*0x4232*/      mov r5, r0
/*0x4234*/      ldr r6, [pc, #0x18] /* data_4250 */
/*0x4236*/      movs r4, #3
/*0x4238*/      b jump_4248
            jump_423a:
/*0x423a*/      ldrb r2, [r5]
/*0x423c*/      movs r1, #0x70
/*0x423e*/      mov r0, r6
/*0x4240*/      bl mem_set /* (dest, size, val) */
/*0x4244*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4246*/      adds r6, #0x70
            jump_4248:
/*0x4248*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x424a*/      uxtb r4, r4
/*0x424c*/      bhs jump_423a
/*0x424e*/      pop {r4, r5, r6, pc}

            data_4250:
/*0x4250*/  .word 0x20000278


            .thumb_func
            call_4254:
/*0x4254*/      cmp r0, #0xff
/*0x4256*/      beq jump_426a
/*0x4258*/      ldr r2, [pc, #0x10] /* data_426c */
/*0x425a*/      add r0, r2
/*0x425c*/      movs r2, #3
/*0x425e*/      b jump_4264
            jump_4260:
/*0x4260*/      strb r1, [r0], #0x70
            jump_4264:
/*0x4264*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4266*/      uxtb r2, r2
/*0x4268*/      bhs jump_4260
            jump_426a:
/*0x426a*/      bx lr

            data_426c:
/*0x426c*/  .word 0x20000278


            .thumb_func
            call_4270:
/*0x4270*/      push {r2, r3, r4, r5, r6, lr}
/*0x4272*/      ldr r4, [pc, #0x20] /* data_4294 */
/*0x4274*/      movs r0, #5
/*0x4276*/      strh.w r0, [sp]
/*0x427a*/      mov.w r5, #0x400
/*0x427e*/      str r5, [r4, #0x28]
/*0x4280*/      movs r2, #2
/*0x4282*/      add r1, sp, #4
/*0x4284*/      mov r0, sp
/*0x4286*/      bl call_4538
/*0x428a*/      str r5, [r4, #0x24]
/*0x428c*/      ldrb.w r0, [sp, #5]
/*0x4290*/      pop {r2, r3, r4, r5, r6, pc}

/*0x4292*/  .byte 0x00
/*0x4293*/  .byte 0x00

            data_4294:
/*0x4294*/  .word 0x400b2000


            .thumb_func
            call_4298:
/*0x4298*/      push {r4, r5, r6, lr}
/*0x429a*/      sub sp, #0x30
/*0x429c*/      bl call_431c
/*0x42a0*/      ldr r6, [pc, #0x60] /* data_4304 */
/*0x42a2*/      ldrb r0, [r6]
/*0x42a4*/      cmp r0, #1
/*0x42a6*/      bne jump_42fc
/*0x42a8*/      movs r4, #0
/*0x42aa*/      mov r2, r4
/*0x42ac*/      movs r1, #0x20
/*0x42ae*/      movs r3, #1
/*0x42b0*/      mov r0, r2
/*0x42b2*/      bl call_39a8
/*0x42b6*/      mov.w r0, #0x4000
/*0x42ba*/      asrs r5, r0, #4
/*0x42bc*/      strd r0, r5, [sp]
/*0x42c0*/      movs r0, #8
/*0x42c2*/      strd r0, r4, [sp, #8]
/*0x42c6*/      str r4, [sp, #0x10]
/*0x42c8*/      str r4, [sp, #0x14]
/*0x42ca*/      movs r0, #4
/*0x42cc*/      str r4, [sp, #0x18]
/*0x42ce*/      strd r4, r0, [sp, #0x1c]
/*0x42d2*/      ldr r4, [pc, #0x34] /* data_4308 */
/*0x42d4*/      str r0, [sp, #0x24]
/*0x42d6*/      str r0, [sp, #0x28]
/*0x42d8*/      mov r1, sp
/*0x42da*/      mov r0, r4
/*0x42dc*/      bl call_6bf8
/*0x42e0*/      movs r1, #1
/*0x42e2*/      mov r0, r4
/*0x42e4*/      bl call_6c42
/*0x42e8*/      ldr r0, [pc, #0x20] /* data_430c */
/*0x42ea*/      str r5, [r0, #0x24]
/*0x42ec*/      movs r1, #1
/*0x42ee*/      mov r0, r4
/*0x42f0*/      bl call_6be4
/*0x42f4*/      bl call_43b8
/*0x42f8*/      movs r0, #2
/*0x42fa*/      strb r0, [r6]
            jump_42fc:
/*0x42fc*/      add sp, #0x30
/*0x42fe*/      movs r0, #1
/*0x4300*/      pop {r4, r5, r6, pc}

/*0x4302*/  .byte 0x00
/*0x4303*/  .byte 0x00

            data_4304:
/*0x4304*/  .word 0x20000018
            data_4308:
/*0x4308*/  .word 0x40044000
            data_430c:
/*0x430c*/  .word 0x400b2000


            .thumb_func
            call_4310:
/*0x4310*/      push {r4, lr}
/*0x4312*/      bl call_4270
/*0x4316*/      ubfx r0, r0, #0, #1
/*0x431a*/      pop {r4, pc}

            .thumb_func
            call_431c:
/*0x431c*/      push {r4, r5, r6, lr}
/*0x431e*/      ldr r4, [pc, #0x48] /* data_4368 */
/*0x4320*/      ldrb r0, [r4]
/*0x4322*/      cbnz r0, jump_4364
/*0x4324*/      movs r1, #0
/*0x4326*/      mov.w r0, #0x20000
/*0x432a*/      movs r3, #1
/*0x432c*/      mov r2, r1
/*0x432e*/      bl call_39a8
/*0x4332*/      ldr r6, [pc, #0x38] /* data_436c */
/*0x4334*/      mov.w r5, #0x400
/*0x4338*/      movs r2, #0
/*0x433a*/      mov r1, r5
/*0x433c*/      mov r0, r6
/*0x433e*/      bl call_46fc
/*0x4342*/      movs r2, #1
/*0x4344*/      mov r1, r5
/*0x4346*/      mov r0, r6
/*0x4348*/      bl call_46cc
/*0x434c*/      movs r2, #1
/*0x434e*/      movs r1, #0x80
/*0x4350*/      mov r0, r6
/*0x4352*/      bl call_46cc
/*0x4356*/      movs r2, #1
/*0x4358*/      lsls r1, r2, #8
/*0x435a*/      mov r0, r6
/*0x435c*/      bl call_46cc
/*0x4360*/      movs r0, #1
/*0x4362*/      strb r0, [r4]
            jump_4364:
/*0x4364*/      movs r0, #1
/*0x4366*/      pop {r4, r5, r6, pc}

            data_4368:
/*0x4368*/  .word 0x20000018
            data_436c:
/*0x436c*/  .word 0x400b2000

            jump_4370:
/*0x4370*/      push {r4, r5, r6, lr}
/*0x4372*/      bl call_44d0
/*0x4376*/      ldr r5, [pc, #0x3c] /* data_43b4 */
/*0x4378*/      mov.w r4, #0x400
/*0x437c*/      movs r2, #0
/*0x437e*/      mov r1, r4
/*0x4380*/      mov r0, r5
/*0x4382*/      bl call_46fc
/*0x4386*/      movs r2, #0
/*0x4388*/      mov r1, r4
/*0x438a*/      mov r0, r5
/*0x438c*/      bl call_46bc
/*0x4390*/      movs r2, #0
/*0x4392*/      movs r1, #7
/*0x4394*/      movs r0, #1
/*0x4396*/      bl call_3800
/*0x439a*/      movs r2, #0
/*0x439c*/      movs r1, #8
/*0x439e*/      movs r0, #1
/*0x43a0*/      bl call_3800
/*0x43a4*/      pop.w {r4, r5, r6, lr}
/*0x43a8*/      movs r2, #0
/*0x43aa*/      movs r1, #9
/*0x43ac*/      movs r0, #1
/*0x43ae*/      b.w call_3800

/*0x43b2*/  .byte 0x00
/*0x43b3*/  .byte 0x00

            data_43b4:
/*0x43b4*/  .word 0x400b2000


            .thumb_func
            call_43b8:
/*0x43b8*/      push {r4, r5, r6, lr}
/*0x43ba*/      movs r2, #1
/*0x43bc*/      ldr r5, [pc, #0x38] /* data_43f8 */
/*0x43be*/      lsls r4, r2, #0xa
/*0x43c0*/      mov r1, r4
/*0x43c2*/      mov r0, r5
/*0x43c4*/      bl call_46bc
/*0x43c8*/      movs r2, #2
/*0x43ca*/      mov r1, r4
/*0x43cc*/      mov r0, r5
/*0x43ce*/      bl call_46fc
/*0x43d2*/      movs r2, #5
/*0x43d4*/      movs r1, #7
/*0x43d6*/      movs r0, #1
/*0x43d8*/      bl call_3800
/*0x43dc*/      movs r2, #5
/*0x43de*/      movs r1, #8
/*0x43e0*/      movs r0, #1
/*0x43e2*/      bl call_3800
/*0x43e6*/      movs r2, #5
/*0x43e8*/      movs r1, #9
/*0x43ea*/      movs r0, #1
/*0x43ec*/      bl call_3800
/*0x43f0*/      pop.w {r4, r5, r6, lr}
/*0x43f4*/      b.w jump_45d0

            data_43f8:
/*0x43f8*/  .word 0x400b2000


            .thumb_func
            call_43fc:
/*0x43fc*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x4400*/      mov r7, r2
/*0x4402*/      mov r4, r1
/*0x4404*/      mov r8, r0
/*0x4406*/      bl call_4670
/*0x440a*/      ldr r6, [pc, #0x38] /* data_4444 */
/*0x440c*/      mov.w r5, #0x400
/*0x4410*/      str r5, [r6, #0x28]
/*0x4412*/      movs r0, #2
/*0x4414*/      strb.w r0, [sp]
/*0x4418*/      lsrs r0, r4, #0x10
/*0x441a*/      strb.w r0, [sp, #1]
/*0x441e*/      lsrs r0, r4, #8
/*0x4420*/      strb.w r0, [sp, #2]
/*0x4424*/      strb.w r4, [sp, #3]
/*0x4428*/      movs r2, #4
/*0x442a*/      movs r1, #0
/*0x442c*/      mov r0, sp
/*0x442e*/      bl call_4538
/*0x4432*/      mov r2, r7
/*0x4434*/      movs r1, #0
/*0x4436*/      mov r0, r8
/*0x4438*/      bl call_4538
/*0x443c*/      str r5, [r6, #0x24]
/*0x443e*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

/*0x4442*/  .byte 0x00
/*0x4443*/  .byte 0x00

            data_4444:
/*0x4444*/  .word 0x400b2000


            .thumb_func
            call_4448:
/*0x4448*/      push {r3, r4, r5, r6, r7, lr}
/*0x444a*/      mov r4, r0
/*0x444c*/      bl call_4670
/*0x4450*/      ldr r6, [pc, #0x28] /* data_447c */
/*0x4452*/      mov.w r5, #0x400
/*0x4456*/      str r5, [r6, #0x28]
/*0x4458*/      movs r0, #0x20
/*0x445a*/      strb.w r0, [sp]
/*0x445e*/      lsrs r0, r4, #0x10
/*0x4460*/      strb.w r0, [sp, #1]
/*0x4464*/      lsrs r0, r4, #8
/*0x4466*/      strb.w r0, [sp, #2]
/*0x446a*/      strb.w r4, [sp, #3]
/*0x446e*/      movs r2, #4
/*0x4470*/      movs r1, #0
/*0x4472*/      mov r0, sp
/*0x4474*/      bl call_4538
/*0x4478*/      str r5, [r6, #0x24]
/*0x447a*/      pop {r3, r4, r5, r6, r7, pc}

            data_447c:
/*0x447c*/  .word 0x400b2000


            .thumb_func
            call_4480:
/*0x4480*/      push {r3, r4, r5, r6, r7, lr}
/*0x4482*/      mov r6, r0
/*0x4484*/      bl call_4670
/*0x4488*/      ldr r4, [pc, #0x1c] /* data_44a8 */
/*0x448a*/      mov.w r5, #0x400
/*0x448e*/      str r5, [r4, #0x28]
/*0x4490*/      movs r0, #1
/*0x4492*/      strb.w r0, [sp]
/*0x4496*/      strb.w r6, [sp, #1]
/*0x449a*/      movs r2, #2
/*0x449c*/      movs r1, #0
/*0x449e*/      mov r0, sp
/*0x44a0*/      bl call_4538
/*0x44a4*/      str r5, [r4, #0x24]
/*0x44a6*/      pop {r3, r4, r5, r6, r7, pc}

            data_44a8:
/*0x44a8*/  .word 0x400b2000


            .thumb_func
            call_44ac:
/*0x44ac*/      push {r4, lr}
/*0x44ae*/      movs r4, #0x3c
/*0x44b0*/      bl call_43fc
/*0x44b4*/      b jump_44c2
            jump_44b6:
/*0x44b6*/      movs r0, #0x64
/*0x44b8*/      bl spin_wait /* (time) */
/*0x44bc*/      bl call_4310
/*0x44c0*/      cbz r0, jump_44ca
            jump_44c2:
/*0x44c2*/      mov r0, r4
/*0x44c4*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x44c6*/      bhs jump_44b6
/*0x44c8*/      pop {r4, pc}
            jump_44ca:
/*0x44ca*/      movs r0, #1
/*0x44cc*/      pop {r4, pc}

/*0x44ce*/  .byte 0x00
/*0x44cf*/  .byte 0x00


            .thumb_func
            call_44d0:
/*0x44d0*/      push {r3, r4, r5, lr}
/*0x44d2*/      ldr r4, [pc, #0x20] /* data_44f4 */
/*0x44d4*/      movs r0, #0xb9
/*0x44d6*/      strb.w r0, [sp]
/*0x44da*/      mov.w r5, #0x400
/*0x44de*/      str r5, [r4, #0x28]
/*0x44e0*/      movs r2, #1
/*0x44e2*/      movs r1, #0
/*0x44e4*/      mov r0, sp
/*0x44e6*/      bl call_4538
/*0x44ea*/      str r5, [r4, #0x24]
/*0x44ec*/      movs r0, #0xa
/*0x44ee*/      bl spin_wait /* (time) */
/*0x44f2*/      pop {r3, r4, r5, pc}

            data_44f4:
/*0x44f4*/  .word 0x400b2000


            .thumb_func
            call_44f8:
/*0x44f8*/      push {r3, r4, r5, r6, r7, lr}
/*0x44fa*/      ldr r5, [pc, #0x38] /* data_4534 */
/*0x44fc*/      mov.w r4, #0x400
/*0x4500*/      mov r7, r2
/*0x4502*/      mov r6, r0
/*0x4504*/      str r4, [r5, #0x28]
/*0x4506*/      movs r0, #3
/*0x4508*/      strb.w r0, [sp]
/*0x450c*/      lsrs r0, r1, #0x10
/*0x450e*/      strb.w r0, [sp, #1]
/*0x4512*/      lsrs r0, r1, #8
/*0x4514*/      strb.w r0, [sp, #2]
/*0x4518*/      strb.w r1, [sp, #3]
/*0x451c*/      movs r2, #4
/*0x451e*/      movs r1, #0
/*0x4520*/      mov r0, sp
/*0x4522*/      bl call_4538
/*0x4526*/      mov r2, r7
/*0x4528*/      mov r1, r6
/*0x452a*/      movs r0, #0
/*0x452c*/      bl call_4538
/*0x4530*/      str r4, [r5, #0x24]
/*0x4532*/      pop {r3, r4, r5, r6, r7, pc}

            data_4534:
/*0x4534*/  .word 0x400b2000


            .thumb_func
            call_4538:
/*0x4538*/      push {r4, r5, r6, r7, lr}
/*0x453a*/      movs r3, #0
/*0x453c*/      cmp r2, #8
/*0x453e*/      bls jump_4544
/*0x4540*/      movs r4, #8
/*0x4542*/      b jump_4546
            jump_4544:
/*0x4544*/      mov r4, r2
            jump_4546:
/*0x4546*/      movs r5, #0
/*0x4548*/      mov r7, r5
/*0x454a*/      ldr r6, [pc, #0x58] /* data_45a4 */
/*0x454c*/      b jump_455a
            jump_454e:
/*0x454e*/      cbz r0, jump_4560
/*0x4550*/      ldrb.w ip, [r0, r5]
/*0x4554*/      str.w ip, [r6, #0x10]
            jump_4558:
/*0x4558*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_455a:
/*0x455a*/      cmp r5, r4
/*0x455c*/      blo jump_454e
/*0x455e*/      b jump_4582
            jump_4560:
/*0x4560*/      str r7, [r6, #0x10]
/*0x4562*/      b jump_4558
            jump_4564:
/*0x4564*/      ldr r5, [r6, #0x1c]
/*0x4566*/      tst.w r5, #0xf0
/*0x456a*/      beq jump_4564
/*0x456c*/      ldr r5, [r6, #0x10]
/*0x456e*/      uxtb r5, r5
/*0x4570*/      cbz r0, jump_4588
/*0x4572*/      ldrb.w ip, [r0, r4]
/*0x4576*/      str.w ip, [r6, #0x10]
            jump_457a:
/*0x457a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x457c*/      cbz r1, jump_4580
/*0x457e*/      strb r5, [r1, r3]
            jump_4580:
/*0x4580*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_4582:
/*0x4582*/      cmp r4, r2
/*0x4584*/      blo jump_4564
/*0x4586*/      b jump_459e
            jump_4588:
/*0x4588*/      str r7, [r6, #0x10]
/*0x458a*/      b jump_457a
            jump_458c:
/*0x458c*/      ldr r0, [r6, #0x1c]
/*0x458e*/      tst.w r0, #0xf0
/*0x4592*/      beq jump_458c
/*0x4594*/      ldr r0, [r6, #0x10]
/*0x4596*/      uxtb r0, r0
/*0x4598*/      cbz r1, jump_459c
/*0x459a*/      strb r0, [r1, r3]
            jump_459c:
/*0x459c*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_459e:
/*0x459e*/      cmp r3, r2
/*0x45a0*/      blo jump_458c
/*0x45a2*/      pop {r4, r5, r6, r7, pc}

            data_45a4:
/*0x45a4*/  .word 0x40044000


            .thumb_func
            call_45a8:
/*0x45a8*/      push {r4, r5, r6, lr}
/*0x45aa*/      movw r4, #0x12d
/*0x45ae*/      bl call_4448
/*0x45b2*/      mov.w r5, #0x3e8
/*0x45b6*/      b jump_45c4
            jump_45b8:
/*0x45b8*/      mov r0, r5
/*0x45ba*/      bl spin_wait /* (time) */
/*0x45be*/      bl call_4310
/*0x45c2*/      cbz r0, jump_45cc
            jump_45c4:
/*0x45c4*/      mov r0, r4
/*0x45c6*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x45c8*/      bhs jump_45b8
/*0x45ca*/      pop {r4, r5, r6, pc}
            jump_45cc:
/*0x45cc*/      movs r0, #1
/*0x45ce*/      pop {r4, r5, r6, pc}
            jump_45d0:
/*0x45d0*/      push {r3, r4, r5, lr}
/*0x45d2*/      ldr r4, [pc, #0x20] /* data_45f4 */
/*0x45d4*/      movs r0, #0xab
/*0x45d6*/      strb.w r0, [sp]
/*0x45da*/      mov.w r5, #0x400
/*0x45de*/      str r5, [r4, #0x28]
/*0x45e0*/      movs r2, #1
/*0x45e2*/      movs r1, #0
/*0x45e4*/      mov r0, sp
/*0x45e6*/      bl call_4538
/*0x45ea*/      str r5, [r4, #0x24]
/*0x45ec*/      movs r0, #0xa
/*0x45ee*/      bl spin_wait /* (time) */
/*0x45f2*/      pop {r3, r4, r5, pc}

            data_45f4:
/*0x45f4*/  .word 0x400b2000

            jump_45f8:
/*0x45f8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x45fc*/      mov r5, r1
/*0x45fe*/      mov r6, r0
/*0x4600*/      rsbs r0, r5, #0
/*0x4602*/      uxtb r4, r0
/*0x4604*/      cmp r4, r2
/*0x4606*/      bhs jump_4612
/*0x4608*/      subs r0, r2, r4
/*0x460a*/      ubfx r7, r0, #8, #0x10
/*0x460e*/      uxtb r0, r0
/*0x4610*/      b jump_4618
            jump_4612:
/*0x4612*/      movs r7, #0
/*0x4614*/      uxth r4, r2
/*0x4616*/      mov r0, r7
            jump_4618:
/*0x4618*/      mov r8, r0
/*0x461a*/      cbz r4, jump_462c
/*0x461c*/      mov r2, r4
/*0x461e*/      mov r0, r6
/*0x4620*/      bl call_44ac
/*0x4624*/      cmp r0, #1
/*0x4626*/      bne jump_4664
/*0x4628*/      add r5, r4
/*0x462a*/      add r6, r4
            jump_462c:
/*0x462c*/      movs r4, #0
/*0x462e*/      mov.w sb, #0x100
/*0x4632*/      b jump_464c
            jump_4634:
/*0x4634*/      mov r2, sb
/*0x4636*/      mov r1, r5
/*0x4638*/      mov r0, r6
/*0x463a*/      bl call_44ac
/*0x463e*/      cmp r0, #1
/*0x4640*/      bne jump_4664
/*0x4642*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4644*/      add.w r5, r5, #0x100
/*0x4648*/      add.w r6, r6, #0x100
            jump_464c:
/*0x464c*/      cmp r4, r7
/*0x464e*/      blt jump_4634
/*0x4650*/      subs.w r0, r8, #0
/*0x4654*/      beq jump_466a
/*0x4656*/      mov r2, r0
/*0x4658*/      mov r1, r5
/*0x465a*/      mov r0, r6
/*0x465c*/      bl call_44ac
/*0x4660*/      cmp r0, #1
/*0x4662*/      beq jump_466a
            jump_4664:
/*0x4664*/      movs r0, #0
            jump_4666:
/*0x4666*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_466a:
/*0x466a*/      movs r0, #1
/*0x466c*/      b jump_4666

/*0x466e*/  .byte 0x00
/*0x466f*/  .byte 0x00


            .thumb_func
            call_4670:
/*0x4670*/      push {r3, r4, r5, lr}
/*0x4672*/      ldr r4, [pc, #0x1c] /* data_4690 */
/*0x4674*/      movs r0, #6
/*0x4676*/      strb.w r0, [sp]
/*0x467a*/      mov.w r5, #0x400
/*0x467e*/      str r5, [r4, #0x28]
/*0x4680*/      movs r2, #1
/*0x4682*/      movs r1, #0
/*0x4684*/      mov r0, sp
/*0x4686*/      bl call_4538
/*0x468a*/      str r5, [r4, #0x24]
/*0x468c*/      pop {r3, r4, r5, pc}

/*0x468e*/  .byte 0x00
/*0x468f*/  .byte 0x00

            data_4690:
/*0x4690*/  .word 0x400b2000


            .thumb_func
            call_4694:
/*0x4694*/      push {r4, lr}
/*0x4696*/      mov.w r4, #0x19a
/*0x469a*/      bl call_4480
/*0x469e*/      b jump_46ac
            jump_46a0:
/*0x46a0*/      movs r0, #0x64
/*0x46a2*/      bl spin_wait /* (time) */
/*0x46a6*/      bl call_4310
/*0x46aa*/      cbz r0, jump_46b4
            jump_46ac:
/*0x46ac*/      mov r0, r4
/*0x46ae*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x46b0*/      bhs jump_46a0
/*0x46b2*/      pop {r4, pc}
            jump_46b4:
/*0x46b4*/      movs r0, #1
/*0x46b6*/      pop {r4, pc}

            .thumb_func
            call_46b8:
/*0x46b8*/      str r1, [r0, #0x28]
/*0x46ba*/      bx lr

            .thumb_func
            call_46bc:
/*0x46bc*/      cmp r2, #0
/*0x46be*/      ldr r2, [r0]
/*0x46c0*/      beq jump_46c6
/*0x46c2*/      orrs r2, r1
/*0x46c4*/      b jump_46c8
            jump_46c6:
/*0x46c6*/      bics r2, r1
            jump_46c8:
/*0x46c8*/      str r2, [r0]
/*0x46ca*/      bx lr

            .thumb_func
            call_46cc:
/*0x46cc*/      cmp r2, #0
/*0x46ce*/      ldr r2, [r0, #0x14]
/*0x46d0*/      beq jump_46d6
/*0x46d2*/      orrs r2, r1
/*0x46d4*/      b jump_46d8
            jump_46d6:
/*0x46d6*/      bics r2, r1
            jump_46d8:
/*0x46d8*/      str r2, [r0, #0x14]
/*0x46da*/      bx lr

            .thumb_func
            call_46dc:
/*0x46dc*/      cmp r2, #0
/*0x46de*/      ldr r2, [r0, #4]
/*0x46e0*/      beq jump_46e6
/*0x46e2*/      orrs r2, r1
/*0x46e4*/      b jump_46e8
            jump_46e6:
/*0x46e6*/      bics r2, r1
            jump_46e8:
/*0x46e8*/      str r2, [r0, #4]
/*0x46ea*/      bx lr

            .thumb_func
            call_46ec:
/*0x46ec*/      cmp r2, #0
/*0x46ee*/      ldr r2, [r0, #0x10]
/*0x46f0*/      beq jump_46f6
/*0x46f2*/      orrs r2, r1
/*0x46f4*/      b jump_46f8
            jump_46f6:
/*0x46f6*/      bics r2, r1
            jump_46f8:
/*0x46f8*/      str r2, [r0, #0x10]
/*0x46fa*/      bx lr

            .thumb_func
            call_46fc:
/*0x46fc*/      cbz r2, jump_4710
/*0x46fe*/      cmp r2, #1
/*0x4700*/      beq jump_4716
/*0x4702*/      ldr r2, [r0, #8]
/*0x4704*/      bics r2, r1
            jump_4706:
/*0x4706*/      str r2, [r0, #8]
/*0x4708*/      ldr r2, [r0, #0xc]
/*0x470a*/      bics r2, r1
/*0x470c*/      str r2, [r0, #0xc]
/*0x470e*/      bx lr
            jump_4710:
/*0x4710*/      ldr r2, [r0, #8]
/*0x4712*/      orrs r2, r1
/*0x4714*/      b jump_4706
            jump_4716:
/*0x4716*/      ldr r2, [r0, #0xc]
/*0x4718*/      orrs r2, r1
/*0x471a*/      str r2, [r0, #0xc]
/*0x471c*/      ldr r2, [r0, #8]
/*0x471e*/      bics r2, r1
/*0x4720*/      str r2, [r0, #8]
/*0x4722*/      bx lr

            .thumb_func
            call_4724:
/*0x4724*/      str r1, [r0, #0x24]
/*0x4726*/      bx lr

            .thumb_func
            call_4728:
/*0x4728*/      cbz r2, jump_472e
/*0x472a*/      str r1, [r0, #0x24]
/*0x472c*/      bx lr
            jump_472e:
/*0x472e*/      str r1, [r0, #0x28]
/*0x4730*/      bx lr

            .thumb_func
            call_4732:
/*0x4732*/      cmp r1, #0
/*0x4734*/      ldr r1, [r0, #0x10]
/*0x4736*/      beq jump_473e
/*0x4738*/      orr r1, r1, #1
/*0x473c*/      b jump_4742
            jump_473e:
/*0x473e*/      bic r1, r1, #1
            jump_4742:
/*0x4742*/      str r1, [r0, #0x10]
/*0x4744*/      bx lr

            .thumb_func
            call_4746:
/*0x4746*/      push {r4, r5, r6, r7, lr}
/*0x4748*/      ldrb r3, [r1]
/*0x474a*/      ldr r7, [r0, #0x50]
/*0x474c*/      add.w r4, r0, r3, lsl #2
/*0x4750*/      add.w r2, r4, #0x40
/*0x4754*/      add.w r5, r4, #0x90
/*0x4758*/      add.w r6, r4, #0xa0
/*0x475c*/      lsls r3, r3, #1
/*0x475e*/      movs r4, #1
/*0x4760*/      lsls r4, r3
/*0x4762*/      mvns r4, r4
/*0x4764*/      ands r7, r4
/*0x4766*/      str r7, [r0, #0x50]
/*0x4768*/      ldr r7, [r0, #0x54]
/*0x476a*/      ands r7, r4
/*0x476c*/      str r7, [r0, #0x54]
/*0x476e*/      ldr r4, [r0, #0x54]
/*0x4770*/      ldrb r7, [r1, #5]
/*0x4772*/      lsls r7, r3
/*0x4774*/      orrs r4, r7
/*0x4776*/      str r4, [r0, #0x54]
/*0x4778*/      ldr r4, [r2]
/*0x477a*/      movw r7, #0x107
/*0x477e*/      bics r4, r7
/*0x4780*/      str r4, [r2]
/*0x4782*/      ldr r4, [r2]
/*0x4784*/      ldrh r7, [r1, #2]
/*0x4786*/      orrs r4, r7
/*0x4788*/      str r4, [r2]
/*0x478a*/      ldrh r2, [r1, #6]
/*0x478c*/      str r2, [r5]
/*0x478e*/      ldrh r2, [r1, #8]
/*0x4790*/      str r2, [r6]
/*0x4792*/      ldr r2, [r0, #0x50]
/*0x4794*/      ldrb r1, [r1, #4]
/*0x4796*/      lsls r1, r3
/*0x4798*/      orrs r2, r1
/*0x479a*/      str r2, [r0, #0x50]
/*0x479c*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_479e:
/*0x479e*/      ldrh r2, [r1]
/*0x47a0*/      str.w r2, [r0, #0x88]
/*0x47a4*/      ldrh r2, [r1, #2]
/*0x47a6*/      str.w r2, [r0, #0x84]
/*0x47aa*/      ldr r2, [r0]
/*0x47ac*/      bic r2, r2, #0x30000
/*0x47b0*/      str r2, [r0]
/*0x47b2*/      ldr r2, [r0]
/*0x47b4*/      bic r2, r2, #0x1000000
/*0x47b8*/      str r2, [r0]
/*0x47ba*/      ldr r2, [r0]
/*0x47bc*/      ldr r3, [r1, #4]
/*0x47be*/      orrs r2, r3
/*0x47c0*/      str r2, [r0]
/*0x47c2*/      ldrh r1, [r1, #8]
/*0x47c4*/      str r1, [r0, #0x78]
/*0x47c6*/      bx lr

            .thumb_func
            call_47c8:
/*0x47c8*/      ldr r0, [pc, #0x28] /* data_47f4 */
/*0x47ca*/      ldrb r1, [r0, #2]
/*0x47cc*/      cbz r1, jump_47d2
/*0x47ce*/      movs r0, #0
/*0x47d0*/      bx lr
            jump_47d2:
/*0x47d2*/      ldrb r1, [r0, #0xb]
/*0x47d4*/      cbz r1, jump_47da
/*0x47d6*/      movs r0, #1
/*0x47d8*/      bx lr
            jump_47da:
/*0x47da*/      ldrb r0, [r0, #0xa]
/*0x47dc*/      cbz r0, jump_47e2
/*0x47de*/      movs r0, #2
/*0x47e0*/      bx lr
            jump_47e2:
/*0x47e2*/      ldr r0, [pc, #0x14] /* data_47f8 */
/*0x47e4*/      ldrb r0, [r0, #6]
/*0x47e6*/      cmp r0, #1
/*0x47e8*/      beq jump_47ee
/*0x47ea*/      movs r0, #5
/*0x47ec*/      bx lr
            jump_47ee:
/*0x47ee*/      movs r0, #3
/*0x47f0*/      bx lr

/*0x47f2*/  .byte 0x00
/*0x47f3*/  .byte 0x00

            data_47f4:
/*0x47f4*/  .word 0x20000580
            data_47f8:
/*0x47f8*/  .word 0x200018fc


            .thumb_func
            call_47fc:
/*0x47fc*/      push {r4, lr}
/*0x47fe*/      movs r1, #0
/*0x4800*/      mov.w r0, #0xb0000
/*0x4804*/      movs r3, #1
/*0x4806*/      mov r2, r1
/*0x4808*/      bl call_39a8
/*0x480c*/      ldr r4, [pc, #0x30] /* data_4840 */
/*0x480e*/      movs r2, #1
/*0x4810*/      movs r1, #2
/*0x4812*/      mov r0, r4
/*0x4814*/      bl call_4728
/*0x4818*/      movs r2, #1
/*0x481a*/      movs r1, #2
/*0x481c*/      mov r0, r4
/*0x481e*/      bl call_46ec
/*0x4822*/      ldr r4, [pc, #0x20] /* data_4844 */
/*0x4824*/      movs r2, #1
/*0x4826*/      movs r1, #2
/*0x4828*/      mov r0, r4
/*0x482a*/      bl call_4728
/*0x482e*/      movs r2, #1
/*0x4830*/      movs r1, #2
/*0x4832*/      mov r0, r4
/*0x4834*/      bl call_46ec
/*0x4838*/      pop.w {r4, lr}
/*0x483c*/      b.w call_4898

            data_4840:
/*0x4840*/  .word 0x400b2000
            data_4844:
/*0x4844*/  .word 0x400b6000


            .thumb_func
            call_4848:
/*0x4848*/      push {r4, lr}
/*0x484a*/      ldr r4, [pc, #0x40] /* data_488c */
/*0x484c*/      movs r2, #0
/*0x484e*/      movs r1, #1
/*0x4850*/      mov r0, r4
/*0x4852*/      bl call_46dc
/*0x4856*/      movs r2, #2
/*0x4858*/      movs r1, #1
/*0x485a*/      mov r0, r4
/*0x485c*/      bl call_46fc
/*0x4860*/      movs r2, #0
/*0x4862*/      movs r1, #2
/*0x4864*/      mov r0, r4
/*0x4866*/      bl call_46dc
/*0x486a*/      movs r2, #2
/*0x486c*/      mov r1, r2
/*0x486e*/      mov r0, r4
/*0x4870*/      bl call_46fc
/*0x4874*/      movs r2, #0
/*0x4876*/      movs r1, #2
/*0x4878*/      ldr r0, [pc, #0x14] /* data_4890 */
/*0x487a*/      bl call_46bc
/*0x487e*/      movs r2, #0
/*0x4880*/      pop.w {r4, lr}
/*0x4884*/      movs r1, #2
/*0x4886*/      ldr r0, [pc, #0xc] /* data_4894 */
/*0x4888*/      b.w call_46bc

            data_488c:
/*0x488c*/  .word 0x400b0000
            data_4890:
/*0x4890*/  .word 0x400b2000
            data_4894:
/*0x4894*/  .word 0x400b6000


            .thumb_func
            call_4898:
/*0x4898*/      push {r4, lr}
/*0x489a*/      ldr r4, [pc, #0x40] /* data_48dc */
/*0x489c*/      movs r2, #0
/*0x489e*/      movs r1, #1
/*0x48a0*/      mov r0, r4
/*0x48a2*/      bl call_46fc
/*0x48a6*/      movs r2, #1
/*0x48a8*/      mov r1, r2
/*0x48aa*/      mov r0, r4
/*0x48ac*/      bl call_46dc
/*0x48b0*/      movs r2, #0
/*0x48b2*/      movs r1, #2
/*0x48b4*/      mov r0, r4
/*0x48b6*/      bl call_46fc
/*0x48ba*/      movs r2, #1
/*0x48bc*/      movs r1, #2
/*0x48be*/      mov r0, r4
/*0x48c0*/      bl call_46dc
/*0x48c4*/      movs r2, #1
/*0x48c6*/      movs r1, #2
/*0x48c8*/      ldr r0, [pc, #0x14] /* data_48e0 */
/*0x48ca*/      bl call_46bc
/*0x48ce*/      movs r2, #1
/*0x48d0*/      pop.w {r4, lr}
/*0x48d4*/      movs r1, #2
/*0x48d6*/      ldr r0, [pc, #0xc] /* data_48e4 */
/*0x48d8*/      b.w call_46bc

            data_48dc:
/*0x48dc*/  .word 0x400b0000
            data_48e0:
/*0x48e0*/  .word 0x400b2000
            data_48e4:
/*0x48e4*/  .word 0x400b6000


            .thumb_func
            call_48e8:
/*0x48e8*/      push {r4, lr}
/*0x48ea*/      cbz r0, jump_4912
/*0x48ec*/      bl call_4d08
/*0x48f0*/      cmp r0, #0
/*0x48f2*/      beq jump_4928
/*0x48f4*/      movs r1, #0xe
/*0x48f6*/      ldr r0, [pc, #0x34] /* data_492c */
/*0x48f8*/      bl mem_zero /* (dest, size) */
/*0x48fc*/      ldr r0, [pc, #0x30] /* data_4930 */
/*0x48fe*/      ldrb r1, [r0, #1]
/*0x4900*/      lsls r2, r1, #0x19
/*0x4902*/      mov.w r1, #0
/*0x4906*/      str r1, [r0]
/*0x4908*/      bpl jump_4912
/*0x490a*/      ldrb r1, [r0, #1]
/*0x490c*/      orr r1, r1, #0x40
/*0x4910*/      strb r1, [r0, #1]
            jump_4912:
/*0x4912*/      bl call_7058
/*0x4916*/      ldr r1, [pc, #0x1c] /* data_4934 */
/*0x4918*/      movs r0, #1
/*0x491a*/      strb r0, [r1]
/*0x491c*/      ldr r1, [pc, #0x18] /* data_4938 */
/*0x491e*/      strb r0, [r1]
/*0x4920*/      ldr r1, [pc, #0x18] /* data_493c */
/*0x4922*/      strb r0, [r1]
/*0x4924*/      ldr r1, [pc, #0x18] /* data_4940 */
/*0x4926*/      strb r0, [r1]
            jump_4928:
/*0x4928*/      pop {r4, pc}

/*0x492a*/  .byte 0x00
/*0x492b*/  .byte 0x00

            data_492c:
/*0x492c*/  .word 0x20000590
            data_4930:
/*0x4930*/  .word 0x20000054
            data_4934:
/*0x4934*/  .word 0x20000028
            data_4938:
/*0x4938*/  .word 0x2000002b
            data_493c:
/*0x493c*/  .word 0x20000029
            data_4940:
/*0x4940*/  .word 0x2000002a


            .thumb_func
            call_4944:
/*0x4944*/      movs r1, #0x70
/*0x4946*/      ldr r2, [pc, #0x18] /* data_4960 */
/*0x4948*/      b jump_4954
            jump_494a:
/*0x494a*/      ldrb r3, [r2, r1]
/*0x494c*/      cmp r3, r0
/*0x494e*/      bne jump_4954
/*0x4950*/      uxtb r0, r1
/*0x4952*/      bx lr
            jump_4954:
/*0x4954*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4956*/      uxth r1, r1
/*0x4958*/      bhs jump_494a
/*0x495a*/      movs r0, #0
/*0x495c*/      bx lr

/*0x495e*/  .byte 0x00
/*0x495f*/  .byte 0x00

            data_4960:
/*0x4960*/  .word 0x2000059e


            .thumb_func
            call_4964:
/*0x4964*/      ldr r3, [pc, #0x2c] /* data_4994 */
/*0x4966*/      push {r4, lr}
/*0x4968*/      ldrb r2, [r3, r0]
/*0x496a*/      cbz r2, jump_498c
/*0x496c*/      cbz r1, jump_4970
/*0x496e*/      strb r2, [r1]
            jump_4970:
/*0x4970*/      ldr r2, [pc, #0x20] /* data_4994 */
/*0x4972*/      lsrs r1, r0, #5
/*0x4974*/      adds r2, #0x72
/*0x4976*/      and r4, r0, #0x1f
/*0x497a*/      ldr.w r1, [r2, r1, lsl #2]
/*0x497e*/      movs r2, #1
/*0x4980*/      lsls r2, r4
/*0x4982*/      tst r1, r2
/*0x4984*/      beq jump_498c
/*0x4986*/      ldrb r0, [r3, r0]
/*0x4988*/      cmp r0, #0x2f
/*0x498a*/      blo jump_4990
            jump_498c:
/*0x498c*/      movs r0, #1
/*0x498e*/      pop {r4, pc}
            jump_4990:
/*0x4990*/      movs r0, #0
/*0x4992*/      pop {r4, pc}

            data_4994:
/*0x4994*/  .word 0x2000059e

            jump_4998:
/*0x4998*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x499c*/      mov r5, r1
/*0x499e*/      mov r4, r0
/*0x49a0*/      movs r1, #0x70
/*0x49a2*/      ldr r0, [pc, #0x44] /* data_49e8 */
/*0x49a4*/      bl mem_zero /* (dest, size) */
/*0x49a8*/      ldr r2, [pc, #0x3c] /* data_49e8 */
/*0x49aa*/      movs r0, #0
/*0x49ac*/      adds r2, #0x72
/*0x49ae*/      ldr r3, [pc, #0x38] /* data_49e8 */
/*0x49b0*/      str r0, [r2]
/*0x49b2*/      str r0, [r2, #4]
/*0x49b4*/      str r0, [r2, #8]
/*0x49b6*/      movs r6, #1
/*0x49b8*/      str r0, [r2, #0xc]
/*0x49ba*/      b jump_49de
            jump_49bc:
/*0x49bc*/      ldrb r1, [r4]
/*0x49be*/      ldrb r0, [r4, #1]
/*0x49c0*/      strb r0, [r3, r1]
/*0x49c2*/      ldrb r0, [r4, #2]
/*0x49c4*/      cbz r0, jump_49dc
/*0x49c6*/      ldrb r0, [r4]
/*0x49c8*/      lsrs r1, r0, #5
/*0x49ca*/      and r0, r0, #0x1f
/*0x49ce*/      ldr.w r7, [r2, r1, lsl #2]
/*0x49d2*/      lsl.w r0, r6, r0
/*0x49d6*/      orrs r7, r0
/*0x49d8*/      str.w r7, [r2, r1, lsl #2]
            jump_49dc:
/*0x49dc*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_49de:
/*0x49de*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x49e0*/      uxtb r5, r5
/*0x49e2*/      bhs jump_49bc
/*0x49e4*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_49e8:
/*0x49e8*/  .word 0x2000059e


            .thumb_func
            call_49ec:
/*0x49ec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x49f0*/      lsrs r1, r0, #8
/*0x49f2*/      lsls r1, r1, #0x1f
/*0x49f4*/      beq jump_49fc
/*0x49f6*/      bl call_50e4
/*0x49fa*/      b jump_4abc
            jump_49fc:
/*0x49fc*/      uxtb r3, r0
/*0x49fe*/      lsrs r2, r0, #0x18
/*0x4a00*/      movs r4, #1
/*0x4a02*/      cmp r3, #0xe8
/*0x4a04*/      bls jump_4a30
/*0x4a06*/      lsrs r0, r0, #0x18
/*0x4a08*/      ubfx r2, r0, #1, #1
/*0x4a0c*/      cmp r3, #0xec
/*0x4a0e*/      bhs jump_4a1e
/*0x4a10*/      subs r3, #0xe9
/*0x4a12*/      uxtb r1, r3
/*0x4a14*/      ldr r0, [pc, #0xac] /* data_4ac4 */
/*0x4a16*/      bl call_4104
/*0x4a1a*/      ldr r0, [pc, #0xac] /* data_4ac8 */
/*0x4a1c*/      b jump_4aba
            jump_4a1e:
/*0x4a1e*/      cmp r3, #0xfd
/*0x4a20*/      bhi jump_4abc
/*0x4a22*/      subs r3, #0xec
/*0x4a24*/      uxtb r1, r3
/*0x4a26*/      ldr r0, [pc, #0xa4] /* data_4acc */
/*0x4a28*/      bl call_4104
/*0x4a2c*/      ldr r0, [pc, #0xa0] /* data_4ad0 */
/*0x4a2e*/      b jump_4aba
            jump_4a30:
/*0x4a30*/      and r1, r0, #7
/*0x4a34*/      movs r6, #1
/*0x4a36*/      sub.w ip, r3, #0xe0
/*0x4a3a*/      lsls r6, r1
/*0x4a3c*/      ldr r7, [pc, #0x94] /* data_4ad4 */
/*0x4a3e*/      ldr r5, [pc, #0x98] /* data_4ad8 */
/*0x4a40*/      cmp.w ip, #7
/*0x4a44*/      bhi jump_4a5c
/*0x4a46*/      mov r0, r5
/*0x4a48*/      uxtb r1, r6
/*0x4a4a*/      ldrb r0, [r0]
/*0x4a4c*/      lsls r2, r2, #0x1e
/*0x4a4e*/      bpl jump_4a54
/*0x4a50*/      orrs r0, r1
/*0x4a52*/      b jump_4a56
            jump_4a54:
/*0x4a54*/      bics r0, r1
            jump_4a56:
/*0x4a56*/      strb r0, [r5]
            jump_4a58:
/*0x4a58*/      strb r4, [r7]
/*0x4a5a*/      b jump_4abc
            jump_4a5c:
/*0x4a5c*/      movs r1, #0
            jump_4a5e:
/*0x4a5e*/      add.w ip, r5, r1
/*0x4a62*/      ldrb.w ip, [ip, #2]
/*0x4a66*/      cmp ip, r3
/*0x4a68*/      bne jump_4a76
/*0x4a6a*/      lsls r0, r2, #0x1e
/*0x4a6c*/      bmi jump_4a58
/*0x4a6e*/      add r1, r5
/*0x4a70*/      movs r0, #0
/*0x4a72*/      strb r0, [r1, #2]
/*0x4a74*/      b jump_4a58
            jump_4a76:
/*0x4a76*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4a78*/      uxtb r1, r1
/*0x4a7a*/      cmp r1, #6
/*0x4a7c*/      blo jump_4a5e
/*0x4a7e*/      lsls r1, r2, #0x1e
/*0x4a80*/      bpl jump_4a9a
/*0x4a82*/      movs r1, #0
            jump_4a84:
/*0x4a84*/      add.w ip, r5, r1
/*0x4a88*/      ldrb.w ip, [ip, #2]
/*0x4a8c*/      cmp.w ip, #0
/*0x4a90*/      beq jump_4aae
/*0x4a92*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4a94*/      uxtb r1, r1
/*0x4a96*/      cmp r1, #6
/*0x4a98*/      blo jump_4a84
            jump_4a9a:
/*0x4a9a*/      lsls r3, r2, #0x1e
/*0x4a9c*/      ldr r2, [pc, #0x3c] /* data_4adc */
/*0x4a9e*/      ubfx r0, r0, #3, #5
/*0x4aa2*/      add r0, r2
/*0x4aa4*/      uxtb r1, r6
/*0x4aa6*/      ldrb r2, [r0, #2]
/*0x4aa8*/      bpl jump_4ab4
/*0x4aaa*/      orrs r2, r1
/*0x4aac*/      b jump_4ab6
            jump_4aae:
/*0x4aae*/      adds r0, r5, r1
/*0x4ab0*/      strb r3, [r0, #2]
/*0x4ab2*/      b jump_4a58
            jump_4ab4:
/*0x4ab4*/      bics r2, r1
            jump_4ab6:
/*0x4ab6*/      strb r2, [r0, #2]
/*0x4ab8*/      ldr r0, [pc, #0x24] /* data_4ae0 */
            jump_4aba:
/*0x4aba*/      strb r4, [r0]
            jump_4abc:
/*0x4abc*/      movs r0, #1
/*0x4abe*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x4ac2*/  .byte 0x00
/*0x4ac3*/  .byte 0x00

            data_4ac4:
/*0x4ac4*/  .word 0x20000031
            data_4ac8:
/*0x4ac8*/  .word 0x20000029
            data_4acc:
/*0x4acc*/  .word 0x2000003d
            data_4ad0:
/*0x4ad0*/  .word 0x2000002a
            data_4ad4:
/*0x4ad4*/  .word 0x20000028
            data_4ad8:
/*0x4ad8*/  .word 0x20000044
            data_4adc:
/*0x4adc*/  .word 0x200004e0
            data_4ae0:
/*0x4ae0*/  .word 0x2000002b


            .thumb_func
            call_4ae4:
/*0x4ae4*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x4ae8*/      ldr r4, [pc, #0x16c] /* data_4c58 */
/*0x4aea*/      ldr r2, [pc, #0x170] /* data_4c5c */
/*0x4aec*/      lsrs r5, r0, #3
/*0x4aee*/      strb r0, [r4, #2]
/*0x4af0*/      ldrb r3, [r2, r0]
/*0x4af2*/      strb r3, [r4]
/*0x4af4*/      ldrb r2, [r4, #3]
/*0x4af6*/      and r6, r0, #7
/*0x4afa*/      bic r2, r2, #1
/*0x4afe*/      bfi r2, r1, #1, #1
/*0x4b02*/      strb r2, [r4, #3]
/*0x4b04*/      mov r2, r4
/*0x4b06*/      mov.w r8, #1
/*0x4b0a*/      ldrb r2, [r2, #1]
/*0x4b0c*/      cmp r3, #0xe8
/*0x4b0e*/      beq jump_4b32
/*0x4b10*/      lsl.w r7, r8, r6
/*0x4b14*/      movs r6, #0x1c
/*0x4b16*/      uxtb r7, r7
/*0x4b18*/      cmp.w r6, r3, lsr #3
/*0x4b1c*/      bne jump_4b50
/*0x4b1e*/      ands r6, r3, #3
/*0x4b22*/      beq jump_4b38
/*0x4b24*/      cmp r6, #1
/*0x4b26*/      beq jump_4b3e
/*0x4b28*/      cmp r6, #2
/*0x4b2a*/      beq jump_4b44
/*0x4b2c*/      cmp r6, #3
/*0x4b2e*/      bne jump_4b5a
/*0x4b30*/      b jump_4b4a
            jump_4b32:
/*0x4b32*/      bfi r2, r1, #6, #1
/*0x4b36*/      b jump_4baa
            jump_4b38:
/*0x4b38*/      bfi r2, r1, #2, #1
/*0x4b3c*/      b jump_4b58
            jump_4b3e:
/*0x4b3e*/      bfi r2, r1, #4, #1
/*0x4b42*/      b jump_4b58
            jump_4b44:
/*0x4b44*/      bfi r2, r1, #3, #1
/*0x4b48*/      b jump_4b58
            jump_4b4a:
/*0x4b4a*/      bfi r2, r1, #5, #1
/*0x4b4e*/      b jump_4b58
            jump_4b50:
/*0x4b50*/      cmp r3, #0x39
/*0x4b52*/      bne jump_4b5a
/*0x4b54*/      bfi r2, r1, #7, #1
            jump_4b58:
/*0x4b58*/      strb r2, [r4, #1]
            jump_4b5a:
/*0x4b5a*/      ldr r6, [pc, #0x104] /* data_4c60 */
/*0x4b5c*/      cbz r1, jump_4b96
/*0x4b5e*/      ldrb r2, [r4, #1]
/*0x4b60*/      lsls.w ip, r2, #0x19
/*0x4b64*/      bpl jump_4baa
/*0x4b66*/      ldrb.w ip, [r6, r5]
/*0x4b6a*/      orr.w ip, ip, r7
/*0x4b6e*/      strb.w ip, [r6, r5]
/*0x4b72*/      b jump_4ba2
            jump_4b74:
/*0x4b74*/      ldr r5, [pc, #0xec] /* data_4c64 */
/*0x4b76*/      strb r2, [r4, #1]
/*0x4b78*/      ldrb r2, [r5, #2]
/*0x4b7a*/      cbz r2, jump_4bb6
/*0x4b7c*/      cbz r1, jump_4bb6
/*0x4b7e*/      movs r1, #0
/*0x4b80*/      strb r1, [r5, #2]
/*0x4b82*/      mov r1, sp
/*0x4b84*/      bl call_6100
/*0x4b88*/      ldrb r0, [r5, #6]
/*0x4b8a*/      cmp r0, #0
/*0x4b8c*/      mov r0, sp
/*0x4b8e*/      beq jump_4bb0
/*0x4b90*/      bl call_3ac8
/*0x4b94*/      b jump_4bec
            jump_4b96:
/*0x4b96*/      ldrb r2, [r6, r5]
/*0x4b98*/      tst r2, r7
/*0x4b9a*/      beq jump_4ba8
/*0x4b9c*/      bics r2, r7
/*0x4b9e*/      strb r2, [r6, r5]
/*0x4ba0*/      ldrb r2, [r4, #1]
            jump_4ba2:
/*0x4ba2*/      orr r2, r2, #1
/*0x4ba6*/      b jump_4b74
            jump_4ba8:
/*0x4ba8*/      ldrb r2, [r4, #1]
            jump_4baa:
/*0x4baa*/      bic r2, r2, #1
/*0x4bae*/      b jump_4b74
            jump_4bb0:
/*0x4bb0*/      bl call_5490
/*0x4bb4*/      b jump_4bec
            jump_4bb6:
/*0x4bb6*/      cbz r3, jump_4bec
/*0x4bb8*/      ldr r0, [r4]
/*0x4bba*/      bl call_5870
/*0x4bbe*/      bl call_51e4
/*0x4bc2*/      cbz r0, jump_4bd6
/*0x4bc4*/      ldrb r0, [r4]
/*0x4bc6*/      cbz r0, jump_4bec
            jump_4bc8:
/*0x4bc8*/      bl call_5418
/*0x4bcc*/      ldr r0, [r4]
/*0x4bce*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x4bd2*/      b.w call_49ec
            jump_4bd6:
/*0x4bd6*/      ldrb r0, [r5, #6]
/*0x4bd8*/      cbz r0, jump_4be0
/*0x4bda*/      bl call_3a00
/*0x4bde*/      b jump_4bec
            jump_4be0:
/*0x4be0*/      ldrb r0, [r4]
/*0x4be2*/      cmp r0, #0xe8
/*0x4be4*/      beq jump_4bec
/*0x4be6*/      bl call_5e24
/*0x4bea*/      cbz r0, jump_4bf2
            jump_4bec:
/*0x4bec*/      movs r0, #1
/*0x4bee*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_4bf2:
/*0x4bf2*/      ldrb r1, [r4, #1]
/*0x4bf4*/      lsls r0, r1, #0x1f
/*0x4bf6*/      ldrb r0, [r4, #3]
/*0x4bf8*/      lsl.w r0, r0, #0x1f
/*0x4bfc*/      beq jump_4c42
/*0x4bfe*/      cmp r0, #0
/*0x4c00*/      bne jump_4bc8
/*0x4c02*/      ldr r2, [pc, #0x5c] /* data_4c60 */
/*0x4c04*/      ldrb r0, [r4, #2]
/*0x4c06*/      adds r2, #0xe
/*0x4c08*/      ldrb r2, [r2, r0]
/*0x4c0a*/      cbz r2, jump_4c32
/*0x4c0c*/      ldr r5, [pc, #0x50] /* data_4c60 */
/*0x4c0e*/      lsrs r3, r0, #5
/*0x4c10*/      adds r5, #0x80
/*0x4c12*/      ldr.w r3, [r5, r3, lsl #2]
/*0x4c16*/      and r5, r0, #0x1f
/*0x4c1a*/      lsl.w r0, r8, r5
/*0x4c1e*/      tst r3, r0
/*0x4c20*/      beq jump_4c28
/*0x4c22*/      orr r0, r1, #1
/*0x4c26*/      b jump_4c2c
            jump_4c28:
/*0x4c28*/      bic r0, r1, #1
            jump_4c2c:
/*0x4c2c*/      strb r0, [r4, #1]
/*0x4c2e*/      strb r2, [r4]
/*0x4c30*/      b jump_4bc8
            jump_4c32:
/*0x4c32*/      bl call_5df0
/*0x4c36*/      cbnz r0, jump_4c4e
/*0x4c38*/      ldrb r0, [r4, #1]
/*0x4c3a*/      bic r0, r0, #1
/*0x4c3e*/      strb r0, [r4, #1]
/*0x4c40*/      b jump_4bc8
            jump_4c42:
/*0x4c42*/      cmp r0, #0
/*0x4c44*/      bne jump_4bc8
/*0x4c46*/      bl call_5df0
/*0x4c4a*/      cmp r0, #0
/*0x4c4c*/      beq jump_4bc8
            jump_4c4e:
/*0x4c4e*/      ldrb r0, [r4, #3]
/*0x4c50*/      orr r0, r0, #1
/*0x4c54*/      strb r0, [r4, #3]
/*0x4c56*/      b jump_4bc8

            data_4c58:
/*0x4c58*/  .word 0x20000054
            data_4c5c:
/*0x4c5c*/  .word 0x200001f9
            data_4c60:
/*0x4c60*/  .word 0x20000590
            data_4c64:
/*0x4c64*/  .word 0x20000580


            .thumb_func
            call_4c68:
/*0x4c68*/      ldrh r2, [r1]
/*0x4c6a*/      bfi r2, r0, #0, #9
/*0x4c6e*/      strh r2, [r1]
/*0x4c70*/      bx lr

            .thumb_func
            call_4c72:
/*0x4c72*/      ubfx r0, r0, #0, #9
/*0x4c76*/      bx lr

            .thumb_func
            call_4c78:
/*0x4c78*/      push {r4, r5, r6, r7, lr}
/*0x4c7a*/      movs r5, #0
/*0x4c7c*/      b jump_4c9e
            jump_4c7e:
/*0x4c7e*/      movs r4, #0
/*0x4c80*/      b jump_4c8e
            jump_4c82:
/*0x4c82*/      ldrb r6, [r0, r5]
/*0x4c84*/      ldrb r7, [r1, r4]
/*0x4c86*/      cmp r6, r7
/*0x4c88*/      beq jump_4c92
/*0x4c8a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4c8c*/      uxtb r4, r4
            jump_4c8e:
/*0x4c8e*/      cmp r4, r3
/*0x4c90*/      blo jump_4c82
            jump_4c92:
/*0x4c92*/      cmp r4, r3
/*0x4c94*/      bne jump_4c9a
/*0x4c96*/      movs r0, #0
/*0x4c98*/      pop {r4, r5, r6, r7, pc}
            jump_4c9a:
/*0x4c9a*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4c9c*/      uxtb r5, r5
            jump_4c9e:
/*0x4c9e*/      cmp r5, r2
/*0x4ca0*/      blo jump_4c7e
/*0x4ca2*/      movs r0, #1
/*0x4ca4*/      pop {r4, r5, r6, r7, pc}

/*0x4ca6*/  .byte 0x00
/*0x4ca7*/  .byte 0x00


            .thumb_func
            call_4ca8:
/*0x4ca8*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x4cac*/      movs r3, #0xe
/*0x4cae*/      movs r4, #0
/*0x4cb0*/      ldr.w sb, [pc, #0x4c] /* data_4d00 */
/*0x4cb4*/      mov.w ip, #1
/*0x4cb8*/      ldr.w r8, [pc, #0x48] /* data_4d04 */
/*0x4cbc*/      b jump_4cee
            jump_4cbe:
/*0x4cbe*/      ldrb.w r5, [sb, r3]
/*0x4cc2*/      cmp r5, #0xff
/*0x4cc4*/      beq jump_4cee
/*0x4cc6*/      movs r2, #8
/*0x4cc8*/      add.w r7, r8, r3, lsl #3
/*0x4ccc*/      b jump_4ce8
            jump_4cce:
/*0x4cce*/      lsl.w r6, ip, r2
/*0x4cd2*/      uxtb r6, r6
/*0x4cd4*/      tst r5, r6
/*0x4cd6*/      bne jump_4ce8
/*0x4cd8*/      cbz r1, jump_4cfa
/*0x4cda*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4cdc*/      ldrb r6, [r7, r2]
/*0x4cde*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4ce0*/      strb r6, [r0], #1
/*0x4ce4*/      uxtb r1, r1
/*0x4ce6*/      uxtb r4, r4
            jump_4ce8:
/*0x4ce8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4cea*/      uxtb r2, r2
/*0x4cec*/      bhs jump_4cce
            jump_4cee:
/*0x4cee*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4cf0*/      uxtb r3, r3
/*0x4cf2*/      bhs jump_4cbe
/*0x4cf4*/      mov r0, r4
            jump_4cf6:
/*0x4cf6*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_4cfa:
/*0x4cfa*/      movs r0, #0xff
/*0x4cfc*/      b jump_4cf6

/*0x4cfe*/  .byte 0x00
/*0x4cff*/  .byte 0x00

            data_4d00:
/*0x4d00*/  .word 0x200000d4
            data_4d04:
/*0x4d04*/  .word 0x200001f9


            .thumb_func
            call_4d08:
/*0x4d08*/      push {r4, lr}
/*0x4d0a*/      bl call_6740
/*0x4d0e*/      cmp r0, #0
/*0x4d10*/      beq jump_4d22
/*0x4d12*/      movs r1, #0xe
/*0x4d14*/      ldr r0, [pc, #0x18] /* data_4d30 */
/*0x4d16*/      b jump_4d24
            jump_4d18:
/*0x4d18*/      ldrb r2, [r0, #-0x1]!
/*0x4d1c*/      cmp r2, #0xff
/*0x4d1e*/      beq jump_4d24
/*0x4d20*/      movs r0, #0
            jump_4d22:
/*0x4d22*/      pop {r4, pc}
            jump_4d24:
/*0x4d24*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4d26*/      uxtb r1, r1
/*0x4d28*/      bhs jump_4d18
/*0x4d2a*/      movs r0, #1
/*0x4d2c*/      pop {r4, pc}

/*0x4d2e*/  .byte 0x00
/*0x4d2f*/  .byte 0x00

            data_4d30:
/*0x4d30*/  .word 0x200000e2


            .thumb_func
            call_4d34:
/*0x4d34*/      ldr r0, [pc, #8] /* data_4d40 */
/*0x4d36*/      ldrb.w r0, [r0, #0x2d4]
/*0x4d3a*/      b.w call_678c

/*0x4d3e*/  .byte 0x00
/*0x4d3f*/  .byte 0x00

            data_4d40:
/*0x4d40*/  .word 0x20000620


            .thumb_func
            call_4d44:
/*0x4d44*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4d48*/      ldr r4, [pc, #0xe0] /* data_4e2c */
/*0x4d4a*/      ldrh r0, [r4]
/*0x4d4c*/      movw r6, #0xffff
/*0x4d50*/      cmp r0, r6
/*0x4d52*/      beq jump_4e28
/*0x4d54*/      movs r1, #3
/*0x4d56*/      add r0, sp, #4
/*0x4d58*/      bl call_4ca8
/*0x4d5c*/      ldr r5, [pc, #0xd0] /* data_4e30 */
/*0x4d5e*/      movs r7, #0
/*0x4d60*/      movw sb, #0x2710
/*0x4d64*/      cmp r0, #2
/*0x4d66*/      beq jump_4d8c
/*0x4d68*/      cmp r0, #3
/*0x4d6a*/      bne jump_4dca
/*0x4d6c*/      movs r0, #0x21
/*0x4d6e*/      str r0, [sp]
/*0x4d70*/      movs r3, #0x20
/*0x4d72*/      movs r2, #0x49
/*0x4d74*/      movs r1, #3
/*0x4d76*/      add r0, sp, #4
/*0x4d78*/      bl call_8360
/*0x4d7c*/      cbz r0, jump_4dcc
/*0x4d7e*/      strh r6, [r4]
/*0x4d80*/      ldrb r0, [r5, #8]
/*0x4d82*/      mvns r0, r0
/*0x4d84*/      strb r0, [r5, #8]
/*0x4d86*/      movs r0, #3
/*0x4d88*/      strb r0, [r5, #4]
/*0x4d8a*/      b jump_4e20
            jump_4d8c:
/*0x4d8c*/      movs r3, #0x34
/*0x4d8e*/      movs r2, #0x22
/*0x4d90*/      movs r1, #2
/*0x4d92*/      add r0, sp, #4
/*0x4d94*/      str r7, [sp]
/*0x4d96*/      bl call_8360
/*0x4d9a*/      mov.w r8, #1
/*0x4d9e*/      cbz r0, jump_4dae
/*0x4da0*/      ldrh r1, [r4]
/*0x4da2*/      cmp r1, sb
/*0x4da4*/      bls jump_4dce
/*0x4da6*/      strh r6, [r4]
/*0x4da8*/      strb.w r8, [r5, #3]
/*0x4dac*/      b jump_4dca
            jump_4dae:
/*0x4dae*/      movs r3, #0x21
/*0x4db0*/      movs r2, #0x4a
/*0x4db2*/      movs r1, #2
/*0x4db4*/      add r0, sp, #4
/*0x4db6*/      str r7, [sp]
/*0x4db8*/      bl call_8360
/*0x4dbc*/      cbz r0, jump_4dd4
/*0x4dbe*/      ldrh r1, [r4]
/*0x4dc0*/      cmp r1, sb
/*0x4dc2*/      bls jump_4dce
/*0x4dc4*/      strh r6, [r4]
/*0x4dc6*/      movs r0, #2
/*0x4dc8*/      strb r0, [r5, #3]
            jump_4dca:
/*0x4dca*/      strb r7, [r5, #9]
            jump_4dcc:
/*0x4dcc*/      b jump_4e20
            jump_4dce:
/*0x4dce*/      strb.w r8, [r5, #9]
/*0x4dd2*/      b jump_4e20
            jump_4dd4:
/*0x4dd4*/      ldr r5, [pc, #0x5c] /* data_4e34 */
/*0x4dd6*/      str r7, [sp]
/*0x4dd8*/      movs r3, #0x40
/*0x4dda*/      ldrb.w r2, [r5, #0x58]
/*0x4dde*/      movs r1, #2
/*0x4de0*/      add r0, sp, #4
/*0x4de2*/      bl call_8360
/*0x4de6*/      ldr.w sl, [pc, #0x50] /* data_4e38 */
/*0x4dea*/      movw r8, #0x1770
/*0x4dee*/      cbz r0, jump_4dfc
/*0x4df0*/      ldrh r1, [r4]
/*0x4df2*/      cmp r1, r8
/*0x4df4*/      bls jump_4e20
/*0x4df6*/      strh r7, [r4]
/*0x4df8*/      movs r1, #0x55
/*0x4dfa*/      b jump_4e18
            jump_4dfc:
/*0x4dfc*/      str r7, [sp]
/*0x4dfe*/      ldrb.w r2, [r5, #0x59]
/*0x4e02*/      movs r3, #0x40
/*0x4e04*/      movs r1, #2
/*0x4e06*/      add r0, sp, #4
/*0x4e08*/      bl call_8360
/*0x4e0c*/      cbz r0, jump_4e20
/*0x4e0e*/      ldrh r1, [r4]
/*0x4e10*/      cmp r1, r8
/*0x4e12*/      bls jump_4e20
/*0x4e14*/      strh r7, [r4]
/*0x4e16*/      movs r1, #0x23
            jump_4e18:
/*0x4e18*/      strb.w r1, [sl]
/*0x4e1c*/      strb.w r1, [sl, #1]
            jump_4e20:
/*0x4e20*/      ldrh r1, [r4]
/*0x4e22*/      cmp r1, sb
/*0x4e24*/      bls jump_4e28
/*0x4e26*/      strh r6, [r4]
            jump_4e28:
/*0x4e28*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, pc}

            data_4e2c:
/*0x4e2c*/  .word 0x2000001c
            data_4e30:
/*0x4e30*/  .word 0x20000580
            data_4e34:
/*0x4e34*/  .word 0x20000620
            data_4e38:
/*0x4e38*/  .word 0x20000000


            .thumb_func
            call_4e3c:
/*0x4e3c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4e40*/      ldr r0, [pc, #0x240] /* data_5084 */
/*0x4e42*/      ldr.w ip, [pc, #0x244] /* data_5088 */
/*0x4e46*/      movs r5, #0
/*0x4e48*/      ldrb r2, [r0, #0xb]
/*0x4e4a*/      ldrb.w r1, [ip, #4]
/*0x4e4e*/      cbz r2, jump_4e88
/*0x4e50*/      ldrb.w r0, [ip, #6]
/*0x4e54*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e56*/      uxtb r0, r0
/*0x4e58*/      strb.w r0, [ip, #6]
/*0x4e5c*/      cmp r0, #3
/*0x4e5e*/      bls jump_4f14
/*0x4e60*/      mov r0, ip
/*0x4e62*/      strb.w r5, [ip, #6]
/*0x4e66*/      ldrb r0, [r0, #4]
/*0x4e68*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e6a*/      cmp r2, #6
/*0x4e6c*/      beq jump_4e74
/*0x4e6e*/      cmp r2, #7
            jump_4e70:
/*0x4e70*/      bne jump_4f14
/*0x4e72*/      b jump_4e7c
            jump_4e74:
/*0x4e74*/      strb.w r1, [ip, #5]
/*0x4e78*/      movs r1, #0x57
/*0x4e7a*/      b jump_4e7e
            jump_4e7c:
/*0x4e7c*/      movs r1, #0x18
            jump_4e7e:
/*0x4e7e*/      udiv r2, r0, r1
/*0x4e82*/      mls r0, r1, r2, r0
/*0x4e86*/      b jump_4f18
            jump_4e88:
/*0x4e88*/      ldr r0, [pc, #0x200] /* data_508c */
/*0x4e8a*/      ldr r3, [pc, #0x1fc] /* data_5088 */
/*0x4e8c*/      ldr r2, [pc, #0x200] /* data_5090 */
/*0x4e8e*/      ldrb r0, [r0, #3]
/*0x4e90*/      addw r6, r3, #0x153
/*0x4e94*/      ldr r3, [r3]
/*0x4e96*/      add.w r4, r2, #0xe
/*0x4e9a*/      mov.w sb, #1
/*0x4e9e*/      cmp r0, #3
/*0x4ea0*/      bhi jump_4f5e
/*0x4ea2*/      ldrb r2, [r2, r0]
/*0x4ea4*/      cmp r0, #1
/*0x4ea6*/      add.w r2, r2, r2, lsl #1
/*0x4eaa*/      add.w r2, r4, r2, lsl #1
/*0x4eae*/      ldrb r4, [r3, #4]
/*0x4eb0*/      and r4, r4, #0xf
/*0x4eb4*/      ldrb r4, [r2, r4]
/*0x4eb6*/      beq jump_4ec2
/*0x4eb8*/      cmp r0, #2
/*0x4eba*/      beq jump_4f16
/*0x4ebc*/      cmp r0, #3
/*0x4ebe*/      bne jump_4e70
/*0x4ec0*/      b jump_4f1e
            jump_4ec2:
/*0x4ec2*/      movs r1, #3
/*0x4ec4*/      add.w r0, ip, #7
/*0x4ec8*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x4eca*/      b jump_4f0e
            jump_4ecc:
/*0x4ecc*/      lsl.w r2, sb, r1
/*0x4ed0*/      ldrb.w r6, [ip, #7]
/*0x4ed4*/      uxtb r2, r2
/*0x4ed6*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4ed8*/      tst r6, r2
/*0x4eda*/      ldrb r6, [r0, #-0x1]!
/*0x4ede*/      beq jump_4ef2
/*0x4ee0*/      cmp r6, r4
/*0x4ee2*/      bhi jump_4eee
/*0x4ee4*/      strb r5, [r0]
/*0x4ee6*/      ldrb.w r6, [ip, #7]
/*0x4eea*/      bics r6, r2
/*0x4eec*/      b jump_4f04
            jump_4eee:
/*0x4eee*/      subs r2, r6, r4
/*0x4ef0*/      b jump_4f0c
            jump_4ef2:
/*0x4ef2*/      ldrb r7, [r3]
/*0x4ef4*/      sub.w r8, r7, r4
/*0x4ef8*/      cmp r6, r8
/*0x4efa*/      blt jump_4f0a
/*0x4efc*/      strb r7, [r0]
/*0x4efe*/      ldrb.w r6, [ip, #7]
/*0x4f02*/      orrs r6, r2
            jump_4f04:
/*0x4f04*/      strb.w r6, [ip, #7]
/*0x4f08*/      b jump_4f0e
            jump_4f0a:
/*0x4f0a*/      adds r2, r6, r4
            jump_4f0c:
/*0x4f0c*/      strb r2, [r0]
            jump_4f0e:
/*0x4f0e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4f10*/      uxtb r1, r1
/*0x4f12*/      bhs jump_4ecc
            jump_4f14:
/*0x4f14*/      b jump_507c
            jump_4f16:
/*0x4f16*/      adds r0, r1, r4
            jump_4f18:
/*0x4f18*/      strb.w r0, [ip, #4]
/*0x4f1c*/      b jump_507c
            jump_4f1e:
/*0x4f1e*/      movs r7, #0x70
/*0x4f20*/      b jump_4f56
            jump_4f22:
/*0x4f22*/      bl rand
/*0x4f26*/      sdiv r1, r0, r4
/*0x4f2a*/      mls r0, r4, r1, r0
/*0x4f2e*/      cbz r0, jump_4f34
/*0x4f30*/      movs r0, #3
/*0x4f32*/      b jump_4f50
            jump_4f34:
/*0x4f34*/      subs r0, r6, #2
/*0x4f36*/      movs r1, #0
/*0x4f38*/      bl call_78fc
/*0x4f3c*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x4f3e*/      b jump_4f56
            jump_4f40:
/*0x4f40*/      ldrb r1, [r6]
/*0x4f42*/      cmp r1, #2
/*0x4f44*/      bhi jump_4f4a
/*0x4f46*/      strb r5, [r6]
/*0x4f48*/      b jump_4f4e
            jump_4f4a:
/*0x4f4a*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x4f4c*/      strb r1, [r6]
            jump_4f4e:
/*0x4f4e*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_4f50:
/*0x4f50*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4f52*/      uxtb r0, r0
/*0x4f54*/      bhs jump_4f40
            jump_4f56:
/*0x4f56*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x4f58*/      uxtb r7, r7
/*0x4f5a*/      bhs jump_4f22
/*0x4f5c*/      b jump_507c
            jump_4f5e:
/*0x4f5e*/      cmp r0, #7
/*0x4f60*/      bls jump_4fda
/*0x4f62*/      ldrb r1, [r2, r0]
/*0x4f64*/      ldrb r2, [r3, #4]
/*0x4f66*/      add.w r1, r1, r1, lsl #1
/*0x4f6a*/      add.w r1, r4, r1, lsl #1
/*0x4f6e*/      and r2, r2, #0xf
/*0x4f72*/      bic r0, r0, #1
/*0x4f76*/      ldrb r2, [r1, r2]
/*0x4f78*/      cmp r0, #8
/*0x4f7a*/      beq jump_4f86
/*0x4f7c*/      cmp r0, #0xa
/*0x4f7e*/      beq jump_4fdc
/*0x4f80*/      cmp r0, #0xc
/*0x4f82*/      bne jump_507c
/*0x4f84*/      b jump_503a
            jump_4f86:
/*0x4f86*/      movs r0, #0x70
/*0x4f88*/      b jump_4fd4
            jump_4f8a:
/*0x4f8a*/      ldrb r1, [r6], #-1
/*0x4f8e*/      cbz r1, jump_4f94
/*0x4f90*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4f92*/      b jump_4fa4
            jump_4f94:
/*0x4f94*/      ldrb r1, [r6], #-1
/*0x4f98*/      cbz r1, jump_4f9e
/*0x4f9a*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x4f9c*/      b jump_4fa4
            jump_4f9e:
/*0x4f9e*/      ldrb r1, [r6], #-1
/*0x4fa2*/      cbz r1, jump_4fd4
            jump_4fa4:
/*0x4fa4*/      ldr r1, [pc, #0xec] /* data_5094 */
/*0x4fa6*/      and r4, r0, #7
/*0x4faa*/      add.w r1, r1, r0, lsr #3
/*0x4fae*/      ldrb r3, [r1]
/*0x4fb0*/      lsl.w r1, sb, r4
/*0x4fb4*/      tst r3, r1
/*0x4fb6*/      beq jump_4fd4
/*0x4fb8*/      movs r1, #3
/*0x4fba*/      b jump_4fcc
            jump_4fbc:
/*0x4fbc*/      ldrb r3, [r6, #1]!
/*0x4fc0*/      cmp r3, r2
/*0x4fc2*/      bhi jump_4fc8
/*0x4fc4*/      strb r5, [r6]
/*0x4fc6*/      b jump_4fcc
            jump_4fc8:
/*0x4fc8*/      subs r3, r3, r2
/*0x4fca*/      strb r3, [r6]
            jump_4fcc:
/*0x4fcc*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4fce*/      uxtb r1, r1
/*0x4fd0*/      bhs jump_4fbc
/*0x4fd2*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4fd4:
/*0x4fd4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4fd6*/      uxtb r0, r0
/*0x4fd8*/      bhs jump_4f8a
            jump_4fda:
/*0x4fda*/      b jump_507c
            jump_4fdc:
/*0x4fdc*/      ldrb.w r0, [ip, #0x70]
/*0x4fe0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4fe2*/      uxtb r0, r0
/*0x4fe4*/      strb.w r0, [ip, #0x70]
/*0x4fe8*/      cmp r0, r2
/*0x4fea*/      blo jump_507c
/*0x4fec*/      strb.w r5, [ip, #0x70]
/*0x4ff0*/      movs r0, #1
            jump_4ff2:
/*0x4ff2*/      add.w r1, r0, r0, lsl #1
/*0x4ff6*/      add.w r1, ip, r1, lsl #1
/*0x4ffa*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4ffc*/      ldrh r2, [r1, #4]
/*0x4ffe*/      strh r2, [r1, #-0x2]
/*0x5002*/      ldrb r2, [r1, #6]
/*0x5004*/      uxtb r0, r0
/*0x5006*/      strb r2, [r1]
/*0x5008*/      cmp r0, #0x12
/*0x500a*/      blo jump_4ff2
/*0x500c*/      strh.w r5, [ip, #0x6a]
/*0x5010*/      strb.w r5, [ip, #0x6c]
/*0x5014*/      movs r0, #0x12
/*0x5016*/      b jump_502a
            jump_5018:
/*0x5018*/      add.w r1, r0, r0, lsl #1
/*0x501c*/      add.w r1, ip, r1, lsl #1
/*0x5020*/      ldrh r2, [r1, #1]!
/*0x5024*/      strh r2, [r1, #6]
/*0x5026*/      ldrb r2, [r1, #2]
/*0x5028*/      strb r2, [r1, #8]
            jump_502a:
/*0x502a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x502c*/      uxtb r0, r0
/*0x502e*/      bhs jump_5018
/*0x5030*/      strh.w r5, [ip, #7]
/*0x5034*/      strb.w r5, [ip, #9]
/*0x5038*/      b jump_507c
            jump_503a:
/*0x503a*/      ldrb.w r0, [ip, #0x2c]
/*0x503e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5040*/      uxtb r0, r0
/*0x5042*/      strb.w r0, [ip, #0x2c]
/*0x5046*/      cmp r0, r2
/*0x5048*/      blo jump_507c
/*0x504a*/      ldr r0, [pc, #0x3c] /* data_5088 */
/*0x504c*/      strb.w r5, [ip, #0x2c]
/*0x5050*/      adds r0, #0x2c
/*0x5052*/      movs r2, #6
/*0x5054*/      b jump_5076
            jump_5056:
/*0x5056*/      ldrsb r1, [r0, #-0x1]
/*0x505a*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x505c*/      cbz r1, jump_5076
/*0x505e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x5060*/      sxtb r1, r1
/*0x5062*/      strb r1, [r0, #4]
/*0x5064*/      ldrb r3, [r0, #3]
/*0x5066*/      adds r4, r1, r3
/*0x5068*/      subs r4, #0xa
/*0x506a*/      cmp r4, #0x13
/*0x506c*/      ble jump_5076
/*0x506e*/      subs r1, r3, r1
/*0x5070*/      adds r1, #0xa
/*0x5072*/      bpl jump_5076
/*0x5074*/      strb r5, [r0, #4]
            jump_5076:
/*0x5076*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x5078*/      uxtb r2, r2
/*0x507a*/      bhs jump_5056
            jump_507c:
/*0x507c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5080*/      b.w call_591c

            data_5084:
/*0x5084*/  .word 0x20000580
            data_5088:
/*0x5088*/  .word 0x20001908
            data_508c:
/*0x508c*/  .word 0x20000620
            data_5090:
/*0x5090*/  .word 0x00008b81 /* possible pointer */
            data_5094:
/*0x5094*/  .word 0x200000d4


            .thumb_func
            call_5098:
/*0x5098*/      movs r1, #7
/*0x509a*/      ldr r0, [pc, #4] /* data_50a0 */
/*0x509c*/      b.w jump_4998

            data_50a0:
/*0x50a0*/  .word 0x000085b0 /* possible pointer */


            .thumb_func
            call_50a4:
/*0x50a4*/      push {r3, r4, r5, lr}
/*0x50a6*/      movs r1, #3
/*0x50a8*/      mov r0, sp
/*0x50aa*/      bl call_4ca8
/*0x50ae*/      ldr r4, [pc, #0x2c] /* data_50dc */
/*0x50b0*/      cmp r0, #3
/*0x50b2*/      bne jump_50d2
/*0x50b4*/      movs r3, #3
/*0x50b6*/      mov r2, r3
/*0x50b8*/      ldr r1, [pc, #0x24] /* data_50e0 */
/*0x50ba*/      mov r0, sp
/*0x50bc*/      bl call_4c78
/*0x50c0*/      cbz r0, jump_50d2
/*0x50c2*/      ldrb r0, [r4, #2]
/*0x50c4*/      mvn.w r1, r0, lsr #1
/*0x50c8*/      bfi r0, r1, #1, #1
/*0x50cc*/      strb r0, [r4, #2]
/*0x50ce*/      bl call_40d4
            jump_50d2:
/*0x50d2*/      ldrb r0, [r4, #2]
/*0x50d4*/      ubfx r0, r0, #1, #1
/*0x50d8*/      pop {r3, r4, r5, pc}

/*0x50da*/  .byte 0x00
/*0x50db*/  .byte 0x00

            data_50dc:
/*0x50dc*/  .word 0x20000620
            data_50e0:
/*0x50e0*/  .word 0x0000859a /* possible pointer */


            .thumb_func
            call_50e4:
/*0x50e4*/      push {r4, lr}
/*0x50e6*/      lsrs r1, r0, #0x18
/*0x50e8*/      lsls r1, r1, #0x1e
/*0x50ea*/      bpl jump_5106
/*0x50ec*/      uxtb r0, r0
/*0x50ee*/      cmp r0, #0x13
/*0x50f0*/      beq jump_5100
/*0x50f2*/      bgt jump_5108
/*0x50f4*/      cmp r0, #0x10
/*0x50f6*/      beq jump_5100
/*0x50f8*/      cmp r0, #0x11
/*0x50fa*/      beq jump_5100
/*0x50fc*/      cmp r0, #0x12
/*0x50fe*/      bne jump_5106
            jump_5100:
/*0x5100*/      ldr r1, [pc, #0x50] /* data_5154 */
/*0x5102*/      subs r0, #0x10
/*0x5104*/      strb r0, [r1]
            jump_5106:
/*0x5106*/      pop {r4, pc}
            jump_5108:
/*0x5108*/      cmp r0, #0x5f
/*0x510a*/      beq jump_5126
/*0x510c*/      cmp r0, #0x68
/*0x510e*/      bne jump_5106
/*0x5110*/      ldr r1, [pc, #0x44] /* data_5158 */
/*0x5112*/      movs r0, #3
/*0x5114*/      strb r0, [r1, #4]
/*0x5116*/      ldr r1, [pc, #0x44] /* data_515c */
/*0x5118*/      ldrb.w r0, [r1, #0x2d4]
/*0x511c*/      cbz r0, jump_5140
/*0x511e*/      cmp r0, #1
/*0x5120*/      beq jump_5144
/*0x5122*/      movs r0, #0
/*0x5124*/      b jump_5146
            jump_5126:
/*0x5126*/      ldr r0, [pc, #0x38] /* data_5160 */
/*0x5128*/      ldrb r0, [r0, #2]
/*0x512a*/      cmp r0, #0
/*0x512c*/      beq jump_5106
/*0x512e*/      bl call_590c
/*0x5132*/      bl call_5fe4
/*0x5136*/      ldr r1, [pc, #0x2c] /* data_5164 */
/*0x5138*/      movw r0, #0x7530
/*0x513c*/      strh r0, [r1, #6]
/*0x513e*/      pop {r4, pc}
            jump_5140:
/*0x5140*/      movs r0, #1
/*0x5142*/      b jump_5146
            jump_5144:
/*0x5144*/      movs r0, #2
            jump_5146:
/*0x5146*/      strb.w r0, [r1, #0x2d4]
/*0x514a*/      pop.w {r4, lr}
/*0x514e*/      b.w call_40d4

/*0x5152*/  .byte 0x00
/*0x5153*/  .byte 0x00

            data_5154:
/*0x5154*/  .word 0x2000004d
            data_5158:
/*0x5158*/  .word 0x20000580
            data_515c:
/*0x515c*/  .word 0x20000620
            data_5160:
/*0x5160*/  .word 0x2000005c
            data_5164:
/*0x5164*/  .word 0x20000000


            .thumb_func
            call_5168:
/*0x5168*/      ldr r0, [pc, #0x68] /* data_51d4 */
/*0x516a*/      ldrb r1, [r0, #3]
/*0x516c*/      lsls r1, r1, #0x1e
/*0x516e*/      bpl jump_51a2
/*0x5170*/      ldrb r3, [r0]
/*0x5172*/      movs r1, #1
/*0x5174*/      ldr r2, [pc, #0x60] /* data_51d8 */
/*0x5176*/      cmp r3, #0xcf
/*0x5178*/      beq jump_5198
/*0x517a*/      ldrb r3, [r0, #1]
/*0x517c*/      lsls r3, r3, #0x1f
/*0x517e*/      beq jump_51a2
/*0x5180*/      ldrb r0, [r0, #2]
/*0x5182*/      cmp r0, #0x24
/*0x5184*/      beq jump_51c2
/*0x5186*/      mov r1, r2
/*0x5188*/      cmp r0, #0x35
/*0x518a*/      ldr r1, [r1]
/*0x518c*/      beq jump_51b2
/*0x518e*/      cmp r0, #0x3d
/*0x5190*/      beq jump_51b6
/*0x5192*/      cmp r0, #0x45
/*0x5194*/      bne jump_51a2
/*0x5196*/      b jump_51bc
            jump_5198:
/*0x5198*/      ldrb r0, [r2, #7]
/*0x519a*/      cmp r0, #4
/*0x519c*/      beq jump_51ae
/*0x519e*/      cmp r0, #5
/*0x51a0*/      beq jump_51a6
            jump_51a2:
/*0x51a2*/      movs r0, #0
/*0x51a4*/      bx lr
            jump_51a6:
/*0x51a6*/      strb r1, [r2, #8]
/*0x51a8*/      movs r0, #6
/*0x51aa*/      strb r0, [r2, #7]
/*0x51ac*/      b jump_51d0
            jump_51ae:
/*0x51ae*/      strb r1, [r2, #7]
/*0x51b0*/      b jump_51d0
            jump_51b2:
/*0x51b2*/      adds r1, #0xf
/*0x51b4*/      b jump_51b8
            jump_51b6:
/*0x51b6*/      adds r1, #0x64
            jump_51b8:
/*0x51b8*/      str r1, [r2]
/*0x51ba*/      b jump_51d0
            jump_51bc:
/*0x51bc*/      add.w r1, r1, #0x1f4
/*0x51c0*/      b jump_51b8
            jump_51c2:
/*0x51c2*/      movs r0, #8
/*0x51c4*/      strb r0, [r2, #7]
/*0x51c6*/      ldr r2, [pc, #0x14] /* data_51dc */
/*0x51c8*/      movs r0, #0
/*0x51ca*/      strh r0, [r2, #6]
/*0x51cc*/      ldr r0, [pc, #0x10] /* data_51e0 */
/*0x51ce*/      strb r1, [r0]
            jump_51d0:
/*0x51d0*/      movs r0, #1
/*0x51d2*/      bx lr

            data_51d4:
/*0x51d4*/  .word 0x20000054
            data_51d8:
/*0x51d8*/  .word 0x200018fc
            data_51dc:
/*0x51dc*/  .word 0x20000000
            data_51e0:
/*0x51e0*/  .word 0x20000580


            .thumb_func
            call_51e4:
/*0x51e4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x51e8*/      ldr r7, [pc, #0x210] /* data_53fc */
/*0x51ea*/      ldrh r0, [r7, #6]
/*0x51ec*/      cbz r0, jump_51f4
/*0x51ee*/      movw r0, #0x7530
/*0x51f2*/      strh r0, [r7, #6]
            jump_51f4:
/*0x51f4*/      ldr.w r8, [pc, #0x20c] /* data_5404 */
/*0x51f8*/      ldr r5, [pc, #0x204] /* data_5400 */
/*0x51fa*/      mov.w sl, #0
/*0x51fe*/      ldrb.w r3, [r8, #3]
/*0x5202*/      ldrb r2, [r5, #0xa]
/*0x5204*/      ldrb.w r0, [r8]
/*0x5208*/      ldrb.w r1, [r8, #2]
/*0x520c*/      movs r4, #1
/*0x520e*/      cbz r2, jump_5278
/*0x5210*/      lsls r3, r3, #0x1e
/*0x5212*/      bpl jump_5296
/*0x5214*/      ldr r3, [pc, #0x1f0] /* data_5408 */
/*0x5216*/      cmp r2, #1
/*0x5218*/      ldrb r6, [r3, #0x58]!
/*0x521c*/      ldrb r3, [r3, #1]
/*0x521e*/      beq jump_5232
/*0x5220*/      ldr r7, [pc, #0x1e8] /* data_540c */
/*0x5222*/      ldrb r7, [r2, r7]
/*0x5224*/      cmp r1, r7
/*0x5226*/      bne jump_525c
/*0x5228*/      cmp r2, #2
/*0x522a*/      beq jump_5250
/*0x522c*/      cmp r2, #3
/*0x522e*/      beq jump_5256
/*0x5230*/      b jump_528a
            jump_5232:
/*0x5232*/      ldrb r0, [r7, #1]
/*0x5234*/      cmp r0, #0x55
/*0x5236*/      beq jump_523e
/*0x5238*/      cmp r0, #0x23
/*0x523a*/      beq jump_5246
/*0x523c*/      b jump_5296
            jump_523e:
/*0x523e*/      cmp r1, r6
/*0x5240*/      bne jump_5296
/*0x5242*/      movs r0, #2
/*0x5244*/      b jump_524c
            jump_5246:
/*0x5246*/      cmp r1, r3
/*0x5248*/      bne jump_5296
/*0x524a*/      movs r0, #3
            jump_524c:
/*0x524c*/      strb r0, [r5, #0xa]
/*0x524e*/      b jump_5296
            jump_5250:
/*0x5250*/      cmp r3, r1
/*0x5252*/      beq jump_5296
/*0x5254*/      b jump_528a
            jump_5256:
/*0x5256*/      cmp r6, r1
/*0x5258*/      beq jump_5296
/*0x525a*/      b jump_528a
            jump_525c:
/*0x525c*/      cmp r2, #2
/*0x525e*/      beq jump_5266
/*0x5260*/      cmp r2, #3
/*0x5262*/      beq jump_526c
/*0x5264*/      b jump_5270
            jump_5266:
/*0x5266*/      cmp r3, r1
/*0x5268*/      beq jump_5296
/*0x526a*/      b jump_5270
            jump_526c:
/*0x526c*/      cmp r6, r1
/*0x526e*/      beq jump_5296
            jump_5270:
/*0x5270*/      ldr r7, [pc, #0x198] /* data_540c */
/*0x5272*/      movs r3, #4
/*0x5274*/      adds r7, #0xb
/*0x5276*/      b jump_5280
            jump_5278:
/*0x5278*/      b jump_529c
            jump_527a:
/*0x527a*/      ldrb r6, [r7, r3]
/*0x527c*/      cmp r6, r0
/*0x527e*/      beq jump_5286
            jump_5280:
/*0x5280*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x5282*/      uxtb r3, r3
/*0x5284*/      bhs jump_527a
            jump_5286:
/*0x5286*/      cmp r3, #0xff
/*0x5288*/      bne jump_5296
            jump_528a:
/*0x528a*/      ldr r0, [pc, #0x17c] /* data_5408 */
/*0x528c*/      adds r0, #0x56
/*0x528e*/      strb r1, [r2, r0]
/*0x5290*/      strb r4, [r5, #0xa]
/*0x5292*/      bl call_8568
            jump_5296:
/*0x5296*/      strb.w sl, [r8]
/*0x529a*/      b jump_52e4
            jump_529c:
/*0x529c*/      ldr.w sb, [pc, #0x170] /* data_5410 */
/*0x52a0*/      cmp r0, #0xcf
/*0x52a2*/      ldrb.w r7, [sb, #6]
/*0x52a6*/      beq jump_52da
/*0x52a8*/      ldr r6, [pc, #0x158] /* data_5404 */
/*0x52aa*/      ldrb.w r2, [r8, #1]
/*0x52ae*/      ldrb r6, [r6, #3]
/*0x52b0*/      lsls.w ip, r2, #0x1f
/*0x52b4*/      orr r6, r6, #1
/*0x52b8*/      beq jump_5344
/*0x52ba*/      cmp r7, #1
/*0x52bc*/      beq jump_52ee
/*0x52be*/      ldr.w r0, [r8]
/*0x52c2*/      bl call_4c72
/*0x52c6*/      movs r1, #3
/*0x52c8*/      bl call_5570
/*0x52cc*/      cmp r0, #0xff
/*0x52ce*/      beq jump_52ea
/*0x52d0*/      ldrb.w r1, [r8, #2]
/*0x52d4*/      cmp r1, #0x39
/*0x52d6*/      bne jump_52ea
/*0x52d8*/      b jump_5326
            jump_52da:
/*0x52da*/      ubfx r0, r3, #1, #1
/*0x52de*/      strb r0, [r5, #7]
/*0x52e0*/      cmp r7, #1
/*0x52e2*/      beq jump_52ea
            jump_52e4:
/*0x52e4*/      movs r0, #1
            jump_52e6:
/*0x52e6*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_52ea:
/*0x52ea*/      movs r0, #0
/*0x52ec*/      b jump_52e6
            jump_52ee:
/*0x52ee*/      ldrb.w r0, [sb, #7]
/*0x52f2*/      cmp r0, #2
/*0x52f4*/      beq jump_52ea
/*0x52f6*/      ldr r3, [pc, #0x114] /* data_540c */
/*0x52f8*/      movs r0, #0
/*0x52fa*/      adds r3, #0x2f
            jump_52fc:
/*0x52fc*/      ldrb.w r4, [r3, r0, lsl #1]
/*0x5300*/      cmp r1, r4
/*0x5302*/      bne jump_531c
/*0x5304*/      add.w r0, r3, r0, lsl #1
/*0x5308*/      ldrb r0, [r0, #1]
/*0x530a*/      strb.w r0, [r8]
/*0x530e*/      strb.w r6, [r8, #3]
/*0x5312*/      bic r0, r2, #1
/*0x5316*/      strb.w r0, [r8, #1]
            jump_531a:
/*0x531a*/      b jump_52ea
            jump_531c:
/*0x531c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x531e*/      uxtb r0, r0
/*0x5320*/      cmp r0, #0x23
/*0x5322*/      blo jump_52fc
/*0x5324*/      b jump_52ea
            jump_5326:
/*0x5326*/      ldrb.w r1, [r8, #3]
/*0x532a*/      orr r1, r1, #1
/*0x532e*/      strb.w r1, [r8, #3]
/*0x5332*/      ldrb.w r1, [r8, #1]
/*0x5336*/      bic r1, r1, #1
/*0x533a*/      strb.w r1, [r8, #1]
/*0x533e*/      strb.w r0, [r8]
/*0x5342*/      b jump_52ea
            jump_5344:
/*0x5344*/      ldrb r7, [r5, #7]
/*0x5346*/      cbz r7, jump_53a6
/*0x5348*/      ldrb r0, [r5, #6]
/*0x534a*/      cmp r0, #0
/*0x534c*/      bne jump_52ea
/*0x534e*/      lsls r0, r3, #0x1e
/*0x5350*/      bpl jump_52ea
/*0x5352*/      ldr r0, [pc, #0xc0] /* data_5414 */
/*0x5354*/      cmp r1, #5
/*0x5356*/      ldrb r0, [r0, r1]
/*0x5358*/      strb.w r0, [r8]
/*0x535c*/      beq jump_5380
/*0x535e*/      bgt jump_536a
/*0x5360*/      cmp r1, #3
/*0x5362*/      beq jump_5374
/*0x5364*/      cmp r1, #4
/*0x5366*/      bne jump_53ae
/*0x5368*/      b jump_5374
            jump_536a:
/*0x536a*/      cmp r1, #6
/*0x536c*/      beq jump_5380
/*0x536e*/      cmp r1, #0x2d
/*0x5370*/      bne jump_53ae
/*0x5372*/      b jump_538e
            jump_5374:
/*0x5374*/      .short 0x1ec9 /* subs r1, r1, #3 */ 
/*0x5376*/      lsls r4, r1
/*0x5378*/      uxtb r0, r4
/*0x537a*/      bl call_3b6c
/*0x537e*/      b jump_53b6
            jump_5380:
/*0x5380*/      .short 0x1f49 /* subs r1, r1, #5 */ 
/*0x5382*/      lsl.w r0, r4, r1
/*0x5386*/      uxtb r0, r0
/*0x5388*/      bl call_3b54
/*0x538c*/      b jump_53aa
            jump_538e:
/*0x538e*/      lsls r0, r2, #0x1c
/*0x5390*/      bpl jump_53ae
/*0x5392*/      ldrb r0, [r5, #0xb]
/*0x5394*/      cbz r0, jump_53a8
/*0x5396*/      movs r1, #7
/*0x5398*/      udiv r2, r0, r1
/*0x539c*/      mls r0, r1, r2, r0
/*0x53a0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x53a2*/      strb r0, [r5, #0xb]
/*0x53a4*/      b jump_53aa
            jump_53a6:
/*0x53a6*/      b jump_53bc
            jump_53a8:
/*0x53a8*/      strb r4, [r5, #0xb]
            jump_53aa:
/*0x53aa*/      strb r4, [r5]
/*0x53ac*/      b jump_53b6
            jump_53ae:
/*0x53ae*/      ldr.w r0, [r8]
/*0x53b2*/      bl call_572c
            jump_53b6:
/*0x53b6*/      strb.w sl, [r8]
/*0x53ba*/      b jump_52ea
            jump_53bc:
/*0x53bc*/      lsls r1, r3, #0x1e
/*0x53be*/      bpl jump_53de
/*0x53c0*/      cmp r0, #0xc0
/*0x53c2*/      bne jump_52ea
/*0x53c4*/      bl call_59cc
/*0x53c8*/      cmp r0, #0
/*0x53ca*/      bne jump_52ea
/*0x53cc*/      ldrb.w r0, [sb, #6]
/*0x53d0*/      cmp r0, #0
/*0x53d2*/      bne jump_52ea
/*0x53d4*/      ldr r0, [pc, #0x34] /* data_540c */
/*0x53d6*/      adds r0, #0x12
/*0x53d8*/      bl call_5cf0
/*0x53dc*/      b jump_52ea
            jump_53de:
/*0x53de*/      ldr r2, [pc, #0x1c] /* data_53fc */
/*0x53e0*/      .short 0x1c92 /* adds r2, r2, #2 */ 
/*0x53e2*/      ldrb r1, [r2]
/*0x53e4*/      cmp r1, #0
/*0x53e6*/      beq jump_52ea
/*0x53e8*/      cmp r0, #0x29
/*0x53ea*/      bne jump_531a
/*0x53ec*/      strb.w r1, [r8]
/*0x53f0*/      strb.w sl, [r2]
/*0x53f4*/      strb.w r6, [r8, #3]
/*0x53f8*/      b jump_52ea

/*0x53fa*/  .byte 0x00
/*0x53fb*/  .byte 0x00

            data_53fc:
/*0x53fc*/  .word 0x20000000
            data_5400:
/*0x5400*/  .word 0x20000580
            data_5404:
/*0x5404*/  .word 0x20000054
            data_5408:
/*0x5408*/  .word 0x20000620
            data_540c:
/*0x540c*/  .word 0x00008596 /* possible pointer */
            data_5410:
/*0x5410*/  .word 0x200018fc
            data_5414:
/*0x5414*/  .word 0x200001f9


            .thumb_func
            call_5418:
/*0x5418*/      push {r4, r5, r6, lr}
/*0x541a*/      ldr r3, [pc, #0x68] /* data_5484 */
/*0x541c*/      ldrb r0, [r3, #3]
/*0x541e*/      lsls r1, r0, #0x1f
/*0x5420*/      bne jump_5478
/*0x5422*/      mov r1, r3
/*0x5424*/      ldr r2, [pc, #0x60] /* data_5488 */
/*0x5426*/      ldrb r1, [r1, #2]
/*0x5428*/      ldr r4, [pc, #0x60] /* data_548c */
/*0x542a*/      lsls r0, r0, #0x1e
/*0x542c*/      bpl jump_545a
/*0x542e*/      ldrb r5, [r3, #1]
/*0x5430*/      lsls r0, r5, #0x19
/*0x5432*/      bpl jump_5478
/*0x5434*/      movs r0, #0
            jump_5436:
/*0x5436*/      ldrb.w r6, [r2, r0, lsl #1]
/*0x543a*/      cmp r1, r6
/*0x543c*/      bne jump_5450
/*0x543e*/      add.w r1, r2, r0, lsl #1
/*0x5442*/      ldrb r1, [r1, #1]
/*0x5444*/      strb r1, [r3]
/*0x5446*/      strb r1, [r4, r0]
/*0x5448*/      bic r0, r5, #1
/*0x544c*/      strb r0, [r3, #1]
/*0x544e*/      b jump_5478
            jump_5450:
/*0x5450*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5452*/      uxtb r0, r0
/*0x5454*/      cmp r0, #0x23
/*0x5456*/      blo jump_5436
/*0x5458*/      b jump_5478
            jump_545a:
/*0x545a*/      movs r0, #0
            jump_545c:
/*0x545c*/      ldrb.w r5, [r2, r0, lsl #1]
/*0x5460*/      cmp r1, r5
/*0x5462*/      bne jump_5470
/*0x5464*/      ldrb r5, [r4, r0]
/*0x5466*/      cbz r5, jump_5470
/*0x5468*/      strb r5, [r3]
/*0x546a*/      movs r1, #0
/*0x546c*/      strb r1, [r4, r0]
/*0x546e*/      b jump_5478
            jump_5470:
/*0x5470*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5472*/      uxtb r0, r0
/*0x5474*/      cmp r0, #0x23
/*0x5476*/      blo jump_545c
            jump_5478:
/*0x5478*/      ldrb r0, [r3]
/*0x547a*/      cmp r0, #0x6b
/*0x547c*/      bne jump_5482
/*0x547e*/      movs r0, #0x2c
/*0x5480*/      strb r0, [r3]
            jump_5482:
/*0x5482*/      pop {r4, r5, r6, pc}

            data_5484:
/*0x5484*/  .word 0x20000054
            data_5488:
/*0x5488*/  .word 0x000085c5 /* possible pointer */
            data_548c:
/*0x548c*/  .word 0x2000006c


            .thumb_func
            call_5490:
/*0x5490*/      ldr r1, [pc, #0x18] /* data_54ac */
/*0x5492*/      push {r4, lr}
/*0x5494*/      ldr r1, [r1]
/*0x5496*/      ldrh r2, [r0]
/*0x5498*/      strh r2, [r1]
/*0x549a*/      ldrb r0, [r0, #2]
/*0x549c*/      strb r0, [r1, #2]
/*0x549e*/      bl call_591c
/*0x54a2*/      pop.w {r4, lr}
/*0x54a6*/      b.w call_40d4

/*0x54aa*/  .byte 0x00
/*0x54ab*/  .byte 0x00

            data_54ac:
/*0x54ac*/  .word 0x20001908


            .thumb_func
            call_54b0:
/*0x54b0*/      push {r4, lr}
/*0x54b2*/      movs r1, #2
/*0x54b4*/      ldr r0, [pc, #0x10] /* data_54c8 */
/*0x54b6*/      bl call_4724
/*0x54ba*/      pop.w {r4, lr}
/*0x54be*/      movs r1, #2
/*0x54c0*/      ldr r0, [pc, #8] /* data_54cc */
/*0x54c2*/      b.w call_4724

/*0x54c6*/  .byte 0x00
/*0x54c7*/  .byte 0x00

            data_54c8:
/*0x54c8*/  .word 0x400b2000
            data_54cc:
/*0x54cc*/  .word 0x400b6000


            .thumb_func
            call_54d0:
/*0x54d0*/      push {r4, lr}
/*0x54d2*/      movs r1, #2
/*0x54d4*/      ldr r0, [pc, #0x10] /* data_54e8 */
/*0x54d6*/      bl call_46b8
/*0x54da*/      pop.w {r4, lr}
/*0x54de*/      movs r1, #2
/*0x54e0*/      ldr r0, [pc, #8] /* data_54ec */
/*0x54e2*/      b.w call_46b8

/*0x54e6*/  .byte 0x00
/*0x54e7*/  .byte 0x00

            data_54e8:
/*0x54e8*/  .word 0x400b2000
            data_54ec:
/*0x54ec*/  .word 0x400b6000


            .thumb_func
            call_54f0:
/*0x54f0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x54f4*/      ldr r4, [pc, #0x54] /* data_554c */
/*0x54f6*/      movs r5, #0
/*0x54f8*/      ldrb r0, [r4]
/*0x54fa*/      cbz r0, jump_550a
/*0x54fc*/      movs r0, #1
/*0x54fe*/      bl call_48e8
/*0x5502*/      cbz r0, jump_550a
/*0x5504*/      bl call_8568
/*0x5508*/      strb r5, [r4]
            jump_550a:
/*0x550a*/      ldr r7, [pc, #0x40] /* data_554c */
/*0x550c*/      ldr r6, [pc, #0x40] /* data_5550 */
/*0x550e*/      .short 0x1cff /* adds r7, r7, #3 */ 
/*0x5510*/      ldrb r0, [r7]
/*0x5512*/      lsls r0, r0, #0x1f
/*0x5514*/      beq jump_5528
/*0x5516*/      movs r0, #1
/*0x5518*/      bl call_48e8
/*0x551c*/      cbz r0, jump_5528
/*0x551e*/      ldrb r0, [r6, #0xc]
/*0x5520*/      cbz r0, jump_5530
/*0x5522*/      movs r0, #0
            jump_5524:
/*0x5524*/      strb r0, [r6, #0xc]
/*0x5526*/      strb r5, [r7]
            jump_5528:
/*0x5528*/      ldrh r0, [r4, #6]
/*0x552a*/      cmp r0, #1
/*0x552c*/      beq jump_5534
/*0x552e*/      b jump_5546
            jump_5530:
/*0x5530*/      movs r0, #1
/*0x5532*/      b jump_5524
            jump_5534:
/*0x5534*/      ldr r0, [pc, #0x1c] /* data_5554 */
/*0x5536*/      ldrb r1, [r0, #7]
/*0x5538*/      cbz r1, jump_553e
/*0x553a*/      movs r1, #8
/*0x553c*/      strb r1, [r0, #7]
            jump_553e:
/*0x553e*/      strb r5, [r6, #6]
/*0x5540*/      movs r0, #1
/*0x5542*/      strb r0, [r6]
/*0x5544*/      strh r5, [r4, #6]
            jump_5546:
/*0x5546*/      movs r0, #1
/*0x5548*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_554c:
/*0x554c*/  .word 0x20000000
            data_5550:
/*0x5550*/  .word 0x20000580
            data_5554:
/*0x5554*/  .word 0x200018fc


            .thumb_func
            call_5558:
/*0x5558*/      cmp r0, #0xff
/*0x555a*/      bhs jump_556a
/*0x555c*/      adds r0, #0x2b
/*0x555e*/      cmp r0, #0xff
/*0x5560*/      bls jump_5566
/*0x5562*/      movs r0, #0xff
/*0x5564*/      bx lr
            jump_5566:
/*0x5566*/      uxtb r0, r0
/*0x5568*/      bx lr
            jump_556a:
/*0x556a*/      movs r0, #0
/*0x556c*/      bx lr

/*0x556e*/  .byte 0x00
/*0x556f*/  .byte 0x00


            .thumb_func
            call_5570:
/*0x5570*/      push {r0, r1, r4, r5, r6, lr}
/*0x5572*/      cmp.w r0, #0x200
/*0x5576*/      bhs jump_55d4
/*0x5578*/      ldrh.w r4, [sp, #4]
/*0x557c*/      cmp.w r4, #0x400
/*0x5580*/      bhs jump_55d4
/*0x5582*/      lsrs r1, r0, #8
/*0x5584*/      ldr r2, [pc, #0x70] /* data_55f8 */
/*0x5586*/      uxtb r0, r0
/*0x5588*/      rsb r1, r1, r1, lsl #3
/*0x558c*/      ldrb r0, [r2, r0]
/*0x558e*/      lsls r1, r1, #2
/*0x5590*/      cmp r0, #0xff
/*0x5592*/      beq jump_55d4
/*0x5594*/      add.w r2, r0, r1, lsl #2
/*0x5598*/      add.w r1, r1, r0, lsr #2
/*0x559c*/      adds r1, #0xe0
/*0x559e*/      uxth r3, r1
/*0x55a0*/      lsls r0, r0, #0x1e
/*0x55a2*/      lsrs r1, r0, #0x1d
/*0x55a4*/      movs r6, #3
/*0x55a6*/      ldr r5, [pc, #0x54] /* data_55fc */
/*0x55a8*/      uxth r2, r2
/*0x55aa*/      cmp r4, #3
/*0x55ac*/      beq jump_55d8
/*0x55ae*/      ldrb.w r0, [sp, #4]
/*0x55b2*/      add r2, r5
/*0x55b4*/      cmp r0, #0xff
/*0x55b6*/      strb.w r0, [r2, #0x5a]
/*0x55ba*/      beq jump_55d0
/*0x55bc*/      adds r0, r5, r3
/*0x55be*/      lsls r6, r1
/*0x55c0*/      ldrb r2, [r0, #0x5a]!
/*0x55c4*/      ldrb.w r3, [sp, #5]
/*0x55c8*/      bics r2, r6
/*0x55ca*/      lsls r3, r1
/*0x55cc*/      orrs r2, r3
/*0x55ce*/      strb r2, [r0]
            jump_55d0:
/*0x55d0*/      movs r0, #0
/*0x55d2*/      pop {r2, r3, r4, r5, r6, pc}
            jump_55d4:
/*0x55d4*/      movs r0, #3
            jump_55d6:
/*0x55d6*/      pop {r2, r3, r4, r5, r6, pc}
            jump_55d8:
/*0x55d8*/      adds r0, r5, r2
/*0x55da*/      ldrb.w r0, [r0, #0x5a]
/*0x55de*/      cmp r0, #0xff
/*0x55e0*/      beq jump_55d6
/*0x55e2*/      adds r2, r5, r3
/*0x55e4*/      lsls r6, r1
/*0x55e6*/      ldrb.w r2, [r2, #0x5a]
/*0x55ea*/      rsb.w r1, r1, #8
/*0x55ee*/      ands r2, r6
/*0x55f0*/      lsls r2, r1
/*0x55f2*/      add r0, r2
/*0x55f4*/      uxth r0, r0
/*0x55f6*/      pop {r2, r3, r4, r5, r6, pc}

            data_55f8:
/*0x55f8*/  .word 0x200000f0
            data_55fc:
/*0x55fc*/  .word 0x20000620


            .thumb_func
            call_5600:
/*0x5600*/      push {r4, r5, r6, r7, lr}
/*0x5602*/      ldr r0, [pc, #0x54] /* data_5658 */
/*0x5604*/      ldrb r1, [r0, #2]
/*0x5606*/      ldr r0, [pc, #0x54] /* data_565c */
/*0x5608*/      cbz r1, jump_5610
/*0x560a*/      ldrb r1, [r0, #0xa]
/*0x560c*/      cmp r1, #0
/*0x560e*/      bne jump_5650
            jump_5610:
/*0x5610*/      ldrb r2, [r0, #8]
/*0x5612*/      ldr r0, [pc, #0x4c] /* data_5660 */
/*0x5614*/      movs r7, #0xe8
/*0x5616*/      ldr r3, [pc, #0x4c] /* data_5664 */
/*0x5618*/      ldrb r1, [r0, #0x58]!
/*0x561c*/      movs r5, #0xcf
/*0x561e*/      ldrb r0, [r0, #1]
/*0x5620*/      cbz r2, jump_5652
/*0x5622*/      ldr r4, [pc, #0x44] /* data_5668 */
/*0x5624*/      movs r6, #0x50
/*0x5626*/      ldrb.w r2, [r4, #0xe7]
/*0x562a*/      cmp r1, r2
/*0x562c*/      strb r6, [r3, r2]
/*0x562e*/      beq jump_5632
/*0x5630*/      strb r7, [r3, r1]
            jump_5632:
/*0x5632*/      ldrb.w r1, [r4, #0x65]
/*0x5636*/      movs r2, #0x51
/*0x5638*/      cmp r0, r1
/*0x563a*/      strb r2, [r3, r1]
/*0x563c*/      beq jump_5640
/*0x563e*/      strb r5, [r3, r0]
            jump_5640:
/*0x5640*/      ldrb.w r1, [r4, #0xe5]
/*0x5644*/      movs r0, #0x52
/*0x5646*/      strb r0, [r3, r1]
/*0x5648*/      ldrb.w r1, [r4, #0xe4]
/*0x564c*/      movs r0, #0x4f
/*0x564e*/      strb r0, [r3, r1]
            jump_5650:
/*0x5650*/      pop {r4, r5, r6, r7, pc}
            jump_5652:
/*0x5652*/      strb r7, [r3, r1]
/*0x5654*/      strb r5, [r3, r0]
/*0x5656*/      pop {r4, r5, r6, r7, pc}

            data_5658:
/*0x5658*/  .word 0x2000005c
            data_565c:
/*0x565c*/  .word 0x20000580
            data_5660:
/*0x5660*/  .word 0x20000620
            data_5664:
/*0x5664*/  .word 0x200001f9
            data_5668:
/*0x5668*/  .word 0x200000f0


            .thumb_func
            call_566c:
/*0x566c*/      ldr r3, [pc, #0x84] /* data_56f4 */
/*0x566e*/      push {r4, lr}
/*0x5670*/      ldrb r0, [r3, #3]
/*0x5672*/      ldr r1, [pc, #0x84] /* data_56f8 */
/*0x5674*/      ldrb r0, [r1, r0]
/*0x5676*/      add.w r0, r0, r0, lsl #2
/*0x567a*/      adds r1, r0, r3
/*0x567c*/      ldr r0, [pc, #0x7c] /* data_56fc */
/*0x567e*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x5680*/      str r1, [r0]
/*0x5682*/      ldrb r2, [r1]
/*0x5684*/      cbnz r2, jump_569a
/*0x5686*/      ldrb r2, [r1, #1]
/*0x5688*/      cbnz r2, jump_569a
/*0x568a*/      ldrb r2, [r1, #2]
/*0x568c*/      cbnz r2, jump_569a
/*0x568e*/      movs r2, #0xff
/*0x5690*/      strb r2, [r1]
/*0x5692*/      ldr r1, [r0]
/*0x5694*/      strb r2, [r1, #1]
/*0x5696*/      ldr r1, [r0]
/*0x5698*/      strb r2, [r1, #2]
            jump_569a:
/*0x569a*/      ldrb r2, [r3, #3]
/*0x569c*/      mov.w r1, #0x150
/*0x56a0*/      cmp r2, #3
/*0x56a2*/      bhi jump_56be
/*0x56a4*/      movs r3, #0
/*0x56a6*/      cmp r2, #1
/*0x56a8*/      beq jump_56b4
/*0x56aa*/      cmp r2, #2
/*0x56ac*/      beq jump_56b8
/*0x56ae*/      cmp r2, #3
/*0x56b0*/      bne jump_56ec
/*0x56b2*/      b jump_56d4
            jump_56b4:
/*0x56b4*/      str r3, [r0, #4]
/*0x56b6*/      b jump_56ec
            jump_56b8:
/*0x56b8*/      strb r3, [r0, #4]
/*0x56ba*/      strb r3, [r0, #5]
/*0x56bc*/      b jump_56ec
            jump_56be:
/*0x56be*/      cmp r2, #7
/*0x56c0*/      bls jump_56ec
/*0x56c2*/      bic r2, r2, #1
/*0x56c6*/      cmp r2, #8
/*0x56c8*/      beq jump_56d4
/*0x56ca*/      cmp r2, #0xa
/*0x56cc*/      beq jump_56dc
/*0x56ce*/      cmp r2, #0xc
/*0x56d0*/      bne jump_56ec
/*0x56d2*/      b jump_56e0
            jump_56d4:
/*0x56d4*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x56d6*/      bl mem_zero /* (dest, size) */
/*0x56da*/      b jump_56ec
            jump_56dc:
/*0x56dc*/      movs r1, #0x6d
/*0x56de*/      b jump_56d4
            jump_56e0:
/*0x56e0*/      movs r1, #0x29
/*0x56e2*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x56e4*/      bl mem_zero /* (dest, size) */
/*0x56e8*/      bl call_76f8
            jump_56ec:
/*0x56ec*/      ldr r1, [pc, #0x10] /* data_5700 */
/*0x56ee*/      movs r0, #1
/*0x56f0*/      strb r0, [r1]
/*0x56f2*/      pop {r4, pc}

            data_56f4:
/*0x56f4*/  .word 0x20000620
            data_56f8:
/*0x56f8*/  .word 0x00008b81 /* possible pointer */
            data_56fc:
/*0x56fc*/  .word 0x20001908
            data_5700:
/*0x5700*/  .word 0x20000580


            .thumb_func
            call_5704:
/*0x5704*/      ldr r0, [pc, #0x20] /* data_5728 */
/*0x5706*/      ldrb r0, [r0, #3]
/*0x5708*/      cmp r0, #8
/*0x570a*/      beq jump_5722
/*0x570c*/      bgt jump_5716
/*0x570e*/      cbz r0, jump_5722
/*0x5710*/      cmp r0, #1
/*0x5712*/      bne jump_571e
/*0x5714*/      b jump_5722
            jump_5716:
/*0x5716*/      cmp r0, #0xa
/*0x5718*/      beq jump_5722
/*0x571a*/      cmp r0, #0xc
/*0x571c*/      beq jump_5722
            jump_571e:
/*0x571e*/      movs r0, #0
/*0x5720*/      bx lr
            jump_5722:
/*0x5722*/      movs r0, #1
/*0x5724*/      bx lr

/*0x5726*/  .byte 0x00
/*0x5727*/  .byte 0x00

            data_5728:
/*0x5728*/  .word 0x20000620


            .thumb_func
            call_572c:
/*0x572c*/      push {r4, lr}
/*0x572e*/      ldr r3, [pc, #0x130] /* data_5860 */
/*0x5730*/      mov r4, r0
/*0x5732*/      uxtb r1, r0
/*0x5734*/      ldrb r0, [r3, #3]
/*0x5736*/      ldr r2, [pc, #0x12c] /* data_5864 */
/*0x5738*/      cmp r1, #0x20
/*0x573a*/      beq jump_57a2
/*0x573c*/      bgt jump_5758
/*0x573e*/      cmp r1, #0x1b
/*0x5740*/      beq jump_5782
/*0x5742*/      bgt jump_574e
/*0x5744*/      cmp r1, #6
/*0x5746*/      beq jump_5782
/*0x5748*/      cmp r1, #0x19
/*0x574a*/      bne jump_57c0
/*0x574c*/      b jump_5782
            jump_574e:
/*0x574e*/      cmp r1, #0x1e
/*0x5750*/      beq jump_57a2
/*0x5752*/      cmp r1, #0x1f
/*0x5754*/      bne jump_57c0
/*0x5756*/      b jump_57a2
            jump_5758:
/*0x5758*/      cmp r1, #0x29
/*0x575a*/      beq jump_57a2
/*0x575c*/      bgt jump_577a
/*0x575e*/      ldr r0, [pc, #0x100] /* data_5860 */
/*0x5760*/      cmp r1, #0x21
/*0x5762*/      ldrb r0, [r0, #3]
/*0x5764*/      add.w r0, r0, #1
/*0x5768*/      uxtb r2, r0
/*0x576a*/      beq jump_57d6
/*0x576c*/      cmp r1, #0x22
/*0x576e*/      bne jump_57c0
/*0x5770*/      strb r2, [r3, #3]
/*0x5772*/      cmp r2, #3
/*0x5774*/      bls jump_57e2
/*0x5776*/      movs r0, #0
/*0x5778*/      b jump_57e0
            jump_577a:
/*0x577a*/      cmp r1, #0x36
/*0x577c*/      beq jump_5782
/*0x577e*/      cmp r1, #0x37
/*0x5780*/      bne jump_57c0
            jump_5782:
/*0x5782*/      ldr r2, [pc, #0xe4] /* data_5868 */
/*0x5784*/      ldrb r0, [r2, r0]
/*0x5786*/      cmp r0, #0xff
/*0x5788*/      beq jump_5854
/*0x578a*/      ldr r0, [pc, #0xd8] /* data_5864 */
/*0x578c*/      cmp r1, #0x1b
/*0x578e*/      ldr r0, [r0]
/*0x5790*/      beq jump_5820
/*0x5792*/      bgt jump_57f2
/*0x5794*/      mov.w r2, #6
/*0x5798*/      cmp r1, #6
/*0x579a*/      beq jump_57fc
/*0x579c*/      cmp r1, #0x19
/*0x579e*/      bne jump_5854
/*0x57a0*/      b jump_580c
            jump_57a2:
/*0x57a2*/      bl call_5704
/*0x57a6*/      cmp r0, #0
/*0x57a8*/      beq jump_57c0
/*0x57aa*/      cmp r1, #0x1e
/*0x57ac*/      beq jump_57c2
/*0x57ae*/      cmp r1, #0x1f
/*0x57b0*/      beq jump_57c2
/*0x57b2*/      cmp r1, #0x20
/*0x57b4*/      beq jump_57c2
/*0x57b6*/      cmp r1, #0x29
/*0x57b8*/      bne jump_57c0
/*0x57ba*/      ldr r1, [pc, #0xb0] /* data_586c */
/*0x57bc*/      movs r0, #1
/*0x57be*/      strb r0, [r1, #2]
            jump_57c0:
/*0x57c0*/      pop {r4, pc}
            jump_57c2:
/*0x57c2*/      subs r1, #0x1e
/*0x57c4*/      ldr r0, [r2]
/*0x57c6*/      uxtb r1, r1
/*0x57c8*/      adds r4, r0, r1
/*0x57ca*/      movs r2, #1
/*0x57cc*/      ldrb r0, [r4]
/*0x57ce*/      bl call_5558
/*0x57d2*/      strb r0, [r4]
/*0x57d4*/      b jump_5854
            jump_57d6:
/*0x57d6*/      strb r2, [r3, #3]
/*0x57d8*/      .short 0x1fd2 /* subs r2, r2, #7 */ 
/*0x57da*/      cmp r2, #7
/*0x57dc*/      blo jump_57e2
/*0x57de*/      movs r0, #7
            jump_57e0:
/*0x57e0*/      strb r0, [r3, #3]
            jump_57e2:
/*0x57e2*/      bl call_566c
/*0x57e6*/      bl call_590c
/*0x57ea*/      mov r0, r4
/*0x57ec*/      bl call_5870
/*0x57f0*/      b jump_5854
            jump_57f2:
/*0x57f2*/      cmp r1, #0x36
/*0x57f4*/      beq jump_582e
/*0x57f6*/      cmp r1, #0x37
/*0x57f8*/      bne jump_5854
/*0x57fa*/      b jump_5846
            jump_57fc:
/*0x57fc*/      ldrb r1, [r0, #3]
/*0x57fe*/      cmp r1, #8
/*0x5800*/      bhs jump_5854
/*0x5802*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x5804*/      b jump_5814
            jump_5806:
/*0x5806*/      bl call_76f8
/*0x580a*/      b jump_5854
            jump_580c:
/*0x580c*/      ldrb r1, [r0, #3]
/*0x580e*/      cmp r1, #1
/*0x5810*/      bls jump_5854
/*0x5812*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_5814:
/*0x5814*/      strb r1, [r0, #3]
/*0x5816*/      ldrb r0, [r3, #3]
/*0x5818*/      cmp.w r2, r0, lsr #1
/*0x581c*/      beq jump_5806
/*0x581e*/      b jump_5854
            jump_5820:
/*0x5820*/      ldrb r0, [r3, #2]
/*0x5822*/      mvn.w r1, r0, lsr #2
/*0x5826*/      bfi r0, r1, #2, #1
/*0x582a*/      strb r0, [r3, #2]
/*0x582c*/      b jump_5854
            jump_582e:
/*0x582e*/      ldrb r1, [r0, #4]
/*0x5830*/      and r2, r1, #0xf
/*0x5834*/      cmp r2, #5
/*0x5836*/      bhs jump_5854
/*0x5838*/      mov.w r2, #0x10000000
/*0x583c*/      add.w r1, r2, r1, ror #4
/*0x5840*/      ror.w r1, r1, #0x1c
/*0x5844*/      b jump_5852
            jump_5846:
/*0x5846*/      ldrb r1, [r0, #4]
/*0x5848*/      lsls r2, r1, #0x1c
/*0x584a*/      beq jump_5854
/*0x584c*/      subs r2, r1, #1
/*0x584e*/      bfi r1, r2, #0, #4
            jump_5852:
/*0x5852*/      strb r1, [r0, #4]
            jump_5854:
/*0x5854*/      bl call_591c
/*0x5858*/      pop.w {r4, lr}
/*0x585c*/      b.w call_40d4

            data_5860:
/*0x5860*/  .word 0x20000620
            data_5864:
/*0x5864*/  .word 0x20001908
            data_5868:
/*0x5868*/  .word 0x00008b81 /* possible pointer */
            data_586c:
/*0x586c*/  .word 0x20000580


            .thumb_func
            call_5870:
/*0x5870*/      push {r4, r5, r6, lr}
/*0x5872*/      lsrs r1, r0, #0x18
/*0x5874*/      lsls r1, r1, #0x1e
/*0x5876*/      bpl jump_58c2
/*0x5878*/      ldr r1, [pc, #0x84] /* data_5900 */
/*0x587a*/      ldrb r1, [r1, #3]
/*0x587c*/      cmp r1, #7
/*0x587e*/      bls jump_58c2
/*0x5880*/      ldr r5, [pc, #0x80] /* data_5904 */
/*0x5882*/      and r2, r1, #1
/*0x5886*/      bic r3, r1, #1
/*0x588a*/      ldr r1, [r5]
/*0x588c*/      ubfx r0, r0, #0x10, #8
/*0x5890*/      cmp r3, #8
/*0x5892*/      beq jump_58c4
/*0x5894*/      cmp r3, #0xa
/*0x5896*/      beq jump_58d8
/*0x5898*/      cmp r3, #0xc
/*0x589a*/      bne jump_58c2
/*0x589c*/      ldr r3, [pc, #0x68] /* data_5908 */
/*0x589e*/      ldrb r4, [r3, r0]
/*0x58a0*/      cmp r4, #0xff
/*0x58a2*/      beq jump_58c2
/*0x58a4*/      and r0, r4, #7
/*0x58a8*/      add.w r0, r0, r0, lsl #2
/*0x58ac*/      add r5, r0
/*0x58ae*/      adds r5, #0xe
/*0x58b0*/      cbz r2, jump_58b4
/*0x58b2*/      movs r1, #0
            jump_58b4:
/*0x58b4*/      mov r0, r5
/*0x58b6*/      bl call_78fc
/*0x58ba*/      lsrs r0, r4, #3
/*0x58bc*/      strb r0, [r5, #3]
/*0x58be*/      movs r0, #1
/*0x58c0*/      strb r0, [r5, #4]
            jump_58c2:
/*0x58c2*/      pop {r4, r5, r6, pc}
            jump_58c4:
/*0x58c4*/      cbz r2, jump_58c8
/*0x58c6*/      movs r1, #0
            jump_58c8:
/*0x58c8*/      add.w r0, r0, r0, lsl #1
/*0x58cc*/      add r0, r5
/*0x58ce*/      pop.w {r4, r5, r6, lr}
/*0x58d2*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x58d4*/      b.w call_78fc
            jump_58d8:
/*0x58d8*/      ldr r3, [pc, #0x2c] /* data_5908 */
/*0x58da*/      subs r3, #0x70
/*0x58dc*/      ldrb r0, [r3, r0]
/*0x58de*/      cmp r0, #0xff
/*0x58e0*/      beq jump_58c2
/*0x58e2*/      cbz r2, jump_58e6
/*0x58e4*/      movs r1, #0
            jump_58e6:
/*0x58e6*/      add.w r0, r0, r0, lsl #1
/*0x58ea*/      add.w r4, r5, r0, lsl #1
/*0x58ee*/      adds r0, r4, #4
/*0x58f0*/      bl call_78fc
/*0x58f4*/      ldrh r0, [r4, #4]
/*0x58f6*/      strh.w r0, [r4, #7]
/*0x58fa*/      ldrb r0, [r4, #6]
/*0x58fc*/      strb r0, [r4, #9]
/*0x58fe*/      pop {r4, r5, r6, pc}

            data_5900:
/*0x5900*/  .word 0x20000620
            data_5904:
/*0x5904*/  .word 0x20001908
            data_5908:
/*0x5908*/  .word 0x00008c99 /* possible pointer */


            .thumb_func
            call_590c:
/*0x590c*/      mov.w r1, #0x150
/*0x5910*/      ldr r0, [pc, #4] /* data_5918 */
/*0x5912*/      b.w mem_zero /* (dest, size) */

/*0x5916*/  .byte 0x00
/*0x5917*/  .byte 0x00

            data_5918:
/*0x5918*/  .word 0x20000278


            .thumb_func
            call_591c:
/*0x591c*/      push {r4, lr}
/*0x591e*/      bl call_47c8
/*0x5922*/      cmp r0, #6
/*0x5924*/      bhs switch_594e
/*0x5926*/      tbb [pc, r0]

/*0x592a*/  .byte 0x03 /* case switch_5930 */
/*0x592b*/  .byte 0x06 /* case switch_5936 */
/*0x592c*/  .byte 0x09 /* case switch_593c */
/*0x592d*/  .byte 0x0c /* case switch_5942 */
/*0x592e*/  .byte 0x12 /* case switch_594e */
/*0x592f*/  .byte 0x0f /* case switch_5948 */

            switch_5930:
/*0x5930*/      bl call_3ec0
/*0x5934*/      b jump_5952
            switch_5936:
/*0x5936*/      bl call_3cfc
/*0x593a*/      b jump_5974
            switch_593c:
/*0x593c*/      bl call_3c04
/*0x5940*/      b jump_5952
            switch_5942:
/*0x5942*/      bl call_3b94
/*0x5946*/      b jump_5952
            switch_5948:
/*0x5948*/      bl call_3da4
/*0x594c*/      b jump_5952
            switch_594e:
/*0x594e*/      cmp r0, #1
/*0x5950*/      beq jump_5974
            jump_5952:
/*0x5952*/      ldr r0, [pc, #0x28] /* data_597c */
/*0x5954*/      ldrb.w r0, [r0, #0x2d4]
/*0x5958*/      cmp r0, #1
/*0x595a*/      beq jump_5964
/*0x595c*/      cmp r0, #2
/*0x595e*/      beq jump_596a
/*0x5960*/      ldr r1, [pc, #0x1c] /* data_5980 */
/*0x5962*/      b jump_596e
            jump_5964:
/*0x5964*/      ldr r1, [pc, #0x18] /* data_5980 */
/*0x5966*/      subs r1, #9
/*0x5968*/      b jump_596e
            jump_596a:
/*0x596a*/      ldr r1, [pc, #0x14] /* data_5980 */
/*0x596c*/      .short 0x1ec9 /* subs r1, r1, #3 */ 
            jump_596e:
/*0x596e*/      movs r0, #0x25
/*0x5970*/      bl call_4210
            jump_5974:
/*0x5974*/      pop.w {r4, lr}
/*0x5978*/      b.w jump_5984

            data_597c:
/*0x597c*/  .word 0x20000620
            data_5980:
/*0x5980*/  .word 0x00008b7e /* possible pointer */

            jump_5984:
/*0x5984*/      push {r4, r5, r6, lr}
/*0x5986*/      ldr r4, [pc, #0x38] /* data_59c0 */
/*0x5988*/      ldrb r0, [r4, #0xb]
/*0x598a*/      cbnz r0, jump_59ba
/*0x598c*/      ldrb r0, [r4, #0xa]
/*0x598e*/      cbnz r0, jump_59ba
/*0x5990*/      ldr r0, [pc, #0x30] /* data_59c4 */
/*0x5992*/      ldrb r0, [r0, #6]
/*0x5994*/      cmp r0, #1
/*0x5996*/      beq jump_59ba
/*0x5998*/      ldr r5, [pc, #0x2c] /* data_59c8 */
/*0x599a*/      ldrb r0, [r5]
/*0x599c*/      lsls r0, r0, #0x1f
/*0x599e*/      beq jump_59a4
/*0x59a0*/      movs r1, #0xff
/*0x59a2*/      b jump_59a6
            jump_59a4:
/*0x59a4*/      movs r1, #0
            jump_59a6:
/*0x59a6*/      movs r0, #0x54
/*0x59a8*/      bl call_4254
/*0x59ac*/      ldrb r0, [r5]
/*0x59ae*/      lsls r0, r0, #0x1e
/*0x59b0*/      asrs r0, r0, #8
/*0x59b2*/      lsrs r1, r0, #0x18
/*0x59b4*/      movs r0, #0x38
/*0x59b6*/      bl call_4254
            jump_59ba:
/*0x59ba*/      movs r0, #1
/*0x59bc*/      strb r0, [r4, #1]
/*0x59be*/      pop {r4, r5, r6, pc}

            data_59c0:
/*0x59c0*/  .word 0x20000580
            data_59c4:
/*0x59c4*/  .word 0x200018fc
            data_59c8:
/*0x59c8*/  .word 0x20000064


            .thumb_func
            call_59cc:
/*0x59cc*/      movs r1, #0x18
/*0x59ce*/      ldr r3, [pc, #0x2c] /* data_59fc */
/*0x59d0*/      b jump_59de
            jump_59d2:
/*0x59d2*/      add.w r2, r3, r1, lsl #1
/*0x59d6*/      ldrb.w r2, [r2, #0x28]
/*0x59da*/      cmp r2, r0
/*0x59dc*/      beq jump_59f2
            jump_59de:
/*0x59de*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x59e0*/      uxtb r1, r1
/*0x59e2*/      bhs jump_59d2
/*0x59e4*/      ldr r1, [pc, #0x18] /* data_5a00 */
/*0x59e6*/      ldrb r1, [r1, r0]
/*0x59e8*/      ldr r0, [pc, #0x10] /* data_59fc */
/*0x59ea*/      adds r0, #0x5a
/*0x59ec*/      ldrb r0, [r1, r0]
/*0x59ee*/      cmp r0, #0xff
/*0x59f0*/      beq jump_59f6
            jump_59f2:
/*0x59f2*/      movs r0, #1
/*0x59f4*/      bx lr
            jump_59f6:
/*0x59f6*/      movs r0, #0
/*0x59f8*/      bx lr

/*0x59fa*/  .byte 0x00
/*0x59fb*/  .byte 0x00

            data_59fc:
/*0x59fc*/  .word 0x20000620
            data_5a00:
/*0x5a00*/  .word 0x200000f0


            .thumb_func
            call_5a04:
/*0x5a04*/      push {r4, lr}
/*0x5a06*/      ldr r4, [pc, #0x84] /* data_5a8c */
/*0x5a08*/      cbz r0, jump_5a4a
/*0x5a0a*/      movs r1, #0
/*0x5a0c*/      mov r0, r4
/*0x5a0e*/      bl call_37e2
/*0x5a12*/      movs r1, #0
/*0x5a14*/      mov r0, r4
/*0x5a16*/      bl call_37ce
/*0x5a1a*/      mov r0, r4
/*0x5a1c*/      bl call_37c0
/*0x5a20*/      movs r0, #0x29
/*0x5a22*/      bl call_5c50
/*0x5a26*/      bl call_4848
/*0x5a2a*/      bl call_623c
/*0x5a2e*/      bl call_5ce8
/*0x5a32*/      movs r0, #1
/*0x5a34*/      bl call_67d8
/*0x5a38*/      bl call_698c
/*0x5a3c*/      bl call_54b0
/*0x5a40*/      pop.w {r4, lr}
/*0x5a44*/      movs r0, #1
/*0x5a46*/      b.w call_6dec
            jump_5a4a:
/*0x5a4a*/      bl call_4898
/*0x5a4e*/      bl call_5cec
/*0x5a52*/      movs r0, #0
/*0x5a54*/      bl call_67d8
/*0x5a58*/      bl call_54d0
/*0x5a5c*/      movs r0, #0
/*0x5a5e*/      bl call_6dec
/*0x5a62*/      movs r1, #0
/*0x5a64*/      mov r0, r4
/*0x5a66*/      bl call_37fa
/*0x5a6a*/      mov r0, r4
/*0x5a6c*/      bl call_37c0
/*0x5a70*/      movs r1, #1
/*0x5a72*/      mov r0, r4
/*0x5a74*/      bl call_37ce
/*0x5a78*/      movs r1, #1
/*0x5a7a*/      mov r0, r4
/*0x5a7c*/      bl call_37e2
/*0x5a80*/      ldr r1, [pc, #0xc] /* data_5a90 */
/*0x5a82*/      mov.w r0, #0x200
/*0x5a86*/      str.w r0, [r1, #0x100]
/*0x5a8a*/      pop {r4, pc}

            data_5a8c:
/*0x5a8c*/  .word 0x40076000
            data_5a90:
/*0x5a90*/  .word 0xe000e004


            .thumb_func
            call_5a94:
/*0x5a94*/      push {r4, lr}
/*0x5a96*/      mov r4, r0
/*0x5a98*/      cmp r0, #2
/*0x5a9a*/      beq jump_5aa4
/*0x5a9c*/      movs r1, #0xd
/*0x5a9e*/      ldr r0, [pc, #0x24] /* data_5ac4 */
/*0x5aa0*/      bl mem_zero /* (dest, size) */
            jump_5aa4:
/*0x5aa4*/      cbz r4, jump_5abe
/*0x5aa6*/      movs r0, #2
            jump_5aa8:
/*0x5aa8*/      bl call_4d34
/*0x5aac*/      ldr r1, [pc, #0x14] /* data_5ac4 */
/*0x5aae*/      movs r0, #0
/*0x5ab0*/      strb r0, [r1, #4]
/*0x5ab2*/      bl call_566c
/*0x5ab6*/      pop.w {r4, lr}
/*0x5aba*/      b.w call_5ff8
            jump_5abe:
/*0x5abe*/      movs r0, #1
/*0x5ac0*/      b jump_5aa8

/*0x5ac2*/  .byte 0x00
/*0x5ac3*/  .byte 0x00

            data_5ac4:
/*0x5ac4*/  .word 0x20000580


            .thumb_func
            call_5ac8:
/*0x5ac8*/      push {r4, lr}
/*0x5aca*/      movs r0, #0
/*0x5acc*/      mov.w r2, #0x10000
/*0x5ad0*/      movs r3, #1
/*0x5ad2*/      mov r1, r0
/*0x5ad4*/      bl call_39a8
/*0x5ad8*/      pop.w {r4, lr}
/*0x5adc*/      movw r1, #0x8c9f
/*0x5ae0*/      ldr r0, [pc, #4] /* data_5ae8 */
/*0x5ae2*/      b.w call_37f6

/*0x5ae6*/  .byte 0x00
/*0x5ae7*/  .byte 0x00

            data_5ae8:
/*0x5ae8*/  .word 0x40076000


            .thumb_func
            call_5aec:
/*0x5aec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5af0*/      ldr r0, [pc, #0xbc] /* data_5bb0 */
/*0x5af2*/      movs r7, #0xff
/*0x5af4*/      ldr r4, [pc, #0xbc] /* data_5bb4 */
/*0x5af6*/      ldrb r2, [r0, #7]
/*0x5af8*/      ldrh r0, [r0, #4]
/*0x5afa*/      ldr r6, [pc, #0xbc] /* data_5bb8 */
/*0x5afc*/      mov.w r1, #0x150
/*0x5b00*/      cmp r2, #6
/*0x5b02*/      bhs switch_5b82
/*0x5b04*/      tbb [pc, r2]

/*0x5b08*/  .byte 0x3d /* case switch_5b82 */
/*0x5b09*/  .byte 0x03 /* case switch_5b0e */
/*0x5b0a*/  .byte 0x03 /* case switch_5b0e */
/*0x5b0b*/  .byte 0x3d /* case switch_5b82 */
/*0x5b0c*/  .byte 0x3f /* case switch_5b86 */
/*0x5b0d*/  .byte 0x46 /* case switch_5b94 */

            switch_5b0e:
/*0x5b0e*/      ldr r0, [pc, #0xa4] /* data_5bb4 */
/*0x5b10*/      movs r1, #0x70
/*0x5b12*/      subs r0, #0xe0
/*0x5b14*/      bl mem_zero /* (dest, size) */
/*0x5b18*/      ldr r0, [pc, #0x98] /* data_5bb4 */
/*0x5b1a*/      movs r2, #0xff
/*0x5b1c*/      subs r0, #0x70
/*0x5b1e*/      movs r1, #0x70
/*0x5b20*/      mov r5, r0
/*0x5b22*/      bl mem_set /* (dest, size, val) */
/*0x5b26*/      movs r1, #0x70
/*0x5b28*/      mov r0, r4
/*0x5b2a*/      bl mem_zero /* (dest, size) */
/*0x5b2e*/      ldr r2, [pc, #0x84] /* data_5bb4 */
/*0x5b30*/      movs r0, #0x18
/*0x5b32*/      movs r3, #0
/*0x5b34*/      ldr.w ip, [pc, #0x84] /* data_5bbc */
/*0x5b38*/      subs r2, #0xe0
/*0x5b3a*/      b jump_5b62
            jump_5b3c:
/*0x5b3c*/      add.w r1, ip, r0, lsl #1
/*0x5b40*/      ldrh r1, [r1, #0x28]
/*0x5b42*/      ubfx lr, r1, #0, #0xa
/*0x5b46*/      and r1, lr, #0xff
/*0x5b4a*/      cmp r1, #0xff
/*0x5b4c*/      beq jump_5b62
/*0x5b4e*/      cmp.w lr, #0xff
/*0x5b52*/      bhs jump_5b5a
/*0x5b54*/      ldrb r1, [r6, r1]
/*0x5b56*/      strb r7, [r2, r1]
/*0x5b58*/      b jump_5b60
            jump_5b5a:
/*0x5b5a*/      bls jump_5b62
/*0x5b5c*/      ldrb r1, [r6, r1]
/*0x5b5e*/      strb r7, [r1, r4]
            jump_5b60:
/*0x5b60*/      strb r3, [r1, r5]
            jump_5b62:
/*0x5b62*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5b64*/      uxtb r0, r0
/*0x5b66*/      bhs jump_5b3c
/*0x5b68*/      ldr r5, [pc, #0x54] /* data_5bc0 */
/*0x5b6a*/      movs r4, #0
            jump_5b6c:
/*0x5b6c*/      movs r3, #0
/*0x5b6e*/      ldrb r0, [r5, r4]
/*0x5b70*/      mov r2, r3
/*0x5b72*/      mov r1, r3
/*0x5b74*/      ldrb r0, [r6, r0]
/*0x5b76*/      bl call_6c94
/*0x5b7a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x5b7c*/      uxtb r4, r4
/*0x5b7e*/      cmp r4, #6
/*0x5b80*/      bls jump_5b6c
            switch_5b82:
/*0x5b82*/      pop.w {r4, r5, r6, r7, r8, pc}
            switch_5b86:
/*0x5b86*/      uxtb r5, r0
/*0x5b88*/      ldr r0, [pc, #0x28] /* data_5bb4 */
/*0x5b8a*/      subs r0, #0xe0
/*0x5b8c*/      bl mem_zero /* (dest, size) */
/*0x5b90*/      ldrb r0, [r6, r5]
/*0x5b92*/      b jump_5ba0
            switch_5b94:
/*0x5b94*/      ldr r2, [pc, #0x2c] /* data_5bc4 */
/*0x5b96*/      ldrh r2, [r2, #2]
/*0x5b98*/      lsls r2, r2, #0x15
/*0x5b9a*/      bpl jump_5ba4
/*0x5b9c*/      uxtb r0, r0
/*0x5b9e*/      ldrb r0, [r6, r0]
            jump_5ba0:
/*0x5ba0*/      strb r7, [r0, r4]
/*0x5ba2*/      b switch_5b82
            jump_5ba4:
/*0x5ba4*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5ba8*/      ldr r0, [pc, #8] /* data_5bb4 */
/*0x5baa*/      subs r0, #0xe0
/*0x5bac*/      b.w mem_zero /* (dest, size) */

            data_5bb0:
/*0x5bb0*/  .word 0x200018fc
            data_5bb4:
/*0x5bb4*/  .word 0x20000358
            data_5bb8:
/*0x5bb8*/  .word 0x200000f0
            data_5bbc:
/*0x5bbc*/  .word 0x20000620
            data_5bc0:
/*0x5bc0*/  .word 0x0000860b /* possible pointer */
            data_5bc4:
/*0x5bc4*/  .word 0x20000064


            .thumb_func
            setup_intr_priority:
/*0x5bc8*/      push {r4, lr}
/*0x5bca*/      mov.w r1, #0x3400
/*0x5bce*/      movs r0, #0
/*0x5bd0*/      bl call_5cb8
/*0x5bd4*/      ldr r1, [pc, #0x70] /* data_5c48 */
/*0x5bd6*/      ldr r0, [r1]
/*0x5bd8*/      movw r2, #0xf8ff
/*0x5bdc*/      ands r0, r2
/*0x5bde*/      ldr r2, [pc, #0x6c] /* data_5c4c */
/*0x5be0*/      orr r0, r0, #0x300
/*0x5be4*/      orrs r0, r2
/*0x5be6*/      str r0, [r1]
/*0x5be8*/      movs r2, #0
/*0x5bea*/      mov r1, r2
/*0x5bec*/      movs r0, #3
/*0x5bee*/      bl call_5c66
/*0x5bf2*/      mov r1, r0
/*0x5bf4*/      movs r0, #0x2b
/*0x5bf6*/      bl call_5c98
/*0x5bfa*/      movs r2, #0
/*0x5bfc*/      mov r1, r2
/*0x5bfe*/      movs r0, #3
/*0x5c00*/      bl call_5c66
/*0x5c04*/      mov r1, r0
/*0x5c06*/      movs r0, #0x2c
/*0x5c08*/      bl call_5c98
/*0x5c0c*/      movs r2, #0
/*0x5c0e*/      movs r1, #1
/*0x5c10*/      movs r0, #3
/*0x5c12*/      bl call_5c66
/*0x5c16*/      mov r1, r0
/*0x5c18*/      movs r0, #0x2a
/*0x5c1a*/      bl call_5c98
/*0x5c1e*/      movs r2, #0
/*0x5c20*/      movs r1, #2
/*0x5c22*/      movs r0, #3
/*0x5c24*/      bl call_5c66
/*0x5c28*/      mov r1, r0
/*0x5c2a*/      movs r0, #0x29
/*0x5c2c*/      bl call_5c98
/*0x5c30*/      movs r2, #0
/*0x5c32*/      movs r1, #2
/*0x5c34*/      movs r0, #3
/*0x5c36*/      bl call_5c66
/*0x5c3a*/      mov r1, r0
/*0x5c3c*/      pop.w {r4, lr}
/*0x5c40*/      movs r0, #0x35
/*0x5c42*/      b.w call_5c98

/*0x5c46*/  .byte 0x00
/*0x5c47*/  .byte 0x00

            data_5c48:
/*0x5c48*/  .word 0xe000ed0c
            data_5c4c:
/*0x5c4c*/  .word 0x05fa0000


            .thumb_func
            call_5c50:
/*0x5c50*/      and r2, r0, #0x1f
/*0x5c54*/      movs r1, #1
/*0x5c56*/      lsls r1, r2
/*0x5c58*/      lsrs r0, r0, #5
/*0x5c5a*/      lsls r0, r0, #2
/*0x5c5c*/      add.w r0, r0, #-0x1fff2000
/*0x5c60*/      str.w r1, [r0, #0x180]
/*0x5c64*/      bx lr

            .thumb_func
            call_5c66:
/*0x5c66*/      push {r4, r5, lr}
/*0x5c68*/      and r3, r0, #7
/*0x5c6c*/      rsb.w r4, r3, #7
/*0x5c70*/      cmp r4, #4
/*0x5c72*/      bls jump_5c76
/*0x5c74*/      movs r4, #4
            jump_5c76:
/*0x5c76*/      adds r0, r3, #4
/*0x5c78*/      cmp r0, #7
/*0x5c7a*/      bhs jump_5c80
/*0x5c7c*/      movs r3, #0
/*0x5c7e*/      b jump_5c82
            jump_5c80:
/*0x5c80*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_5c82:
/*0x5c82*/      movs r5, #1
/*0x5c84*/      lsl.w r0, r5, r4
/*0x5c88*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5c8a*/      ands r0, r1
/*0x5c8c*/      lsls r0, r3
/*0x5c8e*/      lsls r5, r3
/*0x5c90*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5c92*/      ands r5, r2
/*0x5c94*/      orrs r0, r5
/*0x5c96*/      pop {r4, r5, pc}

            .thumb_func
            call_5c98:
/*0x5c98*/      lsls r1, r1, #0x1c
/*0x5c9a*/      lsrs r1, r1, #0x18
/*0x5c9c*/      cmp r0, #0
/*0x5c9e*/      bge jump_5cae
/*0x5ca0*/      and r0, r0, #0xf
/*0x5ca4*/      add.w r0, r0, #-0x1fff2000
/*0x5ca8*/      strb.w r1, [r0, #0xd14]
/*0x5cac*/      bx lr
            jump_5cae:
/*0x5cae*/      add.w r0, r0, #-0x1fff2000
/*0x5cb2*/      strb.w r1, [r0, #0x400]
/*0x5cb6*/      bx lr

            .thumb_func
            call_5cb8:
/*0x5cb8*/      ldr r2, [pc, #8] /* data_5cc4 */
/*0x5cba*/      ands r1, r2
/*0x5cbc*/      orrs r1, r0
/*0x5cbe*/      ldr r0, [pc, #8] /* data_5cc8 */
/*0x5cc0*/      str r1, [r0]
/*0x5cc2*/      bx lr

            data_5cc4:
/*0x5cc4*/  .word 0x1fffff80
            data_5cc8:
/*0x5cc8*/  .word 0xe000ed08


            .thumb_func
            call_5ccc:
/*0x5ccc*/      push {r4, lr}
/*0x5cce*/      bl call_431c
/*0x5cd2*/      bl call_4298
/*0x5cd6*/      cmp r0, #1
/*0x5cd8*/      bne jump_5ce4
/*0x5cda*/      movs r0, #2
/*0x5cdc*/      bl call_6c56
/*0x5ce0*/      cmp r0, #1
/*0x5ce2*/      beq jump_5ce6
            jump_5ce4:
/*0x5ce4*/      movs r0, #0
            jump_5ce6:
/*0x5ce6*/      pop {r4, pc}

            .thumb_func
            call_5ce8:
/*0x5ce8*/      b.w jump_4370

            .thumb_func
            call_5cec:
/*0x5cec*/      b.w call_43b8

            .thumb_func
            call_5cf0:
/*0x5cf0*/      push {r4, lr}
/*0x5cf2*/      mov r4, r0
/*0x5cf4*/      bl call_5ff8
/*0x5cf8*/      ldrh r0, [r4, #4]
/*0x5cfa*/      ubfx r1, r0, #0, #0xa
/*0x5cfe*/      ldr r0, [pc, #0x2c] /* data_5d2c */
/*0x5d00*/      strh r1, [r0, #4]
/*0x5d02*/      movs r1, #2
/*0x5d04*/      strb r1, [r0, #6]
/*0x5d06*/      ldrb r1, [r4, #5]
/*0x5d08*/      lsrs r1, r1, #5
/*0x5d0a*/      strb r1, [r0, #8]
/*0x5d0c*/      ldr r1, [pc, #0x1c] /* data_5d2c */
/*0x5d0e*/      movs r0, #0
/*0x5d10*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x5d12*/      strh r0, [r1]
/*0x5d14*/      bl call_799c
/*0x5d18*/      ldr r0, [pc, #0x14] /* data_5d30 */
/*0x5d1a*/      ldrb r2, [r4, #6]
/*0x5d1c*/      ldr r1, [r4]
/*0x5d1e*/      ldr r0, [r0]
/*0x5d20*/      bl memcpy /* (dest, src, size) */
/*0x5d24*/      pop.w {r4, lr}
/*0x5d28*/      b.w jump_7a34

            data_5d2c:
/*0x5d2c*/  .word 0x200018fc
            data_5d30:
/*0x5d30*/  .word 0x20000058


            .thumb_func
            call_5d34:
/*0x5d34*/      push {r4, r5, r6, lr}
/*0x5d36*/      ldr r4, [pc, #0xa4] /* data_5ddc */
/*0x5d38*/      movs r5, #0
/*0x5d3a*/      ldrb r0, [r4, #6]
/*0x5d3c*/      cmp r0, #1
/*0x5d3e*/      beq jump_5d72
/*0x5d40*/      cmp r0, #2
/*0x5d42*/      bne jump_5dda
/*0x5d44*/      subs r1, r4, #4
/*0x5d46*/      ldrh r0, [r1]
/*0x5d48*/      cbz r0, jump_5dc2
/*0x5d4a*/      ldr r2, [pc, #0x94] /* data_5de0 */
/*0x5d4c*/      ldr r2, [r2]
/*0x5d4e*/      cmp r2, #0
/*0x5d50*/      bne jump_5dda
/*0x5d52*/      cmp r0, #0xff
/*0x5d54*/      bhi jump_5d68
/*0x5d56*/      ldr r2, [pc, #0x8c] /* data_5de4 */
/*0x5d58*/      ldr r2, [r2]
/*0x5d5a*/      add.w r0, r2, r0, lsl #2
/*0x5d5e*/      movs r2, #7
/*0x5d60*/      ldrb r0, [r0, #1]
/*0x5d62*/      cmp.w r2, r0, lsr #5
/*0x5d66*/      bne jump_5dca
            jump_5d68:
/*0x5d68*/      ldrb r0, [r4, #8]
/*0x5d6a*/      cmp r0, #1
/*0x5d6c*/      beq jump_5dd2
/*0x5d6e*/      strh r5, [r1]
/*0x5d70*/      b jump_5dca
            jump_5d72:
/*0x5d72*/      ldr r0, [pc, #0x74] /* data_5de8 */
/*0x5d74*/      ldrb r0, [r0, #3]
/*0x5d76*/      lsls r0, r0, #0x1e
/*0x5d78*/      bmi jump_5d90
/*0x5d7a*/      ldrb r0, [r4, #7]
/*0x5d7c*/      cmp r0, #1
/*0x5d7e*/      bne jump_5d90
/*0x5d80*/      bl call_4d08
/*0x5d84*/      cmp r0, #1
/*0x5d86*/      bne jump_5d90
/*0x5d88*/      movs r0, #2
/*0x5d8a*/      strb r0, [r4, #7]
/*0x5d8c*/      ldr r0, [pc, #0x5c] /* data_5dec */
/*0x5d8e*/      strh r5, [r0]
            jump_5d90:
/*0x5d90*/      ldrb r0, [r4, #7]
/*0x5d92*/      cmp r0, #3
/*0x5d94*/      beq jump_5db2
/*0x5d96*/      cmp r0, #6
/*0x5d98*/      beq jump_5da2
/*0x5d9a*/      cmp r0, #7
/*0x5d9c*/      beq jump_5da2
/*0x5d9e*/      cmp r0, #8
/*0x5da0*/      bne jump_5dda
            jump_5da2:
/*0x5da2*/      bl call_4d08
/*0x5da6*/      cmp r0, #1
/*0x5da8*/      bne jump_5dda
/*0x5daa*/      pop.w {r4, r5, r6, lr}
/*0x5dae*/      b.w jump_5f18
            jump_5db2:
/*0x5db2*/      bl call_4d08
/*0x5db6*/      cmp r0, #1
/*0x5db8*/      bne jump_5dda
/*0x5dba*/      pop.w {r4, r5, r6, lr}
/*0x5dbe*/      b.w jump_7b60
            jump_5dc2:
/*0x5dc2*/      ldrb r0, [r1, #2]
/*0x5dc4*/      movs r1, #0
/*0x5dc6*/      bl call_3ed8
            jump_5dca:
/*0x5dca*/      pop.w {r4, r5, r6, lr}
/*0x5dce*/      b.w jump_7a34
            jump_5dd2:
/*0x5dd2*/      pop.w {r4, r5, r6, lr}
/*0x5dd6*/      b.w call_5ff8
            jump_5dda:
/*0x5dda*/      pop {r4, r5, r6, pc}

            data_5ddc:
/*0x5ddc*/  .word 0x200018fc
            data_5de0:
/*0x5de0*/  .word 0x20000060
            data_5de4:
/*0x5de4*/  .word 0x20000058
            data_5de8:
/*0x5de8*/  .word 0x20000054
            data_5dec:
/*0x5dec*/  .word 0x2000001c


            .thumb_func
            call_5df0:
/*0x5df0*/      ldr r0, [pc, #0x28] /* data_5e1c */
/*0x5df2*/      push {r4, lr}
/*0x5df4*/      ldrb r0, [r0, #6]
/*0x5df6*/      cmp r0, #1
/*0x5df8*/      beq jump_5e16
/*0x5dfa*/      ldr r0, [pc, #0x24] /* data_5e20 */
/*0x5dfc*/      ldr r0, [r0]
/*0x5dfe*/      bl call_4c72
/*0x5e02*/      movs r1, #3
/*0x5e04*/      bl call_5570
/*0x5e08*/      cmp r0, #0xff
/*0x5e0a*/      beq jump_5e16
/*0x5e0c*/      ldr r1, [pc, #0x10] /* data_5e20 */
/*0x5e0e*/      bl call_4c68
/*0x5e12*/      movs r0, #1
/*0x5e14*/      pop {r4, pc}
            jump_5e16:
/*0x5e16*/      movs r0, #0
/*0x5e18*/      pop {r4, pc}

/*0x5e1a*/  .byte 0x00
/*0x5e1b*/  .byte 0x00

            data_5e1c:
/*0x5e1c*/  .word 0x200018fc
            data_5e20:
/*0x5e20*/  .word 0x20000054


            .thumb_func
            call_5e24:
/*0x5e24*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5e28*/      ldr r4, [pc, #0xdc] /* data_5f08 */
/*0x5e2a*/      ldr r5, [pc, #0xe0] /* data_5f0c */
/*0x5e2c*/      subs r6, r4, #4
/*0x5e2e*/      ldrb r0, [r4, #6]
/*0x5e30*/      cbz r0, jump_5e3c
/*0x5e32*/      cmp r0, #1
/*0x5e34*/      beq jump_5eae
/*0x5e36*/      cmp r0, #2
/*0x5e38*/      bne jump_5ed2
/*0x5e3a*/      b jump_5e7c
            jump_5e3c:
/*0x5e3c*/      bl call_7960
/*0x5e40*/      mov r7, r0
/*0x5e42*/      cmp r0, #0x18
/*0x5e44*/      bhs jump_5ed2
/*0x5e46*/      ldrb r0, [r5, #3]
/*0x5e48*/      lsls r0, r0, #0x1e
/*0x5e4a*/      bpl jump_5efe
/*0x5e4c*/      ldrb r0, [r4, #6]
/*0x5e4e*/      cbz r0, jump_5e56
/*0x5e50*/      movs r0, #0
/*0x5e52*/      bl call_48e8
            jump_5e56:
/*0x5e56*/      ldr r0, [r5]
/*0x5e58*/      bl call_4c72
/*0x5e5c*/      strh r0, [r4, #4]
/*0x5e5e*/      movs r0, #2
/*0x5e60*/      strb r0, [r4, #6]
/*0x5e62*/      ldr r0, [pc, #0xac] /* data_5f10 */
/*0x5e64*/      add.w r0, r0, r7, lsl #1
/*0x5e68*/      ldrb.w r0, [r0, #0x29]
/*0x5e6c*/      lsrs r0, r0, #5
/*0x5e6e*/      strb r0, [r4, #8]
/*0x5e70*/      movs r0, #0
/*0x5e72*/      strh r0, [r6]
/*0x5e74*/      strb r7, [r6, #2]
/*0x5e76*/      bl call_799c
/*0x5e7a*/      b jump_5efe
            jump_5e7c:
/*0x5e7c*/      ldrb r0, [r5, #3]
/*0x5e7e*/      lsls r1, r0, #0x1e
/*0x5e80*/      ldr r0, [pc, #0x88] /* data_5f0c */
/*0x5e82*/      ldr r0, [r0]
/*0x5e84*/      bpl jump_5e9c
/*0x5e86*/      bl call_4c72
/*0x5e8a*/      ldrh r1, [r4, #4]
/*0x5e8c*/      cmp r0, r1
/*0x5e8e*/      bne jump_5e3c
/*0x5e90*/      ldrb r0, [r4, #8]
/*0x5e92*/      cmp r0, #3
/*0x5e94*/      bne jump_5e3c
            jump_5e96:
/*0x5e96*/      bl call_5ff8
/*0x5e9a*/      b jump_5efe
            jump_5e9c:
/*0x5e9c*/      bl call_4c72
/*0x5ea0*/      ldrh r1, [r4, #4]
/*0x5ea2*/      cmp r0, r1
/*0x5ea4*/      bne jump_5ed2
/*0x5ea6*/      ldrb r0, [r4, #8]
/*0x5ea8*/      cmp r0, #2
/*0x5eaa*/      beq jump_5e96
/*0x5eac*/      b jump_5efe
            jump_5eae:
/*0x5eae*/      bl call_5168
/*0x5eb2*/      cbnz r0, jump_5efa
/*0x5eb4*/      ldrb r0, [r4, #7]
/*0x5eb6*/      cmp r0, #5
/*0x5eb8*/      beq jump_5ed8
/*0x5eba*/      ldrb r1, [r5, #3]
/*0x5ebc*/      lsls r1, r1, #0x1e
/*0x5ebe*/      bpl jump_5ed2
/*0x5ec0*/      cmp r0, #1
/*0x5ec2*/      beq jump_5efe
/*0x5ec4*/      movs r7, #1
/*0x5ec6*/      cmp r0, #2
/*0x5ec8*/      beq jump_5ee0
/*0x5eca*/      cmp r0, #3
/*0x5ecc*/      beq jump_5efc
/*0x5ece*/      cmp r0, #4
/*0x5ed0*/      beq jump_5f02
            jump_5ed2:
/*0x5ed2*/      movs r0, #0
            jump_5ed4:
/*0x5ed4*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5ed8:
/*0x5ed8*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5edc*/      b.w jump_7aec
            jump_5ee0:
/*0x5ee0*/      bl call_79a8
/*0x5ee4*/      ldrb r0, [r6, #2]
/*0x5ee6*/      cmp r0, #0x18
/*0x5ee8*/      beq jump_5efc
/*0x5eea*/      ldr r0, [r5]
/*0x5eec*/      bl call_4c72
/*0x5ef0*/      strh r0, [r4, #4]
/*0x5ef2*/      movs r0, #3
/*0x5ef4*/      strb r0, [r4, #7]
/*0x5ef6*/      ldr r0, [pc, #0x1c] /* data_5f14 */
/*0x5ef8*/      strb r7, [r0]
            jump_5efa:
/*0x5efa*/      b jump_5efe
            jump_5efc:
/*0x5efc*/      strb r7, [r4, #7]
            jump_5efe:
/*0x5efe*/      movs r0, #1
/*0x5f00*/      b jump_5ed4
            jump_5f02:
/*0x5f02*/      movs r0, #5
/*0x5f04*/      strb r0, [r4, #7]
/*0x5f06*/      b jump_5ed8

            data_5f08:
/*0x5f08*/  .word 0x200018fc
            data_5f0c:
/*0x5f0c*/  .word 0x20000054
            data_5f10:
/*0x5f10*/  .word 0x20000620
            data_5f14:
/*0x5f14*/  .word 0x20000580

            jump_5f18:
/*0x5f18*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5f1c*/      ldr r5, [pc, #0xb0] /* data_5fd0 */
/*0x5f1e*/      mov.w r8, #1
/*0x5f22*/      ldrb r0, [r5, #7]
/*0x5f24*/      cmp r0, #8
/*0x5f26*/      beq jump_5fbc
/*0x5f28*/      subs r6, r5, #4
/*0x5f2a*/      ldr r1, [pc, #0xa8] /* data_5fd4 */
/*0x5f2c*/      ldrb r0, [r6, #2]
/*0x5f2e*/      ldr r7, [pc, #0xa8] /* data_5fd8 */
/*0x5f30*/      add.w r4, r1, r0, lsl #1
/*0x5f34*/      mov r0, r5
/*0x5f36*/      ldrh r1, [r6]
/*0x5f38*/      ldrh r0, [r0, #4]
/*0x5f3a*/      adds r4, #0x28
/*0x5f3c*/      cmp r1, #2
/*0x5f3e*/      bne jump_5f5e
/*0x5f40*/      ldr r2, [r7]
/*0x5f42*/      ldrh r1, [r2]
/*0x5f44*/      ldrh r2, [r2, #4]
/*0x5f46*/      ubfx r1, r1, #0, #0xa
/*0x5f4a*/      ubfx r2, r2, #0, #0xa
/*0x5f4e*/      cmp r1, r2
/*0x5f50*/      bne jump_5f5e
/*0x5f52*/      bl call_5570
/*0x5f56*/      movw r0, #0xffff
/*0x5f5a*/      strh r0, [r4]
/*0x5f5c*/      b jump_5fa2
            jump_5f5e:
/*0x5f5e*/      movs r1, #0xff
/*0x5f60*/      bl call_5570
/*0x5f64*/      ldrb r0, [r5, #8]
/*0x5f66*/      cmp r0, #1
/*0x5f68*/      beq jump_5fb4
/*0x5f6a*/      bl call_793c
            jump_5f6e:
/*0x5f6e*/      ldrh r1, [r6]
/*0x5f70*/      ldr r2, [r7]
/*0x5f72*/      add.w r1, r2, r1, lsl #2
/*0x5f76*/      mov.w r2, #0x1c00
/*0x5f7a*/      strh r0, [r1, #-0x2]
/*0x5f7e*/      ldrb r1, [r5, #8]
/*0x5f80*/      ldrh r0, [r5, #4]
/*0x5f82*/      orr.w r1, r2, r1, lsl #13
/*0x5f86*/      orrs r0, r1
/*0x5f88*/      strh r0, [r4]
/*0x5f8a*/      ldrh r0, [r6]
/*0x5f8c*/      cmp r0, #0xff
/*0x5f8e*/      bhi jump_5f9a
/*0x5f90*/      ldr r2, [r7]
/*0x5f92*/      mov.w r1, #0xfc00
/*0x5f96*/      strh.w r1, [r2, r0, lsl #2]
            jump_5f9a:
/*0x5f9a*/      ldrb r0, [r6, #2]
/*0x5f9c*/      movs r1, #1
/*0x5f9e*/      bl call_3ed8
            jump_5fa2:
/*0x5fa2*/      bl call_40d4
/*0x5fa6*/      ldrb r0, [r5, #7]
/*0x5fa8*/      cmp r0, #7
/*0x5faa*/      beq jump_5fb8
/*0x5fac*/      strb.w r8, [r5, #7]
            jump_5fb0:
/*0x5fb0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5fb4:
/*0x5fb4*/      movs r0, #0
/*0x5fb6*/      b jump_5f6e
            jump_5fb8:
/*0x5fb8*/      movs r0, #8
/*0x5fba*/      strb r0, [r5, #7]
            jump_5fbc:
/*0x5fbc*/      ldr r1, [pc, #0x1c] /* data_5fdc */
/*0x5fbe*/      movs r0, #0
/*0x5fc0*/      strb r0, [r5, #6]
/*0x5fc2*/      str r0, [r1]
/*0x5fc4*/      ldr r1, [pc, #0x18] /* data_5fe0 */
/*0x5fc6*/      strb r0, [r5, #7]
/*0x5fc8*/      strb.w r8, [r1]
/*0x5fcc*/      b jump_5fb0

/*0x5fce*/  .byte 0x00
/*0x5fcf*/  .byte 0x00

            data_5fd0:
/*0x5fd0*/  .word 0x200018fc
            data_5fd4:
/*0x5fd4*/  .word 0x20000620
            data_5fd8:
/*0x5fd8*/  .word 0x20000058
            data_5fdc:
/*0x5fdc*/  .word 0x20000060
            data_5fe0:
/*0x5fe0*/  .word 0x20000580


            .thumb_func
            call_5fe4:
/*0x5fe4*/      ldr r0, [pc, #0xc] /* data_5ff4 */
/*0x5fe6*/      ldrb r1, [r0, #6]
/*0x5fe8*/      cmp r1, #0
/*0x5fea*/      bne jump_5ff2
/*0x5fec*/      movs r1, #1
/*0x5fee*/      strb r1, [r0, #6]
/*0x5ff0*/      strb r1, [r0, #7]
            jump_5ff2:
/*0x5ff2*/      bx lr

            data_5ff4:
/*0x5ff4*/  .word 0x200018fc


            .thumb_func
            call_5ff8:
/*0x5ff8*/      push {r3, r4, r5, r6, r7, lr}
/*0x5ffa*/      ldr r6, [pc, #0x78] /* data_6074 */
/*0x5ffc*/      movs r7, #0
/*0x5ffe*/      ldrb r0, [r6, #6]
/*0x6000*/      cmp r0, #2
/*0x6002*/      bne jump_6070
/*0x6004*/      subs r5, r6, #4
/*0x6006*/      ldrh r0, [r5]
/*0x6008*/      cbz r0, jump_6070
/*0x600a*/      ldr r1, [pc, #0x6c] /* data_6078 */
/*0x600c*/      str r7, [sp]
/*0x600e*/      ldr r1, [r1]
/*0x6010*/      add.w r4, r1, r0, lsl #2
/*0x6014*/      ldrb.w r0, [sp, #3]
/*0x6018*/      orr r0, r0, #5
/*0x601c*/      strb.w r0, [sp, #3]
/*0x6020*/      b jump_6066
            jump_6022:
/*0x6022*/      ldrb r0, [r4, #1]
/*0x6024*/      lsrs r0, r0, #5
/*0x6026*/      cmp r0, #2
/*0x6028*/      beq jump_6030
/*0x602a*/      cmp r0, #7
/*0x602c*/      bne jump_605e
/*0x602e*/      b jump_605a
            jump_6030:
/*0x6030*/      ldrh r0, [r4]
/*0x6032*/      mov r1, sp
/*0x6034*/      bl call_4c68
/*0x6038*/      ldrb.w r0, [sp, #1]
/*0x603c*/      lsls r0, r0, #0x1f
/*0x603e*/      ldrb.w r0, [sp]
/*0x6042*/      beq jump_604a
/*0x6044*/      bl call_4944
/*0x6048*/      b jump_604e
            jump_604a:
/*0x604a*/      ldr r1, [pc, #0x30] /* data_607c */
/*0x604c*/      ldrb r0, [r1, r0]
            jump_604e:
/*0x604e*/      strb.w r0, [sp, #2]
/*0x6052*/      ldr r0, [sp]
/*0x6054*/      bl call_49ec
/*0x6058*/      b jump_605e
            jump_605a:
/*0x605a*/      movs r0, #0xff
/*0x605c*/      strh r0, [r5]
            jump_605e:
/*0x605e*/      ldrh r0, [r5]
/*0x6060*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6062*/      strh r0, [r5]
/*0x6064*/      .short 0x1d24 /* adds r4, r4, #4 */ 
            jump_6066:
/*0x6066*/      ldrh r0, [r5]
/*0x6068*/      cmp r0, #0xff
/*0x606a*/      bls jump_6022
/*0x606c*/      bl call_799c
            jump_6070:
/*0x6070*/      strb r7, [r6, #6]
/*0x6072*/      pop {r3, r4, r5, r6, r7, pc}

            data_6074:
/*0x6074*/  .word 0x200018fc
            data_6078:
/*0x6078*/  .word 0x20000058
            data_607c:
/*0x607c*/  .word 0x200000f0


            .thumb_func
            call_6080:
/*0x6080*/      ldr r0, [pc, #0x3c] /* data_60c0 */
/*0x6082*/      push {r4, lr}
/*0x6084*/      ldr r0, [r0]
/*0x6086*/      bl call_4c72
/*0x608a*/      mov r4, r0
/*0x608c*/      movs r1, #3
/*0x608e*/      bl call_5570
/*0x6092*/      cmp r0, #0xff
/*0x6094*/      beq jump_60a0
/*0x6096*/      movs r1, #0xff
/*0x6098*/      mov r0, r4
/*0x609a*/      bl call_5570
/*0x609e*/      b jump_60b4
            jump_60a0:
/*0x60a0*/      bl call_7960
/*0x60a4*/      cmp r0, #0x18
/*0x60a6*/      bhs jump_60bc
/*0x60a8*/      ldr r2, [pc, #0x18] /* data_60c4 */
/*0x60aa*/      movw r1, #0xffff
/*0x60ae*/      add.w r0, r2, r0, lsl #1
/*0x60b2*/      strh r1, [r0, #0x28]
            jump_60b4:
/*0x60b4*/      bl call_40d4
/*0x60b8*/      movs r0, #1
/*0x60ba*/      pop {r4, pc}
            jump_60bc:
/*0x60bc*/      movs r0, #0
/*0x60be*/      pop {r4, pc}

            data_60c0:
/*0x60c0*/  .word 0x20000054
            data_60c4:
/*0x60c4*/  .word 0x20000620


            .thumb_func
            call_60c8:
/*0x60c8*/      push {r3, r4, r5, lr}
/*0x60ca*/      ldr r4, [pc, #0x30] /* data_60fc */
/*0x60cc*/      movs r5, #0x70
/*0x60ce*/      b jump_60f2
            jump_60d0:
/*0x60d0*/      mov r1, sp
/*0x60d2*/      mov r0, r5
/*0x60d4*/      bl call_6100
/*0x60d8*/      ldrb.w r0, [sp, #2]
/*0x60dc*/      strb r0, [r4]
/*0x60de*/      sub.w r0, r4, #0x70
/*0x60e2*/      ldrb.w r1, [sp, #1]
/*0x60e6*/      strb r1, [r0]
/*0x60e8*/      subs r0, #0x70
/*0x60ea*/      ldrb.w r1, [sp]
/*0x60ee*/      strb r1, [r0]
/*0x60f0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_60f2:
/*0x60f2*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x60f4*/      uxtb r5, r5
/*0x60f6*/      bhs jump_60d0
/*0x60f8*/      pop {r3, r4, r5, pc}

/*0x60fa*/  .byte 0x00
/*0x60fb*/  .byte 0x00

            data_60fc:
/*0x60fc*/  .word 0x200003c7


            .thumb_func
            call_6100:
/*0x6100*/      ldr r2, [pc, #0x30] /* data_6134 */
/*0x6102*/      movs r3, #0x12
/*0x6104*/      ldrb r0, [r2, r0]
/*0x6106*/      and r2, r0, #7
/*0x610a*/      lsrs r0, r0, #3
/*0x610c*/      rsb r0, r0, r0, lsl #8
/*0x6110*/      udiv r0, r0, r3
/*0x6114*/      uxtb r0, r0
/*0x6116*/      strb r0, [r1]
/*0x6118*/      cmp r2, #5
/*0x611a*/      beq jump_612e
/*0x611c*/      rsb.w r2, r2, #5
/*0x6120*/      movs r3, #0x2b
/*0x6122*/      muls r2, r3, r2
/*0x6124*/      uxtb r3, r2
/*0x6126*/      mov r2, r1
/*0x6128*/      mov r1, r3
/*0x612a*/      b.w call_416a
            jump_612e:
/*0x612e*/      strb r0, [r1, #1]
/*0x6130*/      strb r0, [r1, #2]
/*0x6132*/      bx lr

            data_6134:
/*0x6134*/  .word 0x00008c99 /* possible pointer */


            .thumb_func
            call_6138:
/*0x6138*/      ldr r1, [pc, #4] /* data_6140 */
/*0x613a*/      strb r0, [r1]
/*0x613c*/      b.w jump_5984

            data_6140:
/*0x6140*/  .word 0x20000064


            .thumb_func
            call_6144:
/*0x6144*/      cmp r0, #6
/*0x6146*/      bhs jump_614c
/*0x6148*/      ldr r2, [pc, #0x1c] /* data_6168 */
/*0x614a*/      b jump_614e
            jump_614c:
/*0x614c*/      ldr r2, [pc, #0x1c] /* data_616c */
            jump_614e:
/*0x614e*/      blo jump_6154
/*0x6150*/      sub.w r0, r0, #6
            jump_6154:
/*0x6154*/      add.w r0, r0, r0, lsl #2
/*0x6158*/      ldr r3, [r2]
/*0x615a*/      lsl.w r1, r1, r0
/*0x615e*/      orr.w r3, r3, r1
/*0x6162*/      str r3, [r2]
/*0x6164*/      bx lr

/*0x6166*/  .byte 0x00
/*0x6167*/  .byte 0x00

            data_6168:
/*0x6168*/  .word 0x40090128
            data_616c:
/*0x616c*/  .word 0x4009012c


            .thumb_func
            call_6170:
/*0x6170*/      ldr r2, [pc, #0x28] /* data_619c */
/*0x6172*/      add.w r0, r0, r0, lsl #1
/*0x6176*/      add.w r0, r2, r0, lsl #3
/*0x617a*/      ldrd r2, r3, [r1, #0x10]
/*0x617e*/      orrs r2, r3
/*0x6180*/      ldr r3, [r1, #0x18]
/*0x6182*/      orrs r2, r3
/*0x6184*/      str r2, [r0]
/*0x6186*/      ldr r2, [r1]
/*0x6188*/      str r2, [r0, #4]
/*0x618a*/      ldr r2, [r1, #4]
/*0x618c*/      str r2, [r0, #8]
/*0x618e*/      ldr r2, [r1, #0xc]
/*0x6190*/      ldrh r1, [r1, #8]
/*0x6192*/      orr.w r1, r2, r1, lsl #16
/*0x6196*/      str r1, [r0, #0x10]
/*0x6198*/      bx lr

/*0x619a*/  .byte 0x00
/*0x619b*/  .byte 0x00

            data_619c:
/*0x619c*/  .word 0x40090000


            .thumb_func
            call_61a0:
/*0x61a0*/      ldr r2, [pc, #0x20] /* data_61c4 */
/*0x61a2*/      add.w r0, r0, r0, lsl #1
/*0x61a6*/      add.w r0, r2, r0, lsl #3
/*0x61aa*/      and r2, r0, #0xf0000000
/*0x61ae*/      ubfx r0, r0, #0, #0x14
/*0x61b2*/      add.w r0, r2, r0, lsl #5
/*0x61b6*/      add.w r0, r0, #0x2000000
/*0x61ba*/      cbz r1, jump_61be
/*0x61bc*/      movs r1, #1
            jump_61be:
/*0x61be*/      str r1, [r0]
/*0x61c0*/      bx lr

/*0x61c2*/  .byte 0x00
/*0x61c3*/  .byte 0x00

            data_61c4:
/*0x61c4*/  .word 0x40090000


            .thumb_func
            call_61c8:
/*0x61c8*/      cmp r0, #6
/*0x61ca*/      bhs jump_61d0
/*0x61cc*/      ldr r2, [pc, #0x24] /* data_61f4 */
/*0x61ce*/      b jump_61d2
            jump_61d0:
/*0x61d0*/      ldr r2, [pc, #0x24] /* data_61f8 */
            jump_61d2:
/*0x61d2*/      blo jump_61d8
/*0x61d4*/      sub.w r0, r0, #6
            jump_61d8:
/*0x61d8*/      add.w r0, r0, r0, lsl #2
/*0x61dc*/      ldr r2, [r2]
/*0x61de*/      lsl.w r1, r1, r0
/*0x61e2*/      tst r2, r1
/*0x61e4*/      beq jump_61ec
/*0x61e6*/      mov.w r0, #1
/*0x61ea*/      bx lr
            jump_61ec:
/*0x61ec*/      mov.w r0, #0
/*0x61f0*/      bx lr

/*0x61f2*/  .byte 0x00
/*0x61f3*/  .byte 0x00

            data_61f4:
/*0x61f4*/  .word 0x40090120
            data_61f8:
/*0x61f8*/  .word 0x40090124


            .thumb_func
            call_61fc:
/*0x61fc*/      cmp r0, #6
/*0x61fe*/      bhs jump_6204
/*0x6200*/      ldr r3, [pc, #0x20] /* data_6224 */
/*0x6202*/      b jump_6206
            jump_6204:
/*0x6204*/      ldr r3, [pc, #0x20] /* data_6228 */
            jump_6206:
/*0x6206*/      blo jump_620c
/*0x6208*/      sub.w r0, r0, #6
            jump_620c:
/*0x620c*/      cmp r2, #0
/*0x620e*/      add.w r0, r0, r0, lsl #2
/*0x6212*/      ldr r2, [r3]
/*0x6214*/      lsl.w r1, r1, r0
/*0x6218*/      beq jump_621e
/*0x621a*/      orrs r2, r1
/*0x621c*/      b jump_6220
            jump_621e:
/*0x621e*/      bics r2, r1
            jump_6220:
/*0x6220*/      str r2, [r3]
/*0x6222*/      bx lr

            data_6224:
/*0x6224*/  .word 0x40090130
            data_6228:
/*0x6228*/  .word 0x40090134


            .thumb_func
            call_622c:
/*0x622c*/      mov.w r2, #0x200
/*0x6230*/      movs r1, #0
/*0x6232*/      lsls r0, r2, #9
/*0x6234*/      movs r3, #1
/*0x6236*/      b.w call_39a8

/*0x623a*/  .byte 0x00
/*0x623b*/  .byte 0x00


            .thumb_func
            call_623c:
/*0x623c*/      push {r4, lr}
/*0x623e*/      movs r2, #0
/*0x6240*/      movs r1, #1
/*0x6242*/      ldr r0, [pc, #0x14] /* data_6258 */
/*0x6244*/      bl call_46fc
/*0x6248*/      movs r2, #0
/*0x624a*/      pop.w {r4, lr}
/*0x624e*/      mov r1, r2
/*0x6250*/      movs r0, #2
/*0x6252*/      b.w call_3800

/*0x6256*/  .byte 0x00
/*0x6257*/  .byte 0x00

            data_6258:
/*0x6258*/  .word 0x400b4000


            .thumb_func
            call_625c:
/*0x625c*/      push {r4, lr}
/*0x625e*/      movs r2, #2
/*0x6260*/      movs r1, #1
/*0x6262*/      ldr r0, [pc, #0x14] /* data_6278 */
/*0x6264*/      bl call_46fc
/*0x6268*/      movs r2, #4
/*0x626a*/      movs r1, #0
/*0x626c*/      pop.w {r4, lr}
/*0x6270*/      movs r0, #2
/*0x6272*/      b.w call_3800

/*0x6276*/  .byte 0x00
/*0x6277*/  .byte 0x00

            data_6278:
/*0x6278*/  .word 0x400b4000


            .thumb_func
            call_627c:
/*0x627c*/      push {r4, r5, r6, lr}
/*0x627e*/      ldr r1, [pc, #0x34] /* data_62b4 */
/*0x6280*/      ldr r4, [r1]
/*0x6282*/      ldr r5, [pc, #0x30] /* data_62b4 */
/*0x6284*/      adds r5, #0x48
/*0x6286*/      ldr r3, [r5]
/*0x6288*/      movs r2, #1
/*0x628a*/      str r2, [r1]
/*0x628c*/      movs r2, #0
/*0x628e*/      str r2, [r5]
/*0x6290*/      ldr r6, [pc, #0x24] /* data_62b8 */
/*0x6292*/      str.w r2, [r6, #0x9c]
/*0x6296*/      str.w r2, [r6, #0x8c]
/*0x629a*/      str r4, [r1]
/*0x629c*/      ldr r1, [pc, #0x1c] /* data_62bc */
/*0x629e*/      ldr r2, [r1]
/*0x62a0*/      orr r2, r2, #4
/*0x62a4*/      str r2, [r1]
/*0x62a6*/      cbz r0, jump_62ae
/*0x62a8*/      wfi 
            jump_62aa:
/*0x62aa*/      str r3, [r5]
/*0x62ac*/      pop {r4, r5, r6, pc}
            jump_62ae:
/*0x62ae*/      wfe 
/*0x62b0*/      b jump_62aa

/*0x62b2*/  .byte 0x00
/*0x62b3*/  .byte 0x00

            data_62b4:
/*0x62b4*/  .word 0x43100618
            data_62b8:
/*0x62b8*/  .word 0x42d42000
            data_62bc:
/*0x62bc*/  .word 0xe000ed10

            jump_62c0:
/*0x62c0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x62c4*/      ldr r4, [pc, #0x38] /* data_6300 */
/*0x62c6*/      ldr r7, [r4]
/*0x62c8*/      ldr r5, [pc, #0x34] /* data_6300 */
/*0x62ca*/      adds r5, #0x48
/*0x62cc*/      ldr r6, [r5]
/*0x62ce*/      mov.w sb, #1
/*0x62d2*/      str.w sb, [r4]
/*0x62d6*/      mov.w r8, #0
/*0x62da*/      str.w r8, [r5]
/*0x62de*/      bl call_6518
/*0x62e2*/      ldr r0, [pc, #0x20] /* data_6304 */
/*0x62e4*/      str.w r8, [r0, #0x9c]
/*0x62e8*/      str.w sb, [r0, #0x8c]
/*0x62ec*/      str r7, [r4]
/*0x62ee*/      ldr r0, [pc, #0x18] /* data_6308 */
/*0x62f0*/      ldr r1, [r0]
/*0x62f2*/      orr r1, r1, #4
/*0x62f6*/      str r1, [r0]
/*0x62f8*/      wfe 
/*0x62fa*/      str r6, [r5]
/*0x62fc*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_6300:
/*0x6300*/  .word 0x43100618
            data_6304:
/*0x6304*/  .word 0x42d42000
            data_6308:
/*0x6308*/  .word 0xe000ed10


            .thumb_func
            call_630c:
/*0x630c*/      ldr r1, [pc, #0x10] /* data_6320 */
/*0x630e*/      ldr r2, [r1]
/*0x6310*/      bic r2, r2, #4
/*0x6314*/      str r2, [r1]
/*0x6316*/      cbz r0, jump_631c
/*0x6318*/      wfi 
/*0x631a*/      bx lr
            jump_631c:
/*0x631c*/      wfe 
/*0x631e*/      bx lr

            data_6320:
/*0x6320*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x6324*/      push {r3, r4, r5, r6, r7, lr}
/*0x6326*/      ldr r6, [pc, #0xfc] /* data_6424 */
/*0x6328*/      ldrb r0, [r6]
/*0x632a*/      cmp r0, #1
/*0x632c*/      bne jump_6396
/*0x632e*/      ldr r5, [pc, #0xf8] /* data_6428 */
/*0x6330*/      movs r4, #0
/*0x6332*/      subs r2, r5, #4
/*0x6334*/      adds r0, r2, #4
/*0x6336*/      ldrb r1, [r5]
/*0x6338*/      ldrb r0, [r0, #1]
/*0x633a*/      cmp r1, #0x10
/*0x633c*/      beq jump_6346
/*0x633e*/      ldrb r2, [r2]
/*0x6340*/      cbz r2, jump_6374
/*0x6342*/      movs r0, #4
/*0x6344*/      b jump_6394
            jump_6346:
/*0x6346*/      cbz r0, jump_635a
/*0x6348*/      cmp r0, #1
/*0x634a*/      beq jump_6352
/*0x634c*/      cmp r0, #2
/*0x634e*/      bne jump_63c8
/*0x6350*/      b jump_6364
            jump_6352:
/*0x6352*/      ldr r0, [r5, #4]
/*0x6354*/      cmp r0, #3
/*0x6356*/      bhs jump_63c8
/*0x6358*/      strb r0, [r2]
            jump_635a:
/*0x635a*/      ldrb r0, [r2]
/*0x635c*/      str r0, [sp]
/*0x635e*/      movs r1, #4
/*0x6360*/      mov r0, sp
/*0x6362*/      b jump_636c
            jump_6364:
/*0x6364*/      movs r0, #3
/*0x6366*/      movs r1, #4
/*0x6368*/      str r0, [r5, #4]
/*0x636a*/      b jump_6406
            jump_636c:
/*0x636c*/      bl call_64b4
/*0x6370*/      movs r4, #1
/*0x6372*/      b jump_6382
            jump_6374:
/*0x6374*/      cmp r1, #0x11
/*0x6376*/      beq jump_637e
/*0x6378*/      cmp r1, #0x12
/*0x637a*/      bne jump_63c8
/*0x637c*/      b jump_6398
            jump_637e:
/*0x637e*/      bl call_6430
            jump_6382:
/*0x6382*/      ldrb r0, [r6]
/*0x6384*/      cmp r0, #1
/*0x6386*/      bne jump_6396
/*0x6388*/      cbz r4, jump_63c8
/*0x638a*/      movs r1, #0x3c
/*0x638c*/      adds r0, r5, #4
            jump_638e:
/*0x638e*/      bl mem_zero /* (dest, size) */
/*0x6392*/      movs r0, #2
            jump_6394:
/*0x6394*/      strb r0, [r6]
            jump_6396:
/*0x6396*/      pop {r3, r4, r5, r6, r7, pc}
            jump_6398:
/*0x6398*/      mov.w r3, #0x400
/*0x639c*/      cmp r0, #0x20
/*0x639e*/      blo jump_63be
/*0x63a0*/      sub.w r2, r0, #0x1f
/*0x63a4*/      rsb r1, r2, r2, lsl #4
/*0x63a8*/      cmp.w r3, r1, lsl #2
/*0x63ac*/      blt jump_63be
/*0x63ae*/      rsb r0, r0, r0, lsl #4
/*0x63b2*/      mov.w r1, #0x2880
/*0x63b6*/      add.w r0, r1, r0, lsl #2
/*0x63ba*/      movs r1, #0x3c
/*0x63bc*/      b jump_636c
            jump_63be:
/*0x63be*/      cbz r0, jump_63da
/*0x63c0*/      cmp r0, #1
/*0x63c2*/      beq jump_6414
/*0x63c4*/      cmp r0, #2
/*0x63c6*/      beq jump_641c
            jump_63c8:
/*0x63c8*/      ldr r0, [r5]
/*0x63ca*/      str r0, [r5, #4]
/*0x63cc*/      movw r0, #0xaaff
/*0x63d0*/      str r0, [r5]
/*0x63d2*/      ldr r0, [pc, #0x54] /* data_6428 */
/*0x63d4*/      movs r1, #0x38
/*0x63d6*/      adds r0, #8
/*0x63d8*/      b jump_638e
            jump_63da:
/*0x63da*/      movs r0, #0
/*0x63dc*/      ldrb.w r0, [r0, #0x10f]
/*0x63e0*/      cmp r0, #0xaa
/*0x63e2*/      beq jump_640a
/*0x63e4*/      ldrb r2, [r3]
/*0x63e6*/      mov r0, r3
/*0x63e8*/      cmp r2, #4
/*0x63ea*/      beq jump_6410
/*0x63ec*/      movs r2, #0x20
/*0x63ee*/      mov r1, r3
/*0x63f0*/      adds r0, r5, #4
/*0x63f2*/      bl memcpy /* (dest, src, size) */
/*0x63f6*/      ldr r0, [pc, #0x34] /* data_642c */
/*0x63f8*/      ldr.w r1, [r0, #0x180]
/*0x63fc*/      str r1, [r5, #0x24]
/*0x63fe*/      ldr.w r0, [r0, #0x18c]
/*0x6402*/      movs r1, #0x28
/*0x6404*/      str r0, [r5, #0x28]
            jump_6406:
/*0x6406*/      adds r0, r5, #4
/*0x6408*/      b jump_636c
            jump_640a:
/*0x640a*/      movs r1, #0x10
/*0x640c*/      lsls r0, r1, #4
/*0x640e*/      b jump_636c
            jump_6410:
/*0x6410*/      movs r1, #0x34
/*0x6412*/      b jump_636c
            jump_6414:
/*0x6414*/      movs r1, #4
/*0x6416*/      mov.w r0, #0x3c00
/*0x641a*/      b jump_636c
            jump_641c:
/*0x641c*/      movs r1, #1
/*0x641e*/      strb r1, [r5, #4]
/*0x6420*/      b jump_6406

/*0x6422*/  .byte 0x00
/*0x6423*/  .byte 0x00

            data_6424:
/*0x6424*/  .word 0x2000004c
            data_6428:
/*0x6428*/  .word 0x20000540
            data_642c:
/*0x642c*/  .word 0x40080000


            .thumb_func
            call_6430:
/*0x6430*/      push {r4, lr}
/*0x6432*/      ldr r1, [pc, #0x6c] /* data_64a0 */
/*0x6434*/      cbz r0, jump_6452
/*0x6436*/      cmp r0, #1
/*0x6438*/      beq jump_6456
/*0x643a*/      cmp r0, #2
/*0x643c*/      bne jump_649e
/*0x643e*/      movs r0, #0x35
/*0x6440*/      bl call_5c50
/*0x6444*/      movs r0, #0
/*0x6446*/      bl call_72e8
/*0x644a*/      pop.w {r4, lr}
/*0x644e*/      b.w jump_62c0
            jump_6452:
/*0x6452*/      ldr r0, [pc, #0x50] /* data_64a4 */
/*0x6454*/      b jump_645a
            jump_6456:
/*0x6456*/      ldr r0, [pc, #0x4c] /* data_64a4 */
/*0x6458*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_645a:
/*0x645a*/      str r0, [r1]
/*0x645c*/      movs r1, #0
/*0x645e*/      mov.w r0, #0x10000
/*0x6462*/      movs r3, #1
/*0x6464*/      mov r2, r1
/*0x6466*/      bl call_39a8
/*0x646a*/      ldr r1, [pc, #0x3c] /* data_64a8 */
/*0x646c*/      mov.w r0, #0x200
/*0x6470*/      str r0, [r1, #0x24]
/*0x6472*/      movs r0, #0x35
/*0x6474*/      bl call_5c50
/*0x6478*/      movs r0, #0
/*0x647a*/      bl call_72e8
/*0x647e*/      movw r0, #0x4e20
/*0x6482*/      bl spin_wait /* (time) */
/*0x6486*/      dsb sy
/*0x648a*/      ldr r0, [pc, #0x20] /* data_64ac */
/*0x648c*/      ldr r1, [r0]
/*0x648e*/      ldr r2, [pc, #0x20] /* data_64b0 */
/*0x6490*/      and r1, r1, #0x700
/*0x6494*/      orrs r1, r2
/*0x6496*/      str r1, [r0]
/*0x6498*/      dsb sy
            jump_649c:
/*0x649c*/      b jump_649c
            jump_649e:
/*0x649e*/      pop {r4, pc}

            data_64a0:
/*0x64a0*/  .word 0x20003ffc
            data_64a4:
/*0x64a4*/  .word 0x55aafaf5
            data_64a8:
/*0x64a8*/  .word 0x400b0000
            data_64ac:
/*0x64ac*/  .word 0xe000ed0c
            data_64b0:
/*0x64b0*/  .word 0x05fa0004


            .thumb_func
            call_64b4:
/*0x64b4*/      push {r4, r5, r6, lr}
/*0x64b6*/      mov r4, r1
/*0x64b8*/      ldr r2, [pc, #0x24] /* data_64e0 */
/*0x64ba*/      mov r1, r0
/*0x64bc*/      movs r0, #2
/*0x64be*/      strb r0, [r2]
/*0x64c0*/      ldr r0, [pc, #0x20] /* data_64e4 */
/*0x64c2*/      subs r5, r0, #4
/*0x64c4*/      cmp r1, r0
/*0x64c6*/      beq jump_64d0
/*0x64c8*/      mov r2, r4
/*0x64ca*/      adds r0, r5, #4
/*0x64cc*/      bl memcpy /* (dest, src, size) */
            jump_64d0:
/*0x64d0*/      adds r0, r5, r4
/*0x64d2*/      rsb.w r1, r4, #0x3c
/*0x64d6*/      pop.w {r4, r5, r6, lr}
/*0x64da*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x64dc*/      b.w mem_zero /* (dest, size) */

            data_64e0:
/*0x64e0*/  .word 0x2000004c
            data_64e4:
/*0x64e4*/  .word 0x20000544

            jump_64e8:
/*0x64e8*/      push {r4, r5, r6, r7, lr}
/*0x64ea*/      ldr r7, [pc, #0x28] /* data_6514 */
/*0x64ec*/      ldr.w r4, [r7, #0x104]
/*0x64f0*/      ldr.w r5, [r7, #0x108]
/*0x64f4*/      ldr.w r6, [r7, #0x10c]
/*0x64f8*/      bics r4, r0
/*0x64fa*/      bics r5, r1
/*0x64fc*/      bics r6, r2
/*0x64fe*/      cbz r3, jump_6506
/*0x6500*/      orrs r4, r0
/*0x6502*/      orrs r5, r1
/*0x6504*/      orrs r6, r2
            jump_6506:
/*0x6506*/      str.w r4, [r7, #0x104]
/*0x650a*/      str.w r5, [r7, #0x108]
/*0x650e*/      str.w r6, [r7, #0x10c]
/*0x6512*/      pop {r4, r5, r6, r7, pc}

            data_6514:
/*0x6514*/  .word 0x40088000


            .thumb_func
            call_6518:
/*0x6518*/      ldr r2, [pc, #0x1c] /* data_6538 */
/*0x651a*/      movs r1, #0
/*0x651c*/      mov.w r0, #0x1c20
/*0x6520*/      str.w r1, [r2, #0x108]
            jump_6524:
/*0x6524*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6526*/      bhs jump_6524
/*0x6528*/      movs r0, #1
/*0x652a*/      str.w r0, [r2, #0x108]
/*0x652e*/      ldr r0, [pc, #0xc] /* data_653c */
            jump_6530:
/*0x6530*/      ldr r1, [r0, #8]
/*0x6532*/      lsls r1, r1, #0x1a
/*0x6534*/      bpl jump_6530
/*0x6536*/      bx lr

            data_6538:
/*0x6538*/  .word 0x42d40000
            data_653c:
/*0x653c*/  .word 0x40088000


            .thumb_func
            call_6540:
/*0x6540*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x6544*/      movs r6, #0xe
/*0x6546*/      ldr r5, [pc, #0x78] /* data_65c0 */
/*0x6548*/      b jump_65b6
            jump_654a:
/*0x654a*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x654c*/      cmp r6, #5
/*0x654e*/      blo jump_655a
/*0x6550*/      ldr r0, [pc, #0x70] /* data_65c4 */
/*0x6552*/      add r0, r6
/*0x6554*/      ldrb r0, [r0, #-0x5]
/*0x6558*/      b jump_6566
            jump_655a:
/*0x655a*/      ldr r1, [pc, #0x68] /* data_65c4 */
/*0x655c*/      add.w r0, r6, r6, lsl #1
/*0x6560*/      adds r1, #0x79
/*0x6562*/      add r0, r1
/*0x6564*/      ldrb r0, [r0, #2]
            jump_6566:
/*0x6566*/      ldrb r1, [r5]
/*0x6568*/      eors r1, r0
/*0x656a*/      movs.w r8, r1
/*0x656e*/      beq jump_65b6
/*0x6570*/      movs r4, #0x80
/*0x6572*/      movs r7, #8
/*0x6574*/      b jump_65b0
            jump_6576:
/*0x6576*/      tst.w r8, r4
/*0x657a*/      beq jump_65ae
/*0x657c*/      ldrb r0, [r5]
/*0x657e*/      eors r0, r4
/*0x6580*/      strb r0, [r5]
/*0x6582*/      tst r0, r4
/*0x6584*/      bne jump_658a
/*0x6586*/      movs r0, #1
/*0x6588*/      b jump_658c
            jump_658a:
/*0x658a*/      movs r0, #0
            jump_658c:
/*0x658c*/      mov sb, r0
/*0x658e*/      add.w r0, r7, r6, lsl #3
/*0x6592*/      uxtb r0, r0
/*0x6594*/      mov r1, sb
/*0x6596*/      bl call_4ae4
/*0x659a*/      cbnz r0, jump_65a2
/*0x659c*/      ldrb r0, [r5]
/*0x659e*/      eors r0, r4
/*0x65a0*/      strb r0, [r5]
            jump_65a2:
/*0x65a2*/      movs.w r0, sb
/*0x65a6*/      beq jump_65aa
/*0x65a8*/      movs r0, #1
            jump_65aa:
/*0x65aa*/      ldr r1, [pc, #0x1c] /* data_65c8 */
/*0x65ac*/      strh r0, [r1, #2]
            jump_65ae:
/*0x65ae*/      lsrs r4, r4, #1
            jump_65b0:
/*0x65b0*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x65b2*/      uxtb r7, r7
/*0x65b4*/      bhs jump_6576
            jump_65b6:
/*0x65b6*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x65b8*/      uxtb r6, r6
/*0x65ba*/      bhs jump_654a
/*0x65bc*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_65c0:
/*0x65c0*/  .word 0x200000e2
            data_65c4:
/*0x65c4*/  .word 0x200001f0
            data_65c8:
/*0x65c8*/  .word 0x2000001a


            .thumb_func
            call_65cc:
/*0x65cc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x65d0*/      mov r6, r0
/*0x65d2*/      movs r4, #2
/*0x65d4*/      ldr r5, [pc, #0x64] /* data_663c */
/*0x65d6*/      mov.w r7, #0x1f4
            jump_65da:
/*0x65da*/      bl call_7b80
/*0x65de*/      movs r0, #5
/*0x65e0*/      b jump_65ea
            jump_65e2:
/*0x65e2*/      add.w r1, r0, r0, lsl #1
/*0x65e6*/      ldrb r1, [r5, r1]
/*0x65e8*/      cbnz r1, jump_65f0
            jump_65ea:
/*0x65ea*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x65ec*/      uxtb r0, r0
/*0x65ee*/      bhs jump_65e2
            jump_65f0:
/*0x65f0*/      cmp r0, #0xff
/*0x65f2*/      beq jump_6604
/*0x65f4*/      cmp r4, #0
/*0x65f6*/      bne jump_65da
            jump_65f8:
/*0x65f8*/      cmp r6, #0
/*0x65fa*/      beq jump_6638
/*0x65fc*/      ldr r0, [pc, #0x40] /* data_6640 */
/*0x65fe*/      ldr r2, [pc, #0x3c] /* data_663c */
/*0x6600*/      movs r1, #5
/*0x6602*/      b jump_661c
            jump_6604:
/*0x6604*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6606*/      ands r4, r4, #0xff
/*0x660a*/      beq jump_65f8
/*0x660c*/      mov r0, r7
/*0x660e*/      bl spin_wait /* (time) */
/*0x6612*/      b jump_65da
            jump_6614:
/*0x6614*/      ldrb r3, [r2, #2]
/*0x6616*/      strb r3, [r0], #1
/*0x661a*/      .short 0x1cd2 /* adds r2, r2, #3 */ 
            jump_661c:
/*0x661c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x661e*/      uxtb r1, r1
/*0x6620*/      bhs jump_6614
/*0x6622*/      ldr r2, [pc, #0x18] /* data_663c */
/*0x6624*/      subs r2, #0x79
/*0x6626*/      movs r1, #9
/*0x6628*/      b jump_6632
            jump_662a:
/*0x662a*/      ldrb r3, [r2], #1
/*0x662e*/      strb r3, [r0], #1
            jump_6632:
/*0x6632*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6634*/      uxtb r1, r1
/*0x6636*/      bhs jump_662a
            jump_6638:
/*0x6638*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_663c:
/*0x663c*/  .word 0x20000269
            data_6640:
/*0x6640*/  .word 0x200000d4


            .thumb_func
            call_6644:
/*0x6644*/      ldr r1, [pc, #0x10] /* data_6658 */
/*0x6646*/      ldrb r0, [r1]
/*0x6648*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x664a*/      strb r0, [r1]
/*0x664c*/      lsls r0, r0, #0x1e
/*0x664e*/      bne jump_6654
/*0x6650*/      b.w call_7b80
            jump_6654:
/*0x6654*/      bx lr

/*0x6656*/  .byte 0x00
/*0x6657*/  .byte 0x00

            data_6658:
/*0x6658*/  .word 0x2000001a

            jump_665c:
/*0x665c*/      ldr r3, [pc, #0x14] /* data_6674 */
/*0x665e*/      add r1, r3
/*0x6660*/      b jump_666a
            jump_6662:
/*0x6662*/      ldrb r3, [r0], #1
/*0x6666*/      strb r3, [r1], #1
            jump_666a:
/*0x666a*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x666c*/      uxtb r2, r2
/*0x666e*/      bhs jump_6662
/*0x6670*/      bx lr

/*0x6672*/  .byte 0x00
/*0x6673*/  .byte 0x00

            data_6674:
/*0x6674*/  .word 0x200001f0


            .thumb_func
            call_6678:
/*0x6678*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x667c*/      movs r6, #0
/*0x667e*/      mov r1, r6
/*0x6680*/      mov.w r0, #0xf0000
/*0x6684*/      movs r3, #1
/*0x6686*/      mov r2, r6
/*0x6688*/      bl call_39a8
/*0x668c*/      movs r4, #8
/*0x668e*/      b jump_66c0
            jump_6690:
/*0x6690*/      ldr r0, [pc, #0xa0] /* data_6734 */
/*0x6692*/      movs r2, #0
/*0x6694*/      add.w r1, r0, r4, lsl #3
/*0x6698*/      ldrh r5, [r1, #4]
/*0x669a*/      ldr r0, [r1]
/*0x669c*/      uxth r1, r5
/*0x669e*/      mov r7, r0
/*0x66a0*/      bl call_46fc
/*0x66a4*/      uxth r1, r5
/*0x66a6*/      mov r0, r7
/*0x66a8*/      movs r2, #1
/*0x66aa*/      bl call_46dc
/*0x66ae*/      ldr r0, [pc, #0x84] /* data_6734 */
/*0x66b0*/      adds r0, #0x40
/*0x66b2*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x66b6*/      add.w r0, r0, r4, lsl #1
/*0x66ba*/      ldrb r0, [r0, #1]
/*0x66bc*/      bl call_3640
            jump_66c0:
/*0x66c0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x66c2*/      uxtb r4, r4
/*0x66c4*/      bhs jump_6690
/*0x66c6*/      movs r4, #5
/*0x66c8*/      b jump_66f2
            jump_66ca:
/*0x66ca*/      ldr r0, [pc, #0x68] /* data_6734 */
/*0x66cc*/      adds r0, #0x50
/*0x66ce*/      add.w r1, r0, r4, lsl #3
/*0x66d2*/      ldrh r5, [r1, #4]
/*0x66d4*/      ldr r7, [r1]
/*0x66d6*/      uxth r1, r5
/*0x66d8*/      mov r0, r7
/*0x66da*/      bl call_4724
/*0x66de*/      uxth r1, r5
/*0x66e0*/      mov r0, r7
/*0x66e2*/      movs r2, #0
/*0x66e4*/      bl call_46ec
/*0x66e8*/      uxth r1, r5
/*0x66ea*/      mov r0, r7
/*0x66ec*/      movs r2, #1
/*0x66ee*/      bl call_46bc
            jump_66f2:
/*0x66f2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x66f4*/      uxtb r4, r4
/*0x66f6*/      bhs jump_66ca
/*0x66f8*/      movs r2, #0xff
/*0x66fa*/      movs r1, #0xe
/*0x66fc*/      ldr r0, [pc, #0x38] /* data_6738 */
/*0x66fe*/      bl mem_set /* (dest, size, val) */
/*0x6702*/      movs r0, #0
/*0x6704*/      bl call_678c
/*0x6708*/      movs r1, #5
/*0x670a*/      ldr r0, [pc, #0x30] /* data_673c */
/*0x670c*/      movs r2, #0xff
/*0x670e*/      b jump_671c
            jump_6710:
/*0x6710*/      strb r6, [r0], #1
/*0x6714*/      strb r2, [r0], #1
/*0x6718*/      strb r2, [r0], #1
            jump_671c:
/*0x671c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x671e*/      uxtb r1, r1
/*0x6720*/      bhs jump_6710
/*0x6722*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6726*/      ldr r0, [pc, #0x14] /* data_673c */
/*0x6728*/      movs r2, #0xff
/*0x672a*/      movs r1, #9
/*0x672c*/      subs r0, #0x79
/*0x672e*/      b.w mem_set /* (dest, size, val) */

/*0x6732*/  .byte 0x00
/*0x6733*/  .byte 0x00

            data_6734:
/*0x6734*/  .word 0x0000869c /* possible pointer */
            data_6738:
/*0x6738*/  .word 0x200000d4
            data_673c:
/*0x673c*/  .word 0x20000269


            .thumb_func
            call_6740:
/*0x6740*/      ldr r0, [pc, #0x40] /* data_6784 */
/*0x6742*/      push {r4, lr}
/*0x6744*/      addw r1, r0, #0x195
/*0x6748*/      movs r2, #5
/*0x674a*/      b jump_675c
            jump_674c:
/*0x674c*/      ldrb r3, [r1]
/*0x674e*/      cbnz r3, jump_6770
/*0x6750*/      ldrb r3, [r1, #2]
/*0x6752*/      ldrb r4, [r0]
/*0x6754*/      cmp r3, r4
/*0x6756*/      bne jump_6770
/*0x6758*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x675a*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_675c:
/*0x675c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x675e*/      uxtb r2, r2
/*0x6760*/      bhs jump_674c
/*0x6762*/      ldr r2, [pc, #0x24] /* data_6788 */
/*0x6764*/      movs r1, #9
/*0x6766*/      b jump_6778
            jump_6768:
/*0x6768*/      ldrb r3, [r2]
/*0x676a*/      ldrb r4, [r0]
/*0x676c*/      cmp r3, r4
/*0x676e*/      beq jump_6774
            jump_6770:
/*0x6770*/      movs r0, #0
/*0x6772*/      pop {r4, pc}
            jump_6774:
/*0x6774*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6776*/      .short 0x1c52 /* adds r2, r2, #1 */ 
            jump_6778:
/*0x6778*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x677a*/      uxtb r1, r1
/*0x677c*/      bhs jump_6768
/*0x677e*/      movs r0, #1
/*0x6780*/      pop {r4, pc}

/*0x6782*/  .byte 0x00
/*0x6783*/  .byte 0x00

            data_6784:
/*0x6784*/  .word 0x200000d4
            data_6788:
/*0x6788*/  .word 0x200001f0


            .thumb_func
            call_678c:
/*0x678c*/      push {r4, lr}
/*0x678e*/      mov r4, r0
/*0x6790*/      movs r2, #0x70
/*0x6792*/      ldr r1, [pc, #0x38] /* data_67cc */
/*0x6794*/      ldr r0, [pc, #0x38] /* data_67d0 */
/*0x6796*/      bl memcpy /* (dest, src, size) */
/*0x679a*/      cbz r4, jump_67ba
/*0x679c*/      bl call_6818
/*0x67a0*/      cmp r4, #1
/*0x67a2*/      beq jump_67aa
/*0x67a4*/      cmp r4, #2
/*0x67a6*/      bne jump_67ba
/*0x67a8*/      b jump_67b2
            jump_67aa:
/*0x67aa*/      ldr r1, [pc, #0x20] /* data_67cc */
/*0x67ac*/      adds r1, #0xe8
/*0x67ae*/      movs r0, #0x22
/*0x67b0*/      b jump_67b6
            jump_67b2:
/*0x67b2*/      ldr r1, [pc, #0x20] /* data_67d4 */
/*0x67b4*/      movs r0, #0x11
            jump_67b6:
/*0x67b6*/      bl call_6844
            jump_67ba:
/*0x67ba*/      bl call_6818
/*0x67be*/      bl call_5600
/*0x67c2*/      pop.w {r4, lr}
/*0x67c6*/      b.w call_6818

/*0x67ca*/  .byte 0x00
/*0x67cb*/  .byte 0x00

            data_67cc:
/*0x67cc*/  .word 0x0000862c /* possible pointer */
            data_67d0:
/*0x67d0*/  .word 0x200001f9
            data_67d4:
/*0x67d4*/  .word 0x00008758 /* possible pointer */


            .thumb_func
            call_67d8:
/*0x67d8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x67dc*/      movs r4, #5
/*0x67de*/      cbz r0, jump_67e6
/*0x67e0*/      movs r7, #0
            jump_67e2:
/*0x67e2*/      ldr r5, [pc, #0x30] /* data_6814 */
/*0x67e4*/      b jump_680a
            jump_67e6:
/*0x67e6*/      movs r7, #1
/*0x67e8*/      b jump_67e2
            jump_67ea:
/*0x67ea*/      add.w r6, r5, r4, lsl #3
/*0x67ee*/      mov r2, r7
/*0x67f0*/      ldrh r0, [r6, #4]
/*0x67f2*/      uxth r1, r0
/*0x67f4*/      ldr.w r0, [r5, r4, lsl #3]
/*0x67f8*/      bl call_4728
/*0x67fc*/      ldrh r0, [r6, #4]
/*0x67fe*/      movs r2, #1
/*0x6800*/      uxth r1, r0
/*0x6802*/      ldr.w r0, [r5, r4, lsl #3]
/*0x6806*/      bl call_46bc
            jump_680a:
/*0x680a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x680c*/      uxtb r4, r4
/*0x680e*/      bhs jump_67ea
/*0x6810*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6814:
/*0x6814*/  .word 0x000086ec /* possible pointer */


            .thumb_func
            call_6818:
/*0x6818*/      push {r4, lr}
/*0x681a*/      ldr r4, [pc, #0x24] /* data_6840 */
/*0x681c*/      movs r2, #0xff
/*0x681e*/      adds r1, r2, #1
/*0x6820*/      sub.w r0, r4, #0x178
/*0x6824*/      bl mem_set /* (dest, size, val) */
/*0x6828*/      movs r0, #0x70
/*0x682a*/      sub.w r1, r4, #0x178
/*0x682e*/      b jump_6836
            jump_6830:
/*0x6830*/      ldrb r2, [r4], #-1
/*0x6834*/      strb r0, [r1, r2]
            jump_6836:
/*0x6836*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6838*/      uxtb r0, r0
/*0x683a*/      bhs jump_6830
/*0x683c*/      pop {r4, pc}

/*0x683e*/  .byte 0x00
/*0x683f*/  .byte 0x00

            data_6840:
/*0x6840*/  .word 0x20000268


            .thumb_func
            call_6844:
/*0x6844*/      push {r4, r5, lr}
/*0x6846*/      ldr r3, [pc, #0x18] /* data_6860 */
/*0x6848*/      subw r4, r3, #0x109
/*0x684c*/      b jump_6858
            jump_684e:
/*0x684e*/      ldrb r2, [r1, #1]
/*0x6850*/      ldrb r5, [r1], #2
/*0x6854*/      ldrb r5, [r4, r5]
/*0x6856*/      strb r2, [r3, r5]
            jump_6858:
/*0x6858*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x685a*/      uxtb r0, r0
/*0x685c*/      bhs jump_684e
/*0x685e*/      pop {r4, r5, pc}

            data_6860:
/*0x6860*/  .word 0x200001f9


            .thumb_func
            call_6864:
/*0x6864*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x6868*/      ldr.w sb, [pc, #0x5c] /* data_68c8 */
/*0x686c*/      ldr.w ip, [pc, #0x5c] /* data_68cc */
/*0x6870*/      movs r5, #0
/*0x6872*/      sub.w r8, sb, #0x150
            jump_6876:
/*0x6876*/      ldr r7, [pc, #0x54] /* data_68cc */
/*0x6878*/      movs r4, #0x10
/*0x687a*/      movs r3, #0
/*0x687c*/      add.w r0, sb, r5, lsl #5
/*0x6880*/      adds r7, #0x44
            jump_6882:
/*0x6882*/      ldrb.w r1, [ip, r3]
/*0x6886*/      rsb r1, r1, r1, lsl #3
/*0x688a*/      add.w r1, r8, r1, lsl #4
/*0x688e*/      adds r2, r1, r5
/*0x6890*/      movs r1, #5
/*0x6892*/      b jump_68a8
            jump_6894:
/*0x6894*/      ldrb r6, [r2], #8
/*0x6898*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x689a*/      ands r4, r4, #0xff
/*0x689e*/      ldrh.w r6, [r7, r6, lsl #1]
/*0x68a2*/      strh r6, [r0]
/*0x68a4*/      beq jump_68c2
/*0x68a6*/      .short 0x1c80 /* adds r0, r0, #2 */ 
            jump_68a8:
/*0x68a8*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x68aa*/      uxtb r1, r1
/*0x68ac*/      bhs jump_6894
/*0x68ae*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x68b0*/      uxtb r3, r3
/*0x68b2*/      cmp r3, #3
/*0x68b4*/      blo jump_6882
/*0x68b6*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x68b8*/      uxtb r5, r5
/*0x68ba*/      cmp r5, #8
/*0x68bc*/      blo jump_6876
/*0x68be*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_68c2:
/*0x68c2*/      movs r4, #0x10
/*0x68c4*/      subs r0, #0x1c
/*0x68c6*/      b jump_68a8

            data_68c8:
/*0x68c8*/  .word 0x200003c8
            data_68cc:
/*0x68cc*/  .word 0x0000877c /* possible pointer */


            .thumb_func
            call_68d0:
/*0x68d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x68d4*/      movs r1, #0
/*0x68d6*/      mov.w r2, #0x20000
/*0x68da*/      mov.w r0, #0x70000
/*0x68de*/      movs r3, #1
/*0x68e0*/      bl call_39a8
/*0x68e4*/      movw r1, #0xea60
/*0x68e8*/      ldr r0, [pc, #0x90] /* data_697c */
/*0x68ea*/      bl call_37f6
/*0x68ee*/      ldr r4, [pc, #0x90] /* data_6980 */
/*0x68f0*/      movs r1, #2
/*0x68f2*/      mov r0, r4
/*0x68f4*/      bl call_4724
/*0x68f8*/      movs r2, #0
/*0x68fa*/      movs r1, #2
/*0x68fc*/      mov r0, r4
/*0x68fe*/      bl call_46ec
/*0x6902*/      movs r2, #1
/*0x6904*/      movs r1, #2
/*0x6906*/      mov r0, r4
/*0x6908*/      bl call_46bc
/*0x690c*/      movs r1, #4
/*0x690e*/      mov r0, r4
/*0x6910*/      bl call_4724
/*0x6914*/      ldr r6, [pc, #0x6c] /* data_6984 */
/*0x6916*/      mov.w r5, #0x4000
/*0x691a*/      mov r1, r5
/*0x691c*/      mov r0, r6
/*0x691e*/      bl call_4724
/*0x6922*/      lsls r7, r5, #1
/*0x6924*/      mov r1, r7
/*0x6926*/      mov r0, r6
/*0x6928*/      bl call_4724
/*0x692c*/      movs r2, #0
/*0x692e*/      movs r1, #4
/*0x6930*/      mov r0, r4
/*0x6932*/      bl call_46ec
/*0x6936*/      movs r2, #0
/*0x6938*/      mov r1, r5
/*0x693a*/      mov r0, r6
/*0x693c*/      bl call_46ec
/*0x6940*/      movs r2, #0
/*0x6942*/      mov r1, r7
/*0x6944*/      mov r0, r6
/*0x6946*/      bl call_46ec
/*0x694a*/      movs r2, #1
/*0x694c*/      movs r1, #4
/*0x694e*/      mov r0, r4
/*0x6950*/      bl call_46bc
/*0x6954*/      movs r2, #1
/*0x6956*/      mov r1, r5
/*0x6958*/      mov r0, r6
/*0x695a*/      bl call_46bc
/*0x695e*/      movs r2, #1
/*0x6960*/      mov r1, r7
/*0x6962*/      mov r0, r6
/*0x6964*/      bl call_46bc
/*0x6968*/      movs r2, #1
/*0x696a*/      mov r1, r2
/*0x696c*/      ldr r0, [pc, #0x18] /* data_6988 */
/*0x696e*/      bl call_46dc
/*0x6972*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6976*/      b.w jump_7c38

/*0x697a*/  .byte 0x00
/*0x697b*/  .byte 0x00

            data_697c:
/*0x697c*/  .word 0x40077000
            data_6980:
/*0x6980*/  .word 0x400b4000
            data_6984:
/*0x6984*/  .word 0x400b0000
            data_6988:
/*0x6988*/  .word 0x400b2000


            .thumb_func
            call_698c:
/*0x698c*/      push {r4, r5, r6, lr}
/*0x698e*/      ldr r4, [pc, #0x84] /* data_6a14 */
/*0x6990*/      movs r1, #0
/*0x6992*/      mov r0, r4
/*0x6994*/      bl call_37e2
/*0x6998*/      movs r1, #0
/*0x699a*/      mov r0, r4
/*0x699c*/      bl call_37ce
/*0x69a0*/      mov r0, r4
/*0x69a2*/      bl call_37c0
/*0x69a6*/      ldr r1, [pc, #0x70] /* data_6a18 */
/*0x69a8*/      asrs r0, r4, #0x14
/*0x69aa*/      str.w r0, [r1, #0x180]
/*0x69ae*/      movs r1, #0
/*0x69b0*/      ldr r0, [pc, #0x68] /* data_6a1c */
/*0x69b2*/      bl call_4732
/*0x69b6*/      ldr r6, [pc, #0x68] /* data_6a20 */
/*0x69b8*/      movs r0, #2
/*0x69ba*/      str r0, [r6, #0x24]
/*0x69bc*/      ldr r4, [pc, #0x64] /* data_6a24 */
/*0x69be*/      movs r5, #8
/*0x69c0*/      b jump_69e8
            jump_69c2:
/*0x69c2*/      ldrh r0, [r4, #4]
/*0x69c4*/      movs r2, #0
/*0x69c6*/      uxth r1, r0
/*0x69c8*/      ldr r0, [r4]
/*0x69ca*/      bl call_46bc
/*0x69ce*/      ldrh r0, [r4, #4]
/*0x69d0*/      movs r2, #1
/*0x69d2*/      uxth r1, r0
/*0x69d4*/      ldr r0, [r4]
/*0x69d6*/      bl call_46dc
/*0x69da*/      ldrh r0, [r4, #4]
/*0x69dc*/      movs r2, #2
/*0x69de*/      uxth r1, r0
/*0x69e0*/      ldr r0, [r4]
/*0x69e2*/      bl call_46fc
/*0x69e6*/      adds r4, #8
            jump_69e8:
/*0x69e8*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x69ea*/      uxtb r5, r5
/*0x69ec*/      bhs jump_69c2
/*0x69ee*/      movs r2, #1
/*0x69f0*/      movs r1, #4
/*0x69f2*/      mov r0, r6
/*0x69f4*/      bl call_46ec
/*0x69f8*/      ldr r4, [pc, #0x2c] /* data_6a28 */
/*0x69fa*/      movs r2, #1
/*0x69fc*/      lsls r1, r2, #0xe
/*0x69fe*/      mov r0, r4
/*0x6a00*/      bl call_46ec
/*0x6a04*/      mov r0, r4
/*0x6a06*/      pop.w {r4, r5, r6, lr}
/*0x6a0a*/      movs r2, #1
/*0x6a0c*/      lsls r1, r2, #0xf
/*0x6a0e*/      b.w call_46ec

/*0x6a12*/  .byte 0x00
/*0x6a13*/  .byte 0x00

            data_6a14:
/*0x6a14*/  .word 0x40077000
            data_6a18:
/*0x6a18*/  .word 0xe000e004
            data_6a1c:
/*0x6a1c*/  .word 0x4006f000
            data_6a20:
/*0x6a20*/  .word 0x400b4000
            data_6a24:
/*0x6a24*/  .word 0x00008780 /* possible pointer */
            data_6a28:
/*0x6a28*/  .word 0x400b0000


            .thumb_func
            call_6a2c:
/*0x6a2c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6a30*/      ldr r4, [pc, #0xcc] /* data_6b00 */
/*0x6a32*/      movs r5, #8
/*0x6a34*/      b jump_6a5a
            jump_6a36:
/*0x6a36*/      ldrh r0, [r4, #4]
/*0x6a38*/      uxth r1, r0
/*0x6a3a*/      ldr r0, [r4]
/*0x6a3c*/      bl call_4724
/*0x6a40*/      ldrh r0, [r4, #4]
/*0x6a42*/      movs r2, #1
/*0x6a44*/      uxth r1, r0
/*0x6a46*/      ldr r0, [r4]
/*0x6a48*/      bl call_46ec
/*0x6a4c*/      ldrh r0, [r4, #4]
/*0x6a4e*/      movs r2, #1
/*0x6a50*/      uxth r1, r0
/*0x6a52*/      ldr r0, [r4]
/*0x6a54*/      bl call_46bc
/*0x6a58*/      adds r4, #8
            jump_6a5a:
/*0x6a5a*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6a5c*/      uxtb r5, r5
/*0x6a5e*/      bhs jump_6a36
/*0x6a60*/      ldr r5, [pc, #0xa0] /* data_6b04 */
/*0x6a62*/      movs r1, #4
/*0x6a64*/      mov r0, r5
/*0x6a66*/      bl call_4724
/*0x6a6a*/      ldr r6, [pc, #0x9c] /* data_6b08 */
/*0x6a6c*/      mov.w r7, #0x4000
/*0x6a70*/      mov r1, r7
/*0x6a72*/      mov r0, r6
/*0x6a74*/      bl call_4724
/*0x6a78*/      lsls r4, r7, #1
/*0x6a7a*/      mov r1, r4
/*0x6a7c*/      mov r0, r6
/*0x6a7e*/      bl call_4724
/*0x6a82*/      movs r2, #0
/*0x6a84*/      movs r1, #4
/*0x6a86*/      mov r0, r5
/*0x6a88*/      bl call_46ec
/*0x6a8c*/      movs r2, #0
/*0x6a8e*/      mov r1, r7
/*0x6a90*/      mov r0, r6
/*0x6a92*/      bl call_46ec
/*0x6a96*/      movs r2, #0
/*0x6a98*/      mov r1, r4
/*0x6a9a*/      mov r0, r6
/*0x6a9c*/      bl call_46ec
/*0x6aa0*/      movw r0, #0x2710
/*0x6aa4*/      bl spin_wait /* (time) */
/*0x6aa8*/      movs r0, #2
/*0x6aaa*/      str r0, [r5, #0x28]
/*0x6aac*/      lsls r1, r0, #7
/*0x6aae*/      ldr r0, [pc, #0x5c] /* data_6b0c */
/*0x6ab0*/      bl mem_zero /* (dest, size) */
/*0x6ab4*/      ldr r1, [pc, #0x58] /* data_6b10 */
/*0x6ab6*/      movs r0, #0
/*0x6ab8*/      strb r0, [r1, #1]
/*0x6aba*/      movs r0, #0x64
/*0x6abc*/      bl spin_wait /* (time) */
/*0x6ac0*/      bl call_6b60
/*0x6ac4*/      movs r0, #2
/*0x6ac6*/      bl call_7c8c
/*0x6aca*/      str r4, [r6, #0x24]
/*0x6acc*/      movs r1, #1
/*0x6ace*/      ldr r0, [pc, #0x44] /* data_6b14 */
/*0x6ad0*/      bl call_4732
/*0x6ad4*/      ldr r4, [pc, #0x40] /* data_6b18 */
/*0x6ad6*/      movs r1, #0
/*0x6ad8*/      mov r0, r4
/*0x6ada*/      bl call_37fa
/*0x6ade*/      mov r0, r4
/*0x6ae0*/      bl call_37c0
/*0x6ae4*/      movs r1, #1
/*0x6ae6*/      mov r0, r4
/*0x6ae8*/      bl call_37ce
/*0x6aec*/      movs r1, #1
/*0x6aee*/      mov r0, r4
/*0x6af0*/      bl call_37e2
/*0x6af4*/      ldr r1, [pc, #0x24] /* data_6b1c */
/*0x6af6*/      asrs r0, r4, #0x14
/*0x6af8*/      str.w r0, [r1, #0x100]
/*0x6afc*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6b00:
/*0x6b00*/  .word 0x00008780 /* possible pointer */
            data_6b04:
/*0x6b04*/  .word 0x400b4000
            data_6b08:
/*0x6b08*/  .word 0x400b0000
            data_6b0c:
/*0x6b0c*/  .word 0x200003c8
            data_6b10:
/*0x6b10*/  .word 0x20000020
            data_6b14:
/*0x6b14*/  .word 0x4006f000
            data_6b18:
/*0x6b18*/  .word 0x40077000
            data_6b1c:
/*0x6b1c*/  .word 0xe000e004


            .thumb_func
            call_6b20:
/*0x6b20*/      push {r4, r5, lr}
/*0x6b22*/      movs r0, #0x12
/*0x6b24*/      bl call_7c8c
/*0x6b28*/      movs r1, #2
/*0x6b2a*/      movs r0, #0
/*0x6b2c*/      bl call_7cbc
/*0x6b30*/      ldr r4, [pc, #0x24] /* data_6b58 */
/*0x6b32*/      mov.w r0, #0x4000
/*0x6b36*/      str r0, [r4, #0x28]
/*0x6b38*/      lsls r5, r0, #1
/*0x6b3a*/      str r5, [r4, #0x24]
/*0x6b3c*/      movs r1, #8
/*0x6b3e*/      mov.w r0, #0xc00
/*0x6b42*/      bl call_7cbc
/*0x6b46*/      ldr r1, [pc, #0x14] /* data_6b5c */
/*0x6b48*/      movs r0, #4
/*0x6b4a*/      str r0, [r1, #0x24]
/*0x6b4c*/      str r5, [r4, #0x28]
/*0x6b4e*/      nop 
/*0x6b50*/      nop 
/*0x6b52*/      str r5, [r4, #0x24]
/*0x6b54*/      pop {r4, r5, pc}

/*0x6b56*/  .byte 0x00
/*0x6b57*/  .byte 0x00

            data_6b58:
/*0x6b58*/  .word 0x400b0000
            data_6b5c:
/*0x6b5c*/  .word 0x400b4000


            .thumb_func
            call_6b60:
/*0x6b60*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x6b64*/      ldr r1, [pc, #0x70] /* data_6bd8 */
/*0x6b66*/      ldr r0, [pc, #0x6c] /* data_6bd4 */
/*0x6b68*/      movs r4, #0x10
/*0x6b6a*/      ldrb r2, [r1, #1]
/*0x6b6c*/      movs r6, #4
/*0x6b6e*/      add.w r5, r0, r2, lsl #5
/*0x6b72*/      ldrb r0, [r1]
/*0x6b74*/      ldr r7, [pc, #0x64] /* data_6bdc */
/*0x6b76*/      ldr.w fp, [pc, #0x68] /* data_6be0 */
/*0x6b7a*/      adds r5, #0x1e
/*0x6b7c*/      cbz r0, jump_6b8c
/*0x6b7e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6b80*/      ands r0, r0, #0xff
/*0x6b84*/      strb r0, [r1]
/*0x6b86*/      bne jump_6b8c
/*0x6b88*/      bl call_6b20
            jump_6b8c:
/*0x6b8c*/      mov sb, r6
/*0x6b8e*/      mov r6, fp
/*0x6b90*/      mov.w r8, #0x8000
/*0x6b94*/      mov sl, r7
/*0x6b96*/      mov.w fp, #0x4000
            jump_6b9a:
/*0x6b9a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6b9c*/      uxtb r4, r4
/*0x6b9e*/      blo jump_6bcc
/*0x6ba0*/      str.w r8, [r6, #0x28]
/*0x6ba4*/      ldrh r0, [r5], #-2
/*0x6ba8*/      movs r1, #9
/*0x6baa*/      ubfx r7, r0, #6, #1
/*0x6bae*/      bl call_7cbc
/*0x6bb2*/      mov r0, fp
/*0x6bb4*/      str.w fp, [r6, #0x28]
/*0x6bb8*/      str.w r8, [r6, #0x24]
/*0x6bbc*/      mov r1, sb
/*0x6bbe*/      mov r2, sl
/*0x6bc0*/      cbz r7, jump_6bc6
/*0x6bc2*/      str r1, [r2, #0x24]
/*0x6bc4*/      b jump_6bc8
            jump_6bc6:
/*0x6bc6*/      str r1, [r2, #0x28]
            jump_6bc8:
/*0x6bc8*/      str r0, [r6, #0x24]
/*0x6bca*/      b jump_6b9a
            jump_6bcc:
/*0x6bcc*/      str.w sb, [sl, #0x24]
/*0x6bd0*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

            data_6bd4:
/*0x6bd4*/  .word 0x200003c8
            data_6bd8:
/*0x6bd8*/  .word 0x20000020
            data_6bdc:
/*0x6bdc*/  .word 0x400b4000
            data_6be0:
/*0x6be0*/  .word 0x400b0000


            .thumb_func
            call_6be4:
/*0x6be4*/      cmp r1, #0
/*0x6be6*/      ldr r1, [r0]
/*0x6be8*/      beq jump_6bf0
/*0x6bea*/      orr r1, r1, #1
/*0x6bee*/      b jump_6bf4
            jump_6bf0:
/*0x6bf0*/      bic r1, r1, #1
            jump_6bf4:
/*0x6bf4*/      str r1, [r0]
/*0x6bf6*/      bx lr

            .thumb_func
            call_6bf8:
/*0x6bf8*/      push {r4, r5, lr}
/*0x6bfa*/      ldrd r4, r3, [r1, #0x14]
/*0x6bfe*/      cbz r4, jump_6c3a
/*0x6c00*/      mov.w r2, #0x200
/*0x6c04*/      lsrs r2, r3
/*0x6c06*/      orrs r2, r4
            jump_6c08:
/*0x6c08*/      ldr r4, [r1, #8]
/*0x6c0a*/      ldr r3, [r1]
/*0x6c0c*/      orrs r3, r4
/*0x6c0e*/      ldrd r4, r5, [r1, #0xc]
/*0x6c12*/      orrs r4, r5
/*0x6c14*/      orrs r3, r4
/*0x6c16*/      ldr r4, [r1, #0x1c]
/*0x6c18*/      orrs r3, r4
/*0x6c1a*/      orrs r3, r2
/*0x6c1c*/      str r3, [r0, #4]
/*0x6c1e*/      ldr r3, [r1, #0x24]
/*0x6c20*/      ldr r2, [r1, #4]
/*0x6c22*/      orrs r2, r3
/*0x6c24*/      ldr r3, [r1, #0x20]
/*0x6c26*/      orr.w r2, r2, r3, lsl #4
/*0x6c2a*/      str r2, [r0, #0x18]
/*0x6c2c*/      ldr r1, [r1, #0x28]
/*0x6c2e*/      mov.w r2, #-1
/*0x6c32*/      add.w r1, r2, r1, lsr #1
/*0x6c36*/      str r1, [r0, #0xc]
/*0x6c38*/      pop {r4, r5, pc}
            jump_6c3a:
/*0x6c3a*/      mov.w r2, #0x100
/*0x6c3e*/      lsls r2, r3
/*0x6c40*/      b jump_6c08

            .thumb_func
            call_6c42:
/*0x6c42*/      cmp r1, #0
/*0x6c44*/      ldr r1, [r0]
/*0x6c46*/      beq jump_6c4e
/*0x6c48*/      orr r1, r1, #8
/*0x6c4c*/      b jump_6c52
            jump_6c4e:
/*0x6c4e*/      bic r1, r1, #8
            jump_6c52:
/*0x6c52*/      str r1, [r0]
/*0x6c54*/      bx lr

            .thumb_func
            call_6c56:
/*0x6c56*/      push {r4, r5, r6, lr}
/*0x6c58*/      mov r5, r0
/*0x6c5a*/      bl call_4270
/*0x6c5e*/      bfi r4, r0, #0, #8
/*0x6c62*/      cbz r5, jump_6c88
/*0x6c64*/      cmp r5, #1
/*0x6c66*/      beq jump_6c74
/*0x6c68*/      cmp r5, #2
/*0x6c6a*/      bne jump_6c7a
/*0x6c6c*/      uxth r0, r4
/*0x6c6e*/      orr r4, r0, #2
/*0x6c72*/      b jump_6c7a
            jump_6c74:
/*0x6c74*/      uxth r0, r4
/*0x6c76*/      bic r4, r0, #2
            jump_6c7a:
/*0x6c7a*/      uxtb r0, r4
/*0x6c7c*/      bl call_4694
/*0x6c80*/      bl call_4270
/*0x6c84*/      bfi r4, r0, #0, #8
            jump_6c88:
/*0x6c88*/      lsls r0, r4, #0x1e
/*0x6c8a*/      bpl jump_6c90
/*0x6c8c*/      movs r0, #1
/*0x6c8e*/      pop {r4, r5, r6, pc}
            jump_6c90:
/*0x6c90*/      movs r0, #0
/*0x6c92*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6c94:
/*0x6c94*/      push {r4, lr}
/*0x6c96*/      ldr r4, [pc, #0x10] /* data_6ca8 */
/*0x6c98*/      strb r1, [r4, r0]
/*0x6c9a*/      add r0, r4
/*0x6c9c*/      strb.w r2, [r0, #0x70]
/*0x6ca0*/      strb.w r3, [r0, #0xe0]
/*0x6ca4*/      pop {r4, pc}

/*0x6ca6*/  .byte 0x00
/*0x6ca7*/  .byte 0x00

            data_6ca8:
/*0x6ca8*/  .word 0x20000278


            .thumb_func
            call_6cac:
/*0x6cac*/      ldr r0, [pc, #0x50] /* data_6d00 */
/*0x6cae*/      movs r1, #1
/*0x6cb0*/      str.w r1, [r0, #0x300]
/*0x6cb4*/      ldr r2, [pc, #0x4c] /* data_6d04 */
/*0x6cb6*/      str.w r1, [r2, #0xa8]
            jump_6cba:
/*0x6cba*/      ldr.w r3, [r2, #0x108]
/*0x6cbe*/      cmp r3, #0
/*0x6cc0*/      beq jump_6cba
/*0x6cc2*/      movs r3, #0
/*0x6cc4*/      str r3, [r2, #0x20]
/*0x6cc6*/      mov.w r3, #0x9000000
/*0x6cca*/      str r3, [r0, #0x18]
/*0x6ccc*/      str.w r1, [r2, #0xa4]
            jump_6cd0:
/*0x6cd0*/      ldr.w r3, [r2, #0x104]
/*0x6cd4*/      cmp r3, #0
/*0x6cd6*/      beq jump_6cd0
/*0x6cd8*/      ldr r2, [pc, #0x2c] /* data_6d08 */
/*0x6cda*/      ldr.w r3, [r2, #0x200]
/*0x6cde*/      bic r3, r3, #7
/*0x6ce2*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x6ce4*/      str.w r3, [r2, #0x200]
/*0x6ce8*/      str r1, [r0, #0x20]
/*0x6cea*/      ldr r2, [r0, #4]
/*0x6cec*/      bic r2, r2, #3
/*0x6cf0*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x6cf2*/      str r2, [r0, #4]
            jump_6cf4:
/*0x6cf4*/      ldr r2, [r0, #0x34]
/*0x6cf6*/      cmp.w r1, r2, lsr #30
/*0x6cfa*/      bne jump_6cf4
/*0x6cfc*/      bx lr

/*0x6cfe*/  .byte 0x00
/*0x6cff*/  .byte 0x00

            data_6d00:
/*0x6d00*/  .word 0x40088000
            data_6d04:
/*0x6d04*/  .word 0x43100000
            data_6d08:
/*0x6d08*/  .word 0x40080000


            .thumb_func
            call_6d0c:
/*0x6d0c*/      mov r3, r2
/*0x6d0e*/      cbz r0, jump_6d1e
/*0x6d10*/      cmp r0, #1
/*0x6d12*/      bne jump_6d24
/*0x6d14*/      movs r2, #4
/*0x6d16*/      movs r1, #5
            jump_6d18:
/*0x6d18*/      mov r0, r3
/*0x6d1a*/      b.w jump_665c
            jump_6d1e:
/*0x6d1e*/      movs r2, #5
/*0x6d20*/      movs r1, #0
/*0x6d22*/      b jump_6d18
            jump_6d24:
/*0x6d24*/      bx lr

/*0x6d26*/  .byte 0x00
/*0x6d27*/  .byte 0x00


            .thumb_func
            call_6d28:
/*0x6d28*/      push {r4, r5, r6, r7, lr}
/*0x6d2a*/      ldr r7, [pc, #0x48] /* data_6d74 */
/*0x6d2c*/      ldr.w ip, [pc, #0x40] /* data_6d70 */
/*0x6d30*/      movs r5, #0
/*0x6d32*/      add.w r6, r7, r0, lsl #1
            jump_6d36:
/*0x6d36*/      rsb r2, r5, r5, lsl #3
/*0x6d3a*/      ldrb.w r3, [r7, r0, lsl #1]
/*0x6d3e*/      add.w r2, ip, r2, lsl #4
/*0x6d42*/      add.w r2, r2, r3, lsl #3
/*0x6d46*/      ldrb r4, [r6, #1]
/*0x6d48*/      b jump_6d5e
            jump_6d4a:
/*0x6d4a*/      movs r3, #6
/*0x6d4c*/      b jump_6d56
            jump_6d4e:
/*0x6d4e*/      ldrb lr, [r2], #1
/*0x6d52*/      strb lr, [r1], #1
            jump_6d56:
/*0x6d56*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x6d58*/      uxtb r3, r3
/*0x6d5a*/      bhs jump_6d4e
/*0x6d5c*/      .short 0x1c92 /* adds r2, r2, #2 */ 
            jump_6d5e:
/*0x6d5e*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6d60*/      uxtb r4, r4
/*0x6d62*/      bhs jump_6d4a
/*0x6d64*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x6d66*/      uxtb r5, r5
/*0x6d68*/      cmp r5, #3
/*0x6d6a*/      blo jump_6d36
/*0x6d6c*/      movs r0, #0
/*0x6d6e*/      pop {r4, r5, r6, r7, pc}

            data_6d70:
/*0x6d70*/  .word 0x20000278
            data_6d74:
/*0x6d74*/  .word 0x0000859d /* possible pointer */


            .thumb_func
            call_6d78:
/*0x6d78*/      push {r4, r5, r6, lr}
/*0x6d7a*/      movs r4, #0
/*0x6d7c*/      sub sp, #0x48
/*0x6d7e*/      mov.w r1, #0x4300
/*0x6d82*/      movw r0, #0x2010
/*0x6d86*/      movs r3, #1
/*0x6d88*/      mov r2, r4
/*0x6d8a*/      bl call_39a8
/*0x6d8e*/      movs r0, #1
/*0x6d90*/      strh.w r0, [sp, #4]
/*0x6d94*/      strh.w r4, [sp, #8]
/*0x6d98*/      strh.w r4, [sp, #6]
/*0x6d9c*/      strh.w r4, [sp, #0xa]
/*0x6da0*/      strd r4, r0, [sp, #0x14]
/*0x6da4*/      lsls r1, r0, #8
/*0x6da6*/      mov.w r2, #0x420
/*0x6daa*/      strd r1, r2, [sp, #0x20]
/*0x6dae*/      str r4, [sp, #0x1c]
/*0x6db0*/      strd r1, r0, [sp, #0x30]
/*0x6db4*/      lsls r0, r0, #9
/*0x6db6*/      strd r4, r0, [sp, #0x38]
/*0x6dba*/      mov.w r0, #0xc80
/*0x6dbe*/      movs r4, #2
/*0x6dc0*/      movs r5, #0xff
/*0x6dc2*/      ldr r6, [pc, #0x24] /* data_6de8 */
/*0x6dc4*/      str r0, [sp, #0x40]
/*0x6dc6*/      b jump_6dde
            jump_6dc8:
/*0x6dc8*/      add.w r0, r4, r4, lsl #3
/*0x6dcc*/      add.w r0, r0, r4, lsl #4
/*0x6dd0*/      add.w r0, r6, r0, lsl #2
/*0x6dd4*/      mov r1, sp
/*0x6dd6*/      strb r5, [r0, #6]
/*0x6dd8*/      mov r0, r4
/*0x6dda*/      bl call_7cf0
            jump_6dde:
/*0x6dde*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6de0*/      uxtb r4, r4
/*0x6de2*/      bhs jump_6dc8
/*0x6de4*/      add sp, #0x48
/*0x6de6*/      pop {r4, r5, r6, pc}

            data_6de8:
/*0x6de8*/  .word 0x20001c70


            .thumb_func
            call_6dec:
/*0x6dec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6df0*/      ldr r4, [pc, #0x34] /* data_6e28 */
/*0x6df2*/      cbz r0, jump_6dfc
/*0x6df4*/      movs r7, #0
            jump_6df6:
/*0x6df6*/      movs r5, #2
/*0x6df8*/      movs r6, #1
/*0x6dfa*/      b jump_6e1e
            jump_6dfc:
/*0x6dfc*/      movs r7, #6
/*0x6dfe*/      b jump_6df6
            jump_6e00:
/*0x6e00*/      ldrb r0, [r4, #0x13]
/*0x6e02*/      mov r2, r7
/*0x6e04*/      lsl.w r1, r6, r0
/*0x6e08*/      ldrb r0, [r4, #0x12]
/*0x6e0a*/      bl call_366c
/*0x6e0e*/      ldrb r0, [r4, #0x15]
/*0x6e10*/      mov r2, r7
/*0x6e12*/      lsl.w r1, r6, r0
/*0x6e16*/      ldrb r0, [r4, #0x14]
/*0x6e18*/      bl call_366c
/*0x6e1c*/      adds r4, #0x18
            jump_6e1e:
/*0x6e1e*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e20*/      uxtb r5, r5
/*0x6e22*/      bhs jump_6e00
/*0x6e24*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6e28:
/*0x6e28*/  .word 0x00008d18 /* possible pointer */


            .thumb_func
            call_6e2c:
/*0x6e2c*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x6e30*/      ldr.w sb, [pc, #0x168] /* data_6f9c */
/*0x6e34*/      movs r4, #2
/*0x6e36*/      add.w sl, sb, #0x200
/*0x6e3a*/      sub.w fp, sb, #4
/*0x6e3e*/      b jump_6f90
            jump_6e40:
/*0x6e40*/      ldr r1, [pc, #0x15c] /* data_6fa0 */
/*0x6e42*/      add.w r0, r4, r4, lsl #1
/*0x6e46*/      add.w r5, r1, r0, lsl #3
/*0x6e4a*/      add.w r0, r4, r4, lsl #3
/*0x6e4e*/      ldr r1, [pc, #0x154] /* data_6fa4 */
/*0x6e50*/      add.w r0, r0, r4, lsl #4
/*0x6e54*/      add.w r6, r1, r0, lsl #2
/*0x6e58*/      ldrb r0, [r5, #0x11]
/*0x6e5a*/      movs r1, #0x11
/*0x6e5c*/      bl call_61c8
/*0x6e60*/      cbz r0, jump_6e6a
/*0x6e62*/      ldrb r0, [r5, #0x11]
/*0x6e64*/      movs r1, #0x11
/*0x6e66*/      bl call_6144
            jump_6e6a:
/*0x6e6a*/      ldrb r0, [r5, #0x10]
/*0x6e6c*/      movs r1, #0x11
/*0x6e6e*/      bl call_61c8
/*0x6e72*/      cbz r0, jump_6e88
/*0x6e74*/      ldrb r0, [r5, #0x10]
/*0x6e76*/      movs r1, #0x11
/*0x6e78*/      bl call_6144
/*0x6e7c*/      movs r0, #0xff
/*0x6e7e*/      strb r0, [r6, #6]
/*0x6e80*/      movs r1, #0
/*0x6e82*/      ldr r0, [r5, #4]
/*0x6e84*/      bl call_7044
            jump_6e88:
/*0x6e88*/      ldrb r0, [r6, #6]
/*0x6e8a*/      cmp r0, #0xff
/*0x6e8c*/      bne jump_6edc
/*0x6e8e*/      add.w r1, r6, #8
/*0x6e92*/      mov r0, r4
/*0x6e94*/      bl call_6d28
/*0x6e98*/      strb r0, [r6, #6]
/*0x6e9a*/      cmp r0, #0xff
/*0x6e9c*/      beq jump_6edc
/*0x6e9e*/      ldr r1, [pc, #0x100] /* data_6fa0 */
/*0x6ea0*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x6ea2*/      add r1, r4
/*0x6ea4*/      ldrb r7, [r0, r1]
/*0x6ea6*/      mvns r0, r0
/*0x6ea8*/      strb r0, [r6, #7]
/*0x6eaa*/      adds r2, r7, #2
/*0x6eac*/      adds r1, r6, #6
/*0x6eae*/      movs r0, #0
/*0x6eb0*/      bl call_39e0
/*0x6eb4*/      strh r0, [r6, #2]!
/*0x6eb8*/      mvns r0, r0
/*0x6eba*/      strh r0, [r6, #2]
/*0x6ebc*/      ldr r0, [r5, #8]
/*0x6ebe*/      str r6, [r0, #-0xc]
/*0x6ec2*/      ldr r0, [pc, #0xe4] /* data_6fa8 */
/*0x6ec4*/      ldr r1, [r5, #8]
/*0x6ec6*/      add.w r0, r0, r7, lsl #16
/*0x6eca*/      str r0, [r1]
/*0x6ecc*/      ldrb r0, [r5, #0x10]
/*0x6ece*/      movs r1, #1
/*0x6ed0*/      bl call_61a0
/*0x6ed4*/      movs r1, #1
/*0x6ed6*/      ldr r0, [r5, #4]
/*0x6ed8*/      bl call_7044
            jump_6edc:
/*0x6edc*/      ldr r0, [r5, #0xc]
/*0x6ede*/      ldr r0, [r0]
/*0x6ee0*/      movs r1, #0
/*0x6ee2*/      sub.w r0, r1, r0, lsr #16
/*0x6ee6*/      ldrb.w r1, [fp, r4]
/*0x6eea*/      mov r6, fp
/*0x6eec*/      subs r0, r0, r1
/*0x6eee*/      uxtb r3, r0
/*0x6ef0*/      cmp r3, #6
/*0x6ef2*/      blo jump_6f90
/*0x6ef4*/      mov r8, sl
            jump_6ef6:
/*0x6ef6*/      mov r1, r8
/*0x6ef8*/      adds r0, r1, #2
/*0x6efa*/      ldrb r5, [r6, r4]
/*0x6efc*/      movs r2, #6
/*0x6efe*/      add.w r7, sb, r4, lsl #8
/*0x6f02*/      b jump_6f10
            jump_6f04:
/*0x6f04*/      ldrb.w ip, [r7, r5]
/*0x6f08*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x6f0a*/      strb ip, [r0], #1
/*0x6f0e*/      uxtb r5, r5
            jump_6f10:
/*0x6f10*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6f12*/      uxtb r2, r2
/*0x6f14*/      bhs jump_6f04
/*0x6f16*/      ldrh r2, [r1, #2]
/*0x6f18*/      ldrh.w ip, [r1, #4]
/*0x6f1c*/      add r2, ip
/*0x6f1e*/      sub.w ip, r2, #0xff00
/*0x6f22*/      subs.w ip, ip, #0xff
/*0x6f26*/      bne jump_6f32
/*0x6f28*/      ldrb r2, [r1, #6]
/*0x6f2a*/      ldrb r1, [r1, #7]
/*0x6f2c*/      add r1, r2
/*0x6f2e*/      cmp r1, #0xff
/*0x6f30*/      beq jump_6f42
            jump_6f32:
/*0x6f32*/      ldrb r0, [r6, r4]
/*0x6f34*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x6f36*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6f38*/      uxtb r3, r3
/*0x6f3a*/      strb r0, [r6, r4]
/*0x6f3c*/      cmp r3, #6
/*0x6f3e*/      bhs jump_6ef6
/*0x6f40*/      b jump_6f90
            jump_6f42:
/*0x6f42*/      cmp r3, #6
/*0x6f44*/      blo jump_6f90
/*0x6f46*/      ldr r2, [pc, #0x58] /* data_6fa0 */
/*0x6f48*/      ldrb.w r1, [r8, #6]
/*0x6f4c*/      .short 0x1e92 /* subs r2, r2, #2 */ 
/*0x6f4e*/      add r2, r4
/*0x6f50*/      ldrb r2, [r1, r2]
/*0x6f52*/      adds r1, r2, #6
/*0x6f54*/      cmp r3, r1
/*0x6f56*/      blo jump_6f90
/*0x6f58*/      mov r1, r2
/*0x6f5a*/      b jump_6f66
            jump_6f5c:
/*0x6f5c*/      ldrb r3, [r7, r5]
/*0x6f5e*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x6f60*/      strb r3, [r0], #1
/*0x6f64*/      uxtb r5, r5
            jump_6f66:
/*0x6f66*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6f68*/      uxtb r1, r1
/*0x6f6a*/      bhs jump_6f5c
/*0x6f6c*/      add.w r1, r8, #6
/*0x6f70*/      movs r0, #0
/*0x6f72*/      .short 0x1c92 /* adds r2, r2, #2 */ 
/*0x6f74*/      bl call_39e0
/*0x6f78*/      ldrh.w r1, [r8, #2]
/*0x6f7c*/      cmp r0, r1
/*0x6f7e*/      bne jump_6f8e
/*0x6f80*/      ldr r2, [pc, #0x20] /* data_6fa4 */
/*0x6f82*/      ldrb.w r1, [r8, #6]
/*0x6f86*/      subs r2, #8
/*0x6f88*/      mov r0, r4
/*0x6f8a*/      bl call_6d0c
            jump_6f8e:
/*0x6f8e*/      strb r5, [r6, r4]
            jump_6f90:
/*0x6f90*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6f92*/      uxtb r4, r4
/*0x6f94*/      bhs.w jump_6e40
/*0x6f98*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_6f9c:
/*0x6f9c*/  .word 0x20001a60
            data_6fa0:
/*0x6fa0*/  .word 0x00008d18 /* possible pointer */
            data_6fa4:
/*0x6fa4*/  .word 0x20001c70
            data_6fa8:
/*0x6fa8*/  .word 0x00060001


            .thumb_func
            call_6fac:
/*0x6fac*/      push {r4, r5, r6, lr}
/*0x6fae*/      mov r4, r0
/*0x6fb0*/      mov r5, r1
/*0x6fb2*/      ldrh r0, [r1, #6]
/*0x6fb4*/      ldrh r1, [r1, #4]
/*0x6fb6*/      ldr r2, [r4, #0x10]
/*0x6fb8*/      orrs r0, r1
/*0x6fba*/      ldrh r1, [r5, #8]
/*0x6fbc*/      bic r2, r2, #0x1f
/*0x6fc0*/      orrs r1, r2
/*0x6fc2*/      orrs r0, r1
/*0x6fc4*/      str r0, [r4, #0x10]
/*0x6fc6*/      ldr r0, [r4, #0x24]
/*0x6fc8*/      ldrh r1, [r5, #0xa]
/*0x6fca*/      bic r0, r0, #3
/*0x6fce*/      orrs r0, r1
/*0x6fd0*/      str r0, [r4, #0x24]
/*0x6fd2*/      cmp.w r4, #0x40000000
/*0x6fd6*/      beq jump_6fee
/*0x6fd8*/      ldr r0, [pc, #0x24] /* data_7000 */
/*0x6fda*/      cmp r4, r0
/*0x6fdc*/      bne jump_6ff2
/*0x6fde*/      movs r0, #0x1a
            jump_6fe0:
/*0x6fe0*/      bl call_3974
/*0x6fe4*/      ldr r1, [r5]
/*0x6fe6*/      udiv r0, r0, r1
/*0x6fea*/      str r0, [r4, #0x38]
/*0x6fec*/      pop {r4, r5, r6, pc}
            jump_6fee:
/*0x6fee*/      movs r0, #0x18
/*0x6ff0*/      b jump_6fe0
            jump_6ff2:
/*0x6ff2*/      ldr r0, [pc, #0x10] /* data_7004 */
/*0x6ff4*/      cmp r4, r0
/*0x6ff6*/      bne jump_6ffc
/*0x6ff8*/      movs r0, #0x1c
/*0x6ffa*/      b jump_6fe0
            jump_6ffc:
/*0x6ffc*/      movs r0, #0x1e
/*0x6ffe*/      b jump_6fe0

            data_7000:
/*0x7000*/  .word 0x40040000
            data_7004:
/*0x7004*/  .word 0x40001000


            .thumb_func
            call_7008:
/*0x7008*/      cmp r1, #0
/*0x700a*/      ldr r1, [r0, #0xc]
/*0x700c*/      beq jump_7014
/*0x700e*/      orr r1, r1, #0x200
/*0x7012*/      b jump_7018
            jump_7014:
/*0x7014*/      bic r1, r1, #0x200
            jump_7018:
/*0x7018*/      str r1, [r0, #0xc]
/*0x701a*/      bx lr

            .thumb_func
            call_701c:
/*0x701c*/      cmp r1, #0
/*0x701e*/      ldr r1, [r0, #0x24]
/*0x7020*/      beq jump_7028
/*0x7022*/      orr r1, r1, #0x20
/*0x7026*/      b jump_702c
            jump_7028:
/*0x7028*/      bic r1, r1, #0x20
            jump_702c:
/*0x702c*/      str r1, [r0, #0x24]
/*0x702e*/      bx lr

            .thumb_func
            call_7030:
/*0x7030*/      cmp r1, #0
/*0x7032*/      ldr r1, [r0, #0xc]
/*0x7034*/      beq jump_703c
/*0x7036*/      orr r1, r1, #0x100
/*0x703a*/      b jump_7040
            jump_703c:
/*0x703c*/      bic r1, r1, #0x100
            jump_7040:
/*0x7040*/      str r1, [r0, #0xc]
/*0x7042*/      bx lr

            .thumb_func
            call_7044:
/*0x7044*/      cmp r1, #0
/*0x7046*/      ldr r1, [r0, #0x24]
/*0x7048*/      beq jump_7050
/*0x704a*/      orr r1, r1, #0x10
/*0x704e*/      b jump_7054
            jump_7050:
/*0x7050*/      bic r1, r1, #0x10
            jump_7054:
/*0x7054*/      str r1, [r0, #0x24]
/*0x7056*/      bx lr

            .thumb_func
            call_7058:
/*0x7058*/      ldr r0, [pc, #0x18] /* data_7074 */
/*0x705a*/      movs r1, #0
/*0x705c*/      add.w r2, r0, #8
/*0x7060*/      str r1, [r0, #0x1c]
/*0x7062*/      str r1, [r0, #0x20]
/*0x7064*/      strb r1, [r2, #1]
/*0x7066*/      str.w r1, [r0, #0x15]
/*0x706a*/      movs r1, #0x1d
/*0x706c*/      ldr r0, [pc, #8] /* data_7078 */
/*0x706e*/      b.w mem_zero /* (dest, size) */

/*0x7072*/  .byte 0x00
/*0x7073*/  .byte 0x00

            data_7074:
/*0x7074*/  .word 0x20000028
            data_7078:
/*0x7078*/  .word 0x200004e2


            .thumb_func
            call_707c:
/*0x707c*/      push {r4, lr}
/*0x707e*/      ldr r0, [pc, #0x20] /* data_70a0 */
/*0x7080*/      ldr r1, [pc, #0x1c] /* data_70a0 */
/*0x7082*/      movs r4, #1
/*0x7084*/      strb r4, [r0]
/*0x7086*/      adds r1, #0xc
/*0x7088*/      movs r0, #2
/*0x708a*/      strb r0, [r1]
/*0x708c*/      ldr r1, [pc, #0x14] /* data_70a4 */
/*0x708e*/      movs r0, #4
/*0x7090*/      strb r0, [r1]
/*0x7092*/      bl call_7058
/*0x7096*/      ldr r0, [pc, #8] /* data_70a0 */
/*0x7098*/      subs r0, #8
/*0x709a*/      strb r4, [r0, #5]
/*0x709c*/      pop {r4, pc}

/*0x709e*/  .byte 0x00
/*0x709f*/  .byte 0x00

            data_70a0:
/*0x70a0*/  .word 0x20000030
            data_70a4:
/*0x70a4*/  .word 0x200004e0


            .thumb_func
            call_70a8:
/*0x70a8*/      ldrb.w r0, [r0, #0x34]
/*0x70ac*/      ubfx r0, r0, #1, #1
/*0x70b0*/      bx lr

/*0x70b2*/  .byte 0x00
/*0x70b3*/  .byte 0x00

            jump_70b4:
/*0x70b4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x70b8*/      mov r4, r0
/*0x70ba*/      bl call_74f8
/*0x70be*/      mov r5, r0
/*0x70c0*/      ldr r6, [pc, #0x158] /* data_721c */
/*0x70c2*/      lsls r0, r0, #0x1e
/*0x70c4*/      bpl jump_70d2
/*0x70c6*/      ldr r0, [r6, #4]
/*0x70c8*/      cbz r0, jump_70cc
/*0x70ca*/      blx r0
            jump_70cc:
/*0x70cc*/      movs r0, #2
/*0x70ce*/      bl call_7254
            jump_70d2:
/*0x70d2*/      lsls r0, r5, #0x1b
/*0x70d4*/      bpl jump_70f6
/*0x70d6*/      movs r0, #0x10
/*0x70d8*/      bl call_7254
/*0x70dc*/      ldrb.w r0, [r4, #0x32]
/*0x70e0*/      cmp r0, #2
/*0x70e2*/      blo jump_70f6
/*0x70e4*/      bl call_750c
/*0x70e8*/      ldrb.w r0, [r4, #0x32]
/*0x70ec*/      strb.w r0, [r4, #0x33]
/*0x70f0*/      movs r0, #3
/*0x70f2*/      strb.w r0, [r4, #0x32]
            jump_70f6:
/*0x70f6*/      lsls r0, r5, #0x1d
/*0x70f8*/      mov.w r7, #0
/*0x70fc*/      bpl jump_7142
/*0x70fe*/      subs r0, r7, #1
/*0x7100*/      str r0, [r4, #0x20]
/*0x7102*/      strb.w r7, [r4, #0x30]
/*0x7106*/      strb.w r7, [r4, #0x31]
/*0x710a*/      ldrb.w r0, [r4, #0x34]
/*0x710e*/      bic r0, r0, #2
/*0x7112*/      strb.w r0, [r4, #0x34]
/*0x7116*/      movs r0, #4
/*0x7118*/      strb.w r0, [r4, #0x32]
/*0x711c*/      str r7, [r4, #0x38]
/*0x711e*/      bl call_7304
/*0x7122*/      bl call_751c
/*0x7126*/      ldr r1, [pc, #0xf8] /* data_7220 */
/*0x7128*/      movs r0, #0
/*0x712a*/      bl call_73c0
/*0x712e*/      ldr r0, [pc, #0xf0] /* data_7220 */
/*0x7130*/      ldr r0, [r0]
/*0x7132*/      bl call_74c8
/*0x7136*/      ldr r0, [r6]
/*0x7138*/      cbz r0, jump_713c
/*0x713a*/      blx r0
            jump_713c:
/*0x713c*/      movs r0, #4
/*0x713e*/      bl call_7254
            jump_7142:
/*0x7142*/      lsls r0, r5, #0x1c
/*0x7144*/      bpl jump_7158
/*0x7146*/      bl call_751c
/*0x714a*/      ldrb.w r0, [r4, #0x33]
/*0x714e*/      strb.w r0, [r4, #0x32]
/*0x7152*/      movs r0, #8
/*0x7154*/      bl call_7254
            jump_7158:
/*0x7158*/      lsls r0, r5, #0x17
/*0x715a*/      mov.w r8, #0x100
/*0x715e*/      bpl jump_71dc
/*0x7160*/      movs r0, #0
/*0x7162*/      bl call_73a0
/*0x7166*/      mov r5, r0
/*0x7168*/      lsls r0, r0, #0x16
/*0x716a*/      bpl jump_7182
/*0x716c*/      mov r0, r4
/*0x716e*/      bl call_763c
/*0x7172*/      mov r0, r4
/*0x7174*/      bl call_8054
/*0x7178*/      mov.w r1, #0x200
/*0x717c*/      movs r0, #0
/*0x717e*/      bl call_7330
            jump_7182:
/*0x7182*/      lsls r0, r5, #0x1e
/*0x7184*/      bpl jump_71c4
/*0x7186*/      movs r1, #2
/*0x7188*/      movs r0, #0
/*0x718a*/      bl call_7330
/*0x718e*/      ldr r0, [r4, #0x20]
/*0x7190*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7192*/      beq jump_71c4
/*0x7194*/      ldrb.w r0, [r4, #0x24]
/*0x7198*/      cmp r0, #2
/*0x719a*/      bne jump_71c4
/*0x719c*/      movs r2, #0x40
/*0x719e*/      movs r0, #0
/*0x71a0*/      ldr r1, [r4, #0x1c]
/*0x71a2*/      bl call_7420
/*0x71a6*/      ldr r1, [r4, #0x1c]
/*0x71a8*/      add r1, r0
/*0x71aa*/      str r1, [r4, #0x1c]
/*0x71ac*/      ldr r1, [r4, #0x20]
/*0x71ae*/      subs r0, r1, r0
/*0x71b0*/      str r0, [r4, #0x20]
/*0x71b2*/      bne jump_71c4
/*0x71b4*/      movs r0, #1
/*0x71b6*/      strb.w r0, [r4, #0x24]
/*0x71ba*/      ldr r1, [r4, #0x28]
/*0x71bc*/      cbz r1, jump_71c4
/*0x71be*/      ldr r0, [r4, #0x2c]
/*0x71c0*/      blx r1
/*0x71c2*/      str r7, [r4, #0x28]
            jump_71c4:
/*0x71c4*/      lsls r0, r5, #0x1b
/*0x71c6*/      bpl jump_71d6
/*0x71c8*/      mov r0, r4
/*0x71ca*/      bl call_8010
/*0x71ce*/      movs r1, #0x10
/*0x71d0*/      movs r0, #0
/*0x71d2*/      bl call_7330
            jump_71d6:
/*0x71d6*/      mov r0, r8
/*0x71d8*/      bl call_7254
            jump_71dc:
/*0x71dc*/      mov r4, r8
            jump_71de:
/*0x71de*/      bl call_74f8
/*0x71e2*/      bl call_74d8
/*0x71e6*/      mov r5, r0
/*0x71e8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x71ea*/      beq jump_7216
/*0x71ec*/      mov r0, r5
/*0x71ee*/      bl call_73a0
/*0x71f2*/      tst.w r0, #0x12
/*0x71f6*/      beq jump_71de
/*0x71f8*/      movs r1, #0x12
/*0x71fa*/      mov r0, r5
/*0x71fc*/      bl call_7330
/*0x7200*/      lsl.w r0, r4, r5
/*0x7204*/      bl call_7254
/*0x7208*/      ldr r0, [r6, #0x18]
/*0x720a*/      cmp r0, #0
/*0x720c*/      beq jump_71de
/*0x720e*/      mov r1, r0
/*0x7210*/      mov r0, r5
/*0x7212*/      blx r1
/*0x7214*/      b jump_71de
            jump_7216:
/*0x7216*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x721a*/  .byte 0x00
/*0x721b*/  .byte 0x00

            data_721c:
/*0x721c*/  .word 0x00008b54 /* possible pointer */
            data_7220:
/*0x7220*/  .word 0x20000090


            .thumb_func
            call_7224:
/*0x7224*/      movs r1, #2
/*0x7226*/      strb.w r1, [r0, #0x32]
/*0x722a*/      ldr r0, [pc, #4] /* data_7230 */
/*0x722c*/      b.w jump_7508

            data_7230:
/*0x7230*/  .word 0x20000090


            .thumb_func
            call_7234:
/*0x7234*/      ldrb.w r0, [r0, #0x32]
/*0x7238*/      cmp r0, #3
/*0x723a*/      beq jump_7240
/*0x723c*/      movs r0, #0
/*0x723e*/      bx lr
            jump_7240:
/*0x7240*/      movs r0, #1
/*0x7242*/      bx lr

            .thumb_func
            call_7244:
/*0x7244*/      push {r4, lr}
/*0x7246*/      bl call_751c
/*0x724a*/      pop.w {r4, lr}
/*0x724e*/      b.w jump_764c

/*0x7252*/  .byte 0x00
/*0x7253*/  .byte 0x00


            .thumb_func
            call_7254:
/*0x7254*/      ldr r1, [pc, #4] /* data_725c */
/*0x7256*/      str r0, [r1, #8]
/*0x7258*/      bx lr

/*0x725a*/  .byte 0x00
/*0x725b*/  .byte 0x00

            data_725c:
/*0x725c*/  .word 0x400a8000


            .thumb_func
            call_7260:
/*0x7260*/      push {r4, lr}
/*0x7262*/      movs r1, #0
/*0x7264*/      mov.w r0, #0x400
/*0x7268*/      movs r2, #0x40
/*0x726a*/      movs r3, #1
/*0x726c*/      bl call_39a8
/*0x7270*/      movs r0, #2
/*0x7272*/      bl call_39cc
/*0x7276*/      ldr r4, [pc, #0x48] /* data_72c0 */
/*0x7278*/      ldr r0, [pc, #0x40] /* data_72bc */
/*0x727a*/      str r0, [r4, #8]
/*0x727c*/      subs r0, #0x5c
/*0x727e*/      str r0, [r4, #0xc]
/*0x7280*/      adds r0, #0x70
/*0x7282*/      str r0, [r4, #0x10]
/*0x7284*/      movs r0, #3
/*0x7286*/      str r0, [r4, #0x14]
/*0x7288*/      bl call_707c
/*0x728c*/      mov r0, r4
/*0x728e*/      bl call_7224
/*0x7292*/      ldr r1, [pc, #0x30] /* data_72c4 */
/*0x7294*/      mov.w r0, #0x200000
/*0x7298*/      str.w r0, [r1, #0x100]
/*0x729c*/      movs r0, #1
/*0x729e*/      bl call_72e8
/*0x72a2*/      movs r0, #0xfa
/*0x72a4*/      bl spin_wait /* (time) */
/*0x72a8*/      ldrb.w r0, [r4, #0x34]
/*0x72ac*/      pop.w {r4, lr}
/*0x72b0*/      and r1, r0, #1
/*0x72b4*/      ldr r0, [pc, #0x10] /* data_72c8 */
/*0x72b6*/      b.w jump_752c

/*0x72ba*/  .byte 0x00
/*0x72bb*/  .byte 0x00

            data_72bc:
/*0x72bc*/  .word 0x00008b08 /* possible pointer */
            data_72c0:
/*0x72c0*/  .word 0x20000500
            data_72c4:
/*0x72c4*/  .word 0xe000e004
            data_72c8:
/*0x72c8*/  .word 0x20000090


            .thumb_func
            call_72cc:
/*0x72cc*/      ldr r1, [pc, #0x14] /* data_72e4 */
/*0x72ce*/      cmp r0, #1
/*0x72d0*/      ldr r0, [r1]
/*0x72d2*/      beq jump_72dc
/*0x72d4*/      bic r0, r0, #0x800
            jump_72d8:
/*0x72d8*/      str r0, [r1]
/*0x72da*/      bx lr
            jump_72dc:
/*0x72dc*/      orr r0, r0, #0x800
/*0x72e0*/      b jump_72d8

/*0x72e2*/  .byte 0x00
/*0x72e3*/  .byte 0x00

            data_72e4:
/*0x72e4*/  .word 0x400a8000


            .thumb_func
            call_72e8:
/*0x72e8*/      ldr r1, [pc, #0x14] /* data_7300 */
/*0x72ea*/      cmp r0, #1
/*0x72ec*/      ldr r0, [r1]
/*0x72ee*/      beq jump_72f8
/*0x72f0*/      bic r0, r0, #0x400
            jump_72f4:
/*0x72f4*/      str r0, [r1]
/*0x72f6*/      bx lr
            jump_72f8:
/*0x72f8*/      orr r0, r0, #0x400
/*0x72fc*/      b jump_72f4

/*0x72fe*/  .byte 0x00
/*0x72ff*/  .byte 0x00

            data_7300:
/*0x7300*/  .word 0x400a8000


            .thumb_func
            call_7304:
/*0x7304*/      movs r1, #0
/*0x7306*/      movs r0, #0x20
/*0x7308*/      movs r3, #1
/*0x730a*/      mov r2, r1
/*0x730c*/      b.w jump_64e8

            .thumb_func
            call_7310:
/*0x7310*/      push {r4, lr}
/*0x7312*/      bl call_8278
/*0x7316*/      ldr r1, [r0]
/*0x7318*/      and r1, r1, #9
/*0x731c*/      str r1, [r0]
/*0x731e*/      pop {r4, pc}

            .thumb_func
            call_7320:
/*0x7320*/      push {r4, lr}
/*0x7322*/      bl call_8278
/*0x7326*/      ldr r1, [r0]
/*0x7328*/      and r1, r1, #0x24
/*0x732c*/      str r1, [r0]
/*0x732e*/      pop {r4, pc}

            .thumb_func
            call_7330:
/*0x7330*/      push {r4, lr}
/*0x7332*/      mov r4, r1
/*0x7334*/      bl call_8278
/*0x7338*/      str r4, [r0, #8]
/*0x733a*/      pop {r4, pc}

            .thumb_func
            call_733c:
/*0x733c*/      push {r4, lr}
/*0x733e*/      bl call_8278
/*0x7342*/      ldr r0, [r0, #0x10]
/*0x7344*/      ldr r1, [pc, #8] /* data_7350 */
/*0x7346*/      ubfx r0, r0, #0, #0xa
/*0x734a*/      add r0, r1
/*0x734c*/      pop {r4, pc}

/*0x734e*/  .byte 0x00
/*0x734f*/  .byte 0x00

            data_7350:
/*0x7350*/  .word 0x400aa000


            .thumb_func
            call_7354:
/*0x7354*/      push {r4, r5, r6, lr}
/*0x7356*/      mov r5, r0
/*0x7358*/      bl call_8278
/*0x735c*/      mov r4, r0
/*0x735e*/      mov r0, r5
/*0x7360*/      bl call_7378
/*0x7364*/      ldr r1, [r4, #0x10]
/*0x7366*/      ubfx r1, r1, #0, #0xa
/*0x736a*/      add r0, r1
/*0x736c*/      ldr r1, [pc, #4] /* data_7374 */
/*0x736e*/      add r0, r1
/*0x7370*/      pop {r4, r5, r6, pc}

/*0x7372*/  .byte 0x00
/*0x7373*/  .byte 0x00

            data_7374:
/*0x7374*/  .word 0x400aa000


            .thumb_func
            call_7378:
/*0x7378*/      push {r4, lr}
/*0x737a*/      bl call_8278
/*0x737e*/      ldr r0, [r0, #0x10]
/*0x7380*/      ubfx r0, r0, #0xa, #0xa
/*0x7384*/      pop {r4, pc}

            .thumb_func
            call_7386:
/*0x7386*/      push {r4, lr}
/*0x7388*/      bl call_8278
/*0x738c*/      ldr r1, [r0, #0x10]
/*0x738e*/      ldr r0, [r0]
/*0x7390*/      lsls r1, r1, #3
/*0x7392*/      bpl jump_739a
/*0x7394*/      ubfx r0, r0, #2, #1
/*0x7398*/      pop {r4, pc}
            jump_739a:
/*0x739a*/      ubfx r0, r0, #5, #1
/*0x739e*/      pop {r4, pc}

            .thumb_func
            call_73a0:
/*0x73a0*/      push {r4, lr}
/*0x73a2*/      bl call_8278
/*0x73a6*/      ldr r1, [r0, #4]
/*0x73a8*/      ldr r0, [r0, #8]
/*0x73aa*/      ands r0, r1
/*0x73ac*/      pop {r4, pc}

            .thumb_func
            call_73ae:
/*0x73ae*/      push {r4, lr}
/*0x73b0*/      mov r4, r1
/*0x73b2*/      bl call_8278
/*0x73b6*/      ldr r0, [r0, #0xc]
/*0x73b8*/      lsrs r0, r4
/*0x73ba*/      ubfx r0, r0, #0, #9
/*0x73be*/      pop {r4, pc}

            .thumb_func
            call_73c0:
/*0x73c0*/      push {r4, r5, r6, lr}
/*0x73c2*/      mov r4, r1
/*0x73c4*/      mov r5, r0
/*0x73c6*/      bl call_8278
/*0x73ca*/      add.w r1, r4, r5, lsl #3
/*0x73ce*/      ldr r2, [r1, #4]
/*0x73d0*/      str r2, [r0, #0x10]
/*0x73d2*/      ldr r1, [r1, #8]
/*0x73d4*/      str r1, [r0, #4]
/*0x73d6*/      mov.w r1, #-1
/*0x73da*/      str r1, [r0, #8]
/*0x73dc*/      mov r0, r5
/*0x73de*/      pop.w {r4, r5, r6, lr}
/*0x73e2*/      b.w jump_7450

            .thumb_func
            call_73e6:
/*0x73e6*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x73ea*/      mov r6, r2
/*0x73ec*/      mov r7, r1
/*0x73ee*/      movs r5, r0
/*0x73f0*/      beq jump_7416
/*0x73f2*/      movs r1, #0
            jump_73f4:
/*0x73f4*/      bl call_73ae
/*0x73f8*/      mov r4, r0
/*0x73fa*/      cmp r0, r6
/*0x73fc*/      bhi jump_7410
/*0x73fe*/      mov r0, r5
/*0x7400*/      cbz r5, jump_741a
/*0x7402*/      bl call_733c
            jump_7406:
/*0x7406*/      adds r1, r4, #3
/*0x7408*/      lsrs r2, r1, #2
/*0x740a*/      mov r1, r7
/*0x740c*/      bl call_8268
            jump_7410:
/*0x7410*/      mov r0, r4
/*0x7412*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_7416:
/*0x7416*/      movs r1, #0x10
/*0x7418*/      b jump_73f4
            jump_741a:
/*0x741a*/      bl call_7354
/*0x741e*/      b jump_7406

            .thumb_func
            call_7420:
/*0x7420*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7424*/      mov r5, r2
/*0x7426*/      mov r6, r1
/*0x7428*/      mov r7, r0
/*0x742a*/      bl call_8278
/*0x742e*/      mov r4, r0
/*0x7430*/      movs r0, #0
/*0x7432*/      cbz r5, jump_7444
/*0x7434*/      mov r2, r5
/*0x7436*/      mov r1, r6
/*0x7438*/      mov r0, r7
/*0x743a*/      bl call_73e6
/*0x743e*/      cbnz r0, jump_7444
/*0x7440*/      cmp r5, #0
/*0x7442*/      bne jump_744c
            jump_7444:
/*0x7444*/      ldr r1, [r4]
/*0x7446*/      and r1, r1, #0x10
/*0x744a*/      str r1, [r4]
            jump_744c:
/*0x744c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_7450:
/*0x7450*/      push {r4, lr}
/*0x7452*/      bl call_8278
/*0x7456*/      ldr r1, [r0]
/*0x7458*/      and r1, r1, #0x19
/*0x745c*/      str r1, [r0]
/*0x745e*/      pop {r4, pc}
            jump_7460:
/*0x7460*/      push {r4, lr}
/*0x7462*/      bl call_8278
/*0x7466*/      movs r1, #4
/*0x7468*/      str r1, [r0]
/*0x746a*/      pop {r4, pc}

            .thumb_func
            call_746c:
/*0x746c*/      push {r4, lr}
/*0x746e*/      bl call_8278
/*0x7472*/      movs r1, #0x40
/*0x7474*/      str r1, [r0, #8]
/*0x7476*/      ldr r2, [r0]
/*0x7478*/      movs r1, #0x24
/*0x747a*/      bics r1, r2
/*0x747c*/      str r1, [r0]
/*0x747e*/      pop {r4, pc}

            .thumb_func
            call_7480:
/*0x7480*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7484*/      mov r4, r2
/*0x7486*/      mov r8, r1
/*0x7488*/      mov r7, r0
/*0x748a*/      bl call_7378
/*0x748e*/      mov r6, r0
/*0x7490*/      mov r0, r7
/*0x7492*/      bl call_8278
/*0x7496*/      mov r5, r0
/*0x7498*/      movs r1, #0
/*0x749a*/      mov r0, r7
/*0x749c*/      bl call_73ae
/*0x74a0*/      cmp r4, r6
/*0x74a2*/      bhi jump_74a6
/*0x74a4*/      cbz r0, jump_74ac
            jump_74a6:
/*0x74a6*/      movs r0, #0
            jump_74a8:
/*0x74a8*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_74ac:
/*0x74ac*/      mov r0, r7
/*0x74ae*/      bl call_733c
/*0x74b2*/      mov r1, r0
/*0x74b4*/      adds r0, r4, #3
/*0x74b6*/      lsrs r2, r0, #2
/*0x74b8*/      mov r0, r8
/*0x74ba*/      bl call_8268
/*0x74be*/      str r4, [r5, #0xc]
/*0x74c0*/      movs r0, #2
/*0x74c2*/      str r0, [r5]
/*0x74c4*/      mov r0, r4
/*0x74c6*/      b jump_74a8

            .thumb_func
            call_74c8:
/*0x74c8*/      ldr r1, [pc, #8] /* data_74d4 */
/*0x74ca*/      ldr r2, [r1, #4]
/*0x74cc*/      orrs r2, r0
/*0x74ce*/      str r2, [r1, #4]
/*0x74d0*/      bx lr

/*0x74d2*/  .byte 0x00
/*0x74d3*/  .byte 0x00

            data_74d4:
/*0x74d4*/  .word 0x400a8000


            .thumb_func
            call_74d8:
/*0x74d8*/      mov r3, r0
/*0x74da*/      movs r1, #7
            jump_74dc:
/*0x74dc*/      add.w r2, r1, #8
/*0x74e0*/      lsr.w r0, r3, r2
/*0x74e4*/      lsls r2, r0, #0x1f
/*0x74e6*/      beq jump_74ec
/*0x74e8*/      sxtb r0, r1
/*0x74ea*/      bx lr
            jump_74ec:
/*0x74ec*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x74ee*/      cmp r1, #0
/*0x74f0*/      bgt jump_74dc
/*0x74f2*/      mov.w r0, #-1
/*0x74f6*/      bx lr

            .thumb_func
            call_74f8:
/*0x74f8*/      ldr r0, [pc, #8] /* data_7504 */
/*0x74fa*/      ldr r1, [r0, #4]
/*0x74fc*/      ldr r0, [r0, #8]
/*0x74fe*/      ands r0, r1
/*0x7500*/      bx lr

/*0x7502*/  .byte 0x00
/*0x7503*/  .byte 0x00

            data_7504:
/*0x7504*/  .word 0x400a8000

            jump_7508:
/*0x7508*/      b.w jump_75a4

            .thumb_func
            call_750c:
/*0x750c*/      ldr r0, [pc, #8] /* data_7518 */
/*0x750e*/      ldr r1, [r0]
/*0x7510*/      orr r1, r1, #0xc
/*0x7514*/      str r1, [r0]
/*0x7516*/      bx lr

            data_7518:
/*0x7518*/  .word 0x400a8000


            .thumb_func
            call_751c:
/*0x751c*/      ldr r0, [pc, #8] /* data_7528 */
/*0x751e*/      ldr r1, [r0]
/*0x7520*/      and r1, r1, #0x400
/*0x7524*/      str r1, [r0]
/*0x7526*/      bx lr

            data_7528:
/*0x7528*/  .word 0x400a8000

            jump_752c:
/*0x752c*/      push {r4, lr}
/*0x752e*/      mov r4, r0
/*0x7530*/      ldr r0, [pc, #0x68] /* data_759c */
/*0x7532*/      ldr r2, [r0]
/*0x7534*/      cmp r2, #1
/*0x7536*/      bne jump_7598
/*0x7538*/      movs r2, #0
/*0x753a*/      str r2, [r0]
/*0x753c*/      ldr r0, [pc, #0x60] /* data_75a0 */
/*0x753e*/      ldr r2, [r0]
/*0x7540*/      lsls r3, r2, #0x19
/*0x7542*/      mov.w r2, #-1
/*0x7546*/      bpl jump_7562
/*0x7548*/      movw r3, #0x40c
/*0x754c*/      str r3, [r0]
/*0x754e*/      str r2, [r0, #8]
/*0x7550*/      cbnz r1, jump_7558
/*0x7552*/      movs r0, #0
/*0x7554*/      bl call_627c
            jump_7558:
/*0x7558*/      ldr r0, [r4]
/*0x755a*/      pop.w {r4, lr}
/*0x755e*/      b.w call_74c8
            jump_7562:
/*0x7562*/      movw r3, #0xc0c
/*0x7566*/      str r3, [r0]
/*0x7568*/      str r2, [r0, #8]
/*0x756a*/      cbnz r1, jump_7572
/*0x756c*/      movs r0, #0
/*0x756e*/      bl call_627c
            jump_7572:
/*0x7572*/      movs r0, #0
/*0x7574*/      bl call_72cc
/*0x7578*/      ldr r0, [r4]
/*0x757a*/      bl call_74c8
/*0x757e*/      movs r0, #0
/*0x7580*/      bl call_72e8
/*0x7584*/      movs r1, #0xc8
/*0x7586*/      movs r0, #0
            jump_7588:
/*0x7588*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x758a*/      cmp r0, r1
/*0x758c*/      blo jump_7588
/*0x758e*/      pop.w {r4, lr}
/*0x7592*/      movs r0, #1
/*0x7594*/      b.w call_72e8
            jump_7598:
/*0x7598*/      pop {r4, pc}

/*0x759a*/  .byte 0x00
/*0x759b*/  .byte 0x00

            data_759c:
/*0x759c*/  .word 0x20000014
            data_75a0:
/*0x75a0*/  .word 0x400a8000

            jump_75a4:
/*0x75a4*/      movw r1, #0x111d
/*0x75a8*/      str r1, [r0]
/*0x75aa*/      ldr r1, [pc, #0x28] /* data_75d4 */
/*0x75ac*/      str r1, [r0, #4]
/*0x75ae*/      movw r1, #0x212
/*0x75b2*/      str r1, [r0, #8]
/*0x75b4*/      ldr r1, [pc, #0x20] /* data_75d8 */
/*0x75b6*/      str r1, [r0, #0xc]
/*0x75b8*/      ldr r2, [pc, #0x20] /* data_75dc */
/*0x75ba*/      movs r1, #0x10
/*0x75bc*/      strd r1, r2, [r0, #0x10]
/*0x75c0*/      str r1, [r0, #0x18]
/*0x75c2*/      ldr r1, [pc, #0x1c] /* data_75e0 */
/*0x75c4*/      str r1, [r0, #0x1c]
/*0x75c6*/      movs r1, #0
/*0x75c8*/      str r1, [r0, #0x20]
/*0x75ca*/      ldr r1, [pc, #0x18] /* data_75e4 */
/*0x75cc*/      str r1, [r0, #0x24]
/*0x75ce*/      movs r1, #2
/*0x75d0*/      str r1, [r0, #0x28]
/*0x75d2*/      bx lr

            data_75d4:
/*0x75d4*/  .word 0x80010008
            data_75d8:
/*0x75d8*/  .word 0x91002088
            data_75dc:
/*0x75dc*/  .word 0x92010090
            data_75e0:
/*0x75e0*/  .word 0x930100d0
            data_75e4:
/*0x75e4*/  .word 0x84010110


            .thumb_func
            call_75e8:
/*0x75e8*/      push {r4, lr}
/*0x75ea*/      ldr r4, [pc, #0x48] /* data_7634 */
/*0x75ec*/      ldrb.w r0, [r4, #0x32]
/*0x75f0*/      cmp r0, #3
/*0x75f2*/      bne jump_75f8
/*0x75f4*/      bl call_8288
            jump_75f8:
/*0x75f8*/      ldr r1, [pc, #0x3c] /* data_7638 */
/*0x75fa*/      ldrb r0, [r1, #5]
/*0x75fc*/      cbz r0, jump_761e
/*0x75fe*/      cmp r0, #1
/*0x7600*/      beq jump_7616
/*0x7602*/      cmp r0, #2
/*0x7604*/      bne jump_7626
/*0x7606*/      ldrb.w r0, [r4, #0x32]
/*0x760a*/      cmp r0, #6
/*0x760c*/      bne jump_7612
/*0x760e*/      bl call_7db4
            jump_7612:
/*0x7612*/      movs r0, #2
/*0x7614*/      pop {r4, pc}
            jump_7616:
/*0x7616*/      movs r0, #0
/*0x7618*/      strb r0, [r1, #5]
/*0x761a*/      movs r0, #3
/*0x761c*/      pop {r4, pc}
            jump_761e:
/*0x761e*/      ldrb.w r0, [r4, #0x32]
/*0x7622*/      cmp r0, #6
/*0x7624*/      beq jump_762a
            jump_7626:
/*0x7626*/      movs r0, #0
/*0x7628*/      pop {r4, pc}
            jump_762a:
/*0x762a*/      movs r0, #2
/*0x762c*/      strb r0, [r1, #5]
/*0x762e*/      movs r0, #1
/*0x7630*/      pop {r4, pc}

/*0x7632*/  .byte 0x00
/*0x7633*/  .byte 0x00

            data_7634:
/*0x7634*/  .word 0x20000500
            data_7638:
/*0x7638*/  .word 0x20000028


            .thumb_func
            call_763c:
/*0x763c*/      ldr r1, [pc, #8] /* data_7648 */
/*0x763e*/      ldr r2, [r1]
/*0x7640*/      str r2, [r0]
/*0x7642*/      ldr r1, [r1, #4]
/*0x7644*/      str r1, [r0, #4]
/*0x7646*/      bx lr

            data_7648:
/*0x7648*/  .word 0x400aa000

            jump_764c:
/*0x764c*/      ldr r0, [pc, #8] /* data_7658 */
/*0x764e*/      ldr r1, [r0]
/*0x7650*/      orr r1, r1, #0x20
/*0x7654*/      str r1, [r0]
/*0x7656*/      bx lr

            data_7658:
/*0x7658*/  .word 0x400a8000


            .thumb_func
            call_765c:
/*0x765c*/      ldr r1, [pc, #0xc] /* data_766c */
/*0x765e*/      ldr r2, [r1]
/*0x7660*/      orr r2, r2, #0x100
/*0x7664*/      str r2, [r1]
/*0x7666*/      str r0, [r1, #0x10]
/*0x7668*/      bx lr

/*0x766a*/  .byte 0x00
/*0x766b*/  .byte 0x00

            data_766c:
/*0x766c*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x7670*/      ldr r0, [pc, #4] /* data_7678 */
/*0x7672*/      b.w jump_70b4

/*0x7676*/  .byte 0x00
/*0x7677*/  .byte 0x00

            data_7678:
/*0x7678*/  .word 0x20000500


            .thumb_func
            call_767c:
/*0x767c*/      ldr r1, [pc, #0x1c] /* data_769c */
/*0x767e*/      movs r0, #0x10
/*0x7680*/      str.w r0, [r1, #0x10c]
/*0x7684*/      ldr r0, [pc, #0x18] /* data_76a0 */
/*0x7686*/      movw r1, #0x5fff
/*0x768a*/      str r1, [r0, #8]
/*0x768c*/      ldr r1, [pc, #0x14] /* data_76a4 */
/*0x768e*/      str r1, [r0, #4]
/*0x7690*/      movw r1, #0xca35
/*0x7694*/      str r1, [r0, #0x10]
/*0x7696*/      ldr r1, [pc, #0x10] /* data_76a8 */
/*0x7698*/      str r1, [r0]
/*0x769a*/      bx lr

            data_769c:
/*0x769c*/  .word 0x40088000
            data_76a0:
/*0x76a0*/  .word 0x40068000
            data_76a4:
/*0x76a4*/  .word 0x0001a7d0
            data_76a8:
/*0x76a8*/  .word 0x5fa00001


            .thumb_func
            call_76ac:
/*0x76ac*/      ldr r1, [pc, #8] /* data_76b8 */
/*0x76ae*/      ldr r0, [pc, #4] /* data_76b4 */
/*0x76b0*/      str r0, [r1]
/*0x76b2*/      bx lr

            data_76b4:
/*0x76b4*/  .word 0x5fa00001
            data_76b8:
/*0x76b8*/  .word 0x40068000

            jump_76bc:
/*0x76bc*/      push {r4, lr}
/*0x76be*/      bl call_40d4
/*0x76c2*/      ldr r1, [pc, #0x10] /* data_76d4 */
/*0x76c4*/      movs r0, #0
/*0x76c6*/      str r0, [r1, #4]
/*0x76c8*/      ldr r1, [pc, #0xc] /* data_76d8 */
/*0x76ca*/      strb r0, [r1, #6]
/*0x76cc*/      movs r0, #1
/*0x76ce*/      strb r0, [r1]
/*0x76d0*/      pop {r4, pc}

/*0x76d2*/  .byte 0x00
/*0x76d3*/  .byte 0x00

            data_76d4:
/*0x76d4*/  .word 0x20000008
            data_76d8:
/*0x76d8*/  .word 0x20000580

            jump_76dc:
/*0x76dc*/      push {r4, r5, r6, lr}
/*0x76de*/      mov r6, r0
/*0x76e0*/      mov r5, r2
/*0x76e2*/      mov r4, r1
/*0x76e4*/      mov r0, r1
/*0x76e6*/      bl call_45a8
/*0x76ea*/      mov r2, r5
/*0x76ec*/      mov r1, r4
/*0x76ee*/      mov r0, r6
/*0x76f0*/      pop.w {r4, r5, r6, lr}
/*0x76f4*/      b.w jump_45f8

            .thumb_func
            call_76f8:
/*0x76f8*/      push {r4, r5, lr}
/*0x76fa*/      ldr r1, [pc, #0x24] /* data_7720 */
/*0x76fc*/      movs r0, #0xa
/*0x76fe*/      ldr r2, [pc, #0x1c] /* data_771c */
/*0x7700*/      ldr r3, [pc, #0x20] /* data_7724 */
/*0x7702*/      ldrb.w r1, [r1, #0x25]
/*0x7706*/      b jump_7712
            jump_7708:
/*0x7708*/      ldrb r4, [r2, r0]
/*0x770a*/      muls r4, r1, r4
/*0x770c*/      lsrs r4, r4, #3
/*0x770e*/      adds r5, r3, r0
/*0x7710*/      strb r4, [r5, #4]
            jump_7712:
/*0x7712*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7714*/      uxtb r0, r0
/*0x7716*/      bhs jump_7708
/*0x7718*/      pop {r4, r5, pc}

/*0x771a*/  .byte 0x00
/*0x771b*/  .byte 0x00

            data_771c:
/*0x771c*/  .word 0x00008d09 /* possible pointer */
            data_7720:
/*0x7720*/  .word 0x20000620
            data_7724:
/*0x7724*/  .word 0x20001908


            .thumb_func
            call_7728:
/*0x7728*/      push {r4, r5, r6, r7, lr}
/*0x772a*/      ldr r6, [pc, #0x194] /* data_78c0 */
/*0x772c*/      ldr r4, [pc, #0x194] /* data_78c4 */
/*0x772e*/      sub sp, #0x3c
/*0x7730*/      ldrb r0, [r6, #3]
/*0x7732*/      cmp r0, #5
/*0x7734*/      bhi jump_77d2
/*0x7736*/      cmp r0, #6
/*0x7738*/      bhs jump_776e
/*0x773a*/      tbb [pc, r0]

/*0x773e*/  .byte 0x03 /* case switch_7744 */
/*0x773f*/  .byte 0x03 /* case switch_7744 */
/*0x7740*/  .byte 0x1d /* case switch_7778 */
/*0x7741*/  .byte 0x56 /* case switch_77ea */
/*0x7742*/  .byte 0x43 /* case switch_77c4 */
/*0x7743*/  .byte 0x43 /* case switch_77c4 */

            switch_7744:
/*0x7744*/      movs r5, #3
/*0x7746*/      ldr r7, [pc, #0x180] /* data_78c8 */
/*0x7748*/      b jump_7768
            jump_774a:
/*0x774a*/      ldrb r0, [r6, #3]
/*0x774c*/      cbz r0, jump_7772
/*0x774e*/      adds r0, r4, r5
/*0x7750*/      ldrb r0, [r0, #4]
            jump_7752:
/*0x7752*/      ldr r1, [r4]
/*0x7754*/      ldrb r1, [r1, #3]
/*0x7756*/      muls r0, r1, r0
/*0x7758*/      lsrs r2, r0, #3
/*0x775a*/      rsb r0, r5, r5, lsl #3
/*0x775e*/      add.w r0, r7, r0, lsl #4
/*0x7762*/      movs r1, #0x70
/*0x7764*/      bl mem_set /* (dest, size, val) */
            jump_7768:
/*0x7768*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x776a*/      uxtb r5, r5
/*0x776c*/      bhs jump_774a
            jump_776e:
/*0x776e*/      add sp, #0x3c
/*0x7770*/      pop {r4, r5, r6, r7, pc}
            jump_7772:
/*0x7772*/      ldr r0, [r4]
/*0x7774*/      ldrb r0, [r0, r5]
/*0x7776*/      b jump_7752
            switch_7778:
/*0x7778*/      ldrb r7, [r4, #4]
/*0x777a*/      movs r5, #0x12
/*0x777c*/      mov r6, sp
/*0x777e*/      b jump_779c
            jump_7780:
/*0x7780*/      ldr r0, [r4]
/*0x7782*/      ldrb r0, [r0, #3]
/*0x7784*/      lsls r1, r0, #5
/*0x7786*/      sub.w r0, r1, r0, lsl #1
/*0x778a*/      uxtb r1, r0
/*0x778c*/      add.w r0, r5, r5, lsl #1
/*0x7790*/      adds r2, r0, r6
/*0x7792*/      mov r0, r7
/*0x7794*/      bl call_416a
/*0x7798*/      adds r7, #0x20
/*0x779a*/      uxtb r7, r7
            jump_779c:
/*0x779c*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x779e*/      uxtb r5, r5
/*0x77a0*/      bhs jump_7780
/*0x77a2*/      ldr r5, [pc, #0x128] /* data_78cc */
/*0x77a4*/      movs r4, #0x70
/*0x77a6*/      b jump_77bc
            jump_77a8:
/*0x77a8*/      ldrb r0, [r5]
/*0x77aa*/      cmp r0, #0x12
/*0x77ac*/      bhs jump_77ba
/*0x77ae*/      add.w r0, r0, r0, lsl #1
/*0x77b2*/      adds r1, r0, r6
/*0x77b4*/      mov r0, r4
/*0x77b6*/      bl call_4210
            jump_77ba:
/*0x77ba*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_77bc:
/*0x77bc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x77be*/      uxtb r4, r4
/*0x77c0*/      bhs jump_77a8
/*0x77c2*/      b jump_776e
            switch_77c4:
/*0x77c4*/      add sp, #0x3c
/*0x77c6*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x77c8*/      pop.w {r4, r5, r6, r7, lr}
/*0x77cc*/      uxtb r0, r0
/*0x77ce*/      b.w jump_3b04
            jump_77d2:
/*0x77d2*/      cmp r0, #7
/*0x77d4*/      bls jump_776e
/*0x77d6*/      bic r0, r0, #1
/*0x77da*/      cmp r0, #8
/*0x77dc*/      beq switch_77ea
/*0x77de*/      cmp r0, #0xa
/*0x77e0*/      beq jump_77f6
/*0x77e2*/      cmp r0, #0xc
/*0x77e4*/      bne jump_776e
/*0x77e6*/      movs r5, #0x70
/*0x77e8*/      b jump_78b6
            switch_77ea:
/*0x77ea*/      add sp, #0x3c
/*0x77ec*/      adds r0, r4, #4
/*0x77ee*/      pop.w {r4, r5, r6, r7, lr}
/*0x77f2*/      b.w jump_41e4
            jump_77f6:
/*0x77f6*/      movs r0, #0
/*0x77f8*/      movs r5, #0x12
/*0x77fa*/      str r0, [sp, #4]
/*0x77fc*/      b jump_7854
            jump_77fe:
/*0x77fe*/      add.w r0, r5, r5, lsl #1
/*0x7802*/      add.w r1, r4, r0, lsl #1
/*0x7806*/      ldrb r0, [r1, #4]!
/*0x780a*/      cbnz r0, jump_7814
/*0x780c*/      ldrb r0, [r1, #1]
/*0x780e*/      cbnz r0, jump_7814
/*0x7810*/      ldrb r0, [r1, #2]
/*0x7812*/      cbz r0, jump_7840
            jump_7814:
/*0x7814*/      ldrb r0, [r1, #3]
/*0x7816*/      cbnz r0, jump_7820
/*0x7818*/      ldrb r0, [r1, #4]
/*0x781a*/      cbnz r0, jump_7820
/*0x781c*/      ldrb r0, [r1, #5]
/*0x781e*/      cbz r0, jump_783c
            jump_7820:
/*0x7820*/      movs r2, #3
/*0x7822*/      mov r6, sp
/*0x7824*/      b jump_7834
            jump_7826:
/*0x7826*/      adds r3, r1, r2
/*0x7828*/      ldrb r0, [r1, r2]
/*0x782a*/      ldrb r3, [r3, #3]
/*0x782c*/      cmp r0, r3
/*0x782e*/      bhi jump_7832
/*0x7830*/      mov r0, r3
            jump_7832:
/*0x7832*/      strb r0, [r6, r2]
            jump_7834:
/*0x7834*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x7836*/      uxtb r2, r2
/*0x7838*/      bhs jump_7826
/*0x783a*/      mov r1, r6
            jump_783c:
/*0x783c*/      mov r0, r5
/*0x783e*/      b jump_7850
            jump_7840:
/*0x7840*/      ldrb r0, [r1, #3]
/*0x7842*/      cbnz r0, jump_784c
/*0x7844*/      ldrb r0, [r1, #4]
/*0x7846*/      cbnz r0, jump_784c
/*0x7848*/      ldrb r0, [r1, #5]
/*0x784a*/      cbz r0, jump_785c
            jump_784c:
/*0x784c*/      mov r0, r5
/*0x784e*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_7850:
/*0x7850*/      bl call_78d0
            jump_7854:
/*0x7854*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x7856*/      uxtb r5, r5
/*0x7858*/      bhs jump_77fe
/*0x785a*/      b jump_776e
            jump_785c:
/*0x785c*/      add r1, sp, #4
/*0x785e*/      b jump_783c
            jump_7860:
/*0x7860*/      ldr r0, [pc, #0x68] /* data_78cc */
/*0x7862*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7864*/      ldrb r1, [r0, r5]
/*0x7866*/      and r0, r1, #7
/*0x786a*/      add.w r0, r0, r0, lsl #2
/*0x786e*/      add r0, r4
/*0x7870*/      ldrsb.w r2, [r0, #0x12]
/*0x7874*/      adds r0, #0xe
/*0x7876*/      cbz r2, jump_78ae
/*0x7878*/      ldrb r3, [r0, #3]
/*0x787a*/      rsbs r1, r3, r1, lsr #3
/*0x787e*/      bpl jump_7882
/*0x7880*/      rsbs r1, r1, #0
            jump_7882:
/*0x7882*/      subs r1, r1, r2
/*0x7884*/      adds r1, #0xa
/*0x7886*/      uxtb r2, r1
/*0x7888*/      cmp r2, #0xa
/*0x788a*/      bhs jump_78ae
/*0x788c*/      movs r1, #3
/*0x788e*/      mov r3, sp
/*0x7890*/      adds r6, r4, r2
/*0x7892*/      b jump_789e
            jump_7894:
/*0x7894*/      ldrb r2, [r0, r1]
/*0x7896*/      ldrb r7, [r6, #4]
/*0x7898*/      muls r2, r7, r2
/*0x789a*/      lsrs r2, r2, #8
/*0x789c*/      strb r2, [r3, r1]
            jump_789e:
/*0x789e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x78a0*/      uxtb r1, r1
/*0x78a2*/      bhs jump_7894
/*0x78a4*/      mov r1, r3
/*0x78a6*/      mov r0, r5
/*0x78a8*/      bl call_4210
/*0x78ac*/      b jump_78b6
            jump_78ae:
/*0x78ae*/      movs r1, #0
/*0x78b0*/      mov r0, r5
/*0x78b2*/      bl call_4254
            jump_78b6:
/*0x78b6*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x78b8*/      uxtb r5, r5
/*0x78ba*/      bhs jump_7860
/*0x78bc*/      b jump_776e

/*0x78be*/  .byte 0x00
/*0x78bf*/  .byte 0x00

            data_78c0:
/*0x78c0*/  .word 0x20000620
            data_78c4:
/*0x78c4*/  .word 0x20001908
            data_78c8:
/*0x78c8*/  .word 0x20000278
            data_78cc:
/*0x78cc*/  .word 0x00008c98 /* possible pointer */


            .thumb_func
            call_78d0:
/*0x78d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x78d4*/      mov r7, r1
/*0x78d6*/      mov r6, r0
/*0x78d8*/      movs r4, #0x70
/*0x78da*/      ldr r5, [pc, #0x1c] /* data_78f8 */
/*0x78dc*/      b jump_78ee
            jump_78de:
/*0x78de*/      ldrb r0, [r5]
/*0x78e0*/      cmp r0, r6
/*0x78e2*/      bne jump_78ec
/*0x78e4*/      mov r1, r7
/*0x78e6*/      mov r0, r4
/*0x78e8*/      bl call_4210
            jump_78ec:
/*0x78ec*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_78ee:
/*0x78ee*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x78f0*/      uxtb r4, r4
/*0x78f2*/      bhs jump_78de
/*0x78f4*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_78f8:
/*0x78f8*/  .word 0x00008c98 /* possible pointer */


            .thumb_func
            call_78fc:
/*0x78fc*/      push {r3, r4, r5, lr}
/*0x78fe*/      mov r4, r0
/*0x7900*/      ldr r0, [pc, #0x24] /* data_7928 */
/*0x7902*/      ldr r0, [r0]
/*0x7904*/      ldrb r5, [r0, #3]
/*0x7906*/      cbnz r1, jump_7910
/*0x7908*/      mov r0, sp
/*0x790a*/      bl call_4140
/*0x790e*/      mov r1, sp
            jump_7910:
/*0x7910*/      movs r2, #3
/*0x7912*/      b jump_7920
            jump_7914:
/*0x7914*/      ldrb r0, [r1], #1
/*0x7918*/      muls r0, r5, r0
/*0x791a*/      lsrs r0, r0, #3
/*0x791c*/      strb r0, [r4], #1
            jump_7920:
/*0x7920*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x7922*/      uxtb r2, r2
/*0x7924*/      bhs jump_7914
/*0x7926*/      pop {r3, r4, r5, pc}

            data_7928:
/*0x7928*/  .word 0x20001908


            .thumb_func
            call_792c:
/*0x792c*/      mov.w r1, #0x8000
/*0x7930*/      cmp r0, r1
/*0x7932*/      blo jump_7938
/*0x7934*/      and.w r0, r1, r0, lsr #10
            jump_7938:
/*0x7938*/      uxth r0, r0
/*0x793a*/      bx lr

            .thumb_func
            call_793c:
/*0x793c*/      ldr r2, [pc, #0x14] /* data_7954 */
/*0x793e*/      push {lr}
/*0x7940*/      ldr r0, [r2]
/*0x7942*/      cbz r0, jump_794e
/*0x7944*/      bl call_792c
/*0x7948*/      movs r1, #0x1e
/*0x794a*/      str r1, [r2]
/*0x794c*/      pop {pc}
            jump_794e:
/*0x794e*/      movs r0, #0x1e
/*0x7950*/      pop {pc}

/*0x7952*/  .byte 0x00
/*0x7953*/  .byte 0x00

            data_7954:
/*0x7954*/  .word 0x200018fc


            .thumb_func
            call_7958:
/*0x7958*/      lsls r1, r0, #0x10
/*0x795a*/      bpl jump_795e
/*0x795c*/      lsls r0, r0, #0xa
            jump_795e:
/*0x795e*/      bx lr

            .thumb_func
            call_7960:
/*0x7960*/      push {r4, lr}
/*0x7962*/      ldr r0, [pc, #0x30] /* data_7994 */
/*0x7964*/      movs r4, #0
/*0x7966*/      ldr r0, [r0]
/*0x7968*/      bl call_4c72
/*0x796c*/      mov r3, r0
/*0x796e*/      movs r0, #0x18
/*0x7970*/      ldr r1, [pc, #0x24] /* data_7998 */
/*0x7972*/      b jump_798a
            jump_7974:
/*0x7974*/      add.w r2, r1, r4, lsl #1
/*0x7978*/      ldrh r2, [r2, #0x28]
/*0x797a*/      ubfx r2, r2, #0, #0xa
/*0x797e*/      cmp r2, r3
/*0x7980*/      bne jump_7986
/*0x7982*/      mov r0, r4
/*0x7984*/      pop {r4, pc}
            jump_7986:
/*0x7986*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x7988*/      uxtb r4, r4
            jump_798a:
/*0x798a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x798c*/      uxtb r0, r0
/*0x798e*/      bhs jump_7974
/*0x7990*/      movs r0, #0x18
/*0x7992*/      pop {r4, pc}

            data_7994:
/*0x7994*/  .word 0x20000054
            data_7998:
/*0x7998*/  .word 0x20000620


            .thumb_func
            call_799c:
/*0x799c*/      movs r1, #0xe
/*0x799e*/      ldr r0, [pc, #4] /* data_79a4 */
/*0x79a0*/      b.w mem_zero /* (dest, size) */

            data_79a4:
/*0x79a4*/  .word 0x200000e2


            .thumb_func
            call_79a8:
/*0x79a8*/      push {r4, r5, r6, lr}
/*0x79aa*/      ldr r4, [pc, #0x70] /* data_7a1c */
/*0x79ac*/      ldr r5, [pc, #0x70] /* data_7a20 */
/*0x79ae*/      movs r0, #0x18
/*0x79b0*/      strb r0, [r4, #2]
/*0x79b2*/      ldrb r0, [r5, #1]
/*0x79b4*/      lsls r0, r0, #0x1f
/*0x79b6*/      beq jump_79da
/*0x79b8*/      ldrb r0, [r5, #2]
/*0x79ba*/      movs r1, #0
/*0x79bc*/      bl call_4964
/*0x79c0*/      cmp r0, #0
/*0x79c2*/      beq jump_7a18
/*0x79c4*/      movs r0, #1
/*0x79c6*/      ldr r2, [pc, #0x5c] /* data_7a24 */
/*0x79c8*/      ldrb r1, [r5]
/*0x79ca*/      b jump_79d2
            jump_79cc:
/*0x79cc*/      ldrb r3, [r2, r0]
/*0x79ce*/      cmp r1, r3
/*0x79d0*/      beq jump_7a18
            jump_79d2:
/*0x79d2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x79d4*/      uxtb r0, r0
/*0x79d6*/      bhs jump_79cc
/*0x79d8*/      b jump_79ee
            jump_79da:
/*0x79da*/      movs r0, #6
/*0x79dc*/      ldr r2, [pc, #0x48] /* data_7a28 */
/*0x79de*/      ldrb r1, [r5]
/*0x79e0*/      b jump_79e8
            jump_79e2:
/*0x79e2*/      ldrb r3, [r2, r0]
/*0x79e4*/      cmp r1, r3
/*0x79e6*/      beq jump_7a18
            jump_79e8:
/*0x79e8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x79ea*/      uxtb r0, r0
/*0x79ec*/      bhs jump_79e2
            jump_79ee:
/*0x79ee*/      bl call_6080
/*0x79f2*/      cmp r0, #0
/*0x79f4*/      bne jump_7a18
/*0x79f6*/      strb r0, [r4, #2]
/*0x79f8*/      movs r0, #0x18
/*0x79fa*/      ldr r2, [pc, #0x30] /* data_7a2c */
/*0x79fc*/      ldr r3, [pc, #0x30] /* data_7a30 */
/*0x79fe*/      b jump_7a12
            jump_7a00:
/*0x7a00*/      ldrb r1, [r4, #2]
/*0x7a02*/      add.w r5, r2, r1, lsl #1
/*0x7a06*/      ldrh r5, [r5, #0x28]
/*0x7a08*/      cmp.w r3, r5, lsl #22
/*0x7a0c*/      beq jump_7a18
/*0x7a0e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x7a10*/      strb r1, [r4, #2]
            jump_7a12:
/*0x7a12*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7a14*/      uxtb r0, r0
/*0x7a16*/      bhs jump_7a00
            jump_7a18:
/*0x7a18*/      pop {r4, r5, r6, pc}

/*0x7a1a*/  .byte 0x00
/*0x7a1b*/  .byte 0x00

            data_7a1c:
/*0x7a1c*/  .word 0x200018f8
            data_7a20:
/*0x7a20*/  .word 0x20000054
            data_7a24:
/*0x7a24*/  .word 0x00008611 /* possible pointer */
            data_7a28:
/*0x7a28*/  .word 0x0000860b /* possible pointer */
            data_7a2c:
/*0x7a2c*/  .word 0x20000620
            data_7a30:
/*0x7a30*/  .word 0xffc00000

            jump_7a34:
/*0x7a34*/      push {r3, r4, r5, lr}
/*0x7a36*/      ldr r1, [pc, #0xa0] /* data_7ad8 */
/*0x7a38*/      ldr r2, [pc, #0xa0] /* data_7adc */
/*0x7a3a*/      ldrh r0, [r1]
/*0x7a3c*/      ldr r2, [r2]
/*0x7a3e*/      add.w r4, r2, r0, lsl #2
/*0x7a42*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7a44*/      strh r0, [r1]
/*0x7a46*/      ldrb r0, [r4, #1]
/*0x7a48*/      movs r1, #4
/*0x7a4a*/      cmp.w r1, r0, lsr #5
/*0x7a4e*/      beq jump_7acc
/*0x7a50*/      movs r0, #0
/*0x7a52*/      str r0, [sp]
/*0x7a54*/      ldrh r0, [r4]
/*0x7a56*/      mov r1, sp
/*0x7a58*/      bl call_4c68
/*0x7a5c*/      ldrb r0, [r4, #1]
/*0x7a5e*/      lsrs r0, r0, #5
/*0x7a60*/      cmp r0, #1
/*0x7a62*/      beq jump_7a6a
/*0x7a64*/      cmp r0, #2
/*0x7a66*/      bne jump_7a80
/*0x7a68*/      b jump_7a74
            jump_7a6a:
/*0x7a6a*/      ldrb.w r0, [sp, #3]
/*0x7a6e*/      orr r0, r0, #2
/*0x7a72*/      b jump_7a7c
            jump_7a74:
/*0x7a74*/      ldrb.w r0, [sp, #3]
/*0x7a78*/      bic r0, r0, #2
            jump_7a7c:
/*0x7a7c*/      strb.w r0, [sp, #3]
            jump_7a80:
/*0x7a80*/      ldrb.w r0, [sp, #1]
/*0x7a84*/      lsls r0, r0, #0x1f
/*0x7a86*/      ldrb.w r0, [sp]
/*0x7a8a*/      beq jump_7a92
/*0x7a8c*/      bl call_4944
/*0x7a90*/      b jump_7a96
            jump_7a92:
/*0x7a92*/      ldr r1, [pc, #0x4c] /* data_7ae0 */
/*0x7a94*/      ldrb r0, [r1, r0]
            jump_7a96:
/*0x7a96*/      strb.w r0, [sp, #2]
/*0x7a9a*/      ldrb.w r0, [sp, #3]
/*0x7a9e*/      orr r0, r0, #5
/*0x7aa2*/      strb.w r0, [sp, #3]
/*0x7aa6*/      ldrb.w r1, [sp, #1]
/*0x7aaa*/      ldrb.w r2, [sp, #2]
/*0x7aae*/      and r1, r1, #1
/*0x7ab2*/      rsb r1, r1, r1, lsl #3
/*0x7ab6*/      add.w r1, r2, r1, lsl #1
/*0x7aba*/      ubfx r2, r0, #1, #1
/*0x7abe*/      uxtb r1, r1
/*0x7ac0*/      ldr r0, [pc, #0x20] /* data_7ae4 */
/*0x7ac2*/      bl call_4104
/*0x7ac6*/      ldr r0, [sp]
/*0x7ac8*/      bl call_49ec
            jump_7acc:
/*0x7acc*/      ldrh r0, [r4, #2]
/*0x7ace*/      bl call_7958
/*0x7ad2*/      ldr r1, [pc, #0x14] /* data_7ae8 */
/*0x7ad4*/      str r0, [r1]
/*0x7ad6*/      pop {r3, r4, r5, pc}

            data_7ad8:
/*0x7ad8*/  .word 0x200018f8
            data_7adc:
/*0x7adc*/  .word 0x20000058
            data_7ae0:
/*0x7ae0*/  .word 0x200000f0
            data_7ae4:
/*0x7ae4*/  .word 0x200000e2
            data_7ae8:
/*0x7ae8*/  .word 0x20000060

            jump_7aec:
/*0x7aec*/      push {r4, r5, r6, lr}
/*0x7aee*/      ldr r5, [pc, #0x60] /* data_7b50 */
/*0x7af0*/      ldrh r0, [r5]
/*0x7af2*/      cmp r0, #0xff
/*0x7af4*/      bls jump_7afe
/*0x7af6*/      movs r0, #1
/*0x7af8*/      adds r1, r5, #4
/*0x7afa*/      strb r0, [r1, #7]
/*0x7afc*/      b jump_7b0c
            jump_7afe:
/*0x7afe*/      ldr r6, [pc, #0x54] /* data_7b54 */
/*0x7b00*/      ldrb r1, [r6, #1]
/*0x7b02*/      lsls r1, r1, #0x1f
/*0x7b04*/      beq jump_7b10
/*0x7b06*/      ldrb r1, [r6]
/*0x7b08*/      cmp r1, #0xc0
/*0x7b0a*/      bhs jump_7b10
            jump_7b0c:
/*0x7b0c*/      movs r0, #1
/*0x7b0e*/      pop {r4, r5, r6, pc}
            jump_7b10:
/*0x7b10*/      ldr r1, [pc, #0x44] /* data_7b58 */
/*0x7b12*/      ldr r1, [r1]
/*0x7b14*/      add.w r4, r1, r0, lsl #2
/*0x7b18*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7b1a*/      strh r0, [r5]
/*0x7b1c*/      ldr r0, [r6]
/*0x7b1e*/      bl call_4c72
/*0x7b22*/      strh r0, [r4]
/*0x7b24*/      ldrb r1, [r6, #3]
/*0x7b26*/      lsls r1, r1, #0x1e
/*0x7b28*/      bpl jump_7b30
/*0x7b2a*/      add.w r0, r0, #0x3c00
/*0x7b2e*/      b jump_7b34
            jump_7b30:
/*0x7b30*/      add.w r0, r0, #0x5c00
            jump_7b34:
/*0x7b34*/      strh r0, [r4]
/*0x7b36*/      ldrh r0, [r5]
/*0x7b38*/      cmp r0, #1
/*0x7b3a*/      bls jump_7b44
/*0x7b3c*/      bl call_793c
/*0x7b40*/      strh r0, [r4, #-0x2]
            jump_7b44:
/*0x7b44*/      ldr r1, [pc, #0x14] /* data_7b5c */
/*0x7b46*/      mov.w r0, #-1
/*0x7b4a*/      str r0, [r1]
/*0x7b4c*/      movs r0, #0
/*0x7b4e*/      pop {r4, r5, r6, pc}

            data_7b50:
/*0x7b50*/  .word 0x200018f8
            data_7b54:
/*0x7b54*/  .word 0x20000054
            data_7b58:
/*0x7b58*/  .word 0x20000058
            data_7b5c:
/*0x7b5c*/  .word 0x20000060

            jump_7b60:
/*0x7b60*/      push {r4, lr}
/*0x7b62*/      ldr r4, [pc, #0x18] /* data_7b7c */
/*0x7b64*/      movs r1, #0
/*0x7b66*/      ldrb r0, [r4, #2]
/*0x7b68*/      bl call_3ed8
/*0x7b6c*/      movs r0, #0
/*0x7b6e*/      adds r1, r4, #4
/*0x7b70*/      strh r0, [r4]
/*0x7b72*/      str r0, [r1]
/*0x7b74*/      movs r0, #4
/*0x7b76*/      strb r0, [r1, #7]
/*0x7b78*/      pop {r4, pc}

/*0x7b7a*/  .byte 0x00
/*0x7b7b*/  .byte 0x00

            data_7b7c:
/*0x7b7c*/  .word 0x200018f8


            .thumb_func
            call_7b80:
/*0x7b80*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7b84*/      ldr r4, [pc, #0xa0] /* data_7c28 */
/*0x7b86*/      ldr r5, [pc, #0xa4] /* data_7c2c */
/*0x7b88*/      ldr.w r8, [pc, #0xa4] /* data_7c30 */
/*0x7b8c*/      ldr r7, [pc, #0xa4] /* data_7c34 */
/*0x7b8e*/      movs r6, #5
            jump_7b90:
/*0x7b90*/      ldrd r0, r1, [r5]
/*0x7b94*/      str r1, [r0, #0x28]
/*0x7b96*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x7b98*/      uxtb r6, r6
/*0x7b9a*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x7b9c*/      nop 
/*0x7b9e*/      nop 
/*0x7ba0*/      movs r0, #0xff
/*0x7ba2*/      ldr r1, [r7, #0x1c]
/*0x7ba4*/      lsls r1, r1, #0x16
/*0x7ba6*/      bmi jump_7baa
/*0x7ba8*/      movs r0, #0xfe
            jump_7baa:
/*0x7baa*/      ldr r1, [r7, #0x1c]
/*0x7bac*/      lsls r1, r1, #0x15
/*0x7bae*/      bmi jump_7bb4
/*0x7bb0*/      bic r0, r0, #2
            jump_7bb4:
/*0x7bb4*/      ldr.w r2, [r8, #0x1c]
/*0x7bb8*/      mov r1, r8
/*0x7bba*/      lsls r2, r2, #0x19
/*0x7bbc*/      bmi jump_7bc2
/*0x7bbe*/      bic r0, r0, #4
            jump_7bc2:
/*0x7bc2*/      ldr r1, [r1, #0x1c]
/*0x7bc4*/      lsls r1, r1, #0x18
/*0x7bc6*/      bmi jump_7bcc
/*0x7bc8*/      bic r0, r0, #8
            jump_7bcc:
/*0x7bcc*/      ldr r1, [r7, #0x1c]
/*0x7bce*/      lsls r1, r1, #0x14
/*0x7bd0*/      bmi jump_7bd6
/*0x7bd2*/      bic r0, r0, #0x10
            jump_7bd6:
/*0x7bd6*/      ldr r1, [r7, #0x1c]
/*0x7bd8*/      lsls r1, r1, #0x12
/*0x7bda*/      bmi jump_7be0
/*0x7bdc*/      bic r0, r0, #0x20
            jump_7be0:
/*0x7be0*/      ldr r1, [r7, #0x1c]
/*0x7be2*/      lsls r1, r1, #0x11
/*0x7be4*/      bmi jump_7bea
/*0x7be6*/      bic r0, r0, #0x40
            jump_7bea:
/*0x7bea*/      ldr r1, [r7, #0x1c]
/*0x7bec*/      lsls r1, r1, #0x10
/*0x7bee*/      bmi jump_7bf4
/*0x7bf0*/      bic r0, r0, #0x80
            jump_7bf4:
/*0x7bf4*/      ldrd r1, r2, [r5]
/*0x7bf8*/      str r2, [r1, #0x24]
/*0x7bfa*/      ldrb r1, [r4, #1]
/*0x7bfc*/      cmp r1, r0
/*0x7bfe*/      beq jump_7c06
/*0x7c00*/      strb r0, [r4, #1]
/*0x7c02*/      movs r0, #3
/*0x7c04*/      b jump_7c12
            jump_7c06:
/*0x7c06*/      ldrb r0, [r4]
/*0x7c08*/      cbz r0, jump_7c14
/*0x7c0a*/      cmp r0, #1
/*0x7c0c*/      bne jump_7c10
/*0x7c0e*/      strb r1, [r4, #2]
            jump_7c10:
/*0x7c10*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_7c12:
/*0x7c12*/      strb r0, [r4]
            jump_7c14:
/*0x7c14*/      cmp r6, #0
/*0x7c16*/      beq jump_7c22
/*0x7c18*/      movs r0, #5
/*0x7c1a*/      bl spin_wait /* (time) */
/*0x7c1e*/      subs r5, #8
/*0x7c20*/      b jump_7b90
            jump_7c22:
/*0x7c22*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7c26*/  .byte 0x00
/*0x7c27*/  .byte 0x00

            data_7c28:
/*0x7c28*/  .word 0x20000278
            data_7c2c:
/*0x7c2c*/  .word 0x0000870c /* possible pointer */
            data_7c30:
/*0x7c30*/  .word 0x400b0000
            data_7c34:
/*0x7c34*/  .word 0x400b4000

            jump_7c38:
/*0x7c38*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x7c3a*/      ldr r0, [pc, #0x44] /* data_7c80 */
/*0x7c3c*/      ldr r0, [r0]
/*0x7c3e*/      ldr r1, [pc, #0x44] /* data_7c84 */
/*0x7c40*/      ldr r6, [pc, #0x44] /* data_7c88 */
/*0x7c42*/      udiv r4, r0, r1
/*0x7c46*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x7c48*/      strh.w r4, [sp]
/*0x7c4c*/      movs r5, #0
/*0x7c4e*/      strh.w r5, [sp, #2]
/*0x7c52*/      mov r1, sp
/*0x7c54*/      mov r0, r6
/*0x7c56*/      bl call_479e
/*0x7c5a*/      strb.w r5, [sp]
/*0x7c5e*/      movs r0, #7
/*0x7c60*/      strh.w r0, [sp, #2]
/*0x7c64*/      movs r0, #1
/*0x7c66*/      strb.w r0, [sp, #4]
/*0x7c6a*/      strb.w r5, [sp, #5]
/*0x7c6e*/      lsrs r0, r4, #1
/*0x7c70*/      strh.w r0, [sp, #6]
/*0x7c74*/      mov r1, sp
/*0x7c76*/      mov r0, r6
/*0x7c78*/      bl call_4746
/*0x7c7c*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x7c7e*/  .byte 0x00
/*0x7c7f*/  .byte 0x00

            data_7c80:
/*0x7c80*/  .word 0x20000010
            data_7c84:
/*0x7c84*/  .word 0x00dbba00
            data_7c88:
/*0x7c88*/  .word 0x4006f000


            .thumb_func
            call_7c8c:
/*0x7c8c*/      push {r4, lr}
/*0x7c8e*/      ldr r1, [pc, #0x28] /* data_7cb8 */
/*0x7c90*/      mov.w r4, #0x8000
/*0x7c94*/      str r4, [r1, #0x28]
/*0x7c96*/      nop 
/*0x7c98*/      nop 
/*0x7c9a*/      str r4, [r1, #0x24]
/*0x7c9c*/      mov.w r2, #0x4000
/*0x7ca0*/      b jump_7cac
            jump_7ca2:
/*0x7ca2*/      str r2, [r1, #0x28]
/*0x7ca4*/      nop 
/*0x7ca6*/      nop 
/*0x7ca8*/      str r2, [r1, #0x24]
/*0x7caa*/      nop 
            jump_7cac:
/*0x7cac*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7cae*/      uxtb r0, r0
/*0x7cb0*/      bhs jump_7ca2
/*0x7cb2*/      str r4, [r1, #0x28]
/*0x7cb4*/      pop {r4, pc}

/*0x7cb6*/  .byte 0x00
/*0x7cb7*/  .byte 0x00

            data_7cb8:
/*0x7cb8*/  .word 0x400b0000


            .thumb_func
            call_7cbc:
/*0x7cbc*/      push {r4, r5, r6, r7, lr}
/*0x7cbe*/      movs r2, #4
/*0x7cc0*/      ldr r3, [pc, #0x24] /* data_7ce8 */
/*0x7cc2*/      lsls r4, r2, #0xc
/*0x7cc4*/      ldr r5, [pc, #0x24] /* data_7cec */
/*0x7cc6*/      movw r6, #0xffff
/*0x7cca*/      b jump_7ce0
            jump_7ccc:
/*0x7ccc*/      nop 
/*0x7cce*/      str r4, [r5, #0x28]
/*0x7cd0*/      lsls r7, r0, #0x10
/*0x7cd2*/      bpl jump_7cd8
/*0x7cd4*/      str r2, [r3, #0x24]
/*0x7cd6*/      b jump_7cda
            jump_7cd8:
/*0x7cd8*/      str r2, [r3, #0x28]
            jump_7cda:
/*0x7cda*/      str r4, [r5, #0x24]
/*0x7cdc*/      and.w r0, r6, r0, lsl #1
            jump_7ce0:
/*0x7ce0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x7ce2*/      uxtb r1, r1
/*0x7ce4*/      bhs jump_7ccc
/*0x7ce6*/      pop {r4, r5, r6, r7, pc}

            data_7ce8:
/*0x7ce8*/  .word 0x400b4000
            data_7cec:
/*0x7cec*/  .word 0x400b0000


            .thumb_func
            call_7cf0:
/*0x7cf0*/      push {r4, r5, r6, lr}
/*0x7cf2*/      mov r5, r1
/*0x7cf4*/      ldr r2, [pc, #0xa0] /* data_7d98 */
/*0x7cf6*/      add.w r1, r0, r0, lsl #1
/*0x7cfa*/      add.w r4, r2, r1, lsl #3
/*0x7cfe*/      ldr r2, [pc, #0x9c] /* data_7d9c */
/*0x7d00*/      ldr r1, [r4]
/*0x7d02*/      str r1, [r5]
/*0x7d04*/      add.w r1, r0, r0, lsl #3
/*0x7d08*/      add.w r1, r1, r0, lsl #4
/*0x7d0c*/      add.w r1, r2, r1, lsl #2
/*0x7d10*/      .short 0x1c89 /* adds r1, r1, #2 */ 
/*0x7d12*/      str r1, [r5, #0xc]
/*0x7d14*/      ldr r1, [r4, #4]
/*0x7d16*/      str r1, [r5, #0x10]
/*0x7d18*/      ldr r1, [r4, #4]
/*0x7d1a*/      str r1, [r5, #0x28]
/*0x7d1c*/      sub.w r1, r2, #0x210
/*0x7d20*/      add.w r0, r1, r0, lsl #8
/*0x7d24*/      str r0, [r5, #0x2c]
/*0x7d26*/      ldrb r0, [r4, #0x13]
/*0x7d28*/      movs r6, #1
/*0x7d2a*/      lsl.w r1, r6, r0
/*0x7d2e*/      ldrb r0, [r4, #0x12]
/*0x7d30*/      movs r2, #6
/*0x7d32*/      bl call_366c
/*0x7d36*/      ldrb r0, [r4, #0x15]
/*0x7d38*/      movs r2, #6
/*0x7d3a*/      lsl.w r1, r6, r0
/*0x7d3e*/      ldrb r0, [r4, #0x14]
/*0x7d40*/      bl call_366c
/*0x7d44*/      mov r1, r5
/*0x7d46*/      ldr r0, [r4, #4]
/*0x7d48*/      bl call_6fac
/*0x7d4c*/      movs r1, #1
/*0x7d4e*/      ldr r0, [r4, #4]
/*0x7d50*/      bl call_7030
/*0x7d54*/      movs r1, #1
/*0x7d56*/      ldr r0, [r4, #4]
/*0x7d58*/      bl call_7008
/*0x7d5c*/      ldrb r0, [r4, #0x10]
/*0x7d5e*/      add.w r1, r5, #0xc
/*0x7d62*/      bl call_6170
/*0x7d66*/      ldrb r0, [r4, #0x10]
/*0x7d68*/      movs r2, #1
/*0x7d6a*/      movs r1, #9
/*0x7d6c*/      bl call_61fc
/*0x7d70*/      ldrb r0, [r4, #0x11]
/*0x7d72*/      add.w r1, r5, #0x28
/*0x7d76*/      bl call_6170
/*0x7d7a*/      ldrb r0, [r4, #0x11]
/*0x7d7c*/      movs r1, #1
/*0x7d7e*/      bl call_61a0
/*0x7d82*/      movs r1, #1
/*0x7d84*/      ldr r0, [r4, #4]
/*0x7d86*/      bl call_701c
/*0x7d8a*/      ldrb r0, [r4, #0x11]
/*0x7d8c*/      pop.w {r4, r5, r6, lr}
/*0x7d90*/      movs r2, #1
/*0x7d92*/      movs r1, #9
/*0x7d94*/      b.w call_61fc

            data_7d98:
/*0x7d98*/  .word 0x00008d18 /* possible pointer */
            data_7d9c:
/*0x7d9c*/  .word 0x20001c70

/*0x7da0*/  .byte 0x01
/*0x7da1*/  .byte 0x21
/*0x7da2*/  .byte 0x81
/*0x7da3*/  .byte 0x40
/*0x7da4*/  .byte 0x02 /* (dest, size) */
/*0x7da5*/  .byte 0x48
/*0x7da6*/  .byte 0x82
/*0x7da7*/  .byte 0x79
/*0x7da8*/  .byte 0x11
/*0x7da9*/  .byte 0x43
/*0x7daa*/  .byte 0x81
/*0x7dab*/  .byte 0x71
/*0x7dac*/  .byte 0x70
/*0x7dad*/  .byte 0x47
/*0x7dae*/  .byte 0x00
/*0x7daf*/  .byte 0x00
/*0x7db0*/  .byte 0x28
/*0x7db1*/  .byte 0x00
/*0x7db2*/  .byte 0x00
/*0x7db3*/  .byte 0x20


            .thumb_func
            call_7db4:
/*0x7db4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7db8*/      ldr r0, [pc, #0xdc] /* data_7e98 */
/*0x7dba*/      ldrb r1, [r0]
/*0x7dbc*/      movs r4, #0
/*0x7dbe*/      sub.w r5, r0, #0xa
/*0x7dc2*/      cmp r1, #1
/*0x7dc4*/      bne jump_7dd2
/*0x7dc6*/      strb r4, [r0]
/*0x7dc8*/      ldrb r0, [r5, #0x10]
/*0x7dca*/      and r0, r0, #7
/*0x7dce*/      bl call_6138
            jump_7dd2:
/*0x7dd2*/      ldr r6, [pc, #0xc8] /* data_7e9c */
/*0x7dd4*/      ldr r7, [pc, #0xc8] /* data_7ea0 */
/*0x7dd6*/      ldrb r0, [r6]
/*0x7dd8*/      cbz r0, jump_7de6
/*0x7dda*/      cmp r0, #2
/*0x7ddc*/      beq jump_7e10
/*0x7dde*/      cmp r0, #4
/*0x7de0*/      beq jump_7de6
/*0x7de2*/      cmp r0, #5
/*0x7de4*/      bne jump_7e22
            jump_7de6:
/*0x7de6*/      ldrb r0, [r5, #6]
/*0x7de8*/      lsls r0, r0, #0x1b
/*0x7dea*/      bpl jump_7e22
/*0x7dec*/      movs r0, #1
/*0x7dee*/      strb r0, [r6]
/*0x7df0*/      movs r2, #0x40
/*0x7df2*/      ldr r1, [pc, #0xb0] /* data_7ea4 */
/*0x7df4*/      movs r0, #4
/*0x7df6*/      bl call_7420
/*0x7dfa*/      ldr r2, [pc, #0xa8] /* data_7ea4 */
/*0x7dfc*/      rsb.w r1, r0, #0x40
/*0x7e00*/      add r0, r2
/*0x7e02*/      bl mem_zero /* (dest, size) */
/*0x7e06*/      ldrb r0, [r5, #6]
/*0x7e08*/      bic r0, r0, #0x10
/*0x7e0c*/      strb r0, [r5, #6]
/*0x7e0e*/      b jump_7e22
            jump_7e10:
/*0x7e10*/      ldr r0, [r7, #0x50]
/*0x7e12*/      lsls r0, r0, #0x1e
/*0x7e14*/      bpl jump_7e22
/*0x7e16*/      movs r2, #0x40
/*0x7e18*/      ldr r1, [pc, #0x88] /* data_7ea4 */
/*0x7e1a*/      movs r0, #3
/*0x7e1c*/      bl call_7480
/*0x7e20*/      strb r4, [r6]
            jump_7e22:
/*0x7e22*/      ldr r0, [r7, #0x28]
/*0x7e24*/      lsls r0, r0, #0x1e
/*0x7e26*/      bpl jump_7e58
/*0x7e28*/      ldrb r0, [r5]
/*0x7e2a*/      cbz r0, jump_7e30
/*0x7e2c*/      strb r4, [r5]
/*0x7e2e*/      b jump_7e4c
            jump_7e30:
/*0x7e30*/      ldr r1, [pc, #0x74] /* data_7ea8 */
/*0x7e32*/      ldr r0, [r1]
/*0x7e34*/      cbnz r0, jump_7e58
/*0x7e36*/      add.w r0, r1, #0xc
/*0x7e3a*/      ldr r0, [r0]
/*0x7e3c*/      cbz r0, jump_7e58
/*0x7e3e*/      mov.w r2, #0xfa0
/*0x7e42*/      muls r0, r2, r0
/*0x7e44*/      asrs r2, r2, #3
/*0x7e46*/      udiv r0, r0, r2
/*0x7e4a*/      str r0, [r1]
            jump_7e4c:
/*0x7e4c*/      ldr r1, [pc, #0x48] /* data_7e98 */
/*0x7e4e*/      movs r2, #8
/*0x7e50*/      adds r1, #0x12
/*0x7e52*/      movs r0, #1
/*0x7e54*/      bl call_7480
            jump_7e58:
/*0x7e58*/      ldr r0, [r7, #0x3c]
/*0x7e5a*/      lsls r0, r0, #0x1e
/*0x7e5c*/      bpl jump_7e92
/*0x7e5e*/      ldrb r0, [r5, #2]
/*0x7e60*/      cbz r0, jump_7e6c
/*0x7e62*/      ldr r1, [pc, #0x34] /* data_7e98 */
/*0x7e64*/      movs r2, #5
/*0x7e66*/      strb r4, [r5, #2]
/*0x7e68*/      adds r1, #0xa
/*0x7e6a*/      b jump_7e88
            jump_7e6c:
/*0x7e6c*/      ldrb r0, [r5, #1]
/*0x7e6e*/      cbz r0, jump_7e7a
/*0x7e70*/      ldr r1, [pc, #0x24] /* data_7e98 */
/*0x7e72*/      movs r2, #2
/*0x7e74*/      strb r4, [r5, #1]
/*0x7e76*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x7e78*/      b jump_7e88
            jump_7e7a:
/*0x7e7a*/      ldrb r0, [r5, #3]
/*0x7e7c*/      cmp r0, #0
/*0x7e7e*/      beq jump_7e92
/*0x7e80*/      ldr r1, [pc, #0x24] /* data_7ea8 */
/*0x7e82*/      movs r2, #0x1f
/*0x7e84*/      strb r4, [r5, #3]
/*0x7e86*/      adds r1, #0x18
            jump_7e88:
/*0x7e88*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7e8c*/      movs r0, #2
/*0x7e8e*/      b.w call_7480
            jump_7e92:
/*0x7e92*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7e96*/  .byte 0x00
/*0x7e97*/  .byte 0x00

            data_7e98:
/*0x7e98*/  .word 0x20000032
            data_7e9c:
/*0x7e9c*/  .word 0x2000004c
            data_7ea0:
/*0x7ea0*/  .word 0x400a8000
            data_7ea4:
/*0x7ea4*/  .word 0x20000540
            data_7ea8:
/*0x7ea8*/  .word 0x200004c8

/*0x7eac*/  .byte 0xf0
/*0x7ead*/  .byte 0xb5
/*0x7eae*/  .byte 0x01
/*0x7eaf*/  .byte 0x88
/*0x7eb0*/  .byte 0x4f
/*0x7eb1*/  .byte 0xf4
/*0x7eb2*/  .byte 0x80
/*0x7eb3*/  .byte 0x76
/*0x7eb4*/  .byte 0x40
/*0x7eb5*/  .byte 0xf6
/*0x7eb6*/  .byte 0x21
/*0x7eb7*/  .byte 0x15
/*0x7eb8*/  .byte 0x77
/*0x7eb9*/  .byte 0x00
/*0x7eba*/  .byte 0x01
/*0x7ebb*/  .byte 0x23
/*0x7ebc*/  .byte 0x35
/*0x7ebd*/  .byte 0x4c
/*0x7ebe*/  .byte 0xa1
/*0x7ebf*/  .byte 0xf6
/*0x7ec0*/  .byte 0x21
/*0x7ec1*/  .byte 0x12
/*0x7ec2*/  .byte 0xa9
/*0x7ec3*/  .byte 0x42
/*0x7ec4*/  .byte 0x3c
/*0x7ec5*/  .byte 0xd0
/*0x7ec6*/  .byte 0x0d
/*0x7ec7*/  .byte 0xdc
/*0x7ec8*/  .byte 0x12
/*0x7ec9*/  .byte 0xf5
/*0x7eca*/  .byte 0xf0
/*0x7ecb*/  .byte 0x61
/*0x7ecc*/  .byte 0x13
/*0x7ecd*/  .byte 0xd0
/*0x7ece*/  .byte 0xb1
/*0x7ecf*/  .byte 0x42
/*0x7ed0*/  .byte 0x30
/*0x7ed1*/  .byte 0xd0
/*0x7ed2*/  .byte 0xb9
/*0x7ed3*/  .byte 0x42
/*0x7ed4*/  .byte 0x45
/*0x7ed5*/  .byte 0xd1
/*0x7ed6*/  .byte 0x81
/*0x7ed7*/  .byte 0x88
/*0x7ed8*/  .byte 0x00
/*0x7ed9*/  .byte 0x29
/*0x7eda*/  .byte 0x42
/*0x7edb*/  .byte 0xd1
/*0x7edc*/  .byte 0x2e
/*0x7edd*/  .byte 0x49
/*0x7ede*/  .byte 0xc0
/*0x7edf*/  .byte 0xe9
/*0x7ee0*/  .byte 0x07
/*0x7ee1*/  .byte 0x13
/*0x7ee2*/  .byte 0x53
/*0x7ee3*/  .byte 0xe0
/*0x7ee4*/  .byte 0x00
/*0x7ee5*/  .byte 0x25
/*0x7ee6*/  .byte 0xb2
/*0x7ee7*/  .byte 0x42
/*0x7ee8*/  .byte 0x3d
/*0x7ee9*/  .byte 0xd0
/*0x7eea*/  .byte 0xba
/*0x7eeb*/  .byte 0x42
/*0x7eec*/  .byte 0x39
/*0x7eed*/  .byte 0xd1
/*0x7eee*/  .byte 0x82
/*0x7eef*/  .byte 0x88
/*0x7ef0*/  .byte 0x81
/*0x7ef1*/  .byte 0x78
/*0x7ef2*/  .byte 0xba
/*0x7ef3*/  .byte 0xb3
/*0x7ef4*/  .byte 0x49
/*0x7ef5*/  .byte 0xe0
/*0x7ef6*/  .byte 0xc5
/*0x7ef7*/  .byte 0x78
/*0x7ef8*/  .byte 0x82
/*0x7ef9*/  .byte 0x78
/*0x7efa*/  .byte 0xc4
/*0x7efb*/  .byte 0x88
/*0x7efc*/  .byte 0x81
/*0x7efd*/  .byte 0x88
/*0x7efe*/  .byte 0x01
/*0x7eff*/  .byte 0x2d
/*0x7f00*/  .byte 0x2f
/*0x7f01*/  .byte 0xd1
/*0x7f02*/  .byte 0x61
/*0x7f03*/  .byte 0xb1
/*0x7f04*/  .byte 0x01
/*0x7f05*/  .byte 0x29
/*0x7f06*/  .byte 0x2c
/*0x7f07*/  .byte 0xd0
/*0x7f08*/  .byte 0x02
/*0x7f09*/  .byte 0x29
/*0x7f0a*/  .byte 0x2a
/*0x7f0b*/  .byte 0xd1
/*0x7f0c*/  .byte 0x01
/*0x7f0d*/  .byte 0x2a
/*0x7f0e*/  .byte 0x09
/*0x7f0f*/  .byte 0xd0
/*0x7f10*/  .byte 0x02
/*0x7f11*/  .byte 0x2a
/*0x7f12*/  .byte 0x0c
/*0x7f13*/  .byte 0xd0
/*0x7f14*/  .byte 0x04
/*0x7f15*/  .byte 0x2a
/*0x7f16*/  .byte 0x24
/*0x7f17*/  .byte 0xd1
/*0x7f18*/  .byte 0x1e
/*0x7f19*/  .byte 0x49
/*0x7f1a*/  .byte 0x0c
/*0x7f1b*/  .byte 0x31
/*0x7f1c*/  .byte 0x04
/*0x7f1d*/  .byte 0xe0
/*0x7f1e*/  .byte 0x1e
/*0x7f1f*/  .byte 0x49
/*0x7f20*/  .byte 0x18
/*0x7f21*/  .byte 0x31
/*0x7f22*/  .byte 0x01
/*0x7f23*/  .byte 0xe0
/*0x7f24*/  .byte 0x1c
/*0x7f25*/  .byte 0x49
/*0x7f26*/  .byte 0x09
/*0x7f27*/  .byte 0x1d
/*0x7f28*/  .byte 0xc0
/*0x7f29*/  .byte 0xe9
/*0x7f2a*/  .byte 0x07
/*0x7f2b*/  .byte 0x14
/*0x7f2c*/  .byte 0x2e
/*0x7f2d*/  .byte 0xe0
/*0x7f2e*/  .byte 0x1a
/*0x7f2f*/  .byte 0x49
/*0x7f30*/  .byte 0x10
/*0x7f31*/  .byte 0x31
/*0x7f32*/  .byte 0xf9
/*0x7f33*/  .byte 0xe7
/*0x7f34*/  .byte 0x81
/*0x7f35*/  .byte 0x88
/*0x7f36*/  .byte 0x00
/*0x7f37*/  .byte 0x29
/*0x7f38*/  .byte 0x13
/*0x7f39*/  .byte 0xd1
/*0x7f3a*/  .byte 0xc0
/*0x7f3b*/  .byte 0xe9
/*0x7f3c*/  .byte 0x07
/*0x7f3d*/  .byte 0x43
/*0x7f3e*/  .byte 0x25
/*0x7f3f*/  .byte 0xe0
/*0x7f40*/  .byte 0xc3
/*0x7f41*/  .byte 0x78
/*0x7f42*/  .byte 0xc2
/*0x7f43*/  .byte 0x88
/*0x7f44*/  .byte 0x81
/*0x7f45*/  .byte 0x88
/*0x7f46*/  .byte 0x02
/*0x7f47*/  .byte 0x62
/*0x7f48*/  .byte 0x02
/*0x7f49*/  .byte 0x2b
/*0x7f4a*/  .byte 0x0a
/*0x7f4b*/  .byte 0xd1
/*0x7f4c*/  .byte 0x00
/*0x7f4d*/  .byte 0x29
/*0x7f4e*/  .byte 0x08
/*0x7f4f*/  .byte 0xd1
/*0x7f50*/  .byte 0x11
/*0x7f51*/  .byte 0x4a
/*0x7f52*/  .byte 0x0c
/*0x7f53*/  .byte 0x32
/*0x7f54*/  .byte 0xc2
/*0x7f55*/  .byte 0x61
/*0x7f56*/  .byte 0x11
/*0x7f57*/  .byte 0x4a
/*0x7f58*/  .byte 0xc0
/*0x7f59*/  .byte 0xe9
/*0x7f5a*/  .byte 0x0a
/*0x7f5b*/  .byte 0x21
/*0x7f5c*/  .byte 0x02
/*0x7f5d*/  .byte 0x21
/*0x7f5e*/  .byte 0x80
/*0x7f5f*/  .byte 0xf8
/*0x7f60*/  .byte 0x24
/*0x7f61*/  .byte 0x10
/*0x7f62*/  .byte 0xf0
/*0x7f63*/  .byte 0xbd
/*0x7f64*/  .byte 0x0e
/*0x7f65*/  .byte 0xe0
/*0x7f66*/  .byte 0x82
/*0x7f67*/  .byte 0x88
/*0x7f68*/  .byte 0xc1
/*0x7f69*/  .byte 0x78
/*0x7f6a*/  .byte 0x00
/*0x7f6b*/  .byte 0x2a
/*0x7f6c*/  .byte 0xf9
/*0x7f6d*/  .byte 0xd1
/*0x7f6e*/  .byte 0x4f
/*0x7f6f*/  .byte 0xf4
/*0x7f70*/  .byte 0x7a
/*0x7f71*/  .byte 0x62
/*0x7f72*/  .byte 0x21
/*0x7f73*/  .byte 0x60
/*0x7f74*/  .byte 0x51
/*0x7f75*/  .byte 0x43
/*0x7f76*/  .byte 0xd2
/*0x7f77*/  .byte 0x10
/*0x7f78*/  .byte 0xb1
/*0x7f79*/  .byte 0xfb
/*0x7f7a*/  .byte 0xf2
/*0x7f7b*/  .byte 0xf1
/*0x7f7c*/  .byte 0x05
/*0x7f7d*/  .byte 0x4a
/*0x7f7e*/  .byte 0x0c
/*0x7f7f*/  .byte 0x3a
/*0x7f80*/  .byte 0x11
/*0x7f81*/  .byte 0x60
/*0x7f82*/  .byte 0x02
/*0x7f83*/  .byte 0xe0
/*0x7f84*/  .byte 0x04
/*0x7f85*/  .byte 0x4a
/*0x7f86*/  .byte 0x12
/*0x7f87*/  .byte 0x1f
/*0x7f88*/  .byte 0x11
/*0x7f89*/  .byte 0x71
/*0x7f8a*/  .byte 0x05
/*0x7f8b*/  .byte 0x62
/*0x7f8c*/  .byte 0x80
/*0x7f8d*/  .byte 0xf8
/*0x7f8e*/  .byte 0x24
/*0x7f8f*/  .byte 0x30
/*0x7f90*/  .byte 0xe7
/*0x7f91*/  .byte 0xe7
/*0x7f92*/  .byte 0x00
/*0x7f93*/  .byte 0x00
/*0x7f94*/  .byte 0xd4
/*0x7f95*/  .byte 0x04
/*0x7f96*/  .byte 0x00
/*0x7f97*/  .byte 0x20
/*0x7f98*/  .byte 0x2c
/*0x7f99*/  .byte 0x00
/*0x7f9a*/  .byte 0x00
/*0x7f9b*/  .byte 0x20
/*0x7f9c*/  .byte 0xa1
/*0x7f9d*/  .byte 0x7f
/*0x7f9e*/  .byte 0x00
/*0x7f9f*/  .byte 0x00
/*0x7fa0*/  .byte 0x01
/*0x7fa1*/  .byte 0x4a
/*0x7fa2*/  .byte 0x01
/*0x7fa3*/  .byte 0x21
/*0x7fa4*/  .byte 0x11
/*0x7fa5*/  .byte 0x54
/*0x7fa6*/  .byte 0x70
/*0x7fa7*/  .byte 0x47
/*0x7fa8*/  .byte 0x32
/*0x7fa9*/  .byte 0x00
/*0x7faa*/  .byte 0x00
/*0x7fab*/  .byte 0x20
/*0x7fac*/  .byte 0xc2
/*0x7fad*/  .byte 0x78
/*0x7fae*/  .byte 0x81
/*0x7faf*/  .byte 0x88
/*0x7fb0*/  .byte 0x01
/*0x7fb1*/  .byte 0x23
/*0x7fb2*/  .byte 0x21
/*0x7fb3*/  .byte 0x2a
/*0x7fb4*/  .byte 0x07
/*0x7fb5*/  .byte 0xd0
/*0x7fb6*/  .byte 0x22
/*0x7fb7*/  .byte 0x2a
/*0x7fb8*/  .byte 0x21
/*0x7fb9*/  .byte 0xd1
/*0x7fba*/  .byte 0xa9
/*0x7fbb*/  .byte 0xb1
/*0x7fbc*/  .byte 0x01
/*0x7fbd*/  .byte 0x29
/*0x7fbe*/  .byte 0x17
/*0x7fbf*/  .byte 0xd0
/*0x7fc0*/  .byte 0x02
/*0x7fc1*/  .byte 0x29
/*0x7fc2*/  .byte 0x1a
/*0x7fc3*/  .byte 0xd1
/*0x7fc4*/  .byte 0x1c
/*0x7fc5*/  .byte 0xe0
/*0x7fc6*/  .byte 0x21
/*0x7fc7*/  .byte 0xb1
/*0x7fc8*/  .byte 0x01
/*0x7fc9*/  .byte 0x29
/*0x7fca*/  .byte 0x05
/*0x7fcb*/  .byte 0xd0
/*0x7fcc*/  .byte 0x02
/*0x7fcd*/  .byte 0x29
/*0x7fce*/  .byte 0x06
/*0x7fcf*/  .byte 0xd1
/*0x7fd0*/  .byte 0x07
/*0x7fd1*/  .byte 0xe0
/*0x7fd2*/  .byte 0xc1
/*0x7fd3*/  .byte 0x68
/*0x7fd4*/  .byte 0x12
/*0x7fd5*/  .byte 0x31
/*0x7fd6*/  .byte 0x01
/*0x7fd7*/  .byte 0xe0
/*0x7fd8*/  .byte 0xc1
/*0x7fd9*/  .byte 0x68
/*0x7fda*/  .byte 0x2b
/*0x7fdb*/  .byte 0x31
/*0x7fdc*/  .byte 0xc1
/*0x7fdd*/  .byte 0x61
/*0x7fde*/  .byte 0x09
/*0x7fdf*/  .byte 0x21
/*0x7fe0*/  .byte 0x0a
/*0x7fe1*/  .byte 0xe0
/*0x7fe2*/  .byte 0xc1
/*0x7fe3*/  .byte 0x68
/*0x7fe4*/  .byte 0x4b
/*0x7fe5*/  .byte 0x31
/*0x7fe6*/  .byte 0xf9
/*0x7fe7*/  .byte 0xe7
/*0x7fe8*/  .byte 0x08
/*0x7fe9*/  .byte 0x49
/*0x7fea*/  .byte 0xc1
/*0x7feb*/  .byte 0x61
/*0x7fec*/  .byte 0x40
/*0x7fed*/  .byte 0x21
/*0x7fee*/  .byte 0x03
/*0x7fef*/  .byte 0xe0
/*0x7ff0*/  .byte 0x06
/*0x7ff1*/  .byte 0x49
/*0x7ff2*/  .byte 0xac
/*0x7ff3*/  .byte 0x39
/*0x7ff4*/  .byte 0xc1
/*0x7ff5*/  .byte 0x61
/*0x7ff6*/  .byte 0x22
/*0x7ff7*/  .byte 0x21
/*0x7ff8*/  .byte 0x01
/*0x7ff9*/  .byte 0x62
/*0x7ffa*/  .byte 0x80
/*0x7ffb*/  .byte 0xf8
/*0x7ffc*/  .byte 0x24
/*0x7ffd*/  .byte 0x30
/*0x7ffe*/  .byte 0x70
/*0x7fff*/  .byte 0x47
/*0x8000*/  .byte 0x02
/*0x8001*/  .byte 0x49
/*0x8002*/  .byte 0x88
/*0x8003*/  .byte 0x39
/*0x8004*/  .byte 0xc1
/*0x8005*/  .byte 0x61
/*0x8006*/  .byte 0x86
/*0x8007*/  .byte 0x21
/*0x8008*/  .byte 0xf6
/*0x8009*/  .byte 0xe7
/*0x800a*/  .byte 0x00
/*0x800b*/  .byte 0x00
/*0x800c*/  .byte 0x6c
/*0x800d*/  .byte 0x8a
/*0x800e*/  .byte 0x00
/*0x800f*/  .byte 0x00


            .thumb_func
            call_8010:
/*0x8010*/      push {r4, r5, r6, lr}
/*0x8012*/      mov r4, r0
/*0x8014*/      movs r0, #0
/*0x8016*/      bl call_7378
/*0x801a*/      mov r5, r0
/*0x801c*/      ldr r0, [r4, #0x20]
/*0x801e*/      adds r1, r0, #1
/*0x8020*/      beq jump_8050
/*0x8022*/      ldrb.w r1, [r4, #0x24]
/*0x8026*/      cmp r1, #1
/*0x8028*/      bne jump_8050
/*0x802a*/      cmp r0, r5
/*0x802c*/      blo jump_8034
/*0x802e*/      subs r0, r0, r5
/*0x8030*/      str r0, [r4, #0x20]
/*0x8032*/      b jump_8040
            jump_8034:
/*0x8034*/      mov r5, r0
/*0x8036*/      movs r0, #0
/*0x8038*/      str r0, [r4, #0x20]
/*0x803a*/      movs r0, #2
/*0x803c*/      strb.w r0, [r4, #0x24]
            jump_8040:
/*0x8040*/      mov r2, r5
/*0x8042*/      movs r0, #0
/*0x8044*/      ldr r1, [r4, #0x1c]
/*0x8046*/      bl call_7480
/*0x804a*/      ldr r0, [r4, #0x1c]
/*0x804c*/      add r0, r5
/*0x804e*/      str r0, [r4, #0x1c]
            jump_8050:
/*0x8050*/      pop {r4, r5, r6, pc}

/*0x8052*/  .byte 0x00
/*0x8053*/  .byte 0x00


            .thumb_func
            call_8054:
/*0x8054*/      push {r4, lr}
/*0x8056*/      mov r4, r0
/*0x8058*/      movs r0, #0
/*0x805a*/      strb.w r0, [r4, #0x24]
/*0x805e*/      str r0, [r4, #0x20]
/*0x8060*/      ldrb r0, [r4]
/*0x8062*/      ands r0, r0, #0x60
/*0x8066*/      beq jump_806e
/*0x8068*/      cmp r0, #0x20
/*0x806a*/      bne jump_8080
/*0x806c*/      b jump_8076
            jump_806e:
/*0x806e*/      mov r0, r4
/*0x8070*/      bl call_80f4
/*0x8074*/      b jump_8080
            jump_8076:
/*0x8076*/      ldr r0, [pc, #0x40] /* data_80b8 */
/*0x8078*/      ldr r1, [r0, #0x14]
/*0x807a*/      cbz r1, jump_8080
/*0x807c*/      mov r0, r4
/*0x807e*/      blx r1
            jump_8080:
/*0x8080*/      ldrb.w r0, [r4, #0x24]
/*0x8084*/      cmp r0, #1
/*0x8086*/      beq jump_8096
/*0x8088*/      cmp r0, #2
/*0x808a*/      beq jump_80aa
/*0x808c*/      pop.w {r4, lr}
/*0x8090*/      movs r0, #0
/*0x8092*/      b.w jump_7460
            jump_8096:
/*0x8096*/      ldrh r0, [r4, #6]
/*0x8098*/      ldr r1, [r4, #0x20]
/*0x809a*/      cmp r1, r0
/*0x809c*/      ble jump_80a0
/*0x809e*/      str r0, [r4, #0x20]
            jump_80a0:
/*0x80a0*/      mov r0, r4
/*0x80a2*/      pop.w {r4, lr}
/*0x80a6*/      b.w call_8010
            jump_80aa:
/*0x80aa*/      movs r2, #0
/*0x80ac*/      pop.w {r4, lr}
/*0x80b0*/      mov r1, r2
/*0x80b2*/      mov r0, r2
/*0x80b4*/      b.w call_7480

            data_80b8:
/*0x80b8*/  .word 0x00008b54 /* possible pointer */

            jump_80bc:
/*0x80bc*/      push {r4, lr}
/*0x80be*/      mov r4, r0
/*0x80c0*/      movs r0, #0
/*0x80c2*/      strb r0, [r4, #0x19]
/*0x80c4*/      cbz r1, jump_80da
/*0x80c6*/      cmp r1, #1
/*0x80c8*/      beq jump_80de
/*0x80ca*/      cmp r1, #2
/*0x80cc*/      bne jump_80f0
/*0x80ce*/      ldrb r0, [r4, #4]
/*0x80d0*/      and r0, r0, #0xf
/*0x80d4*/      bl call_7386
/*0x80d8*/      b jump_80de
            jump_80da:
/*0x80da*/      ldrb.w r0, [r4, #0x34]
            jump_80de:
/*0x80de*/      strb r0, [r4, #0x18]
/*0x80e0*/      add.w r0, r4, #0x18
/*0x80e4*/      str r0, [r4, #0x1c]
/*0x80e6*/      movs r0, #2
/*0x80e8*/      str r0, [r4, #0x20]
/*0x80ea*/      movs r0, #1
/*0x80ec*/      strb.w r0, [r4, #0x24]
            jump_80f0:
/*0x80f0*/      pop {r4, pc}

/*0x80f2*/  .byte 0x00
/*0x80f3*/  .byte 0x00


            .thumb_func
            call_80f4:
/*0x80f4*/      push {r4, r5, r6, lr}
/*0x80f6*/      mov r4, r0
/*0x80f8*/      ldrh r0, [r0]
/*0x80fa*/      movs r5, #1
/*0x80fc*/      cmp.w r0, #0x500
/*0x8100*/      beq jump_81a2
/*0x8102*/      bgt jump_8146
/*0x8104*/      cmp.w r0, #0x100
/*0x8108*/      beq jump_8194
/*0x810a*/      bgt jump_8124
/*0x810c*/      cmp r0, #0x80
/*0x810e*/      beq jump_818c
/*0x8110*/      cmp r0, #0x81
/*0x8112*/      beq jump_8190
/*0x8114*/      cmp r0, #0x82
/*0x8116*/      bne jump_81e6
/*0x8118*/      movs r1, #2
            jump_811a:
/*0x811a*/      mov r0, r4
/*0x811c*/      pop.w {r4, r5, r6, lr}
/*0x8120*/      b.w jump_80bc
            jump_8124:
/*0x8124*/      cmp.w r0, #0x102
/*0x8128*/      beq jump_8198
/*0x812a*/      cmp.w r0, #0x300
/*0x812e*/      beq jump_819c
/*0x8130*/      sub.w r0, r0, #0x300
/*0x8134*/      subs r0, #2
/*0x8136*/      bne jump_81e6
/*0x8138*/      movs r2, #1
            jump_813a:
/*0x813a*/      movs r1, #2
            jump_813c:
/*0x813c*/      mov r0, r4
/*0x813e*/      pop.w {r4, r5, r6, lr}
/*0x8142*/      b.w jump_821c
            jump_8146:
/*0x8146*/      ldr r1, [pc, #0xcc] /* data_8214 */
/*0x8148*/      cmp.w r0, #0x900
/*0x814c*/      beq jump_81ec
/*0x814e*/      bgt jump_8170
/*0x8150*/      cmp.w r0, #0x680
/*0x8154*/      beq jump_81b0
/*0x8156*/      sub.w r0, r0, #0x600
/*0x815a*/      subs r0, #0x81
/*0x815c*/      beq jump_81e8
/*0x815e*/      sub.w r0, r0, #0x100
/*0x8162*/      subs r0, #0xff
/*0x8164*/      bne jump_81e6
/*0x8166*/      add.w r0, r4, #0x30
/*0x816a*/      strd r0, r5, [r4, #0x1c]
/*0x816e*/      b jump_81e2
            jump_8170:
/*0x8170*/      sub.w r0, r0, #0xa00
/*0x8174*/      subs r0, #0x81
/*0x8176*/      beq jump_820e
/*0x8178*/      cmp r0, #0x80
/*0x817a*/      bne jump_81e6
/*0x817c*/      ldr r0, [r1, #0xc]
            jump_817e:
/*0x817e*/      cmp r0, #0
/*0x8180*/      beq jump_81e6
/*0x8182*/      mov r1, r0
/*0x8184*/      mov r0, r4
/*0x8186*/      pop.w {r4, r5, r6, lr}
/*0x818a*/      bx r1
            jump_818c:
/*0x818c*/      movs r1, #0
/*0x818e*/      b jump_811a
            jump_8190:
/*0x8190*/      movs r1, #1
/*0x8192*/      b jump_811a
            jump_8194:
/*0x8194*/      movs r2, #0
/*0x8196*/      b jump_819e
            jump_8198:
/*0x8198*/      movs r2, #0
/*0x819a*/      b jump_813a
            jump_819c:
/*0x819c*/      movs r2, #1
            jump_819e:
/*0x819e*/      movs r1, #0
/*0x81a0*/      b jump_813c
            jump_81a2:
/*0x81a2*/      ldrb r0, [r4, #2]
/*0x81a4*/      bl call_765c
/*0x81a8*/      strb.w r5, [r4, #0x24]
/*0x81ac*/      movs r0, #5
/*0x81ae*/      b jump_8208
            jump_81b0:
/*0x81b0*/      ldrb r0, [r4, #3]
/*0x81b2*/      cmp r0, #1
/*0x81b4*/      beq jump_81d6
/*0x81b6*/      cmp r0, #2
/*0x81b8*/      beq jump_81da
/*0x81ba*/      cmp r0, #3
/*0x81bc*/      bne jump_81e6
/*0x81be*/      ldrb r0, [r4, #2]
/*0x81c0*/      ldr r1, [r4, #0x14]
/*0x81c2*/      cmp r1, r0
/*0x81c4*/      bls jump_81e6
/*0x81c6*/      ldr r1, [r4, #0x10]
/*0x81c8*/      ldr.w r0, [r1, r0, lsl #2]
/*0x81cc*/      cmp r0, #0
/*0x81ce*/      beq jump_81e6
            jump_81d0:
/*0x81d0*/      str r0, [r4, #0x1c]
/*0x81d2*/      ldrb r0, [r0]
/*0x81d4*/      b jump_81e0
            jump_81d6:
/*0x81d6*/      ldr r0, [r4, #8]
/*0x81d8*/      b jump_81d0
            jump_81da:
/*0x81da*/      ldr r0, [r4, #0xc]
/*0x81dc*/      str r0, [r4, #0x1c]
/*0x81de*/      ldrh r0, [r0, #2]
            jump_81e0:
/*0x81e0*/      str r0, [r4, #0x20]
            jump_81e2:
/*0x81e2*/      strb.w r5, [r4, #0x24]
            jump_81e6:
/*0x81e6*/      pop {r4, r5, r6, pc}
            jump_81e8:
/*0x81e8*/      ldr r0, [r1, #8]
/*0x81ea*/      b jump_817e
            jump_81ec:
/*0x81ec*/      ldrb r0, [r4, #2]
/*0x81ee*/      strb.w r0, [r4, #0x30]
/*0x81f2*/      strb.w r5, [r4, #0x24]
/*0x81f6*/      movs r5, #1
            jump_81f8:
/*0x81f8*/      ldr r1, [pc, #0x1c] /* data_8218 */
/*0x81fa*/      sxtb r0, r5
/*0x81fc*/      bl call_73c0
/*0x8200*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x8202*/      cmp r5, #8
/*0x8204*/      blo jump_81f8
/*0x8206*/      movs r0, #6
            jump_8208:
/*0x8208*/      strb.w r0, [r4, #0x32]
/*0x820c*/      pop {r4, r5, r6, pc}
            jump_820e:
/*0x820e*/      ldr r0, [r1, #0x10]
/*0x8210*/      b jump_817e

/*0x8212*/  .byte 0x00
/*0x8213*/  .byte 0x00

            data_8214:
/*0x8214*/  .word 0x00008b54 /* possible pointer */
            data_8218:
/*0x8218*/  .word 0x20000090

            jump_821c:
/*0x821c*/      push {r4, r5, r6, lr}
/*0x821e*/      mov r4, r0
/*0x8220*/      movs r6, #1
/*0x8222*/      cbz r1, jump_823e
/*0x8224*/      cmp r1, #2
/*0x8226*/      bne jump_823c
/*0x8228*/      ldrb r0, [r4, #4]
/*0x822a*/      ands r5, r0, #0xf
/*0x822e*/      beq jump_8238
/*0x8230*/      cbz r2, jump_8254
/*0x8232*/      mov r0, r5
/*0x8234*/      bl call_746c
            jump_8238:
/*0x8238*/      strb.w r6, [r4, #0x24]
            jump_823c:
/*0x823c*/      pop {r4, r5, r6, pc}
            jump_823e:
/*0x823e*/      ldrb r0, [r4, #2]
/*0x8240*/      cmp r0, #1
/*0x8242*/      bne jump_823c
/*0x8244*/      ldrb r0, [r4, #0x34]!
/*0x8248*/      bfi r0, r2, #1, #1
/*0x824c*/      strb r0, [r4], #-0x10
/*0x8250*/      strb r6, [r4]
/*0x8252*/      pop {r4, r5, r6, pc}
            jump_8254:
/*0x8254*/      ldr r0, [r4, #0x38]
/*0x8256*/      cmp r0, #0
/*0x8258*/      bne jump_8238
/*0x825a*/      mov r0, r5
/*0x825c*/      bl call_7320
/*0x8260*/      mov r0, r5
/*0x8262*/      bl call_7310
/*0x8266*/      b jump_8238

            .thumb_func
            call_8268:
/*0x8268*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x826a*/      bmi jump_8276
/*0x826c*/      ldr.w r3, [r0, r2, lsl #2]
/*0x8270*/      str.w r3, [r1, r2, lsl #2]
/*0x8274*/      b call_8268
            jump_8276:
/*0x8276*/      bx lr

            .thumb_func
            call_8278:
/*0x8278*/      ldr r1, [pc, #8] /* data_8284 */
/*0x827a*/      add.w r0, r0, r0, lsl #2
/*0x827e*/      add.w r0, r1, r0, lsl #2
/*0x8282*/      bx lr

            data_8284:
/*0x8284*/  .word 0x400a8014


            .thumb_func
            call_8288:
/*0x8288*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x828c*/      movs r7, #0
/*0x828e*/      mov.w r1, #0x8000
/*0x8292*/      mov r2, r7
/*0x8294*/      mov sl, r1
/*0x8296*/      movs r3, #1
/*0x8298*/      mov r0, r2
/*0x829a*/      bl call_39a8
/*0x829e*/      ldr r0, [pc, #0x90] /* data_8330 */
/*0x82a0*/      bl call_70a8
/*0x82a4*/      ldr r5, [pc, #0x8c] /* data_8334 */
/*0x82a6*/      mov r4, r0
/*0x82a8*/      movw r6, #0xeec0
/*0x82ac*/      cmp r0, #1
/*0x82ae*/      bne jump_82be
/*0x82b0*/      ldr r0, [r5, #0x54]
/*0x82b2*/      orrs r0, r6
/*0x82b4*/      str r0, [r5, #0x54]
/*0x82b6*/      str r6, [r5, #0x58]
/*0x82b8*/      ldr r0, [r5, #0x50]
/*0x82ba*/      orrs r0, r6
/*0x82bc*/      str r0, [r5, #0x50]
            jump_82be:
/*0x82be*/      ldr.w r8, [pc, #0x70] /* data_8330 */
/*0x82c2*/      ldrb.w r0, [r8, #0x32]
/*0x82c6*/      cmp r0, #3
/*0x82c8*/      bne jump_8308
/*0x82ca*/      ldr.w sb, [pc, #0x6c] /* data_8338 */
/*0x82ce*/      ldr.w r0, [sb]
/*0x82d2*/      tst.w r0, #0xc0
/*0x82d6*/      beq jump_8308
/*0x82d8*/      movs r0, #1
/*0x82da*/      bl call_5a04
/*0x82de*/      ldr r1, [pc, #0x5c] /* data_833c */
/*0x82e0*/      strb r7, [r1, #5]
/*0x82e2*/      ldrb.w r0, [r8, #0x32]
/*0x82e6*/      cmp r0, #3
/*0x82e8*/      bne jump_8308
/*0x82ea*/      ldr.w r0, [sb]
/*0x82ee*/      tst.w r0, #0xc0
/*0x82f2*/      beq jump_8308
/*0x82f4*/      bl call_76ac
/*0x82f8*/      mov.w r0, #0x3e8
/*0x82fc*/      bl spin_wait /* (time) */
/*0x8300*/      str r6, [r5, #0x58]
/*0x8302*/      movs r0, #0
/*0x8304*/      bl call_627c
            jump_8308:
/*0x8308*/      ldr r0, [r5, #0x58]
/*0x830a*/      tst r0, r6
/*0x830c*/      beq jump_8320
/*0x830e*/      cmp r4, #1
/*0x8310*/      bne jump_8320
/*0x8312*/      ldr r0, [pc, #0x1c] /* data_8330 */
/*0x8314*/      bl call_7234
/*0x8318*/      cmp r0, #1
/*0x831a*/      bne jump_8320
/*0x831c*/      bl call_7244
            jump_8320:
/*0x8320*/      mov r2, r7
/*0x8322*/      mov r1, sl
/*0x8324*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x8328*/      movs r3, #0
/*0x832a*/      mov r0, r2
/*0x832c*/      b.w call_39a8

            data_8330:
/*0x8330*/  .word 0x20000500
            data_8334:
/*0x8334*/  .word 0x40024000
            data_8338:
/*0x8338*/  .word 0x400a8000
            data_833c:
/*0x833c*/  .word 0x20000028

/*0x8340*/  .byte 0x02
/*0x8341*/  .byte 0xe0
/*0x8342*/  .byte 0x08
/*0x8343*/  .byte 0xc8
/*0x8344*/  .byte 0x12
/*0x8345*/  .byte 0x1f
/*0x8346*/  .byte 0x08
/*0x8347*/  .byte 0xc1
/*0x8348*/  .byte 0x00
/*0x8349*/  .byte 0x2a
/*0x834a*/  .byte 0xfa
/*0x834b*/  .byte 0xd1
/*0x834c*/  .byte 0x70
/*0x834d*/  .byte 0x47
/*0x834e*/  .byte 0x70
/*0x834f*/  .byte 0x47
/*0x8350*/  .byte 0x00
/*0x8351*/  .byte 0x20
/*0x8352*/  .byte 0x01
/*0x8353*/  .byte 0xe0
/*0x8354*/  .byte 0x01
/*0x8355*/  .byte 0xc1
/*0x8356*/  .byte 0x12
/*0x8357*/  .byte 0x1f
/*0x8358*/  .byte 0x00
/*0x8359*/  .byte 0x2a
/*0x835a*/  .byte 0xfb
/*0x835b*/  .byte 0xd1
/*0x835c*/  .byte 0x70
/*0x835d*/  .byte 0x47
/*0x835e*/  .byte 0x00
/*0x835f*/  .byte 0x00


            .thumb_func
            call_8360:
/*0x8360*/      push {r3, r4, r5, lr}
/*0x8362*/      movs r4, #0
/*0x8364*/      str r4, [sp]
/*0x8366*/      ldr r4, [pc, #0x20] /* data_8388 */
/*0x8368*/      ldr r5, [sp, #0x10]
/*0x836a*/      ldrb r2, [r4, r2]
/*0x836c*/      strb.w r2, [sp]
/*0x8370*/      ldrb r2, [r4, r3]
/*0x8372*/      strb.w r2, [sp, #1]
/*0x8376*/      ldrb r2, [r4, r5]
/*0x8378*/      mov r3, r1
/*0x837a*/      strb.w r2, [sp, #2]
/*0x837e*/      mov r2, r3
/*0x8380*/      mov r1, sp
/*0x8382*/      bl call_4c78
/*0x8386*/      pop {r3, r4, r5, pc}

            data_8388:
/*0x8388*/  .word 0x200001f9


            .thumb_func
            main:
/*0x838c*/      bl setup_intr_priority
/*0x8390*/      bl setup_afio_gpio
/*0x8394*/      bl call_47fc
/*0x8398*/      bl call_5ccc
/*0x839c*/      movs r0, #0xff
/*0x839e*/      bl call_3f68
/*0x83a2*/      bl call_6d78
/*0x83a6*/      bl call_6678
/*0x83aa*/      bl call_622c
/*0x83ae*/      bl call_68d0
/*0x83b2*/      bl call_5098
/*0x83b6*/      movs r0, #0
/*0x83b8*/      bl call_48e8
/*0x83bc*/      ldr r1, [pc, #0xbc] /* data_847c */
/*0x83be*/      movs r0, #0
/*0x83c0*/      str r0, [r1]
/*0x83c2*/      bl call_5a94
/*0x83c6*/      bl call_5ac8
/*0x83ca*/      movs r0, #0
/*0x83cc*/      bl call_5a04
/*0x83d0*/      movs r0, #0xa
/*0x83d2*/      bl spin_wait /* (time) */
/*0x83d6*/      movs r0, #1
/*0x83d8*/      bl call_65cc
/*0x83dc*/      bl call_50a4
/*0x83e0*/      ldr r4, [pc, #0x9c] /* data_8480 */
/*0x83e2*/      cbz r0, jump_83e8
/*0x83e4*/      movs r0, #1
/*0x83e6*/      strh r0, [r4, #4]
            jump_83e8:
/*0x83e8*/      ldrh r0, [r4, #4]
/*0x83ea*/      cbz r0, jump_8410
/*0x83ec*/      bl call_6a2c
/*0x83f0*/      bl call_625c
/*0x83f4*/      movs r0, #0
/*0x83f6*/      bl call_65cc
            jump_83fa:
/*0x83fa*/      ldrh r0, [r4, #4]
/*0x83fc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x83fe*/      strh r0, [r4, #4]
/*0x8400*/      bl call_848c
/*0x8404*/      movs r0, #1
/*0x8406*/      bl call_630c
/*0x840a*/      bl call_76ac
/*0x840e*/      b jump_83fa
            jump_8410:
/*0x8410*/      movs r0, #1
/*0x8412*/      bl call_5a04
/*0x8416*/      bl call_7260
/*0x841a*/      ldr r6, [pc, #0x68] /* data_8484 */
/*0x841c*/      ldr r5, [pc, #0x68] /* data_8488 */
            jump_841e:
/*0x841e*/      bl call_75e8
/*0x8422*/      cmp r0, #1
/*0x8424*/      beq jump_8436
/*0x8426*/      cmp r0, #2
/*0x8428*/      beq jump_844a
/*0x842a*/      cmp r0, #3
/*0x842c*/      bne jump_8474
/*0x842e*/      movs r0, #1
/*0x8430*/      bl call_5a04
/*0x8434*/      b jump_8474
            jump_8436:
/*0x8436*/      movs r0, #0
/*0x8438*/      bl call_5a04
/*0x843c*/      bl call_6a2c
/*0x8440*/      bl call_625c
/*0x8444*/      movs r0, #0
/*0x8446*/      bl call_65cc
            jump_844a:
/*0x844a*/      ldrh r0, [r4, #4]
/*0x844c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x844e*/      lsls r0, r0, #0x10
/*0x8450*/      lsrs r0, r0, #0x10
/*0x8452*/      strh r0, [r4, #4]
/*0x8454*/      bne jump_8462
/*0x8456*/      ldr r0, [r5]
/*0x8458*/      cmp r0, r6
/*0x845a*/      bls jump_8462
/*0x845c*/      ldr r0, [r5]
/*0x845e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x8460*/      str r0, [r5]
            jump_8462:
/*0x8462*/      bl handle_frame
/*0x8466*/      bl call_848c
/*0x846a*/      ldrb r0, [r4]
/*0x846c*/      cbnz r0, jump_8474
/*0x846e*/      movs r0, #1
/*0x8470*/      bl call_630c
            jump_8474:
/*0x8474*/      bl call_76ac
/*0x8478*/      b jump_841e

/*0x847a*/  .byte 0x00
/*0x847b*/  .byte 0x00

            data_847c:
/*0x847c*/  .word 0x20000054
            data_8480:
/*0x8480*/  .word 0x2000004c
            data_8484:
/*0x8484*/  .word 0x55aafaf0
            data_8488:
/*0x8488*/  .word 0x20003ffc


            .thumb_func
            call_848c:
/*0x848c*/      push {r4, r5, r6, lr}
/*0x848e*/      ldr r6, [pc, #0xcc] /* data_855c */
/*0x8490*/      movs r4, #0
/*0x8492*/      ldrb r0, [r6, #3]
/*0x8494*/      cbz r0, jump_84b0
/*0x8496*/      movs r0, #1
/*0x8498*/      bl call_48e8
/*0x849c*/      cbz r0, jump_84b0
/*0x849e*/      ldrb r0, [r6, #3]
/*0x84a0*/      cmp r0, #2
/*0x84a2*/      beq jump_84d8
/*0x84a4*/      bl call_3fe8
            jump_84a8:
/*0x84a8*/      strb r4, [r6, #3]
/*0x84aa*/      movs r0, #1
/*0x84ac*/      bl call_5a94
            jump_84b0:
/*0x84b0*/      bl call_54f0
/*0x84b4*/      cmp r0, #0
/*0x84b6*/      beq jump_8558
/*0x84b8*/      ldr r5, [pc, #0xa4] /* data_8560 */
/*0x84ba*/      ldrb r0, [r5, #2]
/*0x84bc*/      cmp r0, #0x20
/*0x84be*/      blo jump_84c8
/*0x84c0*/      subs r0, #0x20
/*0x84c2*/      strb r0, [r5, #2]
/*0x84c4*/      movs r0, #1
/*0x84c6*/      strb r0, [r5, #3]
            jump_84c8:
/*0x84c8*/      ldrb r0, [r5, #1]
/*0x84ca*/      cmp r0, #0xff
/*0x84cc*/      beq jump_84ee
/*0x84ce*/      bl call_4d08
/*0x84d2*/      cmp r0, #1
/*0x84d4*/      beq jump_84de
/*0x84d6*/      b jump_84ee
            jump_84d8:
/*0x84d8*/      bl call_401c
/*0x84dc*/      b jump_84a8
            jump_84de:
/*0x84de*/      ldrb r0, [r5, #1]
/*0x84e0*/      bl call_3f68
/*0x84e4*/      movs r0, #0xff
/*0x84e6*/      strb r0, [r5, #1]
/*0x84e8*/      movs r0, #2
/*0x84ea*/      bl call_5a94
            jump_84ee:
/*0x84ee*/      ldrb r0, [r6, #4]
/*0x84f0*/      cbz r0, jump_8502
/*0x84f2*/      bl call_4d08
/*0x84f6*/      cmp r0, #1
/*0x84f8*/      bne jump_8502
/*0x84fa*/      ldrb r0, [r6, #4]
/*0x84fc*/      bl call_4d34
/*0x8500*/      strb r4, [r6, #4]
            jump_8502:
/*0x8502*/      bl call_6540
/*0x8506*/      bl call_5d34
/*0x850a*/      bl call_6e2c
/*0x850e*/      ldr r0, [pc, #0x54] /* data_8564 */
/*0x8510*/      ldrb r0, [r0, #6]
/*0x8512*/      cmp r0, #1
/*0x8514*/      beq jump_851e
/*0x8516*/      bl call_4d44
/*0x851a*/      bl call_3ae0
            jump_851e:
/*0x851e*/      ldrb r0, [r5, #3]
/*0x8520*/      cbz r0, jump_8526
/*0x8522*/      bl call_4e3c
            jump_8526:
/*0x8526*/      ldrb r0, [r6]
/*0x8528*/      cbz r0, jump_8534
/*0x852a*/      strb r4, [r6]
/*0x852c*/      bl call_590c
/*0x8530*/      bl call_591c
            jump_8534:
/*0x8534*/      ldrb r0, [r6, #1]
/*0x8536*/      cbz r0, jump_853e
/*0x8538*/      strb r4, [r6, #1]
/*0x853a*/      bl call_6864
            jump_853e:
/*0x853e*/      ldrb r0, [r5, #3]
/*0x8540*/      cmp r0, #0
/*0x8542*/      beq jump_8558
/*0x8544*/      ldr r0, [pc, #0x18] /* data_8560 */
/*0x8546*/      ldrb r2, [r5, #2]
/*0x8548*/      .short 0x1d80 /* adds r0, r0, #6 */ 
/*0x854a*/      ldrb r1, [r0, #1]
/*0x854c*/      add r1, r2
/*0x854e*/      strb r1, [r0, #1]
/*0x8550*/      ldrh r0, [r5, #6]
/*0x8552*/      lsrs r0, r0, #1
/*0x8554*/      strh r0, [r5, #6]
/*0x8556*/      strb r4, [r5, #3]
            jump_8558:
/*0x8558*/      pop {r4, r5, r6, pc}

/*0x855a*/  .byte 0x00
/*0x855b*/  .byte 0x00

            data_855c:
/*0x855c*/  .word 0x20000580
            data_8560:
/*0x8560*/  .word 0x2000004c
            data_8564:
/*0x8564*/  .word 0x200018fc


            .thumb_func
            call_8568:
/*0x8568*/      ldr r0, [pc, #0x20] /* data_858c */
/*0x856a*/      ldrb r0, [r0, #2]
/*0x856c*/      cmp r0, #0
/*0x856e*/      beq jump_857c
/*0x8570*/      ldr r0, [pc, #0x1c] /* data_8590 */
/*0x8572*/      movs r1, #1
/*0x8574*/      ldrb r2, [r0]
/*0x8576*/      ldr r0, [pc, #0x1c] /* data_8594 */
/*0x8578*/      cbz r2, jump_857e
/*0x857a*/      strb r1, [r0, #0xa]
            jump_857c:
/*0x857c*/      bx lr
            jump_857e:
/*0x857e*/      movs r2, #0
/*0x8580*/      strb r2, [r0, #0xa]
/*0x8582*/      strb r1, [r0]
/*0x8584*/      movs r1, #3
/*0x8586*/      strb r1, [r0, #4]
/*0x8588*/      b.w call_40d4

            data_858c:
/*0x858c*/  .word 0x2000005c
            data_8590:
/*0x8590*/  .word 0x20000000
            data_8594:
/*0x8594*/  .word 0x20000580

/*0x8598*/  .byte 0x22
/*0x8599*/  .byte 0x23
/*0x859a*/  .byte 0x1c
/*0x859b*/  .byte 0x18
/*0x859c*/  .byte 0x0c
/*0x859d*/  .byte 0x05
/*0x859e*/  .byte 0x05
/*0x859f*/  .byte 0x0a
/*0x85a0*/  .byte 0x04
/*0x85a1*/  .byte 0xe1
/*0x85a2*/  .byte 0xe5
/*0x85a3*/  .byte 0xe4
/*0x85a4*/  .byte 0x29
/*0x85a5*/  .byte 0x00
/*0x85a6*/  .byte 0x00
/*0x85a7*/  .byte 0x00
/*0x85a8*/  .byte 0x14
/*0x85a9*/  .byte 0x86
/*0x85aa*/  .byte 0x00
/*0x85ab*/  .byte 0x00
/*0x85ac*/  .byte 0xc0
/*0x85ad*/  .byte 0x5c
/*0x85ae*/  .byte 0x14
/*0x85af*/  .byte 0x00
/*0x85b0*/  .byte 0x19
/*0x85b1*/  .byte 0x10
/*0x85b2*/  .byte 0x01
/*0x85b3*/  .byte 0x1a
/*0x85b4*/  .byte 0x11
/*0x85b5*/  .byte 0x01
/*0x85b6*/  .byte 0x1b
/*0x85b7*/  .byte 0x12
/*0x85b8*/  .byte 0x01
/*0x85b9*/  .byte 0x1c
/*0x85ba*/  .byte 0x13
/*0x85bb*/  .byte 0x01
/*0x85bc*/  .byte 0x24
/*0x85bd*/  .byte 0x5f
/*0x85be*/  .byte 0x01
/*0x85bf*/  .byte 0x39
/*0x85c0*/  .byte 0x68
/*0x85c1*/  .byte 0x01
/*0x85c2*/  .byte 0x34
/*0x85c3*/  .byte 0x31
/*0x85c4*/  .byte 0x01
/*0x85c5*/  .byte 0x28
/*0x85c6*/  .byte 0x35
/*0x85c7*/  .byte 0x29
/*0x85c8*/  .byte 0x3a
/*0x85c9*/  .byte 0x2a
/*0x85ca*/  .byte 0x3b
/*0x85cb*/  .byte 0x2b
/*0x85cc*/  .byte 0x3c
/*0x85cd*/  .byte 0x2c
/*0x85ce*/  .byte 0x3d
/*0x85cf*/  .byte 0x2d
/*0x85d0*/  .byte 0x3e
/*0x85d1*/  .byte 0x00
/*0x85d2*/  .byte 0x3f
/*0x85d3*/  .byte 0x01
/*0x85d4*/  .byte 0x40
/*0x85d5*/  .byte 0x02
/*0x85d6*/  .byte 0x41
/*0x85d7*/  .byte 0x03
/*0x85d8*/  .byte 0x42
/*0x85d9*/  .byte 0x04
/*0x85da*/  .byte 0x43
/*0x85db*/  .byte 0x05
/*0x85dc*/  .byte 0x44
/*0x85dd*/  .byte 0x06
/*0x85de*/  .byte 0x45
/*0x85df*/  .byte 0x0a
/*0x85e0*/  .byte 0x52
/*0x85e1*/  .byte 0x11
/*0x85e2*/  .byte 0x50
/*0x85e3*/  .byte 0x12
/*0x85e4*/  .byte 0x51
/*0x85e5*/  .byte 0x13
/*0x85e6*/  .byte 0x4f
/*0x85e7*/  .byte 0x0c
/*0x85e8*/  .byte 0x46
/*0x85e9*/  .byte 0x0d
/*0x85ea*/  .byte 0x47
/*0x85eb*/  .byte 0x0e
/*0x85ec*/  .byte 0x48
/*0x85ed*/  .byte 0x41
/*0x85ee*/  .byte 0x65
/*0x85ef*/  .byte 0x10
/*0x85f0*/  .byte 0x4a
/*0x85f1*/  .byte 0x18
/*0x85f2*/  .byte 0x4d
/*0x85f3*/  .byte 0x09
/*0x85f4*/  .byte 0x4b
/*0x85f5*/  .byte 0x0b
/*0x85f6*/  .byte 0x4e
/*0x85f7*/  .byte 0x07
/*0x85f8*/  .byte 0x4c
/*0x85f9*/  .byte 0x15
/*0x85fa*/  .byte 0x4c
/*0x85fb*/  .byte 0x14
/*0x85fc*/  .byte 0x49
/*0x85fd*/  .byte 0x3a
/*0x85fe*/  .byte 0xf5
/*0x85ff*/  .byte 0x3b
/*0x8600*/  .byte 0xf6
/*0x8601*/  .byte 0x3c
/*0x8602*/  .byte 0xf4
/*0x8603*/  .byte 0x31
/*0x8604*/  .byte 0xf2
/*0x8605*/  .byte 0x32
/*0x8606*/  .byte 0xf0
/*0x8607*/  .byte 0x33
/*0x8608*/  .byte 0xf3
/*0x8609*/  .byte 0x08
/*0x860a*/  .byte 0xee
/*0x860b*/  .byte 0xe8
/*0x860c*/  .byte 0xcf
/*0x860d*/  .byte 0xe5
/*0x860e*/  .byte 0xe1
/*0x860f*/  .byte 0xe4
/*0x8610*/  .byte 0xe7
/*0x8611*/  .byte 0xcf
/*0x8612*/  .byte 0x00
/*0x8613*/  .byte 0x00
/*0x8614*/  .byte 0x62
/*0x8615*/  .byte 0x3c
/*0x8616*/  .byte 0x08
/*0x8617*/  .byte 0x00
/*0x8618*/  .byte 0x62
/*0x8619*/  .byte 0x5c
/*0x861a*/  .byte 0x08
/*0x861b*/  .byte 0x00
/*0x861c*/  .byte 0x62
/*0x861d*/  .byte 0x3c
/*0x861e*/  .byte 0x08
/*0x861f*/  .byte 0x00
/*0x8620*/  .byte 0x62
/*0x8621*/  .byte 0x5c
/*0x8622*/  .byte 0x50
/*0x8623*/  .byte 0x03
/*0x8624*/  .byte 0x00
/*0x8625*/  .byte 0xfc
/*0x8626*/  .byte 0x00
/*0x8627*/  .byte 0x00
/*0x8628*/  .byte 0xff
/*0x8629*/  .byte 0xff
/*0x862a*/  .byte 0xff
/*0x862b*/  .byte 0x00
/*0x862c*/  .byte 0x23
/*0x862d*/  .byte 0x24
/*0x862e*/  .byte 0x25
/*0x862f*/  .byte 0x26
/*0x8630*/  .byte 0x27
/*0x8631*/  .byte 0x2d
/*0x8632*/  .byte 0x2e
/*0x8633*/  .byte 0x2a
/*0x8634*/  .byte 0x1c
/*0x8635*/  .byte 0x18
/*0x8636*/  .byte 0x0c
/*0x8637*/  .byte 0x12
/*0x8638*/  .byte 0x13
/*0x8639*/  .byte 0x2f
/*0x863a*/  .byte 0x30
/*0x863b*/  .byte 0x31
/*0x863c*/  .byte 0x0b
/*0x863d*/  .byte 0x0d
/*0x863e*/  .byte 0x0e
/*0x863f*/  .byte 0x0f
/*0x8640*/  .byte 0x33
/*0x8641*/  .byte 0x34
/*0x8642*/  .byte 0x28
/*0x8643*/  .byte 0x00
/*0x8644*/  .byte 0x11
/*0x8645*/  .byte 0x10
/*0x8646*/  .byte 0x36
/*0x8647*/  .byte 0x37
/*0x8648*/  .byte 0x38
/*0x8649*/  .byte 0xe5
/*0x864a*/  .byte 0xc2
/*0x864b*/  .byte 0x00
/*0x864c*/  .byte 0x2c
/*0x864d*/  .byte 0xe6
/*0x864e*/  .byte 0xe7
/*0x864f*/  .byte 0x65
/*0x8650*/  .byte 0xe4
/*0x8651*/  .byte 0xc1
/*0x8652*/  .byte 0xc3
/*0x8653*/  .byte 0x32
/*0x8654*/  .byte 0x29
/*0x8655*/  .byte 0x1e
/*0x8656*/  .byte 0x1f
/*0x8657*/  .byte 0x20
/*0x8658*/  .byte 0x21
/*0x8659*/  .byte 0x22
/*0x865a*/  .byte 0x00
/*0x865b*/  .byte 0x00
/*0x865c*/  .byte 0x2b
/*0x865d*/  .byte 0x14
/*0x865e*/  .byte 0x1a
/*0x865f*/  .byte 0x08
/*0x8660*/  .byte 0x15
/*0x8661*/  .byte 0x17
/*0x8662*/  .byte 0x00
/*0x8663*/  .byte 0x00
/*0x8664*/  .byte 0x39
/*0x8665*/  .byte 0x04
/*0x8666*/  .byte 0x16
/*0x8667*/  .byte 0x07
/*0x8668*/  .byte 0x09
/*0x8669*/  .byte 0x0a
/*0x866a*/  .byte 0x00
/*0x866b*/  .byte 0x00
/*0x866c*/  .byte 0xe1
/*0x866d*/  .byte 0x1d
/*0x866e*/  .byte 0x1b
/*0x866f*/  .byte 0x06
/*0x8670*/  .byte 0x19
/*0x8671*/  .byte 0x05
/*0x8672*/  .byte 0x00
/*0x8673*/  .byte 0x00
/*0x8674*/  .byte 0xe0
/*0x8675*/  .byte 0xe3
/*0x8676*/  .byte 0xe2
/*0x8677*/  .byte 0x6b
/*0x8678*/  .byte 0x64
/*0x8679*/  .byte 0x00
/*0x867a*/  .byte 0x00
/*0x867b*/  .byte 0x00
/*0x867c*/  .byte 0x62
/*0x867d*/  .byte 0x59
/*0x867e*/  .byte 0x5c
/*0x867f*/  .byte 0x5f
/*0x8680*/  .byte 0x53
/*0x8681*/  .byte 0xf4
/*0x8682*/  .byte 0x00
/*0x8683*/  .byte 0x00
/*0x8684*/  .byte 0xc0
/*0x8685*/  .byte 0x5a
/*0x8686*/  .byte 0x5d
/*0x8687*/  .byte 0x60
/*0x8688*/  .byte 0x54
/*0x8689*/  .byte 0xf5
/*0x868a*/  .byte 0x00
/*0x868b*/  .byte 0x00
/*0x868c*/  .byte 0x63
/*0x868d*/  .byte 0x5b
/*0x868e*/  .byte 0x5e
/*0x868f*/  .byte 0x61
/*0x8690*/  .byte 0x55
/*0x8691*/  .byte 0xf6
/*0x8692*/  .byte 0x00
/*0x8693*/  .byte 0x00
/*0x8694*/  .byte 0x58
/*0x8695*/  .byte 0x00
/*0x8696*/  .byte 0x57
/*0x8697*/  .byte 0x00
/*0x8698*/  .byte 0x56
/*0x8699*/  .byte 0xee
/*0x869a*/  .byte 0x00
/*0x869b*/  .byte 0x00
/*0x869c*/  .byte 0x00
/*0x869d*/  .byte 0x40
/*0x869e*/  .byte 0x0b
/*0x869f*/  .byte 0x40
/*0x86a0*/  .byte 0x00
/*0x86a1*/  .byte 0x02
/*0x86a2*/  .byte 0x00
/*0x86a3*/  .byte 0x00
/*0x86a4*/  .byte 0x00
/*0x86a5*/  .byte 0x40
/*0x86a6*/  .byte 0x0b
/*0x86a7*/  .byte 0x40
/*0x86a8*/  .byte 0x00
/*0x86a9*/  .byte 0x04
/*0x86aa*/  .byte 0x00
/*0x86ab*/  .byte 0x00
/*0x86ac*/  .byte 0x00
/*0x86ad*/  .byte 0x00
/*0x86ae*/  .byte 0x0b
/*0x86af*/  .byte 0x40
/*0x86b0*/  .byte 0x40
/*0x86b1*/  .byte 0x00
/*0x86b2*/  .byte 0x00
/*0x86b3*/  .byte 0x00
/*0x86b4*/  .byte 0x00
/*0x86b5*/  .byte 0x00
/*0x86b6*/  .byte 0x0b
/*0x86b7*/  .byte 0x40
/*0x86b8*/  .byte 0x80
/*0x86b9*/  .byte 0x00
/*0x86ba*/  .byte 0x00
/*0x86bb*/  .byte 0x00
/*0x86bc*/  .byte 0x00
/*0x86bd*/  .byte 0x40
/*0x86be*/  .byte 0x0b
/*0x86bf*/  .byte 0x40
/*0x86c0*/  .byte 0x00
/*0x86c1*/  .byte 0x08
/*0x86c2*/  .byte 0x00
/*0x86c3*/  .byte 0x00
/*0x86c4*/  .byte 0x00
/*0x86c5*/  .byte 0x40
/*0x86c6*/  .byte 0x0b
/*0x86c7*/  .byte 0x40
/*0x86c8*/  .byte 0x00
/*0x86c9*/  .byte 0x20
/*0x86ca*/  .byte 0x00
/*0x86cb*/  .byte 0x00
/*0x86cc*/  .byte 0x00
/*0x86cd*/  .byte 0x40
/*0x86ce*/  .byte 0x0b
/*0x86cf*/  .byte 0x40
/*0x86d0*/  .byte 0x00
/*0x86d1*/  .byte 0x40
/*0x86d2*/  .byte 0x00
/*0x86d3*/  .byte 0x00
/*0x86d4*/  .byte 0x00
/*0x86d5*/  .byte 0x40
/*0x86d6*/  .byte 0x0b
/*0x86d7*/  .byte 0x40
/*0x86d8*/  .byte 0x00
/*0x86d9*/  .byte 0x80
/*0x86da*/  .byte 0x00
/*0x86db*/  .byte 0x00
/*0x86dc*/  .byte 0x02
/*0x86dd*/  .byte 0x09
/*0x86de*/  .byte 0x02
/*0x86df*/  .byte 0x0a
/*0x86e0*/  .byte 0x00
/*0x86e1*/  .byte 0x06
/*0x86e2*/  .byte 0x00
/*0x86e3*/  .byte 0x07
/*0x86e4*/  .byte 0x02
/*0x86e5*/  .byte 0x0b
/*0x86e6*/  .byte 0x02
/*0x86e7*/  .byte 0x0d
/*0x86e8*/  .byte 0x02
/*0x86e9*/  .byte 0x0e
/*0x86ea*/  .byte 0x02
/*0x86eb*/  .byte 0x0f
/*0x86ec*/  .byte 0x00
/*0x86ed*/  .byte 0x40
/*0x86ee*/  .byte 0x0b
/*0x86ef*/  .byte 0x40
/*0x86f0*/  .byte 0x10
/*0x86f1*/  .byte 0x00
/*0x86f2*/  .byte 0x00
/*0x86f3*/  .byte 0x00
/*0x86f4*/  .byte 0x00
/*0x86f5*/  .byte 0x20
/*0x86f6*/  .byte 0x0b
/*0x86f7*/  .byte 0x40
/*0x86f8*/  .byte 0x40
/*0x86f9*/  .byte 0x00
/*0x86fa*/  .byte 0x00
/*0x86fb*/  .byte 0x00
/*0x86fc*/  .byte 0x00
/*0x86fd*/  .byte 0x60
/*0x86fe*/  .byte 0x0b
/*0x86ff*/  .byte 0x40
/*0x8700*/  .byte 0x01
/*0x8701*/  .byte 0x00
/*0x8702*/  .byte 0x00
/*0x8703*/  .byte 0x00
/*0x8704*/  .byte 0x00
/*0x8705*/  .byte 0x20
/*0x8706*/  .byte 0x0b
/*0x8707*/  .byte 0x40
/*0x8708*/  .byte 0x00
/*0x8709*/  .byte 0x08
/*0x870a*/  .byte 0x00
/*0x870b*/  .byte 0x00
/*0x870c*/  .byte 0x00
/*0x870d*/  .byte 0x00
/*0x870e*/  .byte 0x0b
/*0x870f*/  .byte 0x40
/*0x8710*/  .byte 0x00
/*0x8711*/  .byte 0x08
/*0x8712*/  .byte 0x00
/*0x8713*/  .byte 0x00
/*0x8714*/  .byte 0x2d
/*0x8715*/  .byte 0x2f
/*0x8716*/  .byte 0x2e
/*0x8717*/  .byte 0x30
/*0x8718*/  .byte 0x14
/*0x8719*/  .byte 0x34
/*0x871a*/  .byte 0x1a
/*0x871b*/  .byte 0x36
/*0x871c*/  .byte 0x08
/*0x871d*/  .byte 0x37
/*0x871e*/  .byte 0x15
/*0x871f*/  .byte 0x13
/*0x8720*/  .byte 0x17
/*0x8721*/  .byte 0x1c
/*0x8722*/  .byte 0x1c
/*0x8723*/  .byte 0x09
/*0x8724*/  .byte 0x18
/*0x8725*/  .byte 0x0a
/*0x8726*/  .byte 0x0c
/*0x8727*/  .byte 0x06
/*0x8728*/  .byte 0x12
/*0x8729*/  .byte 0x15
/*0x872a*/  .byte 0x13
/*0x872b*/  .byte 0x0f
/*0x872c*/  .byte 0x2f
/*0x872d*/  .byte 0x38
/*0x872e*/  .byte 0x30
/*0x872f*/  .byte 0x2e
/*0x8730*/  .byte 0x16
/*0x8731*/  .byte 0x12
/*0x8732*/  .byte 0x07
/*0x8733*/  .byte 0x08
/*0x8734*/  .byte 0x09
/*0x8735*/  .byte 0x18
/*0x8736*/  .byte 0x0a
/*0x8737*/  .byte 0x0c
/*0x8738*/  .byte 0x0b
/*0x8739*/  .byte 0x07
/*0x873a*/  .byte 0x0d
/*0x873b*/  .byte 0x0b
/*0x873c*/  .byte 0x0e
/*0x873d*/  .byte 0x17
/*0x873e*/  .byte 0x0f
/*0x873f*/  .byte 0x11
/*0x8740*/  .byte 0x33
/*0x8741*/  .byte 0x16
/*0x8742*/  .byte 0x34
/*0x8743*/  .byte 0x2d
/*0x8744*/  .byte 0x1d
/*0x8745*/  .byte 0x33
/*0x8746*/  .byte 0x1b
/*0x8747*/  .byte 0x14
/*0x8748*/  .byte 0x06
/*0x8749*/  .byte 0x0d
/*0x874a*/  .byte 0x19
/*0x874b*/  .byte 0x0e
/*0x874c*/  .byte 0x05
/*0x874d*/  .byte 0x1b
/*0x874e*/  .byte 0x11
/*0x874f*/  .byte 0x05
/*0x8750*/  .byte 0x10
/*0x8751*/  .byte 0x10
/*0x8752*/  .byte 0x36
/*0x8753*/  .byte 0x1a
/*0x8754*/  .byte 0x37
/*0x8755*/  .byte 0x19
/*0x8756*/  .byte 0x38
/*0x8757*/  .byte 0x1d
/*0x8758*/  .byte 0x08
/*0x8759*/  .byte 0x09
/*0x875a*/  .byte 0x15
/*0x875b*/  .byte 0x13
/*0x875c*/  .byte 0x17
/*0x875d*/  .byte 0x0a
/*0x875e*/  .byte 0x1c
/*0x875f*/  .byte 0x0d
/*0x8760*/  .byte 0x18
/*0x8761*/  .byte 0x0f
/*0x8762*/  .byte 0x0c
/*0x8763*/  .byte 0x18
/*0x8764*/  .byte 0x12
/*0x8765*/  .byte 0x1c
/*0x8766*/  .byte 0x13
/*0x8767*/  .byte 0x33
/*0x8768*/  .byte 0x16
/*0x8769*/  .byte 0x15
/*0x876a*/  .byte 0x07
/*0x876b*/  .byte 0x16
/*0x876c*/  .byte 0x09
/*0x876d*/  .byte 0x17
/*0x876e*/  .byte 0x0a
/*0x876f*/  .byte 0x07
/*0x8770*/  .byte 0x0d
/*0x8771*/  .byte 0x11
/*0x8772*/  .byte 0x0e
/*0x8773*/  .byte 0x08
/*0x8774*/  .byte 0x0f
/*0x8775*/  .byte 0x0c
/*0x8776*/  .byte 0x33
/*0x8777*/  .byte 0x12
/*0x8778*/  .byte 0x11
/*0x8779*/  .byte 0x0e
/*0x877a*/  .byte 0x00
/*0x877b*/  .byte 0x00
/*0x877c*/  .byte 0x00
/*0x877d*/  .byte 0x02
/*0x877e*/  .byte 0x01
/*0x877f*/  .byte 0x00
/*0x8780*/  .byte 0x00
/*0x8781*/  .byte 0x40
/*0x8782*/  .byte 0x0b
/*0x8783*/  .byte 0x40
/*0x8784*/  .byte 0x00
/*0x8785*/  .byte 0x01
/*0x8786*/  .byte 0x00
/*0x8787*/  .byte 0x00
/*0x8788*/  .byte 0x00
/*0x8789*/  .byte 0x40
/*0x878a*/  .byte 0x0b
/*0x878b*/  .byte 0x40
/*0x878c*/  .byte 0x80
/*0x878d*/  .byte 0x00
/*0x878e*/  .byte 0x00
/*0x878f*/  .byte 0x00
/*0x8790*/  .byte 0x00
/*0x8791*/  .byte 0x20
/*0x8792*/  .byte 0x0b
/*0x8793*/  .byte 0x40
/*0x8794*/  .byte 0x20
/*0x8795*/  .byte 0x00
/*0x8796*/  .byte 0x00
/*0x8797*/  .byte 0x00
/*0x8798*/  .byte 0x00
/*0x8799*/  .byte 0x20
/*0x879a*/  .byte 0x0b
/*0x879b*/  .byte 0x40
/*0x879c*/  .byte 0x10
/*0x879d*/  .byte 0x00
/*0x879e*/  .byte 0x00
/*0x879f*/  .byte 0x00
/*0x87a0*/  .byte 0x00
/*0x87a1*/  .byte 0x20
/*0x87a2*/  .byte 0x0b
/*0x87a3*/  .byte 0x40
/*0x87a4*/  .byte 0x08
/*0x87a5*/  .byte 0x00
/*0x87a6*/  .byte 0x00
/*0x87a7*/  .byte 0x00
/*0x87a8*/  .byte 0x00
/*0x87a9*/  .byte 0x20
/*0x87aa*/  .byte 0x0b
/*0x87ab*/  .byte 0x40
/*0x87ac*/  .byte 0x04
/*0x87ad*/  .byte 0x00
/*0x87ae*/  .byte 0x00
/*0x87af*/  .byte 0x00
/*0x87b0*/  .byte 0x00
/*0x87b1*/  .byte 0x40
/*0x87b2*/  .byte 0x0b
/*0x87b3*/  .byte 0x40
/*0x87b4*/  .byte 0x40
/*0x87b5*/  .byte 0x00
/*0x87b6*/  .byte 0x00
/*0x87b7*/  .byte 0x00
/*0x87b8*/  .byte 0x00
/*0x87b9*/  .byte 0x40
/*0x87ba*/  .byte 0x0b
/*0x87bb*/  .byte 0x40
/*0x87bc*/  .byte 0x20
/*0x87bd*/  .byte 0x00
/*0x87be*/  .byte 0x00
/*0x87bf*/  .byte 0x00
/*0x87c0*/  .byte 0x00
/*0x87c1*/  .byte 0x00
/*0x87c2*/  .byte 0x13
/*0x87c3*/  .byte 0x00
/*0x87c4*/  .byte 0x26
/*0x87c5*/  .byte 0x00
/*0x87c6*/  .byte 0x3a
/*0x87c7*/  .byte 0x00
/*0x87c8*/  .byte 0x4e
/*0x87c9*/  .byte 0x00
/*0x87ca*/  .byte 0x62
/*0x87cb*/  .byte 0x00
/*0x87cc*/  .byte 0x77
/*0x87cd*/  .byte 0x00
/*0x87ce*/  .byte 0x8c
/*0x87cf*/  .byte 0x00
/*0x87d0*/  .byte 0xa1
/*0x87d1*/  .byte 0x00
/*0x87d2*/  .byte 0xb7
/*0x87d3*/  .byte 0x00
/*0x87d4*/  .byte 0xcd
/*0x87d5*/  .byte 0x00
/*0x87d6*/  .byte 0xe3
/*0x87d7*/  .byte 0x00
/*0x87d8*/  .byte 0xfa
/*0x87d9*/  .byte 0x00
/*0x87da*/  .byte 0x11
/*0x87db*/  .byte 0x01
/*0x87dc*/  .byte 0x28
/*0x87dd*/  .byte 0x01
/*0x87de*/  .byte 0x40
/*0x87df*/  .byte 0x01
/*0x87e0*/  .byte 0x58
/*0x87e1*/  .byte 0x01
/*0x87e2*/  .byte 0x71
/*0x87e3*/  .byte 0x01
/*0x87e4*/  .byte 0x8a
/*0x87e5*/  .byte 0x01
/*0x87e6*/  .byte 0xa3
/*0x87e7*/  .byte 0x01
/*0x87e8*/  .byte 0xbd
/*0x87e9*/  .byte 0x01
/*0x87ea*/  .byte 0xd7
/*0x87eb*/  .byte 0x01
/*0x87ec*/  .byte 0xf1
/*0x87ed*/  .byte 0x01
/*0x87ee*/  .byte 0x0c
/*0x87ef*/  .byte 0x02
/*0x87f0*/  .byte 0x28
/*0x87f1*/  .byte 0x02
/*0x87f2*/  .byte 0x43
/*0x87f3*/  .byte 0x02
/*0x87f4*/  .byte 0x60
/*0x87f5*/  .byte 0x02
/*0x87f6*/  .byte 0x7c
/*0x87f7*/  .byte 0x02
/*0x87f8*/  .byte 0x9a
/*0x87f9*/  .byte 0x02
/*0x87fa*/  .byte 0xb7
/*0x87fb*/  .byte 0x02
/*0x87fc*/  .byte 0xd5
/*0x87fd*/  .byte 0x02
/*0x87fe*/  .byte 0xf4
/*0x87ff*/  .byte 0x02
/*0x8800*/  .byte 0x13
/*0x8801*/  .byte 0x03
/*0x8802*/  .byte 0x32
/*0x8803*/  .byte 0x03
/*0x8804*/  .byte 0x53
/*0x8805*/  .byte 0x03
/*0x8806*/  .byte 0x73
/*0x8807*/  .byte 0x03
/*0x8808*/  .byte 0x94
/*0x8809*/  .byte 0x03
/*0x880a*/  .byte 0xb6
/*0x880b*/  .byte 0x03
/*0x880c*/  .byte 0xd8 /* possible pointer */
/*0x880d*/  .byte 0x03
/*0x880e*/  .byte 0xfb
/*0x880f*/  .byte 0x03
/*0x8810*/  .byte 0x1e
/*0x8811*/  .byte 0x04
/*0x8812*/  .byte 0x42
/*0x8813*/  .byte 0x04
/*0x8814*/  .byte 0x66
/*0x8815*/  .byte 0x04
/*0x8816*/  .byte 0x8b
/*0x8817*/  .byte 0x04
/*0x8818*/  .byte 0xb1
/*0x8819*/  .byte 0x04
/*0x881a*/  .byte 0xd7
/*0x881b*/  .byte 0x04
/*0x881c*/  .byte 0xfd
/*0x881d*/  .byte 0x04
/*0x881e*/  .byte 0x25
/*0x881f*/  .byte 0x05
/*0x8820*/  .byte 0x4d
/*0x8821*/  .byte 0x05
/*0x8822*/  .byte 0x75
/*0x8823*/  .byte 0x05
/*0x8824*/  .byte 0x9f
/*0x8825*/  .byte 0x05
/*0x8826*/  .byte 0xc8
/*0x8827*/  .byte 0x05
/*0x8828*/  .byte 0xf3
/*0x8829*/  .byte 0x05
/*0x882a*/  .byte 0x1e
/*0x882b*/  .byte 0x06
/*0x882c*/  .byte 0x4a
/*0x882d*/  .byte 0x06
/*0x882e*/  .byte 0x77
/*0x882f*/  .byte 0x06
/*0x8830*/  .byte 0xa4
/*0x8831*/  .byte 0x06
/*0x8832*/  .byte 0xd2
/*0x8833*/  .byte 0x06
/*0x8834*/  .byte 0x01
/*0x8835*/  .byte 0x07
/*0x8836*/  .byte 0x31
/*0x8837*/  .byte 0x07
/*0x8838*/  .byte 0x61
/*0x8839*/  .byte 0x07
/*0x883a*/  .byte 0x92
/*0x883b*/  .byte 0x07
/*0x883c*/  .byte 0xc4
/*0x883d*/  .byte 0x07
/*0x883e*/  .byte 0xf6
/*0x883f*/  .byte 0x07
/*0x8840*/  .byte 0x2a
/*0x8841*/  .byte 0x08
/*0x8842*/  .byte 0x5e
/*0x8843*/  .byte 0x08
/*0x8844*/  .byte 0x93
/*0x8845*/  .byte 0x08
/*0x8846*/  .byte 0xc9
/*0x8847*/  .byte 0x08
/*0x8848*/  .byte 0x00
/*0x8849*/  .byte 0x09
/*0x884a*/  .byte 0x38
/*0x884b*/  .byte 0x09
/*0x884c*/  .byte 0x70
/*0x884d*/  .byte 0x09
/*0x884e*/  .byte 0xaa
/*0x884f*/  .byte 0x09
/*0x8850*/  .byte 0xe4
/*0x8851*/  .byte 0x09
/*0x8852*/  .byte 0x1f
/*0x8853*/  .byte 0x0a
/*0x8854*/  .byte 0x5b
/*0x8855*/  .byte 0x0a
/*0x8856*/  .byte 0x99
/*0x8857*/  .byte 0x0a
/*0x8858*/  .byte 0xd7
/*0x8859*/  .byte 0x0a
/*0x885a*/  .byte 0x16
/*0x885b*/  .byte 0x0b
/*0x885c*/  .byte 0x56
/*0x885d*/  .byte 0x0b
/*0x885e*/  .byte 0x97
/*0x885f*/  .byte 0x0b
/*0x8860*/  .byte 0xd9
/*0x8861*/  .byte 0x0b
/*0x8862*/  .byte 0x1d
/*0x8863*/  .byte 0x0c
/*0x8864*/  .byte 0x61
/*0x8865*/  .byte 0x0c
/*0x8866*/  .byte 0xa6
/*0x8867*/  .byte 0x0c
/*0x8868*/  .byte 0xed
/*0x8869*/  .byte 0x0c
/*0x886a*/  .byte 0x34
/*0x886b*/  .byte 0x0d
/*0x886c*/  .byte 0x7d
/*0x886d*/  .byte 0x0d
/*0x886e*/  .byte 0xc7
/*0x886f*/  .byte 0x0d
/*0x8870*/  .byte 0x12
/*0x8871*/  .byte 0x0e
/*0x8872*/  .byte 0x5e
/*0x8873*/  .byte 0x0e
/*0x8874*/  .byte 0xac
/*0x8875*/  .byte 0x0e
/*0x8876*/  .byte 0xfb
/*0x8877*/  .byte 0x0e
/*0x8878*/  .byte 0x4b
/*0x8879*/  .byte 0x0f
/*0x887a*/  .byte 0x9c
/*0x887b*/  .byte 0x0f
/*0x887c*/  .byte 0xee
/*0x887d*/  .byte 0x0f
/*0x887e*/  .byte 0x42
/*0x887f*/  .byte 0x10
/*0x8880*/  .byte 0x97
/*0x8881*/  .byte 0x10
/*0x8882*/  .byte 0xee
/*0x8883*/  .byte 0x10
/*0x8884*/  .byte 0x46
/*0x8885*/  .byte 0x11
/*0x8886*/  .byte 0x9f
/*0x8887*/  .byte 0x11
/*0x8888*/  .byte 0xfa /* possible pointer */
/*0x8889*/  .byte 0x11
/*0x888a*/  .byte 0x56
/*0x888b*/  .byte 0x12
/*0x888c*/  .byte 0xb4
/*0x888d*/  .byte 0x12
/*0x888e*/  .byte 0x13
/*0x888f*/  .byte 0x13
/*0x8890*/  .byte 0x73
/*0x8891*/  .byte 0x13
/*0x8892*/  .byte 0xd5
/*0x8893*/  .byte 0x13
/*0x8894*/  .byte 0x39
/*0x8895*/  .byte 0x14
/*0x8896*/  .byte 0x9e
/*0x8897*/  .byte 0x14
/*0x8898*/  .byte 0x05
/*0x8899*/  .byte 0x15
/*0x889a*/  .byte 0x6e
/*0x889b*/  .byte 0x15
/*0x889c*/  .byte 0xd8
/*0x889d*/  .byte 0x15
/*0x889e*/  .byte 0x44
/*0x889f*/  .byte 0x16
/*0x88a0*/  .byte 0xb2
/*0x88a1*/  .byte 0x16
/*0x88a2*/  .byte 0x21
/*0x88a3*/  .byte 0x17
/*0x88a4*/  .byte 0x92
/*0x88a5*/  .byte 0x17
/*0x88a6*/  .byte 0x05
/*0x88a7*/  .byte 0x18
/*0x88a8*/  .byte 0x7a
/*0x88a9*/  .byte 0x18
/*0x88aa*/  .byte 0xf0
/*0x88ab*/  .byte 0x18
/*0x88ac*/  .byte 0x69
/*0x88ad*/  .byte 0x19
/*0x88ae*/  .byte 0xe3
/*0x88af*/  .byte 0x19
/*0x88b0*/  .byte 0x5f
/*0x88b1*/  .byte 0x1a
/*0x88b2*/  .byte 0xde
/*0x88b3*/  .byte 0x1a
/*0x88b4*/  .byte 0x5e
/*0x88b5*/  .byte 0x1b
/*0x88b6*/  .byte 0xe0
/*0x88b7*/  .byte 0x1b
/*0x88b8*/  .byte 0x65
/*0x88b9*/  .byte 0x1c
/*0x88ba*/  .byte 0xeb
/*0x88bb*/  .byte 0x1c
/*0x88bc*/  .byte 0x74
/*0x88bd*/  .byte 0x1d
/*0x88be*/  .byte 0xff
/*0x88bf*/  .byte 0x1d
/*0x88c0*/  .byte 0x8c
/*0x88c1*/  .byte 0x1e
/*0x88c2*/  .byte 0x1b
/*0x88c3*/  .byte 0x1f
/*0x88c4*/  .byte 0xac
/*0x88c5*/  .byte 0x1f
/*0x88c6*/  .byte 0x40
/*0x88c7*/  .byte 0x20
/*0x88c8*/  .byte 0xd6
/*0x88c9*/  .byte 0x20
/*0x88ca*/  .byte 0x6f
/*0x88cb*/  .byte 0x21
/*0x88cc*/  .byte 0x0a
/*0x88cd*/  .byte 0x22
/*0x88ce*/  .byte 0xa8
/*0x88cf*/  .byte 0x22
/*0x88d0*/  .byte 0x48
/*0x88d1*/  .byte 0x23
/*0x88d2*/  .byte 0xea
/*0x88d3*/  .byte 0x23
/*0x88d4*/  .byte 0x8f
/*0x88d5*/  .byte 0x24
/*0x88d6*/  .byte 0x37
/*0x88d7*/  .byte 0x25
/*0x88d8*/  .byte 0xe1
/*0x88d9*/  .byte 0x25
/*0x88da*/  .byte 0x8e
/*0x88db*/  .byte 0x26
/*0x88dc*/  .byte 0x3e
/*0x88dd*/  .byte 0x27
/*0x88de*/  .byte 0xf1
/*0x88df*/  .byte 0x27
/*0x88e0*/  .byte 0xa6
/*0x88e1*/  .byte 0x28
/*0x88e2*/  .byte 0x5f
/*0x88e3*/  .byte 0x29
/*0x88e4*/  .byte 0x1a
/*0x88e5*/  .byte 0x2a
/*0x88e6*/  .byte 0xd8
/*0x88e7*/  .byte 0x2a
/*0x88e8*/  .byte 0x99
/*0x88e9*/  .byte 0x2b
/*0x88ea*/  .byte 0x5e
/*0x88eb*/  .byte 0x2c
/*0x88ec*/  .byte 0x25
/*0x88ed*/  .byte 0x2d
/*0x88ee*/  .byte 0xf0
/*0x88ef*/  .byte 0x2d
/*0x88f0*/  .byte 0xbe
/*0x88f1*/  .byte 0x2e
/*0x88f2*/  .byte 0x8f
/*0x88f3*/  .byte 0x2f
/*0x88f4*/  .byte 0x63
/*0x88f5*/  .byte 0x30
/*0x88f6*/  .byte 0x3b
/*0x88f7*/  .byte 0x31
/*0x88f8*/  .byte 0x16
/*0x88f9*/  .byte 0x32
/*0x88fa*/  .byte 0xf5
/*0x88fb*/  .byte 0x32
/*0x88fc*/  .byte 0xd7
/*0x88fd*/  .byte 0x33
/*0x88fe*/  .byte 0xbd
/*0x88ff*/  .byte 0x34
/*0x8900*/  .byte 0xa7
/*0x8901*/  .byte 0x35
/*0x8902*/  .byte 0x94
/*0x8903*/  .byte 0x36
/*0x8904*/  .byte 0x85
/*0x8905*/  .byte 0x37
/*0x8906*/  .byte 0x7a
/*0x8907*/  .byte 0x38
/*0x8908*/  .byte 0x72
/*0x8909*/  .byte 0x39
/*0x890a*/  .byte 0x6f
/*0x890b*/  .byte 0x3a
/*0x890c*/  .byte 0x70
/*0x890d*/  .byte 0x3b
/*0x890e*/  .byte 0x74
/*0x890f*/  .byte 0x3c
/*0x8910*/  .byte 0x7d
/*0x8911*/  .byte 0x3d
/*0x8912*/  .byte 0x8a
/*0x8913*/  .byte 0x3e
/*0x8914*/  .byte 0x9c
/*0x8915*/  .byte 0x3f
/*0x8916*/  .byte 0xb1
/*0x8917*/  .byte 0x40
/*0x8918*/  .byte 0xcb
/*0x8919*/  .byte 0x41
/*0x891a*/  .byte 0xea
/*0x891b*/  .byte 0x42
/*0x891c*/  .byte 0x0d
/*0x891d*/  .byte 0x44
/*0x891e*/  .byte 0x35
/*0x891f*/  .byte 0x45
/*0x8920*/  .byte 0x61
/*0x8921*/  .byte 0x46
/*0x8922*/  .byte 0x93
/*0x8923*/  .byte 0x47
/*0x8924*/  .byte 0xc9
/*0x8925*/  .byte 0x48
/*0x8926*/  .byte 0x04
/*0x8927*/  .byte 0x4a
/*0x8928*/  .byte 0x44
/*0x8929*/  .byte 0x4b
/*0x892a*/  .byte 0x89
/*0x892b*/  .byte 0x4c
/*0x892c*/  .byte 0xd3
/*0x892d*/  .byte 0x4d
/*0x892e*/  .byte 0x22
/*0x892f*/  .byte 0x4f
/*0x8930*/  .byte 0x77
/*0x8931*/  .byte 0x50
/*0x8932*/  .byte 0xd2
/*0x8933*/  .byte 0x51
/*0x8934*/  .byte 0x31
/*0x8935*/  .byte 0x53
/*0x8936*/  .byte 0x97
/*0x8937*/  .byte 0x54
/*0x8938*/  .byte 0x02
/*0x8939*/  .byte 0x56
/*0x893a*/  .byte 0x72
/*0x893b*/  .byte 0x57
/*0x893c*/  .byte 0xe9
/*0x893d*/  .byte 0x58
/*0x893e*/  .byte 0x66
/*0x893f*/  .byte 0x5a
/*0x8940*/  .byte 0xe8
/*0x8941*/  .byte 0x5b
/*0x8942*/  .byte 0x71
/*0x8943*/  .byte 0x5d
/*0x8944*/  .byte 0x00
/*0x8945*/  .byte 0x5f
/*0x8946*/  .byte 0x95
/*0x8947*/  .byte 0x60
/*0x8948*/  .byte 0x31
/*0x8949*/  .byte 0x62
/*0x894a*/  .byte 0xd3
/*0x894b*/  .byte 0x63
/*0x894c*/  .byte 0x7c
/*0x894d*/  .byte 0x65
/*0x894e*/  .byte 0x2c
/*0x894f*/  .byte 0x67
/*0x8950*/  .byte 0xe3
/*0x8951*/  .byte 0x68
/*0x8952*/  .byte 0xa0
/*0x8953*/  .byte 0x6a
/*0x8954*/  .byte 0x65
/*0x8955*/  .byte 0x6c
/*0x8956*/  .byte 0x31
/*0x8957*/  .byte 0x6e
/*0x8958*/  .byte 0x04
/*0x8959*/  .byte 0x70
/*0x895a*/  .byte 0xde
/*0x895b*/  .byte 0x71
/*0x895c*/  .byte 0xc0
/*0x895d*/  .byte 0x73
/*0x895e*/  .byte 0xaa
/*0x895f*/  .byte 0x75
/*0x8960*/  .byte 0x9c
/*0x8961*/  .byte 0x77
/*0x8962*/  .byte 0x95
/*0x8963*/  .byte 0x79
/*0x8964*/  .byte 0x96
/*0x8965*/  .byte 0x7b
/*0x8966*/  .byte 0xa0
/*0x8967*/  .byte 0x7d
/*0x8968*/  .byte 0xb2
/*0x8969*/  .byte 0x7f
/*0x896a*/  .byte 0xcc
/*0x896b*/  .byte 0x81
/*0x896c*/  .byte 0xef
/*0x896d*/  .byte 0x83
/*0x896e*/  .byte 0x1a
/*0x896f*/  .byte 0x86
/*0x8970*/  .byte 0x4f
/*0x8971*/  .byte 0x88
/*0x8972*/  .byte 0x8c
/*0x8973*/  .byte 0x8a
/*0x8974*/  .byte 0xd3
/*0x8975*/  .byte 0x8c
/*0x8976*/  .byte 0x22
/*0x8977*/  .byte 0x8f
/*0x8978*/  .byte 0x7b
/*0x8979*/  .byte 0x91
/*0x897a*/  .byte 0xde
/*0x897b*/  .byte 0x93
/*0x897c*/  .byte 0x4a
/*0x897d*/  .byte 0x96
/*0x897e*/  .byte 0xc0
/*0x897f*/  .byte 0x98
/*0x8980*/  .byte 0x40
/*0x8981*/  .byte 0x9b
/*0x8982*/  .byte 0xcb
/*0x8983*/  .byte 0x9d
/*0x8984*/  .byte 0x5f
/*0x8985*/  .byte 0xa0
/*0x8986*/  .byte 0xff
/*0x8987*/  .byte 0xa2
/*0x8988*/  .byte 0xa8
/*0x8989*/  .byte 0xa5
/*0x898a*/  .byte 0x5d
/*0x898b*/  .byte 0xa8
/*0x898c*/  .byte 0x1d
/*0x898d*/  .byte 0xab
/*0x898e*/  .byte 0xe8
/*0x898f*/  .byte 0xad
/*0x8990*/  .byte 0xbe
/*0x8991*/  .byte 0xb0
/*0x8992*/  .byte 0x9f
/*0x8993*/  .byte 0xb3
/*0x8994*/  .byte 0x8d
/*0x8995*/  .byte 0xb6
/*0x8996*/  .byte 0x86
/*0x8997*/  .byte 0xb9
/*0x8998*/  .byte 0x8c
/*0x8999*/  .byte 0xbc
/*0x899a*/  .byte 0x9d
/*0x899b*/  .byte 0xbf
/*0x899c*/  .byte 0xbc
/*0x899d*/  .byte 0xc2
/*0x899e*/  .byte 0xe6
/*0x899f*/  .byte 0xc5
/*0x89a0*/  .byte 0x1e
/*0x89a1*/  .byte 0xc9
/*0x89a2*/  .byte 0x63
/*0x89a3*/  .byte 0xcc
/*0x89a4*/  .byte 0xb5
/*0x89a5*/  .byte 0xcf
/*0x89a6*/  .byte 0x15
/*0x89a7*/  .byte 0xd3
/*0x89a8*/  .byte 0x82
/*0x89a9*/  .byte 0xd6
/*0x89aa*/  .byte 0xfd
/*0x89ab*/  .byte 0xd9
/*0x89ac*/  .byte 0x87
/*0x89ad*/  .byte 0xdd
/*0x89ae*/  .byte 0x1f
/*0x89af*/  .byte 0xe1
/*0x89b0*/  .byte 0xc5
/*0x89b1*/  .byte 0xe4
/*0x89b2*/  .byte 0x7a
/*0x89b3*/  .byte 0xe8
/*0x89b4*/  .byte 0x3f
/*0x89b5*/  .byte 0xec
/*0x89b6*/  .byte 0x12
/*0x89b7*/  .byte 0xf0
/*0x89b8*/  .byte 0xf5
/*0x89b9*/  .byte 0xf3
/*0x89ba*/  .byte 0xe9
/*0x89bb*/  .byte 0xf7
/*0x89bc*/  .byte 0xec
/*0x89bd*/  .byte 0xfb
/*0x89be*/  .byte 0xff
/*0x89bf*/  .byte 0xff
/*0x89c0*/  .byte 0x06
/*0x89c1*/  .byte 0x00
/*0x89c2*/  .byte 0xff
/*0x89c3*/  .byte 0x09
/*0x89c4*/  .byte 0x01
/*0x89c5*/  .byte 0xa1
/*0x89c6*/  .byte 0x01
/*0x89c7*/  .byte 0x09
/*0x89c8*/  .byte 0x02
/*0x89c9*/  .byte 0x15
/*0x89ca*/  .byte 0x00
/*0x89cb*/  .byte 0x26
/*0x89cc*/  .byte 0xff
/*0x89cd*/  .byte 0x00
/*0x89ce*/  .byte 0x75
/*0x89cf*/  .byte 0x08
/*0x89d0*/  .byte 0x95
/*0x89d1*/  .byte 0x40
/*0x89d2*/  .byte 0x81
/*0x89d3*/  .byte 0x02
/*0x89d4*/  .byte 0x09
/*0x89d5*/  .byte 0x03
/*0x89d6*/  .byte 0x15
/*0x89d7*/  .byte 0x00
/*0x89d8*/  .byte 0x26
/*0x89d9*/  .byte 0xff
/*0x89da*/  .byte 0x00
/*0x89db*/  .byte 0x75
/*0x89dc*/  .byte 0x08
/*0x89dd*/  .byte 0x95
/*0x89de*/  .byte 0x40
/*0x89df*/  .byte 0x91
/*0x89e0*/  .byte 0x02
/*0x89e1*/  .byte 0xc0
/*0x89e2*/  .byte 0x00
/*0x89e3*/  .byte 0x00
/*0x89e4*/  .byte 0x05
/*0x89e5*/  .byte 0x01
/*0x89e6*/  .byte 0x09
/*0x89e7*/  .byte 0x80
/*0x89e8*/  .byte 0xa1
/*0x89e9*/  .byte 0x01
/*0x89ea*/  .byte 0x85
/*0x89eb*/  .byte 0x01
/*0x89ec*/  .byte 0x19
/*0x89ed*/  .byte 0x81
/*0x89ee*/  .byte 0x29
/*0x89ef*/  .byte 0x83
/*0x89f0*/  .byte 0x15
/*0x89f1*/  .byte 0x00
/*0x89f2*/  .byte 0x25
/*0x89f3*/  .byte 0x01
/*0x89f4*/  .byte 0x95
/*0x89f5*/  .byte 0x03
/*0x89f6*/  .byte 0x75
/*0x89f7*/  .byte 0x01
/*0x89f8*/  .byte 0x81
/*0x89f9*/  .byte 0x02
/*0x89fa*/  .byte 0x95
/*0x89fb*/  .byte 0x01
/*0x89fc*/  .byte 0x75
/*0x89fd*/  .byte 0x05
/*0x89fe*/  .byte 0x81
/*0x89ff*/  .byte 0x01
/*0x8a00*/  .byte 0xc0
/*0x8a01*/  .byte 0x05
/*0x8a02*/  .byte 0x0c
/*0x8a03*/  .byte 0x09
/*0x8a04*/  .byte 0x01
/*0x8a05*/  .byte 0xa1
/*0x8a06*/  .byte 0x01
/*0x8a07*/  .byte 0x85
/*0x8a08*/  .byte 0x02
/*0x8a09*/  .byte 0x15
/*0x8a0a*/  .byte 0x00
/*0x8a0b*/  .byte 0x25
/*0x8a0c*/  .byte 0x01
/*0x8a0d*/  .byte 0x95
/*0x8a0e*/  .byte 0x12
/*0x8a0f*/  .byte 0x75
/*0x8a10*/  .byte 0x01
/*0x8a11*/  .byte 0x0a
/*0x8a12*/  .byte 0x83
/*0x8a13*/  .byte 0x01
/*0x8a14*/  .byte 0x0a
/*0x8a15*/  .byte 0x8a
/*0x8a16*/  .byte 0x01
/*0x8a17*/  .byte 0x0a
/*0x8a18*/  .byte 0x92
/*0x8a19*/  .byte 0x01
/*0x8a1a*/  .byte 0x0a
/*0x8a1b*/  .byte 0x94
/*0x8a1c*/  .byte 0x01
/*0x8a1d*/  .byte 0x09
/*0x8a1e*/  .byte 0xcd
/*0x8a1f*/  .byte 0x09
/*0x8a20*/  .byte 0xb7
/*0x8a21*/  .byte 0x09
/*0x8a22*/  .byte 0xb6
/*0x8a23*/  .byte 0x09
/*0x8a24*/  .byte 0xb5
/*0x8a25*/  .byte 0x09
/*0x8a26*/  .byte 0xe2
/*0x8a27*/  .byte 0x09
/*0x8a28*/  .byte 0xea
/*0x8a29*/  .byte 0x09
/*0x8a2a*/  .byte 0xe9
/*0x8a2b*/  .byte 0x0a
/*0x8a2c*/  .byte 0x21
/*0x8a2d*/  .byte 0x02
/*0x8a2e*/  .byte 0x0a
/*0x8a2f*/  .byte 0x23
/*0x8a30*/  .byte 0x02
/*0x8a31*/  .byte 0x0a
/*0x8a32*/  .byte 0x24
/*0x8a33*/  .byte 0x02
/*0x8a34*/  .byte 0x0a
/*0x8a35*/  .byte 0x25
/*0x8a36*/  .byte 0x02
/*0x8a37*/  .byte 0x0a
/*0x8a38*/  .byte 0x26
/*0x8a39*/  .byte 0x02
/*0x8a3a*/  .byte 0x0a
/*0x8a3b*/  .byte 0x27
/*0x8a3c*/  .byte 0x02
/*0x8a3d*/  .byte 0x0a
/*0x8a3e*/  .byte 0x2a
/*0x8a3f*/  .byte 0x02
/*0x8a40*/  .byte 0x81
/*0x8a41*/  .byte 0x02
/*0x8a42*/  .byte 0x95
/*0x8a43*/  .byte 0x01
/*0x8a44*/  .byte 0x75
/*0x8a45*/  .byte 0x0e
/*0x8a46*/  .byte 0x81
/*0x8a47*/  .byte 0x01
/*0x8a48*/  .byte 0xc0
/*0x8a49*/  .byte 0x05
/*0x8a4a*/  .byte 0x01
/*0x8a4b*/  .byte 0x09
/*0x8a4c*/  .byte 0x06
/*0x8a4d*/  .byte 0xa1
/*0x8a4e*/  .byte 0x01
/*0x8a4f*/  .byte 0x85
/*0x8a50*/  .byte 0x04
/*0x8a51*/  .byte 0x05
/*0x8a52*/  .byte 0x07
/*0x8a53*/  .byte 0x95
/*0x8a54*/  .byte 0x01
/*0x8a55*/  .byte 0x75
/*0x8a56*/  .byte 0x08
/*0x8a57*/  .byte 0x81
/*0x8a58*/  .byte 0x03
/*0x8a59*/  .byte 0x95
/*0x8a5a*/  .byte 0xe8
/*0x8a5b*/  .byte 0x75
/*0x8a5c*/  .byte 0x01
/*0x8a5d*/  .byte 0x15
/*0x8a5e*/  .byte 0x00
/*0x8a5f*/  .byte 0x25
/*0x8a60*/  .byte 0x01
/*0x8a61*/  .byte 0x05
/*0x8a62*/  .byte 0x07
/*0x8a63*/  .byte 0x19
/*0x8a64*/  .byte 0x00
/*0x8a65*/  .byte 0x29
/*0x8a66*/  .byte 0xe7
/*0x8a67*/  .byte 0x81
/*0x8a68*/  .byte 0x00
/*0x8a69*/  .byte 0xc0
/*0x8a6a*/  .byte 0x00
/*0x8a6b*/  .byte 0x00
/*0x8a6c*/  .byte 0x05
/*0x8a6d*/  .byte 0x01
/*0x8a6e*/  .byte 0x09
/*0x8a6f*/  .byte 0x06
/*0x8a70*/  .byte 0xa1
/*0x8a71*/  .byte 0x01
/*0x8a72*/  .byte 0x05
/*0x8a73*/  .byte 0x07
/*0x8a74*/  .byte 0x19
/*0x8a75*/  .byte 0xe0
/*0x8a76*/  .byte 0x29
/*0x8a77*/  .byte 0xe7
/*0x8a78*/  .byte 0x15
/*0x8a79*/  .byte 0x00
/*0x8a7a*/  .byte 0x25
/*0x8a7b*/  .byte 0x01
/*0x8a7c*/  .byte 0x75
/*0x8a7d*/  .byte 0x01
/*0x8a7e*/  .byte 0x95
/*0x8a7f*/  .byte 0x08
/*0x8a80*/  .byte 0x81
/*0x8a81*/  .byte 0x02
/*0x8a82*/  .byte 0x95
/*0x8a83*/  .byte 0x01
/*0x8a84*/  .byte 0x75
/*0x8a85*/  .byte 0x08
/*0x8a86*/  .byte 0x81
/*0x8a87*/  .byte 0x03
/*0x8a88*/  .byte 0x95
/*0x8a89*/  .byte 0x03
/*0x8a8a*/  .byte 0x75
/*0x8a8b*/  .byte 0x01
/*0x8a8c*/  .byte 0x05
/*0x8a8d*/  .byte 0x08
/*0x8a8e*/  .byte 0x19
/*0x8a8f*/  .byte 0x01
/*0x8a90*/  .byte 0x29
/*0x8a91*/  .byte 0x03
/*0x8a92*/  .byte 0x91
/*0x8a93*/  .byte 0x02
/*0x8a94*/  .byte 0x95
/*0x8a95*/  .byte 0x01
/*0x8a96*/  .byte 0x75
/*0x8a97*/  .byte 0x05
/*0x8a98*/  .byte 0x91
/*0x8a99*/  .byte 0x03
/*0x8a9a*/  .byte 0x95
/*0x8a9b*/  .byte 0x06
/*0x8a9c*/  .byte 0x75
/*0x8a9d*/  .byte 0x08
/*0x8a9e*/  .byte 0x15
/*0x8a9f*/  .byte 0x00
/*0x8aa0*/  .byte 0x26
/*0x8aa1*/  .byte 0xa4
/*0x8aa2*/  .byte 0x00
/*0x8aa3*/  .byte 0x05
/*0x8aa4*/  .byte 0x07
/*0x8aa5*/  .byte 0x19
/*0x8aa6*/  .byte 0x00
/*0x8aa7*/  .byte 0x29
/*0x8aa8*/  .byte 0xa4
/*0x8aa9*/  .byte 0x81
/*0x8aaa*/  .byte 0x00
/*0x8aab*/  .byte 0xc0
/*0x8aac*/  .byte 0x09
/*0x8aad*/  .byte 0x02
/*0x8aae*/  .byte 0x5b
/*0x8aaf*/  .byte 0x00
/*0x8ab0*/  .byte 0x03
/*0x8ab1*/  .byte 0x01
/*0x8ab2*/  .byte 0x00
/*0x8ab3*/  .byte 0xa0
/*0x8ab4*/  .byte 0x32
/*0x8ab5*/  .byte 0x09
/*0x8ab6*/  .byte 0x04
/*0x8ab7*/  .byte 0x00
/*0x8ab8*/  .byte 0x00
/*0x8ab9*/  .byte 0x01
/*0x8aba*/  .byte 0x03
/*0x8abb*/  .byte 0x01
/*0x8abc*/  .byte 0x01
/*0x8abd*/  .byte 0x00
/*0x8abe*/  .byte 0x09
/*0x8abf*/  .byte 0x21
/*0x8ac0*/  .byte 0x11
/*0x8ac1*/  .byte 0x01
/*0x8ac2*/  .byte 0x00
/*0x8ac3*/  .byte 0x01
/*0x8ac4*/  .byte 0x22
/*0x8ac5*/  .byte 0x40
/*0x8ac6*/  .byte 0x00
/*0x8ac7*/  .byte 0x07
/*0x8ac8*/  .byte 0x05
/*0x8ac9*/  .byte 0x81
/*0x8aca*/  .byte 0x03
/*0x8acb*/  .byte 0x08
/*0x8acc*/  .byte 0x00
/*0x8acd*/  .byte 0x01
/*0x8ace*/  .byte 0x09
/*0x8acf*/  .byte 0x04
/*0x8ad0*/  .byte 0x01
/*0x8ad1*/  .byte 0x00
/*0x8ad2*/  .byte 0x02
/*0x8ad3*/  .byte 0x03
/*0x8ad4*/  .byte 0x00
/*0x8ad5*/  .byte 0x00
/*0x8ad6*/  .byte 0x00 /* (dest, size) */
/*0x8ad7*/  .byte 0x09
/*0x8ad8*/  .byte 0x21
/*0x8ad9*/  .byte 0x11
/*0x8ada*/  .byte 0x01
/*0x8adb*/  .byte 0x00
/*0x8adc*/  .byte 0x01
/*0x8add*/  .byte 0x22
/*0x8ade*/  .byte 0x22
/*0x8adf*/  .byte 0x00
/*0x8ae0*/  .byte 0x07
/*0x8ae1*/  .byte 0x05
/*0x8ae2*/  .byte 0x83
/*0x8ae3*/  .byte 0x03
/*0x8ae4*/  .byte 0x40 /* (dest, size) */
/*0x8ae5*/  .byte 0x00
/*0x8ae6*/  .byte 0x01
/*0x8ae7*/  .byte 0x07
/*0x8ae8*/  .byte 0x05
/*0x8ae9*/  .byte 0x04
/*0x8aea*/  .byte 0x03
/*0x8aeb*/  .byte 0x40
/*0x8aec*/  .byte 0x00
/*0x8aed*/  .byte 0x01
/*0x8aee*/  .byte 0x09
/*0x8aef*/  .byte 0x04
/*0x8af0*/  .byte 0x02
/*0x8af1*/  .byte 0x00
/*0x8af2*/  .byte 0x01
/*0x8af3*/  .byte 0x03
/*0x8af4*/  .byte 0x00
/*0x8af5*/  .byte 0x00
/*0x8af6*/  .byte 0x00
/*0x8af7*/  .byte 0x09
/*0x8af8*/  .byte 0x21 /* possible pointer */
/*0x8af9*/  .byte 0x11
/*0x8afa*/  .byte 0x01
/*0x8afb*/  .byte 0x00
/*0x8afc*/  .byte 0x01
/*0x8afd*/  .byte 0x22
/*0x8afe*/  .byte 0x86
/*0x8aff*/  .byte 0x00
/*0x8b00*/  .byte 0x07
/*0x8b01*/  .byte 0x05
/*0x8b02*/  .byte 0x82
/*0x8b03*/  .byte 0x03
/*0x8b04*/  .byte 0x40
/*0x8b05*/  .byte 0x00
/*0x8b06*/  .byte 0x01
/*0x8b07*/  .byte 0x00
/*0x8b08*/  .byte 0x12
/*0x8b09*/  .byte 0x01
/*0x8b0a*/  .byte 0x10
/*0x8b0b*/  .byte 0x01
/*0x8b0c*/  .byte 0x00
/*0x8b0d*/  .byte 0x00
/*0x8b0e*/  .byte 0x00
/*0x8b0f*/  .byte 0x40
/*0x8b10*/  .byte 0xd9
/*0x8b11*/  .byte 0x04
/*0x8b12*/  .byte 0x43
/*0x8b13*/  .byte 0x01
/*0x8b14*/  .byte 0x04
/*0x8b15*/  .byte 0x11
/*0x8b16*/  .byte 0x01
/*0x8b17*/  .byte 0x02
/*0x8b18*/  .byte 0x00
/*0x8b19*/  .byte 0x01
/*0x8b1a*/  .byte 0x00
/*0x8b1b*/  .byte 0x00
/*0x8b1c*/  .byte 0x28
/*0x8b1d*/  .byte 0x8b
/*0x8b1e*/  .byte 0x00
/*0x8b1f*/  .byte 0x00
/*0x8b20*/  .byte 0x2c
/*0x8b21*/  .byte 0x8b
/*0x8b22*/  .byte 0x00
/*0x8b23*/  .byte 0x00
/*0x8b24*/  .byte 0x3c
/*0x8b25*/  .byte 0x8b
/*0x8b26*/  .byte 0x00
/*0x8b27*/  .byte 0x00
/*0x8b28*/  .byte 0x04
/*0x8b29*/  .byte 0x03
/*0x8b2a*/  .byte 0x09
/*0x8b2b*/  .byte 0x04
/*0x8b2c*/  .byte 0x0e
/*0x8b2d*/  .byte 0x03
/*0x8b2e*/  .byte 0x4d
/*0x8b2f*/  .byte 0x00
/*0x8b30*/  .byte 0x69
/*0x8b31*/  .byte 0x00
/*0x8b32*/  .byte 0x73
/*0x8b33*/  .byte 0x00
/*0x8b34*/  .byte 0x74
/*0x8b35*/  .byte 0x00
/*0x8b36*/  .byte 0x65
/*0x8b37*/  .byte 0x00
/*0x8b38*/  .byte 0x6c
/*0x8b39*/  .byte 0x00
/*0x8b3a*/  .byte 0x00
/*0x8b3b*/  .byte 0x00
/*0x8b3c*/  .byte 0x14
/*0x8b3d*/  .byte 0x03
/*0x8b3e*/  .byte 0x4d
/*0x8b3f*/  .byte 0x00
/*0x8b40*/  .byte 0x44
/*0x8b41*/  .byte 0x00
/*0x8b42*/  .byte 0x36
/*0x8b43*/  .byte 0x00
/*0x8b44*/  .byte 0x30
/*0x8b45*/  .byte 0x00
/*0x8b46*/  .byte 0x30
/*0x8b47*/  .byte 0x00
/*0x8b48*/  .byte 0x20
/*0x8b49*/  .byte 0x00
/*0x8b4a*/  .byte 0x52
/*0x8b4b*/  .byte 0x00
/*0x8b4c*/  .byte 0x47
/*0x8b4d*/  .byte 0x00
/*0x8b4e*/  .byte 0x42
/*0x8b4f*/  .byte 0x00
/*0x8b50*/  .byte 0x00
/*0x8b51*/  .byte 0x00
/*0x8b52*/  .byte 0x00
/*0x8b53*/  .byte 0x00
/*0x8b54*/  .byte 0x7d
/*0x8b55*/  .byte 0x70
/*0x8b56*/  .byte 0x00
/*0x8b57*/  .byte 0x00
/*0x8b58*/  .byte 0x00
/*0x8b59*/  .byte 0x00
/*0x8b5a*/  .byte 0x00
/*0x8b5b*/  .byte 0x00
/*0x8b5c*/  .byte 0xad
/*0x8b5d*/  .byte 0x7f
/*0x8b5e*/  .byte 0x00
/*0x8b5f*/  .byte 0x00
/*0x8b60*/  .byte 0x00
/*0x8b61*/  .byte 0x00
/*0x8b62*/  .byte 0x00
/*0x8b63*/  .byte 0x00
/*0x8b64*/  .byte 0x00
/*0x8b65*/  .byte 0x00
/*0x8b66*/  .byte 0x00
/*0x8b67*/  .byte 0x00
/*0x8b68*/  .byte 0xad
/*0x8b69*/  .byte 0x7e
/*0x8b6a*/  .byte 0x00
/*0x8b6b*/  .byte 0x00
/*0x8b6c*/  .byte 0xa1
/*0x8b6d*/  .byte 0x7d
/*0x8b6e*/  .byte 0x00
/*0x8b6f*/  .byte 0x00
/*0x8b70*/  .byte 0xff
/*0x8b71*/  .byte 0xff
/*0x8b72*/  .byte 0xff
/*0x8b73*/  .byte 0x08
/*0x8b74*/  .byte 0x03
/*0x8b75*/  .byte 0x00
/*0x8b76*/  .byte 0x00
/*0x8b77*/  .byte 0xff
/*0x8b78*/  .byte 0xff
/*0x8b79*/  .byte 0x00
/*0x8b7a*/  .byte 0x00
/*0x8b7b*/  .byte 0x00
/*0x8b7c*/  .byte 0xff
/*0x8b7d*/  .byte 0x00
/*0x8b7e*/  .byte 0x00
/*0x8b7f*/  .byte 0x00
/*0x8b80*/  .byte 0x00
/*0x8b81*/  .byte 0x00
/*0x8b82*/  .byte 0x01
/*0x8b83*/  .byte 0x02
/*0x8b84*/  .byte 0x03
/*0x8b85*/  .byte 0xff
/*0x8b86*/  .byte 0xff
/*0x8b87*/  .byte 0xff
/*0x8b88*/  .byte 0xff
/*0x8b89*/  .byte 0x04
/*0x8b8a*/  .byte 0x04
/*0x8b8b*/  .byte 0x05
/*0x8b8c*/  .byte 0x05
/*0x8b8d*/  .byte 0x06
/*0x8b8e*/  .byte 0x06
/*0x8b8f*/  .byte 0x01
/*0x8b90*/  .byte 0x01
/*0x8b91*/  .byte 0x01
/*0x8b92*/  .byte 0x01
/*0x8b93*/  .byte 0x01
/*0x8b94*/  .byte 0x01
/*0x8b95*/  .byte 0x01
/*0x8b96*/  .byte 0x03
/*0x8b97*/  .byte 0x05
/*0x8b98*/  .byte 0x07
/*0x8b99*/  .byte 0x09
/*0x8b9a*/  .byte 0x0b
/*0x8b9b*/  .byte 0x01
/*0x8b9c*/  .byte 0x03
/*0x8b9d*/  .byte 0x05
/*0x8b9e*/  .byte 0x07
/*0x8b9f*/  .byte 0x09
/*0x8ba0*/  .byte 0x0b
/*0x8ba1*/  .byte 0xaa
/*0x8ba2*/  .byte 0x6e
/*0x8ba3*/  .byte 0x46
/*0x8ba4*/  .byte 0x28
/*0x8ba5*/  .byte 0x14
/*0x8ba6*/  .byte 0x0a
/*0x8ba7*/  .byte 0x01
/*0x8ba8*/  .byte 0x02
/*0x8ba9*/  .byte 0x03
/*0x8baa*/  .byte 0x04
/*0x8bab*/  .byte 0x06
/*0x8bac*/  .byte 0x09
/*0x8bad*/  .byte 0x10
/*0x8bae*/  .byte 0x0b
/*0x8baf*/  .byte 0x07
/*0x8bb0*/  .byte 0x04
/*0x8bb1*/  .byte 0x02
/*0x8bb2*/  .byte 0x01
/*0x8bb3*/  .byte 0x10
/*0x8bb4*/  .byte 0x0b
/*0x8bb5*/  .byte 0x07
/*0x8bb6*/  .byte 0x04
/*0x8bb7*/  .byte 0x02
/*0x8bb8*/  .byte 0x01
/*0x8bb9*/  .byte 0x0f
/*0x8bba*/  .byte 0x0e
/*0x8bbb*/  .byte 0x0d
/*0x8bbc*/  .byte 0x0c
/*0x8bbd*/  .byte 0x0b
/*0x8bbe*/  .byte 0x0a
/*0x8bbf*/  .byte 0x09
/*0x8bc0*/  .byte 0x08
/*0x8bc1*/  .byte 0x1c
/*0x8bc2*/  .byte 0x1d
/*0x8bc3*/  .byte 0x1e
/*0x8bc4*/  .byte 0x1f
/*0x8bc5*/  .byte 0x20
/*0x8bc6*/  .byte 0x21
/*0x8bc7*/  .byte 0x22
/*0x8bc8*/  .byte 0x23
/*0x8bc9*/  .byte 0x31
/*0x8bca*/  .byte 0x30
/*0x8bcb*/  .byte 0x2f
/*0x8bcc*/  .byte 0x2e
/*0x8bcd*/  .byte 0x2d
/*0x8bce*/  .byte 0x2c
/*0x8bcf*/  .byte 0x2b
/*0x8bd0*/  .byte 0xff
/*0x8bd1*/  .byte 0x3e
/*0x8bd2*/  .byte 0x3f
/*0x8bd3*/  .byte 0x40
/*0x8bd4*/  .byte 0x41
/*0x8bd5*/  .byte 0x42
/*0x8bd6*/  .byte 0x43
/*0x8bd7*/  .byte 0x55
/*0x8bd8*/  .byte 0xff
/*0x8bd9*/  .byte 0x4f
/*0x8bda*/  .byte 0x4e
/*0x8bdb*/  .byte 0x4d
/*0x8bdc*/  .byte 0x4c
/*0x8bdd*/  .byte 0x4b
/*0x8bde*/  .byte 0x54
/*0x8bdf*/  .byte 0x56
/*0x8be0*/  .byte 0xff
/*0x8be1*/  .byte 0x15
/*0x8be2*/  .byte 0x14
/*0x8be3*/  .byte 0x13
/*0x8be4*/  .byte 0x12
/*0x8be5*/  .byte 0x11
/*0x8be6*/  .byte 0x10
/*0x8be7*/  .byte 0xff
/*0x8be8*/  .byte 0xff
/*0x8be9*/  .byte 0x16
/*0x8bea*/  .byte 0x17
/*0x8beb*/  .byte 0x18
/*0x8bec*/  .byte 0x19
/*0x8bed*/  .byte 0x1a
/*0x8bee*/  .byte 0x1b
/*0x8bef*/  .byte 0xff
/*0x8bf0*/  .byte 0xff
/*0x8bf1*/  .byte 0x37
/*0x8bf2*/  .byte 0x36
/*0x8bf3*/  .byte 0x35
/*0x8bf4*/  .byte 0x34
/*0x8bf5*/  .byte 0x33
/*0x8bf6*/  .byte 0x32
/*0x8bf7*/  .byte 0xff
/*0x8bf8*/  .byte 0xff
/*0x8bf9*/  .byte 0x38
/*0x8bfa*/  .byte 0x39
/*0x8bfb*/  .byte 0x3a
/*0x8bfc*/  .byte 0x3b
/*0x8bfd*/  .byte 0x3c
/*0x8bfe*/  .byte 0x3d
/*0x8bff*/  .byte 0xff
/*0x8c00*/  .byte 0xff
/*0x8c01*/  .byte 0x53
/*0x8c02*/  .byte 0x52
/*0x8c03*/  .byte 0x51
/*0x8c04*/  .byte 0x50
/*0x8c05*/  .byte 0xff
/*0x8c06*/  .byte 0xff
/*0x8c07*/  .byte 0xff
/*0x8c08*/  .byte 0xff
/*0x8c09*/  .byte 0x4a
/*0x8c0a*/  .byte 0x44
/*0x8c0b*/  .byte 0x2a
/*0x8c0c*/  .byte 0x24
/*0x8c0d*/  .byte 0x07
/*0x8c0e*/  .byte 0x00
/*0x8c0f*/  .byte 0xff
/*0x8c10*/  .byte 0xff
/*0x8c11*/  .byte 0x49
/*0x8c12*/  .byte 0x45
/*0x8c13*/  .byte 0x29
/*0x8c14*/  .byte 0x25
/*0x8c15*/  .byte 0x06
/*0x8c16*/  .byte 0x01
/*0x8c17*/  .byte 0xff
/*0x8c18*/  .byte 0xff
/*0x8c19*/  .byte 0x48
/*0x8c1a*/  .byte 0x46
/*0x8c1b*/  .byte 0x28
/*0x8c1c*/  .byte 0x26
/*0x8c1d*/  .byte 0x05
/*0x8c1e*/  .byte 0x02
/*0x8c1f*/  .byte 0xff
/*0x8c20*/  .byte 0xff
/*0x8c21*/  .byte 0x47
/*0x8c22*/  .byte 0xff
/*0x8c23*/  .byte 0x27
/*0x8c24*/  .byte 0xff
/*0x8c25*/  .byte 0x04
/*0x8c26*/  .byte 0x03
/*0x8c27*/  .byte 0xff
/*0x8c28*/  .byte 0xff
/*0x8c29*/  .byte 0x06
/*0x8c2a*/  .byte 0x07
/*0x8c2b*/  .byte 0x07
/*0x8c2c*/  .byte 0x08
/*0x8c2d*/  .byte 0x09
/*0x8c2e*/  .byte 0x0a
/*0x8c2f*/  .byte 0x0b
/*0x8c30*/  .byte 0x0c
/*0x8c31*/  .byte 0x06
/*0x8c32*/  .byte 0x07
/*0x8c33*/  .byte 0x08
/*0x8c34*/  .byte 0x09
/*0x8c35*/  .byte 0x0a
/*0x8c36*/  .byte 0x0b
/*0x8c37*/  .byte 0x0c
/*0x8c38*/  .byte 0x0d
/*0x8c39*/  .byte 0x06
/*0x8c3a*/  .byte 0x07
/*0x8c3b*/  .byte 0x08
/*0x8c3c*/  .byte 0x09
/*0x8c3d*/  .byte 0x0a
/*0x8c3e*/  .byte 0x0b
/*0x8c3f*/  .byte 0x0c
/*0x8c40*/  .byte 0xff
/*0x8c41*/  .byte 0x07
/*0x8c42*/  .byte 0x08
/*0x8c43*/  .byte 0x09
/*0x8c44*/  .byte 0x0a
/*0x8c45*/  .byte 0x0b
/*0x8c46*/  .byte 0x0c
/*0x8c47*/  .byte 0xff
/*0x8c48*/  .byte 0xff
/*0x8c49*/  .byte 0x07
/*0x8c4a*/  .byte 0x0a
/*0x8c4b*/  .byte 0x0b
/*0x8c4c*/  .byte 0x0c
/*0x8c4d*/  .byte 0x0d
/*0x8c4e*/  .byte 0xff
/*0x8c4f*/  .byte 0xff
/*0x8c50*/  .byte 0xff
/*0x8c51*/  .byte 0x01
/*0x8c52*/  .byte 0x02
/*0x8c53*/  .byte 0x02
/*0x8c54*/  .byte 0x03
/*0x8c55*/  .byte 0x04
/*0x8c56*/  .byte 0x05
/*0x8c57*/  .byte 0xff
/*0x8c58*/  .byte 0xff
/*0x8c59*/  .byte 0x01
/*0x8c5a*/  .byte 0x02
/*0x8c5b*/  .byte 0x03
/*0x8c5c*/  .byte 0x04
/*0x8c5d*/  .byte 0x05
/*0x8c5e*/  .byte 0x06
/*0x8c5f*/  .byte 0xff
/*0x8c60*/  .byte 0xff
/*0x8c61*/  .byte 0x01
/*0x8c62*/  .byte 0x02
/*0x8c63*/  .byte 0x03
/*0x8c64*/  .byte 0x04
/*0x8c65*/  .byte 0x05
/*0x8c66*/  .byte 0x06
/*0x8c67*/  .byte 0xff
/*0x8c68*/  .byte 0xff /* possible pointer */
/*0x8c69*/  .byte 0x01
/*0x8c6a*/  .byte 0x02
/*0x8c6b*/  .byte 0x03
/*0x8c6c*/  .byte 0x04
/*0x8c6d*/  .byte 0x05
/*0x8c6e*/  .byte 0x06
/*0x8c6f*/  .byte 0xff
/*0x8c70*/  .byte 0xff
/*0x8c71*/  .byte 0x01
/*0x8c72*/  .byte 0x02
/*0x8c73*/  .byte 0x03
/*0x8c74*/  .byte 0x05
/*0x8c75*/  .byte 0xff
/*0x8c76*/  .byte 0xff
/*0x8c77*/  .byte 0xff
/*0x8c78*/  .byte 0xff
/*0x8c79*/  .byte 0x0e
/*0x8c7a*/  .byte 0x0e
/*0x8c7b*/  .byte 0x0e
/*0x8c7c*/  .byte 0x0e
/*0x8c7d*/  .byte 0x0e
/*0x8c7e*/  .byte 0x0e
/*0x8c7f*/  .byte 0xff
/*0x8c80*/  .byte 0xff
/*0x8c81*/  .byte 0x0f
/*0x8c82*/  .byte 0x0f
/*0x8c83*/  .byte 0x0f
/*0x8c84*/  .byte 0x0f
/*0x8c85*/  .byte 0x0f
/*0x8c86*/  .byte 0x0f
/*0x8c87*/  .byte 0xff
/*0x8c88*/  .byte 0xff
/*0x8c89*/  .byte 0x10
/*0x8c8a*/  .byte 0x10
/*0x8c8b*/  .byte 0x10
/*0x8c8c*/  .byte 0x10
/*0x8c8d*/  .byte 0x10
/*0x8c8e*/  .byte 0x10
/*0x8c8f*/  .byte 0xff
/*0x8c90*/  .byte 0xff
/*0x8c91*/  .byte 0x11
/*0x8c92*/  .byte 0xff
/*0x8c93*/  .byte 0x11
/*0x8c94*/  .byte 0xff
/*0x8c95*/  .byte 0x11
/*0x8c96*/  .byte 0x11
/*0x8c97*/  .byte 0xff
/*0x8c98*/  .byte 0xff
/*0x8c99*/  .byte 0x31
/*0x8c9a*/  .byte 0x39
/*0x8c9b*/  .byte 0x41
/*0x8c9c*/  .byte 0x49
/*0x8c9d*/  .byte 0x51
/*0x8c9e*/  .byte 0x59
/*0x8c9f*/  .byte 0x61
/*0x8ca0*/  .byte 0x71
/*0x8ca1*/  .byte 0x32
/*0x8ca2*/  .byte 0x3a
/*0x8ca3*/  .byte 0x42
/*0x8ca4*/  .byte 0x4a
/*0x8ca5*/  .byte 0x52
/*0x8ca6*/  .byte 0x5a
/*0x8ca7*/  .byte 0x62
/*0x8ca8*/  .byte 0x72
/*0x8ca9*/  .byte 0x33
/*0x8caa*/  .byte 0x3b
/*0x8cab*/  .byte 0x43
/*0x8cac*/  .byte 0x4b
/*0x8cad*/  .byte 0x53
/*0x8cae*/  .byte 0x5b
/*0x8caf*/  .byte 0x73
/*0x8cb0*/  .byte 0xff
/*0x8cb1*/  .byte 0x3c
/*0x8cb2*/  .byte 0x44
/*0x8cb3*/  .byte 0x4c
/*0x8cb4*/  .byte 0x54
/*0x8cb5*/  .byte 0x5c
/*0x8cb6*/  .byte 0x6c
/*0x8cb7*/  .byte 0xff
/*0x8cb8*/  .byte 0xff
/*0x8cb9*/  .byte 0x3d
/*0x8cba*/  .byte 0x55
/*0x8cbb*/  .byte 0x65
/*0x8cbc*/  .byte 0x6d
/*0x8cbd*/  .byte 0x75
/*0x8cbe*/  .byte 0xff
/*0x8cbf*/  .byte 0xff
/*0x8cc0*/  .byte 0xff
/*0x8cc1*/  .byte 0x01
/*0x8cc2*/  .byte 0x09
/*0x8cc3*/  .byte 0x11
/*0x8cc4*/  .byte 0x19
/*0x8cc5*/  .byte 0x21
/*0x8cc6*/  .byte 0x29
/*0x8cc7*/  .byte 0xff
/*0x8cc8*/  .byte 0xff
/*0x8cc9*/  .byte 0x82
/*0x8cca*/  .byte 0x0a
/*0x8ccb*/  .byte 0x12
/*0x8ccc*/  .byte 0x1a
/*0x8ccd*/  .byte 0x22
/*0x8cce*/  .byte 0x2a
/*0x8ccf*/  .byte 0xff
/*0x8cd0*/  .byte 0xff
/*0x8cd1*/  .byte 0x03
/*0x8cd2*/  .byte 0x0b
/*0x8cd3*/  .byte 0x13
/*0x8cd4*/  .byte 0x1b
/*0x8cd5*/  .byte 0x23
/*0x8cd6*/  .byte 0x2b
/*0x8cd7*/  .byte 0xff
/*0x8cd8*/  .byte 0xff
/*0x8cd9*/  .byte 0x04
/*0x8cda*/  .byte 0x14
/*0x8cdb*/  .byte 0x1c
/*0x8cdc*/  .byte 0x24
/*0x8cdd*/  .byte 0x2c
/*0x8cde*/  .byte 0x34
/*0x8cdf*/  .byte 0xff
/*0x8ce0*/  .byte 0xff
/*0x8ce1*/  .byte 0x05
/*0x8ce2*/  .byte 0x0d
/*0x8ce3*/  .byte 0x15
/*0x8ce4*/  .byte 0x25
/*0x8ce5*/  .byte 0xff
/*0x8ce6*/  .byte 0xff
/*0x8ce7*/  .byte 0xff
/*0x8ce8*/  .byte 0xff
/*0x8ce9*/  .byte 0x7d
/*0x8cea*/  .byte 0x7c
/*0x8ceb*/  .byte 0x7b
/*0x8cec*/  .byte 0x7a
/*0x8ced*/  .byte 0x79
/*0x8cee*/  .byte 0x78
/*0x8cef*/  .byte 0xff
/*0x8cf0*/  .byte 0xff
/*0x8cf1*/  .byte 0x85
/*0x8cf2*/  .byte 0x84
/*0x8cf3*/  .byte 0x83
/*0x8cf4*/  .byte 0x82
/*0x8cf5*/  .byte 0x81
/*0x8cf6*/  .byte 0xff
/*0x8cf7*/  .byte 0xff
/*0x8cf8*/  .byte 0xff
/*0x8cf9*/  .byte 0x8d
/*0x8cfa*/  .byte 0x8c
/*0x8cfb*/  .byte 0x8b
/*0x8cfc*/  .byte 0x8a
/*0x8cfd*/  .byte 0x89
/*0x8cfe*/  .byte 0x88
/*0x8cff*/  .byte 0xff
/*0x8d00*/  .byte 0xff
/*0x8d01*/  .byte 0x95
/*0x8d02*/  .byte 0xff
/*0x8d03*/  .byte 0x92
/*0x8d04*/  .byte 0xff
/*0x8d05*/  .byte 0x91
/*0x8d06*/  .byte 0x90
/*0x8d07*/  .byte 0xff
/*0x8d08*/  .byte 0xff /* possible pointer */
/*0x8d09*/  .byte 0x00
/*0x8d0a*/  .byte 0x24
/*0x8d0b*/  .byte 0x49
/*0x8d0c*/  .byte 0x6d
/*0x8d0d*/  .byte 0x92
/*0x8d0e*/  .byte 0xb6
/*0x8d0f*/  .byte 0xdb
/*0x8d10*/  .byte 0xff
/*0x8d11*/  .byte 0xaa
/*0x8d12*/  .byte 0x55 /* (dest, size) */
/*0x8d13*/  .byte 0x00
/*0x8d14*/  .byte 0x5a
/*0x8d15*/  .byte 0x48
/*0x8d16*/  .byte 0x05
/*0x8d17*/  .byte 0x04
/*0x8d18*/  .byte 0x80
/*0x8d19*/  .byte 0x84
/*0x8d1a*/  .byte 0x1e
/*0x8d1b*/  .byte 0x00
/*0x8d1c*/  .byte 0x00
/*0x8d1d*/  .byte 0x00
/*0x8d1e*/  .byte 0x00
/*0x8d1f*/  .byte 0x40
/*0x8d20*/  .byte 0x58
/*0x8d21*/  .byte 0x00
/*0x8d22*/  .byte 0x09
/*0x8d23*/  .byte 0x40
/*0x8d24*/  .byte 0x44
/*0x8d25*/  .byte 0x00
/*0x8d26*/  .byte 0x09
/*0x8d27*/  .byte 0x40
/*0x8d28*/  .byte 0x03
/*0x8d29*/  .byte 0x02
/*0x8d2a*/  .byte 0x00 /* case switch_5930 */
/*0x8d2b*/  .byte 0x02 /* case switch_5936 */
/*0x8d2c*/  .byte 0x00 /* case switch_593c */
/*0x8d2d*/  .byte 0x03 /* case switch_5942 */
/*0x8d2e*/  .byte 0x00 /* case switch_594e */
/*0x8d2f*/  .byte 0x00 /* case switch_5948 */
/*0x8d30*/  .byte 0x80
/*0x8d31*/  .byte 0x84
/*0x8d32*/  .byte 0x1e
/*0x8d33*/  .byte 0x00
/*0x8d34*/  .byte 0x00
/*0x8d35*/  .byte 0x00
/*0x8d36*/  .byte 0x04
/*0x8d37*/  .byte 0x40
/*0x8d38*/  .byte 0xa0
/*0x8d39*/  .byte 0x00
/*0x8d3a*/  .byte 0x09
/*0x8d3b*/  .byte 0x40
/*0x8d3c*/  .byte 0xbc
/*0x8d3d*/  .byte 0x00
/*0x8d3e*/  .byte 0x09
/*0x8d3f*/  .byte 0x40
/*0x8d40*/  .byte 0x06
/*0x8d41*/  .byte 0x07
/*0x8d42*/  .byte 0x00
/*0x8d43*/  .byte 0x04
/*0x8d44*/  .byte 0x00
/*0x8d45*/  .byte 0x05
/*0x8d46*/  .byte 0x00
/*0x8d47*/  .byte 0x00

            sram_defs:
/*0x8d48*/  .word 0x00008d68 /* possible pointer */
/*0x8d4c*/  .word 0x20000000
/*0x8d50*/  .word 0x0000006c
/*0x8d54*/  .word 0x00008340 /* possible pointer */
/*0x8d58*/  .word 0x00008dd4
/*0x8d5c*/  .word 0x2000006c
/*0x8d60*/  .word 0x000024cc
/*0x8d64*/  .word 0x00008350 /* possible pointer */

            sram_init_data:
/*0x8d68*/  .byte 0x00
/*0x8d69*/  .byte 0x00
/*0x8d6a*/  .byte 0x00
/*0x8d6b*/  .byte 0x00
/*0x8d6c*/  .byte 0x00
/*0x8d6d*/  .byte 0x00
/*0x8d6e*/  .byte 0x00
/*0x8d6f*/  .byte 0x00
/*0x8d70*/  .byte 0x00
/*0x8d71*/  .byte 0x00
/*0x8d72*/  .byte 0x00
/*0x8d73*/  .byte 0x00
/*0x8d74*/  .byte 0x00
/*0x8d75*/  .byte 0x00
/*0x8d76*/  .byte 0x00
/*0x8d77*/  .byte 0x00
/*0x8d78*/  .byte 0x00
/*0x8d79*/  .byte 0xa2
/*0x8d7a*/  .byte 0x4a
/*0x8d7b*/  .byte 0x04
/*0x8d7c*/  .byte 0x01
/*0x8d7d*/  .byte 0x00
/*0x8d7e*/  .byte 0x00
/*0x8d7f*/  .byte 0x00
/*0x8d80*/  .byte 0x00 /* possible pointer */
/*0x8d81*/  .byte 0x00
/*0x8d82*/  .byte 0x00
/*0x8d83*/  .byte 0x00
/*0x8d84*/  .byte 0x00
/*0x8d85*/  .byte 0x00
/*0x8d86*/  .byte 0x00
/*0x8d87*/  .byte 0x00
/*0x8d88*/  .byte 0xff
/*0x8d89*/  .byte 0x00
/*0x8d8a*/  .byte 0x00
/*0x8d8b*/  .byte 0x00
/*0x8d8c*/  .byte 0xb8
/*0x8d8d*/  .byte 0x87
/*0x8d8e*/  .byte 0x00
/*0x8d8f*/  .byte 0x00
/*0x8d90*/  .byte 0x00
/*0x8d91*/  .byte 0x00
/*0x8d92*/  .byte 0x00
/*0x8d93*/  .byte 0x00
/*0x8d94*/  .byte 0x01
/*0x8d95*/  .byte 0x00
/*0x8d96*/  .byte 0x00
/*0x8d97*/  .byte 0x00
/*0x8d98*/  .byte 0x00
/*0x8d99*/  .byte 0x00
/*0x8d9a*/  .byte 0x00
/*0x8d9b*/  .byte 0x00
/*0x8d9c*/  .byte 0x00
/*0x8d9d*/  .byte 0x00
/*0x8d9e*/  .byte 0x00
/*0x8d9f*/  .byte 0x00
/*0x8da0*/  .byte 0x00
/*0x8da1*/  .byte 0x00
/*0x8da2*/  .byte 0x00
/*0x8da3*/  .byte 0x00
/*0x8da4*/  .byte 0x00
/*0x8da5*/  .byte 0x00
/*0x8da6*/  .byte 0x00
/*0x8da7*/  .byte 0x00
/*0x8da8*/  .byte 0x00
/*0x8da9*/  .byte 0x00
/*0x8daa*/  .byte 0x00
/*0x8dab*/  .byte 0x00
/*0x8dac*/  .byte 0x00
/*0x8dad*/  .byte 0x00
/*0x8dae*/  .byte 0x00
/*0x8daf*/  .byte 0x00
/*0x8db0*/  .byte 0x00
/*0x8db1*/  .byte 0x00
/*0x8db2*/  .byte 0x00
/*0x8db3*/  .byte 0x00
/*0x8db4*/  .byte 0x00
/*0x8db5*/  .byte 0xff
/*0x8db6*/  .byte 0x00
/*0x8db7*/  .byte 0x00
/*0x8db8*/  .byte 0x00
/*0x8db9*/  .byte 0x00
/*0x8dba*/  .byte 0x00
/*0x8dbb*/  .byte 0x00
/*0x8dbc*/  .byte 0x00
/*0x8dbd*/  .byte 0x00
/*0x8dbe*/  .byte 0x00
/*0x8dbf*/  .byte 0x00
/*0x8dc0*/  .byte 0xf6
/*0x8dc1*/  .byte 0x08
/*0x8dc2*/  .byte 0x00
/*0x8dc3*/  .byte 0x20
/*0x8dc4*/  .byte 0x00
/*0x8dc5*/  .byte 0x00
/*0x8dc6*/  .byte 0x00
/*0x8dc7*/  .byte 0x00
/*0x8dc8*/  .byte 0x00
/*0x8dc9*/  .byte 0x00
/*0x8dca*/  .byte 0x00
/*0x8dcb*/  .byte 0x00
/*0x8dcc*/  .byte 0x00
/*0x8dcd*/  .byte 0x00
/*0x8dce*/  .byte 0x00
/*0x8dcf*/  .byte 0x00
/*0x8dd0*/  .byte 0x00
/*0x8dd1*/  .byte 0x00
/*0x8dd2*/  .byte 0x00
/*0x8dd3*/  .byte 0x00
