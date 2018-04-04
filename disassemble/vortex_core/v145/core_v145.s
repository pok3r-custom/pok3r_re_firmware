.syntax unified
.cpu cortex-m3
.text
.thumb

/*0x3400*/  .byte 0x80
/*0x3401*/  .byte 0x21
/*0x3402*/  .byte 0x00
/*0x3403*/  .byte 0x20

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
/*0x3556*/      blx r0 /* watchdog_init */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /* clock_init */
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
/*0x3574*/  .word watchdog_init
            data_3578:
/*0x3578*/  .word clock_init
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
/*0x3590*/  .word 0x20002180


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
/*0x35b0*/  .word 0x20000070
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
            mem_set:
/*0x35dc*/      uxtb r2, r2
/*0x35de*/      b jump_35e4
            jump_35e0:
/*0x35e0*/      strb r2, [r0], #1
            jump_35e4:
/*0x35e4*/      subs r1, r1, #1
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
/*0x3638*/      strh r0, [r3, #0x1e]
/*0x363a*/      movs r0, r0
            data_363c:
/*0x363c*/      strh r0, [r7, #0x1e]
/*0x363e*/      movs r0, r0

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
/*0x3670*/      bl bftm_clear
/*0x3674*/      bl call_6220
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
/*0x36e0*/  .word 0x20000694
            data_36e4:
/*0x36e4*/  .word 0x20000016
            data_36e8:
/*0x36e8*/  .word 0x20000010
            data_36ec:
/*0x36ec*/  .word 0x2000006c
            data_36f0:
/*0x36f0*/  .word 0x2000002c
            data_36f4:
/*0x36f4*/  .word 0x20000006
            data_36f8:
/*0x36f8*/  .word 0x20000024


            .thumb_func
            bftm1_intr:
/*0x36fc*/      push {r4, r5, r6, lr}
/*0x36fe*/      ldr r0, [pc, #0x6c] /* data_376c */
/*0x3700*/      bl bftm_clear
/*0x3704*/      ldr r5, [pc, #0x68] /* data_3770 */
/*0x3706*/      movs r1, #2
/*0x3708*/      mov r0, r5
/*0x370a*/      bl call_45d0
/*0x370e*/      movs r0, #0xa
/*0x3710*/      bl spin_wait
/*0x3714*/      movs r0, #2
/*0x3716*/      bl call_74c4
/*0x371a*/      ldr r1, [pc, #0x58] /* data_3774 */
/*0x371c*/      mov.w r0, #0x8000
/*0x3720*/      str r0, [r1, #0x24]
/*0x3722*/      ldr r4, [pc, #0x54] /* data_3778 */
/*0x3724*/      ldr r6, [pc, #0x54] /* data_377c */
/*0x3726*/      ldrb r1, [r4, #2]
/*0x3728*/      strb r1, [r4, #1]
/*0x372a*/      and r2, r1, #1
/*0x372e*/      movs r1, #0x10
/*0x3730*/      mov r0, r6
/*0x3732*/      bl call_45d4
/*0x3736*/      ldrb r0, [r4, #1]
/*0x3738*/      movs r1, #0x20
/*0x373a*/      ubfx r2, r0, #1, #1
/*0x373e*/      mov r0, r6
/*0x3740*/      bl call_45d4
/*0x3744*/      ldrb r0, [r4, #1]
/*0x3746*/      movs r1, #0x40
/*0x3748*/      ubfx r2, r0, #2, #1
/*0x374c*/      mov r0, r6
/*0x374e*/      bl call_45d4
/*0x3752*/      movs r1, #2
/*0x3754*/      mov r0, r5
/*0x3756*/      bl call_4564
/*0x375a*/      ldrb r0, [r4, #2]
/*0x375c*/      adds r0, r0, #1
/*0x375e*/      and r0, r0, #7
/*0x3762*/      strb r0, [r4, #2]
/*0x3764*/      pop.w {r4, r5, r6, lr}
/*0x3768*/      b.w call_66f0

            data_376c:
/*0x376c*/  .word 0x40077000
            data_3770:
/*0x3770*/  .word 0x400b2000
            data_3774:
/*0x3774*/  .word 0x400b0000
            data_3778:
/*0x3778*/  .word 0x20000026
            data_377c:
/*0x377c*/  .word 0x400b4000


            .thumb_func
            bftm_clear:
/*0x3780*/      ldr r1, [r0, #4]
/*0x3782*/      bic r1, r1, #1
/*0x3786*/      str r1, [r0, #4]
/*0x3788*/      dsb sy
/*0x378c*/      bx lr

            .thumb_func
            call_378e:
/*0x378e*/      cmp r1, #0
/*0x3790*/      ldr r1, [r0]
/*0x3792*/      beq jump_379a
/*0x3794*/      orr r1, r1, #4
/*0x3798*/      b jump_379e
            jump_379a:
/*0x379a*/      bic r1, r1, #4
            jump_379e:
/*0x379e*/      str r1, [r0]
/*0x37a0*/      bx lr

            .thumb_func
            call_37a2:
/*0x37a2*/      cmp r1, #0
/*0x37a4*/      ldr r1, [r0]
/*0x37a6*/      beq jump_37ae
/*0x37a8*/      orr r1, r1, #1
/*0x37ac*/      b jump_37b2
            jump_37ae:
/*0x37ae*/      bic r1, r1, #1
            jump_37b2:
/*0x37b2*/      str r1, [r0]
/*0x37b4*/      bx lr

            .thumb_func
            call_37b6:
/*0x37b6*/      str r1, [r0, #0xc]
/*0x37b8*/      bx lr

            .thumb_func
            call_37ba:
/*0x37ba*/      str r1, [r0, #8]
/*0x37bc*/      bx lr

/*0x37be*/  .byte 0x00
/*0x37bf*/  .byte 0x00


            .thumb_func
            afio_pin_config:
/*0x37c0*/      lsls r0, r0, #3
/*0x37c2*/      lsrs r3, r1, #3
/*0x37c4*/      add.w r0, r0, r3, lsl #2
/*0x37c8*/      ldr r3, [pc, #0x18] /* data_37e4 */
/*0x37ca*/      push {r4, lr}
/*0x37cc*/      add r0, r3
/*0x37ce*/      lsls r1, r1, #0x1d
/*0x37d0*/      ldr r3, [r0]
/*0x37d2*/      lsrs r1, r1, #0x1b
/*0x37d4*/      movs r4, #0xf
/*0x37d6*/      lsls r4, r1
/*0x37d8*/      bics r3, r4
/*0x37da*/      lsls r2, r1
/*0x37dc*/      orrs r3, r2
/*0x37de*/      str r3, [r0]
/*0x37e0*/      pop {r4, pc}

/*0x37e2*/  .byte 0x00
/*0x37e3*/  .byte 0x00

            data_37e4:
/*0x37e4*/  .word 0x40022020


            .thumb_func
            spin_wait:
/*0x37e8*/      add.w r0, r0, r0, lsl #2
/*0x37ec*/      lsls r0, r0, #2
            jump_37ee:
/*0x37ee*/      subs r0, r0, #1
/*0x37f0*/      bhs jump_37ee
/*0x37f2*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x37f4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x37f8*/      mov.w r5, #0x4000
/*0x37fc*/      movs r4, #0
/*0x37fe*/      lsls r0, r5, #2
/*0x3800*/      mov r2, r4
/*0x3802*/      mov r8, r0
/*0x3804*/      movs r3, #1
/*0x3806*/      mov r1, r5
/*0x3808*/      bl ckcu_clocks_enable
/*0x380c*/      ldr r6, [pc, #0x94] /* data_38a4 */
/*0x380e*/      movs r2, #0
/*0x3810*/      mov r1, r5
/*0x3812*/      mov r0, r6
/*0x3814*/      bl call_4588
/*0x3818*/      lsls r7, r5, #1
/*0x381a*/      movs r2, #0
/*0x381c*/      mov r1, r7
/*0x381e*/      mov r0, r6
/*0x3820*/      bl call_4588
/*0x3824*/      movs r2, #2
/*0x3826*/      mov r1, r5
/*0x3828*/      mov r0, r6
/*0x382a*/      bl call_45a8
/*0x382e*/      movs r2, #2
/*0x3830*/      mov r1, r7
/*0x3832*/      mov r0, r6
/*0x3834*/      bl call_45a8
/*0x3838*/      asrs r5, r5, #3
/*0x383a*/      movs r2, #0
/*0x383c*/      mov r1, r5
/*0x383e*/      mov r0, r6
/*0x3840*/      bl call_4588
/*0x3844*/      movs r2, #2
/*0x3846*/      mov r1, r5
/*0x3848*/      mov r0, r6
/*0x384a*/      bl call_45a8
/*0x384e*/      movs r2, #1
/*0x3850*/      movs r1, #0xb
/*0x3852*/      movs r0, #0
/*0x3854*/      bl afio_pin_config
/*0x3858*/      movs r2, #1
/*0x385a*/      movs r1, #0xd
/*0x385c*/      movs r0, #2
/*0x385e*/      bl afio_pin_config
/*0x3862*/      movs r2, #1
/*0x3864*/      movs r1, #0xe
/*0x3866*/      movs r0, #2
/*0x3868*/      bl afio_pin_config
/*0x386c*/      movs r2, #1
/*0x386e*/      movs r1, #0xf
/*0x3870*/      movs r0, #2
/*0x3872*/      bl afio_pin_config
/*0x3876*/      ldr r0, [pc, #0x30] /* data_38a8 */
/*0x3878*/      ldr r0, [r0, #4]
/*0x387a*/      lsls r0, r0, #0x15
/*0x387c*/      bmi jump_3892
/*0x387e*/      movs r2, #1
/*0x3880*/      movs r1, #0xe
/*0x3882*/      mov r0, r2
/*0x3884*/      bl afio_pin_config
/*0x3888*/      movs r2, #1
/*0x388a*/      movs r1, #0xf
/*0x388c*/      mov r0, r2
/*0x388e*/      bl afio_pin_config
            jump_3892:
/*0x3892*/      mov r1, r4
/*0x3894*/      movs r3, #0
/*0x3896*/      mov r2, r4
/*0x3898*/      mov r0, r8
/*0x389a*/      bl ckcu_clocks_enable
/*0x389e*/      movs r0, #1
/*0x38a0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_38a4:
/*0x38a4*/  .word 0x400b0000
            data_38a8:
/*0x38a8*/  .word 0x40088000


            .thumb_func
            ckcu_clocks_enable:
/*0x38ac*/      push {r4, r5, r6, r7, lr}
/*0x38ae*/      ldr r7, [pc, #0x1c] /* data_38cc */
/*0x38b0*/      ldr r4, [r7, #0x24]
/*0x38b2*/      ldr r5, [r7, #0x2c]
/*0x38b4*/      ldr r6, [r7, #0x30]
/*0x38b6*/      bics r4, r0
/*0x38b8*/      bics r5, r1
/*0x38ba*/      bics r6, r2
/*0x38bc*/      cbz r3, jump_38c4
/*0x38be*/      orrs r4, r0
/*0x38c0*/      orrs r5, r1
/*0x38c2*/      orrs r6, r2
            jump_38c4:
/*0x38c4*/      str r4, [r7, #0x24]
/*0x38c6*/      str r5, [r7, #0x2c]
/*0x38c8*/      str r6, [r7, #0x30]
/*0x38ca*/      pop {r4, r5, r6, r7, pc}

            data_38cc:
/*0x38cc*/  .word 0x40088000


            .thumb_func
            ckcu_set_usb_prescaler:
/*0x38d0*/      ldr r1, [pc, #0xc] /* data_38e0 */
/*0x38d2*/      ldr r2, [r1]
/*0x38d4*/      bic r2, r2, #0xc00000
/*0x38d8*/      orr.w r0, r2, r0, lsl #22
/*0x38dc*/      str r0, [r1]
/*0x38de*/      bx lr

            data_38e0:
/*0x38e0*/  .word 0x40088000


            .thumb_func
            call_38e4:
/*0x38e4*/      push {r4, r5, r6, lr}
/*0x38e6*/      ldr r1, [pc, #0xbc] /* data_39a4 */
/*0x38e8*/      ldrb r0, [r1, #6]
/*0x38ea*/      cmp r0, #0
/*0x38ec*/      beq jump_3956
/*0x38ee*/      ldr r5, [pc, #0xb8] /* data_39a8 */
/*0x38f0*/      movs r2, #1
/*0x38f2*/      str r2, [r5, #4]
/*0x38f4*/      ldr r0, [pc, #0xb4] /* data_39ac */
/*0x38f6*/      ldrb r0, [r0, #3]
/*0x38f8*/      lsls r0, r0, #0x1e
/*0x38fa*/      bpl jump_3956
/*0x38fc*/      ldr r0, [pc, #0xac] /* data_39ac */
/*0x38fe*/      ldrb r3, [r1, #8]
/*0x3900*/      ldrb r0, [r0]
/*0x3902*/      cbz r3, jump_392c
/*0x3904*/      cmp r0, #0x14
/*0x3906*/      beq jump_3964
/*0x3908*/      bgt jump_391c
/*0x390a*/      cmp r0, #8
/*0x390c*/      beq jump_3964
/*0x390e*/      cmp r0, #0xc
/*0x3910*/      beq jump_395c
/*0x3912*/      cmp r0, #0x12
/*0x3914*/      beq jump_395c
/*0x3916*/      cmp r0, #0x13
/*0x3918*/      bne jump_3956
/*0x391a*/      b jump_395c
            jump_391c:
/*0x391c*/      cmp r0, #0x18
/*0x391e*/      beq jump_395c
/*0x3920*/      cmp r0, #0x1a
/*0x3922*/      beq jump_3964
/*0x3924*/      cmp r0, #0x29
/*0x3926*/      beq jump_3958
/*0x3928*/      cmp r0, #0xcf
/*0x392a*/      bne jump_3956
            jump_392c:
/*0x392c*/      ldr r1, [pc, #0x80] /* data_39b0 */
/*0x392e*/      ldr r2, [pc, #0x84] /* data_39b4 */
/*0x3930*/      ldrb r3, [r1, #3]
/*0x3932*/      ldrb r0, [r2, r0]
/*0x3934*/      cmp r3, #5
/*0x3936*/      beq jump_398a
/*0x3938*/      add.w r0, r0, r0, lsl #1
/*0x393c*/      adds r4, r0, r1
/*0x393e*/      add.w r4, r4, #0x17e
            jump_3942:
/*0x3942*/      movs r2, #3
/*0x3944*/      mov r1, r4
/*0x3946*/      ldr r0, [pc, #0x60] /* data_39a8 */
/*0x3948*/      bl memcmp
/*0x394c*/      cbz r0, jump_399e
/*0x394e*/      ldrh r0, [r5]
/*0x3950*/      strh r0, [r4]
/*0x3952*/      ldrb r0, [r5, #2]
            jump_3954:
/*0x3954*/      strb r0, [r4, #2]
            jump_3956:
/*0x3956*/      pop {r4, r5, r6, pc}
            jump_3958:
/*0x3958*/      strb r2, [r1, #2]
/*0x395a*/      pop {r4, r5, r6, pc}
            jump_395c:
/*0x395c*/      pop.w {r4, r5, r6, lr}
/*0x3960*/      b.w jump_6ee4
            jump_3964:
/*0x3964*/      cmp r0, #0x14
/*0x3966*/      beq jump_3970
/*0x3968*/      cmp r0, #0x1a
/*0x396a*/      beq jump_3982
/*0x396c*/      cmp r0, #8
/*0x396e*/      beq jump_3986
            jump_3970:
/*0x3970*/      movs r1, #0
            jump_3972:
/*0x3972*/      ldr r0, [pc, #0x34] /* data_39a8 */
/*0x3974*/      movs r2, #1
/*0x3976*/      adds r4, r0, r1
/*0x3978*/      ldrb r0, [r4]
/*0x397a*/      bl call_5394
/*0x397e*/      strb r0, [r4]
/*0x3980*/      pop {r4, r5, r6, pc}
            jump_3982:
/*0x3982*/      movs r1, #1
/*0x3984*/      b jump_3972
            jump_3986:
/*0x3986*/      movs r1, #2
/*0x3988*/      b jump_3972
            jump_398a:
/*0x398a*/      ldr r2, [pc, #0x2c] /* data_39b8 */
/*0x398c*/      ldrb r0, [r2, r0]
/*0x398e*/      and r0, r0, #7
/*0x3992*/      add.w r0, r0, r0, lsl #1
/*0x3996*/      adds r4, r0, r1
/*0x3998*/      addw r4, r4, #0x256
/*0x399c*/      b jump_3942
            jump_399e:
/*0x399e*/      movs r0, #0
/*0x39a0*/      strh r0, [r4]
/*0x39a2*/      b jump_3954

            data_39a4:
/*0x39a4*/  .word 0x20000644
            data_39a8:
/*0x39a8*/  .word 0x2000000c
            data_39ac:
/*0x39ac*/  .word 0x20000034
            data_39b0:
/*0x39b0*/  .word 0x20000708
            data_39b4:
/*0x39b4*/  .word 0x200001de
            data_39b8:
/*0x39b8*/  .word 0x00007e49


            .thumb_func
            call_39bc:
/*0x39bc*/      movs r1, #3
/*0x39be*/      ldr r2, [pc, #0x10] /* data_39d0 */
/*0x39c0*/      b jump_39c6
            jump_39c2:
/*0x39c2*/      ldrb r3, [r0, r1]
/*0x39c4*/      strb r3, [r2, r1]
            jump_39c6:
/*0x39c6*/      subs r1, r1, #1
/*0x39c8*/      uxtb r1, r1
/*0x39ca*/      bhs jump_39c2
/*0x39cc*/      bx lr

/*0x39ce*/  .byte 0x00
/*0x39cf*/  .byte 0x00

            data_39d0:
/*0x39d0*/  .word 0x2000000c


            .thumb_func
            call_39d4:
/*0x39d4*/      ldr r0, [pc, #0x18] /* data_39f0 */
/*0x39d6*/      ldrb r0, [r0, #6]
/*0x39d8*/      cmp r0, #0
/*0x39da*/      beq jump_39ec
/*0x39dc*/      ldr r0, [pc, #0x14] /* data_39f4 */
/*0x39de*/      ldr r0, [r0, #4]
/*0x39e0*/      movw r1, #0x9c40
/*0x39e4*/      cmp r0, r1
/*0x39e6*/      blo jump_39ec
/*0x39e8*/      b.w jump_6ee4
            jump_39ec:
/*0x39ec*/      bx lr

/*0x39ee*/  .byte 0x00
/*0x39ef*/  .byte 0x00

            data_39f0:
/*0x39f0*/  .word 0x20000644
            data_39f4:
/*0x39f4*/  .word 0x2000000c

            jump_39f8:
/*0x39f8*/      push {r4, r5, r6, lr}
/*0x39fa*/      cbz r0, jump_3a24
/*0x39fc*/      ldr r5, [pc, #0x3c] /* data_3a3c */
/*0x39fe*/      movs r4, #0x48
/*0x3a00*/      ldr r6, [pc, #0x3c] /* data_3a40 */
/*0x3a02*/      b jump_3a1c
            jump_3a04:
/*0x3a04*/      ldrb r0, [r5], #-1
/*0x3a08*/      and r0, r0, #7
/*0x3a0c*/      add.w r0, r0, r0, lsl #1
/*0x3a10*/      adds r1, r0, r6
/*0x3a12*/      mov r0, r4
/*0x3a14*/      addw r1, r1, #0x256
/*0x3a18*/      bl call_40d0
            jump_3a1c:
/*0x3a1c*/      subs r4, r4, #1
/*0x3a1e*/      uxtb r4, r4
/*0x3a20*/      bhs jump_3a04
/*0x3a22*/      pop {r4, r5, r6, pc}
            jump_3a24:
/*0x3a24*/      ldr r5, [pc, #0x1c] /* data_3a44 */
/*0x3a26*/      movs r4, #0x48
/*0x3a28*/      b jump_3a34
            jump_3a2a:
/*0x3a2a*/      mov r1, r5
/*0x3a2c*/      mov r0, r4
/*0x3a2e*/      bl call_40d0
/*0x3a32*/      subs r5, r5, #3
            jump_3a34:
/*0x3a34*/      subs r4, r4, #1
/*0x3a36*/      uxtb r4, r4
/*0x3a38*/      bhs jump_3a2a
/*0x3a3a*/      pop {r4, r5, r6, pc}

            data_3a3c:
/*0x3a3c*/  .word 0x00007e90
            data_3a40:
/*0x3a40*/  .word 0x20000708
            data_3a44:
/*0x3a44*/  .word 0x2000095b


            .thumb_func
            call_3a48:
/*0x3a48*/      cmp r0, #1
/*0x3a4a*/      beq jump_3a56
/*0x3a4c*/      movs r0, #5
            jump_3a4e:
/*0x3a4e*/      ldr r1, [pc, #0xc] /* data_3a5c */
/*0x3a50*/      strb r0, [r1, #3]
/*0x3a52*/      b.w call_3f98
            jump_3a56:
/*0x3a56*/      movs r0, #4
/*0x3a58*/      b jump_3a4e

/*0x3a5a*/  .byte 0x00
/*0x3a5b*/  .byte 0x00

            data_3a5c:
/*0x3a5c*/  .word 0x20000708


            .thumb_func
            call_3a60:
/*0x3a60*/      push {r4, lr}
/*0x3a62*/      bl call_3a48
/*0x3a66*/      ldr r0, [pc, #0x14] /* data_3a7c */
/*0x3a68*/      movs r1, #1
/*0x3a6a*/      strb r1, [r0, #6]
/*0x3a6c*/      ldr r0, [pc, #0x10] /* data_3a80 */
/*0x3a6e*/      str r1, [r0, #4]
/*0x3a70*/      ldr r1, [pc, #0x10] /* data_3a84 */
/*0x3a72*/      ldrh r2, [r1]
/*0x3a74*/      strh r2, [r0]
/*0x3a76*/      ldrb r1, [r1, #2]
/*0x3a78*/      strb r1, [r0, #2]
/*0x3a7a*/      pop {r4, pc}

            data_3a7c:
/*0x3a7c*/  .word 0x20000644
            data_3a80:
/*0x3a80*/  .word 0x2000000c
            data_3a84:
/*0x3a84*/  .word 0x00007dbd


            .thumb_func
            call_3a88:
/*0x3a88*/      push {r4, r5, r6, lr}
/*0x3a8a*/      ldr r0, [pc, #0x5c] /* data_3ae8 */
/*0x3a8c*/      ldrb r0, [r0, #0xb]
/*0x3a8e*/      cbz r0, jump_3ac6
/*0x3a90*/      ldr r0, [pc, #0x58] /* data_3aec */
/*0x3a92*/      bl call_40f0
/*0x3a96*/      movs r0, #0x2e
/*0x3a98*/      movs r1, #0
/*0x3a9a*/      ldr r2, [pc, #0x54] /* data_3af0 */
/*0x3a9c*/      ldr r3, [pc, #0x54] /* data_3af4 */
/*0x3a9e*/      ldr r5, [pc, #0x58] /* data_3af8 */
/*0x3aa0*/      b jump_3aa8
            jump_3aa2:
/*0x3aa2*/      ldrb r4, [r2, r0]
/*0x3aa4*/      ldrb r4, [r3, r4]
/*0x3aa6*/      strb r1, [r4, r5]
            jump_3aa8:
/*0x3aa8*/      subs r0, r0, #1
/*0x3aaa*/      uxtb r0, r0
/*0x3aac*/      bhs jump_3aa2
/*0x3aae*/      ldr r4, [pc, #0x4c] /* data_3afc */
/*0x3ab0*/      ldr r1, [pc, #0x38] /* data_3aec */
/*0x3ab2*/      ldrb r0, [r4, #0xe8]!
/*0x3ab6*/      adds r1, r1, #3
/*0x3ab8*/      bl call_40d0
/*0x3abc*/      ldr r1, [pc, #0x2c] /* data_3aec */
/*0x3abe*/      ldrb r0, [r4, #1]
/*0x3ac0*/      adds r1, r1, #6
/*0x3ac2*/      bl call_40d0
            jump_3ac6:
/*0x3ac6*/      ldr r0, [pc, #0x38] /* data_3b00 */
/*0x3ac8*/      ldrh r0, [r0, #2]
/*0x3aca*/      lsls r0, r0, #0x15
/*0x3acc*/      bpl jump_3adc
/*0x3ace*/      ldr r1, [pc, #0x1c] /* data_3aec */
/*0x3ad0*/      pop.w {r4, r5, r6, lr}
/*0x3ad4*/      adds r1, r1, #6
/*0x3ad6*/      movs r0, #0x32
/*0x3ad8*/      b.w call_40d0
            jump_3adc:
/*0x3adc*/      pop.w {r4, r5, r6, lr}
/*0x3ae0*/      movs r1, #0
/*0x3ae2*/      movs r0, #0x32
/*0x3ae4*/      b.w call_4114

            data_3ae8:
/*0x3ae8*/  .word 0x20000644
            data_3aec:
/*0x3aec*/  .word 0x00007dc0
            data_3af0:
/*0x3af0*/  .word 0x00007d00
            data_3af4:
/*0x3af4*/  .word 0x200001de
            data_3af8:
/*0x3af8*/  .word 0x200003bc
            data_3afc:
/*0x3afc*/  .word 0x20000708
            data_3b00:
/*0x3b00*/  .word 0x20000014


            .thumb_func
            call_3b04:
/*0x3b04*/      push {r4, r5, r6, lr}
/*0x3b06*/      bl call_6f50
/*0x3b0a*/      ldr r5, [pc, #0xac] /* data_3bb8 */
/*0x3b0c*/      ldr r4, [pc, #0xac] /* data_3bbc */
/*0x3b0e*/      ldrb r0, [r5, #8]
/*0x3b10*/      cbz r0, jump_3b4e
/*0x3b12*/      ldrb r0, [r5, #6]
/*0x3b14*/      cbnz r0, jump_3b1c
/*0x3b16*/      bl call_5540
/*0x3b1a*/      cbz r0, jump_3b4e
            jump_3b1c:
/*0x3b1c*/      ldrb r0, [r5, #6]
/*0x3b1e*/      cbz r0, jump_3b24
/*0x3b20*/      ldr r0, [pc, #0x9c] /* data_3bc0 */
/*0x3b22*/      b jump_3b28
            jump_3b24:
/*0x3b24*/      ldr r0, [pc, #0x9c] /* data_3bc4 */
/*0x3b26*/      ldr r0, [r0]
            jump_3b28:
/*0x3b28*/      ldrb r1, [r0]
/*0x3b2a*/      strb r1, [r4, #3]
/*0x3b2c*/      movs r1, #0
/*0x3b2e*/      strb.w r1, [r4, #0x4b]
/*0x3b32*/      strb.w r1, [r4, #0x93]
/*0x3b36*/      strb r1, [r4, #0xa]
/*0x3b38*/      ldrb r2, [r0, #1]
/*0x3b3a*/      strb.w r2, [r4, #0x52]
/*0x3b3e*/      strb.w r1, [r4, #0x9a]
/*0x3b42*/      strb r1, [r4, #0xb]
/*0x3b44*/      strb.w r1, [r4, #0x53]
/*0x3b48*/      ldrb r0, [r0, #2]
/*0x3b4a*/      strb.w r0, [r4, #0x9b]
            jump_3b4e:
/*0x3b4e*/      ldrb r0, [r5, #6]
/*0x3b50*/      cbz r0, jump_3b5a
/*0x3b52*/      ldr r1, [pc, #0x6c] /* data_3bc0 */
/*0x3b54*/      movs r0, #8
/*0x3b56*/      bl call_40d0
            jump_3b5a:
/*0x3b5a*/      ldrb r0, [r5, #0xa]
/*0x3b5c*/      ldr r5, [pc, #0x68] /* data_3bc8 */
/*0x3b5e*/      cbz r0, jump_3b72
/*0x3b60*/      ldr r0, [pc, #0x68] /* data_3bcc */
/*0x3b62*/      ldrh r0, [r0]
/*0x3b64*/      lsls r0, r0, #0x15
/*0x3b66*/      asrs r0, r0, #8
/*0x3b68*/      lsrs r1, r0, #0x18
/*0x3b6a*/      movs r0, #0x31
/*0x3b6c*/      bl call_4114
/*0x3b70*/      b jump_3b8c
            jump_3b72:
/*0x3b72*/      movs r1, #0
/*0x3b74*/      movs r0, #0x31
/*0x3b76*/      bl call_4114
/*0x3b7a*/      ldrb r0, [r5, #2]
/*0x3b7c*/      cbz r0, jump_3b8c
/*0x3b7e*/      add.w r0, r0, r0, lsl #3
/*0x3b82*/      add.w r0, r4, r0, lsl #3
/*0x3b86*/      movs r1, #0xff
/*0x3b88*/      strb r1, [r0, #-0x17]
            jump_3b8c:
/*0x3b8c*/      ldr r0, [pc, #0x40] /* data_3bd0 */
/*0x3b8e*/      ldrb r0, [r0]
/*0x3b90*/      lsls r0, r0, #0x1f
/*0x3b92*/      beq jump_3bac
/*0x3b94*/      ldrb r0, [r5, #2]
/*0x3b96*/      cbz r0, jump_3bac
/*0x3b98*/      ldr r0, [pc, #0x38] /* data_3bd4 */
/*0x3b9a*/      ldrh r0, [r0, #2]
/*0x3b9c*/      lsls r0, r0, #0x15
/*0x3b9e*/      bpl jump_3bac
/*0x3ba0*/      pop.w {r4, r5, r6, lr}
/*0x3ba4*/      ldr r1, [pc, #0x30] /* data_3bd8 */
/*0x3ba6*/      movs r0, #0x32
/*0x3ba8*/      b.w call_40d0
            jump_3bac:
/*0x3bac*/      pop.w {r4, r5, r6, lr}
/*0x3bb0*/      movs r1, #0
/*0x3bb2*/      movs r0, #0x32
/*0x3bb4*/      b.w call_4114

            data_3bb8:
/*0x3bb8*/  .word 0x20000644
            data_3bbc:
/*0x3bbc*/  .word 0x2000032c
            data_3bc0:
/*0x3bc0*/  .word 0x2000000c
            data_3bc4:
/*0x3bc4*/  .word 0x200000ac
            data_3bc8:
/*0x3bc8*/  .word 0x20000068
            data_3bcc:
/*0x3bcc*/  .word 0x20000024
            data_3bd0:
/*0x3bd0*/  .word 0x20000003
            data_3bd4:
/*0x3bd4*/  .word 0x20000014
            data_3bd8:
/*0x3bd8*/  .word 0x00007dc6


            .thumb_func
            call_3bdc:
/*0x3bdc*/      push {r4, lr}
/*0x3bde*/      bl call_5dd8
/*0x3be2*/      movs r1, #0
/*0x3be4*/      movs r0, #0x31
/*0x3be6*/      bl call_4114
/*0x3bea*/      movs r1, #0
/*0x3bec*/      pop.w {r4, lr}
/*0x3bf0*/      movs r0, #0x32
/*0x3bf2*/      b.w call_4114

            .thumb_func
            call_3bf6:
/*0x3bf6*/      bx lr

            bootloader_crc_magic:
/*0x3bf8*/  .byte 0x40
/*0x3bf9*/  .byte 0x50
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
/*0x3c04*/      push {r3, r4, r5, r6, r7, lr}
/*0x3c06*/      ldr r6, [pc, #0x114] /* data_3d1c */
/*0x3c08*/      movs r4, #0
/*0x3c0a*/      ldr r5, [pc, #0x114] /* data_3d20 */
/*0x3c0c*/      ldrb r0, [r6, #0xc]
/*0x3c0e*/      cmp r0, #8
/*0x3c10*/      bhs switch_3ca8
/*0x3c12*/      tbb [pc, r0]

/*0x3c16*/  .byte 0x49
/*0x3c17*/  .byte 0x04
/*0x3c18*/  .byte 0x04
/*0x3c19*/  .byte 0x04
/*0x3c1a*/  .byte 0x0d
/*0x3c1b*/  .byte 0x0f
/*0x3c1c*/  .byte 0x4a
/*0x3c1d*/  .byte 0x16

            switch_3c1e:
/*0x3c1e*/      ldr r1, [pc, #0x104] /* data_3d24 */
/*0x3c20*/      add.w r0, r0, r0, lsl #3
/*0x3c24*/      add.w r0, r1, r0, lsl #3
/*0x3c28*/      movs r2, #0xff
/*0x3c2a*/      movs r1, #0x48
/*0x3c2c*/      subs r0, #0x48
/*0x3c2e*/      b jump_3c3a
            switch_3c30:
/*0x3c30*/      movs r2, #0x80
/*0x3c32*/      b jump_3c36
            switch_3c34:
/*0x3c34*/      movs r2, #0xff
            jump_3c36:
/*0x3c36*/      ldr r0, [pc, #0xec] /* data_3d24 */
/*0x3c38*/      movs r1, #0xd8
            jump_3c3a:
/*0x3c3a*/      pop.w {r3, r4, r5, r6, r7, lr}
/*0x3c3e*/      b.w mem_set
            switch_3c42:
/*0x3c42*/      adds r0, r5, #7
/*0x3c44*/      bl call_40a8
/*0x3c48*/      ldr r0, [pc, #0xdc] /* data_3d28 */
/*0x3c4a*/      ldrb r0, [r0]
/*0x3c4c*/      cmp r0, #0x2a
/*0x3c4e*/      beq jump_3c6c
/*0x3c50*/      ldr r0, [pc, #0xd8] /* data_3d2c */
/*0x3c52*/      ldrh r1, [r0]
/*0x3c54*/      cmp.w r1, #0x200
/*0x3c58*/      bls jump_3c6c
/*0x3c5a*/      ldrb r1, [r6, #0xa]
/*0x3c5c*/      cbz r1, jump_3c66
/*0x3c5e*/      ldrh r0, [r0]
/*0x3c60*/      lsls r0, r0, #0x15
/*0x3c62*/      asrs r0, r0, #8
/*0x3c64*/      lsrs r1, r0, #0x18
            jump_3c66:
/*0x3c66*/      movs r0, #0x31
/*0x3c68*/      bl call_4114
            jump_3c6c:
/*0x3c6c*/      movs r3, #0
/*0x3c6e*/      movs r2, #3
            jump_3c70:
/*0x3c70*/      add.w r0, r3, r3, lsl #1
/*0x3c74*/      adds r1, r0, r5
/*0x3c76*/      ldrb r0, [r1, #7]
/*0x3c78*/      cmp r0, r2
/*0x3c7a*/      bls jump_3c82
/*0x3c7c*/      subs r0, r0, r2
/*0x3c7e*/      strb r0, [r1, #7]
/*0x3c80*/      b jump_3c84
            jump_3c82:
/*0x3c82*/      strb r4, [r1, #7]
            jump_3c84:
/*0x3c84*/      ldrb r0, [r1, #8]
/*0x3c86*/      cmp r0, r2
/*0x3c88*/      bls jump_3c90
/*0x3c8a*/      subs r0, r0, r2
/*0x3c8c*/      strb r0, [r1, #8]
/*0x3c8e*/      b jump_3c92
            jump_3c90:
/*0x3c90*/      strb r4, [r1, #8]
            jump_3c92:
/*0x3c92*/      ldrb r0, [r1, #9]
/*0x3c94*/      cmp r0, r2
/*0x3c96*/      bls jump_3c9e
/*0x3c98*/      subs r0, r0, r2
/*0x3c9a*/      strb r0, [r1, #9]
/*0x3c9c*/      b jump_3ca0
            jump_3c9e:
/*0x3c9e*/      strb r4, [r1, #9]
            jump_3ca0:
/*0x3ca0*/      adds r3, r3, #1
/*0x3ca2*/      uxtb r3, r3
/*0x3ca4*/      cmp r3, #0x48
/*0x3ca6*/      blo jump_3c70
            switch_3ca8:
/*0x3ca8*/      pop {r3, r4, r5, r6, r7, pc}
            switch_3caa:
/*0x3caa*/      movs r1, #0xd8
/*0x3cac*/      ldr r0, [pc, #0x74] /* data_3d24 */
/*0x3cae*/      bl mem_zero
/*0x3cb2*/      str r4, [sp]
/*0x3cb4*/      ldrb r0, [r5, #4]
/*0x3cb6*/      cbz r0, jump_3cc8
/*0x3cb8*/      movs r0, #0
            jump_3cba:
/*0x3cba*/      bl call_3de8
/*0x3cbe*/      movs r1, #0xff
/*0x3cc0*/      cbz r0, jump_3cce
/*0x3cc2*/      strb.w r1, [sp, #1]
/*0x3cc6*/      b jump_3cd2
            jump_3cc8:
/*0x3cc8*/      movs r0, #1
/*0x3cca*/      strb r0, [r5, #4]
/*0x3ccc*/      b jump_3cba
            jump_3cce:
/*0x3cce*/      strb.w r1, [sp]
            jump_3cd2:
/*0x3cd2*/      mov r1, sp
/*0x3cd4*/      movs r0, #8
/*0x3cd6*/      bl call_40d0
/*0x3cda*/      ldr r5, [pc, #0x54] /* data_3d30 */
/*0x3cdc*/      ldr r4, [pc, #0x54] /* data_3d34 */
/*0x3cde*/      ldrb r0, [r5]
/*0x3ce0*/      lsls r0, r0, #0x1f
/*0x3ce2*/      beq jump_3cec
/*0x3ce4*/      ldrb r0, [r4, #0x1e]
/*0x3ce6*/      movs r1, #0xb4
/*0x3ce8*/      bl call_4114
            jump_3cec:
/*0x3cec*/      ldrb r0, [r5]
/*0x3cee*/      lsls r0, r0, #0x1e
/*0x3cf0*/      bpl jump_3cfa
/*0x3cf2*/      ldrb r0, [r4, #0x1f]
/*0x3cf4*/      movs r1, #0xb4
/*0x3cf6*/      bl call_4114
            jump_3cfa:
/*0x3cfa*/      ldrb r0, [r5]
/*0x3cfc*/      lsls r0, r0, #0x1d
/*0x3cfe*/      bpl jump_3d0a
/*0x3d00*/      ldrb.w r0, [r4, #0x20]
/*0x3d04*/      movs r1, #0xb4
/*0x3d06*/      bl call_4114
            jump_3d0a:
/*0x3d0a*/      ldrb r0, [r5]
/*0x3d0c*/      lsls r0, r0, #0x1c
/*0x3d0e*/      bpl switch_3ca8
/*0x3d10*/      ldrb.w r0, [r4, #0x21]
/*0x3d14*/      movs r1, #0xb4
/*0x3d16*/      bl call_4114
/*0x3d1a*/      pop {r3, r4, r5, r6, r7, pc}

            data_3d1c:
/*0x3d1c*/  .word 0x20000644
            data_3d20:
/*0x3d20*/  .word 0x200000ac
            data_3d24:
/*0x3d24*/  .word 0x2000032c
            data_3d28:
/*0x3d28*/  .word 0x20000034
            data_3d2c:
/*0x3d2c*/  .word 0x20000024
            data_3d30:
/*0x3d30*/  .word 0x20000008
            data_3d34:
/*0x3d34*/  .word 0x200001de


            .thumb_func
            call_3d38:
/*0x3d38*/      ldr r0, [pc, #0x4c] /* data_3d88 */
/*0x3d3a*/      push {r4, lr}
/*0x3d3c*/      ldrb r0, [r0, #7]
/*0x3d3e*/      cmp r0, #4
/*0x3d40*/      beq jump_3d4a
/*0x3d42*/      cmp r0, #5
/*0x3d44*/      beq jump_3d4a
/*0x3d46*/      ldr r1, [pc, #0x44] /* data_3d8c */
/*0x3d48*/      b jump_3d56
            jump_3d4a:
/*0x3d4a*/      ldr r0, [pc, #0x44] /* data_3d90 */
/*0x3d4c*/      ldrh r0, [r0, #2]
/*0x3d4e*/      lsls r0, r0, #0x15
/*0x3d50*/      bpl jump_3d5e
/*0x3d52*/      ldr r1, [pc, #0x38] /* data_3d8c */
/*0x3d54*/      adds r1, r1, #3
            jump_3d56:
/*0x3d56*/      movs r0, #0x32
/*0x3d58*/      bl call_40d0
/*0x3d5c*/      b jump_3d66
            jump_3d5e:
/*0x3d5e*/      movs r1, #0
/*0x3d60*/      movs r0, #0x32
/*0x3d62*/      bl call_4114
            jump_3d66:
/*0x3d66*/      movs r1, #0
/*0x3d68*/      movs r0, #0x31
/*0x3d6a*/      bl call_4114
/*0x3d6e*/      ldr r0, [pc, #0x24] /* data_3d94 */
/*0x3d70*/      ldrb r0, [r0, #2]
/*0x3d72*/      cmp r0, #0
/*0x3d74*/      beq jump_3d86
/*0x3d76*/      ldr r2, [pc, #0x20] /* data_3d98 */
/*0x3d78*/      add.w r0, r0, r0, lsl #3
/*0x3d7c*/      add.w r0, r2, r0, lsl #3
/*0x3d80*/      movs r1, #0xff
/*0x3d82*/      strb r1, [r0, #-0x17]
            jump_3d86:
/*0x3d86*/      pop {r4, pc}

            data_3d88:
/*0x3d88*/  .word 0x20001970
            data_3d8c:
/*0x3d8c*/  .word 0x00007dc0
            data_3d90:
/*0x3d90*/  .word 0x20000014
            data_3d94:
/*0x3d94*/  .word 0x20000068
            data_3d98:
/*0x3d98*/  .word 0x2000032c


            .thumb_func
            call_3d9c:
/*0x3d9c*/      mov r3, r1
/*0x3d9e*/      ldr r1, [pc, #0x40] /* data_3de0 */
/*0x3da0*/      push {r4, lr}
/*0x3da2*/      ldrb r1, [r1, #2]
/*0x3da4*/      cmp r1, #0
/*0x3da6*/      beq jump_3dde
/*0x3da8*/      add.w r1, r1, r1, lsl #1
/*0x3dac*/      add.w r4, r0, r1, lsl #5
/*0x3db0*/      subs r4, #0x60
/*0x3db2*/      lsrs r0, r4, #2
/*0x3db4*/      lsls r1, r0, #0xc
/*0x3db6*/      ldr r0, [pc, #0x2c] /* data_3de4 */
/*0x3db8*/      mov.w r2, #0x1000
/*0x3dbc*/      add.w r1, r1, #0x5000
/*0x3dc0*/      cbz r3, jump_3dca
/*0x3dc2*/      pop.w {r4, lr}
/*0x3dc6*/      b.w jump_6f04
            jump_3dca:
/*0x3dca*/      bl call_43a8
/*0x3dce*/      ldr r1, [pc, #0x14] /* data_3de4 */
/*0x3dd0*/      and r0, r4, #3
/*0x3dd4*/      add.w r0, r1, r0, lsl #10
/*0x3dd8*/      ldr r1, [pc, #4] /* data_3de0 */
/*0x3dda*/      subs r1, r1, #4
/*0x3ddc*/      str r0, [r1]
            jump_3dde:
/*0x3dde*/      pop {r4, pc}

            data_3de0:
/*0x3de0*/  .word 0x20000068
            data_3de4:
/*0x3de4*/  .word 0x2000096a


            .thumb_func
            call_3de8:
/*0x3de8*/      push {r3, r4, r5, lr}
/*0x3dea*/      mov r5, r0
/*0x3dec*/      movs r2, #2
/*0x3dee*/      movs r1, #0
/*0x3df0*/      mov r0, sp
/*0x3df2*/      bl call_43a8
/*0x3df6*/      ldrh.w r1, [sp]
/*0x3dfa*/      movw r4, #0x8001
/*0x3dfe*/      cmp r1, r4
/*0x3e00*/      beq jump_3e22
/*0x3e02*/      cbz r5, jump_3e1e
/*0x3e04*/      ldr r0, [pc, #0x20] /* data_3e28 */
/*0x3e06*/      ldrb r0, [r0, #2]
/*0x3e08*/      bl call_3f10
/*0x3e0c*/      movs r2, #2
/*0x3e0e*/      movs r1, #0
/*0x3e10*/      mov r0, sp
/*0x3e12*/      bl call_43a8
/*0x3e16*/      ldrh.w r0, [sp]
/*0x3e1a*/      cmp r0, r4
/*0x3e1c*/      beq jump_3e22
            jump_3e1e:
/*0x3e1e*/      movs r0, #0
/*0x3e20*/      pop {r3, r4, r5, pc}
            jump_3e22:
/*0x3e22*/      movs r0, #1
/*0x3e24*/      pop {r3, r4, r5, pc}

/*0x3e26*/  .byte 0x00
/*0x3e27*/  .byte 0x00

            data_3e28:
/*0x3e28*/  .word 0x20000068


            .thumb_func
            call_3e2c:
/*0x3e2c*/      push {r4, r5, r6, lr}
/*0x3e2e*/      mov r4, r0
/*0x3e30*/      movs r2, #4
/*0x3e32*/      movs r1, #0
/*0x3e34*/      ldr r0, [pc, #0x6c] /* data_3ea4 */
/*0x3e36*/      bl call_43a8
/*0x3e3a*/      ldr r5, [pc, #0x68] /* data_3ea4 */
/*0x3e3c*/      movw r1, #0x8001
/*0x3e40*/      ldrh r0, [r5]
/*0x3e42*/      cmp r0, r1
/*0x3e44*/      beq jump_3e5e
/*0x3e46*/      cmp.w r0, #0x1000
/*0x3e4a*/      bhs jump_3e50
/*0x3e4c*/      ldrb r4, [r5, #2]
/*0x3e4e*/      b jump_3e56
            jump_3e50:
/*0x3e50*/      cmp r4, #0xff
/*0x3e52*/      bne jump_3e56
/*0x3e54*/      movs r4, #0
            jump_3e56:
/*0x3e56*/      mov r0, r4
/*0x3e58*/      bl call_3f10
/*0x3e5c*/      b jump_3e6e
            jump_3e5e:
/*0x3e5e*/      cmp r4, #0xff
/*0x3e60*/      beq jump_3e6e
/*0x3e62*/      ldrb r0, [r5, #2]
/*0x3e64*/      cmp r0, r4
/*0x3e66*/      beq jump_3e6e
/*0x3e68*/      strb r4, [r5, #2]
/*0x3e6a*/      bl call_3fb8
            jump_3e6e:
/*0x3e6e*/      ldrb r0, [r5, #2]
/*0x3e70*/      movs r2, #2
/*0x3e72*/      lsls r1, r0, #0xc
/*0x3e74*/      ldr r0, [pc, #0x30] /* data_3ea8 */
/*0x3e76*/      add.w r1, r1, #0x1000
/*0x3e7a*/      bl call_43a8
/*0x3e7e*/      ldr r0, [pc, #0x28] /* data_3ea8 */
/*0x3e80*/      ldrh r0, [r0]
/*0x3e82*/      cmp r0, #0xe
/*0x3e84*/      beq jump_3e8e
/*0x3e86*/      pop.w {r4, r5, r6, lr}
/*0x3e8a*/      b.w call_3eac
            jump_3e8e:
/*0x3e8e*/      ldrb r0, [r5, #2]
/*0x3e90*/      pop.w {r4, r5, r6, lr}
/*0x3e94*/      lsls r1, r0, #0xc
/*0x3e96*/      movw r2, #0x262
/*0x3e9a*/      ldr r0, [pc, #0xc] /* data_3ea8 */
/*0x3e9c*/      add.w r1, r1, #0x1000
/*0x3ea0*/      b.w call_43a8

            data_3ea4:
/*0x3ea4*/  .word 0x20000068
            data_3ea8:
/*0x3ea8*/  .word 0x20000708


            .thumb_func
            call_3eac:
/*0x3eac*/      ldr r1, [pc, #0x28] /* data_3ed8 */
/*0x3eae*/      push {r4, lr}
/*0x3eb0*/      movs r0, #0xe
/*0x3eb2*/      strh r0, [r1]
/*0x3eb4*/      ldr r0, [pc, #0x20] /* data_3ed8 */
/*0x3eb6*/      movs r2, #0xff
/*0x3eb8*/      movs r1, #0xc0
/*0x3eba*/      adds r0, #0x28
/*0x3ebc*/      bl mem_set
/*0x3ec0*/      ldr r0, [pc, #0x14] /* data_3ed8 */
/*0x3ec2*/      movs r2, #0xff
/*0x3ec4*/      movs r1, #0x8c
/*0x3ec6*/      adds r0, #0xf2
/*0x3ec8*/      bl mem_set
/*0x3ecc*/      bl call_3f28
/*0x3ed0*/      pop.w {r4, lr}
/*0x3ed4*/      b.w call_3f98

            data_3ed8:
/*0x3ed8*/  .word 0x20000708


            .thumb_func
            call_3edc:
/*0x3edc*/      push {r4, lr}
/*0x3ede*/      ldr r4, [pc, #0x2c] /* data_3f0c */
/*0x3ee0*/      movs r0, #0
/*0x3ee2*/      strb r0, [r4, #2]
/*0x3ee4*/      bl call_3eac
            jump_3ee8:
/*0x3ee8*/      ldrb r0, [r4, #2]
/*0x3eea*/      adds r0, r0, #1
/*0x3eec*/      uxtb r0, r0
/*0x3eee*/      strb r0, [r4, #2]
/*0x3ef0*/      cmp r0, #4
/*0x3ef2*/      bhs jump_3efa
/*0x3ef4*/      bl call_3f98
/*0x3ef8*/      b jump_3ee8
            jump_3efa:
/*0x3efa*/      movs r0, #0
/*0x3efc*/      bl call_3f10
/*0x3f00*/      pop.w {r4, lr}
/*0x3f04*/      movs r0, #0xff
/*0x3f06*/      b.w call_3e2c

/*0x3f0a*/  .byte 0x00
/*0x3f0b*/  .byte 0x00

            data_3f0c:
/*0x3f0c*/  .word 0x20000068


            .thumb_func
            call_3f10:
/*0x3f10*/      ldr r1, [pc, #0x10] /* data_3f24 */
/*0x3f12*/      movw r2, #0x8001
/*0x3f16*/      strh r2, [r1]
/*0x3f18*/      strb r0, [r1, #2]
/*0x3f1a*/      movs r0, #0xff
/*0x3f1c*/      strb r0, [r1, #3]
/*0x3f1e*/      b.w call_3fb8

/*0x3f22*/  .byte 0x00
/*0x3f23*/  .byte 0x00

            data_3f24:
/*0x3f24*/  .word 0x20000068


            .thumb_func
            call_3f28:
/*0x3f28*/      push {r4, r5, r6, lr}
/*0x3f2a*/      ldr r4, [pc, #0x5c] /* data_3f88 */
/*0x3f2c*/      ldr r1, [pc, #0x5c] /* data_3f8c */
/*0x3f2e*/      movs r5, #0
/*0x3f30*/      strb r5, [r4, #2]
/*0x3f32*/      add.w r0, r4, #0x80
/*0x3f36*/      ldr r2, [r1]
/*0x3f38*/      str r2, [r0, #0x68]
/*0x3f3a*/      ldr r2, [r1, #4]
/*0x3f3c*/      str r2, [r0, #0x6c]
/*0x3f3e*/      ldrh r1, [r1, #8]
/*0x3f40*/      strh.w r1, [r0, #0x70]
/*0x3f44*/      movs r0, #7
/*0x3f46*/      strb r0, [r4, #3]
/*0x3f48*/      adds r2, r4, #4
/*0x3f4a*/      mov r3, r0
/*0x3f4c*/      b jump_3f62
            jump_3f4e:
/*0x3f4e*/      ldr r1, [pc, #0x40] /* data_3f90 */
/*0x3f50*/      movs r0, #5
/*0x3f52*/      b jump_3f5c
            jump_3f54:
/*0x3f54*/      ldrb r6, [r1], #1
/*0x3f58*/      strb r6, [r2], #1
            jump_3f5c:
/*0x3f5c*/      subs r0, r0, #1
/*0x3f5e*/      uxtb r0, r0
/*0x3f60*/      bhs jump_3f54
            jump_3f62:
/*0x3f62*/      subs r3, r3, #1
/*0x3f64*/      uxtb r3, r3
/*0x3f66*/      bhs jump_3f4e
/*0x3f68*/      movs r0, #0
/*0x3f6a*/      bl call_6324
/*0x3f6e*/      movs r0, #3
/*0x3f70*/      strb r0, [r4, #0x11]
/*0x3f72*/      movs r1, #0xd8
/*0x3f74*/      ldr r0, [pc, #0x1c] /* data_3f94 */
/*0x3f76*/      bl mem_zero
/*0x3f7a*/      ldr r0, [pc, #0x18] /* data_3f94 */
/*0x3f7c*/      adds r0, #0x82
/*0x3f7e*/      str r5, [r0, #0x56]!
/*0x3f82*/      str r5, [r0, #4]
/*0x3f84*/      str r5, [r0, #8]
/*0x3f86*/      pop {r4, r5, r6, pc}

            data_3f88:
/*0x3f88*/  .word 0x20000708
            data_3f8c:
/*0x3f8c*/  .word 0x00007d34
            data_3f90:
/*0x3f90*/  .word 0x000083d0
            data_3f94:
/*0x3f94*/  .word 0x20000886


            .thumb_func
            call_3f98:
/*0x3f98*/      ldr r0, [pc, #4] /* data_3fa0 */
/*0x3f9a*/      ldrb r0, [r0, #2]
/*0x3f9c*/      b.w jump_3fa4

            data_3fa0:
/*0x3fa0*/  .word 0x20000068

            jump_3fa4:
/*0x3fa4*/      lsls r1, r0, #0xc
/*0x3fa6*/      movw r2, #0x262
/*0x3faa*/      ldr r0, [pc, #8] /* data_3fb4 */
/*0x3fac*/      add.w r1, r1, #0x1000
/*0x3fb0*/      b.w jump_6f04

            data_3fb4:
/*0x3fb4*/  .word 0x20000708


            .thumb_func
            call_3fb8:
/*0x3fb8*/      movs r2, #4
/*0x3fba*/      movs r1, #0
/*0x3fbc*/      ldr r0, [pc, #4] /* data_3fc4 */
/*0x3fbe*/      b.w jump_6f04

/*0x3fc2*/  .byte 0x00
/*0x3fc3*/  .byte 0x00

            data_3fc4:
/*0x3fc4*/  .word 0x20000068


            .thumb_func
            call_3fc8:
/*0x3fc8*/      push {r4, lr}
/*0x3fca*/      mov r2, r0
/*0x3fcc*/      movs r1, #0
/*0x3fce*/      ldr r3, [pc, #0x18] /* data_3fe8 */
/*0x3fd0*/      mov r0, r1
            jump_3fd2:
/*0x3fd2*/      ldrb.w r4, [r3, r1, lsl #1]
/*0x3fd6*/      cmp r4, r2
/*0x3fd8*/      bne jump_3fdc
/*0x3fda*/      mov r0, r1
            jump_3fdc:
/*0x3fdc*/      adds r1, r1, #1
/*0x3fde*/      uxtb r1, r1
/*0x3fe0*/      cmp r1, #0x20
/*0x3fe2*/      blo jump_3fd2
/*0x3fe4*/      pop {r4, pc}

/*0x3fe6*/  .byte 0x00
/*0x3fe7*/  .byte 0x00

            data_3fe8:
/*0x3fe8*/  .word 0x00007d77


            .thumb_func
            call_3fec:
/*0x3fec*/      add.w r0, r0, r1, lsr #3
/*0x3ff0*/      and r3, r1, #7
/*0x3ff4*/      movs r1, #1
/*0x3ff6*/      lsls r1, r3
/*0x3ff8*/      cmp r2, #0
/*0x3ffa*/      ldrb r2, [r0]
/*0x3ffc*/      uxtb r1, r1
/*0x3ffe*/      beq jump_4004
/*0x4000*/      orrs r2, r1
/*0x4002*/      b jump_4006
            jump_4004:
/*0x4004*/      bics r2, r1
            jump_4006:
/*0x4006*/      strb r2, [r0]
/*0x4008*/      bx lr

            .thumb_func
            call_400a:
/*0x400a*/      push {r4, r5, r6, lr}
/*0x400c*/      mov r6, r0
            jump_400e:
/*0x400e*/      movs r5, #0
/*0x4010*/      movs r4, #3
/*0x4012*/      b jump_4020
            jump_4014:
/*0x4014*/      bl rand
/*0x4018*/      uxtb r0, r0
/*0x401a*/      strb r0, [r6, r4]
/*0x401c*/      add r0, r5
/*0x401e*/      uxth r5, r0
            jump_4020:
/*0x4020*/      subs r4, r4, #1
/*0x4022*/      uxtb r4, r4
/*0x4024*/      bhs jump_4014
/*0x4026*/      cmp r5, #0xe0
/*0x4028*/      blo jump_400e
/*0x402a*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_402c:
/*0x402c*/      push {r4, r5, lr}
/*0x402e*/      lsls r3, r1, #1
/*0x4030*/      cmp r3, #0xff
/*0x4032*/      bls jump_403a
/*0x4034*/      rsb.w r3, r3, #0x1fe
/*0x4038*/      uxth r3, r3
            jump_403a:
/*0x403a*/      movs r4, #0x2b
/*0x403c*/      udiv r4, r0, r4
/*0x4040*/      movs r5, #0x55
/*0x4042*/      mla r0, r4, r5, r0
/*0x4046*/      sub.w r1, r1, r3, lsr #1
/*0x404a*/      uxtb r1, r1
/*0x404c*/      add.w r0, r0, r0, lsl #1
/*0x4050*/      strb r1, [r2]
/*0x4052*/      lsls r0, r0, #0x19
/*0x4054*/      strb r1, [r2, #1]
/*0x4056*/      lsrs r0, r0, #0x18
/*0x4058*/      strb r1, [r2, #2]
/*0x405a*/      lsls r5, r4, #0x1f
/*0x405c*/      beq jump_4062
/*0x405e*/      rsb.w r0, r0, #0xff
            jump_4062:
/*0x4062*/      muls r0, r3, r0
/*0x4064*/      ubfx r0, r0, #8, #8
/*0x4068*/      cmp r4, #5
/*0x406a*/      bhs jump_40a0
/*0x406c*/      tbb [pc, r4]

/*0x4070*/  .byte 0x03
/*0x4071*/  .byte 0x07
/*0x4072*/  .byte 0x0c
/*0x4073*/  .byte 0x10
/*0x4074*/  .byte 0x13
/*0x4075*/  .byte 0x00

            switch_4076:
/*0x4076*/      add r3, r1
/*0x4078*/      strb r3, [r2]
/*0x407a*/      add r0, r1
/*0x407c*/      b jump_4084
            switch_407e:
/*0x407e*/      add r0, r1
/*0x4080*/      strb r0, [r2]
/*0x4082*/      adds r0, r1, r3
            jump_4084:
/*0x4084*/      strb r0, [r2, #1]
/*0x4086*/      pop {r4, r5, pc}
            switch_4088:
/*0x4088*/      add r3, r1
/*0x408a*/      strb r3, [r2, #1]
            jump_408c:
/*0x408c*/      add r0, r1
/*0x408e*/      b jump_409c
            switch_4090:
/*0x4090*/      add r0, r1
/*0x4092*/      strb r0, [r2, #1]
/*0x4094*/      b jump_409a
            switch_4096:
/*0x4096*/      add r0, r1
/*0x4098*/      strb r0, [r2]
            jump_409a:
/*0x409a*/      adds r0, r1, r3
            jump_409c:
/*0x409c*/      strb r0, [r2, #2]
/*0x409e*/      pop {r4, r5, pc}
            jump_40a0:
/*0x40a0*/      add r3, r1
/*0x40a2*/      strb r3, [r2]
/*0x40a4*/      b jump_408c

/*0x40a6*/  .byte 0x00
/*0x40a7*/  .byte 0x00


            .thumb_func
            call_40a8:
/*0x40a8*/      push {r4, lr}
/*0x40aa*/      ldr r1, [pc, #0x20] /* data_40cc */
/*0x40ac*/      movs r3, #0x48
/*0x40ae*/      b jump_40c4
            jump_40b0:
/*0x40b0*/      movs r2, #3
/*0x40b2*/      b jump_40bc
            jump_40b4:
/*0x40b4*/      ldrb r4, [r0], #1
/*0x40b8*/      strb r4, [r1], #0x48
            jump_40bc:
/*0x40bc*/      subs r2, r2, #1
/*0x40be*/      uxtb r2, r2
/*0x40c0*/      bhs jump_40b4
/*0x40c2*/      subs r1, #0xd7
            jump_40c4:
/*0x40c4*/      subs r3, r3, #1
/*0x40c6*/      uxtb r3, r3
/*0x40c8*/      bhs jump_40b0
/*0x40ca*/      pop {r4, pc}

            data_40cc:
/*0x40cc*/  .word 0x2000032c


            .thumb_func
            call_40d0:
/*0x40d0*/      cmp r0, #0xff
/*0x40d2*/      beq jump_40ea
/*0x40d4*/      ldr r2, [pc, #0x14] /* data_40ec */
/*0x40d6*/      add r2, r0
/*0x40d8*/      movs r0, #0
            jump_40da:
/*0x40da*/      adds r0, r0, #1
/*0x40dc*/      ldrb r3, [r1], #1
/*0x40e0*/      uxtb r0, r0
/*0x40e2*/      strb r3, [r2], #0x48
/*0x40e6*/      cmp r0, #3
/*0x40e8*/      blo jump_40da
            jump_40ea:
/*0x40ea*/      bx lr

            data_40ec:
/*0x40ec*/  .word 0x2000032c


            .thumb_func
            call_40f0:
/*0x40f0*/      push {r4, r5, r6, lr}
/*0x40f2*/      mov r5, r0
/*0x40f4*/      ldr r6, [pc, #0x18] /* data_4110 */
/*0x40f6*/      movs r4, #3
/*0x40f8*/      b jump_4108
            jump_40fa:
/*0x40fa*/      ldrb r2, [r5]
/*0x40fc*/      movs r1, #0x48
/*0x40fe*/      mov r0, r6
/*0x4100*/      bl mem_set
/*0x4104*/      adds r5, r5, #1
/*0x4106*/      adds r6, #0x48
            jump_4108:
/*0x4108*/      subs r4, r4, #1
/*0x410a*/      uxtb r4, r4
/*0x410c*/      bhs jump_40fa
/*0x410e*/      pop {r4, r5, r6, pc}

            data_4110:
/*0x4110*/  .word 0x2000032c


            .thumb_func
            call_4114:
/*0x4114*/      cmp r0, #0xff
/*0x4116*/      beq jump_412a
/*0x4118*/      ldr r2, [pc, #0x10] /* data_412c */
/*0x411a*/      add r0, r2
/*0x411c*/      movs r2, #3
/*0x411e*/      b jump_4124
            jump_4120:
/*0x4120*/      strb r1, [r0], #0x48
            jump_4124:
/*0x4124*/      subs r2, r2, #1
/*0x4126*/      uxtb r2, r2
/*0x4128*/      bhs jump_4120
            jump_412a:
/*0x412a*/      bx lr

            data_412c:
/*0x412c*/  .word 0x2000032c


            .thumb_func
            call_4130:
/*0x4130*/      push {r2, r3, r4, r5, r6, lr}
/*0x4132*/      movs r0, #5
/*0x4134*/      ldr r4, [pc, #0x18] /* data_4150 */
/*0x4136*/      strh.w r0, [sp]
/*0x413a*/      movs r5, #0x40
/*0x413c*/      str r5, [r4, #0x28]
/*0x413e*/      movs r2, #2
/*0x4140*/      add r1, sp, #4
/*0x4142*/      mov r0, sp
/*0x4144*/      bl call_43e8
/*0x4148*/      str r5, [r4, #0x24]
/*0x414a*/      ldrb.w r0, [sp, #5]
/*0x414e*/      pop {r2, r3, r4, r5, r6, pc}

            data_4150:
/*0x4150*/  .word 0x400b2000


            .thumb_func
            call_4154:
/*0x4154*/      push {r4, r5, lr}
/*0x4156*/      sub sp, #0x2c
/*0x4158*/      bl call_41d8
/*0x415c*/      ldr r5, [pc, #0x60] /* data_41c0 */
/*0x415e*/      ldrb r0, [r5]
/*0x4160*/      cmp r0, #1
/*0x4162*/      bne jump_41ba
/*0x4164*/      movs r4, #0
/*0x4166*/      mov r2, r4
/*0x4168*/      movs r1, #0x20
/*0x416a*/      movs r3, #1
/*0x416c*/      mov r0, r2
/*0x416e*/      bl ckcu_clocks_enable
/*0x4172*/      mov.w r0, #0x4000
/*0x4176*/      str r0, [sp]
/*0x4178*/      asrs r0, r0, #4
/*0x417a*/      str r0, [sp, #4]
/*0x417c*/      movs r0, #8
/*0x417e*/      strd r0, r4, [sp, #8]
/*0x4182*/      str r4, [sp, #0x10]
/*0x4184*/      str r4, [sp, #0x14]
/*0x4186*/      movs r0, #4
/*0x4188*/      str r4, [sp, #0x18]
/*0x418a*/      strd r4, r0, [sp, #0x1c]
/*0x418e*/      ldr r4, [pc, #0x34] /* data_41c4 */
/*0x4190*/      str r0, [sp, #0x24]
/*0x4192*/      str r0, [sp, #0x28]
/*0x4194*/      mov r1, sp
/*0x4196*/      mov r0, r4
/*0x4198*/      bl call_6784
/*0x419c*/      movs r1, #1
/*0x419e*/      mov r0, r4
/*0x41a0*/      bl call_67ce
/*0x41a4*/      ldr r2, [pc, #0x20] /* data_41c8 */
/*0x41a6*/      movs r1, #0x40
/*0x41a8*/      str r1, [r2, #0x24]
/*0x41aa*/      movs r1, #1
/*0x41ac*/      mov r0, r4
/*0x41ae*/      bl call_6770
/*0x41b2*/      bl call_426c
/*0x41b6*/      movs r0, #2
/*0x41b8*/      strb r0, [r5]
            jump_41ba:
/*0x41ba*/      add sp, #0x2c
/*0x41bc*/      movs r0, #1
/*0x41be*/      pop {r4, r5, pc}

            data_41c0:
/*0x41c0*/  .word 0x20000020
            data_41c4:
/*0x41c4*/  .word 0x40044000
            data_41c8:
/*0x41c8*/  .word 0x400b2000


            .thumb_func
            call_41cc:
/*0x41cc*/      push {r4, lr}
/*0x41ce*/      bl call_4130
/*0x41d2*/      ubfx r0, r0, #0, #1
/*0x41d6*/      pop {r4, pc}

            .thumb_func
            call_41d8:
/*0x41d8*/      push {r4, r5, r6, lr}
/*0x41da*/      ldr r4, [pc, #0x44] /* data_4220 */
/*0x41dc*/      ldrb r0, [r4]
/*0x41de*/      cbnz r0, jump_421c
/*0x41e0*/      movs r1, #0
/*0x41e2*/      mov.w r0, #0x20000
/*0x41e6*/      movs r3, #1
/*0x41e8*/      mov r2, r1
/*0x41ea*/      bl ckcu_clocks_enable
/*0x41ee*/      ldr r5, [pc, #0x34] /* data_4224 */
/*0x41f0*/      movs r2, #0
/*0x41f2*/      movs r1, #0x40
/*0x41f4*/      mov r0, r5
/*0x41f6*/      bl call_45a8
/*0x41fa*/      movs r2, #1
/*0x41fc*/      movs r1, #0x40
/*0x41fe*/      mov r0, r5
/*0x4200*/      bl call_4578
/*0x4204*/      movs r2, #1
/*0x4206*/      movs r1, #0x80
/*0x4208*/      mov r0, r5
/*0x420a*/      bl call_4578
/*0x420e*/      movs r2, #1
/*0x4210*/      lsls r1, r2, #8
/*0x4212*/      mov r0, r5
/*0x4214*/      bl call_4578
/*0x4218*/      movs r0, #1
/*0x421a*/      strb r0, [r4]
            jump_421c:
/*0x421c*/      movs r0, #1
/*0x421e*/      pop {r4, r5, r6, pc}

            data_4220:
/*0x4220*/  .word 0x20000020
            data_4224:
/*0x4224*/  .word 0x400b2000

            jump_4228:
/*0x4228*/      push {r4, lr}
/*0x422a*/      bl call_4380
/*0x422e*/      ldr r4, [pc, #0x38] /* data_4268 */
/*0x4230*/      movs r2, #0
/*0x4232*/      movs r1, #0x40
/*0x4234*/      mov r0, r4
/*0x4236*/      bl call_45a8
/*0x423a*/      movs r2, #0
/*0x423c*/      movs r1, #0x40
/*0x423e*/      mov r0, r4
/*0x4240*/      bl call_4568
/*0x4244*/      movs r2, #0
/*0x4246*/      movs r1, #7
/*0x4248*/      movs r0, #1
/*0x424a*/      bl afio_pin_config
/*0x424e*/      movs r2, #0
/*0x4250*/      movs r1, #8
/*0x4252*/      movs r0, #1
/*0x4254*/      bl afio_pin_config
/*0x4258*/      movs r2, #0
/*0x425a*/      movs r1, #9
/*0x425c*/      pop.w {r4, lr}
/*0x4260*/      movs r0, #1
/*0x4262*/      b.w afio_pin_config

/*0x4266*/  .byte 0x00
/*0x4267*/  .byte 0x00

            data_4268:
/*0x4268*/  .word 0x400b2000


            .thumb_func
            call_426c:
/*0x426c*/      push {r4, lr}
/*0x426e*/      ldr r4, [pc, #0x3c] /* data_42ac */
/*0x4270*/      movs r2, #1
/*0x4272*/      movs r1, #0x40
/*0x4274*/      mov r0, r4
/*0x4276*/      bl call_4568
/*0x427a*/      movs r2, #2
/*0x427c*/      movs r1, #0x40
/*0x427e*/      mov r0, r4
/*0x4280*/      bl call_45a8
/*0x4284*/      movs r2, #5
/*0x4286*/      movs r1, #7
/*0x4288*/      movs r0, #1
/*0x428a*/      bl afio_pin_config
/*0x428e*/      movs r2, #5
/*0x4290*/      movs r1, #8
/*0x4292*/      movs r0, #1
/*0x4294*/      bl afio_pin_config
/*0x4298*/      movs r2, #5
/*0x429a*/      movs r1, #9
/*0x429c*/      movs r0, #1
/*0x429e*/      bl afio_pin_config
/*0x42a2*/      pop.w {r4, lr}
/*0x42a6*/      b.w jump_4480

/*0x42aa*/  .byte 0x00
/*0x42ab*/  .byte 0x00

            data_42ac:
/*0x42ac*/  .word 0x400b2000


            .thumb_func
            call_42b0:
/*0x42b0*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x42b4*/      mov r7, r2
/*0x42b6*/      mov r4, r1
/*0x42b8*/      mov r8, r0
/*0x42ba*/      bl call_4520
/*0x42be*/      ldr r6, [pc, #0x34] /* data_42f4 */
/*0x42c0*/      movs r5, #0x40
/*0x42c2*/      str r5, [r6, #0x28]
/*0x42c4*/      movs r0, #2
/*0x42c6*/      strb.w r0, [sp]
/*0x42ca*/      lsrs r0, r4, #0x10
/*0x42cc*/      strb.w r0, [sp, #1]
/*0x42d0*/      lsrs r0, r4, #8
/*0x42d2*/      strb.w r0, [sp, #2]
/*0x42d6*/      strb.w r4, [sp, #3]
/*0x42da*/      movs r2, #4
/*0x42dc*/      movs r1, #0
/*0x42de*/      mov r0, sp
/*0x42e0*/      bl call_43e8
/*0x42e4*/      mov r2, r7
/*0x42e6*/      movs r1, #0
/*0x42e8*/      mov r0, r8
/*0x42ea*/      bl call_43e8
/*0x42ee*/      str r5, [r6, #0x24]
/*0x42f0*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

            data_42f4:
/*0x42f4*/  .word 0x400b2000


            .thumb_func
            call_42f8:
/*0x42f8*/      push {r3, r4, r5, r6, r7, lr}
/*0x42fa*/      mov r4, r0
/*0x42fc*/      bl call_4520
/*0x4300*/      ldr r6, [pc, #0x28] /* data_432c */
/*0x4302*/      movs r5, #0x40
/*0x4304*/      str r5, [r6, #0x28]
/*0x4306*/      movs r0, #0x20
/*0x4308*/      strb.w r0, [sp]
/*0x430c*/      lsrs r0, r4, #0x10
/*0x430e*/      strb.w r0, [sp, #1]
/*0x4312*/      lsrs r0, r4, #8
/*0x4314*/      strb.w r0, [sp, #2]
/*0x4318*/      strb.w r4, [sp, #3]
/*0x431c*/      movs r2, #4
/*0x431e*/      movs r1, #0
/*0x4320*/      mov r0, sp
/*0x4322*/      bl call_43e8
/*0x4326*/      str r5, [r6, #0x24]
/*0x4328*/      pop {r3, r4, r5, r6, r7, pc}

/*0x432a*/  .byte 0x00
/*0x432b*/  .byte 0x00

            data_432c:
/*0x432c*/  .word 0x400b2000


            .thumb_func
            call_4330:
/*0x4330*/      push {r3, r4, r5, r6, r7, lr}
/*0x4332*/      mov r6, r0
/*0x4334*/      bl call_4520
/*0x4338*/      ldr r4, [pc, #0x1c] /* data_4358 */
/*0x433a*/      movs r5, #0x40
/*0x433c*/      str r5, [r4, #0x28]
/*0x433e*/      movs r0, #1
/*0x4340*/      strb.w r0, [sp]
/*0x4344*/      strb.w r6, [sp, #1]
/*0x4348*/      movs r2, #2
/*0x434a*/      movs r1, #0
/*0x434c*/      mov r0, sp
/*0x434e*/      bl call_43e8
/*0x4352*/      str r5, [r4, #0x24]
/*0x4354*/      pop {r3, r4, r5, r6, r7, pc}

/*0x4356*/  .byte 0x00
/*0x4357*/  .byte 0x00

            data_4358:
/*0x4358*/  .word 0x400b2000


            .thumb_func
            call_435c:
/*0x435c*/      push {r4, lr}
/*0x435e*/      movs r4, #0x3c
/*0x4360*/      bl call_42b0
/*0x4364*/      b jump_4372
            jump_4366:
/*0x4366*/      movs r0, #0x64
/*0x4368*/      bl spin_wait
/*0x436c*/      bl call_41cc
/*0x4370*/      cbz r0, jump_437a
            jump_4372:
/*0x4372*/      mov r0, r4
/*0x4374*/      subs r4, r4, #1
/*0x4376*/      bhs jump_4366
/*0x4378*/      pop {r4, pc}
            jump_437a:
/*0x437a*/      movs r0, #1
/*0x437c*/      pop {r4, pc}

/*0x437e*/  .byte 0x00
/*0x437f*/  .byte 0x00


            .thumb_func
            call_4380:
/*0x4380*/      push {r3, r4, r5, lr}
/*0x4382*/      movs r0, #0xb9
/*0x4384*/      ldr r4, [pc, #0x1c] /* data_43a4 */
/*0x4386*/      strb.w r0, [sp]
/*0x438a*/      movs r5, #0x40
/*0x438c*/      str r5, [r4, #0x28]
/*0x438e*/      movs r2, #1
/*0x4390*/      movs r1, #0
/*0x4392*/      mov r0, sp
/*0x4394*/      bl call_43e8
/*0x4398*/      str r5, [r4, #0x24]
/*0x439a*/      movs r0, #0xa
/*0x439c*/      bl spin_wait
/*0x43a0*/      pop {r3, r4, r5, pc}

/*0x43a2*/  .byte 0x00
/*0x43a3*/  .byte 0x00

            data_43a4:
/*0x43a4*/  .word 0x400b2000


            .thumb_func
            call_43a8:
/*0x43a8*/      push {r3, r4, r5, r6, r7, lr}
/*0x43aa*/      ldr r5, [pc, #0x38] /* data_43e4 */
/*0x43ac*/      movs r4, #0x40
/*0x43ae*/      mov r7, r2
/*0x43b0*/      mov r6, r0
/*0x43b2*/      str r4, [r5, #0x28]
/*0x43b4*/      movs r0, #3
/*0x43b6*/      strb.w r0, [sp]
/*0x43ba*/      lsrs r0, r1, #0x10
/*0x43bc*/      strb.w r0, [sp, #1]
/*0x43c0*/      lsrs r0, r1, #8
/*0x43c2*/      strb.w r0, [sp, #2]
/*0x43c6*/      strb.w r1, [sp, #3]
/*0x43ca*/      movs r2, #4
/*0x43cc*/      movs r1, #0
/*0x43ce*/      mov r0, sp
/*0x43d0*/      bl call_43e8
/*0x43d4*/      mov r2, r7
/*0x43d6*/      mov r1, r6
/*0x43d8*/      movs r0, #0
/*0x43da*/      bl call_43e8
/*0x43de*/      str r4, [r5, #0x24]
/*0x43e0*/      pop {r3, r4, r5, r6, r7, pc}

/*0x43e2*/  .byte 0x00
/*0x43e3*/  .byte 0x00

            data_43e4:
/*0x43e4*/  .word 0x400b2000


            .thumb_func
            call_43e8:
/*0x43e8*/      push {r4, r5, r6, r7, lr}
/*0x43ea*/      movs r3, #0
/*0x43ec*/      cmp r2, #8
/*0x43ee*/      bls jump_43f4
/*0x43f0*/      movs r4, #8
/*0x43f2*/      b jump_43f6
            jump_43f4:
/*0x43f4*/      mov r4, r2
            jump_43f6:
/*0x43f6*/      movs r5, #0
/*0x43f8*/      mov r7, r5
/*0x43fa*/      ldr r6, [pc, #0x58] /* data_4454 */
/*0x43fc*/      b jump_440a
            jump_43fe:
/*0x43fe*/      cbz r0, jump_4410
/*0x4400*/      ldrb.w ip, [r0, r5]
/*0x4404*/      str.w ip, [r6, #0x10]
            jump_4408:
/*0x4408*/      adds r5, r5, #1
            jump_440a:
/*0x440a*/      cmp r5, r4
/*0x440c*/      blo jump_43fe
/*0x440e*/      b jump_4432
            jump_4410:
/*0x4410*/      str r7, [r6, #0x10]
/*0x4412*/      b jump_4408
            jump_4414:
/*0x4414*/      ldr r5, [r6, #0x1c]
/*0x4416*/      tst.w r5, #0xf0
/*0x441a*/      beq jump_4414
/*0x441c*/      ldr r5, [r6, #0x10]
/*0x441e*/      uxtb r5, r5
/*0x4420*/      cbz r0, jump_4438
/*0x4422*/      ldrb.w ip, [r0, r4]
/*0x4426*/      str.w ip, [r6, #0x10]
            jump_442a:
/*0x442a*/      adds r4, r4, #1
/*0x442c*/      cbz r1, jump_4430
/*0x442e*/      strb r5, [r1, r3]
            jump_4430:
/*0x4430*/      adds r3, r3, #1
            jump_4432:
/*0x4432*/      cmp r4, r2
/*0x4434*/      blo jump_4414
/*0x4436*/      b jump_444e
            jump_4438:
/*0x4438*/      str r7, [r6, #0x10]
/*0x443a*/      b jump_442a
            jump_443c:
/*0x443c*/      ldr r0, [r6, #0x1c]
/*0x443e*/      tst.w r0, #0xf0
/*0x4442*/      beq jump_443c
/*0x4444*/      ldr r0, [r6, #0x10]
/*0x4446*/      uxtb r0, r0
/*0x4448*/      cbz r1, jump_444c
/*0x444a*/      strb r0, [r1, r3]
            jump_444c:
/*0x444c*/      adds r3, r3, #1
            jump_444e:
/*0x444e*/      cmp r3, r2
/*0x4450*/      blo jump_443c
/*0x4452*/      pop {r4, r5, r6, r7, pc}

            data_4454:
/*0x4454*/  .word 0x40044000


            .thumb_func
            call_4458:
/*0x4458*/      push {r4, r5, r6, lr}
/*0x445a*/      movw r4, #0x12d
/*0x445e*/      bl call_42f8
/*0x4462*/      mov.w r5, #0x3e8
/*0x4466*/      b jump_4474
            jump_4468:
/*0x4468*/      mov r0, r5
/*0x446a*/      bl spin_wait
/*0x446e*/      bl call_41cc
/*0x4472*/      cbz r0, jump_447c
            jump_4474:
/*0x4474*/      mov r0, r4
/*0x4476*/      subs r4, r4, #1
/*0x4478*/      bhs jump_4468
/*0x447a*/      pop {r4, r5, r6, pc}
            jump_447c:
/*0x447c*/      movs r0, #1
/*0x447e*/      pop {r4, r5, r6, pc}
            jump_4480:
/*0x4480*/      push {r3, r4, r5, lr}
/*0x4482*/      movs r0, #0xab
/*0x4484*/      ldr r4, [pc, #0x1c] /* data_44a4 */
/*0x4486*/      strb.w r0, [sp]
/*0x448a*/      movs r5, #0x40
/*0x448c*/      str r5, [r4, #0x28]
/*0x448e*/      movs r2, #1
/*0x4490*/      movs r1, #0
/*0x4492*/      mov r0, sp
/*0x4494*/      bl call_43e8
/*0x4498*/      str r5, [r4, #0x24]
/*0x449a*/      movs r0, #0xa
/*0x449c*/      bl spin_wait
/*0x44a0*/      pop {r3, r4, r5, pc}

/*0x44a2*/  .byte 0x00
/*0x44a3*/  .byte 0x00

            data_44a4:
/*0x44a4*/  .word 0x400b2000

            jump_44a8:
/*0x44a8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x44ac*/      mov r5, r1
/*0x44ae*/      mov r6, r0
/*0x44b0*/      rsbs r0, r5, #0
/*0x44b2*/      uxtb r4, r0
/*0x44b4*/      cmp r4, r2
/*0x44b6*/      bhs jump_44c2
/*0x44b8*/      subs r0, r2, r4
/*0x44ba*/      ubfx r7, r0, #8, #0x10
/*0x44be*/      uxtb r0, r0
/*0x44c0*/      b jump_44c8
            jump_44c2:
/*0x44c2*/      movs r7, #0
/*0x44c4*/      uxth r4, r2
/*0x44c6*/      mov r0, r7
            jump_44c8:
/*0x44c8*/      mov r8, r0
/*0x44ca*/      cbz r4, jump_44dc
/*0x44cc*/      mov r2, r4
/*0x44ce*/      mov r0, r6
/*0x44d0*/      bl call_435c
/*0x44d4*/      cmp r0, #1
/*0x44d6*/      bne jump_4514
/*0x44d8*/      add r5, r4
/*0x44da*/      add r6, r4
            jump_44dc:
/*0x44dc*/      movs r4, #0
/*0x44de*/      mov.w sb, #0x100
/*0x44e2*/      b jump_44fc
            jump_44e4:
/*0x44e4*/      mov r2, sb
/*0x44e6*/      mov r1, r5
/*0x44e8*/      mov r0, r6
/*0x44ea*/      bl call_435c
/*0x44ee*/      cmp r0, #1
/*0x44f0*/      bne jump_4514
/*0x44f2*/      adds r4, r4, #1
/*0x44f4*/      add.w r5, r5, #0x100
/*0x44f8*/      add.w r6, r6, #0x100
            jump_44fc:
/*0x44fc*/      cmp r4, r7
/*0x44fe*/      blt jump_44e4
/*0x4500*/      subs.w r0, r8, #0
/*0x4504*/      beq jump_451a
/*0x4506*/      mov r2, r0
/*0x4508*/      mov r1, r5
/*0x450a*/      mov r0, r6
/*0x450c*/      bl call_435c
/*0x4510*/      cmp r0, #1
/*0x4512*/      beq jump_451a
            jump_4514:
/*0x4514*/      movs r0, #0
            jump_4516:
/*0x4516*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_451a:
/*0x451a*/      movs r0, #1
/*0x451c*/      b jump_4516

/*0x451e*/  .byte 0x00
/*0x451f*/  .byte 0x00


            .thumb_func
            call_4520:
/*0x4520*/      push {r3, r4, r5, lr}
/*0x4522*/      movs r0, #6
/*0x4524*/      ldr r4, [pc, #0x14] /* data_453c */
/*0x4526*/      strb.w r0, [sp]
/*0x452a*/      movs r5, #0x40
/*0x452c*/      str r5, [r4, #0x28]
/*0x452e*/      movs r2, #1
/*0x4530*/      movs r1, #0
/*0x4532*/      mov r0, sp
/*0x4534*/      bl call_43e8
/*0x4538*/      str r5, [r4, #0x24]
/*0x453a*/      pop {r3, r4, r5, pc}

            data_453c:
/*0x453c*/  .word 0x400b2000


            .thumb_func
            call_4540:
/*0x4540*/      push {r4, lr}
/*0x4542*/      mov.w r4, #0x19a
/*0x4546*/      bl call_4330
/*0x454a*/      b jump_4558
            jump_454c:
/*0x454c*/      movs r0, #0x64
/*0x454e*/      bl spin_wait
/*0x4552*/      bl call_41cc
/*0x4556*/      cbz r0, jump_4560
            jump_4558:
/*0x4558*/      mov r0, r4
/*0x455a*/      subs r4, r4, #1
/*0x455c*/      bhs jump_454c
/*0x455e*/      pop {r4, pc}
            jump_4560:
/*0x4560*/      movs r0, #1
/*0x4562*/      pop {r4, pc}

            .thumb_func
            call_4564:
/*0x4564*/      str r1, [r0, #0x28]
/*0x4566*/      bx lr

            .thumb_func
            call_4568:
/*0x4568*/      cmp r2, #0
/*0x456a*/      ldr r2, [r0]
/*0x456c*/      beq jump_4572
/*0x456e*/      orrs r2, r1
/*0x4570*/      b jump_4574
            jump_4572:
/*0x4572*/      bics r2, r1
            jump_4574:
/*0x4574*/      str r2, [r0]
/*0x4576*/      bx lr

            .thumb_func
            call_4578:
/*0x4578*/      cmp r2, #0
/*0x457a*/      ldr r2, [r0, #0x14]
/*0x457c*/      beq jump_4582
/*0x457e*/      orrs r2, r1
/*0x4580*/      b jump_4584
            jump_4582:
/*0x4582*/      bics r2, r1
            jump_4584:
/*0x4584*/      str r2, [r0, #0x14]
/*0x4586*/      bx lr

            .thumb_func
            call_4588:
/*0x4588*/      cmp r2, #0
/*0x458a*/      ldr r2, [r0, #4]
/*0x458c*/      beq jump_4592
/*0x458e*/      orrs r2, r1
/*0x4590*/      b jump_4594
            jump_4592:
/*0x4592*/      bics r2, r1
            jump_4594:
/*0x4594*/      str r2, [r0, #4]
/*0x4596*/      bx lr

            .thumb_func
            call_4598:
/*0x4598*/      cmp r2, #0
/*0x459a*/      ldr r2, [r0, #0x10]
/*0x459c*/      beq jump_45a2
/*0x459e*/      orrs r2, r1
/*0x45a0*/      b jump_45a4
            jump_45a2:
/*0x45a2*/      bics r2, r1
            jump_45a4:
/*0x45a4*/      str r2, [r0, #0x10]
/*0x45a6*/      bx lr

            .thumb_func
            call_45a8:
/*0x45a8*/      cbz r2, jump_45bc
/*0x45aa*/      cmp r2, #1
/*0x45ac*/      beq jump_45c2
/*0x45ae*/      ldr r2, [r0, #8]
/*0x45b0*/      bics r2, r1
            jump_45b2:
/*0x45b2*/      str r2, [r0, #8]
/*0x45b4*/      ldr r2, [r0, #0xc]
/*0x45b6*/      bics r2, r1
/*0x45b8*/      str r2, [r0, #0xc]
/*0x45ba*/      bx lr
            jump_45bc:
/*0x45bc*/      ldr r2, [r0, #8]
/*0x45be*/      orrs r2, r1
/*0x45c0*/      b jump_45b2
            jump_45c2:
/*0x45c2*/      ldr r2, [r0, #0xc]
/*0x45c4*/      orrs r2, r1
/*0x45c6*/      str r2, [r0, #0xc]
/*0x45c8*/      ldr r2, [r0, #8]
/*0x45ca*/      bics r2, r1
/*0x45cc*/      str r2, [r0, #8]
/*0x45ce*/      bx lr

            .thumb_func
            call_45d0:
/*0x45d0*/      str r1, [r0, #0x24]
/*0x45d2*/      bx lr

            .thumb_func
            call_45d4:
/*0x45d4*/      cbz r2, jump_45da
/*0x45d6*/      str r1, [r0, #0x24]
/*0x45d8*/      bx lr
            jump_45da:
/*0x45da*/      str r1, [r0, #0x28]
/*0x45dc*/      bx lr

            .thumb_func
            call_45de:
/*0x45de*/      cmp r1, #0
/*0x45e0*/      ldr r1, [r0, #0x10]
/*0x45e2*/      beq jump_45ea
/*0x45e4*/      orr r1, r1, #1
/*0x45e8*/      b jump_45ee
            jump_45ea:
/*0x45ea*/      bic r1, r1, #1
            jump_45ee:
/*0x45ee*/      str r1, [r0, #0x10]
/*0x45f0*/      bx lr

            .thumb_func
            call_45f2:
/*0x45f2*/      push {r4, r5, r6, r7, lr}
/*0x45f4*/      ldrb r3, [r1]
/*0x45f6*/      ldr r7, [r0, #0x50]
/*0x45f8*/      add.w r4, r0, r3, lsl #2
/*0x45fc*/      add.w r2, r4, #0x40
/*0x4600*/      add.w r5, r4, #0x90
/*0x4604*/      add.w r6, r4, #0xa0
/*0x4608*/      lsls r3, r3, #1
/*0x460a*/      movs r4, #1
/*0x460c*/      lsls r4, r3
/*0x460e*/      mvns r4, r4
/*0x4610*/      ands r7, r4
/*0x4612*/      str r7, [r0, #0x50]
/*0x4614*/      ldr r7, [r0, #0x54]
/*0x4616*/      ands r7, r4
/*0x4618*/      str r7, [r0, #0x54]
/*0x461a*/      ldr r4, [r0, #0x54]
/*0x461c*/      ldrb r7, [r1, #5]
/*0x461e*/      lsls r7, r3
/*0x4620*/      orrs r4, r7
/*0x4622*/      str r4, [r0, #0x54]
/*0x4624*/      ldr r4, [r2]
/*0x4626*/      movw r7, #0x107
/*0x462a*/      bics r4, r7
/*0x462c*/      str r4, [r2]
/*0x462e*/      ldr r4, [r2]
/*0x4630*/      ldrh r7, [r1, #2]
/*0x4632*/      orrs r4, r7
/*0x4634*/      str r4, [r2]
/*0x4636*/      ldrh r2, [r1, #6]
/*0x4638*/      str r2, [r5]
/*0x463a*/      ldrh r2, [r1, #8]
/*0x463c*/      str r2, [r6]
/*0x463e*/      ldr r2, [r0, #0x50]
/*0x4640*/      ldrb r1, [r1, #4]
/*0x4642*/      lsls r1, r3
/*0x4644*/      orrs r2, r1
/*0x4646*/      str r2, [r0, #0x50]
/*0x4648*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_464a:
/*0x464a*/      ldrh r2, [r1]
/*0x464c*/      str.w r2, [r0, #0x88]
/*0x4650*/      ldrh r2, [r1, #2]
/*0x4652*/      str.w r2, [r0, #0x84]
/*0x4656*/      ldr r2, [r0]
/*0x4658*/      bic r2, r2, #0x30000
/*0x465c*/      str r2, [r0]
/*0x465e*/      ldr r2, [r0]
/*0x4660*/      bic r2, r2, #0x1000000
/*0x4664*/      str r2, [r0]
/*0x4666*/      ldr r2, [r0]
/*0x4668*/      ldr r3, [r1, #4]
/*0x466a*/      orrs r2, r3
/*0x466c*/      str r2, [r0]
/*0x466e*/      ldrh r1, [r1, #8]
/*0x4670*/      str r1, [r0, #0x78]
/*0x4672*/      bx lr

            .thumb_func
            call_4674:
/*0x4674*/      ldr r0, [pc, #0x28] /* data_46a0 */
/*0x4676*/      ldrb r1, [r0, #2]
/*0x4678*/      cbz r1, jump_467e
/*0x467a*/      movs r0, #0
/*0x467c*/      bx lr
            jump_467e:
/*0x467e*/      ldrb r1, [r0, #0xc]
/*0x4680*/      cbz r1, jump_4686
/*0x4682*/      movs r0, #1
/*0x4684*/      bx lr
            jump_4686:
/*0x4686*/      ldrb r0, [r0, #0xb]
/*0x4688*/      cbz r0, jump_468e
/*0x468a*/      movs r0, #2
/*0x468c*/      bx lr
            jump_468e:
/*0x468e*/      ldr r0, [pc, #0x14] /* data_46a4 */
/*0x4690*/      ldrb r0, [r0, #6]
/*0x4692*/      cmp r0, #1
/*0x4694*/      beq jump_469a
/*0x4696*/      movs r0, #5
/*0x4698*/      bx lr
            jump_469a:
/*0x469a*/      movs r0, #3
/*0x469c*/      bx lr

/*0x469e*/  .byte 0x00
/*0x469f*/  .byte 0x00

            data_46a0:
/*0x46a0*/  .word 0x20000644
            data_46a4:
/*0x46a4*/  .word 0x20001970


            .thumb_func
            call_46a8:
/*0x46a8*/      ldr r0, [pc, #0x18] /* data_46c4 */
/*0x46aa*/      ldrb r0, [r0, #0xc]
/*0x46ac*/      cmp r0, #7
/*0x46ae*/      bne jump_46c0
/*0x46b0*/      ldr r0, [pc, #0x14] /* data_46c8 */
/*0x46b2*/      movs r1, #8
/*0x46b4*/      ldr r2, [r0], #7
/*0x46b8*/      strb r1, [r2, #3]
/*0x46ba*/      movs r1, #0xd8
/*0x46bc*/      b.w mem_zero
            jump_46c0:
/*0x46c0*/      bx lr

/*0x46c2*/  .byte 0x00
/*0x46c3*/  .byte 0x00

            data_46c4:
/*0x46c4*/  .word 0x20000644
            data_46c8:
/*0x46c8*/  .word 0x200000ac


            .thumb_func
            call_46cc:
/*0x46cc*/      push {r4, lr}
/*0x46ce*/      cbz r0, jump_46f2
/*0x46d0*/      bl call_4ae0
/*0x46d4*/      cmp r0, #0
/*0x46d6*/      beq jump_4708
/*0x46d8*/      ldr r1, [pc, #0x30] /* data_470c */
/*0x46da*/      movs r0, #0
/*0x46dc*/      str r0, [r1, #4]
/*0x46de*/      strh r0, [r1, #8]
/*0x46e0*/      strb r0, [r1, #0xa]
/*0x46e2*/      ldrb r2, [r1, #1]
/*0x46e4*/      str r0, [r1]
/*0x46e6*/      lsls r2, r2, #0x19
/*0x46e8*/      bpl jump_46f2
/*0x46ea*/      ldrb r0, [r1, #1]
/*0x46ec*/      orr r0, r0, #0x40
/*0x46f0*/      strb r0, [r1, #1]
            jump_46f2:
/*0x46f2*/      bl call_6880
/*0x46f6*/      ldr r1, [pc, #0x18] /* data_4710 */
/*0x46f8*/      movs r0, #1
/*0x46fa*/      strb r0, [r1]
/*0x46fc*/      ldr r1, [pc, #0x14] /* data_4714 */
/*0x46fe*/      strb r0, [r1]
/*0x4700*/      ldr r1, [pc, #0x14] /* data_4718 */
/*0x4702*/      strb r0, [r1]
/*0x4704*/      ldr r1, [pc, #0x14] /* data_471c */
/*0x4706*/      strb r0, [r1]
            jump_4708:
/*0x4708*/      pop {r4, pc}

/*0x470a*/  .byte 0x00
/*0x470b*/  .byte 0x00

            data_470c:
/*0x470c*/  .word 0x20000034
            data_4710:
/*0x4710*/  .word 0x20000040
            data_4714:
/*0x4714*/  .word 0x20000043
            data_4718:
/*0x4718*/  .word 0x20000041
            data_471c:
/*0x471c*/  .word 0x20000042


            .thumb_func
            call_4720:
/*0x4720*/      movs r1, #0x38
/*0x4722*/      ldr r2, [pc, #0x18] /* data_473c */
/*0x4724*/      b jump_4730
            jump_4726:
/*0x4726*/      ldrb r3, [r2, r1]
/*0x4728*/      cmp r3, r0
/*0x472a*/      bne jump_4730
/*0x472c*/      uxtb r0, r1
/*0x472e*/      bx lr
            jump_4730:
/*0x4730*/      subs r1, r1, #1
/*0x4732*/      uxth r1, r1
/*0x4734*/      bhs jump_4726
/*0x4736*/      movs r0, #0
/*0x4738*/      bx lr

/*0x473a*/  .byte 0x00
/*0x473b*/  .byte 0x00

            data_473c:
/*0x473c*/  .word 0x2000065c


            .thumb_func
            call_4740:
/*0x4740*/      ldr r3, [pc, #0x2c] /* data_4770 */
/*0x4742*/      push {r4, lr}
/*0x4744*/      ldrb r2, [r3, r0]
/*0x4746*/      cbz r2, jump_4768
/*0x4748*/      cbz r1, jump_474c
/*0x474a*/      strb r2, [r1]
            jump_474c:
/*0x474c*/      ldr r2, [pc, #0x20] /* data_4770 */
/*0x474e*/      lsrs r1, r0, #5
/*0x4750*/      subs r2, #8
/*0x4752*/      and r4, r0, #0x1f
/*0x4756*/      ldr.w r1, [r2, r1, lsl #2]
/*0x475a*/      movs r2, #1
/*0x475c*/      lsls r2, r4
/*0x475e*/      tst r1, r2
/*0x4760*/      beq jump_4768
/*0x4762*/      ldrb r0, [r3, r0]
/*0x4764*/      cmp r0, #0x2f
/*0x4766*/      blo jump_476c
            jump_4768:
/*0x4768*/      movs r0, #1
/*0x476a*/      pop {r4, pc}
            jump_476c:
/*0x476c*/      movs r0, #0
/*0x476e*/      pop {r4, pc}

            data_4770:
/*0x4770*/  .word 0x2000065c

            jump_4774:
/*0x4774*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4778*/      mov r5, r1
/*0x477a*/      mov r4, r0
/*0x477c*/      movs r1, #0x38
/*0x477e*/      ldr r0, [pc, #0x40] /* data_47c0 */
/*0x4780*/      bl mem_zero
/*0x4784*/      ldr r2, [pc, #0x38] /* data_47c0 */
/*0x4786*/      movs r0, #0
/*0x4788*/      subs r2, #8
/*0x478a*/      ldr r6, [pc, #0x34] /* data_47c0 */
/*0x478c*/      str r0, [r2]
/*0x478e*/      movs r3, #1
/*0x4790*/      str r0, [r2, #4]
/*0x4792*/      b jump_47b6
            jump_4794:
/*0x4794*/      ldrb r1, [r4]
/*0x4796*/      ldrb r0, [r4, #1]
/*0x4798*/      strb r0, [r6, r1]
/*0x479a*/      ldrb r0, [r4, #2]
/*0x479c*/      cbz r0, jump_47b4
/*0x479e*/      ldrb r1, [r4]
/*0x47a0*/      lsrs r0, r1, #5
/*0x47a2*/      and r1, r1, #0x1f
/*0x47a6*/      ldr.w r7, [r2, r0, lsl #2]
/*0x47aa*/      lsl.w r1, r3, r1
/*0x47ae*/      orrs r7, r1
/*0x47b0*/      str.w r7, [r2, r0, lsl #2]
            jump_47b4:
/*0x47b4*/      adds r4, r4, #3
            jump_47b6:
/*0x47b6*/      subs r5, r5, #1
/*0x47b8*/      uxtb r5, r5
/*0x47ba*/      bhs jump_4794
/*0x47bc*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_47c0:
/*0x47c0*/  .word 0x2000065c


            .thumb_func
            call_47c4:
/*0x47c4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x47c8*/      lsrs r1, r0, #8
/*0x47ca*/      lsls r1, r1, #0x1f
/*0x47cc*/      beq jump_47d4
/*0x47ce*/      bl call_4f6c
/*0x47d2*/      b jump_4894
            jump_47d4:
/*0x47d4*/      uxtb r3, r0
/*0x47d6*/      lsrs r2, r0, #0x18
/*0x47d8*/      movs r4, #1
/*0x47da*/      cmp r3, #0xe8
/*0x47dc*/      bls jump_4808
/*0x47de*/      lsrs r0, r0, #0x18
/*0x47e0*/      ubfx r2, r0, #1, #1
/*0x47e4*/      cmp r3, #0xec
/*0x47e6*/      bhs jump_47f6
/*0x47e8*/      subs r3, #0xe9
/*0x47ea*/      uxtb r1, r3
/*0x47ec*/      ldr r0, [pc, #0xac] /* data_489c */
/*0x47ee*/      bl call_3fec
/*0x47f2*/      ldr r0, [pc, #0xac] /* data_48a0 */
/*0x47f4*/      b jump_4892
            jump_47f6:
/*0x47f6*/      cmp r3, #0xfd
/*0x47f8*/      bhi jump_4894
/*0x47fa*/      subs r3, #0xec
/*0x47fc*/      uxtb r1, r3
/*0x47fe*/      ldr r0, [pc, #0xa4] /* data_48a4 */
/*0x4800*/      bl call_3fec
/*0x4804*/      ldr r0, [pc, #0xa0] /* data_48a8 */
/*0x4806*/      b jump_4892
            jump_4808:
/*0x4808*/      and r1, r0, #7
/*0x480c*/      movs r6, #1
/*0x480e*/      sub.w ip, r3, #0xe0
/*0x4812*/      lsls r6, r1
/*0x4814*/      ldr r7, [pc, #0x94] /* data_48ac */
/*0x4816*/      ldr r5, [pc, #0x98] /* data_48b0 */
/*0x4818*/      cmp.w ip, #7
/*0x481c*/      bhi jump_4834
/*0x481e*/      mov r0, r5
/*0x4820*/      uxtb r1, r6
/*0x4822*/      ldrb r0, [r0]
/*0x4824*/      lsls r2, r2, #0x1e
/*0x4826*/      bpl jump_482c
/*0x4828*/      orrs r0, r1
/*0x482a*/      b jump_482e
            jump_482c:
/*0x482c*/      bics r0, r1
            jump_482e:
/*0x482e*/      strb r0, [r5]
            jump_4830:
/*0x4830*/      strb r4, [r7]
/*0x4832*/      b jump_4894
            jump_4834:
/*0x4834*/      movs r1, #0
            jump_4836:
/*0x4836*/      add.w ip, r5, r1
/*0x483a*/      ldrb.w ip, [ip, #2]
/*0x483e*/      cmp ip, r3
/*0x4840*/      bne jump_484e
/*0x4842*/      lsls r0, r2, #0x1e
/*0x4844*/      bmi jump_4830
/*0x4846*/      add r1, r5
/*0x4848*/      movs r0, #0
/*0x484a*/      strb r0, [r1, #2]
/*0x484c*/      b jump_4830
            jump_484e:
/*0x484e*/      adds r1, r1, #1
/*0x4850*/      uxtb r1, r1
/*0x4852*/      cmp r1, #6
/*0x4854*/      blo jump_4836
/*0x4856*/      lsls r1, r2, #0x1e
/*0x4858*/      bpl jump_4872
/*0x485a*/      movs r1, #0
            jump_485c:
/*0x485c*/      add.w ip, r5, r1
/*0x4860*/      ldrb.w ip, [ip, #2]
/*0x4864*/      cmp.w ip, #0
/*0x4868*/      beq jump_4886
/*0x486a*/      adds r1, r1, #1
/*0x486c*/      uxtb r1, r1
/*0x486e*/      cmp r1, #6
/*0x4870*/      blo jump_485c
            jump_4872:
/*0x4872*/      lsls r3, r2, #0x1e
/*0x4874*/      ldr r2, [pc, #0x3c] /* data_48b4 */
/*0x4876*/      ubfx r0, r0, #3, #5
/*0x487a*/      add r0, r2
/*0x487c*/      uxtb r1, r6
/*0x487e*/      ldrb r2, [r0, #2]
/*0x4880*/      bpl jump_488c
/*0x4882*/      orrs r2, r1
/*0x4884*/      b jump_488e
            jump_4886:
/*0x4886*/      adds r0, r5, r1
/*0x4888*/      strb r3, [r0, #2]
/*0x488a*/      b jump_4830
            jump_488c:
/*0x488c*/      bics r2, r1
            jump_488e:
/*0x488e*/      strb r2, [r0, #2]
/*0x4890*/      ldr r0, [pc, #0x24] /* data_48b8 */
            jump_4892:
/*0x4892*/      strb r4, [r0]
            jump_4894:
/*0x4894*/      movs r0, #1
/*0x4896*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x489a*/  .byte 0x00
/*0x489b*/  .byte 0x00

            data_489c:
/*0x489c*/  .word 0x20000049
            data_48a0:
/*0x48a0*/  .word 0x20000041
            data_48a4:
/*0x48a4*/  .word 0x20000055
            data_48a8:
/*0x48a8*/  .word 0x20000042
            data_48ac:
/*0x48ac*/  .word 0x20000040
            data_48b0:
/*0x48b0*/  .word 0x2000005c
            data_48b4:
/*0x48b4*/  .word 0x200006ac
            data_48b8:
/*0x48b8*/  .word 0x20000043


            .thumb_func
            call_48bc:
/*0x48bc*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x48c0*/      ldr r4, [pc, #0x16c] /* data_4a30 */
/*0x48c2*/      ldr r2, [pc, #0x170] /* data_4a34 */
/*0x48c4*/      lsrs r5, r0, #3
/*0x48c6*/      strb r0, [r4, #2]
/*0x48c8*/      ldrb r3, [r2, r0]
/*0x48ca*/      strb r3, [r4]
/*0x48cc*/      ldrb r2, [r4, #3]
/*0x48ce*/      and r6, r0, #7
/*0x48d2*/      bic r2, r2, #1
/*0x48d6*/      bfi r2, r1, #1, #1
/*0x48da*/      strb r2, [r4, #3]
/*0x48dc*/      mov r2, r4
/*0x48de*/      mov.w r8, #1
/*0x48e2*/      ldrb r2, [r2, #1]
/*0x48e4*/      cmp r3, #0xe8
/*0x48e6*/      beq jump_490a
/*0x48e8*/      lsl.w r7, r8, r6
/*0x48ec*/      movs r6, #0x1c
/*0x48ee*/      uxtb r7, r7
/*0x48f0*/      cmp.w r6, r3, lsr #3
/*0x48f4*/      bne jump_4928
/*0x48f6*/      ands r6, r3, #3
/*0x48fa*/      beq jump_4910
/*0x48fc*/      cmp r6, #1
/*0x48fe*/      beq jump_4916
/*0x4900*/      cmp r6, #2
/*0x4902*/      beq jump_491c
/*0x4904*/      cmp r6, #3
/*0x4906*/      bne jump_4932
/*0x4908*/      b jump_4922
            jump_490a:
/*0x490a*/      bfi r2, r1, #6, #1
/*0x490e*/      b jump_4984
            jump_4910:
/*0x4910*/      bfi r2, r1, #2, #1
/*0x4914*/      b jump_4930
            jump_4916:
/*0x4916*/      bfi r2, r1, #4, #1
/*0x491a*/      b jump_4930
            jump_491c:
/*0x491c*/      bfi r2, r1, #3, #1
/*0x4920*/      b jump_4930
            jump_4922:
/*0x4922*/      bfi r2, r1, #5, #1
/*0x4926*/      b jump_4930
            jump_4928:
/*0x4928*/      cmp r3, #0x39
/*0x492a*/      bne jump_4932
/*0x492c*/      bfi r2, r1, #7, #1
            jump_4930:
/*0x4930*/      strb r2, [r4, #1]
            jump_4932:
/*0x4932*/      ldr r6, [pc, #0xfc] /* data_4a30 */
/*0x4934*/      adds r6, r6, #4
/*0x4936*/      cbz r1, jump_4970
/*0x4938*/      ldrb r2, [r4, #1]
/*0x493a*/      lsls.w ip, r2, #0x19
/*0x493e*/      bpl jump_4984
/*0x4940*/      ldrb.w ip, [r6, r5]
/*0x4944*/      orr.w ip, ip, r7
/*0x4948*/      strb.w ip, [r6, r5]
/*0x494c*/      b jump_497c
            jump_494e:
/*0x494e*/      ldr r5, [pc, #0xe8] /* data_4a38 */
/*0x4950*/      strb r2, [r4, #1]
/*0x4952*/      ldrb r2, [r5, #2]
/*0x4954*/      cbz r2, jump_4990
/*0x4956*/      cbz r1, jump_4990
/*0x4958*/      movs r1, #0
/*0x495a*/      strb r1, [r5, #2]
/*0x495c*/      mov r1, sp
/*0x495e*/      bl call_5e10
/*0x4962*/      ldrb r0, [r5, #6]
/*0x4964*/      cmp r0, #0
/*0x4966*/      mov r0, sp
/*0x4968*/      beq jump_498a
/*0x496a*/      bl call_39bc
/*0x496e*/      b jump_49c6
            jump_4970:
/*0x4970*/      ldrb r2, [r6, r5]
/*0x4972*/      tst r2, r7
/*0x4974*/      beq jump_4982
/*0x4976*/      bics r2, r7
/*0x4978*/      strb r2, [r6, r5]
/*0x497a*/      ldrb r2, [r4, #1]
            jump_497c:
/*0x497c*/      orr r2, r2, #1
/*0x4980*/      b jump_494e
            jump_4982:
/*0x4982*/      ldrb r2, [r4, #1]
            jump_4984:
/*0x4984*/      bic r2, r2, #1
/*0x4988*/      b jump_494e
            jump_498a:
/*0x498a*/      bl call_5314
/*0x498e*/      b jump_49c6
            jump_4990:
/*0x4990*/      cbz r3, jump_49c6
/*0x4992*/      ldr r0, [r4]
/*0x4994*/      bl call_56b4
/*0x4998*/      bl call_5044
/*0x499c*/      cbz r0, jump_49b0
/*0x499e*/      ldrb r0, [r4]
/*0x49a0*/      cbz r0, jump_49c6
            jump_49a2:
/*0x49a2*/      bl call_5298
/*0x49a6*/      ldr r0, [r4]
/*0x49a8*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x49ac*/      b.w call_47c4
            jump_49b0:
/*0x49b0*/      ldrb r0, [r5, #6]
/*0x49b2*/      cbz r0, jump_49ba
/*0x49b4*/      bl call_38e4
/*0x49b8*/      b jump_49c6
            jump_49ba:
/*0x49ba*/      ldrb r0, [r4]
/*0x49bc*/      cmp r0, #0xe8
/*0x49be*/      beq jump_49c6
/*0x49c0*/      bl call_5b34
/*0x49c4*/      cbz r0, jump_49cc
            jump_49c6:
/*0x49c6*/      movs r0, #1
/*0x49c8*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_49cc:
/*0x49cc*/      ldrb r1, [r4, #1]
/*0x49ce*/      lsls r0, r1, #0x1f
/*0x49d0*/      ldrb r0, [r4, #3]
/*0x49d2*/      lsl.w r0, r0, #0x1f
/*0x49d6*/      beq jump_4a1a
/*0x49d8*/      cmp r0, #0
/*0x49da*/      bne jump_49a2
/*0x49dc*/      ldrb r0, [r4, #2]
/*0x49de*/      ldr r2, [pc, #0x5c] /* data_4a3c */
/*0x49e0*/      ldrb r2, [r2, r0]
/*0x49e2*/      cbz r2, jump_4a0a
/*0x49e4*/      ldr r5, [pc, #0x54] /* data_4a3c */
/*0x49e6*/      lsrs r3, r0, #5
/*0x49e8*/      subs r5, #8
/*0x49ea*/      ldr.w r3, [r5, r3, lsl #2]
/*0x49ee*/      and r5, r0, #0x1f
/*0x49f2*/      lsl.w r0, r8, r5
/*0x49f6*/      tst r3, r0
/*0x49f8*/      beq jump_4a00
/*0x49fa*/      orr r0, r1, #1
/*0x49fe*/      b jump_4a04
            jump_4a00:
/*0x4a00*/      bic r0, r1, #1
            jump_4a04:
/*0x4a04*/      strb r0, [r4, #1]
/*0x4a06*/      strb r2, [r4]
/*0x4a08*/      b jump_49a2
            jump_4a0a:
/*0x4a0a*/      bl call_5b00
/*0x4a0e*/      cbnz r0, jump_4a26
/*0x4a10*/      ldrb r0, [r4, #1]
/*0x4a12*/      bic r0, r0, #1
/*0x4a16*/      strb r0, [r4, #1]
/*0x4a18*/      b jump_49a2
            jump_4a1a:
/*0x4a1a*/      cmp r0, #0
/*0x4a1c*/      bne jump_49a2
/*0x4a1e*/      bl call_5b00
/*0x4a22*/      cmp r0, #0
/*0x4a24*/      beq jump_49a2
            jump_4a26:
/*0x4a26*/      ldrb r0, [r4, #3]
/*0x4a28*/      orr r0, r0, #1
/*0x4a2c*/      strb r0, [r4, #3]
/*0x4a2e*/      b jump_49a2

            data_4a30:
/*0x4a30*/  .word 0x20000034
            data_4a34:
/*0x4a34*/  .word 0x200002de
            data_4a38:
/*0x4a38*/  .word 0x20000644
            data_4a3c:
/*0x4a3c*/  .word 0x2000065c


            .thumb_func
            call_4a40:
/*0x4a40*/      ldrh r2, [r1]
/*0x4a42*/      bfi r2, r0, #0, #9
/*0x4a46*/      strh r2, [r1]
/*0x4a48*/      bx lr

            .thumb_func
            call_4a4a:
/*0x4a4a*/      ubfx r0, r0, #0, #9
/*0x4a4e*/      bx lr

            .thumb_func
            call_4a50:
/*0x4a50*/      push {r4, r5, r6, r7, lr}
/*0x4a52*/      movs r5, #0
/*0x4a54*/      b jump_4a76
            jump_4a56:
/*0x4a56*/      movs r4, #0
/*0x4a58*/      b jump_4a66
            jump_4a5a:
/*0x4a5a*/      ldrb r6, [r0, r5]
/*0x4a5c*/      ldrb r7, [r1, r4]
/*0x4a5e*/      cmp r6, r7
/*0x4a60*/      beq jump_4a6a
/*0x4a62*/      adds r4, r4, #1
/*0x4a64*/      uxtb r4, r4
            jump_4a66:
/*0x4a66*/      cmp r4, r3
/*0x4a68*/      blo jump_4a5a
            jump_4a6a:
/*0x4a6a*/      cmp r4, r3
/*0x4a6c*/      bne jump_4a72
/*0x4a6e*/      movs r0, #0
/*0x4a70*/      pop {r4, r5, r6, r7, pc}
            jump_4a72:
/*0x4a72*/      adds r5, r5, #1
/*0x4a74*/      uxtb r5, r5
            jump_4a76:
/*0x4a76*/      cmp r5, r2
/*0x4a78*/      blo jump_4a56
/*0x4a7a*/      movs r0, #1
/*0x4a7c*/      pop {r4, r5, r6, r7, pc}

/*0x4a7e*/  .byte 0x00
/*0x4a7f*/  .byte 0x00


            .thumb_func
            call_4a80:
/*0x4a80*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x4a84*/      movs r3, #7
/*0x4a86*/      movs r4, #0
/*0x4a88*/      ldr.w sb, [pc, #0x4c] /* data_4ad8 */
/*0x4a8c*/      mov.w ip, #1
/*0x4a90*/      ldr.w r8, [pc, #0x48] /* data_4adc */
/*0x4a94*/      b jump_4ac6
            jump_4a96:
/*0x4a96*/      ldrb.w r5, [sb, r3]
/*0x4a9a*/      cmp r5, #0xff
/*0x4a9c*/      beq jump_4ac6
/*0x4a9e*/      movs r2, #8
/*0x4aa0*/      add.w r7, r8, r3, lsl #3
/*0x4aa4*/      b jump_4ac0
            jump_4aa6:
/*0x4aa6*/      lsl.w r6, ip, r2
/*0x4aaa*/      uxtb r6, r6
/*0x4aac*/      tst r5, r6
/*0x4aae*/      bne jump_4ac0
/*0x4ab0*/      cbz r1, jump_4ad2
/*0x4ab2*/      subs r1, r1, #1
/*0x4ab4*/      ldrb r6, [r7, r2]
/*0x4ab6*/      adds r4, r4, #1
/*0x4ab8*/      strb r6, [r0], #1
/*0x4abc*/      uxtb r1, r1
/*0x4abe*/      uxtb r4, r4
            jump_4ac0:
/*0x4ac0*/      subs r2, r2, #1
/*0x4ac2*/      uxtb r2, r2
/*0x4ac4*/      bhs jump_4aa6
            jump_4ac6:
/*0x4ac6*/      subs r3, r3, #1
/*0x4ac8*/      uxtb r3, r3
/*0x4aca*/      bhs jump_4a96
/*0x4acc*/      mov r0, r4
            jump_4ace:
/*0x4ace*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_4ad2:
/*0x4ad2*/      movs r0, #0xff
/*0x4ad4*/      b jump_4ace

/*0x4ad6*/  .byte 0x00
/*0x4ad7*/  .byte 0x00

            data_4ad8:
/*0x4ad8*/  .word 0x200001d0
            data_4adc:
/*0x4adc*/  .word 0x200002de


            .thumb_func
            call_4ae0:
/*0x4ae0*/      push {r4, lr}
/*0x4ae2*/      bl call_62f4
/*0x4ae6*/      cmp r0, #0
/*0x4ae8*/      beq jump_4afa
/*0x4aea*/      movs r1, #7
/*0x4aec*/      ldr r0, [pc, #0x18] /* data_4b08 */
/*0x4aee*/      b jump_4afc
            jump_4af0:
/*0x4af0*/      ldrb r2, [r0, #-0x1]!
/*0x4af4*/      cmp r2, #0xff
/*0x4af6*/      beq jump_4afc
/*0x4af8*/      movs r0, #0
            jump_4afa:
/*0x4afa*/      pop {r4, pc}
            jump_4afc:
/*0x4afc*/      subs r1, r1, #1
/*0x4afe*/      uxtb r1, r1
/*0x4b00*/      bhs jump_4af0
/*0x4b02*/      movs r0, #1
/*0x4b04*/      pop {r4, pc}

/*0x4b06*/  .byte 0x00
/*0x4b07*/  .byte 0x00

            data_4b08:
/*0x4b08*/  .word 0x200001d7


            .thumb_func
            call_4b0c:
/*0x4b0c*/      ldr r1, [pc, #4] /* data_4b14 */
/*0x4b0e*/      movs r0, #1
/*0x4b10*/      strb r0, [r1, #7]
/*0x4b12*/      bx lr

            data_4b14:
/*0x4b14*/  .word 0x20000644


            .thumb_func
            call_4b18:
/*0x4b18*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x4b1c*/      ldr r5, [pc, #0x154] /* data_4c74 */
/*0x4b1e*/      movs r1, #0x19
/*0x4b20*/      movs r0, #0
/*0x4b22*/      strb r1, [r5, #1]
/*0x4b24*/      movs r1, #9
/*0x4b26*/      ldr r2, [pc, #0x150] /* data_4c78 */
/*0x4b28*/      ldr r3, [pc, #0x150] /* data_4c7c */
/*0x4b2a*/      strb r1, [r5, #2]
            jump_4b2c:
/*0x4b2c*/      adds r1, r2, r0
/*0x4b2e*/      ldrb.w r1, [r1, #0xe8]
/*0x4b32*/      cmp r1, #0x19
/*0x4b34*/      beq jump_4b3c
/*0x4b36*/      cmp r1, #9
/*0x4b38*/      beq jump_4b42
/*0x4b3a*/      b jump_4b46
            jump_4b3c:
/*0x4b3c*/      ldrb r1, [r3, r0]
/*0x4b3e*/      strb r1, [r5, #1]
/*0x4b40*/      b jump_4b46
            jump_4b42:
/*0x4b42*/      ldrb r1, [r3, r0]
/*0x4b44*/      strb r1, [r5, #2]
            jump_4b46:
/*0x4b46*/      adds r0, r0, #1
/*0x4b48*/      uxtb r0, r0
/*0x4b4a*/      cmp r0, #0xa
/*0x4b4c*/      blo jump_4b2c
/*0x4b4e*/      ldr r4, [pc, #0x130] /* data_4c80 */
/*0x4b50*/      ldrb r0, [r4, #0xc]
/*0x4b52*/      cbz r0, jump_4b58
/*0x4b54*/      cmp r0, #7
/*0x4b56*/      bne jump_4c3a
            jump_4b58:
/*0x4b58*/      ldr r6, [pc, #0x128] /* data_4c84 */
/*0x4b5a*/      ldrh r1, [r6]
/*0x4b5c*/      sub.w r0, r1, #0xff00
/*0x4b60*/      subs r0, #0xff
/*0x4b62*/      beq jump_4c3a
/*0x4b64*/      mov.w r8, #0
/*0x4b68*/      movs r1, #2
/*0x4b6a*/      add r0, sp, #4
/*0x4b6c*/      str.w r8, [sp, #4]
/*0x4b70*/      bl call_4a80
/*0x4b74*/      movs r7, #1
/*0x4b76*/      movw sb, #0x1770
/*0x4b7a*/      movw sl, #0x2710
/*0x4b7e*/      cmp r0, #2
/*0x4b80*/      beq jump_4b90
/*0x4b82*/      movs r1, #3
/*0x4b84*/      add r0, sp, #4
/*0x4b86*/      bl call_4a80
/*0x4b8a*/      cmp r0, #3
/*0x4b8c*/      beq jump_4c3c
/*0x4b8e*/      b jump_4c5e
            jump_4b90:
/*0x4b90*/      movs r3, #0x12
/*0x4b92*/      movs r2, #0x19
/*0x4b94*/      movs r1, #2
/*0x4b96*/      add r0, sp, #4
/*0x4b98*/      str.w r8, [sp]
/*0x4b9c*/      bl call_7b00
/*0x4ba0*/      cbz r0, jump_4bac
/*0x4ba2*/      ldrh r1, [r6]
/*0x4ba4*/      cmp r1, sl
/*0x4ba6*/      bls jump_4bca
/*0x4ba8*/      strb r7, [r4, #3]
/*0x4baa*/      b jump_4c5e
            jump_4bac:
/*0x4bac*/      movs r3, #0x2e
/*0x4bae*/      movs r2, #0x10
/*0x4bb0*/      movs r1, #2
/*0x4bb2*/      add r0, sp, #4
/*0x4bb4*/      str.w r8, [sp]
/*0x4bb8*/      bl call_7b00
/*0x4bbc*/      cbz r0, jump_4bce
/*0x4bbe*/      ldrh r1, [r6]
/*0x4bc0*/      cmp r1, sl
/*0x4bc2*/      bls jump_4bca
/*0x4bc4*/      movs r0, #2
/*0x4bc6*/      strb r0, [r4, #3]
/*0x4bc8*/      b jump_4c5e
            jump_4bca:
/*0x4bca*/      strb r7, [r4, #0xa]
/*0x4bcc*/      b jump_4c62
            jump_4bce:
/*0x4bce*/      str.w r8, [sp]
/*0x4bd2*/      movs r3, #6
/*0x4bd4*/      ldrb r2, [r5, #1]
/*0x4bd6*/      movs r1, #2
/*0x4bd8*/      add r0, sp, #4
/*0x4bda*/      bl call_7b00
/*0x4bde*/      ldr.w fp, [pc, #0x94] /* data_4c74 */
/*0x4be2*/      add.w fp, fp, #3
/*0x4be6*/      cbz r0, jump_4c00
/*0x4be8*/      ldr r0, [pc, #0x9c] /* data_4c88 */
/*0x4bea*/      ldrb r0, [r0, #2]
/*0x4bec*/      cbz r0, jump_4c38
/*0x4bee*/      ldrh r1, [r6]
/*0x4bf0*/      cmp r1, sb
/*0x4bf2*/      bls jump_4c62
/*0x4bf4*/      strh.w r8, [r6]
/*0x4bf8*/      mov r0, fp
/*0x4bfa*/      strb.w r8, [fp, #1]
/*0x4bfe*/      b jump_4c28
            jump_4c00:
/*0x4c00*/      str.w r8, [sp]
/*0x4c04*/      movs r3, #6
/*0x4c06*/      ldrb r2, [r5, #2]
/*0x4c08*/      movs r1, #2
/*0x4c0a*/      add r0, sp, #4
/*0x4c0c*/      bl call_7b00
/*0x4c10*/      cbz r0, jump_4c5e
/*0x4c12*/      ldr r0, [pc, #0x74] /* data_4c88 */
/*0x4c14*/      ldrb r0, [r0, #2]
/*0x4c16*/      cbz r0, jump_4c38
/*0x4c18*/      ldrh r1, [r6]
/*0x4c1a*/      cmp r1, sb
/*0x4c1c*/      bls jump_4c62
/*0x4c1e*/      strh.w r8, [r6]
/*0x4c22*/      mov r0, fp
/*0x4c24*/      strb.w r7, [fp, #1]
            jump_4c28:
/*0x4c28*/      ldrb r1, [r0]
/*0x4c2a*/      movw r0, #0x7530
/*0x4c2e*/      orr r1, r1, #1
/*0x4c32*/      strb.w r1, [fp]
/*0x4c36*/      strh r0, [r5, #6]
            jump_4c38:
/*0x4c38*/      b jump_4c62
            jump_4c3a:
/*0x4c3a*/      b jump_4c6e
            jump_4c3c:
/*0x4c3c*/      movs r0, #0x13
/*0x4c3e*/      str r0, [sp]
/*0x4c40*/      movs r3, #9
/*0x4c42*/      movs r2, #0x10
/*0x4c44*/      movs r1, #3
/*0x4c46*/      add r0, sp, #4
/*0x4c48*/      bl call_7b00
/*0x4c4c*/      cbz r0, jump_4c62
/*0x4c4e*/      ldrh r1, [r6]
/*0x4c50*/      cmp r1, sb
/*0x4c52*/      bls jump_4c62
/*0x4c54*/      strh.w r8, [r6]
/*0x4c58*/      strb r7, [r4, #0xc]
/*0x4c5a*/      strb r7, [r4]
/*0x4c5c*/      b jump_4c62
            jump_4c5e:
/*0x4c5e*/      strb.w r8, [r4, #0xa]
            jump_4c62:
/*0x4c62*/      ldrh r1, [r6]
/*0x4c64*/      cmp r1, sl
/*0x4c66*/      bls jump_4c6e
/*0x4c68*/      movw r0, #0xffff
/*0x4c6c*/      strh r0, [r6]
            jump_4c6e:
/*0x4c6e*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

/*0x4c72*/  .byte 0x00
/*0x4c73*/  .byte 0x00

            data_4c74:
/*0x4c74*/  .word 0x20000000
            data_4c78:
/*0x4c78*/  .word 0x20000708
            data_4c7c:
/*0x4c7c*/  .word 0x00007d34
            data_4c80:
/*0x4c80*/  .word 0x20000644
            data_4c84:
/*0x4c84*/  .word 0x20000024
            data_4c88:
/*0x4c88*/  .word 0x20000068


            .thumb_func
            call_4c8c:
/*0x4c8c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4c90*/      ldr r0, [pc, #0x230] /* data_4ec4 */
/*0x4c92*/      ldr.w ip, [pc, #0x234] /* data_4ec8 */
/*0x4c96*/      movs r5, #0
/*0x4c98*/      ldrb r0, [r0, #0xc]
/*0x4c9a*/      ldrb.w r1, [ip, #4]
/*0x4c9e*/      cbz r0, jump_4cc6
/*0x4ca0*/      ldrb.w r2, [ip, #6]
/*0x4ca4*/      adds r2, r2, #1
/*0x4ca6*/      uxtb r2, r2
/*0x4ca8*/      strb.w r2, [ip, #6]
/*0x4cac*/      cmp r2, #3
/*0x4cae*/      bls jump_4d52
/*0x4cb0*/      strb.w r5, [ip, #6]
/*0x4cb4*/      cmp r0, #6
            jump_4cb6:
/*0x4cb6*/      bne jump_4d52
/*0x4cb8*/      movs r0, #0x18
/*0x4cba*/      adds r1, r1, #1
/*0x4cbc*/      udiv r2, r1, r0
/*0x4cc0*/      mls r0, r0, r2, r1
/*0x4cc4*/      b jump_4d56
            jump_4cc6:
/*0x4cc6*/      ldr r0, [pc, #0x204] /* data_4ecc */
/*0x4cc8*/      ldr r2, [pc, #0x1fc] /* data_4ec8 */
/*0x4cca*/      ldr r7, [pc, #0x204] /* data_4ed0 */
/*0x4ccc*/      ldrb r0, [r0, #3]
/*0x4cce*/      ldr r3, [r2]
/*0x4cd0*/      add.w r4, r7, #0xe
/*0x4cd4*/      add.w r6, r2, #0xdb
/*0x4cd8*/      mov.w sb, #1
/*0x4cdc*/      cmp r0, #3
/*0x4cde*/      bhi jump_4d9c
/*0x4ce0*/      ldrb r2, [r7, r0]
/*0x4ce2*/      cmp r0, #1
/*0x4ce4*/      add.w r2, r2, r2, lsl #1
/*0x4ce8*/      add.w r2, r4, r2, lsl #1
/*0x4cec*/      ldrb r4, [r3, #4]
/*0x4cee*/      and r4, r4, #0xf
/*0x4cf2*/      ldrb r4, [r2, r4]
/*0x4cf4*/      beq jump_4d00
/*0x4cf6*/      cmp r0, #2
/*0x4cf8*/      beq jump_4d54
/*0x4cfa*/      cmp r0, #3
/*0x4cfc*/      bne jump_4cb6
/*0x4cfe*/      b jump_4d5c
            jump_4d00:
/*0x4d00*/      movs r1, #3
/*0x4d02*/      add.w r0, ip, #7
/*0x4d06*/      adds r3, r3, #3
/*0x4d08*/      b jump_4d4c
            jump_4d0a:
/*0x4d0a*/      lsl.w r2, sb, r1
/*0x4d0e*/      ldrb.w r6, [ip, #7]
/*0x4d12*/      uxtb r2, r2
/*0x4d14*/      subs r3, r3, #1
/*0x4d16*/      tst r6, r2
/*0x4d18*/      ldrb r6, [r0, #-0x1]!
/*0x4d1c*/      beq jump_4d30
/*0x4d1e*/      cmp r6, r4
/*0x4d20*/      bhi jump_4d2c
/*0x4d22*/      strb r5, [r0]
/*0x4d24*/      ldrb.w r6, [ip, #7]
/*0x4d28*/      bics r6, r2
/*0x4d2a*/      b jump_4d42
            jump_4d2c:
/*0x4d2c*/      subs r2, r6, r4
/*0x4d2e*/      b jump_4d4a
            jump_4d30:
/*0x4d30*/      ldrb r7, [r3]
/*0x4d32*/      sub.w r8, r7, r4
/*0x4d36*/      cmp r6, r8
/*0x4d38*/      blt jump_4d48
/*0x4d3a*/      strb r7, [r0]
/*0x4d3c*/      ldrb.w r6, [ip, #7]
/*0x4d40*/      orrs r6, r2
            jump_4d42:
/*0x4d42*/      strb.w r6, [ip, #7]
/*0x4d46*/      b jump_4d4c
            jump_4d48:
/*0x4d48*/      adds r2, r6, r4
            jump_4d4a:
/*0x4d4a*/      strb r2, [r0]
            jump_4d4c:
/*0x4d4c*/      subs r1, r1, #1
/*0x4d4e*/      uxtb r1, r1
/*0x4d50*/      bhs jump_4d0a
            jump_4d52:
/*0x4d52*/      b jump_4eba
            jump_4d54:
/*0x4d54*/      adds r0, r1, r4
            jump_4d56:
/*0x4d56*/      strb.w r0, [ip, #4]
/*0x4d5a*/      b jump_4eba
            jump_4d5c:
/*0x4d5c*/      movs r7, #0x48
/*0x4d5e*/      b jump_4d94
            jump_4d60:
/*0x4d60*/      bl rand
/*0x4d64*/      sdiv r1, r0, r4
/*0x4d68*/      mls r0, r4, r1, r0
/*0x4d6c*/      cbz r0, jump_4d72
/*0x4d6e*/      movs r0, #3
/*0x4d70*/      b jump_4d8e
            jump_4d72:
/*0x4d72*/      subs r0, r6, #2
/*0x4d74*/      movs r1, #0
/*0x4d76*/      bl call_7124
/*0x4d7a*/      subs r6, r6, #3
/*0x4d7c*/      b jump_4d94
            jump_4d7e:
/*0x4d7e*/      ldrb r1, [r6]
/*0x4d80*/      cmp r1, #2
/*0x4d82*/      bhi jump_4d88
/*0x4d84*/      strb r5, [r6]
/*0x4d86*/      b jump_4d8c
            jump_4d88:
/*0x4d88*/      subs r1, r1, #2
/*0x4d8a*/      strb r1, [r6]
            jump_4d8c:
/*0x4d8c*/      subs r6, r6, #1
            jump_4d8e:
/*0x4d8e*/      subs r0, r0, #1
/*0x4d90*/      uxtb r0, r0
/*0x4d92*/      bhs jump_4d7e
            jump_4d94:
/*0x4d94*/      subs r7, r7, #1
/*0x4d96*/      uxtb r7, r7
/*0x4d98*/      bhs jump_4d60
/*0x4d9a*/      b jump_4eba
            jump_4d9c:
/*0x4d9c*/      cmp r0, #7
/*0x4d9e*/      bls jump_4e18
/*0x4da0*/      ldrb r1, [r7, r0]
/*0x4da2*/      ldrb r2, [r3, #4]
/*0x4da4*/      add.w r1, r1, r1, lsl #1
/*0x4da8*/      add.w r1, r4, r1, lsl #1
/*0x4dac*/      and r2, r2, #0xf
/*0x4db0*/      bic r0, r0, #1
/*0x4db4*/      ldrb r2, [r1, r2]
/*0x4db6*/      cmp r0, #8
/*0x4db8*/      beq jump_4dc4
/*0x4dba*/      cmp r0, #0xa
/*0x4dbc*/      beq jump_4e1a
/*0x4dbe*/      cmp r0, #0xc
/*0x4dc0*/      bne jump_4eba
/*0x4dc2*/      b jump_4e78
            jump_4dc4:
/*0x4dc4*/      movs r0, #0x48
/*0x4dc6*/      b jump_4e12
            jump_4dc8:
/*0x4dc8*/      ldrb r1, [r6], #-1
/*0x4dcc*/      cbz r1, jump_4dd2
/*0x4dce*/      subs r6, r6, #2
/*0x4dd0*/      b jump_4de2
            jump_4dd2:
/*0x4dd2*/      ldrb r1, [r6], #-1
/*0x4dd6*/      cbz r1, jump_4ddc
/*0x4dd8*/      subs r6, r6, #1
/*0x4dda*/      b jump_4de2
            jump_4ddc:
/*0x4ddc*/      ldrb r1, [r6], #-1
/*0x4de0*/      cbz r1, jump_4e12
            jump_4de2:
/*0x4de2*/      ldr r1, [pc, #0xf0] /* data_4ed4 */
/*0x4de4*/      and r4, r0, #7
/*0x4de8*/      add.w r1, r1, r0, lsr #3
/*0x4dec*/      ldrb r3, [r1]
/*0x4dee*/      lsl.w r1, sb, r4
/*0x4df2*/      tst r3, r1
/*0x4df4*/      beq jump_4e12
/*0x4df6*/      movs r1, #3
/*0x4df8*/      b jump_4e0a
            jump_4dfa:
/*0x4dfa*/      ldrb r3, [r6, #1]!
/*0x4dfe*/      cmp r3, r2
/*0x4e00*/      bhi jump_4e06
/*0x4e02*/      strb r5, [r6]
/*0x4e04*/      b jump_4e0a
            jump_4e06:
/*0x4e06*/      subs r3, r3, r2
/*0x4e08*/      strb r3, [r6]
            jump_4e0a:
/*0x4e0a*/      subs r1, r1, #1
/*0x4e0c*/      uxtb r1, r1
/*0x4e0e*/      bhs jump_4dfa
/*0x4e10*/      subs r6, r6, #3
            jump_4e12:
/*0x4e12*/      subs r0, r0, #1
/*0x4e14*/      uxtb r0, r0
/*0x4e16*/      bhs jump_4dc8
            jump_4e18:
/*0x4e18*/      b jump_4eba
            jump_4e1a:
/*0x4e1a*/      ldrb.w r0, [ip, #0x4c]
/*0x4e1e*/      adds r0, r0, #1
/*0x4e20*/      uxtb r0, r0
/*0x4e22*/      strb.w r0, [ip, #0x4c]
/*0x4e26*/      cmp r0, r2
/*0x4e28*/      blo jump_4eba
/*0x4e2a*/      strb.w r5, [ip, #0x4c]
/*0x4e2e*/      movs r0, #1
            jump_4e30:
/*0x4e30*/      add.w r1, r0, r0, lsl #1
/*0x4e34*/      add.w r1, ip, r1, lsl #1
/*0x4e38*/      adds r0, r0, #1
/*0x4e3a*/      ldrh r2, [r1, #4]
/*0x4e3c*/      strh r2, [r1, #-0x2]
/*0x4e40*/      ldrb r2, [r1, #6]
/*0x4e42*/      uxtb r0, r0
/*0x4e44*/      strb r2, [r1]
/*0x4e46*/      cmp r0, #0xc
/*0x4e48*/      blo jump_4e30
/*0x4e4a*/      strh.w r5, [ip, #0x46]
/*0x4e4e*/      strb.w r5, [ip, #0x48]
/*0x4e52*/      movs r0, #0xc
/*0x4e54*/      b jump_4e68
            jump_4e56:
/*0x4e56*/      add.w r1, r0, r0, lsl #1
/*0x4e5a*/      add.w r1, ip, r1, lsl #1
/*0x4e5e*/      ldrh r2, [r1, #1]!
/*0x4e62*/      strh r2, [r1, #6]
/*0x4e64*/      ldrb r2, [r1, #2]
/*0x4e66*/      strb r2, [r1, #8]
            jump_4e68:
/*0x4e68*/      subs r0, r0, #1
/*0x4e6a*/      uxtb r0, r0
/*0x4e6c*/      bhs jump_4e56
/*0x4e6e*/      strh.w r5, [ip, #7]
/*0x4e72*/      strb.w r5, [ip, #9]
/*0x4e76*/      b jump_4eba
            jump_4e78:
/*0x4e78*/      ldrb.w r0, [ip, #0x22]
/*0x4e7c*/      adds r0, r0, #1
/*0x4e7e*/      uxtb r0, r0
/*0x4e80*/      strb.w r0, [ip, #0x22]
/*0x4e84*/      cmp r0, r2
/*0x4e86*/      blo jump_4eba
/*0x4e88*/      ldr r0, [pc, #0x3c] /* data_4ec8 */
/*0x4e8a*/      strb.w r5, [ip, #0x22]
/*0x4e8e*/      adds r0, #0x22
/*0x4e90*/      movs r2, #4
/*0x4e92*/      b jump_4eb4
            jump_4e94:
/*0x4e94*/      ldrsb r1, [r0, #-0x1]
/*0x4e98*/      subs r0, r0, #5
/*0x4e9a*/      cbz r1, jump_4eb4
/*0x4e9c*/      adds r1, r1, #1
/*0x4e9e*/      sxtb r1, r1
/*0x4ea0*/      strb r1, [r0, #4]
/*0x4ea2*/      ldrb r3, [r0, #3]
/*0x4ea4*/      adds r4, r1, r3
/*0x4ea6*/      subs r4, #0xa
/*0x4ea8*/      cmp r4, #0xd
/*0x4eaa*/      ble jump_4eb4
/*0x4eac*/      subs r1, r3, r1
/*0x4eae*/      adds r1, #0xa
/*0x4eb0*/      bpl jump_4eb4
/*0x4eb2*/      strb r5, [r0, #4]
            jump_4eb4:
/*0x4eb4*/      subs r2, r2, #1
/*0x4eb6*/      uxtb r2, r2
/*0x4eb8*/      bhs jump_4e94
            jump_4eba:
/*0x4eba*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4ebe*/      b.w call_57b4

/*0x4ec2*/  .byte 0x00
/*0x4ec3*/  .byte 0x00

            data_4ec4:
/*0x4ec4*/  .word 0x20000644
            data_4ec8:
/*0x4ec8*/  .word 0x200000ac
            data_4ecc:
/*0x4ecc*/  .word 0x20000708
            data_4ed0:
/*0x4ed0*/  .word 0x00007dc9
            data_4ed4:
/*0x4ed4*/  .word 0x200001d0


            .thumb_func
            call_4ed8:
/*0x4ed8*/      ldr r2, [pc, #0x38] /* data_4f14 */
/*0x4eda*/      movs r0, #0
/*0x4edc*/      ldrb r1, [r2, #0xb]
/*0x4ede*/      cbz r1, jump_4ee4
/*0x4ee0*/      movs r0, #1
/*0x4ee2*/      bx lr
            jump_4ee4:
/*0x4ee4*/      ldr r1, [pc, #0x30] /* data_4f18 */
/*0x4ee6*/      ldrb r3, [r1]
/*0x4ee8*/      cmp r3, #0xcf
/*0x4eea*/      beq jump_4ef6
/*0x4eec*/      ldrb r3, [r1, #1]
/*0x4eee*/      lsls r3, r3, #0x1f
/*0x4ef0*/      beq jump_4efa
/*0x4ef2*/      movs r0, #5
/*0x4ef4*/      bx lr
            jump_4ef6:
/*0x4ef6*/      movs r0, #2
/*0x4ef8*/      bx lr
            jump_4efa:
/*0x4efa*/      ldr r3, [pc, #0x20] /* data_4f1c */
/*0x4efc*/      ldrb r1, [r1, #2]
/*0x4efe*/      ldrb.w r3, [r3, #0xea]
/*0x4f02*/      cmp r1, r3
/*0x4f04*/      bne jump_4f0a
/*0x4f06*/      movs r0, #3
            jump_4f08:
/*0x4f08*/      bx lr
            jump_4f0a:
/*0x4f0a*/      ldrb r1, [r2, #8]
/*0x4f0c*/      cmp r1, #0
/*0x4f0e*/      beq jump_4f08
/*0x4f10*/      movs r0, #4
/*0x4f12*/      bx lr

            data_4f14:
/*0x4f14*/  .word 0x20000644
            data_4f18:
/*0x4f18*/  .word 0x20000034
            data_4f1c:
/*0x4f1c*/  .word 0x20000708


            .thumb_func
            call_4f20:
/*0x4f20*/      movs r1, #5
/*0x4f22*/      ldr r0, [pc, #4] /* data_4f28 */
/*0x4f24*/      b.w jump_4774

            data_4f28:
/*0x4f28*/  .word 0x00007d3e


            .thumb_func
            call_4f2c:
/*0x4f2c*/      push {r3, r4, r5, lr}
/*0x4f2e*/      movs r1, #3
/*0x4f30*/      mov r0, sp
/*0x4f32*/      bl call_4a80
/*0x4f36*/      ldr r4, [pc, #0x2c] /* data_4f64 */
/*0x4f38*/      cmp r0, #3
/*0x4f3a*/      bne jump_4f5a
/*0x4f3c*/      movs r3, #3
/*0x4f3e*/      mov r2, r3
/*0x4f40*/      ldr r1, [pc, #0x24] /* data_4f68 */
/*0x4f42*/      mov r0, sp
/*0x4f44*/      bl call_4a50
/*0x4f48*/      cbz r0, jump_4f5a
/*0x4f4a*/      ldrb r0, [r4, #2]
/*0x4f4c*/      mvn.w r1, r0, lsr #1
/*0x4f50*/      bfi r0, r1, #1, #1
/*0x4f54*/      strb r0, [r4, #2]
/*0x4f56*/      bl call_3f98
            jump_4f5a:
/*0x4f5a*/      ldrb r0, [r4, #2]
/*0x4f5c*/      ubfx r0, r0, #1, #1
/*0x4f60*/      pop {r3, r4, r5, pc}

/*0x4f62*/  .byte 0x00
/*0x4f63*/  .byte 0x00

            data_4f64:
/*0x4f64*/  .word 0x20000708
            data_4f68:
/*0x4f68*/  .word 0x00007d31


            .thumb_func
            call_4f6c:
/*0x4f6c*/      push {r4, lr}
/*0x4f6e*/      mov r4, r0
/*0x4f70*/      lsrs r0, r0, #0x18
/*0x4f72*/      lsls r0, r0, #0x1e
/*0x4f74*/      bpl jump_4f98
/*0x4f76*/      uxtb r1, r4
/*0x4f78*/      cmp r1, #0x12
/*0x4f7a*/      beq jump_4f92
/*0x4f7c*/      bgt jump_4f88
/*0x4f7e*/      cmp r1, #0x10
/*0x4f80*/      beq jump_4f92
/*0x4f82*/      cmp r1, #0x11
/*0x4f84*/      bne jump_4fb0
/*0x4f86*/      b jump_4f92
            jump_4f88:
/*0x4f88*/      cmp r1, #0x13
/*0x4f8a*/      beq jump_4f92
/*0x4f8c*/      cmp r1, #0x5f
/*0x4f8e*/      bne jump_4fb0
/*0x4f90*/      b jump_4f9a
            jump_4f92:
/*0x4f92*/      ldr r0, [pc, #0x28] /* data_4fbc */
/*0x4f94*/      subs r1, #0x10
/*0x4f96*/      strb r1, [r0]
            jump_4f98:
/*0x4f98*/      pop {r4, pc}
            jump_4f9a:
/*0x4f9a*/      ldr r0, [pc, #0x24] /* data_4fc0 */
/*0x4f9c*/      ldrb r0, [r0, #2]
/*0x4f9e*/      cbz r0, jump_4fb0
/*0x4fa0*/      bl call_57a8
/*0x4fa4*/      bl call_5cf4
/*0x4fa8*/      ldr r1, [pc, #0x18] /* data_4fc4 */
/*0x4faa*/      movw r0, #0x7530
/*0x4fae*/      strh r0, [r1, #6]
            jump_4fb0:
/*0x4fb0*/      mov r0, r4
/*0x4fb2*/      pop.w {r4, lr}
/*0x4fb6*/      b.w jump_5568

/*0x4fba*/  .byte 0x00
/*0x4fbb*/  .byte 0x00

            data_4fbc:
/*0x4fbc*/  .word 0x2000002b
            data_4fc0:
/*0x4fc0*/  .word 0x20000068
            data_4fc4:
/*0x4fc4*/  .word 0x20000000


            .thumb_func
            call_4fc8:
/*0x4fc8*/      ldr r0, [pc, #0x68] /* data_5034 */
/*0x4fca*/      ldrb r1, [r0, #3]
/*0x4fcc*/      lsls r1, r1, #0x1e
/*0x4fce*/      bpl jump_5002
/*0x4fd0*/      ldrb r1, [r0]
/*0x4fd2*/      movs r3, #1
/*0x4fd4*/      ldr r2, [pc, #0x60] /* data_5038 */
/*0x4fd6*/      cmp r1, #0xcf
/*0x4fd8*/      beq jump_4ff8
/*0x4fda*/      ldrb r1, [r0, #1]
/*0x4fdc*/      lsls r1, r1, #0x1f
/*0x4fde*/      beq jump_5002
/*0x4fe0*/      mov r1, r2
/*0x4fe2*/      ldrb r0, [r0, #2]
/*0x4fe4*/      ldr r1, [r1]
/*0x4fe6*/      cmp r0, #0x13
/*0x4fe8*/      beq jump_5012
/*0x4fea*/      cmp r0, #0x15
/*0x4fec*/      beq jump_5016
/*0x4fee*/      cmp r0, #0x17
/*0x4ff0*/      beq jump_501c
/*0x4ff2*/      cmp r0, #0x2b
/*0x4ff4*/      bne jump_5002
/*0x4ff6*/      b jump_5022
            jump_4ff8:
/*0x4ff8*/      ldrb r0, [r2, #7]
/*0x4ffa*/      cmp r0, #4
/*0x4ffc*/      beq jump_500e
/*0x4ffe*/      cmp r0, #5
/*0x5000*/      beq jump_5006
            jump_5002:
/*0x5002*/      movs r0, #0
/*0x5004*/      bx lr
            jump_5006:
/*0x5006*/      strb r3, [r2, #8]
/*0x5008*/      movs r0, #6
/*0x500a*/      strb r0, [r2, #7]
/*0x500c*/      b jump_5030
            jump_500e:
/*0x500e*/      strb r3, [r2, #7]
/*0x5010*/      b jump_5030
            jump_5012:
/*0x5012*/      adds r1, #0xf
/*0x5014*/      b jump_5018
            jump_5016:
/*0x5016*/      adds r1, #0x64
            jump_5018:
/*0x5018*/      str r1, [r2]
/*0x501a*/      b jump_5030
            jump_501c:
/*0x501c*/      add.w r1, r1, #0x1f4
/*0x5020*/      b jump_5018
            jump_5022:
/*0x5022*/      movs r0, #8
/*0x5024*/      ldr r1, [pc, #0x14] /* data_503c */
/*0x5026*/      strb r0, [r2, #7]
/*0x5028*/      movs r0, #0
/*0x502a*/      strh r0, [r1, #6]
/*0x502c*/      ldr r0, [pc, #0x10] /* data_5040 */
/*0x502e*/      strb r3, [r0]
            jump_5030:
/*0x5030*/      movs r0, #1
/*0x5032*/      bx lr

            data_5034:
/*0x5034*/  .word 0x20000034
            data_5038:
/*0x5038*/  .word 0x20001970
            data_503c:
/*0x503c*/  .word 0x20000000
            data_5040:
/*0x5040*/  .word 0x20000644


            .thumb_func
            call_5044:
/*0x5044*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x5048*/      ldr.w sb, [pc, #0x22c] /* data_5278 */
/*0x504c*/      mov.w r8, #0
/*0x5050*/      ldrh.w r0, [sb, #6]
/*0x5054*/      cbz r0, jump_505e
/*0x5056*/      movw r1, #0x7530
/*0x505a*/      strh.w r1, [sb, #6]
            jump_505e:
/*0x505e*/      bl call_4ed8
/*0x5062*/      movs r6, #1
/*0x5064*/      ldr r5, [pc, #0x214] /* data_527c */
/*0x5066*/      ldr.w sl, [pc, #0x218] /* data_5280 */
/*0x506a*/      movs r7, #0
/*0x506c*/      ldr.w fp, [pc, #0x214] /* data_5284 */
/*0x5070*/      ldr r4, [pc, #0x214] /* data_5288 */
/*0x5072*/      cmp r0, #6
/*0x5074*/      bhs jump_5128
/*0x5076*/      tbb [pc, r0]

/*0x507a*/  .byte 0xa7
/*0x507b*/  .byte 0x03
/*0x507c*/  .byte 0x31
/*0x507d*/  .byte 0x58
/*0x507e*/  .byte 0x5e
/*0x507f*/  .byte 0x85

            switch_5080:
/*0x5080*/      ldrb r0, [r4, #3]
/*0x5082*/      lsls r0, r0, #0x1e
/*0x5084*/      bpl jump_5168
/*0x5086*/      ldrb.w r8, [r4, #2]
/*0x508a*/      mov r0, r8
/*0x508c*/      bl call_7ae4
/*0x5090*/      cmp r0, #0xff
/*0x5092*/      beq jump_50d8
/*0x5094*/      ldr r2, [pc, #0x1f8] /* data_5290 */
/*0x5096*/      ldr r1, [pc, #0x1f4] /* data_528c */
/*0x5098*/      ldr r3, [r2, #6]!
/*0x509c*/      str r3, [r1, #0xe8]!
/*0x50a0*/      ldr r3, [r2, #4]
/*0x50a2*/      str r3, [r1, #4]
/*0x50a4*/      ldrh r2, [r2, #8]
/*0x50a6*/      strh r2, [r1, #8]
/*0x50a8*/      ldr r1, [pc, #0x1cc] /* data_5278 */
/*0x50aa*/      ldr r2, [pc, #0x1e0] /* data_528c */
/*0x50ac*/      adds r1, r1, #3
/*0x50ae*/      ldrb r1, [r1, #1]
/*0x50b0*/      cbz r1, jump_50b8
/*0x50b2*/      cmp r1, #1
/*0x50b4*/      beq jump_50c0
/*0x50b6*/      b jump_50cc
            jump_50b8:
/*0x50b8*/      strb.w r8, [r2, #0xe8]
/*0x50bc*/      movs r1, #0x19
/*0x50be*/      b jump_50c6
            jump_50c0:
/*0x50c0*/      strb.w r8, [r2, #0xe9]
/*0x50c4*/      movs r1, #9
            jump_50c6:
/*0x50c6*/      add r0, r2
/*0x50c8*/      strb.w r1, [r0, #0xe8]
            jump_50cc:
/*0x50cc*/      bl call_3f98
/*0x50d0*/      strb r6, [r5, #7]
/*0x50d2*/      strb r7, [r5, #0xb]
/*0x50d4*/      bl call_57a8
            jump_50d8:
/*0x50d8*/      strb r7, [r4]
/*0x50da*/      b jump_5120
            switch_50dc:
/*0x50dc*/      ldrb r0, [r4, #3]
/*0x50de*/      lsls r0, r0, #0x1e
/*0x50e0*/      bpl jump_5110
/*0x50e2*/      ldrb r0, [r5, #0xc]
/*0x50e4*/      subs r1, r0, #1
/*0x50e6*/      cmp r1, #6
/*0x50e8*/      bhs jump_5110
/*0x50ea*/      movs r1, #7
/*0x50ec*/      udiv r2, r0, r1
/*0x50f0*/      mls r0, r1, r2, r0
/*0x50f4*/      adds r0, r0, #1
/*0x50f6*/      strb r0, [r5, #0xc]
/*0x50f8*/      cmp r0, #4
/*0x50fa*/      beq jump_5102
/*0x50fc*/      cmp r0, #7
/*0x50fe*/      bne jump_510e
/*0x5100*/      b jump_5108
            jump_5102:
/*0x5102*/      movs r0, #5
/*0x5104*/      strb r0, [r5, #0xc]
/*0x5106*/      b jump_510e
            jump_5108:
/*0x5108*/      ldr r0, [r4]
/*0x510a*/      bl call_556c
            jump_510e:
/*0x510e*/      strb r6, [r5]
            jump_5110:
/*0x5110*/      ldrb r0, [r4, #3]
/*0x5112*/      ubfx r0, r0, #1, #1
/*0x5116*/      strb r0, [r5, #8]
/*0x5118*/      ldrb.w r0, [sl, #6]
/*0x511c*/      cmp r0, #1
/*0x511e*/      beq jump_5124
            jump_5120:
/*0x5120*/      movs r0, #1
/*0x5122*/      b jump_5126
            jump_5124:
/*0x5124*/      movs r0, #0
            jump_5126:
/*0x5126*/      mov r8, r0
            jump_5128:
/*0x5128*/      b jump_5232
            switch_512a:
/*0x512a*/      ldrb r0, [r4, #3]
/*0x512c*/      ubfx r1, r0, #1, #1
/*0x5130*/      strb.w r1, [sb]
/*0x5134*/      b jump_5232
            switch_5136:
/*0x5136*/      ldrb r0, [r5, #6]
/*0x5138*/      cbz r0, jump_5140
/*0x513a*/      movs r0, #0
            jump_513c:
/*0x513c*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_5140:
/*0x5140*/      ldrb r0, [r4, #3]
/*0x5142*/      lsls r0, r0, #0x1e
/*0x5144*/      bpl jump_5238
/*0x5146*/      ldrb r0, [r4, #2]
/*0x5148*/      ldr r1, [pc, #0x148] /* data_5294 */
/*0x514a*/      cmp r0, #0x1b
/*0x514c*/      ldrb r1, [r1, r0]
/*0x514e*/      strb r1, [r4]
/*0x5150*/      beq jump_516a
/*0x5152*/      cmp r0, #0x22
/*0x5154*/      beq jump_516e
/*0x5156*/      cmp r0, #0x23
/*0x5158*/      beq jump_5176
/*0x515a*/      cmp r0, #0x2a
/*0x515c*/      beq jump_517a
/*0x515e*/      ldr r0, [r4]
/*0x5160*/      bl call_556c
            jump_5164:
/*0x5164*/      strb r7, [r4]
/*0x5166*/      b jump_5232
            jump_5168:
/*0x5168*/      b jump_5238
            jump_516a:
/*0x516a*/      movs r0, #1
/*0x516c*/      b jump_5170
            jump_516e:
/*0x516e*/      movs r0, #2
            jump_5170:
/*0x5170*/      bl call_3a60
/*0x5174*/      b jump_5164
            jump_5176:
/*0x5176*/      movs r0, #1
/*0x5178*/      b jump_517c
            jump_517a:
/*0x517a*/      movs r0, #2
            jump_517c:
/*0x517c*/      bl call_3a48
/*0x5180*/      strb r6, [r5]
/*0x5182*/      b jump_5164
            switch_5184:
/*0x5184*/      ldrb.w r1, [sl, #6]
/*0x5188*/      cmp r1, #1
/*0x518a*/      bne jump_5232
/*0x518c*/      ldrb.w r0, [sl, #7]
/*0x5190*/      cmp r0, #2
/*0x5192*/      beq jump_5232
/*0x5194*/      ldr r1, [pc, #0xf8] /* data_5290 */
/*0x5196*/      movs r0, #0
/*0x5198*/      ldrb r2, [r4, #2]
/*0x519a*/      adds r1, #0x1f
            jump_519c:
/*0x519c*/      ldrb.w r3, [r1, r0, lsl #1]
/*0x51a0*/      cmp r2, r3
/*0x51a2*/      bne jump_51be
/*0x51a4*/      add.w r0, r1, r0, lsl #1
/*0x51a8*/      ldrb r0, [r0, #1]
/*0x51aa*/      strb r0, [r4]
/*0x51ac*/      ldrb r0, [r4, #3]
/*0x51ae*/      orr r0, r0, #1
/*0x51b2*/      strb r0, [r4, #3]
/*0x51b4*/      ldrb r0, [r4, #1]
/*0x51b6*/      bic r0, r0, #1
/*0x51ba*/      strb r0, [r4, #1]
/*0x51bc*/      b jump_5232
            jump_51be:
/*0x51be*/      adds r0, r0, #1
/*0x51c0*/      uxtb r0, r0
/*0x51c2*/      cmp r0, #0x15
/*0x51c4*/      blo jump_519c
/*0x51c6*/      b jump_5232
            switch_51c8:
/*0x51c8*/      ldrb r0, [r4, #3]
/*0x51ca*/      lsls r0, r0, #0x1e
/*0x51cc*/      bpl jump_5238
/*0x51ce*/      ldrb r0, [r4]
/*0x51d0*/      cmp r0, #0x2c
/*0x51d2*/      beq jump_51dc
/*0x51d4*/      cmp r0, #0xe2
/*0x51d6*/      beq jump_51dc
/*0x51d8*/      cmp r0, #0xe3
/*0x51da*/      bne jump_5202
            jump_51dc:
/*0x51dc*/      movs r1, #3
/*0x51de*/      mov r0, sp
/*0x51e0*/      bl call_4a80
/*0x51e4*/      cmp r0, #3
/*0x51e6*/      bne jump_5202
/*0x51e8*/      movs r3, #3
/*0x51ea*/      mov r2, r3
/*0x51ec*/      ldr r1, [pc, #0xa0] /* data_5290 */
/*0x51ee*/      mov r0, sp
/*0x51f0*/      bl call_4a50
/*0x51f4*/      cbz r0, jump_5202
/*0x51f6*/      ldrb r0, [r5, #9]
/*0x51f8*/      mvns r0, r0
/*0x51fa*/      strb r0, [r5, #9]
/*0x51fc*/      strb r6, [r5, #7]
/*0x51fe*/      strb r7, [r4]
/*0x5200*/      b jump_520c
            jump_5202:
/*0x5202*/      ldrb r0, [r4]
/*0x5204*/      cmp r0, #0xe5
/*0x5206*/      beq jump_5232
/*0x5208*/      cmp r0, #0xe1
/*0x520a*/      beq jump_5232
            jump_520c:
/*0x520c*/      ldrb.w r0, [sb]
/*0x5210*/      cmp r0, #1
/*0x5212*/      bne jump_5232
/*0x5214*/      ldrb r0, [r4]
/*0x5216*/      bl call_3fc8
/*0x521a*/      ldr r1, [pc, #0x74] /* data_5290 */
/*0x521c*/      adds r1, #0x49
/*0x521e*/      add.w r1, r1, r0, lsl #1
/*0x5222*/      ldrb r1, [r1, #1]
/*0x5224*/      strb.w r1, [fp, r0]
/*0x5228*/      strb r1, [r4]
/*0x522a*/      ldrb r0, [r4, #3]
/*0x522c*/      orr r0, r0, #1
/*0x5230*/      strb r0, [r4, #3]
            jump_5232:
/*0x5232*/      ldrb r0, [r4, #3]
/*0x5234*/      lsls r0, r0, #0x1e
/*0x5236*/      bmi jump_5252
            jump_5238:
/*0x5238*/      ldrb r0, [r4]
/*0x523a*/      bl call_3fc8
/*0x523e*/      ldrb.w r1, [fp, r0]
/*0x5242*/      cbz r1, jump_5252
/*0x5244*/      strb r1, [r4]
/*0x5246*/      strb.w r7, [fp, r0]
/*0x524a*/      ldrb r0, [r4, #3]
/*0x524c*/      orr r0, r0, #1
/*0x5250*/      strb r0, [r4, #3]
            jump_5252:
/*0x5252*/      ldrb r0, [r4]
/*0x5254*/      cmp r0, #0xc8
/*0x5256*/      bne jump_5268
/*0x5258*/      ldrb.w r0, [sl, #6]
/*0x525c*/      cmp r0, #1
/*0x525e*/      beq jump_5268
/*0x5260*/      ldr r0, [r4]
/*0x5262*/      bl call_5818
/*0x5266*/      cbz r0, jump_526c
            jump_5268:
/*0x5268*/      mov r0, r8
/*0x526a*/      b jump_513c
            jump_526c:
/*0x526c*/      ldrb r0, [r4, #3]
/*0x526e*/      orr r0, r0, #1
/*0x5272*/      strb r0, [r4, #3]
/*0x5274*/      movs r0, #1
/*0x5276*/      b jump_513c

            data_5278:
/*0x5278*/  .word 0x20000000
            data_527c:
/*0x527c*/  .word 0x20000644
            data_5280:
/*0x5280*/  .word 0x20001970
            data_5284:
/*0x5284*/  .word 0x20000089
            data_5288:
/*0x5288*/  .word 0x20000034
            data_528c:
/*0x528c*/  .word 0x20000708
            data_5290:
/*0x5290*/  .word 0x00007d2e
            data_5294:
/*0x5294*/  .word 0x200002de


            .thumb_func
            call_5298:
/*0x5298*/      push {r4, r5, r6, lr}
/*0x529a*/      ldr r4, [pc, #0x6c] /* data_5308 */
/*0x529c*/      ldrb r0, [r4, #3]
/*0x529e*/      lsls r1, r0, #0x1f
/*0x52a0*/      beq jump_52ae
/*0x52a2*/      ldrb r0, [r4]
/*0x52a4*/      cmp r0, #0xc8
/*0x52a6*/      bne jump_52ac
/*0x52a8*/      movs r0, #0x2c
/*0x52aa*/      strb r0, [r4]
            jump_52ac:
/*0x52ac*/      pop {r4, r5, r6, pc}
            jump_52ae:
/*0x52ae*/      ldr r1, [pc, #0x58] /* data_5308 */
/*0x52b0*/      ldr r2, [pc, #0x58] /* data_530c */
/*0x52b2*/      ldr r3, [pc, #0x5c] /* data_5310 */
/*0x52b4*/      ldrb r1, [r1, #2]
/*0x52b6*/      lsls r0, r0, #0x1e
/*0x52b8*/      bpl jump_52e6
/*0x52ba*/      ldrb r5, [r4, #1]
/*0x52bc*/      lsls r0, r5, #0x19
/*0x52be*/      bpl jump_52ac
/*0x52c0*/      movs r0, #0
            jump_52c2:
/*0x52c2*/      ldrb.w r6, [r2, r0, lsl #1]
/*0x52c6*/      cmp r1, r6
/*0x52c8*/      bne jump_52dc
/*0x52ca*/      add.w r1, r2, r0, lsl #1
/*0x52ce*/      ldrb r1, [r1, #1]
/*0x52d0*/      strb r1, [r4]
/*0x52d2*/      strb r1, [r3, r0]
/*0x52d4*/      bic r0, r5, #1
/*0x52d8*/      strb r0, [r4, #1]
/*0x52da*/      pop {r4, r5, r6, pc}
            jump_52dc:
/*0x52dc*/      adds r0, r0, #1
/*0x52de*/      uxtb r0, r0
/*0x52e0*/      cmp r0, #0x15
/*0x52e2*/      blo jump_52c2
/*0x52e4*/      pop {r4, r5, r6, pc}
            jump_52e6:
/*0x52e6*/      movs r0, #0
            jump_52e8:
/*0x52e8*/      ldrb.w r5, [r2, r0, lsl #1]
/*0x52ec*/      cmp r1, r5
/*0x52ee*/      bne jump_52fc
/*0x52f0*/      ldrb r5, [r3, r0]
/*0x52f2*/      cbz r5, jump_52fc
/*0x52f4*/      strb r5, [r4]
/*0x52f6*/      movs r1, #0
/*0x52f8*/      strb r1, [r3, r0]
/*0x52fa*/      pop {r4, r5, r6, pc}
            jump_52fc:
/*0x52fc*/      adds r0, r0, #1
/*0x52fe*/      uxtb r0, r0
/*0x5300*/      cmp r0, #0x15
/*0x5302*/      blo jump_52e8
/*0x5304*/      pop {r4, r5, r6, pc}

/*0x5306*/  .byte 0x00
/*0x5307*/  .byte 0x00

            data_5308:
/*0x5308*/  .word 0x20000034
            data_530c:
/*0x530c*/  .word 0x00007d4d
            data_5310:
/*0x5310*/  .word 0x20000074


            .thumb_func
            call_5314:
/*0x5314*/      ldr r1, [pc, #0x18] /* data_5330 */
/*0x5316*/      push {r4, lr}
/*0x5318*/      ldr r1, [r1]
/*0x531a*/      ldrh r2, [r0]
/*0x531c*/      strh r2, [r1]
/*0x531e*/      ldrb r0, [r0, #2]
/*0x5320*/      strb r0, [r1, #2]
/*0x5322*/      bl call_57b4
/*0x5326*/      pop.w {r4, lr}
/*0x532a*/      b.w call_3f98

/*0x532e*/  .byte 0x00
/*0x532f*/  .byte 0x00

            data_5330:
/*0x5330*/  .word 0x200000ac


            .thumb_func
            call_5334:
/*0x5334*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5338*/      ldr r4, [pc, #0x4c] /* data_5388 */
/*0x533a*/      movs r5, #0
/*0x533c*/      ldrb r0, [r4, #7]
/*0x533e*/      cbz r0, jump_5348
/*0x5340*/      movs r0, #0
/*0x5342*/      bl call_6324
/*0x5346*/      strb r5, [r4, #7]
            jump_5348:
/*0x5348*/      ldr r7, [pc, #0x40] /* data_538c */
/*0x534a*/      mov.w r6, #1
/*0x534e*/      ldrb r0, [r7]
/*0x5350*/      lsls r0, r0, #0x1f
/*0x5352*/      beq jump_5366
/*0x5354*/      movs r0, #1
/*0x5356*/      bl call_46cc
/*0x535a*/      cbz r0, jump_5366
/*0x535c*/      strb r6, [r4, #0xb]
/*0x535e*/      ldrb r0, [r7]
/*0x5360*/      bic r0, r0, #1
/*0x5364*/      strb r0, [r7]
            jump_5366:
/*0x5366*/      ldr r1, [pc, #0x24] /* data_538c */
/*0x5368*/      subs r1, r1, #3
/*0x536a*/      ldrh r0, [r1, #6]
/*0x536c*/      cmp r0, #1
/*0x536e*/      bne jump_5382
/*0x5370*/      ldr r0, [pc, #0x1c] /* data_5390 */
/*0x5372*/      ldrb r2, [r0, #7]
/*0x5374*/      cbz r2, jump_537a
/*0x5376*/      movs r2, #8
/*0x5378*/      strb r2, [r0, #7]
            jump_537a:
/*0x537a*/      strb r5, [r4, #6]
/*0x537c*/      strb r6, [r4]
/*0x537e*/      strb r5, [r4, #0xb]
/*0x5380*/      strh r5, [r1, #6]
            jump_5382:
/*0x5382*/      movs r0, #1
/*0x5384*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5388:
/*0x5388*/  .word 0x20000644
            data_538c:
/*0x538c*/  .word 0x20000003
            data_5390:
/*0x5390*/  .word 0x20001970


            .thumb_func
            call_5394:
/*0x5394*/      cmp r0, #0xff
/*0x5396*/      bhs jump_53a6
/*0x5398*/      adds r0, #0x2b
/*0x539a*/      cmp r0, #0xff
/*0x539c*/      bls jump_53a2
/*0x539e*/      movs r0, #0xff
/*0x53a0*/      bx lr
            jump_53a2:
/*0x53a2*/      uxtb r0, r0
/*0x53a4*/      bx lr
            jump_53a6:
/*0x53a6*/      movs r0, #0
/*0x53a8*/      bx lr

/*0x53aa*/  .byte 0x00
/*0x53ab*/  .byte 0x00


            .thumb_func
            call_53ac:
/*0x53ac*/      push {r0, r1, r4, r5, r6, lr}
/*0x53ae*/      cmp.w r0, #0x200
/*0x53b2*/      bhs jump_5410
/*0x53b4*/      ldrh.w r4, [sp, #4]
/*0x53b8*/      cmp.w r4, #0x400
/*0x53bc*/      bhs jump_5410
/*0x53be*/      lsrs r1, r0, #8
/*0x53c0*/      ldr r2, [pc, #0x70] /* data_5434 */
/*0x53c2*/      uxtb r0, r0
/*0x53c4*/      rsb r1, r1, r1, lsl #3
/*0x53c8*/      ldrb r0, [r2, r0]
/*0x53ca*/      lsls r1, r1, #1
/*0x53cc*/      cmp r0, #0xff
/*0x53ce*/      beq jump_5410
/*0x53d0*/      add.w r2, r0, r1, lsl #2
/*0x53d4*/      add.w r1, r1, r0, lsr #2
/*0x53d8*/      adds r1, #0x70
/*0x53da*/      uxth r3, r1
/*0x53dc*/      lsls r0, r0, #0x1e
/*0x53de*/      lsrs r1, r0, #0x1d
/*0x53e0*/      movs r6, #3
/*0x53e2*/      ldr r5, [pc, #0x54] /* data_5438 */
/*0x53e4*/      uxth r2, r2
/*0x53e6*/      cmp r4, #3
/*0x53e8*/      beq jump_5414
/*0x53ea*/      ldrb.w r0, [sp, #4]
/*0x53ee*/      add r2, r5
/*0x53f0*/      cmp r0, #0xff
/*0x53f2*/      strb.w r0, [r2, #0xf2]
/*0x53f6*/      beq jump_540c
/*0x53f8*/      adds r0, r5, r3
/*0x53fa*/      lsls r6, r1
/*0x53fc*/      ldrb r2, [r0, #0xf2]!
/*0x5400*/      ldrb.w r3, [sp, #5]
/*0x5404*/      bics r2, r6
/*0x5406*/      lsls r3, r1
/*0x5408*/      orrs r2, r3
/*0x540a*/      strb r2, [r0]
            jump_540c:
/*0x540c*/      movs r0, #0
/*0x540e*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5410:
/*0x5410*/      movs r0, #3
            jump_5412:
/*0x5412*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5414:
/*0x5414*/      adds r0, r5, r2
/*0x5416*/      ldrb.w r0, [r0, #0xf2]
/*0x541a*/      cmp r0, #0xff
/*0x541c*/      beq jump_5412
/*0x541e*/      adds r2, r5, r3
/*0x5420*/      lsls r6, r1
/*0x5422*/      ldrb.w r2, [r2, #0xf2]
/*0x5426*/      rsb.w r1, r1, #8
/*0x542a*/      ands r2, r6
/*0x542c*/      lsls r2, r1
/*0x542e*/      add r0, r2
/*0x5430*/      uxth r0, r0
/*0x5432*/      pop {r2, r3, r4, r5, r6, pc}

            data_5434:
/*0x5434*/  .word 0x200001de
            data_5438:
/*0x5438*/  .word 0x20000708


            .thumb_func
            call_543c:
/*0x543c*/      ldr r1, [pc, #0x5c] /* data_549c */
/*0x543e*/      ldr r0, [pc, #0x60] /* data_54a0 */
/*0x5440*/      movs r2, #0xe8
/*0x5442*/      ldrb r3, [r1, #0xe8]!
/*0x5446*/      strb r2, [r0, r3]
/*0x5448*/      ldrb r3, [r1, #1]
/*0x544a*/      movs r2, #0xcf
/*0x544c*/      strb r2, [r0, r3]
/*0x544e*/      ldrb r3, [r1, #2]
/*0x5450*/      movs r2, #0xc9
/*0x5452*/      strb r2, [r0, r3]
/*0x5454*/      ldrb r3, [r1, #3]
/*0x5456*/      movs r2, #0xe0
/*0x5458*/      strb r2, [r0, r3]
/*0x545a*/      ldrb r3, [r1, #4]
/*0x545c*/      movs r2, #0xe3
/*0x545e*/      strb r2, [r0, r3]
/*0x5460*/      ldrb r3, [r1, #5]
/*0x5462*/      movs r2, #0xe2
/*0x5464*/      strb r2, [r0, r3]
/*0x5466*/      ldrb r3, [r1, #6]
/*0x5468*/      movs r2, #0xc8
/*0x546a*/      strb r2, [r0, r3]
/*0x546c*/      ldrb r3, [r1, #7]
/*0x546e*/      movs r2, #0x2c
/*0x5470*/      strb r2, [r0, r3]
/*0x5472*/      ldrb r3, [r1, #8]
/*0x5474*/      movs r2, #0xe6
/*0x5476*/      strb r2, [r0, r3]
/*0x5478*/      ldrb r1, [r1, #9]
/*0x547a*/      movs r2, #0xe7
/*0x547c*/      strb r2, [r0, r1]
/*0x547e*/      ldr r1, [pc, #0x24] /* data_54a4 */
/*0x5480*/      ldrb r1, [r1, #9]
/*0x5482*/      cmp r1, #0
/*0x5484*/      beq jump_549a
/*0x5486*/      movs r1, #0x50
/*0x5488*/      strb r1, [r0, #1]
/*0x548a*/      movs r1, #0x51
/*0x548c*/      strb r1, [r0, #9]
/*0x548e*/      movs r1, #0x52
/*0x5490*/      strb.w r1, [r0, #0x2f]
/*0x5494*/      movs r1, #0x4f
/*0x5496*/      strb.w r1, [r0, #0x2b]
            jump_549a:
/*0x549a*/      bx lr

            data_549c:
/*0x549c*/  .word 0x20000708
            data_54a0:
/*0x54a0*/  .word 0x200002de
            data_54a4:
/*0x54a4*/  .word 0x20000644


            .thumb_func
            call_54a8:
/*0x54a8*/      ldr r3, [pc, #0x84] /* data_5530 */
/*0x54aa*/      push {r4, lr}
/*0x54ac*/      ldrb r0, [r3, #3]
/*0x54ae*/      ldr r1, [pc, #0x84] /* data_5534 */
/*0x54b0*/      ldrb r0, [r1, r0]
/*0x54b2*/      add.w r0, r0, r0, lsl #2
/*0x54b6*/      adds r1, r0, r3
/*0x54b8*/      ldr r0, [pc, #0x7c] /* data_5538 */
/*0x54ba*/      adds r1, r1, #4
/*0x54bc*/      str r1, [r0]
/*0x54be*/      ldrb r2, [r1]
/*0x54c0*/      cbnz r2, jump_54d6
/*0x54c2*/      ldrb r2, [r1, #1]
/*0x54c4*/      cbnz r2, jump_54d6
/*0x54c6*/      ldrb r2, [r1, #2]
/*0x54c8*/      cbnz r2, jump_54d6
/*0x54ca*/      movs r2, #0xff
/*0x54cc*/      strb r2, [r1]
/*0x54ce*/      ldr r1, [r0]
/*0x54d0*/      strb r2, [r1, #1]
/*0x54d2*/      ldr r1, [r0]
/*0x54d4*/      strb r2, [r1, #2]
            jump_54d6:
/*0x54d6*/      ldrb r1, [r3, #3]
/*0x54d8*/      cmp r1, #3
/*0x54da*/      bhi jump_54fa
/*0x54dc*/      movs r2, #0
/*0x54de*/      cmp r1, #1
/*0x54e0*/      beq jump_54ec
/*0x54e2*/      cmp r1, #2
/*0x54e4*/      beq jump_54f0
/*0x54e6*/      cmp r1, #3
/*0x54e8*/      bne jump_5526
/*0x54ea*/      b jump_54f6
            jump_54ec:
/*0x54ec*/      str r2, [r0, #4]
/*0x54ee*/      b jump_5526
            jump_54f0:
/*0x54f0*/      strb r2, [r0, #4]
/*0x54f2*/      strb r2, [r0, #5]
/*0x54f4*/      b jump_5526
            jump_54f6:
/*0x54f6*/      movs r1, #0xd8
/*0x54f8*/      b jump_5512
            jump_54fa:
/*0x54fa*/      cmp r1, #7
/*0x54fc*/      bls jump_5526
/*0x54fe*/      bic r1, r1, #1
/*0x5502*/      cmp r1, #8
/*0x5504*/      beq jump_54f6
/*0x5506*/      cmp r1, #0xa
/*0x5508*/      beq jump_5510
/*0x550a*/      cmp r1, #0xc
/*0x550c*/      bne jump_5526
/*0x550e*/      b jump_551a
            jump_5510:
/*0x5510*/      movs r1, #0x49
            jump_5512:
/*0x5512*/      adds r0, r0, #4
/*0x5514*/      bl mem_zero
/*0x5518*/      b jump_5526
            jump_551a:
/*0x551a*/      movs r1, #0x1f
/*0x551c*/      adds r0, r0, #4
/*0x551e*/      bl mem_zero
/*0x5522*/      bl call_6f20
            jump_5526:
/*0x5526*/      ldr r1, [pc, #0x14] /* data_553c */
/*0x5528*/      movs r0, #1
/*0x552a*/      strb r0, [r1]
/*0x552c*/      pop {r4, pc}

/*0x552e*/  .byte 0x00
/*0x552f*/  .byte 0x00

            data_5530:
/*0x5530*/  .word 0x20000708
            data_5534:
/*0x5534*/  .word 0x00007dc9
            data_5538:
/*0x5538*/  .word 0x200000ac
            data_553c:
/*0x553c*/  .word 0x20000644


            .thumb_func
            call_5540:
/*0x5540*/      ldr r0, [pc, #0x20] /* data_5564 */
/*0x5542*/      ldrb r0, [r0, #3]
/*0x5544*/      cmp r0, #8
/*0x5546*/      beq jump_555e
/*0x5548*/      bgt jump_5552
/*0x554a*/      cbz r0, jump_555e
/*0x554c*/      cmp r0, #1
/*0x554e*/      bne jump_555a
/*0x5550*/      b jump_555e
            jump_5552:
/*0x5552*/      cmp r0, #0xa
/*0x5554*/      beq jump_555e
/*0x5556*/      cmp r0, #0xc
/*0x5558*/      beq jump_555e
            jump_555a:
/*0x555a*/      movs r0, #0
/*0x555c*/      bx lr
            jump_555e:
/*0x555e*/      movs r0, #1
/*0x5560*/      bx lr

/*0x5562*/  .byte 0x00
/*0x5563*/  .byte 0x00

            data_5564:
/*0x5564*/  .word 0x20000708

            jump_5568:
/*0x5568*/      bx lr

/*0x556a*/  .byte 0x00
/*0x556b*/  .byte 0x00


            .thumb_func
            call_556c:
/*0x556c*/      push {r4, lr}
/*0x556e*/      ldr r3, [pc, #0x130] /* data_56a0 */
/*0x5570*/      mov r4, r0
/*0x5572*/      uxtb r1, r0
/*0x5574*/      ldrb r0, [r3, #3]
/*0x5576*/      ldr r2, [pc, #0x12c] /* data_56a4 */
/*0x5578*/      cmp r1, #0x19
/*0x557a*/      beq jump_5634
/*0x557c*/      bgt jump_55a8
/*0x557e*/      cmp r1, #0x14
/*0x5580*/      beq jump_55b6
/*0x5582*/      bgt jump_558e
/*0x5584*/      cmp r1, #6
/*0x5586*/      beq jump_5634
/*0x5588*/      cmp r1, #8
/*0x558a*/      bne jump_55d4
/*0x558c*/      b jump_55b6
            jump_558e:
/*0x558e*/      ldr r0, [pc, #0x110] /* data_56a0 */
/*0x5590*/      ldrb r0, [r0, #3]
/*0x5592*/      adds r0, r0, #1
/*0x5594*/      uxtb r2, r0
/*0x5596*/      cmp r1, #0x15
/*0x5598*/      beq jump_5618
/*0x559a*/      cmp r1, #0x17
/*0x559c*/      bne jump_55d4
/*0x559e*/      strb r2, [r3, #3]
/*0x55a0*/      cmp r2, #3
/*0x55a2*/      bls jump_5624
/*0x55a4*/      movs r0, #0
/*0x55a6*/      b jump_5622
            jump_55a8:
/*0x55a8*/      cmp r1, #0x36
/*0x55aa*/      beq jump_5634
/*0x55ac*/      bgt jump_55d6
/*0x55ae*/      cmp r1, #0x1a
/*0x55b0*/      beq jump_55b6
/*0x55b2*/      cmp r1, #0x29
/*0x55b4*/      bne jump_55d4
            jump_55b6:
/*0x55b6*/      bl call_5540
/*0x55ba*/      cmp r0, #0
/*0x55bc*/      beq jump_55d4
/*0x55be*/      cmp r1, #8
/*0x55c0*/      beq jump_55ee
/*0x55c2*/      cmp r1, #0x14
/*0x55c4*/      beq jump_55ee
/*0x55c6*/      cmp r1, #0x1a
/*0x55c8*/      beq jump_55ee
/*0x55ca*/      cmp r1, #0x29
/*0x55cc*/      bne jump_55d4
/*0x55ce*/      ldr r1, [pc, #0xd8] /* data_56a8 */
/*0x55d0*/      movs r0, #1
/*0x55d2*/      strb r0, [r1, #2]
            jump_55d4:
/*0x55d4*/      pop {r4, pc}
            jump_55d6:
/*0x55d6*/      cmp r1, #0x37
/*0x55d8*/      beq jump_5634
/*0x55da*/      cmp r1, #0xcf
/*0x55dc*/      bne jump_55d4
/*0x55de*/      bl call_46a8
            jump_55e2:
/*0x55e2*/      bl call_57b4
/*0x55e6*/      pop.w {r4, lr}
/*0x55ea*/      b.w call_3f98
            jump_55ee:
/*0x55ee*/      cmp r1, #0x14
/*0x55f0*/      beq jump_55fe
/*0x55f2*/      ldr r0, [pc, #0xb8] /* data_56ac */
/*0x55f4*/      ldrb r0, [r0]
/*0x55f6*/      cmp r0, #0x1a
/*0x55f8*/      beq jump_5610
/*0x55fa*/      cmp r0, #8
/*0x55fc*/      beq jump_5614
            jump_55fe:
/*0x55fe*/      movs r1, #0
            jump_5600:
/*0x5600*/      ldr r0, [r2]
/*0x5602*/      movs r2, #1
/*0x5604*/      adds r4, r0, r1
/*0x5606*/      ldrb r0, [r4]
/*0x5608*/      bl call_5394
/*0x560c*/      strb r0, [r4]
/*0x560e*/      b jump_55e2
            jump_5610:
/*0x5610*/      movs r1, #1
/*0x5612*/      b jump_5600
            jump_5614:
/*0x5614*/      movs r1, #2
/*0x5616*/      b jump_5600
            jump_5618:
/*0x5618*/      strb r2, [r3, #3]
/*0x561a*/      subs r2, r2, #7
/*0x561c*/      cmp r2, #7
/*0x561e*/      blo jump_5624
/*0x5620*/      movs r0, #7
            jump_5622:
/*0x5622*/      strb r0, [r3, #3]
            jump_5624:
/*0x5624*/      bl call_54a8
/*0x5628*/      bl call_57a8
/*0x562c*/      mov r0, r4
/*0x562e*/      bl call_56b4
/*0x5632*/      b jump_55e2
            jump_5634:
/*0x5634*/      ldr r2, [pc, #0x78] /* data_56b0 */
/*0x5636*/      ldrb r0, [r2, r0]
/*0x5638*/      cmp r0, #0xff
/*0x563a*/      beq jump_55e2
/*0x563c*/      ldr r0, [pc, #0x64] /* data_56a4 */
/*0x563e*/      movs r2, #6
/*0x5640*/      cmp r1, #6
/*0x5642*/      ldr r0, [r0]
/*0x5644*/      beq jump_567a
/*0x5646*/      cmp r1, #0x19
/*0x5648*/      beq jump_566a
/*0x564a*/      cmp r1, #0x36
/*0x564c*/      beq jump_568e
/*0x564e*/      cmp r1, #0x37
/*0x5650*/      bne jump_55e2
/*0x5652*/      ldrb r1, [r0, #4]
/*0x5654*/      and r2, r1, #0xf
/*0x5658*/      cmp r2, #5
/*0x565a*/      bhs jump_55e2
/*0x565c*/      mov.w r2, #0x10000000
/*0x5660*/      add.w r1, r2, r1, ror #4
/*0x5664*/      ror.w r1, r1, #0x1c
/*0x5668*/      b jump_569a
            jump_566a:
/*0x566a*/      ldrb r1, [r0, #3]
/*0x566c*/      cmp r1, #4
/*0x566e*/      bhs jump_55e2
/*0x5670*/      adds r1, r1, #1
/*0x5672*/      b jump_5682
            jump_5674:
/*0x5674*/      bl call_6f20
/*0x5678*/      b jump_55e2
            jump_567a:
/*0x567a*/      ldrb r1, [r0, #3]
/*0x567c*/      cmp r1, #1
/*0x567e*/      bls jump_55e2
/*0x5680*/      subs r1, r1, #1
            jump_5682:
/*0x5682*/      strb r1, [r0, #3]
/*0x5684*/      ldrb r0, [r3, #3]
/*0x5686*/      cmp.w r2, r0, lsr #1
/*0x568a*/      beq jump_5674
/*0x568c*/      b jump_55e2
            jump_568e:
/*0x568e*/      ldrb r1, [r0, #4]
/*0x5690*/      lsls r2, r1, #0x1c
/*0x5692*/      beq jump_55e2
/*0x5694*/      subs r2, r1, #1
/*0x5696*/      bfi r1, r2, #0, #4
            jump_569a:
/*0x569a*/      strb r1, [r0, #4]
/*0x569c*/      b jump_55e2

/*0x569e*/  .byte 0x00
/*0x569f*/  .byte 0x00

            data_56a0:
/*0x56a0*/  .word 0x20000708
            data_56a4:
/*0x56a4*/  .word 0x200000ac
            data_56a8:
/*0x56a8*/  .word 0x20000644
            data_56ac:
/*0x56ac*/  .word 0x20000034
            data_56b0:
/*0x56b0*/  .word 0x00007dc9


            .thumb_func
            call_56b4:
/*0x56b4*/      push {r3, r4, r5, lr}
/*0x56b6*/      ldr r1, [pc, #0xd8] /* data_5790 */
/*0x56b8*/      ubfx r4, r0, #0x10, #8
/*0x56bc*/      ldr r5, [pc, #0xd4] /* data_5794 */
/*0x56be*/      ldrb r2, [r1, #0xc]
/*0x56c0*/      lsrs r1, r0, #0x18
/*0x56c2*/      add.w r0, r4, r4, lsl #1
/*0x56c6*/      add r0, r5
/*0x56c8*/      cbz r2, jump_570e
/*0x56ca*/      cmp r2, #7
/*0x56cc*/      bne jump_570c
/*0x56ce*/      adr r2, #0xc8
/*0x56d0*/      lsls r1, r1, #0x1e
/*0x56d2*/      ldr r2, [r2]
/*0x56d4*/      str r2, [sp]
/*0x56d6*/      bpl jump_570c
/*0x56d8*/      mov r1, sp
/*0x56da*/      adds r0, r0, #7
/*0x56dc*/      bl call_7124
/*0x56e0*/      ldr r0, [pc, #0xb8] /* data_579c */
/*0x56e2*/      ldrb r0, [r0, #3]
/*0x56e4*/      lsls r0, r0, #0x1e
/*0x56e6*/      bpl jump_570c
/*0x56e8*/      cbz r4, jump_56fa
/*0x56ea*/      cmp r4, #4
/*0x56ec*/      beq jump_5702
/*0x56ee*/      cmp r4, #0x30
/*0x56f0*/      bne jump_570c
/*0x56f2*/      mov r1, sp
/*0x56f4*/      add.w r0, r5, #0x9d
/*0x56f8*/      b jump_5708
            jump_56fa:
/*0x56fa*/      ldr r0, [pc, #0x98] /* data_5794 */
/*0x56fc*/      mov r1, sp
/*0x56fe*/      adds r0, #0x9a
/*0x5700*/      b jump_5708
            jump_5702:
/*0x5702*/      ldr r0, [pc, #0x90] /* data_5794 */
/*0x5704*/      mov r1, sp
/*0x5706*/      adds r0, #0x1f
            jump_5708:
/*0x5708*/      bl call_7124
            jump_570c:
/*0x570c*/      pop {r3, r4, r5, pc}
            jump_570e:
/*0x570e*/      lsls r1, r1, #0x1e
/*0x5710*/      bpl jump_570c
/*0x5712*/      ldr r1, [pc, #0x8c] /* data_57a0 */
/*0x5714*/      ldrb r1, [r1, #3]
/*0x5716*/      cmp r1, #7
/*0x5718*/      bls jump_570c
/*0x571a*/      and r2, r1, #1
/*0x571e*/      bic r3, r1, #1
/*0x5722*/      ldr r1, [pc, #0x70] /* data_5794 */
/*0x5724*/      cmp r3, #8
/*0x5726*/      ldr r1, [r1]
/*0x5728*/      beq jump_575a
/*0x572a*/      cmp r3, #0xa
/*0x572c*/      beq jump_5768
/*0x572e*/      cmp r3, #0xc
/*0x5730*/      bne jump_570c
/*0x5732*/      ldr r0, [pc, #0x70] /* data_57a4 */
/*0x5734*/      ldrb r4, [r0, r4]
/*0x5736*/      cmp r4, #0xff
/*0x5738*/      beq jump_570c
/*0x573a*/      and r0, r4, #7
/*0x573e*/      add.w r0, r0, r0, lsl #2
/*0x5742*/      add r5, r0
/*0x5744*/      adds r5, #0xe
/*0x5746*/      cbz r2, jump_574a
/*0x5748*/      movs r1, #0
            jump_574a:
/*0x574a*/      mov r0, r5
/*0x574c*/      bl call_7124
/*0x5750*/      lsrs r0, r4, #3
/*0x5752*/      strb r0, [r5, #3]
/*0x5754*/      movs r0, #1
/*0x5756*/      strb r0, [r5, #4]
            jump_5758:
/*0x5758*/      pop {r3, r4, r5, pc}
            jump_575a:
/*0x575a*/      cbz r2, jump_575e
/*0x575c*/      movs r1, #0
            jump_575e:
/*0x575e*/      pop.w {r3, r4, r5, lr}
/*0x5762*/      adds r0, r0, #4
/*0x5764*/      b.w call_7124
            jump_5768:
/*0x5768*/      ldr r0, [pc, #0x38] /* data_57a4 */
/*0x576a*/      subs r0, #0x48
/*0x576c*/      ldrb r0, [r0, r4]
/*0x576e*/      cmp r0, #0xff
/*0x5770*/      beq jump_5758
/*0x5772*/      cbz r2, jump_5776
/*0x5774*/      movs r1, #0
            jump_5776:
/*0x5776*/      add.w r0, r0, r0, lsl #1
/*0x577a*/      add.w r4, r5, r0, lsl #1
/*0x577e*/      adds r0, r4, #4
/*0x5780*/      bl call_7124
/*0x5784*/      ldrh r0, [r4, #4]
/*0x5786*/      strh.w r0, [r4, #7]
/*0x578a*/      ldrb r0, [r4, #6]
/*0x578c*/      strb r0, [r4, #9]
/*0x578e*/      pop {r3, r4, r5, pc}

            data_5790:
/*0x5790*/  .word 0x20000644
            data_5794:
/*0x5794*/  .word 0x200000ac

/*0x5798*/  .byte 0xff
/*0x5799*/  .byte 0xff
/*0x579a*/  .byte 0xff
/*0x579b*/  .byte 0x00

            data_579c:
/*0x579c*/  .word 0x20000034
            data_57a0:
/*0x57a0*/  .word 0x20000708
            data_57a4:
/*0x57a4*/  .word 0x00007e49


            .thumb_func
            call_57a8:
/*0x57a8*/      movs r1, #0xd8
/*0x57aa*/      ldr r0, [pc, #4] /* data_57b0 */
/*0x57ac*/      b.w mem_zero

            data_57b0:
/*0x57b0*/  .word 0x2000032c


            .thumb_func
            call_57b4:
/*0x57b4*/      push {r4, lr}
/*0x57b6*/      bl call_4674
/*0x57ba*/      cmp r0, #6
/*0x57bc*/      bhs switch_57e4
/*0x57be*/      tbb [pc, r0]

/*0x57c2*/  .byte 0x03
/*0x57c3*/  .byte 0x06
/*0x57c4*/  .byte 0x09
/*0x57c5*/  .byte 0x0c
/*0x57c6*/  .byte 0x11
/*0x57c7*/  .byte 0x0f

            switch_57c8:
/*0x57c8*/      bl call_3bdc
/*0x57cc*/      b switch_57e4
            switch_57ce:
/*0x57ce*/      bl call_3c04
/*0x57d2*/      b switch_57e4
            switch_57d4:
/*0x57d4*/      bl call_3a88
/*0x57d8*/      b switch_57e4
            switch_57da:
/*0x57da*/      bl call_3d38
/*0x57de*/      b switch_57e4
            switch_57e0:
/*0x57e0*/      bl call_3b04
            switch_57e4:
/*0x57e4*/      pop.w {r4, lr}
/*0x57e8*/      nop.w 
            jump_57ec:
/*0x57ec*/      push {r4, lr}
/*0x57ee*/      ldr r4, [pc, #0x20] /* data_5810 */
/*0x57f0*/      ldrb r0, [r4, #0xc]
/*0x57f2*/      cbnz r0, jump_5808
/*0x57f4*/      ldrb r0, [r4, #6]
/*0x57f6*/      cbnz r0, jump_5808
/*0x57f8*/      ldr r0, [pc, #0x18] /* data_5814 */
/*0x57fa*/      ldrb r0, [r0]
/*0x57fc*/      lsls r0, r0, #0x1e
/*0x57fe*/      asrs r0, r0, #8
/*0x5800*/      lsrs r1, r0, #0x18
/*0x5802*/      movs r0, #8
/*0x5804*/      bl call_4114
            jump_5808:
/*0x5808*/      movs r0, #1
/*0x580a*/      strb r0, [r4, #1]
/*0x580c*/      pop {r4, pc}

/*0x580e*/  .byte 0x00
/*0x580f*/  .byte 0x00

            data_5810:
/*0x5810*/  .word 0x20000644
            data_5814:
/*0x5814*/  .word 0x20000014


            .thumb_func
            call_5818:
/*0x5818*/      push {r4, lr}
/*0x581a*/      movs r1, #0x60
/*0x581c*/      ldr r4, [pc, #0x2c] /* data_584c */
/*0x581e*/      uxtb r3, r0
/*0x5820*/      b jump_582e
            jump_5822:
/*0x5822*/      add.w r2, r4, r1, lsl #1
/*0x5826*/      ldrb.w r2, [r2, #0x28]
/*0x582a*/      cmp r3, r2
/*0x582c*/      beq jump_5842
            jump_582e:
/*0x582e*/      subs r1, r1, #1
/*0x5830*/      uxtb r1, r1
/*0x5832*/      bhs jump_5822
/*0x5834*/      ubfx r1, r0, #0x10, #8
/*0x5838*/      ldr r0, [pc, #0x10] /* data_584c */
/*0x583a*/      adds r0, #0xf2
/*0x583c*/      ldrb r0, [r1, r0]
/*0x583e*/      cmp r0, #0xff
/*0x5840*/      beq jump_5846
            jump_5842:
/*0x5842*/      movs r0, #1
/*0x5844*/      pop {r4, pc}
            jump_5846:
/*0x5846*/      movs r0, #0
/*0x5848*/      pop {r4, pc}

/*0x584a*/  .byte 0x00
/*0x584b*/  .byte 0x00

            data_584c:
/*0x584c*/  .word 0x20000708


            .thumb_func
            call_5850:
/*0x5850*/      push {r4, lr}
/*0x5852*/      ldr r4, [pc, #0x68] /* data_58bc */
/*0x5854*/      cbz r0, jump_5888
/*0x5856*/      movs r1, #0
/*0x5858*/      mov r0, r4
/*0x585a*/      bl call_37a2
/*0x585e*/      movs r1, #0
/*0x5860*/      mov r0, r4
/*0x5862*/      bl call_378e
/*0x5866*/      mov r0, r4
/*0x5868*/      bl bftm_clear
/*0x586c*/      movs r0, #0x29
/*0x586e*/      bl nvic_disable_intr
/*0x5872*/      bl call_5e64
/*0x5876*/      bl call_5a3c
/*0x587a*/      movs r0, #1
/*0x587c*/      bl call_6370
/*0x5880*/      pop.w {r4, lr}
/*0x5884*/      b.w jump_6568
            jump_5888:
/*0x5888*/      bl call_5a40
/*0x588c*/      movs r0, #0
/*0x588e*/      bl call_6370
/*0x5892*/      movs r1, #0
/*0x5894*/      mov r0, r4
/*0x5896*/      bl call_37ba
/*0x589a*/      mov r0, r4
/*0x589c*/      bl bftm_clear
/*0x58a0*/      movs r1, #1
/*0x58a2*/      mov r0, r4
/*0x58a4*/      bl call_378e
/*0x58a8*/      movs r1, #1
/*0x58aa*/      mov r0, r4
/*0x58ac*/      bl call_37a2
/*0x58b0*/      ldr r1, [pc, #0xc] /* data_58c0 */
/*0x58b2*/      mov.w r0, #0x200
/*0x58b6*/      str.w r0, [r1, #0x100]
/*0x58ba*/      pop {r4, pc}

            data_58bc:
/*0x58bc*/  .word 0x40076000
            data_58c0:
/*0x58c0*/  .word 0xe000e004


            .thumb_func
            call_58c4:
/*0x58c4*/      push {r4, lr}
/*0x58c6*/      mov r4, r0
/*0x58c8*/      cmp r0, #2
/*0x58ca*/      beq jump_58d4
/*0x58cc*/      movs r1, #0xd
/*0x58ce*/      ldr r0, [pc, #0x24] /* data_58f4 */
/*0x58d0*/      bl mem_zero
            jump_58d4:
/*0x58d4*/      cbz r4, jump_58ee
/*0x58d6*/      movs r0, #2
            jump_58d8:
/*0x58d8*/      bl call_3bf6
/*0x58dc*/      ldr r1, [pc, #0x14] /* data_58f4 */
/*0x58de*/      movs r0, #0
/*0x58e0*/      strb r0, [r1, #4]
/*0x58e2*/      bl call_54a8
/*0x58e6*/      pop.w {r4, lr}
/*0x58ea*/      b.w call_5d08
            jump_58ee:
/*0x58ee*/      movs r0, #1
/*0x58f0*/      b jump_58d8

/*0x58f2*/  .byte 0x00
/*0x58f3*/  .byte 0x00

            data_58f4:
/*0x58f4*/  .word 0x20000644


            .thumb_func
            call_58f8:
/*0x58f8*/      push {r4, lr}
/*0x58fa*/      movs r0, #0
/*0x58fc*/      mov.w r2, #0x10000
/*0x5900*/      movs r3, #1
/*0x5902*/      mov r1, r0
/*0x5904*/      bl ckcu_clocks_enable
/*0x5908*/      pop.w {r4, lr}
/*0x590c*/      movw r1, #0x8c9f
/*0x5910*/      ldr r0, [pc, #4] /* data_5918 */
/*0x5912*/      b.w call_37b6

/*0x5916*/  .byte 0x00
/*0x5917*/  .byte 0x00

            data_5918:
/*0x5918*/  .word 0x40076000


            .thumb_func
            setup_intr_priority:
/*0x591c*/      push {r4, lr}
/*0x591e*/      mov.w r1, #0x3400
/*0x5922*/      movs r0, #0
/*0x5924*/      bl nvic_set_vtor
/*0x5928*/      ldr r1, [pc, #0x70] /* data_599c */
/*0x592a*/      ldr r0, [r1]
/*0x592c*/      movw r2, #0xf8ff
/*0x5930*/      ands r0, r2
/*0x5932*/      ldr r2, [pc, #0x6c] /* data_59a0 */
/*0x5934*/      orr r0, r0, #0x300
/*0x5938*/      orrs r0, r2
/*0x593a*/      str r0, [r1]
/*0x593c*/      movs r2, #0
/*0x593e*/      mov r1, r2
/*0x5940*/      movs r0, #3
/*0x5942*/      bl calc_nvic_priority
/*0x5946*/      mov r1, r0
/*0x5948*/      movs r0, #0x2b
/*0x594a*/      bl ppb_set_nvic_priority
/*0x594e*/      movs r2, #0
/*0x5950*/      mov r1, r2
/*0x5952*/      movs r0, #3
/*0x5954*/      bl calc_nvic_priority
/*0x5958*/      mov r1, r0
/*0x595a*/      movs r0, #0x2c
/*0x595c*/      bl ppb_set_nvic_priority
/*0x5960*/      movs r2, #0
/*0x5962*/      movs r1, #1
/*0x5964*/      movs r0, #3
/*0x5966*/      bl calc_nvic_priority
/*0x596a*/      mov r1, r0
/*0x596c*/      movs r0, #0x2a
/*0x596e*/      bl ppb_set_nvic_priority
/*0x5972*/      movs r2, #0
/*0x5974*/      movs r1, #2
/*0x5976*/      movs r0, #3
/*0x5978*/      bl calc_nvic_priority
/*0x597c*/      mov r1, r0
/*0x597e*/      movs r0, #0x29
/*0x5980*/      bl ppb_set_nvic_priority
/*0x5984*/      movs r2, #0
/*0x5986*/      movs r1, #2
/*0x5988*/      movs r0, #3
/*0x598a*/      bl calc_nvic_priority
/*0x598e*/      mov r1, r0
/*0x5990*/      pop.w {r4, lr}
/*0x5994*/      movs r0, #0x35
/*0x5996*/      b.w ppb_set_nvic_priority

/*0x599a*/  .byte 0x00
/*0x599b*/  .byte 0x00

            data_599c:
/*0x599c*/  .word 0xe000ed0c
            data_59a0:
/*0x59a0*/  .word 0x05fa0000


            .thumb_func
            nvic_disable_intr:
/*0x59a4*/      and r2, r0, #0x1f
/*0x59a8*/      movs r1, #1
/*0x59aa*/      lsls r1, r2
/*0x59ac*/      lsrs r0, r0, #5
/*0x59ae*/      lsls r0, r0, #2
/*0x59b0*/      add.w r0, r0, #-0x1fff2000
/*0x59b4*/      str.w r1, [r0, #0x180]
/*0x59b8*/      bx lr

            .thumb_func
            calc_nvic_priority:
/*0x59ba*/      push {r4, r5, lr}
/*0x59bc*/      and r3, r0, #7
/*0x59c0*/      rsb.w r4, r3, #7
/*0x59c4*/      cmp r4, #4
/*0x59c6*/      bls jump_59ca
/*0x59c8*/      movs r4, #4
            jump_59ca:
/*0x59ca*/      adds r0, r3, #4
/*0x59cc*/      cmp r0, #7
/*0x59ce*/      bhs jump_59d4
/*0x59d0*/      movs r3, #0
/*0x59d2*/      b jump_59d6
            jump_59d4:
/*0x59d4*/      subs r3, r3, #3
            jump_59d6:
/*0x59d6*/      movs r5, #1
/*0x59d8*/      lsl.w r0, r5, r4
/*0x59dc*/      subs r0, r0, #1
/*0x59de*/      ands r0, r1
/*0x59e0*/      lsls r0, r3
/*0x59e2*/      lsls r5, r3
/*0x59e4*/      subs r5, r5, #1
/*0x59e6*/      ands r5, r2
/*0x59e8*/      orrs r0, r5
/*0x59ea*/      pop {r4, r5, pc}

            .thumb_func
            ppb_set_nvic_priority:
/*0x59ec*/      lsls r1, r1, #0x1c
/*0x59ee*/      lsrs r1, r1, #0x18
/*0x59f0*/      cmp r0, #0
/*0x59f2*/      bge jump_5a02
/*0x59f4*/      and r0, r0, #0xf
/*0x59f8*/      add.w r0, r0, #-0x1fff2000
/*0x59fc*/      strb.w r1, [r0, #0xd14]
/*0x5a00*/      bx lr
            jump_5a02:
/*0x5a02*/      add.w r0, r0, #-0x1fff2000
/*0x5a06*/      strb.w r1, [r0, #0x400]
/*0x5a0a*/      bx lr

            .thumb_func
            nvic_set_vtor:
/*0x5a0c*/      ldr r2, [pc, #8] /* data_5a18 */
/*0x5a0e*/      ands r1, r2
/*0x5a10*/      orrs r1, r0
/*0x5a12*/      ldr r0, [pc, #8] /* data_5a1c */
/*0x5a14*/      str r1, [r0]
/*0x5a16*/      bx lr

            data_5a18:
/*0x5a18*/  .word 0x1fffff80
            data_5a1c:
/*0x5a1c*/  .word 0xe000ed08


            .thumb_func
            call_5a20:
/*0x5a20*/      push {r4, lr}
/*0x5a22*/      bl call_41d8
/*0x5a26*/      bl call_4154
/*0x5a2a*/      cmp r0, #1
/*0x5a2c*/      bne jump_5a38
/*0x5a2e*/      movs r0, #2
/*0x5a30*/      bl call_67e2
/*0x5a34*/      cmp r0, #1
/*0x5a36*/      beq jump_5a3a
            jump_5a38:
/*0x5a38*/      movs r0, #0
            jump_5a3a:
/*0x5a3a*/      pop {r4, pc}

            .thumb_func
            call_5a3c:
/*0x5a3c*/      b.w jump_4228

            .thumb_func
            call_5a40:
/*0x5a40*/      b.w call_426c

            .thumb_func
            call_5a44:
/*0x5a44*/      push {r4, r5, r6, lr}
/*0x5a46*/      ldr r4, [pc, #0xa4] /* data_5aec */
/*0x5a48*/      movs r5, #0
/*0x5a4a*/      ldrb r0, [r4, #6]
/*0x5a4c*/      cmp r0, #1
/*0x5a4e*/      beq jump_5a82
/*0x5a50*/      cmp r0, #2
/*0x5a52*/      bne jump_5aea
/*0x5a54*/      subs r1, r4, #4
/*0x5a56*/      ldrh r0, [r1]
/*0x5a58*/      cbz r0, jump_5ad2
/*0x5a5a*/      ldr r2, [pc, #0x94] /* data_5af0 */
/*0x5a5c*/      ldr r2, [r2]
/*0x5a5e*/      cmp r2, #0
/*0x5a60*/      bne jump_5aea
/*0x5a62*/      cmp r0, #0xff
/*0x5a64*/      bhi jump_5a78
/*0x5a66*/      ldr r2, [pc, #0x8c] /* data_5af4 */
/*0x5a68*/      ldr r2, [r2]
/*0x5a6a*/      add.w r0, r2, r0, lsl #2
/*0x5a6e*/      movs r2, #7
/*0x5a70*/      ldrb r0, [r0, #1]
/*0x5a72*/      cmp.w r2, r0, lsr #5
/*0x5a76*/      bne jump_5ada
            jump_5a78:
/*0x5a78*/      ldrb r0, [r4, #8]
/*0x5a7a*/      cmp r0, #1
/*0x5a7c*/      beq jump_5ae2
/*0x5a7e*/      strh r5, [r1]
/*0x5a80*/      b jump_5ada
            jump_5a82:
/*0x5a82*/      ldr r0, [pc, #0x74] /* data_5af8 */
/*0x5a84*/      ldrb r0, [r0, #3]
/*0x5a86*/      lsls r0, r0, #0x1e
/*0x5a88*/      bmi jump_5aa0
/*0x5a8a*/      ldrb r0, [r4, #7]
/*0x5a8c*/      cmp r0, #1
/*0x5a8e*/      bne jump_5aa0
/*0x5a90*/      bl call_4ae0
/*0x5a94*/      cmp r0, #1
/*0x5a96*/      bne jump_5aa0
/*0x5a98*/      movs r0, #2
/*0x5a9a*/      strb r0, [r4, #7]
/*0x5a9c*/      ldr r0, [pc, #0x5c] /* data_5afc */
/*0x5a9e*/      strh r5, [r0]
            jump_5aa0:
/*0x5aa0*/      ldrb r0, [r4, #7]
/*0x5aa2*/      cmp r0, #3
/*0x5aa4*/      beq jump_5ac2
/*0x5aa6*/      cmp r0, #6
/*0x5aa8*/      beq jump_5ab2
/*0x5aaa*/      cmp r0, #7
/*0x5aac*/      beq jump_5ab2
/*0x5aae*/      cmp r0, #8
/*0x5ab0*/      bne jump_5aea
            jump_5ab2:
/*0x5ab2*/      bl call_4ae0
/*0x5ab6*/      cmp r0, #1
/*0x5ab8*/      bne jump_5aea
/*0x5aba*/      pop.w {r4, r5, r6, lr}
/*0x5abe*/      b.w jump_5c28
            jump_5ac2:
/*0x5ac2*/      bl call_4ae0
/*0x5ac6*/      cmp r0, #1
/*0x5ac8*/      bne jump_5aea
/*0x5aca*/      pop.w {r4, r5, r6, lr}
/*0x5ace*/      b.w jump_7398
            jump_5ad2:
/*0x5ad2*/      ldrb r0, [r1, #2]
/*0x5ad4*/      movs r1, #0
/*0x5ad6*/      bl call_3d9c
            jump_5ada:
/*0x5ada*/      pop.w {r4, r5, r6, lr}
/*0x5ade*/      b.w jump_726c
            jump_5ae2:
/*0x5ae2*/      pop.w {r4, r5, r6, lr}
/*0x5ae6*/      b.w call_5d08
            jump_5aea:
/*0x5aea*/      pop {r4, r5, r6, pc}

            data_5aec:
/*0x5aec*/  .word 0x20001970
            data_5af0:
/*0x5af0*/  .word 0x2000006c
            data_5af4:
/*0x5af4*/  .word 0x20000064
            data_5af8:
/*0x5af8*/  .word 0x20000034
            data_5afc:
/*0x5afc*/  .word 0x20000024


            .thumb_func
            call_5b00:
/*0x5b00*/      ldr r0, [pc, #0x28] /* data_5b2c */
/*0x5b02*/      push {r4, lr}
/*0x5b04*/      ldrb r0, [r0, #6]
/*0x5b06*/      cmp r0, #1
/*0x5b08*/      beq jump_5b26
/*0x5b0a*/      ldr r0, [pc, #0x24] /* data_5b30 */
/*0x5b0c*/      ldr r0, [r0]
/*0x5b0e*/      bl call_4a4a
/*0x5b12*/      movs r1, #3
/*0x5b14*/      bl call_53ac
/*0x5b18*/      cmp r0, #0xff
/*0x5b1a*/      beq jump_5b26
/*0x5b1c*/      ldr r1, [pc, #0x10] /* data_5b30 */
/*0x5b1e*/      bl call_4a40
/*0x5b22*/      movs r0, #1
/*0x5b24*/      pop {r4, pc}
            jump_5b26:
/*0x5b26*/      movs r0, #0
/*0x5b28*/      pop {r4, pc}

/*0x5b2a*/  .byte 0x00
/*0x5b2b*/  .byte 0x00

            data_5b2c:
/*0x5b2c*/  .word 0x20001970
            data_5b30:
/*0x5b30*/  .word 0x20000034


            .thumb_func
            call_5b34:
/*0x5b34*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5b38*/      ldr r4, [pc, #0xdc] /* data_5c18 */
/*0x5b3a*/      ldr r5, [pc, #0xe0] /* data_5c1c */
/*0x5b3c*/      subs r6, r4, #4
/*0x5b3e*/      ldrb r0, [r4, #6]
/*0x5b40*/      cbz r0, jump_5b4c
/*0x5b42*/      cmp r0, #1
/*0x5b44*/      beq jump_5bbe
/*0x5b46*/      cmp r0, #2
/*0x5b48*/      bne jump_5be2
/*0x5b4a*/      b jump_5b8c
            jump_5b4c:
/*0x5b4c*/      bl call_7188
/*0x5b50*/      mov r7, r0
/*0x5b52*/      cmp r0, #0x60
/*0x5b54*/      bhs jump_5be2
/*0x5b56*/      ldrb r0, [r5, #3]
/*0x5b58*/      lsls r0, r0, #0x1e
/*0x5b5a*/      bpl jump_5c0e
/*0x5b5c*/      ldrb r0, [r4, #6]
/*0x5b5e*/      cbz r0, jump_5b66
/*0x5b60*/      movs r0, #0
/*0x5b62*/      bl call_46cc
            jump_5b66:
/*0x5b66*/      ldr r0, [r5]
/*0x5b68*/      bl call_4a4a
/*0x5b6c*/      strh r0, [r4, #4]
/*0x5b6e*/      movs r0, #2
/*0x5b70*/      strb r0, [r4, #6]
/*0x5b72*/      ldr r0, [pc, #0xac] /* data_5c20 */
/*0x5b74*/      add.w r0, r0, r7, lsl #1
/*0x5b78*/      ldrb.w r0, [r0, #0x29]
/*0x5b7c*/      lsrs r0, r0, #5
/*0x5b7e*/      strb r0, [r4, #8]
/*0x5b80*/      movs r0, #0
/*0x5b82*/      strh r0, [r6]
/*0x5b84*/      strb r7, [r6, #2]
/*0x5b86*/      bl call_71d4
/*0x5b8a*/      b jump_5c0e
            jump_5b8c:
/*0x5b8c*/      ldrb r0, [r5, #3]
/*0x5b8e*/      lsls r1, r0, #0x1e
/*0x5b90*/      ldr r0, [pc, #0x88] /* data_5c1c */
/*0x5b92*/      ldr r0, [r0]
/*0x5b94*/      bpl jump_5bac
/*0x5b96*/      bl call_4a4a
/*0x5b9a*/      ldrh r1, [r4, #4]
/*0x5b9c*/      cmp r0, r1
/*0x5b9e*/      bne jump_5b4c
/*0x5ba0*/      ldrb r0, [r4, #8]
/*0x5ba2*/      cmp r0, #3
/*0x5ba4*/      bne jump_5b4c
            jump_5ba6:
/*0x5ba6*/      bl call_5d08
/*0x5baa*/      b jump_5c0e
            jump_5bac:
/*0x5bac*/      bl call_4a4a
/*0x5bb0*/      ldrh r1, [r4, #4]
/*0x5bb2*/      cmp r0, r1
/*0x5bb4*/      bne jump_5be2
/*0x5bb6*/      ldrb r0, [r4, #8]
/*0x5bb8*/      cmp r0, #2
/*0x5bba*/      beq jump_5ba6
/*0x5bbc*/      b jump_5c0e
            jump_5bbe:
/*0x5bbe*/      bl call_4fc8
/*0x5bc2*/      cbnz r0, jump_5c0a
/*0x5bc4*/      ldrb r0, [r4, #7]
/*0x5bc6*/      cmp r0, #5
/*0x5bc8*/      beq jump_5be8
/*0x5bca*/      ldrb r1, [r5, #3]
/*0x5bcc*/      lsls r1, r1, #0x1e
/*0x5bce*/      bpl jump_5be2
/*0x5bd0*/      cmp r0, #1
/*0x5bd2*/      beq jump_5c0e
/*0x5bd4*/      movs r7, #1
/*0x5bd6*/      cmp r0, #2
/*0x5bd8*/      beq jump_5bf0
/*0x5bda*/      cmp r0, #3
/*0x5bdc*/      beq jump_5c0c
/*0x5bde*/      cmp r0, #4
/*0x5be0*/      beq jump_5c12
            jump_5be2:
/*0x5be2*/      movs r0, #0
            jump_5be4:
/*0x5be4*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5be8:
/*0x5be8*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x5bec*/      b.w jump_7324
            jump_5bf0:
/*0x5bf0*/      bl call_71e8
/*0x5bf4*/      ldrb r0, [r6, #2]
/*0x5bf6*/      cmp r0, #0x60
/*0x5bf8*/      beq jump_5c0c
/*0x5bfa*/      ldr r0, [r5]
/*0x5bfc*/      bl call_4a4a
/*0x5c00*/      strh r0, [r4, #4]
/*0x5c02*/      movs r0, #3
/*0x5c04*/      strb r0, [r4, #7]
/*0x5c06*/      ldr r0, [pc, #0x1c] /* data_5c24 */
/*0x5c08*/      strb r7, [r0]
            jump_5c0a:
/*0x5c0a*/      b jump_5c0e
            jump_5c0c:
/*0x5c0c*/      strb r7, [r4, #7]
            jump_5c0e:
/*0x5c0e*/      movs r0, #1
/*0x5c10*/      b jump_5be4
            jump_5c12:
/*0x5c12*/      movs r0, #5
/*0x5c14*/      strb r0, [r4, #7]
/*0x5c16*/      b jump_5be8

            data_5c18:
/*0x5c18*/  .word 0x20001970
            data_5c1c:
/*0x5c1c*/  .word 0x20000034
            data_5c20:
/*0x5c20*/  .word 0x20000708
            data_5c24:
/*0x5c24*/  .word 0x20000644

            jump_5c28:
/*0x5c28*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5c2c*/      ldr r5, [pc, #0xb0] /* data_5ce0 */
/*0x5c2e*/      mov.w r8, #1
/*0x5c32*/      ldrb r0, [r5, #7]
/*0x5c34*/      cmp r0, #8
/*0x5c36*/      beq jump_5ccc
/*0x5c38*/      subs r6, r5, #4
/*0x5c3a*/      ldr r1, [pc, #0xa8] /* data_5ce4 */
/*0x5c3c*/      ldrb r0, [r6, #2]
/*0x5c3e*/      ldr r7, [pc, #0xa8] /* data_5ce8 */
/*0x5c40*/      add.w r4, r1, r0, lsl #1
/*0x5c44*/      mov r0, r5
/*0x5c46*/      ldrh r1, [r6]
/*0x5c48*/      ldrh r0, [r0, #4]
/*0x5c4a*/      adds r4, #0x28
/*0x5c4c*/      cmp r1, #2
/*0x5c4e*/      bne jump_5c6e
/*0x5c50*/      ldr r2, [r7]
/*0x5c52*/      ldrh r1, [r2]
/*0x5c54*/      ldrh r2, [r2, #4]
/*0x5c56*/      ubfx r1, r1, #0, #0xa
/*0x5c5a*/      ubfx r2, r2, #0, #0xa
/*0x5c5e*/      cmp r1, r2
/*0x5c60*/      bne jump_5c6e
/*0x5c62*/      bl call_53ac
/*0x5c66*/      movw r0, #0xffff
/*0x5c6a*/      strh r0, [r4]
/*0x5c6c*/      b jump_5cb2
            jump_5c6e:
/*0x5c6e*/      movs r1, #0xff
/*0x5c70*/      bl call_53ac
/*0x5c74*/      ldrb r0, [r5, #8]
/*0x5c76*/      cmp r0, #1
/*0x5c78*/      beq jump_5cc4
/*0x5c7a*/      bl call_7164
            jump_5c7e:
/*0x5c7e*/      ldrh r1, [r6]
/*0x5c80*/      ldr r2, [r7]
/*0x5c82*/      add.w r1, r2, r1, lsl #2
/*0x5c86*/      mov.w r2, #0x1c00
/*0x5c8a*/      strh r0, [r1, #-0x2]
/*0x5c8e*/      ldrb r1, [r5, #8]
/*0x5c90*/      ldrh r0, [r5, #4]
/*0x5c92*/      orr.w r1, r2, r1, lsl #13
/*0x5c96*/      orrs r0, r1
/*0x5c98*/      strh r0, [r4]
/*0x5c9a*/      ldrh r0, [r6]
/*0x5c9c*/      cmp r0, #0xff
/*0x5c9e*/      bhi jump_5caa
/*0x5ca0*/      ldr r2, [r7]
/*0x5ca2*/      mov.w r1, #0xfc00
/*0x5ca6*/      strh.w r1, [r2, r0, lsl #2]
            jump_5caa:
/*0x5caa*/      ldrb r0, [r6, #2]
/*0x5cac*/      movs r1, #1
/*0x5cae*/      bl call_3d9c
            jump_5cb2:
/*0x5cb2*/      bl call_3f98
/*0x5cb6*/      ldrb r0, [r5, #7]
/*0x5cb8*/      cmp r0, #7
/*0x5cba*/      beq jump_5cc8
/*0x5cbc*/      strb.w r8, [r5, #7]
            jump_5cc0:
/*0x5cc0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5cc4:
/*0x5cc4*/      movs r0, #0
/*0x5cc6*/      b jump_5c7e
            jump_5cc8:
/*0x5cc8*/      movs r0, #8
/*0x5cca*/      strb r0, [r5, #7]
            jump_5ccc:
/*0x5ccc*/      ldr r1, [pc, #0x1c] /* data_5cec */
/*0x5cce*/      movs r0, #0
/*0x5cd0*/      strb r0, [r5, #6]
/*0x5cd2*/      str r0, [r1]
/*0x5cd4*/      ldr r1, [pc, #0x18] /* data_5cf0 */
/*0x5cd6*/      strb r0, [r5, #7]
/*0x5cd8*/      strb.w r8, [r1]
/*0x5cdc*/      b jump_5cc0

/*0x5cde*/  .byte 0x00
/*0x5cdf*/  .byte 0x00

            data_5ce0:
/*0x5ce0*/  .word 0x20001970
            data_5ce4:
/*0x5ce4*/  .word 0x20000708
            data_5ce8:
/*0x5ce8*/  .word 0x20000064
            data_5cec:
/*0x5cec*/  .word 0x2000006c
            data_5cf0:
/*0x5cf0*/  .word 0x20000644


            .thumb_func
            call_5cf4:
/*0x5cf4*/      ldr r0, [pc, #0xc] /* data_5d04 */
/*0x5cf6*/      ldrb r1, [r0, #6]
/*0x5cf8*/      cmp r1, #0
/*0x5cfa*/      bne jump_5d02
/*0x5cfc*/      movs r1, #1
/*0x5cfe*/      strb r1, [r0, #6]
/*0x5d00*/      strb r1, [r0, #7]
            jump_5d02:
/*0x5d02*/      bx lr

            data_5d04:
/*0x5d04*/  .word 0x20001970


            .thumb_func
            call_5d08:
/*0x5d08*/      push {r3, r4, r5, r6, r7, lr}
/*0x5d0a*/      ldr r6, [pc, #0x78] /* data_5d84 */
/*0x5d0c*/      movs r7, #0
/*0x5d0e*/      ldrb r0, [r6, #6]
/*0x5d10*/      cmp r0, #2
/*0x5d12*/      bne jump_5d80
/*0x5d14*/      subs r5, r6, #4
/*0x5d16*/      ldrh r0, [r5]
/*0x5d18*/      cbz r0, jump_5d80
/*0x5d1a*/      ldr r1, [pc, #0x6c] /* data_5d88 */
/*0x5d1c*/      str r7, [sp]
/*0x5d1e*/      ldr r1, [r1]
/*0x5d20*/      add.w r4, r1, r0, lsl #2
/*0x5d24*/      ldrb.w r0, [sp, #3]
/*0x5d28*/      orr r0, r0, #5
/*0x5d2c*/      strb.w r0, [sp, #3]
/*0x5d30*/      b jump_5d76
            jump_5d32:
/*0x5d32*/      ldrb r0, [r4, #1]
/*0x5d34*/      lsrs r0, r0, #5
/*0x5d36*/      cmp r0, #2
/*0x5d38*/      beq jump_5d40
/*0x5d3a*/      cmp r0, #7
/*0x5d3c*/      bne jump_5d6e
/*0x5d3e*/      b jump_5d6a
            jump_5d40:
/*0x5d40*/      ldrh r0, [r4]
/*0x5d42*/      mov r1, sp
/*0x5d44*/      bl call_4a40
/*0x5d48*/      ldrb.w r0, [sp, #1]
/*0x5d4c*/      lsls r0, r0, #0x1f
/*0x5d4e*/      ldrb.w r0, [sp]
/*0x5d52*/      beq jump_5d5a
/*0x5d54*/      bl call_4720
/*0x5d58*/      b jump_5d5e
            jump_5d5a:
/*0x5d5a*/      ldr r1, [pc, #0x30] /* data_5d8c */
/*0x5d5c*/      ldrb r0, [r1, r0]
            jump_5d5e:
/*0x5d5e*/      strb.w r0, [sp, #2]
/*0x5d62*/      ldr r0, [sp]
/*0x5d64*/      bl call_47c4
/*0x5d68*/      b jump_5d6e
            jump_5d6a:
/*0x5d6a*/      movs r0, #0xff
/*0x5d6c*/      strh r0, [r5]
            jump_5d6e:
/*0x5d6e*/      ldrh r0, [r5]
/*0x5d70*/      adds r0, r0, #1
/*0x5d72*/      strh r0, [r5]
/*0x5d74*/      adds r4, r4, #4
            jump_5d76:
/*0x5d76*/      ldrh r0, [r5]
/*0x5d78*/      cmp r0, #0xff
/*0x5d7a*/      bls jump_5d32
/*0x5d7c*/      bl call_71d4
            jump_5d80:
/*0x5d80*/      strb r7, [r6, #6]
/*0x5d82*/      pop {r3, r4, r5, r6, r7, pc}

            data_5d84:
/*0x5d84*/  .word 0x20001970
            data_5d88:
/*0x5d88*/  .word 0x20000064
            data_5d8c:
/*0x5d8c*/  .word 0x200001de


            .thumb_func
            call_5d90:
/*0x5d90*/      ldr r0, [pc, #0x3c] /* data_5dd0 */
/*0x5d92*/      push {r4, lr}
/*0x5d94*/      ldr r0, [r0]
/*0x5d96*/      bl call_4a4a
/*0x5d9a*/      mov r4, r0
/*0x5d9c*/      movs r1, #3
/*0x5d9e*/      bl call_53ac
/*0x5da2*/      cmp r0, #0xff
/*0x5da4*/      beq jump_5db0
/*0x5da6*/      movs r1, #0xff
/*0x5da8*/      mov r0, r4
/*0x5daa*/      bl call_53ac
/*0x5dae*/      b jump_5dc4
            jump_5db0:
/*0x5db0*/      bl call_7188
/*0x5db4*/      cmp r0, #0x60
/*0x5db6*/      bhs jump_5dcc
/*0x5db8*/      ldr r2, [pc, #0x18] /* data_5dd4 */
/*0x5dba*/      movw r1, #0xffff
/*0x5dbe*/      add.w r0, r2, r0, lsl #1
/*0x5dc2*/      strh r1, [r0, #0x28]
            jump_5dc4:
/*0x5dc4*/      bl call_3f98
/*0x5dc8*/      movs r0, #1
/*0x5dca*/      pop {r4, pc}
            jump_5dcc:
/*0x5dcc*/      movs r0, #0
/*0x5dce*/      pop {r4, pc}

            data_5dd0:
/*0x5dd0*/  .word 0x20000034
            data_5dd4:
/*0x5dd4*/  .word 0x20000708


            .thumb_func
            call_5dd8:
/*0x5dd8*/      push {r3, r4, r5, lr}
/*0x5dda*/      ldr r4, [pc, #0x30] /* data_5e0c */
/*0x5ddc*/      movs r5, #0x48
/*0x5dde*/      b jump_5e02
            jump_5de0:
/*0x5de0*/      mov r1, sp
/*0x5de2*/      mov r0, r5
/*0x5de4*/      bl call_5e10
/*0x5de8*/      ldrb.w r0, [sp, #2]
/*0x5dec*/      strb r0, [r4]
/*0x5dee*/      sub.w r0, r4, #0x48
/*0x5df2*/      ldrb.w r1, [sp, #1]
/*0x5df6*/      strb r1, [r0]
/*0x5df8*/      subs r0, #0x48
/*0x5dfa*/      ldrb.w r1, [sp]
/*0x5dfe*/      strb r1, [r0]
/*0x5e00*/      subs r4, r4, #1
            jump_5e02:
/*0x5e02*/      subs r5, r5, #1
/*0x5e04*/      uxtb r5, r5
/*0x5e06*/      bhs jump_5de0
/*0x5e08*/      pop {r3, r4, r5, pc}

/*0x5e0a*/  .byte 0x00
/*0x5e0b*/  .byte 0x00

            data_5e0c:
/*0x5e0c*/  .word 0x20000403


            .thumb_func
            call_5e10:
/*0x5e10*/      ldr r2, [pc, #0x30] /* data_5e44 */
/*0x5e12*/      movs r3, #0xc
/*0x5e14*/      ldrb r0, [r2, r0]
/*0x5e16*/      and r2, r0, #7
/*0x5e1a*/      lsrs r0, r0, #3
/*0x5e1c*/      rsb r0, r0, r0, lsl #8
/*0x5e20*/      udiv r0, r0, r3
/*0x5e24*/      uxtb r0, r0
/*0x5e26*/      strb r0, [r1]
/*0x5e28*/      cmp r2, #3
/*0x5e2a*/      beq jump_5e3e
/*0x5e2c*/      rsb.w r2, r2, #5
/*0x5e30*/      movs r3, #0x2b
/*0x5e32*/      muls r2, r3, r2
/*0x5e34*/      uxtb r3, r2
/*0x5e36*/      mov r2, r1
/*0x5e38*/      mov r1, r3
/*0x5e3a*/      b.w call_402c
            jump_5e3e:
/*0x5e3e*/      strb r0, [r1, #1]
/*0x5e40*/      strb r0, [r1, #2]
/*0x5e42*/      bx lr

            data_5e44:
/*0x5e44*/  .word 0x00007e49


            .thumb_func
            call_5e48:
/*0x5e48*/      ldr r1, [pc, #4] /* data_5e50 */
/*0x5e4a*/      strb r0, [r1]
/*0x5e4c*/      b.w jump_57ec

            data_5e50:
/*0x5e50*/  .word 0x20000014


            .thumb_func
            call_5e54:
/*0x5e54*/      mov.w r2, #0x200
/*0x5e58*/      movs r1, #0
/*0x5e5a*/      lsls r0, r2, #9
/*0x5e5c*/      movs r3, #1
/*0x5e5e*/      b.w ckcu_clocks_enable

/*0x5e62*/  .byte 0x00
/*0x5e63*/  .byte 0x00


            .thumb_func
            call_5e64:
/*0x5e64*/      push {r4, lr}
/*0x5e66*/      movs r2, #0
/*0x5e68*/      movs r1, #1
/*0x5e6a*/      ldr r0, [pc, #0x14] /* data_5e80 */
/*0x5e6c*/      bl call_45a8
/*0x5e70*/      movs r2, #0
/*0x5e72*/      pop.w {r4, lr}
/*0x5e76*/      mov r1, r2
/*0x5e78*/      movs r0, #2
/*0x5e7a*/      b.w afio_pin_config

/*0x5e7e*/  .byte 0x00
/*0x5e7f*/  .byte 0x00

            data_5e80:
/*0x5e80*/  .word 0x400b4000


            .thumb_func
            call_5e84:
/*0x5e84*/      push {r4, lr}
/*0x5e86*/      movs r2, #2
/*0x5e88*/      movs r1, #1
/*0x5e8a*/      ldr r0, [pc, #0x14] /* data_5ea0 */
/*0x5e8c*/      bl call_45a8
/*0x5e90*/      movs r2, #4
/*0x5e92*/      movs r1, #0
/*0x5e94*/      pop.w {r4, lr}
/*0x5e98*/      movs r0, #2
/*0x5e9a*/      b.w afio_pin_config

/*0x5e9e*/  .byte 0x00
/*0x5e9f*/  .byte 0x00

            data_5ea0:
/*0x5ea0*/  .word 0x400b4000


            .thumb_func
            call_5ea4:
/*0x5ea4*/      push {r4, r5, r6, lr}
/*0x5ea6*/      ldr r1, [pc, #0x34] /* data_5edc */
/*0x5ea8*/      ldr r4, [r1]
/*0x5eaa*/      ldr r5, [pc, #0x30] /* data_5edc */
/*0x5eac*/      adds r5, #0x48
/*0x5eae*/      ldr r3, [r5]
/*0x5eb0*/      movs r2, #1
/*0x5eb2*/      str r2, [r1]
/*0x5eb4*/      movs r2, #0
/*0x5eb6*/      str r2, [r5]
/*0x5eb8*/      ldr r6, [pc, #0x24] /* data_5ee0 */
/*0x5eba*/      str.w r2, [r6, #0x9c]
/*0x5ebe*/      str.w r2, [r6, #0x8c]
/*0x5ec2*/      str r4, [r1]
/*0x5ec4*/      ldr r1, [pc, #0x1c] /* data_5ee4 */
/*0x5ec6*/      ldr r2, [r1]
/*0x5ec8*/      orr r2, r2, #4
/*0x5ecc*/      str r2, [r1]
/*0x5ece*/      cbz r0, jump_5ed6
/*0x5ed0*/      wfi 
            jump_5ed2:
/*0x5ed2*/      str r3, [r5]
/*0x5ed4*/      pop {r4, r5, r6, pc}
            jump_5ed6:
/*0x5ed6*/      wfe 
/*0x5ed8*/      b jump_5ed2

/*0x5eda*/  .byte 0x00
/*0x5edb*/  .byte 0x00

            data_5edc:
/*0x5edc*/  .word 0x43100618
            data_5ee0:
/*0x5ee0*/  .word 0x42d42000
            data_5ee4:
/*0x5ee4*/  .word 0xe000ed10

            jump_5ee8:
/*0x5ee8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5eec*/      ldr r4, [pc, #0x38] /* data_5f28 */
/*0x5eee*/      ldr r7, [r4]
/*0x5ef0*/      ldr r5, [pc, #0x34] /* data_5f28 */
/*0x5ef2*/      adds r5, #0x48
/*0x5ef4*/      ldr r6, [r5]
/*0x5ef6*/      mov.w sb, #1
/*0x5efa*/      str.w sb, [r4]
/*0x5efe*/      mov.w r8, #0
/*0x5f02*/      str.w r8, [r5]
/*0x5f06*/      bl call_6118
/*0x5f0a*/      ldr r0, [pc, #0x20] /* data_5f2c */
/*0x5f0c*/      str.w r8, [r0, #0x9c]
/*0x5f10*/      str.w sb, [r0, #0x8c]
/*0x5f14*/      str r7, [r4]
/*0x5f16*/      ldr r0, [pc, #0x18] /* data_5f30 */
/*0x5f18*/      ldr r1, [r0]
/*0x5f1a*/      orr r1, r1, #4
/*0x5f1e*/      str r1, [r0]
/*0x5f20*/      wfe 
/*0x5f22*/      str r6, [r5]
/*0x5f24*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5f28:
/*0x5f28*/  .word 0x43100618
            data_5f2c:
/*0x5f2c*/  .word 0x42d42000
            data_5f30:
/*0x5f30*/  .word 0xe000ed10


            .thumb_func
            call_5f34:
/*0x5f34*/      ldr r1, [pc, #0x10] /* data_5f48 */
/*0x5f36*/      ldr r2, [r1]
/*0x5f38*/      bic r2, r2, #4
/*0x5f3c*/      str r2, [r1]
/*0x5f3e*/      cbz r0, jump_5f44
/*0x5f40*/      wfi 
/*0x5f42*/      bx lr
            jump_5f44:
/*0x5f44*/      wfe 
/*0x5f46*/      bx lr

            data_5f48:
/*0x5f48*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x5f4c*/      push {r4, r5, r6, lr}
/*0x5f4e*/      ldr r6, [pc, #0xd4] /* data_6024 */
/*0x5f50*/      ldrb r0, [r6]
/*0x5f52*/      cmp r0, #1
/*0x5f54*/      bne jump_6010
/*0x5f56*/      ldr r5, [pc, #0xd0] /* data_6028 */
/*0x5f58*/      movs r4, #0
/*0x5f5a*/      mov r0, r5
/*0x5f5c*/      ldrb r2, [r5]
/*0x5f5e*/      ldrb r0, [r0, #1]
/*0x5f60*/      mov r1, r4
/*0x5f62*/      cmp r2, #0x10
/*0x5f64*/      beq jump_5f70
/*0x5f66*/      cmp r2, #0x11
/*0x5f68*/      beq jump_5f7a
/*0x5f6a*/      cmp r2, #0x12
/*0x5f6c*/      bne jump_6012
/*0x5f6e*/      b jump_5f80
            jump_5f70:
/*0x5f70*/      cmp r0, #2
/*0x5f72*/      bne jump_6012
/*0x5f74*/      str r1, [r5, #4]
/*0x5f76*/      movs r1, #4
/*0x5f78*/      b jump_5ff4
            jump_5f7a:
/*0x5f7a*/      bl reset_builtin
/*0x5f7e*/      b jump_5ffc
            jump_5f80:
/*0x5f80*/      mov.w r3, #0x400
/*0x5f84*/      cmp r0, #0x20
/*0x5f86*/      blo jump_5fa6
/*0x5f88*/      sub.w r2, r0, #0x1f
/*0x5f8c*/      rsb r2, r2, r2, lsl #4
/*0x5f90*/      cmp.w r3, r2, lsl #2
/*0x5f94*/      blt jump_5fa6
/*0x5f96*/      rsb r0, r0, r0, lsl #4
/*0x5f9a*/      mov.w r1, #0x2880
/*0x5f9e*/      add.w r0, r1, r0, lsl #2
/*0x5fa2*/      movs r1, #0x3c
/*0x5fa4*/      b jump_5ff6
            jump_5fa6:
/*0x5fa6*/      cbz r0, jump_5fb2
/*0x5fa8*/      cmp r0, #1
/*0x5faa*/      beq jump_5fe8
/*0x5fac*/      cmp r0, #2
/*0x5fae*/      bne jump_6012
/*0x5fb0*/      b jump_5ff0
            jump_5fb2:
/*0x5fb2*/      ldrb.w r0, [r1, #0x10f]
/*0x5fb6*/      cmp r0, #0xaa
/*0x5fb8*/      beq jump_5fde
/*0x5fba*/      ldrb r2, [r3]
/*0x5fbc*/      mov r0, r3
/*0x5fbe*/      cmp r2, #4
/*0x5fc0*/      beq jump_5fe4
/*0x5fc2*/      movs r2, #0x20
/*0x5fc4*/      mov r1, r3
/*0x5fc6*/      adds r0, r5, #4
/*0x5fc8*/      bl memcpy
/*0x5fcc*/      ldr r0, [pc, #0x5c] /* data_602c */
/*0x5fce*/      ldr.w r1, [r0, #0x180]
/*0x5fd2*/      str r1, [r5, #0x24]
/*0x5fd4*/      ldr.w r0, [r0, #0x18c]
/*0x5fd8*/      movs r1, #0x28
/*0x5fda*/      str r0, [r5, #0x28]
/*0x5fdc*/      b jump_5ff4
            jump_5fde:
/*0x5fde*/      movs r1, #0x10
/*0x5fe0*/      lsls r0, r1, #4
/*0x5fe2*/      b jump_5ff6
            jump_5fe4:
/*0x5fe4*/      movs r1, #0x34
/*0x5fe6*/      b jump_5ff6
            jump_5fe8:
/*0x5fe8*/      movs r1, #4
/*0x5fea*/      mov.w r0, #0x3c00
/*0x5fee*/      b jump_5ff6
            jump_5ff0:
/*0x5ff0*/      movs r1, #1
/*0x5ff2*/      strb r1, [r5, #4]
            jump_5ff4:
/*0x5ff4*/      adds r0, r5, #4
            jump_5ff6:
/*0x5ff6*/      bl call_60b4
/*0x5ffa*/      movs r4, #1
            jump_5ffc:
/*0x5ffc*/      ldrb r0, [r6]
/*0x5ffe*/      cmp r0, #1
/*0x6000*/      bne jump_6010
/*0x6002*/      cbz r4, jump_6012
/*0x6004*/      movs r1, #0x3c
/*0x6006*/      adds r0, r5, #4
            jump_6008:
/*0x6008*/      bl mem_zero
/*0x600c*/      movs r0, #2
/*0x600e*/      strb r0, [r6]
            jump_6010:
/*0x6010*/      pop {r4, r5, r6, pc}
            jump_6012:
/*0x6012*/      ldr r0, [r5]
/*0x6014*/      str r0, [r5, #4]
/*0x6016*/      movw r0, #0xaaff
/*0x601a*/      str r0, [r5]
/*0x601c*/      ldr r0, [pc, #8] /* data_6028 */
/*0x601e*/      movs r1, #0x38
/*0x6020*/      adds r0, #8
/*0x6022*/      b jump_6008

            data_6024:
/*0x6024*/  .word 0x2000002a
            data_6028:
/*0x6028*/  .word 0x20000604
            data_602c:
/*0x602c*/  .word 0x40080000


            .thumb_func
            reset_builtin:
/*0x6030*/      push {r4, lr}
/*0x6032*/      ldr r1, [pc, #0x6c] /* data_60a0 */
/*0x6034*/      cbz r0, jump_6052
/*0x6036*/      cmp r0, #1
/*0x6038*/      beq jump_6056
/*0x603a*/      cmp r0, #2
/*0x603c*/      bne jump_609e
/*0x603e*/      movs r0, #0x35
/*0x6040*/      bl nvic_disable_intr
/*0x6044*/      movs r0, #0
/*0x6046*/      bl call_6b10
/*0x604a*/      pop.w {r4, lr}
/*0x604e*/      b.w jump_5ee8
            jump_6052:
/*0x6052*/      ldr r0, [pc, #0x50] /* data_60a4 */
/*0x6054*/      b jump_605a
            jump_6056:
/*0x6056*/      ldr r0, [pc, #0x4c] /* data_60a4 */
/*0x6058*/      subs r0, r0, #5
            jump_605a:
/*0x605a*/      str r0, [r1]
/*0x605c*/      movs r1, #0
/*0x605e*/      mov.w r0, #0x10000
/*0x6062*/      movs r3, #1
/*0x6064*/      mov r2, r1
/*0x6066*/      bl ckcu_clocks_enable
/*0x606a*/      ldr r1, [pc, #0x3c] /* data_60a8 */
/*0x606c*/      mov.w r0, #0x200
/*0x6070*/      str r0, [r1, #0x24]
/*0x6072*/      movs r0, #0x35
/*0x6074*/      bl nvic_disable_intr
/*0x6078*/      movs r0, #0
/*0x607a*/      bl call_6b10
/*0x607e*/      movw r0, #0x4e20
/*0x6082*/      bl spin_wait
/*0x6086*/      dsb sy
/*0x608a*/      ldr r0, [pc, #0x20] /* data_60ac */
/*0x608c*/      ldr r1, [r0]
/*0x608e*/      ldr r2, [pc, #0x20] /* data_60b0 */
/*0x6090*/      and r1, r1, #0x700
/*0x6094*/      orrs r1, r2
/*0x6096*/      str r1, [r0]
/*0x6098*/      dsb sy
            jump_609c:
/*0x609c*/      b jump_609c
            jump_609e:
/*0x609e*/      pop {r4, pc}

            data_60a0:
/*0x60a0*/  .word 0x20003ffc
            data_60a4:
/*0x60a4*/  .word 0x55aafaf5
            data_60a8:
/*0x60a8*/  .word 0x400b0000
            data_60ac:
/*0x60ac*/  .word 0xe000ed0c
            data_60b0:
/*0x60b0*/  .word 0x05fa0004


            .thumb_func
            call_60b4:
/*0x60b4*/      push {r4, r5, r6, lr}
/*0x60b6*/      mov r4, r1
/*0x60b8*/      ldr r2, [pc, #0x24] /* data_60e0 */
/*0x60ba*/      mov r1, r0
/*0x60bc*/      movs r0, #2
/*0x60be*/      strb r0, [r2]
/*0x60c0*/      ldr r0, [pc, #0x20] /* data_60e4 */
/*0x60c2*/      subs r5, r0, #4
/*0x60c4*/      cmp r1, r0
/*0x60c6*/      beq jump_60d0
/*0x60c8*/      mov r2, r4
/*0x60ca*/      adds r0, r5, #4
/*0x60cc*/      bl memcpy
            jump_60d0:
/*0x60d0*/      adds r0, r5, r4
/*0x60d2*/      rsb.w r1, r4, #0x3c
/*0x60d6*/      pop.w {r4, r5, r6, lr}
/*0x60da*/      adds r0, r0, #4
/*0x60dc*/      b.w mem_zero

            data_60e0:
/*0x60e0*/  .word 0x2000002a
            data_60e4:
/*0x60e4*/  .word 0x20000608

            jump_60e8:
/*0x60e8*/      push {r4, r5, r6, r7, lr}
/*0x60ea*/      ldr r7, [pc, #0x28] /* data_6114 */
/*0x60ec*/      ldr.w r4, [r7, #0x104]
/*0x60f0*/      ldr.w r5, [r7, #0x108]
/*0x60f4*/      ldr.w r6, [r7, #0x10c]
/*0x60f8*/      bics r4, r0
/*0x60fa*/      bics r5, r1
/*0x60fc*/      bics r6, r2
/*0x60fe*/      cbz r3, jump_6106
/*0x6100*/      orrs r4, r0
/*0x6102*/      orrs r5, r1
/*0x6104*/      orrs r6, r2
            jump_6106:
/*0x6106*/      str.w r4, [r7, #0x104]
/*0x610a*/      str.w r5, [r7, #0x108]
/*0x610e*/      str.w r6, [r7, #0x10c]
/*0x6112*/      pop {r4, r5, r6, r7, pc}

            data_6114:
/*0x6114*/  .word 0x40088000


            .thumb_func
            call_6118:
/*0x6118*/      ldr r2, [pc, #0x1c] /* data_6138 */
/*0x611a*/      movs r1, #0
/*0x611c*/      mov.w r0, #0x1c20
/*0x6120*/      str.w r1, [r2, #0x108]
            jump_6124:
/*0x6124*/      subs r0, r0, #1
/*0x6126*/      bhs jump_6124
/*0x6128*/      movs r0, #1
/*0x612a*/      str.w r0, [r2, #0x108]
/*0x612e*/      ldr r0, [pc, #0xc] /* data_613c */
            jump_6130:
/*0x6130*/      ldr r1, [r0, #8]
/*0x6132*/      lsls r1, r1, #0x1a
/*0x6134*/      bpl jump_6130
/*0x6136*/      bx lr

            data_6138:
/*0x6138*/  .word 0x42d40000
            data_613c:
/*0x613c*/  .word 0x40088000


            .thumb_func
            call_6140:
/*0x6140*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x6144*/      movs r7, #7
/*0x6146*/      ldr r5, [pc, #0x68] /* data_61b0 */
/*0x6148*/      b jump_61a6
            jump_614a:
/*0x614a*/      ldr r1, [pc, #0x68] /* data_61b4 */
/*0x614c*/      add.w r0, r7, r7, lsl #1
/*0x6150*/      add r0, r1
/*0x6152*/      ldrb r1, [r5, #-0x1]!
/*0x6156*/      ldrb r0, [r0, #2]
/*0x6158*/      eors r0, r1
/*0x615a*/      movs.w r8, r0
/*0x615e*/      beq jump_61a6
/*0x6160*/      movs r4, #0x80
/*0x6162*/      movs r6, #8
/*0x6164*/      b jump_61a0
            jump_6166:
/*0x6166*/      tst.w r8, r4
/*0x616a*/      beq jump_619e
/*0x616c*/      ldrb r0, [r5]
/*0x616e*/      eors r0, r4
/*0x6170*/      strb r0, [r5]
/*0x6172*/      tst r0, r4
/*0x6174*/      bne jump_617a
/*0x6176*/      movs r0, #1
/*0x6178*/      b jump_617c
            jump_617a:
/*0x617a*/      movs r0, #0
            jump_617c:
/*0x617c*/      mov sb, r0
/*0x617e*/      add.w r0, r6, r7, lsl #3
/*0x6182*/      uxtb r0, r0
/*0x6184*/      mov r1, sb
/*0x6186*/      bl call_48bc
/*0x618a*/      cbnz r0, jump_6192
/*0x618c*/      ldrb r0, [r5]
/*0x618e*/      eors r0, r4
/*0x6190*/      strb r0, [r5]
            jump_6192:
/*0x6192*/      movs.w r0, sb
/*0x6196*/      beq jump_619a
/*0x6198*/      movs r0, #1
            jump_619a:
/*0x619a*/      ldr r1, [pc, #0x1c] /* data_61b8 */
/*0x619c*/      strh r0, [r1, #2]
            jump_619e:
/*0x619e*/      lsrs r4, r4, #1
            jump_61a0:
/*0x61a0*/      subs r6, r6, #1
/*0x61a2*/      uxtb r6, r6
/*0x61a4*/      bhs jump_6166
            jump_61a6:
/*0x61a6*/      subs r7, r7, #1
/*0x61a8*/      uxtb r7, r7
/*0x61aa*/      bhs jump_614a
/*0x61ac*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_61b0:
/*0x61b0*/  .word 0x200001d7
            data_61b4:
/*0x61b4*/  .word 0x20000316
            data_61b8:
/*0x61b8*/  .word 0x20000022


            .thumb_func
            call_61bc:
/*0x61bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x61c0*/      mov r6, r0
/*0x61c2*/      movs r4, #2
/*0x61c4*/      ldr r5, [pc, #0x50] /* data_6218 */
/*0x61c6*/      mov.w r7, #0x1f4
            jump_61ca:
/*0x61ca*/      bl call_73b8
/*0x61ce*/      movs r0, #7
/*0x61d0*/      b jump_61da
            jump_61d2:
/*0x61d2*/      add.w r1, r0, r0, lsl #1
/*0x61d6*/      ldrb r1, [r5, r1]
/*0x61d8*/      cbnz r1, jump_61e0
            jump_61da:
/*0x61da*/      subs r0, r0, #1
/*0x61dc*/      uxtb r0, r0
/*0x61de*/      bhs jump_61d2
            jump_61e0:
/*0x61e0*/      cmp r0, #0xff
/*0x61e2*/      beq jump_61f4
/*0x61e4*/      cmp r4, #0
/*0x61e6*/      bne jump_61ca
            jump_61e8:
/*0x61e8*/      cmp r6, #0
/*0x61ea*/      beq jump_6212
/*0x61ec*/      ldr r2, [pc, #0x2c] /* data_621c */
/*0x61ee*/      ldr r1, [pc, #0x28] /* data_6218 */
/*0x61f0*/      movs r0, #7
/*0x61f2*/      b jump_620c
            jump_61f4:
/*0x61f4*/      subs r4, r4, #1
/*0x61f6*/      ands r4, r4, #0xff
/*0x61fa*/      beq jump_61e8
/*0x61fc*/      mov r0, r7
/*0x61fe*/      bl spin_wait
/*0x6202*/      b jump_61ca
            jump_6204:
/*0x6204*/      ldrb r3, [r1, #2]
/*0x6206*/      strb r3, [r2], #1
/*0x620a*/      adds r1, r1, #3
            jump_620c:
/*0x620c*/      subs r0, r0, #1
/*0x620e*/      uxtb r0, r0
/*0x6210*/      bhs jump_6204
            jump_6212:
/*0x6212*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x6216*/  .byte 0x00
/*0x6217*/  .byte 0x00

            data_6218:
/*0x6218*/  .word 0x20000316
            data_621c:
/*0x621c*/  .word 0x200001d0


            .thumb_func
            call_6220:
/*0x6220*/      ldr r1, [pc, #0x10] /* data_6234 */
/*0x6222*/      ldrb r0, [r1]
/*0x6224*/      adds r0, r0, #1
/*0x6226*/      strb r0, [r1]
/*0x6228*/      lsls r0, r0, #0x1e
/*0x622a*/      bne jump_6230
/*0x622c*/      b.w call_73b8
            jump_6230:
/*0x6230*/      bx lr

/*0x6232*/  .byte 0x00
/*0x6233*/  .byte 0x00

            data_6234:
/*0x6234*/  .word 0x20000022


            .thumb_func
            call_6238:
/*0x6238*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x623c*/      movs r6, #0
/*0x623e*/      mov r1, r6
/*0x6240*/      mov.w r0, #0xf0000
/*0x6244*/      movs r3, #1
/*0x6246*/      mov r2, r6
/*0x6248*/      bl ckcu_clocks_enable
/*0x624c*/      movs r4, #8
/*0x624e*/      b jump_6280
            jump_6250:
/*0x6250*/      ldr r0, [pc, #0x94] /* data_62e8 */
/*0x6252*/      movs r2, #0
/*0x6254*/      add.w r1, r0, r4, lsl #3
/*0x6258*/      ldrh r5, [r1, #4]
/*0x625a*/      ldr r0, [r1]
/*0x625c*/      uxth r1, r5
/*0x625e*/      mov r7, r0
/*0x6260*/      bl call_45a8
/*0x6264*/      uxth r1, r5
/*0x6266*/      mov r0, r7
/*0x6268*/      movs r2, #1
/*0x626a*/      bl call_4588
/*0x626e*/      ldr r0, [pc, #0x78] /* data_62e8 */
/*0x6270*/      adds r0, #0x40
/*0x6272*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x6276*/      add.w r0, r0, r4, lsl #1
/*0x627a*/      ldrb r0, [r0, #1]
/*0x627c*/      bl afio_exti_ssr_write
            jump_6280:
/*0x6280*/      subs r4, r4, #1
/*0x6282*/      uxtb r4, r4
/*0x6284*/      bhs jump_6250
/*0x6286*/      movs r4, #7
/*0x6288*/      b jump_62b2
            jump_628a:
/*0x628a*/      ldr r0, [pc, #0x5c] /* data_62e8 */
/*0x628c*/      adds r0, #0x50
/*0x628e*/      add.w r1, r0, r4, lsl #3
/*0x6292*/      ldrh r5, [r1, #4]
/*0x6294*/      ldr r7, [r1]
/*0x6296*/      uxth r1, r5
/*0x6298*/      mov r0, r7
/*0x629a*/      bl call_45d0
/*0x629e*/      uxth r1, r5
/*0x62a0*/      mov r0, r7
/*0x62a2*/      movs r2, #0
/*0x62a4*/      bl call_4598
/*0x62a8*/      uxth r1, r5
/*0x62aa*/      mov r0, r7
/*0x62ac*/      movs r2, #1
/*0x62ae*/      bl call_4568
            jump_62b2:
/*0x62b2*/      subs r4, r4, #1
/*0x62b4*/      uxtb r4, r4
/*0x62b6*/      bhs jump_628a
/*0x62b8*/      movs r2, #0xff
/*0x62ba*/      movs r1, #7
/*0x62bc*/      ldr r0, [pc, #0x2c] /* data_62ec */
/*0x62be*/      bl mem_set
/*0x62c2*/      movs r0, #0
/*0x62c4*/      bl call_6324
/*0x62c8*/      movs r1, #7
/*0x62ca*/      ldr r0, [pc, #0x24] /* data_62f0 */
/*0x62cc*/      movs r2, #0xff
/*0x62ce*/      b jump_62dc
            jump_62d0:
/*0x62d0*/      strb r6, [r0], #1
/*0x62d4*/      strb r2, [r0], #1
/*0x62d8*/      strb r2, [r0], #1
            jump_62dc:
/*0x62dc*/      subs r1, r1, #1
/*0x62de*/      uxtb r1, r1
/*0x62e0*/      bhs jump_62d0
/*0x62e2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x62e6*/  .byte 0x00
/*0x62e7*/  .byte 0x00

            data_62e8:
/*0x62e8*/  .word 0x00007ed4
            data_62ec:
/*0x62ec*/  .word 0x200001d0
            data_62f0:
/*0x62f0*/  .word 0x20000316


            .thumb_func
            call_62f4:
/*0x62f4*/      ldr r1, [pc, #0x28] /* data_6320 */
/*0x62f6*/      push {r4, lr}
/*0x62f8*/      add.w r0, r1, #0x146
/*0x62fc*/      movs r2, #7
/*0x62fe*/      b jump_6314
            jump_6300:
/*0x6300*/      ldrb r3, [r0]
/*0x6302*/      cbnz r3, jump_630c
/*0x6304*/      ldrb r3, [r0, #2]
/*0x6306*/      ldrb r4, [r1]
/*0x6308*/      cmp r3, r4
/*0x630a*/      beq jump_6310
            jump_630c:
/*0x630c*/      movs r0, #0
/*0x630e*/      pop {r4, pc}
            jump_6310:
/*0x6310*/      adds r0, r0, #3
/*0x6312*/      adds r1, r1, #1
            jump_6314:
/*0x6314*/      subs r2, r2, #1
/*0x6316*/      uxtb r2, r2
/*0x6318*/      bhs jump_6300
/*0x631a*/      movs r0, #1
/*0x631c*/      pop {r4, pc}

/*0x631e*/  .byte 0x00
/*0x631f*/  .byte 0x00

            data_6320:
/*0x6320*/  .word 0x200001d0


            .thumb_func
            call_6324:
/*0x6324*/      push {r4, lr}
/*0x6326*/      mov r4, r0
/*0x6328*/      movs r2, #0x38
/*0x632a*/      ldr r1, [pc, #0x38] /* data_6364 */
/*0x632c*/      ldr r0, [pc, #0x38] /* data_6368 */
/*0x632e*/      bl memcpy
/*0x6332*/      cbz r4, jump_6352
/*0x6334*/      bl call_63b0
/*0x6338*/      cmp r4, #1
/*0x633a*/      beq jump_6342
/*0x633c*/      cmp r4, #2
/*0x633e*/      bne jump_6352
/*0x6340*/      b jump_634a
            jump_6342:
/*0x6342*/      ldr r1, [pc, #0x20] /* data_6364 */
/*0x6344*/      adds r1, #0xc0
/*0x6346*/      movs r0, #0x22
/*0x6348*/      b jump_634e
            jump_634a:
/*0x634a*/      ldr r1, [pc, #0x20] /* data_636c */
/*0x634c*/      movs r0, #0x11
            jump_634e:
/*0x634e*/      bl call_63dc
            jump_6352:
/*0x6352*/      bl call_63b0
/*0x6356*/      bl call_543c
/*0x635a*/      pop.w {r4, lr}
/*0x635e*/      b.w call_63b0

/*0x6362*/  .byte 0x00
/*0x6363*/  .byte 0x00

            data_6364:
/*0x6364*/  .word 0x00007e9c
            data_6368:
/*0x6368*/  .word 0x200002de
            data_636c:
/*0x636c*/  .word 0x00007fa0


            .thumb_func
            call_6370:
/*0x6370*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6374*/      movs r4, #7
/*0x6376*/      cbz r0, jump_637e
/*0x6378*/      movs r7, #0
            jump_637a:
/*0x637a*/      ldr r5, [pc, #0x30] /* data_63ac */
/*0x637c*/      b jump_63a2
            jump_637e:
/*0x637e*/      movs r7, #1
/*0x6380*/      b jump_637a
            jump_6382:
/*0x6382*/      add.w r6, r5, r4, lsl #3
/*0x6386*/      mov r2, r7
/*0x6388*/      ldrh r0, [r6, #4]
/*0x638a*/      uxth r1, r0
/*0x638c*/      ldr.w r0, [r5, r4, lsl #3]
/*0x6390*/      bl call_45d4
/*0x6394*/      ldrh r0, [r6, #4]
/*0x6396*/      movs r2, #1
/*0x6398*/      uxth r1, r0
/*0x639a*/      ldr.w r0, [r5, r4, lsl #3]
/*0x639e*/      bl call_4568
            jump_63a2:
/*0x63a2*/      subs r4, r4, #1
/*0x63a4*/      uxtb r4, r4
/*0x63a6*/      bhs jump_6382
/*0x63a8*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_63ac:
/*0x63ac*/  .word 0x00007f24


            .thumb_func
            call_63b0:
/*0x63b0*/      push {r4, lr}
/*0x63b2*/      ldr r4, [pc, #0x24] /* data_63d8 */
/*0x63b4*/      movs r2, #0xff
/*0x63b6*/      adds r1, r2, #1
/*0x63b8*/      subw r0, r4, #0x137
/*0x63bc*/      bl mem_set
/*0x63c0*/      movs r0, #0x38
/*0x63c2*/      subw r1, r4, #0x137
/*0x63c6*/      b jump_63ce
            jump_63c8:
/*0x63c8*/      ldrb r2, [r4], #-1
/*0x63cc*/      strb r0, [r1, r2]
            jump_63ce:
/*0x63ce*/      subs r0, r0, #1
/*0x63d0*/      uxtb r0, r0
/*0x63d2*/      bhs jump_63c8
/*0x63d4*/      pop {r4, pc}

/*0x63d6*/  .byte 0x00
/*0x63d7*/  .byte 0x00

            data_63d8:
/*0x63d8*/  .word 0x20000315


            .thumb_func
            call_63dc:
/*0x63dc*/      push {r4, r5, lr}
/*0x63de*/      ldr r3, [pc, #0x18] /* data_63f8 */
/*0x63e0*/      sub.w r4, r3, #0x100
/*0x63e4*/      b jump_63f0
            jump_63e6:
/*0x63e6*/      ldrb r2, [r1, #1]
/*0x63e8*/      ldrb r5, [r1], #2
/*0x63ec*/      ldrb r5, [r4, r5]
/*0x63ee*/      strb r2, [r3, r5]
            jump_63f0:
/*0x63f0*/      subs r0, r0, #1
/*0x63f2*/      uxtb r0, r0
/*0x63f4*/      bhs jump_63e6
/*0x63f6*/      pop {r4, r5, pc}

            data_63f8:
/*0x63f8*/  .word 0x200002de


            .thumb_func
            call_63fc:
/*0x63fc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x6400*/      ldr.w lr, [pc, #0x70] /* data_6474 */
/*0x6404*/      ldr.w sb, [pc, #0x70] /* data_6478 */
/*0x6408*/      movs r6, #0
/*0x640a*/      sub.w sl, lr, #0xd8
/*0x640e*/      add.w fp, sb, #0x224
            jump_6412:
/*0x6412*/      movs r4, #0x10
/*0x6414*/      add.w r0, lr, r6, lsl #6
/*0x6418*/      movs r3, #0
/*0x641a*/      add.w ip, fp, r6, lsl #3
            jump_641e:
/*0x641e*/      ldrb.w r1, [sb, r3]
/*0x6422*/      ldr.w r8, [pc, #0x54] /* data_6478 */
/*0x6426*/      add.w r2, r1, r1, lsl #3
/*0x642a*/      add.w r7, sl, r2, lsl #3
/*0x642e*/      mov r1, ip
/*0x6430*/      movs r2, #8
/*0x6432*/      add.w r8, r8, #0x24
/*0x6436*/      b jump_6452
            jump_6438:
/*0x6438*/      ldrb r5, [r1]
/*0x643a*/      cmp r5, #0xff
/*0x643c*/      beq jump_6446
/*0x643e*/      ldrb r5, [r7, r5]
/*0x6440*/      ldrh.w r5, [r8, r5, lsl #1]
/*0x6444*/      strh r5, [r0]
            jump_6446:
/*0x6446*/      adds r1, r1, #1
/*0x6448*/      subs r4, r4, #1
/*0x644a*/      ands r4, r4, #0xff
/*0x644e*/      beq jump_646c
/*0x6450*/      adds r0, r0, #4
            jump_6452:
/*0x6452*/      subs r2, r2, #1
/*0x6454*/      uxtb r2, r2
/*0x6456*/      bhs jump_6438
/*0x6458*/      adds r3, r3, #1
/*0x645a*/      uxtb r3, r3
/*0x645c*/      cmp r3, #3
/*0x645e*/      blo jump_641e
/*0x6460*/      adds r6, r6, #1
/*0x6462*/      uxtb r6, r6
/*0x6464*/      cmp r6, #8
/*0x6466*/      blo jump_6412
/*0x6468*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_646c:
/*0x646c*/      movs r4, #0x10
/*0x646e*/      subs r0, #0x3a
/*0x6470*/      b jump_6452

/*0x6472*/  .byte 0x00
/*0x6473*/  .byte 0x00

            data_6474:
/*0x6474*/  .word 0x20000404
            data_6478:
/*0x6478*/  .word 0x00007fc4


            .thumb_func
            call_647c:
/*0x647c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6480*/      movs r1, #0
/*0x6482*/      mov.w r2, #0x20000
/*0x6486*/      mov.w r0, #0x70000
/*0x648a*/      movs r3, #1
/*0x648c*/      bl ckcu_clocks_enable
/*0x6490*/      movw r1, #0xea60
/*0x6494*/      ldr r0, [pc, #0xc0] /* data_6558 */
/*0x6496*/      bl call_37b6
/*0x649a*/      ldr r4, [pc, #0xc0] /* data_655c */
/*0x649c*/      movs r1, #2
/*0x649e*/      mov r0, r4
/*0x64a0*/      bl call_45d0
/*0x64a4*/      movs r2, #0
/*0x64a6*/      movs r1, #2
/*0x64a8*/      mov r0, r4
/*0x64aa*/      bl call_4598
/*0x64ae*/      movs r2, #1
/*0x64b0*/      movs r1, #2
/*0x64b2*/      mov r0, r4
/*0x64b4*/      bl call_4568
/*0x64b8*/      ldr r6, [pc, #0xa4] /* data_6560 */
/*0x64ba*/      asrs r5, r4, #0x16
/*0x64bc*/      mov r1, r5
/*0x64be*/      mov r0, r6
/*0x64c0*/      bl call_45d0
/*0x64c4*/      lsls r7, r5, #6
/*0x64c6*/      mov r1, r7
/*0x64c8*/      mov r0, r6
/*0x64ca*/      bl call_45d0
/*0x64ce*/      mov.w r8, #0x8000
/*0x64d2*/      mov r1, r8
/*0x64d4*/      mov r0, r6
/*0x64d6*/      bl call_45d0
/*0x64da*/      movs r2, #0
/*0x64dc*/      mov r1, r5
/*0x64de*/      mov r0, r6
/*0x64e0*/      bl call_4598
/*0x64e4*/      movs r2, #0
/*0x64e6*/      mov r1, r7
/*0x64e8*/      mov r0, r6
/*0x64ea*/      bl call_4598
/*0x64ee*/      movs r2, #0
/*0x64f0*/      mov r1, r8
/*0x64f2*/      mov r0, r6
/*0x64f4*/      bl call_4598
/*0x64f8*/      movs r2, #1
/*0x64fa*/      mov r1, r5
/*0x64fc*/      mov r0, r6
/*0x64fe*/      bl call_4568
/*0x6502*/      movs r2, #1
/*0x6504*/      mov r1, r7
/*0x6506*/      mov r0, r6
/*0x6508*/      bl call_4568
/*0x650c*/      movs r2, #1
/*0x650e*/      mov r1, r8
/*0x6510*/      mov r0, r6
/*0x6512*/      bl call_4568
/*0x6516*/      movs r2, #1
/*0x6518*/      movs r1, #8
/*0x651a*/      mov r0, r4
/*0x651c*/      bl call_4588
/*0x6520*/      ldr r4, [pc, #0x40] /* data_6564 */
/*0x6522*/      movs r5, #4
/*0x6524*/      b jump_654a
            jump_6526:
/*0x6526*/      ldrh r0, [r4, #4]
/*0x6528*/      uxth r1, r0
/*0x652a*/      ldr r0, [r4]
/*0x652c*/      bl call_45d0
/*0x6530*/      ldrh r0, [r4, #4]
/*0x6532*/      movs r2, #0
/*0x6534*/      uxth r1, r0
/*0x6536*/      ldr r0, [r4]
/*0x6538*/      bl call_4598
/*0x653c*/      ldrh r0, [r4, #4]
/*0x653e*/      movs r2, #1
/*0x6540*/      uxth r1, r0
/*0x6542*/      ldr r0, [r4]
/*0x6544*/      bl call_4568
/*0x6548*/      adds r4, #8
            jump_654a:
/*0x654a*/      subs r5, r5, #1
/*0x654c*/      uxtb r5, r5
/*0x654e*/      bhs jump_6526
/*0x6550*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6554*/      b.w jump_7470

            data_6558:
/*0x6558*/  .word 0x40077000
            data_655c:
/*0x655c*/  .word 0x400b4000
            data_6560:
/*0x6560*/  .word 0x400b0000
            data_6564:
/*0x6564*/  .word 0x00007fc8

            jump_6568:
/*0x6568*/      push {r4, lr}
/*0x656a*/      ldr r4, [pc, #0x58] /* data_65c4 */
/*0x656c*/      movs r1, #0
/*0x656e*/      mov r0, r4
/*0x6570*/      bl call_37a2
/*0x6574*/      movs r1, #0
/*0x6576*/      mov r0, r4
/*0x6578*/      bl call_378e
/*0x657c*/      mov r0, r4
/*0x657e*/      bl bftm_clear
/*0x6582*/      ldr r1, [pc, #0x44] /* data_65c8 */
/*0x6584*/      asrs r0, r4, #0x14
/*0x6586*/      str.w r0, [r1, #0x180]
/*0x658a*/      movs r1, #0
/*0x658c*/      ldr r0, [pc, #0x3c] /* data_65cc */
/*0x658e*/      bl call_45de
/*0x6592*/      ldr r1, [pc, #0x3c] /* data_65d0 */
/*0x6594*/      movs r0, #2
/*0x6596*/      str r0, [r1, #0x28]
/*0x6598*/      mov r1, r0
/*0x659a*/      ldr r0, [pc, #0x38] /* data_65d4 */
/*0x659c*/      bl call_45d0
/*0x65a0*/      ldr r4, [pc, #0x34] /* data_65d8 */
/*0x65a2*/      movs r2, #1
/*0x65a4*/      lsls r1, r2, #8
/*0x65a6*/      mov r0, r4
/*0x65a8*/      bl call_4598
/*0x65ac*/      movs r2, #1
/*0x65ae*/      lsls r1, r2, #0xe
/*0x65b0*/      mov r0, r4
/*0x65b2*/      bl call_4598
/*0x65b6*/      mov r0, r4
/*0x65b8*/      movs r2, #1
/*0x65ba*/      pop.w {r4, lr}
/*0x65be*/      lsls r1, r2, #0xf
/*0x65c0*/      b.w call_4598

            data_65c4:
/*0x65c4*/  .word 0x40077000
            data_65c8:
/*0x65c8*/  .word 0xe000e004
            data_65cc:
/*0x65cc*/  .word 0x4006f000
            data_65d0:
/*0x65d0*/  .word 0x400b4000
            data_65d4:
/*0x65d4*/  .word 0x400b2000
            data_65d8:
/*0x65d8*/  .word 0x400b0000


            .thumb_func
            call_65dc:
/*0x65dc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x65e0*/      movs r1, #2
/*0x65e2*/      ldr r0, [pc, #0xa8] /* data_668c */
/*0x65e4*/      bl call_45d0
/*0x65e8*/      ldr r5, [pc, #0xa4] /* data_6690 */
/*0x65ea*/      mov.w r6, #0x100
/*0x65ee*/      mov r1, r6
/*0x65f0*/      mov r0, r5
/*0x65f2*/      bl call_45d0
/*0x65f6*/      lsls r7, r6, #6
/*0x65f8*/      mov r1, r7
/*0x65fa*/      mov r0, r5
/*0x65fc*/      bl call_45d0
/*0x6600*/      lsls r4, r6, #7
/*0x6602*/      mov r1, r4
/*0x6604*/      mov r0, r5
/*0x6606*/      bl call_45d0
/*0x660a*/      movs r2, #0
/*0x660c*/      mov r1, r6
/*0x660e*/      mov r0, r5
/*0x6610*/      bl call_4598
/*0x6614*/      movs r2, #0
/*0x6616*/      mov r1, r7
/*0x6618*/      mov r0, r5
/*0x661a*/      bl call_4598
/*0x661e*/      movs r2, #0
/*0x6620*/      mov r1, r4
/*0x6622*/      mov r0, r5
/*0x6624*/      bl call_4598
/*0x6628*/      movw r0, #0x2710
/*0x662c*/      bl spin_wait
/*0x6630*/      ldr r3, [pc, #0x60] /* data_6694 */
/*0x6632*/      movs r2, #2
/*0x6634*/      str r2, [r3, #0x24]
/*0x6636*/      lsls r1, r2, #8
/*0x6638*/      ldr r0, [pc, #0x5c] /* data_6698 */
/*0x663a*/      bl mem_zero
/*0x663e*/      ldr r1, [pc, #0x5c] /* data_669c */
/*0x6640*/      movs r0, #0
/*0x6642*/      strb r0, [r1, #2]
/*0x6644*/      movs r0, #0x64
/*0x6646*/      bl spin_wait
/*0x664a*/      bl call_66f0
/*0x664e*/      movs r0, #2
/*0x6650*/      bl call_74c4
/*0x6654*/      str r4, [r5, #0x24]
/*0x6656*/      movs r1, #1
/*0x6658*/      ldr r0, [pc, #0x44] /* data_66a0 */
/*0x665a*/      bl call_45de
/*0x665e*/      ldr r4, [pc, #0x44] /* data_66a4 */
/*0x6660*/      movs r1, #0
/*0x6662*/      mov r0, r4
/*0x6664*/      bl call_37ba
/*0x6668*/      mov r0, r4
/*0x666a*/      bl bftm_clear
/*0x666e*/      movs r1, #1
/*0x6670*/      mov r0, r4
/*0x6672*/      bl call_378e
/*0x6676*/      movs r1, #1
/*0x6678*/      mov r0, r4
/*0x667a*/      bl call_37a2
/*0x667e*/      ldr r1, [pc, #0x28] /* data_66a8 */
/*0x6680*/      asrs r0, r4, #0x14
/*0x6682*/      str.w r0, [r1, #0x100]
/*0x6686*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x668a*/  .byte 0x00
/*0x668b*/  .byte 0x00

            data_668c:
/*0x668c*/  .word 0x400b2000
            data_6690:
/*0x6690*/  .word 0x400b0000
            data_6694:
/*0x6694*/  .word 0x400b4000
            data_6698:
/*0x6698*/  .word 0x20000404
            data_669c:
/*0x669c*/  .word 0x20000026
            data_66a0:
/*0x66a0*/  .word 0x4006f000
            data_66a4:
/*0x66a4*/  .word 0x40077000
            data_66a8:
/*0x66a8*/  .word 0xe000e004


            .thumb_func
            call_66ac:
/*0x66ac*/      push {r4, r5, lr}
/*0x66ae*/      movs r0, #0x12
/*0x66b0*/      bl call_74c4
/*0x66b4*/      movs r1, #0xa
/*0x66b6*/      mov.w r0, #0x300
/*0x66ba*/      bl call_74f4
/*0x66be*/      movs r1, #2
/*0x66c0*/      movs r0, #0
/*0x66c2*/      bl call_74f4
/*0x66c6*/      ldr r4, [pc, #0x24] /* data_66ec */
/*0x66c8*/      mov.w r0, #0x4000
/*0x66cc*/      str r0, [r4, #0x28]
/*0x66ce*/      lsls r5, r0, #1
/*0x66d0*/      str r5, [r4, #0x24]
/*0x66d2*/      movs r1, #8
/*0x66d4*/      mov.w r0, #0xc00
/*0x66d8*/      bl call_74f4
/*0x66dc*/      asrs r0, r4, #0x16
/*0x66de*/      str r0, [r4, #0x24]
/*0x66e0*/      str r5, [r4, #0x28]
/*0x66e2*/      nop 
/*0x66e4*/      nop 
/*0x66e6*/      str r5, [r4, #0x24]
/*0x66e8*/      pop {r4, r5, pc}

/*0x66ea*/  .byte 0x00
/*0x66eb*/  .byte 0x00

            data_66ec:
/*0x66ec*/  .word 0x400b0000


            .thumb_func
            call_66f0:
/*0x66f0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x66f4*/      ldr r1, [pc, #0x70] /* data_6768 */
/*0x66f6*/      ldr r0, [pc, #0x6c] /* data_6764 */
/*0x66f8*/      movs r4, #0x10
/*0x66fa*/      ldrb r2, [r1, #2]
/*0x66fc*/      lsls r7, r4, #4
/*0x66fe*/      add.w r5, r0, r2, lsl #6
/*0x6702*/      ldrb r0, [r1]
/*0x6704*/      ldr r6, [pc, #0x64] /* data_676c */
/*0x6706*/      mov.w sl, #0x4000
/*0x670a*/      adds r5, #0x3e
/*0x670c*/      cbz r0, jump_671c
/*0x670e*/      subs r0, r0, #1
/*0x6710*/      ands r0, r0, #0xff
/*0x6714*/      strb r0, [r1]
/*0x6716*/      bne jump_671c
/*0x6718*/      bl call_66ac
            jump_671c:
/*0x671c*/      mov sb, r7
            jump_671e:
/*0x671e*/      subs r4, r4, #1
/*0x6720*/      uxtb r4, r4
/*0x6722*/      blo jump_675c
/*0x6724*/      mov.w r8, #0x8000
/*0x6728*/      str.w r8, [r6, #0x28]
/*0x672c*/      ldrh r0, [r5]
/*0x672e*/      subs r7, r5, #2
/*0x6730*/      movs r1, #0xa
/*0x6732*/      bl call_74f4
/*0x6736*/      ldrh r0, [r7]
/*0x6738*/      movs r1, #9
/*0x673a*/      ubfx r7, r0, #6, #1
/*0x673e*/      subs r5, r5, #4
/*0x6740*/      bl call_74f4
/*0x6744*/      mov r0, sl
/*0x6746*/      str.w sl, [r6, #0x28]
/*0x674a*/      str.w r8, [r6, #0x24]
/*0x674e*/      mov r1, sb
/*0x6750*/      cbz r7, jump_6756
/*0x6752*/      str r1, [r6, #0x24]
/*0x6754*/      b jump_6758
            jump_6756:
/*0x6756*/      str r1, [r6, #0x28]
            jump_6758:
/*0x6758*/      str r0, [r6, #0x24]
/*0x675a*/      b jump_671e
            jump_675c:
/*0x675c*/      str.w sb, [r6, #0x24]
/*0x6760*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_6764:
/*0x6764*/  .word 0x20000404
            data_6768:
/*0x6768*/  .word 0x20000026
            data_676c:
/*0x676c*/  .word 0x400b0000


            .thumb_func
            call_6770:
/*0x6770*/      cmp r1, #0
/*0x6772*/      ldr r1, [r0]
/*0x6774*/      beq jump_677c
/*0x6776*/      orr r1, r1, #1
/*0x677a*/      b jump_6780
            jump_677c:
/*0x677c*/      bic r1, r1, #1
            jump_6780:
/*0x6780*/      str r1, [r0]
/*0x6782*/      bx lr

            .thumb_func
            call_6784:
/*0x6784*/      push {r4, r5, lr}
/*0x6786*/      ldrd r4, r3, [r1, #0x14]
/*0x678a*/      cbz r4, jump_67c6
/*0x678c*/      mov.w r2, #0x200
/*0x6790*/      lsrs r2, r3
/*0x6792*/      orrs r2, r4
            jump_6794:
/*0x6794*/      ldr r4, [r1, #8]
/*0x6796*/      ldr r3, [r1]
/*0x6798*/      orrs r3, r4
/*0x679a*/      ldrd r4, r5, [r1, #0xc]
/*0x679e*/      orrs r4, r5
/*0x67a0*/      orrs r3, r4
/*0x67a2*/      ldr r4, [r1, #0x1c]
/*0x67a4*/      orrs r3, r4
/*0x67a6*/      orrs r3, r2
/*0x67a8*/      str r3, [r0, #4]
/*0x67aa*/      ldr r3, [r1, #0x24]
/*0x67ac*/      ldr r2, [r1, #4]
/*0x67ae*/      orrs r2, r3
/*0x67b0*/      ldr r3, [r1, #0x20]
/*0x67b2*/      orr.w r2, r2, r3, lsl #4
/*0x67b6*/      str r2, [r0, #0x18]
/*0x67b8*/      ldr r1, [r1, #0x28]
/*0x67ba*/      mov.w r2, #-1
/*0x67be*/      add.w r1, r2, r1, lsr #1
/*0x67c2*/      str r1, [r0, #0xc]
/*0x67c4*/      pop {r4, r5, pc}
            jump_67c6:
/*0x67c6*/      mov.w r2, #0x100
/*0x67ca*/      lsls r2, r3
/*0x67cc*/      b jump_6794

            .thumb_func
            call_67ce:
/*0x67ce*/      cmp r1, #0
/*0x67d0*/      ldr r1, [r0]
/*0x67d2*/      beq jump_67da
/*0x67d4*/      orr r1, r1, #8
/*0x67d8*/      b jump_67de
            jump_67da:
/*0x67da*/      bic r1, r1, #8
            jump_67de:
/*0x67de*/      str r1, [r0]
/*0x67e0*/      bx lr

            .thumb_func
            call_67e2:
/*0x67e2*/      push {r4, r5, r6, lr}
/*0x67e4*/      mov r5, r0
/*0x67e6*/      bl call_4130
/*0x67ea*/      bfi r4, r0, #0, #8
/*0x67ee*/      cbz r5, jump_6814
/*0x67f0*/      cmp r5, #1
/*0x67f2*/      beq jump_6800
/*0x67f4*/      cmp r5, #2
/*0x67f6*/      bne jump_6806
/*0x67f8*/      uxth r0, r4
/*0x67fa*/      orr r4, r0, #2
/*0x67fe*/      b jump_6806
            jump_6800:
/*0x6800*/      uxth r0, r4
/*0x6802*/      bic r4, r0, #2
            jump_6806:
/*0x6806*/      uxtb r0, r4
/*0x6808*/      bl call_4540
/*0x680c*/      bl call_4130
/*0x6810*/      bfi r4, r0, #0, #8
            jump_6814:
/*0x6814*/      lsls r0, r4, #0x1e
/*0x6816*/      bpl jump_681c
/*0x6818*/      movs r0, #1
/*0x681a*/      pop {r4, r5, r6, pc}
            jump_681c:
/*0x681c*/      movs r0, #0
/*0x681e*/      pop {r4, r5, r6, pc}

            .thumb_func
            clock_init:
/*0x6820*/      ldr r0, [pc, #0x50] /* data_6874 */
/*0x6822*/      movs r1, #1
/*0x6824*/      str.w r1, [r0, #0x300]
/*0x6828*/      ldr r2, [pc, #0x4c] /* data_6878 */
/*0x682a*/      str.w r1, [r2, #0xa8]
            jump_682e:
/*0x682e*/      ldr.w r3, [r2, #0x108]
/*0x6832*/      cmp r3, #0
/*0x6834*/      beq jump_682e
/*0x6836*/      movs r3, #0
/*0x6838*/      str r3, [r2, #0x20]
/*0x683a*/      mov.w r3, #0x9000000
/*0x683e*/      str r3, [r0, #0x18]
/*0x6840*/      str.w r1, [r2, #0xa4]
            jump_6844:
/*0x6844*/      ldr.w r3, [r2, #0x104]
/*0x6848*/      cmp r3, #0
/*0x684a*/      beq jump_6844
/*0x684c*/      ldr r2, [pc, #0x2c] /* data_687c */
/*0x684e*/      ldr.w r3, [r2, #0x200]
/*0x6852*/      bic r3, r3, #7
/*0x6856*/      adds r3, r3, #3
/*0x6858*/      str.w r3, [r2, #0x200]
/*0x685c*/      str r1, [r0, #0x20]
/*0x685e*/      ldr r2, [r0, #4]
/*0x6860*/      bic r2, r2, #3
/*0x6864*/      adds r2, r2, #1
/*0x6866*/      str r2, [r0, #4]
            jump_6868:
/*0x6868*/      ldr r2, [r0, #0x34]
/*0x686a*/      cmp.w r1, r2, lsr #30
/*0x686e*/      bne jump_6868
/*0x6870*/      bx lr

/*0x6872*/  .byte 0x00
/*0x6873*/  .byte 0x00

            data_6874:
/*0x6874*/  .word 0x40088000
            data_6878:
/*0x6878*/  .word 0x43100000
            data_687c:
/*0x687c*/  .word 0x40080000


            .thumb_func
            call_6880:
/*0x6880*/      ldr r0, [pc, #0x18] /* data_689c */
/*0x6882*/      movs r1, #0
/*0x6884*/      add.w r2, r0, #8
/*0x6888*/      str r1, [r0, #0x1c]
/*0x688a*/      str r1, [r0, #0x20]
/*0x688c*/      strb r1, [r2, #1]
/*0x688e*/      str.w r1, [r0, #0x15]
/*0x6892*/      movs r1, #0x1d
/*0x6894*/      ldr r0, [pc, #8] /* data_68a0 */
/*0x6896*/      b.w mem_zero

/*0x689a*/  .byte 0x00
/*0x689b*/  .byte 0x00

            data_689c:
/*0x689c*/  .word 0x20000040
            data_68a0:
/*0x68a0*/  .word 0x200006ae


            .thumb_func
            call_68a4:
/*0x68a4*/      push {r4, lr}
/*0x68a6*/      ldr r0, [pc, #0x20] /* data_68c8 */
/*0x68a8*/      ldr r1, [pc, #0x1c] /* data_68c8 */
/*0x68aa*/      movs r4, #1
/*0x68ac*/      strb r4, [r0]
/*0x68ae*/      adds r1, #0xc
/*0x68b0*/      movs r0, #2
/*0x68b2*/      strb r0, [r1]
/*0x68b4*/      ldr r1, [pc, #0x14] /* data_68cc */
/*0x68b6*/      movs r0, #4
/*0x68b8*/      strb r0, [r1]
/*0x68ba*/      bl call_6880
/*0x68be*/      ldr r0, [pc, #8] /* data_68c8 */
/*0x68c0*/      subs r0, #8
/*0x68c2*/      strb r4, [r0, #5]
/*0x68c4*/      pop {r4, pc}

/*0x68c6*/  .byte 0x00
/*0x68c7*/  .byte 0x00

            data_68c8:
/*0x68c8*/  .word 0x20000048
            data_68cc:
/*0x68cc*/  .word 0x200006ac


            .thumb_func
            call_68d0:
/*0x68d0*/      ldrb.w r0, [r0, #0x34]
/*0x68d4*/      ubfx r0, r0, #1, #1
/*0x68d8*/      bx lr

/*0x68da*/  .byte 0x00
/*0x68db*/  .byte 0x00

            jump_68dc:
/*0x68dc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x68e0*/      mov r4, r0
/*0x68e2*/      bl call_6d20
/*0x68e6*/      mov r5, r0
/*0x68e8*/      ldr r6, [pc, #0x158] /* data_6a44 */
/*0x68ea*/      lsls r0, r0, #0x1e
/*0x68ec*/      bpl jump_68fa
/*0x68ee*/      ldr r0, [r6, #4]
/*0x68f0*/      cbz r0, jump_68f4
/*0x68f2*/      blx r0
            jump_68f4:
/*0x68f4*/      movs r0, #2
/*0x68f6*/      bl call_6a7c
            jump_68fa:
/*0x68fa*/      lsls r0, r5, #0x1b
/*0x68fc*/      bpl jump_691e
/*0x68fe*/      movs r0, #0x10
/*0x6900*/      bl call_6a7c
/*0x6904*/      ldrb.w r0, [r4, #0x32]
/*0x6908*/      cmp r0, #2
/*0x690a*/      blo jump_691e
/*0x690c*/      bl call_6d34
/*0x6910*/      ldrb.w r0, [r4, #0x32]
/*0x6914*/      strb.w r0, [r4, #0x33]
/*0x6918*/      movs r0, #3
/*0x691a*/      strb.w r0, [r4, #0x32]
            jump_691e:
/*0x691e*/      lsls r0, r5, #0x1d
/*0x6920*/      mov.w r7, #0
/*0x6924*/      bpl jump_696a
/*0x6926*/      subs r0, r7, #1
/*0x6928*/      str r0, [r4, #0x20]
/*0x692a*/      strb.w r7, [r4, #0x30]
/*0x692e*/      strb.w r7, [r4, #0x31]
/*0x6932*/      ldrb.w r0, [r4, #0x34]
/*0x6936*/      bic r0, r0, #2
/*0x693a*/      strb.w r0, [r4, #0x34]
/*0x693e*/      movs r0, #4
/*0x6940*/      strb.w r0, [r4, #0x32]
/*0x6944*/      str r7, [r4, #0x38]
/*0x6946*/      bl call_6b2c
/*0x694a*/      bl call_6d44
/*0x694e*/      ldr r1, [pc, #0xf8] /* data_6a48 */
/*0x6950*/      movs r0, #0
/*0x6952*/      bl call_6be8
/*0x6956*/      ldr r0, [pc, #0xf0] /* data_6a48 */
/*0x6958*/      ldr r0, [r0]
/*0x695a*/      bl call_6cf0
/*0x695e*/      ldr r0, [r6]
/*0x6960*/      cbz r0, jump_6964
/*0x6962*/      blx r0
            jump_6964:
/*0x6964*/      movs r0, #4
/*0x6966*/      bl call_6a7c
            jump_696a:
/*0x696a*/      lsls r0, r5, #0x1c
/*0x696c*/      bpl jump_6980
/*0x696e*/      bl call_6d44
/*0x6972*/      ldrb.w r0, [r4, #0x33]
/*0x6976*/      strb.w r0, [r4, #0x32]
/*0x697a*/      movs r0, #8
/*0x697c*/      bl call_6a7c
            jump_6980:
/*0x6980*/      lsls r0, r5, #0x17
/*0x6982*/      mov.w r8, #0x100
/*0x6986*/      bpl jump_6a04
/*0x6988*/      movs r0, #0
/*0x698a*/      bl call_6bc8
/*0x698e*/      mov r5, r0
/*0x6990*/      lsls r0, r0, #0x16
/*0x6992*/      bpl jump_69aa
/*0x6994*/      mov r0, r4
/*0x6996*/      bl call_6e64
/*0x699a*/      mov r0, r4
/*0x699c*/      bl call_77d8
/*0x69a0*/      mov.w r1, #0x200
/*0x69a4*/      movs r0, #0
/*0x69a6*/      bl call_6b58
            jump_69aa:
/*0x69aa*/      lsls r0, r5, #0x1e
/*0x69ac*/      bpl jump_69ec
/*0x69ae*/      movs r1, #2
/*0x69b0*/      movs r0, #0
/*0x69b2*/      bl call_6b58
/*0x69b6*/      ldr r0, [r4, #0x20]
/*0x69b8*/      adds r0, r0, #1
/*0x69ba*/      beq jump_69ec
/*0x69bc*/      ldrb.w r0, [r4, #0x24]
/*0x69c0*/      cmp r0, #2
/*0x69c2*/      bne jump_69ec
/*0x69c4*/      movs r2, #0x40
/*0x69c6*/      movs r0, #0
/*0x69c8*/      ldr r1, [r4, #0x1c]
/*0x69ca*/      bl call_6c48
/*0x69ce*/      ldr r1, [r4, #0x1c]
/*0x69d0*/      add r1, r0
/*0x69d2*/      str r1, [r4, #0x1c]
/*0x69d4*/      ldr r1, [r4, #0x20]
/*0x69d6*/      subs r0, r1, r0
/*0x69d8*/      str r0, [r4, #0x20]
/*0x69da*/      bne jump_69ec
/*0x69dc*/      movs r0, #1
/*0x69de*/      strb.w r0, [r4, #0x24]
/*0x69e2*/      ldr r1, [r4, #0x28]
/*0x69e4*/      cbz r1, jump_69ec
/*0x69e6*/      ldr r0, [r4, #0x2c]
/*0x69e8*/      blx r1
/*0x69ea*/      str r7, [r4, #0x28]
            jump_69ec:
/*0x69ec*/      lsls r0, r5, #0x1b
/*0x69ee*/      bpl jump_69fe
/*0x69f0*/      mov r0, r4
/*0x69f2*/      bl call_7794
/*0x69f6*/      movs r1, #0x10
/*0x69f8*/      movs r0, #0
/*0x69fa*/      bl call_6b58
            jump_69fe:
/*0x69fe*/      mov r0, r8
/*0x6a00*/      bl call_6a7c
            jump_6a04:
/*0x6a04*/      mov r4, r8
            jump_6a06:
/*0x6a06*/      bl call_6d20
/*0x6a0a*/      bl call_6d00
/*0x6a0e*/      mov r5, r0
/*0x6a10*/      adds r0, r0, #1
/*0x6a12*/      beq jump_6a3e
/*0x6a14*/      mov r0, r5
/*0x6a16*/      bl call_6bc8
/*0x6a1a*/      tst.w r0, #0x12
/*0x6a1e*/      beq jump_6a06
/*0x6a20*/      movs r1, #0x12
/*0x6a22*/      mov r0, r5
/*0x6a24*/      bl call_6b58
/*0x6a28*/      lsl.w r0, r4, r5
/*0x6a2c*/      bl call_6a7c
/*0x6a30*/      ldr r0, [r6, #0x18]
/*0x6a32*/      cmp r0, #0
/*0x6a34*/      beq jump_6a06
/*0x6a36*/      mov r1, r0
/*0x6a38*/      mov r0, r5
/*0x6a3a*/      blx r1
/*0x6a3c*/      b jump_6a06
            jump_6a3e:
/*0x6a3e*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x6a42*/  .byte 0x00
/*0x6a43*/  .byte 0x00

            data_6a44:
/*0x6a44*/  .word 0x000083b4
            data_6a48:
/*0x6a48*/  .word 0x2000018c


            .thumb_func
            call_6a4c:
/*0x6a4c*/      movs r1, #2
/*0x6a4e*/      strb.w r1, [r0, #0x32]
/*0x6a52*/      ldr r0, [pc, #4] /* data_6a58 */
/*0x6a54*/      b.w jump_6d30

            data_6a58:
/*0x6a58*/  .word 0x2000018c


            .thumb_func
            call_6a5c:
/*0x6a5c*/      ldrb.w r0, [r0, #0x32]
/*0x6a60*/      cmp r0, #3
/*0x6a62*/      beq jump_6a68
/*0x6a64*/      movs r0, #0
/*0x6a66*/      bx lr
            jump_6a68:
/*0x6a68*/      movs r0, #1
/*0x6a6a*/      bx lr

            .thumb_func
            call_6a6c:
/*0x6a6c*/      push {r4, lr}
/*0x6a6e*/      bl call_6d44
/*0x6a72*/      pop.w {r4, lr}
/*0x6a76*/      b.w jump_6e74

/*0x6a7a*/  .byte 0x00
/*0x6a7b*/  .byte 0x00


            .thumb_func
            call_6a7c:
/*0x6a7c*/      ldr r1, [pc, #4] /* data_6a84 */
/*0x6a7e*/      str r0, [r1, #8]
/*0x6a80*/      bx lr

/*0x6a82*/  .byte 0x00
/*0x6a83*/  .byte 0x00

            data_6a84:
/*0x6a84*/  .word 0x400a8000


            .thumb_func
            call_6a88:
/*0x6a88*/      push {r4, lr}
/*0x6a8a*/      movs r1, #0
/*0x6a8c*/      mov.w r0, #0x400
/*0x6a90*/      movs r2, #0x40
/*0x6a92*/      movs r3, #1
/*0x6a94*/      bl ckcu_clocks_enable
/*0x6a98*/      movs r0, #2
/*0x6a9a*/      bl ckcu_set_usb_prescaler
/*0x6a9e*/      ldr r4, [pc, #0x48] /* data_6ae8 */
/*0x6aa0*/      ldr r0, [pc, #0x40] /* data_6ae4 */
/*0x6aa2*/      str r0, [r4, #8]
/*0x6aa4*/      subs r0, #0x5c
/*0x6aa6*/      str r0, [r4, #0xc]
/*0x6aa8*/      subs r0, #0xf4
/*0x6aaa*/      str r0, [r4, #0x10]
/*0x6aac*/      movs r0, #2
/*0x6aae*/      str r0, [r4, #0x14]
/*0x6ab0*/      bl call_68a4
/*0x6ab4*/      mov r0, r4
/*0x6ab6*/      bl call_6a4c
/*0x6aba*/      ldr r1, [pc, #0x30] /* data_6aec */
/*0x6abc*/      mov.w r0, #0x200000
/*0x6ac0*/      str.w r0, [r1, #0x100]
/*0x6ac4*/      movs r0, #1
/*0x6ac6*/      bl call_6b10
/*0x6aca*/      movs r0, #0xfa
/*0x6acc*/      bl spin_wait
/*0x6ad0*/      ldrb.w r0, [r4, #0x34]
/*0x6ad4*/      pop.w {r4, lr}
/*0x6ad8*/      and r1, r0, #1
/*0x6adc*/      ldr r0, [pc, #0x10] /* data_6af0 */
/*0x6ade*/      b.w jump_6d54

/*0x6ae2*/  .byte 0x00
/*0x6ae3*/  .byte 0x00

            data_6ae4:
/*0x6ae4*/  .word 0x00008378
            data_6ae8:
/*0x6ae8*/  .word 0x200006cc
            data_6aec:
/*0x6aec*/  .word 0xe000e004
            data_6af0:
/*0x6af0*/  .word 0x2000018c


            .thumb_func
            call_6af4:
/*0x6af4*/      ldr r1, [pc, #0x14] /* data_6b0c */
/*0x6af6*/      cmp r0, #1
/*0x6af8*/      ldr r0, [r1]
/*0x6afa*/      beq jump_6b04
/*0x6afc*/      bic r0, r0, #0x800
            jump_6b00:
/*0x6b00*/      str r0, [r1]
/*0x6b02*/      bx lr
            jump_6b04:
/*0x6b04*/      orr r0, r0, #0x800
/*0x6b08*/      b jump_6b00

/*0x6b0a*/  .byte 0x00
/*0x6b0b*/  .byte 0x00

            data_6b0c:
/*0x6b0c*/  .word 0x400a8000


            .thumb_func
            call_6b10:
/*0x6b10*/      ldr r1, [pc, #0x14] /* data_6b28 */
/*0x6b12*/      cmp r0, #1
/*0x6b14*/      ldr r0, [r1]
/*0x6b16*/      beq jump_6b20
/*0x6b18*/      bic r0, r0, #0x400
            jump_6b1c:
/*0x6b1c*/      str r0, [r1]
/*0x6b1e*/      bx lr
            jump_6b20:
/*0x6b20*/      orr r0, r0, #0x400
/*0x6b24*/      b jump_6b1c

/*0x6b26*/  .byte 0x00
/*0x6b27*/  .byte 0x00

            data_6b28:
/*0x6b28*/  .word 0x400a8000


            .thumb_func
            call_6b2c:
/*0x6b2c*/      movs r1, #0
/*0x6b2e*/      movs r0, #0x20
/*0x6b30*/      movs r3, #1
/*0x6b32*/      mov r2, r1
/*0x6b34*/      b.w jump_60e8

            .thumb_func
            call_6b38:
/*0x6b38*/      push {r4, lr}
/*0x6b3a*/      bl call_79fc
/*0x6b3e*/      ldr r1, [r0]
/*0x6b40*/      and r1, r1, #9
/*0x6b44*/      str r1, [r0]
/*0x6b46*/      pop {r4, pc}

            .thumb_func
            call_6b48:
/*0x6b48*/      push {r4, lr}
/*0x6b4a*/      bl call_79fc
/*0x6b4e*/      ldr r1, [r0]
/*0x6b50*/      and r1, r1, #0x24
/*0x6b54*/      str r1, [r0]
/*0x6b56*/      pop {r4, pc}

            .thumb_func
            call_6b58:
/*0x6b58*/      push {r4, lr}
/*0x6b5a*/      mov r4, r1
/*0x6b5c*/      bl call_79fc
/*0x6b60*/      str r4, [r0, #8]
/*0x6b62*/      pop {r4, pc}

            .thumb_func
            call_6b64:
/*0x6b64*/      push {r4, lr}
/*0x6b66*/      bl call_79fc
/*0x6b6a*/      ldr r0, [r0, #0x10]
/*0x6b6c*/      ldr r1, [pc, #8] /* data_6b78 */
/*0x6b6e*/      ubfx r0, r0, #0, #0xa
/*0x6b72*/      add r0, r1
/*0x6b74*/      pop {r4, pc}

/*0x6b76*/  .byte 0x00
/*0x6b77*/  .byte 0x00

            data_6b78:
/*0x6b78*/  .word 0x400aa000


            .thumb_func
            call_6b7c:
/*0x6b7c*/      push {r4, r5, r6, lr}
/*0x6b7e*/      mov r5, r0
/*0x6b80*/      bl call_79fc
/*0x6b84*/      mov r4, r0
/*0x6b86*/      mov r0, r5
/*0x6b88*/      bl call_6ba0
/*0x6b8c*/      ldr r1, [r4, #0x10]
/*0x6b8e*/      ubfx r1, r1, #0, #0xa
/*0x6b92*/      add r0, r1
/*0x6b94*/      ldr r1, [pc, #4] /* data_6b9c */
/*0x6b96*/      add r0, r1
/*0x6b98*/      pop {r4, r5, r6, pc}

/*0x6b9a*/  .byte 0x00
/*0x6b9b*/  .byte 0x00

            data_6b9c:
/*0x6b9c*/  .word 0x400aa000


            .thumb_func
            call_6ba0:
/*0x6ba0*/      push {r4, lr}
/*0x6ba2*/      bl call_79fc
/*0x6ba6*/      ldr r0, [r0, #0x10]
/*0x6ba8*/      ubfx r0, r0, #0xa, #0xa
/*0x6bac*/      pop {r4, pc}

            .thumb_func
            call_6bae:
/*0x6bae*/      push {r4, lr}
/*0x6bb0*/      bl call_79fc
/*0x6bb4*/      ldr r1, [r0, #0x10]
/*0x6bb6*/      ldr r0, [r0]
/*0x6bb8*/      lsls r1, r1, #3
/*0x6bba*/      bpl jump_6bc2
/*0x6bbc*/      ubfx r0, r0, #2, #1
/*0x6bc0*/      pop {r4, pc}
            jump_6bc2:
/*0x6bc2*/      ubfx r0, r0, #5, #1
/*0x6bc6*/      pop {r4, pc}

            .thumb_func
            call_6bc8:
/*0x6bc8*/      push {r4, lr}
/*0x6bca*/      bl call_79fc
/*0x6bce*/      ldr r1, [r0, #4]
/*0x6bd0*/      ldr r0, [r0, #8]
/*0x6bd2*/      ands r0, r1
/*0x6bd4*/      pop {r4, pc}

            .thumb_func
            call_6bd6:
/*0x6bd6*/      push {r4, lr}
/*0x6bd8*/      mov r4, r1
/*0x6bda*/      bl call_79fc
/*0x6bde*/      ldr r0, [r0, #0xc]
/*0x6be0*/      lsrs r0, r4
/*0x6be2*/      ubfx r0, r0, #0, #9
/*0x6be6*/      pop {r4, pc}

            .thumb_func
            call_6be8:
/*0x6be8*/      push {r4, r5, r6, lr}
/*0x6bea*/      mov r4, r1
/*0x6bec*/      mov r5, r0
/*0x6bee*/      bl call_79fc
/*0x6bf2*/      add.w r1, r4, r5, lsl #3
/*0x6bf6*/      ldr r2, [r1, #4]
/*0x6bf8*/      str r2, [r0, #0x10]
/*0x6bfa*/      ldr r1, [r1, #8]
/*0x6bfc*/      str r1, [r0, #4]
/*0x6bfe*/      mov.w r1, #-1
/*0x6c02*/      str r1, [r0, #8]
/*0x6c04*/      mov r0, r5
/*0x6c06*/      pop.w {r4, r5, r6, lr}
/*0x6c0a*/      b.w jump_6c78

            .thumb_func
            call_6c0e:
/*0x6c0e*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6c12*/      mov r6, r2
/*0x6c14*/      mov r7, r1
/*0x6c16*/      movs r5, r0
/*0x6c18*/      beq jump_6c3e
/*0x6c1a*/      movs r1, #0
            jump_6c1c:
/*0x6c1c*/      bl call_6bd6
/*0x6c20*/      mov r4, r0
/*0x6c22*/      cmp r0, r6
/*0x6c24*/      bhi jump_6c38
/*0x6c26*/      mov r0, r5
/*0x6c28*/      cbz r5, jump_6c42
/*0x6c2a*/      bl call_6b64
            jump_6c2e:
/*0x6c2e*/      adds r1, r4, #3
/*0x6c30*/      lsrs r2, r1, #2
/*0x6c32*/      mov r1, r7
/*0x6c34*/      bl call_79ec
            jump_6c38:
/*0x6c38*/      mov r0, r4
/*0x6c3a*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6c3e:
/*0x6c3e*/      movs r1, #0x10
/*0x6c40*/      b jump_6c1c
            jump_6c42:
/*0x6c42*/      bl call_6b7c
/*0x6c46*/      b jump_6c2e

            .thumb_func
            call_6c48:
/*0x6c48*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6c4c*/      mov r5, r2
/*0x6c4e*/      mov r6, r1
/*0x6c50*/      mov r7, r0
/*0x6c52*/      bl call_79fc
/*0x6c56*/      mov r4, r0
/*0x6c58*/      movs r0, #0
/*0x6c5a*/      cbz r5, jump_6c6c
/*0x6c5c*/      mov r2, r5
/*0x6c5e*/      mov r1, r6
/*0x6c60*/      mov r0, r7
/*0x6c62*/      bl call_6c0e
/*0x6c66*/      cbnz r0, jump_6c6c
/*0x6c68*/      cmp r5, #0
/*0x6c6a*/      bne jump_6c74
            jump_6c6c:
/*0x6c6c*/      ldr r1, [r4]
/*0x6c6e*/      and r1, r1, #0x10
/*0x6c72*/      str r1, [r4]
            jump_6c74:
/*0x6c74*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6c78:
/*0x6c78*/      push {r4, lr}
/*0x6c7a*/      bl call_79fc
/*0x6c7e*/      ldr r1, [r0]
/*0x6c80*/      and r1, r1, #0x19
/*0x6c84*/      str r1, [r0]
/*0x6c86*/      pop {r4, pc}
            jump_6c88:
/*0x6c88*/      push {r4, lr}
/*0x6c8a*/      bl call_79fc
/*0x6c8e*/      movs r1, #4
/*0x6c90*/      str r1, [r0]
/*0x6c92*/      pop {r4, pc}

            .thumb_func
            call_6c94:
/*0x6c94*/      push {r4, lr}
/*0x6c96*/      bl call_79fc
/*0x6c9a*/      movs r1, #0x40
/*0x6c9c*/      str r1, [r0, #8]
/*0x6c9e*/      ldr r2, [r0]
/*0x6ca0*/      movs r1, #0x24
/*0x6ca2*/      bics r1, r2
/*0x6ca4*/      str r1, [r0]
/*0x6ca6*/      pop {r4, pc}

            .thumb_func
            call_6ca8:
/*0x6ca8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6cac*/      mov r4, r2
/*0x6cae*/      mov r8, r1
/*0x6cb0*/      mov r7, r0
/*0x6cb2*/      bl call_6ba0
/*0x6cb6*/      mov r6, r0
/*0x6cb8*/      mov r0, r7
/*0x6cba*/      bl call_79fc
/*0x6cbe*/      mov r5, r0
/*0x6cc0*/      movs r1, #0
/*0x6cc2*/      mov r0, r7
/*0x6cc4*/      bl call_6bd6
/*0x6cc8*/      cmp r4, r6
/*0x6cca*/      bhi jump_6cce
/*0x6ccc*/      cbz r0, jump_6cd4
            jump_6cce:
/*0x6cce*/      movs r0, #0
            jump_6cd0:
/*0x6cd0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6cd4:
/*0x6cd4*/      mov r0, r7
/*0x6cd6*/      bl call_6b64
/*0x6cda*/      mov r1, r0
/*0x6cdc*/      adds r0, r4, #3
/*0x6cde*/      lsrs r2, r0, #2
/*0x6ce0*/      mov r0, r8
/*0x6ce2*/      bl call_79ec
/*0x6ce6*/      str r4, [r5, #0xc]
/*0x6ce8*/      movs r0, #2
/*0x6cea*/      str r0, [r5]
/*0x6cec*/      mov r0, r4
/*0x6cee*/      b jump_6cd0

            .thumb_func
            call_6cf0:
/*0x6cf0*/      ldr r1, [pc, #8] /* data_6cfc */
/*0x6cf2*/      ldr r2, [r1, #4]
/*0x6cf4*/      orrs r2, r0
/*0x6cf6*/      str r2, [r1, #4]
/*0x6cf8*/      bx lr

/*0x6cfa*/  .byte 0x00
/*0x6cfb*/  .byte 0x00

            data_6cfc:
/*0x6cfc*/  .word 0x400a8000


            .thumb_func
            call_6d00:
/*0x6d00*/      mov r3, r0
/*0x6d02*/      movs r1, #7
            jump_6d04:
/*0x6d04*/      add.w r2, r1, #8
/*0x6d08*/      lsr.w r0, r3, r2
/*0x6d0c*/      lsls r2, r0, #0x1f
/*0x6d0e*/      beq jump_6d14
/*0x6d10*/      sxtb r0, r1
/*0x6d12*/      bx lr
            jump_6d14:
/*0x6d14*/      subs r1, r1, #1
/*0x6d16*/      cmp r1, #0
/*0x6d18*/      bgt jump_6d04
/*0x6d1a*/      mov.w r0, #-1
/*0x6d1e*/      bx lr

            .thumb_func
            call_6d20:
/*0x6d20*/      ldr r0, [pc, #8] /* data_6d2c */
/*0x6d22*/      ldr r1, [r0, #4]
/*0x6d24*/      ldr r0, [r0, #8]
/*0x6d26*/      ands r0, r1
/*0x6d28*/      bx lr

/*0x6d2a*/  .byte 0x00
/*0x6d2b*/  .byte 0x00

            data_6d2c:
/*0x6d2c*/  .word 0x400a8000

            jump_6d30:
/*0x6d30*/      b.w jump_6dcc

            .thumb_func
            call_6d34:
/*0x6d34*/      ldr r0, [pc, #8] /* data_6d40 */
/*0x6d36*/      ldr r1, [r0]
/*0x6d38*/      orr r1, r1, #0xc
/*0x6d3c*/      str r1, [r0]
/*0x6d3e*/      bx lr

            data_6d40:
/*0x6d40*/  .word 0x400a8000


            .thumb_func
            call_6d44:
/*0x6d44*/      ldr r0, [pc, #8] /* data_6d50 */
/*0x6d46*/      ldr r1, [r0]
/*0x6d48*/      and r1, r1, #0x400
/*0x6d4c*/      str r1, [r0]
/*0x6d4e*/      bx lr

            data_6d50:
/*0x6d50*/  .word 0x400a8000

            jump_6d54:
/*0x6d54*/      push {r4, lr}
/*0x6d56*/      mov r4, r0
/*0x6d58*/      ldr r0, [pc, #0x68] /* data_6dc4 */
/*0x6d5a*/      ldr r2, [r0]
/*0x6d5c*/      cmp r2, #1
/*0x6d5e*/      bne jump_6dc0
/*0x6d60*/      movs r2, #0
/*0x6d62*/      str r2, [r0]
/*0x6d64*/      ldr r0, [pc, #0x60] /* data_6dc8 */
/*0x6d66*/      ldr r2, [r0]
/*0x6d68*/      lsls r3, r2, #0x19
/*0x6d6a*/      mov.w r2, #-1
/*0x6d6e*/      bpl jump_6d8a
/*0x6d70*/      movw r3, #0x40c
/*0x6d74*/      str r3, [r0]
/*0x6d76*/      str r2, [r0, #8]
/*0x6d78*/      cbnz r1, jump_6d80
/*0x6d7a*/      movs r0, #0
/*0x6d7c*/      bl call_5ea4
            jump_6d80:
/*0x6d80*/      ldr r0, [r4]
/*0x6d82*/      pop.w {r4, lr}
/*0x6d86*/      b.w call_6cf0
            jump_6d8a:
/*0x6d8a*/      movw r3, #0xc0c
/*0x6d8e*/      str r3, [r0]
/*0x6d90*/      str r2, [r0, #8]
/*0x6d92*/      cbnz r1, jump_6d9a
/*0x6d94*/      movs r0, #0
/*0x6d96*/      bl call_5ea4
            jump_6d9a:
/*0x6d9a*/      movs r0, #0
/*0x6d9c*/      bl call_6af4
/*0x6da0*/      ldr r0, [r4]
/*0x6da2*/      bl call_6cf0
/*0x6da6*/      movs r0, #0
/*0x6da8*/      bl call_6b10
/*0x6dac*/      movs r1, #0xc8
/*0x6dae*/      movs r0, #0
            jump_6db0:
/*0x6db0*/      adds r0, r0, #1
/*0x6db2*/      cmp r0, r1
/*0x6db4*/      blo jump_6db0
/*0x6db6*/      pop.w {r4, lr}
/*0x6dba*/      movs r0, #1
/*0x6dbc*/      b.w call_6b10
            jump_6dc0:
/*0x6dc0*/      pop {r4, pc}

/*0x6dc2*/  .byte 0x00
/*0x6dc3*/  .byte 0x00

            data_6dc4:
/*0x6dc4*/  .word 0x2000001c
            data_6dc8:
/*0x6dc8*/  .word 0x400a8000

            jump_6dcc:
/*0x6dcc*/      movw r1, #0x111d
/*0x6dd0*/      str r1, [r0]
/*0x6dd2*/      ldr r1, [pc, #0x28] /* data_6dfc */
/*0x6dd4*/      str r1, [r0, #4]
/*0x6dd6*/      movw r1, #0x212
/*0x6dda*/      str r1, [r0, #8]
/*0x6ddc*/      ldr r1, [pc, #0x20] /* data_6e00 */
/*0x6dde*/      str r1, [r0, #0xc]
/*0x6de0*/      ldr r2, [pc, #0x20] /* data_6e04 */
/*0x6de2*/      movs r1, #0x10
/*0x6de4*/      strd r1, r2, [r0, #0x10]
/*0x6de8*/      str r1, [r0, #0x18]
/*0x6dea*/      ldr r1, [pc, #0x1c] /* data_6e08 */
/*0x6dec*/      str r1, [r0, #0x1c]
/*0x6dee*/      movs r1, #0
/*0x6df0*/      str r1, [r0, #0x20]
/*0x6df2*/      ldr r1, [pc, #0x18] /* data_6e0c */
/*0x6df4*/      str r1, [r0, #0x24]
/*0x6df6*/      movs r1, #2
/*0x6df8*/      str r1, [r0, #0x28]
/*0x6dfa*/      bx lr

            data_6dfc:
/*0x6dfc*/  .word 0x80010008
            data_6e00:
/*0x6e00*/  .word 0x91002088
            data_6e04:
/*0x6e04*/  .word 0x92010090
            data_6e08:
/*0x6e08*/  .word 0x930100d0
            data_6e0c:
/*0x6e0c*/  .word 0x84010110


            .thumb_func
            call_6e10:
/*0x6e10*/      push {r4, lr}
/*0x6e12*/      ldr r4, [pc, #0x48] /* data_6e5c */
/*0x6e14*/      ldrb.w r0, [r4, #0x32]
/*0x6e18*/      cmp r0, #3
/*0x6e1a*/      bne jump_6e20
/*0x6e1c*/      bl call_7a0c
            jump_6e20:
/*0x6e20*/      ldr r1, [pc, #0x3c] /* data_6e60 */
/*0x6e22*/      ldrb r0, [r1, #5]
/*0x6e24*/      cbz r0, jump_6e46
/*0x6e26*/      cmp r0, #1
/*0x6e28*/      beq jump_6e3e
/*0x6e2a*/      cmp r0, #2
/*0x6e2c*/      bne jump_6e4e
/*0x6e2e*/      ldrb.w r0, [r4, #0x32]
/*0x6e32*/      cmp r0, #6
/*0x6e34*/      bne jump_6e3a
/*0x6e36*/      bl call_7538
            jump_6e3a:
/*0x6e3a*/      movs r0, #2
/*0x6e3c*/      pop {r4, pc}
            jump_6e3e:
/*0x6e3e*/      movs r0, #0
/*0x6e40*/      strb r0, [r1, #5]
/*0x6e42*/      movs r0, #3
/*0x6e44*/      pop {r4, pc}
            jump_6e46:
/*0x6e46*/      ldrb.w r0, [r4, #0x32]
/*0x6e4a*/      cmp r0, #6
/*0x6e4c*/      beq jump_6e52
            jump_6e4e:
/*0x6e4e*/      movs r0, #0
/*0x6e50*/      pop {r4, pc}
            jump_6e52:
/*0x6e52*/      movs r0, #2
/*0x6e54*/      strb r0, [r1, #5]
/*0x6e56*/      movs r0, #1
/*0x6e58*/      pop {r4, pc}

/*0x6e5a*/  .byte 0x00
/*0x6e5b*/  .byte 0x00

            data_6e5c:
/*0x6e5c*/  .word 0x200006cc
            data_6e60:
/*0x6e60*/  .word 0x20000040


            .thumb_func
            call_6e64:
/*0x6e64*/      ldr r1, [pc, #8] /* data_6e70 */
/*0x6e66*/      ldr r2, [r1]
/*0x6e68*/      str r2, [r0]
/*0x6e6a*/      ldr r1, [r1, #4]
/*0x6e6c*/      str r1, [r0, #4]
/*0x6e6e*/      bx lr

            data_6e70:
/*0x6e70*/  .word 0x400aa000

            jump_6e74:
/*0x6e74*/      ldr r0, [pc, #8] /* data_6e80 */
/*0x6e76*/      ldr r1, [r0]
/*0x6e78*/      orr r1, r1, #0x20
/*0x6e7c*/      str r1, [r0]
/*0x6e7e*/      bx lr

            data_6e80:
/*0x6e80*/  .word 0x400a8000


            .thumb_func
            call_6e84:
/*0x6e84*/      ldr r1, [pc, #0xc] /* data_6e94 */
/*0x6e86*/      ldr r2, [r1]
/*0x6e88*/      orr r2, r2, #0x100
/*0x6e8c*/      str r2, [r1]
/*0x6e8e*/      str r0, [r1, #0x10]
/*0x6e90*/      bx lr

/*0x6e92*/  .byte 0x00
/*0x6e93*/  .byte 0x00

            data_6e94:
/*0x6e94*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x6e98*/      ldr r0, [pc, #4] /* data_6ea0 */
/*0x6e9a*/      b.w jump_68dc

/*0x6e9e*/  .byte 0x00
/*0x6e9f*/  .byte 0x00

            data_6ea0:
/*0x6ea0*/  .word 0x200006cc


            .thumb_func
            watchdog_init:
/*0x6ea4*/      ldr r1, [pc, #0x1c] /* data_6ec4 */
/*0x6ea6*/      movs r0, #0x10
/*0x6ea8*/      str.w r0, [r1, #0x10c]
/*0x6eac*/      ldr r0, [pc, #0x18] /* data_6ec8 */
/*0x6eae*/      movw r1, #0x5fff
/*0x6eb2*/      str r1, [r0, #8]
/*0x6eb4*/      ldr r1, [pc, #0x14] /* data_6ecc */
/*0x6eb6*/      str r1, [r0, #4]
/*0x6eb8*/      movw r1, #0xca35
/*0x6ebc*/      str r1, [r0, #0x10]
/*0x6ebe*/      ldr r1, [pc, #0x10] /* data_6ed0 */
/*0x6ec0*/      str r1, [r0]
/*0x6ec2*/      bx lr

            data_6ec4:
/*0x6ec4*/  .word 0x40088000
            data_6ec8:
/*0x6ec8*/  .word 0x40068000
            data_6ecc:
/*0x6ecc*/  .word 0x0001a7d0
            data_6ed0:
/*0x6ed0*/  .word 0x5fa00001


            .thumb_func
            call_6ed4:
/*0x6ed4*/      ldr r1, [pc, #8] /* data_6ee0 */
/*0x6ed6*/      ldr r0, [pc, #4] /* data_6edc */
/*0x6ed8*/      str r0, [r1]
/*0x6eda*/      bx lr

            data_6edc:
/*0x6edc*/  .word 0x5fa00001
            data_6ee0:
/*0x6ee0*/  .word 0x40068000

            jump_6ee4:
/*0x6ee4*/      push {r4, lr}
/*0x6ee6*/      bl call_3f98
/*0x6eea*/      ldr r1, [pc, #0x10] /* data_6efc */
/*0x6eec*/      movs r0, #0
/*0x6eee*/      str r0, [r1, #4]
/*0x6ef0*/      ldr r1, [pc, #0xc] /* data_6f00 */
/*0x6ef2*/      strb r0, [r1, #6]
/*0x6ef4*/      movs r0, #1
/*0x6ef6*/      strb r0, [r1]
/*0x6ef8*/      pop {r4, pc}

/*0x6efa*/  .byte 0x00
/*0x6efb*/  .byte 0x00

            data_6efc:
/*0x6efc*/  .word 0x2000000c
            data_6f00:
/*0x6f00*/  .word 0x20000644

            jump_6f04:
/*0x6f04*/      push {r4, r5, r6, lr}
/*0x6f06*/      mov r6, r0
/*0x6f08*/      mov r5, r2
/*0x6f0a*/      mov r4, r1
/*0x6f0c*/      mov r0, r1
/*0x6f0e*/      bl call_4458
/*0x6f12*/      mov r2, r5
/*0x6f14*/      mov r1, r4
/*0x6f16*/      mov r0, r6
/*0x6f18*/      pop.w {r4, r5, r6, lr}
/*0x6f1c*/      b.w jump_44a8

            .thumb_func
            call_6f20:
/*0x6f20*/      push {r4, r5, lr}
/*0x6f22*/      ldr r1, [pc, #0x24] /* data_6f48 */
/*0x6f24*/      movs r0, #0xa
/*0x6f26*/      ldr r2, [pc, #0x1c] /* data_6f44 */
/*0x6f28*/      ldr r3, [pc, #0x20] /* data_6f4c */
/*0x6f2a*/      ldrb.w r1, [r1, #0x25]
/*0x6f2e*/      b jump_6f3a
            jump_6f30:
/*0x6f30*/      ldrb r4, [r2, r0]
/*0x6f32*/      muls r4, r1, r4
/*0x6f34*/      lsrs r4, r4, #3
/*0x6f36*/      adds r5, r3, r0
/*0x6f38*/      strb r4, [r5, #4]
            jump_6f3a:
/*0x6f3a*/      subs r0, r0, #1
/*0x6f3c*/      uxtb r0, r0
/*0x6f3e*/      bhs jump_6f30
/*0x6f40*/      pop {r4, r5, pc}

/*0x6f42*/  .byte 0x00
/*0x6f43*/  .byte 0x00

            data_6f44:
/*0x6f44*/  .word data_7e91
            data_6f48:
/*0x6f48*/  .word 0x20000708
            data_6f4c:
/*0x6f4c*/  .word 0x200000ac


            .thumb_func
            call_6f50:
/*0x6f50*/      push {r4, r5, r6, r7, lr}
/*0x6f52*/      ldr r6, [pc, #0x194] /* data_70e8 */
/*0x6f54*/      ldr r4, [pc, #0x194] /* data_70ec */
/*0x6f56*/      sub sp, #0x24
/*0x6f58*/      ldrb r0, [r6, #3]
/*0x6f5a*/      cmp r0, #5
/*0x6f5c*/      bhi jump_6ffa
/*0x6f5e*/      cmp r0, #6
/*0x6f60*/      bhs jump_6f96
/*0x6f62*/      tbb [pc, r0]

/*0x6f66*/  .byte 0x03
/*0x6f67*/  .byte 0x03
/*0x6f68*/  .byte 0x1d
/*0x6f69*/  .byte 0x56
/*0x6f6a*/  .byte 0x43
/*0x6f6b*/  .byte 0x43

            switch_6f6c:
/*0x6f6c*/      movs r5, #3
/*0x6f6e*/      ldr r7, [pc, #0x180] /* data_70f0 */
/*0x6f70*/      b jump_6f90
            jump_6f72:
/*0x6f72*/      ldrb r0, [r6, #3]
/*0x6f74*/      cbz r0, jump_6f9a
/*0x6f76*/      adds r0, r4, r5
/*0x6f78*/      ldrb r0, [r0, #4]
            jump_6f7a:
/*0x6f7a*/      ldr r1, [r4]
/*0x6f7c*/      ldrb r1, [r1, #3]
/*0x6f7e*/      muls r0, r1, r0
/*0x6f80*/      lsrs r2, r0, #3
/*0x6f82*/      add.w r0, r5, r5, lsl #3
/*0x6f86*/      add.w r0, r7, r0, lsl #3
/*0x6f8a*/      movs r1, #0x48
/*0x6f8c*/      bl mem_set
            jump_6f90:
/*0x6f90*/      subs r5, r5, #1
/*0x6f92*/      uxtb r5, r5
/*0x6f94*/      bhs jump_6f72
            jump_6f96:
/*0x6f96*/      add sp, #0x24
/*0x6f98*/      pop {r4, r5, r6, r7, pc}
            jump_6f9a:
/*0x6f9a*/      ldr r0, [r4]
/*0x6f9c*/      ldrb r0, [r0, r5]
/*0x6f9e*/      b jump_6f7a
            switch_6fa0:
/*0x6fa0*/      ldrb r7, [r4, #4]
/*0x6fa2*/      movs r5, #0xc
/*0x6fa4*/      mov r6, sp
/*0x6fa6*/      b jump_6fc4
            jump_6fa8:
/*0x6fa8*/      ldr r0, [r4]
/*0x6faa*/      ldrb r0, [r0, #3]
/*0x6fac*/      lsls r1, r0, #5
/*0x6fae*/      sub.w r0, r1, r0, lsl #1
/*0x6fb2*/      uxtb r1, r0
/*0x6fb4*/      add.w r0, r5, r5, lsl #1
/*0x6fb8*/      adds r2, r0, r6
/*0x6fba*/      mov r0, r7
/*0x6fbc*/      bl call_402c
/*0x6fc0*/      adds r7, #0x20
/*0x6fc2*/      uxtb r7, r7
            jump_6fc4:
/*0x6fc4*/      subs r5, r5, #1
/*0x6fc6*/      uxtb r5, r5
/*0x6fc8*/      bhs jump_6fa8
/*0x6fca*/      ldr r5, [pc, #0x128] /* data_70f4 */
/*0x6fcc*/      movs r4, #0x48
/*0x6fce*/      b jump_6fe4
            jump_6fd0:
/*0x6fd0*/      ldrb r0, [r5]
/*0x6fd2*/      cmp r0, #0xc
/*0x6fd4*/      bhs jump_6fe2
/*0x6fd6*/      add.w r0, r0, r0, lsl #1
/*0x6fda*/      adds r1, r0, r6
/*0x6fdc*/      mov r0, r4
/*0x6fde*/      bl call_40d0
            jump_6fe2:
/*0x6fe2*/      subs r5, r5, #1
            jump_6fe4:
/*0x6fe4*/      subs r4, r4, #1
/*0x6fe6*/      uxtb r4, r4
/*0x6fe8*/      bhs jump_6fd0
/*0x6fea*/      b jump_6f96
            switch_6fec:
/*0x6fec*/      add sp, #0x24
/*0x6fee*/      subs r0, r0, #4
/*0x6ff0*/      pop.w {r4, r5, r6, r7, lr}
/*0x6ff4*/      uxtb r0, r0
/*0x6ff6*/      b.w jump_39f8
            jump_6ffa:
/*0x6ffa*/      cmp r0, #7
/*0x6ffc*/      bls jump_6f96
/*0x6ffe*/      bic r0, r0, #1
/*0x7002*/      cmp r0, #8
/*0x7004*/      beq switch_7012
/*0x7006*/      cmp r0, #0xa
/*0x7008*/      beq jump_701e
/*0x700a*/      cmp r0, #0xc
/*0x700c*/      bne jump_6f96
/*0x700e*/      movs r5, #0x48
/*0x7010*/      b jump_70de
            switch_7012:
/*0x7012*/      add sp, #0x24
/*0x7014*/      adds r0, r4, #4
/*0x7016*/      pop.w {r4, r5, r6, r7, lr}
/*0x701a*/      b.w call_40a8
            jump_701e:
/*0x701e*/      movs r0, #0
/*0x7020*/      movs r5, #0xc
/*0x7022*/      str r0, [sp, #4]
/*0x7024*/      b jump_707c
            jump_7026:
/*0x7026*/      add.w r0, r5, r5, lsl #1
/*0x702a*/      add.w r1, r4, r0, lsl #1
/*0x702e*/      ldrb r0, [r1, #4]!
/*0x7032*/      cbnz r0, jump_703c
/*0x7034*/      ldrb r0, [r1, #1]
/*0x7036*/      cbnz r0, jump_703c
/*0x7038*/      ldrb r0, [r1, #2]
/*0x703a*/      cbz r0, jump_7068
            jump_703c:
/*0x703c*/      ldrb r0, [r1, #3]
/*0x703e*/      cbnz r0, jump_7048
/*0x7040*/      ldrb r0, [r1, #4]
/*0x7042*/      cbnz r0, jump_7048
/*0x7044*/      ldrb r0, [r1, #5]
/*0x7046*/      cbz r0, jump_7064
            jump_7048:
/*0x7048*/      movs r2, #3
/*0x704a*/      mov r6, sp
/*0x704c*/      b jump_705c
            jump_704e:
/*0x704e*/      adds r3, r1, r2
/*0x7050*/      ldrb r0, [r1, r2]
/*0x7052*/      ldrb r3, [r3, #3]
/*0x7054*/      cmp r0, r3
/*0x7056*/      bhi jump_705a
/*0x7058*/      mov r0, r3
            jump_705a:
/*0x705a*/      strb r0, [r6, r2]
            jump_705c:
/*0x705c*/      subs r2, r2, #1
/*0x705e*/      uxtb r2, r2
/*0x7060*/      bhs jump_704e
/*0x7062*/      mov r1, r6
            jump_7064:
/*0x7064*/      mov r0, r5
/*0x7066*/      b jump_7078
            jump_7068:
/*0x7068*/      ldrb r0, [r1, #3]
/*0x706a*/      cbnz r0, jump_7074
/*0x706c*/      ldrb r0, [r1, #4]
/*0x706e*/      cbnz r0, jump_7074
/*0x7070*/      ldrb r0, [r1, #5]
/*0x7072*/      cbz r0, jump_7084
            jump_7074:
/*0x7074*/      mov r0, r5
/*0x7076*/      adds r1, r1, #3
            jump_7078:
/*0x7078*/      bl call_70f8
            jump_707c:
/*0x707c*/      subs r5, r5, #1
/*0x707e*/      uxtb r5, r5
/*0x7080*/      bhs jump_7026
/*0x7082*/      b jump_6f96
            jump_7084:
/*0x7084*/      add r1, sp, #4
/*0x7086*/      b jump_7064
            jump_7088:
/*0x7088*/      ldr r0, [pc, #0x68] /* data_70f4 */
/*0x708a*/      adds r0, r0, #1
/*0x708c*/      ldrb r1, [r0, r5]
/*0x708e*/      and r0, r1, #7
/*0x7092*/      add.w r0, r0, r0, lsl #2
/*0x7096*/      add r0, r4
/*0x7098*/      ldrsb.w r2, [r0, #0x12]
/*0x709c*/      adds r0, #0xe
/*0x709e*/      cbz r2, jump_70d6
/*0x70a0*/      ldrb r3, [r0, #3]
/*0x70a2*/      rsbs r1, r3, r1, lsr #3
/*0x70a6*/      bpl jump_70aa
/*0x70a8*/      rsbs r1, r1, #0
            jump_70aa:
/*0x70aa*/      subs r1, r1, r2
/*0x70ac*/      adds r1, #0xa
/*0x70ae*/      uxtb r2, r1
/*0x70b0*/      cmp r2, #0xa
/*0x70b2*/      bhs jump_70d6
/*0x70b4*/      movs r1, #3
/*0x70b6*/      mov r3, sp
/*0x70b8*/      adds r6, r4, r2
/*0x70ba*/      b jump_70c6
            jump_70bc:
/*0x70bc*/      ldrb r2, [r0, r1]
/*0x70be*/      ldrb r7, [r6, #4]
/*0x70c0*/      muls r2, r7, r2
/*0x70c2*/      lsrs r2, r2, #8
/*0x70c4*/      strb r2, [r3, r1]
            jump_70c6:
/*0x70c6*/      subs r1, r1, #1
/*0x70c8*/      uxtb r1, r1
/*0x70ca*/      bhs jump_70bc
/*0x70cc*/      mov r1, r3
/*0x70ce*/      mov r0, r5
/*0x70d0*/      bl call_40d0
/*0x70d4*/      b jump_70de
            jump_70d6:
/*0x70d6*/      movs r1, #0
/*0x70d8*/      mov r0, r5
/*0x70da*/      bl call_4114
            jump_70de:
/*0x70de*/      subs r5, r5, #1
/*0x70e0*/      uxtb r5, r5
/*0x70e2*/      bhs jump_7088
/*0x70e4*/      b jump_6f96

/*0x70e6*/  .byte 0x00
/*0x70e7*/  .byte 0x00

            data_70e8:
/*0x70e8*/  .word 0x20000708
            data_70ec:
/*0x70ec*/  .word 0x200000ac
            data_70f0:
/*0x70f0*/  .word 0x2000032c
            data_70f4:
/*0x70f4*/  .word data_7e48


            .thumb_func
            call_70f8:
/*0x70f8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x70fc*/      mov r7, r1
/*0x70fe*/      mov r6, r0
/*0x7100*/      movs r4, #0x48
/*0x7102*/      ldr r5, [pc, #0x1c] /* data_7120 */
/*0x7104*/      b jump_7116
            jump_7106:
/*0x7106*/      ldrb r0, [r5]
/*0x7108*/      cmp r0, r6
/*0x710a*/      bne jump_7114
/*0x710c*/      mov r1, r7
/*0x710e*/      mov r0, r4
/*0x7110*/      bl call_40d0
            jump_7114:
/*0x7114*/      subs r5, r5, #1
            jump_7116:
/*0x7116*/      subs r4, r4, #1
/*0x7118*/      uxtb r4, r4
/*0x711a*/      bhs jump_7106
/*0x711c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_7120:
/*0x7120*/  .word data_7e48


            .thumb_func
            call_7124:
/*0x7124*/      push {r3, r4, r5, lr}
/*0x7126*/      mov r4, r0
/*0x7128*/      ldr r0, [pc, #0x24] /* data_7150 */
/*0x712a*/      ldr r0, [r0]
/*0x712c*/      ldrb r5, [r0, #3]
/*0x712e*/      cbnz r1, jump_7138
/*0x7130*/      mov r0, sp
/*0x7132*/      bl call_400a
/*0x7136*/      mov r1, sp
            jump_7138:
/*0x7138*/      movs r2, #3
/*0x713a*/      b jump_7148
            jump_713c:
/*0x713c*/      ldrb r0, [r1], #1
/*0x7140*/      muls r0, r5, r0
/*0x7142*/      lsrs r0, r0, #3
/*0x7144*/      strb r0, [r4], #1
            jump_7148:
/*0x7148*/      subs r2, r2, #1
/*0x714a*/      uxtb r2, r2
/*0x714c*/      bhs jump_713c
/*0x714e*/      pop {r3, r4, r5, pc}

            data_7150:
/*0x7150*/  .word 0x200000ac


            .thumb_func
            call_7154:
/*0x7154*/      mov.w r1, #0x8000
/*0x7158*/      cmp r0, r1
/*0x715a*/      blo jump_7160
/*0x715c*/      and.w r0, r1, r0, lsr #10
            jump_7160:
/*0x7160*/      uxth r0, r0
/*0x7162*/      bx lr

            .thumb_func
            call_7164:
/*0x7164*/      ldr r2, [pc, #0x14] /* data_717c */
/*0x7166*/      push {lr}
/*0x7168*/      ldr r0, [r2]
/*0x716a*/      cbz r0, jump_7176
/*0x716c*/      bl call_7154
/*0x7170*/      movs r1, #0x1e
/*0x7172*/      str r1, [r2]
/*0x7174*/      pop {pc}
            jump_7176:
/*0x7176*/      movs r0, #0x1e
/*0x7178*/      pop {pc}

/*0x717a*/  .byte 0x00
/*0x717b*/  .byte 0x00

            data_717c:
/*0x717c*/  .word 0x20001970


            .thumb_func
            call_7180:
/*0x7180*/      lsls r1, r0, #0x10
/*0x7182*/      bpl jump_7186
/*0x7184*/      lsls r0, r0, #0xa
            jump_7186:
/*0x7186*/      bx lr

            .thumb_func
            call_7188:
/*0x7188*/      ldr r0, [pc, #0x3c] /* data_71c8 */
/*0x718a*/      push {r4, lr}
/*0x718c*/      ldrb r0, [r0]
/*0x718e*/      and r0, r0, #3
/*0x7192*/      add.w r0, r0, r0, lsl #1
/*0x7196*/      lsls r4, r0, #3
/*0x7198*/      ldr r0, [pc, #0x30] /* data_71cc */
/*0x719a*/      ldr r0, [r0]
/*0x719c*/      bl call_4a4a
/*0x71a0*/      mov r3, r0
/*0x71a2*/      movs r0, #0x18
/*0x71a4*/      ldr r1, [pc, #0x28] /* data_71d0 */
/*0x71a6*/      b jump_71be
            jump_71a8:
/*0x71a8*/      add.w r2, r1, r4, lsl #1
/*0x71ac*/      ldrh r2, [r2, #0x28]
/*0x71ae*/      ubfx r2, r2, #0, #0xa
/*0x71b2*/      cmp r2, r3
/*0x71b4*/      bne jump_71ba
/*0x71b6*/      mov r0, r4
/*0x71b8*/      pop {r4, pc}
            jump_71ba:
/*0x71ba*/      adds r4, r4, #1
/*0x71bc*/      uxtb r4, r4
            jump_71be:
/*0x71be*/      subs r0, r0, #1
/*0x71c0*/      uxtb r0, r0
/*0x71c2*/      bhs jump_71a8
/*0x71c4*/      movs r0, #0x60
/*0x71c6*/      pop {r4, pc}

            data_71c8:
/*0x71c8*/  .word 0x20000008
            data_71cc:
/*0x71cc*/  .word 0x20000034
            data_71d0:
/*0x71d0*/  .word 0x20000708


            .thumb_func
            call_71d4:
/*0x71d4*/      ldr r0, [pc, #0xc] /* data_71e4 */
/*0x71d6*/      movs r1, #0
/*0x71d8*/      str r1, [r0, #7]!
/*0x71dc*/      strh r1, [r0, #4]
/*0x71de*/      strb r1, [r0, #6]
/*0x71e0*/      bx lr

/*0x71e2*/  .byte 0x00
/*0x71e3*/  .byte 0x00

            data_71e4:
/*0x71e4*/  .word 0x200001d0


            .thumb_func
            call_71e8:
/*0x71e8*/      push {r4, r5, r6, lr}
/*0x71ea*/      ldr r4, [pc, #0x68] /* data_7254 */
/*0x71ec*/      ldr r1, [pc, #0x68] /* data_7258 */
/*0x71ee*/      movs r0, #0x60
/*0x71f0*/      strb r0, [r4, #2]
/*0x71f2*/      ldrb r0, [r1, #1]
/*0x71f4*/      lsls r0, r0, #0x1f
/*0x71f6*/      beq jump_7206
/*0x71f8*/      ldrb r0, [r1, #2]
/*0x71fa*/      movs r1, #0
/*0x71fc*/      bl call_4740
/*0x7200*/      cmp r0, #0
/*0x7202*/      beq jump_7252
/*0x7204*/      b jump_721a
            jump_7206:
/*0x7206*/      movs r0, #6
/*0x7208*/      ldr r2, [pc, #0x50] /* data_725c */
/*0x720a*/      ldrb r1, [r1]
/*0x720c*/      b jump_7214
            jump_720e:
/*0x720e*/      ldrb r3, [r2, r0]
/*0x7210*/      cmp r1, r3
/*0x7212*/      beq jump_7252
            jump_7214:
/*0x7214*/      subs r0, r0, #1
/*0x7216*/      uxtb r0, r0
/*0x7218*/      bhs jump_720e
            jump_721a:
/*0x721a*/      bl call_5d90
/*0x721e*/      cmp r0, #0
/*0x7220*/      bne jump_7252
/*0x7222*/      ldr r0, [pc, #0x3c] /* data_7260 */
/*0x7224*/      ldr r2, [pc, #0x3c] /* data_7264 */
/*0x7226*/      ldr r3, [pc, #0x40] /* data_7268 */
/*0x7228*/      ldrb r0, [r0]
/*0x722a*/      and r0, r0, #3
/*0x722e*/      add.w r0, r0, r0, lsl #1
/*0x7232*/      lsls r0, r0, #3
/*0x7234*/      strb r0, [r4, #2]
/*0x7236*/      movs r0, #0x18
/*0x7238*/      b jump_724c
            jump_723a:
/*0x723a*/      ldrb r1, [r4, #2]
/*0x723c*/      add.w r5, r2, r1, lsl #1
/*0x7240*/      ldrh r5, [r5, #0x28]
/*0x7242*/      cmp.w r3, r5, lsl #22
/*0x7246*/      beq jump_7252
/*0x7248*/      adds r1, r1, #1
/*0x724a*/      strb r1, [r4, #2]
            jump_724c:
/*0x724c*/      subs r0, r0, #1
/*0x724e*/      uxtb r0, r0
/*0x7250*/      bhs jump_723a
            jump_7252:
/*0x7252*/      pop {r4, r5, r6, pc}

            data_7254:
/*0x7254*/  .word 0x2000196c
            data_7258:
/*0x7258*/  .word 0x20000034
            data_725c:
/*0x725c*/  .word data_7db7
            data_7260:
/*0x7260*/  .word 0x20000008
            data_7264:
/*0x7264*/  .word 0x20000708
            data_7268:
/*0x7268*/  .word 0xffc00000

            jump_726c:
/*0x726c*/      push {r3, r4, r5, lr}
/*0x726e*/      ldr r1, [pc, #0xa0] /* data_7310 */
/*0x7270*/      ldr r2, [pc, #0xa0] /* data_7314 */
/*0x7272*/      ldrh r0, [r1]
/*0x7274*/      ldr r2, [r2]
/*0x7276*/      add.w r4, r2, r0, lsl #2
/*0x727a*/      adds r0, r0, #1
/*0x727c*/      strh r0, [r1]
/*0x727e*/      ldrb r0, [r4, #1]
/*0x7280*/      movs r1, #4
/*0x7282*/      cmp.w r1, r0, lsr #5
/*0x7286*/      beq jump_7302
/*0x7288*/      movs r0, #0
/*0x728a*/      str r0, [sp]
/*0x728c*/      ldrh r0, [r4]
/*0x728e*/      mov r1, sp
/*0x7290*/      bl call_4a40
/*0x7294*/      ldrb r0, [r4, #1]
/*0x7296*/      lsrs r0, r0, #5
/*0x7298*/      cmp r0, #1
/*0x729a*/      beq jump_72a2
/*0x729c*/      cmp r0, #2
/*0x729e*/      bne jump_72b8
/*0x72a0*/      b jump_72ac
            jump_72a2:
/*0x72a2*/      ldrb.w r0, [sp, #3]
/*0x72a6*/      orr r0, r0, #2
/*0x72aa*/      b jump_72b4
            jump_72ac:
/*0x72ac*/      ldrb.w r0, [sp, #3]
/*0x72b0*/      bic r0, r0, #2
            jump_72b4:
/*0x72b4*/      strb.w r0, [sp, #3]
            jump_72b8:
/*0x72b8*/      ldrb.w r0, [sp, #1]
/*0x72bc*/      lsls r0, r0, #0x1f
/*0x72be*/      ldrb.w r0, [sp]
/*0x72c2*/      beq jump_72ca
/*0x72c4*/      bl call_4720
/*0x72c8*/      b jump_72ce
            jump_72ca:
/*0x72ca*/      ldr r1, [pc, #0x4c] /* data_7318 */
/*0x72cc*/      ldrb r0, [r1, r0]
            jump_72ce:
/*0x72ce*/      strb.w r0, [sp, #2]
/*0x72d2*/      ldrb.w r0, [sp, #3]
/*0x72d6*/      orr r0, r0, #5
/*0x72da*/      strb.w r0, [sp, #3]
/*0x72de*/      ldrb.w r1, [sp, #1]
/*0x72e2*/      ldrb.w r2, [sp, #2]
/*0x72e6*/      and r1, r1, #1
/*0x72ea*/      rsb r1, r1, r1, lsl #3
/*0x72ee*/      add r1, r2
/*0x72f0*/      ubfx r2, r0, #1, #1
/*0x72f4*/      uxtb r1, r1
/*0x72f6*/      ldr r0, [pc, #0x24] /* data_731c */
/*0x72f8*/      bl call_3fec
/*0x72fc*/      ldr r0, [sp]
/*0x72fe*/      bl call_47c4
            jump_7302:
/*0x7302*/      ldrh r0, [r4, #2]
/*0x7304*/      bl call_7180
/*0x7308*/      ldr r1, [pc, #0x14] /* data_7320 */
/*0x730a*/      str r0, [r1]
/*0x730c*/      pop {r3, r4, r5, pc}

/*0x730e*/  .byte 0x00
/*0x730f*/  .byte 0x00

            data_7310:
/*0x7310*/  .word 0x2000196c
            data_7314:
/*0x7314*/  .word 0x20000064
            data_7318:
/*0x7318*/  .word 0x200001de
            data_731c:
/*0x731c*/  .word 0x200001d7
            data_7320:
/*0x7320*/  .word 0x2000006c

            jump_7324:
/*0x7324*/      push {r4, r5, r6, lr}
/*0x7326*/      ldr r5, [pc, #0x60] /* data_7388 */
/*0x7328*/      ldrh r0, [r5]
/*0x732a*/      cmp r0, #0xff
/*0x732c*/      bls jump_7336
/*0x732e*/      movs r0, #1
/*0x7330*/      adds r1, r5, #4
/*0x7332*/      strb r0, [r1, #7]
/*0x7334*/      b jump_7344
            jump_7336:
/*0x7336*/      ldr r6, [pc, #0x54] /* data_738c */
/*0x7338*/      ldrb r1, [r6, #1]
/*0x733a*/      lsls r1, r1, #0x1f
/*0x733c*/      beq jump_7348
/*0x733e*/      ldrb r1, [r6]
/*0x7340*/      cmp r1, #0xc0
/*0x7342*/      bhs jump_7348
            jump_7344:
/*0x7344*/      movs r0, #1
/*0x7346*/      pop {r4, r5, r6, pc}
            jump_7348:
/*0x7348*/      ldr r1, [pc, #0x44] /* data_7390 */
/*0x734a*/      ldr r1, [r1]
/*0x734c*/      add.w r4, r1, r0, lsl #2
/*0x7350*/      adds r0, r0, #1
/*0x7352*/      strh r0, [r5]
/*0x7354*/      ldr r0, [r6]
/*0x7356*/      bl call_4a4a
/*0x735a*/      strh r0, [r4]
/*0x735c*/      ldrb r1, [r6, #3]
/*0x735e*/      lsls r1, r1, #0x1e
/*0x7360*/      bpl jump_7368
/*0x7362*/      add.w r0, r0, #0x3c00
/*0x7366*/      b jump_736c
            jump_7368:
/*0x7368*/      add.w r0, r0, #0x5c00
            jump_736c:
/*0x736c*/      strh r0, [r4]
/*0x736e*/      ldrh r0, [r5]
/*0x7370*/      cmp r0, #1
/*0x7372*/      bls jump_737c
/*0x7374*/      bl call_7164
/*0x7378*/      strh r0, [r4, #-0x2]
            jump_737c:
/*0x737c*/      ldr r1, [pc, #0x14] /* data_7394 */
/*0x737e*/      mov.w r0, #-1
/*0x7382*/      str r0, [r1]
/*0x7384*/      movs r0, #0
/*0x7386*/      pop {r4, r5, r6, pc}

            data_7388:
/*0x7388*/  .word 0x2000196c
            data_738c:
/*0x738c*/  .word 0x20000034
            data_7390:
/*0x7390*/  .word 0x20000064
            data_7394:
/*0x7394*/  .word 0x2000006c

            jump_7398:
/*0x7398*/      push {r4, lr}
/*0x739a*/      ldr r4, [pc, #0x18] /* data_73b4 */
/*0x739c*/      movs r1, #0
/*0x739e*/      ldrb r0, [r4, #2]
/*0x73a0*/      bl call_3d9c
/*0x73a4*/      movs r0, #0
/*0x73a6*/      adds r1, r4, #4
/*0x73a8*/      strh r0, [r4]
/*0x73aa*/      str r0, [r1]
/*0x73ac*/      movs r0, #4
/*0x73ae*/      strb r0, [r1, #7]
/*0x73b0*/      pop {r4, pc}

/*0x73b2*/  .byte 0x00
/*0x73b3*/  .byte 0x00

            data_73b4:
/*0x73b4*/  .word 0x2000196c


            .thumb_func
            call_73b8:
/*0x73b8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x73bc*/      ldr r4, [pc, #0xa0] /* data_7460 */
/*0x73be*/      ldr r5, [pc, #0xa4] /* data_7464 */
/*0x73c0*/      ldr.w r8, [pc, #0xa4] /* data_7468 */
/*0x73c4*/      ldr r7, [pc, #0xa4] /* data_746c */
/*0x73c6*/      movs r6, #7
            jump_73c8:
/*0x73c8*/      ldrd r0, r1, [r5]
/*0x73cc*/      str r1, [r0, #0x28]
/*0x73ce*/      subs r6, r6, #1
/*0x73d0*/      uxtb r6, r6
/*0x73d2*/      subs r4, r4, #3
/*0x73d4*/      nop 
/*0x73d6*/      nop 
/*0x73d8*/      movs r0, #0xff
/*0x73da*/      ldr r1, [r7, #0x1c]
/*0x73dc*/      lsls r1, r1, #0x16
/*0x73de*/      bmi jump_73e2
/*0x73e0*/      movs r0, #0xfe
            jump_73e2:
/*0x73e2*/      ldr.w r2, [r8, #0x1c]
/*0x73e6*/      mov r1, r8
/*0x73e8*/      lsls r2, r2, #0x1a
/*0x73ea*/      bmi jump_73f0
/*0x73ec*/      bic r0, r0, #2
            jump_73f0:
/*0x73f0*/      ldr r2, [r1, #0x1c]
/*0x73f2*/      lsls r2, r2, #0x19
/*0x73f4*/      bmi jump_73fa
/*0x73f6*/      bic r0, r0, #4
            jump_73fa:
/*0x73fa*/      ldr r1, [r1, #0x1c]
/*0x73fc*/      lsls r1, r1, #0x18
/*0x73fe*/      bmi jump_7404
/*0x7400*/      bic r0, r0, #8
            jump_7404:
/*0x7404*/      ldr r1, [r7, #0x1c]
/*0x7406*/      lsls r1, r1, #0x14
/*0x7408*/      bmi jump_740e
/*0x740a*/      bic r0, r0, #0x10
            jump_740e:
/*0x740e*/      ldr r1, [r7, #0x1c]
/*0x7410*/      lsls r1, r1, #0x12
/*0x7412*/      bmi jump_7418
/*0x7414*/      bic r0, r0, #0x20
            jump_7418:
/*0x7418*/      ldr r1, [r7, #0x1c]
/*0x741a*/      lsls r1, r1, #0x11
/*0x741c*/      bmi jump_7422
/*0x741e*/      bic r0, r0, #0x40
            jump_7422:
/*0x7422*/      ldr r1, [r7, #0x1c]
/*0x7424*/      lsls r1, r1, #0x10
/*0x7426*/      bmi jump_742c
/*0x7428*/      bic r0, r0, #0x80
            jump_742c:
/*0x742c*/      ldrd r1, r2, [r5]
/*0x7430*/      str r2, [r1, #0x24]
/*0x7432*/      ldrb r1, [r4, #1]
/*0x7434*/      cmp r1, r0
/*0x7436*/      beq jump_743e
/*0x7438*/      strb r0, [r4, #1]
/*0x743a*/      movs r0, #3
/*0x743c*/      b jump_744a
            jump_743e:
/*0x743e*/      ldrb r0, [r4]
/*0x7440*/      cbz r0, jump_744c
/*0x7442*/      cmp r0, #1
/*0x7444*/      bne jump_7448
/*0x7446*/      strb r1, [r4, #2]
            jump_7448:
/*0x7448*/      subs r0, r0, #1
            jump_744a:
/*0x744a*/      strb r0, [r4]
            jump_744c:
/*0x744c*/      cmp r6, #0
/*0x744e*/      beq jump_745a
/*0x7450*/      movs r0, #5
/*0x7452*/      bl spin_wait
/*0x7456*/      subs r5, #8
/*0x7458*/      b jump_73c8
            jump_745a:
/*0x745a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x745e*/  .byte 0x00
/*0x745f*/  .byte 0x00

            data_7460:
/*0x7460*/  .word 0x2000032b
            data_7464:
/*0x7464*/  .word data_7f54
            data_7468:
/*0x7468*/  .word 0x400b0000
            data_746c:
/*0x746c*/  .word 0x400b4000

            jump_7470:
/*0x7470*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x7472*/      ldr r0, [pc, #0x44] /* data_74b8 */
/*0x7474*/      ldr r0, [r0]
/*0x7476*/      ldr r1, [pc, #0x44] /* data_74bc */
/*0x7478*/      ldr r6, [pc, #0x44] /* data_74c0 */
/*0x747a*/      udiv r4, r0, r1
/*0x747e*/      subs r4, r4, #1
/*0x7480*/      strh.w r4, [sp]
/*0x7484*/      movs r5, #0
/*0x7486*/      strh.w r5, [sp, #2]
/*0x748a*/      mov r1, sp
/*0x748c*/      mov r0, r6
/*0x748e*/      bl call_464a
/*0x7492*/      strb.w r5, [sp]
/*0x7496*/      movs r0, #7
/*0x7498*/      strh.w r0, [sp, #2]
/*0x749c*/      movs r0, #1
/*0x749e*/      strb.w r0, [sp, #4]
/*0x74a2*/      strb.w r5, [sp, #5]
/*0x74a6*/      lsrs r0, r4, #1
/*0x74a8*/      strh.w r0, [sp, #6]
/*0x74ac*/      mov r1, sp
/*0x74ae*/      mov r0, r6
/*0x74b0*/      bl call_45f2
/*0x74b4*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x74b6*/  .byte 0x00
/*0x74b7*/  .byte 0x00

            data_74b8:
/*0x74b8*/  .word 0x20000018
            data_74bc:
/*0x74bc*/  .word 0x00dbba00
            data_74c0:
/*0x74c0*/  .word 0x4006f000


            .thumb_func
            call_74c4:
/*0x74c4*/      push {r4, lr}
/*0x74c6*/      ldr r1, [pc, #0x28] /* data_74f0 */
/*0x74c8*/      mov.w r4, #0x8000
/*0x74cc*/      str r4, [r1, #0x28]
/*0x74ce*/      nop 
/*0x74d0*/      nop 
/*0x74d2*/      str r4, [r1, #0x24]
/*0x74d4*/      mov.w r2, #0x4000
/*0x74d8*/      b jump_74e4
            jump_74da:
/*0x74da*/      str r2, [r1, #0x28]
/*0x74dc*/      nop 
/*0x74de*/      nop 
/*0x74e0*/      str r2, [r1, #0x24]
/*0x74e2*/      nop 
            jump_74e4:
/*0x74e4*/      subs r0, r0, #1
/*0x74e6*/      uxtb r0, r0
/*0x74e8*/      bhs jump_74da
/*0x74ea*/      str r4, [r1, #0x28]
/*0x74ec*/      pop {r4, pc}

/*0x74ee*/  .byte 0x00
/*0x74ef*/  .byte 0x00

            data_74f0:
/*0x74f0*/  .word 0x400b0000


            .thumb_func
            call_74f4:
/*0x74f4*/      push {r4, r5, r6, lr}
/*0x74f6*/      mov.w r4, #0x100
/*0x74fa*/      lsls r3, r4, #6
/*0x74fc*/      ldr r2, [pc, #0x20] /* data_7520 */
/*0x74fe*/      movw r5, #0xffff
/*0x7502*/      b jump_7518
            jump_7504:
/*0x7504*/      nop 
/*0x7506*/      str r3, [r2, #0x28]
/*0x7508*/      lsls r6, r0, #0x10
/*0x750a*/      bpl jump_7510
/*0x750c*/      str r4, [r2, #0x24]
/*0x750e*/      b jump_7512
            jump_7510:
/*0x7510*/      str r4, [r2, #0x28]
            jump_7512:
/*0x7512*/      str r3, [r2, #0x24]
/*0x7514*/      and.w r0, r5, r0, lsl #1
            jump_7518:
/*0x7518*/      subs r1, r1, #1
/*0x751a*/      uxtb r1, r1
/*0x751c*/      bhs jump_7504
/*0x751e*/      pop {r4, r5, r6, pc}

            data_7520:
/*0x7520*/  .word 0x400b0000

/*0x7524*/  .byte 0x01
/*0x7525*/  .byte 0x21
/*0x7526*/  .byte 0x81
/*0x7527*/  .byte 0x40
/*0x7528*/  .byte 0x02
/*0x7529*/  .byte 0x48
/*0x752a*/  .byte 0x82
/*0x752b*/  .byte 0x79
/*0x752c*/  .byte 0x11
/*0x752d*/  .byte 0x43
/*0x752e*/  .byte 0x81
/*0x752f*/  .byte 0x71
/*0x7530*/  .byte 0x70
/*0x7531*/  .byte 0x47
/*0x7532*/  .byte 0x00
/*0x7533*/  .byte 0x00
/*0x7534*/  .byte 0x40
/*0x7535*/  .byte 0x00
/*0x7536*/  .byte 0x00
/*0x7537*/  .byte 0x20


            .thumb_func
            call_7538:
/*0x7538*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x753c*/      ldr r0, [pc, #0xdc] /* data_761c */
/*0x753e*/      ldrb r1, [r0]
/*0x7540*/      movs r4, #0
/*0x7542*/      sub.w r5, r0, #0xa
/*0x7546*/      cmp r1, #1
/*0x7548*/      bne jump_7556
/*0x754a*/      strb r4, [r0]
/*0x754c*/      ldrb r0, [r5, #0x10]
/*0x754e*/      and r0, r0, #7
/*0x7552*/      bl call_5e48
            jump_7556:
/*0x7556*/      ldr r6, [pc, #0xc8] /* data_7620 */
/*0x7558*/      ldr r7, [pc, #0xc8] /* data_7624 */
/*0x755a*/      ldrb r0, [r6]
/*0x755c*/      cbz r0, jump_756a
/*0x755e*/      cmp r0, #2
/*0x7560*/      beq jump_7594
/*0x7562*/      cmp r0, #4
/*0x7564*/      beq jump_756a
/*0x7566*/      cmp r0, #5
/*0x7568*/      bne jump_75a6
            jump_756a:
/*0x756a*/      ldrb r0, [r5, #6]
/*0x756c*/      lsls r0, r0, #0x1b
/*0x756e*/      bpl jump_75a6
/*0x7570*/      movs r0, #1
/*0x7572*/      strb r0, [r6]
/*0x7574*/      movs r2, #0x40
/*0x7576*/      ldr r1, [pc, #0xb0] /* data_7628 */
/*0x7578*/      movs r0, #4
/*0x757a*/      bl call_6c48
/*0x757e*/      ldr r2, [pc, #0xa8] /* data_7628 */
/*0x7580*/      rsb.w r1, r0, #0x40
/*0x7584*/      add r0, r2
/*0x7586*/      bl mem_zero
/*0x758a*/      ldrb r0, [r5, #6]
/*0x758c*/      bic r0, r0, #0x10
/*0x7590*/      strb r0, [r5, #6]
/*0x7592*/      b jump_75a6
            jump_7594:
/*0x7594*/      ldr r0, [r7, #0x50]
/*0x7596*/      lsls r0, r0, #0x1e
/*0x7598*/      bpl jump_75a6
/*0x759a*/      movs r2, #0x40
/*0x759c*/      ldr r1, [pc, #0x88] /* data_7628 */
/*0x759e*/      movs r0, #3
/*0x75a0*/      bl call_6ca8
/*0x75a4*/      strb r4, [r6]
            jump_75a6:
/*0x75a6*/      ldr r0, [r7, #0x28]
/*0x75a8*/      lsls r0, r0, #0x1e
/*0x75aa*/      bpl jump_75dc
/*0x75ac*/      ldrb r0, [r5]
/*0x75ae*/      cbz r0, jump_75b4
/*0x75b0*/      strb r4, [r5]
/*0x75b2*/      b jump_75d0
            jump_75b4:
/*0x75b4*/      ldr r1, [pc, #0x74] /* data_762c */
/*0x75b6*/      ldr r0, [r1]
/*0x75b8*/      cbnz r0, jump_75dc
/*0x75ba*/      add.w r0, r1, #0xc
/*0x75be*/      ldr r0, [r0]
/*0x75c0*/      cbz r0, jump_75dc
/*0x75c2*/      mov.w r2, #0xfa0
/*0x75c6*/      muls r0, r2, r0
/*0x75c8*/      asrs r2, r2, #3
/*0x75ca*/      udiv r0, r0, r2
/*0x75ce*/      str r0, [r1]
            jump_75d0:
/*0x75d0*/      ldr r1, [pc, #0x48] /* data_761c */
/*0x75d2*/      movs r2, #8
/*0x75d4*/      adds r1, #0x12
/*0x75d6*/      movs r0, #1
/*0x75d8*/      bl call_6ca8
            jump_75dc:
/*0x75dc*/      ldr r0, [r7, #0x3c]
/*0x75de*/      lsls r0, r0, #0x1e
/*0x75e0*/      bpl jump_7616
/*0x75e2*/      ldrb r0, [r5, #2]
/*0x75e4*/      cbz r0, jump_75f0
/*0x75e6*/      ldr r1, [pc, #0x34] /* data_761c */
/*0x75e8*/      movs r2, #5
/*0x75ea*/      strb r4, [r5, #2]
/*0x75ec*/      adds r1, #0xa
/*0x75ee*/      b jump_760c
            jump_75f0:
/*0x75f0*/      ldrb r0, [r5, #1]
/*0x75f2*/      cbz r0, jump_75fe
/*0x75f4*/      ldr r1, [pc, #0x24] /* data_761c */
/*0x75f6*/      movs r2, #2
/*0x75f8*/      strb r4, [r5, #1]
/*0x75fa*/      subs r1, r1, #2
/*0x75fc*/      b jump_760c
            jump_75fe:
/*0x75fe*/      ldrb r0, [r5, #3]
/*0x7600*/      cmp r0, #0
/*0x7602*/      beq jump_7616
/*0x7604*/      ldr r1, [pc, #0x24] /* data_762c */
/*0x7606*/      movs r2, #0x1f
/*0x7608*/      strb r4, [r5, #3]
/*0x760a*/      adds r1, #0x18
            jump_760c:
/*0x760c*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7610*/      movs r0, #2
/*0x7612*/      b.w call_6ca8
            jump_7616:
/*0x7616*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x761a*/  .byte 0x00
/*0x761b*/  .byte 0x00

            data_761c:
/*0x761c*/  .word 0x2000004a
            data_7620:
/*0x7620*/  .word 0x2000002a
            data_7624:
/*0x7624*/  .word 0x400a8000
            data_7628:
/*0x7628*/  .word 0x20000604
            data_762c:
/*0x762c*/  .word 0x20000694

/*0x7630*/  .byte 0xf0
/*0x7631*/  .byte 0xb5
/*0x7632*/  .byte 0x01
/*0x7633*/  .byte 0x88
/*0x7634*/  .byte 0x4f
/*0x7635*/  .byte 0xf4
/*0x7636*/  .byte 0x80
/*0x7637*/  .byte 0x76
/*0x7638*/  .byte 0x40
/*0x7639*/  .byte 0xf6
/*0x763a*/  .byte 0x21
/*0x763b*/  .byte 0x15
/*0x763c*/  .byte 0x77
/*0x763d*/  .byte 0x00
/*0x763e*/  .byte 0x01
/*0x763f*/  .byte 0x23
/*0x7640*/  .byte 0x35
/*0x7641*/  .byte 0x4c
/*0x7642*/  .byte 0xa1
/*0x7643*/  .byte 0xf6
/*0x7644*/  .byte 0x21
/*0x7645*/  .byte 0x12
/*0x7646*/  .byte 0xa9
/*0x7647*/  .byte 0x42
/*0x7648*/  .byte 0x3c
/*0x7649*/  .byte 0xd0
/*0x764a*/  .byte 0x0d
/*0x764b*/  .byte 0xdc
/*0x764c*/  .byte 0x12
/*0x764d*/  .byte 0xf5
/*0x764e*/  .byte 0xf0
/*0x764f*/  .byte 0x61
/*0x7650*/  .byte 0x13
/*0x7651*/  .byte 0xd0
/*0x7652*/  .byte 0xb1
/*0x7653*/  .byte 0x42
/*0x7654*/  .byte 0x30
/*0x7655*/  .byte 0xd0
/*0x7656*/  .byte 0xb9
/*0x7657*/  .byte 0x42
/*0x7658*/  .byte 0x45
/*0x7659*/  .byte 0xd1
/*0x765a*/  .byte 0x81
/*0x765b*/  .byte 0x88
/*0x765c*/  .byte 0x00
/*0x765d*/  .byte 0x29
/*0x765e*/  .byte 0x42
/*0x765f*/  .byte 0xd1
/*0x7660*/  .byte 0x2e
/*0x7661*/  .byte 0x49
/*0x7662*/  .byte 0xc0
/*0x7663*/  .byte 0xe9
/*0x7664*/  .byte 0x07
/*0x7665*/  .byte 0x13
/*0x7666*/  .byte 0x53
/*0x7667*/  .byte 0xe0
/*0x7668*/  .byte 0x00
/*0x7669*/  .byte 0x25
/*0x766a*/  .byte 0xb2
/*0x766b*/  .byte 0x42
/*0x766c*/  .byte 0x3d
/*0x766d*/  .byte 0xd0
/*0x766e*/  .byte 0xba
/*0x766f*/  .byte 0x42
/*0x7670*/  .byte 0x39
/*0x7671*/  .byte 0xd1
/*0x7672*/  .byte 0x82
/*0x7673*/  .byte 0x88
/*0x7674*/  .byte 0x81
/*0x7675*/  .byte 0x78
/*0x7676*/  .byte 0xba
/*0x7677*/  .byte 0xb3
/*0x7678*/  .byte 0x49
/*0x7679*/  .byte 0xe0
/*0x767a*/  .byte 0xc5
/*0x767b*/  .byte 0x78
/*0x767c*/  .byte 0x82
/*0x767d*/  .byte 0x78
/*0x767e*/  .byte 0xc4
/*0x767f*/  .byte 0x88
/*0x7680*/  .byte 0x81
/*0x7681*/  .byte 0x88
/*0x7682*/  .byte 0x01
/*0x7683*/  .byte 0x2d
/*0x7684*/  .byte 0x2f
/*0x7685*/  .byte 0xd1
/*0x7686*/  .byte 0x61
/*0x7687*/  .byte 0xb1
/*0x7688*/  .byte 0x01
/*0x7689*/  .byte 0x29
/*0x768a*/  .byte 0x2c
/*0x768b*/  .byte 0xd0
/*0x768c*/  .byte 0x02
/*0x768d*/  .byte 0x29
/*0x768e*/  .byte 0x2a
/*0x768f*/  .byte 0xd1
/*0x7690*/  .byte 0x01
/*0x7691*/  .byte 0x2a
/*0x7692*/  .byte 0x09
/*0x7693*/  .byte 0xd0
/*0x7694*/  .byte 0x02
/*0x7695*/  .byte 0x2a
/*0x7696*/  .byte 0x0c
/*0x7697*/  .byte 0xd0
/*0x7698*/  .byte 0x04
/*0x7699*/  .byte 0x2a
/*0x769a*/  .byte 0x24
/*0x769b*/  .byte 0xd1
/*0x769c*/  .byte 0x1e
/*0x769d*/  .byte 0x49
/*0x769e*/  .byte 0x0c
/*0x769f*/  .byte 0x31
/*0x76a0*/  .byte 0x04
/*0x76a1*/  .byte 0xe0
/*0x76a2*/  .byte 0x1e
/*0x76a3*/  .byte 0x49
/*0x76a4*/  .byte 0x18
/*0x76a5*/  .byte 0x31
/*0x76a6*/  .byte 0x01
/*0x76a7*/  .byte 0xe0
/*0x76a8*/  .byte 0x1c
/*0x76a9*/  .byte 0x49
/*0x76aa*/  .byte 0x09
/*0x76ab*/  .byte 0x1d
/*0x76ac*/  .byte 0xc0
/*0x76ad*/  .byte 0xe9
/*0x76ae*/  .byte 0x07
/*0x76af*/  .byte 0x14
/*0x76b0*/  .byte 0x2e
/*0x76b1*/  .byte 0xe0
/*0x76b2*/  .byte 0x1a
/*0x76b3*/  .byte 0x49
/*0x76b4*/  .byte 0x10
/*0x76b5*/  .byte 0x31
/*0x76b6*/  .byte 0xf9
/*0x76b7*/  .byte 0xe7
/*0x76b8*/  .byte 0x81
/*0x76b9*/  .byte 0x88
/*0x76ba*/  .byte 0x00
/*0x76bb*/  .byte 0x29
/*0x76bc*/  .byte 0x13
/*0x76bd*/  .byte 0xd1
/*0x76be*/  .byte 0xc0
/*0x76bf*/  .byte 0xe9
/*0x76c0*/  .byte 0x07
/*0x76c1*/  .byte 0x43
/*0x76c2*/  .byte 0x25
/*0x76c3*/  .byte 0xe0
/*0x76c4*/  .byte 0xc3
/*0x76c5*/  .byte 0x78
/*0x76c6*/  .byte 0xc2
/*0x76c7*/  .byte 0x88
/*0x76c8*/  .byte 0x81
/*0x76c9*/  .byte 0x88
/*0x76ca*/  .byte 0x02
/*0x76cb*/  .byte 0x62
/*0x76cc*/  .byte 0x02
/*0x76cd*/  .byte 0x2b
/*0x76ce*/  .byte 0x0a
/*0x76cf*/  .byte 0xd1
/*0x76d0*/  .byte 0x00
/*0x76d1*/  .byte 0x29
/*0x76d2*/  .byte 0x08
/*0x76d3*/  .byte 0xd1
/*0x76d4*/  .byte 0x11
/*0x76d5*/  .byte 0x4a
/*0x76d6*/  .byte 0x0c
/*0x76d7*/  .byte 0x32
/*0x76d8*/  .byte 0xc2
/*0x76d9*/  .byte 0x61
/*0x76da*/  .byte 0x11
/*0x76db*/  .byte 0x4a
/*0x76dc*/  .byte 0xc0
/*0x76dd*/  .byte 0xe9
/*0x76de*/  .byte 0x0a
/*0x76df*/  .byte 0x21
/*0x76e0*/  .byte 0x02
/*0x76e1*/  .byte 0x21
/*0x76e2*/  .byte 0x80
/*0x76e3*/  .byte 0xf8
/*0x76e4*/  .byte 0x24
/*0x76e5*/  .byte 0x10
/*0x76e6*/  .byte 0xf0
/*0x76e7*/  .byte 0xbd
/*0x76e8*/  .byte 0x0e
/*0x76e9*/  .byte 0xe0
/*0x76ea*/  .byte 0x82
/*0x76eb*/  .byte 0x88
/*0x76ec*/  .byte 0xc1
/*0x76ed*/  .byte 0x78
/*0x76ee*/  .byte 0x00
/*0x76ef*/  .byte 0x2a
/*0x76f0*/  .byte 0xf9
/*0x76f1*/  .byte 0xd1
/*0x76f2*/  .byte 0x4f
/*0x76f3*/  .byte 0xf4
/*0x76f4*/  .byte 0x7a
/*0x76f5*/  .byte 0x62
/*0x76f6*/  .byte 0x21
/*0x76f7*/  .byte 0x60
/*0x76f8*/  .byte 0x51
/*0x76f9*/  .byte 0x43
/*0x76fa*/  .byte 0xd2
/*0x76fb*/  .byte 0x10
/*0x76fc*/  .byte 0xb1
/*0x76fd*/  .byte 0xfb
/*0x76fe*/  .byte 0xf2
/*0x76ff*/  .byte 0xf1
/*0x7700*/  .byte 0x05
/*0x7701*/  .byte 0x4a
/*0x7702*/  .byte 0x0c
/*0x7703*/  .byte 0x3a
/*0x7704*/  .byte 0x11
/*0x7705*/  .byte 0x60
/*0x7706*/  .byte 0x02
/*0x7707*/  .byte 0xe0
/*0x7708*/  .byte 0x04
/*0x7709*/  .byte 0x4a
/*0x770a*/  .byte 0x12
/*0x770b*/  .byte 0x1f
/*0x770c*/  .byte 0x11
/*0x770d*/  .byte 0x71
/*0x770e*/  .byte 0x05
/*0x770f*/  .byte 0x62
/*0x7710*/  .byte 0x80
/*0x7711*/  .byte 0xf8
/*0x7712*/  .byte 0x24
/*0x7713*/  .byte 0x30
/*0x7714*/  .byte 0xe7
/*0x7715*/  .byte 0xe7
/*0x7716*/  .byte 0x00
/*0x7717*/  .byte 0x00
/*0x7718*/  .byte 0xa0
/*0x7719*/  .byte 0x06
/*0x771a*/  .byte 0x00
/*0x771b*/  .byte 0x20
/*0x771c*/  .byte 0x44
/*0x771d*/  .byte 0x00
/*0x771e*/  .byte 0x00
/*0x771f*/  .byte 0x20
/*0x7720*/  .byte 0x25
/*0x7721*/  .byte 0x77
/*0x7722*/  .byte 0x00
/*0x7723*/  .byte 0x00
/*0x7724*/  .byte 0x01
/*0x7725*/  .byte 0x4a
/*0x7726*/  .byte 0x01
/*0x7727*/  .byte 0x21
/*0x7728*/  .byte 0x11
/*0x7729*/  .byte 0x54
/*0x772a*/  .byte 0x70
/*0x772b*/  .byte 0x47
/*0x772c*/  .byte 0x4a
/*0x772d*/  .byte 0x00
/*0x772e*/  .byte 0x00
/*0x772f*/  .byte 0x20
/*0x7730*/  .byte 0xc2
/*0x7731*/  .byte 0x78
/*0x7732*/  .byte 0x81
/*0x7733*/  .byte 0x88
/*0x7734*/  .byte 0x01
/*0x7735*/  .byte 0x23
/*0x7736*/  .byte 0x21
/*0x7737*/  .byte 0x2a
/*0x7738*/  .byte 0x07
/*0x7739*/  .byte 0xd0
/*0x773a*/  .byte 0x22
/*0x773b*/  .byte 0x2a
/*0x773c*/  .byte 0x21
/*0x773d*/  .byte 0xd1
/*0x773e*/  .byte 0xa9
/*0x773f*/  .byte 0xb1
/*0x7740*/  .byte 0x01
/*0x7741*/  .byte 0x29
/*0x7742*/  .byte 0x17
/*0x7743*/  .byte 0xd0
/*0x7744*/  .byte 0x02
/*0x7745*/  .byte 0x29
/*0x7746*/  .byte 0x1a
/*0x7747*/  .byte 0xd1
/*0x7748*/  .byte 0x1c
/*0x7749*/  .byte 0xe0
/*0x774a*/  .byte 0x21
/*0x774b*/  .byte 0xb1
/*0x774c*/  .byte 0x01
/*0x774d*/  .byte 0x29
/*0x774e*/  .byte 0x05
/*0x774f*/  .byte 0xd0
/*0x7750*/  .byte 0x02
/*0x7751*/  .byte 0x29
/*0x7752*/  .byte 0x06
/*0x7753*/  .byte 0xd1
/*0x7754*/  .byte 0x07
/*0x7755*/  .byte 0xe0
/*0x7756*/  .byte 0xc1
/*0x7757*/  .byte 0x68
/*0x7758*/  .byte 0x12
/*0x7759*/  .byte 0x31
/*0x775a*/  .byte 0x01
/*0x775b*/  .byte 0xe0
/*0x775c*/  .byte 0xc1
/*0x775d*/  .byte 0x68
/*0x775e*/  .byte 0x2b
/*0x775f*/  .byte 0x31
/*0x7760*/  .byte 0xc1
/*0x7761*/  .byte 0x61
/*0x7762*/  .byte 0x09
/*0x7763*/  .byte 0x21
/*0x7764*/  .byte 0x0a
/*0x7765*/  .byte 0xe0
/*0x7766*/  .byte 0xc1
/*0x7767*/  .byte 0x68
/*0x7768*/  .byte 0x4b
/*0x7769*/  .byte 0x31
/*0x776a*/  .byte 0xf9
/*0x776b*/  .byte 0xe7
/*0x776c*/  .byte 0x08
/*0x776d*/  .byte 0x49
/*0x776e*/  .byte 0xc1
/*0x776f*/  .byte 0x61
/*0x7770*/  .byte 0x40
/*0x7771*/  .byte 0x21
/*0x7772*/  .byte 0x03
/*0x7773*/  .byte 0xe0
/*0x7774*/  .byte 0x06
/*0x7775*/  .byte 0x49
/*0x7776*/  .byte 0xac
/*0x7777*/  .byte 0x39
/*0x7778*/  .byte 0xc1
/*0x7779*/  .byte 0x61
/*0x777a*/  .byte 0x22
/*0x777b*/  .byte 0x21
/*0x777c*/  .byte 0x01
/*0x777d*/  .byte 0x62
/*0x777e*/  .byte 0x80
/*0x777f*/  .byte 0xf8
/*0x7780*/  .byte 0x24
/*0x7781*/  .byte 0x30
/*0x7782*/  .byte 0x70
/*0x7783*/  .byte 0x47
/*0x7784*/  .byte 0x02
/*0x7785*/  .byte 0x49
/*0x7786*/  .byte 0x88
/*0x7787*/  .byte 0x39
/*0x7788*/  .byte 0xc1
/*0x7789*/  .byte 0x61
/*0x778a*/  .byte 0x86
/*0x778b*/  .byte 0x21
/*0x778c*/  .byte 0xf6
/*0x778d*/  .byte 0xe7
/*0x778e*/  .byte 0x00
/*0x778f*/  .byte 0x00
/*0x7790*/  .byte 0xdc
/*0x7791*/  .byte 0x82
/*0x7792*/  .byte 0x00
/*0x7793*/  .byte 0x00


            .thumb_func
            call_7794:
/*0x7794*/      push {r4, r5, r6, lr}
/*0x7796*/      mov r4, r0
/*0x7798*/      movs r0, #0
/*0x779a*/      bl call_6ba0
/*0x779e*/      mov r5, r0
/*0x77a0*/      ldr r0, [r4, #0x20]
/*0x77a2*/      adds r1, r0, #1
/*0x77a4*/      beq jump_77d4
/*0x77a6*/      ldrb.w r1, [r4, #0x24]
/*0x77aa*/      cmp r1, #1
/*0x77ac*/      bne jump_77d4
/*0x77ae*/      cmp r0, r5
/*0x77b0*/      blo jump_77b8
/*0x77b2*/      subs r0, r0, r5
/*0x77b4*/      str r0, [r4, #0x20]
/*0x77b6*/      b jump_77c4
            jump_77b8:
/*0x77b8*/      mov r5, r0
/*0x77ba*/      movs r0, #0
/*0x77bc*/      str r0, [r4, #0x20]
/*0x77be*/      movs r0, #2
/*0x77c0*/      strb.w r0, [r4, #0x24]
            jump_77c4:
/*0x77c4*/      mov r2, r5
/*0x77c6*/      movs r0, #0
/*0x77c8*/      ldr r1, [r4, #0x1c]
/*0x77ca*/      bl call_6ca8
/*0x77ce*/      ldr r0, [r4, #0x1c]
/*0x77d0*/      add r0, r5
/*0x77d2*/      str r0, [r4, #0x1c]
            jump_77d4:
/*0x77d4*/      pop {r4, r5, r6, pc}

/*0x77d6*/  .byte 0x00
/*0x77d7*/  .byte 0x00


            .thumb_func
            call_77d8:
/*0x77d8*/      push {r4, lr}
/*0x77da*/      mov r4, r0
/*0x77dc*/      movs r0, #0
/*0x77de*/      strb.w r0, [r4, #0x24]
/*0x77e2*/      str r0, [r4, #0x20]
/*0x77e4*/      ldrb r0, [r4]
/*0x77e6*/      ands r0, r0, #0x60
/*0x77ea*/      beq jump_77f2
/*0x77ec*/      cmp r0, #0x20
/*0x77ee*/      bne jump_7804
/*0x77f0*/      b jump_77fa
            jump_77f2:
/*0x77f2*/      mov r0, r4
/*0x77f4*/      bl call_7878
/*0x77f8*/      b jump_7804
            jump_77fa:
/*0x77fa*/      ldr r0, [pc, #0x40] /* data_783c */
/*0x77fc*/      ldr r1, [r0, #0x14]
/*0x77fe*/      cbz r1, jump_7804
/*0x7800*/      mov r0, r4
/*0x7802*/      blx r1
            jump_7804:
/*0x7804*/      ldrb.w r0, [r4, #0x24]
/*0x7808*/      cmp r0, #1
/*0x780a*/      beq jump_781a
/*0x780c*/      cmp r0, #2
/*0x780e*/      beq jump_782e
/*0x7810*/      pop.w {r4, lr}
/*0x7814*/      movs r0, #0
/*0x7816*/      b.w jump_6c88
            jump_781a:
/*0x781a*/      ldrh r0, [r4, #6]
/*0x781c*/      ldr r1, [r4, #0x20]
/*0x781e*/      cmp r1, r0
/*0x7820*/      ble jump_7824
/*0x7822*/      str r0, [r4, #0x20]
            jump_7824:
/*0x7824*/      mov r0, r4
/*0x7826*/      pop.w {r4, lr}
/*0x782a*/      b.w call_7794
            jump_782e:
/*0x782e*/      movs r2, #0
/*0x7830*/      pop.w {r4, lr}
/*0x7834*/      mov r1, r2
/*0x7836*/      mov r0, r2
/*0x7838*/      b.w call_6ca8

            data_783c:
/*0x783c*/  .word 0x000083b4

            jump_7840:
/*0x7840*/      push {r4, lr}
/*0x7842*/      mov r4, r0
/*0x7844*/      movs r0, #0
/*0x7846*/      strb r0, [r4, #0x19]
/*0x7848*/      cbz r1, jump_785e
/*0x784a*/      cmp r1, #1
/*0x784c*/      beq jump_7862
/*0x784e*/      cmp r1, #2
/*0x7850*/      bne jump_7874
/*0x7852*/      ldrb r0, [r4, #4]
/*0x7854*/      and r0, r0, #0xf
/*0x7858*/      bl call_6bae
/*0x785c*/      b jump_7862
            jump_785e:
/*0x785e*/      ldrb.w r0, [r4, #0x34]
            jump_7862:
/*0x7862*/      strb r0, [r4, #0x18]
/*0x7864*/      add.w r0, r4, #0x18
/*0x7868*/      str r0, [r4, #0x1c]
/*0x786a*/      movs r0, #2
/*0x786c*/      str r0, [r4, #0x20]
/*0x786e*/      movs r0, #1
/*0x7870*/      strb.w r0, [r4, #0x24]
            jump_7874:
/*0x7874*/      pop {r4, pc}

/*0x7876*/  .byte 0x00
/*0x7877*/  .byte 0x00


            .thumb_func
            call_7878:
/*0x7878*/      push {r4, r5, r6, lr}
/*0x787a*/      mov r4, r0
/*0x787c*/      ldrh r0, [r0]
/*0x787e*/      movs r5, #1
/*0x7880*/      cmp.w r0, #0x500
/*0x7884*/      beq jump_7926
/*0x7886*/      bgt jump_78ca
/*0x7888*/      cmp.w r0, #0x100
/*0x788c*/      beq jump_7918
/*0x788e*/      bgt jump_78a8
/*0x7890*/      cmp r0, #0x80
/*0x7892*/      beq jump_7910
/*0x7894*/      cmp r0, #0x81
/*0x7896*/      beq jump_7914
/*0x7898*/      cmp r0, #0x82
/*0x789a*/      bne jump_796a
/*0x789c*/      movs r1, #2
            jump_789e:
/*0x789e*/      mov r0, r4
/*0x78a0*/      pop.w {r4, r5, r6, lr}
/*0x78a4*/      b.w jump_7840
            jump_78a8:
/*0x78a8*/      cmp.w r0, #0x102
/*0x78ac*/      beq jump_791c
/*0x78ae*/      cmp.w r0, #0x300
/*0x78b2*/      beq jump_7920
/*0x78b4*/      sub.w r0, r0, #0x300
/*0x78b8*/      subs r0, #2
/*0x78ba*/      bne jump_796a
/*0x78bc*/      movs r2, #1
            jump_78be:
/*0x78be*/      movs r1, #2
            jump_78c0:
/*0x78c0*/      mov r0, r4
/*0x78c2*/      pop.w {r4, r5, r6, lr}
/*0x78c6*/      b.w jump_79a0
            jump_78ca:
/*0x78ca*/      ldr r1, [pc, #0xcc] /* data_7998 */
/*0x78cc*/      cmp.w r0, #0x900
/*0x78d0*/      beq jump_7970
/*0x78d2*/      bgt jump_78f4
/*0x78d4*/      cmp.w r0, #0x680
/*0x78d8*/      beq jump_7934
/*0x78da*/      sub.w r0, r0, #0x600
/*0x78de*/      subs r0, #0x81
/*0x78e0*/      beq jump_796c
/*0x78e2*/      sub.w r0, r0, #0x100
/*0x78e6*/      subs r0, #0xff
/*0x78e8*/      bne jump_796a
/*0x78ea*/      add.w r0, r4, #0x30
/*0x78ee*/      strd r0, r5, [r4, #0x1c]
/*0x78f2*/      b jump_7966
            jump_78f4:
/*0x78f4*/      sub.w r0, r0, #0xa00
/*0x78f8*/      subs r0, #0x81
/*0x78fa*/      beq jump_7992
/*0x78fc*/      cmp r0, #0x80
/*0x78fe*/      bne jump_796a
/*0x7900*/      ldr r0, [r1, #0xc]
            jump_7902:
/*0x7902*/      cmp r0, #0
/*0x7904*/      beq jump_796a
/*0x7906*/      mov r1, r0
/*0x7908*/      mov r0, r4
/*0x790a*/      pop.w {r4, r5, r6, lr}
/*0x790e*/      bx r1
            jump_7910:
/*0x7910*/      movs r1, #0
/*0x7912*/      b jump_789e
            jump_7914:
/*0x7914*/      movs r1, #1
/*0x7916*/      b jump_789e
            jump_7918:
/*0x7918*/      movs r2, #0
/*0x791a*/      b jump_7922
            jump_791c:
/*0x791c*/      movs r2, #0
/*0x791e*/      b jump_78be
            jump_7920:
/*0x7920*/      movs r2, #1
            jump_7922:
/*0x7922*/      movs r1, #0
/*0x7924*/      b jump_78c0
            jump_7926:
/*0x7926*/      ldrb r0, [r4, #2]
/*0x7928*/      bl call_6e84
/*0x792c*/      strb.w r5, [r4, #0x24]
/*0x7930*/      movs r0, #5
/*0x7932*/      b jump_798c
            jump_7934:
/*0x7934*/      ldrb r0, [r4, #3]
/*0x7936*/      cmp r0, #1
/*0x7938*/      beq jump_795a
/*0x793a*/      cmp r0, #2
/*0x793c*/      beq jump_795e
/*0x793e*/      cmp r0, #3
/*0x7940*/      bne jump_796a
/*0x7942*/      ldrb r0, [r4, #2]
/*0x7944*/      ldr r1, [r4, #0x14]
/*0x7946*/      cmp r1, r0
/*0x7948*/      bls jump_796a
/*0x794a*/      ldr r1, [r4, #0x10]
/*0x794c*/      ldr.w r0, [r1, r0, lsl #2]
/*0x7950*/      cmp r0, #0
/*0x7952*/      beq jump_796a
            jump_7954:
/*0x7954*/      str r0, [r4, #0x1c]
/*0x7956*/      ldrb r0, [r0]
/*0x7958*/      b jump_7964
            jump_795a:
/*0x795a*/      ldr r0, [r4, #8]
/*0x795c*/      b jump_7954
            jump_795e:
/*0x795e*/      ldr r0, [r4, #0xc]
/*0x7960*/      str r0, [r4, #0x1c]
/*0x7962*/      ldrh r0, [r0, #2]
            jump_7964:
/*0x7964*/      str r0, [r4, #0x20]
            jump_7966:
/*0x7966*/      strb.w r5, [r4, #0x24]
            jump_796a:
/*0x796a*/      pop {r4, r5, r6, pc}
            jump_796c:
/*0x796c*/      ldr r0, [r1, #8]
/*0x796e*/      b jump_7902
            jump_7970:
/*0x7970*/      ldrb r0, [r4, #2]
/*0x7972*/      strb.w r0, [r4, #0x30]
/*0x7976*/      strb.w r5, [r4, #0x24]
/*0x797a*/      movs r5, #1
            jump_797c:
/*0x797c*/      ldr r1, [pc, #0x1c] /* data_799c */
/*0x797e*/      sxtb r0, r5
/*0x7980*/      bl call_6be8
/*0x7984*/      adds r5, r5, #1
/*0x7986*/      cmp r5, #8
/*0x7988*/      blo jump_797c
/*0x798a*/      movs r0, #6
            jump_798c:
/*0x798c*/      strb.w r0, [r4, #0x32]
/*0x7990*/      pop {r4, r5, r6, pc}
            jump_7992:
/*0x7992*/      ldr r0, [r1, #0x10]
/*0x7994*/      b jump_7902

/*0x7996*/  .byte 0x00
/*0x7997*/  .byte 0x00

            data_7998:
/*0x7998*/  .word 0x000083b4
            data_799c:
/*0x799c*/  .word 0x2000018c

            jump_79a0:
/*0x79a0*/      push {r4, r5, r6, lr}
/*0x79a2*/      mov r4, r0
/*0x79a4*/      movs r6, #1
/*0x79a6*/      cbz r1, jump_79c2
/*0x79a8*/      cmp r1, #2
/*0x79aa*/      bne jump_79c0
/*0x79ac*/      ldrb r0, [r4, #4]
/*0x79ae*/      ands r5, r0, #0xf
/*0x79b2*/      beq jump_79bc
/*0x79b4*/      cbz r2, jump_79d8
/*0x79b6*/      mov r0, r5
/*0x79b8*/      bl call_6c94
            jump_79bc:
/*0x79bc*/      strb.w r6, [r4, #0x24]
            jump_79c0:
/*0x79c0*/      pop {r4, r5, r6, pc}
            jump_79c2:
/*0x79c2*/      ldrb r0, [r4, #2]
/*0x79c4*/      cmp r0, #1
/*0x79c6*/      bne jump_79c0
/*0x79c8*/      ldrb r0, [r4, #0x34]!
/*0x79cc*/      bfi r0, r2, #1, #1
/*0x79d0*/      strb r0, [r4], #-0x10
/*0x79d4*/      strb r6, [r4]
/*0x79d6*/      pop {r4, r5, r6, pc}
            jump_79d8:
/*0x79d8*/      ldr r0, [r4, #0x38]
/*0x79da*/      cmp r0, #0
/*0x79dc*/      bne jump_79bc
/*0x79de*/      mov r0, r5
/*0x79e0*/      bl call_6b48
/*0x79e4*/      mov r0, r5
/*0x79e6*/      bl call_6b38
/*0x79ea*/      b jump_79bc

            .thumb_func
            call_79ec:
/*0x79ec*/      subs r2, r2, #1
/*0x79ee*/      bmi jump_79fa
/*0x79f0*/      ldr.w r3, [r0, r2, lsl #2]
/*0x79f4*/      str.w r3, [r1, r2, lsl #2]
/*0x79f8*/      b call_79ec
            jump_79fa:
/*0x79fa*/      bx lr

            .thumb_func
            call_79fc:
/*0x79fc*/      ldr r1, [pc, #8] /* data_7a08 */
/*0x79fe*/      add.w r0, r0, r0, lsl #2
/*0x7a02*/      add.w r0, r1, r0, lsl #2
/*0x7a06*/      bx lr

            data_7a08:
/*0x7a08*/  .word 0x400a8014


            .thumb_func
            call_7a0c:
/*0x7a0c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7a10*/      movs r7, #0
/*0x7a12*/      mov.w r1, #0x8000
/*0x7a16*/      mov r2, r7
/*0x7a18*/      mov sl, r1
/*0x7a1a*/      movs r3, #1
/*0x7a1c*/      mov r0, r2
/*0x7a1e*/      bl ckcu_clocks_enable
/*0x7a22*/      ldr r0, [pc, #0x90] /* data_7ab4 */
/*0x7a24*/      bl call_68d0
/*0x7a28*/      ldr r5, [pc, #0x8c] /* data_7ab8 */
/*0x7a2a*/      mov r4, r0
/*0x7a2c*/      movw r6, #0xeae0
/*0x7a30*/      cmp r0, #1
/*0x7a32*/      bne jump_7a42
/*0x7a34*/      ldr r0, [r5, #0x54]
/*0x7a36*/      orrs r0, r6
/*0x7a38*/      str r0, [r5, #0x54]
/*0x7a3a*/      str r6, [r5, #0x58]
/*0x7a3c*/      ldr r0, [r5, #0x50]
/*0x7a3e*/      orrs r0, r6
/*0x7a40*/      str r0, [r5, #0x50]
            jump_7a42:
/*0x7a42*/      ldr.w r8, [pc, #0x70] /* data_7ab4 */
/*0x7a46*/      ldrb.w r0, [r8, #0x32]
/*0x7a4a*/      cmp r0, #3
/*0x7a4c*/      bne jump_7a8c
/*0x7a4e*/      ldr.w sb, [pc, #0x6c] /* data_7abc */
/*0x7a52*/      ldr.w r0, [sb]
/*0x7a56*/      tst.w r0, #0xc0
/*0x7a5a*/      beq jump_7a8c
/*0x7a5c*/      movs r0, #1
/*0x7a5e*/      bl call_5850
/*0x7a62*/      ldr r1, [pc, #0x5c] /* data_7ac0 */
/*0x7a64*/      strb r7, [r1, #5]
/*0x7a66*/      ldrb.w r0, [r8, #0x32]
/*0x7a6a*/      cmp r0, #3
/*0x7a6c*/      bne jump_7a8c
/*0x7a6e*/      ldr.w r0, [sb]
/*0x7a72*/      tst.w r0, #0xc0
/*0x7a76*/      beq jump_7a8c
/*0x7a78*/      bl call_6ed4
/*0x7a7c*/      mov.w r0, #0x3e8
/*0x7a80*/      bl spin_wait
/*0x7a84*/      str r6, [r5, #0x58]
/*0x7a86*/      movs r0, #0
/*0x7a88*/      bl call_5ea4
            jump_7a8c:
/*0x7a8c*/      ldr r0, [r5, #0x58]
/*0x7a8e*/      tst r0, r6
/*0x7a90*/      beq jump_7aa4
/*0x7a92*/      cmp r4, #1
/*0x7a94*/      bne jump_7aa4
/*0x7a96*/      ldr r0, [pc, #0x1c] /* data_7ab4 */
/*0x7a98*/      bl call_6a5c
/*0x7a9c*/      cmp r0, #1
/*0x7a9e*/      bne jump_7aa4
/*0x7aa0*/      bl call_6a6c
            jump_7aa4:
/*0x7aa4*/      mov r2, r7
/*0x7aa6*/      mov r1, sl
/*0x7aa8*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7aac*/      movs r3, #0
/*0x7aae*/      mov r0, r2
/*0x7ab0*/      b.w ckcu_clocks_enable

            data_7ab4:
/*0x7ab4*/  .word 0x200006cc
            data_7ab8:
/*0x7ab8*/  .word 0x40024000
            data_7abc:
/*0x7abc*/  .word 0x400a8000
            data_7ac0:
/*0x7ac0*/  .word 0x20000040

/*0x7ac4*/  .byte 0x02
/*0x7ac5*/  .byte 0xe0
/*0x7ac6*/  .byte 0x08
/*0x7ac7*/  .byte 0xc8
/*0x7ac8*/  .byte 0x12
/*0x7ac9*/  .byte 0x1f
/*0x7aca*/  .byte 0x08
/*0x7acb*/  .byte 0xc1
/*0x7acc*/  .byte 0x00
/*0x7acd*/  .byte 0x2a
/*0x7ace*/  .byte 0xfa
/*0x7acf*/  .byte 0xd1
/*0x7ad0*/  .byte 0x70
/*0x7ad1*/  .byte 0x47
/*0x7ad2*/  .byte 0x70
/*0x7ad3*/  .byte 0x47
/*0x7ad4*/  .byte 0x00
/*0x7ad5*/  .byte 0x20
/*0x7ad6*/  .byte 0x01
/*0x7ad7*/  .byte 0xe0
/*0x7ad8*/  .byte 0x01
/*0x7ad9*/  .byte 0xc1
/*0x7ada*/  .byte 0x12
/*0x7adb*/  .byte 0x1f
/*0x7adc*/  .byte 0x00
/*0x7add*/  .byte 0x2a
/*0x7ade*/  .byte 0xfb
/*0x7adf*/  .byte 0xd1
/*0x7ae0*/  .byte 0x70
/*0x7ae1*/  .byte 0x47
/*0x7ae2*/  .byte 0x00
/*0x7ae3*/  .byte 0x00


            .thumb_func
            call_7ae4:
/*0x7ae4*/      mov r1, r0
/*0x7ae6*/      ldr r2, [pc, #0x14] /* data_7afc */
/*0x7ae8*/      movs r0, #0
            jump_7aea:
/*0x7aea*/      ldrb r3, [r2, r0]
/*0x7aec*/      cmp r3, r1
/*0x7aee*/      beq jump_7afa
/*0x7af0*/      adds r0, r0, #1
/*0x7af2*/      uxtb r0, r0
/*0x7af4*/      cmp r0, #0xa
/*0x7af6*/      blo jump_7aea
/*0x7af8*/      movs r0, #0xff
            jump_7afa:
/*0x7afa*/      bx lr

            data_7afc:
/*0x7afc*/  .word 0x00007d34


            .thumb_func
            call_7b00:
/*0x7b00*/      push {r3, r4, r5, lr}
/*0x7b02*/      movs r4, #0
/*0x7b04*/      str r4, [sp]
/*0x7b06*/      ldr r4, [pc, #0x20] /* data_7b28 */
/*0x7b08*/      ldr r5, [sp, #0x10]
/*0x7b0a*/      ldrb r2, [r4, r2]
/*0x7b0c*/      strb.w r2, [sp]
/*0x7b10*/      ldrb r2, [r4, r3]
/*0x7b12*/      strb.w r2, [sp, #1]
/*0x7b16*/      ldrb r2, [r4, r5]
/*0x7b18*/      mov r3, r1
/*0x7b1a*/      strb.w r2, [sp, #2]
/*0x7b1e*/      mov r2, r3
/*0x7b20*/      mov r1, sp
/*0x7b22*/      bl call_4a50
/*0x7b26*/      pop {r3, r4, r5, pc}

            data_7b28:
/*0x7b28*/  .word 0x200002de


            .thumb_func
            main:
/*0x7b2c*/      bl setup_intr_priority
/*0x7b30*/      bl setup_afio_gpio
/*0x7b34*/      bl call_5a20
/*0x7b38*/      movs r0, #0xff
/*0x7b3a*/      bl call_3e2c
/*0x7b3e*/      bl call_6238
/*0x7b42*/      bl call_5e54
/*0x7b46*/      bl call_647c
/*0x7b4a*/      bl call_4f20
/*0x7b4e*/      movs r0, #0
/*0x7b50*/      bl call_46cc
/*0x7b54*/      ldr r1, [pc, #0xbc] /* data_7c14 */
/*0x7b56*/      movs r0, #0
/*0x7b58*/      str r0, [r1]
/*0x7b5a*/      bl call_58c4
/*0x7b5e*/      bl call_58f8
/*0x7b62*/      movs r0, #0
/*0x7b64*/      bl call_5850
/*0x7b68*/      movs r0, #0xa
/*0x7b6a*/      bl spin_wait
/*0x7b6e*/      movs r0, #1
/*0x7b70*/      bl call_61bc
/*0x7b74*/      bl call_4f2c
/*0x7b78*/      ldr r4, [pc, #0x9c] /* data_7c18 */
/*0x7b7a*/      cbz r0, jump_7b80
/*0x7b7c*/      movs r0, #1
/*0x7b7e*/      strh r0, [r4, #4]
            jump_7b80:
/*0x7b80*/      ldrh r0, [r4, #4]
/*0x7b82*/      cbz r0, jump_7ba8
/*0x7b84*/      bl call_65dc
/*0x7b88*/      bl call_5e84
/*0x7b8c*/      movs r0, #0
/*0x7b8e*/      bl call_61bc
            jump_7b92:
/*0x7b92*/      ldrh r0, [r4, #4]
/*0x7b94*/      adds r0, r0, #1
/*0x7b96*/      strh r0, [r4, #4]
/*0x7b98*/      bl call_7c24
/*0x7b9c*/      movs r0, #1
/*0x7b9e*/      bl call_5f34
/*0x7ba2*/      bl call_6ed4
/*0x7ba6*/      b jump_7b92
            jump_7ba8:
/*0x7ba8*/      movs r0, #1
/*0x7baa*/      bl call_5850
/*0x7bae*/      bl call_6a88
/*0x7bb2*/      ldr r6, [pc, #0x68] /* data_7c1c */
/*0x7bb4*/      ldr r5, [pc, #0x68] /* data_7c20 */
            jump_7bb6:
/*0x7bb6*/      bl call_6e10
/*0x7bba*/      cmp r0, #1
/*0x7bbc*/      beq jump_7bce
/*0x7bbe*/      cmp r0, #2
/*0x7bc0*/      beq jump_7be2
/*0x7bc2*/      cmp r0, #3
/*0x7bc4*/      bne jump_7c0c
/*0x7bc6*/      movs r0, #1
/*0x7bc8*/      bl call_5850
/*0x7bcc*/      b jump_7c0c
            jump_7bce:
/*0x7bce*/      movs r0, #0
/*0x7bd0*/      bl call_5850
/*0x7bd4*/      bl call_65dc
/*0x7bd8*/      bl call_5e84
/*0x7bdc*/      movs r0, #0
/*0x7bde*/      bl call_61bc
            jump_7be2:
/*0x7be2*/      ldrh r0, [r4, #4]
/*0x7be4*/      adds r0, r0, #1
/*0x7be6*/      lsls r0, r0, #0x10
/*0x7be8*/      lsrs r0, r0, #0x10
/*0x7bea*/      strh r0, [r4, #4]
/*0x7bec*/      bne jump_7bfa
/*0x7bee*/      ldr r0, [r5]
/*0x7bf0*/      cmp r0, r6
/*0x7bf2*/      bls jump_7bfa
/*0x7bf4*/      ldr r0, [r5]
/*0x7bf6*/      subs r0, r0, #1
/*0x7bf8*/      str r0, [r5]
            jump_7bfa:
/*0x7bfa*/      bl handle_frame
/*0x7bfe*/      bl call_7c24
/*0x7c02*/      ldrb r0, [r4]
/*0x7c04*/      cbnz r0, jump_7c0c
/*0x7c06*/      movs r0, #1
/*0x7c08*/      bl call_5f34
            jump_7c0c:
/*0x7c0c*/      bl call_6ed4
/*0x7c10*/      b jump_7bb6

/*0x7c12*/  .byte 0x00
/*0x7c13*/  .byte 0x00

            data_7c14:
/*0x7c14*/  .word 0x20000034
            data_7c18:
/*0x7c18*/  .word 0x2000002a
            data_7c1c:
/*0x7c1c*/  .word 0x55aafaf0
            data_7c20:
/*0x7c20*/  .word 0x20003ffc


            .thumb_func
            call_7c24:
/*0x7c24*/      push {r4, r5, r6, lr}
/*0x7c26*/      ldr r6, [pc, #0xcc] /* data_7cf4 */
/*0x7c28*/      movs r4, #0
/*0x7c2a*/      ldrb r0, [r6, #3]
/*0x7c2c*/      cbz r0, jump_7c48
/*0x7c2e*/      movs r0, #1
/*0x7c30*/      bl call_46cc
/*0x7c34*/      cbz r0, jump_7c48
/*0x7c36*/      ldrb r0, [r6, #3]
/*0x7c38*/      cmp r0, #2
/*0x7c3a*/      beq jump_7c70
/*0x7c3c*/      bl call_3eac
            jump_7c40:
/*0x7c40*/      strb r4, [r6, #3]
/*0x7c42*/      movs r0, #1
/*0x7c44*/      bl call_58c4
            jump_7c48:
/*0x7c48*/      bl call_5334
/*0x7c4c*/      cmp r0, #0
/*0x7c4e*/      beq jump_7cf0
/*0x7c50*/      ldr r5, [pc, #0xa4] /* data_7cf8 */
/*0x7c52*/      ldrb r0, [r5, #2]
/*0x7c54*/      cmp r0, #0x20
/*0x7c56*/      blo jump_7c60
/*0x7c58*/      subs r0, #0x20
/*0x7c5a*/      strb r0, [r5, #2]
/*0x7c5c*/      movs r0, #1
/*0x7c5e*/      strb r0, [r5, #3]
            jump_7c60:
/*0x7c60*/      ldrb r0, [r5, #1]
/*0x7c62*/      cmp r0, #0xff
/*0x7c64*/      beq jump_7c8a
/*0x7c66*/      bl call_4ae0
/*0x7c6a*/      cmp r0, #1
/*0x7c6c*/      beq jump_7c76
/*0x7c6e*/      b jump_7c8a
            jump_7c70:
/*0x7c70*/      bl call_3edc
/*0x7c74*/      b jump_7c40
            jump_7c76:
/*0x7c76*/      ldrb r0, [r5, #1]
/*0x7c78*/      bl call_3e2c
/*0x7c7c*/      movs r0, #0xff
/*0x7c7e*/      strb r0, [r5, #1]
/*0x7c80*/      movs r0, #2
/*0x7c82*/      bl call_58c4
/*0x7c86*/      bl call_4b0c
            jump_7c8a:
/*0x7c8a*/      ldrb r0, [r6, #4]
/*0x7c8c*/      cbz r0, jump_7c9e
/*0x7c8e*/      bl call_4ae0
/*0x7c92*/      cmp r0, #1
/*0x7c94*/      bne jump_7c9e
/*0x7c96*/      ldrb r0, [r6, #4]
/*0x7c98*/      bl call_3bf6
/*0x7c9c*/      strb r4, [r6, #4]
            jump_7c9e:
/*0x7c9e*/      bl call_6140
/*0x7ca2*/      bl call_5a44
/*0x7ca6*/      ldr r0, [pc, #0x54] /* data_7cfc */
/*0x7ca8*/      ldrb r0, [r0, #6]
/*0x7caa*/      cmp r0, #1
/*0x7cac*/      beq jump_7cb6
/*0x7cae*/      bl call_4b18
/*0x7cb2*/      bl call_39d4
            jump_7cb6:
/*0x7cb6*/      ldrb r0, [r5, #3]
/*0x7cb8*/      cbz r0, jump_7cbe
/*0x7cba*/      bl call_4c8c
            jump_7cbe:
/*0x7cbe*/      ldrb r0, [r6]
/*0x7cc0*/      cbz r0, jump_7ccc
/*0x7cc2*/      strb r4, [r6]
/*0x7cc4*/      bl call_57a8
/*0x7cc8*/      bl call_57b4
            jump_7ccc:
/*0x7ccc*/      ldrb r0, [r6, #1]
/*0x7cce*/      cbz r0, jump_7cd6
/*0x7cd0*/      strb r4, [r6, #1]
/*0x7cd2*/      bl call_63fc
            jump_7cd6:
/*0x7cd6*/      ldrb r0, [r5, #3]
/*0x7cd8*/      cmp r0, #0
/*0x7cda*/      beq jump_7cf0
/*0x7cdc*/      ldr r0, [pc, #0x18] /* data_7cf8 */
/*0x7cde*/      ldrb r2, [r5, #2]
/*0x7ce0*/      adds r0, r0, #6
/*0x7ce2*/      ldrb r1, [r0, #1]
/*0x7ce4*/      add r1, r2
/*0x7ce6*/      strb r1, [r0, #1]
/*0x7ce8*/      ldrh r0, [r5, #6]
/*0x7cea*/      lsrs r0, r0, #1
/*0x7cec*/      strh r0, [r5, #6]
/*0x7cee*/      strb r4, [r5, #3]
            jump_7cf0:
/*0x7cf0*/      pop {r4, r5, r6, pc}

/*0x7cf2*/  .byte 0x00
/*0x7cf3*/  .byte 0x00

            data_7cf4:
/*0x7cf4*/  .word 0x20000644
            data_7cf8:
/*0x7cf8*/  .word 0x2000002a
            data_7cfc:
/*0x7cfc*/  .word 0x20001970

/*0x7d00*/  .byte 0xe6
/*0x7d01*/  .byte 0x29
/*0x7d02*/  .byte 0x14
/*0x7d03*/  .byte 0x2b
/*0x7d04*/  .byte 0x04
/*0x7d05*/  .byte 0xe1
/*0x7d06*/  .byte 0x1d
/*0x7d07*/  .byte 0xce
/*0x7d08*/  .byte 0x65
/*0x7d09*/  .byte 0x1a
/*0x7d0a*/  .byte 0x08
/*0x7d0b*/  .byte 0x16
/*0x7d0c*/  .byte 0x07
/*0x7d0d*/  .byte 0x1b
/*0x7d0e*/  .byte 0x06
/*0x7d0f*/  .byte 0xcc
/*0x7d10*/  .byte 0x15
/*0x7d11*/  .byte 0x17
/*0x7d12*/  .byte 0x09
/*0x7d13*/  .byte 0x0a
/*0x7d14*/  .byte 0x19
/*0x7d15*/  .byte 0x05
/*0x7d16*/  .byte 0xc9
/*0x7d17*/  .byte 0x1c
/*0x7d18*/  .byte 0x18
/*0x7d19*/  .byte 0x0b
/*0x7d1a*/  .byte 0x0d
/*0x7d1b*/  .byte 0x11
/*0x7d1c*/  .byte 0x10
/*0x7d1d*/  .byte 0x28
/*0x7d1e*/  .byte 0x0c
/*0x7d1f*/  .byte 0x12
/*0x7d20*/  .byte 0x0e
/*0x7d21*/  .byte 0x0f
/*0x7d22*/  .byte 0x36
/*0x7d23*/  .byte 0x37
/*0x7d24*/  .byte 0x2a
/*0x7d25*/  .byte 0x13
/*0x7d26*/  .byte 0xe4
/*0x7d27*/  .byte 0x33
/*0x7d28*/  .byte 0x4c
/*0x7d29*/  .byte 0xe5
/*0x7d2a*/  .byte 0xca
/*0x7d2b*/  .byte 0xcb
/*0x7d2c*/  .byte 0x00
/*0x7d2d*/  .byte 0x00
/*0x7d2e*/  .byte 0xe2
/*0x7d2f*/  .byte 0xe3
/*0x7d30*/  .byte 0x2c
/*0x7d31*/  .byte 0x08
/*0x7d32*/  .byte 0x14
/*0x7d33*/  .byte 0x1a
/*0x7d34*/  .byte 0x19
/*0x7d35*/  .byte 0x09
/*0x7d36*/  .byte 0x18
/*0x7d37*/  .byte 0x21
/*0x7d38*/  .byte 0x29
/*0x7d39*/  .byte 0x10
/*0x7d3a*/  .byte 0x00
/*0x7d3b*/  .byte 0x30
/*0x7d3c*/  .byte 0x2e
/*0x7d3d*/  .byte 0x01
/*0x7d3e*/  .byte 0x1f
/*0x7d3f*/  .byte 0x10
/*0x7d40*/  .byte 0x01
/*0x7d41*/  .byte 0x26
/*0x7d42*/  .byte 0x11
/*0x7d43*/  .byte 0x01
/*0x7d44*/  .byte 0x27
/*0x7d45*/  .byte 0x12
/*0x7d46*/  .byte 0x01
/*0x7d47*/  .byte 0x2f
/*0x7d48*/  .byte 0x13
/*0x7d49*/  .byte 0x01
/*0x7d4a*/  .byte 0x2b
/*0x7d4b*/  .byte 0x5f
/*0x7d4c*/  .byte 0x01
/*0x7d4d*/  .byte 0x03
/*0x7d4e*/  .byte 0xf5
/*0x7d4f*/  .byte 0x0a
/*0x7d50*/  .byte 0xf6
/*0x7d51*/  .byte 0x0b
/*0x7d52*/  .byte 0xf4
/*0x7d53*/  .byte 0x1a
/*0x7d54*/  .byte 0xee
/*0x7d55*/  .byte 0x1b
/*0x7d56*/  .byte 0x4b
/*0x7d57*/  .byte 0x22
/*0x7d58*/  .byte 0x52
/*0x7d59*/  .byte 0x23
/*0x7d5a*/  .byte 0x4e
/*0x7d5b*/  .byte 0x2a
/*0x7d5c*/  .byte 0x46
/*0x7d5d*/  .byte 0x2d
/*0x7d5e*/  .byte 0x47
/*0x7d5f*/  .byte 0x28
/*0x7d60*/  .byte 0x48
/*0x7d61*/  .byte 0x04
/*0x7d62*/  .byte 0x39
/*0x7d63*/  .byte 0x05
/*0x7d64*/  .byte 0xf2
/*0x7d65*/  .byte 0x0c
/*0x7d66*/  .byte 0xf0
/*0x7d67*/  .byte 0x0d
/*0x7d68*/  .byte 0xf3
/*0x7d69*/  .byte 0x1c
/*0x7d6a*/  .byte 0x4a
/*0x7d6b*/  .byte 0x1d
/*0x7d6c*/  .byte 0x50
/*0x7d6d*/  .byte 0x24
/*0x7d6e*/  .byte 0x51
/*0x7d6f*/  .byte 0x25
/*0x7d70*/  .byte 0x4f
/*0x7d71*/  .byte 0x2c
/*0x7d72*/  .byte 0x49
/*0x7d73*/  .byte 0x07
/*0x7d74*/  .byte 0x65
/*0x7d75*/  .byte 0x1e
/*0x7d76*/  .byte 0x4d
/*0x7d77*/  .byte 0x00
/*0x7d78*/  .byte 0x00
/*0x7d79*/  .byte 0x29
/*0x7d7a*/  .byte 0x35
/*0x7d7b*/  .byte 0x14
/*0x7d7c*/  .byte 0x3a
/*0x7d7d*/  .byte 0x1a
/*0x7d7e*/  .byte 0x3b
/*0x7d7f*/  .byte 0x08
/*0x7d80*/  .byte 0x3c
/*0x7d81*/  .byte 0x15
/*0x7d82*/  .byte 0x3d
/*0x7d83*/  .byte 0x17
/*0x7d84*/  .byte 0x3e
/*0x7d85*/  .byte 0x1c
/*0x7d86*/  .byte 0x3f
/*0x7d87*/  .byte 0x18
/*0x7d88*/  .byte 0x40
/*0x7d89*/  .byte 0x0c
/*0x7d8a*/  .byte 0x41
/*0x7d8b*/  .byte 0x12
/*0x7d8c*/  .byte 0x42
/*0x7d8d*/  .byte 0x13
/*0x7d8e*/  .byte 0x43
/*0x7d8f*/  .byte 0x4c
/*0x7d90*/  .byte 0x44
/*0x7d91*/  .byte 0x2a
/*0x7d92*/  .byte 0x45
/*0x7d93*/  .byte 0x2b
/*0x7d94*/  .byte 0x1e
/*0x7d95*/  .byte 0x04
/*0x7d96*/  .byte 0x1f
/*0x7d97*/  .byte 0x16
/*0x7d98*/  .byte 0x20
/*0x7d99*/  .byte 0x07
/*0x7d9a*/  .byte 0x21
/*0x7d9b*/  .byte 0x09
/*0x7d9c*/  .byte 0x22
/*0x7d9d*/  .byte 0x0a
/*0x7d9e*/  .byte 0x23
/*0x7d9f*/  .byte 0x0b
/*0x7da0*/  .byte 0x24
/*0x7da1*/  .byte 0x0d
/*0x7da2*/  .byte 0x25
/*0x7da3*/  .byte 0x0e
/*0x7da4*/  .byte 0x26
/*0x7da5*/  .byte 0x0f
/*0x7da6*/  .byte 0x27
/*0x7da7*/  .byte 0x33
/*0x7da8*/  .byte 0x2d
/*0x7da9*/  .byte 0x28
/*0x7daa*/  .byte 0x2e
/*0x7dab*/  .byte 0x05
/*0x7dac*/  .byte 0x34
/*0x7dad*/  .byte 0x11
/*0x7dae*/  .byte 0x38
/*0x7daf*/  .byte 0x10
/*0x7db0*/  .byte 0x2f
/*0x7db1*/  .byte 0x36
/*0x7db2*/  .byte 0x30
/*0x7db3*/  .byte 0x37
/*0x7db4*/  .byte 0x31
/*0x7db5*/  .byte 0x1d
/*0x7db6*/  .byte 0x64
            data_7db7:
/*0x7db7*/  .byte 0xe8
/*0x7db8*/  .byte 0xcf
/*0x7db9*/  .byte 0x50
/*0x7dba*/  .byte 0x51
/*0x7dbb*/  .byte 0x52
/*0x7dbc*/  .byte 0x4f
/*0x7dbd*/  .byte 0xff
/*0x7dbe*/  .byte 0xff
/*0x7dbf*/  .byte 0xff
/*0x7dc0*/  .byte 0x00
/*0x7dc1*/  .byte 0x00
/*0x7dc2*/  .byte 0xff
/*0x7dc3*/  .byte 0xff
/*0x7dc4*/  .byte 0x00
/*0x7dc5*/  .byte 0x00
/*0x7dc6*/  .byte 0x00
/*0x7dc7*/  .byte 0xff
/*0x7dc8*/  .byte 0x00
/*0x7dc9*/  .byte 0x00
/*0x7dca*/  .byte 0x01
/*0x7dcb*/  .byte 0x02
/*0x7dcc*/  .byte 0x03
/*0x7dcd*/  .byte 0xff
/*0x7dce*/  .byte 0xff
/*0x7dcf*/  .byte 0xff
/*0x7dd0*/  .byte 0xff
/*0x7dd1*/  .byte 0x04
/*0x7dd2*/  .byte 0x04
/*0x7dd3*/  .byte 0x05
/*0x7dd4*/  .byte 0x05
/*0x7dd5*/  .byte 0x06
/*0x7dd6*/  .byte 0x06
/*0x7dd7*/  .byte 0x01
/*0x7dd8*/  .byte 0x01
/*0x7dd9*/  .byte 0x01
/*0x7dda*/  .byte 0x01
/*0x7ddb*/  .byte 0x01
/*0x7ddc*/  .byte 0x01
/*0x7ddd*/  .byte 0x01
/*0x7dde*/  .byte 0x03
/*0x7ddf*/  .byte 0x05
/*0x7de0*/  .byte 0x07
/*0x7de1*/  .byte 0x09
/*0x7de2*/  .byte 0x0b
/*0x7de3*/  .byte 0x01
/*0x7de4*/  .byte 0x03
/*0x7de5*/  .byte 0x05
/*0x7de6*/  .byte 0x07
/*0x7de7*/  .byte 0x09
/*0x7de8*/  .byte 0x0b
/*0x7de9*/  .byte 0xaa
/*0x7dea*/  .byte 0x6e
/*0x7deb*/  .byte 0x46
/*0x7dec*/  .byte 0x28
/*0x7ded*/  .byte 0x14
/*0x7dee*/  .byte 0x0a
/*0x7def*/  .byte 0x01
/*0x7df0*/  .byte 0x02
/*0x7df1*/  .byte 0x03
/*0x7df2*/  .byte 0x04
/*0x7df3*/  .byte 0x06
/*0x7df4*/  .byte 0x09
/*0x7df5*/  .byte 0x10
/*0x7df6*/  .byte 0x0b
/*0x7df7*/  .byte 0x07
/*0x7df8*/  .byte 0x04
/*0x7df9*/  .byte 0x02
/*0x7dfa*/  .byte 0x01
/*0x7dfb*/  .byte 0x10
/*0x7dfc*/  .byte 0x0b
/*0x7dfd*/  .byte 0x07
/*0x7dfe*/  .byte 0x04
/*0x7dff*/  .byte 0x02
/*0x7e00*/  .byte 0x01
/*0x7e01*/  .byte 0x09
/*0x7e02*/  .byte 0x08
/*0x7e03*/  .byte 0x01
/*0x7e04*/  .byte 0x01
/*0x7e05*/  .byte 0x01
/*0x7e06*/  .byte 0x01
/*0x7e07*/  .byte 0x0b
/*0x7e08*/  .byte 0x0b
/*0x7e09*/  .byte 0xff
/*0x7e0a*/  .byte 0x07
/*0x7e0b*/  .byte 0x02
/*0x7e0c*/  .byte 0x02
/*0x7e0d*/  .byte 0x02
/*0x7e0e*/  .byte 0x02
/*0x7e0f*/  .byte 0x0a
/*0x7e10*/  .byte 0x0a
/*0x7e11*/  .byte 0x0a
/*0x7e12*/  .byte 0xff
/*0x7e13*/  .byte 0x03
/*0x7e14*/  .byte 0x03
/*0x7e15*/  .byte 0x03
/*0x7e16*/  .byte 0x03
/*0x7e17*/  .byte 0x09
/*0x7e18*/  .byte 0x09
/*0x7e19*/  .byte 0x07
/*0x7e1a*/  .byte 0x0a
/*0x7e1b*/  .byte 0x04
/*0x7e1c*/  .byte 0x04
/*0x7e1d*/  .byte 0x04
/*0x7e1e*/  .byte 0x04
/*0x7e1f*/  .byte 0x09
/*0x7e20*/  .byte 0x09
/*0x7e21*/  .byte 0x06
/*0x7e22*/  .byte 0x0b
/*0x7e23*/  .byte 0x05
/*0x7e24*/  .byte 0x05
/*0x7e25*/  .byte 0x05
/*0x7e26*/  .byte 0x05
/*0x7e27*/  .byte 0x08
/*0x7e28*/  .byte 0x08
/*0x7e29*/  .byte 0x06
/*0x7e2a*/  .byte 0x0b
/*0x7e2b*/  .byte 0x06
/*0x7e2c*/  .byte 0x07
/*0x7e2d*/  .byte 0x06
/*0x7e2e*/  .byte 0x06
/*0x7e2f*/  .byte 0x08
/*0x7e30*/  .byte 0x07
/*0x7e31*/  .byte 0x09
/*0x7e32*/  .byte 0xff
/*0x7e33*/  .byte 0xff
/*0x7e34*/  .byte 0xff
/*0x7e35*/  .byte 0xff
/*0x7e36*/  .byte 0xff
/*0x7e37*/  .byte 0xff
/*0x7e38*/  .byte 0xff
/*0x7e39*/  .byte 0x00
/*0x7e3a*/  .byte 0x00
/*0x7e3b*/  .byte 0x00
/*0x7e3c*/  .byte 0x00
/*0x7e3d*/  .byte 0x00
/*0x7e3e*/  .byte 0x00
/*0x7e3f*/  .byte 0x00
/*0x7e40*/  .byte 0x00
/*0x7e41*/  .byte 0x00
/*0x7e42*/  .byte 0x00
/*0x7e43*/  .byte 0x00
/*0x7e44*/  .byte 0x00
/*0x7e45*/  .byte 0x00
/*0x7e46*/  .byte 0x00
/*0x7e47*/  .byte 0x00
            data_7e48:
/*0x7e48*/  .byte 0x00
/*0x7e49*/  .byte 0x23
/*0x7e4a*/  .byte 0x53
/*0x7e4b*/  .byte 0x00
/*0x7e4c*/  .byte 0x08
/*0x7e4d*/  .byte 0x01
/*0x7e4e*/  .byte 0x09
/*0x7e4f*/  .byte 0x02
/*0x7e50*/  .byte 0x0a
/*0x7e51*/  .byte 0xff
/*0x7e52*/  .byte 0x5b
/*0x7e53*/  .byte 0x10
/*0x7e54*/  .byte 0x18
/*0x7e55*/  .byte 0x11
/*0x7e56*/  .byte 0x19
/*0x7e57*/  .byte 0x12
/*0x7e58*/  .byte 0x1a
/*0x7e59*/  .byte 0x13
/*0x7e5a*/  .byte 0xff
/*0x7e5b*/  .byte 0x20
/*0x7e5c*/  .byte 0x28
/*0x7e5d*/  .byte 0x21
/*0x7e5e*/  .byte 0x29
/*0x7e5f*/  .byte 0x22
/*0x7e60*/  .byte 0x2a
/*0x7e61*/  .byte 0x62
/*0x7e62*/  .byte 0x1b
/*0x7e63*/  .byte 0x30
/*0x7e64*/  .byte 0x38
/*0x7e65*/  .byte 0x31
/*0x7e66*/  .byte 0x39
/*0x7e67*/  .byte 0x32
/*0x7e68*/  .byte 0x3a
/*0x7e69*/  .byte 0x61
/*0x7e6a*/  .byte 0x03
/*0x7e6b*/  .byte 0x40
/*0x7e6c*/  .byte 0x48
/*0x7e6d*/  .byte 0x41
/*0x7e6e*/  .byte 0x49
/*0x7e6f*/  .byte 0x42
/*0x7e70*/  .byte 0x4a
/*0x7e71*/  .byte 0x60
/*0x7e72*/  .byte 0x0b
/*0x7e73*/  .byte 0x50
/*0x7e74*/  .byte 0x63
/*0x7e75*/  .byte 0x51
/*0x7e76*/  .byte 0x58
/*0x7e77*/  .byte 0x4b
/*0x7e78*/  .byte 0x5a
/*0x7e79*/  .byte 0x33
/*0x7e7a*/  .byte 0xff
/*0x7e7b*/  .byte 0xff
/*0x7e7c*/  .byte 0xff
/*0x7e7d*/  .byte 0xff
/*0x7e7e*/  .byte 0xff
/*0x7e7f*/  .byte 0xff
/*0x7e80*/  .byte 0xff
/*0x7e81*/  .byte 0x00
/*0x7e82*/  .byte 0x00
/*0x7e83*/  .byte 0x00
/*0x7e84*/  .byte 0x00
/*0x7e85*/  .byte 0x00
/*0x7e86*/  .byte 0x00
/*0x7e87*/  .byte 0x00
/*0x7e88*/  .byte 0x00
/*0x7e89*/  .byte 0x00
/*0x7e8a*/  .byte 0x00
/*0x7e8b*/  .byte 0x00
/*0x7e8c*/  .byte 0x00
/*0x7e8d*/  .byte 0x00
/*0x7e8e*/  .byte 0x00
/*0x7e8f*/  .byte 0x00
/*0x7e90*/  .byte 0x00
            data_7e91:
/*0x7e91*/  .byte 0x00
/*0x7e92*/  .byte 0x24
/*0x7e93*/  .byte 0x49
/*0x7e94*/  .byte 0x6d
/*0x7e95*/  .byte 0x92
/*0x7e96*/  .byte 0xb6
/*0x7e97*/  .byte 0xdb
/*0x7e98*/  .byte 0xff
/*0x7e99*/  .byte 0xaa
/*0x7e9a*/  .byte 0x55
/*0x7e9b*/  .byte 0x00
/*0x7e9c*/  .byte 0xc8
/*0x7e9d*/  .byte 0xe6
/*0x7e9e*/  .byte 0x29
/*0x7e9f*/  .byte 0x14
/*0x7ea0*/  .byte 0x2b
/*0x7ea1*/  .byte 0x04
/*0x7ea2*/  .byte 0xe1
/*0x7ea3*/  .byte 0x1d
/*0x7ea4*/  .byte 0xce
/*0x7ea5*/  .byte 0x65
/*0x7ea6*/  .byte 0x1a
/*0x7ea7*/  .byte 0x08
/*0x7ea8*/  .byte 0x16
/*0x7ea9*/  .byte 0x07
/*0x7eaa*/  .byte 0x1b
/*0x7eab*/  .byte 0x06
/*0x7eac*/  .byte 0xe2
/*0x7ead*/  .byte 0xcc
/*0x7eae*/  .byte 0x15
/*0x7eaf*/  .byte 0x17
/*0x7eb0*/  .byte 0x09
/*0x7eb1*/  .byte 0x0a
/*0x7eb2*/  .byte 0x19
/*0x7eb3*/  .byte 0x05
/*0x7eb4*/  .byte 0xc9
/*0x7eb5*/  .byte 0xcf
/*0x7eb6*/  .byte 0x1c
/*0x7eb7*/  .byte 0x18
/*0x7eb8*/  .byte 0x0b
/*0x7eb9*/  .byte 0x0d
/*0x7eba*/  .byte 0x11
/*0x7ebb*/  .byte 0x10
/*0x7ebc*/  .byte 0x28
/*0x7ebd*/  .byte 0xe0
/*0x7ebe*/  .byte 0x0c
/*0x7ebf*/  .byte 0x12
/*0x7ec0*/  .byte 0x0e
/*0x7ec1*/  .byte 0x0f
/*0x7ec2*/  .byte 0x36
/*0x7ec3*/  .byte 0x37
/*0x7ec4*/  .byte 0x2a
/*0x7ec5*/  .byte 0xe3
/*0x7ec6*/  .byte 0x13
/*0x7ec7*/  .byte 0xe4
/*0x7ec8*/  .byte 0x33
/*0x7ec9*/  .byte 0x4c
/*0x7eca*/  .byte 0xe8
/*0x7ecb*/  .byte 0xe5
/*0x7ecc*/  .byte 0x2c
/*0x7ecd*/  .byte 0xca
/*0x7ece*/  .byte 0xcb
/*0x7ecf*/  .byte 0x00
/*0x7ed0*/  .byte 0x00
/*0x7ed1*/  .byte 0x00
/*0x7ed2*/  .byte 0x00
/*0x7ed3*/  .byte 0x00
/*0x7ed4*/  .byte 0x00
/*0x7ed5*/  .byte 0x40
/*0x7ed6*/  .byte 0x0b
/*0x7ed7*/  .byte 0x40
/*0x7ed8*/  .byte 0x00
/*0x7ed9*/  .byte 0x02
/*0x7eda*/  .byte 0x00
/*0x7edb*/  .byte 0x00
/*0x7edc*/  .byte 0x00
/*0x7edd*/  .byte 0x00
/*0x7ede*/  .byte 0x0b
/*0x7edf*/  .byte 0x40
/*0x7ee0*/  .byte 0x20
/*0x7ee1*/  .byte 0x00
/*0x7ee2*/  .byte 0x00
/*0x7ee3*/  .byte 0x00
/*0x7ee4*/  .byte 0x00
/*0x7ee5*/  .byte 0x00
/*0x7ee6*/  .byte 0x0b
/*0x7ee7*/  .byte 0x40
/*0x7ee8*/  .byte 0x40
/*0x7ee9*/  .byte 0x00
/*0x7eea*/  .byte 0x00
/*0x7eeb*/  .byte 0x00
/*0x7eec*/  .byte 0x00
/*0x7eed*/  .byte 0x00
/*0x7eee*/  .byte 0x0b
/*0x7eef*/  .byte 0x40
/*0x7ef0*/  .byte 0x80
/*0x7ef1*/  .byte 0x00
/*0x7ef2*/  .byte 0x00
/*0x7ef3*/  .byte 0x00
/*0x7ef4*/  .byte 0x00
/*0x7ef5*/  .byte 0x40
/*0x7ef6*/  .byte 0x0b
/*0x7ef7*/  .byte 0x40
/*0x7ef8*/  .byte 0x00
/*0x7ef9*/  .byte 0x08
/*0x7efa*/  .byte 0x00
/*0x7efb*/  .byte 0x00
/*0x7efc*/  .byte 0x00
/*0x7efd*/  .byte 0x40
/*0x7efe*/  .byte 0x0b
/*0x7eff*/  .byte 0x40
/*0x7f00*/  .byte 0x00
/*0x7f01*/  .byte 0x20
/*0x7f02*/  .byte 0x00
/*0x7f03*/  .byte 0x00
/*0x7f04*/  .byte 0x00
/*0x7f05*/  .byte 0x40
/*0x7f06*/  .byte 0x0b
/*0x7f07*/  .byte 0x40
/*0x7f08*/  .byte 0x00
/*0x7f09*/  .byte 0x40
/*0x7f0a*/  .byte 0x00
/*0x7f0b*/  .byte 0x00
/*0x7f0c*/  .byte 0x00
/*0x7f0d*/  .byte 0x40
/*0x7f0e*/  .byte 0x0b
/*0x7f0f*/  .byte 0x40
/*0x7f10*/  .byte 0x00
/*0x7f11*/  .byte 0x80
/*0x7f12*/  .byte 0x00
/*0x7f13*/  .byte 0x00
/*0x7f14*/  .byte 0x02
/*0x7f15*/  .byte 0x09
/*0x7f16*/  .byte 0x00
/*0x7f17*/  .byte 0x05
/*0x7f18*/  .byte 0x00
/*0x7f19*/  .byte 0x06
/*0x7f1a*/  .byte 0x00
/*0x7f1b*/  .byte 0x07
/*0x7f1c*/  .byte 0x02
/*0x7f1d*/  .byte 0x0b
/*0x7f1e*/  .byte 0x02
/*0x7f1f*/  .byte 0x0d
/*0x7f20*/  .byte 0x02
/*0x7f21*/  .byte 0x0e
/*0x7f22*/  .byte 0x02
/*0x7f23*/  .byte 0x0f
/*0x7f24*/  .byte 0x00
/*0x7f25*/  .byte 0x00
/*0x7f26*/  .byte 0x0b
/*0x7f27*/  .byte 0x40
/*0x7f28*/  .byte 0x10
/*0x7f29*/  .byte 0x00
/*0x7f2a*/  .byte 0x00
/*0x7f2b*/  .byte 0x00
/*0x7f2c*/  .byte 0x00
/*0x7f2d*/  .byte 0x20
/*0x7f2e*/  .byte 0x0b
/*0x7f2f*/  .byte 0x40
/*0x7f30*/  .byte 0x00
/*0x7f31*/  .byte 0x04
/*0x7f32*/  .byte 0x00
/*0x7f33*/  .byte 0x00
/*0x7f34*/  .byte 0x00
/*0x7f35*/  .byte 0x60
/*0x7f36*/  .byte 0x0b
/*0x7f37*/  .byte 0x40
/*0x7f38*/  .byte 0x01
/*0x7f39*/  .byte 0x00
/*0x7f3a*/  .byte 0x00
/*0x7f3b*/  .byte 0x00
/*0x7f3c*/  .byte 0x00
/*0x7f3d*/  .byte 0x20
/*0x7f3e*/  .byte 0x0b
/*0x7f3f*/  .byte 0x40
/*0x7f40*/  .byte 0x00
/*0x7f41*/  .byte 0x08
/*0x7f42*/  .byte 0x00
/*0x7f43*/  .byte 0x00
/*0x7f44*/  .byte 0x00
/*0x7f45*/  .byte 0x00
/*0x7f46*/  .byte 0x0b
/*0x7f47*/  .byte 0x40
/*0x7f48*/  .byte 0x00
/*0x7f49*/  .byte 0x08
/*0x7f4a*/  .byte 0x00
/*0x7f4b*/  .byte 0x00
/*0x7f4c*/  .byte 0x00
/*0x7f4d*/  .byte 0x00
/*0x7f4e*/  .byte 0x0b
/*0x7f4f*/  .byte 0x40
/*0x7f50*/  .byte 0x01
/*0x7f51*/  .byte 0x00
/*0x7f52*/  .byte 0x00
/*0x7f53*/  .byte 0x00
            data_7f54:
/*0x7f54*/  .byte 0x00
/*0x7f55*/  .byte 0x00
/*0x7f56*/  .byte 0x0b
/*0x7f57*/  .byte 0x40
/*0x7f58*/  .byte 0x02
/*0x7f59*/  .byte 0x00
/*0x7f5a*/  .byte 0x00
/*0x7f5b*/  .byte 0x00
/*0x7f5c*/  .byte 0x2d
/*0x7f5d*/  .byte 0x2f
/*0x7f5e*/  .byte 0x2e
/*0x7f5f*/  .byte 0x30
/*0x7f60*/  .byte 0x14
/*0x7f61*/  .byte 0x34
/*0x7f62*/  .byte 0x1a
/*0x7f63*/  .byte 0x36
/*0x7f64*/  .byte 0x08
/*0x7f65*/  .byte 0x37
/*0x7f66*/  .byte 0x15
/*0x7f67*/  .byte 0x13
/*0x7f68*/  .byte 0x17
/*0x7f69*/  .byte 0x1c
/*0x7f6a*/  .byte 0x1c
/*0x7f6b*/  .byte 0x09
/*0x7f6c*/  .byte 0x18
/*0x7f6d*/  .byte 0x0a
/*0x7f6e*/  .byte 0x0c
/*0x7f6f*/  .byte 0x06
/*0x7f70*/  .byte 0x12
/*0x7f71*/  .byte 0x15
/*0x7f72*/  .byte 0x13
/*0x7f73*/  .byte 0x0f
/*0x7f74*/  .byte 0x2f
/*0x7f75*/  .byte 0x38
/*0x7f76*/  .byte 0x30
/*0x7f77*/  .byte 0x2e
/*0x7f78*/  .byte 0x16
/*0x7f79*/  .byte 0x12
/*0x7f7a*/  .byte 0x07
/*0x7f7b*/  .byte 0x08
/*0x7f7c*/  .byte 0x09
/*0x7f7d*/  .byte 0x18
/*0x7f7e*/  .byte 0x0a
/*0x7f7f*/  .byte 0x0c
/*0x7f80*/  .byte 0x0b
/*0x7f81*/  .byte 0x07
/*0x7f82*/  .byte 0x0d
/*0x7f83*/  .byte 0x0b
/*0x7f84*/  .byte 0x0e
/*0x7f85*/  .byte 0x17
/*0x7f86*/  .byte 0x0f
/*0x7f87*/  .byte 0x11
/*0x7f88*/  .byte 0x33
/*0x7f89*/  .byte 0x16
/*0x7f8a*/  .byte 0x34
/*0x7f8b*/  .byte 0x2d
/*0x7f8c*/  .byte 0x1d
/*0x7f8d*/  .byte 0x33
/*0x7f8e*/  .byte 0x1b
/*0x7f8f*/  .byte 0x14
/*0x7f90*/  .byte 0x06
/*0x7f91*/  .byte 0x0d
/*0x7f92*/  .byte 0x19
/*0x7f93*/  .byte 0x0e
/*0x7f94*/  .byte 0x05
/*0x7f95*/  .byte 0x1b
/*0x7f96*/  .byte 0x11
/*0x7f97*/  .byte 0x05
/*0x7f98*/  .byte 0x10
/*0x7f99*/  .byte 0x10
/*0x7f9a*/  .byte 0x36
/*0x7f9b*/  .byte 0x1a
/*0x7f9c*/  .byte 0x37
/*0x7f9d*/  .byte 0x19
/*0x7f9e*/  .byte 0x38
/*0x7f9f*/  .byte 0x1d
/*0x7fa0*/  .byte 0x08
/*0x7fa1*/  .byte 0x09
/*0x7fa2*/  .byte 0x15
/*0x7fa3*/  .byte 0x13
/*0x7fa4*/  .byte 0x17
/*0x7fa5*/  .byte 0x0a
/*0x7fa6*/  .byte 0x1c
/*0x7fa7*/  .byte 0x0d
/*0x7fa8*/  .byte 0x18
/*0x7fa9*/  .byte 0x0f
/*0x7faa*/  .byte 0x0c
/*0x7fab*/  .byte 0x18
/*0x7fac*/  .byte 0x12
/*0x7fad*/  .byte 0x1c
/*0x7fae*/  .byte 0x13
/*0x7faf*/  .byte 0x33
/*0x7fb0*/  .byte 0x16
/*0x7fb1*/  .byte 0x15
/*0x7fb2*/  .byte 0x07
/*0x7fb3*/  .byte 0x16
/*0x7fb4*/  .byte 0x09
/*0x7fb5*/  .byte 0x17
/*0x7fb6*/  .byte 0x0a
/*0x7fb7*/  .byte 0x07
/*0x7fb8*/  .byte 0x0d
/*0x7fb9*/  .byte 0x11
/*0x7fba*/  .byte 0x0e
/*0x7fbb*/  .byte 0x08
/*0x7fbc*/  .byte 0x0f
/*0x7fbd*/  .byte 0x0c
/*0x7fbe*/  .byte 0x33
/*0x7fbf*/  .byte 0x12
/*0x7fc0*/  .byte 0x11
/*0x7fc1*/  .byte 0x0e
/*0x7fc2*/  .byte 0x00
/*0x7fc3*/  .byte 0x00
/*0x7fc4*/  .byte 0x00
/*0x7fc5*/  .byte 0x01
/*0x7fc6*/  .byte 0x02
/*0x7fc7*/  .byte 0x00
/*0x7fc8*/  .byte 0x00
/*0x7fc9*/  .byte 0x40
/*0x7fca*/  .byte 0x0b
/*0x7fcb*/  .byte 0x40
/*0x7fcc*/  .byte 0x10
/*0x7fcd*/  .byte 0x00
/*0x7fce*/  .byte 0x00
/*0x7fcf*/  .byte 0x00
/*0x7fd0*/  .byte 0x00
/*0x7fd1*/  .byte 0x40
/*0x7fd2*/  .byte 0x0b
/*0x7fd3*/  .byte 0x40
/*0x7fd4*/  .byte 0x20
/*0x7fd5*/  .byte 0x00
/*0x7fd6*/  .byte 0x00
/*0x7fd7*/  .byte 0x00
/*0x7fd8*/  .byte 0x00
/*0x7fd9*/  .byte 0x40
/*0x7fda*/  .byte 0x0b
/*0x7fdb*/  .byte 0x40
/*0x7fdc*/  .byte 0x40
/*0x7fdd*/  .byte 0x00
/*0x7fde*/  .byte 0x00
/*0x7fdf*/  .byte 0x00
/*0x7fe0*/  .byte 0x00
/*0x7fe1*/  .byte 0x20
/*0x7fe2*/  .byte 0x0b
/*0x7fe3*/  .byte 0x40
/*0x7fe4*/  .byte 0x02
/*0x7fe5*/  .byte 0x00
/*0x7fe6*/  .byte 0x00
/*0x7fe7*/  .byte 0x00
/*0x7fe8*/  .byte 0x00
/*0x7fe9*/  .byte 0x00
/*0x7fea*/  .byte 0x13
/*0x7feb*/  .byte 0x00
/*0x7fec*/  .byte 0x26
/*0x7fed*/  .byte 0x00
/*0x7fee*/  .byte 0x3a
/*0x7fef*/  .byte 0x00
/*0x7ff0*/  .byte 0x4e
/*0x7ff1*/  .byte 0x00
/*0x7ff2*/  .byte 0x62
/*0x7ff3*/  .byte 0x00
/*0x7ff4*/  .byte 0x77
/*0x7ff5*/  .byte 0x00
/*0x7ff6*/  .byte 0x8c
/*0x7ff7*/  .byte 0x00
/*0x7ff8*/  .byte 0xa1
/*0x7ff9*/  .byte 0x00
/*0x7ffa*/  .byte 0xb7
/*0x7ffb*/  .byte 0x00
/*0x7ffc*/  .byte 0xcd
/*0x7ffd*/  .byte 0x00
/*0x7ffe*/  .byte 0xe3
/*0x7fff*/  .byte 0x00
/*0x8000*/  .byte 0xfa
/*0x8001*/  .byte 0x00
/*0x8002*/  .byte 0x11
/*0x8003*/  .byte 0x01
/*0x8004*/  .byte 0x28
/*0x8005*/  .byte 0x01
/*0x8006*/  .byte 0x40
/*0x8007*/  .byte 0x01
/*0x8008*/  .byte 0x58
/*0x8009*/  .byte 0x01
/*0x800a*/  .byte 0x71
/*0x800b*/  .byte 0x01
/*0x800c*/  .byte 0x8a
/*0x800d*/  .byte 0x01
/*0x800e*/  .byte 0xa3
/*0x800f*/  .byte 0x01
/*0x8010*/  .byte 0xbd
/*0x8011*/  .byte 0x01
/*0x8012*/  .byte 0xd7
/*0x8013*/  .byte 0x01
/*0x8014*/  .byte 0xf1
/*0x8015*/  .byte 0x01
/*0x8016*/  .byte 0x0c
/*0x8017*/  .byte 0x02
/*0x8018*/  .byte 0x28
/*0x8019*/  .byte 0x02
/*0x801a*/  .byte 0x43
/*0x801b*/  .byte 0x02
/*0x801c*/  .byte 0x60
/*0x801d*/  .byte 0x02
/*0x801e*/  .byte 0x7c
/*0x801f*/  .byte 0x02
/*0x8020*/  .byte 0x9a
/*0x8021*/  .byte 0x02
/*0x8022*/  .byte 0xb7
/*0x8023*/  .byte 0x02
/*0x8024*/  .byte 0xd5
/*0x8025*/  .byte 0x02
/*0x8026*/  .byte 0xf4
/*0x8027*/  .byte 0x02
/*0x8028*/  .byte 0x13
/*0x8029*/  .byte 0x03
/*0x802a*/  .byte 0x32
/*0x802b*/  .byte 0x03
/*0x802c*/  .byte 0x53
/*0x802d*/  .byte 0x03
/*0x802e*/  .byte 0x73
/*0x802f*/  .byte 0x03
/*0x8030*/  .byte 0x94
/*0x8031*/  .byte 0x03
/*0x8032*/  .byte 0xb6
/*0x8033*/  .byte 0x03
/*0x8034*/  .byte 0xd8
/*0x8035*/  .byte 0x03
/*0x8036*/  .byte 0xfb
/*0x8037*/  .byte 0x03
/*0x8038*/  .byte 0x1e
/*0x8039*/  .byte 0x04
/*0x803a*/  .byte 0x42
/*0x803b*/  .byte 0x04
/*0x803c*/  .byte 0x66
/*0x803d*/  .byte 0x04
/*0x803e*/  .byte 0x8b
/*0x803f*/  .byte 0x04
/*0x8040*/  .byte 0xb1
/*0x8041*/  .byte 0x04
/*0x8042*/  .byte 0xd7
/*0x8043*/  .byte 0x04
/*0x8044*/  .byte 0xfd
/*0x8045*/  .byte 0x04
/*0x8046*/  .byte 0x25
/*0x8047*/  .byte 0x05
/*0x8048*/  .byte 0x4d
/*0x8049*/  .byte 0x05
/*0x804a*/  .byte 0x75
/*0x804b*/  .byte 0x05
/*0x804c*/  .byte 0x9f
/*0x804d*/  .byte 0x05
/*0x804e*/  .byte 0xc8
/*0x804f*/  .byte 0x05
/*0x8050*/  .byte 0xf3
/*0x8051*/  .byte 0x05
/*0x8052*/  .byte 0x1e
/*0x8053*/  .byte 0x06
/*0x8054*/  .byte 0x4a
/*0x8055*/  .byte 0x06
/*0x8056*/  .byte 0x77
/*0x8057*/  .byte 0x06
/*0x8058*/  .byte 0xa4
/*0x8059*/  .byte 0x06
/*0x805a*/  .byte 0xd2
/*0x805b*/  .byte 0x06
/*0x805c*/  .byte 0x01
/*0x805d*/  .byte 0x07
/*0x805e*/  .byte 0x31
/*0x805f*/  .byte 0x07
/*0x8060*/  .byte 0x61
/*0x8061*/  .byte 0x07
/*0x8062*/  .byte 0x92
/*0x8063*/  .byte 0x07
/*0x8064*/  .byte 0xc4
/*0x8065*/  .byte 0x07
/*0x8066*/  .byte 0xf6
/*0x8067*/  .byte 0x07
/*0x8068*/  .byte 0x2a
/*0x8069*/  .byte 0x08
/*0x806a*/  .byte 0x5e
/*0x806b*/  .byte 0x08
/*0x806c*/  .byte 0x93
/*0x806d*/  .byte 0x08
/*0x806e*/  .byte 0xc9
/*0x806f*/  .byte 0x08
/*0x8070*/  .byte 0x00
/*0x8071*/  .byte 0x09
/*0x8072*/  .byte 0x38
/*0x8073*/  .byte 0x09
/*0x8074*/  .byte 0x70
/*0x8075*/  .byte 0x09
/*0x8076*/  .byte 0xaa
/*0x8077*/  .byte 0x09
/*0x8078*/  .byte 0xe4
/*0x8079*/  .byte 0x09
/*0x807a*/  .byte 0x1f
/*0x807b*/  .byte 0x0a
/*0x807c*/  .byte 0x5b
/*0x807d*/  .byte 0x0a
/*0x807e*/  .byte 0x99
/*0x807f*/  .byte 0x0a
/*0x8080*/  .byte 0xd7
/*0x8081*/  .byte 0x0a
/*0x8082*/  .byte 0x16
/*0x8083*/  .byte 0x0b
/*0x8084*/  .byte 0x56
/*0x8085*/  .byte 0x0b
/*0x8086*/  .byte 0x97
/*0x8087*/  .byte 0x0b
/*0x8088*/  .byte 0xd9
/*0x8089*/  .byte 0x0b
/*0x808a*/  .byte 0x1d
/*0x808b*/  .byte 0x0c
/*0x808c*/  .byte 0x61
/*0x808d*/  .byte 0x0c
/*0x808e*/  .byte 0xa6
/*0x808f*/  .byte 0x0c
/*0x8090*/  .byte 0xed
/*0x8091*/  .byte 0x0c
/*0x8092*/  .byte 0x34
/*0x8093*/  .byte 0x0d
/*0x8094*/  .byte 0x7d
/*0x8095*/  .byte 0x0d
/*0x8096*/  .byte 0xc7
/*0x8097*/  .byte 0x0d
/*0x8098*/  .byte 0x12
/*0x8099*/  .byte 0x0e
/*0x809a*/  .byte 0x5e
/*0x809b*/  .byte 0x0e
/*0x809c*/  .byte 0xac
/*0x809d*/  .byte 0x0e
/*0x809e*/  .byte 0xfb
/*0x809f*/  .byte 0x0e
/*0x80a0*/  .byte 0x4b
/*0x80a1*/  .byte 0x0f
/*0x80a2*/  .byte 0x9c
/*0x80a3*/  .byte 0x0f
/*0x80a4*/  .byte 0xee
/*0x80a5*/  .byte 0x0f
/*0x80a6*/  .byte 0x42
/*0x80a7*/  .byte 0x10
/*0x80a8*/  .byte 0x97
/*0x80a9*/  .byte 0x10
/*0x80aa*/  .byte 0xee
/*0x80ab*/  .byte 0x10
/*0x80ac*/  .byte 0x46
/*0x80ad*/  .byte 0x11
/*0x80ae*/  .byte 0x9f
/*0x80af*/  .byte 0x11
/*0x80b0*/  .byte 0xfa
/*0x80b1*/  .byte 0x11
/*0x80b2*/  .byte 0x56
/*0x80b3*/  .byte 0x12
/*0x80b4*/  .byte 0xb4
/*0x80b5*/  .byte 0x12
/*0x80b6*/  .byte 0x13
/*0x80b7*/  .byte 0x13
/*0x80b8*/  .byte 0x73
/*0x80b9*/  .byte 0x13
/*0x80ba*/  .byte 0xd5
/*0x80bb*/  .byte 0x13
/*0x80bc*/  .byte 0x39
/*0x80bd*/  .byte 0x14
/*0x80be*/  .byte 0x9e
/*0x80bf*/  .byte 0x14
/*0x80c0*/  .byte 0x05
/*0x80c1*/  .byte 0x15
/*0x80c2*/  .byte 0x6e
/*0x80c3*/  .byte 0x15
/*0x80c4*/  .byte 0xd8
/*0x80c5*/  .byte 0x15
/*0x80c6*/  .byte 0x44
/*0x80c7*/  .byte 0x16
/*0x80c8*/  .byte 0xb2
/*0x80c9*/  .byte 0x16
/*0x80ca*/  .byte 0x21
/*0x80cb*/  .byte 0x17
/*0x80cc*/  .byte 0x92
/*0x80cd*/  .byte 0x17
/*0x80ce*/  .byte 0x05
/*0x80cf*/  .byte 0x18
/*0x80d0*/  .byte 0x7a
/*0x80d1*/  .byte 0x18
/*0x80d2*/  .byte 0xf0
/*0x80d3*/  .byte 0x18
/*0x80d4*/  .byte 0x69
/*0x80d5*/  .byte 0x19
/*0x80d6*/  .byte 0xe3
/*0x80d7*/  .byte 0x19
/*0x80d8*/  .byte 0x5f
/*0x80d9*/  .byte 0x1a
/*0x80da*/  .byte 0xde
/*0x80db*/  .byte 0x1a
/*0x80dc*/  .byte 0x5e
/*0x80dd*/  .byte 0x1b
/*0x80de*/  .byte 0xe0
/*0x80df*/  .byte 0x1b
/*0x80e0*/  .byte 0x65
/*0x80e1*/  .byte 0x1c
/*0x80e2*/  .byte 0xeb
/*0x80e3*/  .byte 0x1c
/*0x80e4*/  .byte 0x74
/*0x80e5*/  .byte 0x1d
/*0x80e6*/  .byte 0xff
/*0x80e7*/  .byte 0x1d
/*0x80e8*/  .byte 0x8c
/*0x80e9*/  .byte 0x1e
/*0x80ea*/  .byte 0x1b
/*0x80eb*/  .byte 0x1f
/*0x80ec*/  .byte 0xac
/*0x80ed*/  .byte 0x1f
/*0x80ee*/  .byte 0x40
/*0x80ef*/  .byte 0x20
/*0x80f0*/  .byte 0xd6
/*0x80f1*/  .byte 0x20
/*0x80f2*/  .byte 0x6f
/*0x80f3*/  .byte 0x21
/*0x80f4*/  .byte 0x0a
/*0x80f5*/  .byte 0x22
/*0x80f6*/  .byte 0xa8
/*0x80f7*/  .byte 0x22
/*0x80f8*/  .byte 0x48
/*0x80f9*/  .byte 0x23
/*0x80fa*/  .byte 0xea
/*0x80fb*/  .byte 0x23
/*0x80fc*/  .byte 0x8f
/*0x80fd*/  .byte 0x24
/*0x80fe*/  .byte 0x37
/*0x80ff*/  .byte 0x25
/*0x8100*/  .byte 0xe1
/*0x8101*/  .byte 0x25
/*0x8102*/  .byte 0x8e
/*0x8103*/  .byte 0x26
/*0x8104*/  .byte 0x3e
/*0x8105*/  .byte 0x27
/*0x8106*/  .byte 0xf1
/*0x8107*/  .byte 0x27
/*0x8108*/  .byte 0xa6
/*0x8109*/  .byte 0x28
/*0x810a*/  .byte 0x5f
/*0x810b*/  .byte 0x29
/*0x810c*/  .byte 0x1a
/*0x810d*/  .byte 0x2a
/*0x810e*/  .byte 0xd8
/*0x810f*/  .byte 0x2a
/*0x8110*/  .byte 0x99
/*0x8111*/  .byte 0x2b
/*0x8112*/  .byte 0x5e
/*0x8113*/  .byte 0x2c
/*0x8114*/  .byte 0x25
/*0x8115*/  .byte 0x2d
/*0x8116*/  .byte 0xf0
/*0x8117*/  .byte 0x2d
/*0x8118*/  .byte 0xbe
/*0x8119*/  .byte 0x2e
/*0x811a*/  .byte 0x8f
/*0x811b*/  .byte 0x2f
/*0x811c*/  .byte 0x63
/*0x811d*/  .byte 0x30
/*0x811e*/  .byte 0x3b
/*0x811f*/  .byte 0x31
/*0x8120*/  .byte 0x16
/*0x8121*/  .byte 0x32
/*0x8122*/  .byte 0xf5
/*0x8123*/  .byte 0x32
/*0x8124*/  .byte 0xd7
/*0x8125*/  .byte 0x33
/*0x8126*/  .byte 0xbd
/*0x8127*/  .byte 0x34
/*0x8128*/  .byte 0xa7
/*0x8129*/  .byte 0x35
/*0x812a*/  .byte 0x94
/*0x812b*/  .byte 0x36
/*0x812c*/  .byte 0x85
/*0x812d*/  .byte 0x37
/*0x812e*/  .byte 0x7a
/*0x812f*/  .byte 0x38
/*0x8130*/  .byte 0x72
/*0x8131*/  .byte 0x39
/*0x8132*/  .byte 0x6f
/*0x8133*/  .byte 0x3a
/*0x8134*/  .byte 0x70
/*0x8135*/  .byte 0x3b
/*0x8136*/  .byte 0x74
/*0x8137*/  .byte 0x3c
/*0x8138*/  .byte 0x7d
/*0x8139*/  .byte 0x3d
/*0x813a*/  .byte 0x8a
/*0x813b*/  .byte 0x3e
/*0x813c*/  .byte 0x9c
/*0x813d*/  .byte 0x3f
/*0x813e*/  .byte 0xb1
/*0x813f*/  .byte 0x40
/*0x8140*/  .byte 0xcb
/*0x8141*/  .byte 0x41
/*0x8142*/  .byte 0xea
/*0x8143*/  .byte 0x42
/*0x8144*/  .byte 0x0d
/*0x8145*/  .byte 0x44
/*0x8146*/  .byte 0x35
/*0x8147*/  .byte 0x45
/*0x8148*/  .byte 0x61
/*0x8149*/  .byte 0x46
/*0x814a*/  .byte 0x93
/*0x814b*/  .byte 0x47
/*0x814c*/  .byte 0xc9
/*0x814d*/  .byte 0x48
/*0x814e*/  .byte 0x04
/*0x814f*/  .byte 0x4a
/*0x8150*/  .byte 0x44
/*0x8151*/  .byte 0x4b
/*0x8152*/  .byte 0x89
/*0x8153*/  .byte 0x4c
/*0x8154*/  .byte 0xd3
/*0x8155*/  .byte 0x4d
/*0x8156*/  .byte 0x22
/*0x8157*/  .byte 0x4f
/*0x8158*/  .byte 0x77
/*0x8159*/  .byte 0x50
/*0x815a*/  .byte 0xd2
/*0x815b*/  .byte 0x51
/*0x815c*/  .byte 0x31
/*0x815d*/  .byte 0x53
/*0x815e*/  .byte 0x97
/*0x815f*/  .byte 0x54
/*0x8160*/  .byte 0x02
/*0x8161*/  .byte 0x56
/*0x8162*/  .byte 0x72
/*0x8163*/  .byte 0x57
/*0x8164*/  .byte 0xe9
/*0x8165*/  .byte 0x58
/*0x8166*/  .byte 0x66
/*0x8167*/  .byte 0x5a
/*0x8168*/  .byte 0xe8
/*0x8169*/  .byte 0x5b
/*0x816a*/  .byte 0x71
/*0x816b*/  .byte 0x5d
/*0x816c*/  .byte 0x00
/*0x816d*/  .byte 0x5f
/*0x816e*/  .byte 0x95
/*0x816f*/  .byte 0x60
/*0x8170*/  .byte 0x31
/*0x8171*/  .byte 0x62
/*0x8172*/  .byte 0xd3
/*0x8173*/  .byte 0x63
/*0x8174*/  .byte 0x7c
/*0x8175*/  .byte 0x65
/*0x8176*/  .byte 0x2c
/*0x8177*/  .byte 0x67
/*0x8178*/  .byte 0xe3
/*0x8179*/  .byte 0x68
/*0x817a*/  .byte 0xa0
/*0x817b*/  .byte 0x6a
/*0x817c*/  .byte 0x65
/*0x817d*/  .byte 0x6c
/*0x817e*/  .byte 0x31
/*0x817f*/  .byte 0x6e
/*0x8180*/  .byte 0x04
/*0x8181*/  .byte 0x70
/*0x8182*/  .byte 0xde
/*0x8183*/  .byte 0x71
/*0x8184*/  .byte 0xc0
/*0x8185*/  .byte 0x73
/*0x8186*/  .byte 0xaa
/*0x8187*/  .byte 0x75
/*0x8188*/  .byte 0x9c
/*0x8189*/  .byte 0x77
/*0x818a*/  .byte 0x95
/*0x818b*/  .byte 0x79
/*0x818c*/  .byte 0x96
/*0x818d*/  .byte 0x7b
/*0x818e*/  .byte 0xa0
/*0x818f*/  .byte 0x7d
/*0x8190*/  .byte 0xb2
/*0x8191*/  .byte 0x7f
/*0x8192*/  .byte 0xcc
/*0x8193*/  .byte 0x81
/*0x8194*/  .byte 0xef
/*0x8195*/  .byte 0x83
/*0x8196*/  .byte 0x1a
/*0x8197*/  .byte 0x86
/*0x8198*/  .byte 0x4f
/*0x8199*/  .byte 0x88
/*0x819a*/  .byte 0x8c
/*0x819b*/  .byte 0x8a
/*0x819c*/  .byte 0xd3
/*0x819d*/  .byte 0x8c
/*0x819e*/  .byte 0x22
/*0x819f*/  .byte 0x8f
/*0x81a0*/  .byte 0x7b
/*0x81a1*/  .byte 0x91
/*0x81a2*/  .byte 0xde
/*0x81a3*/  .byte 0x93
/*0x81a4*/  .byte 0x4a
/*0x81a5*/  .byte 0x96
/*0x81a6*/  .byte 0xc0
/*0x81a7*/  .byte 0x98
/*0x81a8*/  .byte 0x40
/*0x81a9*/  .byte 0x9b
/*0x81aa*/  .byte 0xcb
/*0x81ab*/  .byte 0x9d
/*0x81ac*/  .byte 0x5f
/*0x81ad*/  .byte 0xa0
/*0x81ae*/  .byte 0xff
/*0x81af*/  .byte 0xa2
/*0x81b0*/  .byte 0xa8
/*0x81b1*/  .byte 0xa5
/*0x81b2*/  .byte 0x5d
/*0x81b3*/  .byte 0xa8
/*0x81b4*/  .byte 0x1d
/*0x81b5*/  .byte 0xab
/*0x81b6*/  .byte 0xe8
/*0x81b7*/  .byte 0xad
/*0x81b8*/  .byte 0xbe
/*0x81b9*/  .byte 0xb0
/*0x81ba*/  .byte 0x9f
/*0x81bb*/  .byte 0xb3
/*0x81bc*/  .byte 0x8d
/*0x81bd*/  .byte 0xb6
/*0x81be*/  .byte 0x86
/*0x81bf*/  .byte 0xb9
/*0x81c0*/  .byte 0x8c
/*0x81c1*/  .byte 0xbc
/*0x81c2*/  .byte 0x9d
/*0x81c3*/  .byte 0xbf
/*0x81c4*/  .byte 0xbc
/*0x81c5*/  .byte 0xc2
/*0x81c6*/  .byte 0xe6
/*0x81c7*/  .byte 0xc5
/*0x81c8*/  .byte 0x1e
/*0x81c9*/  .byte 0xc9
/*0x81ca*/  .byte 0x63
/*0x81cb*/  .byte 0xcc
/*0x81cc*/  .byte 0xb5
/*0x81cd*/  .byte 0xcf
/*0x81ce*/  .byte 0x15
/*0x81cf*/  .byte 0xd3
/*0x81d0*/  .byte 0x82
/*0x81d1*/  .byte 0xd6
/*0x81d2*/  .byte 0xfd
/*0x81d3*/  .byte 0xd9
/*0x81d4*/  .byte 0x87
/*0x81d5*/  .byte 0xdd
/*0x81d6*/  .byte 0x1f
/*0x81d7*/  .byte 0xe1
/*0x81d8*/  .byte 0xc5
/*0x81d9*/  .byte 0xe4
/*0x81da*/  .byte 0x7a
/*0x81db*/  .byte 0xe8
/*0x81dc*/  .byte 0x3f
/*0x81dd*/  .byte 0xec
/*0x81de*/  .byte 0x12
/*0x81df*/  .byte 0xf0
/*0x81e0*/  .byte 0xf5
/*0x81e1*/  .byte 0xf3
/*0x81e2*/  .byte 0xe9
/*0x81e3*/  .byte 0xf7
/*0x81e4*/  .byte 0xec
/*0x81e5*/  .byte 0xfb
/*0x81e6*/  .byte 0xff
/*0x81e7*/  .byte 0xff
/*0x81e8*/  .byte 0x00
/*0x81e9*/  .byte 0x08
/*0x81ea*/  .byte 0x10
/*0x81eb*/  .byte 0x18
/*0x81ec*/  .byte 0x20
/*0x81ed*/  .byte 0x28
/*0x81ee*/  .byte 0x30
/*0x81ef*/  .byte 0x00
/*0x81f0*/  .byte 0x01
/*0x81f1*/  .byte 0x09
/*0x81f2*/  .byte 0x11
/*0x81f3*/  .byte 0x19
/*0x81f4*/  .byte 0x2b
/*0x81f5*/  .byte 0x29
/*0x81f6*/  .byte 0x31
/*0x81f7*/  .byte 0x00
/*0x81f8*/  .byte 0x02
/*0x81f9*/  .byte 0x0a
/*0x81fa*/  .byte 0x12
/*0x81fb*/  .byte 0x1a
/*0x81fc*/  .byte 0x22
/*0x81fd*/  .byte 0x2a
/*0x81fe*/  .byte 0x32
/*0x81ff*/  .byte 0x00
/*0x8200*/  .byte 0x03
/*0x8201*/  .byte 0x0b
/*0x8202*/  .byte 0x13
/*0x8203*/  .byte 0x1b
/*0x8204*/  .byte 0x23
/*0x8205*/  .byte 0x21
/*0x8206*/  .byte 0xff
/*0x8207*/  .byte 0x00
/*0x8208*/  .byte 0x04
/*0x8209*/  .byte 0x0c
/*0x820a*/  .byte 0x14
/*0x820b*/  .byte 0x1c
/*0x820c*/  .byte 0x24
/*0x820d*/  .byte 0x2c
/*0x820e*/  .byte 0xff
/*0x820f*/  .byte 0x00
/*0x8210*/  .byte 0x05
/*0x8211*/  .byte 0x0d
/*0x8212*/  .byte 0x15
/*0x8213*/  .byte 0x1d
/*0x8214*/  .byte 0x25
/*0x8215*/  .byte 0x2d
/*0x8216*/  .byte 0xff
/*0x8217*/  .byte 0x00
/*0x8218*/  .byte 0x06
/*0x8219*/  .byte 0x0e
/*0x821a*/  .byte 0x16
/*0x821b*/  .byte 0x1e
/*0x821c*/  .byte 0x26
/*0x821d*/  .byte 0x2e
/*0x821e*/  .byte 0xff
/*0x821f*/  .byte 0x00
/*0x8220*/  .byte 0x07
/*0x8221*/  .byte 0x0f
/*0x8222*/  .byte 0x17
/*0x8223*/  .byte 0x1f
/*0x8224*/  .byte 0x27
/*0x8225*/  .byte 0x2f
/*0x8226*/  .byte 0xff
/*0x8227*/  .byte 0x00
/*0x8228*/  .byte 0x8c
/*0x8229*/  .byte 0x83
/*0x822a*/  .byte 0x00
/*0x822b*/  .byte 0x00
/*0x822c*/  .byte 0x90
/*0x822d*/  .byte 0x83
/*0x822e*/  .byte 0x00
/*0x822f*/  .byte 0x00
/*0x8230*/  .byte 0x06
/*0x8231*/  .byte 0x00
/*0x8232*/  .byte 0xff
/*0x8233*/  .byte 0x09
/*0x8234*/  .byte 0x01
/*0x8235*/  .byte 0xa1
/*0x8236*/  .byte 0x01
/*0x8237*/  .byte 0x09
/*0x8238*/  .byte 0x02
/*0x8239*/  .byte 0x15
/*0x823a*/  .byte 0x00
/*0x823b*/  .byte 0x26
/*0x823c*/  .byte 0xff
/*0x823d*/  .byte 0x00
/*0x823e*/  .byte 0x75
/*0x823f*/  .byte 0x08
/*0x8240*/  .byte 0x95
/*0x8241*/  .byte 0x40
/*0x8242*/  .byte 0x81
/*0x8243*/  .byte 0x02
/*0x8244*/  .byte 0x09
/*0x8245*/  .byte 0x03
/*0x8246*/  .byte 0x15
/*0x8247*/  .byte 0x00
/*0x8248*/  .byte 0x26
/*0x8249*/  .byte 0xff
/*0x824a*/  .byte 0x00
/*0x824b*/  .byte 0x75
/*0x824c*/  .byte 0x08
/*0x824d*/  .byte 0x95
/*0x824e*/  .byte 0x40
/*0x824f*/  .byte 0x91
/*0x8250*/  .byte 0x02
/*0x8251*/  .byte 0xc0
/*0x8252*/  .byte 0x00
/*0x8253*/  .byte 0x00
/*0x8254*/  .byte 0x05
/*0x8255*/  .byte 0x01
/*0x8256*/  .byte 0x09
/*0x8257*/  .byte 0x80
/*0x8258*/  .byte 0xa1
/*0x8259*/  .byte 0x01
/*0x825a*/  .byte 0x85
/*0x825b*/  .byte 0x01
/*0x825c*/  .byte 0x19
/*0x825d*/  .byte 0x81
/*0x825e*/  .byte 0x29
/*0x825f*/  .byte 0x83
/*0x8260*/  .byte 0x15
/*0x8261*/  .byte 0x00
/*0x8262*/  .byte 0x25
/*0x8263*/  .byte 0x01
/*0x8264*/  .byte 0x95
/*0x8265*/  .byte 0x03
/*0x8266*/  .byte 0x75
/*0x8267*/  .byte 0x01
/*0x8268*/  .byte 0x81
/*0x8269*/  .byte 0x02
/*0x826a*/  .byte 0x95
/*0x826b*/  .byte 0x01
/*0x826c*/  .byte 0x75
/*0x826d*/  .byte 0x05
/*0x826e*/  .byte 0x81
/*0x826f*/  .byte 0x01
/*0x8270*/  .byte 0xc0
/*0x8271*/  .byte 0x05
/*0x8272*/  .byte 0x0c
/*0x8273*/  .byte 0x09
/*0x8274*/  .byte 0x01
/*0x8275*/  .byte 0xa1
/*0x8276*/  .byte 0x01
/*0x8277*/  .byte 0x85
/*0x8278*/  .byte 0x02
/*0x8279*/  .byte 0x15
/*0x827a*/  .byte 0x00
/*0x827b*/  .byte 0x25
/*0x827c*/  .byte 0x01
/*0x827d*/  .byte 0x95
/*0x827e*/  .byte 0x12
/*0x827f*/  .byte 0x75
/*0x8280*/  .byte 0x01
/*0x8281*/  .byte 0x0a
/*0x8282*/  .byte 0x83
/*0x8283*/  .byte 0x01
/*0x8284*/  .byte 0x0a
/*0x8285*/  .byte 0x8a
/*0x8286*/  .byte 0x01
/*0x8287*/  .byte 0x0a
/*0x8288*/  .byte 0x92
/*0x8289*/  .byte 0x01
/*0x828a*/  .byte 0x0a
/*0x828b*/  .byte 0x94
/*0x828c*/  .byte 0x01
/*0x828d*/  .byte 0x09
/*0x828e*/  .byte 0xcd
/*0x828f*/  .byte 0x09
/*0x8290*/  .byte 0xb7
/*0x8291*/  .byte 0x09
/*0x8292*/  .byte 0xb6
/*0x8293*/  .byte 0x09
/*0x8294*/  .byte 0xb5
/*0x8295*/  .byte 0x09
/*0x8296*/  .byte 0xe2
/*0x8297*/  .byte 0x09
/*0x8298*/  .byte 0xea
/*0x8299*/  .byte 0x09
/*0x829a*/  .byte 0xe9
/*0x829b*/  .byte 0x0a
/*0x829c*/  .byte 0x21
/*0x829d*/  .byte 0x02
/*0x829e*/  .byte 0x0a
/*0x829f*/  .byte 0x23
/*0x82a0*/  .byte 0x02
/*0x82a1*/  .byte 0x0a
/*0x82a2*/  .byte 0x24
/*0x82a3*/  .byte 0x02
/*0x82a4*/  .byte 0x0a
/*0x82a5*/  .byte 0x25
/*0x82a6*/  .byte 0x02
/*0x82a7*/  .byte 0x0a
/*0x82a8*/  .byte 0x26
/*0x82a9*/  .byte 0x02
/*0x82aa*/  .byte 0x0a
/*0x82ab*/  .byte 0x27
/*0x82ac*/  .byte 0x02
/*0x82ad*/  .byte 0x0a
/*0x82ae*/  .byte 0x2a
/*0x82af*/  .byte 0x02
/*0x82b0*/  .byte 0x81
/*0x82b1*/  .byte 0x02
/*0x82b2*/  .byte 0x95
/*0x82b3*/  .byte 0x01
/*0x82b4*/  .byte 0x75
/*0x82b5*/  .byte 0x0e
/*0x82b6*/  .byte 0x81
/*0x82b7*/  .byte 0x01
/*0x82b8*/  .byte 0xc0
/*0x82b9*/  .byte 0x05
/*0x82ba*/  .byte 0x01
/*0x82bb*/  .byte 0x09
/*0x82bc*/  .byte 0x06
/*0x82bd*/  .byte 0xa1
/*0x82be*/  .byte 0x01
/*0x82bf*/  .byte 0x85
/*0x82c0*/  .byte 0x04
/*0x82c1*/  .byte 0x05
/*0x82c2*/  .byte 0x07
/*0x82c3*/  .byte 0x95
/*0x82c4*/  .byte 0x01
/*0x82c5*/  .byte 0x75
/*0x82c6*/  .byte 0x08
/*0x82c7*/  .byte 0x81
/*0x82c8*/  .byte 0x03
/*0x82c9*/  .byte 0x95
/*0x82ca*/  .byte 0xe8
/*0x82cb*/  .byte 0x75
/*0x82cc*/  .byte 0x01
/*0x82cd*/  .byte 0x15
/*0x82ce*/  .byte 0x00
/*0x82cf*/  .byte 0x25
/*0x82d0*/  .byte 0x01
/*0x82d1*/  .byte 0x05
/*0x82d2*/  .byte 0x07
/*0x82d3*/  .byte 0x19
/*0x82d4*/  .byte 0x00
/*0x82d5*/  .byte 0x29
/*0x82d6*/  .byte 0xe7
/*0x82d7*/  .byte 0x81
/*0x82d8*/  .byte 0x00
/*0x82d9*/  .byte 0xc0
/*0x82da*/  .byte 0x00
/*0x82db*/  .byte 0x00
/*0x82dc*/  .byte 0x05
/*0x82dd*/  .byte 0x01
/*0x82de*/  .byte 0x09
/*0x82df*/  .byte 0x06
/*0x82e0*/  .byte 0xa1
/*0x82e1*/  .byte 0x01
/*0x82e2*/  .byte 0x05
/*0x82e3*/  .byte 0x07
/*0x82e4*/  .byte 0x19
/*0x82e5*/  .byte 0xe0
/*0x82e6*/  .byte 0x29
/*0x82e7*/  .byte 0xe7
/*0x82e8*/  .byte 0x15
/*0x82e9*/  .byte 0x00
/*0x82ea*/  .byte 0x25
/*0x82eb*/  .byte 0x01
/*0x82ec*/  .byte 0x75
/*0x82ed*/  .byte 0x01
/*0x82ee*/  .byte 0x95
/*0x82ef*/  .byte 0x08
/*0x82f0*/  .byte 0x81
/*0x82f1*/  .byte 0x02
/*0x82f2*/  .byte 0x95
/*0x82f3*/  .byte 0x01
/*0x82f4*/  .byte 0x75
/*0x82f5*/  .byte 0x08
/*0x82f6*/  .byte 0x81
/*0x82f7*/  .byte 0x03
/*0x82f8*/  .byte 0x95
/*0x82f9*/  .byte 0x03
/*0x82fa*/  .byte 0x75
/*0x82fb*/  .byte 0x01
/*0x82fc*/  .byte 0x05
/*0x82fd*/  .byte 0x08
/*0x82fe*/  .byte 0x19
/*0x82ff*/  .byte 0x01
/*0x8300*/  .byte 0x29
/*0x8301*/  .byte 0x03
/*0x8302*/  .byte 0x91
/*0x8303*/  .byte 0x02
/*0x8304*/  .byte 0x95
/*0x8305*/  .byte 0x01
/*0x8306*/  .byte 0x75
/*0x8307*/  .byte 0x05
/*0x8308*/  .byte 0x91
/*0x8309*/  .byte 0x03
/*0x830a*/  .byte 0x95
/*0x830b*/  .byte 0x06
/*0x830c*/  .byte 0x75
/*0x830d*/  .byte 0x08
/*0x830e*/  .byte 0x15
/*0x830f*/  .byte 0x00
/*0x8310*/  .byte 0x26
/*0x8311*/  .byte 0xa4
/*0x8312*/  .byte 0x00
/*0x8313*/  .byte 0x05
/*0x8314*/  .byte 0x07
/*0x8315*/  .byte 0x19
/*0x8316*/  .byte 0x00
/*0x8317*/  .byte 0x29
/*0x8318*/  .byte 0xa4
/*0x8319*/  .byte 0x81
/*0x831a*/  .byte 0x00
/*0x831b*/  .byte 0xc0
/*0x831c*/  .byte 0x09
/*0x831d*/  .byte 0x02
/*0x831e*/  .byte 0x5b
/*0x831f*/  .byte 0x00
/*0x8320*/  .byte 0x03
/*0x8321*/  .byte 0x01
/*0x8322*/  .byte 0x00
/*0x8323*/  .byte 0xa0
/*0x8324*/  .byte 0x32
/*0x8325*/  .byte 0x09
/*0x8326*/  .byte 0x04
/*0x8327*/  .byte 0x00
/*0x8328*/  .byte 0x00
/*0x8329*/  .byte 0x01
/*0x832a*/  .byte 0x03
/*0x832b*/  .byte 0x01
/*0x832c*/  .byte 0x01
/*0x832d*/  .byte 0x00
/*0x832e*/  .byte 0x09
/*0x832f*/  .byte 0x21
/*0x8330*/  .byte 0x11
/*0x8331*/  .byte 0x01
/*0x8332*/  .byte 0x00
/*0x8333*/  .byte 0x01
/*0x8334*/  .byte 0x22
/*0x8335*/  .byte 0x40
/*0x8336*/  .byte 0x00
/*0x8337*/  .byte 0x07
/*0x8338*/  .byte 0x05
/*0x8339*/  .byte 0x81
/*0x833a*/  .byte 0x03
/*0x833b*/  .byte 0x08
/*0x833c*/  .byte 0x00
/*0x833d*/  .byte 0x01
/*0x833e*/  .byte 0x09
/*0x833f*/  .byte 0x04
/*0x8340*/  .byte 0x01
/*0x8341*/  .byte 0x00
/*0x8342*/  .byte 0x02
/*0x8343*/  .byte 0x03
/*0x8344*/  .byte 0x00
/*0x8345*/  .byte 0x00
/*0x8346*/  .byte 0x00
/*0x8347*/  .byte 0x09
/*0x8348*/  .byte 0x21
/*0x8349*/  .byte 0x11
/*0x834a*/  .byte 0x01
/*0x834b*/  .byte 0x00
/*0x834c*/  .byte 0x01
/*0x834d*/  .byte 0x22
/*0x834e*/  .byte 0x22
/*0x834f*/  .byte 0x00
/*0x8350*/  .byte 0x07
/*0x8351*/  .byte 0x05
/*0x8352*/  .byte 0x83
/*0x8353*/  .byte 0x03
/*0x8354*/  .byte 0x40
/*0x8355*/  .byte 0x00
/*0x8356*/  .byte 0x01
/*0x8357*/  .byte 0x07
/*0x8358*/  .byte 0x05
/*0x8359*/  .byte 0x04
/*0x835a*/  .byte 0x03
/*0x835b*/  .byte 0x40
/*0x835c*/  .byte 0x00
/*0x835d*/  .byte 0x01
/*0x835e*/  .byte 0x09
/*0x835f*/  .byte 0x04
/*0x8360*/  .byte 0x02
/*0x8361*/  .byte 0x00
/*0x8362*/  .byte 0x01
/*0x8363*/  .byte 0x03
/*0x8364*/  .byte 0x00
/*0x8365*/  .byte 0x00
/*0x8366*/  .byte 0x00
/*0x8367*/  .byte 0x09
/*0x8368*/  .byte 0x21
/*0x8369*/  .byte 0x11
/*0x836a*/  .byte 0x01
/*0x836b*/  .byte 0x00
/*0x836c*/  .byte 0x01
/*0x836d*/  .byte 0x22
/*0x836e*/  .byte 0x86
/*0x836f*/  .byte 0x00
/*0x8370*/  .byte 0x07
/*0x8371*/  .byte 0x05
/*0x8372*/  .byte 0x82
/*0x8373*/  .byte 0x03
/*0x8374*/  .byte 0x40
/*0x8375*/  .byte 0x00
/*0x8376*/  .byte 0x01
/*0x8377*/  .byte 0x00
/*0x8378*/  .byte 0x12
/*0x8379*/  .byte 0x01
/*0x837a*/  .byte 0x10
/*0x837b*/  .byte 0x01
/*0x837c*/  .byte 0x00
/*0x837d*/  .byte 0x00
/*0x837e*/  .byte 0x00
/*0x837f*/  .byte 0x40
/*0x8380*/  .byte 0xd9
/*0x8381*/  .byte 0x04
/*0x8382*/  .byte 0x75
/*0x8383*/  .byte 0x01
/*0x8384*/  .byte 0x04
/*0x8385*/  .byte 0x11
/*0x8386*/  .byte 0x00
/*0x8387*/  .byte 0x01
/*0x8388*/  .byte 0x00
/*0x8389*/  .byte 0x01
/*0x838a*/  .byte 0x00
/*0x838b*/  .byte 0x00
/*0x838c*/  .byte 0x04
/*0x838d*/  .byte 0x03
/*0x838e*/  .byte 0x09
/*0x838f*/  .byte 0x04
/*0x8390*/  .byte 0x22
/*0x8391*/  .byte 0x03
/*0x8392*/  .byte 0x55
/*0x8393*/  .byte 0x00
/*0x8394*/  .byte 0x53
/*0x8395*/  .byte 0x00
/*0x8396*/  .byte 0x42
/*0x8397*/  .byte 0x00
/*0x8398*/  .byte 0x2d
/*0x8399*/  .byte 0x00
/*0x839a*/  .byte 0x48
/*0x839b*/  .byte 0x00
/*0x839c*/  .byte 0x49
/*0x839d*/  .byte 0x00
/*0x839e*/  .byte 0x44
/*0x839f*/  .byte 0x00
/*0x83a0*/  .byte 0x20
/*0x83a1*/  .byte 0x00
/*0x83a2*/  .byte 0x4b
/*0x83a3*/  .byte 0x00
/*0x83a4*/  .byte 0x65
/*0x83a5*/  .byte 0x00
/*0x83a6*/  .byte 0x79
/*0x83a7*/  .byte 0x00
/*0x83a8*/  .byte 0x62
/*0x83a9*/  .byte 0x00
/*0x83aa*/  .byte 0x6f
/*0x83ab*/  .byte 0x00
/*0x83ac*/  .byte 0x61
/*0x83ad*/  .byte 0x00
/*0x83ae*/  .byte 0x72
/*0x83af*/  .byte 0x00
/*0x83b0*/  .byte 0x64
/*0x83b1*/  .byte 0x00
/*0x83b2*/  .byte 0x00
/*0x83b3*/  .byte 0x00
/*0x83b4*/  .byte 0xa5
/*0x83b5*/  .byte 0x68
/*0x83b6*/  .byte 0x00
/*0x83b7*/  .byte 0x00
/*0x83b8*/  .byte 0x00
/*0x83b9*/  .byte 0x00
/*0x83ba*/  .byte 0x00
/*0x83bb*/  .byte 0x00
/*0x83bc*/  .byte 0x31
/*0x83bd*/  .byte 0x77
/*0x83be*/  .byte 0x00
/*0x83bf*/  .byte 0x00
/*0x83c0*/  .byte 0x00
/*0x83c1*/  .byte 0x00
/*0x83c2*/  .byte 0x00
/*0x83c3*/  .byte 0x00
/*0x83c4*/  .byte 0x00
/*0x83c5*/  .byte 0x00
/*0x83c6*/  .byte 0x00
/*0x83c7*/  .byte 0x00
/*0x83c8*/  .byte 0x31
/*0x83c9*/  .byte 0x76
/*0x83ca*/  .byte 0x00
/*0x83cb*/  .byte 0x00
/*0x83cc*/  .byte 0x25
/*0x83cd*/  .byte 0x75
/*0x83ce*/  .byte 0x00
/*0x83cf*/  .byte 0x00
/*0x83d0*/  .byte 0xff
/*0x83d1*/  .byte 0xff
/*0x83d2*/  .byte 0xff
/*0x83d3*/  .byte 0x08
/*0x83d4*/  .byte 0x03
/*0x83d5*/  .byte 0x00
/*0x83d6*/  .byte 0x00
/*0x83d7*/  .byte 0x00
/*0x83d8*/  .byte 0xf8
/*0x83d9*/  .byte 0x83
/*0x83da*/  .byte 0x00
/*0x83db*/  .byte 0x00
/*0x83dc*/  .byte 0x00
/*0x83dd*/  .byte 0x00
/*0x83de*/  .byte 0x00
/*0x83df*/  .byte 0x20
/*0x83e0*/  .byte 0x74
/*0x83e1*/  .byte 0x00
/*0x83e2*/  .byte 0x00
/*0x83e3*/  .byte 0x00
/*0x83e4*/  .byte 0xc4
/*0x83e5*/  .byte 0x7a
/*0x83e6*/  .byte 0x00
/*0x83e7*/  .byte 0x00
/*0x83e8*/  .byte 0x6c
/*0x83e9*/  .byte 0x84
/*0x83ea*/  .byte 0x00
/*0x83eb*/  .byte 0x00
/*0x83ec*/  .byte 0x74
/*0x83ed*/  .byte 0x00
/*0x83ee*/  .byte 0x00
/*0x83ef*/  .byte 0x20
/*0x83f0*/  .byte 0x0c
/*0x83f1*/  .byte 0x21
/*0x83f2*/  .byte 0x00
/*0x83f3*/  .byte 0x00
/*0x83f4*/  .byte 0xd4
/*0x83f5*/  .byte 0x7a
/*0x83f6*/  .byte 0x00
/*0x83f7*/  .byte 0x00
/*0x83f8*/  .byte 0x00
/*0x83f9*/  .byte 0x00
/*0x83fa*/  .byte 0x00
/*0x83fb*/  .byte 0x00
/*0x83fc*/  .byte 0x00
/*0x83fd*/  .byte 0x00
/*0x83fe*/  .byte 0x00
/*0x83ff*/  .byte 0x00
/*0x8400*/  .byte 0x00
/*0x8401*/  .byte 0x00
/*0x8402*/  .byte 0x00
/*0x8403*/  .byte 0x00
/*0x8404*/  .byte 0x00
/*0x8405*/  .byte 0x00
/*0x8406*/  .byte 0x00
/*0x8407*/  .byte 0x00
/*0x8408*/  .byte 0x00
/*0x8409*/  .byte 0x00
/*0x840a*/  .byte 0x00
/*0x840b*/  .byte 0x00
/*0x840c*/  .byte 0x00
/*0x840d*/  .byte 0x00
/*0x840e*/  .byte 0x00
/*0x840f*/  .byte 0x00
/*0x8410*/  .byte 0x00
/*0x8411*/  .byte 0xa2
/*0x8412*/  .byte 0x4a
/*0x8413*/  .byte 0x04
/*0x8414*/  .byte 0x01
/*0x8415*/  .byte 0x00
/*0x8416*/  .byte 0x00
/*0x8417*/  .byte 0x00
/*0x8418*/  .byte 0x00
/*0x8419*/  .byte 0x00
/*0x841a*/  .byte 0x00
/*0x841b*/  .byte 0x00
/*0x841c*/  .byte 0x00
/*0x841d*/  .byte 0x00
/*0x841e*/  .byte 0xff
/*0x841f*/  .byte 0x07
/*0x8420*/  .byte 0x00
/*0x8421*/  .byte 0x00
/*0x8422*/  .byte 0x00
/*0x8423*/  .byte 0xff
/*0x8424*/  .byte 0x00
/*0x8425*/  .byte 0x00
/*0x8426*/  .byte 0x00
/*0x8427*/  .byte 0x00
/*0x8428*/  .byte 0x00
/*0x8429*/  .byte 0x00
/*0x842a*/  .byte 0x00
/*0x842b*/  .byte 0x00
/*0x842c*/  .byte 0x00
/*0x842d*/  .byte 0x00
/*0x842e*/  .byte 0x00
/*0x842f*/  .byte 0x00
/*0x8430*/  .byte 0x00
/*0x8431*/  .byte 0x00
/*0x8432*/  .byte 0x00
/*0x8433*/  .byte 0x00
/*0x8434*/  .byte 0x00
/*0x8435*/  .byte 0x00
/*0x8436*/  .byte 0x00
/*0x8437*/  .byte 0x00
/*0x8438*/  .byte 0x00
/*0x8439*/  .byte 0x00
/*0x843a*/  .byte 0x00
/*0x843b*/  .byte 0x00
/*0x843c*/  .byte 0x01
/*0x843d*/  .byte 0x00
/*0x843e*/  .byte 0x00
/*0x843f*/  .byte 0x00
/*0x8440*/  .byte 0x00
/*0x8441*/  .byte 0x00
/*0x8442*/  .byte 0x00
/*0x8443*/  .byte 0x00
/*0x8444*/  .byte 0x00
/*0x8445*/  .byte 0x00
/*0x8446*/  .byte 0x00
/*0x8447*/  .byte 0x00
/*0x8448*/  .byte 0x00
/*0x8449*/  .byte 0x00
/*0x844a*/  .byte 0x00
/*0x844b*/  .byte 0x00
/*0x844c*/  .byte 0x00
/*0x844d*/  .byte 0x00
/*0x844e*/  .byte 0x00
/*0x844f*/  .byte 0x00
/*0x8450*/  .byte 0x00
/*0x8451*/  .byte 0x00
/*0x8452*/  .byte 0x00
/*0x8453*/  .byte 0x00
/*0x8454*/  .byte 0x00
/*0x8455*/  .byte 0x00
/*0x8456*/  .byte 0x00
/*0x8457*/  .byte 0x00
/*0x8458*/  .byte 0x00
/*0x8459*/  .byte 0x00
/*0x845a*/  .byte 0x00
/*0x845b*/  .byte 0x00
/*0x845c*/  .byte 0x6a
/*0x845d*/  .byte 0x09
/*0x845e*/  .byte 0x00
/*0x845f*/  .byte 0x20
/*0x8460*/  .byte 0x00
/*0x8461*/  .byte 0x00
/*0x8462*/  .byte 0x00
/*0x8463*/  .byte 0x00
/*0x8464*/  .byte 0x00
/*0x8465*/  .byte 0x00
/*0x8466*/  .byte 0x00
/*0x8467*/  .byte 0x00
/*0x8468*/  .byte 0x00
/*0x8469*/  .byte 0x00
/*0x846a*/  .byte 0x00
/*0x846b*/  .byte 0x00
