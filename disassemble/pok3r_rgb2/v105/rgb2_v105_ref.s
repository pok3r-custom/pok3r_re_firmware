.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x3400*/  .word 0x200021e0
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
/*0x3556*/      blx r0 /* call_6cc0 */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /* call_663c */
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
/*0x3574*/  .word call_6cc0
            data_3578:
/*0x3578*/  .word call_663c
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
/*0x3590*/  .word 0x200021e0


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
            srand:
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
            memcpy:
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
            mem_set:
/*0x35dc*/      uxtb r2, r2
/*0x35de*/      b jump_35e4
            jump_35e0:
/*0x35e0*/      strb r2, [r0], #1
            jump_35e4:
/*0x35e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x35e6*/      bhs jump_35e0
/*0x35e8*/      bx lr

            .thumb_func
            mem_zero:
/*0x35ea*/      movs r2, #0
/*0x35ec*/      b mem_set

            .thumb_func
            mem_set2:
/*0x35ee*/      push {r4, lr}
/*0x35f0*/      mov r3, r2
/*0x35f2*/      mov r2, r1
/*0x35f4*/      mov r4, r0
/*0x35f6*/      mov r1, r3
/*0x35f8*/      bl mem_set
/*0x35fc*/      mov r0, r4
/*0x35fe*/      pop {r4, pc}

            .thumb_func
            memcmp:
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
/*0x363c*/  .word data_81d0


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
            bftm0_intr:
/*0x366c*/      push {r4, lr}
/*0x366e*/      ldr r0, [pc, #0x6c] /* data_36dc */
/*0x3670*/      bl call_375c
/*0x3674*/      bl call_5ff4
/*0x3678*/      ldr r0, [pc, #0x64] /* data_36e0 */
/*0x367a*/      ldr r1, [r0]
/*0x367c*/      cbz r1, jump_3684
/*0x367e*/      ldr r1, [r0]
/*0x3680*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3682*/      str r1, [r0]
            jump_3684:
/*0x3684*/      ldr r1, [r0, #4]
/*0x3686*/      cbz r1, jump_368e
/*0x3688*/      ldr r1, [r0, #4]
/*0x368a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x368c*/      str r1, [r0, #4]
            jump_368e:
/*0x368e*/      ldr r0, [pc, #0x54] /* data_36e4 */
/*0x3690*/      ldrh r1, [r0]
/*0x3692*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3694*/      strh r1, [r0]
/*0x3696*/      ldr r0, [pc, #0x50] /* data_36e8 */
/*0x3698*/      ldr r1, [r0]
/*0x369a*/      cbz r1, jump_36a2
/*0x369c*/      ldr r1, [r0]
/*0x369e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36a0*/      str r1, [r0]
            jump_36a2:
/*0x36a2*/      ldr r0, [pc, #0x48] /* data_36ec */
/*0x36a4*/      ldr r1, [r0]
/*0x36a6*/      cbz r1, jump_36ae
/*0x36a8*/      ldr r1, [r0]
/*0x36aa*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x36ac*/      str r1, [r0]
            jump_36ae:
/*0x36ae*/      ldr r0, [pc, #0x40] /* data_36f0 */
/*0x36b0*/      ldrb r1, [r0]
/*0x36b2*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36b4*/      strb r1, [r0]
/*0x36b6*/      ldr r1, [pc, #0x3c] /* data_36f4 */
/*0x36b8*/      ldrh r0, [r1]
/*0x36ba*/      cmp r0, #1
/*0x36bc*/      bls jump_36c2
/*0x36be*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x36c0*/      strh r0, [r1]
            jump_36c2:
/*0x36c2*/      ldr r0, [pc, #0x34] /* data_36f8 */
/*0x36c4*/      ldrh r1, [r0]
/*0x36c6*/      cmp r1, #0
/*0x36c8*/      beq jump_36d8
/*0x36ca*/      ldrh r1, [r0]
/*0x36cc*/      cmp.w r1, #0xff00
/*0x36d0*/      bhs jump_36d8
/*0x36d2*/      ldrh r1, [r0]
/*0x36d4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36d6*/      strh r1, [r0]
            jump_36d8:
/*0x36d8*/      pop {r4, pc}

/*0x36da*/  .byte 0x00
/*0x36db*/  .byte 0x00

            data_36dc:
/*0x36dc*/  .word 0x40076000
            data_36e0:
/*0x36e0*/  .word 0x2000060c
            data_36e4:
/*0x36e4*/  .word 0x20000012
            data_36e8:
/*0x36e8*/  .word 0x2000000c
            data_36ec:
/*0x36ec*/  .word 0x20000064
            data_36f0:
/*0x36f0*/  .word 0x20000052
            data_36f4:
/*0x36f4*/  .word 0x20000002
            data_36f8:
/*0x36f8*/  .word 0x20000020


            .thumb_func
            bftm1_intr:
/*0x36fc*/      push {r4, lr}
/*0x36fe*/      ldr r0, [pc, #0x4c] /* data_374c */
/*0x3700*/      bl call_375c
/*0x3704*/      ldr r4, [pc, #0x48] /* data_3750 */
/*0x3706*/      ldr r0, [r4, #4]
/*0x3708*/      ldrh r1, [r0, #4]
/*0x370a*/      ldr r0, [r0]
/*0x370c*/      uxth r1, r1
/*0x370e*/      bl call_45a0
/*0x3712*/      movs r0, #0xa
/*0x3714*/      bl call_37c4
/*0x3718*/      movs r0, #2
/*0x371a*/      bl call_72e0
/*0x371e*/      ldr r1, [pc, #0x34] /* data_3754 */
/*0x3720*/      mov.w r0, #0x8000
/*0x3724*/      str r0, [r1, #0x24]
/*0x3726*/      ldr r0, [pc, #0x30] /* data_3758 */
/*0x3728*/      ldrb r1, [r4, #1]
/*0x372a*/      add.w r0, r0, r1, lsl #3
/*0x372e*/      str r0, [r4, #4]
/*0x3730*/      ldrh r1, [r0, #4]
/*0x3732*/      ldr r0, [r0]
/*0x3734*/      uxth r1, r1
/*0x3736*/      bl call_4534
/*0x373a*/      ldrb r0, [r4, #1]
/*0x373c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x373e*/      and r0, r0, #7
/*0x3742*/      strb r0, [r4, #1]
/*0x3744*/      pop.w {r4, lr}
/*0x3748*/      b.w call_6500

            data_374c:
/*0x374c*/  .word 0x40077000
            data_3750:
/*0x3750*/  .word 0x20000024
            data_3754:
/*0x3754*/  .word 0x400b0000
            data_3758:
/*0x3758*/  .word gpio_map_3


            .thumb_func
            call_375c:
/*0x375c*/      ldr r1, [r0, #4]
/*0x375e*/      bic r1, r1, #1
/*0x3762*/      str r1, [r0, #4]
/*0x3764*/      dsb sy
/*0x3768*/      bx lr

            .thumb_func
            call_376a:
/*0x376a*/      cmp r1, #0
/*0x376c*/      ldr r1, [r0]
/*0x376e*/      beq jump_3776
/*0x3770*/      orr r1, r1, #4
/*0x3774*/      b jump_377a
            jump_3776:
/*0x3776*/      bic r1, r1, #4
            jump_377a:
/*0x377a*/      str r1, [r0]
/*0x377c*/      bx lr

            .thumb_func
            call_377e:
/*0x377e*/      cmp r1, #0
/*0x3780*/      ldr r1, [r0]
/*0x3782*/      beq jump_378a
/*0x3784*/      orr r1, r1, #1
/*0x3788*/      b jump_378e
            jump_378a:
/*0x378a*/      bic r1, r1, #1
            jump_378e:
/*0x378e*/      str r1, [r0]
/*0x3790*/      bx lr

            .thumb_func
            call_3792:
/*0x3792*/      str r1, [r0, #0xc]
/*0x3794*/      bx lr

            .thumb_func
            call_3796:
/*0x3796*/      str r1, [r0, #8]
/*0x3798*/      bx lr

/*0x379a*/  .byte 0x00
/*0x379b*/  .byte 0x00


            .thumb_func
            call_379c:
/*0x379c*/      lsls r0, r0, #3
/*0x379e*/      lsrs r3, r1, #3
/*0x37a0*/      add.w r0, r0, r3, lsl #2
/*0x37a4*/      ldr r3, [pc, #0x18] /* data_37c0 */
/*0x37a6*/      push {r4, lr}
/*0x37a8*/      add r0, r3
/*0x37aa*/      lsls r1, r1, #0x1d
/*0x37ac*/      ldr r3, [r0]
/*0x37ae*/      lsrs r1, r1, #0x1b
/*0x37b0*/      movs r4, #0xf
/*0x37b2*/      lsls r4, r1
/*0x37b4*/      bics r3, r4
/*0x37b6*/      lsls r2, r1
/*0x37b8*/      orrs r3, r2
/*0x37ba*/      str r3, [r0]
/*0x37bc*/      pop {r4, pc}

/*0x37be*/  .byte 0x00
/*0x37bf*/  .byte 0x00

            data_37c0:
/*0x37c0*/  .word 0x40022020


            .thumb_func
            call_37c4:
/*0x37c4*/      add.w r0, r0, r0, lsl #2
/*0x37c8*/      lsls r0, r0, #2
            jump_37ca:
/*0x37ca*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x37cc*/      bhs jump_37ca
/*0x37ce*/      bx lr

            .thumb_func
            call_37d0:
/*0x37d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x37d4*/      mov.w r5, #0x4000
/*0x37d8*/      movs r4, #0
/*0x37da*/      lsls r0, r5, #2
/*0x37dc*/      mov r2, r4
/*0x37de*/      mov r8, r0
/*0x37e0*/      movs r3, #1
/*0x37e2*/      mov r1, r5
/*0x37e4*/      bl call_3888
/*0x37e8*/      ldr r6, [pc, #0x94] /* data_3880 */
/*0x37ea*/      movs r2, #0
/*0x37ec*/      mov r1, r5
/*0x37ee*/      mov r0, r6
/*0x37f0*/      bl call_4558
/*0x37f4*/      lsls r7, r5, #1
/*0x37f6*/      movs r2, #0
/*0x37f8*/      mov r1, r7
/*0x37fa*/      mov r0, r6
/*0x37fc*/      bl call_4558
/*0x3800*/      movs r2, #2
/*0x3802*/      mov r1, r5
/*0x3804*/      mov r0, r6
/*0x3806*/      bl call_4578
/*0x380a*/      movs r2, #2
/*0x380c*/      mov r1, r7
/*0x380e*/      mov r0, r6
/*0x3810*/      bl call_4578
/*0x3814*/      asrs r5, r5, #3
/*0x3816*/      movs r2, #0
/*0x3818*/      mov r1, r5
/*0x381a*/      mov r0, r6
/*0x381c*/      bl call_4558
/*0x3820*/      movs r2, #2
/*0x3822*/      mov r1, r5
/*0x3824*/      mov r0, r6
/*0x3826*/      bl call_4578
/*0x382a*/      movs r2, #1
/*0x382c*/      movs r1, #0xb
/*0x382e*/      movs r0, #0
/*0x3830*/      bl call_379c
/*0x3834*/      movs r2, #1
/*0x3836*/      movs r1, #0xd
/*0x3838*/      movs r0, #2
/*0x383a*/      bl call_379c
/*0x383e*/      movs r2, #1
/*0x3840*/      movs r1, #0xe
/*0x3842*/      movs r0, #2
/*0x3844*/      bl call_379c
/*0x3848*/      movs r2, #1
/*0x384a*/      movs r1, #0xf
/*0x384c*/      movs r0, #2
/*0x384e*/      bl call_379c
/*0x3852*/      ldr r0, [pc, #0x30] /* data_3884 */
/*0x3854*/      ldr r0, [r0, #4]
/*0x3856*/      lsls r0, r0, #0x15
/*0x3858*/      bmi jump_386e
/*0x385a*/      movs r2, #1
/*0x385c*/      movs r1, #0xe
/*0x385e*/      mov r0, r2
/*0x3860*/      bl call_379c
/*0x3864*/      movs r2, #1
/*0x3866*/      movs r1, #0xf
/*0x3868*/      mov r0, r2
/*0x386a*/      bl call_379c
            jump_386e:
/*0x386e*/      mov r1, r4
/*0x3870*/      movs r3, #0
/*0x3872*/      mov r2, r4
/*0x3874*/      mov r0, r8
/*0x3876*/      bl call_3888
/*0x387a*/      movs r0, #1
/*0x387c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_3880:
/*0x3880*/  .word 0x400b0000
            data_3884:
/*0x3884*/  .word 0x40088000


            .thumb_func
            call_3888:
/*0x3888*/      push {r4, r5, r6, r7, lr}
/*0x388a*/      ldr r7, [pc, #0x1c] /* data_38a8 */
/*0x388c*/      ldr r4, [r7, #0x24]
/*0x388e*/      ldr r5, [r7, #0x2c]
/*0x3890*/      ldr r6, [r7, #0x30]
/*0x3892*/      bics r4, r0
/*0x3894*/      bics r5, r1
/*0x3896*/      bics r6, r2
/*0x3898*/      cbz r3, jump_38a0
/*0x389a*/      orrs r4, r0
/*0x389c*/      orrs r5, r1
/*0x389e*/      orrs r6, r2
            jump_38a0:
/*0x38a0*/      str r4, [r7, #0x24]
/*0x38a2*/      str r5, [r7, #0x2c]
/*0x38a4*/      str r6, [r7, #0x30]
/*0x38a6*/      pop {r4, r5, r6, r7, pc}

            data_38a8:
/*0x38a8*/  .word 0x40088000


            .thumb_func
            call_38ac:
/*0x38ac*/      ldr r1, [pc, #0xc] /* data_38bc */
/*0x38ae*/      ldr r2, [r1]
/*0x38b0*/      bic r2, r2, #0xc00000
/*0x38b4*/      orr.w r0, r2, r0, lsl #22
/*0x38b8*/      str r0, [r1]
/*0x38ba*/      bx lr

            data_38bc:
/*0x38bc*/  .word 0x40088000


            .thumb_func
            call_38c0:
/*0x38c0*/      push {r4, r5, r6, lr}
/*0x38c2*/      ldr r1, [pc, #0x40] /* data_3904 */
/*0x38c4*/      movs r5, #1
/*0x38c6*/      lsl.w r0, r5, r0
/*0x38ca*/      ldrb r1, [r1, #3]
/*0x38cc*/      ldr r3, [pc, #0x3c] /* data_390c */
/*0x38ce*/      lsls r6, r1, #0x1e
/*0x38d0*/      ldr r1, [pc, #0x34] /* data_3908 */
/*0x38d2*/      ldr r4, [pc, #0x3c] /* data_3910 */
/*0x38d4*/      uxtb r0, r0
/*0x38d6*/      ldrb r2, [r1, #2]
/*0x38d8*/      ldrb r1, [r3, #1]
/*0x38da*/      bpl jump_38ea
/*0x38dc*/      orrs r1, r0
/*0x38de*/      strb r1, [r3, #1]
/*0x38e0*/      cmp r0, #8
/*0x38e2*/      bne jump_38fe
/*0x38e4*/      cbz r2, jump_38fe
/*0x38e6*/      strb r5, [r4, #0xa]
/*0x38e8*/      b jump_38fe
            jump_38ea:
/*0x38ea*/      bics r1, r0
/*0x38ec*/      strb r1, [r3, #1]
/*0x38ee*/      cmp r0, #8
/*0x38f0*/      bne jump_38fe
/*0x38f2*/      cbz r2, jump_38fe
/*0x38f4*/      movs r0, #0
/*0x38f6*/      strb r0, [r4, #0xa]
/*0x38f8*/      strb r5, [r4]
/*0x38fa*/      bl call_3bec
            jump_38fe:
/*0x38fe*/      movs r0, #3
/*0x3900*/      strb r0, [r4, #4]
/*0x3902*/      pop {r4, r5, r6, pc}

            data_3904:
/*0x3904*/  .word 0x20000058
            data_3908:
/*0x3908*/  .word 0x20000060
            data_390c:
/*0x390c*/  .word 0x20000000
            data_3910:
/*0x3910*/  .word 0x200006c0


            .thumb_func
            call_3914:
/*0x3914*/      push {r4, r5, r6, lr}
/*0x3916*/      ldr r1, [pc, #0xac] /* data_39c4 */
/*0x3918*/      ldrb r0, [r1, #6]
/*0x391a*/      cmp r0, #0
/*0x391c*/      beq jump_3962
/*0x391e*/      ldr r5, [pc, #0xa8] /* data_39c8 */
/*0x3920*/      movs r2, #1
/*0x3922*/      str r2, [r5, #4]
/*0x3924*/      ldr r0, [pc, #0xa4] /* data_39cc */
/*0x3926*/      ldrb r0, [r0, #3]
/*0x3928*/      lsls r0, r0, #0x1e
/*0x392a*/      bpl jump_3962
/*0x392c*/      ldr r0, [pc, #0x9c] /* data_39cc */
/*0x392e*/      ldrb r3, [r1, #7]
/*0x3930*/      ldrb r0, [r0]
/*0x3932*/      cbz r3, jump_3978
/*0x3934*/      cmp r0, #0x27
/*0x3936*/      beq jump_3958
/*0x3938*/      bgt jump_394c
/*0x393a*/      cmp r0, #0x1e
/*0x393c*/      beq jump_3964
/*0x393e*/      cmp r0, #0x1f
/*0x3940*/      beq jump_3964
/*0x3942*/      cmp r0, #0x20
/*0x3944*/      beq jump_3964
/*0x3946*/      cmp r0, #0x26
/*0x3948*/      bne jump_3962
/*0x394a*/      b jump_3958
            jump_394c:
/*0x394c*/      cmp r0, #0x29
/*0x394e*/      beq jump_3960
/*0x3950*/      cmp r0, #0x2d
/*0x3952*/      beq jump_3958
/*0x3954*/      cmp r0, #0x2e
/*0x3956*/      bne jump_3962
            jump_3958:
/*0x3958*/      pop.w {r4, r5, r6, lr}
/*0x395c*/      b.w jump_6d00
            jump_3960:
/*0x3960*/      strb r2, [r1, #2]
            jump_3962:
/*0x3962*/      pop {r4, r5, r6, pc}
            jump_3964:
/*0x3964*/      subs r0, #0x1e
/*0x3966*/      uxtb r1, r0
/*0x3968*/      ldr r0, [pc, #0x5c] /* data_39c8 */
/*0x396a*/      movs r2, #1
/*0x396c*/      adds r4, r0, r1
/*0x396e*/      ldrb r0, [r4]
/*0x3970*/      bl call_520c
/*0x3974*/      strb r0, [r4]
            jump_3976:
/*0x3976*/      pop {r4, r5, r6, pc}
            jump_3978:
/*0x3978*/      cmp r0, #0xcf
/*0x397a*/      beq jump_3976
/*0x397c*/      ldr r1, [pc, #0x50] /* data_39d0 */
/*0x397e*/      ldr r2, [pc, #0x54] /* data_39d4 */
/*0x3980*/      ldrb r3, [r1, #3]
/*0x3982*/      ldrb r0, [r2, r0]
/*0x3984*/      cmp r3, #5
/*0x3986*/      beq jump_39a8
/*0x3988*/      add.w r0, r0, r0, lsl #1
/*0x398c*/      adds r4, r0, r1
/*0x398e*/      add.w r4, r4, #0x1b2
            jump_3992:
/*0x3992*/      movs r2, #3
/*0x3994*/      mov r1, r4
/*0x3996*/      ldr r0, [pc, #0x30] /* data_39c8 */
/*0x3998*/      bl memcmp
/*0x399c*/      cbz r0, jump_39bc
/*0x399e*/      ldrh r0, [r5]
/*0x39a0*/      strh r0, [r4]
/*0x39a2*/      ldrb r0, [r5, #2]
            jump_39a4:
/*0x39a4*/      strb r0, [r4, #2]
/*0x39a6*/      pop {r4, r5, r6, pc}
            jump_39a8:
/*0x39a8*/      ldr r2, [pc, #0x2c] /* data_39d8 */
/*0x39aa*/      ldrb r0, [r2, r0]
/*0x39ac*/      and r0, r0, #7
/*0x39b0*/      add.w r0, r0, r0, lsl #1
/*0x39b4*/      adds r4, r0, r1
/*0x39b6*/      addw r4, r4, #0x28a
/*0x39ba*/      b jump_3992
            jump_39bc:
/*0x39bc*/      movs r0, #0
/*0x39be*/      strh r0, [r4]
/*0x39c0*/      b jump_39a4

/*0x39c2*/  .byte 0x00
/*0x39c3*/  .byte 0x00

            data_39c4:
/*0x39c4*/  .word 0x200006c0
            data_39c8:
/*0x39c8*/  .word 0x20000008
            data_39cc:
/*0x39cc*/  .word 0x20000058
            data_39d0:
/*0x39d0*/  .word 0x20000734
            data_39d4:
/*0x39d4*/  .word 0x200001c4
            data_39d8:
/*0x39d8*/  .word data_7c0b


            .thumb_func
            call_39dc:
/*0x39dc*/      movs r1, #3
/*0x39de*/      ldr r2, [pc, #0x10] /* data_39f0 */
/*0x39e0*/      b jump_39e6
            jump_39e2:
/*0x39e2*/      ldrb r3, [r0, r1]
/*0x39e4*/      strb r3, [r2, r1]
            jump_39e6:
/*0x39e6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x39e8*/      uxtb r1, r1
/*0x39ea*/      bhs jump_39e2
/*0x39ec*/      bx lr

/*0x39ee*/  .byte 0x00
/*0x39ef*/  .byte 0x00

            data_39f0:
/*0x39f0*/  .word 0x20000008


            .thumb_func
            call_39f4:
/*0x39f4*/      ldr r0, [pc, #0x18] /* data_3a10 */
/*0x39f6*/      ldrb r0, [r0, #6]
/*0x39f8*/      cmp r0, #0
/*0x39fa*/      beq jump_3a0c
/*0x39fc*/      ldr r0, [pc, #0x14] /* data_3a14 */
/*0x39fe*/      ldr r0, [r0, #4]
/*0x3a00*/      movw r1, #0x9c40
/*0x3a04*/      cmp r0, r1
/*0x3a06*/      blo jump_3a0c
/*0x3a08*/      b.w jump_6d00
            jump_3a0c:
/*0x3a0c*/      bx lr

/*0x3a0e*/  .byte 0x00
/*0x3a0f*/  .byte 0x00

            data_3a10:
/*0x3a10*/  .word 0x200006c0
            data_3a14:
/*0x3a14*/  .word 0x20000008

            jump_3a18:
/*0x3a18*/      push {r4, r5, r6, lr}
/*0x3a1a*/      cbz r0, jump_3a44
/*0x3a1c*/      ldr r5, [pc, #0x3c] /* data_3a5c */
/*0x3a1e*/      movs r4, #0x48
/*0x3a20*/      ldr r6, [pc, #0x3c] /* data_3a60 */
/*0x3a22*/      b jump_3a3c
            jump_3a24:
/*0x3a24*/      ldrb r0, [r5], #-1
/*0x3a28*/      and r0, r0, #7
/*0x3a2c*/      add.w r0, r0, r0, lsl #1
/*0x3a30*/      adds r1, r0, r6
/*0x3a32*/      mov r0, r4
/*0x3a34*/      addw r1, r1, #0x28a
/*0x3a38*/      bl call_408c
            jump_3a3c:
/*0x3a3c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3a3e*/      uxtb r4, r4
/*0x3a40*/      bhs jump_3a24
/*0x3a42*/      pop {r4, r5, r6, pc}
            jump_3a44:
/*0x3a44*/      ldr r5, [pc, #0x1c] /* data_3a64 */
/*0x3a46*/      movs r4, #0x48
/*0x3a48*/      b jump_3a54
            jump_3a4a:
/*0x3a4a*/      mov r1, r5
/*0x3a4c*/      mov r0, r4
/*0x3a4e*/      bl call_408c
/*0x3a52*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3a54:
/*0x3a54*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3a56*/      uxtb r4, r4
/*0x3a58*/      bhs jump_3a4a
/*0x3a5a*/      pop {r4, r5, r6, pc}

            data_3a5c:
/*0x3a5c*/  .word data_7c52
            data_3a60:
/*0x3a60*/  .word 0x20000734
            data_3a64:
/*0x3a64*/  .word 0x200009bb


            .thumb_func
            call_3a68:
/*0x3a68*/      cmp r0, #1
/*0x3a6a*/      beq jump_3a76
/*0x3a6c*/      movs r0, #5
            jump_3a6e:
/*0x3a6e*/      ldr r1, [pc, #0xc] /* data_3a7c */
/*0x3a70*/      strb r0, [r1, #3]
/*0x3a72*/      b.w call_3bec
            jump_3a76:
/*0x3a76*/      movs r0, #4
/*0x3a78*/      b jump_3a6e

/*0x3a7a*/  .byte 0x00
/*0x3a7b*/  .byte 0x00

            data_3a7c:
/*0x3a7c*/  .word 0x20000734


            .thumb_func
            call_3a80:
/*0x3a80*/      push {r4, lr}
/*0x3a82*/      bl call_3a68
/*0x3a86*/      ldr r0, [pc, #0x14] /* data_3a9c */
/*0x3a88*/      movs r1, #1
/*0x3a8a*/      strb r1, [r0, #6]
/*0x3a8c*/      ldr r0, [pc, #0x10] /* data_3aa0 */
/*0x3a8e*/      str r1, [r0, #4]
/*0x3a90*/      ldr r1, [pc, #0x10] /* data_3aa4 */
/*0x3a92*/      ldrh r2, [r1]
/*0x3a94*/      strh r2, [r0]
/*0x3a96*/      ldrb r1, [r1, #2]
/*0x3a98*/      strb r1, [r0, #2]
/*0x3a9a*/      pop {r4, pc}

            data_3a9c:
/*0x3a9c*/  .word 0x200006c0
            data_3aa0:
/*0x3aa0*/  .word 0x20000008
            data_3aa4:
/*0x3aa4*/  .word data_7b3a


            .thumb_func
            call_3aa8:
/*0x3aa8*/      push {r4, r5, r6, lr}
/*0x3aaa*/      ldr r4, [pc, #0x5c] /* data_3b08 */
/*0x3aac*/      ldrb r0, [r4, #0xa]
/*0x3aae*/      cmp r0, #1
/*0x3ab0*/      beq jump_3ac4
/*0x3ab2*/      ldr r0, [pc, #0x58] /* data_3b0c */
/*0x3ab4*/      bl call_40ac
/*0x3ab8*/      movs r0, #5
/*0x3aba*/      ldr r1, [pc, #0x54] /* data_3b10 */
/*0x3abc*/      movs r2, #0
/*0x3abe*/      ldr r3, [pc, #0x54] /* data_3b14 */
/*0x3ac0*/      ldr r5, [pc, #0x54] /* data_3b18 */
/*0x3ac2*/      b jump_3aec
            jump_3ac4:
/*0x3ac4*/      ldr r0, [pc, #0x48] /* data_3b10 */
/*0x3ac6*/      movs r1, #0xd8
/*0x3ac8*/      subs r0, #0x90
/*0x3aca*/      bl mem_zero
/*0x3ace*/      ldr r4, [pc, #0x4c] /* data_3b1c */
/*0x3ad0*/      ldr r1, [pc, #0x38] /* data_3b0c */
/*0x3ad2*/      ldrb r0, [r4, #0xe8]!
/*0x3ad6*/      bl call_408c
/*0x3ada*/      ldrb r0, [r4, #1]
/*0x3adc*/      pop.w {r4, r5, r6, lr}
/*0x3ae0*/      ldr r1, [pc, #0x28] /* data_3b0c */
/*0x3ae2*/      b.w call_408c
            jump_3ae6:
/*0x3ae6*/      ldrb r6, [r3, r0]
/*0x3ae8*/      ldrb r6, [r5, r6]
/*0x3aea*/      strb r2, [r6, r1]
            jump_3aec:
/*0x3aec*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3aee*/      uxtb r0, r0
/*0x3af0*/      bhs jump_3ae6
/*0x3af2*/      ldr r3, [pc, #0x28] /* data_3b1c */
/*0x3af4*/      movs r2, #0xff
/*0x3af6*/      ldrb r0, [r4, #0xa]
/*0x3af8*/      adds r3, #0xe6
/*0x3afa*/      ldrb r3, [r0, r3]
/*0x3afc*/      strb r2, [r3, r1]
/*0x3afe*/      ldr r3, [pc, #0x20] /* data_3b20 */
/*0x3b00*/      ldrb r0, [r0, r3]
/*0x3b02*/      strb r2, [r0, r1]
/*0x3b04*/      pop {r4, r5, r6, pc}

/*0x3b06*/  .byte 0x00
/*0x3b07*/  .byte 0x00

            data_3b08:
/*0x3b08*/  .word 0x200006c0
            data_3b0c:
/*0x3b0c*/  .word data_7b3d
            data_3b10:
/*0x3b10*/  .word 0x200003c2
            data_3b14:
/*0x3b14*/  .word data_7ae0
            data_3b18:
/*0x3b18*/  .word 0x200001c4
            data_3b1c:
/*0x3b1c*/  .word 0x20000734
            data_3b20:
/*0x3b20*/  .word 0x00007ad2 /* possible pointer */


            .thumb_func
            call_3b24:
/*0x3b24*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3b28*/      bl call_6d6c
/*0x3b2c*/      ldr r4, [pc, #0x9c] /* data_3bcc */
/*0x3b2e*/      ldr r5, [pc, #0xa0] /* data_3bd0 */
/*0x3b30*/      ldrb r0, [r4, #7]
/*0x3b32*/      cbz r0, jump_3b7c
/*0x3b34*/      ldrb r0, [r4, #6]
/*0x3b36*/      cbnz r0, jump_3b3e
/*0x3b38*/      bl call_53cc
/*0x3b3c*/      cbz r0, jump_3b7c
            jump_3b3e:
/*0x3b3e*/      ldrb r0, [r4, #6]
/*0x3b40*/      cbz r0, jump_3b46
/*0x3b42*/      ldr r7, [pc, #0x90] /* data_3bd4 */
/*0x3b44*/      b jump_3b4a
            jump_3b46:
/*0x3b46*/      ldr r0, [pc, #0x90] /* data_3bd8 */
/*0x3b48*/      ldr r7, [r0]
            jump_3b4a:
/*0x3b4a*/      movs r1, #3
/*0x3b4c*/      ldr.w ip, [pc, #0x8c] /* data_3bdc */
/*0x3b50*/      b jump_3b76
            jump_3b52:
/*0x3b52*/      add.w r0, ip, r1
/*0x3b56*/      ldrb r3, [r0, #0x1e]
/*0x3b58*/      movs r0, #3
/*0x3b5a*/      b jump_3b70
            jump_3b5c:
/*0x3b5c*/      cmp r1, r0
/*0x3b5e*/      bne jump_3b64
/*0x3b60*/      ldrb r2, [r7, r0]
/*0x3b62*/      b jump_3b66
            jump_3b64:
/*0x3b64*/      movs r2, #0
            jump_3b66:
/*0x3b66*/      add.w r6, r0, r0, lsl #3
/*0x3b6a*/      add.w r6, r5, r6, lsl #3
/*0x3b6e*/      strb r2, [r6, r3]
            jump_3b70:
/*0x3b70*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3b72*/      uxtb r0, r0
/*0x3b74*/      bhs jump_3b5c
            jump_3b76:
/*0x3b76*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3b78*/      uxtb r1, r1
/*0x3b7a*/      bhs jump_3b52
            jump_3b7c:
/*0x3b7c*/      ldrb r0, [r4, #6]
/*0x3b7e*/      cbz r0, jump_3b8c
/*0x3b80*/      ldr r0, [pc, #0x5c] /* data_3be0 */
/*0x3b82*/      ldr r1, [pc, #0x50] /* data_3bd4 */
/*0x3b84*/      ldrb.w r0, [r0, #0xe9]
/*0x3b88*/      bl call_408c
            jump_3b8c:
/*0x3b8c*/      ldrb r0, [r4, #9]
/*0x3b8e*/      cbz r0, jump_3ba2
/*0x3b90*/      ldr r0, [pc, #0x50] /* data_3be4 */
/*0x3b92*/      ldrh r0, [r0]
/*0x3b94*/      lsls r0, r0, #0x15
/*0x3b96*/      asrs r0, r0, #8
/*0x3b98*/      lsrs r1, r0, #0x18
/*0x3b9a*/      movs r0, #0x39
/*0x3b9c*/      bl call_40d0
/*0x3ba0*/      b jump_3bbe
            jump_3ba2:
/*0x3ba2*/      movs r1, #0
/*0x3ba4*/      movs r0, #0x39
/*0x3ba6*/      bl call_40d0
/*0x3baa*/      ldr r0, [pc, #0x3c] /* data_3be8 */
/*0x3bac*/      ldrb r0, [r0, #2]
/*0x3bae*/      cbz r0, jump_3bbe
/*0x3bb0*/      add.w r0, r0, r0, lsl #3
/*0x3bb4*/      add.w r0, r5, r0, lsl #3
/*0x3bb8*/      movs r1, #0xff
/*0x3bba*/      strb r1, [r0, #-0xf]
            jump_3bbe:
/*0x3bbe*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x3bc2*/      movs r1, #0
/*0x3bc4*/      movs r0, #0x42
/*0x3bc6*/      b.w call_40d0

/*0x3bca*/  .byte 0x00
/*0x3bcb*/  .byte 0x00

            data_3bcc:
/*0x3bcc*/  .word 0x200006c0
            data_3bd0:
/*0x3bd0*/  .word 0x20000332
            data_3bd4:
/*0x3bd4*/  .word 0x20000008
            data_3bd8:
/*0x3bd8*/  .word 0x20000090
            data_3bdc:
/*0x3bdc*/  .word 0x200001c4
            data_3be0:
/*0x3be0*/  .word 0x20000734
            data_3be4:
/*0x3be4*/  .word 0x20000020
            data_3be8:
/*0x3be8*/  .word 0x20000060


            .thumb_func
            call_3bec:
/*0x3bec*/      ldr r0, [pc, #4] /* data_3bf4 */
/*0x3bee*/      ldrb r0, [r0, #2]
/*0x3bf0*/      b.w jump_3f84

            data_3bf4:
/*0x3bf4*/  .word 0x20000060

            bootloader_crc_magic:
/*0x3bf8*/  .byte 0x00
/*0x3bf9*/  .byte 0x00
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
/*0x3c04*/      push {r4, r5, r6, lr}
/*0x3c06*/      ldr r0, [pc, #0xf0] /* data_3cf8 */
/*0x3c08*/      ldr r5, [pc, #0xf0] /* data_3cfc */
/*0x3c0a*/      ldrb r0, [r0, #0xb]
/*0x3c0c*/      cmp r0, #8
/*0x3c0e*/      bhs switch_3c6e
/*0x3c10*/      tbb [pc, r0]

/*0x3c14*/  .byte 0x2d /* case switch_3c6e */
/*0x3c15*/  .byte 0x04 /* case switch_3c1c */
/*0x3c16*/  .byte 0x04 /* case switch_3c1c */
/*0x3c17*/  .byte 0x04 /* case switch_3c1c */
/*0x3c18*/  .byte 0x0d /* case switch_3c2e */
/*0x3c19*/  .byte 0x0f /* case switch_3c32 */
/*0x3c1a*/  .byte 0x16 /* case switch_3c40 */
/*0x3c1b*/  .byte 0x3b /* case switch_3c8a */

            switch_3c1c:
/*0x3c1c*/      ldr r1, [pc, #0xe0] /* data_3d00 */
/*0x3c1e*/      add.w r0, r0, r0, lsl #3
/*0x3c22*/      add.w r0, r1, r0, lsl #3
/*0x3c26*/      movs r2, #0xff
/*0x3c28*/      movs r1, #0x48
/*0x3c2a*/      subs r0, #0x48
/*0x3c2c*/      b jump_3c38
            switch_3c2e:
/*0x3c2e*/      movs r2, #0x80
/*0x3c30*/      b jump_3c34
            switch_3c32:
/*0x3c32*/      movs r2, #0xff
            jump_3c34:
/*0x3c34*/      ldr r0, [pc, #0xc8] /* data_3d00 */
/*0x3c36*/      movs r1, #0xd8
            jump_3c38:
/*0x3c38*/      pop.w {r4, r5, r6, lr}
/*0x3c3c*/      b.w mem_set
            switch_3c40:
/*0x3c40*/      movs r4, #0x48
/*0x3c42*/      b jump_3c68
            jump_3c44:
/*0x3c44*/      ldr r0, [pc, #0xbc] /* data_3d04 */
/*0x3c46*/      ldrb r1, [r5, #5]
/*0x3c48*/      ldrb r0, [r0, r4]
/*0x3c4a*/      cmp r1, r0
/*0x3c4c*/      bne jump_3c70
/*0x3c4e*/      movs r6, #0
/*0x3c50*/      b jump_3c78
            jump_3c52:
/*0x3c52*/      mov r1, r6
/*0x3c54*/      movs r0, #0x39
/*0x3c56*/      bl call_40d0
/*0x3c5a*/      mov r1, r6
/*0x3c5c*/      movs r0, #0x42
/*0x3c5e*/      b jump_3c64
            jump_3c60:
/*0x3c60*/      mov r1, r6
/*0x3c62*/      movs r0, #0x29
            jump_3c64:
/*0x3c64*/      bl call_40d0
            jump_3c68:
/*0x3c68*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3c6a*/      uxtb r4, r4
/*0x3c6c*/      bhs jump_3c44
            switch_3c6e:
/*0x3c6e*/      pop {r4, r5, r6, pc}
            jump_3c70:
/*0x3c70*/      ldrb r1, [r5, #4]
/*0x3c72*/      cmp r1, r0
/*0x3c74*/      bne jump_3c68
/*0x3c76*/      movs r6, #0xff
            jump_3c78:
/*0x3c78*/      mov r1, r6
/*0x3c7a*/      mov r0, r4
/*0x3c7c*/      bl call_40d0
/*0x3c80*/      cmp r4, #0x3a
/*0x3c82*/      beq jump_3c52
/*0x3c84*/      cmp r4, #0x10
/*0x3c86*/      bne jump_3c68
/*0x3c88*/      b jump_3c60
            switch_3c8a:
/*0x3c8a*/      movs r1, #0xd8
/*0x3c8c*/      ldr r0, [pc, #0x70] /* data_3d00 */
/*0x3c8e*/      bl mem_zero
/*0x3c92*/      ldrb r0, [r5, #4]
/*0x3c94*/      cbz r0, jump_3ca2
/*0x3c96*/      movs r0, #0
            jump_3c98:
/*0x3c98*/      bl call_3ddc
/*0x3c9c*/      cbz r0, jump_3ca8
/*0x3c9e*/      movs r0, #0x12
/*0x3ca0*/      b jump_3caa
            jump_3ca2:
/*0x3ca2*/      movs r0, #1
/*0x3ca4*/      strb r0, [r5, #4]
/*0x3ca6*/      b jump_3c98
            jump_3ca8:
/*0x3ca8*/      movs r0, #9
            jump_3caa:
/*0x3caa*/      ldr r4, [pc, #0x5c] /* data_3d08 */
/*0x3cac*/      movs r1, #0xb4
/*0x3cae*/      ldrb r0, [r4, r0]
/*0x3cb0*/      bl call_40d0
/*0x3cb4*/      ldr r5, [pc, #0x54] /* data_3d0c */
/*0x3cb6*/      ldrb r0, [r5]
/*0x3cb8*/      lsls r0, r0, #0x1f
/*0x3cba*/      beq jump_3cc4
/*0x3cbc*/      ldrb r0, [r4, #0x1e]
/*0x3cbe*/      movs r1, #0xb4
/*0x3cc0*/      bl call_40d0
            jump_3cc4:
/*0x3cc4*/      ldrb r0, [r5]
/*0x3cc6*/      lsls r0, r0, #0x1e
/*0x3cc8*/      bpl jump_3cd2
/*0x3cca*/      ldrb r0, [r4, #0x1f]
/*0x3ccc*/      movs r1, #0xb4
/*0x3cce*/      bl call_40d0
            jump_3cd2:
/*0x3cd2*/      ldrb r0, [r5]
/*0x3cd4*/      lsls r0, r0, #0x1d
/*0x3cd6*/      bpl jump_3ce2
/*0x3cd8*/      ldrb.w r0, [r4, #0x20]
/*0x3cdc*/      movs r1, #0xb4
/*0x3cde*/      bl call_40d0
            jump_3ce2:
/*0x3ce2*/      ldrb r0, [r5]
/*0x3ce4*/      lsls r0, r0, #0x1c
/*0x3ce6*/      bpl switch_3c6e
/*0x3ce8*/      ldrb.w r0, [r4, #0x21]
/*0x3cec*/      pop.w {r4, r5, r6, lr}
/*0x3cf0*/      movs r1, #0xb4
/*0x3cf2*/      b.w call_40d0

/*0x3cf6*/  .byte 0x00
/*0x3cf7*/  .byte 0x00

            data_3cf8:
/*0x3cf8*/  .word 0x200006c0
            data_3cfc:
/*0x3cfc*/  .word 0x20000090
            data_3d00:
/*0x3d00*/  .word 0x20000332
            data_3d04:
/*0x3d04*/  .word data_7b7b
            data_3d08:
/*0x3d08*/  .word 0x200001c4
            data_3d0c:
/*0x3d0c*/  .word 0x20000001


            .thumb_func
            call_3d10:
/*0x3d10*/      ldr r0, [pc, #0x4c] /* data_3d60 */
/*0x3d12*/      push {r4, lr}
/*0x3d14*/      ldrb r0, [r0, #7]
/*0x3d16*/      cmp r0, #4
/*0x3d18*/      beq jump_3d22
/*0x3d1a*/      cmp r0, #5
/*0x3d1c*/      beq jump_3d22
/*0x3d1e*/      ldr r1, [pc, #0x44] /* data_3d64 */
/*0x3d20*/      b jump_3d2e
            jump_3d22:
/*0x3d22*/      ldr r0, [pc, #0x44] /* data_3d68 */
/*0x3d24*/      ldrh r0, [r0, #2]
/*0x3d26*/      lsls r0, r0, #0x15
/*0x3d28*/      bpl jump_3d36
/*0x3d2a*/      ldr r1, [pc, #0x38] /* data_3d64 */
/*0x3d2c*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_3d2e:
/*0x3d2e*/      movs r0, #0x42
/*0x3d30*/      bl call_408c
/*0x3d34*/      b jump_3d3e
            jump_3d36:
/*0x3d36*/      movs r1, #0
/*0x3d38*/      movs r0, #0x42
/*0x3d3a*/      bl call_40d0
            jump_3d3e:
/*0x3d3e*/      movs r1, #0
/*0x3d40*/      movs r0, #0x39
/*0x3d42*/      bl call_40d0
/*0x3d46*/      ldr r0, [pc, #0x24] /* data_3d6c */
/*0x3d48*/      ldrb r0, [r0, #2]
/*0x3d4a*/      cmp r0, #0
/*0x3d4c*/      beq jump_3d5e
/*0x3d4e*/      ldr r2, [pc, #0x20] /* data_3d70 */
/*0x3d50*/      add.w r0, r0, r0, lsl #3
/*0x3d54*/      add.w r0, r2, r0, lsl #3
/*0x3d58*/      movs r1, #0xff
/*0x3d5a*/      strb r1, [r0, #-0xf]
            jump_3d5e:
/*0x3d5e*/      pop {r4, pc}

            data_3d60:
/*0x3d60*/  .word 0x200019d4
            data_3d64:
/*0x3d64*/  .word data_7b3d
            data_3d68:
/*0x3d68*/  .word 0x20000010
            data_3d6c:
/*0x3d6c*/  .word 0x20000060
            data_3d70:
/*0x3d70*/  .word 0x20000332


            .thumb_func
            call_3d74:
/*0x3d74*/      push {r4, lr}
/*0x3d76*/      bl call_5ba4
/*0x3d7a*/      movs r1, #0
/*0x3d7c*/      movs r0, #0x39
/*0x3d7e*/      bl call_40d0
/*0x3d82*/      movs r1, #0
/*0x3d84*/      pop.w {r4, lr}
/*0x3d88*/      movs r0, #0x42
/*0x3d8a*/      b.w call_40d0

/*0x3d8e*/  .byte 0x00
/*0x3d8f*/  .byte 0x00


            .thumb_func
            call_3d90:
/*0x3d90*/      mov r3, r1
/*0x3d92*/      ldr r1, [pc, #0x40] /* data_3dd4 */
/*0x3d94*/      push {r4, lr}
/*0x3d96*/      ldrb r1, [r1, #2]
/*0x3d98*/      cmp r1, #0
/*0x3d9a*/      beq jump_3dd2
/*0x3d9c*/      add.w r1, r1, r1, lsl #1
/*0x3da0*/      add.w r4, r0, r1, lsl #5
/*0x3da4*/      subs r4, #0x60
/*0x3da6*/      lsrs r0, r4, #2
/*0x3da8*/      lsls r1, r0, #0xc
/*0x3daa*/      ldr r0, [pc, #0x2c] /* data_3dd8 */
/*0x3dac*/      mov.w r2, #0x1000
/*0x3db0*/      add.w r1, r1, #0x5000
/*0x3db4*/      cbz r3, jump_3dbe
/*0x3db6*/      pop.w {r4, lr}
/*0x3dba*/      b.w jump_6d20
            jump_3dbe:
/*0x3dbe*/      bl call_4374
/*0x3dc2*/      ldr r1, [pc, #0x14] /* data_3dd8 */
/*0x3dc4*/      and r0, r4, #3
/*0x3dc8*/      add.w r0, r1, r0, lsl #10
/*0x3dcc*/      ldr r1, [pc, #4] /* data_3dd4 */
/*0x3dce*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x3dd0*/      str r0, [r1]
            jump_3dd2:
/*0x3dd2*/      pop {r4, pc}

            data_3dd4:
/*0x3dd4*/  .word 0x20000060
            data_3dd8:
/*0x3dd8*/  .word 0x200009ce


            .thumb_func
            call_3ddc:
/*0x3ddc*/      push {r3, r4, r5, lr}
/*0x3dde*/      mov r5, r0
/*0x3de0*/      movs r2, #2
/*0x3de2*/      movs r1, #0
/*0x3de4*/      mov r0, sp
/*0x3de6*/      bl call_4374
/*0x3dea*/      ldrh.w r1, [sp]
/*0x3dee*/      movw r4, #0x8001
/*0x3df2*/      cmp r1, r4
/*0x3df4*/      beq jump_3e16
/*0x3df6*/      cbz r5, jump_3e12
/*0x3df8*/      ldr r0, [pc, #0x20] /* data_3e1c */
/*0x3dfa*/      ldrb r0, [r0, #2]
/*0x3dfc*/      bl call_3f04
/*0x3e00*/      movs r2, #2
/*0x3e02*/      movs r1, #0
/*0x3e04*/      mov r0, sp
/*0x3e06*/      bl call_4374
/*0x3e0a*/      ldrh.w r0, [sp]
/*0x3e0e*/      cmp r0, r4
/*0x3e10*/      beq jump_3e16
            jump_3e12:
/*0x3e12*/      movs r0, #0
/*0x3e14*/      pop {r3, r4, r5, pc}
            jump_3e16:
/*0x3e16*/      movs r0, #1
/*0x3e18*/      pop {r3, r4, r5, pc}

/*0x3e1a*/  .byte 0x00
/*0x3e1b*/  .byte 0x00

            data_3e1c:
/*0x3e1c*/  .word 0x20000060


            .thumb_func
            call_3e20:
/*0x3e20*/      push {r4, r5, r6, lr}
/*0x3e22*/      mov r4, r0
/*0x3e24*/      movs r2, #4
/*0x3e26*/      movs r1, #0
/*0x3e28*/      ldr r0, [pc, #0x6c] /* data_3e98 */
/*0x3e2a*/      bl call_4374
/*0x3e2e*/      ldr r5, [pc, #0x68] /* data_3e98 */
/*0x3e30*/      movw r1, #0x8001
/*0x3e34*/      ldrh r0, [r5]
/*0x3e36*/      cmp r0, r1
/*0x3e38*/      beq jump_3e52
/*0x3e3a*/      cmp.w r0, #0x1000
/*0x3e3e*/      bhs jump_3e44
/*0x3e40*/      ldrb r4, [r5, #2]
/*0x3e42*/      b jump_3e4a
            jump_3e44:
/*0x3e44*/      cmp r4, #0xff
/*0x3e46*/      bne jump_3e4a
/*0x3e48*/      movs r4, #0
            jump_3e4a:
/*0x3e4a*/      mov r0, r4
/*0x3e4c*/      bl call_3f04
/*0x3e50*/      b jump_3e62
            jump_3e52:
/*0x3e52*/      cmp r4, #0xff
/*0x3e54*/      beq jump_3e62
/*0x3e56*/      ldrb r0, [r5, #2]
/*0x3e58*/      cmp r0, r4
/*0x3e5a*/      beq jump_3e62
/*0x3e5c*/      strb r4, [r5, #2]
/*0x3e5e*/      bl call_3f98
            jump_3e62:
/*0x3e62*/      ldrb r0, [r5, #2]
/*0x3e64*/      movs r2, #2
/*0x3e66*/      lsls r1, r0, #0xc
/*0x3e68*/      ldr r0, [pc, #0x30] /* data_3e9c */
/*0x3e6a*/      add.w r1, r1, #0x1000
/*0x3e6e*/      bl call_4374
/*0x3e72*/      ldr r0, [pc, #0x28] /* data_3e9c */
/*0x3e74*/      ldrh r0, [r0]
/*0x3e76*/      cmp r0, #0xa
/*0x3e78*/      beq jump_3e82
/*0x3e7a*/      pop.w {r4, r5, r6, lr}
/*0x3e7e*/      b.w call_3ea0
            jump_3e82:
/*0x3e82*/      ldrb r0, [r5, #2]
/*0x3e84*/      pop.w {r4, r5, r6, lr}
/*0x3e88*/      lsls r1, r0, #0xc
/*0x3e8a*/      movw r2, #0x29a
/*0x3e8e*/      ldr r0, [pc, #0xc] /* data_3e9c */
/*0x3e90*/      add.w r1, r1, #0x1000
/*0x3e94*/      b.w call_4374

            data_3e98:
/*0x3e98*/  .word 0x20000060
            data_3e9c:
/*0x3e9c*/  .word 0x20000734


            .thumb_func
            call_3ea0:
/*0x3ea0*/      ldr r1, [pc, #0x28] /* data_3ecc */
/*0x3ea2*/      push {r4, lr}
/*0x3ea4*/      movs r0, #0xa
/*0x3ea6*/      strh r0, [r1]
/*0x3ea8*/      ldr r0, [pc, #0x20] /* data_3ecc */
/*0x3eaa*/      movs r2, #0xff
/*0x3eac*/      movs r1, #0xc0
/*0x3eae*/      adds r0, #0x28
/*0x3eb0*/      bl mem_set
/*0x3eb4*/      ldr r0, [pc, #0x14] /* data_3ecc */
/*0x3eb6*/      movs r2, #0xff
/*0x3eb8*/      movs r1, #0xc8
/*0x3eba*/      adds r0, #0xea
/*0x3ebc*/      bl mem_set
/*0x3ec0*/      bl call_3f1c
/*0x3ec4*/      pop.w {r4, lr}
/*0x3ec8*/      b.w call_3bec

            data_3ecc:
/*0x3ecc*/  .word 0x20000734


            .thumb_func
            call_3ed0:
/*0x3ed0*/      push {r4, lr}
/*0x3ed2*/      ldr r4, [pc, #0x2c] /* data_3f00 */
/*0x3ed4*/      movs r0, #0
/*0x3ed6*/      strb r0, [r4, #2]
/*0x3ed8*/      bl call_3ea0
            jump_3edc:
/*0x3edc*/      ldrb r0, [r4, #2]
/*0x3ede*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x3ee0*/      uxtb r0, r0
/*0x3ee2*/      strb r0, [r4, #2]
/*0x3ee4*/      cmp r0, #4
/*0x3ee6*/      bhs jump_3eee
/*0x3ee8*/      bl call_3bec
/*0x3eec*/      b jump_3edc
            jump_3eee:
/*0x3eee*/      movs r0, #0
/*0x3ef0*/      bl call_3f04
/*0x3ef4*/      pop.w {r4, lr}
/*0x3ef8*/      movs r0, #0xff
/*0x3efa*/      b.w call_3e20

/*0x3efe*/  .byte 0x00
/*0x3eff*/  .byte 0x00

            data_3f00:
/*0x3f00*/  .word 0x20000060


            .thumb_func
            call_3f04:
/*0x3f04*/      ldr r1, [pc, #0x10] /* data_3f18 */
/*0x3f06*/      movw r2, #0x8001
/*0x3f0a*/      strh r2, [r1]
/*0x3f0c*/      strb r0, [r1, #2]
/*0x3f0e*/      movs r0, #0xff
/*0x3f10*/      strb r0, [r1, #3]
/*0x3f12*/      b.w call_3f98

/*0x3f16*/  .byte 0x00
/*0x3f17*/  .byte 0x00

            data_3f18:
/*0x3f18*/  .word 0x20000060


            .thumb_func
            call_3f1c:
/*0x3f1c*/      push {r4, r5, r6, lr}
/*0x3f1e*/      ldr r5, [pc, #0x54] /* data_3f74 */
/*0x3f20*/      movs r0, #0
/*0x3f22*/      strb r0, [r5, #2]
/*0x3f24*/      movs r0, #7
/*0x3f26*/      strb r0, [r5, #3]
/*0x3f28*/      adds r4, r5, #4
/*0x3f2a*/      mov r2, r0
/*0x3f2c*/      b jump_3f42
            jump_3f2e:
/*0x3f2e*/      ldr r1, [pc, #0x48] /* data_3f78 */
/*0x3f30*/      movs r0, #5
/*0x3f32*/      b jump_3f3c
            jump_3f34:
/*0x3f34*/      ldrb r3, [r1], #1
/*0x3f38*/      strb r3, [r4], #1
            jump_3f3c:
/*0x3f3c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3f3e*/      uxtb r0, r0
/*0x3f40*/      bhs jump_3f34
            jump_3f42:
/*0x3f42*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x3f44*/      uxtb r2, r2
/*0x3f46*/      bhs jump_3f2e
/*0x3f48*/      movs r0, #0
/*0x3f4a*/      bl call_60f8
/*0x3f4e*/      ldr r0, [pc, #0x24] /* data_3f74 */
/*0x3f50*/      ldr r1, [pc, #0x28] /* data_3f7c */
/*0x3f52*/      adds r0, #0x80
/*0x3f54*/      ldrh r1, [r1]
/*0x3f56*/      strh.w r1, [r0, #0x68]
/*0x3f5a*/      movs r0, #3
/*0x3f5c*/      strb r0, [r5, #0x11]
/*0x3f5e*/      movs r1, #0xd8
/*0x3f60*/      ldr r0, [pc, #0x1c] /* data_3f80 */
/*0x3f62*/      bl mem_zero
/*0x3f66*/      pop.w {r4, r5, r6, lr}
/*0x3f6a*/      ldr r0, [pc, #0x14] /* data_3f80 */
/*0x3f6c*/      movs r1, #0xf
/*0x3f6e*/      adds r0, #0xd8
/*0x3f70*/      b.w mem_zero

            data_3f74:
/*0x3f74*/  .word 0x20000734
            data_3f78:
/*0x3f78*/  .word data_81a9
            data_3f7c:
/*0x3f7c*/  .word data_7ad4
            data_3f80:
/*0x3f80*/  .word 0x200008e6

            jump_3f84:
/*0x3f84*/      lsls r1, r0, #0xc
/*0x3f86*/      movw r2, #0x29a
/*0x3f8a*/      ldr r0, [pc, #8] /* data_3f94 */
/*0x3f8c*/      add.w r1, r1, #0x1000
/*0x3f90*/      b.w jump_6d20

            data_3f94:
/*0x3f94*/  .word 0x20000734


            .thumb_func
            call_3f98:
/*0x3f98*/      movs r2, #4
/*0x3f9a*/      movs r1, #0
/*0x3f9c*/      ldr r0, [pc, #4] /* data_3fa4 */
/*0x3f9e*/      b.w jump_6d20

/*0x3fa2*/  .byte 0x00
/*0x3fa3*/  .byte 0x00

            data_3fa4:
/*0x3fa4*/  .word 0x20000060


            .thumb_func
            call_3fa8:
/*0x3fa8*/      add.w r0, r0, r1, lsr #3
/*0x3fac*/      and r3, r1, #7
/*0x3fb0*/      movs r1, #1
/*0x3fb2*/      lsls r1, r3
/*0x3fb4*/      cmp r2, #0
/*0x3fb6*/      ldrb r2, [r0]
/*0x3fb8*/      uxtb r1, r1
/*0x3fba*/      beq jump_3fc0
/*0x3fbc*/      orrs r2, r1
/*0x3fbe*/      b jump_3fc2
            jump_3fc0:
/*0x3fc0*/      bics r2, r1
            jump_3fc2:
/*0x3fc2*/      strb r2, [r0]
/*0x3fc4*/      bx lr

            .thumb_func
            call_3fc6:
/*0x3fc6*/      push {r4, r5, r6, lr}
/*0x3fc8*/      mov r6, r0
            jump_3fca:
/*0x3fca*/      movs r5, #0
/*0x3fcc*/      movs r4, #3
/*0x3fce*/      b jump_3fdc
            jump_3fd0:
/*0x3fd0*/      bl rand
/*0x3fd4*/      uxtb r0, r0
/*0x3fd6*/      strb r0, [r6, r4]
/*0x3fd8*/      add r0, r5
/*0x3fda*/      uxth r5, r0
            jump_3fdc:
/*0x3fdc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3fde*/      uxtb r4, r4
/*0x3fe0*/      bhs jump_3fd0
/*0x3fe2*/      cmp r5, #0xe0
/*0x3fe4*/      blo jump_3fca
/*0x3fe6*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_3fe8:
/*0x3fe8*/      push {r4, r5, lr}
/*0x3fea*/      lsls r3, r1, #1
/*0x3fec*/      cmp r3, #0xff
/*0x3fee*/      bls jump_3ff6
/*0x3ff0*/      rsb.w r3, r3, #0x1fe
/*0x3ff4*/      uxth r3, r3
            jump_3ff6:
/*0x3ff6*/      movs r4, #0x2b
/*0x3ff8*/      udiv r4, r0, r4
/*0x3ffc*/      movs r5, #0x55
/*0x3ffe*/      mla r0, r4, r5, r0
/*0x4002*/      sub.w r1, r1, r3, lsr #1
/*0x4006*/      uxtb r1, r1
/*0x4008*/      add.w r0, r0, r0, lsl #1
/*0x400c*/      strb r1, [r2]
/*0x400e*/      lsls r0, r0, #0x19
/*0x4010*/      strb r1, [r2, #1]
/*0x4012*/      lsrs r0, r0, #0x18
/*0x4014*/      strb r1, [r2, #2]
/*0x4016*/      lsls r5, r4, #0x1f
/*0x4018*/      beq jump_401e
/*0x401a*/      rsb.w r0, r0, #0xff
            jump_401e:
/*0x401e*/      muls r0, r3, r0
/*0x4020*/      ubfx r0, r0, #8, #8
/*0x4024*/      cmp r4, #5
/*0x4026*/      bhs jump_405c
/*0x4028*/      tbb [pc, r4]

/*0x402c*/  .byte 0x03 /* case switch_4032 */
/*0x402d*/  .byte 0x07 /* case switch_403a */
/*0x402e*/  .byte 0x0c /* case switch_4044 */
/*0x402f*/  .byte 0x10 /* case switch_404c */
/*0x4030*/  .byte 0x13 /* case switch_4052 */
/*0x4031*/  .byte 0x00

            switch_4032:
/*0x4032*/      add r3, r1
/*0x4034*/      strb r3, [r2]
/*0x4036*/      add r0, r1
/*0x4038*/      b jump_4040
            switch_403a:
/*0x403a*/      add r0, r1
/*0x403c*/      strb r0, [r2]
/*0x403e*/      adds r0, r1, r3
            jump_4040:
/*0x4040*/      strb r0, [r2, #1]
/*0x4042*/      pop {r4, r5, pc}
            switch_4044:
/*0x4044*/      add r3, r1
/*0x4046*/      strb r3, [r2, #1]
            jump_4048:
/*0x4048*/      add r0, r1
/*0x404a*/      b jump_4058
            switch_404c:
/*0x404c*/      add r0, r1
/*0x404e*/      strb r0, [r2, #1]
/*0x4050*/      b jump_4056
            switch_4052:
/*0x4052*/      add r0, r1
/*0x4054*/      strb r0, [r2]
            jump_4056:
/*0x4056*/      adds r0, r1, r3
            jump_4058:
/*0x4058*/      strb r0, [r2, #2]
/*0x405a*/      pop {r4, r5, pc}
            jump_405c:
/*0x405c*/      add r3, r1
/*0x405e*/      strb r3, [r2]
/*0x4060*/      b jump_4048

/*0x4062*/  .byte 0x00
/*0x4063*/  .byte 0x00

            jump_4064:
/*0x4064*/      push {r4, lr}
/*0x4066*/      ldr r1, [pc, #0x20] /* data_4088 */
/*0x4068*/      movs r3, #0x48
/*0x406a*/      b jump_4080
            jump_406c:
/*0x406c*/      movs r2, #3
/*0x406e*/      b jump_4078
            jump_4070:
/*0x4070*/      ldrb r4, [r0], #1
/*0x4074*/      strb r4, [r1], #0x48
            jump_4078:
/*0x4078*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x407a*/      uxtb r2, r2
/*0x407c*/      bhs jump_4070
/*0x407e*/      subs r1, #0xd7
            jump_4080:
/*0x4080*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4082*/      uxtb r3, r3
/*0x4084*/      bhs jump_406c
/*0x4086*/      pop {r4, pc}

            data_4088:
/*0x4088*/  .word 0x20000332


            .thumb_func
            call_408c:
/*0x408c*/      cmp r0, #0xff
/*0x408e*/      beq jump_40a6
/*0x4090*/      ldr r2, [pc, #0x14] /* data_40a8 */
/*0x4092*/      add r2, r0
/*0x4094*/      movs r0, #0
            jump_4096:
/*0x4096*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4098*/      ldrb r3, [r1], #1
/*0x409c*/      uxtb r0, r0
/*0x409e*/      strb r3, [r2], #0x48
/*0x40a2*/      cmp r0, #3
/*0x40a4*/      blo jump_4096
            jump_40a6:
/*0x40a6*/      bx lr

            data_40a8:
/*0x40a8*/  .word 0x20000332


            .thumb_func
            call_40ac:
/*0x40ac*/      push {r4, r5, r6, lr}
/*0x40ae*/      mov r5, r0
/*0x40b0*/      ldr r6, [pc, #0x18] /* data_40cc */
/*0x40b2*/      movs r4, #3
/*0x40b4*/      b jump_40c4
            jump_40b6:
/*0x40b6*/      ldrb r2, [r5]
/*0x40b8*/      movs r1, #0x48
/*0x40ba*/      mov r0, r6
/*0x40bc*/      bl mem_set
/*0x40c0*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x40c2*/      adds r6, #0x48
            jump_40c4:
/*0x40c4*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x40c6*/      uxtb r4, r4
/*0x40c8*/      bhs jump_40b6
/*0x40ca*/      pop {r4, r5, r6, pc}

            data_40cc:
/*0x40cc*/  .word 0x20000332


            .thumb_func
            call_40d0:
/*0x40d0*/      cmp r0, #0xff
/*0x40d2*/      beq jump_40e6
/*0x40d4*/      ldr r2, [pc, #0x10] /* data_40e8 */
/*0x40d6*/      add r0, r2
/*0x40d8*/      movs r2, #3
/*0x40da*/      b jump_40e0
            jump_40dc:
/*0x40dc*/      strb r1, [r0], #0x48
            jump_40e0:
/*0x40e0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x40e2*/      uxtb r2, r2
/*0x40e4*/      bhs jump_40dc
            jump_40e6:
/*0x40e6*/      bx lr

            data_40e8:
/*0x40e8*/  .word 0x20000332


            .thumb_func
            call_40ec:
/*0x40ec*/      push {r2, r3, r4, r5, r6, lr}
/*0x40ee*/      ldr r4, [pc, #0x20] /* data_4110 */
/*0x40f0*/      movs r0, #5
/*0x40f2*/      strh.w r0, [sp]
/*0x40f6*/      mov.w r5, #0x400
/*0x40fa*/      str r5, [r4, #0x28]
/*0x40fc*/      movs r2, #2
/*0x40fe*/      add r1, sp, #4
/*0x4100*/      mov r0, sp
/*0x4102*/      bl call_43b4
/*0x4106*/      str r5, [r4, #0x24]
/*0x4108*/      ldrb.w r0, [sp, #5]
/*0x410c*/      pop {r2, r3, r4, r5, r6, pc}

/*0x410e*/  .byte 0x00
/*0x410f*/  .byte 0x00

            data_4110:
/*0x4110*/  .word 0x400b2000


            .thumb_func
            call_4114:
/*0x4114*/      push {r4, r5, r6, lr}
/*0x4116*/      sub sp, #0x30
/*0x4118*/      bl call_4198
/*0x411c*/      ldr r6, [pc, #0x60] /* data_4180 */
/*0x411e*/      ldrb r0, [r6]
/*0x4120*/      cmp r0, #1
/*0x4122*/      bne jump_4178
/*0x4124*/      movs r4, #0
/*0x4126*/      mov r2, r4
/*0x4128*/      movs r1, #0x20
/*0x412a*/      movs r3, #1
/*0x412c*/      mov r0, r2
/*0x412e*/      bl call_3888
/*0x4132*/      mov.w r0, #0x4000
/*0x4136*/      asrs r5, r0, #4
/*0x4138*/      strd r0, r5, [sp]
/*0x413c*/      movs r0, #8
/*0x413e*/      strd r0, r4, [sp, #8]
/*0x4142*/      str r4, [sp, #0x10]
/*0x4144*/      str r4, [sp, #0x14]
/*0x4146*/      movs r0, #4
/*0x4148*/      str r4, [sp, #0x18]
/*0x414a*/      strd r4, r0, [sp, #0x1c]
/*0x414e*/      ldr r4, [pc, #0x34] /* data_4184 */
/*0x4150*/      str r0, [sp, #0x24]
/*0x4152*/      str r0, [sp, #0x28]
/*0x4154*/      mov r1, sp
/*0x4156*/      mov r0, r4
/*0x4158*/      bl call_65a0
/*0x415c*/      movs r1, #1
/*0x415e*/      mov r0, r4
/*0x4160*/      bl call_65ea
/*0x4164*/      ldr r0, [pc, #0x20] /* data_4188 */
/*0x4166*/      str r5, [r0, #0x24]
/*0x4168*/      movs r1, #1
/*0x416a*/      mov r0, r4
/*0x416c*/      bl call_658c
/*0x4170*/      bl call_4234
/*0x4174*/      movs r0, #2
/*0x4176*/      strb r0, [r6]
            jump_4178:
/*0x4178*/      add sp, #0x30
/*0x417a*/      movs r0, #1
/*0x417c*/      pop {r4, r5, r6, pc}

/*0x417e*/  .byte 0x00
/*0x417f*/  .byte 0x00

            data_4180:
/*0x4180*/  .word 0x2000001c
            data_4184:
/*0x4184*/  .word 0x40044000
            data_4188:
/*0x4188*/  .word 0x400b2000


            .thumb_func
            call_418c:
/*0x418c*/      push {r4, lr}
/*0x418e*/      bl call_40ec
/*0x4192*/      ubfx r0, r0, #0, #1
/*0x4196*/      pop {r4, pc}

            .thumb_func
            call_4198:
/*0x4198*/      push {r4, r5, r6, lr}
/*0x419a*/      ldr r4, [pc, #0x48] /* data_41e4 */
/*0x419c*/      ldrb r0, [r4]
/*0x419e*/      cbnz r0, jump_41e0
/*0x41a0*/      movs r1, #0
/*0x41a2*/      mov.w r0, #0x20000
/*0x41a6*/      movs r3, #1
/*0x41a8*/      mov r2, r1
/*0x41aa*/      bl call_3888
/*0x41ae*/      ldr r6, [pc, #0x38] /* data_41e8 */
/*0x41b0*/      mov.w r5, #0x400
/*0x41b4*/      movs r2, #0
/*0x41b6*/      mov r1, r5
/*0x41b8*/      mov r0, r6
/*0x41ba*/      bl call_4578
/*0x41be*/      movs r2, #1
/*0x41c0*/      mov r1, r5
/*0x41c2*/      mov r0, r6
/*0x41c4*/      bl call_4548
/*0x41c8*/      movs r2, #1
/*0x41ca*/      movs r1, #0x80
/*0x41cc*/      mov r0, r6
/*0x41ce*/      bl call_4548
/*0x41d2*/      movs r2, #1
/*0x41d4*/      lsls r1, r2, #8
/*0x41d6*/      mov r0, r6
/*0x41d8*/      bl call_4548
/*0x41dc*/      movs r0, #1
/*0x41de*/      strb r0, [r4]
            jump_41e0:
/*0x41e0*/      movs r0, #1
/*0x41e2*/      pop {r4, r5, r6, pc}

            data_41e4:
/*0x41e4*/  .word 0x2000001c
            data_41e8:
/*0x41e8*/  .word 0x400b2000

            jump_41ec:
/*0x41ec*/      push {r4, r5, r6, lr}
/*0x41ee*/      bl call_434c
/*0x41f2*/      ldr r5, [pc, #0x3c] /* data_4230 */
/*0x41f4*/      mov.w r4, #0x400
/*0x41f8*/      movs r2, #0
/*0x41fa*/      mov r1, r4
/*0x41fc*/      mov r0, r5
/*0x41fe*/      bl call_4578
/*0x4202*/      movs r2, #0
/*0x4204*/      mov r1, r4
/*0x4206*/      mov r0, r5
/*0x4208*/      bl call_4538
/*0x420c*/      movs r2, #0
/*0x420e*/      movs r1, #7
/*0x4210*/      movs r0, #1
/*0x4212*/      bl call_379c
/*0x4216*/      movs r2, #0
/*0x4218*/      movs r1, #8
/*0x421a*/      movs r0, #1
/*0x421c*/      bl call_379c
/*0x4220*/      pop.w {r4, r5, r6, lr}
/*0x4224*/      movs r2, #0
/*0x4226*/      movs r1, #9
/*0x4228*/      movs r0, #1
/*0x422a*/      b.w call_379c

/*0x422e*/  .byte 0x00
/*0x422f*/  .byte 0x00

            data_4230:
/*0x4230*/  .word 0x400b2000


            .thumb_func
            call_4234:
/*0x4234*/      push {r4, r5, r6, lr}
/*0x4236*/      movs r2, #1
/*0x4238*/      ldr r5, [pc, #0x38] /* data_4274 */
/*0x423a*/      lsls r4, r2, #0xa
/*0x423c*/      mov r1, r4
/*0x423e*/      mov r0, r5
/*0x4240*/      bl call_4538
/*0x4244*/      movs r2, #2
/*0x4246*/      mov r1, r4
/*0x4248*/      mov r0, r5
/*0x424a*/      bl call_4578
/*0x424e*/      movs r2, #5
/*0x4250*/      movs r1, #7
/*0x4252*/      movs r0, #1
/*0x4254*/      bl call_379c
/*0x4258*/      movs r2, #5
/*0x425a*/      movs r1, #8
/*0x425c*/      movs r0, #1
/*0x425e*/      bl call_379c
/*0x4262*/      movs r2, #5
/*0x4264*/      movs r1, #9
/*0x4266*/      movs r0, #1
/*0x4268*/      bl call_379c
/*0x426c*/      pop.w {r4, r5, r6, lr}
/*0x4270*/      b.w jump_444c

            data_4274:
/*0x4274*/  .word 0x400b2000


            .thumb_func
            call_4278:
/*0x4278*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x427c*/      mov r7, r2
/*0x427e*/      mov r4, r1
/*0x4280*/      mov r8, r0
/*0x4282*/      bl call_44ec
/*0x4286*/      ldr r6, [pc, #0x38] /* data_42c0 */
/*0x4288*/      mov.w r5, #0x400
/*0x428c*/      str r5, [r6, #0x28]
/*0x428e*/      movs r0, #2
/*0x4290*/      strb.w r0, [sp]
/*0x4294*/      lsrs r0, r4, #0x10
/*0x4296*/      strb.w r0, [sp, #1]
/*0x429a*/      lsrs r0, r4, #8
/*0x429c*/      strb.w r0, [sp, #2]
/*0x42a0*/      strb.w r4, [sp, #3]
/*0x42a4*/      movs r2, #4
/*0x42a6*/      movs r1, #0
/*0x42a8*/      mov r0, sp
/*0x42aa*/      bl call_43b4
/*0x42ae*/      mov r2, r7
/*0x42b0*/      movs r1, #0
/*0x42b2*/      mov r0, r8
/*0x42b4*/      bl call_43b4
/*0x42b8*/      str r5, [r6, #0x24]
/*0x42ba*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

/*0x42be*/  .byte 0x00
/*0x42bf*/  .byte 0x00

            data_42c0:
/*0x42c0*/  .word 0x400b2000


            .thumb_func
            call_42c4:
/*0x42c4*/      push {r3, r4, r5, r6, r7, lr}
/*0x42c6*/      mov r4, r0
/*0x42c8*/      bl call_44ec
/*0x42cc*/      ldr r6, [pc, #0x28] /* data_42f8 */
/*0x42ce*/      mov.w r5, #0x400
/*0x42d2*/      str r5, [r6, #0x28]
/*0x42d4*/      movs r0, #0x20
/*0x42d6*/      strb.w r0, [sp]
/*0x42da*/      lsrs r0, r4, #0x10
/*0x42dc*/      strb.w r0, [sp, #1]
/*0x42e0*/      lsrs r0, r4, #8
/*0x42e2*/      strb.w r0, [sp, #2]
/*0x42e6*/      strb.w r4, [sp, #3]
/*0x42ea*/      movs r2, #4
/*0x42ec*/      movs r1, #0
/*0x42ee*/      mov r0, sp
/*0x42f0*/      bl call_43b4
/*0x42f4*/      str r5, [r6, #0x24]
/*0x42f6*/      pop {r3, r4, r5, r6, r7, pc}

            data_42f8:
/*0x42f8*/  .word 0x400b2000


            .thumb_func
            call_42fc:
/*0x42fc*/      push {r3, r4, r5, r6, r7, lr}
/*0x42fe*/      mov r6, r0
/*0x4300*/      bl call_44ec
/*0x4304*/      ldr r4, [pc, #0x1c] /* data_4324 */
/*0x4306*/      mov.w r5, #0x400
/*0x430a*/      str r5, [r4, #0x28]
/*0x430c*/      movs r0, #1
/*0x430e*/      strb.w r0, [sp]
/*0x4312*/      strb.w r6, [sp, #1]
/*0x4316*/      movs r2, #2
/*0x4318*/      movs r1, #0
/*0x431a*/      mov r0, sp
/*0x431c*/      bl call_43b4
/*0x4320*/      str r5, [r4, #0x24]
/*0x4322*/      pop {r3, r4, r5, r6, r7, pc}

            data_4324:
/*0x4324*/  .word 0x400b2000


            .thumb_func
            call_4328:
/*0x4328*/      push {r4, lr}
/*0x432a*/      movs r4, #0x3c
/*0x432c*/      bl call_4278
/*0x4330*/      b jump_433e
            jump_4332:
/*0x4332*/      movs r0, #0x64
/*0x4334*/      bl call_37c4
/*0x4338*/      bl call_418c
/*0x433c*/      cbz r0, jump_4346
            jump_433e:
/*0x433e*/      mov r0, r4
/*0x4340*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4342*/      bhs jump_4332
/*0x4344*/      pop {r4, pc}
            jump_4346:
/*0x4346*/      movs r0, #1
/*0x4348*/      pop {r4, pc}

/*0x434a*/  .byte 0x00
/*0x434b*/  .byte 0x00


            .thumb_func
            call_434c:
/*0x434c*/      push {r3, r4, r5, lr}
/*0x434e*/      ldr r4, [pc, #0x20] /* data_4370 */
/*0x4350*/      movs r0, #0xb9
/*0x4352*/      strb.w r0, [sp]
/*0x4356*/      mov.w r5, #0x400
/*0x435a*/      str r5, [r4, #0x28]
/*0x435c*/      movs r2, #1
/*0x435e*/      movs r1, #0
/*0x4360*/      mov r0, sp
/*0x4362*/      bl call_43b4
/*0x4366*/      str r5, [r4, #0x24]
/*0x4368*/      movs r0, #0xa
/*0x436a*/      bl call_37c4
/*0x436e*/      pop {r3, r4, r5, pc}

            data_4370:
/*0x4370*/  .word 0x400b2000


            .thumb_func
            call_4374:
/*0x4374*/      push {r3, r4, r5, r6, r7, lr}
/*0x4376*/      ldr r5, [pc, #0x38] /* data_43b0 */
/*0x4378*/      mov.w r4, #0x400
/*0x437c*/      mov r7, r2
/*0x437e*/      mov r6, r0
/*0x4380*/      str r4, [r5, #0x28]
/*0x4382*/      movs r0, #3
/*0x4384*/      strb.w r0, [sp]
/*0x4388*/      lsrs r0, r1, #0x10
/*0x438a*/      strb.w r0, [sp, #1]
/*0x438e*/      lsrs r0, r1, #8
/*0x4390*/      strb.w r0, [sp, #2]
/*0x4394*/      strb.w r1, [sp, #3]
/*0x4398*/      movs r2, #4
/*0x439a*/      movs r1, #0
/*0x439c*/      mov r0, sp
/*0x439e*/      bl call_43b4
/*0x43a2*/      mov r2, r7
/*0x43a4*/      mov r1, r6
/*0x43a6*/      movs r0, #0
/*0x43a8*/      bl call_43b4
/*0x43ac*/      str r4, [r5, #0x24]
/*0x43ae*/      pop {r3, r4, r5, r6, r7, pc}

            data_43b0:
/*0x43b0*/  .word 0x400b2000


            .thumb_func
            call_43b4:
/*0x43b4*/      push {r4, r5, r6, r7, lr}
/*0x43b6*/      movs r3, #0
/*0x43b8*/      cmp r2, #8
/*0x43ba*/      bls jump_43c0
/*0x43bc*/      movs r4, #8
/*0x43be*/      b jump_43c2
            jump_43c0:
/*0x43c0*/      mov r4, r2
            jump_43c2:
/*0x43c2*/      movs r5, #0
/*0x43c4*/      mov r7, r5
/*0x43c6*/      ldr r6, [pc, #0x58] /* data_4420 */
/*0x43c8*/      b jump_43d6
            jump_43ca:
/*0x43ca*/      cbz r0, jump_43dc
/*0x43cc*/      ldrb.w ip, [r0, r5]
/*0x43d0*/      str.w ip, [r6, #0x10]
            jump_43d4:
/*0x43d4*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_43d6:
/*0x43d6*/      cmp r5, r4
/*0x43d8*/      blo jump_43ca
/*0x43da*/      b jump_43fe
            jump_43dc:
/*0x43dc*/      str r7, [r6, #0x10]
/*0x43de*/      b jump_43d4
            jump_43e0:
/*0x43e0*/      ldr r5, [r6, #0x1c]
/*0x43e2*/      tst.w r5, #0xf0
/*0x43e6*/      beq jump_43e0
/*0x43e8*/      ldr r5, [r6, #0x10]
/*0x43ea*/      uxtb r5, r5
/*0x43ec*/      cbz r0, jump_4404
/*0x43ee*/      ldrb.w ip, [r0, r4]
/*0x43f2*/      str.w ip, [r6, #0x10]
            jump_43f6:
/*0x43f6*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x43f8*/      cbz r1, jump_43fc
/*0x43fa*/      strb r5, [r1, r3]
            jump_43fc:
/*0x43fc*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_43fe:
/*0x43fe*/      cmp r4, r2
/*0x4400*/      blo jump_43e0
/*0x4402*/      b jump_441a
            jump_4404:
/*0x4404*/      str r7, [r6, #0x10]
/*0x4406*/      b jump_43f6
            jump_4408:
/*0x4408*/      ldr r0, [r6, #0x1c]
/*0x440a*/      tst.w r0, #0xf0
/*0x440e*/      beq jump_4408
/*0x4410*/      ldr r0, [r6, #0x10]
/*0x4412*/      uxtb r0, r0
/*0x4414*/      cbz r1, jump_4418
/*0x4416*/      strb r0, [r1, r3]
            jump_4418:
/*0x4418*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_441a:
/*0x441a*/      cmp r3, r2
/*0x441c*/      blo jump_4408
/*0x441e*/      pop {r4, r5, r6, r7, pc}

            data_4420:
/*0x4420*/  .word 0x40044000


            .thumb_func
            call_4424:
/*0x4424*/      push {r4, r5, r6, lr}
/*0x4426*/      movw r4, #0x12d
/*0x442a*/      bl call_42c4
/*0x442e*/      mov.w r5, #0x3e8
/*0x4432*/      b jump_4440
            jump_4434:
/*0x4434*/      mov r0, r5
/*0x4436*/      bl call_37c4
/*0x443a*/      bl call_418c
/*0x443e*/      cbz r0, jump_4448
            jump_4440:
/*0x4440*/      mov r0, r4
/*0x4442*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4444*/      bhs jump_4434
/*0x4446*/      pop {r4, r5, r6, pc}
            jump_4448:
/*0x4448*/      movs r0, #1
/*0x444a*/      pop {r4, r5, r6, pc}
            jump_444c:
/*0x444c*/      push {r3, r4, r5, lr}
/*0x444e*/      ldr r4, [pc, #0x20] /* data_4470 */
/*0x4450*/      movs r0, #0xab
/*0x4452*/      strb.w r0, [sp]
/*0x4456*/      mov.w r5, #0x400
/*0x445a*/      str r5, [r4, #0x28]
/*0x445c*/      movs r2, #1
/*0x445e*/      movs r1, #0
/*0x4460*/      mov r0, sp
/*0x4462*/      bl call_43b4
/*0x4466*/      str r5, [r4, #0x24]
/*0x4468*/      movs r0, #0xa
/*0x446a*/      bl call_37c4
/*0x446e*/      pop {r3, r4, r5, pc}

            data_4470:
/*0x4470*/  .word 0x400b2000

            jump_4474:
/*0x4474*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4478*/      mov r5, r1
/*0x447a*/      mov r6, r0
/*0x447c*/      rsbs r0, r5, #0
/*0x447e*/      uxtb r4, r0
/*0x4480*/      cmp r4, r2
/*0x4482*/      bhs jump_448e
/*0x4484*/      subs r0, r2, r4
/*0x4486*/      ubfx r7, r0, #8, #0x10
/*0x448a*/      uxtb r0, r0
/*0x448c*/      b jump_4494
            jump_448e:
/*0x448e*/      movs r7, #0
/*0x4490*/      uxth r4, r2
/*0x4492*/      mov r0, r7
            jump_4494:
/*0x4494*/      mov r8, r0
/*0x4496*/      cbz r4, jump_44a8
/*0x4498*/      mov r2, r4
/*0x449a*/      mov r0, r6
/*0x449c*/      bl call_4328
/*0x44a0*/      cmp r0, #1
/*0x44a2*/      bne jump_44e0
/*0x44a4*/      add r5, r4
/*0x44a6*/      add r6, r4
            jump_44a8:
/*0x44a8*/      movs r4, #0
/*0x44aa*/      mov.w sb, #0x100
/*0x44ae*/      b jump_44c8
            jump_44b0:
/*0x44b0*/      mov r2, sb
/*0x44b2*/      mov r1, r5
/*0x44b4*/      mov r0, r6
/*0x44b6*/      bl call_4328
/*0x44ba*/      cmp r0, #1
/*0x44bc*/      bne jump_44e0
/*0x44be*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x44c0*/      add.w r5, r5, #0x100
/*0x44c4*/      add.w r6, r6, #0x100
            jump_44c8:
/*0x44c8*/      cmp r4, r7
/*0x44ca*/      blt jump_44b0
/*0x44cc*/      subs.w r0, r8, #0
/*0x44d0*/      beq jump_44e6
/*0x44d2*/      mov r2, r0
/*0x44d4*/      mov r1, r5
/*0x44d6*/      mov r0, r6
/*0x44d8*/      bl call_4328
/*0x44dc*/      cmp r0, #1
/*0x44de*/      beq jump_44e6
            jump_44e0:
/*0x44e0*/      movs r0, #0
            jump_44e2:
/*0x44e2*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_44e6:
/*0x44e6*/      movs r0, #1
/*0x44e8*/      b jump_44e2

/*0x44ea*/  .byte 0x00
/*0x44eb*/  .byte 0x00


            .thumb_func
            call_44ec:
/*0x44ec*/      push {r3, r4, r5, lr}
/*0x44ee*/      ldr r4, [pc, #0x1c] /* data_450c */
/*0x44f0*/      movs r0, #6
/*0x44f2*/      strb.w r0, [sp]
/*0x44f6*/      mov.w r5, #0x400
/*0x44fa*/      str r5, [r4, #0x28]
/*0x44fc*/      movs r2, #1
/*0x44fe*/      movs r1, #0
/*0x4500*/      mov r0, sp
/*0x4502*/      bl call_43b4
/*0x4506*/      str r5, [r4, #0x24]
/*0x4508*/      pop {r3, r4, r5, pc}

/*0x450a*/  .byte 0x00
/*0x450b*/  .byte 0x00

            data_450c:
/*0x450c*/  .word 0x400b2000


            .thumb_func
            call_4510:
/*0x4510*/      push {r4, lr}
/*0x4512*/      mov.w r4, #0x19a
/*0x4516*/      bl call_42fc
/*0x451a*/      b jump_4528
            jump_451c:
/*0x451c*/      movs r0, #0x64
/*0x451e*/      bl call_37c4
/*0x4522*/      bl call_418c
/*0x4526*/      cbz r0, jump_4530
            jump_4528:
/*0x4528*/      mov r0, r4
/*0x452a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x452c*/      bhs jump_451c
/*0x452e*/      pop {r4, pc}
            jump_4530:
/*0x4530*/      movs r0, #1
/*0x4532*/      pop {r4, pc}

            .thumb_func
            call_4534:
/*0x4534*/      str r1, [r0, #0x28]
/*0x4536*/      bx lr

            .thumb_func
            call_4538:
/*0x4538*/      cmp r2, #0
/*0x453a*/      ldr r2, [r0]
/*0x453c*/      beq jump_4542
/*0x453e*/      orrs r2, r1
/*0x4540*/      b jump_4544
            jump_4542:
/*0x4542*/      bics r2, r1
            jump_4544:
/*0x4544*/      str r2, [r0]
/*0x4546*/      bx lr

            .thumb_func
            call_4548:
/*0x4548*/      cmp r2, #0
/*0x454a*/      ldr r2, [r0, #0x14]
/*0x454c*/      beq jump_4552
/*0x454e*/      orrs r2, r1
/*0x4550*/      b jump_4554
            jump_4552:
/*0x4552*/      bics r2, r1
            jump_4554:
/*0x4554*/      str r2, [r0, #0x14]
/*0x4556*/      bx lr

            .thumb_func
            call_4558:
/*0x4558*/      cmp r2, #0
/*0x455a*/      ldr r2, [r0, #4]
/*0x455c*/      beq jump_4562
/*0x455e*/      orrs r2, r1
/*0x4560*/      b jump_4564
            jump_4562:
/*0x4562*/      bics r2, r1
            jump_4564:
/*0x4564*/      str r2, [r0, #4]
/*0x4566*/      bx lr

            .thumb_func
            call_4568:
/*0x4568*/      cmp r2, #0
/*0x456a*/      ldr r2, [r0, #0x10]
/*0x456c*/      beq jump_4572
/*0x456e*/      orrs r2, r1
/*0x4570*/      b jump_4574
            jump_4572:
/*0x4572*/      bics r2, r1
            jump_4574:
/*0x4574*/      str r2, [r0, #0x10]
/*0x4576*/      bx lr

            .thumb_func
            call_4578:
/*0x4578*/      cbz r2, jump_458c
/*0x457a*/      cmp r2, #1
/*0x457c*/      beq jump_4592
/*0x457e*/      ldr r2, [r0, #8]
/*0x4580*/      bics r2, r1
            jump_4582:
/*0x4582*/      str r2, [r0, #8]
/*0x4584*/      ldr r2, [r0, #0xc]
/*0x4586*/      bics r2, r1
/*0x4588*/      str r2, [r0, #0xc]
/*0x458a*/      bx lr
            jump_458c:
/*0x458c*/      ldr r2, [r0, #8]
/*0x458e*/      orrs r2, r1
/*0x4590*/      b jump_4582
            jump_4592:
/*0x4592*/      ldr r2, [r0, #0xc]
/*0x4594*/      orrs r2, r1
/*0x4596*/      str r2, [r0, #0xc]
/*0x4598*/      ldr r2, [r0, #8]
/*0x459a*/      bics r2, r1
/*0x459c*/      str r2, [r0, #8]
/*0x459e*/      bx lr

            .thumb_func
            call_45a0:
/*0x45a0*/      str r1, [r0, #0x24]
/*0x45a2*/      bx lr

            .thumb_func
            call_45a4:
/*0x45a4*/      cbz r2, jump_45aa
/*0x45a6*/      str r1, [r0, #0x24]
/*0x45a8*/      bx lr
            jump_45aa:
/*0x45aa*/      str r1, [r0, #0x28]
/*0x45ac*/      bx lr

            .thumb_func
            call_45ae:
/*0x45ae*/      cmp r1, #0
/*0x45b0*/      ldr r1, [r0, #0x10]
/*0x45b2*/      beq jump_45ba
/*0x45b4*/      orr r1, r1, #1
/*0x45b8*/      b jump_45be
            jump_45ba:
/*0x45ba*/      bic r1, r1, #1
            jump_45be:
/*0x45be*/      str r1, [r0, #0x10]
/*0x45c0*/      bx lr

            .thumb_func
            call_45c2:
/*0x45c2*/      push {r4, r5, r6, r7, lr}
/*0x45c4*/      ldrb r3, [r1]
/*0x45c6*/      ldr r7, [r0, #0x50]
/*0x45c8*/      add.w r4, r0, r3, lsl #2
/*0x45cc*/      add.w r2, r4, #0x40
/*0x45d0*/      add.w r5, r4, #0x90
/*0x45d4*/      add.w r6, r4, #0xa0
/*0x45d8*/      lsls r3, r3, #1
/*0x45da*/      movs r4, #1
/*0x45dc*/      lsls r4, r3
/*0x45de*/      mvns r4, r4
/*0x45e0*/      ands r7, r4
/*0x45e2*/      str r7, [r0, #0x50]
/*0x45e4*/      ldr r7, [r0, #0x54]
/*0x45e6*/      ands r7, r4
/*0x45e8*/      str r7, [r0, #0x54]
/*0x45ea*/      ldr r4, [r0, #0x54]
/*0x45ec*/      ldrb r7, [r1, #5]
/*0x45ee*/      lsls r7, r3
/*0x45f0*/      orrs r4, r7
/*0x45f2*/      str r4, [r0, #0x54]
/*0x45f4*/      ldr r4, [r2]
/*0x45f6*/      movw r7, #0x107
/*0x45fa*/      bics r4, r7
/*0x45fc*/      str r4, [r2]
/*0x45fe*/      ldr r4, [r2]
/*0x4600*/      ldrh r7, [r1, #2]
/*0x4602*/      orrs r4, r7
/*0x4604*/      str r4, [r2]
/*0x4606*/      ldrh r2, [r1, #6]
/*0x4608*/      str r2, [r5]
/*0x460a*/      ldrh r2, [r1, #8]
/*0x460c*/      str r2, [r6]
/*0x460e*/      ldr r2, [r0, #0x50]
/*0x4610*/      ldrb r1, [r1, #4]
/*0x4612*/      lsls r1, r3
/*0x4614*/      orrs r2, r1
/*0x4616*/      str r2, [r0, #0x50]
/*0x4618*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_461a:
/*0x461a*/      ldrh r2, [r1]
/*0x461c*/      str.w r2, [r0, #0x88]
/*0x4620*/      ldrh r2, [r1, #2]
/*0x4622*/      str.w r2, [r0, #0x84]
/*0x4626*/      ldr r2, [r0]
/*0x4628*/      bic r2, r2, #0x30000
/*0x462c*/      str r2, [r0]
/*0x462e*/      ldr r2, [r0]
/*0x4630*/      bic r2, r2, #0x1000000
/*0x4634*/      str r2, [r0]
/*0x4636*/      ldr r2, [r0]
/*0x4638*/      ldr r3, [r1, #4]
/*0x463a*/      orrs r2, r3
/*0x463c*/      str r2, [r0]
/*0x463e*/      ldrh r1, [r1, #8]
/*0x4640*/      str r1, [r0, #0x78]
/*0x4642*/      bx lr

            .thumb_func
            call_4644:
/*0x4644*/      ldr r0, [pc, #0x28] /* data_4670 */
/*0x4646*/      ldrb r1, [r0, #2]
/*0x4648*/      cbz r1, jump_464e
/*0x464a*/      movs r0, #0
/*0x464c*/      bx lr
            jump_464e:
/*0x464e*/      ldrb r1, [r0, #0xb]
/*0x4650*/      cbz r1, jump_4656
/*0x4652*/      movs r0, #1
/*0x4654*/      bx lr
            jump_4656:
/*0x4656*/      ldrb r0, [r0, #0xa]
/*0x4658*/      cbz r0, jump_465e
/*0x465a*/      movs r0, #2
/*0x465c*/      bx lr
            jump_465e:
/*0x465e*/      ldr r0, [pc, #0x14] /* data_4674 */
/*0x4660*/      ldrb r0, [r0, #6]
/*0x4662*/      cmp r0, #1
/*0x4664*/      beq jump_466a
/*0x4666*/      movs r0, #5
/*0x4668*/      bx lr
            jump_466a:
/*0x466a*/      movs r0, #3
/*0x466c*/      bx lr

/*0x466e*/  .byte 0x00
/*0x466f*/  .byte 0x00

            data_4670:
/*0x4670*/  .word 0x200006c0
            data_4674:
/*0x4674*/  .word 0x200019d4


            .thumb_func
            call_4678:
/*0x4678*/      push {r4, lr}
/*0x467a*/      cbz r0, jump_46a2
/*0x467c*/      bl call_4ab0
/*0x4680*/      cmp r0, #0
/*0x4682*/      beq jump_46b8
/*0x4684*/      movs r1, #0xa
/*0x4686*/      ldr r0, [pc, #0x34] /* data_46bc */
/*0x4688*/      bl mem_zero
/*0x468c*/      ldr r0, [pc, #0x30] /* data_46c0 */
/*0x468e*/      ldrb r1, [r0, #1]
/*0x4690*/      lsls r2, r1, #0x19
/*0x4692*/      mov.w r1, #0
/*0x4696*/      str r1, [r0]
/*0x4698*/      bpl jump_46a2
/*0x469a*/      ldrb r1, [r0, #1]
/*0x469c*/      orr r1, r1, #0x40
/*0x46a0*/      strb r1, [r0, #1]
            jump_46a2:
/*0x46a2*/      bl call_669c
/*0x46a6*/      ldr r1, [pc, #0x1c] /* data_46c4 */
/*0x46a8*/      movs r0, #1
/*0x46aa*/      strb r0, [r1]
/*0x46ac*/      ldr r1, [pc, #0x18] /* data_46c8 */
/*0x46ae*/      strb r0, [r1]
/*0x46b0*/      ldr r1, [pc, #0x18] /* data_46cc */
/*0x46b2*/      strb r0, [r1]
/*0x46b4*/      ldr r1, [pc, #0x18] /* data_46d0 */
/*0x46b6*/      strb r0, [r1]
            jump_46b8:
/*0x46b8*/      pop {r4, pc}

/*0x46ba*/  .byte 0x00
/*0x46bb*/  .byte 0x00

            data_46bc:
/*0x46bc*/  .word 0x200006cc
            data_46c0:
/*0x46c0*/  .word 0x20000058
            data_46c4:
/*0x46c4*/  .word 0x2000002c
            data_46c8:
/*0x46c8*/  .word 0x2000002f
            data_46cc:
/*0x46cc*/  .word 0x2000002d
            data_46d0:
/*0x46d0*/  .word 0x2000002e


            .thumb_func
            call_46d4:
/*0x46d4*/      movs r1, #0x50
/*0x46d6*/      ldr r2, [pc, #0x18] /* data_46f0 */
/*0x46d8*/      b jump_46e4
            jump_46da:
/*0x46da*/      ldrb r3, [r2, r1]
/*0x46dc*/      cmp r3, r0
/*0x46de*/      bne jump_46e4
/*0x46e0*/      uxtb r0, r1
/*0x46e2*/      bx lr
            jump_46e4:
/*0x46e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x46e6*/      uxth r1, r1
/*0x46e8*/      bhs jump_46da
/*0x46ea*/      movs r0, #0
/*0x46ec*/      bx lr

/*0x46ee*/  .byte 0x00
/*0x46ef*/  .byte 0x00

            data_46f0:
/*0x46f0*/  .word 0x200006d6


            .thumb_func
            call_46f4:
/*0x46f4*/      ldr r3, [pc, #0x2c] /* data_4724 */
/*0x46f6*/      push {r4, lr}
/*0x46f8*/      ldrb r2, [r3, r0]
/*0x46fa*/      cbz r2, jump_471c
/*0x46fc*/      cbz r1, jump_4700
/*0x46fe*/      strb r2, [r1]
            jump_4700:
/*0x4700*/      ldr r2, [pc, #0x20] /* data_4724 */
/*0x4702*/      lsrs r1, r0, #5
/*0x4704*/      adds r2, #0x52
/*0x4706*/      and r4, r0, #0x1f
/*0x470a*/      ldr.w r1, [r2, r1, lsl #2]
/*0x470e*/      movs r2, #1
/*0x4710*/      lsls r2, r4
/*0x4712*/      tst r1, r2
/*0x4714*/      beq jump_471c
/*0x4716*/      ldrb r0, [r3, r0]
/*0x4718*/      cmp r0, #0x2f
/*0x471a*/      blo jump_4720
            jump_471c:
/*0x471c*/      movs r0, #1
/*0x471e*/      pop {r4, pc}
            jump_4720:
/*0x4720*/      movs r0, #0
/*0x4722*/      pop {r4, pc}

            data_4724:
/*0x4724*/  .word 0x200006d6


            .thumb_func
            call_4728:
/*0x4728*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x472c*/      mov r5, r1
/*0x472e*/      mov r4, r0
/*0x4730*/      movs r1, #0x50
/*0x4732*/      ldr r0, [pc, #0x48] /* data_477c */
/*0x4734*/      bl mem_zero
/*0x4738*/      ldr r0, [pc, #0x40] /* data_477c */
/*0x473a*/      movs r1, #0
/*0x473c*/      subs r0, #0xa
/*0x473e*/      ldr r6, [pc, #0x3c] /* data_477c */
/*0x4740*/      str r1, [r0, #0x5c]
/*0x4742*/      str r1, [r0, #0x60]
/*0x4744*/      add.w r2, r0, #0x5c
/*0x4748*/      movs r3, #1
/*0x474a*/      str r1, [r0, #0x64]
/*0x474c*/      b jump_4770
            jump_474e:
/*0x474e*/      ldrb r1, [r4]
/*0x4750*/      ldrb r0, [r4, #1]
/*0x4752*/      strb r0, [r6, r1]
/*0x4754*/      ldrb r0, [r4, #2]
/*0x4756*/      cbz r0, jump_476e
/*0x4758*/      ldrb r1, [r4]
/*0x475a*/      lsrs r0, r1, #5
/*0x475c*/      and r1, r1, #0x1f
/*0x4760*/      ldr.w r7, [r2, r0, lsl #2]
/*0x4764*/      lsl.w r1, r3, r1
/*0x4768*/      orrs r7, r1
/*0x476a*/      str.w r7, [r2, r0, lsl #2]
            jump_476e:
/*0x476e*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_4770:
/*0x4770*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x4772*/      uxtb r5, r5
/*0x4774*/      bhs jump_474e
/*0x4776*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x477a*/  .byte 0x00
/*0x477b*/  .byte 0x00

            data_477c:
/*0x477c*/  .word 0x200006d6


            .thumb_func
            call_4780:
/*0x4780*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4784*/      lsrs r1, r0, #8
/*0x4786*/      lsls r1, r1, #0x1f
/*0x4788*/      beq jump_4790
/*0x478a*/      bl call_4e90
/*0x478e*/      b jump_4850
            jump_4790:
/*0x4790*/      uxtb r3, r0
/*0x4792*/      lsrs r2, r0, #0x18
/*0x4794*/      movs r4, #1
/*0x4796*/      cmp r3, #0xe8
/*0x4798*/      bls jump_47c4
/*0x479a*/      lsrs r0, r0, #0x18
/*0x479c*/      ubfx r2, r0, #1, #1
/*0x47a0*/      cmp r3, #0xec
/*0x47a2*/      bhs jump_47b2
/*0x47a4*/      subs r3, #0xe9
/*0x47a6*/      uxtb r1, r3
/*0x47a8*/      ldr r0, [pc, #0xac] /* data_4858 */
/*0x47aa*/      bl call_3fa8
/*0x47ae*/      ldr r0, [pc, #0xac] /* data_485c */
/*0x47b0*/      b jump_484e
            jump_47b2:
/*0x47b2*/      cmp r3, #0xfd
/*0x47b4*/      bhi jump_4850
/*0x47b6*/      subs r3, #0xec
/*0x47b8*/      uxtb r1, r3
/*0x47ba*/      ldr r0, [pc, #0xa4] /* data_4860 */
/*0x47bc*/      bl call_3fa8
/*0x47c0*/      ldr r0, [pc, #0xa0] /* data_4864 */
/*0x47c2*/      b jump_484e
            jump_47c4:
/*0x47c4*/      and r1, r0, #7
/*0x47c8*/      movs r6, #1
/*0x47ca*/      sub.w ip, r3, #0xe0
/*0x47ce*/      lsls r6, r1
/*0x47d0*/      ldr r7, [pc, #0x94] /* data_4868 */
/*0x47d2*/      ldr r5, [pc, #0x98] /* data_486c */
/*0x47d4*/      cmp.w ip, #7
/*0x47d8*/      bhi jump_47f0
/*0x47da*/      mov r0, r5
/*0x47dc*/      uxtb r1, r6
/*0x47de*/      ldrb r0, [r0]
/*0x47e0*/      lsls r2, r2, #0x1e
/*0x47e2*/      bpl jump_47e8
/*0x47e4*/      orrs r0, r1
/*0x47e6*/      b jump_47ea
            jump_47e8:
/*0x47e8*/      bics r0, r1
            jump_47ea:
/*0x47ea*/      strb r0, [r5]
            jump_47ec:
/*0x47ec*/      strb r4, [r7]
/*0x47ee*/      b jump_4850
            jump_47f0:
/*0x47f0*/      movs r1, #0
            jump_47f2:
/*0x47f2*/      add.w ip, r5, r1
/*0x47f6*/      ldrb.w ip, [ip, #2]
/*0x47fa*/      cmp ip, r3
/*0x47fc*/      bne jump_480a
/*0x47fe*/      lsls r0, r2, #0x1e
/*0x4800*/      bmi jump_47ec
/*0x4802*/      add r1, r5
/*0x4804*/      movs r0, #0
/*0x4806*/      strb r0, [r1, #2]
/*0x4808*/      b jump_47ec
            jump_480a:
/*0x480a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x480c*/      uxtb r1, r1
/*0x480e*/      cmp r1, #6
/*0x4810*/      blo jump_47f2
/*0x4812*/      lsls r1, r2, #0x1e
/*0x4814*/      bpl jump_482e
/*0x4816*/      movs r1, #0
            jump_4818:
/*0x4818*/      add.w ip, r5, r1
/*0x481c*/      ldrb.w ip, [ip, #2]
/*0x4820*/      cmp.w ip, #0
/*0x4824*/      beq jump_4842
/*0x4826*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4828*/      uxtb r1, r1
/*0x482a*/      cmp r1, #6
/*0x482c*/      blo jump_4818
            jump_482e:
/*0x482e*/      lsls r3, r2, #0x1e
/*0x4830*/      ldr r2, [pc, #0x3c] /* data_4870 */
/*0x4832*/      ubfx r0, r0, #3, #5
/*0x4836*/      add r0, r2
/*0x4838*/      uxtb r1, r6
/*0x483a*/      ldrb r2, [r0, #2]
/*0x483c*/      bpl jump_4848
/*0x483e*/      orrs r2, r1
/*0x4840*/      b jump_484a
            jump_4842:
/*0x4842*/      adds r0, r5, r1
/*0x4844*/      strb r3, [r0, #2]
/*0x4846*/      b jump_47ec
            jump_4848:
/*0x4848*/      bics r2, r1
            jump_484a:
/*0x484a*/      strb r2, [r0, #2]
/*0x484c*/      ldr r0, [pc, #0x24] /* data_4874 */
            jump_484e:
/*0x484e*/      strb r4, [r0]
            jump_4850:
/*0x4850*/      movs r0, #1
/*0x4852*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x4856*/  .byte 0x00
/*0x4857*/  .byte 0x00

            data_4858:
/*0x4858*/  .word 0x20000035
            data_485c:
/*0x485c*/  .word 0x2000002d
            data_4860:
/*0x4860*/  .word 0x20000041
            data_4864:
/*0x4864*/  .word 0x2000002e
            data_4868:
/*0x4868*/  .word 0x2000002c
            data_486c:
/*0x486c*/  .word 0x20000048
            data_4870:
/*0x4870*/  .word 0x20000624
            data_4874:
/*0x4874*/  .word 0x2000002f


            .thumb_func
            call_4878:
/*0x4878*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x487c*/      ldr r4, [pc, #0x184] /* data_4a04 */
/*0x487e*/      ldr r2, [pc, #0x188] /* data_4a08 */
/*0x4880*/      lsrs r5, r0, #3
/*0x4882*/      strb r0, [r4, #2]
/*0x4884*/      ldrb r3, [r2, r0]
/*0x4886*/      strb r3, [r4]
/*0x4888*/      ldrb r2, [r4, #3]
/*0x488a*/      and r6, r0, #7
/*0x488e*/      bic r2, r2, #1
/*0x4892*/      bfi r2, r1, #1, #1
/*0x4896*/      strb r2, [r4, #3]
/*0x4898*/      mov r2, r4
/*0x489a*/      mov.w r8, #1
/*0x489e*/      ldrb r2, [r2, #1]
/*0x48a0*/      cmp r3, #0xe8
/*0x48a2*/      beq jump_48c6
/*0x48a4*/      lsl.w r7, r8, r6
/*0x48a8*/      movs r6, #0x1c
/*0x48aa*/      uxtb r7, r7
/*0x48ac*/      cmp.w r6, r3, lsr #3
/*0x48b0*/      bne jump_48e4
/*0x48b2*/      ands r6, r3, #3
/*0x48b6*/      beq jump_48cc
/*0x48b8*/      cmp r6, #1
/*0x48ba*/      beq jump_48d2
/*0x48bc*/      cmp r6, #2
/*0x48be*/      beq jump_48d8
/*0x48c0*/      cmp r6, #3
/*0x48c2*/      bne jump_48ee
/*0x48c4*/      b jump_48de
            jump_48c6:
/*0x48c6*/      bfi r2, r1, #6, #1
/*0x48ca*/      b jump_4938
            jump_48cc:
/*0x48cc*/      bfi r2, r1, #2, #1
/*0x48d0*/      b jump_48ec
            jump_48d2:
/*0x48d2*/      bfi r2, r1, #4, #1
/*0x48d6*/      b jump_48ec
            jump_48d8:
/*0x48d8*/      bfi r2, r1, #3, #1
/*0x48dc*/      b jump_48ec
            jump_48de:
/*0x48de*/      bfi r2, r1, #5, #1
/*0x48e2*/      b jump_48ec
            jump_48e4:
/*0x48e4*/      cmp r3, #0x39
/*0x48e6*/      bne jump_48ee
/*0x48e8*/      bfi r2, r1, #7, #1
            jump_48ec:
/*0x48ec*/      strb r2, [r4, #1]
            jump_48ee:
/*0x48ee*/      ldr r6, [pc, #0x11c] /* data_4a0c */
/*0x48f0*/      cbz r1, jump_4924
/*0x48f2*/      ldrb r2, [r4, #1]
/*0x48f4*/      lsls.w ip, r2, #0x19
/*0x48f8*/      bpl jump_4938
/*0x48fa*/      ldrb.w ip, [r6, r5]
/*0x48fe*/      orr.w ip, ip, r7
/*0x4902*/      strb.w ip, [r6, r5]
/*0x4906*/      b jump_4930
            jump_4908:
/*0x4908*/      ldr r6, [pc, #0x104] /* data_4a10 */
/*0x490a*/      strb r2, [r4, #1]
/*0x490c*/      sub.w r7, r3, #0xc0
/*0x4910*/      movs r5, #0
/*0x4912*/      ldrb r2, [r6, #2]
/*0x4914*/      cmp r7, #3
/*0x4916*/      bhi jump_493e
/*0x4918*/      cbz r2, jump_491c
/*0x491a*/      strb r5, [r6, #2]
            jump_491c:
/*0x491c*/      uxtb r0, r7
/*0x491e*/      bl call_38c0
/*0x4922*/      b jump_4994
            jump_4924:
/*0x4924*/      ldrb r2, [r6, r5]
/*0x4926*/      tst r2, r7
/*0x4928*/      beq jump_4936
/*0x492a*/      bics r2, r7
/*0x492c*/      strb r2, [r6, r5]
/*0x492e*/      ldrb r2, [r4, #1]
            jump_4930:
/*0x4930*/      orr r2, r2, #1
/*0x4934*/      b jump_4908
            jump_4936:
/*0x4936*/      ldrb r2, [r4, #1]
            jump_4938:
/*0x4938*/      bic r2, r2, #1
/*0x493c*/      b jump_4908
            jump_493e:
/*0x493e*/      cbz r2, jump_495e
/*0x4940*/      cbz r1, jump_495e
/*0x4942*/      strb r5, [r6, #2]
/*0x4944*/      mov r1, sp
/*0x4946*/      bl call_5bdc
/*0x494a*/      ldrb r0, [r6, #6]
/*0x494c*/      cmp r0, #0
/*0x494e*/      mov r0, sp
/*0x4950*/      beq jump_4958
/*0x4952*/      bl call_39dc
/*0x4956*/      b jump_4994
            jump_4958:
/*0x4958*/      bl call_51bc
/*0x495c*/      b jump_4994
            jump_495e:
/*0x495e*/      cbz r3, jump_4994
/*0x4960*/      ldr r0, [r4]
/*0x4962*/      bl call_5514
/*0x4966*/      bl call_4f70
/*0x496a*/      cbz r0, jump_497e
/*0x496c*/      ldrb r0, [r4]
/*0x496e*/      cbz r0, jump_4994
            jump_4970:
/*0x4970*/      bl call_514c
/*0x4974*/      ldr r0, [r4]
/*0x4976*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x497a*/      b.w call_4780
            jump_497e:
/*0x497e*/      ldrb r0, [r6, #6]
/*0x4980*/      cbz r0, jump_4988
/*0x4982*/      bl call_3914
/*0x4986*/      b jump_4994
            jump_4988:
/*0x4988*/      ldrb r0, [r4]
/*0x498a*/      cmp r0, #0xe8
/*0x498c*/      beq jump_4994
/*0x498e*/      bl call_5900
/*0x4992*/      cbz r0, jump_499a
            jump_4994:
/*0x4994*/      movs r0, #1
/*0x4996*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_499a:
/*0x499a*/      ldrb r1, [r4, #1]
/*0x499c*/      lsls r0, r1, #0x1f
/*0x499e*/      ldrb r0, [r4, #3]
/*0x49a0*/      lsl.w r0, r0, #0x1f
/*0x49a4*/      beq jump_49ec
/*0x49a6*/      cmp r0, #0
/*0x49a8*/      bne jump_4970
/*0x49aa*/      ldr r2, [pc, #0x60] /* data_4a0c */
/*0x49ac*/      ldrb r0, [r4, #2]
/*0x49ae*/      adds r2, #0xa
/*0x49b0*/      ldrb r2, [r2, r0]
/*0x49b2*/      cbz r2, jump_49da
/*0x49b4*/      ldr r5, [pc, #0x54] /* data_4a0c */
/*0x49b6*/      lsrs r3, r0, #5
/*0x49b8*/      adds r5, #0x5c
/*0x49ba*/      ldr.w r3, [r5, r3, lsl #2]
/*0x49be*/      and r5, r0, #0x1f
/*0x49c2*/      lsl.w r0, r8, r5
/*0x49c6*/      tst r3, r0
/*0x49c8*/      beq jump_49d0
/*0x49ca*/      orr r0, r1, #1
/*0x49ce*/      b jump_49d4
            jump_49d0:
/*0x49d0*/      bic r0, r1, #1
            jump_49d4:
/*0x49d4*/      strb r0, [r4, #1]
/*0x49d6*/      strb r2, [r4]
/*0x49d8*/      b jump_4970
            jump_49da:
/*0x49da*/      bl call_58cc
/*0x49de*/      cbnz r0, jump_49f8
/*0x49e0*/      ldrb r0, [r4, #1]
/*0x49e2*/      bic r0, r0, #1
/*0x49e6*/      strb r0, [r4, #1]
/*0x49e8*/      strb r5, [r4]
/*0x49ea*/      b jump_4970
            jump_49ec:
/*0x49ec*/      cmp r0, #0
/*0x49ee*/      bne jump_4970
/*0x49f0*/      bl call_58cc
/*0x49f4*/      cmp r0, #0
/*0x49f6*/      beq jump_4970
            jump_49f8:
/*0x49f8*/      ldrb r0, [r4, #3]
/*0x49fa*/      orr r0, r0, #1
/*0x49fe*/      strb r0, [r4, #3]
/*0x4a00*/      b jump_4970

/*0x4a02*/  .byte 0x00
/*0x4a03*/  .byte 0x00

            data_4a04:
/*0x4a04*/  .word 0x20000058
            data_4a08:
/*0x4a08*/  .word 0x200002c4
            data_4a0c:
/*0x4a0c*/  .word 0x200006cc
            data_4a10:
/*0x4a10*/  .word 0x200006c0


            .thumb_func
            call_4a14:
/*0x4a14*/      ldrh r2, [r1]
/*0x4a16*/      bfi r2, r0, #0, #9
/*0x4a1a*/      strh r2, [r1]
/*0x4a1c*/      bx lr

            .thumb_func
            call_4a1e:
/*0x4a1e*/      ubfx r0, r0, #0, #9
/*0x4a22*/      bx lr

            .thumb_func
            call_4a24:
/*0x4a24*/      push {r4, r5, r6, r7, lr}
/*0x4a26*/      movs r5, #0
/*0x4a28*/      b jump_4a4a
            jump_4a2a:
/*0x4a2a*/      movs r4, #0
/*0x4a2c*/      b jump_4a3a
            jump_4a2e:
/*0x4a2e*/      ldrb r6, [r0, r5]
/*0x4a30*/      ldrb r7, [r1, r4]
/*0x4a32*/      cmp r6, r7
/*0x4a34*/      beq jump_4a3e
/*0x4a36*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4a38*/      uxtb r4, r4
            jump_4a3a:
/*0x4a3a*/      cmp r4, r3
/*0x4a3c*/      blo jump_4a2e
            jump_4a3e:
/*0x4a3e*/      cmp r4, r3
/*0x4a40*/      bne jump_4a46
/*0x4a42*/      movs r0, #0
/*0x4a44*/      pop {r4, r5, r6, r7, pc}
            jump_4a46:
/*0x4a46*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4a48*/      uxtb r5, r5
            jump_4a4a:
/*0x4a4a*/      cmp r5, r2
/*0x4a4c*/      blo jump_4a2a
/*0x4a4e*/      movs r0, #1
/*0x4a50*/      pop {r4, r5, r6, r7, pc}

/*0x4a52*/  .byte 0x00
/*0x4a53*/  .byte 0x00


            .thumb_func
            call_4a54:
/*0x4a54*/      push {r4, r5, r6, r7, lr}
/*0x4a56*/      movs r3, #0xa
/*0x4a58*/      movs r5, #0
/*0x4a5a*/      b jump_4a9a
            jump_4a5c:
/*0x4a5c*/      ldr r2, [pc, #0x48] /* data_4aa8 */
/*0x4a5e*/      cmp r3, #9
/*0x4a60*/      ldrb r4, [r2, r3]
/*0x4a62*/      bne jump_4a68
/*0x4a64*/      orr r4, r4, #0xf
            jump_4a68:
/*0x4a68*/      cmp r4, #0xff
/*0x4a6a*/      beq jump_4a9a
/*0x4a6c*/      ldr r6, [pc, #0x3c] /* data_4aac */
/*0x4a6e*/      movs r2, #8
/*0x4a70*/      mov.w ip, #1
/*0x4a74*/      add.w r7, r6, r3, lsl #3
/*0x4a78*/      b jump_4a94
            jump_4a7a:
/*0x4a7a*/      lsl.w r6, ip, r2
/*0x4a7e*/      uxtb r6, r6
/*0x4a80*/      tst r4, r6
/*0x4a82*/      bne jump_4a94
/*0x4a84*/      cbz r1, jump_4aa4
/*0x4a86*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4a88*/      ldrb r6, [r7, r2]
/*0x4a8a*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4a8c*/      strb r6, [r0], #1
/*0x4a90*/      uxtb r1, r1
/*0x4a92*/      uxtb r5, r5
            jump_4a94:
/*0x4a94*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4a96*/      uxtb r2, r2
/*0x4a98*/      bhs jump_4a7a
            jump_4a9a:
/*0x4a9a*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4a9c*/      uxtb r3, r3
/*0x4a9e*/      bhs jump_4a5c
/*0x4aa0*/      mov r0, r5
/*0x4aa2*/      pop {r4, r5, r6, r7, pc}
            jump_4aa4:
/*0x4aa4*/      movs r0, #0xff
/*0x4aa6*/      pop {r4, r5, r6, r7, pc}

            data_4aa8:
/*0x4aa8*/  .word 0x200001b0
            data_4aac:
/*0x4aac*/  .word 0x200002c4


            .thumb_func
            call_4ab0:
/*0x4ab0*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x4ab2*/      bl call_60c8
/*0x4ab6*/      cmp r0, #0
/*0x4ab8*/      beq jump_4b02
/*0x4aba*/      ldr r0, [pc, #0x54] /* data_4b10 */
/*0x4abc*/      mov r5, sp
/*0x4abe*/      ldr r6, [pc, #0x54] /* data_4b14 */
/*0x4ac0*/      ldr r1, [r0]
/*0x4ac2*/      str r1, [sp]
/*0x4ac4*/      ldr r1, [r0, #4]
/*0x4ac6*/      str r1, [sp, #4]
/*0x4ac8*/      ldrh r0, [r0, #8]
/*0x4aca*/      strh.w r0, [sp, #8]
/*0x4ace*/      movs r0, #5
/*0x4ad0*/      ldr r7, [pc, #0x44] /* data_4b18 */
/*0x4ad2*/      movs r3, #1
/*0x4ad4*/      b jump_4af0
            jump_4ad6:
/*0x4ad6*/      ldrb r1, [r6, r0]
/*0x4ad8*/      ldrb r1, [r7, r1]
/*0x4ada*/      cmp r1, #0xff
/*0x4adc*/      beq jump_4af0
/*0x4ade*/      add.w r2, r5, r1, lsr #3
/*0x4ae2*/      and r1, r1, #7
/*0x4ae6*/      ldrb r4, [r2]
/*0x4ae8*/      lsl.w r1, r3, r1
/*0x4aec*/      orrs r4, r1
/*0x4aee*/      strb r4, [r2]
            jump_4af0:
/*0x4af0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4af2*/      uxtb r0, r0
/*0x4af4*/      bhs jump_4ad6
/*0x4af6*/      movs r0, #0xa
/*0x4af8*/      b jump_4b04
            jump_4afa:
/*0x4afa*/      ldrb r1, [r5, r0]
/*0x4afc*/      cmp r1, #0xff
/*0x4afe*/      beq jump_4b04
/*0x4b00*/      movs r0, #0
            jump_4b02:
/*0x4b02*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}
            jump_4b04:
/*0x4b04*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4b06*/      uxtb r0, r0
/*0x4b08*/      bhs jump_4afa
/*0x4b0a*/      movs r0, #1
/*0x4b0c*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x4b0e*/  .byte 0x00
/*0x4b0f*/  .byte 0x00

            data_4b10:
/*0x4b10*/  .word 0x200001b0
            data_4b14:
/*0x4b14*/  .word data_81a4
            data_4b18:
/*0x4b18*/  .word 0x200001c4


            .thumb_func
            call_4b1c:
/*0x4b1c*/      ldr r0, [pc, #0xc] /* data_4b2c */
/*0x4b1e*/      ldr r1, [pc, #0x10] /* data_4b30 */
/*0x4b20*/      ldrb r0, [r0, #1]
/*0x4b22*/      and r0, r0, #3
/*0x4b26*/      ldrb r0, [r1, r0]
/*0x4b28*/      b.w call_60f8

            data_4b2c:
/*0x4b2c*/  .word 0x20000000
            data_4b30:
/*0x4b30*/  .word data_7adc


            .thumb_func
            call_4b34:
/*0x4b34*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4b38*/      ldr r5, [pc, #0x8c] /* data_4bc8 */
/*0x4b3a*/      ldrh r1, [r5]
/*0x4b3c*/      movw sl, #0xffff
/*0x4b40*/      cmp r1, sl
/*0x4b42*/      beq jump_4bc4
/*0x4b44*/      movs r1, #2
/*0x4b46*/      add r0, sp, #4
/*0x4b48*/      bl call_4a54
/*0x4b4c*/      movs r6, #0
/*0x4b4e*/      ldr r4, [pc, #0x7c] /* data_4bcc */
/*0x4b50*/      movw r7, #0x2710
/*0x4b54*/      cmp r0, #2
/*0x4b56*/      bne jump_4bb8
/*0x4b58*/      ldr.w sb, [pc, #0x74] /* data_4bd0 */
/*0x4b5c*/      movs r3, #2
/*0x4b5e*/      mov r2, r3
/*0x4b60*/      ldrb.w r1, [sb, #0x44]
/*0x4b64*/      strb.w r1, [sp]
/*0x4b68*/      ldrb.w r0, [sb, #0xc]
/*0x4b6c*/      strb.w r0, [sp, #1]
/*0x4b70*/      mov r1, sp
/*0x4b72*/      add r0, sp, #4
/*0x4b74*/      bl call_4a24
/*0x4b78*/      mov.w r8, #1
/*0x4b7c*/      cbz r0, jump_4b90
/*0x4b7e*/      ldrh r0, [r5]
/*0x4b80*/      cmp r0, r7
/*0x4b82*/      bls jump_4b8a
/*0x4b84*/      strb.w r8, [r4, #3]
/*0x4b88*/      b jump_4bb8
            jump_4b8a:
/*0x4b8a*/      strb.w r8, [r4, #9]
/*0x4b8e*/      b jump_4bba
            jump_4b90:
/*0x4b90*/      ldrb.w r1, [sb, #0x22]
/*0x4b94*/      strb.w r1, [sp]
/*0x4b98*/      ldrb.w r0, [sb, #0x43]
/*0x4b9c*/      strb.w r0, [sp, #1]
/*0x4ba0*/      movs r3, #2
/*0x4ba2*/      mov r2, r3
/*0x4ba4*/      mov r1, sp
/*0x4ba6*/      add r0, sp, #4
/*0x4ba8*/      bl call_4a24
/*0x4bac*/      cbz r0, jump_4bb8
/*0x4bae*/      ldrh r0, [r5]
/*0x4bb0*/      cmp r0, r7
/*0x4bb2*/      bls jump_4b8a
/*0x4bb4*/      movs r0, #2
/*0x4bb6*/      strb r0, [r4, #3]
            jump_4bb8:
/*0x4bb8*/      strb r6, [r4, #9]
            jump_4bba:
/*0x4bba*/      ldrh r0, [r5]
/*0x4bbc*/      cmp r0, r7
/*0x4bbe*/      bls jump_4bc4
/*0x4bc0*/      strh.w sl, [r5]
            jump_4bc4:
/*0x4bc4*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, pc}

            data_4bc8:
/*0x4bc8*/  .word 0x20000020
            data_4bcc:
/*0x4bcc*/  .word 0x200006c0
            data_4bd0:
/*0x4bd0*/  .word 0x200002c4


            .thumb_func
            call_4bd4:
/*0x4bd4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4bd8*/      ldr r0, [pc, #0x240] /* data_4e1c */
/*0x4bda*/      ldr.w ip, [pc, #0x244] /* data_4e20 */
/*0x4bde*/      movs r5, #0
/*0x4be0*/      ldrb r2, [r0, #0xb]
/*0x4be2*/      ldrb.w r1, [ip, #4]
/*0x4be6*/      cbz r2, jump_4c20
/*0x4be8*/      ldrb.w r0, [ip, #6]
/*0x4bec*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4bee*/      uxtb r0, r0
/*0x4bf0*/      strb.w r0, [ip, #6]
/*0x4bf4*/      cmp r0, #3
/*0x4bf6*/      bls jump_4cac
/*0x4bf8*/      mov r0, ip
/*0x4bfa*/      strb.w r5, [ip, #6]
/*0x4bfe*/      ldrb r0, [r0, #4]
/*0x4c00*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4c02*/      cmp r2, #6
/*0x4c04*/      beq jump_4c0c
/*0x4c06*/      cmp r2, #7
            jump_4c08:
/*0x4c08*/      bne jump_4cac
/*0x4c0a*/      b jump_4c14
            jump_4c0c:
/*0x4c0c*/      strb.w r1, [ip, #5]
/*0x4c10*/      movs r1, #0x3d
/*0x4c12*/      b jump_4c16
            jump_4c14:
/*0x4c14*/      movs r1, #0x18
            jump_4c16:
/*0x4c16*/      udiv r2, r0, r1
/*0x4c1a*/      mls r0, r1, r2, r0
/*0x4c1e*/      b jump_4cb0
            jump_4c20:
/*0x4c20*/      ldr r0, [pc, #0x200] /* data_4e24 */
/*0x4c22*/      ldr r3, [pc, #0x1fc] /* data_4e20 */
/*0x4c24*/      ldr r2, [pc, #0x200] /* data_4e28 */
/*0x4c26*/      ldrb r0, [r0, #3]
/*0x4c28*/      add.w r6, r3, #0xdb
/*0x4c2c*/      ldr r3, [r3]
/*0x4c2e*/      add.w r4, r2, #0xe
/*0x4c32*/      mov.w sb, #1
/*0x4c36*/      cmp r0, #3
/*0x4c38*/      bhi jump_4cf6
/*0x4c3a*/      ldrb r2, [r2, r0]
/*0x4c3c*/      cmp r0, #1
/*0x4c3e*/      add.w r2, r2, r2, lsl #1
/*0x4c42*/      add.w r2, r4, r2, lsl #1
/*0x4c46*/      ldrb r4, [r3, #4]
/*0x4c48*/      and r4, r4, #0xf
/*0x4c4c*/      ldrb r4, [r2, r4]
/*0x4c4e*/      beq jump_4c5a
/*0x4c50*/      cmp r0, #2
/*0x4c52*/      beq jump_4cae
/*0x4c54*/      cmp r0, #3
/*0x4c56*/      bne jump_4c08
/*0x4c58*/      b jump_4cb6
            jump_4c5a:
/*0x4c5a*/      movs r1, #3
/*0x4c5c*/      add.w r0, ip, #7
/*0x4c60*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x4c62*/      b jump_4ca6
            jump_4c64:
/*0x4c64*/      lsl.w r2, sb, r1
/*0x4c68*/      ldrb.w r6, [ip, #7]
/*0x4c6c*/      uxtb r2, r2
/*0x4c6e*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4c70*/      tst r6, r2
/*0x4c72*/      ldrb r6, [r0, #-0x1]!
/*0x4c76*/      beq jump_4c8a
/*0x4c78*/      cmp r6, r4
/*0x4c7a*/      bhi jump_4c86
/*0x4c7c*/      strb r5, [r0]
/*0x4c7e*/      ldrb.w r6, [ip, #7]
/*0x4c82*/      bics r6, r2
/*0x4c84*/      b jump_4c9c
            jump_4c86:
/*0x4c86*/      subs r2, r6, r4
/*0x4c88*/      b jump_4ca4
            jump_4c8a:
/*0x4c8a*/      ldrb r7, [r3]
/*0x4c8c*/      sub.w r8, r7, r4
/*0x4c90*/      cmp r6, r8
/*0x4c92*/      blt jump_4ca2
/*0x4c94*/      strb r7, [r0]
/*0x4c96*/      ldrb.w r6, [ip, #7]
/*0x4c9a*/      orrs r6, r2
            jump_4c9c:
/*0x4c9c*/      strb.w r6, [ip, #7]
/*0x4ca0*/      b jump_4ca6
            jump_4ca2:
/*0x4ca2*/      adds r2, r6, r4
            jump_4ca4:
/*0x4ca4*/      strb r2, [r0]
            jump_4ca6:
/*0x4ca6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4ca8*/      uxtb r1, r1
/*0x4caa*/      bhs jump_4c64
            jump_4cac:
/*0x4cac*/      b jump_4e14
            jump_4cae:
/*0x4cae*/      adds r0, r1, r4
            jump_4cb0:
/*0x4cb0*/      strb.w r0, [ip, #4]
/*0x4cb4*/      b jump_4e14
            jump_4cb6:
/*0x4cb6*/      movs r7, #0x48
/*0x4cb8*/      b jump_4cee
            jump_4cba:
/*0x4cba*/      bl rand
/*0x4cbe*/      sdiv r1, r0, r4
/*0x4cc2*/      mls r0, r4, r1, r0
/*0x4cc6*/      cbz r0, jump_4ccc
/*0x4cc8*/      movs r0, #3
/*0x4cca*/      b jump_4ce8
            jump_4ccc:
/*0x4ccc*/      subs r0, r6, #2
/*0x4cce*/      movs r1, #0
/*0x4cd0*/      bl call_6f40
/*0x4cd4*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x4cd6*/      b jump_4cee
            jump_4cd8:
/*0x4cd8*/      ldrb r1, [r6]
/*0x4cda*/      cmp r1, #2
/*0x4cdc*/      bhi jump_4ce2
/*0x4cde*/      strb r5, [r6]
/*0x4ce0*/      b jump_4ce6
            jump_4ce2:
/*0x4ce2*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x4ce4*/      strb r1, [r6]
            jump_4ce6:
/*0x4ce6*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_4ce8:
/*0x4ce8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4cea*/      uxtb r0, r0
/*0x4cec*/      bhs jump_4cd8
            jump_4cee:
/*0x4cee*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x4cf0*/      uxtb r7, r7
/*0x4cf2*/      bhs jump_4cba
/*0x4cf4*/      b jump_4e14
            jump_4cf6:
/*0x4cf6*/      cmp r0, #7
/*0x4cf8*/      bls jump_4d72
/*0x4cfa*/      ldrb r1, [r2, r0]
/*0x4cfc*/      ldrb r2, [r3, #4]
/*0x4cfe*/      add.w r1, r1, r1, lsl #1
/*0x4d02*/      add.w r1, r4, r1, lsl #1
/*0x4d06*/      and r2, r2, #0xf
/*0x4d0a*/      bic r0, r0, #1
/*0x4d0e*/      ldrb r2, [r1, r2]
/*0x4d10*/      cmp r0, #8
/*0x4d12*/      beq jump_4d1e
/*0x4d14*/      cmp r0, #0xa
/*0x4d16*/      beq jump_4d74
/*0x4d18*/      cmp r0, #0xc
/*0x4d1a*/      bne jump_4e14
/*0x4d1c*/      b jump_4dd2
            jump_4d1e:
/*0x4d1e*/      movs r0, #0x48
/*0x4d20*/      b jump_4d6c
            jump_4d22:
/*0x4d22*/      ldrb r1, [r6], #-1
/*0x4d26*/      cbz r1, jump_4d2c
/*0x4d28*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4d2a*/      b jump_4d3c
            jump_4d2c:
/*0x4d2c*/      ldrb r1, [r6], #-1
/*0x4d30*/      cbz r1, jump_4d36
/*0x4d32*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x4d34*/      b jump_4d3c
            jump_4d36:
/*0x4d36*/      ldrb r1, [r6], #-1
/*0x4d3a*/      cbz r1, jump_4d6c
            jump_4d3c:
/*0x4d3c*/      ldr r1, [pc, #0xec] /* data_4e2c */
/*0x4d3e*/      and r4, r0, #7
/*0x4d42*/      add.w r1, r1, r0, lsr #3
/*0x4d46*/      ldrb r3, [r1]
/*0x4d48*/      lsl.w r1, sb, r4
/*0x4d4c*/      tst r3, r1
/*0x4d4e*/      beq jump_4d6c
/*0x4d50*/      movs r1, #3
/*0x4d52*/      b jump_4d64
            jump_4d54:
/*0x4d54*/      ldrb r3, [r6, #1]!
/*0x4d58*/      cmp r3, r2
/*0x4d5a*/      bhi jump_4d60
/*0x4d5c*/      strb r5, [r6]
/*0x4d5e*/      b jump_4d64
            jump_4d60:
/*0x4d60*/      subs r3, r3, r2
/*0x4d62*/      strb r3, [r6]
            jump_4d64:
/*0x4d64*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4d66*/      uxtb r1, r1
/*0x4d68*/      bhs jump_4d54
/*0x4d6a*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4d6c:
/*0x4d6c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4d6e*/      uxtb r0, r0
/*0x4d70*/      bhs jump_4d22
            jump_4d72:
/*0x4d72*/      b jump_4e14
            jump_4d74:
/*0x4d74*/      ldrb.w r0, [ip, #0x58]
/*0x4d78*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4d7a*/      uxtb r0, r0
/*0x4d7c*/      strb.w r0, [ip, #0x58]
/*0x4d80*/      cmp r0, r2
/*0x4d82*/      blo jump_4e14
/*0x4d84*/      strb.w r5, [ip, #0x58]
/*0x4d88*/      movs r0, #1
            jump_4d8a:
/*0x4d8a*/      add.w r1, r0, r0, lsl #1
/*0x4d8e*/      add.w r1, ip, r1, lsl #1
/*0x4d92*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4d94*/      ldrh r2, [r1, #4]
/*0x4d96*/      strh r2, [r1, #-0x2]
/*0x4d9a*/      ldrb r2, [r1, #6]
/*0x4d9c*/      uxtb r0, r0
/*0x4d9e*/      strb r2, [r1]
/*0x4da0*/      cmp r0, #0xe
/*0x4da2*/      blo jump_4d8a
/*0x4da4*/      strh.w r5, [ip, #0x52]
/*0x4da8*/      strb.w r5, [ip, #0x54]
/*0x4dac*/      movs r0, #0xe
/*0x4dae*/      b jump_4dc2
            jump_4db0:
/*0x4db0*/      add.w r1, r0, r0, lsl #1
/*0x4db4*/      add.w r1, ip, r1, lsl #1
/*0x4db8*/      ldrh r2, [r1, #1]!
/*0x4dbc*/      strh r2, [r1, #6]
/*0x4dbe*/      ldrb r2, [r1, #2]
/*0x4dc0*/      strb r2, [r1, #8]
            jump_4dc2:
/*0x4dc2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4dc4*/      uxtb r0, r0
/*0x4dc6*/      bhs jump_4db0
/*0x4dc8*/      strh.w r5, [ip, #7]
/*0x4dcc*/      strb.w r5, [ip, #9]
/*0x4dd0*/      b jump_4e14
            jump_4dd2:
/*0x4dd2*/      ldrb.w r0, [ip, #0x27]
/*0x4dd6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4dd8*/      uxtb r0, r0
/*0x4dda*/      strb.w r0, [ip, #0x27]
/*0x4dde*/      cmp r0, r2
/*0x4de0*/      blo jump_4e14
/*0x4de2*/      ldr r0, [pc, #0x3c] /* data_4e20 */
/*0x4de4*/      strb.w r5, [ip, #0x27]
/*0x4de8*/      adds r0, #0x27
/*0x4dea*/      movs r2, #5
/*0x4dec*/      b jump_4e0e
            jump_4dee:
/*0x4dee*/      ldrsb r1, [r0, #-0x1]
/*0x4df2*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x4df4*/      cbz r1, jump_4e0e
/*0x4df6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4df8*/      sxtb r1, r1
/*0x4dfa*/      strb r1, [r0, #4]
/*0x4dfc*/      ldrb r3, [r0, #3]
/*0x4dfe*/      adds r4, r1, r3
/*0x4e00*/      subs r4, #0xa
/*0x4e02*/      cmp r4, #0xe
/*0x4e04*/      ble jump_4e0e
/*0x4e06*/      subs r1, r3, r1
/*0x4e08*/      adds r1, #0xa
/*0x4e0a*/      bpl jump_4e0e
/*0x4e0c*/      strb r5, [r0, #4]
            jump_4e0e:
/*0x4e0e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4e10*/      uxtb r2, r2
/*0x4e12*/      bhs jump_4dee
            jump_4e14:
/*0x4e14*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4e18*/      b.w call_55bc

            data_4e1c:
/*0x4e1c*/  .word 0x200006c0
            data_4e20:
/*0x4e20*/  .word 0x20000090
            data_4e24:
/*0x4e24*/  .word 0x20000734
            data_4e28:
/*0x4e28*/  .word data_7b43
            data_4e2c:
/*0x4e2c*/  .word 0x200001b0


            .thumb_func
            call_4e30:
/*0x4e30*/      push {r4, lr}
/*0x4e32*/      movs r1, #5
/*0x4e34*/      ldr r0, [pc, #0xc] /* data_4e44 */
/*0x4e36*/      bl call_4728
/*0x4e3a*/      ldr r1, [pc, #0x10] /* data_4e4c */
/*0x4e3c*/      ldr r0, [pc, #8] /* data_4e48 */
/*0x4e3e*/      str r0, [r1, #4]
/*0x4e40*/      pop {r4, pc}

/*0x4e42*/  .byte 0x00
/*0x4e43*/  .byte 0x00

            data_4e44:
/*0x4e44*/  .word data_7ae5
            data_4e48:
/*0x4e48*/  .word 0x20000058
            data_4e4c:
/*0x4e4c*/  .word 0x20000000


            .thumb_func
            call_4e50:
/*0x4e50*/      push {r3, r4, r5, lr}
/*0x4e52*/      movs r1, #3
/*0x4e54*/      mov r0, sp
/*0x4e56*/      bl call_4a54
/*0x4e5a*/      ldr r4, [pc, #0x2c] /* data_4e88 */
/*0x4e5c*/      cmp r0, #3
/*0x4e5e*/      bne jump_4e7e
/*0x4e60*/      movs r3, #3
/*0x4e62*/      mov r2, r3
/*0x4e64*/      ldr r1, [pc, #0x24] /* data_4e8c */
/*0x4e66*/      mov r0, sp
/*0x4e68*/      bl call_4a24
/*0x4e6c*/      cbz r0, jump_4e7e
/*0x4e6e*/      ldrb r0, [r4, #2]
/*0x4e70*/      mvn.w r1, r0, lsr #1
/*0x4e74*/      bfi r0, r1, #1, #1
/*0x4e78*/      strb r0, [r4, #2]
/*0x4e7a*/      bl call_3bec
            jump_4e7e:
/*0x4e7e*/      ldrb r0, [r4, #2]
/*0x4e80*/      ubfx r0, r0, #1, #1
/*0x4e84*/      pop {r3, r4, r5, pc}

/*0x4e86*/  .byte 0x00
/*0x4e87*/  .byte 0x00

            data_4e88:
/*0x4e88*/  .word 0x20000734
            data_4e8c:
/*0x4e8c*/  .word data_7ad9


            .thumb_func
            call_4e90:
/*0x4e90*/      push {r4, lr}
/*0x4e92*/      lsrs r1, r0, #0x18
/*0x4e94*/      lsls r1, r1, #0x1e
/*0x4e96*/      bpl jump_4eca
/*0x4e98*/      uxtb r0, r0
/*0x4e9a*/      cmp r0, #0x12
/*0x4e9c*/      beq jump_4ecc
/*0x4e9e*/      bgt jump_4eaa
/*0x4ea0*/      cmp r0, #0x10
/*0x4ea2*/      beq jump_4ecc
/*0x4ea4*/      cmp r0, #0x11
/*0x4ea6*/      bne jump_4eca
/*0x4ea8*/      b jump_4ecc
            jump_4eaa:
/*0x4eaa*/      cmp r0, #0x13
/*0x4eac*/      beq jump_4ecc
/*0x4eae*/      cmp r0, #0x5f
/*0x4eb0*/      bne jump_4eca
/*0x4eb2*/      ldr r0, [pc, #0x20] /* data_4ed4 */
/*0x4eb4*/      ldrb r0, [r0, #2]
/*0x4eb6*/      cmp r0, #0
/*0x4eb8*/      beq jump_4eca
/*0x4eba*/      bl call_55b0
/*0x4ebe*/      bl call_5ac0
/*0x4ec2*/      ldr r1, [pc, #0x14] /* data_4ed8 */
/*0x4ec4*/      movw r0, #0x7530
/*0x4ec8*/      strh r0, [r1, #2]
            jump_4eca:
/*0x4eca*/      pop {r4, pc}
            jump_4ecc:
/*0x4ecc*/      ldr r1, [pc, #0xc] /* data_4edc */
/*0x4ece*/      subs r0, #0x10
/*0x4ed0*/      strb r0, [r1]
/*0x4ed2*/      pop {r4, pc}

            data_4ed4:
/*0x4ed4*/  .word 0x20000060
            data_4ed8:
/*0x4ed8*/  .word 0x20000000
            data_4edc:
/*0x4edc*/  .word 0x20000051


            .thumb_func
            call_4ee0:
/*0x4ee0*/      ldr r0, [pc, #0x7c] /* data_4f60 */
/*0x4ee2*/      push {r4, lr}
/*0x4ee4*/      ldrb r1, [r0, #3]
/*0x4ee6*/      lsls r1, r1, #0x1e
/*0x4ee8*/      bpl jump_4f3a
/*0x4eea*/      ldr r2, [pc, #0x78] /* data_4f64 */
/*0x4eec*/      ldrb r4, [r0]
/*0x4eee*/      movs r3, #1
/*0x4ef0*/      ldrb r1, [r2, #7]
/*0x4ef2*/      cmp r4, #0xcf
/*0x4ef4*/      beq jump_4f06
/*0x4ef6*/      ldrb r0, [r0, #1]
/*0x4ef8*/      lsls r0, r0, #0x1f
/*0x4efa*/      beq jump_4f3a
/*0x4efc*/      ldr r0, [pc, #0x60] /* data_4f60 */
/*0x4efe*/      cmp r1, #2
/*0x4f00*/      ldrb r0, [r0, #2]
/*0x4f02*/      beq jump_4f1a
/*0x4f04*/      b jump_4f26
            jump_4f06:
/*0x4f06*/      cmp r1, #4
/*0x4f08*/      beq jump_4f16
/*0x4f0a*/      cmp r1, #5
/*0x4f0c*/      bne jump_4f3a
/*0x4f0e*/      strb r3, [r2, #8]
/*0x4f10*/      movs r0, #6
/*0x4f12*/      strb r0, [r2, #7]
/*0x4f14*/      b jump_4f5c
            jump_4f16:
/*0x4f16*/      strb r3, [r2, #7]
/*0x4f18*/      b jump_4f5c
            jump_4f1a:
/*0x4f1a*/      cmp r0, #0xd
/*0x4f1c*/      beq jump_4f3a
/*0x4f1e*/      cmp r0, #0x15
/*0x4f20*/      beq jump_4f3a
/*0x4f22*/      cmp r0, #0x1d
/*0x4f24*/      beq jump_4f3a
            jump_4f26:
/*0x4f26*/      ldr r1, [pc, #0x3c] /* data_4f64 */
/*0x4f28*/      cmp r0, #0xd
/*0x4f2a*/      ldr r1, [r1]
/*0x4f2c*/      beq jump_4f3e
/*0x4f2e*/      cmp r0, #0x15
/*0x4f30*/      beq jump_4f42
/*0x4f32*/      cmp r0, #0x1d
/*0x4f34*/      beq jump_4f48
/*0x4f36*/      cmp r0, #0x47
/*0x4f38*/      beq jump_4f4e
            jump_4f3a:
/*0x4f3a*/      movs r0, #0
/*0x4f3c*/      pop {r4, pc}
            jump_4f3e:
/*0x4f3e*/      adds r1, #0xf
/*0x4f40*/      b jump_4f44
            jump_4f42:
/*0x4f42*/      adds r1, #0x64
            jump_4f44:
/*0x4f44*/      str r1, [r2]
/*0x4f46*/      b jump_4f5c
            jump_4f48:
/*0x4f48*/      add.w r1, r1, #0x1f4
/*0x4f4c*/      b jump_4f44
            jump_4f4e:
/*0x4f4e*/      movs r0, #8
/*0x4f50*/      ldr r1, [pc, #0x14] /* data_4f68 */
/*0x4f52*/      strb r0, [r2, #7]
/*0x4f54*/      movs r0, #0
/*0x4f56*/      strh r0, [r1, #2]
/*0x4f58*/      ldr r0, [pc, #0x10] /* data_4f6c */
/*0x4f5a*/      strb r3, [r0]
            jump_4f5c:
/*0x4f5c*/      movs r0, #1
/*0x4f5e*/      pop {r4, pc}

            data_4f60:
/*0x4f60*/  .word 0x20000058
            data_4f64:
/*0x4f64*/  .word 0x200019d4
            data_4f68:
/*0x4f68*/  .word 0x20000000
            data_4f6c:
/*0x4f6c*/  .word 0x200006c0


            .thumb_func
            call_4f70:
/*0x4f70*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x4f74*/      ldr r0, [pc, #0x1b8] /* data_5130 */
/*0x4f76*/      ldrh r1, [r0, #2]
/*0x4f78*/      cbz r1, jump_4f80
/*0x4f7a*/      movw r1, #0x7530
/*0x4f7e*/      strh r1, [r0, #2]
            jump_4f80:
/*0x4f80*/      ldr r6, [pc, #0x1b4] /* data_5138 */
/*0x4f82*/      ldr r5, [pc, #0x1b0] /* data_5134 */
/*0x4f84*/      mov.w sb, #0
/*0x4f88*/      ldrb r2, [r6]
/*0x4f8a*/      ldrb r3, [r5, #0xa]
/*0x4f8c*/      ldrb r1, [r6, #3]
/*0x4f8e*/      ldrb r0, [r6, #2]
/*0x4f90*/      mov.w fp, #3
/*0x4f94*/      movs r4, #1
/*0x4f96*/      cbz r3, jump_4fec
/*0x4f98*/      lsls r1, r1, #0x1e
/*0x4f9a*/      bpl jump_4fe6
/*0x4f9c*/      cmp r3, #1
/*0x4f9e*/      beq jump_4fb0
/*0x4fa0*/      ldr r1, [pc, #0x198] /* data_513c */
/*0x4fa2*/      ldrb r1, [r3, r1]
/*0x4fa4*/      cmp r0, r1
/*0x4fa6*/      beq jump_4fde
/*0x4fa8*/      ldr r7, [pc, #0x190] /* data_513c */
/*0x4faa*/      movs r1, #5
/*0x4fac*/      adds r7, #0xe
/*0x4fae*/      b jump_4fd4
            jump_4fb0:
/*0x4fb0*/      ldr r1, [pc, #0x18c] /* data_5140 */
/*0x4fb2*/      ldrb.w r2, [r1, #0xe8]
/*0x4fb6*/      cmp r0, r2
/*0x4fb8*/      bne jump_4fbe
/*0x4fba*/      movs r2, #2
/*0x4fbc*/      strb r2, [r5, #0xa]
            jump_4fbe:
/*0x4fbe*/      ldrb.w r1, [r1, #0xe9]
/*0x4fc2*/      cmp r0, r1
/*0x4fc4*/      bne jump_4fe6
/*0x4fc6*/      strb.w fp, [r5, #0xa]
/*0x4fca*/      b jump_4fe6
            jump_4fcc:
/*0x4fcc*/      ldrb.w ip, [r7, r1]
/*0x4fd0*/      cmp ip, r2
/*0x4fd2*/      beq jump_4fda
            jump_4fd4:
/*0x4fd4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4fd6*/      uxtb r1, r1
/*0x4fd8*/      bhs jump_4fcc
            jump_4fda:
/*0x4fda*/      cmp r1, #0xff
/*0x4fdc*/      bne jump_4fe6
            jump_4fde:
/*0x4fde*/      ldr r1, [pc, #0x160] /* data_5140 */
/*0x4fe0*/      adds r1, #0xe6
/*0x4fe2*/      strb r0, [r3, r1]
/*0x4fe4*/      strb r4, [r5, #0xa]
            jump_4fe6:
/*0x4fe6*/      strb.w sb, [r6]
/*0x4fea*/      b jump_501c
            jump_4fec:
/*0x4fec*/      ldr.w sl, [pc, #0x154] /* data_5144 */
/*0x4ff0*/      cmp r2, #0xcf
/*0x4ff2*/      ldrb.w ip, [sl, #6]
/*0x4ff6*/      beq jump_5010
/*0x4ff8*/      ldr r7, [pc, #0x13c] /* data_5138 */
/*0x4ffa*/      ldrb r3, [r6, #1]
/*0x4ffc*/      ldrb r7, [r7, #3]
/*0x4ffe*/      lsls.w r8, r3, #0x1f
/*0x5002*/      orr r7, r7, #1
/*0x5006*/      beq jump_5058
/*0x5008*/      cmp.w ip, #1
/*0x500c*/      beq jump_5026
/*0x500e*/      b jump_5022
            jump_5010:
/*0x5010*/      ubfx r0, r1, #1, #1
/*0x5014*/      strb r0, [r5, #7]
/*0x5016*/      cmp.w ip, #1
/*0x501a*/      beq jump_5022
            jump_501c:
/*0x501c*/      movs r0, #1
            jump_501e:
/*0x501e*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_5022:
/*0x5022*/      movs r0, #0
/*0x5024*/      b jump_501e
            jump_5026:
/*0x5026*/      ldrb.w r1, [sl, #7]
/*0x502a*/      cmp r1, #2
/*0x502c*/      beq jump_5022
/*0x502e*/      ldr r2, [pc, #0x10c] /* data_513c */
/*0x5030*/      movs r1, #0
/*0x5032*/      adds r2, #0x22
            jump_5034:
/*0x5034*/      ldrb.w r4, [r2, r1, lsl #1]
/*0x5038*/      cmp r0, r4
/*0x503a*/      bne jump_504e
/*0x503c*/      add.w r0, r2, r1, lsl #1
/*0x5040*/      ldrb r0, [r0, #1]
/*0x5042*/      strb r0, [r6]
/*0x5044*/      strb r7, [r6, #3]
/*0x5046*/      bic r0, r3, #1
/*0x504a*/      strb r0, [r6, #1]
            jump_504c:
/*0x504c*/      b jump_5022
            jump_504e:
/*0x504e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x5050*/      uxtb r1, r1
/*0x5052*/      cmp r1, #0x22
/*0x5054*/      blo jump_5034
/*0x5056*/      b jump_5022
            jump_5058:
/*0x5058*/      ldrb.w ip, [r5, #7]
/*0x505c*/      cmp.w ip, #0
/*0x5060*/      beq jump_50d0
/*0x5062*/      ldrb r2, [r5, #6]
/*0x5064*/      cmp r2, #0
/*0x5066*/      bne jump_5022
/*0x5068*/      lsls r1, r1, #0x1e
/*0x506a*/      bpl jump_50ca
/*0x506c*/      ldr r1, [pc, #0xd8] /* data_5148 */
/*0x506e*/      cmp r0, #0x25
/*0x5070*/      ldrb r1, [r1, r0]
/*0x5072*/      strb r1, [r6]
/*0x5074*/      beq jump_508c
/*0x5076*/      bgt jump_5082
/*0x5078*/      cmp r0, #5
/*0x507a*/      beq jump_50a6
/*0x507c*/      cmp r0, #0x24
/*0x507e*/      bne jump_50c4
/*0x5080*/      b jump_508c
            jump_5082:
/*0x5082*/      cmp r0, #0x26
/*0x5084*/      beq jump_5098
/*0x5086*/      cmp r0, #0x2a
/*0x5088*/      bne jump_50c4
/*0x508a*/      b jump_5098
            jump_508c:
/*0x508c*/      subs r0, #0x24
/*0x508e*/      lsls r4, r0
/*0x5090*/      uxtb r0, r4
/*0x5092*/      bl call_3a80
/*0x5096*/      b jump_50ca
            jump_5098:
/*0x5098*/      subs r0, #0x26
/*0x509a*/      lsl.w r0, r4, r0
/*0x509e*/      uxtb r0, r0
/*0x50a0*/      bl call_3a68
/*0x50a4*/      b jump_50c0
            jump_50a6:
/*0x50a6*/      lsls r0, r3, #0x1c
/*0x50a8*/      bpl jump_50c4
/*0x50aa*/      ldrb r0, [r5, #0xb]
/*0x50ac*/      cbz r0, jump_50be
/*0x50ae*/      movs r1, #7
/*0x50b0*/      udiv r2, r0, r1
/*0x50b4*/      mls r0, r1, r2, r0
/*0x50b8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x50ba*/      strb r0, [r5, #0xb]
/*0x50bc*/      b jump_50c0
            jump_50be:
/*0x50be*/      strb r4, [r5, #0xb]
            jump_50c0:
/*0x50c0*/      strb r4, [r5]
/*0x50c2*/      b jump_50ca
            jump_50c4:
/*0x50c4*/      ldr r0, [r6]
/*0x50c6*/      bl call_53f4
            jump_50ca:
/*0x50ca*/      strb.w sb, [r6]
/*0x50ce*/      b jump_5022
            jump_50d0:
/*0x50d0*/      lsls r0, r1, #0x1e
/*0x50d2*/      ldr r1, [pc, #0x5c] /* data_5130 */
/*0x50d4*/      bpl jump_511c
/*0x50d6*/      cmp r2, #0x29
/*0x50d8*/      beq jump_5110
/*0x50da*/      cmp r2, #0x2c
/*0x50dc*/      beq jump_50e6
/*0x50de*/      cmp r2, #0xe3
/*0x50e0*/      beq jump_50e6
/*0x50e2*/      cmp r2, #0xe6
/*0x50e4*/      bne jump_5022
            jump_50e6:
/*0x50e6*/      movs r1, #3
/*0x50e8*/      mov r0, sp
/*0x50ea*/      bl call_4a54
/*0x50ee*/      cmp r0, #3
/*0x50f0*/      bne jump_5022
/*0x50f2*/      ldr r1, [pc, #0x48] /* data_513c */
/*0x50f4*/      movs r3, #3
/*0x50f6*/      mov r2, r3
/*0x50f8*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x50fa*/      mov r0, sp
/*0x50fc*/      bl call_4a24
/*0x5100*/      cmp r0, #0
/*0x5102*/      beq jump_5022
/*0x5104*/      ldrb r0, [r5, #8]
/*0x5106*/      mvns r0, r0
/*0x5108*/      strb r0, [r5, #8]
/*0x510a*/      strb.w fp, [r5, #4]
/*0x510e*/      b jump_50ca
            jump_5110:
/*0x5110*/      lsls r0, r3, #0x1b
/*0x5112*/      bpl jump_5022
/*0x5114*/      movs r0, #0x35
/*0x5116*/      strb r0, [r6]
/*0x5118*/      strb r0, [r1]
/*0x511a*/      b jump_512c
            jump_511c:
/*0x511c*/      ldrb r0, [r1]
/*0x511e*/      cmp r0, #0
/*0x5120*/      beq jump_504c
/*0x5122*/      cmp r2, #0x29
/*0x5124*/      bne jump_504c
/*0x5126*/      strb r0, [r6]
/*0x5128*/      strb.w sb, [r1]
            jump_512c:
/*0x512c*/      strb r7, [r6, #3]
/*0x512e*/      b jump_5022

            data_5130:
/*0x5130*/  .word 0x20000000
            data_5134:
/*0x5134*/  .word 0x200006c0
            data_5138:
/*0x5138*/  .word 0x20000058
            data_513c:
/*0x513c*/  .word 0x00007ad2 /* possible pointer */
            data_5140:
/*0x5140*/  .word 0x20000734
            data_5144:
/*0x5144*/  .word 0x200019d4
            data_5148:
/*0x5148*/  .word 0x200002c4


            .thumb_func
            call_514c:
/*0x514c*/      push {r4, r5, r6, lr}
/*0x514e*/      ldr r4, [pc, #0x60] /* data_51b0 */
/*0x5150*/      ldrb r0, [r4, #3]
/*0x5152*/      lsls r1, r0, #0x1f
/*0x5154*/      bne jump_5182
/*0x5156*/      mov r1, r4
/*0x5158*/      ldr r3, [pc, #0x58] /* data_51b4 */
/*0x515a*/      ldrb r1, [r1, #2]
/*0x515c*/      ldr r2, [pc, #0x58] /* data_51b8 */
/*0x515e*/      lsls r0, r0, #0x1e
/*0x5160*/      bpl jump_518e
/*0x5162*/      ldrb r5, [r4, #1]
/*0x5164*/      lsls r0, r5, #0x19
/*0x5166*/      bpl jump_5182
/*0x5168*/      movs r0, #0
            jump_516a:
/*0x516a*/      ldrb.w r6, [r3, r0, lsl #1]
/*0x516e*/      cmp r1, r6
/*0x5170*/      bne jump_5184
/*0x5172*/      add.w r1, r3, r0, lsl #1
/*0x5176*/      ldrb r1, [r1, #1]
/*0x5178*/      strb r1, [r4]
/*0x517a*/      strb r1, [r2, r0]
/*0x517c*/      bic r0, r5, #1
/*0x5180*/      strb r0, [r4, #1]
            jump_5182:
/*0x5182*/      pop {r4, r5, r6, pc}
            jump_5184:
/*0x5184*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5186*/      uxtb r0, r0
/*0x5188*/      cmp r0, #0x22
/*0x518a*/      blo jump_516a
/*0x518c*/      pop {r4, r5, r6, pc}
            jump_518e:
/*0x518e*/      movs r0, #0
            jump_5190:
/*0x5190*/      ldrb.w r5, [r3, r0, lsl #1]
/*0x5194*/      cmp r1, r5
/*0x5196*/      bne jump_51a4
/*0x5198*/      ldrb r5, [r2, r0]
/*0x519a*/      cbz r5, jump_51a4
/*0x519c*/      strb r5, [r4]
/*0x519e*/      movs r1, #0
/*0x51a0*/      strb r1, [r2, r0]
/*0x51a2*/      pop {r4, r5, r6, pc}
            jump_51a4:
/*0x51a4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x51a6*/      uxtb r0, r0
/*0x51a8*/      cmp r0, #0x22
/*0x51aa*/      blo jump_5190
/*0x51ac*/      pop {r4, r5, r6, pc}

/*0x51ae*/  .byte 0x00
/*0x51af*/  .byte 0x00

            data_51b0:
/*0x51b0*/  .word 0x20000058
            data_51b4:
/*0x51b4*/  .word data_7af4
            data_51b8:
/*0x51b8*/  .word 0x2000006c


            .thumb_func
            call_51bc:
/*0x51bc*/      ldr r1, [pc, #0x18] /* data_51d8 */
/*0x51be*/      push {r4, lr}
/*0x51c0*/      ldr r1, [r1]
/*0x51c2*/      ldrh r2, [r0]
/*0x51c4*/      strh r2, [r1]
/*0x51c6*/      ldrb r0, [r0, #2]
/*0x51c8*/      strb r0, [r1, #2]
/*0x51ca*/      bl call_55bc
/*0x51ce*/      pop.w {r4, lr}
/*0x51d2*/      b.w call_3bec

/*0x51d6*/  .byte 0x00
/*0x51d7*/  .byte 0x00

            data_51d8:
/*0x51d8*/  .word 0x20000090


            .thumb_func
            call_51dc:
/*0x51dc*/      ldr r2, [pc, #0x20] /* data_5200 */
/*0x51de*/      ldrh r0, [r2, #2]
/*0x51e0*/      cmp r0, #1
/*0x51e2*/      bne jump_51fa
/*0x51e4*/      ldr r0, [pc, #0x1c] /* data_5204 */
/*0x51e6*/      ldrb r1, [r0, #7]
/*0x51e8*/      cbz r1, jump_51ee
/*0x51ea*/      movs r1, #8
/*0x51ec*/      strb r1, [r0, #7]
            jump_51ee:
/*0x51ee*/      ldr r1, [pc, #0x18] /* data_5208 */
/*0x51f0*/      movs r0, #0
/*0x51f2*/      movs r3, #1
/*0x51f4*/      strb r0, [r1, #6]
/*0x51f6*/      strb r3, [r1]
/*0x51f8*/      strh r0, [r2, #2]
            jump_51fa:
/*0x51fa*/      movs r0, #1
/*0x51fc*/      bx lr

/*0x51fe*/  .byte 0x00
/*0x51ff*/  .byte 0x00

            data_5200:
/*0x5200*/  .word 0x20000000
            data_5204:
/*0x5204*/  .word 0x200019d4
            data_5208:
/*0x5208*/  .word 0x200006c0


            .thumb_func
            call_520c:
/*0x520c*/      cmp r0, #0xff
/*0x520e*/      bhs jump_521e
/*0x5210*/      adds r0, #0x2b
/*0x5212*/      cmp r0, #0xff
/*0x5214*/      bls jump_521a
/*0x5216*/      movs r0, #0xff
/*0x5218*/      bx lr
            jump_521a:
/*0x521a*/      uxtb r0, r0
/*0x521c*/      bx lr
            jump_521e:
/*0x521e*/      movs r0, #0
/*0x5220*/      bx lr

/*0x5222*/  .byte 0x00
/*0x5223*/  .byte 0x00


            .thumb_func
            call_5224:
/*0x5224*/      push {r0, r1, r4, r5, r6, lr}
/*0x5226*/      cmp.w r0, #0x200
/*0x522a*/      bhs jump_5284
/*0x522c*/      ldrh.w r4, [sp, #4]
/*0x5230*/      cmp.w r4, #0x400
/*0x5234*/      bhs jump_5284
/*0x5236*/      lsrs r1, r0, #8
/*0x5238*/      ldr r2, [pc, #0x6c] /* data_52a8 */
/*0x523a*/      uxtb r0, r0
/*0x523c*/      add.w r1, r1, r1, lsl #2
/*0x5240*/      ldrb r0, [r2, r0]
/*0x5242*/      lsls r1, r1, #2
/*0x5244*/      cmp r0, #0xff
/*0x5246*/      beq jump_5284
/*0x5248*/      add.w r2, r1, r0, lsr #2
/*0x524c*/      add.w r3, r0, r1, lsl #2
/*0x5250*/      lsls r0, r0, #0x1e
/*0x5252*/      lsrs r1, r0, #0x1d
/*0x5254*/      movs r6, #3
/*0x5256*/      ldr r5, [pc, #0x54] /* data_52ac */
/*0x5258*/      adds r2, #0xa0
/*0x525a*/      cmp r4, #3
/*0x525c*/      beq jump_5288
/*0x525e*/      ldrb.w r0, [sp, #4]
/*0x5262*/      add r3, r5
/*0x5264*/      cmp r0, #0xff
/*0x5266*/      strb.w r0, [r3, #0xea]
/*0x526a*/      beq jump_5280
/*0x526c*/      adds r0, r5, r2
/*0x526e*/      lsls r6, r1
/*0x5270*/      ldrb r2, [r0, #0xea]!
/*0x5274*/      ldrb.w r3, [sp, #5]
/*0x5278*/      bics r2, r6
/*0x527a*/      lsls r3, r1
/*0x527c*/      orrs r2, r3
/*0x527e*/      strb r2, [r0]
            jump_5280:
/*0x5280*/      movs r0, #0
/*0x5282*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5284:
/*0x5284*/      movs r0, #3
            jump_5286:
/*0x5286*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5288:
/*0x5288*/      adds r0, r5, r3
/*0x528a*/      ldrb.w r0, [r0, #0xea]
/*0x528e*/      cmp r0, #0xff
/*0x5290*/      beq jump_5286
/*0x5292*/      add r2, r5
/*0x5294*/      lsls r6, r1
/*0x5296*/      ldrb.w r2, [r2, #0xea]
/*0x529a*/      rsb.w r1, r1, #8
/*0x529e*/      ands r2, r6
/*0x52a0*/      lsls r2, r1
/*0x52a2*/      add r0, r2
/*0x52a4*/      uxth r0, r0
/*0x52a6*/      pop {r2, r3, r4, r5, r6, pc}

            data_52a8:
/*0x52a8*/  .word 0x200001c4
            data_52ac:
/*0x52ac*/  .word 0x20000734


            .thumb_func
            call_52b0:
/*0x52b0*/      push {r4, r5, r6, r7, lr}
/*0x52b2*/      ldr r0, [pc, #0x6c] /* data_5320 */
/*0x52b4*/      ldrb r1, [r0, #2]
/*0x52b6*/      ldr r0, [pc, #0x6c] /* data_5324 */
/*0x52b8*/      ldrb r2, [r0, #1]
/*0x52ba*/      cbz r1, jump_52c0
/*0x52bc*/      lsls r0, r2, #0x1c
/*0x52be*/      bmi jump_5314
            jump_52c0:
/*0x52c0*/      ldr r0, [pc, #0x64] /* data_5328 */
/*0x52c2*/      ldr r5, [pc, #0x68] /* data_532c */
/*0x52c4*/      ldr r3, [pc, #0x68] /* data_5330 */
/*0x52c6*/      ldrb.w r0, [r0, #0xe8]
/*0x52ca*/      lsls r1, r2, #0x1d
/*0x52cc*/      mov.w r4, #0xe8
/*0x52d0*/      bpl jump_52da
/*0x52d2*/      ldrb.w r1, [r5, #0x39]
/*0x52d6*/      strb r4, [r3, r1]
/*0x52d8*/      strb r4, [r3, r0]
            jump_52da:
/*0x52da*/      ldr r1, [pc, #0x58] /* data_5334 */
/*0x52dc*/      movs r6, #0xcf
/*0x52de*/      ldrb r7, [r1, #8]
/*0x52e0*/      ldr r1, [pc, #0x44] /* data_5328 */
/*0x52e2*/      ldrb.w r1, [r1, #0xe9]
/*0x52e6*/      cbz r7, jump_5316
/*0x52e8*/      ldrb.w r2, [r5, #0xe7]
/*0x52ec*/      movs r7, #0x50
/*0x52ee*/      cmp r0, r2
/*0x52f0*/      strb r7, [r3, r2]
/*0x52f2*/      beq jump_52f6
/*0x52f4*/      strb r4, [r3, r0]
            jump_52f6:
/*0x52f6*/      ldrb.w r0, [r5, #0x65]
/*0x52fa*/      movs r2, #0x51
/*0x52fc*/      cmp r1, r0
/*0x52fe*/      strb r2, [r3, r0]
/*0x5300*/      beq jump_5304
/*0x5302*/      strb r6, [r3, r1]
            jump_5304:
/*0x5304*/      ldrb.w r1, [r5, #0xe5]
/*0x5308*/      movs r0, #0x52
/*0x530a*/      strb r0, [r3, r1]
/*0x530c*/      ldrb.w r1, [r5, #0xe4]
/*0x5310*/      movs r0, #0x4f
/*0x5312*/      strb r0, [r3, r1]
            jump_5314:
/*0x5314*/      pop {r4, r5, r6, r7, pc}
            jump_5316:
/*0x5316*/      lsls r2, r2, #0x1d
/*0x5318*/      bmi jump_531c
/*0x531a*/      strb r4, [r3, r0]
            jump_531c:
/*0x531c*/      strb r6, [r3, r1]
/*0x531e*/      pop {r4, r5, r6, r7, pc}

            data_5320:
/*0x5320*/  .word 0x20000060
            data_5324:
/*0x5324*/  .word 0x20000000
            data_5328:
/*0x5328*/  .word 0x20000734
            data_532c:
/*0x532c*/  .word 0x200001c4
            data_5330:
/*0x5330*/  .word 0x200002c4
            data_5334:
/*0x5334*/  .word 0x200006c0


            .thumb_func
            call_5338:
/*0x5338*/      ldr r3, [pc, #0x80] /* data_53bc */
/*0x533a*/      push {r4, lr}
/*0x533c*/      ldrb r0, [r3, #3]
/*0x533e*/      ldr r1, [pc, #0x80] /* data_53c0 */
/*0x5340*/      ldrb r0, [r1, r0]
/*0x5342*/      add.w r0, r0, r0, lsl #2
/*0x5346*/      adds r1, r0, r3
/*0x5348*/      ldr r0, [pc, #0x78] /* data_53c4 */
/*0x534a*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x534c*/      str r1, [r0]
/*0x534e*/      ldrb r2, [r1]
/*0x5350*/      cbnz r2, jump_5362
/*0x5352*/      ldrb r2, [r1, #1]
/*0x5354*/      cbnz r2, jump_5362
/*0x5356*/      movs r2, #0xff
/*0x5358*/      strb r2, [r1]
/*0x535a*/      ldr r1, [r0]
/*0x535c*/      strb r2, [r1, #1]
/*0x535e*/      ldr r1, [r0]
/*0x5360*/      strb r2, [r1, #2]
            jump_5362:
/*0x5362*/      ldrb r1, [r3, #3]
/*0x5364*/      cmp r1, #3
/*0x5366*/      bhi jump_5386
/*0x5368*/      movs r2, #0
/*0x536a*/      cmp r1, #1
/*0x536c*/      beq jump_5378
/*0x536e*/      cmp r1, #2
/*0x5370*/      beq jump_537c
/*0x5372*/      cmp r1, #3
/*0x5374*/      bne jump_53b2
/*0x5376*/      b jump_5382
            jump_5378:
/*0x5378*/      str r2, [r0, #4]
/*0x537a*/      b jump_53b2
            jump_537c:
/*0x537c*/      strb r2, [r0, #4]
/*0x537e*/      strb r2, [r0, #5]
/*0x5380*/      b jump_53b2
            jump_5382:
/*0x5382*/      movs r1, #0xd8
/*0x5384*/      b jump_539e
            jump_5386:
/*0x5386*/      cmp r1, #7
/*0x5388*/      bls jump_53b2
/*0x538a*/      bic r1, r1, #1
/*0x538e*/      cmp r1, #8
/*0x5390*/      beq jump_5382
/*0x5392*/      cmp r1, #0xa
/*0x5394*/      beq jump_539c
/*0x5396*/      cmp r1, #0xc
/*0x5398*/      bne jump_53b2
/*0x539a*/      b jump_53a6
            jump_539c:
/*0x539c*/      movs r1, #0x55
            jump_539e:
/*0x539e*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x53a0*/      bl mem_zero
/*0x53a4*/      b jump_53b2
            jump_53a6:
/*0x53a6*/      movs r1, #0x24
/*0x53a8*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x53aa*/      bl mem_zero
/*0x53ae*/      bl call_6d3c
            jump_53b2:
/*0x53b2*/      ldr r1, [pc, #0x14] /* data_53c8 */
/*0x53b4*/      movs r0, #1
/*0x53b6*/      strb r0, [r1]
/*0x53b8*/      pop {r4, pc}

/*0x53ba*/  .byte 0x00
/*0x53bb*/  .byte 0x00

            data_53bc:
/*0x53bc*/  .word 0x20000734
            data_53c0:
/*0x53c0*/  .word data_7b43
            data_53c4:
/*0x53c4*/  .word 0x20000090
            data_53c8:
/*0x53c8*/  .word 0x200006c0


            .thumb_func
            call_53cc:
/*0x53cc*/      ldr r0, [pc, #0x20] /* data_53f0 */
/*0x53ce*/      ldrb r0, [r0, #3]
/*0x53d0*/      cmp r0, #8
/*0x53d2*/      beq jump_53ea
/*0x53d4*/      bgt jump_53de
/*0x53d6*/      cbz r0, jump_53ea
/*0x53d8*/      cmp r0, #1
/*0x53da*/      bne jump_53e6
/*0x53dc*/      b jump_53ea
            jump_53de:
/*0x53de*/      cmp r0, #0xa
/*0x53e0*/      beq jump_53ea
/*0x53e2*/      cmp r0, #0xc
/*0x53e4*/      beq jump_53ea
            jump_53e6:
/*0x53e6*/      movs r0, #0
/*0x53e8*/      bx lr
            jump_53ea:
/*0x53ea*/      movs r0, #1
/*0x53ec*/      bx lr

/*0x53ee*/  .byte 0x00
/*0x53ef*/  .byte 0x00

            data_53f0:
/*0x53f0*/  .word 0x20000734


            .thumb_func
            call_53f4:
/*0x53f4*/      push {r4, r5, r6, lr}
/*0x53f6*/      ldr r5, [pc, #0x10c] /* data_5504 */
/*0x53f8*/      mov r4, r0
/*0x53fa*/      uxtb r1, r0
/*0x53fc*/      ldrb r0, [r5, #3]
/*0x53fe*/      ldr r3, [pc, #0x108] /* data_5508 */
/*0x5400*/      adds r2, r0, #1
/*0x5402*/      uxtb r2, r2
/*0x5404*/      cmp r1, #0x21
/*0x5406*/      beq jump_5492
/*0x5408*/      bgt jump_5424
/*0x540a*/      cmp r1, #0x1e
/*0x540c*/      beq jump_5454
/*0x540e*/      bgt jump_541a
/*0x5410*/      cmp r1, #6
/*0x5412*/      beq jump_5434
/*0x5414*/      cmp r1, #0x19
/*0x5416*/      bne jump_5472
/*0x5418*/      b jump_5434
            jump_541a:
/*0x541a*/      cmp r1, #0x1f
/*0x541c*/      beq jump_5454
/*0x541e*/      cmp r1, #0x20
/*0x5420*/      bne jump_5472
/*0x5422*/      b jump_5454
            jump_5424:
/*0x5424*/      cmp r1, #0x22
/*0x5426*/      beq jump_5488
/*0x5428*/      cmp r1, #0x29
/*0x542a*/      beq jump_5454
/*0x542c*/      cmp r1, #0x36
/*0x542e*/      beq jump_5434
/*0x5430*/      cmp r1, #0x37
/*0x5432*/      bne jump_5472
            jump_5434:
/*0x5434*/      ldr r2, [pc, #0xd4] /* data_550c */
/*0x5436*/      ldrb r0, [r2, r0]
/*0x5438*/      cmp r0, #0xff
/*0x543a*/      beq jump_54f8
/*0x543c*/      ldr r0, [pc, #0xc8] /* data_5508 */
/*0x543e*/      movs r2, #6
/*0x5440*/      cmp r1, #6
/*0x5442*/      ldr r0, [r0]
/*0x5444*/      beq jump_54be
/*0x5446*/      cmp r1, #0x19
/*0x5448*/      beq jump_54ae
/*0x544a*/      cmp r1, #0x36
/*0x544c*/      beq jump_54d2
/*0x544e*/      cmp r1, #0x37
/*0x5450*/      bne jump_54f8
/*0x5452*/      b jump_54ea
            jump_5454:
/*0x5454*/      bl call_53cc
/*0x5458*/      cmp r0, #0
/*0x545a*/      beq jump_5472
/*0x545c*/      cmp r1, #0x1e
/*0x545e*/      beq jump_5474
/*0x5460*/      cmp r1, #0x1f
/*0x5462*/      beq jump_5474
/*0x5464*/      cmp r1, #0x20
/*0x5466*/      beq jump_5474
/*0x5468*/      cmp r1, #0x29
/*0x546a*/      bne jump_5472
/*0x546c*/      ldr r1, [pc, #0xa0] /* data_5510 */
/*0x546e*/      movs r0, #1
/*0x5470*/      strb r0, [r1, #2]
            jump_5472:
/*0x5472*/      pop {r4, r5, r6, pc}
            jump_5474:
/*0x5474*/      subs r1, #0x1e
/*0x5476*/      ldr r0, [r3]
/*0x5478*/      uxtb r1, r1
/*0x547a*/      adds r4, r0, r1
/*0x547c*/      movs r2, #1
/*0x547e*/      ldrb r0, [r4]
/*0x5480*/      bl call_520c
/*0x5484*/      strb r0, [r4]
/*0x5486*/      b jump_54f8
            jump_5488:
/*0x5488*/      strb r2, [r5, #3]
/*0x548a*/      cmp r2, #3
/*0x548c*/      bls jump_549e
/*0x548e*/      movs r0, #0
/*0x5490*/      b jump_549c
            jump_5492:
/*0x5492*/      strb r2, [r5, #3]
/*0x5494*/      .short 0x1fd2 /* subs r2, r2, #7 */ 
/*0x5496*/      cmp r2, #7
/*0x5498*/      blo jump_549e
/*0x549a*/      movs r0, #7
            jump_549c:
/*0x549c*/      strb r0, [r5, #3]
            jump_549e:
/*0x549e*/      bl call_5338
/*0x54a2*/      bl call_55b0
/*0x54a6*/      mov r0, r4
/*0x54a8*/      bl call_5514
/*0x54ac*/      b jump_54f8
            jump_54ae:
/*0x54ae*/      ldrb r1, [r0, #3]
/*0x54b0*/      cmp r1, #8
/*0x54b2*/      bhs jump_54f8
/*0x54b4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x54b6*/      b jump_54c6
            jump_54b8:
/*0x54b8*/      bl call_6d3c
/*0x54bc*/      b jump_54f8
            jump_54be:
/*0x54be*/      ldrb r1, [r0, #3]
/*0x54c0*/      cmp r1, #1
/*0x54c2*/      bls jump_54f8
/*0x54c4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_54c6:
/*0x54c6*/      strb r1, [r0, #3]
/*0x54c8*/      ldrb r0, [r5, #3]
/*0x54ca*/      cmp.w r2, r0, lsr #1
/*0x54ce*/      beq jump_54b8
/*0x54d0*/      b jump_54f8
            jump_54d2:
/*0x54d2*/      ldrb r1, [r0, #4]
/*0x54d4*/      and r2, r1, #0xf
/*0x54d8*/      cmp r2, #5
/*0x54da*/      bhs jump_54f8
/*0x54dc*/      mov.w r2, #0x10000000
/*0x54e0*/      add.w r1, r2, r1, ror #4
/*0x54e4*/      ror.w r1, r1, #0x1c
/*0x54e8*/      b jump_54f6
            jump_54ea:
/*0x54ea*/      ldrb r1, [r0, #4]
/*0x54ec*/      lsls r2, r1, #0x1c
/*0x54ee*/      beq jump_54f8
/*0x54f0*/      subs r2, r1, #1
/*0x54f2*/      bfi r1, r2, #0, #4
            jump_54f6:
/*0x54f6*/      strb r1, [r0, #4]
            jump_54f8:
/*0x54f8*/      bl call_55bc
/*0x54fc*/      pop.w {r4, r5, r6, lr}
/*0x5500*/      b.w call_3bec

            data_5504:
/*0x5504*/  .word 0x20000734
            data_5508:
/*0x5508*/  .word 0x20000090
            data_550c:
/*0x550c*/  .word data_7b43
            data_5510:
/*0x5510*/  .word 0x200006c0


            .thumb_func
            call_5514:
/*0x5514*/      push {r4, r5, r6, lr}
/*0x5516*/      lsrs r1, r0, #0x18
/*0x5518*/      lsls r1, r1, #0x1e
/*0x551a*/      bpl jump_5566
/*0x551c*/      ldr r1, [pc, #0x84] /* data_55a4 */
/*0x551e*/      ldrb r1, [r1, #3]
/*0x5520*/      cmp r1, #7
/*0x5522*/      bls jump_5566
/*0x5524*/      ldr r5, [pc, #0x80] /* data_55a8 */
/*0x5526*/      and r2, r1, #1
/*0x552a*/      bic r3, r1, #1
/*0x552e*/      ldr r1, [r5]
/*0x5530*/      ubfx r0, r0, #0x10, #8
/*0x5534*/      cmp r3, #8
/*0x5536*/      beq jump_5568
/*0x5538*/      cmp r3, #0xa
/*0x553a*/      beq jump_557c
/*0x553c*/      cmp r3, #0xc
/*0x553e*/      bne jump_5566
/*0x5540*/      ldr r3, [pc, #0x68] /* data_55ac */
/*0x5542*/      ldrb r4, [r3, r0]
/*0x5544*/      cmp r4, #0xff
/*0x5546*/      beq jump_5566
/*0x5548*/      and r0, r4, #7
/*0x554c*/      add.w r0, r0, r0, lsl #2
/*0x5550*/      add r5, r0
/*0x5552*/      adds r5, #0xe
/*0x5554*/      cbz r2, jump_5558
/*0x5556*/      movs r1, #0
            jump_5558:
/*0x5558*/      mov r0, r5
/*0x555a*/      bl call_6f40
/*0x555e*/      lsrs r0, r4, #3
/*0x5560*/      strb r0, [r5, #3]
/*0x5562*/      movs r0, #1
/*0x5564*/      strb r0, [r5, #4]
            jump_5566:
/*0x5566*/      pop {r4, r5, r6, pc}
            jump_5568:
/*0x5568*/      cbz r2, jump_556c
/*0x556a*/      movs r1, #0
            jump_556c:
/*0x556c*/      add.w r0, r0, r0, lsl #1
/*0x5570*/      add r0, r5
/*0x5572*/      pop.w {r4, r5, r6, lr}
/*0x5576*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5578*/      b.w call_6f40
            jump_557c:
/*0x557c*/      ldr r3, [pc, #0x2c] /* data_55ac */
/*0x557e*/      subs r3, #0x48
/*0x5580*/      ldrb r0, [r3, r0]
/*0x5582*/      cmp r0, #0xff
/*0x5584*/      beq jump_5566
/*0x5586*/      cbz r2, jump_558a
/*0x5588*/      movs r1, #0
            jump_558a:
/*0x558a*/      add.w r0, r0, r0, lsl #1
/*0x558e*/      add.w r4, r5, r0, lsl #1
/*0x5592*/      adds r0, r4, #4
/*0x5594*/      bl call_6f40
/*0x5598*/      ldrh r0, [r4, #4]
/*0x559a*/      strh.w r0, [r4, #7]
/*0x559e*/      ldrb r0, [r4, #6]
/*0x55a0*/      strb r0, [r4, #9]
/*0x55a2*/      pop {r4, r5, r6, pc}

            data_55a4:
/*0x55a4*/  .word 0x20000734
            data_55a8:
/*0x55a8*/  .word 0x20000090
            data_55ac:
/*0x55ac*/  .word data_7c0b


            .thumb_func
            call_55b0:
/*0x55b0*/      movs r1, #0xd8
/*0x55b2*/      ldr r0, [pc, #4] /* data_55b8 */
/*0x55b4*/      b.w mem_zero

            data_55b8:
/*0x55b8*/  .word 0x20000332


            .thumb_func
            call_55bc:
/*0x55bc*/      push {r4, lr}
/*0x55be*/      bl call_4644
/*0x55c2*/      cmp r0, #6
/*0x55c4*/      bhs switch_55ec
/*0x55c6*/      tbb [pc, r0]

/*0x55ca*/  .byte 0x03 /* case switch_55d0 */
/*0x55cb*/  .byte 0x06 /* case switch_55d6 */
/*0x55cc*/  .byte 0x09 /* case switch_55dc */
/*0x55cd*/  .byte 0x0c /* case switch_55e2 */
/*0x55ce*/  .byte 0x11 /* case switch_55ec */
/*0x55cf*/  .byte 0x0f /* case switch_55e8 */

            switch_55d0:
/*0x55d0*/      bl call_3d74
/*0x55d4*/      b switch_55ec
            switch_55d6:
/*0x55d6*/      bl call_3c04
/*0x55da*/      b switch_55ec
            switch_55dc:
/*0x55dc*/      bl call_3aa8
/*0x55e0*/      b switch_55ec
            switch_55e2:
/*0x55e2*/      bl call_3d10
/*0x55e6*/      b switch_55ec
            switch_55e8:
/*0x55e8*/      bl call_3b24
            switch_55ec:
/*0x55ec*/      pop.w {r4, lr}
/*0x55f0*/      nop.w 
            jump_55f4:
/*0x55f4*/      push {r4, lr}
/*0x55f6*/      ldr r4, [pc, #0x1c] /* data_5614 */
/*0x55f8*/      ldrb r0, [r4, #0xb]
/*0x55fa*/      cbnz r0, jump_560c
/*0x55fc*/      ldr r0, [pc, #0x18] /* data_5618 */
/*0x55fe*/      ldrb r0, [r0]
/*0x5600*/      lsls r0, r0, #0x1e
/*0x5602*/      asrs r0, r0, #8
/*0x5604*/      lsrs r1, r0, #0x18
/*0x5606*/      movs r0, #0x29
/*0x5608*/      bl call_40d0
            jump_560c:
/*0x560c*/      movs r0, #1
/*0x560e*/      strb r0, [r4, #1]
/*0x5610*/      pop {r4, pc}

/*0x5612*/  .byte 0x00
/*0x5613*/  .byte 0x00

            data_5614:
/*0x5614*/  .word 0x200006c0
            data_5618:
/*0x5618*/  .word 0x20000010


            .thumb_func
            call_561c:
/*0x561c*/      push {r4, lr}
/*0x561e*/      ldr r4, [pc, #0x68] /* data_5688 */
/*0x5620*/      cbz r0, jump_5654
/*0x5622*/      movs r1, #0
/*0x5624*/      mov r0, r4
/*0x5626*/      bl call_377e
/*0x562a*/      movs r1, #0
/*0x562c*/      mov r0, r4
/*0x562e*/      bl call_376a
/*0x5632*/      mov r0, r4
/*0x5634*/      bl call_375c
/*0x5638*/      movs r0, #0x29
/*0x563a*/      bl call_5770
/*0x563e*/      bl call_5c30
/*0x5642*/      bl call_5808
/*0x5646*/      movs r0, #1
/*0x5648*/      bl call_6144
/*0x564c*/      pop.w {r4, lr}
/*0x5650*/      b.w jump_6324
            jump_5654:
/*0x5654*/      bl call_580c
/*0x5658*/      movs r0, #0
/*0x565a*/      bl call_6144
/*0x565e*/      movs r1, #0
/*0x5660*/      mov r0, r4
/*0x5662*/      bl call_3796
/*0x5666*/      mov r0, r4
/*0x5668*/      bl call_375c
/*0x566c*/      movs r1, #1
/*0x566e*/      mov r0, r4
/*0x5670*/      bl call_376a
/*0x5674*/      movs r1, #1
/*0x5676*/      mov r0, r4
/*0x5678*/      bl call_377e
/*0x567c*/      ldr r1, [pc, #0xc] /* data_568c */
/*0x567e*/      mov.w r0, #0x200
/*0x5682*/      str.w r0, [r1, #0x100]
/*0x5686*/      pop {r4, pc}

            data_5688:
/*0x5688*/  .word 0x40076000
            data_568c:
/*0x568c*/  .word 0xe000e004


            .thumb_func
            call_5690:
/*0x5690*/      push {r4, lr}
/*0x5692*/      movs r4, #0
/*0x5694*/      cmp r0, #2
/*0x5696*/      beq jump_56a0
/*0x5698*/      ldr r1, [pc, #0x24] /* data_56c0 */
/*0x569a*/      str r4, [r1, #0x40]
/*0x569c*/      str r4, [r1, #0x44]
/*0x569e*/      str r4, [r1, #0x48]
            jump_56a0:
/*0x56a0*/      cbz r0, jump_56ba
/*0x56a2*/      movs r0, #2
            jump_56a4:
/*0x56a4*/      bl call_4b1c
/*0x56a8*/      ldr r0, [pc, #0x14] /* data_56c0 */
/*0x56aa*/      adds r0, #0x40
/*0x56ac*/      strb r4, [r0, #4]
/*0x56ae*/      bl call_5338
/*0x56b2*/      pop.w {r4, lr}
/*0x56b6*/      b.w call_5ad4
            jump_56ba:
/*0x56ba*/      movs r0, #1
/*0x56bc*/      b jump_56a4

/*0x56be*/  .byte 0x00
/*0x56bf*/  .byte 0x00

            data_56c0:
/*0x56c0*/  .word 0x20000680


            .thumb_func
            call_56c4:
/*0x56c4*/      push {r4, lr}
/*0x56c6*/      movs r0, #0
/*0x56c8*/      mov.w r2, #0x10000
/*0x56cc*/      movs r3, #1
/*0x56ce*/      mov r1, r0
/*0x56d0*/      bl call_3888
/*0x56d4*/      pop.w {r4, lr}
/*0x56d8*/      movw r1, #0x8c9f
/*0x56dc*/      ldr r0, [pc, #4] /* data_56e4 */
/*0x56de*/      b.w call_3792

/*0x56e2*/  .byte 0x00
/*0x56e3*/  .byte 0x00

            data_56e4:
/*0x56e4*/  .word 0x40076000


            .thumb_func
            call_56e8:
/*0x56e8*/      push {r4, lr}
/*0x56ea*/      mov.w r1, #0x3400
/*0x56ee*/      movs r0, #0
/*0x56f0*/      bl call_57d8
/*0x56f4*/      ldr r1, [pc, #0x70] /* data_5768 */
/*0x56f6*/      ldr r0, [r1]
/*0x56f8*/      movw r2, #0xf8ff
/*0x56fc*/      ands r0, r2
/*0x56fe*/      ldr r2, [pc, #0x6c] /* data_576c */
/*0x5700*/      orr r0, r0, #0x300
/*0x5704*/      orrs r0, r2
/*0x5706*/      str r0, [r1]
/*0x5708*/      movs r2, #0
/*0x570a*/      mov r1, r2
/*0x570c*/      movs r0, #3
/*0x570e*/      bl call_5786
/*0x5712*/      mov r1, r0
/*0x5714*/      movs r0, #0x2b
/*0x5716*/      bl call_57b8
/*0x571a*/      movs r2, #0
/*0x571c*/      mov r1, r2
/*0x571e*/      movs r0, #3
/*0x5720*/      bl call_5786
/*0x5724*/      mov r1, r0
/*0x5726*/      movs r0, #0x2c
/*0x5728*/      bl call_57b8
/*0x572c*/      movs r2, #0
/*0x572e*/      movs r1, #1
/*0x5730*/      movs r0, #3
/*0x5732*/      bl call_5786
/*0x5736*/      mov r1, r0
/*0x5738*/      movs r0, #0x2a
/*0x573a*/      bl call_57b8
/*0x573e*/      movs r2, #0
/*0x5740*/      movs r1, #2
/*0x5742*/      movs r0, #3
/*0x5744*/      bl call_5786
/*0x5748*/      mov r1, r0
/*0x574a*/      movs r0, #0x29
/*0x574c*/      bl call_57b8
/*0x5750*/      movs r2, #0
/*0x5752*/      movs r1, #2
/*0x5754*/      movs r0, #3
/*0x5756*/      bl call_5786
/*0x575a*/      mov r1, r0
/*0x575c*/      pop.w {r4, lr}
/*0x5760*/      movs r0, #0x35
/*0x5762*/      b.w call_57b8

/*0x5766*/  .byte 0x00
/*0x5767*/  .byte 0x00

            data_5768:
/*0x5768*/  .word 0xe000ed0c
            data_576c:
/*0x576c*/  .word 0x05fa0000


            .thumb_func
            call_5770:
/*0x5770*/      and r2, r0, #0x1f
/*0x5774*/      movs r1, #1
/*0x5776*/      lsls r1, r2
/*0x5778*/      lsrs r0, r0, #5
/*0x577a*/      lsls r0, r0, #2
/*0x577c*/      add.w r0, r0, #-0x1fff2000
/*0x5780*/      str.w r1, [r0, #0x180]
/*0x5784*/      bx lr

            .thumb_func
            call_5786:
/*0x5786*/      push {r4, r5, lr}
/*0x5788*/      and r3, r0, #7
/*0x578c*/      rsb.w r4, r3, #7
/*0x5790*/      cmp r4, #4
/*0x5792*/      bls jump_5796
/*0x5794*/      movs r4, #4
            jump_5796:
/*0x5796*/      adds r0, r3, #4
/*0x5798*/      cmp r0, #7
/*0x579a*/      bhs jump_57a0
/*0x579c*/      movs r3, #0
/*0x579e*/      b jump_57a2
            jump_57a0:
/*0x57a0*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_57a2:
/*0x57a2*/      movs r5, #1
/*0x57a4*/      lsl.w r0, r5, r4
/*0x57a8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x57aa*/      ands r0, r1
/*0x57ac*/      lsls r0, r3
/*0x57ae*/      lsls r5, r3
/*0x57b0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x57b2*/      ands r5, r2
/*0x57b4*/      orrs r0, r5
/*0x57b6*/      pop {r4, r5, pc}

            .thumb_func
            call_57b8:
/*0x57b8*/      lsls r1, r1, #0x1c
/*0x57ba*/      lsrs r1, r1, #0x18
/*0x57bc*/      cmp r0, #0
/*0x57be*/      bge jump_57ce
/*0x57c0*/      and r0, r0, #0xf
/*0x57c4*/      add.w r0, r0, #-0x1fff2000
/*0x57c8*/      strb.w r1, [r0, #0xd14]
/*0x57cc*/      bx lr
            jump_57ce:
/*0x57ce*/      add.w r0, r0, #-0x1fff2000
/*0x57d2*/      strb.w r1, [r0, #0x400]
/*0x57d6*/      bx lr

            .thumb_func
            call_57d8:
/*0x57d8*/      ldr r2, [pc, #8] /* data_57e4 */
/*0x57da*/      ands r1, r2
/*0x57dc*/      orrs r1, r0
/*0x57de*/      ldr r0, [pc, #8] /* data_57e8 */
/*0x57e0*/      str r1, [r0]
/*0x57e2*/      bx lr

            data_57e4:
/*0x57e4*/  .word 0x1fffff80
            data_57e8:
/*0x57e8*/  .word 0xe000ed08


            .thumb_func
            call_57ec:
/*0x57ec*/      push {r4, lr}
/*0x57ee*/      bl call_4198
/*0x57f2*/      bl call_4114
/*0x57f6*/      cmp r0, #1
/*0x57f8*/      bne jump_5804
/*0x57fa*/      movs r0, #2
/*0x57fc*/      bl call_65fe
/*0x5800*/      cmp r0, #1
/*0x5802*/      beq jump_5806
            jump_5804:
/*0x5804*/      movs r0, #0
            jump_5806:
/*0x5806*/      pop {r4, pc}

            .thumb_func
            call_5808:
/*0x5808*/      b.w jump_41ec

            .thumb_func
            call_580c:
/*0x580c*/      b.w call_4234

            .thumb_func
            call_5810:
/*0x5810*/      push {r4, r5, r6, lr}
/*0x5812*/      ldr r4, [pc, #0xa4] /* data_58b8 */
/*0x5814*/      movs r5, #0
/*0x5816*/      ldrb r0, [r4, #6]
/*0x5818*/      cmp r0, #1
/*0x581a*/      beq jump_584e
/*0x581c*/      cmp r0, #2
/*0x581e*/      bne jump_58b6
/*0x5820*/      subs r1, r4, #4
/*0x5822*/      ldrh r0, [r1]
/*0x5824*/      cbz r0, jump_589e
/*0x5826*/      ldr r2, [pc, #0x94] /* data_58bc */
/*0x5828*/      ldr r2, [r2]
/*0x582a*/      cmp r2, #0
/*0x582c*/      bne jump_58b6
/*0x582e*/      cmp r0, #0xff
/*0x5830*/      bhi jump_5844
/*0x5832*/      ldr r2, [pc, #0x8c] /* data_58c0 */
/*0x5834*/      ldr r2, [r2]
/*0x5836*/      add.w r0, r2, r0, lsl #2
/*0x583a*/      movs r2, #7
/*0x583c*/      ldrb r0, [r0, #1]
/*0x583e*/      cmp.w r2, r0, lsr #5
/*0x5842*/      bne jump_58a6
            jump_5844:
/*0x5844*/      ldrb r0, [r4, #8]
/*0x5846*/      cmp r0, #1
/*0x5848*/      beq jump_58ae
/*0x584a*/      strh r5, [r1]
/*0x584c*/      b jump_58a6
            jump_584e:
/*0x584e*/      ldr r0, [pc, #0x74] /* data_58c4 */
/*0x5850*/      ldrb r0, [r0, #3]
/*0x5852*/      lsls r0, r0, #0x1e
/*0x5854*/      bmi jump_586c
/*0x5856*/      ldrb r0, [r4, #7]
/*0x5858*/      cmp r0, #1
/*0x585a*/      bne jump_586c
/*0x585c*/      bl call_4ab0
/*0x5860*/      cmp r0, #1
/*0x5862*/      bne jump_586c
/*0x5864*/      movs r0, #2
/*0x5866*/      strb r0, [r4, #7]
/*0x5868*/      ldr r0, [pc, #0x5c] /* data_58c8 */
/*0x586a*/      strh r5, [r0]
            jump_586c:
/*0x586c*/      ldrb r0, [r4, #7]
/*0x586e*/      cmp r0, #3
/*0x5870*/      beq jump_588e
/*0x5872*/      cmp r0, #6
/*0x5874*/      beq jump_587e
/*0x5876*/      cmp r0, #7
/*0x5878*/      beq jump_587e
/*0x587a*/      cmp r0, #8
/*0x587c*/      bne jump_58b6
            jump_587e:
/*0x587e*/      bl call_4ab0
/*0x5882*/      cmp r0, #1
/*0x5884*/      bne jump_58b6
/*0x5886*/      pop.w {r4, r5, r6, lr}
/*0x588a*/      b.w jump_59f4
            jump_588e:
/*0x588e*/      bl call_4ab0
/*0x5892*/      cmp r0, #1
/*0x5894*/      bne jump_58b6
/*0x5896*/      pop.w {r4, r5, r6, lr}
/*0x589a*/      b.w jump_71b4
            jump_589e:
/*0x589e*/      ldrb r0, [r1, #2]
/*0x58a0*/      movs r1, #0
/*0x58a2*/      bl call_3d90
            jump_58a6:
/*0x58a6*/      pop.w {r4, r5, r6, lr}
/*0x58aa*/      b.w jump_7088
            jump_58ae:
/*0x58ae*/      pop.w {r4, r5, r6, lr}
/*0x58b2*/      b.w call_5ad4
            jump_58b6:
/*0x58b6*/      pop {r4, r5, r6, pc}

            data_58b8:
/*0x58b8*/  .word 0x200019d4
            data_58bc:
/*0x58bc*/  .word 0x20000064
            data_58c0:
/*0x58c0*/  .word 0x2000005c
            data_58c4:
/*0x58c4*/  .word 0x20000058
            data_58c8:
/*0x58c8*/  .word 0x20000020


            .thumb_func
            call_58cc:
/*0x58cc*/      ldr r0, [pc, #0x28] /* data_58f8 */
/*0x58ce*/      push {r4, lr}
/*0x58d0*/      ldrb r0, [r0, #6]
/*0x58d2*/      cmp r0, #1
/*0x58d4*/      beq jump_58f2
/*0x58d6*/      ldr r0, [pc, #0x24] /* data_58fc */
/*0x58d8*/      ldr r0, [r0]
/*0x58da*/      bl call_4a1e
/*0x58de*/      movs r1, #3
/*0x58e0*/      bl call_5224
/*0x58e4*/      cmp r0, #0xff
/*0x58e6*/      beq jump_58f2
/*0x58e8*/      ldr r1, [pc, #0x10] /* data_58fc */
/*0x58ea*/      bl call_4a14
/*0x58ee*/      movs r0, #1
/*0x58f0*/      pop {r4, pc}
            jump_58f2:
/*0x58f2*/      movs r0, #0
/*0x58f4*/      pop {r4, pc}

/*0x58f6*/  .byte 0x00
/*0x58f7*/  .byte 0x00

            data_58f8:
/*0x58f8*/  .word 0x200019d4
            data_58fc:
/*0x58fc*/  .word 0x20000058


            .thumb_func
            call_5900:
/*0x5900*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5904*/      ldr r4, [pc, #0xdc] /* data_59e4 */
/*0x5906*/      ldr r5, [pc, #0xe0] /* data_59e8 */
/*0x5908*/      subs r6, r4, #4
/*0x590a*/      ldrb r0, [r4, #6]
/*0x590c*/      cbz r0, jump_5918
/*0x590e*/      cmp r0, #1
/*0x5910*/      beq jump_598a
/*0x5912*/      cmp r0, #2
/*0x5914*/      bne jump_59ae
/*0x5916*/      b jump_5958
            jump_5918:
/*0x5918*/      bl call_6fa4
/*0x591c*/      mov r7, r0
/*0x591e*/      cmp r0, #0x60
/*0x5920*/      bhs jump_59ae
/*0x5922*/      ldrb r0, [r5, #3]
/*0x5924*/      lsls r0, r0, #0x1e
/*0x5926*/      bpl jump_59da
/*0x5928*/      ldrb r0, [r4, #6]
/*0x592a*/      cbz r0, jump_5932
/*0x592c*/      movs r0, #0
/*0x592e*/      bl call_4678
            jump_5932:
/*0x5932*/      ldr r0, [r5]
/*0x5934*/      bl call_4a1e
/*0x5938*/      strh r0, [r4, #4]
/*0x593a*/      movs r0, #2
/*0x593c*/      strb r0, [r4, #6]
/*0x593e*/      ldr r0, [pc, #0xac] /* data_59ec */
/*0x5940*/      add.w r0, r0, r7, lsl #1
/*0x5944*/      ldrb.w r0, [r0, #0x29]
/*0x5948*/      lsrs r0, r0, #5
/*0x594a*/      strb r0, [r4, #8]
/*0x594c*/      movs r0, #0
/*0x594e*/      strh r0, [r6]
/*0x5950*/      strb r7, [r6, #2]
/*0x5952*/      bl call_6ff0
/*0x5956*/      b jump_59da
            jump_5958:
/*0x5958*/      ldrb r0, [r5, #3]
/*0x595a*/      lsls r1, r0, #0x1e
/*0x595c*/      ldr r0, [pc, #0x88] /* data_59e8 */
/*0x595e*/      ldr r0, [r0]
/*0x5960*/      bpl jump_5978
/*0x5962*/      bl call_4a1e
/*0x5966*/      ldrh r1, [r4, #4]
/*0x5968*/      cmp r0, r1
/*0x596a*/      bne jump_5918
/*0x596c*/      ldrb r0, [r4, #8]
/*0x596e*/      cmp r0, #3
/*0x5970*/      bne jump_5918
            jump_5972:
/*0x5972*/      bl call_5ad4
/*0x5976*/      b jump_59da
            jump_5978:
/*0x5978*/      bl call_4a1e
/*0x597c*/      ldrh r1, [r4, #4]
/*0x597e*/      cmp r0, r1
/*0x5980*/      bne jump_59ae
/*0x5982*/      ldrb r0, [r4, #8]
/*0x5984*/      cmp r0, #2
/*0x5986*/      beq jump_5972
/*0x5988*/      b jump_59da
            jump_598a:
/*0x598a*/      bl call_4ee0
/*0x598e*/      cbnz r0, jump_59d6
/*0x5990*/      ldrb r0, [r4, #7]
/*0x5992*/      cmp r0, #5
/*0x5994*/      beq jump_59b4
/*0x5996*/      ldrb r1, [r5, #3]
/*0x5998*/      lsls r1, r1, #0x1e
/*0x599a*/      bpl jump_59ae
/*0x599c*/      cmp r0, #1
/*0x599e*/      beq jump_59da
/*0x59a0*/      movs r7, #1
/*0x59a2*/      cmp r0, #2
/*0x59a4*/      beq jump_59bc
/*0x59a6*/      cmp r0, #3
/*0x59a8*/      beq jump_59d8
/*0x59aa*/      cmp r0, #4
/*0x59ac*/      beq jump_59de
            jump_59ae:
/*0x59ae*/      movs r0, #0
            jump_59b0:
/*0x59b0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_59b4:
/*0x59b4*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x59b8*/      b.w jump_7140
            jump_59bc:
/*0x59bc*/      bl call_7004
/*0x59c0*/      ldrb r0, [r6, #2]
/*0x59c2*/      cmp r0, #0x60
/*0x59c4*/      beq jump_59d8
/*0x59c6*/      ldr r0, [r5]
/*0x59c8*/      bl call_4a1e
/*0x59cc*/      strh r0, [r4, #4]
/*0x59ce*/      movs r0, #3
/*0x59d0*/      strb r0, [r4, #7]
/*0x59d2*/      ldr r0, [pc, #0x1c] /* data_59f0 */
/*0x59d4*/      strb r7, [r0]
            jump_59d6:
/*0x59d6*/      b jump_59da
            jump_59d8:
/*0x59d8*/      strb r7, [r4, #7]
            jump_59da:
/*0x59da*/      movs r0, #1
/*0x59dc*/      b jump_59b0
            jump_59de:
/*0x59de*/      movs r0, #5
/*0x59e0*/      strb r0, [r4, #7]
/*0x59e2*/      b jump_59b4

            data_59e4:
/*0x59e4*/  .word 0x200019d4
            data_59e8:
/*0x59e8*/  .word 0x20000058
            data_59ec:
/*0x59ec*/  .word 0x20000734
            data_59f0:
/*0x59f0*/  .word 0x200006c0

            jump_59f4:
/*0x59f4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x59f8*/      ldr r5, [pc, #0xb0] /* data_5aac */
/*0x59fa*/      mov.w r8, #1
/*0x59fe*/      ldrb r0, [r5, #7]
/*0x5a00*/      cmp r0, #8
/*0x5a02*/      beq jump_5a98
/*0x5a04*/      subs r6, r5, #4
/*0x5a06*/      ldr r1, [pc, #0xa8] /* data_5ab0 */
/*0x5a08*/      ldrb r0, [r6, #2]
/*0x5a0a*/      ldr r7, [pc, #0xa8] /* data_5ab4 */
/*0x5a0c*/      add.w r4, r1, r0, lsl #1
/*0x5a10*/      mov r0, r5
/*0x5a12*/      ldrh r1, [r6]
/*0x5a14*/      ldrh r0, [r0, #4]
/*0x5a16*/      adds r4, #0x28
/*0x5a18*/      cmp r1, #2
/*0x5a1a*/      bne jump_5a3a
/*0x5a1c*/      ldr r2, [r7]
/*0x5a1e*/      ldrh r1, [r2]
/*0x5a20*/      ldrh r2, [r2, #4]
/*0x5a22*/      ubfx r1, r1, #0, #0xa
/*0x5a26*/      ubfx r2, r2, #0, #0xa
/*0x5a2a*/      cmp r1, r2
/*0x5a2c*/      bne jump_5a3a
/*0x5a2e*/      bl call_5224
/*0x5a32*/      movw r0, #0xffff
/*0x5a36*/      strh r0, [r4]
/*0x5a38*/      b jump_5a7e
            jump_5a3a:
/*0x5a3a*/      movs r1, #0xff
/*0x5a3c*/      bl call_5224
/*0x5a40*/      ldrb r0, [r5, #8]
/*0x5a42*/      cmp r0, #1
/*0x5a44*/      beq jump_5a90
/*0x5a46*/      bl call_6f80
            jump_5a4a:
/*0x5a4a*/      ldrh r1, [r6]
/*0x5a4c*/      ldr r2, [r7]
/*0x5a4e*/      add.w r1, r2, r1, lsl #2
/*0x5a52*/      mov.w r2, #0x1c00
/*0x5a56*/      strh r0, [r1, #-0x2]
/*0x5a5a*/      ldrb r1, [r5, #8]
/*0x5a5c*/      ldrh r0, [r5, #4]
/*0x5a5e*/      orr.w r1, r2, r1, lsl #13
/*0x5a62*/      orrs r0, r1
/*0x5a64*/      strh r0, [r4]
/*0x5a66*/      ldrh r0, [r6]
/*0x5a68*/      cmp r0, #0xff
/*0x5a6a*/      bhi jump_5a76
/*0x5a6c*/      ldr r2, [r7]
/*0x5a6e*/      mov.w r1, #0xfc00
/*0x5a72*/      strh.w r1, [r2, r0, lsl #2]
            jump_5a76:
/*0x5a76*/      ldrb r0, [r6, #2]
/*0x5a78*/      movs r1, #1
/*0x5a7a*/      bl call_3d90
            jump_5a7e:
/*0x5a7e*/      bl call_3bec
/*0x5a82*/      ldrb r0, [r5, #7]
/*0x5a84*/      cmp r0, #7
/*0x5a86*/      beq jump_5a94
/*0x5a88*/      strb.w r8, [r5, #7]
            jump_5a8c:
/*0x5a8c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5a90:
/*0x5a90*/      movs r0, #0
/*0x5a92*/      b jump_5a4a
            jump_5a94:
/*0x5a94*/      movs r0, #8
/*0x5a96*/      strb r0, [r5, #7]
            jump_5a98:
/*0x5a98*/      ldr r1, [pc, #0x1c] /* data_5ab8 */
/*0x5a9a*/      movs r0, #0
/*0x5a9c*/      strb r0, [r5, #6]
/*0x5a9e*/      str r0, [r1]
/*0x5aa0*/      ldr r1, [pc, #0x18] /* data_5abc */
/*0x5aa2*/      strb r0, [r5, #7]
/*0x5aa4*/      strb.w r8, [r1]
/*0x5aa8*/      b jump_5a8c

/*0x5aaa*/  .byte 0x00
/*0x5aab*/  .byte 0x00

            data_5aac:
/*0x5aac*/  .word 0x200019d4
            data_5ab0:
/*0x5ab0*/  .word 0x20000734
            data_5ab4:
/*0x5ab4*/  .word 0x2000005c
            data_5ab8:
/*0x5ab8*/  .word 0x20000064
            data_5abc:
/*0x5abc*/  .word 0x200006c0


            .thumb_func
            call_5ac0:
/*0x5ac0*/      ldr r0, [pc, #0xc] /* data_5ad0 */
/*0x5ac2*/      ldrb r1, [r0, #6]
/*0x5ac4*/      cmp r1, #0
/*0x5ac6*/      bne jump_5ace
/*0x5ac8*/      movs r1, #1
/*0x5aca*/      strb r1, [r0, #6]
/*0x5acc*/      strb r1, [r0, #7]
            jump_5ace:
/*0x5ace*/      bx lr

            data_5ad0:
/*0x5ad0*/  .word 0x200019d4


            .thumb_func
            call_5ad4:
/*0x5ad4*/      push {r3, r4, r5, r6, r7, lr}
/*0x5ad6*/      ldr r6, [pc, #0x78] /* data_5b50 */
/*0x5ad8*/      movs r7, #0
/*0x5ada*/      ldrb r0, [r6, #6]
/*0x5adc*/      cmp r0, #2
/*0x5ade*/      bne jump_5b4c
/*0x5ae0*/      subs r5, r6, #4
/*0x5ae2*/      ldrh r0, [r5]
/*0x5ae4*/      cbz r0, jump_5b4c
/*0x5ae6*/      ldr r1, [pc, #0x6c] /* data_5b54 */
/*0x5ae8*/      str r7, [sp]
/*0x5aea*/      ldr r1, [r1]
/*0x5aec*/      add.w r4, r1, r0, lsl #2
/*0x5af0*/      ldrb.w r0, [sp, #3]
/*0x5af4*/      orr r0, r0, #5
/*0x5af8*/      strb.w r0, [sp, #3]
/*0x5afc*/      b jump_5b42
            jump_5afe:
/*0x5afe*/      ldrb r0, [r4, #1]
/*0x5b00*/      lsrs r0, r0, #5
/*0x5b02*/      cmp r0, #2
/*0x5b04*/      beq jump_5b0c
/*0x5b06*/      cmp r0, #7
/*0x5b08*/      bne jump_5b3a
/*0x5b0a*/      b jump_5b36
            jump_5b0c:
/*0x5b0c*/      ldrh r0, [r4]
/*0x5b0e*/      mov r1, sp
/*0x5b10*/      bl call_4a14
/*0x5b14*/      ldrb.w r0, [sp, #1]
/*0x5b18*/      lsls r0, r0, #0x1f
/*0x5b1a*/      ldrb.w r0, [sp]
/*0x5b1e*/      beq jump_5b26
/*0x5b20*/      bl call_46d4
/*0x5b24*/      b jump_5b2a
            jump_5b26:
/*0x5b26*/      ldr r1, [pc, #0x30] /* data_5b58 */
/*0x5b28*/      ldrb r0, [r1, r0]
            jump_5b2a:
/*0x5b2a*/      strb.w r0, [sp, #2]
/*0x5b2e*/      ldr r0, [sp]
/*0x5b30*/      bl call_4780
/*0x5b34*/      b jump_5b3a
            jump_5b36:
/*0x5b36*/      movs r0, #0xff
/*0x5b38*/      strh r0, [r5]
            jump_5b3a:
/*0x5b3a*/      ldrh r0, [r5]
/*0x5b3c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5b3e*/      strh r0, [r5]
/*0x5b40*/      .short 0x1d24 /* adds r4, r4, #4 */ 
            jump_5b42:
/*0x5b42*/      ldrh r0, [r5]
/*0x5b44*/      cmp r0, #0xff
/*0x5b46*/      bls jump_5afe
/*0x5b48*/      bl call_6ff0
            jump_5b4c:
/*0x5b4c*/      strb r7, [r6, #6]
/*0x5b4e*/      pop {r3, r4, r5, r6, r7, pc}

            data_5b50:
/*0x5b50*/  .word 0x200019d4
            data_5b54:
/*0x5b54*/  .word 0x2000005c
            data_5b58:
/*0x5b58*/  .word 0x200001c4


            .thumb_func
            call_5b5c:
/*0x5b5c*/      ldr r0, [pc, #0x3c] /* data_5b9c */
/*0x5b5e*/      push {r4, lr}
/*0x5b60*/      ldr r0, [r0]
/*0x5b62*/      bl call_4a1e
/*0x5b66*/      mov r4, r0
/*0x5b68*/      movs r1, #3
/*0x5b6a*/      bl call_5224
/*0x5b6e*/      cmp r0, #0xff
/*0x5b70*/      beq jump_5b7c
/*0x5b72*/      movs r1, #0xff
/*0x5b74*/      mov r0, r4
/*0x5b76*/      bl call_5224
/*0x5b7a*/      b jump_5b90
            jump_5b7c:
/*0x5b7c*/      bl call_6fa4
/*0x5b80*/      cmp r0, #0x60
/*0x5b82*/      bhs jump_5b98
/*0x5b84*/      ldr r2, [pc, #0x18] /* data_5ba0 */
/*0x5b86*/      movw r1, #0xffff
/*0x5b8a*/      add.w r0, r2, r0, lsl #1
/*0x5b8e*/      strh r1, [r0, #0x28]
            jump_5b90:
/*0x5b90*/      bl call_3bec
/*0x5b94*/      movs r0, #1
/*0x5b96*/      pop {r4, pc}
            jump_5b98:
/*0x5b98*/      movs r0, #0
/*0x5b9a*/      pop {r4, pc}

            data_5b9c:
/*0x5b9c*/  .word 0x20000058
            data_5ba0:
/*0x5ba0*/  .word 0x20000734


            .thumb_func
            call_5ba4:
/*0x5ba4*/      push {r3, r4, r5, lr}
/*0x5ba6*/      ldr r4, [pc, #0x30] /* data_5bd8 */
/*0x5ba8*/      movs r5, #0x48
/*0x5baa*/      b jump_5bce
            jump_5bac:
/*0x5bac*/      mov r1, sp
/*0x5bae*/      mov r0, r5
/*0x5bb0*/      bl call_5bdc
/*0x5bb4*/      ldrb.w r0, [sp, #2]
/*0x5bb8*/      strb r0, [r4]
/*0x5bba*/      sub.w r0, r4, #0x48
/*0x5bbe*/      ldrb.w r1, [sp, #1]
/*0x5bc2*/      strb r1, [r0]
/*0x5bc4*/      subs r0, #0x48
/*0x5bc6*/      ldrb.w r1, [sp]
/*0x5bca*/      strb r1, [r0]
/*0x5bcc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_5bce:
/*0x5bce*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5bd0*/      uxtb r5, r5
/*0x5bd2*/      bhs jump_5bac
/*0x5bd4*/      pop {r3, r4, r5, pc}

/*0x5bd6*/  .byte 0x00
/*0x5bd7*/  .byte 0x00

            data_5bd8:
/*0x5bd8*/  .word 0x20000409


            .thumb_func
            call_5bdc:
/*0x5bdc*/      ldr r2, [pc, #0x30] /* data_5c10 */
/*0x5bde*/      movs r3, #0xd
/*0x5be0*/      ldrb r0, [r2, r0]
/*0x5be2*/      and r2, r0, #7
/*0x5be6*/      lsrs r0, r0, #3
/*0x5be8*/      rsb r0, r0, r0, lsl #8
/*0x5bec*/      udiv r0, r0, r3
/*0x5bf0*/      uxtb r0, r0
/*0x5bf2*/      strb r0, [r1]
/*0x5bf4*/      cmp r2, #4
/*0x5bf6*/      beq jump_5c0a
/*0x5bf8*/      rsb.w r2, r2, #5
/*0x5bfc*/      movs r3, #0x2b
/*0x5bfe*/      muls r2, r3, r2
/*0x5c00*/      uxtb r3, r2
/*0x5c02*/      mov r2, r1
/*0x5c04*/      mov r1, r3
/*0x5c06*/      b.w call_3fe8
            jump_5c0a:
/*0x5c0a*/      strb r0, [r1, #1]
/*0x5c0c*/      strb r0, [r1, #2]
/*0x5c0e*/      bx lr

            data_5c10:
/*0x5c10*/  .word data_7c0b


            .thumb_func
            call_5c14:
/*0x5c14*/      ldr r1, [pc, #4] /* data_5c1c */
/*0x5c16*/      strb r0, [r1]
/*0x5c18*/      b.w jump_55f4

            data_5c1c:
/*0x5c1c*/  .word 0x20000010


            .thumb_func
            call_5c20:
/*0x5c20*/      mov.w r2, #0x200
/*0x5c24*/      movs r1, #0
/*0x5c26*/      lsls r0, r2, #9
/*0x5c28*/      movs r3, #1
/*0x5c2a*/      b.w call_3888

/*0x5c2e*/  .byte 0x00
/*0x5c2f*/  .byte 0x00


            .thumb_func
            call_5c30:
/*0x5c30*/      push {r4, lr}
/*0x5c32*/      movs r2, #0
/*0x5c34*/      movs r1, #1
/*0x5c36*/      ldr r0, [pc, #0x14] /* data_5c4c */
/*0x5c38*/      bl call_4578
/*0x5c3c*/      movs r2, #0
/*0x5c3e*/      pop.w {r4, lr}
/*0x5c42*/      mov r1, r2
/*0x5c44*/      movs r0, #2
/*0x5c46*/      b.w call_379c

/*0x5c4a*/  .byte 0x00
/*0x5c4b*/  .byte 0x00

            data_5c4c:
/*0x5c4c*/  .word 0x400b4000


            .thumb_func
            call_5c50:
/*0x5c50*/      push {r4, lr}
/*0x5c52*/      movs r2, #2
/*0x5c54*/      movs r1, #1
/*0x5c56*/      ldr r0, [pc, #0x14] /* data_5c6c */
/*0x5c58*/      bl call_4578
/*0x5c5c*/      movs r2, #4
/*0x5c5e*/      movs r1, #0
/*0x5c60*/      pop.w {r4, lr}
/*0x5c64*/      movs r0, #2
/*0x5c66*/      b.w call_379c

/*0x5c6a*/  .byte 0x00
/*0x5c6b*/  .byte 0x00

            data_5c6c:
/*0x5c6c*/  .word 0x400b4000


            .thumb_func
            call_5c70:
/*0x5c70*/      push {r4, r5, r6, lr}
/*0x5c72*/      ldr r1, [pc, #0x34] /* data_5ca8 */
/*0x5c74*/      ldr r4, [r1]
/*0x5c76*/      ldr r5, [pc, #0x30] /* data_5ca8 */
/*0x5c78*/      adds r5, #0x48
/*0x5c7a*/      ldr r3, [r5]
/*0x5c7c*/      movs r2, #1
/*0x5c7e*/      str r2, [r1]
/*0x5c80*/      movs r2, #0
/*0x5c82*/      str r2, [r5]
/*0x5c84*/      ldr r6, [pc, #0x24] /* data_5cac */
/*0x5c86*/      str.w r2, [r6, #0x9c]
/*0x5c8a*/      str.w r2, [r6, #0x8c]
/*0x5c8e*/      str r4, [r1]
/*0x5c90*/      ldr r1, [pc, #0x1c] /* data_5cb0 */
/*0x5c92*/      ldr r2, [r1]
/*0x5c94*/      orr r2, r2, #4
/*0x5c98*/      str r2, [r1]
/*0x5c9a*/      cbz r0, jump_5ca2
/*0x5c9c*/      wfi 
            jump_5c9e:
/*0x5c9e*/      str r3, [r5]
/*0x5ca0*/      pop {r4, r5, r6, pc}
            jump_5ca2:
/*0x5ca2*/      wfe 
/*0x5ca4*/      b jump_5c9e

/*0x5ca6*/  .byte 0x00
/*0x5ca7*/  .byte 0x00

            data_5ca8:
/*0x5ca8*/  .word 0x43100618
            data_5cac:
/*0x5cac*/  .word 0x42d42000
            data_5cb0:
/*0x5cb0*/  .word 0xe000ed10

            jump_5cb4:
/*0x5cb4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5cb8*/      ldr r4, [pc, #0x38] /* data_5cf4 */
/*0x5cba*/      ldr r7, [r4]
/*0x5cbc*/      ldr r5, [pc, #0x34] /* data_5cf4 */
/*0x5cbe*/      adds r5, #0x48
/*0x5cc0*/      ldr r6, [r5]
/*0x5cc2*/      mov.w sb, #1
/*0x5cc6*/      str.w sb, [r4]
/*0x5cca*/      mov.w r8, #0
/*0x5cce*/      str.w r8, [r5]
/*0x5cd2*/      bl call_5ee4
/*0x5cd6*/      ldr r0, [pc, #0x20] /* data_5cf8 */
/*0x5cd8*/      str.w r8, [r0, #0x9c]
/*0x5cdc*/      str.w sb, [r0, #0x8c]
/*0x5ce0*/      str r7, [r4]
/*0x5ce2*/      ldr r0, [pc, #0x18] /* data_5cfc */
/*0x5ce4*/      ldr r1, [r0]
/*0x5ce6*/      orr r1, r1, #4
/*0x5cea*/      str r1, [r0]
/*0x5cec*/      wfe 
/*0x5cee*/      str r6, [r5]
/*0x5cf0*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5cf4:
/*0x5cf4*/  .word 0x43100618
            data_5cf8:
/*0x5cf8*/  .word 0x42d42000
            data_5cfc:
/*0x5cfc*/  .word 0xe000ed10


            .thumb_func
            call_5d00:
/*0x5d00*/      ldr r1, [pc, #0x10] /* data_5d14 */
/*0x5d02*/      ldr r2, [r1]
/*0x5d04*/      bic r2, r2, #4
/*0x5d08*/      str r2, [r1]
/*0x5d0a*/      cbz r0, jump_5d10
/*0x5d0c*/      wfi 
/*0x5d0e*/      bx lr
            jump_5d10:
/*0x5d10*/      wfe 
/*0x5d12*/      bx lr

            data_5d14:
/*0x5d14*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x5d18*/      push {r4, r5, r6, lr}
/*0x5d1a*/      ldr r6, [pc, #0xd4] /* data_5df0 */
/*0x5d1c*/      ldrb r0, [r6]
/*0x5d1e*/      cmp r0, #1
/*0x5d20*/      bne jump_5ddc
/*0x5d22*/      ldr r5, [pc, #0xd0] /* data_5df4 */
/*0x5d24*/      movs r4, #0
/*0x5d26*/      mov r0, r5
/*0x5d28*/      ldrb r2, [r5]
/*0x5d2a*/      ldrb r0, [r0, #1]
/*0x5d2c*/      mov r1, r4
/*0x5d2e*/      cmp r2, #0x10
/*0x5d30*/      beq jump_5d3c
/*0x5d32*/      cmp r2, #0x11
/*0x5d34*/      beq jump_5d46
/*0x5d36*/      cmp r2, #0x12
/*0x5d38*/      bne jump_5dde
/*0x5d3a*/      b jump_5d4c
            jump_5d3c:
/*0x5d3c*/      cmp r0, #2
/*0x5d3e*/      bne jump_5dde
/*0x5d40*/      str r1, [r5, #4]
/*0x5d42*/      movs r1, #4
/*0x5d44*/      b jump_5dc0
            jump_5d46:
/*0x5d46*/      bl call_5dfc
/*0x5d4a*/      b jump_5dc8
            jump_5d4c:
/*0x5d4c*/      mov.w r3, #0x400
/*0x5d50*/      cmp r0, #0x20
/*0x5d52*/      blo jump_5d72
/*0x5d54*/      sub.w r2, r0, #0x1f
/*0x5d58*/      rsb r2, r2, r2, lsl #4
/*0x5d5c*/      cmp.w r3, r2, lsl #2
/*0x5d60*/      blt jump_5d72
/*0x5d62*/      rsb r0, r0, r0, lsl #4
/*0x5d66*/      mov.w r1, #0x2880
/*0x5d6a*/      add.w r0, r1, r0, lsl #2
/*0x5d6e*/      movs r1, #0x3c
/*0x5d70*/      b jump_5dc2
            jump_5d72:
/*0x5d72*/      cbz r0, jump_5d7e
/*0x5d74*/      cmp r0, #1
/*0x5d76*/      beq jump_5db4
/*0x5d78*/      cmp r0, #2
/*0x5d7a*/      bne jump_5dde
/*0x5d7c*/      b jump_5dbc
            jump_5d7e:
/*0x5d7e*/      ldrb.w r0, [r1, #0x10f]
/*0x5d82*/      cmp r0, #0xaa
/*0x5d84*/      beq jump_5daa
/*0x5d86*/      ldrb r2, [r3]
/*0x5d88*/      mov r0, r3
/*0x5d8a*/      cmp r2, #4
/*0x5d8c*/      beq jump_5db0
/*0x5d8e*/      movs r2, #0x20
/*0x5d90*/      mov r1, r3
/*0x5d92*/      adds r0, r5, #4
/*0x5d94*/      bl memcpy
/*0x5d98*/      ldr r0, [pc, #0x5c] /* data_5df8 */
/*0x5d9a*/      ldr.w r1, [r0, #0x180]
/*0x5d9e*/      str r1, [r5, #0x24]
/*0x5da0*/      ldr.w r0, [r0, #0x18c]
/*0x5da4*/      movs r1, #0x28
/*0x5da6*/      str r0, [r5, #0x28]
/*0x5da8*/      b jump_5dc0
            jump_5daa:
/*0x5daa*/      movs r1, #0x10
/*0x5dac*/      lsls r0, r1, #4
/*0x5dae*/      b jump_5dc2
            jump_5db0:
/*0x5db0*/      movs r1, #0x34
/*0x5db2*/      b jump_5dc2
            jump_5db4:
/*0x5db4*/      movs r1, #4
/*0x5db6*/      mov.w r0, #0x3c00
/*0x5dba*/      b jump_5dc2
            jump_5dbc:
/*0x5dbc*/      movs r1, #1
/*0x5dbe*/      strb r1, [r5, #4]
            jump_5dc0:
/*0x5dc0*/      adds r0, r5, #4
            jump_5dc2:
/*0x5dc2*/      bl call_5e80
/*0x5dc6*/      movs r4, #1
            jump_5dc8:
/*0x5dc8*/      ldrb r0, [r6]
/*0x5dca*/      cmp r0, #1
/*0x5dcc*/      bne jump_5ddc
/*0x5dce*/      cbz r4, jump_5dde
/*0x5dd0*/      movs r1, #0x3c
/*0x5dd2*/      adds r0, r5, #4
            jump_5dd4:
/*0x5dd4*/      bl mem_zero
/*0x5dd8*/      movs r0, #2
/*0x5dda*/      strb r0, [r6]
            jump_5ddc:
/*0x5ddc*/      pop {r4, r5, r6, pc}
            jump_5dde:
/*0x5dde*/      ldr r0, [r5]
/*0x5de0*/      str r0, [r5, #4]
/*0x5de2*/      movw r0, #0xaaff
/*0x5de6*/      str r0, [r5]
/*0x5de8*/      ldr r0, [pc, #8] /* data_5df4 */
/*0x5dea*/      movs r1, #0x38
/*0x5dec*/      adds r0, #8
/*0x5dee*/      b jump_5dd4

            data_5df0:
/*0x5df0*/  .word 0x20000050
            data_5df4:
/*0x5df4*/  .word 0x20000680
            data_5df8:
/*0x5df8*/  .word 0x40080000


            .thumb_func
            call_5dfc:
/*0x5dfc*/      push {r4, lr}
/*0x5dfe*/      ldr r1, [pc, #0x6c] /* data_5e6c */
/*0x5e00*/      cbz r0, jump_5e1e
/*0x5e02*/      cmp r0, #1
/*0x5e04*/      beq jump_5e22
/*0x5e06*/      cmp r0, #2
/*0x5e08*/      bne jump_5e6a
/*0x5e0a*/      movs r0, #0x35
/*0x5e0c*/      bl call_5770
/*0x5e10*/      movs r0, #0
/*0x5e12*/      bl call_692c
/*0x5e16*/      pop.w {r4, lr}
/*0x5e1a*/      b.w jump_5cb4
            jump_5e1e:
/*0x5e1e*/      ldr r0, [pc, #0x50] /* data_5e70 */
/*0x5e20*/      b jump_5e26
            jump_5e22:
/*0x5e22*/      ldr r0, [pc, #0x4c] /* data_5e70 */
/*0x5e24*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_5e26:
/*0x5e26*/      str r0, [r1]
/*0x5e28*/      movs r1, #0
/*0x5e2a*/      mov.w r0, #0x10000
/*0x5e2e*/      movs r3, #1
/*0x5e30*/      mov r2, r1
/*0x5e32*/      bl call_3888
/*0x5e36*/      ldr r1, [pc, #0x3c] /* data_5e74 */
/*0x5e38*/      mov.w r0, #0x200
/*0x5e3c*/      str r0, [r1, #0x24]
/*0x5e3e*/      movs r0, #0x35
/*0x5e40*/      bl call_5770
/*0x5e44*/      movs r0, #0
/*0x5e46*/      bl call_692c
/*0x5e4a*/      movw r0, #0x4e20
/*0x5e4e*/      bl call_37c4
/*0x5e52*/      dsb sy
/*0x5e56*/      ldr r0, [pc, #0x20] /* data_5e78 */
/*0x5e58*/      ldr r1, [r0]
/*0x5e5a*/      ldr r2, [pc, #0x20] /* data_5e7c */
/*0x5e5c*/      and r1, r1, #0x700
/*0x5e60*/      orrs r1, r2
/*0x5e62*/      str r1, [r0]
/*0x5e64*/      dsb sy
            jump_5e68:
/*0x5e68*/      b jump_5e68
            jump_5e6a:
/*0x5e6a*/      pop {r4, pc}

            data_5e6c:
/*0x5e6c*/  .word 0x20003ffc
            data_5e70:
/*0x5e70*/  .word 0x55aafaf5
            data_5e74:
/*0x5e74*/  .word 0x400b0000
            data_5e78:
/*0x5e78*/  .word 0xe000ed0c
            data_5e7c:
/*0x5e7c*/  .word 0x05fa0004


            .thumb_func
            call_5e80:
/*0x5e80*/      push {r4, r5, r6, lr}
/*0x5e82*/      mov r4, r1
/*0x5e84*/      ldr r2, [pc, #0x24] /* data_5eac */
/*0x5e86*/      mov r1, r0
/*0x5e88*/      movs r0, #2
/*0x5e8a*/      strb r0, [r2]
/*0x5e8c*/      ldr r0, [pc, #0x20] /* data_5eb0 */
/*0x5e8e*/      subs r5, r0, #4
/*0x5e90*/      cmp r1, r0
/*0x5e92*/      beq jump_5e9c
/*0x5e94*/      mov r2, r4
/*0x5e96*/      adds r0, r5, #4
/*0x5e98*/      bl memcpy
            jump_5e9c:
/*0x5e9c*/      adds r0, r5, r4
/*0x5e9e*/      rsb.w r1, r4, #0x3c
/*0x5ea2*/      pop.w {r4, r5, r6, lr}
/*0x5ea6*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5ea8*/      b.w mem_zero

            data_5eac:
/*0x5eac*/  .word 0x20000050
            data_5eb0:
/*0x5eb0*/  .word 0x20000684

            jump_5eb4:
/*0x5eb4*/      push {r4, r5, r6, r7, lr}
/*0x5eb6*/      ldr r7, [pc, #0x28] /* data_5ee0 */
/*0x5eb8*/      ldr.w r4, [r7, #0x104]
/*0x5ebc*/      ldr.w r5, [r7, #0x108]
/*0x5ec0*/      ldr.w r6, [r7, #0x10c]
/*0x5ec4*/      bics r4, r0
/*0x5ec6*/      bics r5, r1
/*0x5ec8*/      bics r6, r2
/*0x5eca*/      cbz r3, jump_5ed2
/*0x5ecc*/      orrs r4, r0
/*0x5ece*/      orrs r5, r1
/*0x5ed0*/      orrs r6, r2
            jump_5ed2:
/*0x5ed2*/      str.w r4, [r7, #0x104]
/*0x5ed6*/      str.w r5, [r7, #0x108]
/*0x5eda*/      str.w r6, [r7, #0x10c]
/*0x5ede*/      pop {r4, r5, r6, r7, pc}

            data_5ee0:
/*0x5ee0*/  .word 0x40088000


            .thumb_func
            call_5ee4:
/*0x5ee4*/      ldr r2, [pc, #0x1c] /* data_5f04 */
/*0x5ee6*/      movs r1, #0
/*0x5ee8*/      mov.w r0, #0x1c20
/*0x5eec*/      str.w r1, [r2, #0x108]
            jump_5ef0:
/*0x5ef0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5ef2*/      bhs jump_5ef0
/*0x5ef4*/      movs r0, #1
/*0x5ef6*/      str.w r0, [r2, #0x108]
/*0x5efa*/      ldr r0, [pc, #0xc] /* data_5f08 */
            jump_5efc:
/*0x5efc*/      ldr r1, [r0, #8]
/*0x5efe*/      lsls r1, r1, #0x1a
/*0x5f00*/      bpl jump_5efc
/*0x5f02*/      bx lr

            data_5f04:
/*0x5f04*/  .word 0x42d40000
            data_5f08:
/*0x5f08*/  .word 0x40088000


            .thumb_func
            call_5f0c:
/*0x5f0c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5f10*/      movs r7, #0xa
/*0x5f12*/      ldr r5, [pc, #0x68] /* data_5f7c */
/*0x5f14*/      b jump_5f72
            jump_5f16:
/*0x5f16*/      ldr r1, [pc, #0x68] /* data_5f80 */
/*0x5f18*/      add.w r0, r7, r7, lsl #1
/*0x5f1c*/      add r0, r1
/*0x5f1e*/      ldrb r1, [r5, #-0x1]!
/*0x5f22*/      ldrb r0, [r0, #2]
/*0x5f24*/      eors r0, r1
/*0x5f26*/      movs.w r8, r0
/*0x5f2a*/      beq jump_5f72
/*0x5f2c*/      movs r4, #0x80
/*0x5f2e*/      movs r6, #8
/*0x5f30*/      b jump_5f6c
            jump_5f32:
/*0x5f32*/      tst.w r8, r4
/*0x5f36*/      beq jump_5f6a
/*0x5f38*/      ldrb r0, [r5]
/*0x5f3a*/      eors r0, r4
/*0x5f3c*/      strb r0, [r5]
/*0x5f3e*/      tst r0, r4
/*0x5f40*/      bne jump_5f46
/*0x5f42*/      movs r0, #1
/*0x5f44*/      b jump_5f48
            jump_5f46:
/*0x5f46*/      movs r0, #0
            jump_5f48:
/*0x5f48*/      mov sb, r0
/*0x5f4a*/      add.w r0, r6, r7, lsl #3
/*0x5f4e*/      uxtb r0, r0
/*0x5f50*/      mov r1, sb
/*0x5f52*/      bl call_4878
/*0x5f56*/      cbnz r0, jump_5f5e
/*0x5f58*/      ldrb r0, [r5]
/*0x5f5a*/      eors r0, r4
/*0x5f5c*/      strb r0, [r5]
            jump_5f5e:
/*0x5f5e*/      movs.w r0, sb
/*0x5f62*/      beq jump_5f66
/*0x5f64*/      movs r0, #1
            jump_5f66:
/*0x5f66*/      ldr r1, [pc, #0x1c] /* data_5f84 */
/*0x5f68*/      strh r0, [r1, #2]
            jump_5f6a:
/*0x5f6a*/      lsrs r4, r4, #1
            jump_5f6c:
/*0x5f6c*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x5f6e*/      uxtb r6, r6
/*0x5f70*/      bhs jump_5f32
            jump_5f72:
/*0x5f72*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x5f74*/      uxtb r7, r7
/*0x5f76*/      bhs jump_5f16
/*0x5f78*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5f7c:
/*0x5f7c*/  .word 0x200001ba
            data_5f80:
/*0x5f80*/  .word 0x20000314
            data_5f84:
/*0x5f84*/  .word 0x2000001e


            .thumb_func
            call_5f88:
/*0x5f88*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5f8c*/      mov r6, r0
/*0x5f8e*/      movs r4, #2
/*0x5f90*/      ldr r5, [pc, #0x58] /* data_5fec */
/*0x5f92*/      mov.w r7, #0x1f4
            jump_5f96:
/*0x5f96*/      bl call_71d4
/*0x5f9a*/      movs r0, #0xa
/*0x5f9c*/      b jump_5fa6
            jump_5f9e:
/*0x5f9e*/      add.w r1, r0, r0, lsl #1
/*0x5fa2*/      ldrb r1, [r5, r1]
/*0x5fa4*/      cbnz r1, jump_5fac
            jump_5fa6:
/*0x5fa6*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5fa8*/      uxtb r0, r0
/*0x5faa*/      bhs jump_5f9e
            jump_5fac:
/*0x5fac*/      cmp r0, #0xff
/*0x5fae*/      beq jump_5fc0
/*0x5fb0*/      cmp r4, #0
/*0x5fb2*/      bne jump_5f96
            jump_5fb4:
/*0x5fb4*/      cmp r6, #0
/*0x5fb6*/      beq jump_5fe8
/*0x5fb8*/      ldr r2, [pc, #0x34] /* data_5ff0 */
/*0x5fba*/      ldr r1, [pc, #0x30] /* data_5fec */
/*0x5fbc*/      movs r0, #0xa
/*0x5fbe*/      b jump_5fd8
            jump_5fc0:
/*0x5fc0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5fc2*/      ands r4, r4, #0xff
/*0x5fc6*/      beq jump_5fb4
/*0x5fc8*/      mov r0, r7
/*0x5fca*/      bl call_37c4
/*0x5fce*/      b jump_5f96
            jump_5fd0:
/*0x5fd0*/      ldrb r3, [r1, #2]
/*0x5fd2*/      strb r3, [r2], #1
/*0x5fd6*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_5fd8:
/*0x5fd8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5fda*/      uxtb r0, r0
/*0x5fdc*/      bhs jump_5fd0
/*0x5fde*/      ldr r0, [pc, #0x10] /* data_5ff0 */
/*0x5fe0*/      ldrb r1, [r0, #9]
/*0x5fe2*/      orr r1, r1, #0xf
/*0x5fe6*/      strb r1, [r0, #9]
            jump_5fe8:
/*0x5fe8*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5fec:
/*0x5fec*/  .word 0x20000314
            data_5ff0:
/*0x5ff0*/  .word 0x200001b0


            .thumb_func
            call_5ff4:
/*0x5ff4*/      ldr r1, [pc, #0x10] /* data_6008 */
/*0x5ff6*/      ldrb r0, [r1]
/*0x5ff8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5ffa*/      strb r0, [r1]
/*0x5ffc*/      lsls r0, r0, #0x1e
/*0x5ffe*/      bne jump_6004
/*0x6000*/      b.w call_71d4
            jump_6004:
/*0x6004*/      bx lr

/*0x6006*/  .byte 0x00
/*0x6007*/  .byte 0x00

            data_6008:
/*0x6008*/  .word 0x2000001e


            .thumb_func
            call_600c:
/*0x600c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6010*/      movs r6, #0
/*0x6012*/      mov r1, r6
/*0x6014*/      mov.w r0, #0xf0000
/*0x6018*/      movs r3, #1
/*0x601a*/      mov r2, r6
/*0x601c*/      bl call_3888
/*0x6020*/      movs r4, #8
/*0x6022*/      b jump_6054
            jump_6024:
/*0x6024*/      ldr r0, [pc, #0x94] /* data_60bc */
/*0x6026*/      movs r2, #0
/*0x6028*/      add.w r1, r0, r4, lsl #3
/*0x602c*/      ldrh r5, [r1, #4]
/*0x602e*/      ldr r0, [r1]
/*0x6030*/      uxth r1, r5
/*0x6032*/      mov r7, r0
/*0x6034*/      bl call_4578
/*0x6038*/      uxth r1, r5
/*0x603a*/      mov r0, r7
/*0x603c*/      movs r2, #1
/*0x603e*/      bl call_4558
/*0x6042*/      ldr r0, [pc, #0x78] /* data_60bc */
/*0x6044*/      adds r0, #0x40
/*0x6046*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x604a*/      add.w r0, r0, r4, lsl #1
/*0x604e*/      ldrb r0, [r0, #1]
/*0x6050*/      bl call_3640
            jump_6054:
/*0x6054*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6056*/      uxtb r4, r4
/*0x6058*/      bhs jump_6024
/*0x605a*/      movs r4, #0xa
/*0x605c*/      b jump_6086
            jump_605e:
/*0x605e*/      ldr r0, [pc, #0x5c] /* data_60bc */
/*0x6060*/      adds r0, #0x50
/*0x6062*/      add.w r1, r0, r4, lsl #3
/*0x6066*/      ldrh r5, [r1, #4]
/*0x6068*/      ldr r7, [r1]
/*0x606a*/      uxth r1, r5
/*0x606c*/      mov r0, r7
/*0x606e*/      bl call_45a0
/*0x6072*/      uxth r1, r5
/*0x6074*/      mov r0, r7
/*0x6076*/      movs r2, #0
/*0x6078*/      bl call_4568
/*0x607c*/      uxth r1, r5
/*0x607e*/      mov r0, r7
/*0x6080*/      movs r2, #1
/*0x6082*/      bl call_4538
            jump_6086:
/*0x6086*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6088*/      uxtb r4, r4
/*0x608a*/      bhs jump_605e
/*0x608c*/      movs r2, #0xff
/*0x608e*/      movs r1, #0xa
/*0x6090*/      ldr r0, [pc, #0x2c] /* data_60c0 */
/*0x6092*/      bl mem_set
/*0x6096*/      movs r0, #0
/*0x6098*/      bl call_60f8
/*0x609c*/      movs r1, #0xa
/*0x609e*/      ldr r0, [pc, #0x24] /* data_60c4 */
/*0x60a0*/      movs r2, #0xff
/*0x60a2*/      b jump_60b0
            jump_60a4:
/*0x60a4*/      strb r6, [r0], #1
/*0x60a8*/      strb r2, [r0], #1
/*0x60ac*/      strb r2, [r0], #1
            jump_60b0:
/*0x60b0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x60b2*/      uxtb r1, r1
/*0x60b4*/      bhs jump_60a4
/*0x60b6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x60ba*/  .byte 0x00
/*0x60bb*/  .byte 0x00

            data_60bc:
/*0x60bc*/  .word gpio_map_1
            data_60c0:
/*0x60c0*/  .word 0x200001b0
            data_60c4:
/*0x60c4*/  .word 0x20000314


            .thumb_func
            call_60c8:
/*0x60c8*/      ldr r1, [pc, #0x28] /* data_60f4 */
/*0x60ca*/      push {r4, lr}
/*0x60cc*/      add.w r0, r1, #0x164
/*0x60d0*/      movs r2, #0xa
/*0x60d2*/      b jump_60e8
            jump_60d4:
/*0x60d4*/      ldrb r3, [r0]
/*0x60d6*/      cbnz r3, jump_60e0
/*0x60d8*/      ldrb r3, [r0, #2]
/*0x60da*/      ldrb r4, [r1]
/*0x60dc*/      cmp r3, r4
/*0x60de*/      beq jump_60e4
            jump_60e0:
/*0x60e0*/      movs r0, #0
/*0x60e2*/      pop {r4, pc}
            jump_60e4:
/*0x60e4*/      .short 0x1cc0 /* adds r0, r0, #3 */ 
/*0x60e6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
            jump_60e8:
/*0x60e8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x60ea*/      uxtb r2, r2
/*0x60ec*/      bhs jump_60d4
/*0x60ee*/      movs r0, #1
/*0x60f0*/      pop {r4, pc}

/*0x60f2*/  .byte 0x00
/*0x60f3*/  .byte 0x00

            data_60f4:
/*0x60f4*/  .word 0x200001b0


            .thumb_func
            call_60f8:
/*0x60f8*/      push {r4, lr}
/*0x60fa*/      mov r4, r0
/*0x60fc*/      movs r2, #0x50
/*0x60fe*/      ldr r1, [pc, #0x38] /* data_6138 */
/*0x6100*/      ldr r0, [pc, #0x38] /* data_613c */
/*0x6102*/      bl memcpy
/*0x6106*/      cbz r4, jump_6126
/*0x6108*/      bl call_61b0
/*0x610c*/      cmp r4, #1
/*0x610e*/      beq jump_6116
/*0x6110*/      cmp r4, #2
/*0x6112*/      bne jump_6126
/*0x6114*/      b jump_611e
            jump_6116:
/*0x6116*/      ldr r1, [pc, #0x20] /* data_6138 */
/*0x6118*/      adds r1, #0xf0
/*0x611a*/      movs r0, #0x22
/*0x611c*/      b jump_6122
            jump_611e:
/*0x611e*/      ldr r1, [pc, #0x20] /* data_6140 */
/*0x6120*/      movs r0, #0x11
            jump_6122:
/*0x6122*/      bl call_61dc
            jump_6126:
/*0x6126*/      bl call_61b0
/*0x612a*/      bl call_52b0
/*0x612e*/      pop.w {r4, lr}
/*0x6132*/      b.w call_61b0

/*0x6136*/  .byte 0x00
/*0x6137*/  .byte 0x00

            data_6138:
/*0x6138*/  .word data_7c60
            data_613c:
/*0x613c*/  .word 0x200002c4
            data_6140:
/*0x6140*/  .word data_7d94


            .thumb_func
            call_6144:
/*0x6144*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6148*/      movs r7, r0
/*0x614a*/      mov.w r4, #0xa
/*0x614e*/      beq jump_6158
/*0x6150*/      movs r0, #0
            jump_6152:
/*0x6152*/      mov r8, r0
/*0x6154*/      ldr r5, [pc, #0x50] /* data_61a8 */
/*0x6156*/      b jump_617c
            jump_6158:
/*0x6158*/      movs r0, #1
/*0x615a*/      b jump_6152
            jump_615c:
/*0x615c*/      add.w r6, r5, r4, lsl #3
/*0x6160*/      mov r2, r8
/*0x6162*/      ldrh r0, [r6, #4]
/*0x6164*/      uxth r1, r0
/*0x6166*/      ldr.w r0, [r5, r4, lsl #3]
/*0x616a*/      bl call_45a4
/*0x616e*/      ldrh r0, [r6, #4]
/*0x6170*/      movs r2, #1
/*0x6172*/      uxth r1, r0
/*0x6174*/      ldr.w r0, [r5, r4, lsl #3]
/*0x6178*/      bl call_4538
            jump_617c:
/*0x617c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x617e*/      uxtb r4, r4
/*0x6180*/      bhs jump_615c
/*0x6182*/      cbz r7, jump_6196
/*0x6184*/      movs r2, #0
            jump_6186:
/*0x6186*/      ldr r4, [pc, #0x24] /* data_61ac */
/*0x6188*/      movs r1, #0x10
/*0x618a*/      mov r0, r4
/*0x618c*/      bl call_4568
/*0x6190*/      cbz r7, jump_619a
/*0x6192*/      movs r2, #1
/*0x6194*/      b jump_619c
            jump_6196:
/*0x6196*/      movs r2, #1
/*0x6198*/      b jump_6186
            jump_619a:
/*0x619a*/      movs r2, #0
            jump_619c:
/*0x619c*/      mov r0, r4
/*0x619e*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x61a2*/      movs r1, #0x10
/*0x61a4*/      b.w call_45a4

            data_61a8:
/*0x61a8*/  .word gpio_map_2
            data_61ac:
/*0x61ac*/  .word 0x400b0000


            .thumb_func
            call_61b0:
/*0x61b0*/      push {r4, lr}
/*0x61b2*/      ldr r4, [pc, #0x24] /* data_61d8 */
/*0x61b4*/      movs r2, #0xff
/*0x61b6*/      adds r1, r2, #1
/*0x61b8*/      subw r0, r4, #0x14f
/*0x61bc*/      bl mem_set
/*0x61c0*/      movs r0, #0x50
/*0x61c2*/      subw r1, r4, #0x14f
/*0x61c6*/      b jump_61ce
            jump_61c8:
/*0x61c8*/      ldrb r2, [r4], #-1
/*0x61cc*/      strb r0, [r1, r2]
            jump_61ce:
/*0x61ce*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x61d0*/      uxtb r0, r0
/*0x61d2*/      bhs jump_61c8
/*0x61d4*/      pop {r4, pc}

/*0x61d6*/  .byte 0x00
/*0x61d7*/  .byte 0x00

            data_61d8:
/*0x61d8*/  .word 0x20000313


            .thumb_func
            call_61dc:
/*0x61dc*/      push {r4, r5, lr}
/*0x61de*/      ldr r3, [pc, #0x18] /* data_61f8 */
/*0x61e0*/      sub.w r4, r3, #0x100
/*0x61e4*/      b jump_61f0
            jump_61e6:
/*0x61e6*/      ldrb r2, [r1, #1]
/*0x61e8*/      ldrb r5, [r1], #2
/*0x61ec*/      ldrb r5, [r4, r5]
/*0x61ee*/      strb r2, [r3, r5]
            jump_61f0:
/*0x61f0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x61f2*/      uxtb r0, r0
/*0x61f4*/      bhs jump_61e6
/*0x61f6*/      pop {r4, r5, pc}

            data_61f8:
/*0x61f8*/  .word 0x200002c4


            .thumb_func
            call_61fc:
/*0x61fc*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x6200*/      ldr.w sb, [pc, #0x5c] /* data_6260 */
/*0x6204*/      ldr.w ip, [pc, #0x5c] /* data_6264 */
/*0x6208*/      movs r5, #0
/*0x620a*/      sub.w r8, sb, #0xd8
            jump_620e:
/*0x620e*/      ldr r7, [pc, #0x54] /* data_6264 */
/*0x6210*/      movs r4, #0x10
/*0x6212*/      movs r3, #0
/*0x6214*/      add.w r0, sb, r5, lsl #6
/*0x6218*/      adds r7, #0x44
            jump_621a:
/*0x621a*/      ldrb.w r1, [ip, r3]
/*0x621e*/      add.w r1, r1, r1, lsl #3
/*0x6222*/      add.w r1, r8, r1, lsl #3
/*0x6226*/      adds r2, r1, r5
/*0x6228*/      movs r1, #9
/*0x622a*/      b jump_6240
            jump_622c:
/*0x622c*/      ldrb r6, [r2], #8
/*0x6230*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6232*/      ands r4, r4, #0xff
/*0x6236*/      ldrh.w r6, [r7, r6, lsl #1]
/*0x623a*/      strh r6, [r0]
/*0x623c*/      beq jump_625a
/*0x623e*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_6240:
/*0x6240*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6242*/      uxtb r1, r1
/*0x6244*/      bhs jump_622c
/*0x6246*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x6248*/      uxtb r3, r3
/*0x624a*/      cmp r3, #3
/*0x624c*/      blo jump_621a
/*0x624e*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x6250*/      uxtb r5, r5
/*0x6252*/      cmp r5, #8
/*0x6254*/      blo jump_620e
/*0x6256*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_625a:
/*0x625a*/      movs r4, #0x10
/*0x625c*/      subs r0, #0x3a
/*0x625e*/      b jump_6240

            data_6260:
/*0x6260*/  .word 0x2000040a
            data_6264:
/*0x6264*/  .word data_7db8


            .thumb_func
            call_6268:
/*0x6268*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x626c*/      movs r1, #0
/*0x626e*/      mov.w r2, #0x20000
/*0x6272*/      mov.w r0, #0x70000
/*0x6276*/      movs r3, #1
/*0x6278*/      bl call_3888
/*0x627c*/      movw r1, #0xea60
/*0x6280*/      ldr r0, [pc, #0x90] /* data_6314 */
/*0x6282*/      bl call_3792
/*0x6286*/      ldr r4, [pc, #0x90] /* data_6318 */
/*0x6288*/      movs r1, #2
/*0x628a*/      mov r0, r4
/*0x628c*/      bl call_45a0
/*0x6290*/      movs r2, #0
/*0x6292*/      movs r1, #2
/*0x6294*/      mov r0, r4
/*0x6296*/      bl call_4568
/*0x629a*/      movs r2, #1
/*0x629c*/      movs r1, #2
/*0x629e*/      mov r0, r4
/*0x62a0*/      bl call_4538
/*0x62a4*/      movs r1, #4
/*0x62a6*/      mov r0, r4
/*0x62a8*/      bl call_45a0
/*0x62ac*/      ldr r6, [pc, #0x6c] /* data_631c */
/*0x62ae*/      mov.w r5, #0x4000
/*0x62b2*/      mov r1, r5
/*0x62b4*/      mov r0, r6
/*0x62b6*/      bl call_45a0
/*0x62ba*/      lsls r7, r5, #1
/*0x62bc*/      mov r1, r7
/*0x62be*/      mov r0, r6
/*0x62c0*/      bl call_45a0
/*0x62c4*/      movs r2, #0
/*0x62c6*/      movs r1, #4
/*0x62c8*/      mov r0, r4
/*0x62ca*/      bl call_4568
/*0x62ce*/      movs r2, #0
/*0x62d0*/      mov r1, r5
/*0x62d2*/      mov r0, r6
/*0x62d4*/      bl call_4568
/*0x62d8*/      movs r2, #0
/*0x62da*/      mov r1, r7
/*0x62dc*/      mov r0, r6
/*0x62de*/      bl call_4568
/*0x62e2*/      movs r2, #1
/*0x62e4*/      movs r1, #4
/*0x62e6*/      mov r0, r4
/*0x62e8*/      bl call_4538
/*0x62ec*/      movs r2, #1
/*0x62ee*/      mov r1, r5
/*0x62f0*/      mov r0, r6
/*0x62f2*/      bl call_4538
/*0x62f6*/      movs r2, #1
/*0x62f8*/      mov r1, r7
/*0x62fa*/      mov r0, r6
/*0x62fc*/      bl call_4538
/*0x6300*/      movs r2, #1
/*0x6302*/      mov r1, r2
/*0x6304*/      ldr r0, [pc, #0x18] /* data_6320 */
/*0x6306*/      bl call_4558
/*0x630a*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x630e*/      b.w jump_728c

/*0x6312*/  .byte 0x00
/*0x6313*/  .byte 0x00

            data_6314:
/*0x6314*/  .word 0x40077000
            data_6318:
/*0x6318*/  .word 0x400b4000
            data_631c:
/*0x631c*/  .word 0x400b0000
            data_6320:
/*0x6320*/  .word 0x400b2000

            jump_6324:
/*0x6324*/      push {r4, r5, r6, lr}
/*0x6326*/      ldr r4, [pc, #0x84] /* data_63ac */
/*0x6328*/      movs r1, #0
/*0x632a*/      mov r0, r4
/*0x632c*/      bl call_377e
/*0x6330*/      movs r1, #0
/*0x6332*/      mov r0, r4
/*0x6334*/      bl call_376a
/*0x6338*/      mov r0, r4
/*0x633a*/      bl call_375c
/*0x633e*/      ldr r1, [pc, #0x70] /* data_63b0 */
/*0x6340*/      asrs r0, r4, #0x14
/*0x6342*/      str.w r0, [r1, #0x180]
/*0x6346*/      movs r1, #0
/*0x6348*/      ldr r0, [pc, #0x68] /* data_63b4 */
/*0x634a*/      bl call_45ae
/*0x634e*/      ldr r6, [pc, #0x68] /* data_63b8 */
/*0x6350*/      movs r0, #2
/*0x6352*/      str r0, [r6, #0x24]
/*0x6354*/      ldr r4, [pc, #0x64] /* data_63bc */
/*0x6356*/      movs r5, #8
/*0x6358*/      b jump_6380
            jump_635a:
/*0x635a*/      ldrh r0, [r4, #4]
/*0x635c*/      movs r2, #0
/*0x635e*/      uxth r1, r0
/*0x6360*/      ldr r0, [r4]
/*0x6362*/      bl call_4538
/*0x6366*/      ldrh r0, [r4, #4]
/*0x6368*/      movs r2, #1
/*0x636a*/      uxth r1, r0
/*0x636c*/      ldr r0, [r4]
/*0x636e*/      bl call_4558
/*0x6372*/      ldrh r0, [r4, #4]
/*0x6374*/      movs r2, #2
/*0x6376*/      uxth r1, r0
/*0x6378*/      ldr r0, [r4]
/*0x637a*/      bl call_4578
/*0x637e*/      adds r4, #8
            jump_6380:
/*0x6380*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6382*/      uxtb r5, r5
/*0x6384*/      bhs jump_635a
/*0x6386*/      movs r2, #1
/*0x6388*/      movs r1, #4
/*0x638a*/      mov r0, r6
/*0x638c*/      bl call_4568
/*0x6390*/      ldr r4, [pc, #0x2c] /* data_63c0 */
/*0x6392*/      movs r2, #1
/*0x6394*/      lsls r1, r2, #0xe
/*0x6396*/      mov r0, r4
/*0x6398*/      bl call_4568
/*0x639c*/      mov r0, r4
/*0x639e*/      pop.w {r4, r5, r6, lr}
/*0x63a2*/      movs r2, #1
/*0x63a4*/      lsls r1, r2, #0xf
/*0x63a6*/      b.w call_4568

/*0x63aa*/  .byte 0x00
/*0x63ab*/  .byte 0x00

            data_63ac:
/*0x63ac*/  .word 0x40077000
            data_63b0:
/*0x63b0*/  .word 0xe000e004
            data_63b4:
/*0x63b4*/  .word 0x4006f000
            data_63b8:
/*0x63b8*/  .word 0x400b4000
            data_63bc:
/*0x63bc*/  .word gpio_map_3
            data_63c0:
/*0x63c0*/  .word 0x400b0000


            .thumb_func
            call_63c4:
/*0x63c4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x63c8*/      ldr r4, [pc, #0xcc] /* data_6498 */
/*0x63ca*/      movs r5, #8
/*0x63cc*/      b jump_63f2
            jump_63ce:
/*0x63ce*/      ldrh r0, [r4, #4]
/*0x63d0*/      uxth r1, r0
/*0x63d2*/      ldr r0, [r4]
/*0x63d4*/      bl call_45a0
/*0x63d8*/      ldrh r0, [r4, #4]
/*0x63da*/      movs r2, #1
/*0x63dc*/      uxth r1, r0
/*0x63de*/      ldr r0, [r4]
/*0x63e0*/      bl call_4568
/*0x63e4*/      ldrh r0, [r4, #4]
/*0x63e6*/      movs r2, #1
/*0x63e8*/      uxth r1, r0
/*0x63ea*/      ldr r0, [r4]
/*0x63ec*/      bl call_4538
/*0x63f0*/      adds r4, #8
            jump_63f2:
/*0x63f2*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x63f4*/      uxtb r5, r5
/*0x63f6*/      bhs jump_63ce
/*0x63f8*/      ldr r5, [pc, #0xa0] /* data_649c */
/*0x63fa*/      movs r1, #4
/*0x63fc*/      mov r0, r5
/*0x63fe*/      bl call_45a0
/*0x6402*/      ldr r6, [pc, #0x9c] /* data_64a0 */
/*0x6404*/      mov.w r7, #0x4000
/*0x6408*/      mov r1, r7
/*0x640a*/      mov r0, r6
/*0x640c*/      bl call_45a0
/*0x6410*/      lsls r4, r7, #1
/*0x6412*/      mov r1, r4
/*0x6414*/      mov r0, r6
/*0x6416*/      bl call_45a0
/*0x641a*/      movs r2, #0
/*0x641c*/      movs r1, #4
/*0x641e*/      mov r0, r5
/*0x6420*/      bl call_4568
/*0x6424*/      movs r2, #0
/*0x6426*/      mov r1, r7
/*0x6428*/      mov r0, r6
/*0x642a*/      bl call_4568
/*0x642e*/      movs r2, #0
/*0x6430*/      mov r1, r4
/*0x6432*/      mov r0, r6
/*0x6434*/      bl call_4568
/*0x6438*/      movw r0, #0x2710
/*0x643c*/      bl call_37c4
/*0x6440*/      movs r0, #2
/*0x6442*/      str r0, [r5, #0x28]
/*0x6444*/      lsls r1, r0, #8
/*0x6446*/      ldr r0, [pc, #0x5c] /* data_64a4 */
/*0x6448*/      bl mem_zero
/*0x644c*/      ldr r1, [pc, #0x58] /* data_64a8 */
/*0x644e*/      movs r0, #0
/*0x6450*/      strb r0, [r1, #1]
/*0x6452*/      movs r0, #0x64
/*0x6454*/      bl call_37c4
/*0x6458*/      bl call_6500
/*0x645c*/      movs r0, #2
/*0x645e*/      bl call_72e0
/*0x6462*/      str r4, [r6, #0x24]
/*0x6464*/      movs r1, #1
/*0x6466*/      ldr r0, [pc, #0x44] /* data_64ac */
/*0x6468*/      bl call_45ae
/*0x646c*/      ldr r4, [pc, #0x40] /* data_64b0 */
/*0x646e*/      movs r1, #0
/*0x6470*/      mov r0, r4
/*0x6472*/      bl call_3796
/*0x6476*/      mov r0, r4
/*0x6478*/      bl call_375c
/*0x647c*/      movs r1, #1
/*0x647e*/      mov r0, r4
/*0x6480*/      bl call_376a
/*0x6484*/      movs r1, #1
/*0x6486*/      mov r0, r4
/*0x6488*/      bl call_377e
/*0x648c*/      ldr r1, [pc, #0x24] /* data_64b4 */
/*0x648e*/      asrs r0, r4, #0x14
/*0x6490*/      str.w r0, [r1, #0x100]
/*0x6494*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6498:
/*0x6498*/  .word gpio_map_3
            data_649c:
/*0x649c*/  .word 0x400b4000
            data_64a0:
/*0x64a0*/  .word 0x400b0000
            data_64a4:
/*0x64a4*/  .word 0x2000040a
            data_64a8:
/*0x64a8*/  .word 0x20000024
            data_64ac:
/*0x64ac*/  .word 0x4006f000
            data_64b0:
/*0x64b0*/  .word 0x40077000
            data_64b4:
/*0x64b4*/  .word 0xe000e004


            .thumb_func
            call_64b8:
/*0x64b8*/      push {r4, r5, lr}
/*0x64ba*/      movs r0, #0x12
/*0x64bc*/      bl call_72e0
/*0x64c0*/      movs r1, #0xa
/*0x64c2*/      mov.w r0, #0x300
/*0x64c6*/      bl call_7310
/*0x64ca*/      movs r1, #2
/*0x64cc*/      movs r0, #0
/*0x64ce*/      bl call_7310
/*0x64d2*/      ldr r4, [pc, #0x24] /* data_64f8 */
/*0x64d4*/      mov.w r0, #0x4000
/*0x64d8*/      str r0, [r4, #0x28]
/*0x64da*/      lsls r5, r0, #1
/*0x64dc*/      str r5, [r4, #0x24]
/*0x64de*/      movs r1, #8
/*0x64e0*/      mov.w r0, #0xc00
/*0x64e4*/      bl call_7310
/*0x64e8*/      ldr r1, [pc, #0x10] /* data_64fc */
/*0x64ea*/      movs r0, #4
/*0x64ec*/      str r0, [r1, #0x24]
/*0x64ee*/      str r5, [r4, #0x28]
/*0x64f0*/      nop 
/*0x64f2*/      nop 
/*0x64f4*/      str r5, [r4, #0x24]
/*0x64f6*/      pop {r4, r5, pc}

            data_64f8:
/*0x64f8*/  .word 0x400b0000
            data_64fc:
/*0x64fc*/  .word 0x400b4000


            .thumb_func
            call_6500:
/*0x6500*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x6504*/      ldr r1, [pc, #0x78] /* data_6580 */
/*0x6506*/      ldr r0, [pc, #0x74] /* data_657c */
/*0x6508*/      movs r5, #0x10
/*0x650a*/      ldrb r2, [r1, #1]
/*0x650c*/      movs r7, #4
/*0x650e*/      add.w r4, r0, r2, lsl #6
/*0x6512*/      ldrb r0, [r1]
/*0x6514*/      ldr.w sl, [pc, #0x6c] /* data_6584 */
/*0x6518*/      ldr r6, [pc, #0x6c] /* data_6588 */
/*0x651a*/      mov.w fp, #0x4000
/*0x651e*/      adds r4, #0x3e
/*0x6520*/      cbz r0, jump_6530
/*0x6522*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6524*/      ands r0, r0, #0xff
/*0x6528*/      strb r0, [r1]
/*0x652a*/      bne jump_6530
/*0x652c*/      bl call_64b8
            jump_6530:
/*0x6530*/      mov sb, r7
            jump_6532:
/*0x6532*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6534*/      uxtb r5, r5
/*0x6536*/      blo jump_6572
/*0x6538*/      mov.w r8, #0x8000
/*0x653c*/      str.w r8, [r6, #0x28]
/*0x6540*/      ldrh r0, [r4]
/*0x6542*/      subs r7, r4, #2
/*0x6544*/      movs r1, #0xa
/*0x6546*/      bl call_7310
/*0x654a*/      ldrh r0, [r7]
/*0x654c*/      movs r1, #9
/*0x654e*/      ubfx r7, r0, #6, #1
/*0x6552*/      .short 0x1f24 /* subs r4, r4, #4 */ 
/*0x6554*/      bl call_7310
/*0x6558*/      mov r0, fp
/*0x655a*/      str.w fp, [r6, #0x28]
/*0x655e*/      str.w r8, [r6, #0x24]
/*0x6562*/      mov r1, sb
/*0x6564*/      mov r2, sl
/*0x6566*/      cbz r7, jump_656c
/*0x6568*/      str r1, [r2, #0x24]
/*0x656a*/      b jump_656e
            jump_656c:
/*0x656c*/      str r1, [r2, #0x28]
            jump_656e:
/*0x656e*/      str r0, [r6, #0x24]
/*0x6570*/      b jump_6532
            jump_6572:
/*0x6572*/      str.w sb, [sl, #0x24]
/*0x6576*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x657a*/  .byte 0x00
/*0x657b*/  .byte 0x00

            data_657c:
/*0x657c*/  .word 0x2000040a
            data_6580:
/*0x6580*/  .word 0x20000024
            data_6584:
/*0x6584*/  .word 0x400b4000
            data_6588:
/*0x6588*/  .word 0x400b0000


            .thumb_func
            call_658c:
/*0x658c*/      cmp r1, #0
/*0x658e*/      ldr r1, [r0]
/*0x6590*/      beq jump_6598
/*0x6592*/      orr r1, r1, #1
/*0x6596*/      b jump_659c
            jump_6598:
/*0x6598*/      bic r1, r1, #1
            jump_659c:
/*0x659c*/      str r1, [r0]
/*0x659e*/      bx lr

            .thumb_func
            call_65a0:
/*0x65a0*/      push {r4, r5, lr}
/*0x65a2*/      ldrd r4, r3, [r1, #0x14]
/*0x65a6*/      cbz r4, jump_65e2
/*0x65a8*/      mov.w r2, #0x200
/*0x65ac*/      lsrs r2, r3
/*0x65ae*/      orrs r2, r4
            jump_65b0:
/*0x65b0*/      ldr r4, [r1, #8]
/*0x65b2*/      ldr r3, [r1]
/*0x65b4*/      orrs r3, r4
/*0x65b6*/      ldrd r4, r5, [r1, #0xc]
/*0x65ba*/      orrs r4, r5
/*0x65bc*/      orrs r3, r4
/*0x65be*/      ldr r4, [r1, #0x1c]
/*0x65c0*/      orrs r3, r4
/*0x65c2*/      orrs r3, r2
/*0x65c4*/      str r3, [r0, #4]
/*0x65c6*/      ldr r3, [r1, #0x24]
/*0x65c8*/      ldr r2, [r1, #4]
/*0x65ca*/      orrs r2, r3
/*0x65cc*/      ldr r3, [r1, #0x20]
/*0x65ce*/      orr.w r2, r2, r3, lsl #4
/*0x65d2*/      str r2, [r0, #0x18]
/*0x65d4*/      ldr r1, [r1, #0x28]
/*0x65d6*/      mov.w r2, #-1
/*0x65da*/      add.w r1, r2, r1, lsr #1
/*0x65de*/      str r1, [r0, #0xc]
/*0x65e0*/      pop {r4, r5, pc}
            jump_65e2:
/*0x65e2*/      mov.w r2, #0x100
/*0x65e6*/      lsls r2, r3
/*0x65e8*/      b jump_65b0

            .thumb_func
            call_65ea:
/*0x65ea*/      cmp r1, #0
/*0x65ec*/      ldr r1, [r0]
/*0x65ee*/      beq jump_65f6
/*0x65f0*/      orr r1, r1, #8
/*0x65f4*/      b jump_65fa
            jump_65f6:
/*0x65f6*/      bic r1, r1, #8
            jump_65fa:
/*0x65fa*/      str r1, [r0]
/*0x65fc*/      bx lr

            .thumb_func
            call_65fe:
/*0x65fe*/      push {r4, r5, r6, lr}
/*0x6600*/      mov r5, r0
/*0x6602*/      bl call_40ec
/*0x6606*/      bfi r4, r0, #0, #8
/*0x660a*/      cbz r5, jump_6630
/*0x660c*/      cmp r5, #1
/*0x660e*/      beq jump_661c
/*0x6610*/      cmp r5, #2
/*0x6612*/      bne jump_6622
/*0x6614*/      uxth r0, r4
/*0x6616*/      orr r4, r0, #2
/*0x661a*/      b jump_6622
            jump_661c:
/*0x661c*/      uxth r0, r4
/*0x661e*/      bic r4, r0, #2
            jump_6622:
/*0x6622*/      uxtb r0, r4
/*0x6624*/      bl call_4510
/*0x6628*/      bl call_40ec
/*0x662c*/      bfi r4, r0, #0, #8
            jump_6630:
/*0x6630*/      lsls r0, r4, #0x1e
/*0x6632*/      bpl jump_6638
/*0x6634*/      movs r0, #1
/*0x6636*/      pop {r4, r5, r6, pc}
            jump_6638:
/*0x6638*/      movs r0, #0
/*0x663a*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_663c:
/*0x663c*/      ldr r0, [pc, #0x50] /* data_6690 */
/*0x663e*/      movs r1, #1
/*0x6640*/      str.w r1, [r0, #0x300]
/*0x6644*/      ldr r2, [pc, #0x4c] /* data_6694 */
/*0x6646*/      str.w r1, [r2, #0xa8]
            jump_664a:
/*0x664a*/      ldr.w r3, [r2, #0x108]
/*0x664e*/      cmp r3, #0
/*0x6650*/      beq jump_664a
/*0x6652*/      movs r3, #0
/*0x6654*/      str r3, [r2, #0x20]
/*0x6656*/      mov.w r3, #0x9000000
/*0x665a*/      str r3, [r0, #0x18]
/*0x665c*/      str.w r1, [r2, #0xa4]
            jump_6660:
/*0x6660*/      ldr.w r3, [r2, #0x104]
/*0x6664*/      cmp r3, #0
/*0x6666*/      beq jump_6660
/*0x6668*/      ldr r2, [pc, #0x2c] /* data_6698 */
/*0x666a*/      ldr.w r3, [r2, #0x200]
/*0x666e*/      bic r3, r3, #7
/*0x6672*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x6674*/      str.w r3, [r2, #0x200]
/*0x6678*/      str r1, [r0, #0x20]
/*0x667a*/      ldr r2, [r0, #4]
/*0x667c*/      bic r2, r2, #3
/*0x6680*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x6682*/      str r2, [r0, #4]
            jump_6684:
/*0x6684*/      ldr r2, [r0, #0x34]
/*0x6686*/      cmp.w r1, r2, lsr #30
/*0x668a*/      bne jump_6684
/*0x668c*/      bx lr

/*0x668e*/  .byte 0x00
/*0x668f*/  .byte 0x00

            data_6690:
/*0x6690*/  .word 0x40088000
            data_6694:
/*0x6694*/  .word 0x43100000
            data_6698:
/*0x6698*/  .word 0x40080000


            .thumb_func
            call_669c:
/*0x669c*/      ldr r0, [pc, #0x18] /* data_66b8 */
/*0x669e*/      movs r1, #0
/*0x66a0*/      add.w r2, r0, #8
/*0x66a4*/      str r1, [r0, #0x1c]
/*0x66a6*/      str r1, [r0, #0x20]
/*0x66a8*/      strb r1, [r2, #1]
/*0x66aa*/      str.w r1, [r0, #0x15]
/*0x66ae*/      movs r1, #0x1d
/*0x66b0*/      ldr r0, [pc, #8] /* data_66bc */
/*0x66b2*/      b.w mem_zero

/*0x66b6*/  .byte 0x00
/*0x66b7*/  .byte 0x00

            data_66b8:
/*0x66b8*/  .word 0x2000002c
            data_66bc:
/*0x66bc*/  .word 0x20000626


            .thumb_func
            call_66c0:
/*0x66c0*/      push {r4, lr}
/*0x66c2*/      ldr r0, [pc, #0x20] /* data_66e4 */
/*0x66c4*/      ldr r1, [pc, #0x1c] /* data_66e4 */
/*0x66c6*/      movs r4, #1
/*0x66c8*/      strb r4, [r0]
/*0x66ca*/      adds r1, #0xc
/*0x66cc*/      movs r0, #2
/*0x66ce*/      strb r0, [r1]
/*0x66d0*/      ldr r1, [pc, #0x14] /* data_66e8 */
/*0x66d2*/      movs r0, #4
/*0x66d4*/      strb r0, [r1]
/*0x66d6*/      bl call_669c
/*0x66da*/      ldr r0, [pc, #8] /* data_66e4 */
/*0x66dc*/      subs r0, #8
/*0x66de*/      strb r4, [r0, #5]
/*0x66e0*/      pop {r4, pc}

/*0x66e2*/  .byte 0x00
/*0x66e3*/  .byte 0x00

            data_66e4:
/*0x66e4*/  .word 0x20000034
            data_66e8:
/*0x66e8*/  .word 0x20000624


            .thumb_func
            call_66ec:
/*0x66ec*/      ldrb.w r0, [r0, #0x34]
/*0x66f0*/      ubfx r0, r0, #1, #1
/*0x66f4*/      bx lr

/*0x66f6*/  .byte 0x00
/*0x66f7*/  .byte 0x00

            jump_66f8:
/*0x66f8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x66fc*/      mov r4, r0
/*0x66fe*/      bl call_6b3c
/*0x6702*/      mov r5, r0
/*0x6704*/      ldr r6, [pc, #0x158] /* data_6860 */
/*0x6706*/      lsls r0, r0, #0x1e
/*0x6708*/      bpl jump_6716
/*0x670a*/      ldr r0, [r6, #4]
/*0x670c*/      cbz r0, jump_6710
/*0x670e*/      blx r0
            jump_6710:
/*0x6710*/      movs r0, #2
/*0x6712*/      bl call_6898
            jump_6716:
/*0x6716*/      lsls r0, r5, #0x1b
/*0x6718*/      bpl jump_673a
/*0x671a*/      movs r0, #0x10
/*0x671c*/      bl call_6898
/*0x6720*/      ldrb.w r0, [r4, #0x32]
/*0x6724*/      cmp r0, #2
/*0x6726*/      blo jump_673a
/*0x6728*/      bl call_6b50
/*0x672c*/      ldrb.w r0, [r4, #0x32]
/*0x6730*/      strb.w r0, [r4, #0x33]
/*0x6734*/      movs r0, #3
/*0x6736*/      strb.w r0, [r4, #0x32]
            jump_673a:
/*0x673a*/      lsls r0, r5, #0x1d
/*0x673c*/      mov.w r7, #0
/*0x6740*/      bpl jump_6786
/*0x6742*/      subs r0, r7, #1
/*0x6744*/      str r0, [r4, #0x20]
/*0x6746*/      strb.w r7, [r4, #0x30]
/*0x674a*/      strb.w r7, [r4, #0x31]
/*0x674e*/      ldrb.w r0, [r4, #0x34]
/*0x6752*/      bic r0, r0, #2
/*0x6756*/      strb.w r0, [r4, #0x34]
/*0x675a*/      movs r0, #4
/*0x675c*/      strb.w r0, [r4, #0x32]
/*0x6760*/      str r7, [r4, #0x38]
/*0x6762*/      bl call_6948
/*0x6766*/      bl call_6b60
/*0x676a*/      ldr r1, [pc, #0xf8] /* data_6864 */
/*0x676c*/      movs r0, #0
/*0x676e*/      bl call_6a04
/*0x6772*/      ldr r0, [pc, #0xf0] /* data_6864 */
/*0x6774*/      ldr r0, [r0]
/*0x6776*/      bl call_6b0c
/*0x677a*/      ldr r0, [r6]
/*0x677c*/      cbz r0, jump_6780
/*0x677e*/      blx r0
            jump_6780:
/*0x6780*/      movs r0, #4
/*0x6782*/      bl call_6898
            jump_6786:
/*0x6786*/      lsls r0, r5, #0x1c
/*0x6788*/      bpl jump_679c
/*0x678a*/      bl call_6b60
/*0x678e*/      ldrb.w r0, [r4, #0x33]
/*0x6792*/      strb.w r0, [r4, #0x32]
/*0x6796*/      movs r0, #8
/*0x6798*/      bl call_6898
            jump_679c:
/*0x679c*/      lsls r0, r5, #0x17
/*0x679e*/      mov.w r8, #0x100
/*0x67a2*/      bpl jump_6820
/*0x67a4*/      movs r0, #0
/*0x67a6*/      bl call_69e4
/*0x67aa*/      mov r5, r0
/*0x67ac*/      lsls r0, r0, #0x16
/*0x67ae*/      bpl jump_67c6
/*0x67b0*/      mov r0, r4
/*0x67b2*/      bl call_6c80
/*0x67b6*/      mov r0, r4
/*0x67b8*/      bl call_75f8
/*0x67bc*/      mov.w r1, #0x200
/*0x67c0*/      movs r0, #0
/*0x67c2*/      bl call_6974
            jump_67c6:
/*0x67c6*/      lsls r0, r5, #0x1e
/*0x67c8*/      bpl jump_6808
/*0x67ca*/      movs r1, #2
/*0x67cc*/      movs r0, #0
/*0x67ce*/      bl call_6974
/*0x67d2*/      ldr r0, [r4, #0x20]
/*0x67d4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x67d6*/      beq jump_6808
/*0x67d8*/      ldrb.w r0, [r4, #0x24]
/*0x67dc*/      cmp r0, #2
/*0x67de*/      bne jump_6808
/*0x67e0*/      movs r2, #0x40
/*0x67e2*/      movs r0, #0
/*0x67e4*/      ldr r1, [r4, #0x1c]
/*0x67e6*/      bl call_6a64
/*0x67ea*/      ldr r1, [r4, #0x1c]
/*0x67ec*/      add r1, r0
/*0x67ee*/      str r1, [r4, #0x1c]
/*0x67f0*/      ldr r1, [r4, #0x20]
/*0x67f2*/      subs r0, r1, r0
/*0x67f4*/      str r0, [r4, #0x20]
/*0x67f6*/      bne jump_6808
/*0x67f8*/      movs r0, #1
/*0x67fa*/      strb.w r0, [r4, #0x24]
/*0x67fe*/      ldr r1, [r4, #0x28]
/*0x6800*/      cbz r1, jump_6808
/*0x6802*/      ldr r0, [r4, #0x2c]
/*0x6804*/      blx r1
/*0x6806*/      str r7, [r4, #0x28]
            jump_6808:
/*0x6808*/      lsls r0, r5, #0x1b
/*0x680a*/      bpl jump_681a
/*0x680c*/      mov r0, r4
/*0x680e*/      bl call_75b4
/*0x6812*/      movs r1, #0x10
/*0x6814*/      movs r0, #0
/*0x6816*/      bl call_6974
            jump_681a:
/*0x681a*/      mov r0, r8
/*0x681c*/      bl call_6898
            jump_6820:
/*0x6820*/      mov r4, r8
            jump_6822:
/*0x6822*/      bl call_6b3c
/*0x6826*/      bl call_6b1c
/*0x682a*/      mov r5, r0
/*0x682c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x682e*/      beq jump_685a
/*0x6830*/      mov r0, r5
/*0x6832*/      bl call_69e4
/*0x6836*/      tst.w r0, #0x12
/*0x683a*/      beq jump_6822
/*0x683c*/      movs r1, #0x12
/*0x683e*/      mov r0, r5
/*0x6840*/      bl call_6974
/*0x6844*/      lsl.w r0, r4, r5
/*0x6848*/      bl call_6898
/*0x684c*/      ldr r0, [r6, #0x18]
/*0x684e*/      cmp r0, #0
/*0x6850*/      beq jump_6822
/*0x6852*/      mov r1, r0
/*0x6854*/      mov r0, r5
/*0x6856*/      blx r1
/*0x6858*/      b jump_6822
            jump_685a:
/*0x685a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x685e*/  .byte 0x00
/*0x685f*/  .byte 0x00

            data_6860:
/*0x6860*/  .word data_8188
            data_6864:
/*0x6864*/  .word 0x2000016c


            .thumb_func
            call_6868:
/*0x6868*/      movs r1, #2
/*0x686a*/      strb.w r1, [r0, #0x32]
/*0x686e*/      ldr r0, [pc, #4] /* data_6874 */
/*0x6870*/      b.w jump_6b4c

            data_6874:
/*0x6874*/  .word 0x2000016c


            .thumb_func
            call_6878:
/*0x6878*/      ldrb.w r0, [r0, #0x32]
/*0x687c*/      cmp r0, #3
/*0x687e*/      beq jump_6884
/*0x6880*/      movs r0, #0
/*0x6882*/      bx lr
            jump_6884:
/*0x6884*/      movs r0, #1
/*0x6886*/      bx lr

            .thumb_func
            call_6888:
/*0x6888*/      push {r4, lr}
/*0x688a*/      bl call_6b60
/*0x688e*/      pop.w {r4, lr}
/*0x6892*/      b.w jump_6c90

/*0x6896*/  .byte 0x00
/*0x6897*/  .byte 0x00


            .thumb_func
            call_6898:
/*0x6898*/      ldr r1, [pc, #4] /* data_68a0 */
/*0x689a*/      str r0, [r1, #8]
/*0x689c*/      bx lr

/*0x689e*/  .byte 0x00
/*0x689f*/  .byte 0x00

            data_68a0:
/*0x68a0*/  .word 0x400a8000


            .thumb_func
            call_68a4:
/*0x68a4*/      push {r4, lr}
/*0x68a6*/      movs r1, #0
/*0x68a8*/      mov.w r0, #0x400
/*0x68ac*/      movs r2, #0x40
/*0x68ae*/      movs r3, #1
/*0x68b0*/      bl call_3888
/*0x68b4*/      movs r0, #2
/*0x68b6*/      bl call_38ac
/*0x68ba*/      ldr r4, [pc, #0x48] /* data_6904 */
/*0x68bc*/      ldr r0, [pc, #0x40] /* data_6900 */
/*0x68be*/      str r0, [r4, #8]
/*0x68c0*/      subs r0, #0x5c
/*0x68c2*/      str r0, [r4, #0xc]
/*0x68c4*/      subs r0, #0xf4
/*0x68c6*/      str r0, [r4, #0x10]
/*0x68c8*/      movs r0, #2
/*0x68ca*/      str r0, [r4, #0x14]
/*0x68cc*/      bl call_66c0
/*0x68d0*/      mov r0, r4
/*0x68d2*/      bl call_6868
/*0x68d6*/      ldr r1, [pc, #0x30] /* data_6908 */
/*0x68d8*/      mov.w r0, #0x200000
/*0x68dc*/      str.w r0, [r1, #0x100]
/*0x68e0*/      movs r0, #1
/*0x68e2*/      bl call_692c
/*0x68e6*/      movs r0, #0xfa
/*0x68e8*/      bl call_37c4
/*0x68ec*/      ldrb.w r0, [r4, #0x34]
/*0x68f0*/      pop.w {r4, lr}
/*0x68f4*/      and r1, r0, #1
/*0x68f8*/      ldr r0, [pc, #0x10] /* data_690c */
/*0x68fa*/      b.w jump_6b70

/*0x68fe*/  .byte 0x00
/*0x68ff*/  .byte 0x00

            data_6900:
/*0x6900*/  .word usb_device_desc
            data_6904:
/*0x6904*/  .word 0x20000644
            data_6908:
/*0x6908*/  .word 0xe000e004
            data_690c:
/*0x690c*/  .word 0x2000016c


            .thumb_func
            call_6910:
/*0x6910*/      ldr r1, [pc, #0x14] /* data_6928 */
/*0x6912*/      cmp r0, #1
/*0x6914*/      ldr r0, [r1]
/*0x6916*/      beq jump_6920
/*0x6918*/      bic r0, r0, #0x800
            jump_691c:
/*0x691c*/      str r0, [r1]
/*0x691e*/      bx lr
            jump_6920:
/*0x6920*/      orr r0, r0, #0x800
/*0x6924*/      b jump_691c

/*0x6926*/  .byte 0x00
/*0x6927*/  .byte 0x00

            data_6928:
/*0x6928*/  .word 0x400a8000


            .thumb_func
            call_692c:
/*0x692c*/      ldr r1, [pc, #0x14] /* data_6944 */
/*0x692e*/      cmp r0, #1
/*0x6930*/      ldr r0, [r1]
/*0x6932*/      beq jump_693c
/*0x6934*/      bic r0, r0, #0x400
            jump_6938:
/*0x6938*/      str r0, [r1]
/*0x693a*/      bx lr
            jump_693c:
/*0x693c*/      orr r0, r0, #0x400
/*0x6940*/      b jump_6938

/*0x6942*/  .byte 0x00
/*0x6943*/  .byte 0x00

            data_6944:
/*0x6944*/  .word 0x400a8000


            .thumb_func
            call_6948:
/*0x6948*/      movs r1, #0
/*0x694a*/      movs r0, #0x20
/*0x694c*/      movs r3, #1
/*0x694e*/      mov r2, r1
/*0x6950*/      b.w jump_5eb4

            .thumb_func
            call_6954:
/*0x6954*/      push {r4, lr}
/*0x6956*/      bl call_781c
/*0x695a*/      ldr r1, [r0]
/*0x695c*/      and r1, r1, #9
/*0x6960*/      str r1, [r0]
/*0x6962*/      pop {r4, pc}

            .thumb_func
            call_6964:
/*0x6964*/      push {r4, lr}
/*0x6966*/      bl call_781c
/*0x696a*/      ldr r1, [r0]
/*0x696c*/      and r1, r1, #0x24
/*0x6970*/      str r1, [r0]
/*0x6972*/      pop {r4, pc}

            .thumb_func
            call_6974:
/*0x6974*/      push {r4, lr}
/*0x6976*/      mov r4, r1
/*0x6978*/      bl call_781c
/*0x697c*/      str r4, [r0, #8]
/*0x697e*/      pop {r4, pc}

            .thumb_func
            call_6980:
/*0x6980*/      push {r4, lr}
/*0x6982*/      bl call_781c
/*0x6986*/      ldr r0, [r0, #0x10]
/*0x6988*/      ldr r1, [pc, #8] /* data_6994 */
/*0x698a*/      ubfx r0, r0, #0, #0xa
/*0x698e*/      add r0, r1
/*0x6990*/      pop {r4, pc}

/*0x6992*/  .byte 0x00
/*0x6993*/  .byte 0x00

            data_6994:
/*0x6994*/  .word 0x400aa000


            .thumb_func
            call_6998:
/*0x6998*/      push {r4, r5, r6, lr}
/*0x699a*/      mov r5, r0
/*0x699c*/      bl call_781c
/*0x69a0*/      mov r4, r0
/*0x69a2*/      mov r0, r5
/*0x69a4*/      bl call_69bc
/*0x69a8*/      ldr r1, [r4, #0x10]
/*0x69aa*/      ubfx r1, r1, #0, #0xa
/*0x69ae*/      add r0, r1
/*0x69b0*/      ldr r1, [pc, #4] /* data_69b8 */
/*0x69b2*/      add r0, r1
/*0x69b4*/      pop {r4, r5, r6, pc}

/*0x69b6*/  .byte 0x00
/*0x69b7*/  .byte 0x00

            data_69b8:
/*0x69b8*/  .word 0x400aa000


            .thumb_func
            call_69bc:
/*0x69bc*/      push {r4, lr}
/*0x69be*/      bl call_781c
/*0x69c2*/      ldr r0, [r0, #0x10]
/*0x69c4*/      ubfx r0, r0, #0xa, #0xa
/*0x69c8*/      pop {r4, pc}

            .thumb_func
            call_69ca:
/*0x69ca*/      push {r4, lr}
/*0x69cc*/      bl call_781c
/*0x69d0*/      ldr r1, [r0, #0x10]
/*0x69d2*/      ldr r0, [r0]
/*0x69d4*/      lsls r1, r1, #3
/*0x69d6*/      bpl jump_69de
/*0x69d8*/      ubfx r0, r0, #2, #1
/*0x69dc*/      pop {r4, pc}
            jump_69de:
/*0x69de*/      ubfx r0, r0, #5, #1
/*0x69e2*/      pop {r4, pc}

            .thumb_func
            call_69e4:
/*0x69e4*/      push {r4, lr}
/*0x69e6*/      bl call_781c
/*0x69ea*/      ldr r1, [r0, #4]
/*0x69ec*/      ldr r0, [r0, #8]
/*0x69ee*/      ands r0, r1
/*0x69f0*/      pop {r4, pc}

            .thumb_func
            call_69f2:
/*0x69f2*/      push {r4, lr}
/*0x69f4*/      mov r4, r1
/*0x69f6*/      bl call_781c
/*0x69fa*/      ldr r0, [r0, #0xc]
/*0x69fc*/      lsrs r0, r4
/*0x69fe*/      ubfx r0, r0, #0, #9
/*0x6a02*/      pop {r4, pc}

            .thumb_func
            call_6a04:
/*0x6a04*/      push {r4, r5, r6, lr}
/*0x6a06*/      mov r4, r1
/*0x6a08*/      mov r5, r0
/*0x6a0a*/      bl call_781c
/*0x6a0e*/      add.w r1, r4, r5, lsl #3
/*0x6a12*/      ldr r2, [r1, #4]
/*0x6a14*/      str r2, [r0, #0x10]
/*0x6a16*/      ldr r1, [r1, #8]
/*0x6a18*/      str r1, [r0, #4]
/*0x6a1a*/      mov.w r1, #-1
/*0x6a1e*/      str r1, [r0, #8]
/*0x6a20*/      mov r0, r5
/*0x6a22*/      pop.w {r4, r5, r6, lr}
/*0x6a26*/      b.w jump_6a94

            .thumb_func
            call_6a2a:
/*0x6a2a*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6a2e*/      mov r6, r2
/*0x6a30*/      mov r7, r1
/*0x6a32*/      movs r5, r0
/*0x6a34*/      beq jump_6a5a
/*0x6a36*/      movs r1, #0
            jump_6a38:
/*0x6a38*/      bl call_69f2
/*0x6a3c*/      mov r4, r0
/*0x6a3e*/      cmp r0, r6
/*0x6a40*/      bhi jump_6a54
/*0x6a42*/      mov r0, r5
/*0x6a44*/      cbz r5, jump_6a5e
/*0x6a46*/      bl call_6980
            jump_6a4a:
/*0x6a4a*/      adds r1, r4, #3
/*0x6a4c*/      lsrs r2, r1, #2
/*0x6a4e*/      mov r1, r7
/*0x6a50*/      bl call_780c
            jump_6a54:
/*0x6a54*/      mov r0, r4
/*0x6a56*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6a5a:
/*0x6a5a*/      movs r1, #0x10
/*0x6a5c*/      b jump_6a38
            jump_6a5e:
/*0x6a5e*/      bl call_6998
/*0x6a62*/      b jump_6a4a

            .thumb_func
            call_6a64:
/*0x6a64*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6a68*/      mov r5, r2
/*0x6a6a*/      mov r6, r1
/*0x6a6c*/      mov r7, r0
/*0x6a6e*/      bl call_781c
/*0x6a72*/      mov r4, r0
/*0x6a74*/      movs r0, #0
/*0x6a76*/      cbz r5, jump_6a88
/*0x6a78*/      mov r2, r5
/*0x6a7a*/      mov r1, r6
/*0x6a7c*/      mov r0, r7
/*0x6a7e*/      bl call_6a2a
/*0x6a82*/      cbnz r0, jump_6a88
/*0x6a84*/      cmp r5, #0
/*0x6a86*/      bne jump_6a90
            jump_6a88:
/*0x6a88*/      ldr r1, [r4]
/*0x6a8a*/      and r1, r1, #0x10
/*0x6a8e*/      str r1, [r4]
            jump_6a90:
/*0x6a90*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6a94:
/*0x6a94*/      push {r4, lr}
/*0x6a96*/      bl call_781c
/*0x6a9a*/      ldr r1, [r0]
/*0x6a9c*/      and r1, r1, #0x19
/*0x6aa0*/      str r1, [r0]
/*0x6aa2*/      pop {r4, pc}
            jump_6aa4:
/*0x6aa4*/      push {r4, lr}
/*0x6aa6*/      bl call_781c
/*0x6aaa*/      movs r1, #4
/*0x6aac*/      str r1, [r0]
/*0x6aae*/      pop {r4, pc}

            .thumb_func
            call_6ab0:
/*0x6ab0*/      push {r4, lr}
/*0x6ab2*/      bl call_781c
/*0x6ab6*/      movs r1, #0x40
/*0x6ab8*/      str r1, [r0, #8]
/*0x6aba*/      ldr r2, [r0]
/*0x6abc*/      movs r1, #0x24
/*0x6abe*/      bics r1, r2
/*0x6ac0*/      str r1, [r0]
/*0x6ac2*/      pop {r4, pc}

            .thumb_func
            call_6ac4:
/*0x6ac4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6ac8*/      mov r4, r2
/*0x6aca*/      mov r8, r1
/*0x6acc*/      mov r7, r0
/*0x6ace*/      bl call_69bc
/*0x6ad2*/      mov r6, r0
/*0x6ad4*/      mov r0, r7
/*0x6ad6*/      bl call_781c
/*0x6ada*/      mov r5, r0
/*0x6adc*/      movs r1, #0
/*0x6ade*/      mov r0, r7
/*0x6ae0*/      bl call_69f2
/*0x6ae4*/      cmp r4, r6
/*0x6ae6*/      bhi jump_6aea
/*0x6ae8*/      cbz r0, jump_6af0
            jump_6aea:
/*0x6aea*/      movs r0, #0
            jump_6aec:
/*0x6aec*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6af0:
/*0x6af0*/      mov r0, r7
/*0x6af2*/      bl call_6980
/*0x6af6*/      mov r1, r0
/*0x6af8*/      adds r0, r4, #3
/*0x6afa*/      lsrs r2, r0, #2
/*0x6afc*/      mov r0, r8
/*0x6afe*/      bl call_780c
/*0x6b02*/      str r4, [r5, #0xc]
/*0x6b04*/      movs r0, #2
/*0x6b06*/      str r0, [r5]
/*0x6b08*/      mov r0, r4
/*0x6b0a*/      b jump_6aec

            .thumb_func
            call_6b0c:
/*0x6b0c*/      ldr r1, [pc, #8] /* data_6b18 */
/*0x6b0e*/      ldr r2, [r1, #4]
/*0x6b10*/      orrs r2, r0
/*0x6b12*/      str r2, [r1, #4]
/*0x6b14*/      bx lr

/*0x6b16*/  .byte 0x00
/*0x6b17*/  .byte 0x00

            data_6b18:
/*0x6b18*/  .word 0x400a8000


            .thumb_func
            call_6b1c:
/*0x6b1c*/      mov r3, r0
/*0x6b1e*/      movs r1, #7
            jump_6b20:
/*0x6b20*/      add.w r2, r1, #8
/*0x6b24*/      lsr.w r0, r3, r2
/*0x6b28*/      lsls r2, r0, #0x1f
/*0x6b2a*/      beq jump_6b30
/*0x6b2c*/      sxtb r0, r1
/*0x6b2e*/      bx lr
            jump_6b30:
/*0x6b30*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6b32*/      cmp r1, #0
/*0x6b34*/      bgt jump_6b20
/*0x6b36*/      mov.w r0, #-1
/*0x6b3a*/      bx lr

            .thumb_func
            call_6b3c:
/*0x6b3c*/      ldr r0, [pc, #8] /* data_6b48 */
/*0x6b3e*/      ldr r1, [r0, #4]
/*0x6b40*/      ldr r0, [r0, #8]
/*0x6b42*/      ands r0, r1
/*0x6b44*/      bx lr

/*0x6b46*/  .byte 0x00
/*0x6b47*/  .byte 0x00

            data_6b48:
/*0x6b48*/  .word 0x400a8000

            jump_6b4c:
/*0x6b4c*/      b.w jump_6be8

            .thumb_func
            call_6b50:
/*0x6b50*/      ldr r0, [pc, #8] /* data_6b5c */
/*0x6b52*/      ldr r1, [r0]
/*0x6b54*/      orr r1, r1, #0xc
/*0x6b58*/      str r1, [r0]
/*0x6b5a*/      bx lr

            data_6b5c:
/*0x6b5c*/  .word 0x400a8000


            .thumb_func
            call_6b60:
/*0x6b60*/      ldr r0, [pc, #8] /* data_6b6c */
/*0x6b62*/      ldr r1, [r0]
/*0x6b64*/      and r1, r1, #0x400
/*0x6b68*/      str r1, [r0]
/*0x6b6a*/      bx lr

            data_6b6c:
/*0x6b6c*/  .word 0x400a8000

            jump_6b70:
/*0x6b70*/      push {r4, lr}
/*0x6b72*/      mov r4, r0
/*0x6b74*/      ldr r0, [pc, #0x68] /* data_6be0 */
/*0x6b76*/      ldr r2, [r0]
/*0x6b78*/      cmp r2, #1
/*0x6b7a*/      bne jump_6bdc
/*0x6b7c*/      movs r2, #0
/*0x6b7e*/      str r2, [r0]
/*0x6b80*/      ldr r0, [pc, #0x60] /* data_6be4 */
/*0x6b82*/      ldr r2, [r0]
/*0x6b84*/      lsls r3, r2, #0x19
/*0x6b86*/      mov.w r2, #-1
/*0x6b8a*/      bpl jump_6ba6
/*0x6b8c*/      movw r3, #0x40c
/*0x6b90*/      str r3, [r0]
/*0x6b92*/      str r2, [r0, #8]
/*0x6b94*/      cbnz r1, jump_6b9c
/*0x6b96*/      movs r0, #0
/*0x6b98*/      bl call_5c70
            jump_6b9c:
/*0x6b9c*/      ldr r0, [r4]
/*0x6b9e*/      pop.w {r4, lr}
/*0x6ba2*/      b.w call_6b0c
            jump_6ba6:
/*0x6ba6*/      movw r3, #0xc0c
/*0x6baa*/      str r3, [r0]
/*0x6bac*/      str r2, [r0, #8]
/*0x6bae*/      cbnz r1, jump_6bb6
/*0x6bb0*/      movs r0, #0
/*0x6bb2*/      bl call_5c70
            jump_6bb6:
/*0x6bb6*/      movs r0, #0
/*0x6bb8*/      bl call_6910
/*0x6bbc*/      ldr r0, [r4]
/*0x6bbe*/      bl call_6b0c
/*0x6bc2*/      movs r0, #0
/*0x6bc4*/      bl call_692c
/*0x6bc8*/      movs r1, #0xc8
/*0x6bca*/      movs r0, #0
            jump_6bcc:
/*0x6bcc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6bce*/      cmp r0, r1
/*0x6bd0*/      blo jump_6bcc
/*0x6bd2*/      pop.w {r4, lr}
/*0x6bd6*/      movs r0, #1
/*0x6bd8*/      b.w call_692c
            jump_6bdc:
/*0x6bdc*/      pop {r4, pc}

/*0x6bde*/  .byte 0x00
/*0x6bdf*/  .byte 0x00

            data_6be0:
/*0x6be0*/  .word 0x20000018
            data_6be4:
/*0x6be4*/  .word 0x400a8000

            jump_6be8:
/*0x6be8*/      movw r1, #0x111d
/*0x6bec*/      str r1, [r0]
/*0x6bee*/      ldr r1, [pc, #0x28] /* data_6c18 */
/*0x6bf0*/      str r1, [r0, #4]
/*0x6bf2*/      movw r1, #0x212
/*0x6bf6*/      str r1, [r0, #8]
/*0x6bf8*/      ldr r1, [pc, #0x20] /* data_6c1c */
/*0x6bfa*/      str r1, [r0, #0xc]
/*0x6bfc*/      ldr r2, [pc, #0x20] /* data_6c20 */
/*0x6bfe*/      movs r1, #0x10
/*0x6c00*/      strd r1, r2, [r0, #0x10]
/*0x6c04*/      str r1, [r0, #0x18]
/*0x6c06*/      ldr r1, [pc, #0x1c] /* data_6c24 */
/*0x6c08*/      str r1, [r0, #0x1c]
/*0x6c0a*/      movs r1, #0
/*0x6c0c*/      str r1, [r0, #0x20]
/*0x6c0e*/      ldr r1, [pc, #0x18] /* data_6c28 */
/*0x6c10*/      str r1, [r0, #0x24]
/*0x6c12*/      movs r1, #2
/*0x6c14*/      str r1, [r0, #0x28]
/*0x6c16*/      bx lr

            data_6c18:
/*0x6c18*/  .word 0x80010008
            data_6c1c:
/*0x6c1c*/  .word 0x91002088
            data_6c20:
/*0x6c20*/  .word 0x92010090
            data_6c24:
/*0x6c24*/  .word 0x930100d0
            data_6c28:
/*0x6c28*/  .word 0x84010110


            .thumb_func
            call_6c2c:
/*0x6c2c*/      push {r4, lr}
/*0x6c2e*/      ldr r4, [pc, #0x48] /* data_6c78 */
/*0x6c30*/      ldrb.w r0, [r4, #0x32]
/*0x6c34*/      cmp r0, #3
/*0x6c36*/      bne jump_6c3c
/*0x6c38*/      bl call_782c
            jump_6c3c:
/*0x6c3c*/      ldr r1, [pc, #0x3c] /* data_6c7c */
/*0x6c3e*/      ldrb r0, [r1, #5]
/*0x6c40*/      cbz r0, jump_6c62
/*0x6c42*/      cmp r0, #1
/*0x6c44*/      beq jump_6c5a
/*0x6c46*/      cmp r0, #2
/*0x6c48*/      bne jump_6c6a
/*0x6c4a*/      ldrb.w r0, [r4, #0x32]
/*0x6c4e*/      cmp r0, #6
/*0x6c50*/      bne jump_6c56
/*0x6c52*/      bl call_7358
            jump_6c56:
/*0x6c56*/      movs r0, #2
/*0x6c58*/      pop {r4, pc}
            jump_6c5a:
/*0x6c5a*/      movs r0, #0
/*0x6c5c*/      strb r0, [r1, #5]
/*0x6c5e*/      movs r0, #3
/*0x6c60*/      pop {r4, pc}
            jump_6c62:
/*0x6c62*/      ldrb.w r0, [r4, #0x32]
/*0x6c66*/      cmp r0, #6
/*0x6c68*/      beq jump_6c6e
            jump_6c6a:
/*0x6c6a*/      movs r0, #0
/*0x6c6c*/      pop {r4, pc}
            jump_6c6e:
/*0x6c6e*/      movs r0, #2
/*0x6c70*/      strb r0, [r1, #5]
/*0x6c72*/      movs r0, #1
/*0x6c74*/      pop {r4, pc}

/*0x6c76*/  .byte 0x00
/*0x6c77*/  .byte 0x00

            data_6c78:
/*0x6c78*/  .word 0x20000644
            data_6c7c:
/*0x6c7c*/  .word 0x2000002c


            .thumb_func
            call_6c80:
/*0x6c80*/      ldr r1, [pc, #8] /* data_6c8c */
/*0x6c82*/      ldr r2, [r1]
/*0x6c84*/      str r2, [r0]
/*0x6c86*/      ldr r1, [r1, #4]
/*0x6c88*/      str r1, [r0, #4]
/*0x6c8a*/      bx lr

            data_6c8c:
/*0x6c8c*/  .word 0x400aa000

            jump_6c90:
/*0x6c90*/      ldr r0, [pc, #8] /* data_6c9c */
/*0x6c92*/      ldr r1, [r0]
/*0x6c94*/      orr r1, r1, #0x20
/*0x6c98*/      str r1, [r0]
/*0x6c9a*/      bx lr

            data_6c9c:
/*0x6c9c*/  .word 0x400a8000


            .thumb_func
            call_6ca0:
/*0x6ca0*/      ldr r1, [pc, #0xc] /* data_6cb0 */
/*0x6ca2*/      ldr r2, [r1]
/*0x6ca4*/      orr r2, r2, #0x100
/*0x6ca8*/      str r2, [r1]
/*0x6caa*/      str r0, [r1, #0x10]
/*0x6cac*/      bx lr

/*0x6cae*/  .byte 0x00
/*0x6caf*/  .byte 0x00

            data_6cb0:
/*0x6cb0*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x6cb4*/      ldr r0, [pc, #4] /* data_6cbc */
/*0x6cb6*/      b.w jump_66f8

/*0x6cba*/  .byte 0x00
/*0x6cbb*/  .byte 0x00

            data_6cbc:
/*0x6cbc*/  .word 0x20000644


            .thumb_func
            call_6cc0:
/*0x6cc0*/      ldr r1, [pc, #0x1c] /* data_6ce0 */
/*0x6cc2*/      movs r0, #0x10
/*0x6cc4*/      str.w r0, [r1, #0x10c]
/*0x6cc8*/      ldr r0, [pc, #0x18] /* data_6ce4 */
/*0x6cca*/      movw r1, #0x5fff
/*0x6cce*/      str r1, [r0, #8]
/*0x6cd0*/      ldr r1, [pc, #0x14] /* data_6ce8 */
/*0x6cd2*/      str r1, [r0, #4]
/*0x6cd4*/      movw r1, #0xca35
/*0x6cd8*/      str r1, [r0, #0x10]
/*0x6cda*/      ldr r1, [pc, #0x10] /* data_6cec */
/*0x6cdc*/      str r1, [r0]
/*0x6cde*/      bx lr

            data_6ce0:
/*0x6ce0*/  .word 0x40088000
            data_6ce4:
/*0x6ce4*/  .word 0x40068000
            data_6ce8:
/*0x6ce8*/  .word 0x0001a7d0
            data_6cec:
/*0x6cec*/  .word 0x5fa00001


            .thumb_func
            call_6cf0:
/*0x6cf0*/      ldr r1, [pc, #8] /* data_6cfc */
/*0x6cf2*/      ldr r0, [pc, #4] /* data_6cf8 */
/*0x6cf4*/      str r0, [r1]
/*0x6cf6*/      bx lr

            data_6cf8:
/*0x6cf8*/  .word 0x5fa00001
            data_6cfc:
/*0x6cfc*/  .word 0x40068000

            jump_6d00:
/*0x6d00*/      push {r4, lr}
/*0x6d02*/      bl call_3bec
/*0x6d06*/      ldr r1, [pc, #0x10] /* data_6d18 */
/*0x6d08*/      movs r0, #0
/*0x6d0a*/      str r0, [r1, #4]
/*0x6d0c*/      ldr r1, [pc, #0xc] /* data_6d1c */
/*0x6d0e*/      strb r0, [r1, #6]
/*0x6d10*/      movs r0, #1
/*0x6d12*/      strb r0, [r1]
/*0x6d14*/      pop {r4, pc}

/*0x6d16*/  .byte 0x00
/*0x6d17*/  .byte 0x00

            data_6d18:
/*0x6d18*/  .word 0x20000008
            data_6d1c:
/*0x6d1c*/  .word 0x200006c0

            jump_6d20:
/*0x6d20*/      push {r4, r5, r6, lr}
/*0x6d22*/      mov r6, r0
/*0x6d24*/      mov r5, r2
/*0x6d26*/      mov r4, r1
/*0x6d28*/      mov r0, r1
/*0x6d2a*/      bl call_4424
/*0x6d2e*/      mov r2, r5
/*0x6d30*/      mov r1, r4
/*0x6d32*/      mov r0, r6
/*0x6d34*/      pop.w {r4, r5, r6, lr}
/*0x6d38*/      b.w jump_4474

            .thumb_func
            call_6d3c:
/*0x6d3c*/      push {r4, r5, lr}
/*0x6d3e*/      ldr r1, [pc, #0x24] /* data_6d64 */
/*0x6d40*/      movs r0, #0xa
/*0x6d42*/      ldr r2, [pc, #0x1c] /* data_6d60 */
/*0x6d44*/      ldr r3, [pc, #0x20] /* data_6d68 */
/*0x6d46*/      ldrb.w r1, [r1, #0x25]
/*0x6d4a*/      b jump_6d56
            jump_6d4c:
/*0x6d4c*/      ldrb r4, [r2, r0]
/*0x6d4e*/      muls r4, r1, r4
/*0x6d50*/      lsrs r4, r4, #3
/*0x6d52*/      adds r5, r3, r0
/*0x6d54*/      strb r4, [r5, #4]
            jump_6d56:
/*0x6d56*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6d58*/      uxtb r0, r0
/*0x6d5a*/      bhs jump_6d4c
/*0x6d5c*/      pop {r4, r5, pc}

/*0x6d5e*/  .byte 0x00
/*0x6d5f*/  .byte 0x00

            data_6d60:
/*0x6d60*/  .word data_7c53
            data_6d64:
/*0x6d64*/  .word 0x20000734
            data_6d68:
/*0x6d68*/  .word 0x20000090


            .thumb_func
            call_6d6c:
/*0x6d6c*/      push {r4, r5, r6, r7, lr}
/*0x6d6e*/      ldr r6, [pc, #0x194] /* data_6f04 */
/*0x6d70*/      ldr r4, [pc, #0x194] /* data_6f08 */
/*0x6d72*/      sub sp, #0x2c
/*0x6d74*/      ldrb r0, [r6, #3]
/*0x6d76*/      cmp r0, #5
/*0x6d78*/      bhi jump_6e16
/*0x6d7a*/      cmp r0, #6
/*0x6d7c*/      bhs jump_6db2
/*0x6d7e*/      tbb [pc, r0]

/*0x6d82*/  .byte 0x03 /* case switch_6d88 */
/*0x6d83*/  .byte 0x03 /* case switch_6d88 */
/*0x6d84*/  .byte 0x1d /* case switch_6dbc */
/*0x6d85*/  .byte 0x56 /* case switch_6e2e */
/*0x6d86*/  .byte 0x43 /* case switch_6e08 */
/*0x6d87*/  .byte 0x43 /* case switch_6e08 */

            switch_6d88:
/*0x6d88*/      movs r5, #3
/*0x6d8a*/      ldr r7, [pc, #0x180] /* data_6f0c */
/*0x6d8c*/      b jump_6dac
            jump_6d8e:
/*0x6d8e*/      ldrb r0, [r6, #3]
/*0x6d90*/      cbz r0, jump_6db6
/*0x6d92*/      adds r0, r4, r5
/*0x6d94*/      ldrb r0, [r0, #4]
            jump_6d96:
/*0x6d96*/      ldr r1, [r4]
/*0x6d98*/      ldrb r1, [r1, #3]
/*0x6d9a*/      muls r0, r1, r0
/*0x6d9c*/      lsrs r2, r0, #3
/*0x6d9e*/      add.w r0, r5, r5, lsl #3
/*0x6da2*/      add.w r0, r7, r0, lsl #3
/*0x6da6*/      movs r1, #0x48
/*0x6da8*/      bl mem_set
            jump_6dac:
/*0x6dac*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6dae*/      uxtb r5, r5
/*0x6db0*/      bhs jump_6d8e
            jump_6db2:
/*0x6db2*/      add sp, #0x2c
/*0x6db4*/      pop {r4, r5, r6, r7, pc}
            jump_6db6:
/*0x6db6*/      ldr r0, [r4]
/*0x6db8*/      ldrb r0, [r0, r5]
/*0x6dba*/      b jump_6d96
            switch_6dbc:
/*0x6dbc*/      ldrb r7, [r4, #4]
/*0x6dbe*/      movs r5, #0xe
/*0x6dc0*/      mov r6, sp
/*0x6dc2*/      b jump_6de0
            jump_6dc4:
/*0x6dc4*/      ldr r0, [r4]
/*0x6dc6*/      ldrb r0, [r0, #3]
/*0x6dc8*/      lsls r1, r0, #5
/*0x6dca*/      sub.w r0, r1, r0, lsl #1
/*0x6dce*/      uxtb r1, r0
/*0x6dd0*/      add.w r0, r5, r5, lsl #1
/*0x6dd4*/      adds r2, r0, r6
/*0x6dd6*/      mov r0, r7
/*0x6dd8*/      bl call_3fe8
/*0x6ddc*/      adds r7, #0x20
/*0x6dde*/      uxtb r7, r7
            jump_6de0:
/*0x6de0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6de2*/      uxtb r5, r5
/*0x6de4*/      bhs jump_6dc4
/*0x6de6*/      ldr r5, [pc, #0x128] /* data_6f10 */
/*0x6de8*/      movs r4, #0x48
/*0x6dea*/      b jump_6e00
            jump_6dec:
/*0x6dec*/      ldrb r0, [r5]
/*0x6dee*/      cmp r0, #0xe
/*0x6df0*/      bhs jump_6dfe
/*0x6df2*/      add.w r0, r0, r0, lsl #1
/*0x6df6*/      adds r1, r0, r6
/*0x6df8*/      mov r0, r4
/*0x6dfa*/      bl call_408c
            jump_6dfe:
/*0x6dfe*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6e00:
/*0x6e00*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6e02*/      uxtb r4, r4
/*0x6e04*/      bhs jump_6dec
/*0x6e06*/      b jump_6db2
            switch_6e08:
/*0x6e08*/      add sp, #0x2c
/*0x6e0a*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x6e0c*/      pop.w {r4, r5, r6, r7, lr}
/*0x6e10*/      uxtb r0, r0
/*0x6e12*/      b.w jump_3a18
            jump_6e16:
/*0x6e16*/      cmp r0, #7
/*0x6e18*/      bls jump_6db2
/*0x6e1a*/      bic r0, r0, #1
/*0x6e1e*/      cmp r0, #8
/*0x6e20*/      beq switch_6e2e
/*0x6e22*/      cmp r0, #0xa
/*0x6e24*/      beq jump_6e3a
/*0x6e26*/      cmp r0, #0xc
/*0x6e28*/      bne jump_6db2
/*0x6e2a*/      movs r5, #0x48
/*0x6e2c*/      b jump_6efa
            switch_6e2e:
/*0x6e2e*/      add sp, #0x2c
/*0x6e30*/      adds r0, r4, #4
/*0x6e32*/      pop.w {r4, r5, r6, r7, lr}
/*0x6e36*/      b.w jump_4064
            jump_6e3a:
/*0x6e3a*/      movs r0, #0
/*0x6e3c*/      movs r5, #0xe
/*0x6e3e*/      str r0, [sp, #4]
/*0x6e40*/      b jump_6e98
            jump_6e42:
/*0x6e42*/      add.w r0, r5, r5, lsl #1
/*0x6e46*/      add.w r1, r4, r0, lsl #1
/*0x6e4a*/      ldrb r0, [r1, #4]!
/*0x6e4e*/      cbnz r0, jump_6e58
/*0x6e50*/      ldrb r0, [r1, #1]
/*0x6e52*/      cbnz r0, jump_6e58
/*0x6e54*/      ldrb r0, [r1, #2]
/*0x6e56*/      cbz r0, jump_6e84
            jump_6e58:
/*0x6e58*/      ldrb r0, [r1, #3]
/*0x6e5a*/      cbnz r0, jump_6e64
/*0x6e5c*/      ldrb r0, [r1, #4]
/*0x6e5e*/      cbnz r0, jump_6e64
/*0x6e60*/      ldrb r0, [r1, #5]
/*0x6e62*/      cbz r0, jump_6e80
            jump_6e64:
/*0x6e64*/      movs r2, #3
/*0x6e66*/      mov r6, sp
/*0x6e68*/      b jump_6e78
            jump_6e6a:
/*0x6e6a*/      adds r3, r1, r2
/*0x6e6c*/      ldrb r0, [r1, r2]
/*0x6e6e*/      ldrb r3, [r3, #3]
/*0x6e70*/      cmp r0, r3
/*0x6e72*/      bhi jump_6e76
/*0x6e74*/      mov r0, r3
            jump_6e76:
/*0x6e76*/      strb r0, [r6, r2]
            jump_6e78:
/*0x6e78*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6e7a*/      uxtb r2, r2
/*0x6e7c*/      bhs jump_6e6a
/*0x6e7e*/      mov r1, r6
            jump_6e80:
/*0x6e80*/      mov r0, r5
/*0x6e82*/      b jump_6e94
            jump_6e84:
/*0x6e84*/      ldrb r0, [r1, #3]
/*0x6e86*/      cbnz r0, jump_6e90
/*0x6e88*/      ldrb r0, [r1, #4]
/*0x6e8a*/      cbnz r0, jump_6e90
/*0x6e8c*/      ldrb r0, [r1, #5]
/*0x6e8e*/      cbz r0, jump_6ea0
            jump_6e90:
/*0x6e90*/      mov r0, r5
/*0x6e92*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6e94:
/*0x6e94*/      bl call_6f14
            jump_6e98:
/*0x6e98*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e9a*/      uxtb r5, r5
/*0x6e9c*/      bhs jump_6e42
/*0x6e9e*/      b jump_6db2
            jump_6ea0:
/*0x6ea0*/      add r1, sp, #4
/*0x6ea2*/      b jump_6e80
            jump_6ea4:
/*0x6ea4*/      ldr r0, [pc, #0x68] /* data_6f10 */
/*0x6ea6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6ea8*/      ldrb r1, [r0, r5]
/*0x6eaa*/      and r0, r1, #7
/*0x6eae*/      add.w r0, r0, r0, lsl #2
/*0x6eb2*/      add r0, r4
/*0x6eb4*/      ldrsb.w r2, [r0, #0x12]
/*0x6eb8*/      adds r0, #0xe
/*0x6eba*/      cbz r2, jump_6ef2
/*0x6ebc*/      ldrb r3, [r0, #3]
/*0x6ebe*/      rsbs r1, r3, r1, lsr #3
/*0x6ec2*/      bpl jump_6ec6
/*0x6ec4*/      rsbs r1, r1, #0
            jump_6ec6:
/*0x6ec6*/      subs r1, r1, r2
/*0x6ec8*/      adds r1, #0xa
/*0x6eca*/      uxtb r2, r1
/*0x6ecc*/      cmp r2, #0xa
/*0x6ece*/      bhs jump_6ef2
/*0x6ed0*/      movs r1, #3
/*0x6ed2*/      mov r3, sp
/*0x6ed4*/      adds r6, r4, r2
/*0x6ed6*/      b jump_6ee2
            jump_6ed8:
/*0x6ed8*/      ldrb r2, [r0, r1]
/*0x6eda*/      ldrb r7, [r6, #4]
/*0x6edc*/      muls r2, r7, r2
/*0x6ede*/      lsrs r2, r2, #8
/*0x6ee0*/      strb r2, [r3, r1]
            jump_6ee2:
/*0x6ee2*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6ee4*/      uxtb r1, r1
/*0x6ee6*/      bhs jump_6ed8
/*0x6ee8*/      mov r1, r3
/*0x6eea*/      mov r0, r5
/*0x6eec*/      bl call_408c
/*0x6ef0*/      b jump_6efa
            jump_6ef2:
/*0x6ef2*/      movs r1, #0
/*0x6ef4*/      mov r0, r5
/*0x6ef6*/      bl call_40d0
            jump_6efa:
/*0x6efa*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6efc*/      uxtb r5, r5
/*0x6efe*/      bhs jump_6ea4
/*0x6f00*/      b jump_6db2

/*0x6f02*/  .byte 0x00
/*0x6f03*/  .byte 0x00

            data_6f04:
/*0x6f04*/  .word 0x20000734
            data_6f08:
/*0x6f08*/  .word 0x20000090
            data_6f0c:
/*0x6f0c*/  .word 0x20000332
            data_6f10:
/*0x6f10*/  .word data_7c0a


            .thumb_func
            call_6f14:
/*0x6f14*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6f18*/      mov r7, r1
/*0x6f1a*/      mov r6, r0
/*0x6f1c*/      movs r4, #0x48
/*0x6f1e*/      ldr r5, [pc, #0x1c] /* data_6f3c */
/*0x6f20*/      b jump_6f32
            jump_6f22:
/*0x6f22*/      ldrb r0, [r5]
/*0x6f24*/      cmp r0, r6
/*0x6f26*/      bne jump_6f30
/*0x6f28*/      mov r1, r7
/*0x6f2a*/      mov r0, r4
/*0x6f2c*/      bl call_408c
            jump_6f30:
/*0x6f30*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6f32:
/*0x6f32*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6f34*/      uxtb r4, r4
/*0x6f36*/      bhs jump_6f22
/*0x6f38*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6f3c:
/*0x6f3c*/  .word data_7c0a


            .thumb_func
            call_6f40:
/*0x6f40*/      push {r3, r4, r5, lr}
/*0x6f42*/      mov r4, r0
/*0x6f44*/      ldr r0, [pc, #0x24] /* data_6f6c */
/*0x6f46*/      ldr r0, [r0]
/*0x6f48*/      ldrb r5, [r0, #3]
/*0x6f4a*/      cbnz r1, jump_6f54
/*0x6f4c*/      mov r0, sp
/*0x6f4e*/      bl call_3fc6
/*0x6f52*/      mov r1, sp
            jump_6f54:
/*0x6f54*/      movs r2, #3
/*0x6f56*/      b jump_6f64
            jump_6f58:
/*0x6f58*/      ldrb r0, [r1], #1
/*0x6f5c*/      muls r0, r5, r0
/*0x6f5e*/      lsrs r0, r0, #3
/*0x6f60*/      strb r0, [r4], #1
            jump_6f64:
/*0x6f64*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6f66*/      uxtb r2, r2
/*0x6f68*/      bhs jump_6f58
/*0x6f6a*/      pop {r3, r4, r5, pc}

            data_6f6c:
/*0x6f6c*/  .word 0x20000090


            .thumb_func
            call_6f70:
/*0x6f70*/      mov.w r1, #0x8000
/*0x6f74*/      cmp r0, r1
/*0x6f76*/      blo jump_6f7c
/*0x6f78*/      and.w r0, r1, r0, lsr #10
            jump_6f7c:
/*0x6f7c*/      uxth r0, r0
/*0x6f7e*/      bx lr

            .thumb_func
            call_6f80:
/*0x6f80*/      ldr r2, [pc, #0x14] /* data_6f98 */
/*0x6f82*/      push {lr}
/*0x6f84*/      ldr r0, [r2]
/*0x6f86*/      cbz r0, jump_6f92
/*0x6f88*/      bl call_6f70
/*0x6f8c*/      movs r1, #0x1e
/*0x6f8e*/      str r1, [r2]
/*0x6f90*/      pop {pc}
            jump_6f92:
/*0x6f92*/      movs r0, #0x1e
/*0x6f94*/      pop {pc}

/*0x6f96*/  .byte 0x00
/*0x6f97*/  .byte 0x00

            data_6f98:
/*0x6f98*/  .word 0x200019d4


            .thumb_func
            call_6f9c:
/*0x6f9c*/      lsls r1, r0, #0x10
/*0x6f9e*/      bpl jump_6fa2
/*0x6fa0*/      lsls r0, r0, #0xa
            jump_6fa2:
/*0x6fa2*/      bx lr

            .thumb_func
            call_6fa4:
/*0x6fa4*/      ldr r0, [pc, #0x3c] /* data_6fe4 */
/*0x6fa6*/      push {r4, lr}
/*0x6fa8*/      ldrb r0, [r0]
/*0x6faa*/      and r0, r0, #3
/*0x6fae*/      add.w r0, r0, r0, lsl #1
/*0x6fb2*/      lsls r4, r0, #3
/*0x6fb4*/      ldr r0, [pc, #0x30] /* data_6fe8 */
/*0x6fb6*/      ldr r0, [r0]
/*0x6fb8*/      bl call_4a1e
/*0x6fbc*/      mov r3, r0
/*0x6fbe*/      movs r0, #0x18
/*0x6fc0*/      ldr r1, [pc, #0x28] /* data_6fec */
/*0x6fc2*/      b jump_6fda
            jump_6fc4:
/*0x6fc4*/      add.w r2, r1, r4, lsl #1
/*0x6fc8*/      ldrh r2, [r2, #0x28]
/*0x6fca*/      ubfx r2, r2, #0, #0xa
/*0x6fce*/      cmp r2, r3
/*0x6fd0*/      bne jump_6fd6
/*0x6fd2*/      mov r0, r4
/*0x6fd4*/      pop {r4, pc}
            jump_6fd6:
/*0x6fd6*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6fd8*/      uxtb r4, r4
            jump_6fda:
/*0x6fda*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6fdc*/      uxtb r0, r0
/*0x6fde*/      bhs jump_6fc4
/*0x6fe0*/      movs r0, #0x60
/*0x6fe2*/      pop {r4, pc}

            data_6fe4:
/*0x6fe4*/  .word 0x20000001
            data_6fe8:
/*0x6fe8*/  .word 0x20000058
            data_6fec:
/*0x6fec*/  .word 0x20000734


            .thumb_func
            call_6ff0:
/*0x6ff0*/      ldr r0, [pc, #0xc] /* data_7000 */
/*0x6ff2*/      movs r1, #0
/*0x6ff4*/      str r1, [r0, #0xa]!
/*0x6ff8*/      str r1, [r0, #4]
/*0x6ffa*/      strh r1, [r0, #8]
/*0x6ffc*/      bx lr

/*0x6ffe*/  .byte 0x00
/*0x6fff*/  .byte 0x00

            data_7000:
/*0x7000*/  .word 0x200001b0


            .thumb_func
            call_7004:
/*0x7004*/      push {r4, r5, r6, lr}
/*0x7006*/      ldr r4, [pc, #0x68] /* data_7070 */
/*0x7008*/      ldr r1, [pc, #0x68] /* data_7074 */
/*0x700a*/      movs r0, #0x60
/*0x700c*/      strb r0, [r4, #2]
/*0x700e*/      ldrb r0, [r1, #1]
/*0x7010*/      lsls r0, r0, #0x1f
/*0x7012*/      beq jump_7022
/*0x7014*/      ldrb r0, [r1, #2]
/*0x7016*/      movs r1, #0
/*0x7018*/      bl call_46f4
/*0x701c*/      cmp r0, #0
/*0x701e*/      beq jump_706e
/*0x7020*/      b jump_7036
            jump_7022:
/*0x7022*/      movs r0, #2
/*0x7024*/      ldr r2, [pc, #0x50] /* data_7078 */
/*0x7026*/      ldrb r1, [r1]
/*0x7028*/      b jump_7030
            jump_702a:
/*0x702a*/      ldrb r3, [r2, r0]
/*0x702c*/      cmp r1, r3
/*0x702e*/      beq jump_706e
            jump_7030:
/*0x7030*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7032*/      uxtb r0, r0
/*0x7034*/      bhs jump_702a
            jump_7036:
/*0x7036*/      bl call_5b5c
/*0x703a*/      cmp r0, #0
/*0x703c*/      bne jump_706e
/*0x703e*/      ldr r0, [pc, #0x3c] /* data_707c */
/*0x7040*/      ldr r2, [pc, #0x3c] /* data_7080 */
/*0x7042*/      ldr r3, [pc, #0x40] /* data_7084 */
/*0x7044*/      ldrb r0, [r0]
/*0x7046*/      and r0, r0, #3
/*0x704a*/      add.w r0, r0, r0, lsl #1
/*0x704e*/      lsls r0, r0, #3
/*0x7050*/      strb r0, [r4, #2]
/*0x7052*/      movs r0, #0x18
/*0x7054*/      b jump_7068
            jump_7056:
/*0x7056*/      ldrb r1, [r4, #2]
/*0x7058*/      add.w r5, r2, r1, lsl #1
/*0x705c*/      ldrh r5, [r5, #0x28]
/*0x705e*/      cmp.w r3, r5, lsl #22
/*0x7062*/      beq jump_706e
/*0x7064*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x7066*/      strb r1, [r4, #2]
            jump_7068:
/*0x7068*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x706a*/      uxtb r0, r0
/*0x706c*/      bhs jump_7056
            jump_706e:
/*0x706e*/      pop {r4, r5, r6, pc}

            data_7070:
/*0x7070*/  .word 0x200019d0
            data_7074:
/*0x7074*/  .word 0x20000058
            data_7078:
/*0x7078*/  .word data_7b38
            data_707c:
/*0x707c*/  .word 0x20000001
            data_7080:
/*0x7080*/  .word 0x20000734
            data_7084:
/*0x7084*/  .word 0xffc00000

            jump_7088:
/*0x7088*/      push {r3, r4, r5, lr}
/*0x708a*/      ldr r1, [pc, #0xa0] /* data_712c */
/*0x708c*/      ldr r2, [pc, #0xa0] /* data_7130 */
/*0x708e*/      ldrh r0, [r1]
/*0x7090*/      ldr r2, [r2]
/*0x7092*/      add.w r4, r2, r0, lsl #2
/*0x7096*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7098*/      strh r0, [r1]
/*0x709a*/      ldrb r0, [r4, #1]
/*0x709c*/      movs r1, #4
/*0x709e*/      cmp.w r1, r0, lsr #5
/*0x70a2*/      beq jump_7120
/*0x70a4*/      movs r0, #0
/*0x70a6*/      str r0, [sp]
/*0x70a8*/      ldrh r0, [r4]
/*0x70aa*/      mov r1, sp
/*0x70ac*/      bl call_4a14
/*0x70b0*/      ldrb r0, [r4, #1]
/*0x70b2*/      lsrs r0, r0, #5
/*0x70b4*/      cmp r0, #1
/*0x70b6*/      beq jump_70be
/*0x70b8*/      cmp r0, #2
/*0x70ba*/      bne jump_70d4
/*0x70bc*/      b jump_70c8
            jump_70be:
/*0x70be*/      ldrb.w r0, [sp, #3]
/*0x70c2*/      orr r0, r0, #2
/*0x70c6*/      b jump_70d0
            jump_70c8:
/*0x70c8*/      ldrb.w r0, [sp, #3]
/*0x70cc*/      bic r0, r0, #2
            jump_70d0:
/*0x70d0*/      strb.w r0, [sp, #3]
            jump_70d4:
/*0x70d4*/      ldrb.w r0, [sp, #1]
/*0x70d8*/      lsls r0, r0, #0x1f
/*0x70da*/      ldrb.w r0, [sp]
/*0x70de*/      beq jump_70e6
/*0x70e0*/      bl call_46d4
/*0x70e4*/      b jump_70ea
            jump_70e6:
/*0x70e6*/      ldr r1, [pc, #0x4c] /* data_7134 */
/*0x70e8*/      ldrb r0, [r1, r0]
            jump_70ea:
/*0x70ea*/      strb.w r0, [sp, #2]
/*0x70ee*/      ldrb.w r0, [sp, #3]
/*0x70f2*/      orr r0, r0, #5
/*0x70f6*/      strb.w r0, [sp, #3]
/*0x70fa*/      ldrb.w r1, [sp, #1]
/*0x70fe*/      ldrb.w r2, [sp, #2]
/*0x7102*/      and r1, r1, #1
/*0x7106*/      add.w r1, r1, r1, lsl #2
/*0x710a*/      add.w r1, r2, r1, lsl #1
/*0x710e*/      ubfx r2, r0, #1, #1
/*0x7112*/      uxtb r1, r1
/*0x7114*/      ldr r0, [pc, #0x20] /* data_7138 */
/*0x7116*/      bl call_3fa8
/*0x711a*/      ldr r0, [sp]
/*0x711c*/      bl call_4780
            jump_7120:
/*0x7120*/      ldrh r0, [r4, #2]
/*0x7122*/      bl call_6f9c
/*0x7126*/      ldr r1, [pc, #0x14] /* data_713c */
/*0x7128*/      str r0, [r1]
/*0x712a*/      pop {r3, r4, r5, pc}

            data_712c:
/*0x712c*/  .word 0x200019d0
            data_7130:
/*0x7130*/  .word 0x2000005c
            data_7134:
/*0x7134*/  .word 0x200001c4
            data_7138:
/*0x7138*/  .word 0x200001ba
            data_713c:
/*0x713c*/  .word 0x20000064

            jump_7140:
/*0x7140*/      push {r4, r5, r6, lr}
/*0x7142*/      ldr r5, [pc, #0x60] /* data_71a4 */
/*0x7144*/      ldrh r0, [r5]
/*0x7146*/      cmp r0, #0xff
/*0x7148*/      bls jump_7152
/*0x714a*/      movs r0, #1
/*0x714c*/      adds r1, r5, #4
/*0x714e*/      strb r0, [r1, #7]
/*0x7150*/      b jump_7160
            jump_7152:
/*0x7152*/      ldr r6, [pc, #0x54] /* data_71a8 */
/*0x7154*/      ldrb r1, [r6, #1]
/*0x7156*/      lsls r1, r1, #0x1f
/*0x7158*/      beq jump_7164
/*0x715a*/      ldrb r1, [r6]
/*0x715c*/      cmp r1, #0xc0
/*0x715e*/      bhs jump_7164
            jump_7160:
/*0x7160*/      movs r0, #1
/*0x7162*/      pop {r4, r5, r6, pc}
            jump_7164:
/*0x7164*/      ldr r1, [pc, #0x44] /* data_71ac */
/*0x7166*/      ldr r1, [r1]
/*0x7168*/      add.w r4, r1, r0, lsl #2
/*0x716c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x716e*/      strh r0, [r5]
/*0x7170*/      ldr r0, [r6]
/*0x7172*/      bl call_4a1e
/*0x7176*/      strh r0, [r4]
/*0x7178*/      ldrb r1, [r6, #3]
/*0x717a*/      lsls r1, r1, #0x1e
/*0x717c*/      bpl jump_7184
/*0x717e*/      add.w r0, r0, #0x3c00
/*0x7182*/      b jump_7188
            jump_7184:
/*0x7184*/      add.w r0, r0, #0x5c00
            jump_7188:
/*0x7188*/      strh r0, [r4]
/*0x718a*/      ldrh r0, [r5]
/*0x718c*/      cmp r0, #1
/*0x718e*/      bls jump_7198
/*0x7190*/      bl call_6f80
/*0x7194*/      strh r0, [r4, #-0x2]
            jump_7198:
/*0x7198*/      ldr r1, [pc, #0x14] /* data_71b0 */
/*0x719a*/      mov.w r0, #-1
/*0x719e*/      str r0, [r1]
/*0x71a0*/      movs r0, #0
/*0x71a2*/      pop {r4, r5, r6, pc}

            data_71a4:
/*0x71a4*/  .word 0x200019d0
            data_71a8:
/*0x71a8*/  .word 0x20000058
            data_71ac:
/*0x71ac*/  .word 0x2000005c
            data_71b0:
/*0x71b0*/  .word 0x20000064

            jump_71b4:
/*0x71b4*/      push {r4, lr}
/*0x71b6*/      ldr r4, [pc, #0x18] /* data_71d0 */
/*0x71b8*/      movs r1, #0
/*0x71ba*/      ldrb r0, [r4, #2]
/*0x71bc*/      bl call_3d90
/*0x71c0*/      movs r0, #0
/*0x71c2*/      adds r1, r4, #4
/*0x71c4*/      strh r0, [r4]
/*0x71c6*/      str r0, [r1]
/*0x71c8*/      movs r0, #4
/*0x71ca*/      strb r0, [r1, #7]
/*0x71cc*/      pop {r4, pc}

/*0x71ce*/  .byte 0x00
/*0x71cf*/  .byte 0x00

            data_71d0:
/*0x71d0*/  .word 0x200019d0


            .thumb_func
            call_71d4:
/*0x71d4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x71d8*/      ldr r4, [pc, #0xa0] /* data_727c */
/*0x71da*/      ldr r5, [pc, #0xa4] /* data_7280 */
/*0x71dc*/      ldr.w r8, [pc, #0xa4] /* data_7284 */
/*0x71e0*/      ldr r7, [pc, #0xa4] /* data_7288 */
/*0x71e2*/      movs r6, #0xa
            jump_71e4:
/*0x71e4*/      ldrd r0, r1, [r5]
/*0x71e8*/      str r1, [r0, #0x28]
/*0x71ea*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x71ec*/      uxtb r6, r6
/*0x71ee*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x71f0*/      nop 
/*0x71f2*/      nop 
/*0x71f4*/      movs r0, #0xff
/*0x71f6*/      ldr r1, [r7, #0x1c]
/*0x71f8*/      lsls r1, r1, #0x16
/*0x71fa*/      bmi jump_71fe
/*0x71fc*/      movs r0, #0xfe
            jump_71fe:
/*0x71fe*/      ldr.w r2, [r8, #0x1c]
/*0x7202*/      mov r1, r8
/*0x7204*/      lsls r2, r2, #0x1a
/*0x7206*/      bmi jump_720c
/*0x7208*/      bic r0, r0, #2
            jump_720c:
/*0x720c*/      ldr r2, [r1, #0x1c]
/*0x720e*/      lsls r2, r2, #0x19
/*0x7210*/      bmi jump_7216
/*0x7212*/      bic r0, r0, #4
            jump_7216:
/*0x7216*/      ldr r1, [r1, #0x1c]
/*0x7218*/      lsls r1, r1, #0x18
/*0x721a*/      bmi jump_7220
/*0x721c*/      bic r0, r0, #8
            jump_7220:
/*0x7220*/      ldr r1, [r7, #0x1c]
/*0x7222*/      lsls r1, r1, #0x14
/*0x7224*/      bmi jump_722a
/*0x7226*/      bic r0, r0, #0x10
            jump_722a:
/*0x722a*/      ldr r1, [r7, #0x1c]
/*0x722c*/      lsls r1, r1, #0x12
/*0x722e*/      bmi jump_7234
/*0x7230*/      bic r0, r0, #0x20
            jump_7234:
/*0x7234*/      ldr r1, [r7, #0x1c]
/*0x7236*/      lsls r1, r1, #0x11
/*0x7238*/      bmi jump_723e
/*0x723a*/      bic r0, r0, #0x40
            jump_723e:
/*0x723e*/      ldr r1, [r7, #0x1c]
/*0x7240*/      lsls r1, r1, #0x10
/*0x7242*/      bmi jump_7248
/*0x7244*/      bic r0, r0, #0x80
            jump_7248:
/*0x7248*/      ldrd r1, r2, [r5]
/*0x724c*/      str r2, [r1, #0x24]
/*0x724e*/      ldrb r1, [r4, #1]
/*0x7250*/      cmp r1, r0
/*0x7252*/      beq jump_725a
/*0x7254*/      strb r0, [r4, #1]
/*0x7256*/      movs r0, #3
/*0x7258*/      b jump_7266
            jump_725a:
/*0x725a*/      ldrb r0, [r4]
/*0x725c*/      cbz r0, jump_7268
/*0x725e*/      cmp r0, #1
/*0x7260*/      bne jump_7264
/*0x7262*/      strb r1, [r4, #2]
            jump_7264:
/*0x7264*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_7266:
/*0x7266*/      strb r0, [r4]
            jump_7268:
/*0x7268*/      cmp r6, #0
/*0x726a*/      beq jump_7276
/*0x726c*/      movs r0, #5
/*0x726e*/      bl call_37c4
/*0x7272*/      subs r5, #8
/*0x7274*/      b jump_71e4
            jump_7276:
/*0x7276*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x727a*/  .byte 0x00
/*0x727b*/  .byte 0x00

            data_727c:
/*0x727c*/  .word 0x20000332
            data_7280:
/*0x7280*/  .word data_7d48
            data_7284:
/*0x7284*/  .word 0x400b0000
            data_7288:
/*0x7288*/  .word 0x400b4000

            jump_728c:
/*0x728c*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x728e*/      ldr r0, [pc, #0x44] /* data_72d4 */
/*0x7290*/      ldr r0, [r0]
/*0x7292*/      ldr r1, [pc, #0x44] /* data_72d8 */
/*0x7294*/      ldr r6, [pc, #0x44] /* data_72dc */
/*0x7296*/      udiv r4, r0, r1
/*0x729a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x729c*/      strh.w r4, [sp]
/*0x72a0*/      movs r5, #0
/*0x72a2*/      strh.w r5, [sp, #2]
/*0x72a6*/      mov r1, sp
/*0x72a8*/      mov r0, r6
/*0x72aa*/      bl call_461a
/*0x72ae*/      strb.w r5, [sp]
/*0x72b2*/      movs r0, #7
/*0x72b4*/      strh.w r0, [sp, #2]
/*0x72b8*/      movs r0, #1
/*0x72ba*/      strb.w r0, [sp, #4]
/*0x72be*/      strb.w r5, [sp, #5]
/*0x72c2*/      lsrs r0, r4, #1
/*0x72c4*/      strh.w r0, [sp, #6]
/*0x72c8*/      mov r1, sp
/*0x72ca*/      mov r0, r6
/*0x72cc*/      bl call_45c2
/*0x72d0*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x72d2*/  .byte 0x00
/*0x72d3*/  .byte 0x00

            data_72d4:
/*0x72d4*/  .word 0x20000014
            data_72d8:
/*0x72d8*/  .word 0x00dbba00
            data_72dc:
/*0x72dc*/  .word 0x4006f000


            .thumb_func
            call_72e0:
/*0x72e0*/      push {r4, lr}
/*0x72e2*/      ldr r1, [pc, #0x28] /* data_730c */
/*0x72e4*/      mov.w r4, #0x8000
/*0x72e8*/      str r4, [r1, #0x28]
/*0x72ea*/      nop 
/*0x72ec*/      nop 
/*0x72ee*/      str r4, [r1, #0x24]
/*0x72f0*/      mov.w r2, #0x4000
/*0x72f4*/      b jump_7300
            jump_72f6:
/*0x72f6*/      str r2, [r1, #0x28]
/*0x72f8*/      nop 
/*0x72fa*/      nop 
/*0x72fc*/      str r2, [r1, #0x24]
/*0x72fe*/      nop 
            jump_7300:
/*0x7300*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7302*/      uxtb r0, r0
/*0x7304*/      bhs jump_72f6
/*0x7306*/      str r4, [r1, #0x28]
/*0x7308*/      pop {r4, pc}

/*0x730a*/  .byte 0x00
/*0x730b*/  .byte 0x00

            data_730c:
/*0x730c*/  .word 0x400b0000


            .thumb_func
            call_7310:
/*0x7310*/      push {r4, r5, r6, r7, lr}
/*0x7312*/      movs r2, #4
/*0x7314*/      ldr r3, [pc, #0x24] /* data_733c */
/*0x7316*/      lsls r4, r2, #0xc
/*0x7318*/      ldr r5, [pc, #0x24] /* data_7340 */
/*0x731a*/      movw r6, #0xffff
/*0x731e*/      b jump_7334
            jump_7320:
/*0x7320*/      nop 
/*0x7322*/      str r4, [r5, #0x28]
/*0x7324*/      lsls r7, r0, #0x10
/*0x7326*/      bpl jump_732c
/*0x7328*/      str r2, [r3, #0x24]
/*0x732a*/      b jump_732e
            jump_732c:
/*0x732c*/      str r2, [r3, #0x28]
            jump_732e:
/*0x732e*/      str r4, [r5, #0x24]
/*0x7330*/      and.w r0, r6, r0, lsl #1
            jump_7334:
/*0x7334*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x7336*/      uxtb r1, r1
/*0x7338*/      bhs jump_7320
/*0x733a*/      pop {r4, r5, r6, r7, pc}

            data_733c:
/*0x733c*/  .word 0x400b4000
            data_7340:
/*0x7340*/  .word 0x400b0000


            .thumb_func
            loc_7344:
/*0x7344*/      movs r1, #1
/*0x7346*/      lsls r1, r0
/*0x7348*/      ldr r0, [pc, #8] /* data_7354 */
/*0x734a*/      ldrb r2, [r0, #6]
/*0x734c*/      orrs r1, r2
/*0x734e*/      strb r1, [r0, #6]
/*0x7350*/      bx lr

/*0x7352*/  .byte 0x00
/*0x7353*/  .byte 0x00

            data_7354:
/*0x7354*/  .word 0x2000002c


            .thumb_func
            call_7358:
/*0x7358*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x735c*/      ldr r0, [pc, #0xdc] /* data_743c */
/*0x735e*/      ldrb r1, [r0]
/*0x7360*/      movs r4, #0
/*0x7362*/      sub.w r5, r0, #0xa
/*0x7366*/      cmp r1, #1
/*0x7368*/      bne jump_7376
/*0x736a*/      strb r4, [r0]
/*0x736c*/      ldrb r0, [r5, #0x10]
/*0x736e*/      and r0, r0, #7
/*0x7372*/      bl call_5c14
            jump_7376:
/*0x7376*/      ldr r6, [pc, #0xc8] /* data_7440 */
/*0x7378*/      ldr r7, [pc, #0xc8] /* data_7444 */
/*0x737a*/      ldrb r0, [r6]
/*0x737c*/      cbz r0, jump_738a
/*0x737e*/      cmp r0, #2
/*0x7380*/      beq jump_73b4
/*0x7382*/      cmp r0, #4
/*0x7384*/      beq jump_738a
/*0x7386*/      cmp r0, #5
/*0x7388*/      bne jump_73c6
            jump_738a:
/*0x738a*/      ldrb r0, [r5, #6]
/*0x738c*/      lsls r0, r0, #0x1b
/*0x738e*/      bpl jump_73c6
/*0x7390*/      movs r0, #1
/*0x7392*/      strb r0, [r6]
/*0x7394*/      movs r2, #0x40
/*0x7396*/      ldr r1, [pc, #0xb0] /* data_7448 */
/*0x7398*/      movs r0, #4
/*0x739a*/      bl call_6a64
/*0x739e*/      ldr r2, [pc, #0xa8] /* data_7448 */
/*0x73a0*/      rsb.w r1, r0, #0x40
/*0x73a4*/      add r0, r2
/*0x73a6*/      bl mem_zero
/*0x73aa*/      ldrb r0, [r5, #6]
/*0x73ac*/      bic r0, r0, #0x10
/*0x73b0*/      strb r0, [r5, #6]
/*0x73b2*/      b jump_73c6
            jump_73b4:
/*0x73b4*/      ldr r0, [r7, #0x50]
/*0x73b6*/      lsls r0, r0, #0x1e
/*0x73b8*/      bpl jump_73c6
/*0x73ba*/      movs r2, #0x40
/*0x73bc*/      ldr r1, [pc, #0x88] /* data_7448 */
/*0x73be*/      movs r0, #3
/*0x73c0*/      bl call_6ac4
/*0x73c4*/      strb r4, [r6]
            jump_73c6:
/*0x73c6*/      ldr r0, [r7, #0x28]
/*0x73c8*/      lsls r0, r0, #0x1e
/*0x73ca*/      bpl jump_73fc
/*0x73cc*/      ldrb r0, [r5]
/*0x73ce*/      cbz r0, jump_73d4
/*0x73d0*/      strb r4, [r5]
/*0x73d2*/      b jump_73f0
            jump_73d4:
/*0x73d4*/      ldr r1, [pc, #0x74] /* data_744c */
/*0x73d6*/      ldr r0, [r1]
/*0x73d8*/      cbnz r0, jump_73fc
/*0x73da*/      add.w r0, r1, #0xc
/*0x73de*/      ldr r0, [r0]
/*0x73e0*/      cbz r0, jump_73fc
/*0x73e2*/      mov.w r2, #0xfa0
/*0x73e6*/      muls r0, r2, r0
/*0x73e8*/      asrs r2, r2, #3
/*0x73ea*/      udiv r0, r0, r2
/*0x73ee*/      str r0, [r1]
            jump_73f0:
/*0x73f0*/      ldr r1, [pc, #0x48] /* data_743c */
/*0x73f2*/      movs r2, #8
/*0x73f4*/      adds r1, #0x12
/*0x73f6*/      movs r0, #1
/*0x73f8*/      bl call_6ac4
            jump_73fc:
/*0x73fc*/      ldr r0, [r7, #0x3c]
/*0x73fe*/      lsls r0, r0, #0x1e
/*0x7400*/      bpl jump_7436
/*0x7402*/      ldrb r0, [r5, #2]
/*0x7404*/      cbz r0, jump_7410
/*0x7406*/      ldr r1, [pc, #0x34] /* data_743c */
/*0x7408*/      movs r2, #5
/*0x740a*/      strb r4, [r5, #2]
/*0x740c*/      adds r1, #0xa
/*0x740e*/      b jump_742c
            jump_7410:
/*0x7410*/      ldrb r0, [r5, #1]
/*0x7412*/      cbz r0, jump_741e
/*0x7414*/      ldr r1, [pc, #0x24] /* data_743c */
/*0x7416*/      movs r2, #2
/*0x7418*/      strb r4, [r5, #1]
/*0x741a*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x741c*/      b jump_742c
            jump_741e:
/*0x741e*/      ldrb r0, [r5, #3]
/*0x7420*/      cmp r0, #0
/*0x7422*/      beq jump_7436
/*0x7424*/      ldr r1, [pc, #0x24] /* data_744c */
/*0x7426*/      movs r2, #0x1f
/*0x7428*/      strb r4, [r5, #3]
/*0x742a*/      adds r1, #0x18
            jump_742c:
/*0x742c*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7430*/      movs r0, #2
/*0x7432*/      b.w call_6ac4
            jump_7436:
/*0x7436*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x743a*/  .byte 0x00
/*0x743b*/  .byte 0x00

            data_743c:
/*0x743c*/  .word 0x20000036
            data_7440:
/*0x7440*/  .word 0x20000050
            data_7444:
/*0x7444*/  .word 0x400a8000
            data_7448:
/*0x7448*/  .word 0x20000680
            data_744c:
/*0x744c*/  .word 0x2000060c


            .thumb_func
            loc_7450:
/*0x7450*/      push {r4, r5, r6, r7, lr}
/*0x7452*/      ldrh r1, [r0]
/*0x7454*/      mov.w r6, #0x100
/*0x7458*/      movw r5, #0x921
/*0x745c*/      lsls r7, r6, #1
/*0x745e*/      movs r3, #1
/*0x7460*/      ldr r4, [pc, #0xd4] /* data_7538 */
/*0x7462*/      subw r2, r1, #0x921
/*0x7466*/      cmp r1, r5
/*0x7468*/      beq jump_74e4
/*0x746a*/      bgt jump_7488
/*0x746c*/      adds.w r1, r2, #0x780
/*0x7470*/      beq jump_749a
/*0x7472*/      cmp r1, r6
/*0x7474*/      beq jump_74d8
/*0x7476*/      cmp r1, r7
/*0x7478*/      bne jump_7506
/*0x747a*/      ldrh r1, [r0, #4]
/*0x747c*/      cmp r1, #0
/*0x747e*/      bne jump_7506
/*0x7480*/      ldr r1, [pc, #0xb8] /* data_753c */
/*0x7482*/      strd r1, r3, [r0, #0x1c]
/*0x7486*/      b jump_7530
            jump_7488:
/*0x7488*/      movs r5, #0
/*0x748a*/      cmp r2, r6
/*0x748c*/      beq jump_750a
/*0x748e*/      cmp r2, r7
/*0x7490*/      bne jump_7506
/*0x7492*/      ldrh r2, [r0, #4]
/*0x7494*/      ldrb r1, [r0, #2]
/*0x7496*/      cbz r2, jump_7508
/*0x7498*/      b jump_752e
            jump_749a:
/*0x749a*/      ldrb r5, [r0, #3]
/*0x749c*/      ldrb r2, [r0, #2]
/*0x749e*/      ldrh r4, [r0, #6]
/*0x74a0*/      ldrh r1, [r0, #4]
/*0x74a2*/      cmp r5, #1
/*0x74a4*/      bne jump_7506
/*0x74a6*/      cbz r1, jump_74c2
/*0x74a8*/      cmp r1, #1
/*0x74aa*/      beq jump_7506
/*0x74ac*/      cmp r1, #2
/*0x74ae*/      bne jump_7506
/*0x74b0*/      cmp r2, #1
/*0x74b2*/      beq jump_74c8
/*0x74b4*/      cmp r2, #2
/*0x74b6*/      beq jump_74d2
/*0x74b8*/      cmp r2, #4
/*0x74ba*/      bne jump_7506
/*0x74bc*/      ldr r1, [pc, #0x78] /* data_7538 */
/*0x74be*/      adds r1, #0xc
/*0x74c0*/      b jump_74cc
            jump_74c2:
/*0x74c2*/      ldr r1, [pc, #0x78] /* data_753c */
/*0x74c4*/      adds r1, #0x18
/*0x74c6*/      b jump_74cc
            jump_74c8:
/*0x74c8*/      ldr r1, [pc, #0x70] /* data_753c */
/*0x74ca*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_74cc:
/*0x74cc*/      strd r1, r4, [r0, #0x1c]
/*0x74d0*/      b jump_7530
            jump_74d2:
/*0x74d2*/      ldr r1, [pc, #0x68] /* data_753c */
/*0x74d4*/      adds r1, #0x10
/*0x74d6*/      b jump_74cc
            jump_74d8:
/*0x74d8*/      ldrh r1, [r0, #4]
/*0x74da*/      cmp r1, #0
/*0x74dc*/      bne jump_7506
/*0x74de*/      strd r4, r3, [r0, #0x1c]
/*0x74e2*/      b jump_7530
            jump_74e4:
/*0x74e4*/      ldrb r3, [r0, #3]
/*0x74e6*/      ldrh r2, [r0, #6]
/*0x74e8*/      ldrh r1, [r0, #4]
/*0x74ea*/      str r2, [r0, #0x20]
/*0x74ec*/      cmp r3, #2
/*0x74ee*/      bne jump_7506
/*0x74f0*/      cmp r1, #0
/*0x74f2*/      bne jump_7506
/*0x74f4*/      ldr r2, [pc, #0x44] /* data_753c */
/*0x74f6*/      adds r2, #0xc
/*0x74f8*/      str r2, [r0, #0x1c]
/*0x74fa*/      ldr r2, [pc, #0x44] /* data_7540 */
/*0x74fc*/      strd r2, r1, [r0, #0x28]
/*0x7500*/      movs r1, #2
/*0x7502*/      strb.w r1, [r0, #0x24]
            jump_7506:
/*0x7506*/      pop {r4, r5, r6, r7, pc}
            jump_7508:
/*0x7508*/      b jump_7528
            jump_750a:
/*0x750a*/      ldrh r2, [r0, #4]
/*0x750c*/      ldrb r1, [r0, #3]
/*0x750e*/      cmp r2, #0
/*0x7510*/      bne jump_7506
/*0x7512*/      mov.w r2, #0xfa0
/*0x7516*/      str r1, [r4]
/*0x7518*/      muls r1, r2, r1
/*0x751a*/      asrs r2, r2, #3
/*0x751c*/      udiv r1, r1, r2
/*0x7520*/      ldr r2, [pc, #0x14] /* data_7538 */
/*0x7522*/      subs r2, #0xc
/*0x7524*/      str r1, [r2]
/*0x7526*/      b jump_752e
            jump_7528:
/*0x7528*/      ldr r2, [pc, #0x10] /* data_753c */
/*0x752a*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x752c*/      strb r1, [r2, #4]
            jump_752e:
/*0x752e*/      str r5, [r0, #0x20]
            jump_7530:
/*0x7530*/      strb.w r3, [r0, #0x24]
/*0x7534*/      b jump_7506

/*0x7536*/  .byte 0x00
/*0x7537*/  .byte 0x00

            data_7538:
/*0x7538*/  .word 0x20000618
            data_753c:
/*0x753c*/  .word 0x20000030
            data_7540:
/*0x7540*/  .word loc_7544


            .thumb_func
            loc_7544:
/*0x7544*/      ldr r2, [pc, #4] /* data_754c */
/*0x7546*/      movs r1, #1
/*0x7548*/      strb r1, [r2, r0]
/*0x754a*/      bx lr

            data_754c:
/*0x754c*/  .word 0x20000036


            .thumb_func
            loc_7550:
/*0x7550*/      ldrb r2, [r0, #3]
/*0x7552*/      ldrh r1, [r0, #4]
/*0x7554*/      movs r3, #1
/*0x7556*/      cmp r2, #0x21
/*0x7558*/      beq jump_756a
/*0x755a*/      cmp r2, #0x22
/*0x755c*/      bne jump_75a2
/*0x755e*/      cbz r1, jump_758c
/*0x7560*/      cmp r1, #1
/*0x7562*/      beq jump_7594
/*0x7564*/      cmp r1, #2
/*0x7566*/      bne jump_759e
/*0x7568*/      b jump_75a4
            jump_756a:
/*0x756a*/      cbz r1, jump_7576
/*0x756c*/      cmp r1, #1
/*0x756e*/      beq jump_757c
/*0x7570*/      cmp r1, #2
/*0x7572*/      bne jump_7582
/*0x7574*/      b jump_7586
            jump_7576:
/*0x7576*/      ldr r1, [r0, #0xc]
/*0x7578*/      adds r1, #0x12
/*0x757a*/      b jump_7580
            jump_757c:
/*0x757c*/      ldr r1, [r0, #0xc]
/*0x757e*/      adds r1, #0x2b
            jump_7580:
/*0x7580*/      str r1, [r0, #0x1c]
            jump_7582:
/*0x7582*/      movs r1, #9
/*0x7584*/      b jump_759c
            jump_7586:
/*0x7586*/      ldr r1, [r0, #0xc]
/*0x7588*/      adds r1, #0x4b
/*0x758a*/      b jump_7580
            jump_758c:
/*0x758c*/      ldr r1, [pc, #0x20] /* data_75b0 */
/*0x758e*/      str r1, [r0, #0x1c]
/*0x7590*/      movs r1, #0x40
/*0x7592*/      b jump_759c
            jump_7594:
/*0x7594*/      ldr r1, [pc, #0x18] /* data_75b0 */
/*0x7596*/      subs r1, #0xac
/*0x7598*/      str r1, [r0, #0x1c]
/*0x759a*/      movs r1, #0x22
            jump_759c:
/*0x759c*/      str r1, [r0, #0x20]
            jump_759e:
/*0x759e*/      strb.w r3, [r0, #0x24]
            jump_75a2:
/*0x75a2*/      bx lr
            jump_75a4:
/*0x75a4*/      ldr r1, [pc, #8] /* data_75b0 */
/*0x75a6*/      subs r1, #0x88
/*0x75a8*/      str r1, [r0, #0x1c]
/*0x75aa*/      movs r1, #0x86
/*0x75ac*/      b jump_759c

/*0x75ae*/  .byte 0x00
/*0x75af*/  .byte 0x00

            data_75b0:
/*0x75b0*/  .word usb_report0_desc


            .thumb_func
            call_75b4:
/*0x75b4*/      push {r4, r5, r6, lr}
/*0x75b6*/      mov r4, r0
/*0x75b8*/      movs r0, #0
/*0x75ba*/      bl call_69bc
/*0x75be*/      mov r5, r0
/*0x75c0*/      ldr r0, [r4, #0x20]
/*0x75c2*/      adds r1, r0, #1
/*0x75c4*/      beq jump_75f4
/*0x75c6*/      ldrb.w r1, [r4, #0x24]
/*0x75ca*/      cmp r1, #1
/*0x75cc*/      bne jump_75f4
/*0x75ce*/      cmp r0, r5
/*0x75d0*/      blo jump_75d8
/*0x75d2*/      subs r0, r0, r5
/*0x75d4*/      str r0, [r4, #0x20]
/*0x75d6*/      b jump_75e4
            jump_75d8:
/*0x75d8*/      mov r5, r0
/*0x75da*/      movs r0, #0
/*0x75dc*/      str r0, [r4, #0x20]
/*0x75de*/      movs r0, #2
/*0x75e0*/      strb.w r0, [r4, #0x24]
            jump_75e4:
/*0x75e4*/      mov r2, r5
/*0x75e6*/      movs r0, #0
/*0x75e8*/      ldr r1, [r4, #0x1c]
/*0x75ea*/      bl call_6ac4
/*0x75ee*/      ldr r0, [r4, #0x1c]
/*0x75f0*/      add r0, r5
/*0x75f2*/      str r0, [r4, #0x1c]
            jump_75f4:
/*0x75f4*/      pop {r4, r5, r6, pc}

/*0x75f6*/  .byte 0x00
/*0x75f7*/  .byte 0x00


            .thumb_func
            call_75f8:
/*0x75f8*/      push {r4, lr}
/*0x75fa*/      mov r4, r0
/*0x75fc*/      movs r0, #0
/*0x75fe*/      strb.w r0, [r4, #0x24]
/*0x7602*/      str r0, [r4, #0x20]
/*0x7604*/      ldrb r0, [r4]
/*0x7606*/      ands r0, r0, #0x60
/*0x760a*/      beq jump_7612
/*0x760c*/      cmp r0, #0x20
/*0x760e*/      bne jump_7624
/*0x7610*/      b jump_761a
            jump_7612:
/*0x7612*/      mov r0, r4
/*0x7614*/      bl call_7698
/*0x7618*/      b jump_7624
            jump_761a:
/*0x761a*/      ldr r0, [pc, #0x40] /* data_765c */
/*0x761c*/      ldr r1, [r0, #0x14]
/*0x761e*/      cbz r1, jump_7624
/*0x7620*/      mov r0, r4
/*0x7622*/      blx r1
            jump_7624:
/*0x7624*/      ldrb.w r0, [r4, #0x24]
/*0x7628*/      cmp r0, #1
/*0x762a*/      beq jump_763a
/*0x762c*/      cmp r0, #2
/*0x762e*/      beq jump_764e
/*0x7630*/      pop.w {r4, lr}
/*0x7634*/      movs r0, #0
/*0x7636*/      b.w jump_6aa4
            jump_763a:
/*0x763a*/      ldrh r0, [r4, #6]
/*0x763c*/      ldr r1, [r4, #0x20]
/*0x763e*/      cmp r1, r0
/*0x7640*/      ble jump_7644
/*0x7642*/      str r0, [r4, #0x20]
            jump_7644:
/*0x7644*/      mov r0, r4
/*0x7646*/      pop.w {r4, lr}
/*0x764a*/      b.w call_75b4
            jump_764e:
/*0x764e*/      movs r2, #0
/*0x7650*/      pop.w {r4, lr}
/*0x7654*/      mov r1, r2
/*0x7656*/      mov r0, r2
/*0x7658*/      b.w call_6ac4

            data_765c:
/*0x765c*/  .word data_8188

            jump_7660:
/*0x7660*/      push {r4, lr}
/*0x7662*/      mov r4, r0
/*0x7664*/      movs r0, #0
/*0x7666*/      strb r0, [r4, #0x19]
/*0x7668*/      cbz r1, jump_767e
/*0x766a*/      cmp r1, #1
/*0x766c*/      beq jump_7682
/*0x766e*/      cmp r1, #2
/*0x7670*/      bne jump_7694
/*0x7672*/      ldrb r0, [r4, #4]
/*0x7674*/      and r0, r0, #0xf
/*0x7678*/      bl call_69ca
/*0x767c*/      b jump_7682
            jump_767e:
/*0x767e*/      ldrb.w r0, [r4, #0x34]
            jump_7682:
/*0x7682*/      strb r0, [r4, #0x18]
/*0x7684*/      add.w r0, r4, #0x18
/*0x7688*/      str r0, [r4, #0x1c]
/*0x768a*/      movs r0, #2
/*0x768c*/      str r0, [r4, #0x20]
/*0x768e*/      movs r0, #1
/*0x7690*/      strb.w r0, [r4, #0x24]
            jump_7694:
/*0x7694*/      pop {r4, pc}

/*0x7696*/  .byte 0x00
/*0x7697*/  .byte 0x00


            .thumb_func
            call_7698:
/*0x7698*/      push {r4, r5, r6, lr}
/*0x769a*/      mov r4, r0
/*0x769c*/      ldrh r0, [r0]
/*0x769e*/      movs r5, #1
/*0x76a0*/      cmp.w r0, #0x500
/*0x76a4*/      beq jump_7746
/*0x76a6*/      bgt jump_76ea
/*0x76a8*/      cmp.w r0, #0x100
/*0x76ac*/      beq jump_7738
/*0x76ae*/      bgt jump_76c8
/*0x76b0*/      cmp r0, #0x80
/*0x76b2*/      beq jump_7730
/*0x76b4*/      cmp r0, #0x81
/*0x76b6*/      beq jump_7734
/*0x76b8*/      cmp r0, #0x82
/*0x76ba*/      bne jump_778a
/*0x76bc*/      movs r1, #2
            jump_76be:
/*0x76be*/      mov r0, r4
/*0x76c0*/      pop.w {r4, r5, r6, lr}
/*0x76c4*/      b.w jump_7660
            jump_76c8:
/*0x76c8*/      cmp.w r0, #0x102
/*0x76cc*/      beq jump_773c
/*0x76ce*/      cmp.w r0, #0x300
/*0x76d2*/      beq jump_7740
/*0x76d4*/      sub.w r0, r0, #0x300
/*0x76d8*/      subs r0, #2
/*0x76da*/      bne jump_778a
/*0x76dc*/      movs r2, #1
            jump_76de:
/*0x76de*/      movs r1, #2
            jump_76e0:
/*0x76e0*/      mov r0, r4
/*0x76e2*/      pop.w {r4, r5, r6, lr}
/*0x76e6*/      b.w jump_77c0
            jump_76ea:
/*0x76ea*/      ldr r1, [pc, #0xcc] /* data_77b8 */
/*0x76ec*/      cmp.w r0, #0x900
/*0x76f0*/      beq jump_7790
/*0x76f2*/      bgt jump_7714
/*0x76f4*/      cmp.w r0, #0x680
/*0x76f8*/      beq jump_7754
/*0x76fa*/      sub.w r0, r0, #0x600
/*0x76fe*/      subs r0, #0x81
/*0x7700*/      beq jump_778c
/*0x7702*/      sub.w r0, r0, #0x100
/*0x7706*/      subs r0, #0xff
/*0x7708*/      bne jump_778a
/*0x770a*/      add.w r0, r4, #0x30
/*0x770e*/      strd r0, r5, [r4, #0x1c]
/*0x7712*/      b jump_7786
            jump_7714:
/*0x7714*/      sub.w r0, r0, #0xa00
/*0x7718*/      subs r0, #0x81
/*0x771a*/      beq jump_77b2
/*0x771c*/      cmp r0, #0x80
/*0x771e*/      bne jump_778a
/*0x7720*/      ldr r0, [r1, #0xc]
            jump_7722:
/*0x7722*/      cmp r0, #0
/*0x7724*/      beq jump_778a
/*0x7726*/      mov r1, r0
/*0x7728*/      mov r0, r4
/*0x772a*/      pop.w {r4, r5, r6, lr}
/*0x772e*/      bx r1
            jump_7730:
/*0x7730*/      movs r1, #0
/*0x7732*/      b jump_76be
            jump_7734:
/*0x7734*/      movs r1, #1
/*0x7736*/      b jump_76be
            jump_7738:
/*0x7738*/      movs r2, #0
/*0x773a*/      b jump_7742
            jump_773c:
/*0x773c*/      movs r2, #0
/*0x773e*/      b jump_76de
            jump_7740:
/*0x7740*/      movs r2, #1
            jump_7742:
/*0x7742*/      movs r1, #0
/*0x7744*/      b jump_76e0
            jump_7746:
/*0x7746*/      ldrb r0, [r4, #2]
/*0x7748*/      bl call_6ca0
/*0x774c*/      strb.w r5, [r4, #0x24]
/*0x7750*/      movs r0, #5
/*0x7752*/      b jump_77ac
            jump_7754:
/*0x7754*/      ldrb r0, [r4, #3]
/*0x7756*/      cmp r0, #1
/*0x7758*/      beq jump_777a
/*0x775a*/      cmp r0, #2
/*0x775c*/      beq jump_777e
/*0x775e*/      cmp r0, #3
/*0x7760*/      bne jump_778a
/*0x7762*/      ldrb r0, [r4, #2]
/*0x7764*/      ldr r1, [r4, #0x14]
/*0x7766*/      cmp r1, r0
/*0x7768*/      bls jump_778a
/*0x776a*/      ldr r1, [r4, #0x10]
/*0x776c*/      ldr.w r0, [r1, r0, lsl #2]
/*0x7770*/      cmp r0, #0
/*0x7772*/      beq jump_778a
            jump_7774:
/*0x7774*/      str r0, [r4, #0x1c]
/*0x7776*/      ldrb r0, [r0]
/*0x7778*/      b jump_7784
            jump_777a:
/*0x777a*/      ldr r0, [r4, #8]
/*0x777c*/      b jump_7774
            jump_777e:
/*0x777e*/      ldr r0, [r4, #0xc]
/*0x7780*/      str r0, [r4, #0x1c]
/*0x7782*/      ldrh r0, [r0, #2]
            jump_7784:
/*0x7784*/      str r0, [r4, #0x20]
            jump_7786:
/*0x7786*/      strb.w r5, [r4, #0x24]
            jump_778a:
/*0x778a*/      pop {r4, r5, r6, pc}
            jump_778c:
/*0x778c*/      ldr r0, [r1, #8]
/*0x778e*/      b jump_7722
            jump_7790:
/*0x7790*/      ldrb r0, [r4, #2]
/*0x7792*/      strb.w r0, [r4, #0x30]
/*0x7796*/      strb.w r5, [r4, #0x24]
/*0x779a*/      movs r5, #1
            jump_779c:
/*0x779c*/      ldr r1, [pc, #0x1c] /* data_77bc */
/*0x779e*/      sxtb r0, r5
/*0x77a0*/      bl call_6a04
/*0x77a4*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x77a6*/      cmp r5, #8
/*0x77a8*/      blo jump_779c
/*0x77aa*/      movs r0, #6
            jump_77ac:
/*0x77ac*/      strb.w r0, [r4, #0x32]
/*0x77b0*/      pop {r4, r5, r6, pc}
            jump_77b2:
/*0x77b2*/      ldr r0, [r1, #0x10]
/*0x77b4*/      b jump_7722

/*0x77b6*/  .byte 0x00
/*0x77b7*/  .byte 0x00

            data_77b8:
/*0x77b8*/  .word data_8188
            data_77bc:
/*0x77bc*/  .word 0x2000016c

            jump_77c0:
/*0x77c0*/      push {r4, r5, r6, lr}
/*0x77c2*/      mov r4, r0
/*0x77c4*/      movs r6, #1
/*0x77c6*/      cbz r1, jump_77e2
/*0x77c8*/      cmp r1, #2
/*0x77ca*/      bne jump_77e0
/*0x77cc*/      ldrb r0, [r4, #4]
/*0x77ce*/      ands r5, r0, #0xf
/*0x77d2*/      beq jump_77dc
/*0x77d4*/      cbz r2, jump_77f8
/*0x77d6*/      mov r0, r5
/*0x77d8*/      bl call_6ab0
            jump_77dc:
/*0x77dc*/      strb.w r6, [r4, #0x24]
            jump_77e0:
/*0x77e0*/      pop {r4, r5, r6, pc}
            jump_77e2:
/*0x77e2*/      ldrb r0, [r4, #2]
/*0x77e4*/      cmp r0, #1
/*0x77e6*/      bne jump_77e0
/*0x77e8*/      ldrb r0, [r4, #0x34]!
/*0x77ec*/      bfi r0, r2, #1, #1
/*0x77f0*/      strb r0, [r4], #-0x10
/*0x77f4*/      strb r6, [r4]
/*0x77f6*/      pop {r4, r5, r6, pc}
            jump_77f8:
/*0x77f8*/      ldr r0, [r4, #0x38]
/*0x77fa*/      cmp r0, #0
/*0x77fc*/      bne jump_77dc
/*0x77fe*/      mov r0, r5
/*0x7800*/      bl call_6964
/*0x7804*/      mov r0, r5
/*0x7806*/      bl call_6954
/*0x780a*/      b jump_77dc

            .thumb_func
            call_780c:
/*0x780c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x780e*/      bmi jump_781a
/*0x7810*/      ldr.w r3, [r0, r2, lsl #2]
/*0x7814*/      str.w r3, [r1, r2, lsl #2]
/*0x7818*/      b call_780c
            jump_781a:
/*0x781a*/      bx lr

            .thumb_func
            call_781c:
/*0x781c*/      ldr r1, [pc, #8] /* data_7828 */
/*0x781e*/      add.w r0, r0, r0, lsl #2
/*0x7822*/      add.w r0, r1, r0, lsl #2
/*0x7826*/      bx lr

            data_7828:
/*0x7828*/  .word 0x400a8014


            .thumb_func
            call_782c:
/*0x782c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7830*/      movs r7, #0
/*0x7832*/      mov.w r1, #0x8000
/*0x7836*/      mov r2, r7
/*0x7838*/      mov sl, r1
/*0x783a*/      movs r3, #1
/*0x783c*/      mov r0, r2
/*0x783e*/      bl call_3888
/*0x7842*/      ldr r0, [pc, #0x90] /* data_78d4 */
/*0x7844*/      bl call_66ec
/*0x7848*/      ldr r5, [pc, #0x8c] /* data_78d8 */
/*0x784a*/      mov r4, r0
/*0x784c*/      movw r6, #0xeae0
/*0x7850*/      cmp r0, #1
/*0x7852*/      bne jump_7862
/*0x7854*/      ldr r0, [r5, #0x54]
/*0x7856*/      orrs r0, r6
/*0x7858*/      str r0, [r5, #0x54]
/*0x785a*/      str r6, [r5, #0x58]
/*0x785c*/      ldr r0, [r5, #0x50]
/*0x785e*/      orrs r0, r6
/*0x7860*/      str r0, [r5, #0x50]
            jump_7862:
/*0x7862*/      ldr.w r8, [pc, #0x70] /* data_78d4 */
/*0x7866*/      ldrb.w r0, [r8, #0x32]
/*0x786a*/      cmp r0, #3
/*0x786c*/      bne jump_78ac
/*0x786e*/      ldr.w sb, [pc, #0x6c] /* data_78dc */
/*0x7872*/      ldr.w r0, [sb]
/*0x7876*/      tst.w r0, #0xc0
/*0x787a*/      beq jump_78ac
/*0x787c*/      movs r0, #1
/*0x787e*/      bl call_561c
/*0x7882*/      ldr r1, [pc, #0x5c] /* data_78e0 */
/*0x7884*/      strb r7, [r1, #5]
/*0x7886*/      ldrb.w r0, [r8, #0x32]
/*0x788a*/      cmp r0, #3
/*0x788c*/      bne jump_78ac
/*0x788e*/      ldr.w r0, [sb]
/*0x7892*/      tst.w r0, #0xc0
/*0x7896*/      beq jump_78ac
/*0x7898*/      bl call_6cf0
/*0x789c*/      mov.w r0, #0x3e8
/*0x78a0*/      bl call_37c4
/*0x78a4*/      str r6, [r5, #0x58]
/*0x78a6*/      movs r0, #0
/*0x78a8*/      bl call_5c70
            jump_78ac:
/*0x78ac*/      ldr r0, [r5, #0x58]
/*0x78ae*/      tst r0, r6
/*0x78b0*/      beq jump_78c4
/*0x78b2*/      cmp r4, #1
/*0x78b4*/      bne jump_78c4
/*0x78b6*/      ldr r0, [pc, #0x1c] /* data_78d4 */
/*0x78b8*/      bl call_6878
/*0x78bc*/      cmp r0, #1
/*0x78be*/      bne jump_78c4
/*0x78c0*/      bl call_6888
            jump_78c4:
/*0x78c4*/      mov r2, r7
/*0x78c6*/      mov r1, sl
/*0x78c8*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x78cc*/      movs r3, #0
/*0x78ce*/      mov r0, r2
/*0x78d0*/      b.w call_3888

            data_78d4:
/*0x78d4*/  .word 0x20000644
            data_78d8:
/*0x78d8*/  .word 0x40024000
            data_78dc:
/*0x78dc*/  .word 0x400a8000
            data_78e0:
/*0x78e0*/  .word 0x2000002c


            .thumb_func
            loc_78e4:
/*0x78e4*/      b jump_78ec
            jump_78e6:
/*0x78e6*/      ldm r0!, {r3}
/*0x78e8*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x78ea*/      stm r1!, {r3}
            jump_78ec:
/*0x78ec*/      cmp r2, #0
/*0x78ee*/      bne jump_78e6
/*0x78f0*/      bx lr

            .thumb_func
            loc_78f2:
/*0x78f2*/      bx lr

            .thumb_func
            loc_78f4:
/*0x78f4*/      movs r0, #0
/*0x78f6*/      b jump_78fc
            jump_78f8:
/*0x78f8*/      stm r1!, {r0}
/*0x78fa*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_78fc:
/*0x78fc*/      cmp r2, #0
/*0x78fe*/      bne jump_78f8
/*0x7900*/      bx lr

/*0x7902*/  .byte 0x00
/*0x7903*/  .byte 0x00


            .thumb_func
            main:
/*0x7904*/      bl call_56e8
/*0x7908*/      bl call_37d0
/*0x790c*/      bl call_57ec
/*0x7910*/      movs r0, #0xff
/*0x7912*/      bl call_3e20
/*0x7916*/      bl call_600c
/*0x791a*/      bl call_5c20
/*0x791e*/      bl call_6268
/*0x7922*/      bl call_4e30
/*0x7926*/      movs r0, #0
/*0x7928*/      bl call_4678
/*0x792c*/      ldr r1, [pc, #0xbc] /* data_79ec */
/*0x792e*/      movs r0, #0
/*0x7930*/      str r0, [r1]
/*0x7932*/      bl call_5690
/*0x7936*/      bl call_56c4
/*0x793a*/      movs r0, #0
/*0x793c*/      bl call_561c
/*0x7940*/      movs r0, #0xa
/*0x7942*/      bl call_37c4
/*0x7946*/      movs r0, #1
/*0x7948*/      bl call_5f88
/*0x794c*/      bl call_4e50
/*0x7950*/      ldr r4, [pc, #0x9c] /* data_79f0 */
/*0x7952*/      cbz r0, jump_7958
/*0x7954*/      movs r0, #1
/*0x7956*/      strh r0, [r4, #4]
            jump_7958:
/*0x7958*/      ldrh r0, [r4, #4]
/*0x795a*/      cbz r0, jump_7980
/*0x795c*/      bl call_63c4
/*0x7960*/      bl call_5c50
/*0x7964*/      movs r0, #0
/*0x7966*/      bl call_5f88
            jump_796a:
/*0x796a*/      ldrh r0, [r4, #4]
/*0x796c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x796e*/      strh r0, [r4, #4]
/*0x7970*/      bl call_79fc
/*0x7974*/      movs r0, #1
/*0x7976*/      bl call_5d00
/*0x797a*/      bl call_6cf0
/*0x797e*/      b jump_796a
            jump_7980:
/*0x7980*/      movs r0, #1
/*0x7982*/      bl call_561c
/*0x7986*/      bl call_68a4
/*0x798a*/      ldr r6, [pc, #0x68] /* data_79f4 */
/*0x798c*/      ldr r5, [pc, #0x68] /* data_79f8 */
            jump_798e:
/*0x798e*/      bl call_6c2c
/*0x7992*/      cmp r0, #1
/*0x7994*/      beq jump_79a6
/*0x7996*/      cmp r0, #2
/*0x7998*/      beq jump_79ba
/*0x799a*/      cmp r0, #3
/*0x799c*/      bne jump_79e4
/*0x799e*/      movs r0, #1
/*0x79a0*/      bl call_561c
/*0x79a4*/      b jump_79e4
            jump_79a6:
/*0x79a6*/      movs r0, #0
/*0x79a8*/      bl call_561c
/*0x79ac*/      bl call_63c4
/*0x79b0*/      bl call_5c50
/*0x79b4*/      movs r0, #0
/*0x79b6*/      bl call_5f88
            jump_79ba:
/*0x79ba*/      ldrh r0, [r4, #4]
/*0x79bc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x79be*/      lsls r0, r0, #0x10
/*0x79c0*/      lsrs r0, r0, #0x10
/*0x79c2*/      strh r0, [r4, #4]
/*0x79c4*/      bne jump_79d2
/*0x79c6*/      ldr r0, [r5]
/*0x79c8*/      cmp r0, r6
/*0x79ca*/      bls jump_79d2
/*0x79cc*/      ldr r0, [r5]
/*0x79ce*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x79d0*/      str r0, [r5]
            jump_79d2:
/*0x79d2*/      bl handle_frame
/*0x79d6*/      bl call_79fc
/*0x79da*/      ldrb r0, [r4]
/*0x79dc*/      cbnz r0, jump_79e4
/*0x79de*/      movs r0, #1
/*0x79e0*/      bl call_5d00
            jump_79e4:
/*0x79e4*/      bl call_6cf0
/*0x79e8*/      b jump_798e

/*0x79ea*/  .byte 0x00
/*0x79eb*/  .byte 0x00

            data_79ec:
/*0x79ec*/  .word 0x20000058
            data_79f0:
/*0x79f0*/  .word 0x20000050
            data_79f4:
/*0x79f4*/  .word 0x55aafaf0
            data_79f8:
/*0x79f8*/  .word 0x20003ffc


            .thumb_func
            call_79fc:
/*0x79fc*/      push {r4, r5, r6, lr}
/*0x79fe*/      ldr r6, [pc, #0xc8] /* data_7ac8 */
/*0x7a00*/      movs r4, #0
/*0x7a02*/      ldrb r0, [r6, #3]
/*0x7a04*/      cbz r0, jump_7a20
/*0x7a06*/      movs r0, #1
/*0x7a08*/      bl call_4678
/*0x7a0c*/      cbz r0, jump_7a20
/*0x7a0e*/      ldrb r0, [r6, #3]
/*0x7a10*/      cmp r0, #2
/*0x7a12*/      beq jump_7a48
/*0x7a14*/      bl call_3ea0
            jump_7a18:
/*0x7a18*/      strb r4, [r6, #3]
/*0x7a1a*/      movs r0, #1
/*0x7a1c*/      bl call_5690
            jump_7a20:
/*0x7a20*/      bl call_51dc
/*0x7a24*/      cmp r0, #0
/*0x7a26*/      beq jump_7ac4
/*0x7a28*/      ldr r5, [pc, #0xa0] /* data_7acc */
/*0x7a2a*/      ldrb r0, [r5, #2]
/*0x7a2c*/      cmp r0, #0x20
/*0x7a2e*/      blo jump_7a38
/*0x7a30*/      subs r0, #0x20
/*0x7a32*/      strb r0, [r5, #2]
/*0x7a34*/      movs r0, #1
/*0x7a36*/      strb r0, [r5, #3]
            jump_7a38:
/*0x7a38*/      ldrb r0, [r5, #1]
/*0x7a3a*/      cmp r0, #0xff
/*0x7a3c*/      beq jump_7a5e
/*0x7a3e*/      bl call_4ab0
/*0x7a42*/      cmp r0, #1
/*0x7a44*/      beq jump_7a4e
/*0x7a46*/      b jump_7a5e
            jump_7a48:
/*0x7a48*/      bl call_3ed0
/*0x7a4c*/      b jump_7a18
            jump_7a4e:
/*0x7a4e*/      ldrb r0, [r5, #1]
/*0x7a50*/      bl call_3e20
/*0x7a54*/      movs r0, #0xff
/*0x7a56*/      strb r0, [r5, #1]
/*0x7a58*/      movs r0, #2
/*0x7a5a*/      bl call_5690
            jump_7a5e:
/*0x7a5e*/      ldrb r0, [r6, #4]
/*0x7a60*/      cbz r0, jump_7a72
/*0x7a62*/      bl call_4ab0
/*0x7a66*/      cmp r0, #1
/*0x7a68*/      bne jump_7a72
/*0x7a6a*/      ldrb r0, [r6, #4]
/*0x7a6c*/      bl call_4b1c
/*0x7a70*/      strb r4, [r6, #4]
            jump_7a72:
/*0x7a72*/      bl call_5f0c
/*0x7a76*/      bl call_5810
/*0x7a7a*/      ldr r0, [pc, #0x54] /* data_7ad0 */
/*0x7a7c*/      ldrb r0, [r0, #6]
/*0x7a7e*/      cmp r0, #1
/*0x7a80*/      beq jump_7a8a
/*0x7a82*/      bl call_4b34
/*0x7a86*/      bl call_39f4
            jump_7a8a:
/*0x7a8a*/      ldrb r0, [r5, #3]
/*0x7a8c*/      cbz r0, jump_7a92
/*0x7a8e*/      bl call_4bd4
            jump_7a92:
/*0x7a92*/      ldrb r0, [r6]
/*0x7a94*/      cbz r0, jump_7aa0
/*0x7a96*/      strb r4, [r6]
/*0x7a98*/      bl call_55b0
/*0x7a9c*/      bl call_55bc
            jump_7aa0:
/*0x7aa0*/      ldrb r0, [r6, #1]
/*0x7aa2*/      cbz r0, jump_7aaa
/*0x7aa4*/      strb r4, [r6, #1]
/*0x7aa6*/      bl call_61fc
            jump_7aaa:
/*0x7aaa*/      ldrb r0, [r5, #3]
/*0x7aac*/      cmp r0, #0
/*0x7aae*/      beq jump_7ac4
/*0x7ab0*/      ldr r0, [pc, #0x18] /* data_7acc */
/*0x7ab2*/      ldrb r2, [r5, #2]
/*0x7ab4*/      .short 0x1d80 /* adds r0, r0, #6 */ 
/*0x7ab6*/      ldrb r1, [r0, #1]
/*0x7ab8*/      add r1, r2
/*0x7aba*/      strb r1, [r0, #1]
/*0x7abc*/      ldrh r0, [r5, #6]
/*0x7abe*/      lsrs r0, r0, #1
/*0x7ac0*/      strh r0, [r5, #6]
/*0x7ac2*/      strb r4, [r5, #3]
            jump_7ac4:
/*0x7ac4*/      pop {r4, r5, r6, pc}

/*0x7ac6*/  .byte 0x00
/*0x7ac7*/  .byte 0x00

            data_7ac8:
/*0x7ac8*/  .word 0x200006c0
            data_7acc:
/*0x7acc*/  .word 0x20000050
            data_7ad0:
/*0x7ad0*/  .word 0x200019d4

            data_7ad4:
/*0x7ad4*/  .byte 0x44
/*0x7ad5*/  .byte 0x45
/*0x7ad6*/  .byte 0xe6
/*0x7ad7*/  .byte 0xe3
/*0x7ad8*/  .byte 0x2c
            data_7ad9:
/*0x7ad9*/  .byte 0x08
/*0x7ada*/  .byte 0x14
/*0x7adb*/  .byte 0x1a
            data_7adc:
/*0x7adc*/  .byte 0x00
/*0x7add*/  .byte 0x01
/*0x7ade*/  .byte 0x00
/*0x7adf*/  .byte 0x02
            data_7ae0:
/*0x7ae0*/  .byte 0x39
/*0x7ae1*/  .byte 0xe5
/*0x7ae2*/  .byte 0xe4
/*0x7ae3*/  .byte 0x65
/*0x7ae4*/  .byte 0xe7
            data_7ae5:
/*0x7ae5*/  .byte 0x1f
/*0x7ae6*/  .byte 0x10
/*0x7ae7*/  .byte 0x01
/*0x7ae8*/  .byte 0x3b
/*0x7ae9*/  .byte 0x11
/*0x7aea*/  .byte 0x01
/*0x7aeb*/  .byte 0x3c
/*0x7aec*/  .byte 0x12
/*0x7aed*/  .byte 0x01
/*0x7aee*/  .byte 0x3d
/*0x7aef*/  .byte 0x13
/*0x7af0*/  .byte 0x01
/*0x7af1*/  .byte 0x47
/*0x7af2*/  .byte 0x5f
/*0x7af3*/  .byte 0x01
            data_7af4:
/*0x7af4*/  .byte 0x00
/*0x7af5*/  .byte 0x35
/*0x7af6*/  .byte 0x01
/*0x7af7*/  .byte 0x3a
/*0x7af8*/  .byte 0x02
/*0x7af9*/  .byte 0x3b
/*0x7afa*/  .byte 0x03
/*0x7afb*/  .byte 0x3c
/*0x7afc*/  .byte 0x04
/*0x7afd*/  .byte 0x3d
/*0x7afe*/  .byte 0x05
/*0x7aff*/  .byte 0x3e
/*0x7b00*/  .byte 0x06
/*0x7b01*/  .byte 0x3f
/*0x7b02*/  .byte 0x07
/*0x7b03*/  .byte 0x40
/*0x7b04*/  .byte 0x23
/*0x7b05*/  .byte 0x41
/*0x7b06*/  .byte 0x24
/*0x7b07*/  .byte 0x42
/*0x7b08*/  .byte 0x25
/*0x7b09*/  .byte 0x43
/*0x7b0a*/  .byte 0x26
/*0x7b0b*/  .byte 0x44
/*0x7b0c*/  .byte 0x2a
/*0x7b0d*/  .byte 0x45
/*0x7b0e*/  .byte 0x2b
/*0x7b0f*/  .byte 0x52
/*0x7b10*/  .byte 0x17
/*0x7b11*/  .byte 0x50
/*0x7b12*/  .byte 0x33
/*0x7b13*/  .byte 0x51
/*0x7b14*/  .byte 0x34
/*0x7b15*/  .byte 0x4f
/*0x7b16*/  .byte 0x2d
/*0x7b17*/  .byte 0x46
/*0x7b18*/  .byte 0x2e
/*0x7b19*/  .byte 0x47
/*0x7b1a*/  .byte 0x32
/*0x7b1b*/  .byte 0x48
/*0x7b1c*/  .byte 0x19
/*0x7b1d*/  .byte 0x65
/*0x7b1e*/  .byte 0x16
/*0x7b1f*/  .byte 0x4a
/*0x7b20*/  .byte 0x1e
/*0x7b21*/  .byte 0x4d
/*0x7b22*/  .byte 0x0f
/*0x7b23*/  .byte 0x4b
/*0x7b24*/  .byte 0x2c
/*0x7b25*/  .byte 0x4e
/*0x7b26*/  .byte 0x27
/*0x7b27*/  .byte 0x4c
/*0x7b28*/  .byte 0x36
/*0x7b29*/  .byte 0x4c
/*0x7b2a*/  .byte 0x35
/*0x7b2b*/  .byte 0x49
/*0x7b2c*/  .byte 0x12
/*0x7b2d*/  .byte 0xf5
/*0x7b2e*/  .byte 0x13
/*0x7b2f*/  .byte 0xf6
/*0x7b30*/  .byte 0x14
/*0x7b31*/  .byte 0xf4
/*0x7b32*/  .byte 0x09
/*0x7b33*/  .byte 0xf2
/*0x7b34*/  .byte 0x0a
/*0x7b35*/  .byte 0xf0
/*0x7b36*/  .byte 0x0b
/*0x7b37*/  .byte 0xf3
            data_7b38:
/*0x7b38*/  .byte 0xe8
/*0x7b39*/  .byte 0xcf
            data_7b3a:
/*0x7b3a*/  .byte 0xff
/*0x7b3b*/  .byte 0xff
/*0x7b3c*/  .byte 0xff
            data_7b3d:
/*0x7b3d*/  .byte 0x00
/*0x7b3e*/  .byte 0x00
/*0x7b3f*/  .byte 0xff
/*0x7b40*/  .byte 0xff
/*0x7b41*/  .byte 0x00
/*0x7b42*/  .byte 0x00
            data_7b43:
/*0x7b43*/  .byte 0x00
/*0x7b44*/  .byte 0x01
/*0x7b45*/  .byte 0x02
/*0x7b46*/  .byte 0x03
/*0x7b47*/  .byte 0xff
/*0x7b48*/  .byte 0xff
/*0x7b49*/  .byte 0xff
/*0x7b4a*/  .byte 0xff
/*0x7b4b*/  .byte 0x04
/*0x7b4c*/  .byte 0x04
/*0x7b4d*/  .byte 0x05
/*0x7b4e*/  .byte 0x05
/*0x7b4f*/  .byte 0x06
/*0x7b50*/  .byte 0x06
/*0x7b51*/  .byte 0x01
/*0x7b52*/  .byte 0x01
/*0x7b53*/  .byte 0x01
/*0x7b54*/  .byte 0x01
/*0x7b55*/  .byte 0x01
/*0x7b56*/  .byte 0x01
/*0x7b57*/  .byte 0x01
/*0x7b58*/  .byte 0x03
/*0x7b59*/  .byte 0x05
/*0x7b5a*/  .byte 0x07
/*0x7b5b*/  .byte 0x09
/*0x7b5c*/  .byte 0x0b
/*0x7b5d*/  .byte 0x01
/*0x7b5e*/  .byte 0x03
/*0x7b5f*/  .byte 0x05
/*0x7b60*/  .byte 0x07
/*0x7b61*/  .byte 0x09
/*0x7b62*/  .byte 0x0b
/*0x7b63*/  .byte 0xaa
/*0x7b64*/  .byte 0x6e
/*0x7b65*/  .byte 0x46
/*0x7b66*/  .byte 0x28
/*0x7b67*/  .byte 0x14
/*0x7b68*/  .byte 0x0a
/*0x7b69*/  .byte 0x01
/*0x7b6a*/  .byte 0x02
/*0x7b6b*/  .byte 0x03
/*0x7b6c*/  .byte 0x04
/*0x7b6d*/  .byte 0x06
/*0x7b6e*/  .byte 0x09
/*0x7b6f*/  .byte 0x10
/*0x7b70*/  .byte 0x0b
/*0x7b71*/  .byte 0x07
/*0x7b72*/  .byte 0x04
/*0x7b73*/  .byte 0x02
/*0x7b74*/  .byte 0x01
/*0x7b75*/  .byte 0x10
/*0x7b76*/  .byte 0x0b
/*0x7b77*/  .byte 0x07
/*0x7b78*/  .byte 0x04
/*0x7b79*/  .byte 0x02
/*0x7b7a*/  .byte 0x01
            data_7b7b:
/*0x7b7b*/  .byte 0x00
/*0x7b7c*/  .byte 0x01
/*0x7b7d*/  .byte 0x02
/*0x7b7e*/  .byte 0x03
/*0x7b7f*/  .byte 0x04
/*0x7b80*/  .byte 0x05
/*0x7b81*/  .byte 0x06
/*0x7b82*/  .byte 0x07
/*0x7b83*/  .byte 0x1b
/*0x7b84*/  .byte 0x1a
/*0x7b85*/  .byte 0x19
/*0x7b86*/  .byte 0x18
/*0x7b87*/  .byte 0x17
/*0x7b88*/  .byte 0x16
/*0x7b89*/  .byte 0x15
/*0x7b8a*/  .byte 0x14
/*0x7b8b*/  .byte 0x1c
/*0x7b8c*/  .byte 0x1d
/*0x7b8d*/  .byte 0x1e
/*0x7b8e*/  .byte 0x1f
/*0x7b8f*/  .byte 0x20
/*0x7b90*/  .byte 0x21
/*0x7b91*/  .byte 0x22
/*0x7b92*/  .byte 0x23
/*0x7b93*/  .byte 0x34
/*0x7b94*/  .byte 0x33
/*0x7b95*/  .byte 0x32
/*0x7b96*/  .byte 0x31
/*0x7b97*/  .byte 0x30
/*0x7b98*/  .byte 0x2f
/*0x7b99*/  .byte 0x2e
/*0x7b9a*/  .byte 0x2d
/*0x7b9b*/  .byte 0x35
/*0x7b9c*/  .byte 0x36
/*0x7b9d*/  .byte 0x37
/*0x7b9e*/  .byte 0x08
/*0x7b9f*/  .byte 0x09
/*0x7ba0*/  .byte 0x0a
/*0x7ba1*/  .byte 0x0b
/*0x7ba2*/  .byte 0x0d
/*0x7ba3*/  .byte 0xff
/*0x7ba4*/  .byte 0xff
/*0x7ba5*/  .byte 0x0c
/*0x7ba6*/  .byte 0x13
/*0x7ba7*/  .byte 0x12
/*0x7ba8*/  .byte 0x11
/*0x7ba9*/  .byte 0x10
/*0x7baa*/  .byte 0x0e
/*0x7bab*/  .byte 0xff
/*0x7bac*/  .byte 0xff
/*0x7bad*/  .byte 0x0f
/*0x7bae*/  .byte 0x24
/*0x7baf*/  .byte 0x25
/*0x7bb0*/  .byte 0x26
/*0x7bb1*/  .byte 0x27
/*0x7bb2*/  .byte 0x28
/*0x7bb3*/  .byte 0xff
/*0x7bb4*/  .byte 0xff
/*0x7bb5*/  .byte 0x38
/*0x7bb6*/  .byte 0x2c
/*0x7bb7*/  .byte 0x2b
/*0x7bb8*/  .byte 0x2a
/*0x7bb9*/  .byte 0x29
/*0x7bba*/  .byte 0xff
/*0x7bbb*/  .byte 0xff
/*0x7bbc*/  .byte 0xff
/*0x7bbd*/  .byte 0xff
/*0x7bbe*/  .byte 0x39
/*0x7bbf*/  .byte 0x3a
/*0x7bc0*/  .byte 0x3b
/*0x7bc1*/  .byte 0xff
/*0x7bc2*/  .byte 0x3c
/*0x7bc3*/  .byte 0x01
/*0x7bc4*/  .byte 0x01
/*0x7bc5*/  .byte 0x01
/*0x7bc6*/  .byte 0x01
/*0x7bc7*/  .byte 0x02
/*0x7bc8*/  .byte 0x02
/*0x7bc9*/  .byte 0x02
/*0x7bca*/  .byte 0x02
/*0x7bcb*/  .byte 0x08
/*0x7bcc*/  .byte 0x08
/*0x7bcd*/  .byte 0x01
/*0x7bce*/  .byte 0x01
/*0x7bcf*/  .byte 0x01
/*0x7bd0*/  .byte 0x02
/*0x7bd1*/  .byte 0x02
/*0x7bd2*/  .byte 0x02
/*0x7bd3*/  .byte 0x08
/*0x7bd4*/  .byte 0x08
/*0x7bd5*/  .byte 0x08
/*0x7bd6*/  .byte 0x08
/*0x7bd7*/  .byte 0x01
/*0x7bd8*/  .byte 0x01
/*0x7bd9*/  .byte 0x02
/*0x7bda*/  .byte 0x03
/*0x7bdb*/  .byte 0x07
/*0x7bdc*/  .byte 0x07
/*0x7bdd*/  .byte 0x07
/*0x7bde*/  .byte 0x07
/*0x7bdf*/  .byte 0x06
/*0x7be0*/  .byte 0x06
/*0x7be1*/  .byte 0x06
/*0x7be2*/  .byte 0x06
/*0x7be3*/  .byte 0x07
/*0x7be4*/  .byte 0x07
/*0x7be5*/  .byte 0x06
/*0x7be6*/  .byte 0x02
/*0x7be7*/  .byte 0x02
/*0x7be8*/  .byte 0x02
/*0x7be9*/  .byte 0x03
/*0x7bea*/  .byte 0x03
/*0x7beb*/  .byte 0xff
/*0x7bec*/  .byte 0xff
/*0x7bed*/  .byte 0x03
/*0x7bee*/  .byte 0x03
/*0x7bef*/  .byte 0x03
/*0x7bf0*/  .byte 0x03
/*0x7bf1*/  .byte 0x03
/*0x7bf2*/  .byte 0x04
/*0x7bf3*/  .byte 0xff
/*0x7bf4*/  .byte 0xff
/*0x7bf5*/  .byte 0x04
/*0x7bf6*/  .byte 0x03
/*0x7bf7*/  .byte 0x04
/*0x7bf8*/  .byte 0x04
/*0x7bf9*/  .byte 0x04
/*0x7bfa*/  .byte 0x04
/*0x7bfb*/  .byte 0xff
/*0x7bfc*/  .byte 0xff
/*0x7bfd*/  .byte 0x06
/*0x7bfe*/  .byte 0x05
/*0x7bff*/  .byte 0x05
/*0x7c00*/  .byte 0x05
/*0x7c01*/  .byte 0x05
/*0x7c02*/  .byte 0xff
/*0x7c03*/  .byte 0xff
/*0x7c04*/  .byte 0xff
/*0x7c05*/  .byte 0xff
/*0x7c06*/  .byte 0x06
/*0x7c07*/  .byte 0x06
/*0x7c08*/  .byte 0x05
/*0x7c09*/  .byte 0xff
            data_7c0a:
/*0x7c0a*/  .byte 0x05
            data_7c0b:
/*0x7c0b*/  .byte 0x00
/*0x7c0c*/  .byte 0x08
/*0x7c0d*/  .byte 0x10
/*0x7c0e*/  .byte 0x18
/*0x7c0f*/  .byte 0x20
/*0x7c10*/  .byte 0x28
/*0x7c11*/  .byte 0x30
/*0x7c12*/  .byte 0x38
/*0x7c13*/  .byte 0x01
/*0x7c14*/  .byte 0x09
/*0x7c15*/  .byte 0x11
/*0x7c16*/  .byte 0x19
/*0x7c17*/  .byte 0x21
/*0x7c18*/  .byte 0x29
/*0x7c19*/  .byte 0x31
/*0x7c1a*/  .byte 0x39
/*0x7c1b*/  .byte 0x02
/*0x7c1c*/  .byte 0x0a
/*0x7c1d*/  .byte 0x12
/*0x7c1e*/  .byte 0x1a
/*0x7c1f*/  .byte 0x22
/*0x7c20*/  .byte 0x2a
/*0x7c21*/  .byte 0x32
/*0x7c22*/  .byte 0x3a
/*0x7c23*/  .byte 0x03
/*0x7c24*/  .byte 0x13
/*0x7c25*/  .byte 0x1b
/*0x7c26*/  .byte 0x23
/*0x7c27*/  .byte 0x2b
/*0x7c28*/  .byte 0x33
/*0x7c29*/  .byte 0x3b
/*0x7c2a*/  .byte 0x43
/*0x7c2b*/  .byte 0x04
/*0x7c2c*/  .byte 0x0c
/*0x7c2d*/  .byte 0x14
/*0x7c2e*/  .byte 0x40
/*0x7c2f*/  .byte 0x48
/*0x7c30*/  .byte 0x50
/*0x7c31*/  .byte 0x58
/*0x7c32*/  .byte 0x68
/*0x7c33*/  .byte 0xff
/*0x7c34*/  .byte 0xff
/*0x7c35*/  .byte 0x60
/*0x7c36*/  .byte 0x41
/*0x7c37*/  .byte 0x49
/*0x7c38*/  .byte 0x51
/*0x7c39*/  .byte 0x59
/*0x7c3a*/  .byte 0x69
/*0x7c3b*/  .byte 0xff
/*0x7c3c*/  .byte 0xff
/*0x7c3d*/  .byte 0x61
/*0x7c3e*/  .byte 0x42
/*0x7c3f*/  .byte 0x4a
/*0x7c40*/  .byte 0x52
/*0x7c41*/  .byte 0x5a
/*0x7c42*/  .byte 0x6a
/*0x7c43*/  .byte 0xff
/*0x7c44*/  .byte 0xff
/*0x7c45*/  .byte 0x34
/*0x7c46*/  .byte 0x4b
/*0x7c47*/  .byte 0x53
/*0x7c48*/  .byte 0x5b
/*0x7c49*/  .byte 0x63
/*0x7c4a*/  .byte 0xff
/*0x7c4b*/  .byte 0xff
/*0x7c4c*/  .byte 0xff
/*0x7c4d*/  .byte 0xff
/*0x7c4e*/  .byte 0x54
/*0x7c4f*/  .byte 0x5c
/*0x7c50*/  .byte 0x64
/*0x7c51*/  .byte 0xff
            data_7c52:
/*0x7c52*/  .byte 0x6c
            data_7c53:
/*0x7c53*/  .byte 0x00
/*0x7c54*/  .byte 0x24
/*0x7c55*/  .byte 0x49
/*0x7c56*/  .byte 0x6d
/*0x7c57*/  .byte 0x92
/*0x7c58*/  .byte 0xb6
/*0x7c59*/  .byte 0xdb
/*0x7c5a*/  .byte 0xff
/*0x7c5b*/  .byte 0xaa
/*0x7c5c*/  .byte 0x55
/*0x7c5d*/  .byte 0x00
/*0x7c5e*/  .byte 0x00
/*0x7c5f*/  .byte 0x00
            data_7c60:
/*0x7c60*/  .byte 0x29
/*0x7c61*/  .byte 0x1e
/*0x7c62*/  .byte 0x1f
/*0x7c63*/  .byte 0x20
/*0x7c64*/  .byte 0x21
/*0x7c65*/  .byte 0x22
/*0x7c66*/  .byte 0x23
/*0x7c67*/  .byte 0x24
/*0x7c68*/  .byte 0x2b
/*0x7c69*/  .byte 0x14
/*0x7c6a*/  .byte 0x1a
/*0x7c6b*/  .byte 0x08
/*0x7c6c*/  .byte 0x15
/*0x7c6d*/  .byte 0x17
/*0x7c6e*/  .byte 0x1c
/*0x7c6f*/  .byte 0x18
/*0x7c70*/  .byte 0x39
/*0x7c71*/  .byte 0x04
/*0x7c72*/  .byte 0x16
/*0x7c73*/  .byte 0x07
/*0x7c74*/  .byte 0x09
/*0x7c75*/  .byte 0x0a
/*0x7c76*/  .byte 0x0b
/*0x7c77*/  .byte 0x0d
/*0x7c78*/  .byte 0xe1
/*0x7c79*/  .byte 0x1d
/*0x7c7a*/  .byte 0x1b
/*0x7c7b*/  .byte 0x06
/*0x7c7c*/  .byte 0x19
/*0x7c7d*/  .byte 0x05
/*0x7c7e*/  .byte 0x11
/*0x7c7f*/  .byte 0x10
/*0x7c80*/  .byte 0xe0
/*0x7c81*/  .byte 0xe3
/*0x7c82*/  .byte 0xe2
/*0x7c83*/  .byte 0x25
/*0x7c84*/  .byte 0x26
/*0x7c85*/  .byte 0x27
/*0x7c86*/  .byte 0x2d
/*0x7c87*/  .byte 0x2a
/*0x7c88*/  .byte 0x64
/*0x7c89*/  .byte 0x00
/*0x7c8a*/  .byte 0x2e
/*0x7c8b*/  .byte 0x0c
/*0x7c8c*/  .byte 0x12
/*0x7c8d*/  .byte 0x13
/*0x7c8e*/  .byte 0x2f
/*0x7c8f*/  .byte 0x31
/*0x7c90*/  .byte 0x00
/*0x7c91*/  .byte 0x32
/*0x7c92*/  .byte 0x30
/*0x7c93*/  .byte 0x0e
/*0x7c94*/  .byte 0x0f
/*0x7c95*/  .byte 0x33
/*0x7c96*/  .byte 0x34
/*0x7c97*/  .byte 0x28
/*0x7c98*/  .byte 0x00
/*0x7c99*/  .byte 0x00
/*0x7c9a*/  .byte 0x2c
/*0x7c9b*/  .byte 0x36
/*0x7c9c*/  .byte 0x37
/*0x7c9d*/  .byte 0x38
/*0x7c9e*/  .byte 0xe5
/*0x7c9f*/  .byte 0x35
/*0x7ca0*/  .byte 0x00
/*0x7ca1*/  .byte 0x00
/*0x7ca2*/  .byte 0x00
/*0x7ca3*/  .byte 0xe6
/*0x7ca4*/  .byte 0xe7
/*0x7ca5*/  .byte 0x65
/*0x7ca6*/  .byte 0x00
/*0x7ca7*/  .byte 0xe4
/*0x7ca8*/  .byte 0xc0
/*0x7ca9*/  .byte 0xc1
/*0x7caa*/  .byte 0xc2
/*0x7cab*/  .byte 0xc3
/*0x7cac*/  .byte 0x00
/*0x7cad*/  .byte 0x00
/*0x7cae*/  .byte 0x00
/*0x7caf*/  .byte 0x00

            gpio_map_1:
/*0x7cb0*/  .word 0x400b4000 /* GPIO C, pin 9 */
/*0x7cb4*/  .word 0x00000200
/*0x7cb8*/  .word 0x400b0000 /* GPIO A, pin 5 */
/*0x7cbc*/  .word 0x00000020
/*0x7cc0*/  .word 0x400b0000 /* GPIO A, pin 6 */
/*0x7cc4*/  .word 0x00000040
/*0x7cc8*/  .word 0x400b0000 /* GPIO A, pin 7 */
/*0x7ccc*/  .word 0x00000080
/*0x7cd0*/  .word 0x400b4000 /* GPIO C, pin 11 */
/*0x7cd4*/  .word 0x00000800
/*0x7cd8*/  .word 0x400b4000 /* GPIO C, pin 13 */
/*0x7cdc*/  .word 0x00002000
/*0x7ce0*/  .word 0x400b4000 /* GPIO C, pin 14 */
/*0x7ce4*/  .word 0x00004000 /* possible pointer */
/*0x7ce8*/  .word 0x400b4000 /* GPIO C, pin 15 */
/*0x7cec*/  .word 0x00008000 /* possible pointer */

/*0x7cf0*/  .byte 0x02
/*0x7cf1*/  .byte 0x09
/*0x7cf2*/  .byte 0x00
/*0x7cf3*/  .byte 0x05
/*0x7cf4*/  .byte 0x00
/*0x7cf5*/  .byte 0x06
/*0x7cf6*/  .byte 0x00
/*0x7cf7*/  .byte 0x07
/*0x7cf8*/  .byte 0x02
/*0x7cf9*/  .byte 0x0b
/*0x7cfa*/  .byte 0x02
/*0x7cfb*/  .byte 0x0d
/*0x7cfc*/  .byte 0x02
/*0x7cfd*/  .byte 0x0e
/*0x7cfe*/  .byte 0x02
/*0x7cff*/  .byte 0x0f

            gpio_map_2:
/*0x7d00*/  .word 0x400b4000 /* GPIO C, pin 4 */
/*0x7d04*/  .word 0x00000010
/*0x7d08*/  .word 0x400b2000 /* GPIO B, pin 6 */
/*0x7d0c*/  .word 0x00000040
/*0x7d10*/  .word 0x400b6000 /* GPIO D, pin 0 */
/*0x7d14*/  .word 0x00000001
/*0x7d18*/  .word 0x400b2000 /* GPIO B, pin 11 */
/*0x7d1c*/  .word 0x00000800
/*0x7d20*/  .word 0x400b0000 /* GPIO A, pin 11 */
/*0x7d24*/  .word 0x00000800
/*0x7d28*/  .word 0x400b0000 /* GPIO A, pin 0 */
/*0x7d2c*/  .word 0x00000001
/*0x7d30*/  .word 0x400b0000 /* GPIO A, pin 1 */
/*0x7d34*/  .word 0x00000002
/*0x7d38*/  .word 0x400b0000 /* GPIO A, pin 2 */
/*0x7d3c*/  .word 0x00000004
/*0x7d40*/  .word 0x400b0000 /* GPIO A, pin 3 */
/*0x7d44*/  .word 0x00000008
            data_7d48:
/*0x7d48*/  .word 0x400b0000 /* GPIO A, pin 4 */
/*0x7d4c*/  .word 0x00000010

/*0x7d50*/  .byte 0x2d
/*0x7d51*/  .byte 0x2f
/*0x7d52*/  .byte 0x2e
/*0x7d53*/  .byte 0x30
/*0x7d54*/  .byte 0x14
/*0x7d55*/  .byte 0x34
/*0x7d56*/  .byte 0x1a
/*0x7d57*/  .byte 0x36
/*0x7d58*/  .byte 0x08
/*0x7d59*/  .byte 0x37
/*0x7d5a*/  .byte 0x15
/*0x7d5b*/  .byte 0x13
/*0x7d5c*/  .byte 0x17
/*0x7d5d*/  .byte 0x1c
/*0x7d5e*/  .byte 0x1c
/*0x7d5f*/  .byte 0x09
/*0x7d60*/  .byte 0x18
/*0x7d61*/  .byte 0x0a
/*0x7d62*/  .byte 0x0c
/*0x7d63*/  .byte 0x06
/*0x7d64*/  .byte 0x12
/*0x7d65*/  .byte 0x15
/*0x7d66*/  .byte 0x13
/*0x7d67*/  .byte 0x0f
/*0x7d68*/  .byte 0x2f
/*0x7d69*/  .byte 0x38
/*0x7d6a*/  .byte 0x30
/*0x7d6b*/  .byte 0x2e
/*0x7d6c*/  .byte 0x16
/*0x7d6d*/  .byte 0x12
/*0x7d6e*/  .byte 0x07
/*0x7d6f*/  .byte 0x08
/*0x7d70*/  .byte 0x09
/*0x7d71*/  .byte 0x18
/*0x7d72*/  .byte 0x0a
/*0x7d73*/  .byte 0x0c
/*0x7d74*/  .byte 0x0b
/*0x7d75*/  .byte 0x07
/*0x7d76*/  .byte 0x0d
/*0x7d77*/  .byte 0x0b
/*0x7d78*/  .byte 0x0e
/*0x7d79*/  .byte 0x17
/*0x7d7a*/  .byte 0x0f
/*0x7d7b*/  .byte 0x11
/*0x7d7c*/  .byte 0x33
/*0x7d7d*/  .byte 0x16
/*0x7d7e*/  .byte 0x34
/*0x7d7f*/  .byte 0x2d
/*0x7d80*/  .byte 0x1d
/*0x7d81*/  .byte 0x33
/*0x7d82*/  .byte 0x1b
/*0x7d83*/  .byte 0x14
/*0x7d84*/  .byte 0x06
/*0x7d85*/  .byte 0x0d
/*0x7d86*/  .byte 0x19
/*0x7d87*/  .byte 0x0e
/*0x7d88*/  .byte 0x05
/*0x7d89*/  .byte 0x1b
/*0x7d8a*/  .byte 0x11
/*0x7d8b*/  .byte 0x05
/*0x7d8c*/  .byte 0x10
/*0x7d8d*/  .byte 0x10
/*0x7d8e*/  .byte 0x36
/*0x7d8f*/  .byte 0x1a
/*0x7d90*/  .byte 0x37
/*0x7d91*/  .byte 0x19
/*0x7d92*/  .byte 0x38
/*0x7d93*/  .byte 0x1d
            data_7d94:
/*0x7d94*/  .byte 0x08
/*0x7d95*/  .byte 0x09
/*0x7d96*/  .byte 0x15
/*0x7d97*/  .byte 0x13
/*0x7d98*/  .byte 0x17
/*0x7d99*/  .byte 0x0a
/*0x7d9a*/  .byte 0x1c
/*0x7d9b*/  .byte 0x0d
/*0x7d9c*/  .byte 0x18
/*0x7d9d*/  .byte 0x0f
/*0x7d9e*/  .byte 0x0c
/*0x7d9f*/  .byte 0x18
/*0x7da0*/  .byte 0x12
/*0x7da1*/  .byte 0x1c
/*0x7da2*/  .byte 0x13
/*0x7da3*/  .byte 0x33
/*0x7da4*/  .byte 0x16
/*0x7da5*/  .byte 0x15
/*0x7da6*/  .byte 0x07
/*0x7da7*/  .byte 0x16
/*0x7da8*/  .byte 0x09
/*0x7da9*/  .byte 0x17
/*0x7daa*/  .byte 0x0a
/*0x7dab*/  .byte 0x07
/*0x7dac*/  .byte 0x0d
/*0x7dad*/  .byte 0x11
/*0x7dae*/  .byte 0x0e
/*0x7daf*/  .byte 0x08
/*0x7db0*/  .byte 0x0f
/*0x7db1*/  .byte 0x0c
/*0x7db2*/  .byte 0x33
/*0x7db3*/  .byte 0x12
/*0x7db4*/  .byte 0x11
/*0x7db5*/  .byte 0x0e
/*0x7db6*/  .byte 0x00
/*0x7db7*/  .byte 0x00
            data_7db8:
/*0x7db8*/  .byte 0x00
/*0x7db9*/  .byte 0x01
/*0x7dba*/  .byte 0x02
/*0x7dbb*/  .byte 0x00

            gpio_map_3:
/*0x7dbc*/  .word 0x400b4000 /* GPIO C, pin 8 */
/*0x7dc0*/  .word 0x00000100
/*0x7dc4*/  .word 0x400b4000 /* GPIO C, pin 7 */
/*0x7dc8*/  .word 0x00000080
/*0x7dcc*/  .word 0x400b2000 /* GPIO B, pin 5 */
/*0x7dd0*/  .word 0x00000020
/*0x7dd4*/  .word 0x400b2000 /* GPIO B, pin 4 */
/*0x7dd8*/  .word 0x00000010
/*0x7ddc*/  .word 0x400b2000 /* GPIO B, pin 3 */
/*0x7de0*/  .word 0x00000008
/*0x7de4*/  .word 0x400b2000 /* GPIO B, pin 2 */
/*0x7de8*/  .word 0x00000004
/*0x7dec*/  .word 0x400b4000 /* GPIO C, pin 6 */
/*0x7df0*/  .word 0x00000040
/*0x7df4*/  .word 0x400b4000 /* GPIO C, pin 5 */
/*0x7df8*/  .word 0x00000020

/*0x7dfc*/  .byte 0x00
/*0x7dfd*/  .byte 0x00
/*0x7dfe*/  .byte 0x13
/*0x7dff*/  .byte 0x00
/*0x7e00*/  .byte 0x26
/*0x7e01*/  .byte 0x00
/*0x7e02*/  .byte 0x3a
/*0x7e03*/  .byte 0x00
/*0x7e04*/  .byte 0x4e
/*0x7e05*/  .byte 0x00
/*0x7e06*/  .byte 0x62
/*0x7e07*/  .byte 0x00
/*0x7e08*/  .byte 0x77
/*0x7e09*/  .byte 0x00
/*0x7e0a*/  .byte 0x8c
/*0x7e0b*/  .byte 0x00
/*0x7e0c*/  .byte 0xa1
/*0x7e0d*/  .byte 0x00
/*0x7e0e*/  .byte 0xb7
/*0x7e0f*/  .byte 0x00
/*0x7e10*/  .byte 0xcd
/*0x7e11*/  .byte 0x00
/*0x7e12*/  .byte 0xe3
/*0x7e13*/  .byte 0x00
/*0x7e14*/  .byte 0xfa
/*0x7e15*/  .byte 0x00
/*0x7e16*/  .byte 0x11
/*0x7e17*/  .byte 0x01
/*0x7e18*/  .byte 0x28
/*0x7e19*/  .byte 0x01
/*0x7e1a*/  .byte 0x40
/*0x7e1b*/  .byte 0x01
/*0x7e1c*/  .byte 0x58
/*0x7e1d*/  .byte 0x01
/*0x7e1e*/  .byte 0x71
/*0x7e1f*/  .byte 0x01
/*0x7e20*/  .byte 0x8a
/*0x7e21*/  .byte 0x01
/*0x7e22*/  .byte 0xa3
/*0x7e23*/  .byte 0x01
/*0x7e24*/  .byte 0xbd
/*0x7e25*/  .byte 0x01
/*0x7e26*/  .byte 0xd7
/*0x7e27*/  .byte 0x01
/*0x7e28*/  .byte 0xf1
/*0x7e29*/  .byte 0x01
/*0x7e2a*/  .byte 0x0c
/*0x7e2b*/  .byte 0x02
/*0x7e2c*/  .byte 0x28
/*0x7e2d*/  .byte 0x02
/*0x7e2e*/  .byte 0x43
/*0x7e2f*/  .byte 0x02
/*0x7e30*/  .byte 0x60
/*0x7e31*/  .byte 0x02
/*0x7e32*/  .byte 0x7c
/*0x7e33*/  .byte 0x02
/*0x7e34*/  .byte 0x9a
/*0x7e35*/  .byte 0x02
/*0x7e36*/  .byte 0xb7
/*0x7e37*/  .byte 0x02
/*0x7e38*/  .byte 0xd5
/*0x7e39*/  .byte 0x02
/*0x7e3a*/  .byte 0xf4
/*0x7e3b*/  .byte 0x02
/*0x7e3c*/  .byte 0x13
/*0x7e3d*/  .byte 0x03
/*0x7e3e*/  .byte 0x32
/*0x7e3f*/  .byte 0x03
/*0x7e40*/  .byte 0x53
/*0x7e41*/  .byte 0x03
/*0x7e42*/  .byte 0x73
/*0x7e43*/  .byte 0x03
/*0x7e44*/  .byte 0x94
/*0x7e45*/  .byte 0x03
/*0x7e46*/  .byte 0xb6
/*0x7e47*/  .byte 0x03
/*0x7e48*/  .byte 0xd8
/*0x7e49*/  .byte 0x03
/*0x7e4a*/  .byte 0xfb
/*0x7e4b*/  .byte 0x03
/*0x7e4c*/  .byte 0x1e
/*0x7e4d*/  .byte 0x04
/*0x7e4e*/  .byte 0x42
/*0x7e4f*/  .byte 0x04
/*0x7e50*/  .byte 0x66
/*0x7e51*/  .byte 0x04
/*0x7e52*/  .byte 0x8b
/*0x7e53*/  .byte 0x04
/*0x7e54*/  .byte 0xb1
/*0x7e55*/  .byte 0x04
/*0x7e56*/  .byte 0xd7
/*0x7e57*/  .byte 0x04
/*0x7e58*/  .byte 0xfd
/*0x7e59*/  .byte 0x04
/*0x7e5a*/  .byte 0x25
/*0x7e5b*/  .byte 0x05
/*0x7e5c*/  .byte 0x4d
/*0x7e5d*/  .byte 0x05
/*0x7e5e*/  .byte 0x75
/*0x7e5f*/  .byte 0x05
/*0x7e60*/  .byte 0x9f
/*0x7e61*/  .byte 0x05
/*0x7e62*/  .byte 0xc8
/*0x7e63*/  .byte 0x05
/*0x7e64*/  .byte 0xf3
/*0x7e65*/  .byte 0x05
/*0x7e66*/  .byte 0x1e
/*0x7e67*/  .byte 0x06
/*0x7e68*/  .byte 0x4a
/*0x7e69*/  .byte 0x06
/*0x7e6a*/  .byte 0x77
/*0x7e6b*/  .byte 0x06
/*0x7e6c*/  .byte 0xa4
/*0x7e6d*/  .byte 0x06
/*0x7e6e*/  .byte 0xd2
/*0x7e6f*/  .byte 0x06
/*0x7e70*/  .byte 0x01
/*0x7e71*/  .byte 0x07
/*0x7e72*/  .byte 0x31
/*0x7e73*/  .byte 0x07
/*0x7e74*/  .byte 0x61
/*0x7e75*/  .byte 0x07
/*0x7e76*/  .byte 0x92
/*0x7e77*/  .byte 0x07
/*0x7e78*/  .byte 0xc4
/*0x7e79*/  .byte 0x07
/*0x7e7a*/  .byte 0xf6
/*0x7e7b*/  .byte 0x07
/*0x7e7c*/  .byte 0x2a
/*0x7e7d*/  .byte 0x08
/*0x7e7e*/  .byte 0x5e
/*0x7e7f*/  .byte 0x08
/*0x7e80*/  .byte 0x93
/*0x7e81*/  .byte 0x08
/*0x7e82*/  .byte 0xc9
/*0x7e83*/  .byte 0x08
/*0x7e84*/  .byte 0x00
/*0x7e85*/  .byte 0x09
/*0x7e86*/  .byte 0x38
/*0x7e87*/  .byte 0x09
/*0x7e88*/  .byte 0x70
/*0x7e89*/  .byte 0x09
/*0x7e8a*/  .byte 0xaa
/*0x7e8b*/  .byte 0x09
/*0x7e8c*/  .byte 0xe4
/*0x7e8d*/  .byte 0x09
/*0x7e8e*/  .byte 0x1f
/*0x7e8f*/  .byte 0x0a
/*0x7e90*/  .byte 0x5b
/*0x7e91*/  .byte 0x0a
/*0x7e92*/  .byte 0x99
/*0x7e93*/  .byte 0x0a
/*0x7e94*/  .byte 0xd7
/*0x7e95*/  .byte 0x0a
/*0x7e96*/  .byte 0x16
/*0x7e97*/  .byte 0x0b
/*0x7e98*/  .byte 0x56
/*0x7e99*/  .byte 0x0b
/*0x7e9a*/  .byte 0x97
/*0x7e9b*/  .byte 0x0b
/*0x7e9c*/  .byte 0xd9
/*0x7e9d*/  .byte 0x0b
/*0x7e9e*/  .byte 0x1d
/*0x7e9f*/  .byte 0x0c
/*0x7ea0*/  .byte 0x61
/*0x7ea1*/  .byte 0x0c
/*0x7ea2*/  .byte 0xa6
/*0x7ea3*/  .byte 0x0c
/*0x7ea4*/  .byte 0xed
/*0x7ea5*/  .byte 0x0c
/*0x7ea6*/  .byte 0x34
/*0x7ea7*/  .byte 0x0d
/*0x7ea8*/  .byte 0x7d
/*0x7ea9*/  .byte 0x0d
/*0x7eaa*/  .byte 0xc7
/*0x7eab*/  .byte 0x0d
/*0x7eac*/  .byte 0x12
/*0x7ead*/  .byte 0x0e
/*0x7eae*/  .byte 0x5e
/*0x7eaf*/  .byte 0x0e
/*0x7eb0*/  .byte 0xac
/*0x7eb1*/  .byte 0x0e
/*0x7eb2*/  .byte 0xfb
/*0x7eb3*/  .byte 0x0e
/*0x7eb4*/  .byte 0x4b
/*0x7eb5*/  .byte 0x0f
/*0x7eb6*/  .byte 0x9c
/*0x7eb7*/  .byte 0x0f
/*0x7eb8*/  .byte 0xee
/*0x7eb9*/  .byte 0x0f
/*0x7eba*/  .byte 0x42
/*0x7ebb*/  .byte 0x10
/*0x7ebc*/  .byte 0x97
/*0x7ebd*/  .byte 0x10
/*0x7ebe*/  .byte 0xee
/*0x7ebf*/  .byte 0x10
/*0x7ec0*/  .byte 0x46
/*0x7ec1*/  .byte 0x11
/*0x7ec2*/  .byte 0x9f
/*0x7ec3*/  .byte 0x11
/*0x7ec4*/  .byte 0xfa
/*0x7ec5*/  .byte 0x11
/*0x7ec6*/  .byte 0x56
/*0x7ec7*/  .byte 0x12
/*0x7ec8*/  .byte 0xb4
/*0x7ec9*/  .byte 0x12
/*0x7eca*/  .byte 0x13
/*0x7ecb*/  .byte 0x13
/*0x7ecc*/  .byte 0x73
/*0x7ecd*/  .byte 0x13
/*0x7ece*/  .byte 0xd5
/*0x7ecf*/  .byte 0x13
/*0x7ed0*/  .byte 0x39
/*0x7ed1*/  .byte 0x14
/*0x7ed2*/  .byte 0x9e
/*0x7ed3*/  .byte 0x14
/*0x7ed4*/  .byte 0x05
/*0x7ed5*/  .byte 0x15
/*0x7ed6*/  .byte 0x6e
/*0x7ed7*/  .byte 0x15
/*0x7ed8*/  .byte 0xd8
/*0x7ed9*/  .byte 0x15
/*0x7eda*/  .byte 0x44
/*0x7edb*/  .byte 0x16
/*0x7edc*/  .byte 0xb2
/*0x7edd*/  .byte 0x16
/*0x7ede*/  .byte 0x21
/*0x7edf*/  .byte 0x17
/*0x7ee0*/  .byte 0x92
/*0x7ee1*/  .byte 0x17
/*0x7ee2*/  .byte 0x05
/*0x7ee3*/  .byte 0x18
/*0x7ee4*/  .byte 0x7a
/*0x7ee5*/  .byte 0x18
/*0x7ee6*/  .byte 0xf0
/*0x7ee7*/  .byte 0x18
/*0x7ee8*/  .byte 0x69
/*0x7ee9*/  .byte 0x19
/*0x7eea*/  .byte 0xe3
/*0x7eeb*/  .byte 0x19
/*0x7eec*/  .byte 0x5f
/*0x7eed*/  .byte 0x1a
/*0x7eee*/  .byte 0xde
/*0x7eef*/  .byte 0x1a
/*0x7ef0*/  .byte 0x5e
/*0x7ef1*/  .byte 0x1b
/*0x7ef2*/  .byte 0xe0
/*0x7ef3*/  .byte 0x1b
/*0x7ef4*/  .byte 0x65
/*0x7ef5*/  .byte 0x1c
/*0x7ef6*/  .byte 0xeb
/*0x7ef7*/  .byte 0x1c
/*0x7ef8*/  .byte 0x74
/*0x7ef9*/  .byte 0x1d
/*0x7efa*/  .byte 0xff
/*0x7efb*/  .byte 0x1d
/*0x7efc*/  .byte 0x8c
/*0x7efd*/  .byte 0x1e
/*0x7efe*/  .byte 0x1b
/*0x7eff*/  .byte 0x1f
/*0x7f00*/  .byte 0xac
/*0x7f01*/  .byte 0x1f
/*0x7f02*/  .byte 0x40
/*0x7f03*/  .byte 0x20
/*0x7f04*/  .byte 0xd6
/*0x7f05*/  .byte 0x20
/*0x7f06*/  .byte 0x6f
/*0x7f07*/  .byte 0x21
/*0x7f08*/  .byte 0x0a
/*0x7f09*/  .byte 0x22
/*0x7f0a*/  .byte 0xa8
/*0x7f0b*/  .byte 0x22
/*0x7f0c*/  .byte 0x48
/*0x7f0d*/  .byte 0x23
/*0x7f0e*/  .byte 0xea
/*0x7f0f*/  .byte 0x23
/*0x7f10*/  .byte 0x8f
/*0x7f11*/  .byte 0x24
/*0x7f12*/  .byte 0x37
/*0x7f13*/  .byte 0x25
/*0x7f14*/  .byte 0xe1
/*0x7f15*/  .byte 0x25
/*0x7f16*/  .byte 0x8e
/*0x7f17*/  .byte 0x26
/*0x7f18*/  .byte 0x3e
/*0x7f19*/  .byte 0x27
/*0x7f1a*/  .byte 0xf1
/*0x7f1b*/  .byte 0x27
/*0x7f1c*/  .byte 0xa6
/*0x7f1d*/  .byte 0x28
/*0x7f1e*/  .byte 0x5f
/*0x7f1f*/  .byte 0x29
/*0x7f20*/  .byte 0x1a
/*0x7f21*/  .byte 0x2a
/*0x7f22*/  .byte 0xd8
/*0x7f23*/  .byte 0x2a
/*0x7f24*/  .byte 0x99
/*0x7f25*/  .byte 0x2b
/*0x7f26*/  .byte 0x5e
/*0x7f27*/  .byte 0x2c
/*0x7f28*/  .byte 0x25
/*0x7f29*/  .byte 0x2d
/*0x7f2a*/  .byte 0xf0
/*0x7f2b*/  .byte 0x2d
/*0x7f2c*/  .byte 0xbe
/*0x7f2d*/  .byte 0x2e
/*0x7f2e*/  .byte 0x8f
/*0x7f2f*/  .byte 0x2f
/*0x7f30*/  .byte 0x63
/*0x7f31*/  .byte 0x30
/*0x7f32*/  .byte 0x3b
/*0x7f33*/  .byte 0x31
/*0x7f34*/  .byte 0x16
/*0x7f35*/  .byte 0x32
/*0x7f36*/  .byte 0xf5
/*0x7f37*/  .byte 0x32
/*0x7f38*/  .byte 0xd7
/*0x7f39*/  .byte 0x33
/*0x7f3a*/  .byte 0xbd
/*0x7f3b*/  .byte 0x34
/*0x7f3c*/  .byte 0xa7
/*0x7f3d*/  .byte 0x35
/*0x7f3e*/  .byte 0x94
/*0x7f3f*/  .byte 0x36
/*0x7f40*/  .byte 0x85
/*0x7f41*/  .byte 0x37
/*0x7f42*/  .byte 0x7a
/*0x7f43*/  .byte 0x38
/*0x7f44*/  .byte 0x72
/*0x7f45*/  .byte 0x39
/*0x7f46*/  .byte 0x6f
/*0x7f47*/  .byte 0x3a
/*0x7f48*/  .byte 0x70
/*0x7f49*/  .byte 0x3b
/*0x7f4a*/  .byte 0x74
/*0x7f4b*/  .byte 0x3c
/*0x7f4c*/  .byte 0x7d
/*0x7f4d*/  .byte 0x3d
/*0x7f4e*/  .byte 0x8a
/*0x7f4f*/  .byte 0x3e
/*0x7f50*/  .byte 0x9c
/*0x7f51*/  .byte 0x3f
/*0x7f52*/  .byte 0xb1
/*0x7f53*/  .byte 0x40
/*0x7f54*/  .byte 0xcb
/*0x7f55*/  .byte 0x41
/*0x7f56*/  .byte 0xea
/*0x7f57*/  .byte 0x42
/*0x7f58*/  .byte 0x0d
/*0x7f59*/  .byte 0x44
/*0x7f5a*/  .byte 0x35
/*0x7f5b*/  .byte 0x45
/*0x7f5c*/  .byte 0x61
/*0x7f5d*/  .byte 0x46
/*0x7f5e*/  .byte 0x93
/*0x7f5f*/  .byte 0x47
/*0x7f60*/  .byte 0xc9
/*0x7f61*/  .byte 0x48
/*0x7f62*/  .byte 0x04
/*0x7f63*/  .byte 0x4a
/*0x7f64*/  .byte 0x44
/*0x7f65*/  .byte 0x4b
/*0x7f66*/  .byte 0x89
/*0x7f67*/  .byte 0x4c
/*0x7f68*/  .byte 0xd3
/*0x7f69*/  .byte 0x4d
/*0x7f6a*/  .byte 0x22
/*0x7f6b*/  .byte 0x4f
/*0x7f6c*/  .byte 0x77
/*0x7f6d*/  .byte 0x50
/*0x7f6e*/  .byte 0xd2
/*0x7f6f*/  .byte 0x51
/*0x7f70*/  .byte 0x31
/*0x7f71*/  .byte 0x53
/*0x7f72*/  .byte 0x97
/*0x7f73*/  .byte 0x54
/*0x7f74*/  .byte 0x02
/*0x7f75*/  .byte 0x56
/*0x7f76*/  .byte 0x72
/*0x7f77*/  .byte 0x57
/*0x7f78*/  .byte 0xe9
/*0x7f79*/  .byte 0x58
/*0x7f7a*/  .byte 0x66
/*0x7f7b*/  .byte 0x5a
/*0x7f7c*/  .byte 0xe8
/*0x7f7d*/  .byte 0x5b
/*0x7f7e*/  .byte 0x71
/*0x7f7f*/  .byte 0x5d
/*0x7f80*/  .byte 0x00
/*0x7f81*/  .byte 0x5f
/*0x7f82*/  .byte 0x95
/*0x7f83*/  .byte 0x60
/*0x7f84*/  .byte 0x31
/*0x7f85*/  .byte 0x62
/*0x7f86*/  .byte 0xd3
/*0x7f87*/  .byte 0x63
/*0x7f88*/  .byte 0x7c
/*0x7f89*/  .byte 0x65
/*0x7f8a*/  .byte 0x2c
/*0x7f8b*/  .byte 0x67
/*0x7f8c*/  .byte 0xe3
/*0x7f8d*/  .byte 0x68
/*0x7f8e*/  .byte 0xa0
/*0x7f8f*/  .byte 0x6a
/*0x7f90*/  .byte 0x65
/*0x7f91*/  .byte 0x6c
/*0x7f92*/  .byte 0x31
/*0x7f93*/  .byte 0x6e
/*0x7f94*/  .byte 0x04
/*0x7f95*/  .byte 0x70
/*0x7f96*/  .byte 0xde
/*0x7f97*/  .byte 0x71
/*0x7f98*/  .byte 0xc0
/*0x7f99*/  .byte 0x73
/*0x7f9a*/  .byte 0xaa
/*0x7f9b*/  .byte 0x75
/*0x7f9c*/  .byte 0x9c
/*0x7f9d*/  .byte 0x77
/*0x7f9e*/  .byte 0x95
/*0x7f9f*/  .byte 0x79
/*0x7fa0*/  .byte 0x96
/*0x7fa1*/  .byte 0x7b
/*0x7fa2*/  .byte 0xa0
/*0x7fa3*/  .byte 0x7d
/*0x7fa4*/  .byte 0xb2
/*0x7fa5*/  .byte 0x7f
/*0x7fa6*/  .byte 0xcc
/*0x7fa7*/  .byte 0x81
/*0x7fa8*/  .byte 0xef
/*0x7fa9*/  .byte 0x83
/*0x7faa*/  .byte 0x1a
/*0x7fab*/  .byte 0x86
/*0x7fac*/  .byte 0x4f
/*0x7fad*/  .byte 0x88
/*0x7fae*/  .byte 0x8c
/*0x7faf*/  .byte 0x8a
/*0x7fb0*/  .byte 0xd3
/*0x7fb1*/  .byte 0x8c
/*0x7fb2*/  .byte 0x22
/*0x7fb3*/  .byte 0x8f
/*0x7fb4*/  .byte 0x7b
/*0x7fb5*/  .byte 0x91
/*0x7fb6*/  .byte 0xde
/*0x7fb7*/  .byte 0x93
/*0x7fb8*/  .byte 0x4a
/*0x7fb9*/  .byte 0x96
/*0x7fba*/  .byte 0xc0
/*0x7fbb*/  .byte 0x98
/*0x7fbc*/  .byte 0x40
/*0x7fbd*/  .byte 0x9b
/*0x7fbe*/  .byte 0xcb
/*0x7fbf*/  .byte 0x9d
/*0x7fc0*/  .byte 0x5f
/*0x7fc1*/  .byte 0xa0
/*0x7fc2*/  .byte 0xff
/*0x7fc3*/  .byte 0xa2
/*0x7fc4*/  .byte 0xa8
/*0x7fc5*/  .byte 0xa5
/*0x7fc6*/  .byte 0x5d
/*0x7fc7*/  .byte 0xa8
/*0x7fc8*/  .byte 0x1d
/*0x7fc9*/  .byte 0xab
/*0x7fca*/  .byte 0xe8
/*0x7fcb*/  .byte 0xad
/*0x7fcc*/  .byte 0xbe
/*0x7fcd*/  .byte 0xb0
/*0x7fce*/  .byte 0x9f
/*0x7fcf*/  .byte 0xb3
/*0x7fd0*/  .byte 0x8d
/*0x7fd1*/  .byte 0xb6
/*0x7fd2*/  .byte 0x86
/*0x7fd3*/  .byte 0xb9
/*0x7fd4*/  .byte 0x8c
/*0x7fd5*/  .byte 0xbc
/*0x7fd6*/  .byte 0x9d
/*0x7fd7*/  .byte 0xbf
/*0x7fd8*/  .byte 0xbc
/*0x7fd9*/  .byte 0xc2
/*0x7fda*/  .byte 0xe6
/*0x7fdb*/  .byte 0xc5
/*0x7fdc*/  .byte 0x1e
/*0x7fdd*/  .byte 0xc9
/*0x7fde*/  .byte 0x63
/*0x7fdf*/  .byte 0xcc
/*0x7fe0*/  .byte 0xb5
/*0x7fe1*/  .byte 0xcf
/*0x7fe2*/  .byte 0x15
/*0x7fe3*/  .byte 0xd3
/*0x7fe4*/  .byte 0x82
/*0x7fe5*/  .byte 0xd6
/*0x7fe6*/  .byte 0xfd
/*0x7fe7*/  .byte 0xd9
/*0x7fe8*/  .byte 0x87
/*0x7fe9*/  .byte 0xdd
/*0x7fea*/  .byte 0x1f
/*0x7feb*/  .byte 0xe1
/*0x7fec*/  .byte 0xc5
/*0x7fed*/  .byte 0xe4
/*0x7fee*/  .byte 0x7a
/*0x7fef*/  .byte 0xe8
/*0x7ff0*/  .byte 0x3f
/*0x7ff1*/  .byte 0xec
/*0x7ff2*/  .byte 0x12
/*0x7ff3*/  .byte 0xf0
/*0x7ff4*/  .byte 0xf5
/*0x7ff5*/  .byte 0xf3
/*0x7ff6*/  .byte 0xe9
/*0x7ff7*/  .byte 0xf7
/*0x7ff8*/  .byte 0xec
/*0x7ff9*/  .byte 0xfb
/*0x7ffa*/  .byte 0xff
/*0x7ffb*/  .byte 0xff
/*0x7ffc*/  .byte 0x60
/*0x7ffd*/  .byte 0x81
/*0x7ffe*/  .byte 0x00
/*0x7fff*/  .byte 0x00
/*0x8000*/  .byte 0x64
/*0x8001*/  .byte 0x81
/*0x8002*/  .byte 0x00
/*0x8003*/  .byte 0x00
            usb_report1_desc:
/*0x8004*/  .byte 0x06 /* Usage Page (Vendor Defined 0xFF00) */
/*0x8005*/  .byte 0x00
/*0x8006*/  .byte 0xff
/*0x8007*/  .byte 0x09 /* Usage (0x01) */
/*0x8008*/  .byte 0x01
/*0x8009*/  .byte 0xa1 /* Collection (Application) */
/*0x800a*/  .byte 0x01
/*0x800b*/  .byte 0x09 /* - Usage (0x02) */
/*0x800c*/  .byte 0x02
/*0x800d*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x800e*/  .byte 0x00
/*0x800f*/  .byte 0x26 /* - Logical Maximum (255) */
/*0x8010*/  .byte 0xff
/*0x8011*/  .byte 0x00
/*0x8012*/  .byte 0x75 /* - Report Size (8) */
/*0x8013*/  .byte 0x08
/*0x8014*/  .byte 0x95 /* - Report Count (64) */
/*0x8015*/  .byte 0x40
/*0x8016*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x8017*/  .byte 0x02
/*0x8018*/  .byte 0x09 /* - Usage (0x03) */
/*0x8019*/  .byte 0x03
/*0x801a*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x801b*/  .byte 0x00
/*0x801c*/  .byte 0x26 /* - Logical Maximum (255) */
/*0x801d*/  .byte 0xff
/*0x801e*/  .byte 0x00
/*0x801f*/  .byte 0x75 /* - Report Size (8) */
/*0x8020*/  .byte 0x08
/*0x8021*/  .byte 0x95 /* - Report Count (64) */
/*0x8022*/  .byte 0x40
/*0x8023*/  .byte 0x91 /* - Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x8024*/  .byte 0x02
/*0x8025*/  .byte 0xc0 /* End Collection */
/*0x8026*/  .byte 0x00
/*0x8027*/  .byte 0x00
            usb_report2_desc:
/*0x8028*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x8029*/  .byte 0x01
/*0x802a*/  .byte 0x09 /* Usage (Sys Control) */
/*0x802b*/  .byte 0x80
/*0x802c*/  .byte 0xa1 /* Collection (Application) */
/*0x802d*/  .byte 0x01
/*0x802e*/  .byte 0x85 /* - Report ID (1) */
/*0x802f*/  .byte 0x01
/*0x8030*/  .byte 0x19 /* - Usage Minimum (Sys Power Down) */
/*0x8031*/  .byte 0x81
/*0x8032*/  .byte 0x29 /* - Usage Maximum (Sys Wake Up) */
/*0x8033*/  .byte 0x83
/*0x8034*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x8035*/  .byte 0x00
/*0x8036*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x8037*/  .byte 0x01
/*0x8038*/  .byte 0x95 /* - Report Count (3) */
/*0x8039*/  .byte 0x03
/*0x803a*/  .byte 0x75 /* - Report Size (1) */
/*0x803b*/  .byte 0x01
/*0x803c*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x803d*/  .byte 0x02
/*0x803e*/  .byte 0x95 /* - Report Count (1) */
/*0x803f*/  .byte 0x01
/*0x8040*/  .byte 0x75 /* - Report Size (5) */
/*0x8041*/  .byte 0x05
/*0x8042*/  .byte 0x81 /* - Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x8043*/  .byte 0x01
/*0x8044*/  .byte 0xc0 /* End Collection */
/*0x8045*/  .byte 0x05 /* Usage Page (Consumer) */
/*0x8046*/  .byte 0x0c
/*0x8047*/  .byte 0x09 /* Usage (Consumer Control) */
/*0x8048*/  .byte 0x01
/*0x8049*/  .byte 0xa1 /* Collection (Application) */
/*0x804a*/  .byte 0x01
/*0x804b*/  .byte 0x85 /* - Report ID (2) */
/*0x804c*/  .byte 0x02
/*0x804d*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x804e*/  .byte 0x00
/*0x804f*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x8050*/  .byte 0x01
/*0x8051*/  .byte 0x95 /* - Report Count (18) */
/*0x8052*/  .byte 0x12
/*0x8053*/  .byte 0x75 /* - Report Size (1) */
/*0x8054*/  .byte 0x01
/*0x8055*/  .byte 0x0a
/*0x8056*/  .byte 0x83 /* - Usage (AL Consumer Control Configuration) */
/*0x8057*/  .byte 0x01
/*0x8058*/  .byte 0x0a
/*0x8059*/  .byte 0x8a /* - Usage (AL Email Reader) */
/*0x805a*/  .byte 0x01
/*0x805b*/  .byte 0x0a
/*0x805c*/  .byte 0x92 /* - Usage (AL Calculator) */
/*0x805d*/  .byte 0x01
/*0x805e*/  .byte 0x0a
/*0x805f*/  .byte 0x94 /* - Usage (AL Local Machine Browser) */
/*0x8060*/  .byte 0x01
/*0x8061*/  .byte 0x09 /* - Usage (Play/Pause) */
/*0x8062*/  .byte 0xcd
/*0x8063*/  .byte 0x09 /* - Usage (Stop) */
/*0x8064*/  .byte 0xb7
/*0x8065*/  .byte 0x09 /* - Usage (Scan Previous Track) */
/*0x8066*/  .byte 0xb6
/*0x8067*/  .byte 0x09 /* - Usage (Scan Next Track) */
/*0x8068*/  .byte 0xb5
/*0x8069*/  .byte 0x09 /* - Usage (Mute) */
/*0x806a*/  .byte 0xe2
/*0x806b*/  .byte 0x09 /* - Usage (Volume Decrement) */
/*0x806c*/  .byte 0xea
/*0x806d*/  .byte 0x09 /* - Usage (Volume Increment) */
/*0x806e*/  .byte 0xe9
/*0x806f*/  .byte 0x0a
/*0x8070*/  .byte 0x21 /* - Usage (AC Search) */
/*0x8071*/  .byte 0x02
/*0x8072*/  .byte 0x0a
/*0x8073*/  .byte 0x23 /* - Usage (AC Home) */
/*0x8074*/  .byte 0x02
/*0x8075*/  .byte 0x0a
/*0x8076*/  .byte 0x24 /* - Usage (AC Back) */
/*0x8077*/  .byte 0x02
/*0x8078*/  .byte 0x0a
/*0x8079*/  .byte 0x25 /* - Usage (AC Forward) */
/*0x807a*/  .byte 0x02
/*0x807b*/  .byte 0x0a
/*0x807c*/  .byte 0x26 /* - Usage (AC Stop) */
/*0x807d*/  .byte 0x02
/*0x807e*/  .byte 0x0a
/*0x807f*/  .byte 0x27 /* - Usage (AC Refresh) */
/*0x8080*/  .byte 0x02
/*0x8081*/  .byte 0x0a
/*0x8082*/  .byte 0x2a /* - Usage (AC Bookmarks) */
/*0x8083*/  .byte 0x02
/*0x8084*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x8085*/  .byte 0x02
/*0x8086*/  .byte 0x95 /* - Report Count (1) */
/*0x8087*/  .byte 0x01
/*0x8088*/  .byte 0x75 /* - Report Size (14) */
/*0x8089*/  .byte 0x0e
/*0x808a*/  .byte 0x81 /* - Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x808b*/  .byte 0x01
/*0x808c*/  .byte 0xc0 /* End Collection */
/*0x808d*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x808e*/  .byte 0x01
/*0x808f*/  .byte 0x09 /* Usage (Keyboard) */
/*0x8090*/  .byte 0x06
/*0x8091*/  .byte 0xa1 /* Collection (Application) */
/*0x8092*/  .byte 0x01
/*0x8093*/  .byte 0x85 /* - Report ID (4) */
/*0x8094*/  .byte 0x04
/*0x8095*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x8096*/  .byte 0x07
/*0x8097*/  .byte 0x95 /* - Report Count (1) */
/*0x8098*/  .byte 0x01
/*0x8099*/  .byte 0x75 /* - Report Size (8) */
/*0x809a*/  .byte 0x08
/*0x809b*/  .byte 0x81 /* - Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x809c*/  .byte 0x03
/*0x809d*/  .byte 0x95 /* - Report Count (232) */
/*0x809e*/  .byte 0xe8
/*0x809f*/  .byte 0x75 /* - Report Size (1) */
/*0x80a0*/  .byte 0x01
/*0x80a1*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x80a2*/  .byte 0x00
/*0x80a3*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x80a4*/  .byte 0x01
/*0x80a5*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x80a6*/  .byte 0x07
/*0x80a7*/  .byte 0x19 /* - Usage Minimum (0x00) */
/*0x80a8*/  .byte 0x00
/*0x80a9*/  .byte 0x29 /* - Usage Maximum (0xE7) */
/*0x80aa*/  .byte 0xe7
/*0x80ab*/  .byte 0x81 /* - Input (Data,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x80ac*/  .byte 0x00
/*0x80ad*/  .byte 0xc0 /* End Collection */
/*0x80ae*/  .byte 0x00
/*0x80af*/  .byte 0x00
            usb_report0_desc:
/*0x80b0*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x80b1*/  .byte 0x01
/*0x80b2*/  .byte 0x09 /* Usage (Keyboard) */
/*0x80b3*/  .byte 0x06
/*0x80b4*/  .byte 0xa1 /* Collection (Application) */
/*0x80b5*/  .byte 0x01
/*0x80b6*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x80b7*/  .byte 0x07
/*0x80b8*/  .byte 0x19 /* - Usage Minimum (0xE0) */
/*0x80b9*/  .byte 0xe0
/*0x80ba*/  .byte 0x29 /* - Usage Maximum (0xE7) */
/*0x80bb*/  .byte 0xe7
/*0x80bc*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x80bd*/  .byte 0x00
/*0x80be*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x80bf*/  .byte 0x01
/*0x80c0*/  .byte 0x75 /* - Report Size (1) */
/*0x80c1*/  .byte 0x01
/*0x80c2*/  .byte 0x95 /* - Report Count (8) */
/*0x80c3*/  .byte 0x08
/*0x80c4*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x80c5*/  .byte 0x02
/*0x80c6*/  .byte 0x95 /* - Report Count (1) */
/*0x80c7*/  .byte 0x01
/*0x80c8*/  .byte 0x75 /* - Report Size (8) */
/*0x80c9*/  .byte 0x08
/*0x80ca*/  .byte 0x81 /* - Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x80cb*/  .byte 0x03
/*0x80cc*/  .byte 0x95 /* - Report Count (3) */
/*0x80cd*/  .byte 0x03
/*0x80ce*/  .byte 0x75 /* - Report Size (1) */
/*0x80cf*/  .byte 0x01
/*0x80d0*/  .byte 0x05 /* - Usage Page (LEDs) */
/*0x80d1*/  .byte 0x08
/*0x80d2*/  .byte 0x19 /* - Usage Minimum (Num Lock) */
/*0x80d3*/  .byte 0x01
/*0x80d4*/  .byte 0x29 /* - Usage Maximum (Scroll Lock) */
/*0x80d5*/  .byte 0x03
/*0x80d6*/  .byte 0x91 /* - Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x80d7*/  .byte 0x02
/*0x80d8*/  .byte 0x95 /* - Report Count (1) */
/*0x80d9*/  .byte 0x01
/*0x80da*/  .byte 0x75 /* - Report Size (5) */
/*0x80db*/  .byte 0x05
/*0x80dc*/  .byte 0x91 /* - Output (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x80dd*/  .byte 0x03
/*0x80de*/  .byte 0x95 /* - Report Count (6) */
/*0x80df*/  .byte 0x06
/*0x80e0*/  .byte 0x75 /* - Report Size (8) */
/*0x80e1*/  .byte 0x08
/*0x80e2*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x80e3*/  .byte 0x00
/*0x80e4*/  .byte 0x26 /* - Logical Maximum (164) */
/*0x80e5*/  .byte 0xa4
/*0x80e6*/  .byte 0x00
/*0x80e7*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x80e8*/  .byte 0x07
/*0x80e9*/  .byte 0x19 /* - Usage Minimum (0x00) */
/*0x80ea*/  .byte 0x00
/*0x80eb*/  .byte 0x29 /* - Usage Maximum (0xA4) */
/*0x80ec*/  .byte 0xa4
/*0x80ed*/  .byte 0x81 /* - Input (Data,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x80ee*/  .byte 0x00
/*0x80ef*/  .byte 0xc0 /* End Collection */
            usb_config_desc:
/*0x80f0*/  .byte 0x09
/*0x80f1*/  .byte 0x02
/*0x80f2*/  .byte 0x5b
/*0x80f3*/  .byte 0x00
/*0x80f4*/  .byte 0x03
/*0x80f5*/  .byte 0x01
/*0x80f6*/  .byte 0x00
/*0x80f7*/  .byte 0xa0
/*0x80f8*/  .byte 0x32
            usb_interface0_desc:
/*0x80f9*/  .byte 0x09
/*0x80fa*/  .byte 0x04
/*0x80fb*/  .byte 0x00
/*0x80fc*/  .byte 0x00
/*0x80fd*/  .byte 0x01
/*0x80fe*/  .byte 0x03
/*0x80ff*/  .byte 0x01
/*0x8100*/  .byte 0x01
/*0x8101*/  .byte 0x00
            usb_hid0_desc:
/*0x8102*/  .byte 0x09
/*0x8103*/  .byte 0x21
/*0x8104*/  .byte 0x11
/*0x8105*/  .byte 0x01
/*0x8106*/  .byte 0x00
/*0x8107*/  .byte 0x01
/*0x8108*/  .byte 0x22
/*0x8109*/  .byte 0x40
/*0x810a*/  .byte 0x00
            usb_endpoint1_desc:
/*0x810b*/  .byte 0x07
/*0x810c*/  .byte 0x05
/*0x810d*/  .byte 0x81
/*0x810e*/  .byte 0x03
/*0x810f*/  .byte 0x08
/*0x8110*/  .byte 0x00
/*0x8111*/  .byte 0x01
            usb_interface1_desc:
/*0x8112*/  .byte 0x09
/*0x8113*/  .byte 0x04
/*0x8114*/  .byte 0x01
/*0x8115*/  .byte 0x00
/*0x8116*/  .byte 0x02
/*0x8117*/  .byte 0x03
/*0x8118*/  .byte 0x00
/*0x8119*/  .byte 0x00
/*0x811a*/  .byte 0x00
            usb_hid1_desc:
/*0x811b*/  .byte 0x09
/*0x811c*/  .byte 0x21
/*0x811d*/  .byte 0x11
/*0x811e*/  .byte 0x01
/*0x811f*/  .byte 0x00
/*0x8120*/  .byte 0x01
/*0x8121*/  .byte 0x22
/*0x8122*/  .byte 0x22
/*0x8123*/  .byte 0x00
            usb_endpoint3_desc:
/*0x8124*/  .byte 0x07
/*0x8125*/  .byte 0x05
/*0x8126*/  .byte 0x83
/*0x8127*/  .byte 0x03
/*0x8128*/  .byte 0x40
/*0x8129*/  .byte 0x00
/*0x812a*/  .byte 0x01
            usb_endpoint4_desc:
/*0x812b*/  .byte 0x07
/*0x812c*/  .byte 0x05
/*0x812d*/  .byte 0x04
/*0x812e*/  .byte 0x03
/*0x812f*/  .byte 0x40
/*0x8130*/  .byte 0x00
/*0x8131*/  .byte 0x01
            usb_interface2_desc:
/*0x8132*/  .byte 0x09
/*0x8133*/  .byte 0x04
/*0x8134*/  .byte 0x02
/*0x8135*/  .byte 0x00
/*0x8136*/  .byte 0x01
/*0x8137*/  .byte 0x03
/*0x8138*/  .byte 0x00
/*0x8139*/  .byte 0x00
/*0x813a*/  .byte 0x00
            usb_hid2_desc:
/*0x813b*/  .byte 0x09
/*0x813c*/  .byte 0x21
/*0x813d*/  .byte 0x11
/*0x813e*/  .byte 0x01
/*0x813f*/  .byte 0x00
/*0x8140*/  .byte 0x01
/*0x8141*/  .byte 0x22
/*0x8142*/  .byte 0x86
/*0x8143*/  .byte 0x00
            usb_endpoint2_desc:
/*0x8144*/  .byte 0x07
/*0x8145*/  .byte 0x05
/*0x8146*/  .byte 0x82
/*0x8147*/  .byte 0x03
/*0x8148*/  .byte 0x40
/*0x8149*/  .byte 0x00
/*0x814a*/  .byte 0x01
/*0x814b*/  .byte 0x00
            usb_device_desc:
/*0x814c*/  .byte 0x12
/*0x814d*/  .byte 0x01
/*0x814e*/  .byte 0x10
/*0x814f*/  .byte 0x01
/*0x8150*/  .byte 0x00
/*0x8151*/  .byte 0x00
/*0x8152*/  .byte 0x00
/*0x8153*/  .byte 0x40
/*0x8154*/  .byte 0xd9
/*0x8155*/  .byte 0x04
/*0x8156*/  .byte 0x07
/*0x8157*/  .byte 0x02
/*0x8158*/  .byte 0x05
/*0x8159*/  .byte 0x01
/*0x815a*/  .byte 0x00
/*0x815b*/  .byte 0x01
/*0x815c*/  .byte 0x00
/*0x815d*/  .byte 0x01
/*0x815e*/  .byte 0x00
/*0x815f*/  .byte 0x00
            usb_str0_desc:
/*0x8160*/  .byte 0x04
/*0x8161*/  .byte 0x03
/*0x8162*/  .byte 0x09
/*0x8163*/  .byte 0x04
            usb_str1_desc:
/*0x8164*/  .byte 0x22
/*0x8165*/  .byte 0x03
/*0x8166*/  .byte 0x55
/*0x8167*/  .byte 0x00
/*0x8168*/  .byte 0x53
/*0x8169*/  .byte 0x00
/*0x816a*/  .byte 0x42
/*0x816b*/  .byte 0x00
/*0x816c*/  .byte 0x2d
/*0x816d*/  .byte 0x00
/*0x816e*/  .byte 0x48
/*0x816f*/  .byte 0x00
/*0x8170*/  .byte 0x49
/*0x8171*/  .byte 0x00
/*0x8172*/  .byte 0x44
/*0x8173*/  .byte 0x00
/*0x8174*/  .byte 0x20
/*0x8175*/  .byte 0x00
/*0x8176*/  .byte 0x4b
/*0x8177*/  .byte 0x00
/*0x8178*/  .byte 0x65
/*0x8179*/  .byte 0x00
/*0x817a*/  .byte 0x79
/*0x817b*/  .byte 0x00
/*0x817c*/  .byte 0x62
/*0x817d*/  .byte 0x00
/*0x817e*/  .byte 0x6f
/*0x817f*/  .byte 0x00
/*0x8180*/  .byte 0x61
/*0x8181*/  .byte 0x00
/*0x8182*/  .byte 0x72
/*0x8183*/  .byte 0x00
/*0x8184*/  .byte 0x64
/*0x8185*/  .byte 0x00
/*0x8186*/  .byte 0x00
/*0x8187*/  .byte 0x00
            data_8188:
/*0x8188*/  .byte 0xc1
/*0x8189*/  .byte 0x66
/*0x818a*/  .byte 0x00
/*0x818b*/  .byte 0x00
/*0x818c*/  .byte 0x00
/*0x818d*/  .byte 0x00
/*0x818e*/  .byte 0x00
/*0x818f*/  .byte 0x00
/*0x8190*/  .byte 0x51
/*0x8191*/  .byte 0x75
/*0x8192*/  .byte 0x00
/*0x8193*/  .byte 0x00
/*0x8194*/  .byte 0x00
/*0x8195*/  .byte 0x00
/*0x8196*/  .byte 0x00
/*0x8197*/  .byte 0x00
/*0x8198*/  .byte 0x00
/*0x8199*/  .byte 0x00
/*0x819a*/  .byte 0x00
/*0x819b*/  .byte 0x00
/*0x819c*/  .byte 0x51
/*0x819d*/  .byte 0x74
/*0x819e*/  .byte 0x00
/*0x819f*/  .byte 0x00
/*0x81a0*/  .byte 0x45
/*0x81a1*/  .byte 0x73
/*0x81a2*/  .byte 0x00
/*0x81a3*/  .byte 0x00
            data_81a4:
/*0x81a4*/  .byte 0xe8
/*0x81a5*/  .byte 0xc0
/*0x81a6*/  .byte 0xc1
/*0x81a7*/  .byte 0xc2
/*0x81a8*/  .byte 0xc3
            data_81a9:
/*0x81a9*/  .byte 0xff
/*0x81aa*/  .byte 0xff
/*0x81ab*/  .byte 0xff
/*0x81ac*/  .byte 0x08
/*0x81ad*/  .byte 0x03
/*0x81ae*/  .byte 0x00
/*0x81af*/  .byte 0x00

            sram_defs:
/*0x81b0*/  .word data_81d0
/*0x81b4*/  .word 0x20000000
/*0x81b8*/  .word 0x0000006c
/*0x81bc*/  .word 0x000078e4 /* possible pointer */
/*0x81c0*/  .word data_823c
/*0x81c4*/  .word 0x2000006c
/*0x81c8*/  .word 0x00002174
/*0x81cc*/  .word 0x000078f4 /* possible pointer */

            data_81d0:
/*0x81d0*/  .byte 0x00
/*0x81d1*/  .byte 0x00
/*0x81d2*/  .byte 0x00
/*0x81d3*/  .byte 0x00
/*0x81d4*/  .byte 0x00
/*0x81d5*/  .byte 0x00
/*0x81d6*/  .byte 0x00
/*0x81d7*/  .byte 0x00
/*0x81d8*/  .byte 0x00
/*0x81d9*/  .byte 0x00
/*0x81da*/  .byte 0x00
/*0x81db*/  .byte 0x00
/*0x81dc*/  .byte 0x00
/*0x81dd*/  .byte 0x00
/*0x81de*/  .byte 0x00
/*0x81df*/  .byte 0x00
/*0x81e0*/  .byte 0x00
/*0x81e1*/  .byte 0x00
/*0x81e2*/  .byte 0x00
/*0x81e3*/  .byte 0x00
/*0x81e4*/  .byte 0x00
/*0x81e5*/  .byte 0xa2
/*0x81e6*/  .byte 0x4a
/*0x81e7*/  .byte 0x04
/*0x81e8*/  .byte 0x01
/*0x81e9*/  .byte 0x00
/*0x81ea*/  .byte 0x00
/*0x81eb*/  .byte 0x00
/*0x81ec*/  .byte 0x00
/*0x81ed*/  .byte 0x00
/*0x81ee*/  .byte 0x00
/*0x81ef*/  .byte 0x00
/*0x81f0*/  .byte 0x00
/*0x81f1*/  .byte 0x00
/*0x81f2*/  .byte 0x00
/*0x81f3*/  .byte 0x00
/*0x81f4*/  .byte 0xff
/*0x81f5*/  .byte 0x00
/*0x81f6*/  .byte 0x00
/*0x81f7*/  .byte 0x00
/*0x81f8*/  .byte 0xf4
/*0x81f9*/  .byte 0x7d
/*0x81fa*/  .byte 0x00
/*0x81fb*/  .byte 0x00
/*0x81fc*/  .byte 0x00
/*0x81fd*/  .byte 0x00
/*0x81fe*/  .byte 0x00
/*0x81ff*/  .byte 0x00
/*0x8200*/  .byte 0x01
/*0x8201*/  .byte 0x00
/*0x8202*/  .byte 0x00
/*0x8203*/  .byte 0x00
/*0x8204*/  .byte 0x00
/*0x8205*/  .byte 0x00
/*0x8206*/  .byte 0x00
/*0x8207*/  .byte 0x00
/*0x8208*/  .byte 0x00
/*0x8209*/  .byte 0x00
/*0x820a*/  .byte 0x00
/*0x820b*/  .byte 0x00
/*0x820c*/  .byte 0x00
/*0x820d*/  .byte 0x00
/*0x820e*/  .byte 0x00
/*0x820f*/  .byte 0x00
/*0x8210*/  .byte 0x00
/*0x8211*/  .byte 0x00
/*0x8212*/  .byte 0x00
/*0x8213*/  .byte 0x00
/*0x8214*/  .byte 0x00
/*0x8215*/  .byte 0x00
/*0x8216*/  .byte 0x00
/*0x8217*/  .byte 0x00
/*0x8218*/  .byte 0x00
/*0x8219*/  .byte 0x00
/*0x821a*/  .byte 0x00
/*0x821b*/  .byte 0x00
/*0x821c*/  .byte 0x00
/*0x821d*/  .byte 0x00
/*0x821e*/  .byte 0x00
/*0x821f*/  .byte 0x00
/*0x8220*/  .byte 0x00
/*0x8221*/  .byte 0xff
/*0x8222*/  .byte 0x00
/*0x8223*/  .byte 0x00
/*0x8224*/  .byte 0x00
/*0x8225*/  .byte 0x00
/*0x8226*/  .byte 0x00
/*0x8227*/  .byte 0x00
/*0x8228*/  .byte 0x00
/*0x8229*/  .byte 0x00
/*0x822a*/  .byte 0x00
/*0x822b*/  .byte 0x00
/*0x822c*/  .byte 0xce
/*0x822d*/  .byte 0x09
/*0x822e*/  .byte 0x00
/*0x822f*/  .byte 0x20
/*0x8230*/  .byte 0x00
/*0x8231*/  .byte 0x00
/*0x8232*/  .byte 0x00
/*0x8233*/  .byte 0x00
/*0x8234*/  .byte 0x00
/*0x8235*/  .byte 0x00
/*0x8236*/  .byte 0x00
/*0x8237*/  .byte 0x00
/*0x8238*/  .byte 0x00
/*0x8239*/  .byte 0x00
/*0x823a*/  .byte 0x00
/*0x823b*/  .byte 0x00

            data_823c:
