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
/*0x3556*/      blx r0 /* call_6c18 */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /* call_6594 */
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
/*0x3574*/  .word call_6c18
            data_3578:
/*0x3578*/  .word call_6594
            data_357c:
/*0x357c*/  .word entry


            .thumb_func
            entry:
/*0x3580*/      ldr.w sp, [pc, #0xc] /* data_3590 */
/*0x3584*/      bl sram_init

            .thumb_func
            call_3588:
/*0x3588*/      ldr r0, [pc, #0] /* data_358c */
/*0x358a*/      bx r0 /* jump_785c */

            data_358c:
/*0x358c*/  .word jump_785c
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
            srand: /* (seed) */
/*0x35a8*/      ldr r1, [pc, #4] /* data_35b0 */
/*0x35aa*/      str r0, [r1]
/*0x35ac*/      bx lr

/*0x35ae*/  .byte 0x00
/*0x35af*/  .byte 0x00

            data_35b0:
/*0x35b0*/  .word 0x20000064
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
/*0x35c4*/      subs r2, r2, #4
/*0x35c6*/      stm r0!, {r3}
            jump_35c8:
/*0x35c8*/      cmp r2, #4
/*0x35ca*/      bhs jump_35c2
/*0x35cc*/      b jump_35d6
            jump_35ce:
/*0x35ce*/      ldrb r3, [r1], #1
/*0x35d2*/      strb r3, [r0], #1
            jump_35d6:
/*0x35d6*/      subs r2, r2, #1
/*0x35d8*/      bhs jump_35ce
/*0x35da*/      bx lr

            .thumb_func
            mem_set: /* (dest, size, val) */
/*0x35dc*/      uxtb r2, r2
/*0x35de*/      b jump_35e4
            jump_35e0:
/*0x35e0*/      strb r2, [r0], #1
            jump_35e4:
/*0x35e4*/      subs r1, r1, #1
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
/*0x360a*/      adds r3, r3, #1
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
/*0x363c*/  .word data_812c


            .thumb_func
            afio_exti_ssr_write:
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
/*0x3670*/      bl bftm_clear /* (BFTM) */
/*0x3674*/      bl call_5fb8
/*0x3678*/      ldr r0, [pc, #0x64] /* data_36e0 */
/*0x367a*/      ldr r1, [r0]
/*0x367c*/      cbz r1, jump_3684
/*0x367e*/      ldr r1, [r0]
/*0x3680*/      subs r1, r1, #1
/*0x3682*/      str r1, [r0]
            jump_3684:
/*0x3684*/      ldr r1, [r0, #4]
/*0x3686*/      cbz r1, jump_368e
/*0x3688*/      ldr r1, [r0, #4]
/*0x368a*/      subs r1, r1, #1
/*0x368c*/      str r1, [r0, #4]
            jump_368e:
/*0x368e*/      ldr r0, [pc, #0x54] /* data_36e4 */
/*0x3690*/      ldrh r1, [r0]
/*0x3692*/      adds r1, r1, #1
/*0x3694*/      strh r1, [r0]
/*0x3696*/      ldr r0, [pc, #0x50] /* data_36e8 */
/*0x3698*/      ldr r1, [r0]
/*0x369a*/      cbz r1, jump_36a2
/*0x369c*/      ldr r1, [r0]
/*0x369e*/      adds r1, r1, #1
/*0x36a0*/      str r1, [r0]
            jump_36a2:
/*0x36a2*/      ldr r0, [pc, #0x48] /* data_36ec */
/*0x36a4*/      ldr r1, [r0]
/*0x36a6*/      cbz r1, jump_36ae
/*0x36a8*/      ldr r1, [r0]
/*0x36aa*/      subs r1, r1, #1
/*0x36ac*/      str r1, [r0]
            jump_36ae:
/*0x36ae*/      ldr r0, [pc, #0x40] /* data_36f0 */
/*0x36b0*/      ldrb r1, [r0]
/*0x36b2*/      adds r1, r1, #1
/*0x36b4*/      strb r1, [r0]
/*0x36b6*/      ldr r1, [pc, #0x3c] /* data_36f4 */
/*0x36b8*/      ldrh r0, [r1]
/*0x36ba*/      cmp r0, #1
/*0x36bc*/      bls jump_36c2
/*0x36be*/      subs r0, r0, #1
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
/*0x36d4*/      adds r1, r1, #1
/*0x36d6*/      strh r1, [r0]
            jump_36d8:
/*0x36d8*/      pop {r4, pc}

/*0x36da*/  .byte 0x00
/*0x36db*/  .byte 0x00

            data_36dc:
/*0x36dc*/  .word 0x40076000
            data_36e0:
/*0x36e0*/  .word 0x200006bc
            data_36e4:
/*0x36e4*/  .word 0x2000000e
            data_36e8:
/*0x36e8*/  .word 0x20000008
            data_36ec:
/*0x36ec*/  .word 0x20000060
            data_36f0:
/*0x36f0*/  .word 0x2000002a
            data_36f4:
/*0x36f4*/  .word 0x20000002
            data_36f8:
/*0x36f8*/  .word 0x2000001c


            .thumb_func
            bftm1_intr:
/*0x36fc*/      push {r4, lr}
/*0x36fe*/      ldr r0, [pc, #0x4c] /* data_374c */
/*0x3700*/      bl bftm_clear /* (BFTM) */
/*0x3704*/      ldr r4, [pc, #0x48] /* data_3750 */
/*0x3706*/      ldr r0, [r4, #4]
/*0x3708*/      ldrh r1, [r0, #4]
/*0x370a*/      ldr r0, [r0]
/*0x370c*/      uxth r1, r1
/*0x370e*/      bl call_45a0
/*0x3712*/      movs r0, #0xa
/*0x3714*/      bl spin_wait /* (time) */
/*0x3718*/      movs r0, #2
/*0x371a*/      bl call_7238
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
/*0x373c*/      adds r0, r0, #1
/*0x373e*/      and r0, r0, #7
/*0x3742*/      strb r0, [r4, #1]
/*0x3744*/      pop.w {r4, lr}
/*0x3748*/      b.w call_6458

            data_374c:
/*0x374c*/  .word 0x40077000
            data_3750:
/*0x3750*/  .word 0x20000020
            data_3754:
/*0x3754*/  .word 0x400b0000
            data_3758:
/*0x3758*/  .word gpio_map_3


            .thumb_func
            bftm_clear: /* (BFTM) */
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
            afio_pin_config: /* (gpio_num, pin_num, af_num) */
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
            spin_wait: /* (time) */
/*0x37c4*/      add.w r0, r0, r0, lsl #2
/*0x37c8*/      lsls r0, r0, #2
            jump_37ca:
/*0x37ca*/      subs r0, r0, #1
/*0x37cc*/      bhs jump_37ca
/*0x37ce*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x37d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x37d4*/      mov.w r5, #0x4000
/*0x37d8*/      movs r4, #0
/*0x37da*/      lsls r0, r5, #2
/*0x37dc*/      mov r2, r4
/*0x37de*/      mov r8, r0
/*0x37e0*/      movs r3, #1
/*0x37e2*/      mov r1, r5
/*0x37e4*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
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
/*0x3830*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x3834*/      movs r2, #1
/*0x3836*/      movs r1, #0xd
/*0x3838*/      movs r0, #2
/*0x383a*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x383e*/      movs r2, #1
/*0x3840*/      movs r1, #0xe
/*0x3842*/      movs r0, #2
/*0x3844*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x3848*/      movs r2, #1
/*0x384a*/      movs r1, #0xf
/*0x384c*/      movs r0, #2
/*0x384e*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x3852*/      ldr r0, [pc, #0x30] /* data_3884 */
/*0x3854*/      ldr r0, [r0, #4]
/*0x3856*/      lsls r0, r0, #0x15
/*0x3858*/      bmi jump_386e
/*0x385a*/      movs r2, #1
/*0x385c*/      movs r1, #0xe
/*0x385e*/      mov r0, r2
/*0x3860*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x3864*/      movs r2, #1
/*0x3866*/      movs r1, #0xf
/*0x3868*/      mov r0, r2
/*0x386a*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
            jump_386e:
/*0x386e*/      mov r1, r4
/*0x3870*/      movs r3, #0
/*0x3872*/      mov r2, r4
/*0x3874*/      mov r0, r8
/*0x3876*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x387a*/      movs r0, #1
/*0x387c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_3880:
/*0x3880*/  .word 0x400b0000
            data_3884:
/*0x3884*/  .word 0x40088000


            .thumb_func
            ckcu_clocks_enable: /* (ahb_mask, apb0_mas, apb1_mask, en) */
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
            ckcu_set_usb_prescaler: /* (prescaler) */
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
/*0x3904*/  .word 0x20000030
            data_3908:
/*0x3908*/  .word 0x2000005c
            data_390c:
/*0x390c*/  .word 0x20000000
            data_3910:
/*0x3910*/  .word 0x20000648


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
/*0x395c*/      b.w jump_6c58
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
/*0x3970*/      bl call_51e4
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
/*0x3998*/      bl memcmp /* (ptr1, ptr2, size) */
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
/*0x39c4*/  .word 0x20000648
            data_39c8:
/*0x39c8*/  .word 0x20000004
            data_39cc:
/*0x39cc*/  .word 0x20000030
            data_39d0:
/*0x39d0*/  .word 0x20000730
            data_39d4:
/*0x39d4*/  .word 0x200001c0
            data_39d8:
/*0x39d8*/  .word data_7b63


            .thumb_func
            call_39dc:
/*0x39dc*/      movs r1, #3
/*0x39de*/      ldr r2, [pc, #0x10] /* data_39f0 */
/*0x39e0*/      b jump_39e6
            jump_39e2:
/*0x39e2*/      ldrb r3, [r0, r1]
/*0x39e4*/      strb r3, [r2, r1]
            jump_39e6:
/*0x39e6*/      subs r1, r1, #1
/*0x39e8*/      uxtb r1, r1
/*0x39ea*/      bhs jump_39e2
/*0x39ec*/      bx lr

/*0x39ee*/  .byte 0x00
/*0x39ef*/  .byte 0x00

            data_39f0:
/*0x39f0*/  .word 0x20000004


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
/*0x3a08*/      b.w jump_6c58
            jump_3a0c:
/*0x3a0c*/      bx lr

/*0x3a0e*/  .byte 0x00
/*0x3a0f*/  .byte 0x00

            data_3a10:
/*0x3a10*/  .word 0x20000648
            data_3a14:
/*0x3a14*/  .word 0x20000004

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
/*0x3a3c*/      subs r4, r4, #1
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
/*0x3a52*/      subs r5, r5, #3
            jump_3a54:
/*0x3a54*/      subs r4, r4, #1
/*0x3a56*/      uxtb r4, r4
/*0x3a58*/      bhs jump_3a4a
/*0x3a5a*/      pop {r4, r5, r6, pc}

            data_3a5c:
/*0x3a5c*/  .word data_7baa
            data_3a60:
/*0x3a60*/  .word 0x20000730
            data_3a64:
/*0x3a64*/  .word 0x200009b7


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
/*0x3a7c*/  .word 0x20000730


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
/*0x3a9c*/  .word 0x20000648
            data_3aa0:
/*0x3aa0*/  .word 0x20000004
            data_3aa4:
/*0x3aa4*/  .word data_7a92


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
/*0x3aca*/      bl mem_zero /* (dest, size) */
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
/*0x3aec*/      subs r0, r0, #1
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
/*0x3b08*/  .word 0x20000648
            data_3b0c:
/*0x3b0c*/  .word data_7a95
            data_3b10:
/*0x3b10*/  .word 0x200003be
            data_3b14:
/*0x3b14*/  .word data_7a38
            data_3b18:
/*0x3b18*/  .word 0x200001c0
            data_3b1c:
/*0x3b1c*/  .word 0x20000730
            data_3b20:
/*0x3b20*/  .word 0x00007a2a /* possible pointer */


            .thumb_func
            call_3b24:
/*0x3b24*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3b28*/      bl call_6cc4
/*0x3b2c*/      ldr r4, [pc, #0x9c] /* data_3bcc */
/*0x3b2e*/      ldr r5, [pc, #0xa0] /* data_3bd0 */
/*0x3b30*/      ldrb r0, [r4, #7]
/*0x3b32*/      cbz r0, jump_3b7c
/*0x3b34*/      ldrb r0, [r4, #6]
/*0x3b36*/      cbnz r0, jump_3b3e
/*0x3b38*/      bl call_53a8
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
/*0x3b70*/      subs r0, r0, #1
/*0x3b72*/      uxtb r0, r0
/*0x3b74*/      bhs jump_3b5c
            jump_3b76:
/*0x3b76*/      subs r1, r1, #1
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
/*0x3bcc*/  .word 0x20000648
            data_3bd0:
/*0x3bd0*/  .word 0x2000032e
            data_3bd4:
/*0x3bd4*/  .word 0x20000004
            data_3bd8:
/*0x3bd8*/  .word 0x2000008c
            data_3bdc:
/*0x3bdc*/  .word 0x200001c0
            data_3be0:
/*0x3be0*/  .word 0x20000730
            data_3be4:
/*0x3be4*/  .word 0x2000001c
            data_3be8:
/*0x3be8*/  .word 0x2000005c


            .thumb_func
            call_3bec:
/*0x3bec*/      ldr r0, [pc, #4] /* data_3bf4 */
/*0x3bee*/      ldrb r0, [r0, #2]
/*0x3bf0*/      b.w jump_3f84

            data_3bf4:
/*0x3bf4*/  .word 0x2000005c

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
/*0x3c3c*/      b.w mem_set /* (dest, size, val) */
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
/*0x3c68*/      subs r4, r4, #1
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
/*0x3c8e*/      bl mem_zero /* (dest, size) */
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
/*0x3cf8*/  .word 0x20000648
            data_3cfc:
/*0x3cfc*/  .word 0x2000008c
            data_3d00:
/*0x3d00*/  .word 0x2000032e
            data_3d04:
/*0x3d04*/  .word data_7ad3
            data_3d08:
/*0x3d08*/  .word 0x200001c0
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
/*0x3d2c*/      adds r1, r1, #3
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
/*0x3d60*/  .word 0x200019d0
            data_3d64:
/*0x3d64*/  .word data_7a95
            data_3d68:
/*0x3d68*/  .word 0x2000000c
            data_3d6c:
/*0x3d6c*/  .word 0x2000005c
            data_3d70:
/*0x3d70*/  .word 0x2000032e


            .thumb_func
            call_3d74:
/*0x3d74*/      push {r4, lr}
/*0x3d76*/      bl call_5b80
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
/*0x3dba*/      b.w jump_6c78
            jump_3dbe:
/*0x3dbe*/      bl call_4374
/*0x3dc2*/      ldr r1, [pc, #0x14] /* data_3dd8 */
/*0x3dc4*/      and r0, r4, #3
/*0x3dc8*/      add.w r0, r1, r0, lsl #10
/*0x3dcc*/      ldr r1, [pc, #4] /* data_3dd4 */
/*0x3dce*/      subs r1, r1, #4
/*0x3dd0*/      str r0, [r1]
            jump_3dd2:
/*0x3dd2*/      pop {r4, pc}

            data_3dd4:
/*0x3dd4*/  .word 0x2000005c
            data_3dd8:
/*0x3dd8*/  .word 0x200009ca


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
/*0x3e1c*/  .word 0x2000005c


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
/*0x3e76*/      cmp r0, #9
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
/*0x3e98*/  .word 0x2000005c
            data_3e9c:
/*0x3e9c*/  .word 0x20000730


            .thumb_func
            call_3ea0:
/*0x3ea0*/      ldr r1, [pc, #0x28] /* data_3ecc */
/*0x3ea2*/      push {r4, lr}
/*0x3ea4*/      movs r0, #9
/*0x3ea6*/      strh r0, [r1]
/*0x3ea8*/      ldr r0, [pc, #0x20] /* data_3ecc */
/*0x3eaa*/      movs r2, #0xff
/*0x3eac*/      movs r1, #0xc0
/*0x3eae*/      adds r0, #0x28
/*0x3eb0*/      bl mem_set /* (dest, size, val) */
/*0x3eb4*/      ldr r0, [pc, #0x14] /* data_3ecc */
/*0x3eb6*/      movs r2, #0xff
/*0x3eb8*/      movs r1, #0xc8
/*0x3eba*/      adds r0, #0xea
/*0x3ebc*/      bl mem_set /* (dest, size, val) */
/*0x3ec0*/      bl call_3f1c
/*0x3ec4*/      pop.w {r4, lr}
/*0x3ec8*/      b.w call_3bec

            data_3ecc:
/*0x3ecc*/  .word 0x20000730


            .thumb_func
            call_3ed0:
/*0x3ed0*/      push {r4, lr}
/*0x3ed2*/      ldr r4, [pc, #0x2c] /* data_3f00 */
/*0x3ed4*/      movs r0, #0
/*0x3ed6*/      strb r0, [r4, #2]
/*0x3ed8*/      bl call_3ea0
            jump_3edc:
/*0x3edc*/      ldrb r0, [r4, #2]
/*0x3ede*/      adds r0, r0, #1
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
/*0x3f00*/  .word 0x2000005c


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
/*0x3f18*/  .word 0x2000005c


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
/*0x3f3c*/      subs r0, r0, #1
/*0x3f3e*/      uxtb r0, r0
/*0x3f40*/      bhs jump_3f34
            jump_3f42:
/*0x3f42*/      subs r2, r2, #1
/*0x3f44*/      uxtb r2, r2
/*0x3f46*/      bhs jump_3f2e
/*0x3f48*/      movs r0, #0
/*0x3f4a*/      bl call_60bc
/*0x3f4e*/      ldr r0, [pc, #0x24] /* data_3f74 */
/*0x3f50*/      ldr r1, [pc, #0x28] /* data_3f7c */
/*0x3f52*/      adds r0, #0x80
/*0x3f54*/      ldrh r1, [r1]
/*0x3f56*/      strh.w r1, [r0, #0x68]
/*0x3f5a*/      movs r0, #3
/*0x3f5c*/      strb r0, [r5, #0x11]
/*0x3f5e*/      movs r1, #0xd8
/*0x3f60*/      ldr r0, [pc, #0x1c] /* data_3f80 */
/*0x3f62*/      bl mem_zero /* (dest, size) */
/*0x3f66*/      pop.w {r4, r5, r6, lr}
/*0x3f6a*/      ldr r0, [pc, #0x14] /* data_3f80 */
/*0x3f6c*/      movs r1, #0xf
/*0x3f6e*/      adds r0, #0xd8
/*0x3f70*/      b.w mem_zero /* (dest, size) */

            data_3f74:
/*0x3f74*/  .word 0x20000730
            data_3f78:
/*0x3f78*/  .word data_8104
            data_3f7c:
/*0x3f7c*/  .word data_7a2c
            data_3f80:
/*0x3f80*/  .word 0x200008e2

            jump_3f84:
/*0x3f84*/      lsls r1, r0, #0xc
/*0x3f86*/      movw r2, #0x29a
/*0x3f8a*/      ldr r0, [pc, #8] /* data_3f94 */
/*0x3f8c*/      add.w r1, r1, #0x1000
/*0x3f90*/      b.w jump_6c78

            data_3f94:
/*0x3f94*/  .word 0x20000730


            .thumb_func
            call_3f98:
/*0x3f98*/      movs r2, #4
/*0x3f9a*/      movs r1, #0
/*0x3f9c*/      ldr r0, [pc, #4] /* data_3fa4 */
/*0x3f9e*/      b.w jump_6c78

/*0x3fa2*/  .byte 0x00
/*0x3fa3*/  .byte 0x00

            data_3fa4:
/*0x3fa4*/  .word 0x2000005c


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
/*0x3fdc*/      subs r4, r4, #1
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
/*0x4078*/      subs r2, r2, #1
/*0x407a*/      uxtb r2, r2
/*0x407c*/      bhs jump_4070
/*0x407e*/      subs r1, #0xd7
            jump_4080:
/*0x4080*/      subs r3, r3, #1
/*0x4082*/      uxtb r3, r3
/*0x4084*/      bhs jump_406c
/*0x4086*/      pop {r4, pc}

            data_4088:
/*0x4088*/  .word 0x2000032e


            .thumb_func
            call_408c:
/*0x408c*/      cmp r0, #0xff
/*0x408e*/      beq jump_40a6
/*0x4090*/      ldr r2, [pc, #0x14] /* data_40a8 */
/*0x4092*/      add r2, r0
/*0x4094*/      movs r0, #0
            jump_4096:
/*0x4096*/      adds r0, r0, #1
/*0x4098*/      ldrb r3, [r1], #1
/*0x409c*/      uxtb r0, r0
/*0x409e*/      strb r3, [r2], #0x48
/*0x40a2*/      cmp r0, #3
/*0x40a4*/      blo jump_4096
            jump_40a6:
/*0x40a6*/      bx lr

            data_40a8:
/*0x40a8*/  .word 0x2000032e


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
/*0x40bc*/      bl mem_set /* (dest, size, val) */
/*0x40c0*/      adds r5, r5, #1
/*0x40c2*/      adds r6, #0x48
            jump_40c4:
/*0x40c4*/      subs r4, r4, #1
/*0x40c6*/      uxtb r4, r4
/*0x40c8*/      bhs jump_40b6
/*0x40ca*/      pop {r4, r5, r6, pc}

            data_40cc:
/*0x40cc*/  .word 0x2000032e


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
/*0x40e0*/      subs r2, r2, #1
/*0x40e2*/      uxtb r2, r2
/*0x40e4*/      bhs jump_40dc
            jump_40e6:
/*0x40e6*/      bx lr

            data_40e8:
/*0x40e8*/  .word 0x2000032e


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
/*0x412e*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
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
/*0x4158*/      bl call_64f8
/*0x415c*/      movs r1, #1
/*0x415e*/      mov r0, r4
/*0x4160*/      bl call_6542
/*0x4164*/      ldr r0, [pc, #0x20] /* data_4188 */
/*0x4166*/      str r5, [r0, #0x24]
/*0x4168*/      movs r1, #1
/*0x416a*/      mov r0, r4
/*0x416c*/      bl call_64e4
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
/*0x4180*/  .word 0x20000018
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
/*0x41aa*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
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
/*0x41e4*/  .word 0x20000018
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
/*0x4212*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x4216*/      movs r2, #0
/*0x4218*/      movs r1, #8
/*0x421a*/      movs r0, #1
/*0x421c*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x4220*/      pop.w {r4, r5, r6, lr}
/*0x4224*/      movs r2, #0
/*0x4226*/      movs r1, #9
/*0x4228*/      movs r0, #1
/*0x422a*/      b.w afio_pin_config /* (gpio_num, pin_num, af_num) */

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
/*0x4254*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x4258*/      movs r2, #5
/*0x425a*/      movs r1, #8
/*0x425c*/      movs r0, #1
/*0x425e*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
/*0x4262*/      movs r2, #5
/*0x4264*/      movs r1, #9
/*0x4266*/      movs r0, #1
/*0x4268*/      bl afio_pin_config /* (gpio_num, pin_num, af_num) */
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
/*0x4334*/      bl spin_wait /* (time) */
/*0x4338*/      bl call_418c
/*0x433c*/      cbz r0, jump_4346
            jump_433e:
/*0x433e*/      mov r0, r4
/*0x4340*/      subs r4, r4, #1
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
/*0x436a*/      bl spin_wait /* (time) */
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
/*0x43d4*/      adds r5, r5, #1
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
/*0x43f6*/      adds r4, r4, #1
/*0x43f8*/      cbz r1, jump_43fc
/*0x43fa*/      strb r5, [r1, r3]
            jump_43fc:
/*0x43fc*/      adds r3, r3, #1
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
/*0x4418*/      adds r3, r3, #1
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
/*0x4436*/      bl spin_wait /* (time) */
/*0x443a*/      bl call_418c
/*0x443e*/      cbz r0, jump_4448
            jump_4440:
/*0x4440*/      mov r0, r4
/*0x4442*/      subs r4, r4, #1
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
/*0x446a*/      bl spin_wait /* (time) */
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
/*0x44be*/      adds r4, r4, #1
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
/*0x451e*/      bl spin_wait /* (time) */
/*0x4522*/      bl call_418c
/*0x4526*/      cbz r0, jump_4530
            jump_4528:
/*0x4528*/      mov r0, r4
/*0x452a*/      subs r4, r4, #1
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
/*0x4670*/  .word 0x20000648
            data_4674:
/*0x4674*/  .word 0x200019d0


            .thumb_func
            call_4678:
/*0x4678*/      push {r4, lr}
/*0x467a*/      cbz r0, jump_46a2
/*0x467c*/      bl call_4aac
/*0x4680*/      cmp r0, #0
/*0x4682*/      beq jump_46b8
/*0x4684*/      movs r1, #0xa
/*0x4686*/      ldr r0, [pc, #0x34] /* data_46bc */
/*0x4688*/      bl mem_zero /* (dest, size) */
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
/*0x46a2*/      bl call_65f4
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
/*0x46bc*/  .word 0x20000654
            data_46c0:
/*0x46c0*/  .word 0x20000030
            data_46c4:
/*0x46c4*/  .word 0x20000034
            data_46c8:
/*0x46c8*/  .word 0x20000037
            data_46cc:
/*0x46cc*/  .word 0x20000035
            data_46d0:
/*0x46d0*/  .word 0x20000036


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
/*0x46e4*/      subs r1, r1, #1
/*0x46e6*/      uxth r1, r1
/*0x46e8*/      bhs jump_46da
/*0x46ea*/      movs r0, #0
/*0x46ec*/      bx lr

/*0x46ee*/  .byte 0x00
/*0x46ef*/  .byte 0x00

            data_46f0:
/*0x46f0*/  .word 0x2000065e


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
/*0x4724*/  .word 0x2000065e

            jump_4728:
/*0x4728*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x472c*/      mov r5, r1
/*0x472e*/      mov r4, r0
/*0x4730*/      movs r1, #0x50
/*0x4732*/      ldr r0, [pc, #0x48] /* data_477c */
/*0x4734*/      bl mem_zero /* (dest, size) */
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
/*0x476e*/      adds r4, r4, #3
            jump_4770:
/*0x4770*/      subs r5, r5, #1
/*0x4772*/      uxtb r5, r5
/*0x4774*/      bhs jump_474e
/*0x4776*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x477a*/  .byte 0x00
/*0x477b*/  .byte 0x00

            data_477c:
/*0x477c*/  .word 0x2000065e


            .thumb_func
            call_4780:
/*0x4780*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4784*/      lsrs r1, r0, #8
/*0x4786*/      lsls r1, r1, #0x1f
/*0x4788*/      beq jump_4790
/*0x478a*/      bl call_4e78
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
/*0x480a*/      adds r1, r1, #1
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
/*0x4826*/      adds r1, r1, #1
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
/*0x4858*/  .word 0x2000003d
            data_485c:
/*0x485c*/  .word 0x20000035
            data_4860:
/*0x4860*/  .word 0x20000049
            data_4864:
/*0x4864*/  .word 0x20000036
            data_4868:
/*0x4868*/  .word 0x20000034
            data_486c:
/*0x486c*/  .word 0x20000050
            data_4870:
/*0x4870*/  .word 0x200006d4
            data_4874:
/*0x4874*/  .word 0x20000037


            .thumb_func
            call_4878:
/*0x4878*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x487c*/      ldr r4, [pc, #0x180] /* data_4a00 */
/*0x487e*/      ldr r2, [pc, #0x184] /* data_4a04 */
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
/*0x48ee*/      ldr r6, [pc, #0x118] /* data_4a08 */
/*0x48f0*/      cbz r1, jump_4924
/*0x48f2*/      ldrb r2, [r4, #1]
/*0x48f4*/      lsls.w ip, r2, #0x19
/*0x48f8*/      bpl jump_4938
/*0x48fa*/      ldrb.w ip, [r6, r5]
/*0x48fe*/      orr.w ip, ip, r7
/*0x4902*/      strb.w ip, [r6, r5]
/*0x4906*/      b jump_4930
            jump_4908:
/*0x4908*/      ldr r5, [pc, #0x100] /* data_4a0c */
/*0x490a*/      strb r2, [r4, #1]
/*0x490c*/      sub.w r6, r3, #0xc0
/*0x4910*/      movs r7, #0
/*0x4912*/      ldrb r2, [r5, #2]
/*0x4914*/      cmp r6, #3
/*0x4916*/      bhi jump_493e
/*0x4918*/      cbz r2, jump_491c
/*0x491a*/      strb r7, [r5, #2]
            jump_491c:
/*0x491c*/      uxtb r0, r6
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
/*0x4942*/      strb r7, [r5, #2]
/*0x4944*/      mov r1, sp
/*0x4946*/      bl call_5bb8
/*0x494a*/      ldrb r0, [r5, #6]
/*0x494c*/      cmp r0, #0
/*0x494e*/      mov r0, sp
/*0x4950*/      beq jump_4958
/*0x4952*/      bl call_39dc
/*0x4956*/      b jump_4994
            jump_4958:
/*0x4958*/      bl call_5194
/*0x495c*/      b jump_4994
            jump_495e:
/*0x495e*/      cbz r3, jump_4994
/*0x4960*/      ldr r0, [r4]
/*0x4962*/      bl call_54f0
/*0x4966*/      bl call_4f58
/*0x496a*/      cbz r0, jump_497e
/*0x496c*/      ldrb r0, [r4]
/*0x496e*/      cbz r0, jump_4994
            jump_4970:
/*0x4970*/      bl call_5124
/*0x4974*/      ldr r0, [r4]
/*0x4976*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x497a*/      b.w call_4780
            jump_497e:
/*0x497e*/      ldrb r0, [r5, #6]
/*0x4980*/      cbz r0, jump_4988
/*0x4982*/      bl call_3914
/*0x4986*/      b jump_4994
            jump_4988:
/*0x4988*/      ldrb r0, [r4]
/*0x498a*/      cmp r0, #0xe8
/*0x498c*/      beq jump_4994
/*0x498e*/      bl call_58dc
/*0x4992*/      cbz r0, jump_499a
            jump_4994:
/*0x4994*/      movs r0, #1
/*0x4996*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_499a:
/*0x499a*/      ldrb r1, [r4, #1]
/*0x499c*/      lsls r0, r1, #0x1f
/*0x499e*/      ldrb r0, [r4, #3]
/*0x49a0*/      lsl.w r0, r0, #0x1f
/*0x49a4*/      beq jump_49ea
/*0x49a6*/      cmp r0, #0
/*0x49a8*/      bne jump_4970
/*0x49aa*/      ldr r2, [pc, #0x5c] /* data_4a08 */
/*0x49ac*/      ldrb r0, [r4, #2]
/*0x49ae*/      adds r2, #0xa
/*0x49b0*/      ldrb r2, [r2, r0]
/*0x49b2*/      cbz r2, jump_49da
/*0x49b4*/      ldr r5, [pc, #0x50] /* data_4a08 */
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
/*0x49da*/      bl call_58a8
/*0x49de*/      cbnz r0, jump_49f6
/*0x49e0*/      ldrb r0, [r4, #1]
/*0x49e2*/      bic r0, r0, #1
/*0x49e6*/      strb r0, [r4, #1]
/*0x49e8*/      b jump_4970
            jump_49ea:
/*0x49ea*/      cmp r0, #0
/*0x49ec*/      bne jump_4970
/*0x49ee*/      bl call_58a8
/*0x49f2*/      cmp r0, #0
/*0x49f4*/      beq jump_4970
            jump_49f6:
/*0x49f6*/      ldrb r0, [r4, #3]
/*0x49f8*/      orr r0, r0, #1
/*0x49fc*/      strb r0, [r4, #3]
/*0x49fe*/      b jump_4970

            data_4a00:
/*0x4a00*/  .word 0x20000030
            data_4a04:
/*0x4a04*/  .word 0x200002c0
            data_4a08:
/*0x4a08*/  .word 0x20000654
            data_4a0c:
/*0x4a0c*/  .word 0x20000648


            .thumb_func
            call_4a10:
/*0x4a10*/      ldrh r2, [r1]
/*0x4a12*/      bfi r2, r0, #0, #9
/*0x4a16*/      strh r2, [r1]
/*0x4a18*/      bx lr

            .thumb_func
            call_4a1a:
/*0x4a1a*/      ubfx r0, r0, #0, #9
/*0x4a1e*/      bx lr

            .thumb_func
            call_4a20:
/*0x4a20*/      push {r4, r5, r6, r7, lr}
/*0x4a22*/      movs r5, #0
/*0x4a24*/      b jump_4a46
            jump_4a26:
/*0x4a26*/      movs r4, #0
/*0x4a28*/      b jump_4a36
            jump_4a2a:
/*0x4a2a*/      ldrb r6, [r0, r5]
/*0x4a2c*/      ldrb r7, [r1, r4]
/*0x4a2e*/      cmp r6, r7
/*0x4a30*/      beq jump_4a3a
/*0x4a32*/      adds r4, r4, #1
/*0x4a34*/      uxtb r4, r4
            jump_4a36:
/*0x4a36*/      cmp r4, r3
/*0x4a38*/      blo jump_4a2a
            jump_4a3a:
/*0x4a3a*/      cmp r4, r3
/*0x4a3c*/      bne jump_4a42
/*0x4a3e*/      movs r0, #0
/*0x4a40*/      pop {r4, r5, r6, r7, pc}
            jump_4a42:
/*0x4a42*/      adds r5, r5, #1
/*0x4a44*/      uxtb r5, r5
            jump_4a46:
/*0x4a46*/      cmp r5, r2
/*0x4a48*/      blo jump_4a26
/*0x4a4a*/      movs r0, #1
/*0x4a4c*/      pop {r4, r5, r6, r7, pc}

/*0x4a4e*/  .byte 0x00
/*0x4a4f*/  .byte 0x00


            .thumb_func
            call_4a50:
/*0x4a50*/      push {r4, r5, r6, r7, lr}
/*0x4a52*/      movs r3, #0xa
/*0x4a54*/      movs r5, #0
/*0x4a56*/      b jump_4a96
            jump_4a58:
/*0x4a58*/      ldr r2, [pc, #0x48] /* data_4aa4 */
/*0x4a5a*/      cmp r3, #9
/*0x4a5c*/      ldrb r4, [r2, r3]
/*0x4a5e*/      bne jump_4a64
/*0x4a60*/      orr r4, r4, #0xf
            jump_4a64:
/*0x4a64*/      cmp r4, #0xff
/*0x4a66*/      beq jump_4a96
/*0x4a68*/      ldr r6, [pc, #0x3c] /* data_4aa8 */
/*0x4a6a*/      movs r2, #8
/*0x4a6c*/      mov.w ip, #1
/*0x4a70*/      add.w r7, r6, r3, lsl #3
/*0x4a74*/      b jump_4a90
            jump_4a76:
/*0x4a76*/      lsl.w r6, ip, r2
/*0x4a7a*/      uxtb r6, r6
/*0x4a7c*/      tst r4, r6
/*0x4a7e*/      bne jump_4a90
/*0x4a80*/      cbz r1, jump_4aa0
/*0x4a82*/      subs r1, r1, #1
/*0x4a84*/      ldrb r6, [r7, r2]
/*0x4a86*/      adds r5, r5, #1
/*0x4a88*/      strb r6, [r0], #1
/*0x4a8c*/      uxtb r1, r1
/*0x4a8e*/      uxtb r5, r5
            jump_4a90:
/*0x4a90*/      subs r2, r2, #1
/*0x4a92*/      uxtb r2, r2
/*0x4a94*/      bhs jump_4a76
            jump_4a96:
/*0x4a96*/      subs r3, r3, #1
/*0x4a98*/      uxtb r3, r3
/*0x4a9a*/      bhs jump_4a58
/*0x4a9c*/      mov r0, r5
/*0x4a9e*/      pop {r4, r5, r6, r7, pc}
            jump_4aa0:
/*0x4aa0*/      movs r0, #0xff
/*0x4aa2*/      pop {r4, r5, r6, r7, pc}

            data_4aa4:
/*0x4aa4*/  .word 0x200001ac
            data_4aa8:
/*0x4aa8*/  .word 0x200002c0


            .thumb_func
            call_4aac:
/*0x4aac*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x4aae*/      bl call_608c
/*0x4ab2*/      cmp r0, #0
/*0x4ab4*/      beq jump_4afe
/*0x4ab6*/      ldr r0, [pc, #0x54] /* data_4b0c */
/*0x4ab8*/      mov r5, sp
/*0x4aba*/      ldr r6, [pc, #0x54] /* data_4b10 */
/*0x4abc*/      ldr r1, [r0]
/*0x4abe*/      str r1, [sp]
/*0x4ac0*/      ldr r1, [r0, #4]
/*0x4ac2*/      str r1, [sp, #4]
/*0x4ac4*/      ldrh r0, [r0, #8]
/*0x4ac6*/      strh.w r0, [sp, #8]
/*0x4aca*/      movs r0, #5
/*0x4acc*/      ldr r7, [pc, #0x44] /* data_4b14 */
/*0x4ace*/      movs r3, #1
/*0x4ad0*/      b jump_4aec
            jump_4ad2:
/*0x4ad2*/      ldrb r1, [r6, r0]
/*0x4ad4*/      ldrb r1, [r7, r1]
/*0x4ad6*/      cmp r1, #0xff
/*0x4ad8*/      beq jump_4aec
/*0x4ada*/      add.w r2, r5, r1, lsr #3
/*0x4ade*/      and r1, r1, #7
/*0x4ae2*/      ldrb r4, [r2]
/*0x4ae4*/      lsl.w r1, r3, r1
/*0x4ae8*/      orrs r4, r1
/*0x4aea*/      strb r4, [r2]
            jump_4aec:
/*0x4aec*/      subs r0, r0, #1
/*0x4aee*/      uxtb r0, r0
/*0x4af0*/      bhs jump_4ad2
/*0x4af2*/      movs r0, #0xa
/*0x4af4*/      b jump_4b00
            jump_4af6:
/*0x4af6*/      ldrb r1, [r5, r0]
/*0x4af8*/      cmp r1, #0xff
/*0x4afa*/      beq jump_4b00
/*0x4afc*/      movs r0, #0
            jump_4afe:
/*0x4afe*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}
            jump_4b00:
/*0x4b00*/      subs r0, r0, #1
/*0x4b02*/      uxtb r0, r0
/*0x4b04*/      bhs jump_4af6
/*0x4b06*/      movs r0, #1
/*0x4b08*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x4b0a*/  .byte 0x00
/*0x4b0b*/  .byte 0x00

            data_4b0c:
/*0x4b0c*/  .word 0x200001ac
            data_4b10:
/*0x4b10*/  .word data_7f54
            data_4b14:
/*0x4b14*/  .word 0x200001c0


            .thumb_func
            call_4b18:
/*0x4b18*/      ldr r0, [pc, #0xc] /* data_4b28 */
/*0x4b1a*/      ldr r1, [pc, #0x10] /* data_4b2c */
/*0x4b1c*/      ldrb r0, [r0, #1]
/*0x4b1e*/      and r0, r0, #3
/*0x4b22*/      ldrb r0, [r1, r0]
/*0x4b24*/      b.w call_60bc

            data_4b28:
/*0x4b28*/  .word 0x20000000
            data_4b2c:
/*0x4b2c*/  .word data_7a34


            .thumb_func
            call_4b30:
/*0x4b30*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4b34*/      ldr r5, [pc, #0x8c] /* data_4bc4 */
/*0x4b36*/      ldrh r1, [r5]
/*0x4b38*/      movw sl, #0xffff
/*0x4b3c*/      cmp r1, sl
/*0x4b3e*/      beq jump_4bc0
/*0x4b40*/      movs r1, #2
/*0x4b42*/      add r0, sp, #4
/*0x4b44*/      bl call_4a50
/*0x4b48*/      movs r6, #0
/*0x4b4a*/      ldr r4, [pc, #0x7c] /* data_4bc8 */
/*0x4b4c*/      movw r7, #0x2710
/*0x4b50*/      cmp r0, #2
/*0x4b52*/      bne jump_4bb4
/*0x4b54*/      ldr.w sb, [pc, #0x74] /* data_4bcc */
/*0x4b58*/      movs r3, #2
/*0x4b5a*/      mov r2, r3
/*0x4b5c*/      ldrb.w r1, [sb, #0x44]
/*0x4b60*/      strb.w r1, [sp]
/*0x4b64*/      ldrb.w r0, [sb, #0xc]
/*0x4b68*/      strb.w r0, [sp, #1]
/*0x4b6c*/      mov r1, sp
/*0x4b6e*/      add r0, sp, #4
/*0x4b70*/      bl call_4a20
/*0x4b74*/      mov.w r8, #1
/*0x4b78*/      cbz r0, jump_4b8c
/*0x4b7a*/      ldrh r0, [r5]
/*0x4b7c*/      cmp r0, r7
/*0x4b7e*/      bls jump_4b86
/*0x4b80*/      strb.w r8, [r4, #3]
/*0x4b84*/      b jump_4bb4
            jump_4b86:
/*0x4b86*/      strb.w r8, [r4, #9]
/*0x4b8a*/      b jump_4bb6
            jump_4b8c:
/*0x4b8c*/      ldrb.w r1, [sb, #0x22]
/*0x4b90*/      strb.w r1, [sp]
/*0x4b94*/      ldrb.w r0, [sb, #0x43]
/*0x4b98*/      strb.w r0, [sp, #1]
/*0x4b9c*/      movs r3, #2
/*0x4b9e*/      mov r2, r3
/*0x4ba0*/      mov r1, sp
/*0x4ba2*/      add r0, sp, #4
/*0x4ba4*/      bl call_4a20
/*0x4ba8*/      cbz r0, jump_4bb4
/*0x4baa*/      ldrh r0, [r5]
/*0x4bac*/      cmp r0, r7
/*0x4bae*/      bls jump_4b86
/*0x4bb0*/      movs r0, #2
/*0x4bb2*/      strb r0, [r4, #3]
            jump_4bb4:
/*0x4bb4*/      strb r6, [r4, #9]
            jump_4bb6:
/*0x4bb6*/      ldrh r0, [r5]
/*0x4bb8*/      cmp r0, r7
/*0x4bba*/      bls jump_4bc0
/*0x4bbc*/      strh.w sl, [r5]
            jump_4bc0:
/*0x4bc0*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, pc}

            data_4bc4:
/*0x4bc4*/  .word 0x2000001c
            data_4bc8:
/*0x4bc8*/  .word 0x20000648
            data_4bcc:
/*0x4bcc*/  .word 0x200002c0


            .thumb_func
            call_4bd0:
/*0x4bd0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4bd4*/      ldr r0, [pc, #0x240] /* data_4e18 */
/*0x4bd6*/      ldr.w ip, [pc, #0x244] /* data_4e1c */
/*0x4bda*/      movs r5, #0
/*0x4bdc*/      ldrb r2, [r0, #0xb]
/*0x4bde*/      ldrb.w r1, [ip, #4]
/*0x4be2*/      cbz r2, jump_4c1c
/*0x4be4*/      ldrb.w r0, [ip, #6]
/*0x4be8*/      adds r0, r0, #1
/*0x4bea*/      uxtb r0, r0
/*0x4bec*/      strb.w r0, [ip, #6]
/*0x4bf0*/      cmp r0, #3
/*0x4bf2*/      bls jump_4ca8
/*0x4bf4*/      mov r0, ip
/*0x4bf6*/      strb.w r5, [ip, #6]
/*0x4bfa*/      ldrb r0, [r0, #4]
/*0x4bfc*/      adds r0, r0, #1
/*0x4bfe*/      cmp r2, #6
/*0x4c00*/      beq jump_4c08
/*0x4c02*/      cmp r2, #7
            jump_4c04:
/*0x4c04*/      bne jump_4ca8
/*0x4c06*/      b jump_4c10
            jump_4c08:
/*0x4c08*/      strb.w r1, [ip, #5]
/*0x4c0c*/      movs r1, #0x3d
/*0x4c0e*/      b jump_4c12
            jump_4c10:
/*0x4c10*/      movs r1, #0x18
            jump_4c12:
/*0x4c12*/      udiv r2, r0, r1
/*0x4c16*/      mls r0, r1, r2, r0
/*0x4c1a*/      b jump_4cac
            jump_4c1c:
/*0x4c1c*/      ldr r0, [pc, #0x200] /* data_4e20 */
/*0x4c1e*/      ldr r3, [pc, #0x1fc] /* data_4e1c */
/*0x4c20*/      ldr r2, [pc, #0x200] /* data_4e24 */
/*0x4c22*/      ldrb r0, [r0, #3]
/*0x4c24*/      add.w r6, r3, #0xdb
/*0x4c28*/      ldr r3, [r3]
/*0x4c2a*/      add.w r4, r2, #0xe
/*0x4c2e*/      mov.w sb, #1
/*0x4c32*/      cmp r0, #3
/*0x4c34*/      bhi jump_4cf2
/*0x4c36*/      ldrb r2, [r2, r0]
/*0x4c38*/      cmp r0, #1
/*0x4c3a*/      add.w r2, r2, r2, lsl #1
/*0x4c3e*/      add.w r2, r4, r2, lsl #1
/*0x4c42*/      ldrb r4, [r3, #4]
/*0x4c44*/      and r4, r4, #0xf
/*0x4c48*/      ldrb r4, [r2, r4]
/*0x4c4a*/      beq jump_4c56
/*0x4c4c*/      cmp r0, #2
/*0x4c4e*/      beq jump_4caa
/*0x4c50*/      cmp r0, #3
/*0x4c52*/      bne jump_4c04
/*0x4c54*/      b jump_4cb2
            jump_4c56:
/*0x4c56*/      movs r1, #3
/*0x4c58*/      add.w r0, ip, #7
/*0x4c5c*/      adds r3, r3, #3
/*0x4c5e*/      b jump_4ca2
            jump_4c60:
/*0x4c60*/      lsl.w r2, sb, r1
/*0x4c64*/      ldrb.w r6, [ip, #7]
/*0x4c68*/      uxtb r2, r2
/*0x4c6a*/      subs r3, r3, #1
/*0x4c6c*/      tst r6, r2
/*0x4c6e*/      ldrb r6, [r0, #-0x1]!
/*0x4c72*/      beq jump_4c86
/*0x4c74*/      cmp r6, r4
/*0x4c76*/      bhi jump_4c82
/*0x4c78*/      strb r5, [r0]
/*0x4c7a*/      ldrb.w r6, [ip, #7]
/*0x4c7e*/      bics r6, r2
/*0x4c80*/      b jump_4c98
            jump_4c82:
/*0x4c82*/      subs r2, r6, r4
/*0x4c84*/      b jump_4ca0
            jump_4c86:
/*0x4c86*/      ldrb r7, [r3]
/*0x4c88*/      sub.w r8, r7, r4
/*0x4c8c*/      cmp r6, r8
/*0x4c8e*/      blt jump_4c9e
/*0x4c90*/      strb r7, [r0]
/*0x4c92*/      ldrb.w r6, [ip, #7]
/*0x4c96*/      orrs r6, r2
            jump_4c98:
/*0x4c98*/      strb.w r6, [ip, #7]
/*0x4c9c*/      b jump_4ca2
            jump_4c9e:
/*0x4c9e*/      adds r2, r6, r4
            jump_4ca0:
/*0x4ca0*/      strb r2, [r0]
            jump_4ca2:
/*0x4ca2*/      subs r1, r1, #1
/*0x4ca4*/      uxtb r1, r1
/*0x4ca6*/      bhs jump_4c60
            jump_4ca8:
/*0x4ca8*/      b jump_4e10
            jump_4caa:
/*0x4caa*/      adds r0, r1, r4
            jump_4cac:
/*0x4cac*/      strb.w r0, [ip, #4]
/*0x4cb0*/      b jump_4e10
            jump_4cb2:
/*0x4cb2*/      movs r7, #0x48
/*0x4cb4*/      b jump_4cea
            jump_4cb6:
/*0x4cb6*/      bl rand
/*0x4cba*/      sdiv r1, r0, r4
/*0x4cbe*/      mls r0, r4, r1, r0
/*0x4cc2*/      cbz r0, jump_4cc8
/*0x4cc4*/      movs r0, #3
/*0x4cc6*/      b jump_4ce4
            jump_4cc8:
/*0x4cc8*/      subs r0, r6, #2
/*0x4cca*/      movs r1, #0
/*0x4ccc*/      bl call_6e98
/*0x4cd0*/      subs r6, r6, #3
/*0x4cd2*/      b jump_4cea
            jump_4cd4:
/*0x4cd4*/      ldrb r1, [r6]
/*0x4cd6*/      cmp r1, #2
/*0x4cd8*/      bhi jump_4cde
/*0x4cda*/      strb r5, [r6]
/*0x4cdc*/      b jump_4ce2
            jump_4cde:
/*0x4cde*/      subs r1, r1, #2
/*0x4ce0*/      strb r1, [r6]
            jump_4ce2:
/*0x4ce2*/      subs r6, r6, #1
            jump_4ce4:
/*0x4ce4*/      subs r0, r0, #1
/*0x4ce6*/      uxtb r0, r0
/*0x4ce8*/      bhs jump_4cd4
            jump_4cea:
/*0x4cea*/      subs r7, r7, #1
/*0x4cec*/      uxtb r7, r7
/*0x4cee*/      bhs jump_4cb6
/*0x4cf0*/      b jump_4e10
            jump_4cf2:
/*0x4cf2*/      cmp r0, #7
/*0x4cf4*/      bls jump_4d6e
/*0x4cf6*/      ldrb r1, [r2, r0]
/*0x4cf8*/      ldrb r2, [r3, #4]
/*0x4cfa*/      add.w r1, r1, r1, lsl #1
/*0x4cfe*/      add.w r1, r4, r1, lsl #1
/*0x4d02*/      and r2, r2, #0xf
/*0x4d06*/      bic r0, r0, #1
/*0x4d0a*/      ldrb r2, [r1, r2]
/*0x4d0c*/      cmp r0, #8
/*0x4d0e*/      beq jump_4d1a
/*0x4d10*/      cmp r0, #0xa
/*0x4d12*/      beq jump_4d70
/*0x4d14*/      cmp r0, #0xc
/*0x4d16*/      bne jump_4e10
/*0x4d18*/      b jump_4dce
            jump_4d1a:
/*0x4d1a*/      movs r0, #0x48
/*0x4d1c*/      b jump_4d68
            jump_4d1e:
/*0x4d1e*/      ldrb r1, [r6], #-1
/*0x4d22*/      cbz r1, jump_4d28
/*0x4d24*/      subs r6, r6, #2
/*0x4d26*/      b jump_4d38
            jump_4d28:
/*0x4d28*/      ldrb r1, [r6], #-1
/*0x4d2c*/      cbz r1, jump_4d32
/*0x4d2e*/      subs r6, r6, #1
/*0x4d30*/      b jump_4d38
            jump_4d32:
/*0x4d32*/      ldrb r1, [r6], #-1
/*0x4d36*/      cbz r1, jump_4d68
            jump_4d38:
/*0x4d38*/      ldr r1, [pc, #0xec] /* data_4e28 */
/*0x4d3a*/      and r4, r0, #7
/*0x4d3e*/      add.w r1, r1, r0, lsr #3
/*0x4d42*/      ldrb r3, [r1]
/*0x4d44*/      lsl.w r1, sb, r4
/*0x4d48*/      tst r3, r1
/*0x4d4a*/      beq jump_4d68
/*0x4d4c*/      movs r1, #3
/*0x4d4e*/      b jump_4d60
            jump_4d50:
/*0x4d50*/      ldrb r3, [r6, #1]!
/*0x4d54*/      cmp r3, r2
/*0x4d56*/      bhi jump_4d5c
/*0x4d58*/      strb r5, [r6]
/*0x4d5a*/      b jump_4d60
            jump_4d5c:
/*0x4d5c*/      subs r3, r3, r2
/*0x4d5e*/      strb r3, [r6]
            jump_4d60:
/*0x4d60*/      subs r1, r1, #1
/*0x4d62*/      uxtb r1, r1
/*0x4d64*/      bhs jump_4d50
/*0x4d66*/      subs r6, r6, #3
            jump_4d68:
/*0x4d68*/      subs r0, r0, #1
/*0x4d6a*/      uxtb r0, r0
/*0x4d6c*/      bhs jump_4d1e
            jump_4d6e:
/*0x4d6e*/      b jump_4e10
            jump_4d70:
/*0x4d70*/      ldrb.w r0, [ip, #0x58]
/*0x4d74*/      adds r0, r0, #1
/*0x4d76*/      uxtb r0, r0
/*0x4d78*/      strb.w r0, [ip, #0x58]
/*0x4d7c*/      cmp r0, r2
/*0x4d7e*/      blo jump_4e10
/*0x4d80*/      strb.w r5, [ip, #0x58]
/*0x4d84*/      movs r0, #1
            jump_4d86:
/*0x4d86*/      add.w r1, r0, r0, lsl #1
/*0x4d8a*/      add.w r1, ip, r1, lsl #1
/*0x4d8e*/      adds r0, r0, #1
/*0x4d90*/      ldrh r2, [r1, #4]
/*0x4d92*/      strh r2, [r1, #-0x2]
/*0x4d96*/      ldrb r2, [r1, #6]
/*0x4d98*/      uxtb r0, r0
/*0x4d9a*/      strb r2, [r1]
/*0x4d9c*/      cmp r0, #0xe
/*0x4d9e*/      blo jump_4d86
/*0x4da0*/      strh.w r5, [ip, #0x52]
/*0x4da4*/      strb.w r5, [ip, #0x54]
/*0x4da8*/      movs r0, #0xe
/*0x4daa*/      b jump_4dbe
            jump_4dac:
/*0x4dac*/      add.w r1, r0, r0, lsl #1
/*0x4db0*/      add.w r1, ip, r1, lsl #1
/*0x4db4*/      ldrh r2, [r1, #1]!
/*0x4db8*/      strh r2, [r1, #6]
/*0x4dba*/      ldrb r2, [r1, #2]
/*0x4dbc*/      strb r2, [r1, #8]
            jump_4dbe:
/*0x4dbe*/      subs r0, r0, #1
/*0x4dc0*/      uxtb r0, r0
/*0x4dc2*/      bhs jump_4dac
/*0x4dc4*/      strh.w r5, [ip, #7]
/*0x4dc8*/      strb.w r5, [ip, #9]
/*0x4dcc*/      b jump_4e10
            jump_4dce:
/*0x4dce*/      ldrb.w r0, [ip, #0x27]
/*0x4dd2*/      adds r0, r0, #1
/*0x4dd4*/      uxtb r0, r0
/*0x4dd6*/      strb.w r0, [ip, #0x27]
/*0x4dda*/      cmp r0, r2
/*0x4ddc*/      blo jump_4e10
/*0x4dde*/      ldr r0, [pc, #0x3c] /* data_4e1c */
/*0x4de0*/      strb.w r5, [ip, #0x27]
/*0x4de4*/      adds r0, #0x27
/*0x4de6*/      movs r2, #5
/*0x4de8*/      b jump_4e0a
            jump_4dea:
/*0x4dea*/      ldrsb r1, [r0, #-0x1]
/*0x4dee*/      subs r0, r0, #5
/*0x4df0*/      cbz r1, jump_4e0a
/*0x4df2*/      adds r1, r1, #1
/*0x4df4*/      sxtb r1, r1
/*0x4df6*/      strb r1, [r0, #4]
/*0x4df8*/      ldrb r3, [r0, #3]
/*0x4dfa*/      adds r4, r1, r3
/*0x4dfc*/      subs r4, #0xa
/*0x4dfe*/      cmp r4, #0xe
/*0x4e00*/      ble jump_4e0a
/*0x4e02*/      subs r1, r3, r1
/*0x4e04*/      adds r1, #0xa
/*0x4e06*/      bpl jump_4e0a
/*0x4e08*/      strb r5, [r0, #4]
            jump_4e0a:
/*0x4e0a*/      subs r2, r2, #1
/*0x4e0c*/      uxtb r2, r2
/*0x4e0e*/      bhs jump_4dea
            jump_4e10:
/*0x4e10*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4e14*/      b.w call_5598

            data_4e18:
/*0x4e18*/  .word 0x20000648
            data_4e1c:
/*0x4e1c*/  .word 0x2000008c
            data_4e20:
/*0x4e20*/  .word 0x20000730
            data_4e24:
/*0x4e24*/  .word data_7a9b
            data_4e28:
/*0x4e28*/  .word 0x200001ac


            .thumb_func
            call_4e2c:
/*0x4e2c*/      movs r1, #5
/*0x4e2e*/      ldr r0, [pc, #4] /* data_4e34 */
/*0x4e30*/      b.w jump_4728

            data_4e34:
/*0x4e34*/  .word data_7a3d


            .thumb_func
            call_4e38:
/*0x4e38*/      push {r3, r4, r5, lr}
/*0x4e3a*/      movs r1, #3
/*0x4e3c*/      mov r0, sp
/*0x4e3e*/      bl call_4a50
/*0x4e42*/      ldr r4, [pc, #0x2c] /* data_4e70 */
/*0x4e44*/      cmp r0, #3
/*0x4e46*/      bne jump_4e66
/*0x4e48*/      movs r3, #3
/*0x4e4a*/      mov r2, r3
/*0x4e4c*/      ldr r1, [pc, #0x24] /* data_4e74 */
/*0x4e4e*/      mov r0, sp
/*0x4e50*/      bl call_4a20
/*0x4e54*/      cbz r0, jump_4e66
/*0x4e56*/      ldrb r0, [r4, #2]
/*0x4e58*/      mvn.w r1, r0, lsr #1
/*0x4e5c*/      bfi r0, r1, #1, #1
/*0x4e60*/      strb r0, [r4, #2]
/*0x4e62*/      bl call_3bec
            jump_4e66:
/*0x4e66*/      ldrb r0, [r4, #2]
/*0x4e68*/      ubfx r0, r0, #1, #1
/*0x4e6c*/      pop {r3, r4, r5, pc}

/*0x4e6e*/  .byte 0x00
/*0x4e6f*/  .byte 0x00

            data_4e70:
/*0x4e70*/  .word 0x20000730
            data_4e74:
/*0x4e74*/  .word data_7a31


            .thumb_func
            call_4e78:
/*0x4e78*/      push {r4, lr}
/*0x4e7a*/      lsrs r1, r0, #0x18
/*0x4e7c*/      lsls r1, r1, #0x1e
/*0x4e7e*/      bpl jump_4eb2
/*0x4e80*/      uxtb r0, r0
/*0x4e82*/      cmp r0, #0x12
/*0x4e84*/      beq jump_4eb4
/*0x4e86*/      bgt jump_4e92
/*0x4e88*/      cmp r0, #0x10
/*0x4e8a*/      beq jump_4eb4
/*0x4e8c*/      cmp r0, #0x11
/*0x4e8e*/      bne jump_4eb2
/*0x4e90*/      b jump_4eb4
            jump_4e92:
/*0x4e92*/      cmp r0, #0x13
/*0x4e94*/      beq jump_4eb4
/*0x4e96*/      cmp r0, #0x5f
/*0x4e98*/      bne jump_4eb2
/*0x4e9a*/      ldr r0, [pc, #0x20] /* data_4ebc */
/*0x4e9c*/      ldrb r0, [r0, #2]
/*0x4e9e*/      cmp r0, #0
/*0x4ea0*/      beq jump_4eb2
/*0x4ea2*/      bl call_558c
/*0x4ea6*/      bl call_5a9c
/*0x4eaa*/      ldr r1, [pc, #0x14] /* data_4ec0 */
/*0x4eac*/      movw r0, #0x7530
/*0x4eb0*/      strh r0, [r1, #2]
            jump_4eb2:
/*0x4eb2*/      pop {r4, pc}
            jump_4eb4:
/*0x4eb4*/      ldr r1, [pc, #0xc] /* data_4ec4 */
/*0x4eb6*/      subs r0, #0x10
/*0x4eb8*/      strb r0, [r1]
/*0x4eba*/      pop {r4, pc}

            data_4ebc:
/*0x4ebc*/  .word 0x2000005c
            data_4ec0:
/*0x4ec0*/  .word 0x20000000
            data_4ec4:
/*0x4ec4*/  .word 0x20000029


            .thumb_func
            call_4ec8:
/*0x4ec8*/      ldr r0, [pc, #0x7c] /* data_4f48 */
/*0x4eca*/      push {r4, lr}
/*0x4ecc*/      ldrb r1, [r0, #3]
/*0x4ece*/      lsls r1, r1, #0x1e
/*0x4ed0*/      bpl jump_4f22
/*0x4ed2*/      ldr r2, [pc, #0x78] /* data_4f4c */
/*0x4ed4*/      ldrb r4, [r0]
/*0x4ed6*/      movs r3, #1
/*0x4ed8*/      ldrb r1, [r2, #7]
/*0x4eda*/      cmp r4, #0xcf
/*0x4edc*/      beq jump_4eee
/*0x4ede*/      ldrb r0, [r0, #1]
/*0x4ee0*/      lsls r0, r0, #0x1f
/*0x4ee2*/      beq jump_4f22
/*0x4ee4*/      ldr r0, [pc, #0x60] /* data_4f48 */
/*0x4ee6*/      cmp r1, #2
/*0x4ee8*/      ldrb r0, [r0, #2]
/*0x4eea*/      beq jump_4f02
/*0x4eec*/      b jump_4f0e
            jump_4eee:
/*0x4eee*/      cmp r1, #4
/*0x4ef0*/      beq jump_4efe
/*0x4ef2*/      cmp r1, #5
/*0x4ef4*/      bne jump_4f22
/*0x4ef6*/      strb r3, [r2, #8]
/*0x4ef8*/      movs r0, #6
/*0x4efa*/      strb r0, [r2, #7]
/*0x4efc*/      b jump_4f44
            jump_4efe:
/*0x4efe*/      strb r3, [r2, #7]
/*0x4f00*/      b jump_4f44
            jump_4f02:
/*0x4f02*/      cmp r0, #0xd
/*0x4f04*/      beq jump_4f22
/*0x4f06*/      cmp r0, #0x15
/*0x4f08*/      beq jump_4f22
/*0x4f0a*/      cmp r0, #0x1d
/*0x4f0c*/      beq jump_4f22
            jump_4f0e:
/*0x4f0e*/      ldr r1, [pc, #0x3c] /* data_4f4c */
/*0x4f10*/      cmp r0, #0xd
/*0x4f12*/      ldr r1, [r1]
/*0x4f14*/      beq jump_4f26
/*0x4f16*/      cmp r0, #0x15
/*0x4f18*/      beq jump_4f2a
/*0x4f1a*/      cmp r0, #0x1d
/*0x4f1c*/      beq jump_4f30
/*0x4f1e*/      cmp r0, #0x47
/*0x4f20*/      beq jump_4f36
            jump_4f22:
/*0x4f22*/      movs r0, #0
/*0x4f24*/      pop {r4, pc}
            jump_4f26:
/*0x4f26*/      adds r1, #0xf
/*0x4f28*/      b jump_4f2c
            jump_4f2a:
/*0x4f2a*/      adds r1, #0x64
            jump_4f2c:
/*0x4f2c*/      str r1, [r2]
/*0x4f2e*/      b jump_4f44
            jump_4f30:
/*0x4f30*/      add.w r1, r1, #0x1f4
/*0x4f34*/      b jump_4f2c
            jump_4f36:
/*0x4f36*/      movs r0, #8
/*0x4f38*/      ldr r1, [pc, #0x14] /* data_4f50 */
/*0x4f3a*/      strb r0, [r2, #7]
/*0x4f3c*/      movs r0, #0
/*0x4f3e*/      strh r0, [r1, #2]
/*0x4f40*/      ldr r0, [pc, #0x10] /* data_4f54 */
/*0x4f42*/      strb r3, [r0]
            jump_4f44:
/*0x4f44*/      movs r0, #1
/*0x4f46*/      pop {r4, pc}

            data_4f48:
/*0x4f48*/  .word 0x20000030
            data_4f4c:
/*0x4f4c*/  .word 0x200019d0
            data_4f50:
/*0x4f50*/  .word 0x20000000
            data_4f54:
/*0x4f54*/  .word 0x20000648


            .thumb_func
            call_4f58:
/*0x4f58*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x4f5c*/      ldr r0, [pc, #0x1a8] /* data_5108 */
/*0x4f5e*/      ldrh r1, [r0, #2]
/*0x4f60*/      cbz r1, jump_4f68
/*0x4f62*/      movw r1, #0x7530
/*0x4f66*/      strh r1, [r0, #2]
            jump_4f68:
/*0x4f68*/      ldr r5, [pc, #0x1a4] /* data_5110 */
/*0x4f6a*/      ldr r6, [pc, #0x1a0] /* data_510c */
/*0x4f6c*/      mov.w sb, #0
/*0x4f70*/      ldrb r2, [r5]
/*0x4f72*/      ldrb r3, [r6, #0xa]
/*0x4f74*/      ldrb r1, [r5, #3]
/*0x4f76*/      ldrb r0, [r5, #2]
/*0x4f78*/      mov.w fp, #3
/*0x4f7c*/      movs r4, #1
/*0x4f7e*/      cbz r3, jump_4fd4
/*0x4f80*/      lsls r1, r1, #0x1e
/*0x4f82*/      bpl jump_4fce
/*0x4f84*/      cmp r3, #1
/*0x4f86*/      beq jump_4f98
/*0x4f88*/      ldr r1, [pc, #0x188] /* data_5114 */
/*0x4f8a*/      ldrb r1, [r3, r1]
/*0x4f8c*/      cmp r0, r1
/*0x4f8e*/      beq jump_4fc6
/*0x4f90*/      ldr r7, [pc, #0x180] /* data_5114 */
/*0x4f92*/      movs r1, #5
/*0x4f94*/      adds r7, #0xe
/*0x4f96*/      b jump_4fbc
            jump_4f98:
/*0x4f98*/      ldr r1, [pc, #0x17c] /* data_5118 */
/*0x4f9a*/      ldrb.w r2, [r1, #0xe8]
/*0x4f9e*/      cmp r0, r2
/*0x4fa0*/      bne jump_4fa6
/*0x4fa2*/      movs r2, #2
/*0x4fa4*/      strb r2, [r6, #0xa]
            jump_4fa6:
/*0x4fa6*/      ldrb.w r1, [r1, #0xe9]
/*0x4faa*/      cmp r0, r1
/*0x4fac*/      bne jump_4fce
/*0x4fae*/      strb.w fp, [r6, #0xa]
/*0x4fb2*/      b jump_4fce
            jump_4fb4:
/*0x4fb4*/      ldrb.w ip, [r7, r1]
/*0x4fb8*/      cmp ip, r2
/*0x4fba*/      beq jump_4fc2
            jump_4fbc:
/*0x4fbc*/      subs r1, r1, #1
/*0x4fbe*/      uxtb r1, r1
/*0x4fc0*/      bhs jump_4fb4
            jump_4fc2:
/*0x4fc2*/      cmp r1, #0xff
/*0x4fc4*/      bne jump_4fce
            jump_4fc6:
/*0x4fc6*/      ldr r1, [pc, #0x150] /* data_5118 */
/*0x4fc8*/      adds r1, #0xe6
/*0x4fca*/      strb r0, [r3, r1]
/*0x4fcc*/      strb r4, [r6, #0xa]
            jump_4fce:
/*0x4fce*/      strb.w sb, [r5]
/*0x4fd2*/      b jump_5004
            jump_4fd4:
/*0x4fd4*/      ldr.w sl, [pc, #0x144] /* data_511c */
/*0x4fd8*/      cmp r2, #0xcf
/*0x4fda*/      ldrb.w ip, [sl, #6]
/*0x4fde*/      beq jump_4ff8
/*0x4fe0*/      ldr r7, [pc, #0x12c] /* data_5110 */
/*0x4fe2*/      ldrb r3, [r5, #1]
/*0x4fe4*/      ldrb r7, [r7, #3]
/*0x4fe6*/      lsls.w r8, r3, #0x1f
/*0x4fea*/      orr r7, r7, #1
/*0x4fee*/      beq jump_5040
/*0x4ff0*/      cmp.w ip, #1
/*0x4ff4*/      beq jump_500e
/*0x4ff6*/      b jump_500a
            jump_4ff8:
/*0x4ff8*/      ubfx r0, r1, #1, #1
/*0x4ffc*/      strb r0, [r6, #7]
/*0x4ffe*/      cmp.w ip, #1
/*0x5002*/      beq jump_500a
            jump_5004:
/*0x5004*/      movs r0, #1
            jump_5006:
/*0x5006*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_500a:
/*0x500a*/      movs r0, #0
/*0x500c*/      b jump_5006
            jump_500e:
/*0x500e*/      ldrb.w r1, [sl, #7]
/*0x5012*/      cmp r1, #2
/*0x5014*/      beq jump_500a
/*0x5016*/      ldr r2, [pc, #0xfc] /* data_5114 */
/*0x5018*/      movs r1, #0
/*0x501a*/      adds r2, #0x22
            jump_501c:
/*0x501c*/      ldrb.w r4, [r2, r1, lsl #1]
/*0x5020*/      cmp r0, r4
/*0x5022*/      bne jump_5036
/*0x5024*/      add.w r0, r2, r1, lsl #1
/*0x5028*/      ldrb r0, [r0, #1]
/*0x502a*/      strb r0, [r5]
/*0x502c*/      strb r7, [r5, #3]
/*0x502e*/      bic r0, r3, #1
/*0x5032*/      strb r0, [r5, #1]
/*0x5034*/      b jump_500a
            jump_5036:
/*0x5036*/      adds r1, r1, #1
/*0x5038*/      uxtb r1, r1
/*0x503a*/      cmp r1, #0x22
/*0x503c*/      blo jump_501c
/*0x503e*/      b jump_500a
            jump_5040:
/*0x5040*/      ldrb.w ip, [r6, #7]
/*0x5044*/      cmp.w ip, #0
/*0x5048*/      beq jump_50b8
/*0x504a*/      ldrb r2, [r6, #6]
/*0x504c*/      cmp r2, #0
/*0x504e*/      bne jump_500a
/*0x5050*/      lsls r1, r1, #0x1e
/*0x5052*/      bpl jump_50b2
/*0x5054*/      ldr r1, [pc, #0xc8] /* data_5120 */
/*0x5056*/      cmp r0, #0x25
/*0x5058*/      ldrb r1, [r1, r0]
/*0x505a*/      strb r1, [r5]
/*0x505c*/      beq jump_5074
/*0x505e*/      bgt jump_506a
/*0x5060*/      cmp r0, #5
/*0x5062*/      beq jump_508e
/*0x5064*/      cmp r0, #0x24
/*0x5066*/      bne jump_50ac
/*0x5068*/      b jump_5074
            jump_506a:
/*0x506a*/      cmp r0, #0x26
/*0x506c*/      beq jump_5080
/*0x506e*/      cmp r0, #0x2a
/*0x5070*/      bne jump_50ac
/*0x5072*/      b jump_5080
            jump_5074:
/*0x5074*/      subs r0, #0x24
/*0x5076*/      lsls r4, r0
/*0x5078*/      uxtb r0, r4
/*0x507a*/      bl call_3a80
/*0x507e*/      b jump_50b2
            jump_5080:
/*0x5080*/      subs r0, #0x26
/*0x5082*/      lsl.w r0, r4, r0
/*0x5086*/      uxtb r0, r0
/*0x5088*/      bl call_3a68
/*0x508c*/      b jump_50a8
            jump_508e:
/*0x508e*/      lsls r0, r3, #0x1c
/*0x5090*/      bpl jump_50ac
/*0x5092*/      ldrb r0, [r6, #0xb]
/*0x5094*/      cbz r0, jump_50a6
/*0x5096*/      movs r1, #7
/*0x5098*/      udiv r2, r0, r1
/*0x509c*/      mls r0, r1, r2, r0
/*0x50a0*/      adds r0, r0, #1
/*0x50a2*/      strb r0, [r6, #0xb]
/*0x50a4*/      b jump_50a8
            jump_50a6:
/*0x50a6*/      strb r4, [r6, #0xb]
            jump_50a8:
/*0x50a8*/      strb r4, [r6]
/*0x50aa*/      b jump_50b2
            jump_50ac:
/*0x50ac*/      ldr r0, [r5]
/*0x50ae*/      bl call_53d0
            jump_50b2:
/*0x50b2*/      strb.w sb, [r5]
/*0x50b6*/      b jump_500a
            jump_50b8:
/*0x50b8*/      lsls r0, r1, #0x1e
/*0x50ba*/      bpl jump_50f2
/*0x50bc*/      cmp r2, #0x2c
/*0x50be*/      beq jump_50c8
/*0x50c0*/      cmp r2, #0xe3
/*0x50c2*/      beq jump_50c8
/*0x50c4*/      cmp r2, #0xe6
/*0x50c6*/      bne jump_500a
            jump_50c8:
/*0x50c8*/      movs r1, #3
/*0x50ca*/      mov r0, sp
/*0x50cc*/      bl call_4a50
/*0x50d0*/      cmp r0, #3
/*0x50d2*/      bne jump_500a
/*0x50d4*/      ldr r1, [pc, #0x3c] /* data_5114 */
/*0x50d6*/      movs r3, #3
/*0x50d8*/      mov r2, r3
/*0x50da*/      adds r1, r1, #4
/*0x50dc*/      mov r0, sp
/*0x50de*/      bl call_4a20
/*0x50e2*/      cmp r0, #0
/*0x50e4*/      beq jump_500a
/*0x50e6*/      ldrb r0, [r6, #8]
/*0x50e8*/      mvns r0, r0
/*0x50ea*/      strb r0, [r6, #8]
/*0x50ec*/      strb.w fp, [r6, #4]
/*0x50f0*/      b jump_50b2
            jump_50f2:
/*0x50f2*/      ldr r1, [pc, #0x14] /* data_5108 */
/*0x50f4*/      ldrb r0, [r1]
/*0x50f6*/      cmp r0, #0
/*0x50f8*/      beq jump_500a
/*0x50fa*/      cmp r2, #0x29
/*0x50fc*/      bne jump_500a
/*0x50fe*/      strb r0, [r5]
/*0x5100*/      strb.w sb, [r1]
/*0x5104*/      strb r7, [r5, #3]
/*0x5106*/      b jump_500a

            data_5108:
/*0x5108*/  .word 0x20000000
            data_510c:
/*0x510c*/  .word 0x20000648
            data_5110:
/*0x5110*/  .word 0x20000030
            data_5114:
/*0x5114*/  .word data_7a2a
            data_5118:
/*0x5118*/  .word 0x20000730
            data_511c:
/*0x511c*/  .word 0x200019d0
            data_5120:
/*0x5120*/  .word 0x200002c0


            .thumb_func
            call_5124:
/*0x5124*/      push {r4, r5, r6, lr}
/*0x5126*/      ldr r4, [pc, #0x60] /* data_5188 */
/*0x5128*/      ldrb r0, [r4, #3]
/*0x512a*/      lsls r1, r0, #0x1f
/*0x512c*/      bne jump_515a
/*0x512e*/      mov r1, r4
/*0x5130*/      ldr r3, [pc, #0x58] /* data_518c */
/*0x5132*/      ldrb r1, [r1, #2]
/*0x5134*/      ldr r2, [pc, #0x58] /* data_5190 */
/*0x5136*/      lsls r0, r0, #0x1e
/*0x5138*/      bpl jump_5166
/*0x513a*/      ldrb r5, [r4, #1]
/*0x513c*/      lsls r0, r5, #0x19
/*0x513e*/      bpl jump_515a
/*0x5140*/      movs r0, #0
            jump_5142:
/*0x5142*/      ldrb.w r6, [r3, r0, lsl #1]
/*0x5146*/      cmp r1, r6
/*0x5148*/      bne jump_515c
/*0x514a*/      add.w r1, r3, r0, lsl #1
/*0x514e*/      ldrb r1, [r1, #1]
/*0x5150*/      strb r1, [r4]
/*0x5152*/      strb r1, [r2, r0]
/*0x5154*/      bic r0, r5, #1
/*0x5158*/      strb r0, [r4, #1]
            jump_515a:
/*0x515a*/      pop {r4, r5, r6, pc}
            jump_515c:
/*0x515c*/      adds r0, r0, #1
/*0x515e*/      uxtb r0, r0
/*0x5160*/      cmp r0, #0x22
/*0x5162*/      blo jump_5142
/*0x5164*/      pop {r4, r5, r6, pc}
            jump_5166:
/*0x5166*/      movs r0, #0
            jump_5168:
/*0x5168*/      ldrb.w r5, [r3, r0, lsl #1]
/*0x516c*/      cmp r1, r5
/*0x516e*/      bne jump_517c
/*0x5170*/      ldrb r5, [r2, r0]
/*0x5172*/      cbz r5, jump_517c
/*0x5174*/      strb r5, [r4]
/*0x5176*/      movs r1, #0
/*0x5178*/      strb r1, [r2, r0]
/*0x517a*/      pop {r4, r5, r6, pc}
            jump_517c:
/*0x517c*/      adds r0, r0, #1
/*0x517e*/      uxtb r0, r0
/*0x5180*/      cmp r0, #0x22
/*0x5182*/      blo jump_5168
/*0x5184*/      pop {r4, r5, r6, pc}

/*0x5186*/  .byte 0x00
/*0x5187*/  .byte 0x00

            data_5188:
/*0x5188*/  .word 0x20000030
            data_518c:
/*0x518c*/  .word data_7a4c
            data_5190:
/*0x5190*/  .word 0x20000068


            .thumb_func
            call_5194:
/*0x5194*/      ldr r1, [pc, #0x18] /* data_51b0 */
/*0x5196*/      push {r4, lr}
/*0x5198*/      ldr r1, [r1]
/*0x519a*/      ldrh r2, [r0]
/*0x519c*/      strh r2, [r1]
/*0x519e*/      ldrb r0, [r0, #2]
/*0x51a0*/      strb r0, [r1, #2]
/*0x51a2*/      bl call_5598
/*0x51a6*/      pop.w {r4, lr}
/*0x51aa*/      b.w call_3bec

/*0x51ae*/  .byte 0x00
/*0x51af*/  .byte 0x00

            data_51b0:
/*0x51b0*/  .word 0x2000008c


            .thumb_func
            call_51b4:
/*0x51b4*/      ldr r2, [pc, #0x20] /* data_51d8 */
/*0x51b6*/      ldrh r0, [r2, #2]
/*0x51b8*/      cmp r0, #1
/*0x51ba*/      bne jump_51d2
/*0x51bc*/      ldr r0, [pc, #0x1c] /* data_51dc */
/*0x51be*/      ldrb r1, [r0, #7]
/*0x51c0*/      cbz r1, jump_51c6
/*0x51c2*/      movs r1, #8
/*0x51c4*/      strb r1, [r0, #7]
            jump_51c6:
/*0x51c6*/      ldr r1, [pc, #0x18] /* data_51e0 */
/*0x51c8*/      movs r0, #0
/*0x51ca*/      movs r3, #1
/*0x51cc*/      strb r0, [r1, #6]
/*0x51ce*/      strb r3, [r1]
/*0x51d0*/      strh r0, [r2, #2]
            jump_51d2:
/*0x51d2*/      movs r0, #1
/*0x51d4*/      bx lr

/*0x51d6*/  .byte 0x00
/*0x51d7*/  .byte 0x00

            data_51d8:
/*0x51d8*/  .word 0x20000000
            data_51dc:
/*0x51dc*/  .word 0x200019d0
            data_51e0:
/*0x51e0*/  .word 0x20000648


            .thumb_func
            call_51e4:
/*0x51e4*/      cmp r0, #0xff
/*0x51e6*/      bhs jump_51f6
/*0x51e8*/      adds r0, #0x2b
/*0x51ea*/      cmp r0, #0xff
/*0x51ec*/      bls jump_51f2
/*0x51ee*/      movs r0, #0xff
/*0x51f0*/      bx lr
            jump_51f2:
/*0x51f2*/      uxtb r0, r0
/*0x51f4*/      bx lr
            jump_51f6:
/*0x51f6*/      movs r0, #0
/*0x51f8*/      bx lr

/*0x51fa*/  .byte 0x00
/*0x51fb*/  .byte 0x00


            .thumb_func
            call_51fc:
/*0x51fc*/      push {r0, r1, r4, r5, r6, lr}
/*0x51fe*/      cmp.w r0, #0x200
/*0x5202*/      bhs jump_525c
/*0x5204*/      ldrh.w r4, [sp, #4]
/*0x5208*/      cmp.w r4, #0x400
/*0x520c*/      bhs jump_525c
/*0x520e*/      lsrs r1, r0, #8
/*0x5210*/      ldr r2, [pc, #0x6c] /* data_5280 */
/*0x5212*/      uxtb r0, r0
/*0x5214*/      add.w r1, r1, r1, lsl #2
/*0x5218*/      ldrb r0, [r2, r0]
/*0x521a*/      lsls r1, r1, #2
/*0x521c*/      cmp r0, #0xff
/*0x521e*/      beq jump_525c
/*0x5220*/      add.w r2, r1, r0, lsr #2
/*0x5224*/      add.w r3, r0, r1, lsl #2
/*0x5228*/      lsls r0, r0, #0x1e
/*0x522a*/      lsrs r1, r0, #0x1d
/*0x522c*/      movs r6, #3
/*0x522e*/      ldr r5, [pc, #0x54] /* data_5284 */
/*0x5230*/      adds r2, #0xa0
/*0x5232*/      cmp r4, #3
/*0x5234*/      beq jump_5260
/*0x5236*/      ldrb.w r0, [sp, #4]
/*0x523a*/      add r3, r5
/*0x523c*/      cmp r0, #0xff
/*0x523e*/      strb.w r0, [r3, #0xea]
/*0x5242*/      beq jump_5258
/*0x5244*/      adds r0, r5, r2
/*0x5246*/      lsls r6, r1
/*0x5248*/      ldrb r2, [r0, #0xea]!
/*0x524c*/      ldrb.w r3, [sp, #5]
/*0x5250*/      bics r2, r6
/*0x5252*/      lsls r3, r1
/*0x5254*/      orrs r2, r3
/*0x5256*/      strb r2, [r0]
            jump_5258:
/*0x5258*/      movs r0, #0
/*0x525a*/      pop {r2, r3, r4, r5, r6, pc}
            jump_525c:
/*0x525c*/      movs r0, #3
            jump_525e:
/*0x525e*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5260:
/*0x5260*/      adds r0, r5, r3
/*0x5262*/      ldrb.w r0, [r0, #0xea]
/*0x5266*/      cmp r0, #0xff
/*0x5268*/      beq jump_525e
/*0x526a*/      add r2, r5
/*0x526c*/      lsls r6, r1
/*0x526e*/      ldrb.w r2, [r2, #0xea]
/*0x5272*/      rsb.w r1, r1, #8
/*0x5276*/      ands r2, r6
/*0x5278*/      lsls r2, r1
/*0x527a*/      add r0, r2
/*0x527c*/      uxth r0, r0
/*0x527e*/      pop {r2, r3, r4, r5, r6, pc}

            data_5280:
/*0x5280*/  .word 0x200001c0
            data_5284:
/*0x5284*/  .word 0x20000730


            .thumb_func
            call_5288:
/*0x5288*/      push {r4, r5, r6, r7, lr}
/*0x528a*/      ldr r0, [pc, #0x6c] /* data_52f8 */
/*0x528c*/      ldrb r1, [r0, #2]
/*0x528e*/      ldr r0, [pc, #0x6c] /* data_52fc */
/*0x5290*/      ldrb r2, [r0, #1]
/*0x5292*/      cbz r1, jump_5298
/*0x5294*/      lsls r0, r2, #0x1c
/*0x5296*/      bmi jump_52ec
            jump_5298:
/*0x5298*/      ldr r0, [pc, #0x64] /* data_5300 */
/*0x529a*/      ldr r5, [pc, #0x68] /* data_5304 */
/*0x529c*/      ldr r3, [pc, #0x68] /* data_5308 */
/*0x529e*/      ldrb.w r0, [r0, #0xe8]
/*0x52a2*/      lsls r1, r2, #0x1d
/*0x52a4*/      mov.w r4, #0xe8
/*0x52a8*/      bpl jump_52b2
/*0x52aa*/      ldrb.w r1, [r5, #0x39]
/*0x52ae*/      strb r4, [r3, r1]
/*0x52b0*/      strb r4, [r3, r0]
            jump_52b2:
/*0x52b2*/      ldr r1, [pc, #0x58] /* data_530c */
/*0x52b4*/      movs r6, #0xcf
/*0x52b6*/      ldrb r7, [r1, #8]
/*0x52b8*/      ldr r1, [pc, #0x44] /* data_5300 */
/*0x52ba*/      ldrb.w r1, [r1, #0xe9]
/*0x52be*/      cbz r7, jump_52ee
/*0x52c0*/      ldrb.w r2, [r5, #0xe7]
/*0x52c4*/      movs r7, #0x50
/*0x52c6*/      cmp r0, r2
/*0x52c8*/      strb r7, [r3, r2]
/*0x52ca*/      beq jump_52ce
/*0x52cc*/      strb r4, [r3, r0]
            jump_52ce:
/*0x52ce*/      ldrb.w r0, [r5, #0x65]
/*0x52d2*/      movs r2, #0x51
/*0x52d4*/      cmp r1, r0
/*0x52d6*/      strb r2, [r3, r0]
/*0x52d8*/      beq jump_52dc
/*0x52da*/      strb r6, [r3, r1]
            jump_52dc:
/*0x52dc*/      ldrb.w r1, [r5, #0xe5]
/*0x52e0*/      movs r0, #0x52
/*0x52e2*/      strb r0, [r3, r1]
/*0x52e4*/      ldrb.w r1, [r5, #0xe4]
/*0x52e8*/      movs r0, #0x4f
/*0x52ea*/      strb r0, [r3, r1]
            jump_52ec:
/*0x52ec*/      pop {r4, r5, r6, r7, pc}
            jump_52ee:
/*0x52ee*/      lsls r2, r2, #0x1d
/*0x52f0*/      bmi jump_52f4
/*0x52f2*/      strb r4, [r3, r0]
            jump_52f4:
/*0x52f4*/      strb r6, [r3, r1]
/*0x52f6*/      pop {r4, r5, r6, r7, pc}

            data_52f8:
/*0x52f8*/  .word 0x2000005c
            data_52fc:
/*0x52fc*/  .word 0x20000000
            data_5300:
/*0x5300*/  .word 0x20000730
            data_5304:
/*0x5304*/  .word 0x200001c0
            data_5308:
/*0x5308*/  .word 0x200002c0
            data_530c:
/*0x530c*/  .word 0x20000648


            .thumb_func
            call_5310:
/*0x5310*/      ldr r3, [pc, #0x84] /* data_5398 */
/*0x5312*/      push {r4, lr}
/*0x5314*/      ldrb r0, [r3, #3]
/*0x5316*/      ldr r1, [pc, #0x84] /* data_539c */
/*0x5318*/      ldrb r0, [r1, r0]
/*0x531a*/      add.w r0, r0, r0, lsl #2
/*0x531e*/      adds r1, r0, r3
/*0x5320*/      ldr r0, [pc, #0x7c] /* data_53a0 */
/*0x5322*/      adds r1, r1, #4
/*0x5324*/      str r1, [r0]
/*0x5326*/      ldrb r2, [r1]
/*0x5328*/      cbnz r2, jump_533e
/*0x532a*/      ldrb r2, [r1, #1]
/*0x532c*/      cbnz r2, jump_533e
/*0x532e*/      ldrb r2, [r1, #2]
/*0x5330*/      cbnz r2, jump_533e
/*0x5332*/      movs r2, #0xff
/*0x5334*/      strb r2, [r1]
/*0x5336*/      ldr r1, [r0]
/*0x5338*/      strb r2, [r1, #1]
/*0x533a*/      ldr r1, [r0]
/*0x533c*/      strb r2, [r1, #2]
            jump_533e:
/*0x533e*/      ldrb r1, [r3, #3]
/*0x5340*/      cmp r1, #3
/*0x5342*/      bhi jump_5362
/*0x5344*/      movs r2, #0
/*0x5346*/      cmp r1, #1
/*0x5348*/      beq jump_5354
/*0x534a*/      cmp r1, #2
/*0x534c*/      beq jump_5358
/*0x534e*/      cmp r1, #3
/*0x5350*/      bne jump_538e
/*0x5352*/      b jump_535e
            jump_5354:
/*0x5354*/      str r2, [r0, #4]
/*0x5356*/      b jump_538e
            jump_5358:
/*0x5358*/      strb r2, [r0, #4]
/*0x535a*/      strb r2, [r0, #5]
/*0x535c*/      b jump_538e
            jump_535e:
/*0x535e*/      movs r1, #0xd8
/*0x5360*/      b jump_537a
            jump_5362:
/*0x5362*/      cmp r1, #7
/*0x5364*/      bls jump_538e
/*0x5366*/      bic r1, r1, #1
/*0x536a*/      cmp r1, #8
/*0x536c*/      beq jump_535e
/*0x536e*/      cmp r1, #0xa
/*0x5370*/      beq jump_5378
/*0x5372*/      cmp r1, #0xc
/*0x5374*/      bne jump_538e
/*0x5376*/      b jump_5382
            jump_5378:
/*0x5378*/      movs r1, #0x55
            jump_537a:
/*0x537a*/      adds r0, r0, #4
/*0x537c*/      bl mem_zero /* (dest, size) */
/*0x5380*/      b jump_538e
            jump_5382:
/*0x5382*/      movs r1, #0x24
/*0x5384*/      adds r0, r0, #4
/*0x5386*/      bl mem_zero /* (dest, size) */
/*0x538a*/      bl call_6c94
            jump_538e:
/*0x538e*/      ldr r1, [pc, #0x14] /* data_53a4 */
/*0x5390*/      movs r0, #1
/*0x5392*/      strb r0, [r1]
/*0x5394*/      pop {r4, pc}

/*0x5396*/  .byte 0x00
/*0x5397*/  .byte 0x00

            data_5398:
/*0x5398*/  .word 0x20000730
            data_539c:
/*0x539c*/  .word data_7a9b
            data_53a0:
/*0x53a0*/  .word 0x2000008c
            data_53a4:
/*0x53a4*/  .word 0x20000648


            .thumb_func
            call_53a8:
/*0x53a8*/      ldr r0, [pc, #0x20] /* data_53cc */
/*0x53aa*/      ldrb r0, [r0, #3]
/*0x53ac*/      cmp r0, #8
/*0x53ae*/      beq jump_53c6
/*0x53b0*/      bgt jump_53ba
/*0x53b2*/      cbz r0, jump_53c6
/*0x53b4*/      cmp r0, #1
/*0x53b6*/      bne jump_53c2
/*0x53b8*/      b jump_53c6
            jump_53ba:
/*0x53ba*/      cmp r0, #0xa
/*0x53bc*/      beq jump_53c6
/*0x53be*/      cmp r0, #0xc
/*0x53c0*/      beq jump_53c6
            jump_53c2:
/*0x53c2*/      movs r0, #0
/*0x53c4*/      bx lr
            jump_53c6:
/*0x53c6*/      movs r0, #1
/*0x53c8*/      bx lr

/*0x53ca*/  .byte 0x00
/*0x53cb*/  .byte 0x00

            data_53cc:
/*0x53cc*/  .word 0x20000730


            .thumb_func
            call_53d0:
/*0x53d0*/      push {r4, r5, r6, lr}
/*0x53d2*/      ldr r5, [pc, #0x10c] /* data_54e0 */
/*0x53d4*/      mov r4, r0
/*0x53d6*/      uxtb r1, r0
/*0x53d8*/      ldrb r0, [r5, #3]
/*0x53da*/      ldr r3, [pc, #0x108] /* data_54e4 */
/*0x53dc*/      adds r2, r0, #1
/*0x53de*/      uxtb r2, r2
/*0x53e0*/      cmp r1, #0x21
/*0x53e2*/      beq jump_546e
/*0x53e4*/      bgt jump_5400
/*0x53e6*/      cmp r1, #0x1e
/*0x53e8*/      beq jump_5430
/*0x53ea*/      bgt jump_53f6
/*0x53ec*/      cmp r1, #6
/*0x53ee*/      beq jump_5410
/*0x53f0*/      cmp r1, #0x19
/*0x53f2*/      bne jump_544e
/*0x53f4*/      b jump_5410
            jump_53f6:
/*0x53f6*/      cmp r1, #0x1f
/*0x53f8*/      beq jump_5430
/*0x53fa*/      cmp r1, #0x20
/*0x53fc*/      bne jump_544e
/*0x53fe*/      b jump_5430
            jump_5400:
/*0x5400*/      cmp r1, #0x22
/*0x5402*/      beq jump_5464
/*0x5404*/      cmp r1, #0x29
/*0x5406*/      beq jump_5430
/*0x5408*/      cmp r1, #0x36
/*0x540a*/      beq jump_5410
/*0x540c*/      cmp r1, #0x37
/*0x540e*/      bne jump_544e
            jump_5410:
/*0x5410*/      ldr r2, [pc, #0xd4] /* data_54e8 */
/*0x5412*/      ldrb r0, [r2, r0]
/*0x5414*/      cmp r0, #0xff
/*0x5416*/      beq jump_54d4
/*0x5418*/      ldr r0, [pc, #0xc8] /* data_54e4 */
/*0x541a*/      movs r2, #6
/*0x541c*/      cmp r1, #6
/*0x541e*/      ldr r0, [r0]
/*0x5420*/      beq jump_549a
/*0x5422*/      cmp r1, #0x19
/*0x5424*/      beq jump_548a
/*0x5426*/      cmp r1, #0x36
/*0x5428*/      beq jump_54ae
/*0x542a*/      cmp r1, #0x37
/*0x542c*/      bne jump_54d4
/*0x542e*/      b jump_54c6
            jump_5430:
/*0x5430*/      bl call_53a8
/*0x5434*/      cmp r0, #0
/*0x5436*/      beq jump_544e
/*0x5438*/      cmp r1, #0x1e
/*0x543a*/      beq jump_5450
/*0x543c*/      cmp r1, #0x1f
/*0x543e*/      beq jump_5450
/*0x5440*/      cmp r1, #0x20
/*0x5442*/      beq jump_5450
/*0x5444*/      cmp r1, #0x29
/*0x5446*/      bne jump_544e
/*0x5448*/      ldr r1, [pc, #0xa0] /* data_54ec */
/*0x544a*/      movs r0, #1
/*0x544c*/      strb r0, [r1, #2]
            jump_544e:
/*0x544e*/      pop {r4, r5, r6, pc}
            jump_5450:
/*0x5450*/      subs r1, #0x1e
/*0x5452*/      ldr r0, [r3]
/*0x5454*/      uxtb r1, r1
/*0x5456*/      adds r4, r0, r1
/*0x5458*/      movs r2, #1
/*0x545a*/      ldrb r0, [r4]
/*0x545c*/      bl call_51e4
/*0x5460*/      strb r0, [r4]
/*0x5462*/      b jump_54d4
            jump_5464:
/*0x5464*/      strb r2, [r5, #3]
/*0x5466*/      cmp r2, #3
/*0x5468*/      bls jump_547a
/*0x546a*/      movs r0, #0
/*0x546c*/      b jump_5478
            jump_546e:
/*0x546e*/      strb r2, [r5, #3]
/*0x5470*/      subs r2, r2, #7
/*0x5472*/      cmp r2, #7
/*0x5474*/      blo jump_547a
/*0x5476*/      movs r0, #7
            jump_5478:
/*0x5478*/      strb r0, [r5, #3]
            jump_547a:
/*0x547a*/      bl call_5310
/*0x547e*/      bl call_558c
/*0x5482*/      mov r0, r4
/*0x5484*/      bl call_54f0
/*0x5488*/      b jump_54d4
            jump_548a:
/*0x548a*/      ldrb r1, [r0, #3]
/*0x548c*/      cmp r1, #8
/*0x548e*/      bhs jump_54d4
/*0x5490*/      adds r1, r1, #1
/*0x5492*/      b jump_54a2
            jump_5494:
/*0x5494*/      bl call_6c94
/*0x5498*/      b jump_54d4
            jump_549a:
/*0x549a*/      ldrb r1, [r0, #3]
/*0x549c*/      cmp r1, #1
/*0x549e*/      bls jump_54d4
/*0x54a0*/      subs r1, r1, #1
            jump_54a2:
/*0x54a2*/      strb r1, [r0, #3]
/*0x54a4*/      ldrb r0, [r5, #3]
/*0x54a6*/      cmp.w r2, r0, lsr #1
/*0x54aa*/      beq jump_5494
/*0x54ac*/      b jump_54d4
            jump_54ae:
/*0x54ae*/      ldrb r1, [r0, #4]
/*0x54b0*/      and r2, r1, #0xf
/*0x54b4*/      cmp r2, #5
/*0x54b6*/      bhs jump_54d4
/*0x54b8*/      mov.w r2, #0x10000000
/*0x54bc*/      add.w r1, r2, r1, ror #4
/*0x54c0*/      ror.w r1, r1, #0x1c
/*0x54c4*/      b jump_54d2
            jump_54c6:
/*0x54c6*/      ldrb r1, [r0, #4]
/*0x54c8*/      lsls r2, r1, #0x1c
/*0x54ca*/      beq jump_54d4
/*0x54cc*/      subs r2, r1, #1
/*0x54ce*/      bfi r1, r2, #0, #4
            jump_54d2:
/*0x54d2*/      strb r1, [r0, #4]
            jump_54d4:
/*0x54d4*/      bl call_5598
/*0x54d8*/      pop.w {r4, r5, r6, lr}
/*0x54dc*/      b.w call_3bec

            data_54e0:
/*0x54e0*/  .word 0x20000730
            data_54e4:
/*0x54e4*/  .word 0x2000008c
            data_54e8:
/*0x54e8*/  .word data_7a9b
            data_54ec:
/*0x54ec*/  .word 0x20000648


            .thumb_func
            call_54f0:
/*0x54f0*/      push {r4, r5, r6, lr}
/*0x54f2*/      lsrs r1, r0, #0x18
/*0x54f4*/      lsls r1, r1, #0x1e
/*0x54f6*/      bpl jump_5542
/*0x54f8*/      ldr r1, [pc, #0x84] /* data_5580 */
/*0x54fa*/      ldrb r1, [r1, #3]
/*0x54fc*/      cmp r1, #7
/*0x54fe*/      bls jump_5542
/*0x5500*/      ldr r5, [pc, #0x80] /* data_5584 */
/*0x5502*/      and r2, r1, #1
/*0x5506*/      bic r3, r1, #1
/*0x550a*/      ldr r1, [r5]
/*0x550c*/      ubfx r0, r0, #0x10, #8
/*0x5510*/      cmp r3, #8
/*0x5512*/      beq jump_5544
/*0x5514*/      cmp r3, #0xa
/*0x5516*/      beq jump_5558
/*0x5518*/      cmp r3, #0xc
/*0x551a*/      bne jump_5542
/*0x551c*/      ldr r3, [pc, #0x68] /* data_5588 */
/*0x551e*/      ldrb r4, [r3, r0]
/*0x5520*/      cmp r4, #0xff
/*0x5522*/      beq jump_5542
/*0x5524*/      and r0, r4, #7
/*0x5528*/      add.w r0, r0, r0, lsl #2
/*0x552c*/      add r5, r0
/*0x552e*/      adds r5, #0xe
/*0x5530*/      cbz r2, jump_5534
/*0x5532*/      movs r1, #0
            jump_5534:
/*0x5534*/      mov r0, r5
/*0x5536*/      bl call_6e98
/*0x553a*/      lsrs r0, r4, #3
/*0x553c*/      strb r0, [r5, #3]
/*0x553e*/      movs r0, #1
/*0x5540*/      strb r0, [r5, #4]
            jump_5542:
/*0x5542*/      pop {r4, r5, r6, pc}
            jump_5544:
/*0x5544*/      cbz r2, jump_5548
/*0x5546*/      movs r1, #0
            jump_5548:
/*0x5548*/      add.w r0, r0, r0, lsl #1
/*0x554c*/      add r0, r5
/*0x554e*/      pop.w {r4, r5, r6, lr}
/*0x5552*/      adds r0, r0, #4
/*0x5554*/      b.w call_6e98
            jump_5558:
/*0x5558*/      ldr r3, [pc, #0x2c] /* data_5588 */
/*0x555a*/      subs r3, #0x48
/*0x555c*/      ldrb r0, [r3, r0]
/*0x555e*/      cmp r0, #0xff
/*0x5560*/      beq jump_5542
/*0x5562*/      cbz r2, jump_5566
/*0x5564*/      movs r1, #0
            jump_5566:
/*0x5566*/      add.w r0, r0, r0, lsl #1
/*0x556a*/      add.w r4, r5, r0, lsl #1
/*0x556e*/      adds r0, r4, #4
/*0x5570*/      bl call_6e98
/*0x5574*/      ldrh r0, [r4, #4]
/*0x5576*/      strh.w r0, [r4, #7]
/*0x557a*/      ldrb r0, [r4, #6]
/*0x557c*/      strb r0, [r4, #9]
/*0x557e*/      pop {r4, r5, r6, pc}

            data_5580:
/*0x5580*/  .word 0x20000730
            data_5584:
/*0x5584*/  .word 0x2000008c
            data_5588:
/*0x5588*/  .word data_7b63


            .thumb_func
            call_558c:
/*0x558c*/      movs r1, #0xd8
/*0x558e*/      ldr r0, [pc, #4] /* data_5594 */
/*0x5590*/      b.w mem_zero /* (dest, size) */

            data_5594:
/*0x5594*/  .word 0x2000032e


            .thumb_func
            call_5598:
/*0x5598*/      push {r4, lr}
/*0x559a*/      bl call_4644
/*0x559e*/      cmp r0, #6
/*0x55a0*/      bhs switch_55c8
/*0x55a2*/      tbb [pc, r0]

/*0x55a6*/  .byte 0x03 /* case switch_55ac */
/*0x55a7*/  .byte 0x06 /* case switch_55b2 */
/*0x55a8*/  .byte 0x09 /* case switch_55b8 */
/*0x55a9*/  .byte 0x0c /* case switch_55be */
/*0x55aa*/  .byte 0x11 /* case switch_55c8 */
/*0x55ab*/  .byte 0x0f /* case switch_55c4 */

            switch_55ac:
/*0x55ac*/      bl call_3d74
/*0x55b0*/      b switch_55c8
            switch_55b2:
/*0x55b2*/      bl call_3c04
/*0x55b6*/      b switch_55c8
            switch_55b8:
/*0x55b8*/      bl call_3aa8
/*0x55bc*/      b switch_55c8
            switch_55be:
/*0x55be*/      bl call_3d10
/*0x55c2*/      b switch_55c8
            switch_55c4:
/*0x55c4*/      bl call_3b24
            switch_55c8:
/*0x55c8*/      pop.w {r4, lr}
/*0x55cc*/      nop.w 
            jump_55d0:
/*0x55d0*/      push {r4, lr}
/*0x55d2*/      ldr r4, [pc, #0x1c] /* data_55f0 */
/*0x55d4*/      ldrb r0, [r4, #0xb]
/*0x55d6*/      cbnz r0, jump_55e8
/*0x55d8*/      ldr r0, [pc, #0x18] /* data_55f4 */
/*0x55da*/      ldrb r0, [r0]
/*0x55dc*/      lsls r0, r0, #0x1e
/*0x55de*/      asrs r0, r0, #8
/*0x55e0*/      lsrs r1, r0, #0x18
/*0x55e2*/      movs r0, #0x29
/*0x55e4*/      bl call_40d0
            jump_55e8:
/*0x55e8*/      movs r0, #1
/*0x55ea*/      strb r0, [r4, #1]
/*0x55ec*/      pop {r4, pc}

/*0x55ee*/  .byte 0x00
/*0x55ef*/  .byte 0x00

            data_55f0:
/*0x55f0*/  .word 0x20000648
            data_55f4:
/*0x55f4*/  .word 0x2000000c


            .thumb_func
            call_55f8:
/*0x55f8*/      push {r4, lr}
/*0x55fa*/      ldr r4, [pc, #0x68] /* data_5664 */
/*0x55fc*/      cbz r0, jump_5630
/*0x55fe*/      movs r1, #0
/*0x5600*/      mov r0, r4
/*0x5602*/      bl call_377e
/*0x5606*/      movs r1, #0
/*0x5608*/      mov r0, r4
/*0x560a*/      bl call_376a
/*0x560e*/      mov r0, r4
/*0x5610*/      bl bftm_clear /* (BFTM) */
/*0x5614*/      movs r0, #0x29
/*0x5616*/      bl call_574c
/*0x561a*/      bl call_5c20
/*0x561e*/      bl call_57e4
/*0x5622*/      movs r0, #1
/*0x5624*/      bl call_6108
/*0x5628*/      pop.w {r4, lr}
/*0x562c*/      b.w jump_62e8
            jump_5630:
/*0x5630*/      bl call_57e8
/*0x5634*/      movs r0, #0
/*0x5636*/      bl call_6108
/*0x563a*/      movs r1, #0
/*0x563c*/      mov r0, r4
/*0x563e*/      bl call_3796
/*0x5642*/      mov r0, r4
/*0x5644*/      bl bftm_clear /* (BFTM) */
/*0x5648*/      movs r1, #1
/*0x564a*/      mov r0, r4
/*0x564c*/      bl call_376a
/*0x5650*/      movs r1, #1
/*0x5652*/      mov r0, r4
/*0x5654*/      bl call_377e
/*0x5658*/      ldr r1, [pc, #0xc] /* data_5668 */
/*0x565a*/      mov.w r0, #0x200
/*0x565e*/      str.w r0, [r1, #0x100]
/*0x5662*/      pop {r4, pc}

            data_5664:
/*0x5664*/  .word 0x40076000
            data_5668:
/*0x5668*/  .word 0xe000e004


            .thumb_func
            call_566c:
/*0x566c*/      push {r4, lr}
/*0x566e*/      movs r4, #0
/*0x5670*/      cmp r0, #2
/*0x5672*/      beq jump_567c
/*0x5674*/      ldr r1, [pc, #0x24] /* data_569c */
/*0x5676*/      str r4, [r1, #0x40]
/*0x5678*/      str r4, [r1, #0x44]
/*0x567a*/      str r4, [r1, #0x48]
            jump_567c:
/*0x567c*/      cbz r0, jump_5696
/*0x567e*/      movs r0, #2
            jump_5680:
/*0x5680*/      bl call_4b18
/*0x5684*/      ldr r0, [pc, #0x14] /* data_569c */
/*0x5686*/      adds r0, #0x40
/*0x5688*/      strb r4, [r0, #4]
/*0x568a*/      bl call_5310
/*0x568e*/      pop.w {r4, lr}
/*0x5692*/      b.w call_5ab0
            jump_5696:
/*0x5696*/      movs r0, #1
/*0x5698*/      b jump_5680

/*0x569a*/  .byte 0x00
/*0x569b*/  .byte 0x00

            data_569c:
/*0x569c*/  .word 0x20000608


            .thumb_func
            call_56a0:
/*0x56a0*/      push {r4, lr}
/*0x56a2*/      movs r0, #0
/*0x56a4*/      mov.w r2, #0x10000
/*0x56a8*/      movs r3, #1
/*0x56aa*/      mov r1, r0
/*0x56ac*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x56b0*/      pop.w {r4, lr}
/*0x56b4*/      movw r1, #0x8c9f
/*0x56b8*/      ldr r0, [pc, #4] /* data_56c0 */
/*0x56ba*/      b.w call_3792

/*0x56be*/  .byte 0x00
/*0x56bf*/  .byte 0x00

            data_56c0:
/*0x56c0*/  .word 0x40076000


            .thumb_func
            call_56c4:
/*0x56c4*/      push {r4, lr}
/*0x56c6*/      mov.w r1, #0x3400
/*0x56ca*/      movs r0, #0
/*0x56cc*/      bl call_57b4
/*0x56d0*/      ldr r1, [pc, #0x70] /* data_5744 */
/*0x56d2*/      ldr r0, [r1]
/*0x56d4*/      movw r2, #0xf8ff
/*0x56d8*/      ands r0, r2
/*0x56da*/      ldr r2, [pc, #0x6c] /* data_5748 */
/*0x56dc*/      orr r0, r0, #0x300
/*0x56e0*/      orrs r0, r2
/*0x56e2*/      str r0, [r1]
/*0x56e4*/      movs r2, #0
/*0x56e6*/      mov r1, r2
/*0x56e8*/      movs r0, #3
/*0x56ea*/      bl call_5762
/*0x56ee*/      mov r1, r0
/*0x56f0*/      movs r0, #0x2b
/*0x56f2*/      bl call_5794
/*0x56f6*/      movs r2, #0
/*0x56f8*/      mov r1, r2
/*0x56fa*/      movs r0, #3
/*0x56fc*/      bl call_5762
/*0x5700*/      mov r1, r0
/*0x5702*/      movs r0, #0x2c
/*0x5704*/      bl call_5794
/*0x5708*/      movs r2, #0
/*0x570a*/      movs r1, #1
/*0x570c*/      movs r0, #3
/*0x570e*/      bl call_5762
/*0x5712*/      mov r1, r0
/*0x5714*/      movs r0, #0x2a
/*0x5716*/      bl call_5794
/*0x571a*/      movs r2, #0
/*0x571c*/      movs r1, #2
/*0x571e*/      movs r0, #3
/*0x5720*/      bl call_5762
/*0x5724*/      mov r1, r0
/*0x5726*/      movs r0, #0x29
/*0x5728*/      bl call_5794
/*0x572c*/      movs r2, #0
/*0x572e*/      movs r1, #2
/*0x5730*/      movs r0, #3
/*0x5732*/      bl call_5762
/*0x5736*/      mov r1, r0
/*0x5738*/      pop.w {r4, lr}
/*0x573c*/      movs r0, #0x35
/*0x573e*/      b.w call_5794

/*0x5742*/  .byte 0x00
/*0x5743*/  .byte 0x00

            data_5744:
/*0x5744*/  .word 0xe000ed0c
            data_5748:
/*0x5748*/  .word 0x05fa0000


            .thumb_func
            call_574c:
/*0x574c*/      and r2, r0, #0x1f
/*0x5750*/      movs r1, #1
/*0x5752*/      lsls r1, r2
/*0x5754*/      lsrs r0, r0, #5
/*0x5756*/      lsls r0, r0, #2
/*0x5758*/      add.w r0, r0, #-0x1fff2000
/*0x575c*/      str.w r1, [r0, #0x180]
/*0x5760*/      bx lr

            .thumb_func
            call_5762:
/*0x5762*/      push {r4, r5, lr}
/*0x5764*/      and r3, r0, #7
/*0x5768*/      rsb.w r4, r3, #7
/*0x576c*/      cmp r4, #4
/*0x576e*/      bls jump_5772
/*0x5770*/      movs r4, #4
            jump_5772:
/*0x5772*/      adds r0, r3, #4
/*0x5774*/      cmp r0, #7
/*0x5776*/      bhs jump_577c
/*0x5778*/      movs r3, #0
/*0x577a*/      b jump_577e
            jump_577c:
/*0x577c*/      subs r3, r3, #3
            jump_577e:
/*0x577e*/      movs r5, #1
/*0x5780*/      lsl.w r0, r5, r4
/*0x5784*/      subs r0, r0, #1
/*0x5786*/      ands r0, r1
/*0x5788*/      lsls r0, r3
/*0x578a*/      lsls r5, r3
/*0x578c*/      subs r5, r5, #1
/*0x578e*/      ands r5, r2
/*0x5790*/      orrs r0, r5
/*0x5792*/      pop {r4, r5, pc}

            .thumb_func
            call_5794:
/*0x5794*/      lsls r1, r1, #0x1c
/*0x5796*/      lsrs r1, r1, #0x18
/*0x5798*/      cmp r0, #0
/*0x579a*/      bge jump_57aa
/*0x579c*/      and r0, r0, #0xf
/*0x57a0*/      add.w r0, r0, #-0x1fff2000
/*0x57a4*/      strb.w r1, [r0, #0xd14]
/*0x57a8*/      bx lr
            jump_57aa:
/*0x57aa*/      add.w r0, r0, #-0x1fff2000
/*0x57ae*/      strb.w r1, [r0, #0x400]
/*0x57b2*/      bx lr

            .thumb_func
            call_57b4:
/*0x57b4*/      ldr r2, [pc, #8] /* data_57c0 */
/*0x57b6*/      ands r1, r2
/*0x57b8*/      orrs r1, r0
/*0x57ba*/      ldr r0, [pc, #8] /* data_57c4 */
/*0x57bc*/      str r1, [r0]
/*0x57be*/      bx lr

            data_57c0:
/*0x57c0*/  .word 0x1fffff80
            data_57c4:
/*0x57c4*/  .word 0xe000ed08


            .thumb_func
            call_57c8:
/*0x57c8*/      push {r4, lr}
/*0x57ca*/      bl call_4198
/*0x57ce*/      bl call_4114
/*0x57d2*/      cmp r0, #1
/*0x57d4*/      bne jump_57e0
/*0x57d6*/      movs r0, #2
/*0x57d8*/      bl call_6556
/*0x57dc*/      cmp r0, #1
/*0x57de*/      beq jump_57e2
            jump_57e0:
/*0x57e0*/      movs r0, #0
            jump_57e2:
/*0x57e2*/      pop {r4, pc}

            .thumb_func
            call_57e4:
/*0x57e4*/      b.w jump_41ec

            .thumb_func
            call_57e8:
/*0x57e8*/      b.w call_4234

            .thumb_func
            call_57ec:
/*0x57ec*/      push {r4, r5, r6, lr}
/*0x57ee*/      ldr r4, [pc, #0xa4] /* data_5894 */
/*0x57f0*/      movs r5, #0
/*0x57f2*/      ldrb r0, [r4, #6]
/*0x57f4*/      cmp r0, #1
/*0x57f6*/      beq jump_582a
/*0x57f8*/      cmp r0, #2
/*0x57fa*/      bne jump_5892
/*0x57fc*/      subs r1, r4, #4
/*0x57fe*/      ldrh r0, [r1]
/*0x5800*/      cbz r0, jump_587a
/*0x5802*/      ldr r2, [pc, #0x94] /* data_5898 */
/*0x5804*/      ldr r2, [r2]
/*0x5806*/      cmp r2, #0
/*0x5808*/      bne jump_5892
/*0x580a*/      cmp r0, #0xff
/*0x580c*/      bhi jump_5820
/*0x580e*/      ldr r2, [pc, #0x8c] /* data_589c */
/*0x5810*/      ldr r2, [r2]
/*0x5812*/      add.w r0, r2, r0, lsl #2
/*0x5816*/      movs r2, #7
/*0x5818*/      ldrb r0, [r0, #1]
/*0x581a*/      cmp.w r2, r0, lsr #5
/*0x581e*/      bne jump_5882
            jump_5820:
/*0x5820*/      ldrb r0, [r4, #8]
/*0x5822*/      cmp r0, #1
/*0x5824*/      beq jump_588a
/*0x5826*/      strh r5, [r1]
/*0x5828*/      b jump_5882
            jump_582a:
/*0x582a*/      ldr r0, [pc, #0x74] /* data_58a0 */
/*0x582c*/      ldrb r0, [r0, #3]
/*0x582e*/      lsls r0, r0, #0x1e
/*0x5830*/      bmi jump_5848
/*0x5832*/      ldrb r0, [r4, #7]
/*0x5834*/      cmp r0, #1
/*0x5836*/      bne jump_5848
/*0x5838*/      bl call_4aac
/*0x583c*/      cmp r0, #1
/*0x583e*/      bne jump_5848
/*0x5840*/      movs r0, #2
/*0x5842*/      strb r0, [r4, #7]
/*0x5844*/      ldr r0, [pc, #0x5c] /* data_58a4 */
/*0x5846*/      strh r5, [r0]
            jump_5848:
/*0x5848*/      ldrb r0, [r4, #7]
/*0x584a*/      cmp r0, #3
/*0x584c*/      beq jump_586a
/*0x584e*/      cmp r0, #6
/*0x5850*/      beq jump_585a
/*0x5852*/      cmp r0, #7
/*0x5854*/      beq jump_585a
/*0x5856*/      cmp r0, #8
/*0x5858*/      bne jump_5892
            jump_585a:
/*0x585a*/      bl call_4aac
/*0x585e*/      cmp r0, #1
/*0x5860*/      bne jump_5892
/*0x5862*/      pop.w {r4, r5, r6, lr}
/*0x5866*/      b.w jump_59d0
            jump_586a:
/*0x586a*/      bl call_4aac
/*0x586e*/      cmp r0, #1
/*0x5870*/      bne jump_5892
/*0x5872*/      pop.w {r4, r5, r6, lr}
/*0x5876*/      b.w jump_710c
            jump_587a:
/*0x587a*/      ldrb r0, [r1, #2]
/*0x587c*/      movs r1, #0
/*0x587e*/      bl call_3d90
            jump_5882:
/*0x5882*/      pop.w {r4, r5, r6, lr}
/*0x5886*/      b.w jump_6fe0
            jump_588a:
/*0x588a*/      pop.w {r4, r5, r6, lr}
/*0x588e*/      b.w call_5ab0
            jump_5892:
/*0x5892*/      pop {r4, r5, r6, pc}

            data_5894:
/*0x5894*/  .word 0x200019d0
            data_5898:
/*0x5898*/  .word 0x20000060
            data_589c:
/*0x589c*/  .word 0x20000058
            data_58a0:
/*0x58a0*/  .word 0x20000030
            data_58a4:
/*0x58a4*/  .word 0x2000001c


            .thumb_func
            call_58a8:
/*0x58a8*/      ldr r0, [pc, #0x28] /* data_58d4 */
/*0x58aa*/      push {r4, lr}
/*0x58ac*/      ldrb r0, [r0, #6]
/*0x58ae*/      cmp r0, #1
/*0x58b0*/      beq jump_58ce
/*0x58b2*/      ldr r0, [pc, #0x24] /* data_58d8 */
/*0x58b4*/      ldr r0, [r0]
/*0x58b6*/      bl call_4a1a
/*0x58ba*/      movs r1, #3
/*0x58bc*/      bl call_51fc
/*0x58c0*/      cmp r0, #0xff
/*0x58c2*/      beq jump_58ce
/*0x58c4*/      ldr r1, [pc, #0x10] /* data_58d8 */
/*0x58c6*/      bl call_4a10
/*0x58ca*/      movs r0, #1
/*0x58cc*/      pop {r4, pc}
            jump_58ce:
/*0x58ce*/      movs r0, #0
/*0x58d0*/      pop {r4, pc}

/*0x58d2*/  .byte 0x00
/*0x58d3*/  .byte 0x00

            data_58d4:
/*0x58d4*/  .word 0x200019d0
            data_58d8:
/*0x58d8*/  .word 0x20000030


            .thumb_func
            call_58dc:
/*0x58dc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x58e0*/      ldr r4, [pc, #0xdc] /* data_59c0 */
/*0x58e2*/      ldr r5, [pc, #0xe0] /* data_59c4 */
/*0x58e4*/      subs r6, r4, #4
/*0x58e6*/      ldrb r0, [r4, #6]
/*0x58e8*/      cbz r0, jump_58f4
/*0x58ea*/      cmp r0, #1
/*0x58ec*/      beq jump_5966
/*0x58ee*/      cmp r0, #2
/*0x58f0*/      bne jump_598a
/*0x58f2*/      b jump_5934
            jump_58f4:
/*0x58f4*/      bl call_6efc
/*0x58f8*/      mov r7, r0
/*0x58fa*/      cmp r0, #0x60
/*0x58fc*/      bhs jump_598a
/*0x58fe*/      ldrb r0, [r5, #3]
/*0x5900*/      lsls r0, r0, #0x1e
/*0x5902*/      bpl jump_59b6
/*0x5904*/      ldrb r0, [r4, #6]
/*0x5906*/      cbz r0, jump_590e
/*0x5908*/      movs r0, #0
/*0x590a*/      bl call_4678
            jump_590e:
/*0x590e*/      ldr r0, [r5]
/*0x5910*/      bl call_4a1a
/*0x5914*/      strh r0, [r4, #4]
/*0x5916*/      movs r0, #2
/*0x5918*/      strb r0, [r4, #6]
/*0x591a*/      ldr r0, [pc, #0xac] /* data_59c8 */
/*0x591c*/      add.w r0, r0, r7, lsl #1
/*0x5920*/      ldrb.w r0, [r0, #0x29]
/*0x5924*/      lsrs r0, r0, #5
/*0x5926*/      strb r0, [r4, #8]
/*0x5928*/      movs r0, #0
/*0x592a*/      strh r0, [r6]
/*0x592c*/      strb r7, [r6, #2]
/*0x592e*/      bl call_6f48
/*0x5932*/      b jump_59b6
            jump_5934:
/*0x5934*/      ldrb r0, [r5, #3]
/*0x5936*/      lsls r1, r0, #0x1e
/*0x5938*/      ldr r0, [pc, #0x88] /* data_59c4 */
/*0x593a*/      ldr r0, [r0]
/*0x593c*/      bpl jump_5954
/*0x593e*/      bl call_4a1a
/*0x5942*/      ldrh r1, [r4, #4]
/*0x5944*/      cmp r0, r1
/*0x5946*/      bne jump_58f4
/*0x5948*/      ldrb r0, [r4, #8]
/*0x594a*/      cmp r0, #3
/*0x594c*/      bne jump_58f4
            jump_594e:
/*0x594e*/      bl call_5ab0
/*0x5952*/      b jump_59b6
            jump_5954:
/*0x5954*/      bl call_4a1a
/*0x5958*/      ldrh r1, [r4, #4]
/*0x595a*/      cmp r0, r1
/*0x595c*/      bne jump_598a
/*0x595e*/      ldrb r0, [r4, #8]
/*0x5960*/      cmp r0, #2
/*0x5962*/      beq jump_594e
/*0x5964*/      b jump_59b6
            jump_5966:
/*0x5966*/      bl call_4ec8
/*0x596a*/      cbnz r0, jump_59b2
/*0x596c*/      ldrb r0, [r4, #7]
/*0x596e*/      cmp r0, #5
/*0x5970*/      beq jump_5990
/*0x5972*/      ldrb r1, [r5, #3]
/*0x5974*/      lsls r1, r1, #0x1e
/*0x5976*/      bpl jump_598a
/*0x5978*/      cmp r0, #1
/*0x597a*/      beq jump_59b6
/*0x597c*/      movs r7, #1
/*0x597e*/      cmp r0, #2
/*0x5980*/      beq jump_5998
/*0x5982*/      cmp r0, #3
/*0x5984*/      beq jump_59b4
/*0x5986*/      cmp r0, #4
/*0x5988*/      beq jump_59ba
            jump_598a:
/*0x598a*/      movs r0, #0
            jump_598c:
/*0x598c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5990:
/*0x5990*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5994*/      b.w jump_7098
            jump_5998:
/*0x5998*/      bl call_6f5c
/*0x599c*/      ldrb r0, [r6, #2]
/*0x599e*/      cmp r0, #0x60
/*0x59a0*/      beq jump_59b4
/*0x59a2*/      ldr r0, [r5]
/*0x59a4*/      bl call_4a1a
/*0x59a8*/      strh r0, [r4, #4]
/*0x59aa*/      movs r0, #3
/*0x59ac*/      strb r0, [r4, #7]
/*0x59ae*/      ldr r0, [pc, #0x1c] /* data_59cc */
/*0x59b0*/      strb r7, [r0]
            jump_59b2:
/*0x59b2*/      b jump_59b6
            jump_59b4:
/*0x59b4*/      strb r7, [r4, #7]
            jump_59b6:
/*0x59b6*/      movs r0, #1
/*0x59b8*/      b jump_598c
            jump_59ba:
/*0x59ba*/      movs r0, #5
/*0x59bc*/      strb r0, [r4, #7]
/*0x59be*/      b jump_5990

            data_59c0:
/*0x59c0*/  .word 0x200019d0
            data_59c4:
/*0x59c4*/  .word 0x20000030
            data_59c8:
/*0x59c8*/  .word 0x20000730
            data_59cc:
/*0x59cc*/  .word 0x20000648

            jump_59d0:
/*0x59d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x59d4*/      ldr r5, [pc, #0xb0] /* data_5a88 */
/*0x59d6*/      mov.w r8, #1
/*0x59da*/      ldrb r0, [r5, #7]
/*0x59dc*/      cmp r0, #8
/*0x59de*/      beq jump_5a74
/*0x59e0*/      subs r6, r5, #4
/*0x59e2*/      ldr r1, [pc, #0xa8] /* data_5a8c */
/*0x59e4*/      ldrb r0, [r6, #2]
/*0x59e6*/      ldr r7, [pc, #0xa8] /* data_5a90 */
/*0x59e8*/      add.w r4, r1, r0, lsl #1
/*0x59ec*/      mov r0, r5
/*0x59ee*/      ldrh r1, [r6]
/*0x59f0*/      ldrh r0, [r0, #4]
/*0x59f2*/      adds r4, #0x28
/*0x59f4*/      cmp r1, #2
/*0x59f6*/      bne jump_5a16
/*0x59f8*/      ldr r2, [r7]
/*0x59fa*/      ldrh r1, [r2]
/*0x59fc*/      ldrh r2, [r2, #4]
/*0x59fe*/      ubfx r1, r1, #0, #0xa
/*0x5a02*/      ubfx r2, r2, #0, #0xa
/*0x5a06*/      cmp r1, r2
/*0x5a08*/      bne jump_5a16
/*0x5a0a*/      bl call_51fc
/*0x5a0e*/      movw r0, #0xffff
/*0x5a12*/      strh r0, [r4]
/*0x5a14*/      b jump_5a5a
            jump_5a16:
/*0x5a16*/      movs r1, #0xff
/*0x5a18*/      bl call_51fc
/*0x5a1c*/      ldrb r0, [r5, #8]
/*0x5a1e*/      cmp r0, #1
/*0x5a20*/      beq jump_5a6c
/*0x5a22*/      bl call_6ed8
            jump_5a26:
/*0x5a26*/      ldrh r1, [r6]
/*0x5a28*/      ldr r2, [r7]
/*0x5a2a*/      add.w r1, r2, r1, lsl #2
/*0x5a2e*/      mov.w r2, #0x1c00
/*0x5a32*/      strh r0, [r1, #-0x2]
/*0x5a36*/      ldrb r1, [r5, #8]
/*0x5a38*/      ldrh r0, [r5, #4]
/*0x5a3a*/      orr.w r1, r2, r1, lsl #13
/*0x5a3e*/      orrs r0, r1
/*0x5a40*/      strh r0, [r4]
/*0x5a42*/      ldrh r0, [r6]
/*0x5a44*/      cmp r0, #0xff
/*0x5a46*/      bhi jump_5a52
/*0x5a48*/      ldr r2, [r7]
/*0x5a4a*/      mov.w r1, #0xfc00
/*0x5a4e*/      strh.w r1, [r2, r0, lsl #2]
            jump_5a52:
/*0x5a52*/      ldrb r0, [r6, #2]
/*0x5a54*/      movs r1, #1
/*0x5a56*/      bl call_3d90
            jump_5a5a:
/*0x5a5a*/      bl call_3bec
/*0x5a5e*/      ldrb r0, [r5, #7]
/*0x5a60*/      cmp r0, #7
/*0x5a62*/      beq jump_5a70
/*0x5a64*/      strb.w r8, [r5, #7]
            jump_5a68:
/*0x5a68*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5a6c:
/*0x5a6c*/      movs r0, #0
/*0x5a6e*/      b jump_5a26
            jump_5a70:
/*0x5a70*/      movs r0, #8
/*0x5a72*/      strb r0, [r5, #7]
            jump_5a74:
/*0x5a74*/      ldr r1, [pc, #0x1c] /* data_5a94 */
/*0x5a76*/      movs r0, #0
/*0x5a78*/      strb r0, [r5, #6]
/*0x5a7a*/      str r0, [r1]
/*0x5a7c*/      ldr r1, [pc, #0x18] /* data_5a98 */
/*0x5a7e*/      strb r0, [r5, #7]
/*0x5a80*/      strb.w r8, [r1]
/*0x5a84*/      b jump_5a68

/*0x5a86*/  .byte 0x00
/*0x5a87*/  .byte 0x00

            data_5a88:
/*0x5a88*/  .word 0x200019d0
            data_5a8c:
/*0x5a8c*/  .word 0x20000730
            data_5a90:
/*0x5a90*/  .word 0x20000058
            data_5a94:
/*0x5a94*/  .word 0x20000060
            data_5a98:
/*0x5a98*/  .word 0x20000648


            .thumb_func
            call_5a9c:
/*0x5a9c*/      ldr r0, [pc, #0xc] /* data_5aac */
/*0x5a9e*/      ldrb r1, [r0, #6]
/*0x5aa0*/      cmp r1, #0
/*0x5aa2*/      bne jump_5aaa
/*0x5aa4*/      movs r1, #1
/*0x5aa6*/      strb r1, [r0, #6]
/*0x5aa8*/      strb r1, [r0, #7]
            jump_5aaa:
/*0x5aaa*/      bx lr

            data_5aac:
/*0x5aac*/  .word 0x200019d0


            .thumb_func
            call_5ab0:
/*0x5ab0*/      push {r3, r4, r5, r6, r7, lr}
/*0x5ab2*/      ldr r6, [pc, #0x78] /* data_5b2c */
/*0x5ab4*/      movs r7, #0
/*0x5ab6*/      ldrb r0, [r6, #6]
/*0x5ab8*/      cmp r0, #2
/*0x5aba*/      bne jump_5b28
/*0x5abc*/      subs r5, r6, #4
/*0x5abe*/      ldrh r0, [r5]
/*0x5ac0*/      cbz r0, jump_5b28
/*0x5ac2*/      ldr r1, [pc, #0x6c] /* data_5b30 */
/*0x5ac4*/      str r7, [sp]
/*0x5ac6*/      ldr r1, [r1]
/*0x5ac8*/      add.w r4, r1, r0, lsl #2
/*0x5acc*/      ldrb.w r0, [sp, #3]
/*0x5ad0*/      orr r0, r0, #5
/*0x5ad4*/      strb.w r0, [sp, #3]
/*0x5ad8*/      b jump_5b1e
            jump_5ada:
/*0x5ada*/      ldrb r0, [r4, #1]
/*0x5adc*/      lsrs r0, r0, #5
/*0x5ade*/      cmp r0, #2
/*0x5ae0*/      beq jump_5ae8
/*0x5ae2*/      cmp r0, #7
/*0x5ae4*/      bne jump_5b16
/*0x5ae6*/      b jump_5b12
            jump_5ae8:
/*0x5ae8*/      ldrh r0, [r4]
/*0x5aea*/      mov r1, sp
/*0x5aec*/      bl call_4a10
/*0x5af0*/      ldrb.w r0, [sp, #1]
/*0x5af4*/      lsls r0, r0, #0x1f
/*0x5af6*/      ldrb.w r0, [sp]
/*0x5afa*/      beq jump_5b02
/*0x5afc*/      bl call_46d4
/*0x5b00*/      b jump_5b06
            jump_5b02:
/*0x5b02*/      ldr r1, [pc, #0x30] /* data_5b34 */
/*0x5b04*/      ldrb r0, [r1, r0]
            jump_5b06:
/*0x5b06*/      strb.w r0, [sp, #2]
/*0x5b0a*/      ldr r0, [sp]
/*0x5b0c*/      bl call_4780
/*0x5b10*/      b jump_5b16
            jump_5b12:
/*0x5b12*/      movs r0, #0xff
/*0x5b14*/      strh r0, [r5]
            jump_5b16:
/*0x5b16*/      ldrh r0, [r5]
/*0x5b18*/      adds r0, r0, #1
/*0x5b1a*/      strh r0, [r5]
/*0x5b1c*/      adds r4, r4, #4
            jump_5b1e:
/*0x5b1e*/      ldrh r0, [r5]
/*0x5b20*/      cmp r0, #0xff
/*0x5b22*/      bls jump_5ada
/*0x5b24*/      bl call_6f48
            jump_5b28:
/*0x5b28*/      strb r7, [r6, #6]
/*0x5b2a*/      pop {r3, r4, r5, r6, r7, pc}

            data_5b2c:
/*0x5b2c*/  .word 0x200019d0
            data_5b30:
/*0x5b30*/  .word 0x20000058
            data_5b34:
/*0x5b34*/  .word 0x200001c0


            .thumb_func
            call_5b38:
/*0x5b38*/      ldr r0, [pc, #0x3c] /* data_5b78 */
/*0x5b3a*/      push {r4, lr}
/*0x5b3c*/      ldr r0, [r0]
/*0x5b3e*/      bl call_4a1a
/*0x5b42*/      mov r4, r0
/*0x5b44*/      movs r1, #3
/*0x5b46*/      bl call_51fc
/*0x5b4a*/      cmp r0, #0xff
/*0x5b4c*/      beq jump_5b58
/*0x5b4e*/      movs r1, #0xff
/*0x5b50*/      mov r0, r4
/*0x5b52*/      bl call_51fc
/*0x5b56*/      b jump_5b6c
            jump_5b58:
/*0x5b58*/      bl call_6efc
/*0x5b5c*/      cmp r0, #0x60
/*0x5b5e*/      bhs jump_5b74
/*0x5b60*/      ldr r2, [pc, #0x18] /* data_5b7c */
/*0x5b62*/      movw r1, #0xffff
/*0x5b66*/      add.w r0, r2, r0, lsl #1
/*0x5b6a*/      strh r1, [r0, #0x28]
            jump_5b6c:
/*0x5b6c*/      bl call_3bec
/*0x5b70*/      movs r0, #1
/*0x5b72*/      pop {r4, pc}
            jump_5b74:
/*0x5b74*/      movs r0, #0
/*0x5b76*/      pop {r4, pc}

            data_5b78:
/*0x5b78*/  .word 0x20000030
            data_5b7c:
/*0x5b7c*/  .word 0x20000730


            .thumb_func
            call_5b80:
/*0x5b80*/      push {r3, r4, r5, lr}
/*0x5b82*/      ldr r4, [pc, #0x30] /* data_5bb4 */
/*0x5b84*/      movs r5, #0x48
/*0x5b86*/      b jump_5baa
            jump_5b88:
/*0x5b88*/      mov r1, sp
/*0x5b8a*/      mov r0, r5
/*0x5b8c*/      bl call_5bb8
/*0x5b90*/      ldrb.w r0, [sp, #2]
/*0x5b94*/      strb r0, [r4]
/*0x5b96*/      sub.w r0, r4, #0x48
/*0x5b9a*/      ldrb.w r1, [sp, #1]
/*0x5b9e*/      strb r1, [r0]
/*0x5ba0*/      subs r0, #0x48
/*0x5ba2*/      ldrb.w r1, [sp]
/*0x5ba6*/      strb r1, [r0]
/*0x5ba8*/      subs r4, r4, #1
            jump_5baa:
/*0x5baa*/      subs r5, r5, #1
/*0x5bac*/      uxtb r5, r5
/*0x5bae*/      bhs jump_5b88
/*0x5bb0*/      pop {r3, r4, r5, pc}

/*0x5bb2*/  .byte 0x00
/*0x5bb3*/  .byte 0x00

            data_5bb4:
/*0x5bb4*/  .word 0x20000405


            .thumb_func
            call_5bb8:
/*0x5bb8*/      ldr r2, [pc, #0x30] /* data_5bec */
/*0x5bba*/      movs r3, #0xd
/*0x5bbc*/      ldrb r0, [r2, r0]
/*0x5bbe*/      and r2, r0, #7
/*0x5bc2*/      lsrs r0, r0, #3
/*0x5bc4*/      rsb r0, r0, r0, lsl #8
/*0x5bc8*/      udiv r0, r0, r3
/*0x5bcc*/      uxtb r0, r0
/*0x5bce*/      strb r0, [r1]
/*0x5bd0*/      cmp r2, #4
/*0x5bd2*/      beq jump_5be6
/*0x5bd4*/      rsb.w r2, r2, #5
/*0x5bd8*/      movs r3, #0x2b
/*0x5bda*/      muls r2, r3, r2
/*0x5bdc*/      uxtb r3, r2
/*0x5bde*/      mov r2, r1
/*0x5be0*/      mov r1, r3
/*0x5be2*/      b.w call_3fe8
            jump_5be6:
/*0x5be6*/      strb r0, [r1, #1]
/*0x5be8*/      strb r0, [r1, #2]
/*0x5bea*/      bx lr

            data_5bec:
/*0x5bec*/  .word data_7b63


            .thumb_func
            call_5bf0:
/*0x5bf0*/      ldr r1, [pc, #4] /* data_5bf8 */
/*0x5bf2*/      strb r0, [r1]
/*0x5bf4*/      b.w jump_55d0

            data_5bf8:
/*0x5bf8*/  .word 0x2000000c


            .thumb_func
            call_5bfc:
/*0x5bfc*/      push {r4, lr}
/*0x5bfe*/      mov.w r2, #0x200
/*0x5c02*/      movs r1, #0
/*0x5c04*/      lsls r0, r2, #9
/*0x5c06*/      movs r3, #1
/*0x5c08*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x5c0c*/      movs r2, #1
/*0x5c0e*/      pop.w {r4, lr}
/*0x5c12*/      mov r1, r2
/*0x5c14*/      ldr r0, [pc, #4] /* data_5c1c */
/*0x5c16*/      b.w call_4568

/*0x5c1a*/  .byte 0x00
/*0x5c1b*/  .byte 0x00

            data_5c1c:
/*0x5c1c*/  .word 0x400b4000


            .thumb_func
            call_5c20:
/*0x5c20*/      movs r2, #0
/*0x5c22*/      mov r1, r2
/*0x5c24*/      movs r0, #2
/*0x5c26*/      b.w afio_pin_config /* (gpio_num, pin_num, af_num) */

            .thumb_func
            call_5c2a:
/*0x5c2a*/      movs r2, #4
/*0x5c2c*/      movs r1, #0
/*0x5c2e*/      movs r0, #2
/*0x5c30*/      b.w afio_pin_config /* (gpio_num, pin_num, af_num) */

            .thumb_func
            call_5c34:
/*0x5c34*/      push {r4, r5, r6, lr}
/*0x5c36*/      ldr r1, [pc, #0x34] /* data_5c6c */
/*0x5c38*/      ldr r4, [r1]
/*0x5c3a*/      ldr r5, [pc, #0x30] /* data_5c6c */
/*0x5c3c*/      adds r5, #0x48
/*0x5c3e*/      ldr r3, [r5]
/*0x5c40*/      movs r2, #1
/*0x5c42*/      str r2, [r1]
/*0x5c44*/      movs r2, #0
/*0x5c46*/      str r2, [r5]
/*0x5c48*/      ldr r6, [pc, #0x24] /* data_5c70 */
/*0x5c4a*/      str.w r2, [r6, #0x9c]
/*0x5c4e*/      str.w r2, [r6, #0x8c]
/*0x5c52*/      str r4, [r1]
/*0x5c54*/      ldr r1, [pc, #0x1c] /* data_5c74 */
/*0x5c56*/      ldr r2, [r1]
/*0x5c58*/      orr r2, r2, #4
/*0x5c5c*/      str r2, [r1]
/*0x5c5e*/      cbz r0, jump_5c66
/*0x5c60*/      wfi 
            jump_5c62:
/*0x5c62*/      str r3, [r5]
/*0x5c64*/      pop {r4, r5, r6, pc}
            jump_5c66:
/*0x5c66*/      wfe 
/*0x5c68*/      b jump_5c62

/*0x5c6a*/  .byte 0x00
/*0x5c6b*/  .byte 0x00

            data_5c6c:
/*0x5c6c*/  .word 0x43100618
            data_5c70:
/*0x5c70*/  .word 0x42d42000
            data_5c74:
/*0x5c74*/  .word 0xe000ed10

            jump_5c78:
/*0x5c78*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5c7c*/      ldr r4, [pc, #0x38] /* data_5cb8 */
/*0x5c7e*/      ldr r7, [r4]
/*0x5c80*/      ldr r5, [pc, #0x34] /* data_5cb8 */
/*0x5c82*/      adds r5, #0x48
/*0x5c84*/      ldr r6, [r5]
/*0x5c86*/      mov.w sb, #1
/*0x5c8a*/      str.w sb, [r4]
/*0x5c8e*/      mov.w r8, #0
/*0x5c92*/      str.w r8, [r5]
/*0x5c96*/      bl call_5ea8
/*0x5c9a*/      ldr r0, [pc, #0x20] /* data_5cbc */
/*0x5c9c*/      str.w r8, [r0, #0x9c]
/*0x5ca0*/      str.w sb, [r0, #0x8c]
/*0x5ca4*/      str r7, [r4]
/*0x5ca6*/      ldr r0, [pc, #0x18] /* data_5cc0 */
/*0x5ca8*/      ldr r1, [r0]
/*0x5caa*/      orr r1, r1, #4
/*0x5cae*/      str r1, [r0]
/*0x5cb0*/      wfe 
/*0x5cb2*/      str r6, [r5]
/*0x5cb4*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5cb8:
/*0x5cb8*/  .word 0x43100618
            data_5cbc:
/*0x5cbc*/  .word 0x42d42000
            data_5cc0:
/*0x5cc0*/  .word 0xe000ed10


            .thumb_func
            call_5cc4:
/*0x5cc4*/      ldr r1, [pc, #0x10] /* data_5cd8 */
/*0x5cc6*/      ldr r2, [r1]
/*0x5cc8*/      bic r2, r2, #4
/*0x5ccc*/      str r2, [r1]
/*0x5cce*/      cbz r0, jump_5cd4
/*0x5cd0*/      wfi 
/*0x5cd2*/      bx lr
            jump_5cd4:
/*0x5cd4*/      wfe 
/*0x5cd6*/      bx lr

            data_5cd8:
/*0x5cd8*/  .word 0xe000ed10


            .thumb_func
            call_5cdc:
/*0x5cdc*/      push {r4, r5, r6, lr}
/*0x5cde*/      ldr r6, [pc, #0xd4] /* data_5db4 */
/*0x5ce0*/      ldrb r0, [r6]
/*0x5ce2*/      cmp r0, #1
/*0x5ce4*/      bne jump_5da0
/*0x5ce6*/      ldr r5, [pc, #0xd0] /* data_5db8 */
/*0x5ce8*/      movs r4, #0
/*0x5cea*/      mov r0, r5
/*0x5cec*/      ldrb r2, [r5]
/*0x5cee*/      ldrb r0, [r0, #1]
/*0x5cf0*/      mov r1, r4
/*0x5cf2*/      cmp r2, #0x10
/*0x5cf4*/      beq jump_5d00
/*0x5cf6*/      cmp r2, #0x11
/*0x5cf8*/      beq jump_5d0a
/*0x5cfa*/      cmp r2, #0x12
/*0x5cfc*/      bne jump_5da2
/*0x5cfe*/      b jump_5d10
            jump_5d00:
/*0x5d00*/      cmp r0, #2
/*0x5d02*/      bne jump_5da2
/*0x5d04*/      str r1, [r5, #4]
/*0x5d06*/      movs r1, #4
/*0x5d08*/      b jump_5d84
            jump_5d0a:
/*0x5d0a*/      bl call_5dc0
/*0x5d0e*/      b jump_5d8c
            jump_5d10:
/*0x5d10*/      mov.w r3, #0x400
/*0x5d14*/      cmp r0, #0x20
/*0x5d16*/      blo jump_5d36
/*0x5d18*/      sub.w r2, r0, #0x1f
/*0x5d1c*/      rsb r2, r2, r2, lsl #4
/*0x5d20*/      cmp.w r3, r2, lsl #2
/*0x5d24*/      blt jump_5d36
/*0x5d26*/      rsb r0, r0, r0, lsl #4
/*0x5d2a*/      mov.w r1, #0x2880
/*0x5d2e*/      add.w r0, r1, r0, lsl #2
/*0x5d32*/      movs r1, #0x3c
/*0x5d34*/      b jump_5d86
            jump_5d36:
/*0x5d36*/      cbz r0, jump_5d42
/*0x5d38*/      cmp r0, #1
/*0x5d3a*/      beq jump_5d78
/*0x5d3c*/      cmp r0, #2
/*0x5d3e*/      bne jump_5da2
/*0x5d40*/      b jump_5d80
            jump_5d42:
/*0x5d42*/      ldrb.w r0, [r1, #0x10f]
/*0x5d46*/      cmp r0, #0xaa
/*0x5d48*/      beq jump_5d6e
/*0x5d4a*/      ldrb r2, [r3]
/*0x5d4c*/      mov r0, r3
/*0x5d4e*/      cmp r2, #4
/*0x5d50*/      beq jump_5d74
/*0x5d52*/      movs r2, #0x20
/*0x5d54*/      mov r1, r3
/*0x5d56*/      adds r0, r5, #4
/*0x5d58*/      bl memcpy /* (dest, src, size) */
/*0x5d5c*/      ldr r0, [pc, #0x5c] /* data_5dbc */
/*0x5d5e*/      ldr.w r1, [r0, #0x180]
/*0x5d62*/      str r1, [r5, #0x24]
/*0x5d64*/      ldr.w r0, [r0, #0x18c]
/*0x5d68*/      movs r1, #0x28
/*0x5d6a*/      str r0, [r5, #0x28]
/*0x5d6c*/      b jump_5d84
            jump_5d6e:
/*0x5d6e*/      movs r1, #0x10
/*0x5d70*/      lsls r0, r1, #4
/*0x5d72*/      b jump_5d86
            jump_5d74:
/*0x5d74*/      movs r1, #0x34
/*0x5d76*/      b jump_5d86
            jump_5d78:
/*0x5d78*/      movs r1, #4
/*0x5d7a*/      mov.w r0, #0x3c00
/*0x5d7e*/      b jump_5d86
            jump_5d80:
/*0x5d80*/      movs r1, #1
/*0x5d82*/      strb r1, [r5, #4]
            jump_5d84:
/*0x5d84*/      adds r0, r5, #4
            jump_5d86:
/*0x5d86*/      bl call_5e44
/*0x5d8a*/      movs r4, #1
            jump_5d8c:
/*0x5d8c*/      ldrb r0, [r6]
/*0x5d8e*/      cmp r0, #1
/*0x5d90*/      bne jump_5da0
/*0x5d92*/      cbz r4, jump_5da2
/*0x5d94*/      movs r1, #0x3c
/*0x5d96*/      adds r0, r5, #4
            jump_5d98:
/*0x5d98*/      bl mem_zero /* (dest, size) */
/*0x5d9c*/      movs r0, #2
/*0x5d9e*/      strb r0, [r6]
            jump_5da0:
/*0x5da0*/      pop {r4, r5, r6, pc}
            jump_5da2:
/*0x5da2*/      ldr r0, [r5]
/*0x5da4*/      str r0, [r5, #4]
/*0x5da6*/      movw r0, #0xaaff
/*0x5daa*/      str r0, [r5]
/*0x5dac*/      ldr r0, [pc, #8] /* data_5db8 */
/*0x5dae*/      movs r1, #0x38
/*0x5db0*/      adds r0, #8
/*0x5db2*/      b jump_5d98

            data_5db4:
/*0x5db4*/  .word 0x20000028
            data_5db8:
/*0x5db8*/  .word 0x20000608
            data_5dbc:
/*0x5dbc*/  .word 0x40080000


            .thumb_func
            call_5dc0:
/*0x5dc0*/      push {r4, lr}
/*0x5dc2*/      ldr r1, [pc, #0x6c] /* data_5e30 */
/*0x5dc4*/      cbz r0, jump_5de2
/*0x5dc6*/      cmp r0, #1
/*0x5dc8*/      beq jump_5de6
/*0x5dca*/      cmp r0, #2
/*0x5dcc*/      bne jump_5e2e
/*0x5dce*/      movs r0, #0x35
/*0x5dd0*/      bl call_574c
/*0x5dd4*/      movs r0, #0
/*0x5dd6*/      bl call_6884
/*0x5dda*/      pop.w {r4, lr}
/*0x5dde*/      b.w jump_5c78
            jump_5de2:
/*0x5de2*/      ldr r0, [pc, #0x50] /* data_5e34 */
/*0x5de4*/      b jump_5dea
            jump_5de6:
/*0x5de6*/      ldr r0, [pc, #0x4c] /* data_5e34 */
/*0x5de8*/      subs r0, r0, #5
            jump_5dea:
/*0x5dea*/      str r0, [r1]
/*0x5dec*/      movs r1, #0
/*0x5dee*/      mov.w r0, #0x10000
/*0x5df2*/      movs r3, #1
/*0x5df4*/      mov r2, r1
/*0x5df6*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x5dfa*/      ldr r1, [pc, #0x3c] /* data_5e38 */
/*0x5dfc*/      mov.w r0, #0x200
/*0x5e00*/      str r0, [r1, #0x24]
/*0x5e02*/      movs r0, #0x35
/*0x5e04*/      bl call_574c
/*0x5e08*/      movs r0, #0
/*0x5e0a*/      bl call_6884
/*0x5e0e*/      movw r0, #0x4e20
/*0x5e12*/      bl spin_wait /* (time) */
/*0x5e16*/      dsb sy
/*0x5e1a*/      ldr r0, [pc, #0x20] /* data_5e3c */
/*0x5e1c*/      ldr r1, [r0]
/*0x5e1e*/      ldr r2, [pc, #0x20] /* data_5e40 */
/*0x5e20*/      and r1, r1, #0x700
/*0x5e24*/      orrs r1, r2
/*0x5e26*/      str r1, [r0]
/*0x5e28*/      dsb sy
            jump_5e2c:
/*0x5e2c*/      b jump_5e2c
            jump_5e2e:
/*0x5e2e*/      pop {r4, pc}

            data_5e30:
/*0x5e30*/  .word 0x20003ffc
            data_5e34:
/*0x5e34*/  .word 0x55aafaf5
            data_5e38:
/*0x5e38*/  .word 0x400b0000
            data_5e3c:
/*0x5e3c*/  .word 0xe000ed0c
            data_5e40:
/*0x5e40*/  .word 0x05fa0004


            .thumb_func
            call_5e44:
/*0x5e44*/      push {r4, r5, r6, lr}
/*0x5e46*/      mov r4, r1
/*0x5e48*/      ldr r2, [pc, #0x24] /* data_5e70 */
/*0x5e4a*/      mov r1, r0
/*0x5e4c*/      movs r0, #2
/*0x5e4e*/      strb r0, [r2]
/*0x5e50*/      ldr r0, [pc, #0x20] /* data_5e74 */
/*0x5e52*/      subs r5, r0, #4
/*0x5e54*/      cmp r1, r0
/*0x5e56*/      beq jump_5e60
/*0x5e58*/      mov r2, r4
/*0x5e5a*/      adds r0, r5, #4
/*0x5e5c*/      bl memcpy /* (dest, src, size) */
            jump_5e60:
/*0x5e60*/      adds r0, r5, r4
/*0x5e62*/      rsb.w r1, r4, #0x3c
/*0x5e66*/      pop.w {r4, r5, r6, lr}
/*0x5e6a*/      adds r0, r0, #4
/*0x5e6c*/      b.w mem_zero /* (dest, size) */

            data_5e70:
/*0x5e70*/  .word 0x20000028
            data_5e74:
/*0x5e74*/  .word 0x2000060c

            jump_5e78:
/*0x5e78*/      push {r4, r5, r6, r7, lr}
/*0x5e7a*/      ldr r7, [pc, #0x28] /* data_5ea4 */
/*0x5e7c*/      ldr.w r4, [r7, #0x104]
/*0x5e80*/      ldr.w r5, [r7, #0x108]
/*0x5e84*/      ldr.w r6, [r7, #0x10c]
/*0x5e88*/      bics r4, r0
/*0x5e8a*/      bics r5, r1
/*0x5e8c*/      bics r6, r2
/*0x5e8e*/      cbz r3, jump_5e96
/*0x5e90*/      orrs r4, r0
/*0x5e92*/      orrs r5, r1
/*0x5e94*/      orrs r6, r2
            jump_5e96:
/*0x5e96*/      str.w r4, [r7, #0x104]
/*0x5e9a*/      str.w r5, [r7, #0x108]
/*0x5e9e*/      str.w r6, [r7, #0x10c]
/*0x5ea2*/      pop {r4, r5, r6, r7, pc}

            data_5ea4:
/*0x5ea4*/  .word 0x40088000


            .thumb_func
            call_5ea8:
/*0x5ea8*/      ldr r2, [pc, #0x1c] /* data_5ec8 */
/*0x5eaa*/      movs r1, #0
/*0x5eac*/      mov.w r0, #0x1c20
/*0x5eb0*/      str.w r1, [r2, #0x108]
            jump_5eb4:
/*0x5eb4*/      subs r0, r0, #1
/*0x5eb6*/      bhs jump_5eb4
/*0x5eb8*/      movs r0, #1
/*0x5eba*/      str.w r0, [r2, #0x108]
/*0x5ebe*/      ldr r0, [pc, #0xc] /* data_5ecc */
            jump_5ec0:
/*0x5ec0*/      ldr r1, [r0, #8]
/*0x5ec2*/      lsls r1, r1, #0x1a
/*0x5ec4*/      bpl jump_5ec0
/*0x5ec6*/      bx lr

            data_5ec8:
/*0x5ec8*/  .word 0x42d40000
            data_5ecc:
/*0x5ecc*/  .word 0x40088000


            .thumb_func
            call_5ed0:
/*0x5ed0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5ed4*/      movs r7, #0xa
/*0x5ed6*/      ldr r5, [pc, #0x68] /* data_5f40 */
/*0x5ed8*/      b jump_5f36
            jump_5eda:
/*0x5eda*/      ldr r1, [pc, #0x68] /* data_5f44 */
/*0x5edc*/      add.w r0, r7, r7, lsl #1
/*0x5ee0*/      add r0, r1
/*0x5ee2*/      ldrb r1, [r5, #-0x1]!
/*0x5ee6*/      ldrb r0, [r0, #2]
/*0x5ee8*/      eors r0, r1
/*0x5eea*/      movs.w r8, r0
/*0x5eee*/      beq jump_5f36
/*0x5ef0*/      movs r4, #0x80
/*0x5ef2*/      movs r6, #8
/*0x5ef4*/      b jump_5f30
            jump_5ef6:
/*0x5ef6*/      tst.w r8, r4
/*0x5efa*/      beq jump_5f2e
/*0x5efc*/      ldrb r0, [r5]
/*0x5efe*/      eors r0, r4
/*0x5f00*/      strb r0, [r5]
/*0x5f02*/      tst r0, r4
/*0x5f04*/      bne jump_5f0a
/*0x5f06*/      movs r0, #1
/*0x5f08*/      b jump_5f0c
            jump_5f0a:
/*0x5f0a*/      movs r0, #0
            jump_5f0c:
/*0x5f0c*/      mov sb, r0
/*0x5f0e*/      add.w r0, r6, r7, lsl #3
/*0x5f12*/      uxtb r0, r0
/*0x5f14*/      mov r1, sb
/*0x5f16*/      bl call_4878
/*0x5f1a*/      cbnz r0, jump_5f22
/*0x5f1c*/      ldrb r0, [r5]
/*0x5f1e*/      eors r0, r4
/*0x5f20*/      strb r0, [r5]
            jump_5f22:
/*0x5f22*/      movs.w r0, sb
/*0x5f26*/      beq jump_5f2a
/*0x5f28*/      movs r0, #1
            jump_5f2a:
/*0x5f2a*/      ldr r1, [pc, #0x1c] /* data_5f48 */
/*0x5f2c*/      strh r0, [r1, #2]
            jump_5f2e:
/*0x5f2e*/      lsrs r4, r4, #1
            jump_5f30:
/*0x5f30*/      subs r6, r6, #1
/*0x5f32*/      uxtb r6, r6
/*0x5f34*/      bhs jump_5ef6
            jump_5f36:
/*0x5f36*/      subs r7, r7, #1
/*0x5f38*/      uxtb r7, r7
/*0x5f3a*/      bhs jump_5eda
/*0x5f3c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5f40:
/*0x5f40*/  .word 0x200001b6
            data_5f44:
/*0x5f44*/  .word 0x20000310
            data_5f48:
/*0x5f48*/  .word 0x2000001a


            .thumb_func
            call_5f4c:
/*0x5f4c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5f50*/      mov r6, r0
/*0x5f52*/      movs r4, #2
/*0x5f54*/      ldr r5, [pc, #0x58] /* data_5fb0 */
/*0x5f56*/      mov.w r7, #0x1f4
            jump_5f5a:
/*0x5f5a*/      bl call_712c
/*0x5f5e*/      movs r0, #0xa
/*0x5f60*/      b jump_5f6a
            jump_5f62:
/*0x5f62*/      add.w r1, r0, r0, lsl #1
/*0x5f66*/      ldrb r1, [r5, r1]
/*0x5f68*/      cbnz r1, jump_5f70
            jump_5f6a:
/*0x5f6a*/      subs r0, r0, #1
/*0x5f6c*/      uxtb r0, r0
/*0x5f6e*/      bhs jump_5f62
            jump_5f70:
/*0x5f70*/      cmp r0, #0xff
/*0x5f72*/      beq jump_5f84
/*0x5f74*/      cmp r4, #0
/*0x5f76*/      bne jump_5f5a
            jump_5f78:
/*0x5f78*/      cmp r6, #0
/*0x5f7a*/      beq jump_5fac
/*0x5f7c*/      ldr r2, [pc, #0x34] /* data_5fb4 */
/*0x5f7e*/      ldr r1, [pc, #0x30] /* data_5fb0 */
/*0x5f80*/      movs r0, #0xa
/*0x5f82*/      b jump_5f9c
            jump_5f84:
/*0x5f84*/      subs r4, r4, #1
/*0x5f86*/      ands r4, r4, #0xff
/*0x5f8a*/      beq jump_5f78
/*0x5f8c*/      mov r0, r7
/*0x5f8e*/      bl spin_wait /* (time) */
/*0x5f92*/      b jump_5f5a
            jump_5f94:
/*0x5f94*/      ldrb r3, [r1, #2]
/*0x5f96*/      strb r3, [r2], #1
/*0x5f9a*/      adds r1, r1, #3
            jump_5f9c:
/*0x5f9c*/      subs r0, r0, #1
/*0x5f9e*/      uxtb r0, r0
/*0x5fa0*/      bhs jump_5f94
/*0x5fa2*/      ldr r0, [pc, #0x10] /* data_5fb4 */
/*0x5fa4*/      ldrb r1, [r0, #9]
/*0x5fa6*/      orr r1, r1, #0xf
/*0x5faa*/      strb r1, [r0, #9]
            jump_5fac:
/*0x5fac*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5fb0:
/*0x5fb0*/  .word 0x20000310
            data_5fb4:
/*0x5fb4*/  .word 0x200001ac


            .thumb_func
            call_5fb8:
/*0x5fb8*/      ldr r1, [pc, #0x10] /* data_5fcc */
/*0x5fba*/      ldrb r0, [r1]
/*0x5fbc*/      adds r0, r0, #1
/*0x5fbe*/      strb r0, [r1]
/*0x5fc0*/      lsls r0, r0, #0x1e
/*0x5fc2*/      bne jump_5fc8
/*0x5fc4*/      b.w call_712c
            jump_5fc8:
/*0x5fc8*/      bx lr

/*0x5fca*/  .byte 0x00
/*0x5fcb*/  .byte 0x00

            data_5fcc:
/*0x5fcc*/  .word 0x2000001a


            .thumb_func
            call_5fd0:
/*0x5fd0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5fd4*/      movs r6, #0
/*0x5fd6*/      mov r1, r6
/*0x5fd8*/      mov.w r0, #0xf0000
/*0x5fdc*/      movs r3, #1
/*0x5fde*/      mov r2, r6
/*0x5fe0*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x5fe4*/      movs r4, #8
/*0x5fe6*/      b jump_6018
            jump_5fe8:
/*0x5fe8*/      ldr r0, [pc, #0x94] /* data_6080 */
/*0x5fea*/      movs r2, #0
/*0x5fec*/      add.w r1, r0, r4, lsl #3
/*0x5ff0*/      ldrh r5, [r1, #4]
/*0x5ff2*/      ldr r0, [r1]
/*0x5ff4*/      uxth r1, r5
/*0x5ff6*/      mov r7, r0
/*0x5ff8*/      bl call_4578
/*0x5ffc*/      uxth r1, r5
/*0x5ffe*/      mov r0, r7
/*0x6000*/      movs r2, #1
/*0x6002*/      bl call_4558
/*0x6006*/      ldr r0, [pc, #0x78] /* data_6080 */
/*0x6008*/      adds r0, #0x40
/*0x600a*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x600e*/      add.w r0, r0, r4, lsl #1
/*0x6012*/      ldrb r0, [r0, #1]
/*0x6014*/      bl afio_exti_ssr_write
            jump_6018:
/*0x6018*/      subs r4, r4, #1
/*0x601a*/      uxtb r4, r4
/*0x601c*/      bhs jump_5fe8
/*0x601e*/      movs r4, #0xa
/*0x6020*/      b jump_604a
            jump_6022:
/*0x6022*/      ldr r0, [pc, #0x5c] /* data_6080 */
/*0x6024*/      adds r0, #0x50
/*0x6026*/      add.w r1, r0, r4, lsl #3
/*0x602a*/      ldrh r5, [r1, #4]
/*0x602c*/      ldr r7, [r1]
/*0x602e*/      uxth r1, r5
/*0x6030*/      mov r0, r7
/*0x6032*/      bl call_45a0
/*0x6036*/      uxth r1, r5
/*0x6038*/      mov r0, r7
/*0x603a*/      movs r2, #0
/*0x603c*/      bl call_4568
/*0x6040*/      uxth r1, r5
/*0x6042*/      mov r0, r7
/*0x6044*/      movs r2, #1
/*0x6046*/      bl call_4538
            jump_604a:
/*0x604a*/      subs r4, r4, #1
/*0x604c*/      uxtb r4, r4
/*0x604e*/      bhs jump_6022
/*0x6050*/      movs r2, #0xff
/*0x6052*/      movs r1, #0xa
/*0x6054*/      ldr r0, [pc, #0x2c] /* data_6084 */
/*0x6056*/      bl mem_set /* (dest, size, val) */
/*0x605a*/      movs r0, #0
/*0x605c*/      bl call_60bc
/*0x6060*/      movs r1, #0xa
/*0x6062*/      ldr r0, [pc, #0x24] /* data_6088 */
/*0x6064*/      movs r2, #0xff
/*0x6066*/      b jump_6074
            jump_6068:
/*0x6068*/      strb r6, [r0], #1
/*0x606c*/      strb r2, [r0], #1
/*0x6070*/      strb r2, [r0], #1
            jump_6074:
/*0x6074*/      subs r1, r1, #1
/*0x6076*/      uxtb r1, r1
/*0x6078*/      bhs jump_6068
/*0x607a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x607e*/  .byte 0x00
/*0x607f*/  .byte 0x00

            data_6080:
/*0x6080*/  .word gpio_map_1
            data_6084:
/*0x6084*/  .word 0x200001ac
            data_6088:
/*0x6088*/  .word 0x20000310


            .thumb_func
            call_608c:
/*0x608c*/      ldr r1, [pc, #0x28] /* data_60b8 */
/*0x608e*/      push {r4, lr}
/*0x6090*/      add.w r0, r1, #0x164
/*0x6094*/      movs r2, #0xa
/*0x6096*/      b jump_60ac
            jump_6098:
/*0x6098*/      ldrb r3, [r0]
/*0x609a*/      cbnz r3, jump_60a4
/*0x609c*/      ldrb r3, [r0, #2]
/*0x609e*/      ldrb r4, [r1]
/*0x60a0*/      cmp r3, r4
/*0x60a2*/      beq jump_60a8
            jump_60a4:
/*0x60a4*/      movs r0, #0
/*0x60a6*/      pop {r4, pc}
            jump_60a8:
/*0x60a8*/      adds r0, r0, #3
/*0x60aa*/      adds r1, r1, #1
            jump_60ac:
/*0x60ac*/      subs r2, r2, #1
/*0x60ae*/      uxtb r2, r2
/*0x60b0*/      bhs jump_6098
/*0x60b2*/      movs r0, #1
/*0x60b4*/      pop {r4, pc}

/*0x60b6*/  .byte 0x00
/*0x60b7*/  .byte 0x00

            data_60b8:
/*0x60b8*/  .word 0x200001ac


            .thumb_func
            call_60bc:
/*0x60bc*/      push {r4, lr}
/*0x60be*/      mov r4, r0
/*0x60c0*/      movs r2, #0x50
/*0x60c2*/      ldr r1, [pc, #0x38] /* data_60fc */
/*0x60c4*/      ldr r0, [pc, #0x38] /* data_6100 */
/*0x60c6*/      bl memcpy /* (dest, src, size) */
/*0x60ca*/      cbz r4, jump_60ea
/*0x60cc*/      bl call_6174
/*0x60d0*/      cmp r4, #1
/*0x60d2*/      beq jump_60da
/*0x60d4*/      cmp r4, #2
/*0x60d6*/      bne jump_60ea
/*0x60d8*/      b jump_60e2
            jump_60da:
/*0x60da*/      ldr r1, [pc, #0x20] /* data_60fc */
/*0x60dc*/      adds r1, #0xf0
/*0x60de*/      movs r0, #0x22
/*0x60e0*/      b jump_60e6
            jump_60e2:
/*0x60e2*/      ldr r1, [pc, #0x20] /* data_6104 */
/*0x60e4*/      movs r0, #0x11
            jump_60e6:
/*0x60e6*/      bl call_61a0
            jump_60ea:
/*0x60ea*/      bl call_6174
/*0x60ee*/      bl call_5288
/*0x60f2*/      pop.w {r4, lr}
/*0x60f6*/      b.w call_6174

/*0x60fa*/  .byte 0x00
/*0x60fb*/  .byte 0x00

            data_60fc:
/*0x60fc*/  .word data_7bb8
            data_6100:
/*0x6100*/  .word 0x200002c0
            data_6104:
/*0x6104*/  .word data_7cec


            .thumb_func
            call_6108:
/*0x6108*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x610c*/      movs r7, r0
/*0x610e*/      mov.w r4, #0xa
/*0x6112*/      beq jump_611c
/*0x6114*/      movs r0, #0
            jump_6116:
/*0x6116*/      mov r8, r0
/*0x6118*/      ldr r5, [pc, #0x50] /* data_616c */
/*0x611a*/      b jump_6140
            jump_611c:
/*0x611c*/      movs r0, #1
/*0x611e*/      b jump_6116
            jump_6120:
/*0x6120*/      add.w r6, r5, r4, lsl #3
/*0x6124*/      mov r2, r8
/*0x6126*/      ldrh r0, [r6, #4]
/*0x6128*/      uxth r1, r0
/*0x612a*/      ldr.w r0, [r5, r4, lsl #3]
/*0x612e*/      bl call_45a4
/*0x6132*/      ldrh r0, [r6, #4]
/*0x6134*/      movs r2, #1
/*0x6136*/      uxth r1, r0
/*0x6138*/      ldr.w r0, [r5, r4, lsl #3]
/*0x613c*/      bl call_4538
            jump_6140:
/*0x6140*/      subs r4, r4, #1
/*0x6142*/      uxtb r4, r4
/*0x6144*/      bhs jump_6120
/*0x6146*/      cbz r7, jump_615a
/*0x6148*/      movs r2, #0
            jump_614a:
/*0x614a*/      ldr r4, [pc, #0x24] /* data_6170 */
/*0x614c*/      movs r1, #0x10
/*0x614e*/      mov r0, r4
/*0x6150*/      bl call_4568
/*0x6154*/      cbz r7, jump_615e
/*0x6156*/      movs r2, #1
/*0x6158*/      b jump_6160
            jump_615a:
/*0x615a*/      movs r2, #1
/*0x615c*/      b jump_614a
            jump_615e:
/*0x615e*/      movs r2, #0
            jump_6160:
/*0x6160*/      mov r0, r4
/*0x6162*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6166*/      movs r1, #0x10
/*0x6168*/      b.w call_45a4

            data_616c:
/*0x616c*/  .word gpio_map_2
            data_6170:
/*0x6170*/  .word 0x400b0000


            .thumb_func
            call_6174:
/*0x6174*/      push {r4, lr}
/*0x6176*/      ldr r4, [pc, #0x24] /* data_619c */
/*0x6178*/      movs r2, #0xff
/*0x617a*/      adds r1, r2, #1
/*0x617c*/      subw r0, r4, #0x14f
/*0x6180*/      bl mem_set /* (dest, size, val) */
/*0x6184*/      movs r0, #0x50
/*0x6186*/      subw r1, r4, #0x14f
/*0x618a*/      b jump_6192
            jump_618c:
/*0x618c*/      ldrb r2, [r4], #-1
/*0x6190*/      strb r0, [r1, r2]
            jump_6192:
/*0x6192*/      subs r0, r0, #1
/*0x6194*/      uxtb r0, r0
/*0x6196*/      bhs jump_618c
/*0x6198*/      pop {r4, pc}

/*0x619a*/  .byte 0x00
/*0x619b*/  .byte 0x00

            data_619c:
/*0x619c*/  .word 0x2000030f


            .thumb_func
            call_61a0:
/*0x61a0*/      push {r4, r5, lr}
/*0x61a2*/      ldr r3, [pc, #0x18] /* data_61bc */
/*0x61a4*/      sub.w r4, r3, #0x100
/*0x61a8*/      b jump_61b4
            jump_61aa:
/*0x61aa*/      ldrb r2, [r1, #1]
/*0x61ac*/      ldrb r5, [r1], #2
/*0x61b0*/      ldrb r5, [r4, r5]
/*0x61b2*/      strb r2, [r3, r5]
            jump_61b4:
/*0x61b4*/      subs r0, r0, #1
/*0x61b6*/      uxtb r0, r0
/*0x61b8*/      bhs jump_61aa
/*0x61ba*/      pop {r4, r5, pc}

            data_61bc:
/*0x61bc*/  .word 0x200002c0


            .thumb_func
            call_61c0:
/*0x61c0*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x61c4*/      ldr.w sb, [pc, #0x5c] /* data_6224 */
/*0x61c8*/      ldr.w ip, [pc, #0x5c] /* data_6228 */
/*0x61cc*/      movs r5, #0
/*0x61ce*/      sub.w r8, sb, #0xd8
            jump_61d2:
/*0x61d2*/      ldr r7, [pc, #0x54] /* data_6228 */
/*0x61d4*/      movs r4, #0x10
/*0x61d6*/      movs r3, #0
/*0x61d8*/      add.w r0, sb, r5, lsl #6
/*0x61dc*/      adds r7, #0x44
            jump_61de:
/*0x61de*/      ldrb.w r1, [ip, r3]
/*0x61e2*/      add.w r1, r1, r1, lsl #3
/*0x61e6*/      add.w r1, r8, r1, lsl #3
/*0x61ea*/      adds r2, r1, r5
/*0x61ec*/      movs r1, #9
/*0x61ee*/      b jump_6204
            jump_61f0:
/*0x61f0*/      ldrb r6, [r2], #8
/*0x61f4*/      subs r4, r4, #1
/*0x61f6*/      ands r4, r4, #0xff
/*0x61fa*/      ldrh.w r6, [r7, r6, lsl #1]
/*0x61fe*/      strh r6, [r0]
/*0x6200*/      beq jump_621e
/*0x6202*/      adds r0, r0, #4
            jump_6204:
/*0x6204*/      subs r1, r1, #1
/*0x6206*/      uxtb r1, r1
/*0x6208*/      bhs jump_61f0
/*0x620a*/      adds r3, r3, #1
/*0x620c*/      uxtb r3, r3
/*0x620e*/      cmp r3, #3
/*0x6210*/      blo jump_61de
/*0x6212*/      adds r5, r5, #1
/*0x6214*/      uxtb r5, r5
/*0x6216*/      cmp r5, #8
/*0x6218*/      blo jump_61d2
/*0x621a*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_621e:
/*0x621e*/      movs r4, #0x10
/*0x6220*/      subs r0, #0x3a
/*0x6222*/      b jump_6204

            data_6224:
/*0x6224*/  .word 0x20000406
            data_6228:
/*0x6228*/  .word data_7d10


            .thumb_func
            call_622c:
/*0x622c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6230*/      movs r1, #0
/*0x6232*/      mov.w r2, #0x20000
/*0x6236*/      mov.w r0, #0x70000
/*0x623a*/      movs r3, #1
/*0x623c*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x6240*/      movw r1, #0xea60
/*0x6244*/      ldr r0, [pc, #0x90] /* data_62d8 */
/*0x6246*/      bl call_3792
/*0x624a*/      ldr r4, [pc, #0x90] /* data_62dc */
/*0x624c*/      movs r1, #2
/*0x624e*/      mov r0, r4
/*0x6250*/      bl call_45a0
/*0x6254*/      movs r2, #1
/*0x6256*/      movs r1, #2
/*0x6258*/      mov r0, r4
/*0x625a*/      bl call_4568
/*0x625e*/      movs r2, #1
/*0x6260*/      movs r1, #2
/*0x6262*/      mov r0, r4
/*0x6264*/      bl call_4538
/*0x6268*/      movs r1, #4
/*0x626a*/      mov r0, r4
/*0x626c*/      bl call_45a0
/*0x6270*/      ldr r6, [pc, #0x6c] /* data_62e0 */
/*0x6272*/      mov.w r5, #0x4000
/*0x6276*/      mov r1, r5
/*0x6278*/      mov r0, r6
/*0x627a*/      bl call_45a0
/*0x627e*/      lsls r7, r5, #1
/*0x6280*/      mov r1, r7
/*0x6282*/      mov r0, r6
/*0x6284*/      bl call_45a0
/*0x6288*/      movs r2, #1
/*0x628a*/      movs r1, #4
/*0x628c*/      mov r0, r4
/*0x628e*/      bl call_4568
/*0x6292*/      movs r2, #1
/*0x6294*/      mov r1, r5
/*0x6296*/      mov r0, r6
/*0x6298*/      bl call_4568
/*0x629c*/      movs r2, #1
/*0x629e*/      mov r1, r7
/*0x62a0*/      mov r0, r6
/*0x62a2*/      bl call_4568
/*0x62a6*/      movs r2, #1
/*0x62a8*/      movs r1, #4
/*0x62aa*/      mov r0, r4
/*0x62ac*/      bl call_4538
/*0x62b0*/      movs r2, #1
/*0x62b2*/      mov r1, r5
/*0x62b4*/      mov r0, r6
/*0x62b6*/      bl call_4538
/*0x62ba*/      movs r2, #1
/*0x62bc*/      mov r1, r7
/*0x62be*/      mov r0, r6
/*0x62c0*/      bl call_4538
/*0x62c4*/      movs r2, #1
/*0x62c6*/      mov r1, r2
/*0x62c8*/      ldr r0, [pc, #0x18] /* data_62e4 */
/*0x62ca*/      bl call_4558
/*0x62ce*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x62d2*/      b.w jump_71e4

/*0x62d6*/  .byte 0x00
/*0x62d7*/  .byte 0x00

            data_62d8:
/*0x62d8*/  .word 0x40077000
            data_62dc:
/*0x62dc*/  .word 0x400b4000
            data_62e0:
/*0x62e0*/  .word 0x400b0000
            data_62e4:
/*0x62e4*/  .word 0x400b2000

            jump_62e8:
/*0x62e8*/      push {r4, r5, r6, lr}
/*0x62ea*/      ldr r4, [pc, #0x60] /* data_634c */
/*0x62ec*/      movs r1, #0
/*0x62ee*/      mov r0, r4
/*0x62f0*/      bl call_377e
/*0x62f4*/      movs r1, #0
/*0x62f6*/      mov r0, r4
/*0x62f8*/      bl call_376a
/*0x62fc*/      mov r0, r4
/*0x62fe*/      bl bftm_clear /* (BFTM) */
/*0x6302*/      ldr r1, [pc, #0x4c] /* data_6350 */
/*0x6304*/      asrs r0, r4, #0x14
/*0x6306*/      str.w r0, [r1, #0x180]
/*0x630a*/      movs r1, #0
/*0x630c*/      ldr r0, [pc, #0x44] /* data_6354 */
/*0x630e*/      bl call_45ae
/*0x6312*/      ldr r1, [pc, #0x44] /* data_6358 */
/*0x6314*/      movs r0, #2
/*0x6316*/      str r0, [r1, #0x24]
/*0x6318*/      ldr r4, [pc, #0x40] /* data_635c */
/*0x631a*/      movs r5, #8
/*0x631c*/      b jump_6344
            jump_631e:
/*0x631e*/      ldrh r0, [r4, #4]
/*0x6320*/      movs r2, #0
/*0x6322*/      uxth r1, r0
/*0x6324*/      ldr r0, [r4]
/*0x6326*/      bl call_4538
/*0x632a*/      ldrh r0, [r4, #4]
/*0x632c*/      movs r2, #1
/*0x632e*/      uxth r1, r0
/*0x6330*/      ldr r0, [r4]
/*0x6332*/      bl call_4558
/*0x6336*/      ldrh r0, [r4, #4]
/*0x6338*/      movs r2, #2
/*0x633a*/      uxth r1, r0
/*0x633c*/      ldr r0, [r4]
/*0x633e*/      bl call_4578
/*0x6342*/      adds r4, #8
            jump_6344:
/*0x6344*/      subs r5, r5, #1
/*0x6346*/      uxtb r5, r5
/*0x6348*/      bhs jump_631e
/*0x634a*/      pop {r4, r5, r6, pc}

            data_634c:
/*0x634c*/  .word 0x40077000
            data_6350:
/*0x6350*/  .word 0xe000e004
            data_6354:
/*0x6354*/  .word 0x4006f000
            data_6358:
/*0x6358*/  .word 0x400b4000
            data_635c:
/*0x635c*/  .word gpio_map_3


            .thumb_func
            call_6360:
/*0x6360*/      push {r4, r5, r6, lr}
/*0x6362*/      ldr r4, [pc, #0x8c] /* data_63f0 */
/*0x6364*/      movs r5, #8
/*0x6366*/      b jump_638c
            jump_6368:
/*0x6368*/      ldrh r0, [r4, #4]
/*0x636a*/      uxth r1, r0
/*0x636c*/      ldr r0, [r4]
/*0x636e*/      bl call_45a0
/*0x6372*/      ldrh r0, [r4, #4]
/*0x6374*/      movs r2, #1
/*0x6376*/      uxth r1, r0
/*0x6378*/      ldr r0, [r4]
/*0x637a*/      bl call_4568
/*0x637e*/      ldrh r0, [r4, #4]
/*0x6380*/      movs r2, #1
/*0x6382*/      uxth r1, r0
/*0x6384*/      ldr r0, [r4]
/*0x6386*/      bl call_4538
/*0x638a*/      adds r4, #8
            jump_638c:
/*0x638c*/      subs r5, r5, #1
/*0x638e*/      uxtb r5, r5
/*0x6390*/      bhs jump_6368
/*0x6392*/      ldr r1, [pc, #0x60] /* data_63f4 */
/*0x6394*/      movs r0, #2
/*0x6396*/      str r0, [r1, #0x28]
/*0x6398*/      lsls r1, r0, #8
/*0x639a*/      ldr r0, [pc, #0x5c] /* data_63f8 */
/*0x639c*/      bl mem_zero /* (dest, size) */
/*0x63a0*/      ldr r1, [pc, #0x58] /* data_63fc */
/*0x63a2*/      movs r0, #0
/*0x63a4*/      strb r0, [r1, #1]
/*0x63a6*/      movs r0, #0x64
/*0x63a8*/      bl spin_wait /* (time) */
/*0x63ac*/      bl call_6458
/*0x63b0*/      movs r0, #2
/*0x63b2*/      bl call_7238
/*0x63b6*/      ldr r1, [pc, #0x48] /* data_6400 */
/*0x63b8*/      mov.w r0, #0x8000
/*0x63bc*/      str r0, [r1, #0x24]
/*0x63be*/      movs r1, #1
/*0x63c0*/      ldr r0, [pc, #0x40] /* data_6404 */
/*0x63c2*/      bl call_45ae
/*0x63c6*/      ldr r4, [pc, #0x40] /* data_6408 */
/*0x63c8*/      movs r1, #0
/*0x63ca*/      mov r0, r4
/*0x63cc*/      bl call_3796
/*0x63d0*/      mov r0, r4
/*0x63d2*/      bl bftm_clear /* (BFTM) */
/*0x63d6*/      movs r1, #1
/*0x63d8*/      mov r0, r4
/*0x63da*/      bl call_376a
/*0x63de*/      movs r1, #1
/*0x63e0*/      mov r0, r4
/*0x63e2*/      bl call_377e
/*0x63e6*/      ldr r1, [pc, #0x24] /* data_640c */
/*0x63e8*/      asrs r0, r4, #0x14
/*0x63ea*/      str.w r0, [r1, #0x100]
/*0x63ee*/      pop {r4, r5, r6, pc}

            data_63f0:
/*0x63f0*/  .word gpio_map_3
            data_63f4:
/*0x63f4*/  .word 0x400b4000
            data_63f8:
/*0x63f8*/  .word 0x20000406
            data_63fc:
/*0x63fc*/  .word 0x20000020
            data_6400:
/*0x6400*/  .word 0x400b0000
            data_6404:
/*0x6404*/  .word 0x4006f000
            data_6408:
/*0x6408*/  .word 0x40077000
            data_640c:
/*0x640c*/  .word 0xe000e004


            .thumb_func
            call_6410:
/*0x6410*/      push {r4, r5, lr}
/*0x6412*/      movs r0, #0x12
/*0x6414*/      bl call_7238
/*0x6418*/      movs r1, #0xa
/*0x641a*/      mov.w r0, #0x300
/*0x641e*/      bl call_7268
/*0x6422*/      movs r1, #2
/*0x6424*/      movs r0, #0
/*0x6426*/      bl call_7268
/*0x642a*/      ldr r4, [pc, #0x24] /* data_6450 */
/*0x642c*/      mov.w r0, #0x4000
/*0x6430*/      str r0, [r4, #0x28]
/*0x6432*/      lsls r5, r0, #1
/*0x6434*/      str r5, [r4, #0x24]
/*0x6436*/      movs r1, #8
/*0x6438*/      mov.w r0, #0xc00
/*0x643c*/      bl call_7268
/*0x6440*/      ldr r1, [pc, #0x10] /* data_6454 */
/*0x6442*/      movs r0, #4
/*0x6444*/      str r0, [r1, #0x24]
/*0x6446*/      str r5, [r4, #0x28]
/*0x6448*/      nop 
/*0x644a*/      nop 
/*0x644c*/      str r5, [r4, #0x24]
/*0x644e*/      pop {r4, r5, pc}

            data_6450:
/*0x6450*/  .word 0x400b0000
            data_6454:
/*0x6454*/  .word 0x400b4000


            .thumb_func
            call_6458:
/*0x6458*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x645c*/      ldr r1, [pc, #0x78] /* data_64d8 */
/*0x645e*/      ldr r0, [pc, #0x74] /* data_64d4 */
/*0x6460*/      movs r5, #0x10
/*0x6462*/      ldrb r2, [r1, #1]
/*0x6464*/      movs r7, #4
/*0x6466*/      add.w r4, r0, r2, lsl #6
/*0x646a*/      ldrb r0, [r1]
/*0x646c*/      ldr.w sl, [pc, #0x6c] /* data_64dc */
/*0x6470*/      ldr r6, [pc, #0x6c] /* data_64e0 */
/*0x6472*/      mov.w fp, #0x4000
/*0x6476*/      adds r4, #0x3e
/*0x6478*/      cbz r0, jump_6488
/*0x647a*/      subs r0, r0, #1
/*0x647c*/      ands r0, r0, #0xff
/*0x6480*/      strb r0, [r1]
/*0x6482*/      bne jump_6488
/*0x6484*/      bl call_6410
            jump_6488:
/*0x6488*/      mov sb, r7
            jump_648a:
/*0x648a*/      subs r5, r5, #1
/*0x648c*/      uxtb r5, r5
/*0x648e*/      blo jump_64ca
/*0x6490*/      mov.w r8, #0x8000
/*0x6494*/      str.w r8, [r6, #0x28]
/*0x6498*/      ldrh r0, [r4]
/*0x649a*/      subs r7, r4, #2
/*0x649c*/      movs r1, #0xa
/*0x649e*/      bl call_7268
/*0x64a2*/      ldrh r0, [r7]
/*0x64a4*/      movs r1, #9
/*0x64a6*/      ubfx r7, r0, #6, #1
/*0x64aa*/      subs r4, r4, #4
/*0x64ac*/      bl call_7268
/*0x64b0*/      mov r0, fp
/*0x64b2*/      str.w fp, [r6, #0x28]
/*0x64b6*/      str.w r8, [r6, #0x24]
/*0x64ba*/      mov r1, sb
/*0x64bc*/      mov r2, sl
/*0x64be*/      cbz r7, jump_64c4
/*0x64c0*/      str r1, [r2, #0x24]
/*0x64c2*/      b jump_64c6
            jump_64c4:
/*0x64c4*/      str r1, [r2, #0x28]
            jump_64c6:
/*0x64c6*/      str r0, [r6, #0x24]
/*0x64c8*/      b jump_648a
            jump_64ca:
/*0x64ca*/      str.w sb, [sl, #0x24]
/*0x64ce*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x64d2*/  .byte 0x00
/*0x64d3*/  .byte 0x00

            data_64d4:
/*0x64d4*/  .word 0x20000406
            data_64d8:
/*0x64d8*/  .word 0x20000020
            data_64dc:
/*0x64dc*/  .word 0x400b4000
            data_64e0:
/*0x64e0*/  .word 0x400b0000


            .thumb_func
            call_64e4:
/*0x64e4*/      cmp r1, #0
/*0x64e6*/      ldr r1, [r0]
/*0x64e8*/      beq jump_64f0
/*0x64ea*/      orr r1, r1, #1
/*0x64ee*/      b jump_64f4
            jump_64f0:
/*0x64f0*/      bic r1, r1, #1
            jump_64f4:
/*0x64f4*/      str r1, [r0]
/*0x64f6*/      bx lr

            .thumb_func
            call_64f8:
/*0x64f8*/      push {r4, r5, lr}
/*0x64fa*/      ldrd r4, r3, [r1, #0x14]
/*0x64fe*/      cbz r4, jump_653a
/*0x6500*/      mov.w r2, #0x200
/*0x6504*/      lsrs r2, r3
/*0x6506*/      orrs r2, r4
            jump_6508:
/*0x6508*/      ldr r4, [r1, #8]
/*0x650a*/      ldr r3, [r1]
/*0x650c*/      orrs r3, r4
/*0x650e*/      ldrd r4, r5, [r1, #0xc]
/*0x6512*/      orrs r4, r5
/*0x6514*/      orrs r3, r4
/*0x6516*/      ldr r4, [r1, #0x1c]
/*0x6518*/      orrs r3, r4
/*0x651a*/      orrs r3, r2
/*0x651c*/      str r3, [r0, #4]
/*0x651e*/      ldr r3, [r1, #0x24]
/*0x6520*/      ldr r2, [r1, #4]
/*0x6522*/      orrs r2, r3
/*0x6524*/      ldr r3, [r1, #0x20]
/*0x6526*/      orr.w r2, r2, r3, lsl #4
/*0x652a*/      str r2, [r0, #0x18]
/*0x652c*/      ldr r1, [r1, #0x28]
/*0x652e*/      mov.w r2, #-1
/*0x6532*/      add.w r1, r2, r1, lsr #1
/*0x6536*/      str r1, [r0, #0xc]
/*0x6538*/      pop {r4, r5, pc}
            jump_653a:
/*0x653a*/      mov.w r2, #0x100
/*0x653e*/      lsls r2, r3
/*0x6540*/      b jump_6508

            .thumb_func
            call_6542:
/*0x6542*/      cmp r1, #0
/*0x6544*/      ldr r1, [r0]
/*0x6546*/      beq jump_654e
/*0x6548*/      orr r1, r1, #8
/*0x654c*/      b jump_6552
            jump_654e:
/*0x654e*/      bic r1, r1, #8
            jump_6552:
/*0x6552*/      str r1, [r0]
/*0x6554*/      bx lr

            .thumb_func
            call_6556:
/*0x6556*/      push {r4, r5, r6, lr}
/*0x6558*/      mov r5, r0
/*0x655a*/      bl call_40ec
/*0x655e*/      bfi r4, r0, #0, #8
/*0x6562*/      cbz r5, jump_6588
/*0x6564*/      cmp r5, #1
/*0x6566*/      beq jump_6574
/*0x6568*/      cmp r5, #2
/*0x656a*/      bne jump_657a
/*0x656c*/      uxth r0, r4
/*0x656e*/      orr r4, r0, #2
/*0x6572*/      b jump_657a
            jump_6574:
/*0x6574*/      uxth r0, r4
/*0x6576*/      bic r4, r0, #2
            jump_657a:
/*0x657a*/      uxtb r0, r4
/*0x657c*/      bl call_4510
/*0x6580*/      bl call_40ec
/*0x6584*/      bfi r4, r0, #0, #8
            jump_6588:
/*0x6588*/      lsls r0, r4, #0x1e
/*0x658a*/      bpl jump_6590
/*0x658c*/      movs r0, #1
/*0x658e*/      pop {r4, r5, r6, pc}
            jump_6590:
/*0x6590*/      movs r0, #0
/*0x6592*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6594:
/*0x6594*/      ldr r0, [pc, #0x50] /* data_65e8 */
/*0x6596*/      movs r1, #1
/*0x6598*/      str.w r1, [r0, #0x300]
/*0x659c*/      ldr r2, [pc, #0x4c] /* data_65ec */
/*0x659e*/      str.w r1, [r2, #0xa8]
            jump_65a2:
/*0x65a2*/      ldr.w r3, [r2, #0x108]
/*0x65a6*/      cmp r3, #0
/*0x65a8*/      beq jump_65a2
/*0x65aa*/      movs r3, #0
/*0x65ac*/      str r3, [r2, #0x20]
/*0x65ae*/      mov.w r3, #0x9000000
/*0x65b2*/      str r3, [r0, #0x18]
/*0x65b4*/      str.w r1, [r2, #0xa4]
            jump_65b8:
/*0x65b8*/      ldr.w r3, [r2, #0x104]
/*0x65bc*/      cmp r3, #0
/*0x65be*/      beq jump_65b8
/*0x65c0*/      ldr r2, [pc, #0x2c] /* data_65f0 */
/*0x65c2*/      ldr.w r3, [r2, #0x200]
/*0x65c6*/      bic r3, r3, #7
/*0x65ca*/      adds r3, r3, #3
/*0x65cc*/      str.w r3, [r2, #0x200]
/*0x65d0*/      str r1, [r0, #0x20]
/*0x65d2*/      ldr r2, [r0, #4]
/*0x65d4*/      bic r2, r2, #3
/*0x65d8*/      adds r2, r2, #1
/*0x65da*/      str r2, [r0, #4]
            jump_65dc:
/*0x65dc*/      ldr r2, [r0, #0x34]
/*0x65de*/      cmp.w r1, r2, lsr #30
/*0x65e2*/      bne jump_65dc
/*0x65e4*/      bx lr

/*0x65e6*/  .byte 0x00
/*0x65e7*/  .byte 0x00

            data_65e8:
/*0x65e8*/  .word 0x40088000
            data_65ec:
/*0x65ec*/  .word 0x43100000
            data_65f0:
/*0x65f0*/  .word 0x40080000


            .thumb_func
            call_65f4:
/*0x65f4*/      ldr r0, [pc, #0x18] /* data_6610 */
/*0x65f6*/      movs r1, #0
/*0x65f8*/      add.w r2, r0, #8
/*0x65fc*/      str r1, [r0, #0x1c]
/*0x65fe*/      str r1, [r0, #0x20]
/*0x6600*/      strb r1, [r2, #1]
/*0x6602*/      str.w r1, [r0, #0x15]
/*0x6606*/      movs r1, #0x1d
/*0x6608*/      ldr r0, [pc, #8] /* data_6614 */
/*0x660a*/      b.w mem_zero /* (dest, size) */

/*0x660e*/  .byte 0x00
/*0x660f*/  .byte 0x00

            data_6610:
/*0x6610*/  .word 0x20000034
            data_6614:
/*0x6614*/  .word 0x200006d6


            .thumb_func
            call_6618:
/*0x6618*/      push {r4, lr}
/*0x661a*/      ldr r0, [pc, #0x20] /* data_663c */
/*0x661c*/      ldr r1, [pc, #0x1c] /* data_663c */
/*0x661e*/      movs r4, #1
/*0x6620*/      strb r4, [r0]
/*0x6622*/      adds r1, #0xc
/*0x6624*/      movs r0, #2
/*0x6626*/      strb r0, [r1]
/*0x6628*/      ldr r1, [pc, #0x14] /* data_6640 */
/*0x662a*/      movs r0, #4
/*0x662c*/      strb r0, [r1]
/*0x662e*/      bl call_65f4
/*0x6632*/      ldr r0, [pc, #8] /* data_663c */
/*0x6634*/      subs r0, #8
/*0x6636*/      strb r4, [r0, #5]
/*0x6638*/      pop {r4, pc}

/*0x663a*/  .byte 0x00
/*0x663b*/  .byte 0x00

            data_663c:
/*0x663c*/  .word 0x2000003c
            data_6640:
/*0x6640*/  .word 0x200006d4


            .thumb_func
            call_6644:
/*0x6644*/      ldrb.w r0, [r0, #0x34]
/*0x6648*/      ubfx r0, r0, #1, #1
/*0x664c*/      bx lr

/*0x664e*/  .byte 0x00
/*0x664f*/  .byte 0x00

            jump_6650:
/*0x6650*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6654*/      mov r4, r0
/*0x6656*/      bl call_6a94
/*0x665a*/      mov r5, r0
/*0x665c*/      ldr r6, [pc, #0x158] /* data_67b8 */
/*0x665e*/      lsls r0, r0, #0x1e
/*0x6660*/      bpl jump_666e
/*0x6662*/      ldr r0, [r6, #4]
/*0x6664*/      cbz r0, jump_6668
/*0x6666*/      blx r0
            jump_6668:
/*0x6668*/      movs r0, #2
/*0x666a*/      bl call_67f0
            jump_666e:
/*0x666e*/      lsls r0, r5, #0x1b
/*0x6670*/      bpl jump_6692
/*0x6672*/      movs r0, #0x10
/*0x6674*/      bl call_67f0
/*0x6678*/      ldrb.w r0, [r4, #0x32]
/*0x667c*/      cmp r0, #2
/*0x667e*/      blo jump_6692
/*0x6680*/      bl call_6aa8
/*0x6684*/      ldrb.w r0, [r4, #0x32]
/*0x6688*/      strb.w r0, [r4, #0x33]
/*0x668c*/      movs r0, #3
/*0x668e*/      strb.w r0, [r4, #0x32]
            jump_6692:
/*0x6692*/      lsls r0, r5, #0x1d
/*0x6694*/      mov.w r7, #0
/*0x6698*/      bpl jump_66de
/*0x669a*/      subs r0, r7, #1
/*0x669c*/      str r0, [r4, #0x20]
/*0x669e*/      strb.w r7, [r4, #0x30]
/*0x66a2*/      strb.w r7, [r4, #0x31]
/*0x66a6*/      ldrb.w r0, [r4, #0x34]
/*0x66aa*/      bic r0, r0, #2
/*0x66ae*/      strb.w r0, [r4, #0x34]
/*0x66b2*/      movs r0, #4
/*0x66b4*/      strb.w r0, [r4, #0x32]
/*0x66b8*/      str r7, [r4, #0x38]
/*0x66ba*/      bl call_68a0
/*0x66be*/      bl call_6ab8
/*0x66c2*/      ldr r1, [pc, #0xf8] /* data_67bc */
/*0x66c4*/      movs r0, #0
/*0x66c6*/      bl call_695c
/*0x66ca*/      ldr r0, [pc, #0xf0] /* data_67bc */
/*0x66cc*/      ldr r0, [r0]
/*0x66ce*/      bl call_6a64
/*0x66d2*/      ldr r0, [r6]
/*0x66d4*/      cbz r0, jump_66d8
/*0x66d6*/      blx r0
            jump_66d8:
/*0x66d8*/      movs r0, #4
/*0x66da*/      bl call_67f0
            jump_66de:
/*0x66de*/      lsls r0, r5, #0x1c
/*0x66e0*/      bpl jump_66f4
/*0x66e2*/      bl call_6ab8
/*0x66e6*/      ldrb.w r0, [r4, #0x33]
/*0x66ea*/      strb.w r0, [r4, #0x32]
/*0x66ee*/      movs r0, #8
/*0x66f0*/      bl call_67f0
            jump_66f4:
/*0x66f4*/      lsls r0, r5, #0x17
/*0x66f6*/      mov.w r8, #0x100
/*0x66fa*/      bpl jump_6778
/*0x66fc*/      movs r0, #0
/*0x66fe*/      bl call_693c
/*0x6702*/      mov r5, r0
/*0x6704*/      lsls r0, r0, #0x16
/*0x6706*/      bpl jump_671e
/*0x6708*/      mov r0, r4
/*0x670a*/      bl call_6bd8
/*0x670e*/      mov r0, r4
/*0x6710*/      bl call_7550
/*0x6714*/      mov.w r1, #0x200
/*0x6718*/      movs r0, #0
/*0x671a*/      bl call_68cc
            jump_671e:
/*0x671e*/      lsls r0, r5, #0x1e
/*0x6720*/      bpl jump_6760
/*0x6722*/      movs r1, #2
/*0x6724*/      movs r0, #0
/*0x6726*/      bl call_68cc
/*0x672a*/      ldr r0, [r4, #0x20]
/*0x672c*/      adds r0, r0, #1
/*0x672e*/      beq jump_6760
/*0x6730*/      ldrb.w r0, [r4, #0x24]
/*0x6734*/      cmp r0, #2
/*0x6736*/      bne jump_6760
/*0x6738*/      movs r2, #0x40
/*0x673a*/      movs r0, #0
/*0x673c*/      ldr r1, [r4, #0x1c]
/*0x673e*/      bl call_69bc
/*0x6742*/      ldr r1, [r4, #0x1c]
/*0x6744*/      add r1, r0
/*0x6746*/      str r1, [r4, #0x1c]
/*0x6748*/      ldr r1, [r4, #0x20]
/*0x674a*/      subs r0, r1, r0
/*0x674c*/      str r0, [r4, #0x20]
/*0x674e*/      bne jump_6760
/*0x6750*/      movs r0, #1
/*0x6752*/      strb.w r0, [r4, #0x24]
/*0x6756*/      ldr r1, [r4, #0x28]
/*0x6758*/      cbz r1, jump_6760
/*0x675a*/      ldr r0, [r4, #0x2c]
/*0x675c*/      blx r1
/*0x675e*/      str r7, [r4, #0x28]
            jump_6760:
/*0x6760*/      lsls r0, r5, #0x1b
/*0x6762*/      bpl jump_6772
/*0x6764*/      mov r0, r4
/*0x6766*/      bl call_750c
/*0x676a*/      movs r1, #0x10
/*0x676c*/      movs r0, #0
/*0x676e*/      bl call_68cc
            jump_6772:
/*0x6772*/      mov r0, r8
/*0x6774*/      bl call_67f0
            jump_6778:
/*0x6778*/      mov r4, r8
            jump_677a:
/*0x677a*/      bl call_6a94
/*0x677e*/      bl call_6a74
/*0x6782*/      mov r5, r0
/*0x6784*/      adds r0, r0, #1
/*0x6786*/      beq jump_67b2
/*0x6788*/      mov r0, r5
/*0x678a*/      bl call_693c
/*0x678e*/      tst.w r0, #0x12
/*0x6792*/      beq jump_677a
/*0x6794*/      movs r1, #0x12
/*0x6796*/      mov r0, r5
/*0x6798*/      bl call_68cc
/*0x679c*/      lsl.w r0, r4, r5
/*0x67a0*/      bl call_67f0
/*0x67a4*/      ldr r0, [r6, #0x18]
/*0x67a6*/      cmp r0, #0
/*0x67a8*/      beq jump_677a
/*0x67aa*/      mov r1, r0
/*0x67ac*/      mov r0, r5
/*0x67ae*/      blx r1
/*0x67b0*/      b jump_677a
            jump_67b2:
/*0x67b2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x67b6*/  .byte 0x00
/*0x67b7*/  .byte 0x00

            data_67b8:
/*0x67b8*/  .word data_80e8
            data_67bc:
/*0x67bc*/  .word 0x20000168


            .thumb_func
            call_67c0:
/*0x67c0*/      movs r1, #2
/*0x67c2*/      strb.w r1, [r0, #0x32]
/*0x67c6*/      ldr r0, [pc, #4] /* data_67cc */
/*0x67c8*/      b.w jump_6aa4

            data_67cc:
/*0x67cc*/  .word 0x20000168


            .thumb_func
            call_67d0:
/*0x67d0*/      ldrb.w r0, [r0, #0x32]
/*0x67d4*/      cmp r0, #3
/*0x67d6*/      beq jump_67dc
/*0x67d8*/      movs r0, #0
/*0x67da*/      bx lr
            jump_67dc:
/*0x67dc*/      movs r0, #1
/*0x67de*/      bx lr

            .thumb_func
            call_67e0:
/*0x67e0*/      push {r4, lr}
/*0x67e2*/      bl call_6ab8
/*0x67e6*/      pop.w {r4, lr}
/*0x67ea*/      b.w jump_6be8

/*0x67ee*/  .byte 0x00
/*0x67ef*/  .byte 0x00


            .thumb_func
            call_67f0:
/*0x67f0*/      ldr r1, [pc, #4] /* data_67f8 */
/*0x67f2*/      str r0, [r1, #8]
/*0x67f4*/      bx lr

/*0x67f6*/  .byte 0x00
/*0x67f7*/  .byte 0x00

            data_67f8:
/*0x67f8*/  .word 0x400a8000


            .thumb_func
            call_67fc:
/*0x67fc*/      push {r4, lr}
/*0x67fe*/      movs r1, #0
/*0x6800*/      mov.w r0, #0x400
/*0x6804*/      movs r2, #0x40
/*0x6806*/      movs r3, #1
/*0x6808*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x680c*/      movs r0, #2
/*0x680e*/      bl ckcu_set_usb_prescaler /* (prescaler) */
/*0x6812*/      ldr r4, [pc, #0x48] /* data_685c */
/*0x6814*/      ldr r0, [pc, #0x40] /* data_6858 */
/*0x6816*/      str r0, [r4, #8]
/*0x6818*/      subs r0, #0x5c
/*0x681a*/      str r0, [r4, #0xc]
/*0x681c*/      subs r0, #0xf4
/*0x681e*/      str r0, [r4, #0x10]
/*0x6820*/      movs r0, #2
/*0x6822*/      str r0, [r4, #0x14]
/*0x6824*/      bl call_6618
/*0x6828*/      mov r0, r4
/*0x682a*/      bl call_67c0
/*0x682e*/      ldr r1, [pc, #0x30] /* data_6860 */
/*0x6830*/      mov.w r0, #0x200000
/*0x6834*/      str.w r0, [r1, #0x100]
/*0x6838*/      movs r0, #1
/*0x683a*/      bl call_6884
/*0x683e*/      movs r0, #0xfa
/*0x6840*/      bl spin_wait /* (time) */
/*0x6844*/      ldrb.w r0, [r4, #0x34]
/*0x6848*/      pop.w {r4, lr}
/*0x684c*/      and r1, r0, #1
/*0x6850*/      ldr r0, [pc, #0x10] /* data_6864 */
/*0x6852*/      b.w jump_6ac8

/*0x6856*/  .byte 0x00
/*0x6857*/  .byte 0x00

            data_6858:
/*0x6858*/  .word usb_device_desc
            data_685c:
/*0x685c*/  .word 0x200006f4
            data_6860:
/*0x6860*/  .word 0xe000e004
            data_6864:
/*0x6864*/  .word 0x20000168


            .thumb_func
            call_6868:
/*0x6868*/      ldr r1, [pc, #0x14] /* data_6880 */
/*0x686a*/      cmp r0, #1
/*0x686c*/      ldr r0, [r1]
/*0x686e*/      beq jump_6878
/*0x6870*/      bic r0, r0, #0x800
            jump_6874:
/*0x6874*/      str r0, [r1]
/*0x6876*/      bx lr
            jump_6878:
/*0x6878*/      orr r0, r0, #0x800
/*0x687c*/      b jump_6874

/*0x687e*/  .byte 0x00
/*0x687f*/  .byte 0x00

            data_6880:
/*0x6880*/  .word 0x400a8000


            .thumb_func
            call_6884:
/*0x6884*/      ldr r1, [pc, #0x14] /* data_689c */
/*0x6886*/      cmp r0, #1
/*0x6888*/      ldr r0, [r1]
/*0x688a*/      beq jump_6894
/*0x688c*/      bic r0, r0, #0x400
            jump_6890:
/*0x6890*/      str r0, [r1]
/*0x6892*/      bx lr
            jump_6894:
/*0x6894*/      orr r0, r0, #0x400
/*0x6898*/      b jump_6890

/*0x689a*/  .byte 0x00
/*0x689b*/  .byte 0x00

            data_689c:
/*0x689c*/  .word 0x400a8000


            .thumb_func
            call_68a0:
/*0x68a0*/      movs r1, #0
/*0x68a2*/      movs r0, #0x20
/*0x68a4*/      movs r3, #1
/*0x68a6*/      mov r2, r1
/*0x68a8*/      b.w jump_5e78

            .thumb_func
            call_68ac:
/*0x68ac*/      push {r4, lr}
/*0x68ae*/      bl call_7774
/*0x68b2*/      ldr r1, [r0]
/*0x68b4*/      and r1, r1, #9
/*0x68b8*/      str r1, [r0]
/*0x68ba*/      pop {r4, pc}

            .thumb_func
            call_68bc:
/*0x68bc*/      push {r4, lr}
/*0x68be*/      bl call_7774
/*0x68c2*/      ldr r1, [r0]
/*0x68c4*/      and r1, r1, #0x24
/*0x68c8*/      str r1, [r0]
/*0x68ca*/      pop {r4, pc}

            .thumb_func
            call_68cc:
/*0x68cc*/      push {r4, lr}
/*0x68ce*/      mov r4, r1
/*0x68d0*/      bl call_7774
/*0x68d4*/      str r4, [r0, #8]
/*0x68d6*/      pop {r4, pc}

            .thumb_func
            call_68d8:
/*0x68d8*/      push {r4, lr}
/*0x68da*/      bl call_7774
/*0x68de*/      ldr r0, [r0, #0x10]
/*0x68e0*/      ldr r1, [pc, #8] /* data_68ec */
/*0x68e2*/      ubfx r0, r0, #0, #0xa
/*0x68e6*/      add r0, r1
/*0x68e8*/      pop {r4, pc}

/*0x68ea*/  .byte 0x00
/*0x68eb*/  .byte 0x00

            data_68ec:
/*0x68ec*/  .word 0x400aa000


            .thumb_func
            call_68f0:
/*0x68f0*/      push {r4, r5, r6, lr}
/*0x68f2*/      mov r5, r0
/*0x68f4*/      bl call_7774
/*0x68f8*/      mov r4, r0
/*0x68fa*/      mov r0, r5
/*0x68fc*/      bl call_6914
/*0x6900*/      ldr r1, [r4, #0x10]
/*0x6902*/      ubfx r1, r1, #0, #0xa
/*0x6906*/      add r0, r1
/*0x6908*/      ldr r1, [pc, #4] /* data_6910 */
/*0x690a*/      add r0, r1
/*0x690c*/      pop {r4, r5, r6, pc}

/*0x690e*/  .byte 0x00
/*0x690f*/  .byte 0x00

            data_6910:
/*0x6910*/  .word 0x400aa000


            .thumb_func
            call_6914:
/*0x6914*/      push {r4, lr}
/*0x6916*/      bl call_7774
/*0x691a*/      ldr r0, [r0, #0x10]
/*0x691c*/      ubfx r0, r0, #0xa, #0xa
/*0x6920*/      pop {r4, pc}

            .thumb_func
            call_6922:
/*0x6922*/      push {r4, lr}
/*0x6924*/      bl call_7774
/*0x6928*/      ldr r1, [r0, #0x10]
/*0x692a*/      ldr r0, [r0]
/*0x692c*/      lsls r1, r1, #3
/*0x692e*/      bpl jump_6936
/*0x6930*/      ubfx r0, r0, #2, #1
/*0x6934*/      pop {r4, pc}
            jump_6936:
/*0x6936*/      ubfx r0, r0, #5, #1
/*0x693a*/      pop {r4, pc}

            .thumb_func
            call_693c:
/*0x693c*/      push {r4, lr}
/*0x693e*/      bl call_7774
/*0x6942*/      ldr r1, [r0, #4]
/*0x6944*/      ldr r0, [r0, #8]
/*0x6946*/      ands r0, r1
/*0x6948*/      pop {r4, pc}

            .thumb_func
            call_694a:
/*0x694a*/      push {r4, lr}
/*0x694c*/      mov r4, r1
/*0x694e*/      bl call_7774
/*0x6952*/      ldr r0, [r0, #0xc]
/*0x6954*/      lsrs r0, r4
/*0x6956*/      ubfx r0, r0, #0, #9
/*0x695a*/      pop {r4, pc}

            .thumb_func
            call_695c:
/*0x695c*/      push {r4, r5, r6, lr}
/*0x695e*/      mov r4, r1
/*0x6960*/      mov r5, r0
/*0x6962*/      bl call_7774
/*0x6966*/      add.w r1, r4, r5, lsl #3
/*0x696a*/      ldr r2, [r1, #4]
/*0x696c*/      str r2, [r0, #0x10]
/*0x696e*/      ldr r1, [r1, #8]
/*0x6970*/      str r1, [r0, #4]
/*0x6972*/      mov.w r1, #-1
/*0x6976*/      str r1, [r0, #8]
/*0x6978*/      mov r0, r5
/*0x697a*/      pop.w {r4, r5, r6, lr}
/*0x697e*/      b.w jump_69ec

            .thumb_func
            call_6982:
/*0x6982*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6986*/      mov r6, r2
/*0x6988*/      mov r7, r1
/*0x698a*/      movs r5, r0
/*0x698c*/      beq jump_69b2
/*0x698e*/      movs r1, #0
            jump_6990:
/*0x6990*/      bl call_694a
/*0x6994*/      mov r4, r0
/*0x6996*/      cmp r0, r6
/*0x6998*/      bhi jump_69ac
/*0x699a*/      mov r0, r5
/*0x699c*/      cbz r5, jump_69b6
/*0x699e*/      bl call_68d8
            jump_69a2:
/*0x69a2*/      adds r1, r4, #3
/*0x69a4*/      lsrs r2, r1, #2
/*0x69a6*/      mov r1, r7
/*0x69a8*/      bl call_7764
            jump_69ac:
/*0x69ac*/      mov r0, r4
/*0x69ae*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_69b2:
/*0x69b2*/      movs r1, #0x10
/*0x69b4*/      b jump_6990
            jump_69b6:
/*0x69b6*/      bl call_68f0
/*0x69ba*/      b jump_69a2

            .thumb_func
            call_69bc:
/*0x69bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x69c0*/      mov r5, r2
/*0x69c2*/      mov r6, r1
/*0x69c4*/      mov r7, r0
/*0x69c6*/      bl call_7774
/*0x69ca*/      mov r4, r0
/*0x69cc*/      movs r0, #0
/*0x69ce*/      cbz r5, jump_69e0
/*0x69d0*/      mov r2, r5
/*0x69d2*/      mov r1, r6
/*0x69d4*/      mov r0, r7
/*0x69d6*/      bl call_6982
/*0x69da*/      cbnz r0, jump_69e0
/*0x69dc*/      cmp r5, #0
/*0x69de*/      bne jump_69e8
            jump_69e0:
/*0x69e0*/      ldr r1, [r4]
/*0x69e2*/      and r1, r1, #0x10
/*0x69e6*/      str r1, [r4]
            jump_69e8:
/*0x69e8*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_69ec:
/*0x69ec*/      push {r4, lr}
/*0x69ee*/      bl call_7774
/*0x69f2*/      ldr r1, [r0]
/*0x69f4*/      and r1, r1, #0x19
/*0x69f8*/      str r1, [r0]
/*0x69fa*/      pop {r4, pc}
            jump_69fc:
/*0x69fc*/      push {r4, lr}
/*0x69fe*/      bl call_7774
/*0x6a02*/      movs r1, #4
/*0x6a04*/      str r1, [r0]
/*0x6a06*/      pop {r4, pc}

            .thumb_func
            call_6a08:
/*0x6a08*/      push {r4, lr}
/*0x6a0a*/      bl call_7774
/*0x6a0e*/      movs r1, #0x40
/*0x6a10*/      str r1, [r0, #8]
/*0x6a12*/      ldr r2, [r0]
/*0x6a14*/      movs r1, #0x24
/*0x6a16*/      bics r1, r2
/*0x6a18*/      str r1, [r0]
/*0x6a1a*/      pop {r4, pc}

            .thumb_func
            call_6a1c:
/*0x6a1c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6a20*/      mov r4, r2
/*0x6a22*/      mov r8, r1
/*0x6a24*/      mov r7, r0
/*0x6a26*/      bl call_6914
/*0x6a2a*/      mov r6, r0
/*0x6a2c*/      mov r0, r7
/*0x6a2e*/      bl call_7774
/*0x6a32*/      mov r5, r0
/*0x6a34*/      movs r1, #0
/*0x6a36*/      mov r0, r7
/*0x6a38*/      bl call_694a
/*0x6a3c*/      cmp r4, r6
/*0x6a3e*/      bhi jump_6a42
/*0x6a40*/      cbz r0, jump_6a48
            jump_6a42:
/*0x6a42*/      movs r0, #0
            jump_6a44:
/*0x6a44*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6a48:
/*0x6a48*/      mov r0, r7
/*0x6a4a*/      bl call_68d8
/*0x6a4e*/      mov r1, r0
/*0x6a50*/      adds r0, r4, #3
/*0x6a52*/      lsrs r2, r0, #2
/*0x6a54*/      mov r0, r8
/*0x6a56*/      bl call_7764
/*0x6a5a*/      str r4, [r5, #0xc]
/*0x6a5c*/      movs r0, #2
/*0x6a5e*/      str r0, [r5]
/*0x6a60*/      mov r0, r4
/*0x6a62*/      b jump_6a44

            .thumb_func
            call_6a64:
/*0x6a64*/      ldr r1, [pc, #8] /* data_6a70 */
/*0x6a66*/      ldr r2, [r1, #4]
/*0x6a68*/      orrs r2, r0
/*0x6a6a*/      str r2, [r1, #4]
/*0x6a6c*/      bx lr

/*0x6a6e*/  .byte 0x00
/*0x6a6f*/  .byte 0x00

            data_6a70:
/*0x6a70*/  .word 0x400a8000


            .thumb_func
            call_6a74:
/*0x6a74*/      mov r3, r0
/*0x6a76*/      movs r1, #7
            jump_6a78:
/*0x6a78*/      add.w r2, r1, #8
/*0x6a7c*/      lsr.w r0, r3, r2
/*0x6a80*/      lsls r2, r0, #0x1f
/*0x6a82*/      beq jump_6a88
/*0x6a84*/      sxtb r0, r1
/*0x6a86*/      bx lr
            jump_6a88:
/*0x6a88*/      subs r1, r1, #1
/*0x6a8a*/      cmp r1, #0
/*0x6a8c*/      bgt jump_6a78
/*0x6a8e*/      mov.w r0, #-1
/*0x6a92*/      bx lr

            .thumb_func
            call_6a94:
/*0x6a94*/      ldr r0, [pc, #8] /* data_6aa0 */
/*0x6a96*/      ldr r1, [r0, #4]
/*0x6a98*/      ldr r0, [r0, #8]
/*0x6a9a*/      ands r0, r1
/*0x6a9c*/      bx lr

/*0x6a9e*/  .byte 0x00
/*0x6a9f*/  .byte 0x00

            data_6aa0:
/*0x6aa0*/  .word 0x400a8000

            jump_6aa4:
/*0x6aa4*/      b.w jump_6b40

            .thumb_func
            call_6aa8:
/*0x6aa8*/      ldr r0, [pc, #8] /* data_6ab4 */
/*0x6aaa*/      ldr r1, [r0]
/*0x6aac*/      orr r1, r1, #0xc
/*0x6ab0*/      str r1, [r0]
/*0x6ab2*/      bx lr

            data_6ab4:
/*0x6ab4*/  .word 0x400a8000


            .thumb_func
            call_6ab8:
/*0x6ab8*/      ldr r0, [pc, #8] /* data_6ac4 */
/*0x6aba*/      ldr r1, [r0]
/*0x6abc*/      and r1, r1, #0x400
/*0x6ac0*/      str r1, [r0]
/*0x6ac2*/      bx lr

            data_6ac4:
/*0x6ac4*/  .word 0x400a8000

            jump_6ac8:
/*0x6ac8*/      push {r4, lr}
/*0x6aca*/      mov r4, r0
/*0x6acc*/      ldr r0, [pc, #0x68] /* data_6b38 */
/*0x6ace*/      ldr r2, [r0]
/*0x6ad0*/      cmp r2, #1
/*0x6ad2*/      bne jump_6b34
/*0x6ad4*/      movs r2, #0
/*0x6ad6*/      str r2, [r0]
/*0x6ad8*/      ldr r0, [pc, #0x60] /* data_6b3c */
/*0x6ada*/      ldr r2, [r0]
/*0x6adc*/      lsls r3, r2, #0x19
/*0x6ade*/      mov.w r2, #-1
/*0x6ae2*/      bpl jump_6afe
/*0x6ae4*/      movw r3, #0x40c
/*0x6ae8*/      str r3, [r0]
/*0x6aea*/      str r2, [r0, #8]
/*0x6aec*/      cbnz r1, jump_6af4
/*0x6aee*/      movs r0, #0
/*0x6af0*/      bl call_5c34
            jump_6af4:
/*0x6af4*/      ldr r0, [r4]
/*0x6af6*/      pop.w {r4, lr}
/*0x6afa*/      b.w call_6a64
            jump_6afe:
/*0x6afe*/      movw r3, #0xc0c
/*0x6b02*/      str r3, [r0]
/*0x6b04*/      str r2, [r0, #8]
/*0x6b06*/      cbnz r1, jump_6b0e
/*0x6b08*/      movs r0, #0
/*0x6b0a*/      bl call_5c34
            jump_6b0e:
/*0x6b0e*/      movs r0, #0
/*0x6b10*/      bl call_6868
/*0x6b14*/      ldr r0, [r4]
/*0x6b16*/      bl call_6a64
/*0x6b1a*/      movs r0, #0
/*0x6b1c*/      bl call_6884
/*0x6b20*/      movs r1, #0xc8
/*0x6b22*/      movs r0, #0
            jump_6b24:
/*0x6b24*/      adds r0, r0, #1
/*0x6b26*/      cmp r0, r1
/*0x6b28*/      blo jump_6b24
/*0x6b2a*/      pop.w {r4, lr}
/*0x6b2e*/      movs r0, #1
/*0x6b30*/      b.w call_6884
            jump_6b34:
/*0x6b34*/      pop {r4, pc}

/*0x6b36*/  .byte 0x00
/*0x6b37*/  .byte 0x00

            data_6b38:
/*0x6b38*/  .word 0x20000014
            data_6b3c:
/*0x6b3c*/  .word 0x400a8000

            jump_6b40:
/*0x6b40*/      movw r1, #0x111d
/*0x6b44*/      str r1, [r0]
/*0x6b46*/      ldr r1, [pc, #0x28] /* data_6b70 */
/*0x6b48*/      str r1, [r0, #4]
/*0x6b4a*/      movw r1, #0x212
/*0x6b4e*/      str r1, [r0, #8]
/*0x6b50*/      ldr r1, [pc, #0x20] /* data_6b74 */
/*0x6b52*/      str r1, [r0, #0xc]
/*0x6b54*/      ldr r2, [pc, #0x20] /* data_6b78 */
/*0x6b56*/      movs r1, #0x10
/*0x6b58*/      strd r1, r2, [r0, #0x10]
/*0x6b5c*/      str r1, [r0, #0x18]
/*0x6b5e*/      ldr r1, [pc, #0x1c] /* data_6b7c */
/*0x6b60*/      str r1, [r0, #0x1c]
/*0x6b62*/      movs r1, #0
/*0x6b64*/      str r1, [r0, #0x20]
/*0x6b66*/      ldr r1, [pc, #0x18] /* data_6b80 */
/*0x6b68*/      str r1, [r0, #0x24]
/*0x6b6a*/      movs r1, #2
/*0x6b6c*/      str r1, [r0, #0x28]
/*0x6b6e*/      bx lr

            data_6b70:
/*0x6b70*/  .word 0x80010008
            data_6b74:
/*0x6b74*/  .word 0x91002088
            data_6b78:
/*0x6b78*/  .word 0x92010090
            data_6b7c:
/*0x6b7c*/  .word 0x930100d0
            data_6b80:
/*0x6b80*/  .word 0x84010110


            .thumb_func
            call_6b84:
/*0x6b84*/      push {r4, lr}
/*0x6b86*/      ldr r4, [pc, #0x48] /* data_6bd0 */
/*0x6b88*/      ldrb.w r0, [r4, #0x32]
/*0x6b8c*/      cmp r0, #3
/*0x6b8e*/      bne jump_6b94
/*0x6b90*/      bl call_7784
            jump_6b94:
/*0x6b94*/      ldr r1, [pc, #0x3c] /* data_6bd4 */
/*0x6b96*/      ldrb r0, [r1, #5]
/*0x6b98*/      cbz r0, jump_6bba
/*0x6b9a*/      cmp r0, #1
/*0x6b9c*/      beq jump_6bb2
/*0x6b9e*/      cmp r0, #2
/*0x6ba0*/      bne jump_6bc2
/*0x6ba2*/      ldrb.w r0, [r4, #0x32]
/*0x6ba6*/      cmp r0, #6
/*0x6ba8*/      bne jump_6bae
/*0x6baa*/      bl call_72b0
            jump_6bae:
/*0x6bae*/      movs r0, #2
/*0x6bb0*/      pop {r4, pc}
            jump_6bb2:
/*0x6bb2*/      movs r0, #0
/*0x6bb4*/      strb r0, [r1, #5]
/*0x6bb6*/      movs r0, #3
/*0x6bb8*/      pop {r4, pc}
            jump_6bba:
/*0x6bba*/      ldrb.w r0, [r4, #0x32]
/*0x6bbe*/      cmp r0, #6
/*0x6bc0*/      beq jump_6bc6
            jump_6bc2:
/*0x6bc2*/      movs r0, #0
/*0x6bc4*/      pop {r4, pc}
            jump_6bc6:
/*0x6bc6*/      movs r0, #2
/*0x6bc8*/      strb r0, [r1, #5]
/*0x6bca*/      movs r0, #1
/*0x6bcc*/      pop {r4, pc}

/*0x6bce*/  .byte 0x00
/*0x6bcf*/  .byte 0x00

            data_6bd0:
/*0x6bd0*/  .word 0x200006f4
            data_6bd4:
/*0x6bd4*/  .word 0x20000034


            .thumb_func
            call_6bd8:
/*0x6bd8*/      ldr r1, [pc, #8] /* data_6be4 */
/*0x6bda*/      ldr r2, [r1]
/*0x6bdc*/      str r2, [r0]
/*0x6bde*/      ldr r1, [r1, #4]
/*0x6be0*/      str r1, [r0, #4]
/*0x6be2*/      bx lr

            data_6be4:
/*0x6be4*/  .word 0x400aa000

            jump_6be8:
/*0x6be8*/      ldr r0, [pc, #8] /* data_6bf4 */
/*0x6bea*/      ldr r1, [r0]
/*0x6bec*/      orr r1, r1, #0x20
/*0x6bf0*/      str r1, [r0]
/*0x6bf2*/      bx lr

            data_6bf4:
/*0x6bf4*/  .word 0x400a8000


            .thumb_func
            call_6bf8:
/*0x6bf8*/      ldr r1, [pc, #0xc] /* data_6c08 */
/*0x6bfa*/      ldr r2, [r1]
/*0x6bfc*/      orr r2, r2, #0x100
/*0x6c00*/      str r2, [r1]
/*0x6c02*/      str r0, [r1, #0x10]
/*0x6c04*/      bx lr

/*0x6c06*/  .byte 0x00
/*0x6c07*/  .byte 0x00

            data_6c08:
/*0x6c08*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x6c0c*/      ldr r0, [pc, #4] /* data_6c14 */
/*0x6c0e*/      b.w jump_6650

/*0x6c12*/  .byte 0x00
/*0x6c13*/  .byte 0x00

            data_6c14:
/*0x6c14*/  .word 0x200006f4


            .thumb_func
            call_6c18:
/*0x6c18*/      ldr r1, [pc, #0x1c] /* data_6c38 */
/*0x6c1a*/      movs r0, #0x10
/*0x6c1c*/      str.w r0, [r1, #0x10c]
/*0x6c20*/      ldr r0, [pc, #0x18] /* data_6c3c */
/*0x6c22*/      movw r1, #0x5fff
/*0x6c26*/      str r1, [r0, #8]
/*0x6c28*/      ldr r1, [pc, #0x14] /* data_6c40 */
/*0x6c2a*/      str r1, [r0, #4]
/*0x6c2c*/      movw r1, #0xca35
/*0x6c30*/      str r1, [r0, #0x10]
/*0x6c32*/      ldr r1, [pc, #0x10] /* data_6c44 */
/*0x6c34*/      str r1, [r0]
/*0x6c36*/      bx lr

            data_6c38:
/*0x6c38*/  .word 0x40088000
            data_6c3c:
/*0x6c3c*/  .word 0x40068000
            data_6c40:
/*0x6c40*/  .word 0x0001a7d0
            data_6c44:
/*0x6c44*/  .word 0x5fa00001


            .thumb_func
            call_6c48:
/*0x6c48*/      ldr r1, [pc, #8] /* data_6c54 */
/*0x6c4a*/      ldr r0, [pc, #4] /* data_6c50 */
/*0x6c4c*/      str r0, [r1]
/*0x6c4e*/      bx lr

            data_6c50:
/*0x6c50*/  .word 0x5fa00001
            data_6c54:
/*0x6c54*/  .word 0x40068000

            jump_6c58:
/*0x6c58*/      push {r4, lr}
/*0x6c5a*/      bl call_3bec
/*0x6c5e*/      ldr r1, [pc, #0x10] /* data_6c70 */
/*0x6c60*/      movs r0, #0
/*0x6c62*/      str r0, [r1, #4]
/*0x6c64*/      ldr r1, [pc, #0xc] /* data_6c74 */
/*0x6c66*/      strb r0, [r1, #6]
/*0x6c68*/      movs r0, #1
/*0x6c6a*/      strb r0, [r1]
/*0x6c6c*/      pop {r4, pc}

/*0x6c6e*/  .byte 0x00
/*0x6c6f*/  .byte 0x00

            data_6c70:
/*0x6c70*/  .word 0x20000004
            data_6c74:
/*0x6c74*/  .word 0x20000648

            jump_6c78:
/*0x6c78*/      push {r4, r5, r6, lr}
/*0x6c7a*/      mov r6, r0
/*0x6c7c*/      mov r5, r2
/*0x6c7e*/      mov r4, r1
/*0x6c80*/      mov r0, r1
/*0x6c82*/      bl call_4424
/*0x6c86*/      mov r2, r5
/*0x6c88*/      mov r1, r4
/*0x6c8a*/      mov r0, r6
/*0x6c8c*/      pop.w {r4, r5, r6, lr}
/*0x6c90*/      b.w jump_4474

            .thumb_func
            call_6c94:
/*0x6c94*/      push {r4, r5, lr}
/*0x6c96*/      ldr r1, [pc, #0x24] /* data_6cbc */
/*0x6c98*/      movs r0, #0xa
/*0x6c9a*/      ldr r2, [pc, #0x1c] /* data_6cb8 */
/*0x6c9c*/      ldr r3, [pc, #0x20] /* data_6cc0 */
/*0x6c9e*/      ldrb.w r1, [r1, #0x25]
/*0x6ca2*/      b jump_6cae
            jump_6ca4:
/*0x6ca4*/      ldrb r4, [r2, r0]
/*0x6ca6*/      muls r4, r1, r4
/*0x6ca8*/      lsrs r4, r4, #3
/*0x6caa*/      adds r5, r3, r0
/*0x6cac*/      strb r4, [r5, #4]
            jump_6cae:
/*0x6cae*/      subs r0, r0, #1
/*0x6cb0*/      uxtb r0, r0
/*0x6cb2*/      bhs jump_6ca4
/*0x6cb4*/      pop {r4, r5, pc}

/*0x6cb6*/  .byte 0x00
/*0x6cb7*/  .byte 0x00

            data_6cb8:
/*0x6cb8*/  .word data_7bab
            data_6cbc:
/*0x6cbc*/  .word 0x20000730
            data_6cc0:
/*0x6cc0*/  .word 0x2000008c


            .thumb_func
            call_6cc4:
/*0x6cc4*/      push {r4, r5, r6, r7, lr}
/*0x6cc6*/      ldr r6, [pc, #0x194] /* data_6e5c */
/*0x6cc8*/      ldr r4, [pc, #0x194] /* data_6e60 */
/*0x6cca*/      sub sp, #0x2c
/*0x6ccc*/      ldrb r0, [r6, #3]
/*0x6cce*/      cmp r0, #5
/*0x6cd0*/      bhi jump_6d6e
/*0x6cd2*/      cmp r0, #6
/*0x6cd4*/      bhs jump_6d0a
/*0x6cd6*/      tbb [pc, r0]

/*0x6cda*/  .byte 0x03 /* case switch_6ce0 */
/*0x6cdb*/  .byte 0x03 /* case switch_6ce0 */
/*0x6cdc*/  .byte 0x1d /* case switch_6d14 */
/*0x6cdd*/  .byte 0x56 /* case switch_6d86 */
/*0x6cde*/  .byte 0x43 /* case switch_6d60 */
/*0x6cdf*/  .byte 0x43 /* case switch_6d60 */

            switch_6ce0:
/*0x6ce0*/      movs r5, #3
/*0x6ce2*/      ldr r7, [pc, #0x180] /* data_6e64 */
/*0x6ce4*/      b jump_6d04
            jump_6ce6:
/*0x6ce6*/      ldrb r0, [r6, #3]
/*0x6ce8*/      cbz r0, jump_6d0e
/*0x6cea*/      adds r0, r4, r5
/*0x6cec*/      ldrb r0, [r0, #4]
            jump_6cee:
/*0x6cee*/      ldr r1, [r4]
/*0x6cf0*/      ldrb r1, [r1, #3]
/*0x6cf2*/      muls r0, r1, r0
/*0x6cf4*/      lsrs r2, r0, #3
/*0x6cf6*/      add.w r0, r5, r5, lsl #3
/*0x6cfa*/      add.w r0, r7, r0, lsl #3
/*0x6cfe*/      movs r1, #0x48
/*0x6d00*/      bl mem_set /* (dest, size, val) */
            jump_6d04:
/*0x6d04*/      subs r5, r5, #1
/*0x6d06*/      uxtb r5, r5
/*0x6d08*/      bhs jump_6ce6
            jump_6d0a:
/*0x6d0a*/      add sp, #0x2c
/*0x6d0c*/      pop {r4, r5, r6, r7, pc}
            jump_6d0e:
/*0x6d0e*/      ldr r0, [r4]
/*0x6d10*/      ldrb r0, [r0, r5]
/*0x6d12*/      b jump_6cee
            switch_6d14:
/*0x6d14*/      ldrb r7, [r4, #4]
/*0x6d16*/      movs r5, #0xe
/*0x6d18*/      mov r6, sp
/*0x6d1a*/      b jump_6d38
            jump_6d1c:
/*0x6d1c*/      ldr r0, [r4]
/*0x6d1e*/      ldrb r0, [r0, #3]
/*0x6d20*/      lsls r1, r0, #5
/*0x6d22*/      sub.w r0, r1, r0, lsl #1
/*0x6d26*/      uxtb r1, r0
/*0x6d28*/      add.w r0, r5, r5, lsl #1
/*0x6d2c*/      adds r2, r0, r6
/*0x6d2e*/      mov r0, r7
/*0x6d30*/      bl call_3fe8
/*0x6d34*/      adds r7, #0x20
/*0x6d36*/      uxtb r7, r7
            jump_6d38:
/*0x6d38*/      subs r5, r5, #1
/*0x6d3a*/      uxtb r5, r5
/*0x6d3c*/      bhs jump_6d1c
/*0x6d3e*/      ldr r5, [pc, #0x128] /* data_6e68 */
/*0x6d40*/      movs r4, #0x48
/*0x6d42*/      b jump_6d58
            jump_6d44:
/*0x6d44*/      ldrb r0, [r5]
/*0x6d46*/      cmp r0, #0xe
/*0x6d48*/      bhs jump_6d56
/*0x6d4a*/      add.w r0, r0, r0, lsl #1
/*0x6d4e*/      adds r1, r0, r6
/*0x6d50*/      mov r0, r4
/*0x6d52*/      bl call_408c
            jump_6d56:
/*0x6d56*/      subs r5, r5, #1
            jump_6d58:
/*0x6d58*/      subs r4, r4, #1
/*0x6d5a*/      uxtb r4, r4
/*0x6d5c*/      bhs jump_6d44
/*0x6d5e*/      b jump_6d0a
            switch_6d60:
/*0x6d60*/      add sp, #0x2c
/*0x6d62*/      subs r0, r0, #4
/*0x6d64*/      pop.w {r4, r5, r6, r7, lr}
/*0x6d68*/      uxtb r0, r0
/*0x6d6a*/      b.w jump_3a18
            jump_6d6e:
/*0x6d6e*/      cmp r0, #7
/*0x6d70*/      bls jump_6d0a
/*0x6d72*/      bic r0, r0, #1
/*0x6d76*/      cmp r0, #8
/*0x6d78*/      beq switch_6d86
/*0x6d7a*/      cmp r0, #0xa
/*0x6d7c*/      beq jump_6d92
/*0x6d7e*/      cmp r0, #0xc
/*0x6d80*/      bne jump_6d0a
/*0x6d82*/      movs r5, #0x48
/*0x6d84*/      b jump_6e52
            switch_6d86:
/*0x6d86*/      add sp, #0x2c
/*0x6d88*/      adds r0, r4, #4
/*0x6d8a*/      pop.w {r4, r5, r6, r7, lr}
/*0x6d8e*/      b.w jump_4064
            jump_6d92:
/*0x6d92*/      movs r0, #0
/*0x6d94*/      movs r5, #0xe
/*0x6d96*/      str r0, [sp, #4]
/*0x6d98*/      b jump_6df0
            jump_6d9a:
/*0x6d9a*/      add.w r0, r5, r5, lsl #1
/*0x6d9e*/      add.w r1, r4, r0, lsl #1
/*0x6da2*/      ldrb r0, [r1, #4]!
/*0x6da6*/      cbnz r0, jump_6db0
/*0x6da8*/      ldrb r0, [r1, #1]
/*0x6daa*/      cbnz r0, jump_6db0
/*0x6dac*/      ldrb r0, [r1, #2]
/*0x6dae*/      cbz r0, jump_6ddc
            jump_6db0:
/*0x6db0*/      ldrb r0, [r1, #3]
/*0x6db2*/      cbnz r0, jump_6dbc
/*0x6db4*/      ldrb r0, [r1, #4]
/*0x6db6*/      cbnz r0, jump_6dbc
/*0x6db8*/      ldrb r0, [r1, #5]
/*0x6dba*/      cbz r0, jump_6dd8
            jump_6dbc:
/*0x6dbc*/      movs r2, #3
/*0x6dbe*/      mov r6, sp
/*0x6dc0*/      b jump_6dd0
            jump_6dc2:
/*0x6dc2*/      adds r3, r1, r2
/*0x6dc4*/      ldrb r0, [r1, r2]
/*0x6dc6*/      ldrb r3, [r3, #3]
/*0x6dc8*/      cmp r0, r3
/*0x6dca*/      bhi jump_6dce
/*0x6dcc*/      mov r0, r3
            jump_6dce:
/*0x6dce*/      strb r0, [r6, r2]
            jump_6dd0:
/*0x6dd0*/      subs r2, r2, #1
/*0x6dd2*/      uxtb r2, r2
/*0x6dd4*/      bhs jump_6dc2
/*0x6dd6*/      mov r1, r6
            jump_6dd8:
/*0x6dd8*/      mov r0, r5
/*0x6dda*/      b jump_6dec
            jump_6ddc:
/*0x6ddc*/      ldrb r0, [r1, #3]
/*0x6dde*/      cbnz r0, jump_6de8
/*0x6de0*/      ldrb r0, [r1, #4]
/*0x6de2*/      cbnz r0, jump_6de8
/*0x6de4*/      ldrb r0, [r1, #5]
/*0x6de6*/      cbz r0, jump_6df8
            jump_6de8:
/*0x6de8*/      mov r0, r5
/*0x6dea*/      adds r1, r1, #3
            jump_6dec:
/*0x6dec*/      bl call_6e6c
            jump_6df0:
/*0x6df0*/      subs r5, r5, #1
/*0x6df2*/      uxtb r5, r5
/*0x6df4*/      bhs jump_6d9a
/*0x6df6*/      b jump_6d0a
            jump_6df8:
/*0x6df8*/      add r1, sp, #4
/*0x6dfa*/      b jump_6dd8
            jump_6dfc:
/*0x6dfc*/      ldr r0, [pc, #0x68] /* data_6e68 */
/*0x6dfe*/      adds r0, r0, #1
/*0x6e00*/      ldrb r1, [r0, r5]
/*0x6e02*/      and r0, r1, #7
/*0x6e06*/      add.w r0, r0, r0, lsl #2
/*0x6e0a*/      add r0, r4
/*0x6e0c*/      ldrsb.w r2, [r0, #0x12]
/*0x6e10*/      adds r0, #0xe
/*0x6e12*/      cbz r2, jump_6e4a
/*0x6e14*/      ldrb r3, [r0, #3]
/*0x6e16*/      rsbs r1, r3, r1, lsr #3
/*0x6e1a*/      bpl jump_6e1e
/*0x6e1c*/      rsbs r1, r1, #0
            jump_6e1e:
/*0x6e1e*/      subs r1, r1, r2
/*0x6e20*/      adds r1, #0xa
/*0x6e22*/      uxtb r2, r1
/*0x6e24*/      cmp r2, #0xa
/*0x6e26*/      bhs jump_6e4a
/*0x6e28*/      movs r1, #3
/*0x6e2a*/      mov r3, sp
/*0x6e2c*/      adds r6, r4, r2
/*0x6e2e*/      b jump_6e3a
            jump_6e30:
/*0x6e30*/      ldrb r2, [r0, r1]
/*0x6e32*/      ldrb r7, [r6, #4]
/*0x6e34*/      muls r2, r7, r2
/*0x6e36*/      lsrs r2, r2, #8
/*0x6e38*/      strb r2, [r3, r1]
            jump_6e3a:
/*0x6e3a*/      subs r1, r1, #1
/*0x6e3c*/      uxtb r1, r1
/*0x6e3e*/      bhs jump_6e30
/*0x6e40*/      mov r1, r3
/*0x6e42*/      mov r0, r5
/*0x6e44*/      bl call_408c
/*0x6e48*/      b jump_6e52
            jump_6e4a:
/*0x6e4a*/      movs r1, #0
/*0x6e4c*/      mov r0, r5
/*0x6e4e*/      bl call_40d0
            jump_6e52:
/*0x6e52*/      subs r5, r5, #1
/*0x6e54*/      uxtb r5, r5
/*0x6e56*/      bhs jump_6dfc
/*0x6e58*/      b jump_6d0a

/*0x6e5a*/  .byte 0x00
/*0x6e5b*/  .byte 0x00

            data_6e5c:
/*0x6e5c*/  .word 0x20000730
            data_6e60:
/*0x6e60*/  .word 0x2000008c
            data_6e64:
/*0x6e64*/  .word 0x2000032e
            data_6e68:
/*0x6e68*/  .word data_7b62


            .thumb_func
            call_6e6c:
/*0x6e6c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6e70*/      mov r7, r1
/*0x6e72*/      mov r6, r0
/*0x6e74*/      movs r4, #0x48
/*0x6e76*/      ldr r5, [pc, #0x1c] /* data_6e94 */
/*0x6e78*/      b jump_6e8a
            jump_6e7a:
/*0x6e7a*/      ldrb r0, [r5]
/*0x6e7c*/      cmp r0, r6
/*0x6e7e*/      bne jump_6e88
/*0x6e80*/      mov r1, r7
/*0x6e82*/      mov r0, r4
/*0x6e84*/      bl call_408c
            jump_6e88:
/*0x6e88*/      subs r5, r5, #1
            jump_6e8a:
/*0x6e8a*/      subs r4, r4, #1
/*0x6e8c*/      uxtb r4, r4
/*0x6e8e*/      bhs jump_6e7a
/*0x6e90*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6e94:
/*0x6e94*/  .word data_7b62


            .thumb_func
            call_6e98:
/*0x6e98*/      push {r3, r4, r5, lr}
/*0x6e9a*/      mov r4, r0
/*0x6e9c*/      ldr r0, [pc, #0x24] /* data_6ec4 */
/*0x6e9e*/      ldr r0, [r0]
/*0x6ea0*/      ldrb r5, [r0, #3]
/*0x6ea2*/      cbnz r1, jump_6eac
/*0x6ea4*/      mov r0, sp
/*0x6ea6*/      bl call_3fc6
/*0x6eaa*/      mov r1, sp
            jump_6eac:
/*0x6eac*/      movs r2, #3
/*0x6eae*/      b jump_6ebc
            jump_6eb0:
/*0x6eb0*/      ldrb r0, [r1], #1
/*0x6eb4*/      muls r0, r5, r0
/*0x6eb6*/      lsrs r0, r0, #3
/*0x6eb8*/      strb r0, [r4], #1
            jump_6ebc:
/*0x6ebc*/      subs r2, r2, #1
/*0x6ebe*/      uxtb r2, r2
/*0x6ec0*/      bhs jump_6eb0
/*0x6ec2*/      pop {r3, r4, r5, pc}

            data_6ec4:
/*0x6ec4*/  .word 0x2000008c


            .thumb_func
            call_6ec8:
/*0x6ec8*/      mov.w r1, #0x8000
/*0x6ecc*/      cmp r0, r1
/*0x6ece*/      blo jump_6ed4
/*0x6ed0*/      and.w r0, r1, r0, lsr #10
            jump_6ed4:
/*0x6ed4*/      uxth r0, r0
/*0x6ed6*/      bx lr

            .thumb_func
            call_6ed8:
/*0x6ed8*/      ldr r2, [pc, #0x14] /* data_6ef0 */
/*0x6eda*/      push {lr}
/*0x6edc*/      ldr r0, [r2]
/*0x6ede*/      cbz r0, jump_6eea
/*0x6ee0*/      bl call_6ec8
/*0x6ee4*/      movs r1, #0x1e
/*0x6ee6*/      str r1, [r2]
/*0x6ee8*/      pop {pc}
            jump_6eea:
/*0x6eea*/      movs r0, #0x1e
/*0x6eec*/      pop {pc}

/*0x6eee*/  .byte 0x00
/*0x6eef*/  .byte 0x00

            data_6ef0:
/*0x6ef0*/  .word 0x200019d0


            .thumb_func
            call_6ef4:
/*0x6ef4*/      lsls r1, r0, #0x10
/*0x6ef6*/      bpl jump_6efa
/*0x6ef8*/      lsls r0, r0, #0xa
            jump_6efa:
/*0x6efa*/      bx lr

            .thumb_func
            call_6efc:
/*0x6efc*/      ldr r0, [pc, #0x3c] /* data_6f3c */
/*0x6efe*/      push {r4, lr}
/*0x6f00*/      ldrb r0, [r0]
/*0x6f02*/      and r0, r0, #3
/*0x6f06*/      add.w r0, r0, r0, lsl #1
/*0x6f0a*/      lsls r4, r0, #3
/*0x6f0c*/      ldr r0, [pc, #0x30] /* data_6f40 */
/*0x6f0e*/      ldr r0, [r0]
/*0x6f10*/      bl call_4a1a
/*0x6f14*/      mov r3, r0
/*0x6f16*/      movs r0, #0x18
/*0x6f18*/      ldr r1, [pc, #0x28] /* data_6f44 */
/*0x6f1a*/      b jump_6f32
            jump_6f1c:
/*0x6f1c*/      add.w r2, r1, r4, lsl #1
/*0x6f20*/      ldrh r2, [r2, #0x28]
/*0x6f22*/      ubfx r2, r2, #0, #0xa
/*0x6f26*/      cmp r2, r3
/*0x6f28*/      bne jump_6f2e
/*0x6f2a*/      mov r0, r4
/*0x6f2c*/      pop {r4, pc}
            jump_6f2e:
/*0x6f2e*/      adds r4, r4, #1
/*0x6f30*/      uxtb r4, r4
            jump_6f32:
/*0x6f32*/      subs r0, r0, #1
/*0x6f34*/      uxtb r0, r0
/*0x6f36*/      bhs jump_6f1c
/*0x6f38*/      movs r0, #0x60
/*0x6f3a*/      pop {r4, pc}

            data_6f3c:
/*0x6f3c*/  .word 0x20000001
            data_6f40:
/*0x6f40*/  .word 0x20000030
            data_6f44:
/*0x6f44*/  .word 0x20000730


            .thumb_func
            call_6f48:
/*0x6f48*/      ldr r0, [pc, #0xc] /* data_6f58 */
/*0x6f4a*/      movs r1, #0
/*0x6f4c*/      str r1, [r0, #0xa]!
/*0x6f50*/      str r1, [r0, #4]
/*0x6f52*/      strh r1, [r0, #8]
/*0x6f54*/      bx lr

/*0x6f56*/  .byte 0x00
/*0x6f57*/  .byte 0x00

            data_6f58:
/*0x6f58*/  .word 0x200001ac


            .thumb_func
            call_6f5c:
/*0x6f5c*/      push {r4, r5, r6, lr}
/*0x6f5e*/      ldr r4, [pc, #0x68] /* data_6fc8 */
/*0x6f60*/      ldr r1, [pc, #0x68] /* data_6fcc */
/*0x6f62*/      movs r0, #0x60
/*0x6f64*/      strb r0, [r4, #2]
/*0x6f66*/      ldrb r0, [r1, #1]
/*0x6f68*/      lsls r0, r0, #0x1f
/*0x6f6a*/      beq jump_6f7a
/*0x6f6c*/      ldrb r0, [r1, #2]
/*0x6f6e*/      movs r1, #0
/*0x6f70*/      bl call_46f4
/*0x6f74*/      cmp r0, #0
/*0x6f76*/      beq jump_6fc6
/*0x6f78*/      b jump_6f8e
            jump_6f7a:
/*0x6f7a*/      movs r0, #2
/*0x6f7c*/      ldr r2, [pc, #0x50] /* data_6fd0 */
/*0x6f7e*/      ldrb r1, [r1]
/*0x6f80*/      b jump_6f88
            jump_6f82:
/*0x6f82*/      ldrb r3, [r2, r0]
/*0x6f84*/      cmp r1, r3
/*0x6f86*/      beq jump_6fc6
            jump_6f88:
/*0x6f88*/      subs r0, r0, #1
/*0x6f8a*/      uxtb r0, r0
/*0x6f8c*/      bhs jump_6f82
            jump_6f8e:
/*0x6f8e*/      bl call_5b38
/*0x6f92*/      cmp r0, #0
/*0x6f94*/      bne jump_6fc6
/*0x6f96*/      ldr r0, [pc, #0x3c] /* data_6fd4 */
/*0x6f98*/      ldr r2, [pc, #0x3c] /* data_6fd8 */
/*0x6f9a*/      ldr r3, [pc, #0x40] /* data_6fdc */
/*0x6f9c*/      ldrb r0, [r0]
/*0x6f9e*/      and r0, r0, #3
/*0x6fa2*/      add.w r0, r0, r0, lsl #1
/*0x6fa6*/      lsls r0, r0, #3
/*0x6fa8*/      strb r0, [r4, #2]
/*0x6faa*/      movs r0, #0x18
/*0x6fac*/      b jump_6fc0
            jump_6fae:
/*0x6fae*/      ldrb r1, [r4, #2]
/*0x6fb0*/      add.w r5, r2, r1, lsl #1
/*0x6fb4*/      ldrh r5, [r5, #0x28]
/*0x6fb6*/      cmp.w r3, r5, lsl #22
/*0x6fba*/      beq jump_6fc6
/*0x6fbc*/      adds r1, r1, #1
/*0x6fbe*/      strb r1, [r4, #2]
            jump_6fc0:
/*0x6fc0*/      subs r0, r0, #1
/*0x6fc2*/      uxtb r0, r0
/*0x6fc4*/      bhs jump_6fae
            jump_6fc6:
/*0x6fc6*/      pop {r4, r5, r6, pc}

            data_6fc8:
/*0x6fc8*/  .word 0x200019cc
            data_6fcc:
/*0x6fcc*/  .word 0x20000030
            data_6fd0:
/*0x6fd0*/  .word data_7a90
            data_6fd4:
/*0x6fd4*/  .word 0x20000001
            data_6fd8:
/*0x6fd8*/  .word 0x20000730
            data_6fdc:
/*0x6fdc*/  .word 0xffc00000

            jump_6fe0:
/*0x6fe0*/      push {r3, r4, r5, lr}
/*0x6fe2*/      ldr r1, [pc, #0xa0] /* data_7084 */
/*0x6fe4*/      ldr r2, [pc, #0xa0] /* data_7088 */
/*0x6fe6*/      ldrh r0, [r1]
/*0x6fe8*/      ldr r2, [r2]
/*0x6fea*/      add.w r4, r2, r0, lsl #2
/*0x6fee*/      adds r0, r0, #1
/*0x6ff0*/      strh r0, [r1]
/*0x6ff2*/      ldrb r0, [r4, #1]
/*0x6ff4*/      movs r1, #4
/*0x6ff6*/      cmp.w r1, r0, lsr #5
/*0x6ffa*/      beq jump_7078
/*0x6ffc*/      movs r0, #0
/*0x6ffe*/      str r0, [sp]
/*0x7000*/      ldrh r0, [r4]
/*0x7002*/      mov r1, sp
/*0x7004*/      bl call_4a10
/*0x7008*/      ldrb r0, [r4, #1]
/*0x700a*/      lsrs r0, r0, #5
/*0x700c*/      cmp r0, #1
/*0x700e*/      beq jump_7016
/*0x7010*/      cmp r0, #2
/*0x7012*/      bne jump_702c
/*0x7014*/      b jump_7020
            jump_7016:
/*0x7016*/      ldrb.w r0, [sp, #3]
/*0x701a*/      orr r0, r0, #2
/*0x701e*/      b jump_7028
            jump_7020:
/*0x7020*/      ldrb.w r0, [sp, #3]
/*0x7024*/      bic r0, r0, #2
            jump_7028:
/*0x7028*/      strb.w r0, [sp, #3]
            jump_702c:
/*0x702c*/      ldrb.w r0, [sp, #1]
/*0x7030*/      lsls r0, r0, #0x1f
/*0x7032*/      ldrb.w r0, [sp]
/*0x7036*/      beq jump_703e
/*0x7038*/      bl call_46d4
/*0x703c*/      b jump_7042
            jump_703e:
/*0x703e*/      ldr r1, [pc, #0x4c] /* data_708c */
/*0x7040*/      ldrb r0, [r1, r0]
            jump_7042:
/*0x7042*/      strb.w r0, [sp, #2]
/*0x7046*/      ldrb.w r0, [sp, #3]
/*0x704a*/      orr r0, r0, #5
/*0x704e*/      strb.w r0, [sp, #3]
/*0x7052*/      ldrb.w r1, [sp, #1]
/*0x7056*/      ldrb.w r2, [sp, #2]
/*0x705a*/      and r1, r1, #1
/*0x705e*/      add.w r1, r1, r1, lsl #2
/*0x7062*/      add.w r1, r2, r1, lsl #1
/*0x7066*/      ubfx r2, r0, #1, #1
/*0x706a*/      uxtb r1, r1
/*0x706c*/      ldr r0, [pc, #0x20] /* data_7090 */
/*0x706e*/      bl call_3fa8
/*0x7072*/      ldr r0, [sp]
/*0x7074*/      bl call_4780
            jump_7078:
/*0x7078*/      ldrh r0, [r4, #2]
/*0x707a*/      bl call_6ef4
/*0x707e*/      ldr r1, [pc, #0x14] /* data_7094 */
/*0x7080*/      str r0, [r1]
/*0x7082*/      pop {r3, r4, r5, pc}

            data_7084:
/*0x7084*/  .word 0x200019cc
            data_7088:
/*0x7088*/  .word 0x20000058
            data_708c:
/*0x708c*/  .word 0x200001c0
            data_7090:
/*0x7090*/  .word 0x200001b6
            data_7094:
/*0x7094*/  .word 0x20000060

            jump_7098:
/*0x7098*/      push {r4, r5, r6, lr}
/*0x709a*/      ldr r5, [pc, #0x60] /* data_70fc */
/*0x709c*/      ldrh r0, [r5]
/*0x709e*/      cmp r0, #0xff
/*0x70a0*/      bls jump_70aa
/*0x70a2*/      movs r0, #1
/*0x70a4*/      adds r1, r5, #4
/*0x70a6*/      strb r0, [r1, #7]
/*0x70a8*/      b jump_70b8
            jump_70aa:
/*0x70aa*/      ldr r6, [pc, #0x54] /* data_7100 */
/*0x70ac*/      ldrb r1, [r6, #1]
/*0x70ae*/      lsls r1, r1, #0x1f
/*0x70b0*/      beq jump_70bc
/*0x70b2*/      ldrb r1, [r6]
/*0x70b4*/      cmp r1, #0xc0
/*0x70b6*/      bhs jump_70bc
            jump_70b8:
/*0x70b8*/      movs r0, #1
/*0x70ba*/      pop {r4, r5, r6, pc}
            jump_70bc:
/*0x70bc*/      ldr r1, [pc, #0x44] /* data_7104 */
/*0x70be*/      ldr r1, [r1]
/*0x70c0*/      add.w r4, r1, r0, lsl #2
/*0x70c4*/      adds r0, r0, #1
/*0x70c6*/      strh r0, [r5]
/*0x70c8*/      ldr r0, [r6]
/*0x70ca*/      bl call_4a1a
/*0x70ce*/      strh r0, [r4]
/*0x70d0*/      ldrb r1, [r6, #3]
/*0x70d2*/      lsls r1, r1, #0x1e
/*0x70d4*/      bpl jump_70dc
/*0x70d6*/      add.w r0, r0, #0x3c00
/*0x70da*/      b jump_70e0
            jump_70dc:
/*0x70dc*/      add.w r0, r0, #0x5c00
            jump_70e0:
/*0x70e0*/      strh r0, [r4]
/*0x70e2*/      ldrh r0, [r5]
/*0x70e4*/      cmp r0, #1
/*0x70e6*/      bls jump_70f0
/*0x70e8*/      bl call_6ed8
/*0x70ec*/      strh r0, [r4, #-0x2]
            jump_70f0:
/*0x70f0*/      ldr r1, [pc, #0x14] /* data_7108 */
/*0x70f2*/      mov.w r0, #-1
/*0x70f6*/      str r0, [r1]
/*0x70f8*/      movs r0, #0
/*0x70fa*/      pop {r4, r5, r6, pc}

            data_70fc:
/*0x70fc*/  .word 0x200019cc
            data_7100:
/*0x7100*/  .word 0x20000030
            data_7104:
/*0x7104*/  .word 0x20000058
            data_7108:
/*0x7108*/  .word 0x20000060

            jump_710c:
/*0x710c*/      push {r4, lr}
/*0x710e*/      ldr r4, [pc, #0x18] /* data_7128 */
/*0x7110*/      movs r1, #0
/*0x7112*/      ldrb r0, [r4, #2]
/*0x7114*/      bl call_3d90
/*0x7118*/      movs r0, #0
/*0x711a*/      adds r1, r4, #4
/*0x711c*/      strh r0, [r4]
/*0x711e*/      str r0, [r1]
/*0x7120*/      movs r0, #4
/*0x7122*/      strb r0, [r1, #7]
/*0x7124*/      pop {r4, pc}

/*0x7126*/  .byte 0x00
/*0x7127*/  .byte 0x00

            data_7128:
/*0x7128*/  .word 0x200019cc


            .thumb_func
            call_712c:
/*0x712c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7130*/      ldr r4, [pc, #0xa0] /* data_71d4 */
/*0x7132*/      ldr r5, [pc, #0xa4] /* data_71d8 */
/*0x7134*/      ldr.w r8, [pc, #0xa4] /* data_71dc */
/*0x7138*/      ldr r7, [pc, #0xa4] /* data_71e0 */
/*0x713a*/      movs r6, #0xa
            jump_713c:
/*0x713c*/      ldrd r0, r1, [r5]
/*0x7140*/      str r1, [r0, #0x28]
/*0x7142*/      subs r6, r6, #1
/*0x7144*/      uxtb r6, r6
/*0x7146*/      subs r4, r4, #3
/*0x7148*/      nop 
/*0x714a*/      nop 
/*0x714c*/      movs r0, #0xff
/*0x714e*/      ldr r1, [r7, #0x1c]
/*0x7150*/      lsls r1, r1, #0x16
/*0x7152*/      bmi jump_7156
/*0x7154*/      movs r0, #0xfe
            jump_7156:
/*0x7156*/      ldr.w r2, [r8, #0x1c]
/*0x715a*/      mov r1, r8
/*0x715c*/      lsls r2, r2, #0x1a
/*0x715e*/      bmi jump_7164
/*0x7160*/      bic r0, r0, #2
            jump_7164:
/*0x7164*/      ldr r2, [r1, #0x1c]
/*0x7166*/      lsls r2, r2, #0x19
/*0x7168*/      bmi jump_716e
/*0x716a*/      bic r0, r0, #4
            jump_716e:
/*0x716e*/      ldr r1, [r1, #0x1c]
/*0x7170*/      lsls r1, r1, #0x18
/*0x7172*/      bmi jump_7178
/*0x7174*/      bic r0, r0, #8
            jump_7178:
/*0x7178*/      ldr r1, [r7, #0x1c]
/*0x717a*/      lsls r1, r1, #0x14
/*0x717c*/      bmi jump_7182
/*0x717e*/      bic r0, r0, #0x10
            jump_7182:
/*0x7182*/      ldr r1, [r7, #0x1c]
/*0x7184*/      lsls r1, r1, #0x12
/*0x7186*/      bmi jump_718c
/*0x7188*/      bic r0, r0, #0x20
            jump_718c:
/*0x718c*/      ldr r1, [r7, #0x1c]
/*0x718e*/      lsls r1, r1, #0x11
/*0x7190*/      bmi jump_7196
/*0x7192*/      bic r0, r0, #0x40
            jump_7196:
/*0x7196*/      ldr r1, [r7, #0x1c]
/*0x7198*/      lsls r1, r1, #0x10
/*0x719a*/      bmi jump_71a0
/*0x719c*/      bic r0, r0, #0x80
            jump_71a0:
/*0x71a0*/      ldrd r1, r2, [r5]
/*0x71a4*/      str r2, [r1, #0x24]
/*0x71a6*/      ldrb r1, [r4, #1]
/*0x71a8*/      cmp r1, r0
/*0x71aa*/      beq jump_71b2
/*0x71ac*/      strb r0, [r4, #1]
/*0x71ae*/      movs r0, #3
/*0x71b0*/      b jump_71be
            jump_71b2:
/*0x71b2*/      ldrb r0, [r4]
/*0x71b4*/      cbz r0, jump_71c0
/*0x71b6*/      cmp r0, #1
/*0x71b8*/      bne jump_71bc
/*0x71ba*/      strb r1, [r4, #2]
            jump_71bc:
/*0x71bc*/      subs r0, r0, #1
            jump_71be:
/*0x71be*/      strb r0, [r4]
            jump_71c0:
/*0x71c0*/      cmp r6, #0
/*0x71c2*/      beq jump_71ce
/*0x71c4*/      movs r0, #5
/*0x71c6*/      bl spin_wait /* (time) */
/*0x71ca*/      subs r5, #8
/*0x71cc*/      b jump_713c
            jump_71ce:
/*0x71ce*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x71d2*/  .byte 0x00
/*0x71d3*/  .byte 0x00

            data_71d4:
/*0x71d4*/  .word 0x2000032e
            data_71d8:
/*0x71d8*/  .word data_7ca0
            data_71dc:
/*0x71dc*/  .word 0x400b0000
            data_71e0:
/*0x71e0*/  .word 0x400b4000

            jump_71e4:
/*0x71e4*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x71e6*/      ldr r0, [pc, #0x44] /* data_722c */
/*0x71e8*/      ldr r0, [r0]
/*0x71ea*/      ldr r1, [pc, #0x44] /* data_7230 */
/*0x71ec*/      ldr r6, [pc, #0x44] /* data_7234 */
/*0x71ee*/      udiv r4, r0, r1
/*0x71f2*/      subs r4, r4, #1
/*0x71f4*/      strh.w r4, [sp]
/*0x71f8*/      movs r5, #0
/*0x71fa*/      strh.w r5, [sp, #2]
/*0x71fe*/      mov r1, sp
/*0x7200*/      mov r0, r6
/*0x7202*/      bl call_461a
/*0x7206*/      strb.w r5, [sp]
/*0x720a*/      movs r0, #7
/*0x720c*/      strh.w r0, [sp, #2]
/*0x7210*/      movs r0, #1
/*0x7212*/      strb.w r0, [sp, #4]
/*0x7216*/      strb.w r5, [sp, #5]
/*0x721a*/      lsrs r0, r4, #1
/*0x721c*/      strh.w r0, [sp, #6]
/*0x7220*/      mov r1, sp
/*0x7222*/      mov r0, r6
/*0x7224*/      bl call_45c2
/*0x7228*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x722a*/  .byte 0x00
/*0x722b*/  .byte 0x00

            data_722c:
/*0x722c*/  .word 0x20000010
            data_7230:
/*0x7230*/  .word 0x00dbba00
            data_7234:
/*0x7234*/  .word 0x4006f000


            .thumb_func
            call_7238:
/*0x7238*/      push {r4, lr}
/*0x723a*/      ldr r1, [pc, #0x28] /* data_7264 */
/*0x723c*/      mov.w r4, #0x8000
/*0x7240*/      str r4, [r1, #0x28]
/*0x7242*/      nop 
/*0x7244*/      nop 
/*0x7246*/      str r4, [r1, #0x24]
/*0x7248*/      mov.w r2, #0x4000
/*0x724c*/      b jump_7258
            jump_724e:
/*0x724e*/      str r2, [r1, #0x28]
/*0x7250*/      nop 
/*0x7252*/      nop 
/*0x7254*/      str r2, [r1, #0x24]
/*0x7256*/      nop 
            jump_7258:
/*0x7258*/      subs r0, r0, #1
/*0x725a*/      uxtb r0, r0
/*0x725c*/      bhs jump_724e
/*0x725e*/      str r4, [r1, #0x28]
/*0x7260*/      pop {r4, pc}

/*0x7262*/  .byte 0x00
/*0x7263*/  .byte 0x00

            data_7264:
/*0x7264*/  .word 0x400b0000


            .thumb_func
            call_7268:
/*0x7268*/      push {r4, r5, r6, r7, lr}
/*0x726a*/      movs r2, #4
/*0x726c*/      ldr r3, [pc, #0x24] /* data_7294 */
/*0x726e*/      lsls r4, r2, #0xc
/*0x7270*/      ldr r5, [pc, #0x24] /* data_7298 */
/*0x7272*/      movw r6, #0xffff
/*0x7276*/      b jump_728c
            jump_7278:
/*0x7278*/      nop 
/*0x727a*/      str r4, [r5, #0x28]
/*0x727c*/      lsls r7, r0, #0x10
/*0x727e*/      bpl jump_7284
/*0x7280*/      str r2, [r3, #0x24]
/*0x7282*/      b jump_7286
            jump_7284:
/*0x7284*/      str r2, [r3, #0x28]
            jump_7286:
/*0x7286*/      str r4, [r5, #0x24]
/*0x7288*/      and.w r0, r6, r0, lsl #1
            jump_728c:
/*0x728c*/      subs r1, r1, #1
/*0x728e*/      uxtb r1, r1
/*0x7290*/      bhs jump_7278
/*0x7292*/      pop {r4, r5, r6, r7, pc}

            data_7294:
/*0x7294*/  .word 0x400b4000
            data_7298:
/*0x7298*/  .word 0x400b0000

/*0x729c*/  .byte 0x01
/*0x729d*/  .byte 0x21
/*0x729e*/  .byte 0x81
/*0x729f*/  .byte 0x40
/*0x72a0*/  .byte 0x02
/*0x72a1*/  .byte 0x48
/*0x72a2*/  .byte 0x82
/*0x72a3*/  .byte 0x79
/*0x72a4*/  .byte 0x11
/*0x72a5*/  .byte 0x43
/*0x72a6*/  .byte 0x81
/*0x72a7*/  .byte 0x71
/*0x72a8*/  .byte 0x70
/*0x72a9*/  .byte 0x47
/*0x72aa*/  .byte 0x00
/*0x72ab*/  .byte 0x00
/*0x72ac*/  .byte 0x34
/*0x72ad*/  .byte 0x00
/*0x72ae*/  .byte 0x00
/*0x72af*/  .byte 0x20


            .thumb_func
            call_72b0:
/*0x72b0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x72b4*/      ldr r0, [pc, #0xdc] /* data_7394 */
/*0x72b6*/      ldrb r1, [r0]
/*0x72b8*/      movs r4, #0
/*0x72ba*/      sub.w r5, r0, #0xa
/*0x72be*/      cmp r1, #1
/*0x72c0*/      bne jump_72ce
/*0x72c2*/      strb r4, [r0]
/*0x72c4*/      ldrb r0, [r5, #0x10]
/*0x72c6*/      and r0, r0, #7
/*0x72ca*/      bl call_5bf0
            jump_72ce:
/*0x72ce*/      ldr r6, [pc, #0xc8] /* data_7398 */
/*0x72d0*/      ldr r7, [pc, #0xc8] /* data_739c */
/*0x72d2*/      ldrb r0, [r6]
/*0x72d4*/      cbz r0, jump_72e2
/*0x72d6*/      cmp r0, #2
/*0x72d8*/      beq jump_730c
/*0x72da*/      cmp r0, #4
/*0x72dc*/      beq jump_72e2
/*0x72de*/      cmp r0, #5
/*0x72e0*/      bne jump_731e
            jump_72e2:
/*0x72e2*/      ldrb r0, [r5, #6]
/*0x72e4*/      lsls r0, r0, #0x1b
/*0x72e6*/      bpl jump_731e
/*0x72e8*/      movs r0, #1
/*0x72ea*/      strb r0, [r6]
/*0x72ec*/      movs r2, #0x40
/*0x72ee*/      ldr r1, [pc, #0xb0] /* data_73a0 */
/*0x72f0*/      movs r0, #4
/*0x72f2*/      bl call_69bc
/*0x72f6*/      ldr r2, [pc, #0xa8] /* data_73a0 */
/*0x72f8*/      rsb.w r1, r0, #0x40
/*0x72fc*/      add r0, r2
/*0x72fe*/      bl mem_zero /* (dest, size) */
/*0x7302*/      ldrb r0, [r5, #6]
/*0x7304*/      bic r0, r0, #0x10
/*0x7308*/      strb r0, [r5, #6]
/*0x730a*/      b jump_731e
            jump_730c:
/*0x730c*/      ldr r0, [r7, #0x50]
/*0x730e*/      lsls r0, r0, #0x1e
/*0x7310*/      bpl jump_731e
/*0x7312*/      movs r2, #0x40
/*0x7314*/      ldr r1, [pc, #0x88] /* data_73a0 */
/*0x7316*/      movs r0, #3
/*0x7318*/      bl call_6a1c
/*0x731c*/      strb r4, [r6]
            jump_731e:
/*0x731e*/      ldr r0, [r7, #0x28]
/*0x7320*/      lsls r0, r0, #0x1e
/*0x7322*/      bpl jump_7354
/*0x7324*/      ldrb r0, [r5]
/*0x7326*/      cbz r0, jump_732c
/*0x7328*/      strb r4, [r5]
/*0x732a*/      b jump_7348
            jump_732c:
/*0x732c*/      ldr r1, [pc, #0x74] /* data_73a4 */
/*0x732e*/      ldr r0, [r1]
/*0x7330*/      cbnz r0, jump_7354
/*0x7332*/      add.w r0, r1, #0xc
/*0x7336*/      ldr r0, [r0]
/*0x7338*/      cbz r0, jump_7354
/*0x733a*/      mov.w r2, #0xfa0
/*0x733e*/      muls r0, r2, r0
/*0x7340*/      asrs r2, r2, #3
/*0x7342*/      udiv r0, r0, r2
/*0x7346*/      str r0, [r1]
            jump_7348:
/*0x7348*/      ldr r1, [pc, #0x48] /* data_7394 */
/*0x734a*/      movs r2, #8
/*0x734c*/      adds r1, #0x12
/*0x734e*/      movs r0, #1
/*0x7350*/      bl call_6a1c
            jump_7354:
/*0x7354*/      ldr r0, [r7, #0x3c]
/*0x7356*/      lsls r0, r0, #0x1e
/*0x7358*/      bpl jump_738e
/*0x735a*/      ldrb r0, [r5, #2]
/*0x735c*/      cbz r0, jump_7368
/*0x735e*/      ldr r1, [pc, #0x34] /* data_7394 */
/*0x7360*/      movs r2, #5
/*0x7362*/      strb r4, [r5, #2]
/*0x7364*/      adds r1, #0xa
/*0x7366*/      b jump_7384
            jump_7368:
/*0x7368*/      ldrb r0, [r5, #1]
/*0x736a*/      cbz r0, jump_7376
/*0x736c*/      ldr r1, [pc, #0x24] /* data_7394 */
/*0x736e*/      movs r2, #2
/*0x7370*/      strb r4, [r5, #1]
/*0x7372*/      subs r1, r1, #2
/*0x7374*/      b jump_7384
            jump_7376:
/*0x7376*/      ldrb r0, [r5, #3]
/*0x7378*/      cmp r0, #0
/*0x737a*/      beq jump_738e
/*0x737c*/      ldr r1, [pc, #0x24] /* data_73a4 */
/*0x737e*/      movs r2, #0x1f
/*0x7380*/      strb r4, [r5, #3]
/*0x7382*/      adds r1, #0x18
            jump_7384:
/*0x7384*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7388*/      movs r0, #2
/*0x738a*/      b.w call_6a1c
            jump_738e:
/*0x738e*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7392*/  .byte 0x00
/*0x7393*/  .byte 0x00

            data_7394:
/*0x7394*/  .word 0x2000003e
            data_7398:
/*0x7398*/  .word 0x20000028
            data_739c:
/*0x739c*/  .word 0x400a8000
            data_73a0:
/*0x73a0*/  .word 0x20000608
            data_73a4:
/*0x73a4*/  .word 0x200006bc


            .thumb_func
            loc_73a8:
/*0x73a8*/      push {r4, r5, r6, r7, lr}
/*0x73aa*/      ldrh r1, [r0]
/*0x73ac*/      mov.w r6, #0x100
/*0x73b0*/      movw r5, #0x921
/*0x73b4*/      lsls r7, r6, #1
/*0x73b6*/      movs r3, #1
/*0x73b8*/      ldr r4, [pc, #0xd4] /* data_7490 */
/*0x73ba*/      subw r2, r1, #0x921
/*0x73be*/      cmp r1, r5
/*0x73c0*/      beq jump_743c
/*0x73c2*/      bgt jump_73e0
/*0x73c4*/      adds.w r1, r2, #0x780
/*0x73c8*/      beq jump_73f2
/*0x73ca*/      cmp r1, r6
/*0x73cc*/      beq jump_7430
/*0x73ce*/      cmp r1, r7
/*0x73d0*/      bne jump_745e
/*0x73d2*/      ldrh r1, [r0, #4]
/*0x73d4*/      cmp r1, #0
/*0x73d6*/      bne jump_745e
/*0x73d8*/      ldr r1, [pc, #0xb8] /* data_7494 */
/*0x73da*/      strd r1, r3, [r0, #0x1c]
/*0x73de*/      b jump_7488
            jump_73e0:
/*0x73e0*/      movs r5, #0
/*0x73e2*/      cmp r2, r6
/*0x73e4*/      beq jump_7462
/*0x73e6*/      cmp r2, r7
/*0x73e8*/      bne jump_745e
/*0x73ea*/      ldrh r2, [r0, #4]
/*0x73ec*/      ldrb r1, [r0, #2]
/*0x73ee*/      cbz r2, jump_7460
/*0x73f0*/      b jump_7486
            jump_73f2:
/*0x73f2*/      ldrb r5, [r0, #3]
/*0x73f4*/      ldrb r2, [r0, #2]
/*0x73f6*/      ldrh r4, [r0, #6]
/*0x73f8*/      ldrh r1, [r0, #4]
/*0x73fa*/      cmp r5, #1
/*0x73fc*/      bne jump_745e
/*0x73fe*/      cbz r1, jump_741a
/*0x7400*/      cmp r1, #1
/*0x7402*/      beq jump_745e
/*0x7404*/      cmp r1, #2
/*0x7406*/      bne jump_745e
/*0x7408*/      cmp r2, #1
/*0x740a*/      beq jump_7420
/*0x740c*/      cmp r2, #2
/*0x740e*/      beq jump_742a
/*0x7410*/      cmp r2, #4
/*0x7412*/      bne jump_745e
/*0x7414*/      ldr r1, [pc, #0x78] /* data_7490 */
/*0x7416*/      adds r1, #0xc
/*0x7418*/      b jump_7424
            jump_741a:
/*0x741a*/      ldr r1, [pc, #0x78] /* data_7494 */
/*0x741c*/      adds r1, #0x18
/*0x741e*/      b jump_7424
            jump_7420:
/*0x7420*/      ldr r1, [pc, #0x70] /* data_7494 */
/*0x7422*/      adds r1, r1, #4
            jump_7424:
/*0x7424*/      strd r1, r4, [r0, #0x1c]
/*0x7428*/      b jump_7488
            jump_742a:
/*0x742a*/      ldr r1, [pc, #0x68] /* data_7494 */
/*0x742c*/      adds r1, #0x10
/*0x742e*/      b jump_7424
            jump_7430:
/*0x7430*/      ldrh r1, [r0, #4]
/*0x7432*/      cmp r1, #0
/*0x7434*/      bne jump_745e
/*0x7436*/      strd r4, r3, [r0, #0x1c]
/*0x743a*/      b jump_7488
            jump_743c:
/*0x743c*/      ldrb r3, [r0, #3]
/*0x743e*/      ldrh r2, [r0, #6]
/*0x7440*/      ldrh r1, [r0, #4]
/*0x7442*/      str r2, [r0, #0x20]
/*0x7444*/      cmp r3, #2
/*0x7446*/      bne jump_745e
/*0x7448*/      cmp r1, #0
/*0x744a*/      bne jump_745e
/*0x744c*/      ldr r2, [pc, #0x44] /* data_7494 */
/*0x744e*/      adds r2, #0xc
/*0x7450*/      str r2, [r0, #0x1c]
/*0x7452*/      ldr r2, [pc, #0x44] /* data_7498 */
/*0x7454*/      strd r2, r1, [r0, #0x28]
/*0x7458*/      movs r1, #2
/*0x745a*/      strb.w r1, [r0, #0x24]
            jump_745e:
/*0x745e*/      pop {r4, r5, r6, r7, pc}
            jump_7460:
/*0x7460*/      b jump_7480
            jump_7462:
/*0x7462*/      ldrh r2, [r0, #4]
/*0x7464*/      ldrb r1, [r0, #3]
/*0x7466*/      cmp r2, #0
/*0x7468*/      bne jump_745e
/*0x746a*/      mov.w r2, #0xfa0
/*0x746e*/      str r1, [r4]
/*0x7470*/      muls r1, r2, r1
/*0x7472*/      asrs r2, r2, #3
/*0x7474*/      udiv r1, r1, r2
/*0x7478*/      ldr r2, [pc, #0x14] /* data_7490 */
/*0x747a*/      subs r2, #0xc
/*0x747c*/      str r1, [r2]
/*0x747e*/      b jump_7486
            jump_7480:
/*0x7480*/      ldr r2, [pc, #0x10] /* data_7494 */
/*0x7482*/      subs r2, r2, #4
/*0x7484*/      strb r1, [r2, #4]
            jump_7486:
/*0x7486*/      str r5, [r0, #0x20]
            jump_7488:
/*0x7488*/      strb.w r3, [r0, #0x24]
/*0x748c*/      b jump_745e

/*0x748e*/  .byte 0x00
/*0x748f*/  .byte 0x00

            data_7490:
/*0x7490*/  .word 0x200006c8
            data_7494:
/*0x7494*/  .word 0x20000038
            data_7498:
/*0x7498*/  .word loc_749c


            .thumb_func
            loc_749c:
/*0x749c*/      ldr r2, [pc, #4] /* data_74a4 */
/*0x749e*/      movs r1, #1
/*0x74a0*/      strb r1, [r2, r0]
/*0x74a2*/      bx lr

            data_74a4:
/*0x74a4*/  .word 0x2000003e


            .thumb_func
            loc_74a8:
/*0x74a8*/      ldrb r2, [r0, #3]
/*0x74aa*/      ldrh r1, [r0, #4]
/*0x74ac*/      movs r3, #1
/*0x74ae*/      cmp r2, #0x21
/*0x74b0*/      beq jump_74c2
/*0x74b2*/      cmp r2, #0x22
/*0x74b4*/      bne jump_74fa
/*0x74b6*/      cbz r1, jump_74e4
/*0x74b8*/      cmp r1, #1
/*0x74ba*/      beq jump_74ec
/*0x74bc*/      cmp r1, #2
/*0x74be*/      bne jump_74f6
/*0x74c0*/      b jump_74fc
            jump_74c2:
/*0x74c2*/      cbz r1, jump_74ce
/*0x74c4*/      cmp r1, #1
/*0x74c6*/      beq jump_74d4
/*0x74c8*/      cmp r1, #2
/*0x74ca*/      bne jump_74da
/*0x74cc*/      b jump_74de
            jump_74ce:
/*0x74ce*/      ldr r1, [r0, #0xc]
/*0x74d0*/      adds r1, #0x12
/*0x74d2*/      b jump_74d8
            jump_74d4:
/*0x74d4*/      ldr r1, [r0, #0xc]
/*0x74d6*/      adds r1, #0x2b
            jump_74d8:
/*0x74d8*/      str r1, [r0, #0x1c]
            jump_74da:
/*0x74da*/      movs r1, #9
/*0x74dc*/      b jump_74f4
            jump_74de:
/*0x74de*/      ldr r1, [r0, #0xc]
/*0x74e0*/      adds r1, #0x4b
/*0x74e2*/      b jump_74d8
            jump_74e4:
/*0x74e4*/      ldr r1, [pc, #0x20] /* data_7508 */
/*0x74e6*/      str r1, [r0, #0x1c]
/*0x74e8*/      movs r1, #0x40
/*0x74ea*/      b jump_74f4
            jump_74ec:
/*0x74ec*/      ldr r1, [pc, #0x18] /* data_7508 */
/*0x74ee*/      subs r1, #0xac
/*0x74f0*/      str r1, [r0, #0x1c]
/*0x74f2*/      movs r1, #0x22
            jump_74f4:
/*0x74f4*/      str r1, [r0, #0x20]
            jump_74f6:
/*0x74f6*/      strb.w r3, [r0, #0x24]
            jump_74fa:
/*0x74fa*/      bx lr
            jump_74fc:
/*0x74fc*/      ldr r1, [pc, #8] /* data_7508 */
/*0x74fe*/      subs r1, #0x88
/*0x7500*/      str r1, [r0, #0x1c]
/*0x7502*/      movs r1, #0x86
/*0x7504*/      b jump_74f4

/*0x7506*/  .byte 0x00
/*0x7507*/  .byte 0x00

            data_7508:
/*0x7508*/  .word usb_report0_desc


            .thumb_func
            call_750c:
/*0x750c*/      push {r4, r5, r6, lr}
/*0x750e*/      mov r4, r0
/*0x7510*/      movs r0, #0
/*0x7512*/      bl call_6914
/*0x7516*/      mov r5, r0
/*0x7518*/      ldr r0, [r4, #0x20]
/*0x751a*/      adds r1, r0, #1
/*0x751c*/      beq jump_754c
/*0x751e*/      ldrb.w r1, [r4, #0x24]
/*0x7522*/      cmp r1, #1
/*0x7524*/      bne jump_754c
/*0x7526*/      cmp r0, r5
/*0x7528*/      blo jump_7530
/*0x752a*/      subs r0, r0, r5
/*0x752c*/      str r0, [r4, #0x20]
/*0x752e*/      b jump_753c
            jump_7530:
/*0x7530*/      mov r5, r0
/*0x7532*/      movs r0, #0
/*0x7534*/      str r0, [r4, #0x20]
/*0x7536*/      movs r0, #2
/*0x7538*/      strb.w r0, [r4, #0x24]
            jump_753c:
/*0x753c*/      mov r2, r5
/*0x753e*/      movs r0, #0
/*0x7540*/      ldr r1, [r4, #0x1c]
/*0x7542*/      bl call_6a1c
/*0x7546*/      ldr r0, [r4, #0x1c]
/*0x7548*/      add r0, r5
/*0x754a*/      str r0, [r4, #0x1c]
            jump_754c:
/*0x754c*/      pop {r4, r5, r6, pc}

/*0x754e*/  .byte 0x00
/*0x754f*/  .byte 0x00


            .thumb_func
            call_7550:
/*0x7550*/      push {r4, lr}
/*0x7552*/      mov r4, r0
/*0x7554*/      movs r0, #0
/*0x7556*/      strb.w r0, [r4, #0x24]
/*0x755a*/      str r0, [r4, #0x20]
/*0x755c*/      ldrb r0, [r4]
/*0x755e*/      ands r0, r0, #0x60
/*0x7562*/      beq jump_756a
/*0x7564*/      cmp r0, #0x20
/*0x7566*/      bne jump_757c
/*0x7568*/      b jump_7572
            jump_756a:
/*0x756a*/      mov r0, r4
/*0x756c*/      bl call_75f0
/*0x7570*/      b jump_757c
            jump_7572:
/*0x7572*/      ldr r0, [pc, #0x40] /* data_75b4 */
/*0x7574*/      ldr r1, [r0, #0x14]
/*0x7576*/      cbz r1, jump_757c
/*0x7578*/      mov r0, r4
/*0x757a*/      blx r1
            jump_757c:
/*0x757c*/      ldrb.w r0, [r4, #0x24]
/*0x7580*/      cmp r0, #1
/*0x7582*/      beq jump_7592
/*0x7584*/      cmp r0, #2
/*0x7586*/      beq jump_75a6
/*0x7588*/      pop.w {r4, lr}
/*0x758c*/      movs r0, #0
/*0x758e*/      b.w jump_69fc
            jump_7592:
/*0x7592*/      ldrh r0, [r4, #6]
/*0x7594*/      ldr r1, [r4, #0x20]
/*0x7596*/      cmp r1, r0
/*0x7598*/      ble jump_759c
/*0x759a*/      str r0, [r4, #0x20]
            jump_759c:
/*0x759c*/      mov r0, r4
/*0x759e*/      pop.w {r4, lr}
/*0x75a2*/      b.w call_750c
            jump_75a6:
/*0x75a6*/      movs r2, #0
/*0x75a8*/      pop.w {r4, lr}
/*0x75ac*/      mov r1, r2
/*0x75ae*/      mov r0, r2
/*0x75b0*/      b.w call_6a1c

            data_75b4:
/*0x75b4*/  .word data_80e8

            jump_75b8:
/*0x75b8*/      push {r4, lr}
/*0x75ba*/      mov r4, r0
/*0x75bc*/      movs r0, #0
/*0x75be*/      strb r0, [r4, #0x19]
/*0x75c0*/      cbz r1, jump_75d6
/*0x75c2*/      cmp r1, #1
/*0x75c4*/      beq jump_75da
/*0x75c6*/      cmp r1, #2
/*0x75c8*/      bne jump_75ec
/*0x75ca*/      ldrb r0, [r4, #4]
/*0x75cc*/      and r0, r0, #0xf
/*0x75d0*/      bl call_6922
/*0x75d4*/      b jump_75da
            jump_75d6:
/*0x75d6*/      ldrb.w r0, [r4, #0x34]
            jump_75da:
/*0x75da*/      strb r0, [r4, #0x18]
/*0x75dc*/      add.w r0, r4, #0x18
/*0x75e0*/      str r0, [r4, #0x1c]
/*0x75e2*/      movs r0, #2
/*0x75e4*/      str r0, [r4, #0x20]
/*0x75e6*/      movs r0, #1
/*0x75e8*/      strb.w r0, [r4, #0x24]
            jump_75ec:
/*0x75ec*/      pop {r4, pc}

/*0x75ee*/  .byte 0x00
/*0x75ef*/  .byte 0x00


            .thumb_func
            call_75f0:
/*0x75f0*/      push {r4, r5, r6, lr}
/*0x75f2*/      mov r4, r0
/*0x75f4*/      ldrh r0, [r0]
/*0x75f6*/      movs r5, #1
/*0x75f8*/      cmp.w r0, #0x500
/*0x75fc*/      beq jump_769e
/*0x75fe*/      bgt jump_7642
/*0x7600*/      cmp.w r0, #0x100
/*0x7604*/      beq jump_7690
/*0x7606*/      bgt jump_7620
/*0x7608*/      cmp r0, #0x80
/*0x760a*/      beq jump_7688
/*0x760c*/      cmp r0, #0x81
/*0x760e*/      beq jump_768c
/*0x7610*/      cmp r0, #0x82
/*0x7612*/      bne jump_76e2
/*0x7614*/      movs r1, #2
            jump_7616:
/*0x7616*/      mov r0, r4
/*0x7618*/      pop.w {r4, r5, r6, lr}
/*0x761c*/      b.w jump_75b8
            jump_7620:
/*0x7620*/      cmp.w r0, #0x102
/*0x7624*/      beq jump_7694
/*0x7626*/      cmp.w r0, #0x300
/*0x762a*/      beq jump_7698
/*0x762c*/      sub.w r0, r0, #0x300
/*0x7630*/      subs r0, #2
/*0x7632*/      bne jump_76e2
/*0x7634*/      movs r2, #1
            jump_7636:
/*0x7636*/      movs r1, #2
            jump_7638:
/*0x7638*/      mov r0, r4
/*0x763a*/      pop.w {r4, r5, r6, lr}
/*0x763e*/      b.w jump_7718
            jump_7642:
/*0x7642*/      ldr r1, [pc, #0xcc] /* data_7710 */
/*0x7644*/      cmp.w r0, #0x900
/*0x7648*/      beq jump_76e8
/*0x764a*/      bgt jump_766c
/*0x764c*/      cmp.w r0, #0x680
/*0x7650*/      beq jump_76ac
/*0x7652*/      sub.w r0, r0, #0x600
/*0x7656*/      subs r0, #0x81
/*0x7658*/      beq jump_76e4
/*0x765a*/      sub.w r0, r0, #0x100
/*0x765e*/      subs r0, #0xff
/*0x7660*/      bne jump_76e2
/*0x7662*/      add.w r0, r4, #0x30
/*0x7666*/      strd r0, r5, [r4, #0x1c]
/*0x766a*/      b jump_76de
            jump_766c:
/*0x766c*/      sub.w r0, r0, #0xa00
/*0x7670*/      subs r0, #0x81
/*0x7672*/      beq jump_770a
/*0x7674*/      cmp r0, #0x80
/*0x7676*/      bne jump_76e2
/*0x7678*/      ldr r0, [r1, #0xc]
            jump_767a:
/*0x767a*/      cmp r0, #0
/*0x767c*/      beq jump_76e2
/*0x767e*/      mov r1, r0
/*0x7680*/      mov r0, r4
/*0x7682*/      pop.w {r4, r5, r6, lr}
/*0x7686*/      bx r1
            jump_7688:
/*0x7688*/      movs r1, #0
/*0x768a*/      b jump_7616
            jump_768c:
/*0x768c*/      movs r1, #1
/*0x768e*/      b jump_7616
            jump_7690:
/*0x7690*/      movs r2, #0
/*0x7692*/      b jump_769a
            jump_7694:
/*0x7694*/      movs r2, #0
/*0x7696*/      b jump_7636
            jump_7698:
/*0x7698*/      movs r2, #1
            jump_769a:
/*0x769a*/      movs r1, #0
/*0x769c*/      b jump_7638
            jump_769e:
/*0x769e*/      ldrb r0, [r4, #2]
/*0x76a0*/      bl call_6bf8
/*0x76a4*/      strb.w r5, [r4, #0x24]
/*0x76a8*/      movs r0, #5
/*0x76aa*/      b jump_7704
            jump_76ac:
/*0x76ac*/      ldrb r0, [r4, #3]
/*0x76ae*/      cmp r0, #1
/*0x76b0*/      beq jump_76d2
/*0x76b2*/      cmp r0, #2
/*0x76b4*/      beq jump_76d6
/*0x76b6*/      cmp r0, #3
/*0x76b8*/      bne jump_76e2
/*0x76ba*/      ldrb r0, [r4, #2]
/*0x76bc*/      ldr r1, [r4, #0x14]
/*0x76be*/      cmp r1, r0
/*0x76c0*/      bls jump_76e2
/*0x76c2*/      ldr r1, [r4, #0x10]
/*0x76c4*/      ldr.w r0, [r1, r0, lsl #2]
/*0x76c8*/      cmp r0, #0
/*0x76ca*/      beq jump_76e2
            jump_76cc:
/*0x76cc*/      str r0, [r4, #0x1c]
/*0x76ce*/      ldrb r0, [r0]
/*0x76d0*/      b jump_76dc
            jump_76d2:
/*0x76d2*/      ldr r0, [r4, #8]
/*0x76d4*/      b jump_76cc
            jump_76d6:
/*0x76d6*/      ldr r0, [r4, #0xc]
/*0x76d8*/      str r0, [r4, #0x1c]
/*0x76da*/      ldrh r0, [r0, #2]
            jump_76dc:
/*0x76dc*/      str r0, [r4, #0x20]
            jump_76de:
/*0x76de*/      strb.w r5, [r4, #0x24]
            jump_76e2:
/*0x76e2*/      pop {r4, r5, r6, pc}
            jump_76e4:
/*0x76e4*/      ldr r0, [r1, #8]
/*0x76e6*/      b jump_767a
            jump_76e8:
/*0x76e8*/      ldrb r0, [r4, #2]
/*0x76ea*/      strb.w r0, [r4, #0x30]
/*0x76ee*/      strb.w r5, [r4, #0x24]
/*0x76f2*/      movs r5, #1
            jump_76f4:
/*0x76f4*/      ldr r1, [pc, #0x1c] /* data_7714 */
/*0x76f6*/      sxtb r0, r5
/*0x76f8*/      bl call_695c
/*0x76fc*/      adds r5, r5, #1
/*0x76fe*/      cmp r5, #8
/*0x7700*/      blo jump_76f4
/*0x7702*/      movs r0, #6
            jump_7704:
/*0x7704*/      strb.w r0, [r4, #0x32]
/*0x7708*/      pop {r4, r5, r6, pc}
            jump_770a:
/*0x770a*/      ldr r0, [r1, #0x10]
/*0x770c*/      b jump_767a

/*0x770e*/  .byte 0x00
/*0x770f*/  .byte 0x00

            data_7710:
/*0x7710*/  .word data_80e8
            data_7714:
/*0x7714*/  .word 0x20000168

            jump_7718:
/*0x7718*/      push {r4, r5, r6, lr}
/*0x771a*/      mov r4, r0
/*0x771c*/      movs r6, #1
/*0x771e*/      cbz r1, jump_773a
/*0x7720*/      cmp r1, #2
/*0x7722*/      bne jump_7738
/*0x7724*/      ldrb r0, [r4, #4]
/*0x7726*/      ands r5, r0, #0xf
/*0x772a*/      beq jump_7734
/*0x772c*/      cbz r2, jump_7750
/*0x772e*/      mov r0, r5
/*0x7730*/      bl call_6a08
            jump_7734:
/*0x7734*/      strb.w r6, [r4, #0x24]
            jump_7738:
/*0x7738*/      pop {r4, r5, r6, pc}
            jump_773a:
/*0x773a*/      ldrb r0, [r4, #2]
/*0x773c*/      cmp r0, #1
/*0x773e*/      bne jump_7738
/*0x7740*/      ldrb r0, [r4, #0x34]!
/*0x7744*/      bfi r0, r2, #1, #1
/*0x7748*/      strb r0, [r4], #-0x10
/*0x774c*/      strb r6, [r4]
/*0x774e*/      pop {r4, r5, r6, pc}
            jump_7750:
/*0x7750*/      ldr r0, [r4, #0x38]
/*0x7752*/      cmp r0, #0
/*0x7754*/      bne jump_7734
/*0x7756*/      mov r0, r5
/*0x7758*/      bl call_68bc
/*0x775c*/      mov r0, r5
/*0x775e*/      bl call_68ac
/*0x7762*/      b jump_7734

            .thumb_func
            call_7764:
/*0x7764*/      subs r2, r2, #1
/*0x7766*/      bmi jump_7772
/*0x7768*/      ldr.w r3, [r0, r2, lsl #2]
/*0x776c*/      str.w r3, [r1, r2, lsl #2]
/*0x7770*/      b call_7764
            jump_7772:
/*0x7772*/      bx lr

            .thumb_func
            call_7774:
/*0x7774*/      ldr r1, [pc, #8] /* data_7780 */
/*0x7776*/      add.w r0, r0, r0, lsl #2
/*0x777a*/      add.w r0, r1, r0, lsl #2
/*0x777e*/      bx lr

            data_7780:
/*0x7780*/  .word 0x400a8014


            .thumb_func
            call_7784:
/*0x7784*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7788*/      movs r7, #0
/*0x778a*/      mov.w r1, #0x8000
/*0x778e*/      mov r2, r7
/*0x7790*/      mov sl, r1
/*0x7792*/      movs r3, #1
/*0x7794*/      mov r0, r2
/*0x7796*/      bl ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */
/*0x779a*/      ldr r0, [pc, #0x90] /* data_782c */
/*0x779c*/      bl call_6644
/*0x77a0*/      ldr r5, [pc, #0x8c] /* data_7830 */
/*0x77a2*/      mov r4, r0
/*0x77a4*/      movw r6, #0xeae0
/*0x77a8*/      cmp r0, #1
/*0x77aa*/      bne jump_77ba
/*0x77ac*/      ldr r0, [r5, #0x54]
/*0x77ae*/      orrs r0, r6
/*0x77b0*/      str r0, [r5, #0x54]
/*0x77b2*/      str r6, [r5, #0x58]
/*0x77b4*/      ldr r0, [r5, #0x50]
/*0x77b6*/      orrs r0, r6
/*0x77b8*/      str r0, [r5, #0x50]
            jump_77ba:
/*0x77ba*/      ldr.w r8, [pc, #0x70] /* data_782c */
/*0x77be*/      ldrb.w r0, [r8, #0x32]
/*0x77c2*/      cmp r0, #3
/*0x77c4*/      bne jump_7804
/*0x77c6*/      ldr.w sb, [pc, #0x6c] /* data_7834 */
/*0x77ca*/      ldr.w r0, [sb]
/*0x77ce*/      tst.w r0, #0xc0
/*0x77d2*/      beq jump_7804
/*0x77d4*/      movs r0, #1
/*0x77d6*/      bl call_55f8
/*0x77da*/      ldr r1, [pc, #0x5c] /* data_7838 */
/*0x77dc*/      strb r7, [r1, #5]
/*0x77de*/      ldrb.w r0, [r8, #0x32]
/*0x77e2*/      cmp r0, #3
/*0x77e4*/      bne jump_7804
/*0x77e6*/      ldr.w r0, [sb]
/*0x77ea*/      tst.w r0, #0xc0
/*0x77ee*/      beq jump_7804
/*0x77f0*/      bl call_6c48
/*0x77f4*/      mov.w r0, #0x3e8
/*0x77f8*/      bl spin_wait /* (time) */
/*0x77fc*/      str r6, [r5, #0x58]
/*0x77fe*/      movs r0, #0
/*0x7800*/      bl call_5c34
            jump_7804:
/*0x7804*/      ldr r0, [r5, #0x58]
/*0x7806*/      tst r0, r6
/*0x7808*/      beq jump_781c
/*0x780a*/      cmp r4, #1
/*0x780c*/      bne jump_781c
/*0x780e*/      ldr r0, [pc, #0x1c] /* data_782c */
/*0x7810*/      bl call_67d0
/*0x7814*/      cmp r0, #1
/*0x7816*/      bne jump_781c
/*0x7818*/      bl call_67e0
            jump_781c:
/*0x781c*/      mov r2, r7
/*0x781e*/      mov r1, sl
/*0x7820*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7824*/      movs r3, #0
/*0x7826*/      mov r0, r2
/*0x7828*/      b.w ckcu_clocks_enable /* (ahb_mask, apb0_mas, apb1_mask, en) */

            data_782c:
/*0x782c*/  .word 0x200006f4
            data_7830:
/*0x7830*/  .word 0x40024000
            data_7834:
/*0x7834*/  .word 0x400a8000
            data_7838:
/*0x7838*/  .word 0x20000034


            .thumb_func
            sram_task1:
/*0x783c*/      b jump_7844
            jump_783e:
/*0x783e*/      ldm r0!, {r3}
/*0x7840*/      subs r2, r2, #4
/*0x7842*/      stm r1!, {r3}
            jump_7844:
/*0x7844*/      cmp r2, #0
/*0x7846*/      bne jump_783e
/*0x7848*/      bx lr

/*0x784a*/  .byte 0x70
/*0x784b*/  .byte 0x47


            .thumb_func
            sram_task2:
/*0x784c*/      movs r0, #0
/*0x784e*/      b jump_7854
            jump_7850:
/*0x7850*/      stm r1!, {r0}
/*0x7852*/      subs r2, r2, #4
            jump_7854:
/*0x7854*/      cmp r2, #0
/*0x7856*/      bne jump_7850
/*0x7858*/      bx lr

/*0x785a*/  .byte 0x00
/*0x785b*/  .byte 0x00


            .thumb_func
            jump_785c:
/*0x785c*/      bl call_56c4
/*0x7860*/      bl setup_afio_gpio
/*0x7864*/      bl call_57c8
/*0x7868*/      movs r0, #0xff
/*0x786a*/      bl call_3e20
/*0x786e*/      bl call_5fd0
/*0x7872*/      bl call_5bfc
/*0x7876*/      bl call_622c
/*0x787a*/      bl call_4e2c
/*0x787e*/      movs r0, #0
/*0x7880*/      bl call_4678
/*0x7884*/      ldr r1, [pc, #0xbc] /* data_7944 */
/*0x7886*/      movs r0, #0
/*0x7888*/      str r0, [r1]
/*0x788a*/      bl call_566c
/*0x788e*/      bl call_56a0
/*0x7892*/      movs r0, #0
/*0x7894*/      bl call_55f8
/*0x7898*/      movs r0, #0xa
/*0x789a*/      bl spin_wait /* (time) */
/*0x789e*/      movs r0, #1
/*0x78a0*/      bl call_5f4c
/*0x78a4*/      bl call_4e38
/*0x78a8*/      ldr r4, [pc, #0x9c] /* data_7948 */
/*0x78aa*/      cbz r0, jump_78b0
/*0x78ac*/      movs r0, #1
/*0x78ae*/      strh r0, [r4, #4]
            jump_78b0:
/*0x78b0*/      ldrh r0, [r4, #4]
/*0x78b2*/      cbz r0, jump_78d8
/*0x78b4*/      bl call_6360
/*0x78b8*/      bl call_5c2a
/*0x78bc*/      movs r0, #0
/*0x78be*/      bl call_5f4c
            jump_78c2:
/*0x78c2*/      ldrh r0, [r4, #4]
/*0x78c4*/      adds r0, r0, #1
/*0x78c6*/      strh r0, [r4, #4]
/*0x78c8*/      bl call_7954
/*0x78cc*/      movs r0, #1
/*0x78ce*/      bl call_5cc4
/*0x78d2*/      bl call_6c48
/*0x78d6*/      b jump_78c2
            jump_78d8:
/*0x78d8*/      movs r0, #1
/*0x78da*/      bl call_55f8
/*0x78de*/      bl call_67fc
/*0x78e2*/      ldr r6, [pc, #0x68] /* data_794c */
/*0x78e4*/      ldr r5, [pc, #0x68] /* data_7950 */
            jump_78e6:
/*0x78e6*/      bl call_6b84
/*0x78ea*/      cmp r0, #1
/*0x78ec*/      beq jump_78fe
/*0x78ee*/      cmp r0, #2
/*0x78f0*/      beq jump_7912
/*0x78f2*/      cmp r0, #3
/*0x78f4*/      bne jump_793c
/*0x78f6*/      movs r0, #1
/*0x78f8*/      bl call_55f8
/*0x78fc*/      b jump_793c
            jump_78fe:
/*0x78fe*/      movs r0, #0
/*0x7900*/      bl call_55f8
/*0x7904*/      bl call_6360
/*0x7908*/      bl call_5c2a
/*0x790c*/      movs r0, #0
/*0x790e*/      bl call_5f4c
            jump_7912:
/*0x7912*/      ldrh r0, [r4, #4]
/*0x7914*/      adds r0, r0, #1
/*0x7916*/      lsls r0, r0, #0x10
/*0x7918*/      lsrs r0, r0, #0x10
/*0x791a*/      strh r0, [r4, #4]
/*0x791c*/      bne jump_792a
/*0x791e*/      ldr r0, [r5]
/*0x7920*/      cmp r0, r6
/*0x7922*/      bls jump_792a
/*0x7924*/      ldr r0, [r5]
/*0x7926*/      subs r0, r0, #1
/*0x7928*/      str r0, [r5]
            jump_792a:
/*0x792a*/      bl call_5cdc
/*0x792e*/      bl call_7954
/*0x7932*/      ldrb r0, [r4]
/*0x7934*/      cbnz r0, jump_793c
/*0x7936*/      movs r0, #1
/*0x7938*/      bl call_5cc4
            jump_793c:
/*0x793c*/      bl call_6c48
/*0x7940*/      b jump_78e6

/*0x7942*/  .byte 0x00
/*0x7943*/  .byte 0x00

            data_7944:
/*0x7944*/  .word 0x20000030
            data_7948:
/*0x7948*/  .word 0x20000028
            data_794c:
/*0x794c*/  .word 0x55aafaf0
            data_7950:
/*0x7950*/  .word 0x20003ffc


            .thumb_func
            call_7954:
/*0x7954*/      push {r4, r5, r6, lr}
/*0x7956*/      ldr r6, [pc, #0xc8] /* data_7a20 */
/*0x7958*/      movs r4, #0
/*0x795a*/      ldrb r0, [r6, #3]
/*0x795c*/      cbz r0, jump_7978
/*0x795e*/      movs r0, #1
/*0x7960*/      bl call_4678
/*0x7964*/      cbz r0, jump_7978
/*0x7966*/      ldrb r0, [r6, #3]
/*0x7968*/      cmp r0, #2
/*0x796a*/      beq jump_79a0
/*0x796c*/      bl call_3ea0
            jump_7970:
/*0x7970*/      strb r4, [r6, #3]
/*0x7972*/      movs r0, #1
/*0x7974*/      bl call_566c
            jump_7978:
/*0x7978*/      bl call_51b4
/*0x797c*/      cmp r0, #0
/*0x797e*/      beq jump_7a1c
/*0x7980*/      ldr r5, [pc, #0xa0] /* data_7a24 */
/*0x7982*/      ldrb r0, [r5, #2]
/*0x7984*/      cmp r0, #0x20
/*0x7986*/      blo jump_7990
/*0x7988*/      subs r0, #0x20
/*0x798a*/      strb r0, [r5, #2]
/*0x798c*/      movs r0, #1
/*0x798e*/      strb r0, [r5, #3]
            jump_7990:
/*0x7990*/      ldrb r0, [r5, #1]
/*0x7992*/      cmp r0, #0xff
/*0x7994*/      beq jump_79b6
/*0x7996*/      bl call_4aac
/*0x799a*/      cmp r0, #1
/*0x799c*/      beq jump_79a6
/*0x799e*/      b jump_79b6
            jump_79a0:
/*0x79a0*/      bl call_3ed0
/*0x79a4*/      b jump_7970
            jump_79a6:
/*0x79a6*/      ldrb r0, [r5, #1]
/*0x79a8*/      bl call_3e20
/*0x79ac*/      movs r0, #0xff
/*0x79ae*/      strb r0, [r5, #1]
/*0x79b0*/      movs r0, #2
/*0x79b2*/      bl call_566c
            jump_79b6:
/*0x79b6*/      ldrb r0, [r6, #4]
/*0x79b8*/      cbz r0, jump_79ca
/*0x79ba*/      bl call_4aac
/*0x79be*/      cmp r0, #1
/*0x79c0*/      bne jump_79ca
/*0x79c2*/      ldrb r0, [r6, #4]
/*0x79c4*/      bl call_4b18
/*0x79c8*/      strb r4, [r6, #4]
            jump_79ca:
/*0x79ca*/      bl call_5ed0
/*0x79ce*/      bl call_57ec
/*0x79d2*/      ldr r0, [pc, #0x54] /* data_7a28 */
/*0x79d4*/      ldrb r0, [r0, #6]
/*0x79d6*/      cmp r0, #1
/*0x79d8*/      beq jump_79e2
/*0x79da*/      bl call_4b30
/*0x79de*/      bl call_39f4
            jump_79e2:
/*0x79e2*/      ldrb r0, [r5, #3]
/*0x79e4*/      cbz r0, jump_79ea
/*0x79e6*/      bl call_4bd0
            jump_79ea:
/*0x79ea*/      ldrb r0, [r6]
/*0x79ec*/      cbz r0, jump_79f8
/*0x79ee*/      strb r4, [r6]
/*0x79f0*/      bl call_558c
/*0x79f4*/      bl call_5598
            jump_79f8:
/*0x79f8*/      ldrb r0, [r6, #1]
/*0x79fa*/      cbz r0, jump_7a02
/*0x79fc*/      strb r4, [r6, #1]
/*0x79fe*/      bl call_61c0
            jump_7a02:
/*0x7a02*/      ldrb r0, [r5, #3]
/*0x7a04*/      cmp r0, #0
/*0x7a06*/      beq jump_7a1c
/*0x7a08*/      ldr r0, [pc, #0x18] /* data_7a24 */
/*0x7a0a*/      ldrb r2, [r5, #2]
/*0x7a0c*/      adds r0, r0, #6
/*0x7a0e*/      ldrb r1, [r0, #1]
/*0x7a10*/      add r1, r2
/*0x7a12*/      strb r1, [r0, #1]
/*0x7a14*/      ldrh r0, [r5, #6]
/*0x7a16*/      lsrs r0, r0, #1
/*0x7a18*/      strh r0, [r5, #6]
/*0x7a1a*/      strb r4, [r5, #3]
            jump_7a1c:
/*0x7a1c*/      pop {r4, r5, r6, pc}

/*0x7a1e*/  .byte 0x00
/*0x7a1f*/  .byte 0x00

            data_7a20:
/*0x7a20*/  .word 0x20000648
            data_7a24:
/*0x7a24*/  .word 0x20000028
            data_7a28:
/*0x7a28*/  .word 0x200019d0

            data_7a2c:
/*0x7a2c*/  .byte 0x44
/*0x7a2d*/  .byte 0x45
/*0x7a2e*/  .byte 0xe6
/*0x7a2f*/  .byte 0xe3
/*0x7a30*/  .byte 0x2c
            data_7a31:
/*0x7a31*/  .byte 0x08
/*0x7a32*/  .byte 0x14
/*0x7a33*/  .byte 0x1a
            data_7a34:
/*0x7a34*/  .byte 0x00
/*0x7a35*/  .byte 0x01
/*0x7a36*/  .byte 0x00
/*0x7a37*/  .byte 0x02
            data_7a38:
/*0x7a38*/  .byte 0x39
/*0x7a39*/  .byte 0xe5
/*0x7a3a*/  .byte 0xe4
/*0x7a3b*/  .byte 0x65
/*0x7a3c*/  .byte 0xe7
            data_7a3d:
/*0x7a3d*/  .byte 0x1f
/*0x7a3e*/  .byte 0x10
/*0x7a3f*/  .byte 0x01
/*0x7a40*/  .byte 0x3b
/*0x7a41*/  .byte 0x11
/*0x7a42*/  .byte 0x01
/*0x7a43*/  .byte 0x3c
/*0x7a44*/  .byte 0x12
/*0x7a45*/  .byte 0x01
/*0x7a46*/  .byte 0x3d
/*0x7a47*/  .byte 0x13
/*0x7a48*/  .byte 0x01
/*0x7a49*/  .byte 0x47
/*0x7a4a*/  .byte 0x5f
/*0x7a4b*/  .byte 0x01
            data_7a4c:
/*0x7a4c*/  .byte 0x00
/*0x7a4d*/  .byte 0x35
/*0x7a4e*/  .byte 0x01
/*0x7a4f*/  .byte 0x3a
/*0x7a50*/  .byte 0x02
/*0x7a51*/  .byte 0x3b
/*0x7a52*/  .byte 0x03
/*0x7a53*/  .byte 0x3c
/*0x7a54*/  .byte 0x04
/*0x7a55*/  .byte 0x3d
/*0x7a56*/  .byte 0x05
/*0x7a57*/  .byte 0x3e
/*0x7a58*/  .byte 0x06
/*0x7a59*/  .byte 0x3f
/*0x7a5a*/  .byte 0x07
/*0x7a5b*/  .byte 0x40
/*0x7a5c*/  .byte 0x23
/*0x7a5d*/  .byte 0x41
/*0x7a5e*/  .byte 0x24
/*0x7a5f*/  .byte 0x42
/*0x7a60*/  .byte 0x25
/*0x7a61*/  .byte 0x43
/*0x7a62*/  .byte 0x26
/*0x7a63*/  .byte 0x44
/*0x7a64*/  .byte 0x2a
/*0x7a65*/  .byte 0x45
/*0x7a66*/  .byte 0x2b
/*0x7a67*/  .byte 0x52
/*0x7a68*/  .byte 0x17
/*0x7a69*/  .byte 0x50
/*0x7a6a*/  .byte 0x33
/*0x7a6b*/  .byte 0x51
/*0x7a6c*/  .byte 0x34
/*0x7a6d*/  .byte 0x4f
/*0x7a6e*/  .byte 0x2d
/*0x7a6f*/  .byte 0x46
/*0x7a70*/  .byte 0x2e
/*0x7a71*/  .byte 0x47
/*0x7a72*/  .byte 0x32
/*0x7a73*/  .byte 0x48
/*0x7a74*/  .byte 0x19
/*0x7a75*/  .byte 0x65
/*0x7a76*/  .byte 0x16
/*0x7a77*/  .byte 0x4a
/*0x7a78*/  .byte 0x1e
/*0x7a79*/  .byte 0x4d
/*0x7a7a*/  .byte 0x0f
/*0x7a7b*/  .byte 0x4b
/*0x7a7c*/  .byte 0x2c
/*0x7a7d*/  .byte 0x4e
/*0x7a7e*/  .byte 0x27
/*0x7a7f*/  .byte 0x4c
/*0x7a80*/  .byte 0x36
/*0x7a81*/  .byte 0x4c
/*0x7a82*/  .byte 0x35
/*0x7a83*/  .byte 0x49
/*0x7a84*/  .byte 0x12
/*0x7a85*/  .byte 0xf5
/*0x7a86*/  .byte 0x13
/*0x7a87*/  .byte 0xf6
/*0x7a88*/  .byte 0x14 /* (dest, size) */
/*0x7a89*/  .byte 0xf4
/*0x7a8a*/  .byte 0x09
/*0x7a8b*/  .byte 0xf2
/*0x7a8c*/  .byte 0x0a
/*0x7a8d*/  .byte 0xf0
/*0x7a8e*/  .byte 0x0b
/*0x7a8f*/  .byte 0xf3
            data_7a90:
/*0x7a90*/  .byte 0xe8
/*0x7a91*/  .byte 0xcf
            data_7a92:
/*0x7a92*/  .byte 0xff
/*0x7a93*/  .byte 0xff
/*0x7a94*/  .byte 0xff
            data_7a95:
/*0x7a95*/  .byte 0x00
/*0x7a96*/  .byte 0x00
/*0x7a97*/  .byte 0xff
/*0x7a98*/  .byte 0xff
/*0x7a99*/  .byte 0x00
/*0x7a9a*/  .byte 0x00
            data_7a9b:
/*0x7a9b*/  .byte 0x00
/*0x7a9c*/  .byte 0x01
/*0x7a9d*/  .byte 0x02
/*0x7a9e*/  .byte 0x03
/*0x7a9f*/  .byte 0xff
/*0x7aa0*/  .byte 0xff
/*0x7aa1*/  .byte 0xff
/*0x7aa2*/  .byte 0xff
/*0x7aa3*/  .byte 0x04
/*0x7aa4*/  .byte 0x04
/*0x7aa5*/  .byte 0x05
/*0x7aa6*/  .byte 0x05
/*0x7aa7*/  .byte 0x06
/*0x7aa8*/  .byte 0x06
/*0x7aa9*/  .byte 0x01
/*0x7aaa*/  .byte 0x01
/*0x7aab*/  .byte 0x01
/*0x7aac*/  .byte 0x01
/*0x7aad*/  .byte 0x01
/*0x7aae*/  .byte 0x01
/*0x7aaf*/  .byte 0x01
/*0x7ab0*/  .byte 0x03
/*0x7ab1*/  .byte 0x05
/*0x7ab2*/  .byte 0x07
/*0x7ab3*/  .byte 0x09
/*0x7ab4*/  .byte 0x0b
/*0x7ab5*/  .byte 0x01
/*0x7ab6*/  .byte 0x03
/*0x7ab7*/  .byte 0x05
/*0x7ab8*/  .byte 0x07
/*0x7ab9*/  .byte 0x09
/*0x7aba*/  .byte 0x0b
/*0x7abb*/  .byte 0xaa
/*0x7abc*/  .byte 0x6e
/*0x7abd*/  .byte 0x46
/*0x7abe*/  .byte 0x28
/*0x7abf*/  .byte 0x14
/*0x7ac0*/  .byte 0x0a
/*0x7ac1*/  .byte 0x01
/*0x7ac2*/  .byte 0x02
/*0x7ac3*/  .byte 0x03
/*0x7ac4*/  .byte 0x04
/*0x7ac5*/  .byte 0x06
/*0x7ac6*/  .byte 0x09
/*0x7ac7*/  .byte 0x10
/*0x7ac8*/  .byte 0x0b
/*0x7ac9*/  .byte 0x07
/*0x7aca*/  .byte 0x04
/*0x7acb*/  .byte 0x02
/*0x7acc*/  .byte 0x01
/*0x7acd*/  .byte 0x10
/*0x7ace*/  .byte 0x0b
/*0x7acf*/  .byte 0x07
/*0x7ad0*/  .byte 0x04
/*0x7ad1*/  .byte 0x02
/*0x7ad2*/  .byte 0x01
            data_7ad3:
/*0x7ad3*/  .byte 0x00
/*0x7ad4*/  .byte 0x01
/*0x7ad5*/  .byte 0x02
/*0x7ad6*/  .byte 0x03
/*0x7ad7*/  .byte 0x04
/*0x7ad8*/  .byte 0x05
/*0x7ad9*/  .byte 0x06
/*0x7ada*/  .byte 0x07
/*0x7adb*/  .byte 0x1b
/*0x7adc*/  .byte 0x1a
/*0x7add*/  .byte 0x19
/*0x7ade*/  .byte 0x18
/*0x7adf*/  .byte 0x17
/*0x7ae0*/  .byte 0x16
/*0x7ae1*/  .byte 0x15
/*0x7ae2*/  .byte 0x14
/*0x7ae3*/  .byte 0x1c
/*0x7ae4*/  .byte 0x1d
/*0x7ae5*/  .byte 0x1e
/*0x7ae6*/  .byte 0x1f
/*0x7ae7*/  .byte 0x20
/*0x7ae8*/  .byte 0x21
/*0x7ae9*/  .byte 0x22
/*0x7aea*/  .byte 0x23
/*0x7aeb*/  .byte 0x34
/*0x7aec*/  .byte 0x33
/*0x7aed*/  .byte 0x32
/*0x7aee*/  .byte 0x31
/*0x7aef*/  .byte 0x30
/*0x7af0*/  .byte 0x2f
/*0x7af1*/  .byte 0x2e
/*0x7af2*/  .byte 0x2d
/*0x7af3*/  .byte 0x35
/*0x7af4*/  .byte 0x36
/*0x7af5*/  .byte 0x37
/*0x7af6*/  .byte 0x08
/*0x7af7*/  .byte 0x09
/*0x7af8*/  .byte 0x0a
/*0x7af9*/  .byte 0x0b
/*0x7afa*/  .byte 0x0d
/*0x7afb*/  .byte 0xff
/*0x7afc*/  .byte 0xff
/*0x7afd*/  .byte 0x0c
/*0x7afe*/  .byte 0x13
/*0x7aff*/  .byte 0x12
/*0x7b00*/  .byte 0x11
/*0x7b01*/  .byte 0x10
/*0x7b02*/  .byte 0x0e
/*0x7b03*/  .byte 0xff
/*0x7b04*/  .byte 0xff
/*0x7b05*/  .byte 0x0f
/*0x7b06*/  .byte 0x24
/*0x7b07*/  .byte 0x25
/*0x7b08*/  .byte 0x26
/*0x7b09*/  .byte 0x27
/*0x7b0a*/  .byte 0x28
/*0x7b0b*/  .byte 0xff
/*0x7b0c*/  .byte 0xff
/*0x7b0d*/  .byte 0x38
/*0x7b0e*/  .byte 0x2c
/*0x7b0f*/  .byte 0x2b
/*0x7b10*/  .byte 0x2a
/*0x7b11*/  .byte 0x29
/*0x7b12*/  .byte 0xff
/*0x7b13*/  .byte 0xff
/*0x7b14*/  .byte 0xff
/*0x7b15*/  .byte 0xff
/*0x7b16*/  .byte 0x39
/*0x7b17*/  .byte 0x3a
/*0x7b18*/  .byte 0x3b
/*0x7b19*/  .byte 0xff
/*0x7b1a*/  .byte 0x3c
/*0x7b1b*/  .byte 0x01
/*0x7b1c*/  .byte 0x01
/*0x7b1d*/  .byte 0x01
/*0x7b1e*/  .byte 0x01
/*0x7b1f*/  .byte 0x02
/*0x7b20*/  .byte 0x02
/*0x7b21*/  .byte 0x02
/*0x7b22*/  .byte 0x02
/*0x7b23*/  .byte 0x08
/*0x7b24*/  .byte 0x08
/*0x7b25*/  .byte 0x01
/*0x7b26*/  .byte 0x01
/*0x7b27*/  .byte 0x01
/*0x7b28*/  .byte 0x02
/*0x7b29*/  .byte 0x02
/*0x7b2a*/  .byte 0x02
/*0x7b2b*/  .byte 0x08
/*0x7b2c*/  .byte 0x08
/*0x7b2d*/  .byte 0x08
/*0x7b2e*/  .byte 0x08
/*0x7b2f*/  .byte 0x01
/*0x7b30*/  .byte 0x01
/*0x7b31*/  .byte 0x02
/*0x7b32*/  .byte 0x03
/*0x7b33*/  .byte 0x07
/*0x7b34*/  .byte 0x07 /* (dest, size) */
/*0x7b35*/  .byte 0x07
/*0x7b36*/  .byte 0x07
/*0x7b37*/  .byte 0x06
/*0x7b38*/  .byte 0x06
/*0x7b39*/  .byte 0x06
/*0x7b3a*/  .byte 0x06
/*0x7b3b*/  .byte 0x07
/*0x7b3c*/  .byte 0x07
/*0x7b3d*/  .byte 0x06
/*0x7b3e*/  .byte 0x02
/*0x7b3f*/  .byte 0x02
/*0x7b40*/  .byte 0x02
/*0x7b41*/  .byte 0x03
/*0x7b42*/  .byte 0x03
/*0x7b43*/  .byte 0xff
/*0x7b44*/  .byte 0xff
/*0x7b45*/  .byte 0x03
/*0x7b46*/  .byte 0x03
/*0x7b47*/  .byte 0x03
/*0x7b48*/  .byte 0x03
/*0x7b49*/  .byte 0x03
/*0x7b4a*/  .byte 0x04
/*0x7b4b*/  .byte 0xff
/*0x7b4c*/  .byte 0xff
/*0x7b4d*/  .byte 0x04
/*0x7b4e*/  .byte 0x03
/*0x7b4f*/  .byte 0x04
/*0x7b50*/  .byte 0x04
/*0x7b51*/  .byte 0x04
/*0x7b52*/  .byte 0x04
/*0x7b53*/  .byte 0xff
/*0x7b54*/  .byte 0xff
/*0x7b55*/  .byte 0x06
/*0x7b56*/  .byte 0x05
/*0x7b57*/  .byte 0x05
/*0x7b58*/  .byte 0x05
/*0x7b59*/  .byte 0x05
/*0x7b5a*/  .byte 0xff
/*0x7b5b*/  .byte 0xff
/*0x7b5c*/  .byte 0xff
/*0x7b5d*/  .byte 0xff
/*0x7b5e*/  .byte 0x06
/*0x7b5f*/  .byte 0x06
/*0x7b60*/  .byte 0x05
/*0x7b61*/  .byte 0xff
            data_7b62:
/*0x7b62*/  .byte 0x05
            data_7b63:
/*0x7b63*/  .byte 0x00
/*0x7b64*/  .byte 0x08
/*0x7b65*/  .byte 0x10
/*0x7b66*/  .byte 0x18
/*0x7b67*/  .byte 0x20
/*0x7b68*/  .byte 0x28
/*0x7b69*/  .byte 0x30
/*0x7b6a*/  .byte 0x38
/*0x7b6b*/  .byte 0x01
/*0x7b6c*/  .byte 0x09
/*0x7b6d*/  .byte 0x11
/*0x7b6e*/  .byte 0x19
/*0x7b6f*/  .byte 0x21
/*0x7b70*/  .byte 0x29
/*0x7b71*/  .byte 0x31
/*0x7b72*/  .byte 0x39
/*0x7b73*/  .byte 0x02
/*0x7b74*/  .byte 0x0a
/*0x7b75*/  .byte 0x12
/*0x7b76*/  .byte 0x1a
/*0x7b77*/  .byte 0x22
/*0x7b78*/  .byte 0x2a
/*0x7b79*/  .byte 0x32
/*0x7b7a*/  .byte 0x3a
/*0x7b7b*/  .byte 0x03
/*0x7b7c*/  .byte 0x13
/*0x7b7d*/  .byte 0x1b
/*0x7b7e*/  .byte 0x23
/*0x7b7f*/  .byte 0x2b
/*0x7b80*/  .byte 0x33
/*0x7b81*/  .byte 0x3b
/*0x7b82*/  .byte 0x43
/*0x7b83*/  .byte 0x04
/*0x7b84*/  .byte 0x0c
/*0x7b85*/  .byte 0x14
/*0x7b86*/  .byte 0x40
/*0x7b87*/  .byte 0x48
/*0x7b88*/  .byte 0x50
/*0x7b89*/  .byte 0x58
/*0x7b8a*/  .byte 0x68
/*0x7b8b*/  .byte 0xff
/*0x7b8c*/  .byte 0xff
/*0x7b8d*/  .byte 0x60
/*0x7b8e*/  .byte 0x41
/*0x7b8f*/  .byte 0x49
/*0x7b90*/  .byte 0x51
/*0x7b91*/  .byte 0x59
/*0x7b92*/  .byte 0x69
/*0x7b93*/  .byte 0xff
/*0x7b94*/  .byte 0xff
/*0x7b95*/  .byte 0x61
/*0x7b96*/  .byte 0x42
/*0x7b97*/  .byte 0x4a
/*0x7b98*/  .byte 0x52
/*0x7b99*/  .byte 0x5a
/*0x7b9a*/  .byte 0x6a
/*0x7b9b*/  .byte 0xff
/*0x7b9c*/  .byte 0xff
/*0x7b9d*/  .byte 0x34
/*0x7b9e*/  .byte 0x4b
/*0x7b9f*/  .byte 0x53
/*0x7ba0*/  .byte 0x5b
/*0x7ba1*/  .byte 0x63
/*0x7ba2*/  .byte 0xff
/*0x7ba3*/  .byte 0xff
/*0x7ba4*/  .byte 0xff
/*0x7ba5*/  .byte 0xff
/*0x7ba6*/  .byte 0x54
/*0x7ba7*/  .byte 0x5c
/*0x7ba8*/  .byte 0x64
/*0x7ba9*/  .byte 0xff
            data_7baa:
/*0x7baa*/  .byte 0x6c
            data_7bab:
/*0x7bab*/  .byte 0x00
/*0x7bac*/  .byte 0x24
/*0x7bad*/  .byte 0x49
/*0x7bae*/  .byte 0x6d
/*0x7baf*/  .byte 0x92
/*0x7bb0*/  .byte 0xb6
/*0x7bb1*/  .byte 0xdb
/*0x7bb2*/  .byte 0xff
/*0x7bb3*/  .byte 0xaa
/*0x7bb4*/  .byte 0x55
/*0x7bb5*/  .byte 0x00
/*0x7bb6*/  .byte 0x00
/*0x7bb7*/  .byte 0x00
            data_7bb8:
/*0x7bb8*/  .byte 0x29
/*0x7bb9*/  .byte 0x1e
/*0x7bba*/  .byte 0x1f
/*0x7bbb*/  .byte 0x20
/*0x7bbc*/  .byte 0x21
/*0x7bbd*/  .byte 0x22
/*0x7bbe*/  .byte 0x23
/*0x7bbf*/  .byte 0x24
/*0x7bc0*/  .byte 0x2b
/*0x7bc1*/  .byte 0x14
/*0x7bc2*/  .byte 0x1a
/*0x7bc3*/  .byte 0x08
/*0x7bc4*/  .byte 0x15
/*0x7bc5*/  .byte 0x17
/*0x7bc6*/  .byte 0x1c
/*0x7bc7*/  .byte 0x18
/*0x7bc8*/  .byte 0x39
/*0x7bc9*/  .byte 0x04
/*0x7bca*/  .byte 0x16
/*0x7bcb*/  .byte 0x07
/*0x7bcc*/  .byte 0x09
/*0x7bcd*/  .byte 0x0a
/*0x7bce*/  .byte 0x0b
/*0x7bcf*/  .byte 0x0d
/*0x7bd0*/  .byte 0xe1
/*0x7bd1*/  .byte 0x1d
/*0x7bd2*/  .byte 0x1b
/*0x7bd3*/  .byte 0x06
/*0x7bd4*/  .byte 0x19
/*0x7bd5*/  .byte 0x05
/*0x7bd6*/  .byte 0x11
/*0x7bd7*/  .byte 0x10
/*0x7bd8*/  .byte 0xe0
/*0x7bd9*/  .byte 0xe3
/*0x7bda*/  .byte 0xe2
/*0x7bdb*/  .byte 0x25
/*0x7bdc*/  .byte 0x26
/*0x7bdd*/  .byte 0x27
/*0x7bde*/  .byte 0x2d
/*0x7bdf*/  .byte 0x2a
/*0x7be0*/  .byte 0x64
/*0x7be1*/  .byte 0x00
/*0x7be2*/  .byte 0x2e
/*0x7be3*/  .byte 0x0c
/*0x7be4*/  .byte 0x12
/*0x7be5*/  .byte 0x13
/*0x7be6*/  .byte 0x2f
/*0x7be7*/  .byte 0x31
/*0x7be8*/  .byte 0x00
/*0x7be9*/  .byte 0x00
/*0x7bea*/  .byte 0x30
/*0x7beb*/  .byte 0x0e
/*0x7bec*/  .byte 0x0f
/*0x7bed*/  .byte 0x33
/*0x7bee*/  .byte 0x34
/*0x7bef*/  .byte 0x28
/*0x7bf0*/  .byte 0x00
/*0x7bf1*/  .byte 0x00
/*0x7bf2*/  .byte 0x2c
/*0x7bf3*/  .byte 0x36
/*0x7bf4*/  .byte 0x37
/*0x7bf5*/  .byte 0x38
/*0x7bf6*/  .byte 0xe5
/*0x7bf7*/  .byte 0x35
/*0x7bf8*/  .byte 0x00
/*0x7bf9*/  .byte 0x00
/*0x7bfa*/  .byte 0x00
/*0x7bfb*/  .byte 0xe6
/*0x7bfc*/  .byte 0xe7
/*0x7bfd*/  .byte 0x65
/*0x7bfe*/  .byte 0x00
/*0x7bff*/  .byte 0xe4
/*0x7c00*/  .byte 0xc0
/*0x7c01*/  .byte 0xc1
/*0x7c02*/  .byte 0xc2
/*0x7c03*/  .byte 0xc3
/*0x7c04*/  .byte 0x00
/*0x7c05*/  .byte 0x00
/*0x7c06*/  .byte 0x00
/*0x7c07*/  .byte 0x00

            gpio_map_1:
/*0x7c08*/  .word 0x400b4000 /* GPIO C, pin 9 */
/*0x7c0c*/  .word 0x00000200
/*0x7c10*/  .word 0x400b0000 /* GPIO A, pin 5 */
/*0x7c14*/  .word 0x00000020
/*0x7c18*/  .word 0x400b0000 /* GPIO A, pin 6 */
/*0x7c1c*/  .word 0x00000040
/*0x7c20*/  .word 0x400b0000 /* GPIO A, pin 7 */
/*0x7c24*/  .word 0x00000080
/*0x7c28*/  .word 0x400b4000 /* GPIO C, pin 11 */
/*0x7c2c*/  .word 0x00000800
/*0x7c30*/  .word 0x400b4000 /* GPIO C, pin 13 */
/*0x7c34*/  .word 0x00002000
/*0x7c38*/  .word 0x400b4000 /* GPIO C, pin 14 */
/*0x7c3c*/  .word 0x00004000 /* possible pointer */
/*0x7c40*/  .word 0x400b4000 /* GPIO C, pin 15 */
/*0x7c44*/  .word 0x00008000 /* possible pointer */

/*0x7c48*/  .byte 0x02
/*0x7c49*/  .byte 0x09
/*0x7c4a*/  .byte 0x00
/*0x7c4b*/  .byte 0x05
/*0x7c4c*/  .byte 0x00
/*0x7c4d*/  .byte 0x06
/*0x7c4e*/  .byte 0x00
/*0x7c4f*/  .byte 0x07
/*0x7c50*/  .byte 0x02
/*0x7c51*/  .byte 0x0b
/*0x7c52*/  .byte 0x02
/*0x7c53*/  .byte 0x0d
/*0x7c54*/  .byte 0x02
/*0x7c55*/  .byte 0x0e
/*0x7c56*/  .byte 0x02
/*0x7c57*/  .byte 0x0f

            gpio_map_2:
/*0x7c58*/  .word 0x400b4000 /* GPIO C, pin 4 */
/*0x7c5c*/  .word 0x00000010
/*0x7c60*/  .word 0x400b2000 /* GPIO B, pin 6 */
/*0x7c64*/  .word 0x00000040
/*0x7c68*/  .word 0x400b6000 /* GPIO D, pin 0 */
/*0x7c6c*/  .word 0x00000001
/*0x7c70*/  .word 0x400b2000 /* GPIO B, pin 11 */
/*0x7c74*/  .word 0x00000800
/*0x7c78*/  .word 0x400b0000 /* GPIO A, pin 11 */
/*0x7c7c*/  .word 0x00000800
/*0x7c80*/  .word 0x400b0000 /* GPIO A, pin 0 */
/*0x7c84*/  .word 0x00000001
/*0x7c88*/  .word 0x400b0000 /* GPIO A, pin 1 */
/*0x7c8c*/  .word 0x00000002
/*0x7c90*/  .word 0x400b0000 /* GPIO A, pin 2 */
/*0x7c94*/  .word 0x00000004
/*0x7c98*/  .word 0x400b0000 /* GPIO A, pin 3 */
/*0x7c9c*/  .word 0x00000008
            data_7ca0:
/*0x7ca0*/  .word 0x400b0000 /* GPIO A, pin 4 */
/*0x7ca4*/  .word 0x00000010

/*0x7ca8*/  .byte 0x2d
/*0x7ca9*/  .byte 0x2f
/*0x7caa*/  .byte 0x2e
/*0x7cab*/  .byte 0x30
/*0x7cac*/  .byte 0x14
/*0x7cad*/  .byte 0x34
/*0x7cae*/  .byte 0x1a
/*0x7caf*/  .byte 0x36
/*0x7cb0*/  .byte 0x08
/*0x7cb1*/  .byte 0x37
/*0x7cb2*/  .byte 0x15
/*0x7cb3*/  .byte 0x13
/*0x7cb4*/  .byte 0x17
/*0x7cb5*/  .byte 0x1c
/*0x7cb6*/  .byte 0x1c
/*0x7cb7*/  .byte 0x09
/*0x7cb8*/  .byte 0x18
/*0x7cb9*/  .byte 0x0a
/*0x7cba*/  .byte 0x0c
/*0x7cbb*/  .byte 0x06
/*0x7cbc*/  .byte 0x12
/*0x7cbd*/  .byte 0x15
/*0x7cbe*/  .byte 0x13
/*0x7cbf*/  .byte 0x0f
/*0x7cc0*/  .byte 0x2f
/*0x7cc1*/  .byte 0x38
/*0x7cc2*/  .byte 0x30
/*0x7cc3*/  .byte 0x2e
/*0x7cc4*/  .byte 0x16
/*0x7cc5*/  .byte 0x12
/*0x7cc6*/  .byte 0x07
/*0x7cc7*/  .byte 0x08
/*0x7cc8*/  .byte 0x09
/*0x7cc9*/  .byte 0x18
/*0x7cca*/  .byte 0x0a
/*0x7ccb*/  .byte 0x0c
/*0x7ccc*/  .byte 0x0b
/*0x7ccd*/  .byte 0x07
/*0x7cce*/  .byte 0x0d
/*0x7ccf*/  .byte 0x0b
/*0x7cd0*/  .byte 0x0e
/*0x7cd1*/  .byte 0x17
/*0x7cd2*/  .byte 0x0f
/*0x7cd3*/  .byte 0x11
/*0x7cd4*/  .byte 0x33
/*0x7cd5*/  .byte 0x16
/*0x7cd6*/  .byte 0x34
/*0x7cd7*/  .byte 0x2d
/*0x7cd8*/  .byte 0x1d
/*0x7cd9*/  .byte 0x33
/*0x7cda*/  .byte 0x1b
/*0x7cdb*/  .byte 0x14
/*0x7cdc*/  .byte 0x06
/*0x7cdd*/  .byte 0x0d
/*0x7cde*/  .byte 0x19
/*0x7cdf*/  .byte 0x0e
/*0x7ce0*/  .byte 0x05
/*0x7ce1*/  .byte 0x1b
/*0x7ce2*/  .byte 0x11
/*0x7ce3*/  .byte 0x05
/*0x7ce4*/  .byte 0x10
/*0x7ce5*/  .byte 0x10
/*0x7ce6*/  .byte 0x36
/*0x7ce7*/  .byte 0x1a
/*0x7ce8*/  .byte 0x37
/*0x7ce9*/  .byte 0x19
/*0x7cea*/  .byte 0x38
/*0x7ceb*/  .byte 0x1d
            data_7cec:
/*0x7cec*/  .byte 0x08
/*0x7ced*/  .byte 0x09
/*0x7cee*/  .byte 0x15
/*0x7cef*/  .byte 0x13
/*0x7cf0*/  .byte 0x17
/*0x7cf1*/  .byte 0x0a
/*0x7cf2*/  .byte 0x1c
/*0x7cf3*/  .byte 0x0d
/*0x7cf4*/  .byte 0x18
/*0x7cf5*/  .byte 0x0f
/*0x7cf6*/  .byte 0x0c
/*0x7cf7*/  .byte 0x18
/*0x7cf8*/  .byte 0x12
/*0x7cf9*/  .byte 0x1c
/*0x7cfa*/  .byte 0x13
/*0x7cfb*/  .byte 0x33
/*0x7cfc*/  .byte 0x16
/*0x7cfd*/  .byte 0x15
/*0x7cfe*/  .byte 0x07
/*0x7cff*/  .byte 0x16
/*0x7d00*/  .byte 0x09
/*0x7d01*/  .byte 0x17
/*0x7d02*/  .byte 0x0a
/*0x7d03*/  .byte 0x07
/*0x7d04*/  .byte 0x0d
/*0x7d05*/  .byte 0x11
/*0x7d06*/  .byte 0x0e
/*0x7d07*/  .byte 0x08
/*0x7d08*/  .byte 0x0f
/*0x7d09*/  .byte 0x0c
/*0x7d0a*/  .byte 0x33
/*0x7d0b*/  .byte 0x12
/*0x7d0c*/  .byte 0x11
/*0x7d0d*/  .byte 0x0e
/*0x7d0e*/  .byte 0x00
/*0x7d0f*/  .byte 0x00
            data_7d10:
/*0x7d10*/  .byte 0x00
/*0x7d11*/  .byte 0x01
/*0x7d12*/  .byte 0x02
/*0x7d13*/  .byte 0x00

            gpio_map_3:
/*0x7d14*/  .word 0x400b4000 /* GPIO C, pin 8 */
/*0x7d18*/  .word 0x00000100
/*0x7d1c*/  .word 0x400b4000 /* GPIO C, pin 7 */
/*0x7d20*/  .word 0x00000080
/*0x7d24*/  .word 0x400b2000 /* GPIO B, pin 5 */
/*0x7d28*/  .word 0x00000020
/*0x7d2c*/  .word 0x400b2000 /* GPIO B, pin 4 */
/*0x7d30*/  .word 0x00000010
/*0x7d34*/  .word 0x400b2000 /* GPIO B, pin 3 */
/*0x7d38*/  .word 0x00000008
/*0x7d3c*/  .word 0x400b2000 /* GPIO B, pin 2 */
/*0x7d40*/  .word 0x00000004
/*0x7d44*/  .word 0x400b4000 /* GPIO C, pin 6 */
/*0x7d48*/  .word 0x00000040
/*0x7d4c*/  .word 0x400b4000 /* GPIO C, pin 5 */
/*0x7d50*/  .word 0x00000020

/*0x7d54*/  .byte 0x00
/*0x7d55*/  .byte 0x00
/*0x7d56*/  .byte 0x13
/*0x7d57*/  .byte 0x00
/*0x7d58*/  .byte 0x26
/*0x7d59*/  .byte 0x00
/*0x7d5a*/  .byte 0x3a
/*0x7d5b*/  .byte 0x00
/*0x7d5c*/  .byte 0x4e
/*0x7d5d*/  .byte 0x00
/*0x7d5e*/  .byte 0x62
/*0x7d5f*/  .byte 0x00
/*0x7d60*/  .byte 0x77
/*0x7d61*/  .byte 0x00
/*0x7d62*/  .byte 0x8c
/*0x7d63*/  .byte 0x00
/*0x7d64*/  .byte 0xa1
/*0x7d65*/  .byte 0x00
/*0x7d66*/  .byte 0xb7
/*0x7d67*/  .byte 0x00
/*0x7d68*/  .byte 0xcd
/*0x7d69*/  .byte 0x00
/*0x7d6a*/  .byte 0xe3
/*0x7d6b*/  .byte 0x00
/*0x7d6c*/  .byte 0xfa
/*0x7d6d*/  .byte 0x00
/*0x7d6e*/  .byte 0x11
/*0x7d6f*/  .byte 0x01
/*0x7d70*/  .byte 0x28
/*0x7d71*/  .byte 0x01
/*0x7d72*/  .byte 0x40
/*0x7d73*/  .byte 0x01
/*0x7d74*/  .byte 0x58
/*0x7d75*/  .byte 0x01
/*0x7d76*/  .byte 0x71
/*0x7d77*/  .byte 0x01
/*0x7d78*/  .byte 0x8a
/*0x7d79*/  .byte 0x01
/*0x7d7a*/  .byte 0xa3
/*0x7d7b*/  .byte 0x01
/*0x7d7c*/  .byte 0xbd
/*0x7d7d*/  .byte 0x01
/*0x7d7e*/  .byte 0xd7
/*0x7d7f*/  .byte 0x01
/*0x7d80*/  .byte 0xf1
/*0x7d81*/  .byte 0x01
/*0x7d82*/  .byte 0x0c
/*0x7d83*/  .byte 0x02
/*0x7d84*/  .byte 0x28
/*0x7d85*/  .byte 0x02
/*0x7d86*/  .byte 0x43
/*0x7d87*/  .byte 0x02
/*0x7d88*/  .byte 0x60
/*0x7d89*/  .byte 0x02
/*0x7d8a*/  .byte 0x7c
/*0x7d8b*/  .byte 0x02
/*0x7d8c*/  .byte 0x9a
/*0x7d8d*/  .byte 0x02
/*0x7d8e*/  .byte 0xb7
/*0x7d8f*/  .byte 0x02
/*0x7d90*/  .byte 0xd5
/*0x7d91*/  .byte 0x02
/*0x7d92*/  .byte 0xf4
/*0x7d93*/  .byte 0x02
/*0x7d94*/  .byte 0x13
/*0x7d95*/  .byte 0x03
/*0x7d96*/  .byte 0x32
/*0x7d97*/  .byte 0x03
/*0x7d98*/  .byte 0x53
/*0x7d99*/  .byte 0x03
/*0x7d9a*/  .byte 0x73
/*0x7d9b*/  .byte 0x03
/*0x7d9c*/  .byte 0x94
/*0x7d9d*/  .byte 0x03
/*0x7d9e*/  .byte 0xb6
/*0x7d9f*/  .byte 0x03
/*0x7da0*/  .byte 0xd8
/*0x7da1*/  .byte 0x03
/*0x7da2*/  .byte 0xfb
/*0x7da3*/  .byte 0x03
/*0x7da4*/  .byte 0x1e
/*0x7da5*/  .byte 0x04
/*0x7da6*/  .byte 0x42
/*0x7da7*/  .byte 0x04
/*0x7da8*/  .byte 0x66
/*0x7da9*/  .byte 0x04
/*0x7daa*/  .byte 0x8b
/*0x7dab*/  .byte 0x04
/*0x7dac*/  .byte 0xb1
/*0x7dad*/  .byte 0x04
/*0x7dae*/  .byte 0xd7
/*0x7daf*/  .byte 0x04
/*0x7db0*/  .byte 0xfd
/*0x7db1*/  .byte 0x04
/*0x7db2*/  .byte 0x25
/*0x7db3*/  .byte 0x05
/*0x7db4*/  .byte 0x4d
/*0x7db5*/  .byte 0x05
/*0x7db6*/  .byte 0x75
/*0x7db7*/  .byte 0x05
/*0x7db8*/  .byte 0x9f
/*0x7db9*/  .byte 0x05
/*0x7dba*/  .byte 0xc8
/*0x7dbb*/  .byte 0x05
/*0x7dbc*/  .byte 0xf3
/*0x7dbd*/  .byte 0x05
/*0x7dbe*/  .byte 0x1e
/*0x7dbf*/  .byte 0x06
/*0x7dc0*/  .byte 0x4a
/*0x7dc1*/  .byte 0x06
/*0x7dc2*/  .byte 0x77
/*0x7dc3*/  .byte 0x06
/*0x7dc4*/  .byte 0xa4
/*0x7dc5*/  .byte 0x06
/*0x7dc6*/  .byte 0xd2
/*0x7dc7*/  .byte 0x06
/*0x7dc8*/  .byte 0x01
/*0x7dc9*/  .byte 0x07
/*0x7dca*/  .byte 0x31
/*0x7dcb*/  .byte 0x07
/*0x7dcc*/  .byte 0x61
/*0x7dcd*/  .byte 0x07
/*0x7dce*/  .byte 0x92
/*0x7dcf*/  .byte 0x07
/*0x7dd0*/  .byte 0xc4
/*0x7dd1*/  .byte 0x07
/*0x7dd2*/  .byte 0xf6
/*0x7dd3*/  .byte 0x07
/*0x7dd4*/  .byte 0x2a
/*0x7dd5*/  .byte 0x08
/*0x7dd6*/  .byte 0x5e
/*0x7dd7*/  .byte 0x08
/*0x7dd8*/  .byte 0x93
/*0x7dd9*/  .byte 0x08
/*0x7dda*/  .byte 0xc9
/*0x7ddb*/  .byte 0x08
/*0x7ddc*/  .byte 0x00
/*0x7ddd*/  .byte 0x09
/*0x7dde*/  .byte 0x38
/*0x7ddf*/  .byte 0x09
/*0x7de0*/  .byte 0x70
/*0x7de1*/  .byte 0x09
/*0x7de2*/  .byte 0xaa
/*0x7de3*/  .byte 0x09
/*0x7de4*/  .byte 0xe4
/*0x7de5*/  .byte 0x09
/*0x7de6*/  .byte 0x1f
/*0x7de7*/  .byte 0x0a
/*0x7de8*/  .byte 0x5b
/*0x7de9*/  .byte 0x0a
/*0x7dea*/  .byte 0x99
/*0x7deb*/  .byte 0x0a
/*0x7dec*/  .byte 0xd7
/*0x7ded*/  .byte 0x0a
/*0x7dee*/  .byte 0x16
/*0x7def*/  .byte 0x0b
/*0x7df0*/  .byte 0x56
/*0x7df1*/  .byte 0x0b
/*0x7df2*/  .byte 0x97
/*0x7df3*/  .byte 0x0b
/*0x7df4*/  .byte 0xd9
/*0x7df5*/  .byte 0x0b
/*0x7df6*/  .byte 0x1d
/*0x7df7*/  .byte 0x0c
/*0x7df8*/  .byte 0x61
/*0x7df9*/  .byte 0x0c
/*0x7dfa*/  .byte 0xa6
/*0x7dfb*/  .byte 0x0c
/*0x7dfc*/  .byte 0xed
/*0x7dfd*/  .byte 0x0c
/*0x7dfe*/  .byte 0x34
/*0x7dff*/  .byte 0x0d
/*0x7e00*/  .byte 0x7d
/*0x7e01*/  .byte 0x0d
/*0x7e02*/  .byte 0xc7
/*0x7e03*/  .byte 0x0d
/*0x7e04*/  .byte 0x12
/*0x7e05*/  .byte 0x0e
/*0x7e06*/  .byte 0x5e
/*0x7e07*/  .byte 0x0e
/*0x7e08*/  .byte 0xac
/*0x7e09*/  .byte 0x0e
/*0x7e0a*/  .byte 0xfb
/*0x7e0b*/  .byte 0x0e
/*0x7e0c*/  .byte 0x4b
/*0x7e0d*/  .byte 0x0f
/*0x7e0e*/  .byte 0x9c
/*0x7e0f*/  .byte 0x0f
/*0x7e10*/  .byte 0xee
/*0x7e11*/  .byte 0x0f
/*0x7e12*/  .byte 0x42
/*0x7e13*/  .byte 0x10
/*0x7e14*/  .byte 0x97
/*0x7e15*/  .byte 0x10
/*0x7e16*/  .byte 0xee
/*0x7e17*/  .byte 0x10
/*0x7e18*/  .byte 0x46
/*0x7e19*/  .byte 0x11
/*0x7e1a*/  .byte 0x9f
/*0x7e1b*/  .byte 0x11
/*0x7e1c*/  .byte 0xfa
/*0x7e1d*/  .byte 0x11
/*0x7e1e*/  .byte 0x56
/*0x7e1f*/  .byte 0x12
/*0x7e20*/  .byte 0xb4
/*0x7e21*/  .byte 0x12
/*0x7e22*/  .byte 0x13
/*0x7e23*/  .byte 0x13
/*0x7e24*/  .byte 0x73
/*0x7e25*/  .byte 0x13
/*0x7e26*/  .byte 0xd5
/*0x7e27*/  .byte 0x13
/*0x7e28*/  .byte 0x39
/*0x7e29*/  .byte 0x14
/*0x7e2a*/  .byte 0x9e
/*0x7e2b*/  .byte 0x14
/*0x7e2c*/  .byte 0x05
/*0x7e2d*/  .byte 0x15
/*0x7e2e*/  .byte 0x6e
/*0x7e2f*/  .byte 0x15
/*0x7e30*/  .byte 0xd8
/*0x7e31*/  .byte 0x15
/*0x7e32*/  .byte 0x44
/*0x7e33*/  .byte 0x16
/*0x7e34*/  .byte 0xb2
/*0x7e35*/  .byte 0x16
/*0x7e36*/  .byte 0x21
/*0x7e37*/  .byte 0x17
/*0x7e38*/  .byte 0x92
/*0x7e39*/  .byte 0x17
/*0x7e3a*/  .byte 0x05
/*0x7e3b*/  .byte 0x18
/*0x7e3c*/  .byte 0x7a
/*0x7e3d*/  .byte 0x18
/*0x7e3e*/  .byte 0xf0
/*0x7e3f*/  .byte 0x18
/*0x7e40*/  .byte 0x69
/*0x7e41*/  .byte 0x19
/*0x7e42*/  .byte 0xe3
/*0x7e43*/  .byte 0x19
/*0x7e44*/  .byte 0x5f
/*0x7e45*/  .byte 0x1a
/*0x7e46*/  .byte 0xde
/*0x7e47*/  .byte 0x1a
/*0x7e48*/  .byte 0x5e
/*0x7e49*/  .byte 0x1b
/*0x7e4a*/  .byte 0xe0
/*0x7e4b*/  .byte 0x1b
/*0x7e4c*/  .byte 0x65
/*0x7e4d*/  .byte 0x1c
/*0x7e4e*/  .byte 0xeb
/*0x7e4f*/  .byte 0x1c
/*0x7e50*/  .byte 0x74
/*0x7e51*/  .byte 0x1d
/*0x7e52*/  .byte 0xff
/*0x7e53*/  .byte 0x1d
/*0x7e54*/  .byte 0x8c
/*0x7e55*/  .byte 0x1e
/*0x7e56*/  .byte 0x1b
/*0x7e57*/  .byte 0x1f
/*0x7e58*/  .byte 0xac
/*0x7e59*/  .byte 0x1f
/*0x7e5a*/  .byte 0x40
/*0x7e5b*/  .byte 0x20
/*0x7e5c*/  .byte 0xd6
/*0x7e5d*/  .byte 0x20
/*0x7e5e*/  .byte 0x6f
/*0x7e5f*/  .byte 0x21
/*0x7e60*/  .byte 0x0a
/*0x7e61*/  .byte 0x22
/*0x7e62*/  .byte 0xa8
/*0x7e63*/  .byte 0x22
/*0x7e64*/  .byte 0x48
/*0x7e65*/  .byte 0x23
/*0x7e66*/  .byte 0xea
/*0x7e67*/  .byte 0x23
/*0x7e68*/  .byte 0x8f
/*0x7e69*/  .byte 0x24
/*0x7e6a*/  .byte 0x37
/*0x7e6b*/  .byte 0x25
/*0x7e6c*/  .byte 0xe1
/*0x7e6d*/  .byte 0x25
/*0x7e6e*/  .byte 0x8e
/*0x7e6f*/  .byte 0x26
/*0x7e70*/  .byte 0x3e
/*0x7e71*/  .byte 0x27
/*0x7e72*/  .byte 0xf1
/*0x7e73*/  .byte 0x27
/*0x7e74*/  .byte 0xa6
/*0x7e75*/  .byte 0x28
/*0x7e76*/  .byte 0x5f
/*0x7e77*/  .byte 0x29
/*0x7e78*/  .byte 0x1a
/*0x7e79*/  .byte 0x2a
/*0x7e7a*/  .byte 0xd8
/*0x7e7b*/  .byte 0x2a
/*0x7e7c*/  .byte 0x99
/*0x7e7d*/  .byte 0x2b
/*0x7e7e*/  .byte 0x5e
/*0x7e7f*/  .byte 0x2c
/*0x7e80*/  .byte 0x25
/*0x7e81*/  .byte 0x2d
/*0x7e82*/  .byte 0xf0
/*0x7e83*/  .byte 0x2d
/*0x7e84*/  .byte 0xbe
/*0x7e85*/  .byte 0x2e
/*0x7e86*/  .byte 0x8f
/*0x7e87*/  .byte 0x2f
/*0x7e88*/  .byte 0x63
/*0x7e89*/  .byte 0x30
/*0x7e8a*/  .byte 0x3b
/*0x7e8b*/  .byte 0x31
/*0x7e8c*/  .byte 0x16
/*0x7e8d*/  .byte 0x32
/*0x7e8e*/  .byte 0xf5
/*0x7e8f*/  .byte 0x32
/*0x7e90*/  .byte 0xd7
/*0x7e91*/  .byte 0x33
/*0x7e92*/  .byte 0xbd
/*0x7e93*/  .byte 0x34
/*0x7e94*/  .byte 0xa7
/*0x7e95*/  .byte 0x35
/*0x7e96*/  .byte 0x94
/*0x7e97*/  .byte 0x36
/*0x7e98*/  .byte 0x85
/*0x7e99*/  .byte 0x37
/*0x7e9a*/  .byte 0x7a
/*0x7e9b*/  .byte 0x38
/*0x7e9c*/  .byte 0x72
/*0x7e9d*/  .byte 0x39
/*0x7e9e*/  .byte 0x6f
/*0x7e9f*/  .byte 0x3a
/*0x7ea0*/  .byte 0x70
/*0x7ea1*/  .byte 0x3b
/*0x7ea2*/  .byte 0x74
/*0x7ea3*/  .byte 0x3c
/*0x7ea4*/  .byte 0x7d
/*0x7ea5*/  .byte 0x3d
/*0x7ea6*/  .byte 0x8a
/*0x7ea7*/  .byte 0x3e
/*0x7ea8*/  .byte 0x9c
/*0x7ea9*/  .byte 0x3f
/*0x7eaa*/  .byte 0xb1
/*0x7eab*/  .byte 0x40
/*0x7eac*/  .byte 0xcb
/*0x7ead*/  .byte 0x41
/*0x7eae*/  .byte 0xea
/*0x7eaf*/  .byte 0x42
/*0x7eb0*/  .byte 0x0d
/*0x7eb1*/  .byte 0x44
/*0x7eb2*/  .byte 0x35
/*0x7eb3*/  .byte 0x45
/*0x7eb4*/  .byte 0x61
/*0x7eb5*/  .byte 0x46
/*0x7eb6*/  .byte 0x93
/*0x7eb7*/  .byte 0x47
/*0x7eb8*/  .byte 0xc9
/*0x7eb9*/  .byte 0x48
/*0x7eba*/  .byte 0x04
/*0x7ebb*/  .byte 0x4a
/*0x7ebc*/  .byte 0x44
/*0x7ebd*/  .byte 0x4b
/*0x7ebe*/  .byte 0x89
/*0x7ebf*/  .byte 0x4c
/*0x7ec0*/  .byte 0xd3
/*0x7ec1*/  .byte 0x4d
/*0x7ec2*/  .byte 0x22
/*0x7ec3*/  .byte 0x4f
/*0x7ec4*/  .byte 0x77
/*0x7ec5*/  .byte 0x50
/*0x7ec6*/  .byte 0xd2
/*0x7ec7*/  .byte 0x51
/*0x7ec8*/  .byte 0x31
/*0x7ec9*/  .byte 0x53
/*0x7eca*/  .byte 0x97
/*0x7ecb*/  .byte 0x54
/*0x7ecc*/  .byte 0x02
/*0x7ecd*/  .byte 0x56
/*0x7ece*/  .byte 0x72
/*0x7ecf*/  .byte 0x57
/*0x7ed0*/  .byte 0xe9
/*0x7ed1*/  .byte 0x58
/*0x7ed2*/  .byte 0x66
/*0x7ed3*/  .byte 0x5a
/*0x7ed4*/  .byte 0xe8
/*0x7ed5*/  .byte 0x5b
/*0x7ed6*/  .byte 0x71
/*0x7ed7*/  .byte 0x5d
/*0x7ed8*/  .byte 0x00
/*0x7ed9*/  .byte 0x5f
/*0x7eda*/  .byte 0x95
/*0x7edb*/  .byte 0x60
/*0x7edc*/  .byte 0x31
/*0x7edd*/  .byte 0x62
/*0x7ede*/  .byte 0xd3
/*0x7edf*/  .byte 0x63
/*0x7ee0*/  .byte 0x7c
/*0x7ee1*/  .byte 0x65
/*0x7ee2*/  .byte 0x2c
/*0x7ee3*/  .byte 0x67
/*0x7ee4*/  .byte 0xe3
/*0x7ee5*/  .byte 0x68
/*0x7ee6*/  .byte 0xa0
/*0x7ee7*/  .byte 0x6a
/*0x7ee8*/  .byte 0x65
/*0x7ee9*/  .byte 0x6c
/*0x7eea*/  .byte 0x31
/*0x7eeb*/  .byte 0x6e
/*0x7eec*/  .byte 0x04
/*0x7eed*/  .byte 0x70
/*0x7eee*/  .byte 0xde
/*0x7eef*/  .byte 0x71
/*0x7ef0*/  .byte 0xc0
/*0x7ef1*/  .byte 0x73
/*0x7ef2*/  .byte 0xaa
/*0x7ef3*/  .byte 0x75
/*0x7ef4*/  .byte 0x9c
/*0x7ef5*/  .byte 0x77
/*0x7ef6*/  .byte 0x95
/*0x7ef7*/  .byte 0x79
/*0x7ef8*/  .byte 0x96
/*0x7ef9*/  .byte 0x7b
/*0x7efa*/  .byte 0xa0
/*0x7efb*/  .byte 0x7d
/*0x7efc*/  .byte 0xb2
/*0x7efd*/  .byte 0x7f
/*0x7efe*/  .byte 0xcc
/*0x7eff*/  .byte 0x81
/*0x7f00*/  .byte 0xef
/*0x7f01*/  .byte 0x83
/*0x7f02*/  .byte 0x1a
/*0x7f03*/  .byte 0x86
/*0x7f04*/  .byte 0x4f
/*0x7f05*/  .byte 0x88
/*0x7f06*/  .byte 0x8c
/*0x7f07*/  .byte 0x8a
/*0x7f08*/  .byte 0xd3
/*0x7f09*/  .byte 0x8c
/*0x7f0a*/  .byte 0x22
/*0x7f0b*/  .byte 0x8f
/*0x7f0c*/  .byte 0x7b
/*0x7f0d*/  .byte 0x91
/*0x7f0e*/  .byte 0xde
/*0x7f0f*/  .byte 0x93
/*0x7f10*/  .byte 0x4a
/*0x7f11*/  .byte 0x96
/*0x7f12*/  .byte 0xc0
/*0x7f13*/  .byte 0x98
/*0x7f14*/  .byte 0x40
/*0x7f15*/  .byte 0x9b
/*0x7f16*/  .byte 0xcb
/*0x7f17*/  .byte 0x9d
/*0x7f18*/  .byte 0x5f
/*0x7f19*/  .byte 0xa0
/*0x7f1a*/  .byte 0xff
/*0x7f1b*/  .byte 0xa2
/*0x7f1c*/  .byte 0xa8
/*0x7f1d*/  .byte 0xa5
/*0x7f1e*/  .byte 0x5d
/*0x7f1f*/  .byte 0xa8
/*0x7f20*/  .byte 0x1d
/*0x7f21*/  .byte 0xab
/*0x7f22*/  .byte 0xe8
/*0x7f23*/  .byte 0xad
/*0x7f24*/  .byte 0xbe
/*0x7f25*/  .byte 0xb0
/*0x7f26*/  .byte 0x9f
/*0x7f27*/  .byte 0xb3
/*0x7f28*/  .byte 0x8d
/*0x7f29*/  .byte 0xb6
/*0x7f2a*/  .byte 0x86
/*0x7f2b*/  .byte 0xb9
/*0x7f2c*/  .byte 0x8c
/*0x7f2d*/  .byte 0xbc
/*0x7f2e*/  .byte 0x9d
/*0x7f2f*/  .byte 0xbf
/*0x7f30*/  .byte 0xbc
/*0x7f31*/  .byte 0xc2
/*0x7f32*/  .byte 0xe6
/*0x7f33*/  .byte 0xc5
/*0x7f34*/  .byte 0x1e
/*0x7f35*/  .byte 0xc9
/*0x7f36*/  .byte 0x63
/*0x7f37*/  .byte 0xcc
/*0x7f38*/  .byte 0xb5
/*0x7f39*/  .byte 0xcf
/*0x7f3a*/  .byte 0x15
/*0x7f3b*/  .byte 0xd3
/*0x7f3c*/  .byte 0x82
/*0x7f3d*/  .byte 0xd6
/*0x7f3e*/  .byte 0xfd
/*0x7f3f*/  .byte 0xd9
/*0x7f40*/  .byte 0x87
/*0x7f41*/  .byte 0xdd
/*0x7f42*/  .byte 0x1f
/*0x7f43*/  .byte 0xe1
/*0x7f44*/  .byte 0xc5
/*0x7f45*/  .byte 0xe4
/*0x7f46*/  .byte 0x7a
/*0x7f47*/  .byte 0xe8
/*0x7f48*/  .byte 0x3f
/*0x7f49*/  .byte 0xec
/*0x7f4a*/  .byte 0x12
/*0x7f4b*/  .byte 0xf0
/*0x7f4c*/  .byte 0xf5
/*0x7f4d*/  .byte 0xf3
/*0x7f4e*/  .byte 0xe9
/*0x7f4f*/  .byte 0xf7
/*0x7f50*/  .byte 0xec
/*0x7f51*/  .byte 0xfb
/*0x7f52*/  .byte 0xff
/*0x7f53*/  .byte 0xff
            data_7f54:
/*0x7f54*/  .byte 0xe8
/*0x7f55*/  .byte 0xc0
/*0x7f56*/  .byte 0xc1
/*0x7f57*/  .byte 0xc2
/*0x7f58*/  .byte 0xc3
/*0x7f59*/  .byte 0x00
/*0x7f5a*/  .byte 0x00
/*0x7f5b*/  .byte 0x00
/*0x7f5c*/  .byte 0xc0
/*0x7f5d*/  .byte 0x80
/*0x7f5e*/  .byte 0x00
/*0x7f5f*/  .byte 0x00
/*0x7f60*/  .byte 0xc4
/*0x7f61*/  .byte 0x80
/*0x7f62*/  .byte 0x00
/*0x7f63*/  .byte 0x00
            usb_report1_desc:
/*0x7f64*/  .byte 0x06 /* Usage Page (Vendor Defined 0xFF00) */
/*0x7f65*/  .byte 0x00
/*0x7f66*/  .byte 0xff
/*0x7f67*/  .byte 0x09 /* Usage (0x01) */
/*0x7f68*/  .byte 0x01
/*0x7f69*/  .byte 0xa1 /* Collection (Application) */
/*0x7f6a*/  .byte 0x01
/*0x7f6b*/  .byte 0x09 /* - Usage (0x02) */
/*0x7f6c*/  .byte 0x02
/*0x7f6d*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x7f6e*/  .byte 0x00
/*0x7f6f*/  .byte 0x26 /* - Logical Maximum (255) */
/*0x7f70*/  .byte 0xff
/*0x7f71*/  .byte 0x00
/*0x7f72*/  .byte 0x75 /* - Report Size (8) */
/*0x7f73*/  .byte 0x08
/*0x7f74*/  .byte 0x95 /* - Report Count (64) */
/*0x7f75*/  .byte 0x40
/*0x7f76*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7f77*/  .byte 0x02
/*0x7f78*/  .byte 0x09 /* - Usage (0x03) */
/*0x7f79*/  .byte 0x03
/*0x7f7a*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x7f7b*/  .byte 0x00
/*0x7f7c*/  .byte 0x26 /* - Logical Maximum (255) */
/*0x7f7d*/  .byte 0xff
/*0x7f7e*/  .byte 0x00
/*0x7f7f*/  .byte 0x75 /* - Report Size (8) */
/*0x7f80*/  .byte 0x08
/*0x7f81*/  .byte 0x95 /* - Report Count (64) */
/*0x7f82*/  .byte 0x40
/*0x7f83*/  .byte 0x91 /* - Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x7f84*/  .byte 0x02
/*0x7f85*/  .byte 0xc0 /* End Collection */
/*0x7f86*/  .byte 0x00
/*0x7f87*/  .byte 0x00
            usb_report2_desc:
/*0x7f88*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x7f89*/  .byte 0x01
/*0x7f8a*/  .byte 0x09 /* Usage (Sys Control) */
/*0x7f8b*/  .byte 0x80
/*0x7f8c*/  .byte 0xa1 /* Collection (Application) */
/*0x7f8d*/  .byte 0x01
/*0x7f8e*/  .byte 0x85 /* - Report ID (1) */
/*0x7f8f*/  .byte 0x01
/*0x7f90*/  .byte 0x19 /* - Usage Minimum (Sys Power Down) */
/*0x7f91*/  .byte 0x81
/*0x7f92*/  .byte 0x29 /* - Usage Maximum (Sys Wake Up) */
/*0x7f93*/  .byte 0x83
/*0x7f94*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x7f95*/  .byte 0x00
/*0x7f96*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x7f97*/  .byte 0x01
/*0x7f98*/  .byte 0x95 /* - Report Count (3) */
/*0x7f99*/  .byte 0x03
/*0x7f9a*/  .byte 0x75 /* - Report Size (1) */
/*0x7f9b*/  .byte 0x01
/*0x7f9c*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7f9d*/  .byte 0x02
/*0x7f9e*/  .byte 0x95 /* - Report Count (1) */
/*0x7f9f*/  .byte 0x01
/*0x7fa0*/  .byte 0x75 /* - Report Size (5) */
/*0x7fa1*/  .byte 0x05
/*0x7fa2*/  .byte 0x81 /* - Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7fa3*/  .byte 0x01
/*0x7fa4*/  .byte 0xc0 /* End Collection */
/*0x7fa5*/  .byte 0x05 /* Usage Page (Consumer) */
/*0x7fa6*/  .byte 0x0c
/*0x7fa7*/  .byte 0x09 /* Usage (Consumer Control) */
/*0x7fa8*/  .byte 0x01
/*0x7fa9*/  .byte 0xa1 /* Collection (Application) */
/*0x7faa*/  .byte 0x01
/*0x7fab*/  .byte 0x85 /* - Report ID (2) */
/*0x7fac*/  .byte 0x02
/*0x7fad*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x7fae*/  .byte 0x00
/*0x7faf*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x7fb0*/  .byte 0x01
/*0x7fb1*/  .byte 0x95 /* - Report Count (18) */
/*0x7fb2*/  .byte 0x12
/*0x7fb3*/  .byte 0x75 /* - Report Size (1) */
/*0x7fb4*/  .byte 0x01
/*0x7fb5*/  .byte 0x0a
/*0x7fb6*/  .byte 0x83 /* - Usage (AL Consumer Control Configuration) */
/*0x7fb7*/  .byte 0x01
/*0x7fb8*/  .byte 0x0a
/*0x7fb9*/  .byte 0x8a /* - Usage (AL Email Reader) */
/*0x7fba*/  .byte 0x01
/*0x7fbb*/  .byte 0x0a
/*0x7fbc*/  .byte 0x92 /* - Usage (AL Calculator) */
/*0x7fbd*/  .byte 0x01
/*0x7fbe*/  .byte 0x0a
/*0x7fbf*/  .byte 0x94 /* - Usage (AL Local Machine Browser) */
/*0x7fc0*/  .byte 0x01
/*0x7fc1*/  .byte 0x09 /* - Usage (Play/Pause) */
/*0x7fc2*/  .byte 0xcd
/*0x7fc3*/  .byte 0x09 /* - Usage (Stop) */
/*0x7fc4*/  .byte 0xb7
/*0x7fc5*/  .byte 0x09 /* - Usage (Scan Previous Track) */
/*0x7fc6*/  .byte 0xb6
/*0x7fc7*/  .byte 0x09 /* - Usage (Scan Next Track) */
/*0x7fc8*/  .byte 0xb5
/*0x7fc9*/  .byte 0x09 /* - Usage (Mute) */
/*0x7fca*/  .byte 0xe2
/*0x7fcb*/  .byte 0x09 /* - Usage (Volume Decrement) */
/*0x7fcc*/  .byte 0xea
/*0x7fcd*/  .byte 0x09 /* - Usage (Volume Increment) */
/*0x7fce*/  .byte 0xe9
/*0x7fcf*/  .byte 0x0a
/*0x7fd0*/  .byte 0x21 /* - Usage (AC Search) */
/*0x7fd1*/  .byte 0x02
/*0x7fd2*/  .byte 0x0a
/*0x7fd3*/  .byte 0x23 /* - Usage (AC Home) */
/*0x7fd4*/  .byte 0x02
/*0x7fd5*/  .byte 0x0a
/*0x7fd6*/  .byte 0x24 /* - Usage (AC Back) */
/*0x7fd7*/  .byte 0x02
/*0x7fd8*/  .byte 0x0a
/*0x7fd9*/  .byte 0x25 /* - Usage (AC Forward) */
/*0x7fda*/  .byte 0x02
/*0x7fdb*/  .byte 0x0a
/*0x7fdc*/  .byte 0x26 /* - Usage (AC Stop) */
/*0x7fdd*/  .byte 0x02
/*0x7fde*/  .byte 0x0a
/*0x7fdf*/  .byte 0x27 /* - Usage (AC Refresh) */
/*0x7fe0*/  .byte 0x02
/*0x7fe1*/  .byte 0x0a
/*0x7fe2*/  .byte 0x2a /* - Usage (AC Bookmarks) */
/*0x7fe3*/  .byte 0x02
/*0x7fe4*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7fe5*/  .byte 0x02
/*0x7fe6*/  .byte 0x95 /* - Report Count (1) */
/*0x7fe7*/  .byte 0x01
/*0x7fe8*/  .byte 0x75 /* - Report Size (14) */
/*0x7fe9*/  .byte 0x0e
/*0x7fea*/  .byte 0x81 /* - Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7feb*/  .byte 0x01
/*0x7fec*/  .byte 0xc0 /* End Collection */
/*0x7fed*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x7fee*/  .byte 0x01
/*0x7fef*/  .byte 0x09 /* Usage (Keyboard) */
/*0x7ff0*/  .byte 0x06
/*0x7ff1*/  .byte 0xa1 /* Collection (Application) */
/*0x7ff2*/  .byte 0x01
/*0x7ff3*/  .byte 0x85 /* - Report ID (4) */
/*0x7ff4*/  .byte 0x04
/*0x7ff5*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x7ff6*/  .byte 0x07
/*0x7ff7*/  .byte 0x95 /* - Report Count (1) */
/*0x7ff8*/  .byte 0x01
/*0x7ff9*/  .byte 0x75 /* - Report Size (8) */
/*0x7ffa*/  .byte 0x08
/*0x7ffb*/  .byte 0x81 /* - Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x7ffc*/  .byte 0x03
/*0x7ffd*/  .byte 0x95 /* - Report Count (232) */
/*0x7ffe*/  .byte 0xe8
/*0x7fff*/  .byte 0x75 /* - Report Size (1) */
/*0x8000*/  .byte 0x01
/*0x8001*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x8002*/  .byte 0x00
/*0x8003*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x8004*/  .byte 0x01
/*0x8005*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x8006*/  .byte 0x07
/*0x8007*/  .byte 0x19 /* - Usage Minimum (0x00) */
/*0x8008*/  .byte 0x00
/*0x8009*/  .byte 0x29 /* - Usage Maximum (0xE7) */
/*0x800a*/  .byte 0xe7
/*0x800b*/  .byte 0x81 /* - Input (Data,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x800c*/  .byte 0x00
/*0x800d*/  .byte 0xc0 /* End Collection */
/*0x800e*/  .byte 0x00
/*0x800f*/  .byte 0x00
            usb_report0_desc:
/*0x8010*/  .byte 0x05 /* Usage Page (Generic Desktop Ctrls) */
/*0x8011*/  .byte 0x01
/*0x8012*/  .byte 0x09 /* Usage (Keyboard) */
/*0x8013*/  .byte 0x06
/*0x8014*/  .byte 0xa1 /* Collection (Application) */
/*0x8015*/  .byte 0x01
/*0x8016*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x8017*/  .byte 0x07
/*0x8018*/  .byte 0x19 /* - Usage Minimum (0xE0) */
/*0x8019*/  .byte 0xe0
/*0x801a*/  .byte 0x29 /* - Usage Maximum (0xE7) */
/*0x801b*/  .byte 0xe7
/*0x801c*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x801d*/  .byte 0x00
/*0x801e*/  .byte 0x25 /* - Logical Maximum (1) */
/*0x801f*/  .byte 0x01
/*0x8020*/  .byte 0x75 /* - Report Size (1) */
/*0x8021*/  .byte 0x01
/*0x8022*/  .byte 0x95 /* - Report Count (8) */
/*0x8023*/  .byte 0x08
/*0x8024*/  .byte 0x81 /* - Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x8025*/  .byte 0x02
/*0x8026*/  .byte 0x95 /* - Report Count (1) */
/*0x8027*/  .byte 0x01
/*0x8028*/  .byte 0x75 /* - Report Size (8) */
/*0x8029*/  .byte 0x08
/*0x802a*/  .byte 0x81 /* - Input (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x802b*/  .byte 0x03
/*0x802c*/  .byte 0x95 /* - Report Count (3) */
/*0x802d*/  .byte 0x03
/*0x802e*/  .byte 0x75 /* - Report Size (1) */
/*0x802f*/  .byte 0x01
/*0x8030*/  .byte 0x05 /* - Usage Page (LEDs) */
/*0x8031*/  .byte 0x08
/*0x8032*/  .byte 0x19 /* - Usage Minimum (Num Lock) */
/*0x8033*/  .byte 0x01
/*0x8034*/  .byte 0x29 /* - Usage Maximum (Scroll Lock) */
/*0x8035*/  .byte 0x03
/*0x8036*/  .byte 0x91 /* - Output (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x8037*/  .byte 0x02
/*0x8038*/  .byte 0x95 /* - Report Count (1) */
/*0x8039*/  .byte 0x01
/*0x803a*/  .byte 0x75 /* - Report Size (5) */
/*0x803b*/  .byte 0x05
/*0x803c*/  .byte 0x91 /* - Output (Const,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile) */
/*0x803d*/  .byte 0x03
/*0x803e*/  .byte 0x95 /* - Report Count (6) */
/*0x803f*/  .byte 0x06
/*0x8040*/  .byte 0x75 /* - Report Size (8) */
/*0x8041*/  .byte 0x08
/*0x8042*/  .byte 0x15 /* - Logical Minimum (0) */
/*0x8043*/  .byte 0x00
/*0x8044*/  .byte 0x26 /* - Logical Maximum (164) */
/*0x8045*/  .byte 0xa4
/*0x8046*/  .byte 0x00
/*0x8047*/  .byte 0x05 /* - Usage Page (Kbrd/Keypad) */
/*0x8048*/  .byte 0x07
/*0x8049*/  .byte 0x19 /* - Usage Minimum (0x00) */
/*0x804a*/  .byte 0x00
/*0x804b*/  .byte 0x29 /* - Usage Maximum (0xA4) */
/*0x804c*/  .byte 0xa4
/*0x804d*/  .byte 0x81 /* - Input (Data,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
/*0x804e*/  .byte 0x00
/*0x804f*/  .byte 0xc0 /* End Collection */
            usb_config_desc:
/*0x8050*/  .byte 0x09
/*0x8051*/  .byte 0x02
/*0x8052*/  .byte 0x5b
/*0x8053*/  .byte 0x00
/*0x8054*/  .byte 0x03
/*0x8055*/  .byte 0x01
/*0x8056*/  .byte 0x00
/*0x8057*/  .byte 0xa0
/*0x8058*/  .byte 0x32
            usb_interface0_desc:
/*0x8059*/  .byte 0x09
/*0x805a*/  .byte 0x04
/*0x805b*/  .byte 0x00
/*0x805c*/  .byte 0x00
/*0x805d*/  .byte 0x01
/*0x805e*/  .byte 0x03
/*0x805f*/  .byte 0x01
/*0x8060*/  .byte 0x01
/*0x8061*/  .byte 0x00
            usb_hid0_desc:
/*0x8062*/  .byte 0x09
/*0x8063*/  .byte 0x21
/*0x8064*/  .byte 0x11
/*0x8065*/  .byte 0x01
/*0x8066*/  .byte 0x00
/*0x8067*/  .byte 0x01
/*0x8068*/  .byte 0x22
/*0x8069*/  .byte 0x40
/*0x806a*/  .byte 0x00
            usb_endpoint1_desc:
/*0x806b*/  .byte 0x07
/*0x806c*/  .byte 0x05
/*0x806d*/  .byte 0x81
/*0x806e*/  .byte 0x03
/*0x806f*/  .byte 0x08
/*0x8070*/  .byte 0x00
/*0x8071*/  .byte 0x01
            usb_interface1_desc:
/*0x8072*/  .byte 0x09
/*0x8073*/  .byte 0x04
/*0x8074*/  .byte 0x01
/*0x8075*/  .byte 0x00
/*0x8076*/  .byte 0x02
/*0x8077*/  .byte 0x03
/*0x8078*/  .byte 0x00
/*0x8079*/  .byte 0x00
/*0x807a*/  .byte 0x00
            usb_hid1_desc:
/*0x807b*/  .byte 0x09
/*0x807c*/  .byte 0x21
/*0x807d*/  .byte 0x11
/*0x807e*/  .byte 0x01
/*0x807f*/  .byte 0x00
/*0x8080*/  .byte 0x01
/*0x8081*/  .byte 0x22
/*0x8082*/  .byte 0x22
/*0x8083*/  .byte 0x00
            usb_endpoint3_desc:
/*0x8084*/  .byte 0x07
/*0x8085*/  .byte 0x05
/*0x8086*/  .byte 0x83
/*0x8087*/  .byte 0x03
/*0x8088*/  .byte 0x40
/*0x8089*/  .byte 0x00
/*0x808a*/  .byte 0x01
            usb_endpoint4_desc:
/*0x808b*/  .byte 0x07
/*0x808c*/  .byte 0x05
/*0x808d*/  .byte 0x04
/*0x808e*/  .byte 0x03
/*0x808f*/  .byte 0x40
/*0x8090*/  .byte 0x00
/*0x8091*/  .byte 0x01
            usb_interface2_desc:
/*0x8092*/  .byte 0x09
/*0x8093*/  .byte 0x04
/*0x8094*/  .byte 0x02
/*0x8095*/  .byte 0x00
/*0x8096*/  .byte 0x01
/*0x8097*/  .byte 0x03
/*0x8098*/  .byte 0x00
/*0x8099*/  .byte 0x00
/*0x809a*/  .byte 0x00
            usb_hid2_desc:
/*0x809b*/  .byte 0x09
/*0x809c*/  .byte 0x21
/*0x809d*/  .byte 0x11
/*0x809e*/  .byte 0x01
/*0x809f*/  .byte 0x00
/*0x80a0*/  .byte 0x01
/*0x80a1*/  .byte 0x22
/*0x80a2*/  .byte 0x86
/*0x80a3*/  .byte 0x00
            usb_endpoint2_desc:
/*0x80a4*/  .byte 0x07
/*0x80a5*/  .byte 0x05
/*0x80a6*/  .byte 0x82
/*0x80a7*/  .byte 0x03
/*0x80a8*/  .byte 0x40
/*0x80a9*/  .byte 0x00
/*0x80aa*/  .byte 0x01
/*0x80ab*/  .byte 0x00
            usb_device_desc:
/*0x80ac*/  .byte 0x12
/*0x80ad*/  .byte 0x01
/*0x80ae*/  .byte 0x10
/*0x80af*/  .byte 0x01
/*0x80b0*/  .byte 0x00
/*0x80b1*/  .byte 0x00
/*0x80b2*/  .byte 0x00
/*0x80b3*/  .byte 0x40
/*0x80b4*/  .byte 0xd9
/*0x80b5*/  .byte 0x04
/*0x80b6*/  .byte 0x67
/*0x80b7*/  .byte 0x01
/*0x80b8*/  .byte 0x04
/*0x80b9*/  .byte 0x11
/*0x80ba*/  .byte 0x00
/*0x80bb*/  .byte 0x01
/*0x80bc*/  .byte 0x00
/*0x80bd*/  .byte 0x01
/*0x80be*/  .byte 0x00
/*0x80bf*/  .byte 0x00
            usb_str0_desc:
/*0x80c0*/  .byte 0x04
/*0x80c1*/  .byte 0x03
/*0x80c2*/  .byte 0x09
/*0x80c3*/  .byte 0x04
            usb_str1_desc:
/*0x80c4*/  .byte 0x22
/*0x80c5*/  .byte 0x03
/*0x80c6*/  .byte 0x55
/*0x80c7*/  .byte 0x00
/*0x80c8*/  .byte 0x53
/*0x80c9*/  .byte 0x00
/*0x80ca*/  .byte 0x42
/*0x80cb*/  .byte 0x00
/*0x80cc*/  .byte 0x2d
/*0x80cd*/  .byte 0x00
/*0x80ce*/  .byte 0x48
/*0x80cf*/  .byte 0x00
/*0x80d0*/  .byte 0x49
/*0x80d1*/  .byte 0x00
/*0x80d2*/  .byte 0x44
/*0x80d3*/  .byte 0x00
/*0x80d4*/  .byte 0x20
/*0x80d5*/  .byte 0x00
/*0x80d6*/  .byte 0x4b
/*0x80d7*/  .byte 0x00
/*0x80d8*/  .byte 0x65
/*0x80d9*/  .byte 0x00
/*0x80da*/  .byte 0x79
/*0x80db*/  .byte 0x00
/*0x80dc*/  .byte 0x62
/*0x80dd*/  .byte 0x00
/*0x80de*/  .byte 0x6f
/*0x80df*/  .byte 0x00
/*0x80e0*/  .byte 0x61
/*0x80e1*/  .byte 0x00
/*0x80e2*/  .byte 0x72
/*0x80e3*/  .byte 0x00
/*0x80e4*/  .byte 0x64
/*0x80e5*/  .byte 0x00
/*0x80e6*/  .byte 0x00
/*0x80e7*/  .byte 0x00
            data_80e8:
/*0x80e8*/  .byte 0x19
/*0x80e9*/  .byte 0x66
/*0x80ea*/  .byte 0x00
/*0x80eb*/  .byte 0x00
/*0x80ec*/  .byte 0x00
/*0x80ed*/  .byte 0x00
/*0x80ee*/  .byte 0x00
/*0x80ef*/  .byte 0x00
/*0x80f0*/  .byte 0xa9
/*0x80f1*/  .byte 0x74
/*0x80f2*/  .byte 0x00
/*0x80f3*/  .byte 0x00
/*0x80f4*/  .byte 0x00
/*0x80f5*/  .byte 0x00
/*0x80f6*/  .byte 0x00
/*0x80f7*/  .byte 0x00
/*0x80f8*/  .byte 0x00
/*0x80f9*/  .byte 0x00
/*0x80fa*/  .byte 0x00
/*0x80fb*/  .byte 0x00
/*0x80fc*/  .byte 0xa9
/*0x80fd*/  .byte 0x73
/*0x80fe*/  .byte 0x00
/*0x80ff*/  .byte 0x00
/*0x8100*/  .byte 0x9d
/*0x8101*/  .byte 0x72
/*0x8102*/  .byte 0x00
/*0x8103*/  .byte 0x00
            data_8104:
/*0x8104*/  .byte 0xff
/*0x8105*/  .byte 0xff
/*0x8106*/  .byte 0xff
/*0x8107*/  .byte 0x08
/*0x8108*/  .byte 0x03
/*0x8109*/  .byte 0x00
/*0x810a*/  .byte 0x00
/*0x810b*/  .byte 0x00

            sram_defs:
/*0x810c*/  .word data_812c
/*0x8110*/  .word 0x20000000
/*0x8114*/  .word 0x00000068
/*0x8118*/  .word sram_task1
/*0x811c*/  .word data_8194
/*0x8120*/  .word 0x20000068
/*0x8124*/  .word 0x00002178
/*0x8128*/  .word sram_task2

            data_812c:
/*0x812c*/  .byte 0x00
/*0x812d*/  .byte 0x00
/*0x812e*/  .byte 0x00
/*0x812f*/  .byte 0x00
/*0x8130*/  .byte 0x00
/*0x8131*/  .byte 0x00
/*0x8132*/  .byte 0x00
/*0x8133*/  .byte 0x00
/*0x8134*/  .byte 0x00
/*0x8135*/  .byte 0x00
/*0x8136*/  .byte 0x00
/*0x8137*/  .byte 0x00
/*0x8138*/  .byte 0x00
/*0x8139*/  .byte 0x00
/*0x813a*/  .byte 0x00
/*0x813b*/  .byte 0x00
/*0x813c*/  .byte 0x00
/*0x813d*/  .byte 0xa2
/*0x813e*/  .byte 0x4a
/*0x813f*/  .byte 0x04
/*0x8140*/  .byte 0x01
/*0x8141*/  .byte 0x00
/*0x8142*/  .byte 0x00
/*0x8143*/  .byte 0x00
/*0x8144*/  .byte 0x00
/*0x8145*/  .byte 0x00
/*0x8146*/  .byte 0x00
/*0x8147*/  .byte 0x00
/*0x8148*/  .byte 0x00
/*0x8149*/  .byte 0x00
/*0x814a*/  .byte 0x00
/*0x814b*/  .byte 0x00
/*0x814c*/  .byte 0xff
/*0x814d*/  .byte 0x00
/*0x814e*/  .byte 0x00
/*0x814f*/  .byte 0x00
/*0x8150*/  .byte 0x4c
/*0x8151*/  .byte 0x7d
/*0x8152*/  .byte 0x00
/*0x8153*/  .byte 0x00
/*0x8154*/  .byte 0x00
/*0x8155*/  .byte 0xff
/*0x8156*/  .byte 0x00
/*0x8157*/  .byte 0x00
/*0x8158*/  .byte 0x00
/*0x8159*/  .byte 0x00
/*0x815a*/  .byte 0x00
/*0x815b*/  .byte 0x00
/*0x815c*/  .byte 0x00
/*0x815d*/  .byte 0x00
/*0x815e*/  .byte 0x00
/*0x815f*/  .byte 0x00
/*0x8160*/  .byte 0x00
/*0x8161*/  .byte 0x00
/*0x8162*/  .byte 0x00
/*0x8163*/  .byte 0x00
/*0x8164*/  .byte 0x01
/*0x8165*/  .byte 0x00
/*0x8166*/  .byte 0x00
/*0x8167*/  .byte 0x00
/*0x8168*/  .byte 0x00
/*0x8169*/  .byte 0x00
/*0x816a*/  .byte 0x00
/*0x816b*/  .byte 0x00
/*0x816c*/  .byte 0x00
/*0x816d*/  .byte 0x00
/*0x816e*/  .byte 0x00
/*0x816f*/  .byte 0x00
/*0x8170*/  .byte 0x00
/*0x8171*/  .byte 0x00
/*0x8172*/  .byte 0x00
/*0x8173*/  .byte 0x00
/*0x8174*/  .byte 0x00
/*0x8175*/  .byte 0x00
/*0x8176*/  .byte 0x00
/*0x8177*/  .byte 0x00
/*0x8178*/  .byte 0x00
/*0x8179*/  .byte 0x00
/*0x817a*/  .byte 0x00
/*0x817b*/  .byte 0x00
/*0x817c*/  .byte 0x00
/*0x817d*/  .byte 0x00
/*0x817e*/  .byte 0x00
/*0x817f*/  .byte 0x00
/*0x8180*/  .byte 0x00
/*0x8181*/  .byte 0x00
/*0x8182*/  .byte 0x00
/*0x8183*/  .byte 0x00
/*0x8184*/  .byte 0xca
/*0x8185*/  .byte 0x09
/*0x8186*/  .byte 0x00
/*0x8187*/  .byte 0x20
/*0x8188*/  .byte 0x00
/*0x8189*/  .byte 0x00
/*0x818a*/  .byte 0x00
/*0x818b*/  .byte 0x00
/*0x818c*/  .byte 0x00
/*0x818d*/  .byte 0x00
/*0x818e*/  .byte 0x91
/*0x818f*/  .byte 0x00
/*0x8190*/  .byte 0x00
/*0x8191*/  .byte 0x00
/*0x8192*/  .byte 0x91
/*0x8193*/  .byte 0x00

            data_8194:
