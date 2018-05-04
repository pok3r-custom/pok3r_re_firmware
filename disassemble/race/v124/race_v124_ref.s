.syntax unified
.cpu cortex-m3
.text
.thumb

/*0x3400*/  .byte 0xe0
/*0x3401*/  .byte 0x3f
/*0x3402*/  .byte 0x00
/*0x3403*/  .byte 0x20

/*0x3404*/  .word reset
/*0x3408*/  .word nmi
/*0x340c*/  .word hard_fault
/*0x3410*/  .word mmu_fault
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

/*0x342c*/  .word scvcall_intr
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
/*0x3554*/      ldr r0, [pc, #0x18] /* data_3570 */
/*0x3556*/      blx r0 /* call_378c */
/*0x3558*/      ldr r0, [pc, #0x18] /* data_3574 */
/*0x355a*/      bx r0 /* jump_3578 */

            .thumb_func
            nmi:
/*0x355c*/      b nmi

            .thumb_func
            hard_fault:
/*0x355e*/      b hard_fault

            .thumb_func
            mmu_fault:
/*0x3560*/      b mmu_fault

            .thumb_func
            bus_fault:
/*0x3562*/      b bus_fault

            .thumb_func
            usage_fault:
/*0x3564*/      b usage_fault

            .thumb_func
            scvcall_intr:
/*0x3566*/      b scvcall_intr

            .thumb_func
            debug_intr:
/*0x3568*/      b debug_intr

            .thumb_func
            pendsv_intr:
/*0x356a*/      b pendsv_intr

            .thumb_func
            systick_intr:
/*0x356c*/      b systick_intr

            .thumb_func
            generic_intr:
/*0x356e*/      b generic_intr

            data_3570:
/*0x3570*/  .word call_378c
            data_3574:
/*0x3574*/  .word jump_3578


            .thumb_func
            jump_3578:
/*0x3578*/      ldr.w sp, [pc, #0xc] /* data_3588 */
/*0x357c*/      bl call_3614

            .thumb_func
            call_3580:
/*0x3580*/      ldr r0, [pc, #0] /* data_3584 */
/*0x3582*/      bx r0 /* jump_78b8 */

            data_3584:
/*0x3584*/  .word jump_78b8
            data_3588:
/*0x3588*/  .word 0x20003fe0


            .thumb_func
            call_358c:
/*0x358c*/      ldr r1, [pc, #0x18] /* data_35a8 */
/*0x358e*/      ldr r2, [pc, #0x1c] /* data_35ac */
/*0x3590*/      ldr r0, [r1]
/*0x3592*/      muls r0, r2, r0
/*0x3594*/      movw r2, #0x3039
/*0x3598*/      add r0, r2
/*0x359a*/      str r0, [r1]
/*0x359c*/      lsrs r0, r0, #1
/*0x359e*/      bx lr

            .thumb_func
            loc_35a0:
/*0x35a0*/      ldr r1, [pc, #4] /* data_35a8 */
/*0x35a2*/      str r0, [r1]
/*0x35a4*/      bx lr

/*0x35a6*/  .byte 0x00
/*0x35a7*/  .byte 0x00

            data_35a8:
/*0x35a8*/  .word 0x2000000c
            data_35ac:
/*0x35ac*/  .word 0x41c64e6d


            .thumb_func
            call_35b0:
/*0x35b0*/      orr.w r3, r0, r1
/*0x35b4*/      lsls r3, r3, #0x1e
/*0x35b6*/      beq jump_35c0
/*0x35b8*/      b jump_35ce
            jump_35ba:
/*0x35ba*/      ldm r1!, {r3}
/*0x35bc*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x35be*/      stm r0!, {r3}
            jump_35c0:
/*0x35c0*/      cmp r2, #4
/*0x35c2*/      bhs jump_35ba
/*0x35c4*/      b jump_35ce
            jump_35c6:
/*0x35c6*/      ldrb r3, [r1], #1
/*0x35ca*/      strb r3, [r0], #1
            jump_35ce:
/*0x35ce*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x35d0*/      bhs jump_35c6
/*0x35d2*/      bx lr

            .thumb_func
            call_35d4:
/*0x35d4*/      uxtb r2, r2
/*0x35d6*/      b jump_35dc
            jump_35d8:
/*0x35d8*/      strb r2, [r0], #1
            jump_35dc:
/*0x35dc*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x35de*/      bhs jump_35d8
/*0x35e0*/      bx lr

            .thumb_func
            call_35e2:
/*0x35e2*/      movs r2, #0
/*0x35e4*/      b call_35d4

            .thumb_func
            loc_35e6:
/*0x35e6*/      push {r4, lr}
/*0x35e8*/      mov r3, r2
/*0x35ea*/      mov r2, r1
/*0x35ec*/      mov r4, r0
/*0x35ee*/      mov r1, r3
/*0x35f0*/      bl call_35d4
/*0x35f4*/      mov r0, r4
/*0x35f6*/      pop {r4, pc}

            .thumb_func
            call_35f8:
/*0x35f8*/      push {r4, r5, lr}
/*0x35fa*/      mov r4, r0
/*0x35fc*/      movs r0, #0
/*0x35fe*/      mov r3, r0
/*0x3600*/      b jump_3604
            jump_3602:
/*0x3602*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_3604:
/*0x3604*/      cmp r3, r2
/*0x3606*/      bhs jump_3610
/*0x3608*/      ldrb r0, [r4, r3]
/*0x360a*/      ldrb r5, [r1, r3]
/*0x360c*/      subs r0, r0, r5
/*0x360e*/      beq jump_3602
            jump_3610:
/*0x3610*/      pop {r4, r5, pc}

/*0x3612*/  .byte 0x00
/*0x3613*/  .byte 0x00


            .thumb_func
            call_3614:
/*0x3614*/      ldr r4, [pc, #0x18] /* data_3630 */
/*0x3616*/      ldr r5, [pc, #0x1c] /* data_3634 */
/*0x3618*/      b jump_3628
            jump_361a:
/*0x361a*/      ldr r0, [r4, #0xc]
/*0x361c*/      orr r3, r0, #1
/*0x3620*/      ldm.w r4, {r0, r1, r2}
/*0x3624*/      blx r3
/*0x3626*/      adds r4, #0x10
            jump_3628:
/*0x3628*/      cmp r4, r5
/*0x362a*/      blo jump_361a
/*0x362c*/      bl call_3580
            data_3630:
/*0x3630*/      strh r4, [r5, #0x14]
/*0x3632*/      movs r0, r0
            data_3634:
/*0x3634*/      strh r4, [r1, #0x16]
/*0x3636*/      movs r0, r0

            .thumb_func
            bftm0_intr:
/*0x3638*/      push {r4, lr}
/*0x363a*/      ldr r0, [pc, #0x60] /* data_369c */
/*0x363c*/      bl call_374c
/*0x3640*/      bl call_6284
/*0x3644*/      ldr r0, [pc, #0x58] /* data_36a0 */
/*0x3646*/      ldrh r1, [r0]
/*0x3648*/      cbz r1, jump_3650
/*0x364a*/      ldrh r1, [r0]
/*0x364c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x364e*/      strh r1, [r0]
            jump_3650:
/*0x3650*/      ldr r0, [pc, #0x50] /* data_36a4 */
/*0x3652*/      ldrh r1, [r0]
/*0x3654*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3656*/      strh r1, [r0]
/*0x3658*/      ldr r0, [pc, #0x4c] /* data_36a8 */
/*0x365a*/      ldr r1, [r0]
/*0x365c*/      cbz r1, jump_3664
/*0x365e*/      ldr r1, [r0]
/*0x3660*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3662*/      str r1, [r0]
            jump_3664:
/*0x3664*/      ldr r0, [pc, #0x44] /* data_36ac */
/*0x3666*/      ldr r1, [r0]
/*0x3668*/      cbz r1, jump_3670
/*0x366a*/      ldr r1, [r0]
/*0x366c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x366e*/      str r1, [r0]
            jump_3670:
/*0x3670*/      ldr r0, [pc, #0x3c] /* data_36b0 */
/*0x3672*/      ldrb r1, [r0]
/*0x3674*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3676*/      strb r1, [r0]
/*0x3678*/      ldr r1, [pc, #0x38] /* data_36b4 */
/*0x367a*/      ldrh r0, [r1]
/*0x367c*/      cmp r0, #1
/*0x367e*/      bls jump_3684
/*0x3680*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3682*/      strh r0, [r1]
            jump_3684:
/*0x3684*/      ldr r0, [pc, #0x30] /* data_36b8 */
/*0x3686*/      ldrh r1, [r0]
/*0x3688*/      cmp r1, #0
/*0x368a*/      beq jump_369a
/*0x368c*/      ldrh r1, [r0]
/*0x368e*/      cmp.w r1, #0xff00
/*0x3692*/      bhs jump_369a
/*0x3694*/      ldrh r1, [r0]
/*0x3696*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3698*/      strh r1, [r0]
            jump_369a:
/*0x369a*/      pop {r4, pc}

            data_369c:
/*0x369c*/  .word 0x40076000
            data_36a0:
/*0x36a0*/  .word 0x2000083e
            data_36a4:
/*0x36a4*/  .word 0x2000008e
            data_36a8:
/*0x36a8*/  .word 0x20000088
            data_36ac:
/*0x36ac*/  .word 0x20001ba0
            data_36b0:
/*0x36b0*/  .word 0x2000076d
            data_36b4:
/*0x36b4*/  .word 0x20000014
            data_36b8:
/*0x36b8*/  .word 0x200001b6


            .thumb_func
            bftm1_intr:
/*0x36bc*/      push {r4, r5, r6, lr}
/*0x36be*/      ldr r6, [pc, #0x74] /* data_3734 */
/*0x36c0*/      movs r5, #2
/*0x36c2*/      str r5, [r6, #0x24]
/*0x36c4*/      movs r0, #0xa
/*0x36c6*/      bl call_37b8
/*0x36ca*/      movs r0, #2
/*0x36cc*/      bl call_6fe4
/*0x36d0*/      ldr r1, [pc, #0x64] /* data_3738 */
/*0x36d2*/      lsls r0, r5, #0xe
/*0x36d4*/      str r0, [r1, #0x24]
/*0x36d6*/      ldr r4, [pc, #0x64] /* data_373c */
/*0x36d8*/      ldr r1, [pc, #0x64] /* data_3740 */
/*0x36da*/      ldrb r0, [r4, #1]
/*0x36dc*/      strb r0, [r1, #1]
/*0x36de*/      lsls r1, r0, #0x1f
/*0x36e0*/      beq jump_3716
/*0x36e2*/      movs r1, #0
            jump_36e4:
/*0x36e4*/      movs r2, #0x10
/*0x36e6*/      lsls r2, r1
/*0x36e8*/      ldr r1, [pc, #0x58] /* data_3744 */
/*0x36ea*/      str r2, [r1, #0x24]
/*0x36ec*/      mvn.w r2, r0, lsl #30
/*0x36f0*/      lsrs r2, r2, #0x1f
/*0x36f2*/      lsls r3, r2, #4
/*0x36f4*/      movs r2, #0x20
/*0x36f6*/      lsls r2, r3
/*0x36f8*/      str r2, [r1, #0x24]
/*0x36fa*/      mvn.w r2, r0, lsl #29
/*0x36fe*/      lsrs r2, r2, #0x1f
/*0x3700*/      lsls r3, r2, #4
/*0x3702*/      movs r2, #0x40
/*0x3704*/      lsls r2, r3
/*0x3706*/      str r2, [r1, #0x24]
/*0x3708*/      str r5, [r6, #0x28]
/*0x370a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x370c*/      ands r0, r0, #7
/*0x3710*/      strb r0, [r4, #1]
/*0x3712*/      beq jump_371a
/*0x3714*/      b jump_3726
            jump_3716:
/*0x3716*/      movs r1, #0x10
/*0x3718*/      b jump_36e4
            jump_371a:
/*0x371a*/      ldrb r0, [r4]
/*0x371c*/      cbz r0, jump_3726
/*0x371e*/      bl call_63d4
/*0x3722*/      movs r0, #0
/*0x3724*/      strb r0, [r4]
            jump_3726:
/*0x3726*/      bl call_65ec
/*0x372a*/      pop.w {r4, r5, r6, lr}
/*0x372e*/      ldr r0, [pc, #0x18] /* data_3748 */
/*0x3730*/      b.w call_374c

            data_3734:
/*0x3734*/  .word 0x400b2000
            data_3738:
/*0x3738*/  .word 0x400b0000
            data_373c:
/*0x373c*/  .word 0x20000348
            data_3740:
/*0x3740*/  .word 0x20000004
            data_3744:
/*0x3744*/  .word 0x400b4000
            data_3748:
/*0x3748*/  .word 0x40077000


            .thumb_func
            call_374c:
/*0x374c*/      ldr r1, [r0, #4]
/*0x374e*/      bic r1, r1, #1
/*0x3752*/      str r1, [r0, #4]
/*0x3754*/      dsb sy
/*0x3758*/      bx lr

            .thumb_func
            call_375a:
/*0x375a*/      cmp r1, #0
/*0x375c*/      ldr r1, [r0]
/*0x375e*/      beq jump_3766
/*0x3760*/      orr r1, r1, #4
/*0x3764*/      b jump_376a
            jump_3766:
/*0x3766*/      bic r1, r1, #4
            jump_376a:
/*0x376a*/      str r1, [r0]
/*0x376c*/      bx lr

            .thumb_func
            call_376e:
/*0x376e*/      cmp r1, #0
/*0x3770*/      ldr r1, [r0]
/*0x3772*/      beq jump_377a
/*0x3774*/      orr r1, r1, #1
/*0x3778*/      b jump_377e
            jump_377a:
/*0x377a*/      bic r1, r1, #1
            jump_377e:
/*0x377e*/      str r1, [r0]
/*0x3780*/      bx lr

            .thumb_func
            call_3782:
/*0x3782*/      str r1, [r0, #0xc]
/*0x3784*/      bx lr

            .thumb_func
            call_3786:
/*0x3786*/      str r1, [r0, #8]
/*0x3788*/      bx lr

/*0x378a*/  .byte 0x00
/*0x378b*/  .byte 0x00


            .thumb_func
            call_378c:
/*0x378c*/      ldr r1, [pc, #0x18] /* data_37a8 */
/*0x378e*/      movs r0, #0x10
/*0x3790*/      str.w r0, [r1, #0x10c]
/*0x3794*/      ldr r0, [pc, #0x14] /* data_37ac */
/*0x3796*/      movw r1, #0x5fff
/*0x379a*/      str r1, [r0, #8]
/*0x379c*/      ldr r1, [pc, #0x10] /* data_37b0 */
/*0x379e*/      str r1, [r0, #4]
/*0x37a0*/      ldr r1, [pc, #0x10] /* data_37b4 */
/*0x37a2*/      str r1, [r0]
/*0x37a4*/      bx lr

/*0x37a6*/  .byte 0x00
/*0x37a7*/  .byte 0x00

            data_37a8:
/*0x37a8*/  .word 0x40088000
            data_37ac:
/*0x37ac*/  .word 0x40068000
            data_37b0:
/*0x37b0*/  .word 0x0001a7d0
            data_37b4:
/*0x37b4*/  .word 0x5fa00001


            .thumb_func
            call_37b8:
/*0x37b8*/      add.w r0, r0, r0, lsl #2
/*0x37bc*/      lsls r0, r0, #2
            jump_37be:
/*0x37be*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x37c0*/      bhs jump_37be
/*0x37c2*/      bx lr

            .thumb_func
            call_37c4:
/*0x37c4*/      ldr r1, [pc, #8] /* data_37d0 */
/*0x37c6*/      movw r0, #0xeae0
/*0x37ca*/      str r0, [r1, #0x58]
/*0x37cc*/      bx lr

/*0x37ce*/  .byte 0x00
/*0x37cf*/  .byte 0x00

            data_37d0:
/*0x37d0*/  .word 0x40024000

            jump_37d4:
/*0x37d4*/      ldr r0, [pc, #0xc] /* data_37e4 */
/*0x37d6*/      ldr r2, [r0, #0x50]
/*0x37d8*/      movw r1, #0xeae0
/*0x37dc*/      bics r2, r1
/*0x37de*/      str r2, [r0, #0x50]
/*0x37e0*/      str r1, [r0, #0x58]
/*0x37e2*/      bx lr

            data_37e4:
/*0x37e4*/  .word 0x40024000


            .thumb_func
            call_37e8:
/*0x37e8*/      ldr r0, [pc, #0xc] /* data_37f8 */
/*0x37ea*/      movw r1, #0xeae0
/*0x37ee*/      str r1, [r0, #0x58]
/*0x37f0*/      ldr r2, [r0, #0x50]
/*0x37f2*/      orrs r2, r1
/*0x37f4*/      str r2, [r0, #0x50]
/*0x37f6*/      bx lr

            data_37f8:
/*0x37f8*/  .word 0x40024000


            .thumb_func
            call_37fc:
/*0x37fc*/      ldr r0, [pc, #8] /* data_3808 */
/*0x37fe*/      ldr r0, [r0, #0x58]
/*0x3800*/      movw r1, #0xeae0
/*0x3804*/      ands r0, r1
/*0x3806*/      bx lr

            data_3808:
/*0x3808*/  .word 0x40024000


            .thumb_func
            call_380c:
/*0x380c*/      ldr r1, [pc, #8] /* data_3818 */
/*0x380e*/      ldr r0, [pc, #4] /* data_3814 */
/*0x3810*/      str r0, [r1]
/*0x3812*/      bx lr

            data_3814:
/*0x3814*/  .word 0x5fa00001
            data_3818:
/*0x3818*/  .word 0x40068000


            .thumb_func
            call_381c:
/*0x381c*/      push {r4, lr}
/*0x381e*/      movs r2, #0
/*0x3820*/      mov.w r1, #0xc000
/*0x3824*/      mov.w r0, #0xf0000
/*0x3828*/      movs r3, #1
/*0x382a*/      bl call_3b5c
/*0x382e*/      ldr r0, [pc, #0x1c] /* data_384c */
/*0x3830*/      ldr r1, [r0, #4]
/*0x3832*/      bic r1, r1, #0x800
/*0x3836*/      str r1, [r0, #4]
/*0x3838*/      ldr r1, [r0, #8]
/*0x383a*/      bic r1, r1, #0x800
/*0x383e*/      str r1, [r0, #8]
/*0x3840*/      movs r1, #1
/*0x3842*/      pop.w {r4, lr}
/*0x3846*/      movs r0, #0xb
/*0x3848*/      b.w call_6c68

            data_384c:
/*0x384c*/  .word 0x400b0000


            .thumb_func
            call_3850:
/*0x3850*/      push {r4, r5, r6, lr}
/*0x3852*/      mov r6, r2
/*0x3854*/      mov r4, r1
/*0x3856*/      lsls r5, r0, #4
/*0x3858*/      b jump_386a
            jump_385a:
/*0x385a*/      lsls r0, r4, #0x1f
/*0x385c*/      beq jump_3866
/*0x385e*/      mov r1, r6
/*0x3860*/      mov r0, r5
/*0x3862*/      bl call_6c68
            jump_3866:
/*0x3866*/      lsrs r4, r4, #1
/*0x3868*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_386a:
/*0x386a*/      cmp r4, #0
/*0x386c*/      bne jump_385a
/*0x386e*/      pop {r4, r5, r6, pc}
            jump_3870:
/*0x3870*/      push {r4, r5, r6, lr}
/*0x3872*/      mov r4, r1
/*0x3874*/      mov r5, r0
/*0x3876*/      tst.w r1, #0xff
/*0x387a*/      beq jump_3886
/*0x387c*/      uxtb r1, r5
/*0x387e*/      mov r2, r4
/*0x3880*/      ldr r0, [pc, #0x1c] /* data_38a0 */
/*0x3882*/      bl call_6cda
            jump_3886:
/*0x3886*/      tst.w r4, #0xff00
/*0x388a*/      beq jump_389c
/*0x388c*/      lsrs r2, r4, #8
/*0x388e*/      uxtb r1, r5
/*0x3890*/      pop.w {r4, r5, r6, lr}
/*0x3894*/      ldr r0, [pc, #8] /* data_38a0 */
/*0x3896*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x3898*/      b.w call_6cda
            jump_389c:
/*0x389c*/      pop {r4, r5, r6, pc}

/*0x389e*/  .byte 0x00
/*0x389f*/  .byte 0x00

            data_38a0:
/*0x38a0*/  .word 0x40022000


            .thumb_func
            call_38a4:
/*0x38a4*/      push {r4, r5}
/*0x38a6*/      mov r3, r1
/*0x38a8*/      ldrb r2, [r0, #1]
/*0x38aa*/      movs r1, #1
/*0x38ac*/      lsls r1, r2
/*0x38ae*/      ldrb r4, [r0]
/*0x38b0*/      adds r2, r0, #2
/*0x38b2*/      mov r0, r4
/*0x38b4*/      pop {r4, r5}
/*0x38b6*/      b.w call_3904

            .thumb_func
            call_38ba:
/*0x38ba*/      push {r4, r5, r6, lr}
/*0x38bc*/      mov r6, r2
/*0x38be*/      mov r4, r1
/*0x38c0*/      mov r5, r0
/*0x38c2*/      b jump_38ce
            jump_38c4:
/*0x38c4*/      mov r0, r5
/*0x38c6*/      .short 0x1ded /* adds r5, r5, #7 */ 
/*0x38c8*/      mov r1, r6
/*0x38ca*/      bl call_38a4
            jump_38ce:
/*0x38ce*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x38d0*/      uxtb r4, r4
/*0x38d2*/      bhs jump_38c4
/*0x38d4*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_38d6:
/*0x38d6*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x38da*/      mov r7, r3
/*0x38dc*/      mov r8, r2
/*0x38de*/      mov r5, r1
/*0x38e0*/      mov r4, r0
/*0x38e2*/      movs r6, #1
/*0x38e4*/      b jump_38f8
            jump_38e6:
/*0x38e6*/      ldrb r0, [r4, #1]
/*0x38e8*/      mov r3, r7
/*0x38ea*/      lsl.w r1, r6, r0
/*0x38ee*/      ldrb r0, [r4]
/*0x38f0*/      mov r2, r8
/*0x38f2*/      bl call_3904
/*0x38f6*/      .short 0x1ca4 /* adds r4, r4, #2 */ 
            jump_38f8:
/*0x38f8*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x38fa*/      uxtb r5, r5
/*0x38fc*/      bhs jump_38e6
/*0x38fe*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x3902*/  .byte 0x00
/*0x3903*/  .byte 0x00


            .thumb_func
            call_3904:
/*0x3904*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3908*/      mov r6, r1
/*0x390a*/      ldr r1, [pc, #0xe4] /* data_39f0 */
/*0x390c*/      mov r8, r0
/*0x390e*/      mov r5, r2
/*0x3910*/      add.w r4, r1, r8, lsl #13
/*0x3914*/      mvns r7, r6
/*0x3916*/      cbz r3, jump_3936
/*0x3918*/      ldrb r0, [r5]
/*0x391a*/      cmp r0, #4
/*0x391c*/      bhs jump_3996
/*0x391e*/      ldr r0, [r4]
/*0x3920*/      ands r0, r7
/*0x3922*/      str r0, [r4]
/*0x3924*/      ldrb r2, [r5]
/*0x3926*/      mov r1, r6
/*0x3928*/      mov r0, r4
/*0x392a*/      bl call_6cb4
/*0x392e*/      ldr r0, [r4, #4]
/*0x3930*/      orrs r0, r6
/*0x3932*/      str r0, [r4, #4]
/*0x3934*/      b jump_39e2
            jump_3936:
/*0x3936*/      movs r2, #1
/*0x3938*/      mov r1, r6
/*0x393a*/      bl call_3850
/*0x393e*/      ldrb r0, [r5, #1]
/*0x3940*/      cmp r0, #4
/*0x3942*/      bhs jump_3956
/*0x3944*/      ldr r0, [r4]
/*0x3946*/      ands r0, r7
/*0x3948*/      str r0, [r4]
/*0x394a*/      ldrb r2, [r5, #1]
/*0x394c*/      mov r1, r6
/*0x394e*/      mov r0, r4
/*0x3950*/      bl call_6cb4
/*0x3954*/      b jump_3976
            jump_3956:
/*0x3956*/      lsls r0, r0, #0x1f
/*0x3958*/      beq jump_395e
/*0x395a*/      str r6, [r4, #0x28]
/*0x395c*/      b jump_3960
            jump_395e:
/*0x395e*/      str r6, [r4, #0x24]
            jump_3960:
/*0x3960*/      ldr r0, [r4, #0x10]
/*0x3962*/      ands r0, r7
/*0x3964*/      str r0, [r4, #0x10]
/*0x3966*/      movs r2, #0
/*0x3968*/      mov r1, r6
/*0x396a*/      mov r0, r4
/*0x396c*/      bl call_6cb4
/*0x3970*/      ldr r0, [r4]
/*0x3972*/      orrs r0, r6
/*0x3974*/      str r0, [r4]
            jump_3976:
/*0x3976*/      ldrb r0, [r5, #4]
/*0x3978*/      lsls r0, r0, #0x1e
/*0x397a*/      ldr r0, [r4, #4]
/*0x397c*/      bpl jump_398e
/*0x397e*/      orrs r0, r6
/*0x3980*/      str r0, [r4, #4]
/*0x3982*/      mov r1, r6
/*0x3984*/      mov r0, r8
/*0x3986*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x398a*/      b.w jump_3870
            jump_398e:
/*0x398e*/      ands r0, r7
/*0x3990*/      str r0, [r4, #4]
/*0x3992*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_3996:
/*0x3996*/      cmp r3, #2
/*0x3998*/      beq jump_39a0
/*0x399a*/      ldrb r0, [r5, #4]
/*0x399c*/      lsls r0, r0, #0x1d
/*0x399e*/      bpl jump_39ac
            jump_39a0:
/*0x39a0*/      ldrb r0, [r5, #4]
/*0x39a2*/      lsls r0, r0, #0x1f
/*0x39a4*/      beq jump_39aa
/*0x39a6*/      str r6, [r4, #0x24]
/*0x39a8*/      b jump_39ac
            jump_39aa:
/*0x39aa*/      str r6, [r4, #0x28]
            jump_39ac:
/*0x39ac*/      ldrb r0, [r5]
/*0x39ae*/      mvns r0, r0
/*0x39b0*/      lsls r0, r0, #0x1d
/*0x39b2*/      ldr r0, [r4, #0x10]
/*0x39b4*/      beq jump_39d0
/*0x39b6*/      orrs r0, r6
/*0x39b8*/      str r0, [r4, #0x10]
/*0x39ba*/      ldrb r2, [r5]
            jump_39bc:
/*0x39bc*/      mov r1, r6
/*0x39be*/      mov r0, r4
/*0x39c0*/      bl call_6cb4
/*0x39c4*/      ldrb r0, [r5]
/*0x39c6*/      lsls r0, r0, #0x1c
/*0x39c8*/      ldr r0, [r4, #4]
/*0x39ca*/      bpl jump_39d8
/*0x39cc*/      orrs r0, r6
/*0x39ce*/      b jump_39da
            jump_39d0:
/*0x39d0*/      ands r0, r7
/*0x39d2*/      str r0, [r4, #0x10]
/*0x39d4*/      movs r2, #0
/*0x39d6*/      b jump_39bc
            jump_39d8:
/*0x39d8*/      ands r0, r7
            jump_39da:
/*0x39da*/      str r0, [r4, #4]
/*0x39dc*/      ldr r0, [r4]
/*0x39de*/      orrs r0, r6
/*0x39e0*/      str r0, [r4]
            jump_39e2:
/*0x39e2*/      ldrb r2, [r5, #3]
/*0x39e4*/      mov r1, r6
/*0x39e6*/      mov r0, r8
/*0x39e8*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x39ec*/      b.w call_3850

            data_39f0:
/*0x39f0*/  .word 0x400b0000


            .thumb_func
            call_39f4:
/*0x39f4*/      ldr r1, [pc, #0x14] /* data_3a0c */
/*0x39f6*/      cmp r0, #1
/*0x39f8*/      ldr r0, [r1]
/*0x39fa*/      beq jump_3a04
/*0x39fc*/      bic r0, r0, #0x800
            jump_3a00:
/*0x3a00*/      str r0, [r1]
/*0x3a02*/      bx lr
            jump_3a04:
/*0x3a04*/      orr r0, r0, #0x800
/*0x3a08*/      b jump_3a00

/*0x3a0a*/  .byte 0x00
/*0x3a0b*/  .byte 0x00

            data_3a0c:
/*0x3a0c*/  .word 0x400a8000


            .thumb_func
            call_3a10:
/*0x3a10*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3a14*/      mov r7, r1
/*0x3a16*/      mov r5, r0
/*0x3a18*/      adds r1, r0, #1
/*0x3a1a*/      mov r6, r2
/*0x3a1c*/      ldr r0, [pc, #0x48] /* data_3a68 */
/*0x3a1e*/      bl call_3abc
/*0x3a22*/      mov r4, r0
/*0x3a24*/      cbz r6, jump_3a54
/*0x3a26*/      ldr r0, [r4, #0xc]
/*0x3a28*/      ldr r1, [r4, #0x10]
/*0x3a2a*/      ldr r2, [pc, #0x40] /* data_3a6c */
/*0x3a2c*/      ubfx r1, r1, #0, #0xa
/*0x3a30*/      add r1, r2
/*0x3a32*/      cbnz r5, jump_3a40
/*0x3a34*/      ldr r2, [r4, #0x10]
/*0x3a36*/      lsrs r0, r0, #0x10
/*0x3a38*/      ubfx r2, r2, #0xc, #8
/*0x3a3c*/      add.w r1, r1, r2, lsl #2
            jump_3a40:
/*0x3a40*/      lsls r5, r0, #0x17
/*0x3a42*/      lsrs r5, r5, #0x17
/*0x3a44*/      beq jump_3a62
/*0x3a46*/      cmp r6, r5
/*0x3a48*/      bls jump_3a4c
/*0x3a4a*/      mov r6, r5
            jump_3a4c:
/*0x3a4c*/      mov r2, r6
/*0x3a4e*/      mov r0, r7
/*0x3a50*/      bl call_6cfa
            jump_3a54:
/*0x3a54*/      ldr r0, [r4]
/*0x3a56*/      and r0, r0, #0x10
/*0x3a5a*/      str r0, [r4]
/*0x3a5c*/      mov r0, r6
            jump_3a5e:
/*0x3a5e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_3a62:
/*0x3a62*/      movs r0, #0
/*0x3a64*/      b jump_3a5e

/*0x3a66*/  .byte 0x00
/*0x3a67*/  .byte 0x00

            data_3a68:
/*0x3a68*/  .word 0x400a8000
            data_3a6c:
/*0x3a6c*/  .word 0x400aa000


            .thumb_func
            call_3a70:
/*0x3a70*/      push {r4, r5, r6, lr}
/*0x3a72*/      mov r6, r1
/*0x3a74*/      adds r1, r0, #1
/*0x3a76*/      mov r5, r2
/*0x3a78*/      ldr r0, [pc, #0x20] /* data_3a9c */
/*0x3a7a*/      bl call_3abc
/*0x3a7e*/      mov r4, r0
/*0x3a80*/      cbz r5, jump_3a94
/*0x3a82*/      ldr r0, [r4, #0x10]
/*0x3a84*/      ldr r1, [pc, #0x18] /* data_3aa0 */
/*0x3a86*/      ubfx r0, r0, #0, #0xa
/*0x3a8a*/      add r0, r1
/*0x3a8c*/      mov r2, r5
/*0x3a8e*/      mov r1, r6
/*0x3a90*/      bl call_6cfa
            jump_3a94:
/*0x3a94*/      str r5, [r4, #0xc]
/*0x3a96*/      movs r0, #2
/*0x3a98*/      str r0, [r4]
/*0x3a9a*/      pop {r4, r5, r6, pc}

            data_3a9c:
/*0x3a9c*/  .word 0x400a8000
            data_3aa0:
/*0x3aa0*/  .word 0x400aa000


            .thumb_func
            call_3aa4:
/*0x3aa4*/      push {r4, lr}
/*0x3aa6*/      mov r1, r0
/*0x3aa8*/      ldr r0, [pc, #0xc] /* data_3ab8 */
/*0x3aaa*/      bl call_3abc
/*0x3aae*/      mov r1, r0
/*0x3ab0*/      ldr r0, [r0]
/*0x3ab2*/      ldr r1, [r1, #4]
/*0x3ab4*/      ands r0, r1
/*0x3ab6*/      pop {r4, pc}

            data_3ab8:
/*0x3ab8*/  .word 0x400a8004


            .thumb_func
            call_3abc:
/*0x3abc*/      add.w r1, r1, r1, lsl #2
/*0x3ac0*/      add.w r0, r0, r1, lsl #2
/*0x3ac4*/      bx lr

/*0x3ac6*/  .byte 0x00
/*0x3ac7*/  .byte 0x00


            .thumb_func
            call_3ac8:
/*0x3ac8*/      ldr r0, [pc, #8] /* data_3ad4 */
/*0x3aca*/      ldr r1, [r0]
/*0x3acc*/      and r1, r1, #0x400
/*0x3ad0*/      str r1, [r0]
/*0x3ad2*/      bx lr

            data_3ad4:
/*0x3ad4*/  .word 0x400a8000


            .thumb_func
            call_3ad8:
/*0x3ad8*/      push {r4, r5, r6, lr}
/*0x3ada*/      mov r5, r0
/*0x3adc*/      movs r0, #1
/*0x3ade*/      bl call_39f4
/*0x3ae2*/      movs r0, #0xfa
/*0x3ae4*/      bl call_37b8
/*0x3ae8*/      ldr r4, [pc, #0x58] /* data_3b44 */
/*0x3aea*/      ldr r0, [r4]
/*0x3aec*/      movw r6, #0x111d
/*0x3af0*/      lsls r1, r0, #0x19
/*0x3af2*/      mov.w r0, #-1
/*0x3af6*/      bpl jump_3b10
/*0x3af8*/      movw r1, #0x40c
/*0x3afc*/      str r1, [r4]
/*0x3afe*/      str r0, [r4, #8]
/*0x3b00*/      cbnz r5, jump_3b08
/*0x3b02*/      movs r0, #0
/*0x3b04*/      bl call_5f24
            jump_3b08:
/*0x3b08*/      ldr r0, [r4, #4]
/*0x3b0a*/      orrs r0, r6
/*0x3b0c*/      str r0, [r4, #4]
/*0x3b0e*/      pop {r4, r5, r6, pc}
            jump_3b10:
/*0x3b10*/      movw r1, #0xc0c
/*0x3b14*/      str r1, [r4]
/*0x3b16*/      str r0, [r4, #8]
/*0x3b18*/      cbnz r5, jump_3b20
/*0x3b1a*/      movs r0, #0
/*0x3b1c*/      bl call_5f24
            jump_3b20:
/*0x3b20*/      ldr r0, [r4]
/*0x3b22*/      bic r0, r0, #0x800
/*0x3b26*/      str r0, [r4]
/*0x3b28*/      ldr r0, [r4, #4]
/*0x3b2a*/      orrs r0, r6
/*0x3b2c*/      str r0, [r4, #4]
/*0x3b2e*/      movs r0, #0
/*0x3b30*/      bl call_39f4
/*0x3b34*/      movs r0, #0x19
/*0x3b36*/      bl call_37b8
/*0x3b3a*/      pop.w {r4, r5, r6, lr}
/*0x3b3e*/      movs r0, #1
/*0x3b40*/      b.w call_39f4

            data_3b44:
/*0x3b44*/  .word 0x400a8000


            .thumb_func
            call_3b48:
/*0x3b48*/      ldr r0, [pc, #0xc] /* data_3b58 */
/*0x3b4a*/      ldr r0, [r0]
/*0x3b4c*/      ands r0, r0, #0xc0
/*0x3b50*/      beq jump_3b54
/*0x3b52*/      movs r0, #1
            jump_3b54:
/*0x3b54*/      bx lr

/*0x3b56*/  .byte 0x00
/*0x3b57*/  .byte 0x00

            data_3b58:
/*0x3b58*/  .word 0x400a8000


            .thumb_func
            call_3b5c:
/*0x3b5c*/      push {r4, r5, r6, r7, lr}
/*0x3b5e*/      ldr r7, [pc, #0x1c] /* data_3b7c */
/*0x3b60*/      ldr r4, [r7, #0x24]
/*0x3b62*/      ldr r5, [r7, #0x2c]
/*0x3b64*/      ldr r6, [r7, #0x30]
/*0x3b66*/      bics r4, r0
/*0x3b68*/      bics r5, r1
/*0x3b6a*/      bics r6, r2
/*0x3b6c*/      cbz r3, jump_3b74
/*0x3b6e*/      orrs r4, r0
/*0x3b70*/      orrs r5, r1
/*0x3b72*/      orrs r6, r2
            jump_3b74:
/*0x3b74*/      str r4, [r7, #0x24]
/*0x3b76*/      str r5, [r7, #0x2c]
/*0x3b78*/      str r6, [r7, #0x30]
/*0x3b7a*/      pop {r4, r5, r6, r7, pc}

            data_3b7c:
/*0x3b7c*/  .word 0x40088000


            .thumb_func
            call_3b80:
/*0x3b80*/      ldr r1, [pc, #0xc] /* data_3b90 */
/*0x3b82*/      ldr r2, [r1]
/*0x3b84*/      bic r2, r2, #0xc00000
/*0x3b88*/      orr.w r0, r2, r0, lsl #22
/*0x3b8c*/      str r0, [r1]
/*0x3b8e*/      bx lr

            data_3b90:
/*0x3b90*/  .word 0x40088000


            .thumb_func
            call_3b94:
/*0x3b94*/      movs r1, #3
/*0x3b96*/      ldr r2, [pc, #0x10] /* data_3ba8 */
/*0x3b98*/      b jump_3b9e
            jump_3b9a:
/*0x3b9a*/      ldrb r3, [r0, r1]
/*0x3b9c*/      strb r3, [r2, r1]
            jump_3b9e:
/*0x3b9e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3ba0*/      uxtb r1, r1
/*0x3ba2*/      bhs jump_3b9a
/*0x3ba4*/      bx lr

/*0x3ba6*/  .byte 0x00
/*0x3ba7*/  .byte 0x00

            data_3ba8:
/*0x3ba8*/  .word 0x20000084


            .thumb_func
            call_3bac:
/*0x3bac*/      ldr r0, [pc, #0x18] /* data_3bc8 */
/*0x3bae*/      ldrb r0, [r0, #5]
/*0x3bb0*/      cmp r0, #0
/*0x3bb2*/      beq jump_3bc4
/*0x3bb4*/      ldr r0, [pc, #0x14] /* data_3bcc */
/*0x3bb6*/      ldr r0, [r0, #4]
/*0x3bb8*/      movw r1, #0x9c40
/*0x3bbc*/      cmp r0, r1
/*0x3bbe*/      blo jump_3bc4
/*0x3bc0*/      b.w jump_6d40
            jump_3bc4:
/*0x3bc4*/      bx lr

/*0x3bc6*/  .byte 0x00
/*0x3bc7*/  .byte 0x00

            data_3bc8:
/*0x3bc8*/  .word 0x200007b4
            data_3bcc:
/*0x3bcc*/  .word 0x20000084


            .thumb_func
            call_3bd0:
/*0x3bd0*/      cmp r0, #1
/*0x3bd2*/      beq jump_3be2
/*0x3bd4*/      movs r0, #5
            jump_3bd6:
/*0x3bd6*/      ldr r1, [pc, #0x10] /* data_3be8 */
/*0x3bd8*/      strb r0, [r1, #3]
/*0x3bda*/      ldr r0, [pc, #0x10] /* data_3bec */
/*0x3bdc*/      ldrb r0, [r0, #2]
/*0x3bde*/      b.w call_43e8
            jump_3be2:
/*0x3be2*/      movs r0, #4
/*0x3be4*/      b jump_3bd6

/*0x3be6*/  .byte 0x00
/*0x3be7*/  .byte 0x00

            data_3be8:
/*0x3be8*/  .word 0x200008a0
            data_3bec:
/*0x3bec*/  .word 0x20000894


            .thumb_func
            call_3bf0:
/*0x3bf0*/      bx lr

            .thumb_func
            call_3bf2:
/*0x3bf2*/      bx lr

            .thumb_func
            call_3bf4:
/*0x3bf4*/      bx lr

            .thumb_func
            loc_3bf6:
/*0x3bf6*/      bx lr

/*0x3bf8*/  .byte 0x00
/*0x3bf9*/  .byte 0x50
/*0x3bfa*/  .byte 0x04
/*0x3bfb*/  .byte 0x03
/*0x3bfc*/  .byte 0x01
/*0x3bfd*/  .byte 0x00
/*0x3bfe*/  .byte 0x00
/*0x3bff*/  .byte 0x34
/*0x3c00*/  .byte 0x04
/*0x3c01*/  .byte 0x00
/*0x3c02*/  .byte 0x02
/*0x3c03*/  .byte 0x00


            .thumb_func
            call_3c04:
/*0x3c04*/      push {r4, r5, r6, lr}
/*0x3c06*/      ldr r1, [pc, #0xac] /* data_3cb4 */
/*0x3c08*/      ldrb r0, [r1, #5]
/*0x3c0a*/      cmp r0, #0
/*0x3c0c*/      beq jump_3c52
/*0x3c0e*/      ldr r5, [pc, #0xa8] /* data_3cb8 */
/*0x3c10*/      movs r2, #1
/*0x3c12*/      str r2, [r5, #4]
/*0x3c14*/      ldr r0, [pc, #0xa4] /* data_3cbc */
/*0x3c16*/      ldrb r0, [r0, #3]
/*0x3c18*/      lsls r0, r0, #0x1e
/*0x3c1a*/      bpl jump_3c52
/*0x3c1c*/      ldr r0, [pc, #0x9c] /* data_3cbc */
/*0x3c1e*/      ldrb r3, [r1, #6]
/*0x3c20*/      ldrb r0, [r0]
/*0x3c22*/      cbz r3, jump_3c68
/*0x3c24*/      cmp r0, #0x27
/*0x3c26*/      beq jump_3c48
/*0x3c28*/      bgt jump_3c3c
/*0x3c2a*/      cmp r0, #0x1e
/*0x3c2c*/      beq jump_3c54
/*0x3c2e*/      cmp r0, #0x1f
/*0x3c30*/      beq jump_3c54
/*0x3c32*/      cmp r0, #0x20
/*0x3c34*/      beq jump_3c54
/*0x3c36*/      cmp r0, #0x26
/*0x3c38*/      bne jump_3c52
/*0x3c3a*/      b jump_3c48
            jump_3c3c:
/*0x3c3c*/      cmp r0, #0x29
/*0x3c3e*/      beq jump_3c50
/*0x3c40*/      cmp r0, #0x2d
/*0x3c42*/      beq jump_3c48
/*0x3c44*/      cmp r0, #0x2e
/*0x3c46*/      bne jump_3c52
            jump_3c48:
/*0x3c48*/      pop.w {r4, r5, r6, lr}
/*0x3c4c*/      b.w jump_6d40
            jump_3c50:
/*0x3c50*/      strb r2, [r1, #1]
            jump_3c52:
/*0x3c52*/      pop {r4, r5, r6, pc}
            jump_3c54:
/*0x3c54*/      subs r0, #0x1e
/*0x3c56*/      uxtb r1, r0
/*0x3c58*/      ldr r0, [pc, #0x5c] /* data_3cb8 */
/*0x3c5a*/      movs r2, #1
/*0x3c5c*/      adds r4, r0, r1
/*0x3c5e*/      ldrb r0, [r4]
/*0x3c60*/      bl call_52b0
/*0x3c64*/      strb r0, [r4]
            jump_3c66:
/*0x3c66*/      pop {r4, r5, r6, pc}
            jump_3c68:
/*0x3c68*/      cmp r0, #0xcf
/*0x3c6a*/      beq jump_3c66
/*0x3c6c*/      ldr r1, [pc, #0x50] /* data_3cc0 */
/*0x3c6e*/      ldr r2, [pc, #0x54] /* data_3cc4 */
/*0x3c70*/      ldrb r3, [r1, #3]
/*0x3c72*/      ldrb r0, [r2, r0]
/*0x3c74*/      cmp r3, #5
/*0x3c76*/      beq jump_3c98
/*0x3c78*/      add.w r0, r0, r0, lsl #1
/*0x3c7c*/      adds r4, r0, r1
/*0x3c7e*/      add.w r4, r4, #0x1c6
            jump_3c82:
/*0x3c82*/      movs r2, #3
/*0x3c84*/      mov r1, r4
/*0x3c86*/      ldr r0, [pc, #0x30] /* data_3cb8 */
/*0x3c88*/      bl call_35f8
/*0x3c8c*/      cbz r0, jump_3cac
/*0x3c8e*/      ldrh r0, [r5]
/*0x3c90*/      strh r0, [r4]
/*0x3c92*/      ldrb r0, [r5, #2]
            jump_3c94:
/*0x3c94*/      strb r0, [r4, #2]
/*0x3c96*/      pop {r4, r5, r6, pc}
            jump_3c98:
/*0x3c98*/      ldr r2, [pc, #0x2c] /* data_3cc8 */
/*0x3c9a*/      ldrb r0, [r2, r0]
/*0x3c9c*/      and r0, r0, #7
/*0x3ca0*/      add.w r0, r0, r0, lsl #1
/*0x3ca4*/      adds r4, r0, r1
/*0x3ca6*/      addw r4, r4, #0x2e6
/*0x3caa*/      b jump_3c82
            jump_3cac:
/*0x3cac*/      movs r0, #0
/*0x3cae*/      strh r0, [r4]
/*0x3cb0*/      b jump_3c94

/*0x3cb2*/  .byte 0x00
/*0x3cb3*/  .byte 0x00

            data_3cb4:
/*0x3cb4*/  .word 0x200007b4
            data_3cb8:
/*0x3cb8*/  .word 0x20000084
            data_3cbc:
/*0x3cbc*/  .word 0x200007c0
            data_3cc0:
/*0x3cc0*/  .word 0x200008a0
            data_3cc4:
/*0x3cc4*/  .word 0x20000226
            data_3cc8:
/*0x3cc8*/  .word 0x00007bf8 /* possible pointer */

            jump_3ccc:
/*0x3ccc*/      push {r4, r5, r6, lr}
/*0x3cce*/      cbz r0, jump_3cf8
/*0x3cd0*/      ldr r5, [pc, #0x3c] /* data_3d10 */
/*0x3cd2*/      movs r4, #0x60
/*0x3cd4*/      ldr r6, [pc, #0x3c] /* data_3d14 */
/*0x3cd6*/      b jump_3cf0
            jump_3cd8:
/*0x3cd8*/      ldrb r0, [r5], #-1
/*0x3cdc*/      and r0, r0, #7
/*0x3ce0*/      add.w r0, r0, r0, lsl #1
/*0x3ce4*/      adds r1, r0, r6
/*0x3ce6*/      mov r0, r4
/*0x3ce8*/      addw r1, r1, #0x2e6
/*0x3cec*/      bl call_44fc
            jump_3cf0:
/*0x3cf0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3cf2*/      uxtb r4, r4
/*0x3cf4*/      bhs jump_3cd8
/*0x3cf6*/      pop {r4, r5, r6, pc}
            jump_3cf8:
/*0x3cf8*/      ldr r5, [pc, #0x1c] /* data_3d18 */
/*0x3cfa*/      movs r4, #0x60
/*0x3cfc*/      b jump_3d08
            jump_3cfe:
/*0x3cfe*/      mov r1, r5
/*0x3d00*/      mov r0, r4
/*0x3d02*/      bl call_44fc
/*0x3d06*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3d08:
/*0x3d08*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3d0a*/      uxtb r4, r4
/*0x3d0c*/      bhs jump_3cfe
/*0x3d0e*/      pop {r4, r5, r6, pc}

            data_3d10:
/*0x3d10*/  .word 0x00007c57 /* possible pointer */
            data_3d14:
/*0x3d14*/  .word 0x200008a0
            data_3d18:
/*0x3d18*/  .word 0x20000b83


            .thumb_func
            call_3d1c:
/*0x3d1c*/      push {r4, lr}
/*0x3d1e*/      bl call_3bd0
/*0x3d22*/      ldr r0, [pc, #0x14] /* data_3d38 */
/*0x3d24*/      movs r1, #1
/*0x3d26*/      strb r1, [r0, #5]
/*0x3d28*/      ldr r0, [pc, #0x10] /* data_3d3c */
/*0x3d2a*/      str r1, [r0, #4]
/*0x3d2c*/      ldr r1, [pc, #0x10] /* data_3d40 */
/*0x3d2e*/      ldrh r2, [r1]
/*0x3d30*/      strh r2, [r0]
/*0x3d32*/      ldrb r1, [r1, #2]
/*0x3d34*/      strb r1, [r0, #2]
/*0x3d36*/      pop {r4, pc}

            data_3d38:
/*0x3d38*/  .word 0x200007b4
            data_3d3c:
/*0x3d3c*/  .word 0x20000084
            data_3d40:
/*0x3d40*/  .word 0x00007b54 /* possible pointer */


            .thumb_func
            call_3d44:
/*0x3d44*/      push {r4, r5, r6, lr}
/*0x3d46*/      ldr r4, [pc, #0x5c] /* data_3da4 */
/*0x3d48*/      ldrb r0, [r4, #9]
/*0x3d4a*/      cmp r0, #1
/*0x3d4c*/      beq jump_3d60
/*0x3d4e*/      ldr r0, [pc, #0x58] /* data_3da8 */
/*0x3d50*/      bl call_451c
/*0x3d54*/      movs r0, #4
/*0x3d56*/      ldr r1, [pc, #0x54] /* data_3dac */
/*0x3d58*/      movs r2, #0
/*0x3d5a*/      ldr r3, [pc, #0x54] /* data_3db0 */
/*0x3d5c*/      ldr r5, [pc, #0x54] /* data_3db4 */
/*0x3d5e*/      b jump_3d8a
            jump_3d60:
/*0x3d60*/      ldr r0, [pc, #0x48] /* data_3dac */
/*0x3d62*/      mov.w r1, #0x120
/*0x3d66*/      subs r0, #0xc0
/*0x3d68*/      bl call_35e2
/*0x3d6c*/      ldr r4, [pc, #0x48] /* data_3db8 */
/*0x3d6e*/      ldr r1, [pc, #0x38] /* data_3da8 */
/*0x3d70*/      ldrb r0, [r4, #0xe8]!
/*0x3d74*/      bl call_44fc
/*0x3d78*/      ldrb r0, [r4, #1]
/*0x3d7a*/      pop.w {r4, r5, r6, lr}
/*0x3d7e*/      ldr r1, [pc, #0x28] /* data_3da8 */
/*0x3d80*/      b.w call_44fc
            jump_3d84:
/*0x3d84*/      ldrb r6, [r3, r0]
/*0x3d86*/      ldrb r6, [r5, r6]
/*0x3d88*/      strb r2, [r6, r1]
            jump_3d8a:
/*0x3d8a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3d8c*/      uxtb r0, r0
/*0x3d8e*/      bhs jump_3d84
/*0x3d90*/      ldr r3, [pc, #0x24] /* data_3db8 */
/*0x3d92*/      movs r2, #0xff
/*0x3d94*/      ldrb r0, [r4, #9]
/*0x3d96*/      adds r3, #0xe6
/*0x3d98*/      ldrb r3, [r0, r3]
/*0x3d9a*/      strb r2, [r3, r1]
/*0x3d9c*/      ldr r3, [pc, #0x1c] /* data_3dbc */
/*0x3d9e*/      ldrb r0, [r0, r3]
/*0x3da0*/      strb r2, [r0, r1]
/*0x3da2*/      pop {r4, r5, r6, pc}

            data_3da4:
/*0x3da4*/  .word 0x200007b4
            data_3da8:
/*0x3da8*/  .word 0x00007b57 /* possible pointer */
            data_3dac:
/*0x3dac*/  .word 0x2000040a
            data_3db0:
/*0x3db0*/  .word 0x00007ae8 /* possible pointer */
            data_3db4:
/*0x3db4*/  .word 0x20000226
            data_3db8:
/*0x3db8*/  .word 0x200008a0
            data_3dbc:
/*0x3dbc*/  .word 0x00007ade /* possible pointer */


            .thumb_func
            call_3dc0:
/*0x3dc0*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3dc4*/      ldr r0, [pc, #0x100] /* data_3ec8 */
/*0x3dc6*/      ldrb r1, [r0, #8]
/*0x3dc8*/      cbz r1, jump_3dde
/*0x3dca*/      ldr r0, [pc, #0x100] /* data_3ecc */
/*0x3dcc*/      ldrh r0, [r0]
/*0x3dce*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3dd2*/      lsls r0, r0, #0x15
/*0x3dd4*/      asrs r0, r0, #8
/*0x3dd6*/      lsrs r1, r0, #0x18
/*0x3dd8*/      movs r0, #0x59
/*0x3dda*/      b.w call_4540
            jump_3dde:
/*0x3dde*/      ldrb r0, [r0, #0xa]
/*0x3de0*/      ldr r6, [pc, #0xec] /* data_3ed0 */
/*0x3de2*/      mov.w r1, #0x120
/*0x3de6*/      mov.w sl, #1
/*0x3dea*/      mov.w r8, #0xff
/*0x3dee*/      mov.w sb, #0
/*0x3df2*/      cmp r0, #8
/*0x3df4*/      bhs switch_3e92
/*0x3df6*/      tbb [pc, r0]

/*0x3dfa*/  .byte 0x4c /* case switch_3e92 */
/*0x3dfb*/  .byte 0x04 /* case switch_3e02 */
/*0x3dfc*/  .byte 0x04 /* case switch_3e02 */
/*0x3dfd*/  .byte 0x04 /* case switch_3e02 */
/*0x3dfe*/  .byte 0x0d /* case switch_3e14 */
/*0x3dff*/  .byte 0x0f /* case switch_3e18 */
/*0x3e00*/  .byte 0x15 /* case switch_3e24 */
/*0x3e01*/  .byte 0x4e /* case switch_3e96 */

            switch_3e02:
/*0x3e02*/      ldr r1, [pc, #0xd0] /* data_3ed4 */
/*0x3e04*/      add.w r0, r0, r0, lsl #1
/*0x3e08*/      add.w r0, r1, r0, lsl #5
/*0x3e0c*/      movs r2, #0xff
/*0x3e0e*/      movs r1, #0x60
/*0x3e10*/      subs r0, #0x60
/*0x3e12*/      b jump_3e1c
            switch_3e14:
/*0x3e14*/      movs r2, #0x80
/*0x3e16*/      b jump_3e1a
            switch_3e18:
/*0x3e18*/      movs r2, #0xff
            jump_3e1a:
/*0x3e1a*/      ldr r0, [pc, #0xb8] /* data_3ed4 */
            jump_3e1c:
/*0x3e1c*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3e20*/      b.w call_35d4
            switch_3e24:
/*0x3e24*/      ldr r0, [pc, #0xac] /* data_3ed4 */
/*0x3e26*/      bl call_35e2
/*0x3e2a*/      movs r4, #0x60
/*0x3e2c*/      b jump_3e8c
            jump_3e2e:
/*0x3e2e*/      ldr r0, [pc, #0xa8] /* data_3ed8 */
/*0x3e30*/      and r2, r4, #7
/*0x3e34*/      add.w r0, r0, r4, lsr #3
/*0x3e38*/      ldrb r1, [r0]
/*0x3e3a*/      lsl.w r0, sl, r2
/*0x3e3e*/      tst r1, r0
/*0x3e40*/      bne jump_3e48
/*0x3e42*/      adds r1, r6, r4
/*0x3e44*/      strb.w r8, [r1, #7]
            jump_3e48:
/*0x3e48*/      adds r5, r6, r4
/*0x3e4a*/      mov r0, r4
/*0x3e4c*/      ldrb r1, [r5, #7]
/*0x3e4e*/      bl call_4540
/*0x3e52*/      cmp r4, #4
/*0x3e54*/      beq jump_3e5c
/*0x3e56*/      cmp r4, #0x45
/*0x3e58*/      bne jump_3e7c
/*0x3e5a*/      b jump_3e64
            jump_3e5c:
/*0x3e5c*/      ldr r0, [pc, #0x70] /* data_3ed0 */
/*0x3e5e*/      ldrb r1, [r0, #0xb]
/*0x3e60*/      movs r0, #0x5a
/*0x3e62*/      b jump_3e78
            jump_3e64:
/*0x3e64*/      ldr r0, [pc, #0x68] /* data_3ed0 */
/*0x3e66*/      add.w r7, r0, #0x45
/*0x3e6a*/      ldrb.w r1, [r0, #0x4c]
/*0x3e6e*/      movs r0, #0x59
/*0x3e70*/      bl call_4540
/*0x3e74*/      ldrb r1, [r7, #7]
/*0x3e76*/      movs r0, #0x58
            jump_3e78:
/*0x3e78*/      bl call_4540
            jump_3e7c:
/*0x3e7c*/      ldrb r0, [r5, #7]
/*0x3e7e*/      cmp r0, #1
/*0x3e80*/      bls jump_3e88
/*0x3e82*/      .short 0x1e80 /* subs r0, r0, #2 */ 
/*0x3e84*/      strb r0, [r5, #7]
/*0x3e86*/      b jump_3e8c
            jump_3e88:
/*0x3e88*/      strb.w sb, [r5, #7]
            jump_3e8c:
/*0x3e8c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3e8e*/      uxtb r4, r4
/*0x3e90*/      bhs jump_3e2e
            switch_3e92:
/*0x3e92*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            switch_3e96:
/*0x3e96*/      ldr r0, [pc, #0x3c] /* data_3ed4 */
/*0x3e98*/      bl call_35e2
/*0x3e9c*/      str.w sb, [sp]
/*0x3ea0*/      ldrb r0, [r6, #4]
/*0x3ea2*/      cbz r0, jump_3eb2
/*0x3ea4*/      movs r0, #0
            jump_3ea6:
/*0x3ea6*/      bl call_4220
/*0x3eaa*/      cbz r0, jump_3eba
/*0x3eac*/      strb.w r8, [sp, #1]
/*0x3eb0*/      b jump_3ebe
            jump_3eb2:
/*0x3eb2*/      strb.w sl, [r6, #4]
/*0x3eb6*/      movs r0, #1
/*0x3eb8*/      b jump_3ea6
            jump_3eba:
/*0x3eba*/      strb.w r8, [sp]
            jump_3ebe:
/*0x3ebe*/      mov r1, sp
/*0x3ec0*/      movs r0, #0x5a
/*0x3ec2*/      bl call_44fc
/*0x3ec6*/      b switch_3e92

            data_3ec8:
/*0x3ec8*/  .word 0x200007b4
            data_3ecc:
/*0x3ecc*/  .word 0x200001b6
            data_3ed0:
/*0x3ed0*/  .word 0x20000090
            data_3ed4:
/*0x3ed4*/  .word 0x2000034a
            data_3ed8:
/*0x3ed8*/  .word 0x200001b8


            .thumb_func
            call_3edc:
/*0x3edc*/      push {r3, r4, r5, r6, r7, lr}
/*0x3ede*/      bl call_6db4
/*0x3ee2*/      ldr r4, [pc, #0xc0] /* data_3fa4 */
/*0x3ee4*/      ldr r5, [pc, #0xc0] /* data_3fa8 */
/*0x3ee6*/      ldrb r0, [r4, #6]
/*0x3ee8*/      cbz r0, jump_3f32
/*0x3eea*/      ldrb r0, [r4, #5]
/*0x3eec*/      cbnz r0, jump_3ef4
/*0x3eee*/      bl call_54ac
/*0x3ef2*/      cbz r0, jump_3f32
            jump_3ef4:
/*0x3ef4*/      ldrb r0, [r4, #5]
/*0x3ef6*/      cbz r0, jump_3efc
/*0x3ef8*/      ldr r7, [pc, #0xb0] /* data_3fac */
/*0x3efa*/      b jump_3f00
            jump_3efc:
/*0x3efc*/      ldr r0, [pc, #0xb0] /* data_3fb0 */
/*0x3efe*/      ldr r7, [r0]
            jump_3f00:
/*0x3f00*/      movs r1, #3
/*0x3f02*/      ldr.w ip, [pc, #0xb0] /* data_3fb4 */
/*0x3f06*/      b jump_3f2c
            jump_3f08:
/*0x3f08*/      add.w r0, ip, r1
/*0x3f0c*/      ldrb r3, [r0, #0x1e]
/*0x3f0e*/      movs r0, #3
/*0x3f10*/      b jump_3f26
            jump_3f12:
/*0x3f12*/      cmp r1, r0
/*0x3f14*/      bne jump_3f1a
/*0x3f16*/      ldrb r2, [r7, r0]
/*0x3f18*/      b jump_3f1c
            jump_3f1a:
/*0x3f1a*/      movs r2, #0
            jump_3f1c:
/*0x3f1c*/      add.w r6, r0, r0, lsl #1
/*0x3f20*/      add.w r6, r5, r6, lsl #5
/*0x3f24*/      strb r2, [r6, r3]
            jump_3f26:
/*0x3f26*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3f28*/      uxtb r0, r0
/*0x3f2a*/      bhs jump_3f12
            jump_3f2c:
/*0x3f2c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3f2e*/      uxtb r1, r1
/*0x3f30*/      bhs jump_3f08
            jump_3f32:
/*0x3f32*/      ldrb r0, [r4, #5]
/*0x3f34*/      ldr r6, [pc, #0x80] /* data_3fb8 */
/*0x3f36*/      cbz r0, jump_3f42
/*0x3f38*/      ldrb.w r0, [r6, #0xe9]
/*0x3f3c*/      ldr r1, [pc, #0x6c] /* data_3fac */
/*0x3f3e*/      bl call_44fc
            jump_3f42:
/*0x3f42*/      ldrb r0, [r4, #8]
/*0x3f44*/      movs r4, #0xff
/*0x3f46*/      cbz r0, jump_3f5a
/*0x3f48*/      ldr r0, [pc, #0x70] /* data_3fbc */
/*0x3f4a*/      ldrh r0, [r0]
/*0x3f4c*/      lsls r0, r0, #0x15
/*0x3f4e*/      asrs r0, r0, #8
/*0x3f50*/      lsrs r1, r0, #0x18
/*0x3f52*/      movs r0, #0x59
/*0x3f54*/      bl call_4540
/*0x3f58*/      b jump_3f74
            jump_3f5a:
/*0x3f5a*/      movs r1, #0
/*0x3f5c*/      movs r0, #0x59
/*0x3f5e*/      bl call_4540
/*0x3f62*/      ldr r0, [pc, #0x5c] /* data_3fc0 */
/*0x3f64*/      ldrb r0, [r0, #2]
/*0x3f66*/      cbz r0, jump_3f74
/*0x3f68*/      add.w r0, r0, r0, lsl #1
/*0x3f6c*/      add.w r0, r5, r0, lsl #5
/*0x3f70*/      strb r4, [r0, #-0x7]
            jump_3f74:
/*0x3f74*/      movs r0, #0
/*0x3f76*/      str r0, [sp]
/*0x3f78*/      ldrb r0, [r6, #2]
/*0x3f7a*/      lsls r0, r0, #0x1f
/*0x3f7c*/      beq jump_3f82
/*0x3f7e*/      strb.w r4, [sp, #2]
            jump_3f82:
/*0x3f82*/      ldrb.w r0, [r6, #0x2f8]
/*0x3f86*/      cmp r0, #1
/*0x3f88*/      beq jump_3f90
/*0x3f8a*/      cmp r0, #2
/*0x3f8c*/      bne jump_3f9a
/*0x3f8e*/      b jump_3f96
            jump_3f90:
/*0x3f90*/      strb.w r4, [sp, #1]
/*0x3f94*/      b jump_3f9a
            jump_3f96:
/*0x3f96*/      strb.w r4, [sp]
            jump_3f9a:
/*0x3f9a*/      mov r1, sp
/*0x3f9c*/      movs r0, #0x58
/*0x3f9e*/      bl call_44fc
/*0x3fa2*/      pop {r3, r4, r5, r6, r7, pc}

            data_3fa4:
/*0x3fa4*/  .word 0x200007b4
            data_3fa8:
/*0x3fa8*/  .word 0x2000034a
            data_3fac:
/*0x3fac*/  .word 0x20000084
            data_3fb0:
/*0x3fb0*/  .word 0x20000090
            data_3fb4:
/*0x3fb4*/  .word 0x20000226
            data_3fb8:
/*0x3fb8*/  .word 0x200008a0
            data_3fbc:
/*0x3fbc*/  .word 0x200001b6
            data_3fc0:
/*0x3fc0*/  .word 0x20000894


            .thumb_func
            call_3fc4:
/*0x3fc4*/      push {r4, lr}
/*0x3fc6*/      bl call_5878
/*0x3fca*/      ldr r0, [pc, #0x4c] /* data_4018 */
/*0x3fcc*/      ldrb r0, [r0, #6]
/*0x3fce*/      cmp r0, #4
/*0x3fd0*/      beq jump_3fda
/*0x3fd2*/      cmp r0, #5
/*0x3fd4*/      beq jump_3fda
/*0x3fd6*/      ldr r1, [pc, #0x44] /* data_401c */
/*0x3fd8*/      b jump_3fe6
            jump_3fda:
/*0x3fda*/      ldr r0, [pc, #0x44] /* data_4020 */
/*0x3fdc*/      ldrh r0, [r0, #2]
/*0x3fde*/      lsls r0, r0, #0x15
/*0x3fe0*/      bpl jump_3fee
/*0x3fe2*/      ldr r1, [pc, #0x38] /* data_401c */
/*0x3fe4*/      .short 0x1ec9 /* subs r1, r1, #3 */ 
            jump_3fe6:
/*0x3fe6*/      movs r0, #0x58
/*0x3fe8*/      bl call_44fc
/*0x3fec*/      b jump_3ff6
            jump_3fee:
/*0x3fee*/      movs r1, #0
/*0x3ff0*/      movs r0, #0x58
/*0x3ff2*/      bl call_4540
            jump_3ff6:
/*0x3ff6*/      movs r1, #0
/*0x3ff8*/      movs r0, #0x59
/*0x3ffa*/      bl call_4540
/*0x3ffe*/      ldr r0, [pc, #0x24] /* data_4024 */
/*0x4000*/      ldrb r0, [r0, #2]
/*0x4002*/      cmp r0, #0
/*0x4004*/      beq jump_4016
/*0x4006*/      ldr r2, [pc, #0x20] /* data_4028 */
/*0x4008*/      add.w r0, r0, r0, lsl #1
/*0x400c*/      add.w r0, r2, r0, lsl #5
/*0x4010*/      movs r1, #0xff
/*0x4012*/      strb r1, [r0, #-0x7]
            jump_4016:
/*0x4016*/      pop {r4, pc}

            data_4018:
/*0x4018*/  .word 0x20001ba4
            data_401c:
/*0x401c*/  .word 0x00007b5d /* possible pointer */
            data_4020:
/*0x4020*/  .word 0x2000008c
            data_4024:
/*0x4024*/  .word 0x20000894
            data_4028:
/*0x4028*/  .word 0x2000034a


            .thumb_func
            call_402c:
/*0x402c*/      push {r4, lr}
/*0x402e*/      bl call_5e7c
/*0x4032*/      movs r1, #0
/*0x4034*/      movs r0, #0x59
/*0x4036*/      bl call_4540
/*0x403a*/      movs r1, #0
/*0x403c*/      pop.w {r4, lr}
/*0x4040*/      movs r0, #0x58
/*0x4042*/      b.w call_4540

/*0x4046*/  .byte 0x00
/*0x4047*/  .byte 0x00


            .thumb_func
            call_4048:
/*0x4048*/      push {r4, r5, r6, lr}
/*0x404a*/      movs r4, #0
/*0x404c*/      mov r2, r4
/*0x404e*/      sub sp, #0x30
/*0x4050*/      movs r1, #0x20
/*0x4052*/      movs r3, #1
/*0x4054*/      mov r0, r2
/*0x4056*/      bl call_3b5c
/*0x405a*/      mov.w r0, #0x4000
/*0x405e*/      str r0, [sp]
/*0x4060*/      asrs r0, r0, #4
/*0x4062*/      movs r5, #8
/*0x4064*/      str r0, [sp, #4]
/*0x4066*/      strd r5, r4, [sp, #8]
/*0x406a*/      str r4, [sp, #0x10]
/*0x406c*/      str r4, [sp, #0x14]
/*0x406e*/      movs r0, #4
/*0x4070*/      str r4, [sp, #0x18]
/*0x4072*/      strd r4, r0, [sp, #0x1c]
/*0x4076*/      ldr r6, [pc, #0x1c] /* data_4094 */
/*0x4078*/      str r0, [sp, #0x24]
/*0x407a*/      str r0, [sp, #0x28]
/*0x407c*/      mov r1, sp
/*0x407e*/      mov r0, r6
/*0x4080*/      bl call_66c0
/*0x4084*/      ldr r0, [pc, #0x10] /* data_4098 */
/*0x4086*/      strb r4, [r0]
/*0x4088*/      str r5, [r6]
/*0x408a*/      add sp, #0x30
/*0x408c*/      pop.w {r4, r5, r6, lr}
/*0x4090*/      b.w call_40c4

            data_4094:
/*0x4094*/  .word 0x40044000
            data_4098:
/*0x4098*/  .word 0x20000890


            .thumb_func
            call_409c:
/*0x409c*/      push {r4, lr}
/*0x409e*/      ldr r4, [pc, #0x1c] /* data_40bc */
/*0x40a0*/      ldr r0, [r4]
/*0x40a2*/      lsls r0, r0, #0x1f
/*0x40a4*/      beq jump_40ae
/*0x40a6*/      bl call_6b0c
/*0x40aa*/      movs r0, #0
/*0x40ac*/      str r0, [r4]
            jump_40ae:
/*0x40ae*/      movs r2, #0
/*0x40b0*/      pop.w {r4, lr}
/*0x40b4*/      movs r1, #4
/*0x40b6*/      ldr r0, [pc, #8] /* data_40c0 */
/*0x40b8*/      b.w call_38ba

            data_40bc:
/*0x40bc*/  .word 0x40044000
            data_40c0:
/*0x40c0*/  .word 0x0000828e /* possible pointer */


            .thumb_func
            call_40c4:
/*0x40c4*/      push {r4, r5, r6, lr}
/*0x40c6*/      ldr r1, [pc, #0x38] /* data_4100 */
/*0x40c8*/      movs r0, #9
/*0x40ca*/      str r0, [r1]
/*0x40cc*/      movs r2, #1
/*0x40ce*/      movs r1, #4
/*0x40d0*/      ldr r0, [pc, #0x30] /* data_4104 */
/*0x40d2*/      bl call_38ba
/*0x40d6*/      ldr r1, [pc, #0x30] /* data_4108 */
/*0x40d8*/      movs r0, #0x40
/*0x40da*/      str r0, [r1, #0x24]
/*0x40dc*/      lsls r4, r0, #4
/*0x40de*/      movw r5, #0x40c8
/*0x40e2*/      b jump_40f2
            jump_40e4:
/*0x40e4*/      bl call_6bfc
/*0x40e8*/      bl call_6b34
/*0x40ec*/      uxth r0, r0
/*0x40ee*/      cmp r0, r5
/*0x40f0*/      beq jump_40f6
            jump_40f2:
/*0x40f2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x40f4*/      bhs jump_40e4
            jump_40f6:
/*0x40f6*/      pop.w {r4, r5, r6, lr}
/*0x40fa*/      movs r0, #2
/*0x40fc*/      b.w jump_6c44

            data_4100:
/*0x4100*/  .word 0x40044000
            data_4104:
/*0x4104*/  .word 0x0000828e /* possible pointer */
            data_4108:
/*0x4108*/  .word 0x400b2000


            .thumb_func
            call_410c:
/*0x410c*/      push {r3, r4, r5, r6, r7, lr}
/*0x410e*/      ldr r5, [pc, #0x38] /* data_4148 */
/*0x4110*/      movs r4, #0x40
/*0x4112*/      mov r7, r2
/*0x4114*/      mov r6, r0
/*0x4116*/      str r4, [r5, #0x28]
/*0x4118*/      movs r0, #3
/*0x411a*/      strb.w r0, [sp]
/*0x411e*/      lsrs r0, r1, #0x10
/*0x4120*/      strb.w r0, [sp, #1]
/*0x4124*/      lsrs r0, r1, #8
/*0x4126*/      strb.w r0, [sp, #2]
/*0x412a*/      strb.w r1, [sp, #3]
/*0x412e*/      movs r2, #4
/*0x4130*/      movs r1, #0
/*0x4132*/      mov r0, sp
/*0x4134*/      bl call_6b64
/*0x4138*/      mov r2, r7
/*0x413a*/      mov r1, r6
/*0x413c*/      movs r0, #0
/*0x413e*/      bl call_6b64
/*0x4142*/      str r4, [r5, #0x24]
/*0x4144*/      pop {r3, r4, r5, r6, r7, pc}

/*0x4146*/  .byte 0x00
/*0x4147*/  .byte 0x00

            data_4148:
/*0x4148*/  .word 0x400b2000

            jump_414c:
/*0x414c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4150*/      mov r5, r1
/*0x4152*/      mov r6, r0
/*0x4154*/      rsbs r0, r5, #0
/*0x4156*/      uxtb r4, r0
/*0x4158*/      cmp r4, r2
/*0x415a*/      bhs jump_4166
/*0x415c*/      subs r0, r2, r4
/*0x415e*/      ubfx r7, r0, #8, #0x10
/*0x4162*/      uxtb r0, r0
/*0x4164*/      b jump_416c
            jump_4166:
/*0x4166*/      movs r7, #0
/*0x4168*/      uxth r4, r2
/*0x416a*/      mov r0, r7
            jump_416c:
/*0x416c*/      mov r8, r0
/*0x416e*/      cbz r4, jump_4180
/*0x4170*/      mov r2, r4
/*0x4172*/      mov r0, r6
/*0x4174*/      bl call_6ae8
/*0x4178*/      cmp r0, #1
/*0x417a*/      bne jump_41b8
/*0x417c*/      add r5, r4
/*0x417e*/      add r6, r4
            jump_4180:
/*0x4180*/      movs r4, #0
/*0x4182*/      mov.w sb, #0x100
/*0x4186*/      b jump_41a0
            jump_4188:
/*0x4188*/      mov r2, sb
/*0x418a*/      mov r1, r5
/*0x418c*/      mov r0, r6
/*0x418e*/      bl call_6ae8
/*0x4192*/      cmp r0, #1
/*0x4194*/      bne jump_41b8
/*0x4196*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4198*/      add.w r5, r5, #0x100
/*0x419c*/      add.w r6, r6, #0x100
            jump_41a0:
/*0x41a0*/      cmp r4, r7
/*0x41a2*/      blt jump_4188
/*0x41a4*/      subs.w r0, r8, #0
/*0x41a8*/      beq jump_41be
/*0x41aa*/      mov r2, r0
/*0x41ac*/      mov r1, r5
/*0x41ae*/      mov r0, r6
/*0x41b0*/      bl call_6ae8
/*0x41b4*/      cmp r0, #1
/*0x41b6*/      beq jump_41be
            jump_41b8:
/*0x41b8*/      movs r0, #0
            jump_41ba:
/*0x41ba*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_41be:
/*0x41be*/      movs r0, #1
/*0x41c0*/      b jump_41ba

/*0x41c2*/  .byte 0x00
/*0x41c3*/  .byte 0x00


            .thumb_func
            call_41c4:
/*0x41c4*/      mov r3, r1
/*0x41c6*/      ldr r1, [pc, #0x4c] /* data_4214 */
/*0x41c8*/      push {r4, lr}
/*0x41ca*/      ldrb r1, [r1, #2]
/*0x41cc*/      cmp r1, #0
/*0x41ce*/      beq jump_4210
/*0x41d0*/      add.w r1, r1, r1, lsl #1
/*0x41d4*/      mvn r2, #0x5f
/*0x41d8*/      add.w r1, r2, r1, lsl #5
/*0x41dc*/      add r0, r1
/*0x41de*/      lsrs r1, r0, #2
/*0x41e0*/      lsls r0, r0, #0x1e
/*0x41e2*/      lsrs r4, r0, #0x14
/*0x41e4*/      ldr r0, [pc, #0x2c] /* data_4214 */
/*0x41e6*/      lsls r1, r1, #0xc
/*0x41e8*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x41ea*/      add.w r1, r1, #0x5000
/*0x41ee*/      strd r1, r4, [r0]
/*0x41f2*/      mov.w r2, #0x1000
/*0x41f6*/      add.w r0, r0, #0x304
/*0x41fa*/      cbz r3, jump_4204
/*0x41fc*/      pop.w {r4, lr}
/*0x4200*/      b.w jump_6d68
            jump_4204:
/*0x4204*/      bl call_410c
/*0x4208*/      ldr r0, [pc, #0xc] /* data_4218 */
/*0x420a*/      ldr r1, [pc, #0x10] /* data_421c */
/*0x420c*/      add r0, r4
/*0x420e*/      str r0, [r1]
            jump_4210:
/*0x4210*/      pop {r4, pc}

/*0x4212*/  .byte 0x00
/*0x4213*/  .byte 0x00

            data_4214:
/*0x4214*/  .word 0x20000894
            data_4218:
/*0x4218*/  .word 0x20000b9c
            data_421c:
/*0x421c*/  .word 0x20000008


            .thumb_func
            call_4220:
/*0x4220*/      push {r3, r4, r5, lr}
/*0x4222*/      mov r5, r0
/*0x4224*/      movs r2, #2
/*0x4226*/      movs r1, #0
/*0x4228*/      mov r0, sp
/*0x422a*/      bl call_410c
/*0x422e*/      ldrh.w r1, [sp]
/*0x4232*/      movw r4, #0x8001
/*0x4236*/      cmp r1, r4
/*0x4238*/      beq jump_425a
/*0x423a*/      cbz r5, jump_4256
/*0x423c*/      ldr r0, [pc, #0x20] /* data_4260 */
/*0x423e*/      ldrb r0, [r0, #2]
/*0x4240*/      bl call_4354
/*0x4244*/      movs r2, #2
/*0x4246*/      movs r1, #0
/*0x4248*/      mov r0, sp
/*0x424a*/      bl call_410c
/*0x424e*/      ldrh.w r0, [sp]
/*0x4252*/      cmp r0, r4
/*0x4254*/      beq jump_425a
            jump_4256:
/*0x4256*/      movs r0, #0
/*0x4258*/      pop {r3, r4, r5, pc}
            jump_425a:
/*0x425a*/      movs r0, #1
/*0x425c*/      pop {r3, r4, r5, pc}

/*0x425e*/  .byte 0x00
/*0x425f*/  .byte 0x00

            data_4260:
/*0x4260*/  .word 0x20000894


            .thumb_func
            call_4264:
/*0x4264*/      push {r4, r5, r6, lr}
/*0x4266*/      mov r4, r0
/*0x4268*/      movs r2, #4
/*0x426a*/      movs r1, #0
/*0x426c*/      ldr r0, [pc, #0x74] /* data_42e4 */
/*0x426e*/      bl call_410c
/*0x4272*/      ldr r5, [pc, #0x70] /* data_42e4 */
/*0x4274*/      movw r1, #0x8001
/*0x4278*/      ldrh r0, [r5]
/*0x427a*/      cmp r0, r1
/*0x427c*/      beq jump_4296
/*0x427e*/      cmp.w r0, #0x1000
/*0x4282*/      bhs jump_4288
/*0x4284*/      ldrb r4, [r5, #2]
/*0x4286*/      b jump_428e
            jump_4288:
/*0x4288*/      cmp r4, #0xff
/*0x428a*/      bne jump_428e
/*0x428c*/      movs r4, #0
            jump_428e:
/*0x428e*/      mov r0, r4
/*0x4290*/      bl call_4354
/*0x4294*/      b jump_42a6
            jump_4296:
/*0x4296*/      cmp r4, #0xff
/*0x4298*/      beq jump_42a6
/*0x429a*/      ldrb r0, [r5, #2]
/*0x429c*/      cmp r0, r4
/*0x429e*/      beq jump_42a6
/*0x42a0*/      strb r4, [r5, #2]
/*0x42a2*/      bl call_43fc
            jump_42a6:
/*0x42a6*/      ldrb r0, [r5, #2]
/*0x42a8*/      movs r2, #2
/*0x42aa*/      lsls r1, r0, #0xc
/*0x42ac*/      ldr r0, [pc, #0x34] /* data_42e4 */
/*0x42ae*/      add.w r1, r1, #0x1000
/*0x42b2*/      adds r0, #0xc
/*0x42b4*/      bl call_410c
/*0x42b8*/      ldr r0, [pc, #0x28] /* data_42e4 */
/*0x42ba*/      adds r0, #0xc
/*0x42bc*/      ldrh r0, [r0]
/*0x42be*/      cmp r0, #1
/*0x42c0*/      beq jump_42ca
/*0x42c2*/      pop.w {r4, r5, r6, lr}
/*0x42c6*/      b.w call_42e8
            jump_42ca:
/*0x42ca*/      ldrb r0, [r5, #2]
/*0x42cc*/      pop.w {r4, r5, r6, lr}
/*0x42d0*/      lsls r1, r0, #0xc
/*0x42d2*/      ldr r0, [pc, #0x10] /* data_42e4 */
/*0x42d4*/      movw r2, #0x2fa
/*0x42d8*/      adds r0, #0xc
/*0x42da*/      add.w r1, r1, #0x1000
/*0x42de*/      b.w call_410c

/*0x42e2*/  .byte 0x00
/*0x42e3*/  .byte 0x00

            data_42e4:
/*0x42e4*/  .word 0x20000894


            .thumb_func
            call_42e8:
/*0x42e8*/      ldr r1, [pc, #0x30] /* data_431c */
/*0x42ea*/      push {r4, lr}
/*0x42ec*/      movs r0, #1
/*0x42ee*/      strh r0, [r1]
/*0x42f0*/      ldr r0, [pc, #0x28] /* data_431c */
/*0x42f2*/      movs r2, #0xff
/*0x42f4*/      movs r1, #0xc0
/*0x42f6*/      adds r0, #0x28
/*0x42f8*/      bl call_35d4
/*0x42fc*/      ldr r0, [pc, #0x1c] /* data_431c */
/*0x42fe*/      movs r2, #0xff
/*0x4300*/      movs r1, #0xdc
/*0x4302*/      adds r0, #0xea
/*0x4304*/      bl call_35d4
/*0x4308*/      bl call_436c
/*0x430c*/      ldr r0, [pc, #0xc] /* data_431c */
/*0x430e*/      subs r0, #0xc
/*0x4310*/      ldrb r0, [r0, #2]
/*0x4312*/      pop.w {r4, lr}
/*0x4316*/      b.w call_43e8

/*0x431a*/  .byte 0x00
/*0x431b*/  .byte 0x00

            data_431c:
/*0x431c*/  .word 0x200008a0


            .thumb_func
            call_4320:
/*0x4320*/      push {r4, lr}
/*0x4322*/      ldr r4, [pc, #0x2c] /* data_4350 */
/*0x4324*/      movs r0, #0
/*0x4326*/      strb r0, [r4, #2]
/*0x4328*/      bl call_42e8
            jump_432c:
/*0x432c*/      ldrb r0, [r4, #2]
/*0x432e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4330*/      uxtb r0, r0
/*0x4332*/      strb r0, [r4, #2]
/*0x4334*/      cmp r0, #4
/*0x4336*/      bhs jump_433e
/*0x4338*/      bl call_43e8
/*0x433c*/      b jump_432c
            jump_433e:
/*0x433e*/      movs r0, #0
/*0x4340*/      bl call_4354
/*0x4344*/      pop.w {r4, lr}
/*0x4348*/      movs r0, #0xff
/*0x434a*/      b.w call_4264

/*0x434e*/  .byte 0x00
/*0x434f*/  .byte 0x00

            data_4350:
/*0x4350*/  .word 0x20000894


            .thumb_func
            call_4354:
/*0x4354*/      ldr r1, [pc, #0x10] /* data_4368 */
/*0x4356*/      movw r2, #0x8001
/*0x435a*/      strh r2, [r1]
/*0x435c*/      strb r0, [r1, #2]
/*0x435e*/      movs r0, #0xff
/*0x4360*/      strb r0, [r1, #3]
/*0x4362*/      b.w call_43fc

/*0x4366*/  .byte 0x00
/*0x4367*/  .byte 0x00

            data_4368:
/*0x4368*/  .word 0x20000894


            .thumb_func
            call_436c:
/*0x436c*/      push {r4, r5, r6, lr}
/*0x436e*/      ldr r5, [pc, #0x64] /* data_43d4 */
/*0x4370*/      movs r3, #0
/*0x4372*/      movs r0, #0x10
/*0x4374*/      strb r3, [r5, #2]
/*0x4376*/      strb.w r0, [r5, #0x2f9]
/*0x437a*/      movs r0, #7
/*0x437c*/      strb r0, [r5, #3]
/*0x437e*/      adds r4, r5, #4
/*0x4380*/      mov r2, r0
/*0x4382*/      b jump_4398
            jump_4384:
/*0x4384*/      ldr r1, [pc, #0x50] /* data_43d8 */
/*0x4386*/      movs r0, #5
/*0x4388*/      b jump_4392
            jump_438a:
/*0x438a*/      ldrb r6, [r1], #1
/*0x438e*/      strb r6, [r4], #1
            jump_4392:
/*0x4392*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4394*/      uxtb r0, r0
/*0x4396*/      bhs jump_438a
            jump_4398:
/*0x4398*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x439a*/      uxtb r2, r2
/*0x439c*/      bhs jump_4384
/*0x439e*/      strb.w r3, [r5, #0x2f8]
/*0x43a2*/      movs r0, #0
/*0x43a4*/      bl call_6324
/*0x43a8*/      ldr r0, [pc, #0x28] /* data_43d4 */
/*0x43aa*/      ldr r1, [pc, #0x30] /* data_43dc */
/*0x43ac*/      adds r0, #0x70
/*0x43ae*/      ldrh r1, [r1]
/*0x43b0*/      strh.w r1, [r0, #0x78]
/*0x43b4*/      movs r0, #3
/*0x43b6*/      strb r0, [r5, #0x11]
/*0x43b8*/      mov.w r1, #0x120
/*0x43bc*/      ldr r0, [pc, #0x20] /* data_43e0 */
/*0x43be*/      bl call_35e2
/*0x43c2*/      movs r1, #0x12
/*0x43c4*/      ldr r0, [pc, #0x1c] /* data_43e4 */
/*0x43c6*/      bl call_35e2
/*0x43ca*/      ldrb r0, [r5, #2]
/*0x43cc*/      bic r0, r0, #1
/*0x43d0*/      strb r0, [r5, #2]
/*0x43d2*/      pop {r4, r5, r6, pc}

            data_43d4:
/*0x43d4*/  .word 0x200008a0
            data_43d8:
/*0x43d8*/  .word 0x00008289 /* possible pointer */
            data_43dc:
/*0x43dc*/  .word 0x00007ae0 /* possible pointer */
            data_43e0:
/*0x43e0*/  .word 0x20000a66
            data_43e4:
/*0x43e4*/  .word 0x20000b86


            .thumb_func
            call_43e8:
/*0x43e8*/      lsls r1, r0, #0xc
/*0x43ea*/      movw r2, #0x2fa
/*0x43ee*/      ldr r0, [pc, #8] /* data_43f8 */
/*0x43f0*/      add.w r1, r1, #0x1000
/*0x43f4*/      b.w jump_6d68

            data_43f8:
/*0x43f8*/  .word 0x200008a0


            .thumb_func
            call_43fc:
/*0x43fc*/      movs r2, #4
/*0x43fe*/      movs r1, #0
/*0x4400*/      ldr r0, [pc, #4] /* data_4408 */
/*0x4402*/      b.w jump_6d68

/*0x4406*/  .byte 0x00
/*0x4407*/  .byte 0x00

            data_4408:
/*0x4408*/  .word 0x20000894


            .thumb_func
            call_440c:
/*0x440c*/      add.w r0, r0, r1, lsr #3
/*0x4410*/      and r3, r1, #7
/*0x4414*/      movs r1, #1
/*0x4416*/      lsls r1, r3
/*0x4418*/      cmp r2, #0
/*0x441a*/      ldrb r2, [r0]
/*0x441c*/      uxtb r1, r1
/*0x441e*/      beq jump_4424
/*0x4420*/      orrs r2, r1
/*0x4422*/      b jump_4426
            jump_4424:
/*0x4424*/      bics r2, r1
            jump_4426:
/*0x4426*/      strb r2, [r0]
/*0x4428*/      bx lr

            .thumb_func
            call_442a:
/*0x442a*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x442e*/      mov r6, r0
/*0x4430*/      mov.w r7, #0x100
            jump_4434:
/*0x4434*/      movs r5, #0
/*0x4436*/      movs r4, #3
/*0x4438*/      b jump_4448
            jump_443a:
/*0x443a*/      mov r0, r7
/*0x443c*/      bl call_455c
/*0x4440*/      uxtb r0, r0
/*0x4442*/      strb r0, [r6, r4]
/*0x4444*/      add r0, r5
/*0x4446*/      uxth r5, r0
            jump_4448:
/*0x4448*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x444a*/      uxtb r4, r4
/*0x444c*/      bhs jump_443a
/*0x444e*/      cmp r5, #0xe0
/*0x4450*/      blo jump_4434
/*0x4452*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            call_4456:
/*0x4456*/      push {r4, r5, lr}
/*0x4458*/      lsls r3, r1, #1
/*0x445a*/      cmp r3, #0xff
/*0x445c*/      bls jump_4464
/*0x445e*/      rsb.w r3, r3, #0x1fe
/*0x4462*/      uxth r3, r3
            jump_4464:
/*0x4464*/      movs r4, #0x2b
/*0x4466*/      udiv r4, r0, r4
/*0x446a*/      movs r5, #0x55
/*0x446c*/      mla r0, r4, r5, r0
/*0x4470*/      sub.w r1, r1, r3, lsr #1
/*0x4474*/      uxtb r1, r1
/*0x4476*/      add.w r0, r0, r0, lsl #1
/*0x447a*/      strb r1, [r2]
/*0x447c*/      lsls r0, r0, #0x19
/*0x447e*/      strb r1, [r2, #1]
/*0x4480*/      lsrs r0, r0, #0x18
/*0x4482*/      strb r1, [r2, #2]
/*0x4484*/      lsls r5, r4, #0x1f
/*0x4486*/      beq jump_448c
/*0x4488*/      rsb.w r0, r0, #0xff
            jump_448c:
/*0x448c*/      muls r0, r3, r0
/*0x448e*/      ubfx r0, r0, #8, #8
/*0x4492*/      cmp r4, #5
/*0x4494*/      bhs jump_44ca
/*0x4496*/      tbb [pc, r4]

/*0x449a*/  .byte 0x03 /* case switch_44a0 */
/*0x449b*/  .byte 0x07 /* case switch_44a8 */
/*0x449c*/  .byte 0x0c /* case switch_44b2 */
/*0x449d*/  .byte 0x10 /* case switch_44ba */
/*0x449e*/  .byte 0x13 /* case switch_44c0 */
/*0x449f*/  .byte 0x00

            switch_44a0:
/*0x44a0*/      add r3, r1
/*0x44a2*/      strb r3, [r2]
/*0x44a4*/      add r0, r1
/*0x44a6*/      b jump_44ae
            switch_44a8:
/*0x44a8*/      add r0, r1
/*0x44aa*/      strb r0, [r2]
/*0x44ac*/      adds r0, r1, r3
            jump_44ae:
/*0x44ae*/      strb r0, [r2, #1]
/*0x44b0*/      pop {r4, r5, pc}
            switch_44b2:
/*0x44b2*/      add r3, r1
/*0x44b4*/      strb r3, [r2, #1]
            jump_44b6:
/*0x44b6*/      add r0, r1
/*0x44b8*/      b jump_44c6
            switch_44ba:
/*0x44ba*/      add r0, r1
/*0x44bc*/      strb r0, [r2, #1]
/*0x44be*/      b jump_44c4
            switch_44c0:
/*0x44c0*/      add r0, r1
/*0x44c2*/      strb r0, [r2]
            jump_44c4:
/*0x44c4*/      adds r0, r1, r3
            jump_44c6:
/*0x44c6*/      strb r0, [r2, #2]
/*0x44c8*/      pop {r4, r5, pc}
            jump_44ca:
/*0x44ca*/      add r3, r1
/*0x44cc*/      strb r3, [r2]
/*0x44ce*/      b jump_44b6
            jump_44d0:
/*0x44d0*/      push {r4, lr}
/*0x44d2*/      ldr r1, [pc, #0x24] /* data_44f8 */
/*0x44d4*/      movs r3, #0x60
/*0x44d6*/      b jump_44ee
            jump_44d8:
/*0x44d8*/      movs r2, #3
/*0x44da*/      b jump_44e4
            jump_44dc:
/*0x44dc*/      ldrb r4, [r0], #1
/*0x44e0*/      strb r4, [r1], #0x60
            jump_44e4:
/*0x44e4*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x44e6*/      uxtb r2, r2
/*0x44e8*/      bhs jump_44dc
/*0x44ea*/      subw r1, r1, #0x11f
            jump_44ee:
/*0x44ee*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x44f0*/      uxtb r3, r3
/*0x44f2*/      bhs jump_44d8
/*0x44f4*/      pop {r4, pc}

/*0x44f6*/  .byte 0x00
/*0x44f7*/  .byte 0x00

            data_44f8:
/*0x44f8*/  .word 0x2000034a


            .thumb_func
            call_44fc:
/*0x44fc*/      cmp r0, #0xff
/*0x44fe*/      beq jump_4516
/*0x4500*/      ldr r2, [pc, #0x14] /* data_4518 */
/*0x4502*/      add r2, r0
/*0x4504*/      movs r0, #0
            jump_4506:
/*0x4506*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4508*/      ldrb r3, [r1], #1
/*0x450c*/      uxtb r0, r0
/*0x450e*/      strb r3, [r2], #0x60
/*0x4512*/      cmp r0, #3
/*0x4514*/      blo jump_4506
            jump_4516:
/*0x4516*/      bx lr

            data_4518:
/*0x4518*/  .word 0x2000034a


            .thumb_func
            call_451c:
/*0x451c*/      push {r4, r5, r6, lr}
/*0x451e*/      mov r5, r0
/*0x4520*/      ldr r6, [pc, #0x18] /* data_453c */
/*0x4522*/      movs r4, #3
/*0x4524*/      b jump_4534
            jump_4526:
/*0x4526*/      ldrb r2, [r5]
/*0x4528*/      movs r1, #0x60
/*0x452a*/      mov r0, r6
/*0x452c*/      bl call_35d4
/*0x4530*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4532*/      adds r6, #0x60
            jump_4534:
/*0x4534*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4536*/      uxtb r4, r4
/*0x4538*/      bhs jump_4526
/*0x453a*/      pop {r4, r5, r6, pc}

            data_453c:
/*0x453c*/  .word 0x2000034a


            .thumb_func
            call_4540:
/*0x4540*/      cmp r0, #0xff
/*0x4542*/      beq jump_4556
/*0x4544*/      ldr r2, [pc, #0x10] /* data_4558 */
/*0x4546*/      add r0, r2
/*0x4548*/      movs r2, #3
/*0x454a*/      b jump_4550
            jump_454c:
/*0x454c*/      strb r1, [r0], #0x60
            jump_4550:
/*0x4550*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4552*/      uxtb r2, r2
/*0x4554*/      bhs jump_454c
            jump_4556:
/*0x4556*/      bx lr

            data_4558:
/*0x4558*/  .word 0x2000034a


            .thumb_func
            call_455c:
/*0x455c*/      push {r4, lr}
/*0x455e*/      mov r4, r0
/*0x4560*/      bl call_358c
/*0x4564*/      subs r1, r4, #1
/*0x4566*/      tst r4, r1
/*0x4568*/      bne jump_456e
/*0x456a*/      ands r0, r1
/*0x456c*/      pop {r4, pc}
            jump_456e:
/*0x456e*/      udiv r1, r0, r4
/*0x4572*/      mls r0, r4, r1, r0
/*0x4576*/      pop {r4, pc}

            .thumb_func
            call_4578:
/*0x4578*/      cmp r1, #0
/*0x457a*/      ldr r1, [r0, #0x10]
/*0x457c*/      beq jump_4584
/*0x457e*/      orr r1, r1, #1
/*0x4582*/      b jump_4588
            jump_4584:
/*0x4584*/      bic r1, r1, #1
            jump_4588:
/*0x4588*/      str r1, [r0, #0x10]
/*0x458a*/      bx lr

            .thumb_func
            call_458c:
/*0x458c*/      push {r4, r5, r6, r7, lr}
/*0x458e*/      ldrb r3, [r1]
/*0x4590*/      ldr r7, [r0, #0x50]
/*0x4592*/      add.w r4, r0, r3, lsl #2
/*0x4596*/      add.w r2, r4, #0x40
/*0x459a*/      add.w r5, r4, #0x90
/*0x459e*/      add.w r6, r4, #0xa0
/*0x45a2*/      lsls r3, r3, #1
/*0x45a4*/      movs r4, #1
/*0x45a6*/      lsls r4, r3
/*0x45a8*/      mvns r4, r4
/*0x45aa*/      ands r7, r4
/*0x45ac*/      str r7, [r0, #0x50]
/*0x45ae*/      ldr r7, [r0, #0x54]
/*0x45b0*/      ands r7, r4
/*0x45b2*/      str r7, [r0, #0x54]
/*0x45b4*/      ldr r4, [r0, #0x54]
/*0x45b6*/      ldrb r7, [r1, #5]
/*0x45b8*/      lsls r7, r3
/*0x45ba*/      orrs r4, r7
/*0x45bc*/      str r4, [r0, #0x54]
/*0x45be*/      ldr r4, [r2]
/*0x45c0*/      movw r7, #0x107
/*0x45c4*/      bics r4, r7
/*0x45c6*/      str r4, [r2]
/*0x45c8*/      ldr r4, [r2]
/*0x45ca*/      ldrh r7, [r1, #2]
/*0x45cc*/      orrs r4, r7
/*0x45ce*/      str r4, [r2]
/*0x45d0*/      ldrh r2, [r1, #6]
/*0x45d2*/      str r2, [r5]
/*0x45d4*/      ldrh r2, [r1, #8]
/*0x45d6*/      str r2, [r6]
/*0x45d8*/      ldr r2, [r0, #0x50]
/*0x45da*/      ldrb r1, [r1, #4]
/*0x45dc*/      lsls r1, r3
/*0x45de*/      orrs r2, r1
/*0x45e0*/      str r2, [r0, #0x50]
/*0x45e2*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_45e4:
/*0x45e4*/      ldrh r2, [r1]
/*0x45e6*/      str.w r2, [r0, #0x88]
/*0x45ea*/      ldrh r2, [r1, #2]
/*0x45ec*/      str.w r2, [r0, #0x84]
/*0x45f0*/      ldr r2, [r0]
/*0x45f2*/      bic r2, r2, #0x30000
/*0x45f6*/      str r2, [r0]
/*0x45f8*/      ldr r2, [r0]
/*0x45fa*/      bic r2, r2, #0x1000000
/*0x45fe*/      str r2, [r0]
/*0x4600*/      ldr r2, [r0]
/*0x4602*/      ldr r3, [r1, #4]
/*0x4604*/      orrs r2, r3
/*0x4606*/      str r2, [r0]
/*0x4608*/      ldrh r1, [r1, #8]
/*0x460a*/      str r1, [r0, #0x78]
/*0x460c*/      bx lr

/*0x460e*/  .byte 0x00
/*0x460f*/  .byte 0x00


            .thumb_func
            call_4610:
/*0x4610*/      ldr r0, [pc, #0x28] /* data_463c */
/*0x4612*/      ldrb r1, [r0, #1]
/*0x4614*/      cbz r1, jump_461a
/*0x4616*/      movs r0, #0
/*0x4618*/      bx lr
            jump_461a:
/*0x461a*/      ldrb r1, [r0, #0xa]
/*0x461c*/      cbz r1, jump_4622
/*0x461e*/      movs r0, #1
/*0x4620*/      bx lr
            jump_4622:
/*0x4622*/      ldrb r0, [r0, #9]
/*0x4624*/      cbz r0, jump_462a
/*0x4626*/      movs r0, #2
/*0x4628*/      bx lr
            jump_462a:
/*0x462a*/      ldr r0, [pc, #0x14] /* data_4640 */
/*0x462c*/      ldrb r0, [r0, #8]
/*0x462e*/      cmp r0, #1
/*0x4630*/      beq jump_4636
/*0x4632*/      movs r0, #5
/*0x4634*/      bx lr
            jump_4636:
/*0x4636*/      movs r0, #3
/*0x4638*/      bx lr

/*0x463a*/  .byte 0x00
/*0x463b*/  .byte 0x00

            data_463c:
/*0x463c*/  .word 0x200007b4
            data_4640:
/*0x4640*/  .word 0x20001ba4


            .thumb_func
            call_4644:
/*0x4644*/      push {r4, lr}
/*0x4646*/      cbz r0, jump_4670
/*0x4648*/      bl call_4a74
/*0x464c*/      cmp r0, #0
/*0x464e*/      beq jump_4686
/*0x4650*/      movs r1, #0xb
/*0x4652*/      ldr r0, [pc, #0x34] /* data_4688 */
/*0x4654*/      bl call_35e2
/*0x4658*/      ldr r0, [pc, #0x2c] /* data_4688 */
/*0x465a*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x465c*/      ldrb r1, [r0, #1]
/*0x465e*/      lsls r2, r1, #0x19
/*0x4660*/      mov.w r1, #0
/*0x4664*/      str r1, [r0]
/*0x4666*/      bpl jump_4670
/*0x4668*/      ldrb r1, [r0, #1]
/*0x466a*/      orr r1, r1, #0x40
/*0x466e*/      strb r1, [r0, #1]
            jump_4670:
/*0x4670*/      bl call_6784
/*0x4674*/      ldr r1, [pc, #0x14] /* data_468c */
/*0x4676*/      movs r0, #1
/*0x4678*/      strb r0, [r1]
/*0x467a*/      ldr r1, [pc, #0x14] /* data_4690 */
/*0x467c*/      strb r0, [r1]
/*0x467e*/      ldr r1, [pc, #0x14] /* data_4694 */
/*0x4680*/      strb r0, [r1]
/*0x4682*/      ldr r1, [pc, #0x14] /* data_4698 */
/*0x4684*/      strb r0, [r1]
            jump_4686:
/*0x4686*/      pop {r4, pc}

            data_4688:
/*0x4688*/  .word 0x200007c4
            data_468c:
/*0x468c*/  .word 0x20000834
            data_4690:
/*0x4690*/  .word 0x20000835
            data_4694:
/*0x4694*/  .word 0x20000836
            data_4698:
/*0x4698*/  .word 0x20000837


            .thumb_func
            call_469c:
/*0x469c*/      push {r4, r5, lr}
/*0x469e*/      ldr r3, [pc, #0x40] /* data_46e0 */
/*0x46a0*/      add.w r2, r3, #0xf
/*0x46a4*/      ldrb r1, [r3, #2]
/*0x46a6*/      ldrb r2, [r2, r1]
/*0x46a8*/      cbz r2, jump_46dc
/*0x46aa*/      lsrs r4, r1, #5
/*0x46ac*/      add.w r5, r3, #0x68
/*0x46b0*/      ldr.w r4, [r5, r4, lsl #2]
/*0x46b4*/      and r5, r1, #0x1f
/*0x46b8*/      movs r1, #1
/*0x46ba*/      lsls r1, r5
/*0x46bc*/      tst r4, r1
/*0x46be*/      beq jump_46c4
/*0x46c0*/      movs r1, #1
/*0x46c2*/      b jump_46c6
            jump_46c4:
/*0x46c4*/      movs r1, #0
            jump_46c6:
/*0x46c6*/      cmp r0, #0xff
/*0x46c8*/      beq jump_46ce
/*0x46ca*/      cmp r0, r1
/*0x46cc*/      bne jump_46dc
            jump_46ce:
/*0x46ce*/      ldrb r0, [r3, #1]
/*0x46d0*/      bfi r0, r1, #0, #1
/*0x46d4*/      strb r0, [r3, #1]
/*0x46d6*/      strb r2, [r3]
/*0x46d8*/      movs r0, #1
/*0x46da*/      pop {r4, r5, pc}
            jump_46dc:
/*0x46dc*/      movs r0, #0
/*0x46de*/      pop {r4, r5, pc}

            data_46e0:
/*0x46e0*/  .word 0x200007c0


            .thumb_func
            call_46e4:
/*0x46e4*/      movs r1, #0x58
/*0x46e6*/      ldr r2, [pc, #0x18] /* data_4700 */
/*0x46e8*/      b jump_46f4
            jump_46ea:
/*0x46ea*/      ldrb r3, [r2, r1]
/*0x46ec*/      cmp r3, r0
/*0x46ee*/      bne jump_46f4
/*0x46f0*/      uxtb r0, r1
/*0x46f2*/      bx lr
            jump_46f4:
/*0x46f4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x46f6*/      uxth r1, r1
/*0x46f8*/      bhs jump_46ea
/*0x46fa*/      movs r0, #0
/*0x46fc*/      bx lr

/*0x46fe*/  .byte 0x00
/*0x46ff*/  .byte 0x00

            data_4700:
/*0x4700*/  .word 0x200007cf


            .thumb_func
            call_4704:
/*0x4704*/      ldr r3, [pc, #0x2c] /* data_4734 */
/*0x4706*/      push {r4, lr}
/*0x4708*/      ldrb r2, [r3, r0]
/*0x470a*/      cbz r2, jump_472c
/*0x470c*/      cbz r1, jump_4710
/*0x470e*/      strb r2, [r1]
            jump_4710:
/*0x4710*/      ldr r2, [pc, #0x20] /* data_4734 */
/*0x4712*/      lsrs r1, r0, #5
/*0x4714*/      adds r2, #0x59
/*0x4716*/      and r4, r0, #0x1f
/*0x471a*/      ldr.w r1, [r2, r1, lsl #2]
/*0x471e*/      movs r2, #1
/*0x4720*/      lsls r2, r4
/*0x4722*/      tst r1, r2
/*0x4724*/      beq jump_472c
/*0x4726*/      ldrb r0, [r3, r0]
/*0x4728*/      cmp r0, #0x2f
/*0x472a*/      blo jump_4730
            jump_472c:
/*0x472c*/      movs r0, #1
/*0x472e*/      pop {r4, pc}
            jump_4730:
/*0x4730*/      movs r0, #0
/*0x4732*/      pop {r4, pc}

            data_4734:
/*0x4734*/  .word 0x200007cf

            jump_4738:
/*0x4738*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x473c*/      mov r5, r1
/*0x473e*/      mov r4, r0
/*0x4740*/      movs r1, #0x58
/*0x4742*/      ldr r0, [pc, #0x48] /* data_478c */
/*0x4744*/      bl call_35e2
/*0x4748*/      ldr r0, [pc, #0x40] /* data_478c */
/*0x474a*/      movs r1, #0
/*0x474c*/      subs r0, #0xf
/*0x474e*/      ldr r6, [pc, #0x3c] /* data_478c */
/*0x4750*/      str r1, [r0, #0x68]
/*0x4752*/      str r1, [r0, #0x6c]
/*0x4754*/      add.w r2, r0, #0x68
/*0x4758*/      movs r3, #1
/*0x475a*/      str r1, [r0, #0x70]
/*0x475c*/      b jump_4780
            jump_475e:
/*0x475e*/      ldrb r1, [r4]
/*0x4760*/      ldrb r0, [r4, #1]
/*0x4762*/      strb r0, [r6, r1]
/*0x4764*/      ldrb r0, [r4, #2]
/*0x4766*/      cbz r0, jump_477e
/*0x4768*/      ldrb r1, [r4]
/*0x476a*/      lsrs r0, r1, #5
/*0x476c*/      and r1, r1, #0x1f
/*0x4770*/      ldr.w r7, [r2, r0, lsl #2]
/*0x4774*/      lsl.w r1, r3, r1
/*0x4778*/      orrs r7, r1
/*0x477a*/      str.w r7, [r2, r0, lsl #2]
            jump_477e:
/*0x477e*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_4780:
/*0x4780*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x4782*/      uxtb r5, r5
/*0x4784*/      bhs jump_475e
/*0x4786*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x478a*/  .byte 0x00
/*0x478b*/  .byte 0x00

            data_478c:
/*0x478c*/  .word 0x200007cf


            .thumb_func
            call_4790:
/*0x4790*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4794*/      lsrs r1, r0, #8
/*0x4796*/      lsls r1, r1, #0x1f
/*0x4798*/      beq jump_47a0
/*0x479a*/      bl call_4f44
/*0x479e*/      b jump_4860
            jump_47a0:
/*0x47a0*/      uxtb r3, r0
/*0x47a2*/      lsrs r2, r0, #0x18
/*0x47a4*/      movs r4, #1
/*0x47a6*/      cmp r3, #0xe8
/*0x47a8*/      bls jump_47d4
/*0x47aa*/      lsrs r0, r0, #0x18
/*0x47ac*/      ubfx r2, r0, #1, #1
/*0x47b0*/      cmp r3, #0xec
/*0x47b2*/      bhs jump_47c2
/*0x47b4*/      subs r3, #0xe9
/*0x47b6*/      uxtb r1, r3
/*0x47b8*/      ldr r0, [pc, #0xac] /* data_4868 */
/*0x47ba*/      bl call_440c
/*0x47be*/      ldr r0, [pc, #0xac] /* data_486c */
/*0x47c0*/      b jump_485e
            jump_47c2:
/*0x47c2*/      cmp r3, #0xfd
/*0x47c4*/      bhi jump_4860
/*0x47c6*/      subs r3, #0xec
/*0x47c8*/      uxtb r1, r3
/*0x47ca*/      ldr r0, [pc, #0xa4] /* data_4870 */
/*0x47cc*/      bl call_440c
/*0x47d0*/      ldr r0, [pc, #0xa0] /* data_4874 */
/*0x47d2*/      b jump_485e
            jump_47d4:
/*0x47d4*/      and r1, r0, #7
/*0x47d8*/      movs r6, #1
/*0x47da*/      sub.w ip, r3, #0xe0
/*0x47de*/      lsls r6, r1
/*0x47e0*/      ldr r7, [pc, #0x94] /* data_4878 */
/*0x47e2*/      ldr r5, [pc, #0x98] /* data_487c */
/*0x47e4*/      cmp.w ip, #7
/*0x47e8*/      bhi jump_4800
/*0x47ea*/      mov r0, r5
/*0x47ec*/      uxtb r1, r6
/*0x47ee*/      ldrb r0, [r0]
/*0x47f0*/      lsls r2, r2, #0x1e
/*0x47f2*/      bpl jump_47f8
/*0x47f4*/      orrs r0, r1
/*0x47f6*/      b jump_47fa
            jump_47f8:
/*0x47f8*/      bics r0, r1
            jump_47fa:
/*0x47fa*/      strb r0, [r5]
            jump_47fc:
/*0x47fc*/      strb r4, [r7]
/*0x47fe*/      b jump_4860
            jump_4800:
/*0x4800*/      movs r1, #0
            jump_4802:
/*0x4802*/      add.w ip, r5, r1
/*0x4806*/      ldrb.w ip, [ip, #2]
/*0x480a*/      cmp ip, r3
/*0x480c*/      bne jump_481a
/*0x480e*/      lsls r0, r2, #0x1e
/*0x4810*/      bmi jump_47fc
/*0x4812*/      add r1, r5
/*0x4814*/      movs r0, #0
/*0x4816*/      strb r0, [r1, #2]
/*0x4818*/      b jump_47fc
            jump_481a:
/*0x481a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x481c*/      uxtb r1, r1
/*0x481e*/      cmp r1, #6
/*0x4820*/      blo jump_4802
/*0x4822*/      lsls r1, r2, #0x1e
/*0x4824*/      bpl jump_483e
/*0x4826*/      movs r1, #0
            jump_4828:
/*0x4828*/      add.w ip, r5, r1
/*0x482c*/      ldrb.w ip, [ip, #2]
/*0x4830*/      cmp.w ip, #0
/*0x4834*/      beq jump_4852
/*0x4836*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4838*/      uxtb r1, r1
/*0x483a*/      cmp r1, #6
/*0x483c*/      blo jump_4828
            jump_483e:
/*0x483e*/      lsls r3, r2, #0x1e
/*0x4840*/      ldr r2, [pc, #0x3c] /* data_4880 */
/*0x4842*/      ubfx r0, r0, #3, #5
/*0x4846*/      add r0, r2
/*0x4848*/      uxtb r1, r6
/*0x484a*/      ldrb r2, [r0, #2]
/*0x484c*/      bpl jump_4858
/*0x484e*/      orrs r2, r1
/*0x4850*/      b jump_485a
            jump_4852:
/*0x4852*/      adds r0, r5, r1
/*0x4854*/      strb r3, [r0, #2]
/*0x4856*/      b jump_47fc
            jump_4858:
/*0x4858*/      bics r2, r1
            jump_485a:
/*0x485a*/      strb r2, [r0, #2]
/*0x485c*/      ldr r0, [pc, #0x24] /* data_4884 */
            jump_485e:
/*0x485e*/      strb r4, [r0]
            jump_4860:
/*0x4860*/      movs r0, #1
/*0x4862*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x4866*/  .byte 0x00
/*0x4867*/  .byte 0x00

            data_4868:
/*0x4868*/  .word 0x20000841
            data_486c:
/*0x486c*/  .word 0x20000835
            data_4870:
/*0x4870*/  .word 0x20000845
            data_4874:
/*0x4874*/  .word 0x20000836
            data_4878:
/*0x4878*/  .word 0x20000834
            data_487c:
/*0x487c*/  .word 0x2000084c
            data_4880:
/*0x4880*/  .word 0x20000854
            data_4884:
/*0x4884*/  .word 0x20000837


            .thumb_func
            call_4888:
/*0x4888*/      push {r3, r4, r5, r6, r7, lr}
/*0x488a*/      ldr r4, [pc, #0x140] /* data_49cc */
/*0x488c*/      ldr r2, [pc, #0x140] /* data_49d0 */
/*0x488e*/      lsrs r5, r0, #3
/*0x4890*/      strb r0, [r4, #2]
/*0x4892*/      ldrb r3, [r2, r0]
/*0x4894*/      strb r3, [r4]
/*0x4896*/      ldrb r2, [r4, #3]
/*0x4898*/      and r6, r0, #7
/*0x489c*/      bic r2, r2, #1
/*0x48a0*/      bfi r2, r1, #1, #1
/*0x48a4*/      strb r2, [r4, #3]
/*0x48a6*/      mov r2, r4
/*0x48a8*/      cmp r3, #0xe8
/*0x48aa*/      ldrb r2, [r2, #1]
/*0x48ac*/      beq jump_48d0
/*0x48ae*/      movs r7, #1
/*0x48b0*/      lsls r7, r6
/*0x48b2*/      movs r6, #0x1c
/*0x48b4*/      uxtb r7, r7
/*0x48b6*/      cmp.w r6, r3, lsr #3
/*0x48ba*/      bne jump_48ee
/*0x48bc*/      ands r6, r3, #3
/*0x48c0*/      beq jump_48d6
/*0x48c2*/      cmp r6, #1
/*0x48c4*/      beq jump_48dc
/*0x48c6*/      cmp r6, #2
/*0x48c8*/      beq jump_48e2
/*0x48ca*/      cmp r6, #3
/*0x48cc*/      bne jump_48f8
/*0x48ce*/      b jump_48e8
            jump_48d0:
/*0x48d0*/      bfi r2, r1, #6, #1
/*0x48d4*/      b jump_4946
            jump_48d6:
/*0x48d6*/      bfi r2, r1, #2, #1
/*0x48da*/      b jump_48f6
            jump_48dc:
/*0x48dc*/      bfi r2, r1, #4, #1
/*0x48e0*/      b jump_48f6
            jump_48e2:
/*0x48e2*/      bfi r2, r1, #3, #1
/*0x48e6*/      b jump_48f6
            jump_48e8:
/*0x48e8*/      bfi r2, r1, #5, #1
/*0x48ec*/      b jump_48f6
            jump_48ee:
/*0x48ee*/      cmp r3, #0x39
/*0x48f0*/      bne jump_48f8
/*0x48f2*/      bfi r2, r1, #7, #1
            jump_48f6:
/*0x48f6*/      strb r2, [r4, #1]
            jump_48f8:
/*0x48f8*/      ldr r6, [pc, #0xd0] /* data_49cc */
/*0x48fa*/      .short 0x1d36 /* adds r6, r6, #4 */ 
/*0x48fc*/      cbz r1, jump_4932
/*0x48fe*/      ldrb r2, [r4, #1]
/*0x4900*/      lsls.w ip, r2, #0x19
/*0x4904*/      bpl jump_4946
/*0x4906*/      ldrb.w ip, [r6, r5]
/*0x490a*/      orr.w ip, ip, r7
/*0x490e*/      strb.w ip, [r6, r5]
/*0x4912*/      b jump_493e
            jump_4914:
/*0x4914*/      ldr r5, [pc, #0xbc] /* data_49d4 */
/*0x4916*/      strb r2, [r4, #1]
/*0x4918*/      ldrb r2, [r5, #1]
/*0x491a*/      cbz r2, jump_4956
/*0x491c*/      cbz r1, jump_4956
/*0x491e*/      mov r1, sp
/*0x4920*/      bl call_5eb4
/*0x4924*/      ldrb r0, [r5, #5]
/*0x4926*/      cmp r0, #0
/*0x4928*/      mov r0, sp
/*0x492a*/      beq jump_494c
/*0x492c*/      bl call_3b94
/*0x4930*/      b jump_4950
            jump_4932:
/*0x4932*/      ldrb r2, [r6, r5]
/*0x4934*/      tst r2, r7
/*0x4936*/      beq jump_4944
/*0x4938*/      bics r2, r7
/*0x493a*/      strb r2, [r6, r5]
/*0x493c*/      ldrb r2, [r4, #1]
            jump_493e:
/*0x493e*/      orr r2, r2, #1
/*0x4942*/      b jump_4914
            jump_4944:
/*0x4944*/      ldrb r2, [r4, #1]
            jump_4946:
/*0x4946*/      bic r2, r2, #1
/*0x494a*/      b jump_4914
            jump_494c:
/*0x494c*/      bl call_5244
            jump_4950:
/*0x4950*/      movs r0, #0
/*0x4952*/      strb r0, [r5, #1]
/*0x4954*/      b jump_4988
            jump_4956:
/*0x4956*/      cbz r3, jump_4988
/*0x4958*/      ldr r0, [r4]
/*0x495a*/      bl call_5610
/*0x495e*/      bl call_5054
/*0x4962*/      cbz r0, jump_4972
/*0x4964*/      ldrb r0, [r4]
/*0x4966*/      cbz r0, jump_4988
            jump_4968:
/*0x4968*/      ldr r0, [r4]
/*0x496a*/      pop.w {r3, r4, r5, r6, r7, lr}
/*0x496e*/      b.w call_4790
            jump_4972:
/*0x4972*/      ldrb r0, [r5, #5]
/*0x4974*/      cbz r0, jump_497c
/*0x4976*/      bl call_3c04
/*0x497a*/      b jump_4988
            jump_497c:
/*0x497c*/      ldrb r0, [r4]
/*0x497e*/      cmp r0, #0xe8
/*0x4980*/      beq jump_4988
/*0x4982*/      bl call_5b9c
/*0x4986*/      cbz r0, jump_498c
            jump_4988:
/*0x4988*/      movs r0, #1
/*0x498a*/      pop {r3, r4, r5, r6, r7, pc}
            jump_498c:
/*0x498c*/      ldrb r0, [r4, #1]
/*0x498e*/      lsls r0, r0, #0x1f
/*0x4990*/      ldrb r0, [r4, #3]
/*0x4992*/      lsl.w r0, r0, #0x1f
/*0x4996*/      beq jump_49b6
/*0x4998*/      cmp r0, #0
/*0x499a*/      bne jump_4968
/*0x499c*/      movs r0, #0xff
/*0x499e*/      bl call_469c
/*0x49a2*/      cmp r0, #0
/*0x49a4*/      bne jump_4968
/*0x49a6*/      bl call_5b64
/*0x49aa*/      cbnz r0, jump_49c2
/*0x49ac*/      ldrb r0, [r4, #1]
/*0x49ae*/      bic r0, r0, #1
/*0x49b2*/      strb r0, [r4, #1]
/*0x49b4*/      b jump_4968
            jump_49b6:
/*0x49b6*/      cmp r0, #0
/*0x49b8*/      bne jump_4968
/*0x49ba*/      bl call_5b64
/*0x49be*/      cmp r0, #0
/*0x49c0*/      beq jump_4968
            jump_49c2:
/*0x49c2*/      ldrb r0, [r4, #3]
/*0x49c4*/      orr r0, r0, #1
/*0x49c8*/      strb r0, [r4, #3]
/*0x49ca*/      b jump_4968

            data_49cc:
/*0x49cc*/  .word 0x200007c0
            data_49d0:
/*0x49d0*/  .word 0x200001ce
            data_49d4:
/*0x49d4*/  .word 0x200007b4


            .thumb_func
            call_49d8:
/*0x49d8*/      ldrh r2, [r1]
/*0x49da*/      bfi r2, r0, #0, #9
/*0x49de*/      strh r2, [r1]
/*0x49e0*/      bx lr

            .thumb_func
            call_49e2:
/*0x49e2*/      ubfx r0, r0, #0, #9
/*0x49e6*/      bx lr

            .thumb_func
            call_49e8:
/*0x49e8*/      push {r4, r5, r6, lr}
/*0x49ea*/      movs r4, #0
/*0x49ec*/      b jump_4a0e
            jump_49ee:
/*0x49ee*/      movs r3, #0
/*0x49f0*/      b jump_49fe
            jump_49f2:
/*0x49f2*/      ldrb r5, [r0, r4]
/*0x49f4*/      ldrb r6, [r1, r3]
/*0x49f6*/      cmp r5, r6
/*0x49f8*/      beq jump_4a02
/*0x49fa*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x49fc*/      uxtb r3, r3
            jump_49fe:
/*0x49fe*/      cmp r3, r2
/*0x4a00*/      blo jump_49f2
            jump_4a02:
/*0x4a02*/      cmp r3, r2
/*0x4a04*/      bne jump_4a0a
/*0x4a06*/      movs r0, #0
/*0x4a08*/      pop {r4, r5, r6, pc}
            jump_4a0a:
/*0x4a0a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4a0c*/      uxtb r4, r4
            jump_4a0e:
/*0x4a0e*/      cmp r4, r2
/*0x4a10*/      blo jump_49ee
/*0x4a12*/      movs r0, #1
/*0x4a14*/      pop {r4, r5, r6, pc}

/*0x4a16*/  .byte 0x00
/*0x4a17*/  .byte 0x00


            .thumb_func
            call_4a18:
/*0x4a18*/      push {r4, r5, r6, r7, lr}
/*0x4a1a*/      movs r4, #0xb
/*0x4a1c*/      movs r6, #0
/*0x4a1e*/      b jump_4a60
            jump_4a20:
/*0x4a20*/      ldr r3, [pc, #0x48] /* data_4a6c */
/*0x4a22*/      ldrb r7, [r3, r4]
/*0x4a24*/      cmp r7, #0xff
/*0x4a26*/      beq jump_4a60
/*0x4a28*/      movs r3, #8
/*0x4a2a*/      mov.w lr, #1
/*0x4a2e*/      ldr.w ip, [pc, #0x40] /* data_4a70 */
/*0x4a32*/      b jump_4a5a
            jump_4a34:
/*0x4a34*/      lsl.w r5, lr, r3
/*0x4a38*/      tst r5, r7
/*0x4a3a*/      bne jump_4a5a
/*0x4a3c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4a3e*/      uxtb r1, r1
/*0x4a40*/      bhs jump_4a46
/*0x4a42*/      movs r0, #0xff
/*0x4a44*/      pop {r4, r5, r6, r7, pc}
            jump_4a46:
/*0x4a46*/      add.w r5, r3, r4, lsl #3
/*0x4a4a*/      uxtb r5, r5
/*0x4a4c*/      cbz r2, jump_4a52
/*0x4a4e*/      ldrb.w r5, [ip, r5]
            jump_4a52:
/*0x4a52*/      .short 0x1c76 /* adds r6, r6, #1 */ 
/*0x4a54*/      strb r5, [r0], #1
/*0x4a58*/      uxtb r6, r6
            jump_4a5a:
/*0x4a5a*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4a5c*/      uxtb r3, r3
/*0x4a5e*/      bhs jump_4a34
            jump_4a60:
/*0x4a60*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4a62*/      uxtb r4, r4
/*0x4a64*/      bhs jump_4a20
/*0x4a66*/      mov r0, r6
/*0x4a68*/      pop {r4, r5, r6, r7, pc}

/*0x4a6a*/  .byte 0x00
/*0x4a6b*/  .byte 0x00

            data_4a6c:
/*0x4a6c*/  .word 0x200001b8
            data_4a70:
/*0x4a70*/  .word 0x200001ce


            .thumb_func
            call_4a74:
/*0x4a74*/      push {r4, lr}
/*0x4a76*/      bl call_62f4
/*0x4a7a*/      cmp r0, #0
/*0x4a7c*/      beq jump_4a8e
/*0x4a7e*/      movs r1, #0xb
/*0x4a80*/      ldr r0, [pc, #0x18] /* data_4a9c */
/*0x4a82*/      b jump_4a90
            jump_4a84:
/*0x4a84*/      ldrb r2, [r0, #-0x1]!
/*0x4a88*/      cmp r2, #0xff
/*0x4a8a*/      beq jump_4a90
/*0x4a8c*/      movs r0, #0
            jump_4a8e:
/*0x4a8e*/      pop {r4, pc}
            jump_4a90:
/*0x4a90*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4a92*/      uxtb r1, r1
/*0x4a94*/      bhs jump_4a84
/*0x4a96*/      movs r0, #1
/*0x4a98*/      pop {r4, pc}

/*0x4a9a*/  .byte 0x00
/*0x4a9b*/  .byte 0x00

            data_4a9c:
/*0x4a9c*/  .word 0x200001c3


            .thumb_func
            call_4aa0:
/*0x4aa0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4aa4*/      ldr.w ip, [pc, #0xb8] /* data_4b60 */
/*0x4aa8*/      ldr r2, [pc, #0xc0] /* data_4b6c */
/*0x4aaa*/      mov r0, ip
/*0x4aac*/      ldrb.w r1, [ip, #2]
/*0x4ab0*/      movs r5, #1
/*0x4ab2*/      ldr r4, [pc, #0xb0] /* data_4b64 */
/*0x4ab4*/      ldr r3, [pc, #0xb0] /* data_4b68 */
/*0x4ab6*/      movs r7, #3
/*0x4ab8*/      ldrb r0, [r0, #3]
/*0x4aba*/      ldrb r2, [r2, #2]
/*0x4abc*/      cmp r1, #0x1f
/*0x4abe*/      beq jump_4b3e
/*0x4ac0*/      bgt jump_4ae8
/*0x4ac2*/      cmp r1, #0xe
/*0x4ac4*/      beq jump_4b52
/*0x4ac6*/      bgt jump_4ada
/*0x4ac8*/      cmp r1, #1
/*0x4aca*/      beq jump_4b52
/*0x4acc*/      cmp r1, #8
/*0x4ace*/      beq jump_4b52
/*0x4ad0*/      cmp r1, #9
/*0x4ad2*/      beq jump_4b52
/*0x4ad4*/      cmp r1, #0xa
/*0x4ad6*/      bne jump_4b0e
/*0x4ad8*/      b jump_4b3a
            jump_4ada:
/*0x4ada*/      cmp r1, #0x10
/*0x4adc*/      beq jump_4b52
/*0x4ade*/      cmp r1, #0x11
/*0x4ae0*/      beq jump_4b52
/*0x4ae2*/      cmp r1, #0x16
/*0x4ae4*/      bne jump_4b0e
/*0x4ae6*/      b jump_4b52
            jump_4ae8:
/*0x4ae8*/      movs r6, #1
/*0x4aea*/      cmp r1, #0x28
/*0x4aec*/      beq jump_4b16
/*0x4aee*/      bgt jump_4b02
/*0x4af0*/      cmp r1, #0x21
/*0x4af2*/      beq jump_4b16
/*0x4af4*/      cmp r1, #0x25
/*0x4af6*/      beq jump_4b4e
/*0x4af8*/      cmp r1, #0x26
/*0x4afa*/      beq jump_4b52
/*0x4afc*/      cmp r1, #0x27
/*0x4afe*/      bne jump_4b0e
/*0x4b00*/      b jump_4b52
            jump_4b02:
/*0x4b02*/      cmp r1, #0x29
/*0x4b04*/      beq jump_4b26
/*0x4b06*/      cmp r1, #0x30
/*0x4b08*/      beq jump_4b26
/*0x4b0a*/      cmp r1, #0x48
/*0x4b0c*/      beq jump_4b52
            jump_4b0e:
/*0x4b0e*/      movs r5, #0
            jump_4b10:
/*0x4b10*/      mov r0, r5
/*0x4b12*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_4b16:
/*0x4b16*/      lsls r0, r0, #0x1e
/*0x4b18*/      bpl jump_4b10
/*0x4b1a*/      subs r1, #0x21
/*0x4b1c*/      lsls r6, r1
/*0x4b1e*/      uxtb r0, r6
/*0x4b20*/      bl call_3d1c
/*0x4b24*/      b jump_4b10
            jump_4b26:
/*0x4b26*/      lsls r0, r0, #0x1e
/*0x4b28*/      bpl jump_4b10
/*0x4b2a*/      subs r1, #0x29
/*0x4b2c*/      lsl.w r0, r6, r1
/*0x4b30*/      uxtb r0, r0
/*0x4b32*/      bl call_3bd0
/*0x4b36*/      strb r6, [r4]
/*0x4b38*/      b jump_4b10
            jump_4b3a:
/*0x4b3a*/      movs r0, #0x10
/*0x4b3c*/      b jump_4b40
            jump_4b3e:
/*0x4b3e*/      movs r0, #0x20
            jump_4b40:
/*0x4b40*/      strb.w r0, [r3, #0x2f9]
/*0x4b44*/      strb r7, [r4, #3]
/*0x4b46*/      mov r0, r2
/*0x4b48*/      bl call_43e8
/*0x4b4c*/      b jump_4b10
            jump_4b4e:
/*0x4b4e*/      movs r0, #0x40
/*0x4b50*/      b jump_4b40
            jump_4b52:
/*0x4b52*/      lsls r0, r0, #0x1e
/*0x4b54*/      bpl jump_4b10
/*0x4b56*/      ldr.w r0, [ip]
/*0x4b5a*/      bl call_54d4
/*0x4b5e*/      b jump_4b10

            data_4b60:
/*0x4b60*/  .word 0x200007c0
            data_4b64:
/*0x4b64*/  .word 0x200007b4
            data_4b68:
/*0x4b68*/  .word 0x200008a0
            data_4b6c:
/*0x4b6c*/  .word 0x20000894


            .thumb_func
            call_4b70:
/*0x4b70*/      ldr r0, [pc, #8] /* data_4b7c */
/*0x4b72*/      ldrb.w r0, [r0, #0x2f8]
/*0x4b76*/      b.w call_6324

/*0x4b7a*/  .byte 0x00
/*0x4b7b*/  .byte 0x00

            data_4b7c:
/*0x4b7c*/  .word 0x200008a0


            .thumb_func
            call_4b80:
/*0x4b80*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x4b84*/      ldr r4, [pc, #0x114] /* data_4c9c */
/*0x4b86*/      ldrh r1, [r4]
/*0x4b88*/      sub.w r0, r1, #0xff00
/*0x4b8c*/      subs r0, #0xff
/*0x4b8e*/      beq jump_4c8c
/*0x4b90*/      movs r2, #1
/*0x4b92*/      movs r1, #3
/*0x4b94*/      add r0, sp, #4
/*0x4b96*/      bl call_4a18
/*0x4b9a*/      movs r6, #1
/*0x4b9c*/      movs r7, #0
/*0x4b9e*/      ldr.w sb, [pc, #0x100] /* data_4ca0 */
/*0x4ba2*/      ldr r5, [pc, #0x100] /* data_4ca4 */
/*0x4ba4*/      movw r8, #0x1770
/*0x4ba8*/      movw sl, #0x2710
/*0x4bac*/      cmp r0, #2
/*0x4bae*/      beq jump_4bbc
/*0x4bb0*/      cmp r0, #3
/*0x4bb2*/      beq jump_4c1e
/*0x4bb4*/      ldrb r0, [r5, #8]
/*0x4bb6*/      cbz r0, jump_4c18
/*0x4bb8*/      strb r6, [r5]
/*0x4bba*/      b jump_4c1a
            jump_4bbc:
/*0x4bbc*/      movs r3, #0x12
/*0x4bbe*/      movs r2, #0x3c
/*0x4bc0*/      movs r1, #2
/*0x4bc2*/      add r0, sp, #4
/*0x4bc4*/      str r7, [sp]
/*0x4bc6*/      bl call_788c
/*0x4bca*/      cbz r0, jump_4bd6
/*0x4bcc*/      ldrh r1, [r4]
/*0x4bce*/      cmp r1, sl
/*0x4bd0*/      bls jump_4bf6
/*0x4bd2*/      strb r6, [r5, #2]
/*0x4bd4*/      b jump_4c1a
            jump_4bd6:
/*0x4bd6*/      movs r3, #0x46
/*0x4bd8*/      movs r2, #0x44
/*0x4bda*/      movs r1, #2
/*0x4bdc*/      add r0, sp, #4
/*0x4bde*/      str r7, [sp]
/*0x4be0*/      bl call_788c
/*0x4be4*/      mov.w fp, #2
/*0x4be8*/      cbz r0, jump_4bfa
/*0x4bea*/      ldrh r1, [r4]
/*0x4bec*/      cmp r1, sl
/*0x4bee*/      bls jump_4bf6
/*0x4bf0*/      strb.w fp, [r5, #2]
/*0x4bf4*/      b jump_4c1a
            jump_4bf6:
/*0x4bf6*/      strb r6, [r5, #8]
/*0x4bf8*/      b jump_4c84
            jump_4bfa:
/*0x4bfa*/      movs r3, #0x44
/*0x4bfc*/      movs r2, #0x3c
/*0x4bfe*/      movs r1, #2
/*0x4c00*/      add r0, sp, #4
/*0x4c02*/      str r7, [sp]
/*0x4c04*/      bl call_788c
/*0x4c08*/      cbz r0, jump_4c18
/*0x4c0a*/      ldrh r1, [r4]
/*0x4c0c*/      cmp r1, r8
/*0x4c0e*/      bls jump_4c84
/*0x4c10*/      strh r7, [r4]
/*0x4c12*/      strb.w fp, [sb]
/*0x4c16*/      b jump_4c84
            jump_4c18:
/*0x4c18*/      b jump_4c1a
            jump_4c1a:
/*0x4c1a*/      strb r7, [r5, #8]
/*0x4c1c*/      b jump_4c84
            jump_4c1e:
/*0x4c1e*/      movs r0, #0x42
/*0x4c20*/      str r0, [sp]
/*0x4c22*/      movs r3, #0x43
/*0x4c24*/      movs r2, #0x44
/*0x4c26*/      movs r1, #3
/*0x4c28*/      add r0, sp, #4
/*0x4c2a*/      bl call_788c
/*0x4c2e*/      cbz r0, jump_4c3e
/*0x4c30*/      ldrh r1, [r4]
/*0x4c32*/      cmp r1, r8
/*0x4c34*/      bls jump_4c84
/*0x4c36*/      strh r7, [r4]
/*0x4c38*/      strb.w r6, [sb]
/*0x4c3c*/      b jump_4c84
            jump_4c3e:
/*0x4c3e*/      movs r0, #0x51
/*0x4c40*/      str r0, [sp]
/*0x4c42*/      movs r3, #0x44
/*0x4c44*/      movs r2, #0x38
/*0x4c46*/      movs r1, #3
/*0x4c48*/      add r0, sp, #4
/*0x4c4a*/      bl call_788c
/*0x4c4e*/      cbz r0, jump_4c5e
/*0x4c50*/      ldrh r1, [r4]
/*0x4c52*/      cmp r1, r8
/*0x4c54*/      bls jump_4c84
/*0x4c56*/      strh r7, [r4]
/*0x4c58*/      strb r6, [r5, #0xa]
/*0x4c5a*/      strb r6, [r5]
/*0x4c5c*/      b jump_4c84
            jump_4c5e:
/*0x4c5e*/      movs r0, #0x36
/*0x4c60*/      str r0, [sp]
/*0x4c62*/      movs r3, #0x46
/*0x4c64*/      movs r2, #0x38
/*0x4c66*/      movs r1, #3
/*0x4c68*/      add r0, sp, #4
/*0x4c6a*/      bl call_788c
/*0x4c6e*/      cbz r0, jump_4c84
/*0x4c70*/      ldrh r1, [r4]
/*0x4c72*/      cmp r1, r8
/*0x4c74*/      bls jump_4c84
/*0x4c76*/      strh r7, [r4]
/*0x4c78*/      ldrb.w r0, [sb, #1]
/*0x4c7c*/      cbz r0, jump_4c98
/*0x4c7e*/      movs r0, #0
            jump_4c80:
/*0x4c80*/      strb.w r0, [sb, #1]
            jump_4c84:
/*0x4c84*/      ldrh r1, [r4]
/*0x4c86*/      cmp r1, sl
/*0x4c88*/      bls jump_4c94
/*0x4c8a*/      b jump_4c8e
            jump_4c8c:
/*0x4c8c*/      b jump_4c94
            jump_4c8e:
/*0x4c8e*/      movw r0, #0xffff
/*0x4c92*/      strh r0, [r4]
            jump_4c94:
/*0x4c94*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
            jump_4c98:
/*0x4c98*/      movs r0, #1
/*0x4c9a*/      b jump_4c80

            data_4c9c:
/*0x4c9c*/  .word 0x200001b6
            data_4ca0:
/*0x4ca0*/  .word 0x20000010
            data_4ca4:
/*0x4ca4*/  .word 0x200007b4


            .thumb_func
            call_4ca8:
/*0x4ca8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4cac*/      ldr r0, [pc, #0x22c] /* data_4edc */
/*0x4cae*/      ldr.w ip, [pc, #0x230] /* data_4ee0 */
/*0x4cb2*/      movs r5, #0
/*0x4cb4*/      ldrb r0, [r0, #0xa]
/*0x4cb6*/      ldrb.w r1, [ip, #4]
/*0x4cba*/      cbz r0, jump_4ce6
/*0x4cbc*/      ldrb.w r2, [ip, #6]
/*0x4cc0*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x4cc2*/      uxtb r2, r2
/*0x4cc4*/      strb.w r2, [ip, #6]
/*0x4cc8*/      cmp r2, #3
/*0x4cca*/      bls jump_4d72
/*0x4ccc*/      strb.w r5, [ip, #6]
/*0x4cd0*/      cmp r0, #6
/*0x4cd2*/      beq jump_4d72
/*0x4cd4*/      cmp r0, #7
            jump_4cd6:
/*0x4cd6*/      bne jump_4d72
/*0x4cd8*/      movs r0, #0x18
/*0x4cda*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4cdc*/      udiv r2, r1, r0
/*0x4ce0*/      mls r0, r0, r2, r1
/*0x4ce4*/      b jump_4d76
            jump_4ce6:
/*0x4ce6*/      ldr r0, [pc, #0x1fc] /* data_4ee4 */
/*0x4ce8*/      ldr r3, [pc, #0x1f4] /* data_4ee0 */
/*0x4cea*/      ldr r2, [pc, #0x1fc] /* data_4ee8 */
/*0x4cec*/      ldrb r0, [r0, #3]
/*0x4cee*/      addw r6, r3, #0x123
/*0x4cf2*/      ldr r3, [r3]
/*0x4cf4*/      add.w r4, r2, #0xe
/*0x4cf8*/      mov.w sb, #1
/*0x4cfc*/      cmp r0, #3
/*0x4cfe*/      bhi jump_4db6
/*0x4d00*/      ldrb r2, [r2, r0]
/*0x4d02*/      cmp r0, #1
/*0x4d04*/      add.w r2, r2, r2, lsl #1
/*0x4d08*/      add.w r2, r4, r2, lsl #1
/*0x4d0c*/      ldrb r4, [r3, #4]
/*0x4d0e*/      and r4, r4, #0xf
/*0x4d12*/      ldrb r4, [r2, r4]
/*0x4d14*/      beq jump_4d20
/*0x4d16*/      cmp r0, #2
/*0x4d18*/      beq jump_4d74
/*0x4d1a*/      cmp r0, #3
/*0x4d1c*/      bne jump_4cd6
/*0x4d1e*/      b jump_4d7c
            jump_4d20:
/*0x4d20*/      movs r0, #3
/*0x4d22*/      add.w r1, ip, #7
/*0x4d26*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x4d28*/      b jump_4d6c
            jump_4d2a:
/*0x4d2a*/      lsl.w r2, sb, r0
/*0x4d2e*/      ldrb.w r6, [ip, #7]
/*0x4d32*/      uxtb r2, r2
/*0x4d34*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4d36*/      tst r6, r2
/*0x4d38*/      ldrb r6, [r1, #-0x1]!
/*0x4d3c*/      beq jump_4d50
/*0x4d3e*/      cmp r6, r4
/*0x4d40*/      bhi jump_4d4c
/*0x4d42*/      strb r5, [r1]
/*0x4d44*/      ldrb.w r6, [ip, #7]
/*0x4d48*/      bics r6, r2
/*0x4d4a*/      b jump_4d62
            jump_4d4c:
/*0x4d4c*/      subs r2, r6, r4
/*0x4d4e*/      b jump_4d6a
            jump_4d50:
/*0x4d50*/      ldrb r7, [r3]
/*0x4d52*/      sub.w r8, r7, r4
/*0x4d56*/      cmp r6, r8
/*0x4d58*/      blt jump_4d68
/*0x4d5a*/      strb r7, [r1]
/*0x4d5c*/      ldrb.w r6, [ip, #7]
/*0x4d60*/      orrs r6, r2
            jump_4d62:
/*0x4d62*/      strb.w r6, [ip, #7]
/*0x4d66*/      b jump_4d6c
            jump_4d68:
/*0x4d68*/      adds r2, r6, r4
            jump_4d6a:
/*0x4d6a*/      strb r2, [r1]
            jump_4d6c:
/*0x4d6c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4d6e*/      uxtb r0, r0
/*0x4d70*/      bhs jump_4d2a
            jump_4d72:
/*0x4d72*/      b jump_4ed4
            jump_4d74:
/*0x4d74*/      adds r0, r1, r4
            jump_4d76:
/*0x4d76*/      strb.w r0, [ip, #4]
/*0x4d7a*/      b jump_4ed4
            jump_4d7c:
/*0x4d7c*/      movs r7, #0x60
/*0x4d7e*/      b jump_4dae
            jump_4d80:
/*0x4d80*/      mov r0, r4
/*0x4d82*/      bl call_455c
/*0x4d86*/      cbz r0, jump_4d8c
/*0x4d88*/      movs r0, #3
/*0x4d8a*/      b jump_4da8
            jump_4d8c:
/*0x4d8c*/      subs r0, r6, #2
/*0x4d8e*/      movs r1, #0
/*0x4d90*/      bl call_6f88
/*0x4d94*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x4d96*/      b jump_4dae
            jump_4d98:
/*0x4d98*/      ldrb r1, [r6]
/*0x4d9a*/      cmp r1, #2
/*0x4d9c*/      bhi jump_4da2
/*0x4d9e*/      strb r5, [r6]
/*0x4da0*/      b jump_4da6
            jump_4da2:
/*0x4da2*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x4da4*/      strb r1, [r6]
            jump_4da6:
/*0x4da6*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_4da8:
/*0x4da8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4daa*/      uxtb r0, r0
/*0x4dac*/      bhs jump_4d98
            jump_4dae:
/*0x4dae*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x4db0*/      uxtb r7, r7
/*0x4db2*/      bhs jump_4d80
/*0x4db4*/      b jump_4ed4
            jump_4db6:
/*0x4db6*/      cmp r0, #7
/*0x4db8*/      bls jump_4e32
/*0x4dba*/      ldrb r1, [r2, r0]
/*0x4dbc*/      ldrb r2, [r3, #4]
/*0x4dbe*/      add.w r1, r1, r1, lsl #1
/*0x4dc2*/      add.w r1, r4, r1, lsl #1
/*0x4dc6*/      and r2, r2, #0xf
/*0x4dca*/      bic r0, r0, #1
/*0x4dce*/      ldrb r2, [r1, r2]
/*0x4dd0*/      cmp r0, #8
/*0x4dd2*/      beq jump_4dde
/*0x4dd4*/      cmp r0, #0xa
/*0x4dd6*/      beq jump_4e34
/*0x4dd8*/      cmp r0, #0xc
/*0x4dda*/      bne jump_4ed4
/*0x4ddc*/      b jump_4e92
            jump_4dde:
/*0x4dde*/      movs r0, #0x60
/*0x4de0*/      b jump_4e2c
            jump_4de2:
/*0x4de2*/      ldrb r1, [r6], #-1
/*0x4de6*/      cbz r1, jump_4dec
/*0x4de8*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4dea*/      b jump_4dfc
            jump_4dec:
/*0x4dec*/      ldrb r1, [r6], #-1
/*0x4df0*/      cbz r1, jump_4df6
/*0x4df2*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x4df4*/      b jump_4dfc
            jump_4df6:
/*0x4df6*/      ldrb r1, [r6], #-1
/*0x4dfa*/      cbz r1, jump_4e2c
            jump_4dfc:
/*0x4dfc*/      ldr r1, [pc, #0xec] /* data_4eec */
/*0x4dfe*/      and r4, r0, #7
/*0x4e02*/      add.w r1, r1, r0, lsr #3
/*0x4e06*/      lsl.w r3, sb, r4
/*0x4e0a*/      ldrb r1, [r1]
/*0x4e0c*/      tst r1, r3
/*0x4e0e*/      beq jump_4e2c
/*0x4e10*/      movs r1, #3
/*0x4e12*/      b jump_4e24
            jump_4e14:
/*0x4e14*/      ldrb r3, [r6, #1]!
/*0x4e18*/      cmp r3, r2
/*0x4e1a*/      bhi jump_4e20
/*0x4e1c*/      strb r5, [r6]
/*0x4e1e*/      b jump_4e24
            jump_4e20:
/*0x4e20*/      subs r3, r3, r2
/*0x4e22*/      strb r3, [r6]
            jump_4e24:
/*0x4e24*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4e26*/      uxtb r1, r1
/*0x4e28*/      bhs jump_4e14
/*0x4e2a*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4e2c:
/*0x4e2c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4e2e*/      uxtb r0, r0
/*0x4e30*/      bhs jump_4de2
            jump_4e32:
/*0x4e32*/      b jump_4ed4
            jump_4e34:
/*0x4e34*/      ldrb.w r0, [ip, #0x3a]
/*0x4e38*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e3a*/      uxtb r0, r0
/*0x4e3c*/      strb.w r0, [ip, #0x3a]
/*0x4e40*/      cmp r0, r2
/*0x4e42*/      blo jump_4ed4
/*0x4e44*/      strb.w r5, [ip, #0x3a]
/*0x4e48*/      movs r0, #1
            jump_4e4a:
/*0x4e4a*/      add.w r1, r0, r0, lsl #1
/*0x4e4e*/      add.w r1, ip, r1, lsl #1
/*0x4e52*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e54*/      ldrh r2, [r1, #4]
/*0x4e56*/      strh r2, [r1, #-0x2]
/*0x4e5a*/      ldrb r2, [r1, #6]
/*0x4e5c*/      uxtb r0, r0
/*0x4e5e*/      strb r2, [r1]
/*0x4e60*/      cmp r0, #9
/*0x4e62*/      blo jump_4e4a
/*0x4e64*/      ldr r2, [pc, #0x78] /* data_4ee0 */
/*0x4e66*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x4e68*/      movs r0, #9
/*0x4e6a*/      strh r5, [r2, #0x38]
/*0x4e6c*/      strb.w r5, [r2, #0x3a]
/*0x4e70*/      b jump_4e84
            jump_4e72:
/*0x4e72*/      add.w r1, r0, r0, lsl #1
/*0x4e76*/      add.w r1, ip, r1, lsl #1
/*0x4e7a*/      ldrh r3, [r1, #1]!
/*0x4e7e*/      strh r3, [r1, #6]
/*0x4e80*/      ldrb r3, [r1, #2]
/*0x4e82*/      strb r3, [r1, #8]
            jump_4e84:
/*0x4e84*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4e86*/      uxtb r0, r0
/*0x4e88*/      bhs jump_4e72
/*0x4e8a*/      strh.w r5, [r2, #0xb]
/*0x4e8e*/      strb r5, [r2, #0xd]
/*0x4e90*/      b jump_4ed4
            jump_4e92:
/*0x4e92*/      ldrb.w r0, [ip, #0x2c]
/*0x4e96*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e98*/      uxtb r0, r0
/*0x4e9a*/      strb.w r0, [ip, #0x2c]
/*0x4e9e*/      cmp r0, r2
/*0x4ea0*/      blo jump_4ed4
/*0x4ea2*/      ldr r0, [pc, #0x3c] /* data_4ee0 */
/*0x4ea4*/      strb.w r5, [ip, #0x2c]
/*0x4ea8*/      adds r0, #0x2c
/*0x4eaa*/      movs r2, #6
/*0x4eac*/      b jump_4ece
            jump_4eae:
/*0x4eae*/      ldrsb r1, [r0, #-0x1]
/*0x4eb2*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x4eb4*/      cbz r1, jump_4ece
/*0x4eb6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4eb8*/      sxtb r1, r1
/*0x4eba*/      strb r1, [r0, #4]
/*0x4ebc*/      ldrb r3, [r0, #3]
/*0x4ebe*/      adds r4, r1, r3
/*0x4ec0*/      subs r4, #0xa
/*0x4ec2*/      cmp r4, #0x11
/*0x4ec4*/      ble jump_4ece
/*0x4ec6*/      subs r1, r3, r1
/*0x4ec8*/      adds r1, #0xa
/*0x4eca*/      bpl jump_4ece
/*0x4ecc*/      strb r5, [r0, #4]
            jump_4ece:
/*0x4ece*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4ed0*/      uxtb r2, r2
/*0x4ed2*/      bhs jump_4eae
            jump_4ed4:
/*0x4ed4*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4ed8*/      b.w call_5700

            data_4edc:
/*0x4edc*/  .word 0x200007b4
            data_4ee0:
/*0x4ee0*/  .word 0x20000090
            data_4ee4:
/*0x4ee4*/  .word 0x200008a0
            data_4ee8:
/*0x4ee8*/  .word 0x00007b60 /* possible pointer */
            data_4eec:
/*0x4eec*/  .word 0x200001b8


            .thumb_func
            call_4ef0:
/*0x4ef0*/      movs r1, #6
/*0x4ef2*/      ldr r0, [pc, #4] /* data_4ef8 */
/*0x4ef4*/      b.w jump_4738

            data_4ef8:
/*0x4ef8*/  .word 0x00007af0 /* possible pointer */


            .thumb_func
            call_4efc:
/*0x4efc*/      push {r3, r4, r5, lr}
/*0x4efe*/      movs r2, #1
/*0x4f00*/      movs r1, #3
/*0x4f02*/      mov r0, sp
/*0x4f04*/      bl call_4a18
/*0x4f08*/      ldr r4, [pc, #0x2c] /* data_4f38 */
/*0x4f0a*/      cmp r0, #3
/*0x4f0c*/      bne jump_4f2e
/*0x4f0e*/      movs r2, #3
/*0x4f10*/      ldr r1, [pc, #0x28] /* data_4f3c */
/*0x4f12*/      mov r0, sp
/*0x4f14*/      bl call_49e8
/*0x4f18*/      cbz r0, jump_4f2e
/*0x4f1a*/      ldrb r0, [r4, #2]
/*0x4f1c*/      mvn.w r1, r0, lsr #1
/*0x4f20*/      bfi r0, r1, #1, #1
/*0x4f24*/      strb r0, [r4, #2]
/*0x4f26*/      ldr r0, [pc, #0x18] /* data_4f40 */
/*0x4f28*/      ldrb r0, [r0, #2]
/*0x4f2a*/      bl call_43e8
            jump_4f2e:
/*0x4f2e*/      ldrb r0, [r4, #2]
/*0x4f30*/      ubfx r0, r0, #1, #1
/*0x4f34*/      pop {r3, r4, r5, pc}

/*0x4f36*/  .byte 0x00
/*0x4f37*/  .byte 0x00

            data_4f38:
/*0x4f38*/  .word 0x200008a0
            data_4f3c:
/*0x4f3c*/  .word 0x00007ae5 /* possible pointer */
            data_4f40:
/*0x4f40*/  .word 0x20000894


            .thumb_func
            call_4f44:
/*0x4f44*/      push {r4, lr}
/*0x4f46*/      lsrs r1, r0, #0x18
/*0x4f48*/      lsls r1, r1, #0x1e
/*0x4f4a*/      bpl jump_4f72
/*0x4f4c*/      uxtb r1, r0
/*0x4f4e*/      ldr r0, [pc, #0x74] /* data_4fc4 */
/*0x4f50*/      cmp r1, #0x5f
/*0x4f52*/      ldrb r0, [r0, #2]
/*0x4f54*/      beq jump_4f8e
/*0x4f56*/      bgt jump_4f74
/*0x4f58*/      cmp r1, #0x10
/*0x4f5a*/      beq jump_4f68
/*0x4f5c*/      cmp r1, #0x11
/*0x4f5e*/      beq jump_4f68
/*0x4f60*/      cmp r1, #0x12
/*0x4f62*/      beq jump_4f68
/*0x4f64*/      cmp r1, #0x13
/*0x4f66*/      bne jump_4f72
            jump_4f68:
/*0x4f68*/      ldr r1, [pc, #0x5c] /* data_4fc8 */
/*0x4f6a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4f6c*/      and r0, r0, #3
/*0x4f70*/      strb r0, [r1]
            jump_4f72:
/*0x4f72*/      pop {r4, pc}
            jump_4f74:
/*0x4f74*/      ldr r2, [pc, #0x54] /* data_4fcc */
/*0x4f76*/      cmp r1, #0x60
/*0x4f78*/      beq jump_4fa4
/*0x4f7a*/      movs r3, #3
/*0x4f7c*/      ldr r4, [pc, #0x50] /* data_4fd0 */
/*0x4f7e*/      cmp r1, #0x68
/*0x4f80*/      beq jump_4fb0
/*0x4f82*/      cmp r1, #0x69
/*0x4f84*/      beq jump_4fb4
/*0x4f86*/      cmp r1, #0x6a
/*0x4f88*/      bne jump_4f72
/*0x4f8a*/      movs r1, #1
/*0x4f8c*/      b jump_4fb6
            jump_4f8e:
/*0x4f8e*/      cmp r0, #0
/*0x4f90*/      beq jump_4f72
/*0x4f92*/      bl call_56f0
/*0x4f96*/      bl call_5d88
/*0x4f9a*/      ldr r1, [pc, #0x38] /* data_4fd4 */
/*0x4f9c*/      movw r0, #0x7530
/*0x4fa0*/      strh r0, [r1, #4]
/*0x4fa2*/      pop {r4, pc}
            jump_4fa4:
/*0x4fa4*/      ldrb r1, [r2, #2]
/*0x4fa6*/      mvns r3, r1
/*0x4fa8*/      bfi r1, r3, #0, #1
/*0x4fac*/      strb r1, [r2, #2]
/*0x4fae*/      b jump_4fbc
            jump_4fb0:
/*0x4fb0*/      movs r1, #0
/*0x4fb2*/      b jump_4fb6
            jump_4fb4:
/*0x4fb4*/      movs r1, #2
            jump_4fb6:
/*0x4fb6*/      strb.w r1, [r2, #0x2f8]
/*0x4fba*/      strb r3, [r4, #3]
            jump_4fbc:
/*0x4fbc*/      pop.w {r4, lr}
/*0x4fc0*/      b.w call_43e8

            data_4fc4:
/*0x4fc4*/  .word 0x20000894
            data_4fc8:
/*0x4fc8*/  .word 0x20000006
            data_4fcc:
/*0x4fcc*/  .word 0x200008a0
            data_4fd0:
/*0x4fd0*/  .word 0x200007b4
            data_4fd4:
/*0x4fd4*/  .word 0x20000010


            .thumb_func
            call_4fd8:
/*0x4fd8*/      ldr r0, [pc, #0x68] /* data_5044 */
/*0x4fda*/      ldrb r1, [r0, #3]
/*0x4fdc*/      lsls r1, r1, #0x1e
/*0x4fde*/      bpl jump_5012
/*0x4fe0*/      ldrb r1, [r0]
/*0x4fe2*/      movs r3, #1
/*0x4fe4*/      ldr r2, [pc, #0x60] /* data_5048 */
/*0x4fe6*/      cmp r1, #0xcf
/*0x4fe8*/      beq jump_5008
/*0x4fea*/      ldrb r1, [r0, #1]
/*0x4fec*/      lsls r1, r1, #0x1f
/*0x4fee*/      beq jump_5012
/*0x4ff0*/      mov r1, r2
/*0x4ff2*/      ldrb r0, [r0, #2]
/*0x4ff4*/      ldr r1, [r1]
/*0x4ff6*/      cmp r0, #0x13
/*0x4ff8*/      beq jump_5022
/*0x4ffa*/      cmp r0, #0x15
/*0x4ffc*/      beq jump_5026
/*0x4ffe*/      cmp r0, #0x17
/*0x5000*/      beq jump_502c
/*0x5002*/      cmp r0, #0x36
/*0x5004*/      bne jump_5012
/*0x5006*/      b jump_5032
            jump_5008:
/*0x5008*/      ldrb r0, [r2, #6]
/*0x500a*/      cmp r0, #4
/*0x500c*/      beq jump_501e
/*0x500e*/      cmp r0, #5
/*0x5010*/      beq jump_5016
            jump_5012:
/*0x5012*/      movs r0, #0
/*0x5014*/      bx lr
            jump_5016:
/*0x5016*/      strb r3, [r2, #9]
/*0x5018*/      movs r0, #6
/*0x501a*/      strb r0, [r2, #6]
/*0x501c*/      b jump_5040
            jump_501e:
/*0x501e*/      strb r3, [r2, #6]
/*0x5020*/      b jump_5040
            jump_5022:
/*0x5022*/      adds r1, #0xf
/*0x5024*/      b jump_5028
            jump_5026:
/*0x5026*/      adds r1, #0x64
            jump_5028:
/*0x5028*/      str r1, [r2]
/*0x502a*/      b jump_5040
            jump_502c:
/*0x502c*/      add.w r1, r1, #0x1f4
/*0x5030*/      b jump_5028
            jump_5032:
/*0x5032*/      movs r0, #8
/*0x5034*/      ldr r1, [pc, #0x14] /* data_504c */
/*0x5036*/      strb r0, [r2, #6]
/*0x5038*/      movs r0, #0
/*0x503a*/      strh r0, [r1, #4]
/*0x503c*/      ldr r0, [pc, #0x10] /* data_5050 */
/*0x503e*/      strb r3, [r0]
            jump_5040:
/*0x5040*/      movs r0, #1
/*0x5042*/      bx lr

            data_5044:
/*0x5044*/  .word 0x200007c0
            data_5048:
/*0x5048*/  .word 0x20001ba4
            data_504c:
/*0x504c*/  .word 0x20000010
            data_5050:
/*0x5050*/  .word 0x200007b4


            .thumb_func
            call_5054:
/*0x5054*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x5058*/      ldr r0, [pc, #0x1d0] /* data_522c */
/*0x505a*/      ldrh r1, [r0, #4]
/*0x505c*/      cbz r1, jump_5064
/*0x505e*/      movw r1, #0x7530
/*0x5062*/      strh r1, [r0, #4]
            jump_5064:
/*0x5064*/      ldr r6, [pc, #0x1d0] /* data_5238 */
/*0x5066*/      ldr r5, [pc, #0x1c8] /* data_5230 */
/*0x5068*/      ldr r7, [pc, #0x1c8] /* data_5234 */
/*0x506a*/      ldrb r1, [r6, #2]
/*0x506c*/      ldrb r3, [r5, #9]
/*0x506e*/      ldrb r0, [r6, #3]
/*0x5070*/      ldrb r2, [r6]
/*0x5072*/      movs r4, #0
/*0x5074*/      mov.w sb, #3
/*0x5078*/      cbz r3, jump_50d0
/*0x507a*/      lsls r0, r0, #0x1e
/*0x507c*/      bpl jump_50cc
/*0x507e*/      cmp r3, #1
/*0x5080*/      beq jump_5092
/*0x5082*/      ldr r0, [pc, #0x1b8] /* data_523c */
/*0x5084*/      ldrb r0, [r3, r0]
/*0x5086*/      cmp r1, r0
/*0x5088*/      beq jump_50be
/*0x508a*/      ldr r7, [pc, #0x1b0] /* data_523c */
/*0x508c*/      movs r0, #4
/*0x508e*/      adds r7, #0xa
/*0x5090*/      b jump_50b4
            jump_5092:
/*0x5092*/      ldrb.w r0, [r7, #0xe8]
/*0x5096*/      cmp r1, r0
/*0x5098*/      bne jump_509e
/*0x509a*/      movs r0, #2
/*0x509c*/      strb r0, [r5, #9]
            jump_509e:
/*0x509e*/      ldrb.w r0, [r7, #0xe9]
/*0x50a2*/      cmp r1, r0
/*0x50a4*/      bne jump_50cc
/*0x50a6*/      strb.w sb, [r5, #9]
/*0x50aa*/      b jump_50cc
            jump_50ac:
/*0x50ac*/      ldrb.w ip, [r7, r0]
/*0x50b0*/      cmp ip, r2
/*0x50b2*/      beq jump_50ba
            jump_50b4:
/*0x50b4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x50b6*/      uxtb r0, r0
/*0x50b8*/      bhs jump_50ac
            jump_50ba:
/*0x50ba*/      cmp r0, #0xff
/*0x50bc*/      bne jump_50cc
            jump_50be:
/*0x50be*/      ldr r0, [pc, #0x174] /* data_5234 */
/*0x50c0*/      adds r0, #0xe6
/*0x50c2*/      strb r1, [r3, r0]
/*0x50c4*/      movs r0, #1
/*0x50c6*/      strb r0, [r5, #9]
/*0x50c8*/      bl call_7aa0
            jump_50cc:
/*0x50cc*/      strb r4, [r6]
/*0x50ce*/      b jump_5120
            jump_50d0:
/*0x50d0*/      cmp r2, #0xcf
/*0x50d2*/      beq jump_5112
/*0x50d4*/      ldrb r3, [r6, #1]
/*0x50d6*/      lsls.w ip, r3, #0x1f
/*0x50da*/      ldr r3, [pc, #0x15c] /* data_5238 */
/*0x50dc*/      ldrb r3, [r3, #3]
/*0x50de*/      orr r3, r3, #1
/*0x50e2*/      beq jump_5156
/*0x50e4*/      ldr r2, [pc, #0x150] /* data_5238 */
/*0x50e6*/      ldrb.w r0, [r7, #0x2f9]
/*0x50ea*/      ldrb r2, [r2, #1]
/*0x50ec*/      cmp r0, #0x20
/*0x50ee*/      bic r4, r2, #1
/*0x50f2*/      mov.w r0, #0
/*0x50f6*/      beq jump_512a
/*0x50f8*/      ldr r2, [pc, #0x140] /* data_523c */
/*0x50fa*/      adds r2, #0x3c
            jump_50fc:
/*0x50fc*/      ldrb.w r5, [r2, r0, lsl #1]
/*0x5100*/      cmp r1, r5
/*0x5102*/      bne jump_514c
/*0x5104*/      add.w r0, r2, r0, lsl #1
/*0x5108*/      ldrb r0, [r0, #1]
/*0x510a*/      strb r0, [r6]
/*0x510c*/      strb r3, [r6, #3]
/*0x510e*/      strb r4, [r6, #1]
/*0x5110*/      b jump_5126
            jump_5112:
/*0x5112*/      ubfx r0, r0, #1, #1
/*0x5116*/      strb r0, [r5, #6]
/*0x5118*/      ldr r0, [pc, #0x124] /* data_5240 */
/*0x511a*/      ldrb r0, [r0, #8]
/*0x511c*/      cmp r0, #1
/*0x511e*/      beq jump_5126
            jump_5120:
/*0x5120*/      movs r0, #1
            jump_5122:
/*0x5122*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_5126:
/*0x5126*/      movs r0, #0
/*0x5128*/      b jump_5122
            jump_512a:
/*0x512a*/      ldr r2, [pc, #0x110] /* data_523c */
/*0x512c*/      adds r2, #0x24
            jump_512e:
/*0x512e*/      ldrb.w r5, [r2, r0, lsl #1]
/*0x5132*/      cmp r5, r1
/*0x5134*/      bne jump_5142
/*0x5136*/      add.w r0, r2, r0, lsl #1
/*0x513a*/      ldrb r0, [r0, #1]
/*0x513c*/      strb r0, [r6]
/*0x513e*/      strb r4, [r6, #1]
/*0x5140*/      b jump_521e
            jump_5142:
/*0x5142*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5144*/      uxtb r0, r0
/*0x5146*/      cmp r0, #0xc
/*0x5148*/      blo jump_512e
/*0x514a*/      b jump_5126
            jump_514c:
/*0x514c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x514e*/      uxtb r0, r0
/*0x5150*/      cmp r0, #0xc
/*0x5152*/      blo jump_50fc
/*0x5154*/      b jump_5126
            jump_5156:
/*0x5156*/      ldr.w r8, [pc, #0xd4] /* data_522c */
/*0x515a*/      ldrb r1, [r5, #6]
/*0x515c*/      add.w r8, r8, #6
/*0x5160*/      cbz r1, jump_51ac
/*0x5162*/      ldrb r0, [r5, #5]
/*0x5164*/      cmp r0, #0
/*0x5166*/      bne jump_5126
/*0x5168*/      bl call_4aa0
/*0x516c*/      cbnz r0, jump_51e8
/*0x516e*/      bl call_5d9c
/*0x5172*/      ldrb r0, [r6, #3]
/*0x5174*/      mov r1, r8
/*0x5176*/      lsls r0, r0, #0x1e
/*0x5178*/      mov.w r0, #0
/*0x517c*/      bpl jump_5194
            jump_517e:
/*0x517e*/      ldrb r2, [r1, r0]
/*0x5180*/      cbz r2, jump_518c
/*0x5182*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5184*/      uxtb r0, r0
/*0x5186*/      cmp r0, #0x6e
/*0x5188*/      blo jump_517e
/*0x518a*/      b jump_5120
            jump_518c:
/*0x518c*/      ldrb r2, [r6]
/*0x518e*/      strb.w r2, [r8, r0]
/*0x5192*/      b jump_5120
            jump_5194:
/*0x5194*/      ldrb r2, [r6]
            jump_5196:
/*0x5196*/      ldrb r3, [r1, r0]
/*0x5198*/      cmp r3, r2
/*0x519a*/      bne jump_51a2
/*0x519c*/      strb.w r4, [r8, r0]
/*0x51a0*/      b jump_5120
            jump_51a2:
/*0x51a2*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x51a4*/      uxtb r0, r0
/*0x51a6*/      cmp r0, #0x14
/*0x51a8*/      blo jump_5196
/*0x51aa*/      b jump_5120
            jump_51ac:
/*0x51ac*/      lsls r0, r0, #0x1e
/*0x51ae*/      bpl jump_51fa
/*0x51b0*/      cmp r2, #0x2c
/*0x51b2*/      beq jump_51c2
/*0x51b4*/      cmp r2, #0xe3
/*0x51b6*/      beq jump_51c2
/*0x51b8*/      cmp r2, #0xe6
/*0x51ba*/      beq jump_51c2
/*0x51bc*/      cmp r2, #0xe7
/*0x51be*/      bne jump_5126
/*0x51c0*/      b jump_51f0
            jump_51c2:
/*0x51c2*/      movs r2, #1
/*0x51c4*/      movs r1, #3
/*0x51c6*/      mov r0, sp
/*0x51c8*/      bl call_4a18
/*0x51cc*/      cmp r0, #3
/*0x51ce*/      bne jump_51ea
/*0x51d0*/      ldr r1, [pc, #0x68] /* data_523c */
/*0x51d2*/      movs r2, #3
/*0x51d4*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x51d6*/      mov r0, sp
/*0x51d8*/      bl call_49e8
/*0x51dc*/      cbz r0, jump_51ea
/*0x51de*/      ldrb r0, [r5, #7]
/*0x51e0*/      mvns r0, r0
/*0x51e2*/      strb r0, [r5, #7]
/*0x51e4*/      strb.w sb, [r5, #3]
            jump_51e8:
/*0x51e8*/      b jump_51f6
            jump_51ea:
/*0x51ea*/      ldrb r0, [r6]
/*0x51ec*/      cmp r0, #0xe3
/*0x51ee*/      bne jump_5126
            jump_51f0:
/*0x51f0*/      ldrb r0, [r7, #2]
/*0x51f2*/      lsls r0, r0, #0x1f
/*0x51f4*/      beq jump_5126
            jump_51f6:
/*0x51f6*/      strb r4, [r6]
/*0x51f8*/      b jump_5126
            jump_51fa:
/*0x51fa*/      ldr r1, [pc, #0x30] /* data_522c */
/*0x51fc*/      .short 0x1c89 /* adds r1, r1, #2 */ 
/*0x51fe*/      ldrb r0, [r1]
/*0x5200*/      cbz r0, jump_5206
/*0x5202*/      cmp r2, #0x29
/*0x5204*/      beq jump_521a
            jump_5206:
/*0x5206*/      movs r0, #0
/*0x5208*/      mov r1, r8
            jump_520a:
/*0x520a*/      ldrb r3, [r1, r0]
/*0x520c*/      cmp r3, r2
/*0x520e*/      bne jump_5222
/*0x5210*/      strb.w r4, [r8, r0]
/*0x5214*/      bl call_5d9c
/*0x5218*/      b jump_5120
            jump_521a:
/*0x521a*/      strb r0, [r6]
/*0x521c*/      strb r4, [r1]
            jump_521e:
/*0x521e*/      strb r3, [r6, #3]
/*0x5220*/      b jump_5126
            jump_5222:
/*0x5222*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5224*/      uxtb r0, r0
/*0x5226*/      cmp r0, #0x6e
/*0x5228*/      blo jump_520a
/*0x522a*/      b jump_5126

            data_522c:
/*0x522c*/  .word 0x20000010
            data_5230:
/*0x5230*/  .word 0x200007b4
            data_5234:
/*0x5234*/  .word 0x200008a0
            data_5238:
/*0x5238*/  .word 0x200007c0
            data_523c:
/*0x523c*/  .word 0x00007ade /* possible pointer */
            data_5240:
/*0x5240*/  .word 0x20001ba4


            .thumb_func
            call_5244:
/*0x5244*/      ldr r1, [pc, #0x1c] /* data_5264 */
/*0x5246*/      push {r4, lr}
/*0x5248*/      ldr r1, [r1]
/*0x524a*/      ldrh r2, [r0]
/*0x524c*/      strh r2, [r1]
/*0x524e*/      ldrb r0, [r0, #2]
/*0x5250*/      strb r0, [r1, #2]
/*0x5252*/      bl call_5700
/*0x5256*/      ldr r0, [pc, #0x10] /* data_5268 */
/*0x5258*/      ldrb r0, [r0, #2]
/*0x525a*/      pop.w {r4, lr}
/*0x525e*/      b.w call_43e8

/*0x5262*/  .byte 0x00
/*0x5263*/  .byte 0x00

            data_5264:
/*0x5264*/  .word 0x20000090
            data_5268:
/*0x5268*/  .word 0x20000894


            .thumb_func
            call_526c:
/*0x526c*/      push {r4, r5, r6, lr}
/*0x526e*/      ldr r4, [pc, #0x34] /* data_52a4 */
/*0x5270*/      movs r5, #0
/*0x5272*/      ldrb r0, [r4]
/*0x5274*/      cbz r0, jump_5284
/*0x5276*/      movs r0, #1
/*0x5278*/      bl call_4644
/*0x527c*/      cbz r0, jump_5284
/*0x527e*/      bl call_7aa0
/*0x5282*/      strb r5, [r4]
            jump_5284:
/*0x5284*/      ldrh r0, [r4, #4]
/*0x5286*/      cmp r0, #1
/*0x5288*/      bne jump_529e
/*0x528a*/      ldr r0, [pc, #0x1c] /* data_52a8 */
/*0x528c*/      ldrb r1, [r0, #6]
/*0x528e*/      cbz r1, jump_5294
/*0x5290*/      movs r1, #8
/*0x5292*/      strb r1, [r0, #6]
            jump_5294:
/*0x5294*/      ldr r0, [pc, #0x14] /* data_52ac */
/*0x5296*/      movs r1, #1
/*0x5298*/      strb r5, [r0, #5]
/*0x529a*/      strb r1, [r0]
/*0x529c*/      strh r5, [r4, #4]
            jump_529e:
/*0x529e*/      movs r0, #1
/*0x52a0*/      pop {r4, r5, r6, pc}

/*0x52a2*/  .byte 0x00
/*0x52a3*/  .byte 0x00

            data_52a4:
/*0x52a4*/  .word 0x20000010
            data_52a8:
/*0x52a8*/  .word 0x20001ba4
            data_52ac:
/*0x52ac*/  .word 0x200007b4


            .thumb_func
            call_52b0:
/*0x52b0*/      cmp r0, #0xff
/*0x52b2*/      bhs jump_52c2
/*0x52b4*/      adds r0, #0x2b
/*0x52b6*/      cmp r0, #0xff
/*0x52b8*/      bls jump_52be
/*0x52ba*/      movs r0, #0xff
/*0x52bc*/      bx lr
            jump_52be:
/*0x52be*/      uxtb r0, r0
/*0x52c0*/      bx lr
            jump_52c2:
/*0x52c2*/      movs r0, #0
/*0x52c4*/      bx lr

/*0x52c6*/  .byte 0x00
/*0x52c7*/  .byte 0x00


            .thumb_func
            call_52c8:
/*0x52c8*/      push {r0, r1, r4, r5, r6, r7, lr}
/*0x52ca*/      movs r5, #0
/*0x52cc*/      sub sp, #4
/*0x52ce*/      movw r1, #0x1ff
/*0x52d2*/      cmp.w r0, #0x200
/*0x52d6*/      bhs jump_5338
/*0x52d8*/      ldrh.w r4, [sp, #8]
/*0x52dc*/      cmp.w r4, #0x400
/*0x52e0*/      bhs jump_5338
/*0x52e2*/      lsrs r2, r0, #8
/*0x52e4*/      movs r3, #0x16
/*0x52e6*/      muls r2, r3, r2
/*0x52e8*/      ldr r3, [pc, #0x74] /* data_5360 */
/*0x52ea*/      uxtb r0, r0
/*0x52ec*/      ldrb r0, [r3, r0]
/*0x52ee*/      cmp r0, #0xff
/*0x52f0*/      beq jump_5338
/*0x52f2*/      add.w r1, r0, r2, lsl #2
/*0x52f6*/      add.w r3, r2, r0, lsr #2
/*0x52fa*/      lsls r0, r0, #0x1e
/*0x52fc*/      ldr r7, [pc, #0x64] /* data_5364 */
/*0x52fe*/      lsrs r0, r0, #0x1d
/*0x5300*/      movs r6, #3
/*0x5302*/      adds r3, #0xb0
/*0x5304*/      strh.w r1, [sp]
/*0x5308*/      add.w r2, r7, #0xea
/*0x530c*/      cmp r4, #3
/*0x530e*/      beq jump_533e
/*0x5310*/      ldrb.w r4, [sp, #8]
/*0x5314*/      strb r4, [r1, r2]
/*0x5316*/      cmp r4, #0xff
/*0x5318*/      beq jump_532e
/*0x531a*/      adds r1, r7, r3
/*0x531c*/      lsls r6, r0
/*0x531e*/      ldrb r2, [r1, #0xea]!
/*0x5322*/      ldrb.w r3, [sp, #9]
/*0x5326*/      bics r2, r6
/*0x5328*/      lsls r3, r0
/*0x532a*/      orrs r2, r3
/*0x532c*/      strb r2, [r1]
            jump_532e:
/*0x532e*/      strh.w r5, [sp]
            jump_5332:
/*0x5332*/      ldrh.w r0, [sp]
/*0x5336*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}
            jump_5338:
/*0x5338*/      strh.w r1, [sp]
/*0x533c*/      b jump_5332
            jump_533e:
/*0x533e*/      ldrb r1, [r1, r2]
/*0x5340*/      strh.w r1, [sp]
/*0x5344*/      cmp r1, #0xff
/*0x5346*/      beq jump_5332
/*0x5348*/      adds r2, r7, r3
/*0x534a*/      lsls r6, r0
/*0x534c*/      ldrb.w r2, [r2, #0xea]
/*0x5350*/      rsb.w r0, r0, #8
/*0x5354*/      ands r2, r6
/*0x5356*/      lsls r2, r0
/*0x5358*/      adds r0, r2, r1
/*0x535a*/      strh.w r0, [sp]
/*0x535e*/      b jump_5332

            data_5360:
/*0x5360*/  .word 0x20000226
            data_5364:
/*0x5364*/  .word 0x200008a0


            .thumb_func
            call_5368:
/*0x5368*/      push {r4, r5, r6, lr}
/*0x536a*/      ldr r4, [pc, #0x8c] /* data_53f8 */
/*0x536c*/      ldrb.w r0, [r4, #0x2f9]
/*0x5370*/      cmp r0, #0x10
/*0x5372*/      beq jump_538e
/*0x5374*/      cmp r0, #0x20
/*0x5376*/      beq jump_537e
/*0x5378*/      cmp r0, #0x40
/*0x537a*/      bne jump_538e
/*0x537c*/      b jump_5384
            jump_537e:
/*0x537e*/      ldr r1, [pc, #0x7c] /* data_53fc */
/*0x5380*/      movs r0, #0x10
/*0x5382*/      b jump_538a
            jump_5384:
/*0x5384*/      ldr r1, [pc, #0x74] /* data_53fc */
/*0x5386*/      movs r0, #2
/*0x5388*/      subs r1, #0x46
            jump_538a:
/*0x538a*/      bl call_63b0
            jump_538e:
/*0x538e*/      ldr r0, [pc, #0x70] /* data_5400 */
/*0x5390*/      ldrb r1, [r0, #2]
/*0x5392*/      ldr r0, [pc, #0x70] /* data_5404 */
/*0x5394*/      cbz r1, jump_539c
/*0x5396*/      ldrb r1, [r0, #9]
/*0x5398*/      cmp r1, #0
/*0x539a*/      bne jump_53dc
            jump_539c:
/*0x539c*/      ldrb r0, [r0, #7]
/*0x539e*/      movs r6, #0xe8
/*0x53a0*/      ldr r2, [pc, #0x64] /* data_5408 */
/*0x53a2*/      movs r3, #0xcf
/*0x53a4*/      cbz r0, jump_53de
/*0x53a6*/      ldr r5, [pc, #0x64] /* data_540c */
/*0x53a8*/      movs r1, #0x50
/*0x53aa*/      ldrb.w r0, [r5, #0xe7]
/*0x53ae*/      strb r1, [r2, r0]
/*0x53b0*/      ldrb.w r1, [r4, #0xe8]
/*0x53b4*/      cmp r1, r0
/*0x53b6*/      beq jump_53ba
/*0x53b8*/      strb r6, [r2, r1]
            jump_53ba:
/*0x53ba*/      ldrb.w r0, [r5, #0x65]
/*0x53be*/      movs r1, #0x51
/*0x53c0*/      strb r1, [r2, r0]
/*0x53c2*/      ldrb.w r1, [r4, #0xe9]
/*0x53c6*/      cmp r1, r0
/*0x53c8*/      beq jump_53cc
/*0x53ca*/      strb r3, [r2, r1]
            jump_53cc:
/*0x53cc*/      ldrb.w r1, [r5, #0xe5]
/*0x53d0*/      movs r0, #0x52
/*0x53d2*/      strb r0, [r2, r1]
/*0x53d4*/      ldrb.w r1, [r5, #0xe4]
/*0x53d8*/      movs r0, #0x4f
/*0x53da*/      strb r0, [r2, r1]
            jump_53dc:
/*0x53dc*/      pop {r4, r5, r6, pc}
            jump_53de:
/*0x53de*/      ldrb.w r0, [r4, #0xe8]
/*0x53e2*/      cmp r0, #0x3c
/*0x53e4*/      beq jump_53ec
/*0x53e6*/      movs r1, #0xe7
/*0x53e8*/      strb.w r1, [r2, #0x3c]
            jump_53ec:
/*0x53ec*/      strb r6, [r2, r0]
/*0x53ee*/      ldrb.w r0, [r4, #0xe9]
/*0x53f2*/      strb r3, [r2, r0]
/*0x53f4*/      pop {r4, r5, r6, pc}

/*0x53f6*/  .byte 0x00
/*0x53f7*/  .byte 0x00

            data_53f8:
/*0x53f8*/  .word 0x200008a0
            data_53fc:
/*0x53fc*/  .word 0x00007b32 /* possible pointer */
            data_5400:
/*0x5400*/  .word 0x20000894
            data_5404:
/*0x5404*/  .word 0x200007b4
            data_5408:
/*0x5408*/  .word 0x200001ce
            data_540c:
/*0x540c*/  .word 0x20000226


            .thumb_func
            call_5410:
/*0x5410*/      ldr r3, [pc, #0x88] /* data_549c */
/*0x5412*/      push {r4, lr}
/*0x5414*/      ldrb r0, [r3, #3]
/*0x5416*/      ldr r1, [pc, #0x88] /* data_54a0 */
/*0x5418*/      ldrb r0, [r1, r0]
/*0x541a*/      add.w r0, r0, r0, lsl #2
/*0x541e*/      adds r1, r0, r3
/*0x5420*/      ldr r0, [pc, #0x80] /* data_54a4 */
/*0x5422*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x5424*/      str r1, [r0]
/*0x5426*/      ldrb r2, [r1]
/*0x5428*/      cbnz r2, jump_543e
/*0x542a*/      ldrb r2, [r1, #1]
/*0x542c*/      cbnz r2, jump_543e
/*0x542e*/      ldrb r2, [r1, #2]
/*0x5430*/      cbnz r2, jump_543e
/*0x5432*/      movs r2, #0xff
/*0x5434*/      strb r2, [r1]
/*0x5436*/      ldr r1, [r0]
/*0x5438*/      strb r2, [r1, #1]
/*0x543a*/      ldr r1, [r0]
/*0x543c*/      strb r2, [r1, #2]
            jump_543e:
/*0x543e*/      ldrb r2, [r3, #3]
/*0x5440*/      mov.w r1, #0x120
/*0x5444*/      cmp r2, #3
/*0x5446*/      bhi jump_5466
/*0x5448*/      movs r3, #0
/*0x544a*/      cmp r2, #1
/*0x544c*/      beq jump_5458
/*0x544e*/      cmp r2, #2
/*0x5450*/      beq jump_5460
/*0x5452*/      cmp r2, #3
/*0x5454*/      bne jump_5494
/*0x5456*/      b jump_547c
            jump_5458:
/*0x5458*/      ldr r0, [pc, #0x48] /* data_54a4 */
/*0x545a*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x545c*/      str r3, [r0, #8]
/*0x545e*/      b jump_5494
            jump_5460:
/*0x5460*/      strb r3, [r0, #4]
/*0x5462*/      strb r3, [r0, #5]
/*0x5464*/      b jump_5494
            jump_5466:
/*0x5466*/      cmp r2, #7
/*0x5468*/      bls jump_5494
/*0x546a*/      bic r2, r2, #1
/*0x546e*/      cmp r2, #8
/*0x5470*/      beq jump_547c
/*0x5472*/      cmp r2, #0xa
/*0x5474*/      beq jump_5484
/*0x5476*/      cmp r2, #0xc
/*0x5478*/      bne jump_5494
/*0x547a*/      b jump_5488
            jump_547c:
/*0x547c*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x547e*/      bl call_35e2
/*0x5482*/      b jump_5494
            jump_5484:
/*0x5484*/      movs r1, #0x37
/*0x5486*/      b jump_547c
            jump_5488:
/*0x5488*/      movs r1, #0x29
/*0x548a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x548c*/      bl call_35e2
/*0x5490*/      bl call_6d84
            jump_5494:
/*0x5494*/      ldr r1, [pc, #0x10] /* data_54a8 */
/*0x5496*/      movs r0, #1
/*0x5498*/      strb r0, [r1]
/*0x549a*/      pop {r4, pc}

            data_549c:
/*0x549c*/  .word 0x200008a0
            data_54a0:
/*0x54a0*/  .word 0x00007b60 /* possible pointer */
            data_54a4:
/*0x54a4*/  .word 0x20000090
            data_54a8:
/*0x54a8*/  .word 0x200007b4


            .thumb_func
            call_54ac:
/*0x54ac*/      ldr r0, [pc, #0x20] /* data_54d0 */
/*0x54ae*/      ldrb r0, [r0, #3]
/*0x54b0*/      cmp r0, #8
/*0x54b2*/      beq jump_54ca
/*0x54b4*/      bgt jump_54be
/*0x54b6*/      cbz r0, jump_54ca
/*0x54b8*/      cmp r0, #1
/*0x54ba*/      bne jump_54c6
/*0x54bc*/      b jump_54ca
            jump_54be:
/*0x54be*/      cmp r0, #0xa
/*0x54c0*/      beq jump_54ca
/*0x54c2*/      cmp r0, #0xc
/*0x54c4*/      beq jump_54ca
            jump_54c6:
/*0x54c6*/      movs r0, #0
/*0x54c8*/      bx lr
            jump_54ca:
/*0x54ca*/      movs r0, #1
/*0x54cc*/      bx lr

/*0x54ce*/  .byte 0x00
/*0x54cf*/  .byte 0x00

            data_54d0:
/*0x54d0*/  .word 0x200008a0


            .thumb_func
            call_54d4:
/*0x54d4*/      push {r4, r5, r6, lr}
/*0x54d6*/      ldr r5, [pc, #0x124] /* data_55fc */
/*0x54d8*/      mov r4, r0
/*0x54da*/      ubfx r2, r0, #0x10, #8
/*0x54de*/      ldrb r0, [r5, #3]
/*0x54e0*/      ldr r3, [pc, #0x11c] /* data_5600 */
/*0x54e2*/      adds r1, r0, #1
/*0x54e4*/      uxtb r1, r1
/*0x54e6*/      cmp r2, #0x11
/*0x54e8*/      beq jump_5576
/*0x54ea*/      bgt jump_5520
/*0x54ec*/      cmp r2, #9
/*0x54ee*/      beq jump_5530
/*0x54f0*/      bgt jump_54fc
/*0x54f2*/      cmp r2, #1
/*0x54f4*/      beq jump_5530
/*0x54f6*/      cmp r2, #8
/*0x54f8*/      bne jump_554e
/*0x54fa*/      b jump_5530
            jump_54fc:
/*0x54fc*/      cmp r2, #0xe
/*0x54fe*/      beq jump_5580
/*0x5500*/      cmp r2, #0x10
/*0x5502*/      bne jump_554e
/*0x5504*/      strb r1, [r5, #3]
/*0x5506*/      .short 0x1fc9 /* subs r1, r1, #7 */ 
/*0x5508*/      cmp r1, #7
/*0x550a*/      blo jump_5510
/*0x550c*/      movs r0, #7
            jump_550e:
/*0x550e*/      strb r0, [r5, #3]
            jump_5510:
/*0x5510*/      bl call_5410
/*0x5514*/      bl call_56f0
/*0x5518*/      mov r0, r4
/*0x551a*/      bl call_5610
/*0x551e*/      b jump_55ea
            jump_5520:
/*0x5520*/      cmp r2, #0x16
/*0x5522*/      beq jump_5580
/*0x5524*/      cmp r2, #0x26
/*0x5526*/      beq jump_5580
/*0x5528*/      cmp r2, #0x27
/*0x552a*/      beq jump_5580
/*0x552c*/      cmp r2, #0x48
/*0x552e*/      bne jump_554e
            jump_5530:
/*0x5530*/      bl call_54ac
/*0x5534*/      cmp r0, #0
/*0x5536*/      beq jump_554e
/*0x5538*/      cmp r2, #1
/*0x553a*/      beq jump_5550
/*0x553c*/      cmp r2, #8
/*0x553e*/      beq jump_5550
/*0x5540*/      cmp r2, #9
/*0x5542*/      beq jump_5550
/*0x5544*/      cmp r2, #0x48
/*0x5546*/      bne jump_554e
/*0x5548*/      ldr r1, [pc, #0xb8] /* data_5604 */
/*0x554a*/      movs r0, #1
/*0x554c*/      strb r0, [r1, #1]
            jump_554e:
/*0x554e*/      pop {r4, r5, r6, pc}
            jump_5550:
/*0x5550*/      movs r1, #0
/*0x5552*/      cmp r2, #1
/*0x5554*/      beq jump_5566
/*0x5556*/      cmp r2, #8
/*0x5558*/      beq jump_5560
/*0x555a*/      cmp r2, #9
/*0x555c*/      beq jump_5564
/*0x555e*/      b jump_5566
            jump_5560:
/*0x5560*/      movs r1, #1
/*0x5562*/      b jump_5566
            jump_5564:
/*0x5564*/      movs r1, #2
            jump_5566:
/*0x5566*/      ldr r0, [r3]
/*0x5568*/      movs r2, #1
/*0x556a*/      adds r4, r0, r1
/*0x556c*/      ldrb r0, [r4]
/*0x556e*/      bl call_52b0
/*0x5572*/      strb r0, [r4]
/*0x5574*/      b jump_55ea
            jump_5576:
/*0x5576*/      strb r1, [r5, #3]
/*0x5578*/      cmp r1, #3
/*0x557a*/      bls jump_5510
/*0x557c*/      movs r0, #0
/*0x557e*/      b jump_550e
            jump_5580:
/*0x5580*/      ldr r1, [pc, #0x84] /* data_5608 */
/*0x5582*/      ldrb r0, [r1, r0]
/*0x5584*/      cmp r0, #0xff
/*0x5586*/      beq jump_55ea
/*0x5588*/      ldr r0, [pc, #0x74] /* data_5600 */
/*0x558a*/      movs r3, #6
/*0x558c*/      cmp r2, #0xe
/*0x558e*/      ldr r0, [r0]
/*0x5590*/      beq jump_55b0
/*0x5592*/      cmp r2, #0x16
/*0x5594*/      beq jump_55a0
/*0x5596*/      cmp r2, #0x26
/*0x5598*/      beq jump_55c4
/*0x559a*/      cmp r2, #0x27
/*0x559c*/      bne jump_55ea
/*0x559e*/      b jump_55dc
            jump_55a0:
/*0x55a0*/      ldrb r1, [r0, #3]
/*0x55a2*/      cmp r1, #8
/*0x55a4*/      bhs jump_55ea
/*0x55a6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x55a8*/      b jump_55b8
            jump_55aa:
/*0x55aa*/      bl call_6d84
/*0x55ae*/      b jump_55ea
            jump_55b0:
/*0x55b0*/      ldrb r1, [r0, #3]
/*0x55b2*/      cmp r1, #1
/*0x55b4*/      bls jump_55ea
/*0x55b6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_55b8:
/*0x55b8*/      strb r1, [r0, #3]
/*0x55ba*/      ldrb r0, [r5, #3]
/*0x55bc*/      cmp.w r3, r0, lsr #1
/*0x55c0*/      beq jump_55aa
/*0x55c2*/      b jump_55ea
            jump_55c4:
/*0x55c4*/      ldrb r1, [r0, #4]
/*0x55c6*/      and r2, r1, #0xf
/*0x55ca*/      cmp r2, #5
/*0x55cc*/      bhs jump_55ea
/*0x55ce*/      mov.w r2, #0x10000000
/*0x55d2*/      add.w r1, r2, r1, ror #4
/*0x55d6*/      ror.w r1, r1, #0x1c
/*0x55da*/      b jump_55e8
            jump_55dc:
/*0x55dc*/      ldrb r1, [r0, #4]
/*0x55de*/      lsls r2, r1, #0x1c
/*0x55e0*/      beq jump_55ea
/*0x55e2*/      subs r2, r1, #1
/*0x55e4*/      bfi r1, r2, #0, #4
            jump_55e8:
/*0x55e8*/      strb r1, [r0, #4]
            jump_55ea:
/*0x55ea*/      bl call_5700
/*0x55ee*/      ldr r0, [pc, #0x1c] /* data_560c */
/*0x55f0*/      ldrb r0, [r0, #2]
/*0x55f2*/      pop.w {r4, r5, r6, lr}
/*0x55f6*/      b.w call_43e8

/*0x55fa*/  .byte 0x00
/*0x55fb*/  .byte 0x00

            data_55fc:
/*0x55fc*/  .word 0x200008a0
            data_5600:
/*0x5600*/  .word 0x20000090
            data_5604:
/*0x5604*/  .word 0x200007b4
            data_5608:
/*0x5608*/  .word 0x00007b60 /* possible pointer */
            data_560c:
/*0x560c*/  .word 0x20000894


            .thumb_func
            call_5610:
/*0x5610*/      push {r4, r5, r6, lr}
/*0x5612*/      lsrs r1, r0, #0x18
/*0x5614*/      lsls r1, r1, #0x1e
/*0x5616*/      bpl jump_5670
/*0x5618*/      ldr r4, [pc, #0xc4] /* data_56e0 */
/*0x561a*/      ldr r5, [pc, #0xc8] /* data_56e4 */
/*0x561c*/      movs r6, #1
/*0x561e*/      ldrb r1, [r4, #0xa]
/*0x5620*/      cbz r1, jump_5628
/*0x5622*/      uxtb r2, r0
/*0x5624*/      cmp r2, #0xcf
/*0x5626*/      beq jump_5672
            jump_5628:
/*0x5628*/      ldr r1, [pc, #0xbc] /* data_56e8 */
/*0x562a*/      ldrb r1, [r1, #3]
/*0x562c*/      cmp r1, #7
/*0x562e*/      bls jump_5670
/*0x5630*/      and r2, r1, #1
/*0x5634*/      bic r3, r1, #1
/*0x5638*/      ldr r1, [pc, #0xa8] /* data_56e4 */
/*0x563a*/      ubfx r0, r0, #0x10, #8
/*0x563e*/      cmp r3, #8
/*0x5640*/      ldr r1, [r1]
/*0x5642*/      beq jump_56a4
/*0x5644*/      cmp r3, #0xa
/*0x5646*/      beq jump_56b8
/*0x5648*/      cmp r3, #0xc
/*0x564a*/      bne jump_5670
/*0x564c*/      ldr r3, [pc, #0x9c] /* data_56ec */
/*0x564e*/      ldrb r4, [r3, r0]
/*0x5650*/      cmp r4, #0xff
/*0x5652*/      beq jump_5670
/*0x5654*/      and r0, r4, #7
/*0x5658*/      add.w r0, r0, r0, lsl #2
/*0x565c*/      add r5, r0
/*0x565e*/      adds r5, #0xe
/*0x5660*/      cbz r2, jump_5664
/*0x5662*/      movs r1, #0
            jump_5664:
/*0x5664*/      mov r0, r5
/*0x5666*/      bl call_6f88
/*0x566a*/      lsrs r0, r4, #3
/*0x566c*/      strb r0, [r5, #3]
/*0x566e*/      strb r6, [r5, #4]
            jump_5670:
/*0x5670*/      pop {r4, r5, r6, pc}
            jump_5672:
/*0x5672*/      cmp r1, #8
/*0x5674*/      bhs switch_56a0
/*0x5676*/      tbb [pc, r1]

/*0x567a*/  .byte 0x13 /* case switch_56a0 */
/*0x567b*/  .byte 0x04 /* case switch_5682 */
/*0x567c*/  .byte 0x06 /* case switch_5686 */
/*0x567d*/  .byte 0x09 /* case switch_568c */
/*0x567e*/  .byte 0x13 /* case switch_56a0 */
/*0x567f*/  .byte 0x0b /* case switch_5690 */
/*0x5680*/  .byte 0x13 /* case switch_56a0 */
/*0x5681*/  .byte 0x0d /* case switch_5694 */

            switch_5682:
/*0x5682*/      movs r0, #2
/*0x5684*/      b jump_5688
            switch_5686:
/*0x5686*/      movs r0, #3
            jump_5688:
/*0x5688*/      strb r0, [r4, #0xa]
/*0x568a*/      b switch_56a0
            switch_568c:
/*0x568c*/      movs r0, #5
/*0x568e*/      b jump_5688
            switch_5690:
/*0x5690*/      movs r0, #7
/*0x5692*/      b jump_5688
            switch_5694:
/*0x5694*/      movs r0, #6
/*0x5696*/      strb r0, [r4, #0xa]
/*0x5698*/      movs r1, #0x80
/*0x569a*/      adds r0, r5, #7
/*0x569c*/      bl call_35e2
            switch_56a0:
/*0x56a0*/      strb r6, [r4]
            jump_56a2:
/*0x56a2*/      pop {r4, r5, r6, pc}
            jump_56a4:
/*0x56a4*/      cbz r2, jump_56a8
/*0x56a6*/      movs r1, #0
            jump_56a8:
/*0x56a8*/      add.w r0, r0, r0, lsl #1
/*0x56ac*/      add r0, r5
/*0x56ae*/      pop.w {r4, r5, r6, lr}
/*0x56b2*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x56b4*/      b.w call_6f88
            jump_56b8:
/*0x56b8*/      ldr r3, [pc, #0x30] /* data_56ec */
/*0x56ba*/      subs r3, #0x60
/*0x56bc*/      ldrb r0, [r3, r0]
/*0x56be*/      cmp r0, #0xff
/*0x56c0*/      beq jump_56a2
/*0x56c2*/      cbz r2, jump_56c6
/*0x56c4*/      movs r1, #0
            jump_56c6:
/*0x56c6*/      add.w r0, r0, r0, lsl #1
/*0x56ca*/      add.w r4, r5, r0, lsl #1
/*0x56ce*/      adds r0, r4, #4
/*0x56d0*/      bl call_6f88
/*0x56d4*/      ldrh r0, [r4, #4]
/*0x56d6*/      strh.w r0, [r4, #7]
/*0x56da*/      ldrb r0, [r4, #6]
/*0x56dc*/      strb r0, [r4, #9]
/*0x56de*/      pop {r4, r5, r6, pc}

            data_56e0:
/*0x56e0*/  .word 0x200007b4
            data_56e4:
/*0x56e4*/  .word 0x20000090
            data_56e8:
/*0x56e8*/  .word 0x200008a0
            data_56ec:
/*0x56ec*/  .word 0x00007bf8 /* possible pointer */


            .thumb_func
            call_56f0:
/*0x56f0*/      mov.w r1, #0x120
/*0x56f4*/      ldr r0, [pc, #4] /* data_56fc */
/*0x56f6*/      b.w call_35e2

/*0x56fa*/  .byte 0x00
/*0x56fb*/  .byte 0x00

            data_56fc:
/*0x56fc*/  .word 0x2000034a


            .thumb_func
            call_5700:
/*0x5700*/      push {r4, lr}
/*0x5702*/      bl call_4610
/*0x5706*/      cmp r0, #6
/*0x5708*/      bhs switch_5730
/*0x570a*/      tbb [pc, r0]

/*0x570e*/  .byte 0x03 /* case switch_5714 */
/*0x570f*/  .byte 0x06 /* case switch_571a */
/*0x5710*/  .byte 0x09 /* case switch_5720 */
/*0x5711*/  .byte 0x0c /* case switch_5726 */
/*0x5712*/  .byte 0x11 /* case switch_5730 */
/*0x5713*/  .byte 0x0f /* case switch_572c */

            switch_5714:
/*0x5714*/      bl call_402c
/*0x5718*/      b switch_5730
            switch_571a:
/*0x571a*/      bl call_3dc0
/*0x571e*/      b switch_5730
            switch_5720:
/*0x5720*/      bl call_3d44
/*0x5724*/      b switch_5730
            switch_5726:
/*0x5726*/      bl call_3fc4
/*0x572a*/      b switch_5730
            switch_572c:
/*0x572c*/      bl call_3edc
            switch_5730:
/*0x5730*/      pop.w {r4, lr}
/*0x5734*/      nop.w 
            jump_5738:
/*0x5738*/      ldr r0, [pc, #0x54] /* data_5790 */
/*0x573a*/      push {r3, lr}
/*0x573c*/      ldrb r0, [r0, #0xa]
/*0x573e*/      cbnz r0, jump_5788
/*0x5740*/      ldr r0, [pc, #0x50] /* data_5794 */
/*0x5742*/      ldrb r0, [r0]
/*0x5744*/      lsls r0, r0, #0x1e
/*0x5746*/      asrs r0, r0, #8
/*0x5748*/      lsrs r1, r0, #0x18
/*0x574a*/      movs r0, #0x5a
/*0x574c*/      bl call_4540
/*0x5750*/      ldr r0, [pc, #0x44] /* data_5798 */
/*0x5752*/      ldrb r0, [r0]
/*0x5754*/      cbz r0, jump_5788
/*0x5756*/      movs r0, #0
/*0x5758*/      str r0, [sp]
/*0x575a*/      ldr r0, [pc, #0x40] /* data_579c */
/*0x575c*/      movs r1, #0xff
/*0x575e*/      ldrb.w r0, [r0, #0x2f9]
/*0x5762*/      cmp r0, #0x10
/*0x5764*/      beq jump_5770
/*0x5766*/      cmp r0, #0x20
/*0x5768*/      beq jump_5776
/*0x576a*/      cmp r0, #0x40
/*0x576c*/      bne jump_5780
/*0x576e*/      b jump_577c
            jump_5770:
/*0x5770*/      strb.w r1, [sp]
/*0x5774*/      b jump_5780
            jump_5776:
/*0x5776*/      strb.w r1, [sp, #1]
/*0x577a*/      b jump_5780
            jump_577c:
/*0x577c*/      strb.w r1, [sp, #2]
            jump_5780:
/*0x5780*/      mov r1, sp
/*0x5782*/      movs r0, #0x5a
/*0x5784*/      bl call_44fc
            jump_5788:
/*0x5788*/      ldr r1, [pc, #0x14] /* data_57a0 */
/*0x578a*/      movs r0, #1
/*0x578c*/      strb r0, [r1]
/*0x578e*/      pop {r3, pc}

            data_5790:
/*0x5790*/  .word 0x200007b4
            data_5794:
/*0x5794*/  .word 0x2000008c
            data_5798:
/*0x5798*/  .word 0x20000011
            data_579c:
/*0x579c*/  .word 0x200008a0
            data_57a0:
/*0x57a0*/  .word 0x20000348


            .thumb_func
            call_57a4:
/*0x57a4*/      push {r4, lr}
/*0x57a6*/      ldr r4, [pc, #0x70] /* data_5818 */
/*0x57a8*/      cbz r0, jump_57e0
/*0x57aa*/      movs r1, #0
/*0x57ac*/      mov r0, r4
/*0x57ae*/      bl call_376e
/*0x57b2*/      movs r1, #0
/*0x57b4*/      mov r0, r4
/*0x57b6*/      bl call_375a
/*0x57ba*/      mov r0, r4
/*0x57bc*/      bl call_374c
/*0x57c0*/      movs r0, #0x29
/*0x57c2*/      bl call_5a48
/*0x57c6*/      bl call_3bf2
/*0x57ca*/      bl call_5f04
/*0x57ce*/      bl call_409c
/*0x57d2*/      movs r0, #1
/*0x57d4*/      bl call_6370
/*0x57d8*/      pop.w {r4, lr}
/*0x57dc*/      b.w jump_64ec
            jump_57e0:
/*0x57e0*/      bl call_3bf4
/*0x57e4*/      bl call_40c4
/*0x57e8*/      movs r0, #0
/*0x57ea*/      bl call_6370
/*0x57ee*/      movs r1, #0
/*0x57f0*/      mov r0, r4
/*0x57f2*/      bl call_3786
/*0x57f6*/      mov r0, r4
/*0x57f8*/      bl call_374c
/*0x57fc*/      movs r1, #1
/*0x57fe*/      mov r0, r4
/*0x5800*/      bl call_375a
/*0x5804*/      movs r1, #1
/*0x5806*/      mov r0, r4
/*0x5808*/      bl call_376e
/*0x580c*/      ldr r1, [pc, #0xc] /* data_581c */
/*0x580e*/      mov.w r0, #0x200
/*0x5812*/      str.w r0, [r1, #0x100]
/*0x5816*/      pop {r4, pc}

            data_5818:
/*0x5818*/  .word 0x40076000
            data_581c:
/*0x581c*/  .word 0xe000e004


            .thumb_func
            call_5820:
/*0x5820*/      push {r4, lr}
/*0x5822*/      mov r4, r0
/*0x5824*/      cmp r0, #2
/*0x5826*/      beq jump_5830
/*0x5828*/      movs r1, #0xb
/*0x582a*/      ldr r0, [pc, #0x24] /* data_5850 */
/*0x582c*/      bl call_35e2
            jump_5830:
/*0x5830*/      cbz r4, jump_584a
/*0x5832*/      movs r0, #2
            jump_5834:
/*0x5834*/      bl call_4b70
/*0x5838*/      ldr r1, [pc, #0x14] /* data_5850 */
/*0x583a*/      movs r0, #0
/*0x583c*/      strb r0, [r1, #3]
/*0x583e*/      bl call_5410
/*0x5842*/      pop.w {r4, lr}
/*0x5846*/      b.w call_5d9c
            jump_584a:
/*0x584a*/      movs r0, #1
/*0x584c*/      b jump_5834

/*0x584e*/  .byte 0x00
/*0x584f*/  .byte 0x00

            data_5850:
/*0x5850*/  .word 0x200007b4


            .thumb_func
            call_5854:
/*0x5854*/      push {r4, lr}
/*0x5856*/      movs r0, #0
/*0x5858*/      mov.w r2, #0x10000
/*0x585c*/      movs r3, #1
/*0x585e*/      mov r1, r0
/*0x5860*/      bl call_3b5c
/*0x5864*/      pop.w {r4, lr}
/*0x5868*/      movw r1, #0x8c9f
/*0x586c*/      ldr r0, [pc, #4] /* data_5874 */
/*0x586e*/      b.w call_3782

/*0x5872*/  .byte 0x00
/*0x5873*/  .byte 0x00

            data_5874:
/*0x5874*/  .word 0x40076000


            .thumb_func
            call_5878:
/*0x5878*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x587c*/      ldr.w sl, [pc, #0x124] /* data_59a4 */
/*0x5880*/      ldr r7, [pc, #0x124] /* data_59a8 */
/*0x5882*/      ldr.w r8, [pc, #0x128] /* data_59ac */
/*0x5886*/      ldrb.w r0, [sl, #6]
/*0x588a*/      mov.w r1, #0x120
/*0x588e*/      mov.w fp, #0
/*0x5892*/      mov.w sb, #0xff
/*0x5896*/      add.w r6, r7, #0x60
/*0x589a*/      add.w r5, r7, #0xc0
/*0x589e*/      cmp r0, #6
/*0x58a0*/      bhs switch_591a
/*0x58a2*/      tbb [pc, r0]

/*0x58a6*/  .byte 0x3a /* case switch_591a */
/*0x58a7*/  .byte 0x03 /* case switch_58ac */
/*0x58a8*/  .byte 0x03 /* case switch_58ac */
/*0x58a9*/  .byte 0x3a /* case switch_591a */
/*0x58aa*/  .byte 0x3c /* case switch_591e */
/*0x58ab*/  .byte 0x46 /* case switch_5932 */

            switch_58ac:
/*0x58ac*/      movs r1, #0x60
/*0x58ae*/      ldr r0, [pc, #0xf8] /* data_59a8 */
/*0x58b0*/      bl call_35e2
/*0x58b4*/      movs r2, #0xff
/*0x58b6*/      movs r1, #0x60
/*0x58b8*/      mov r0, r6
/*0x58ba*/      bl call_35d4
/*0x58be*/      movs r1, #0x60
/*0x58c0*/      mov r0, r5
/*0x58c2*/      bl call_35e2
/*0x58c6*/      movs r0, #0x60
/*0x58c8*/      ldr.w ip, [pc, #0xe4] /* data_59b0 */
/*0x58cc*/      mov r2, fp
/*0x58ce*/      mov r3, sb
/*0x58d0*/      mov r4, r8
/*0x58d2*/      b jump_58fa
            jump_58d4:
/*0x58d4*/      add.w r1, ip, r0, lsl #1
/*0x58d8*/      ldrh r1, [r1, #0x28]
/*0x58da*/      ubfx r8, r1, #0, #0xa
/*0x58de*/      and r1, r8, #0xff
/*0x58e2*/      cmp r1, #0xff
/*0x58e4*/      beq jump_58fa
/*0x58e6*/      cmp.w r8, #0xff
/*0x58ea*/      bhs jump_58f2
/*0x58ec*/      ldrb r1, [r4, r1]
/*0x58ee*/      strb r3, [r7, r1]
/*0x58f0*/      b jump_58f8
            jump_58f2:
/*0x58f2*/      bls jump_58fa
/*0x58f4*/      ldrb r1, [r4, r1]
/*0x58f6*/      strb r3, [r1, r5]
            jump_58f8:
/*0x58f8*/      strb r2, [r1, r6]
            jump_58fa:
/*0x58fa*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x58fc*/      uxtb r0, r0
/*0x58fe*/      bhs jump_58d4
/*0x5900*/      ldr r6, [pc, #0xb0] /* data_59b4 */
/*0x5902*/      movs r5, #0
            jump_5904:
/*0x5904*/      movs r3, #0
/*0x5906*/      ldrb r0, [r6, r5]
/*0x5908*/      mov r2, r3
/*0x590a*/      mov r1, r3
/*0x590c*/      ldrb r0, [r4, r0]
/*0x590e*/      bl call_670c
/*0x5912*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x5914*/      uxtb r5, r5
/*0x5916*/      cmp r5, #2
/*0x5918*/      bls jump_5904
            switch_591a:
/*0x591a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
            switch_591e:
/*0x591e*/      ldrb.w r4, [sl, #4]
/*0x5922*/      ldr r0, [pc, #0x84] /* data_59a8 */
/*0x5924*/      bl call_35e2
/*0x5928*/      ldrb.w r1, [r8, r4]
/*0x592c*/      strb.w sb, [r1, r5]
/*0x5930*/      b switch_591a
            switch_5932:
/*0x5932*/      ldr r0, [pc, #0x84] /* data_59b8 */
/*0x5934*/      ldrh r0, [r0, #2]
/*0x5936*/      lsls r0, r0, #0x15
/*0x5938*/      bpl jump_5998
/*0x593a*/      movs r4, #0
/*0x593c*/      bl call_5ac4
/*0x5940*/      mov ip, r0
/*0x5942*/      ldr r0, [pc, #0x78] /* data_59bc */
/*0x5944*/      mov.w lr, #7
/*0x5948*/      mov r2, sb
/*0x594a*/      mov r1, r8
/*0x594c*/      ldr r0, [r0]
/*0x594e*/      b jump_598a
            jump_5950:
/*0x5950*/      add.w r3, r0, r4, lsl #2
/*0x5954*/      ldrb.w r8, [r3, #1]
/*0x5958*/      cmp.w lr, r8, lsr #5
/*0x595c*/      beq jump_598e
/*0x595e*/      ldrh.w r3, [r0, r4, lsl #2]
/*0x5962*/      ubfx r3, r3, #0, #0xa
/*0x5966*/      ldrb r3, [r1, r3]
/*0x5968*/      strb r2, [r7, r3]
/*0x596a*/      ldrh.w r3, [r0, r4, lsl #2]
/*0x596e*/      ubfx r3, r3, #0, #0xa
/*0x5972*/      ldrb r3, [r1, r3]
/*0x5974*/      strb r2, [r3, r5]
/*0x5976*/      ldrh.w r8, [r0, r4, lsl #2]
/*0x597a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x597c*/      ubfx r8, r8, #0, #0xa
/*0x5980*/      uxth r4, r4
/*0x5982*/      ldrb.w r8, [r1, r8]
/*0x5986*/      strb.w fp, [r8, r6]
            jump_598a:
/*0x598a*/      cmp r4, ip
/*0x598c*/      blo jump_5950
            jump_598e:
/*0x598e*/      ldrb.w r0, [sl, #4]
/*0x5992*/      ldrb r0, [r1, r0]
/*0x5994*/      strb r2, [r0, r5]
/*0x5996*/      b switch_591a
            jump_5998:
/*0x5998*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x599c*/      ldr r0, [pc, #8] /* data_59a8 */
/*0x599e*/      b.w call_35e2

/*0x59a2*/  .byte 0x00
/*0x59a3*/  .byte 0x00

            data_59a4:
/*0x59a4*/  .word 0x20001ba4
            data_59a8:
/*0x59a8*/  .word 0x2000034a
            data_59ac:
/*0x59ac*/  .word 0x20000226
            data_59b0:
/*0x59b0*/  .word 0x200008a0
            data_59b4:
/*0x59b4*/  .word 0x00007b52 /* possible pointer */
            data_59b8:
/*0x59b8*/  .word 0x2000008c
            data_59bc:
/*0x59bc*/  .word 0x20000008


            .thumb_func
            call_59c0:
/*0x59c0*/      push {r4, lr}
/*0x59c2*/      mov.w r1, #0x3400
/*0x59c6*/      movs r0, #0
/*0x59c8*/      bl call_5ab0
/*0x59cc*/      ldr r1, [pc, #0x70] /* data_5a40 */
/*0x59ce*/      ldr r0, [r1]
/*0x59d0*/      movw r2, #0xf8ff
/*0x59d4*/      ands r0, r2
/*0x59d6*/      ldr r2, [pc, #0x6c] /* data_5a44 */
/*0x59d8*/      orr r0, r0, #0x300
/*0x59dc*/      orrs r0, r2
/*0x59de*/      str r0, [r1]
/*0x59e0*/      movs r2, #0
/*0x59e2*/      mov r1, r2
/*0x59e4*/      movs r0, #3
/*0x59e6*/      bl call_5a5e
/*0x59ea*/      mov r1, r0
/*0x59ec*/      movs r0, #0x2b
/*0x59ee*/      bl call_5a90
/*0x59f2*/      movs r2, #0
/*0x59f4*/      mov r1, r2
/*0x59f6*/      movs r0, #3
/*0x59f8*/      bl call_5a5e
/*0x59fc*/      mov r1, r0
/*0x59fe*/      movs r0, #0x2c
/*0x5a00*/      bl call_5a90
/*0x5a04*/      movs r2, #0
/*0x5a06*/      movs r1, #1
/*0x5a08*/      movs r0, #3
/*0x5a0a*/      bl call_5a5e
/*0x5a0e*/      mov r1, r0
/*0x5a10*/      movs r0, #0x2a
/*0x5a12*/      bl call_5a90
/*0x5a16*/      movs r2, #0
/*0x5a18*/      movs r1, #2
/*0x5a1a*/      movs r0, #3
/*0x5a1c*/      bl call_5a5e
/*0x5a20*/      mov r1, r0
/*0x5a22*/      movs r0, #0x29
/*0x5a24*/      bl call_5a90
/*0x5a28*/      movs r2, #0
/*0x5a2a*/      movs r1, #2
/*0x5a2c*/      movs r0, #3
/*0x5a2e*/      bl call_5a5e
/*0x5a32*/      mov r1, r0
/*0x5a34*/      pop.w {r4, lr}
/*0x5a38*/      movs r0, #0x35
/*0x5a3a*/      b.w call_5a90

/*0x5a3e*/  .byte 0x00
/*0x5a3f*/  .byte 0x00

            data_5a40:
/*0x5a40*/  .word 0xe000ed0c
            data_5a44:
/*0x5a44*/  .word 0x05fa0000


            .thumb_func
            call_5a48:
/*0x5a48*/      and r2, r0, #0x1f
/*0x5a4c*/      movs r1, #1
/*0x5a4e*/      lsls r1, r2
/*0x5a50*/      lsrs r0, r0, #5
/*0x5a52*/      lsls r0, r0, #2
/*0x5a54*/      add.w r0, r0, #-0x1fff2000
/*0x5a58*/      str.w r1, [r0, #0x180]
/*0x5a5c*/      bx lr

            .thumb_func
            call_5a5e:
/*0x5a5e*/      push {r4, r5, lr}
/*0x5a60*/      and r3, r0, #7
/*0x5a64*/      rsb.w r4, r3, #7
/*0x5a68*/      cmp r4, #4
/*0x5a6a*/      bls jump_5a6e
/*0x5a6c*/      movs r4, #4
            jump_5a6e:
/*0x5a6e*/      adds r0, r3, #4
/*0x5a70*/      cmp r0, #7
/*0x5a72*/      bhs jump_5a78
/*0x5a74*/      movs r3, #0
/*0x5a76*/      b jump_5a7a
            jump_5a78:
/*0x5a78*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_5a7a:
/*0x5a7a*/      movs r5, #1
/*0x5a7c*/      lsl.w r0, r5, r4
/*0x5a80*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5a82*/      ands r0, r1
/*0x5a84*/      lsls r0, r3
/*0x5a86*/      lsls r5, r3
/*0x5a88*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5a8a*/      ands r5, r2
/*0x5a8c*/      orrs r0, r5
/*0x5a8e*/      pop {r4, r5, pc}

            .thumb_func
            call_5a90:
/*0x5a90*/      lsls r1, r1, #0x1c
/*0x5a92*/      lsrs r1, r1, #0x18
/*0x5a94*/      cmp r0, #0
/*0x5a96*/      bge jump_5aa6
/*0x5a98*/      and r0, r0, #0xf
/*0x5a9c*/      add.w r0, r0, #-0x1fff2000
/*0x5aa0*/      strb.w r1, [r0, #0xd14]
/*0x5aa4*/      bx lr
            jump_5aa6:
/*0x5aa6*/      add.w r0, r0, #-0x1fff2000
/*0x5aaa*/      strb.w r1, [r0, #0x400]
/*0x5aae*/      bx lr

            .thumb_func
            call_5ab0:
/*0x5ab0*/      ldr r2, [pc, #8] /* data_5abc */
/*0x5ab2*/      ands r1, r2
/*0x5ab4*/      orrs r1, r0
/*0x5ab6*/      ldr r0, [pc, #8] /* data_5ac0 */
/*0x5ab8*/      str r1, [r0]
/*0x5aba*/      bx lr

            data_5abc:
/*0x5abc*/  .word 0x1fffff80
            data_5ac0:
/*0x5ac0*/  .word 0xe000ed08


            .thumb_func
            call_5ac4:
/*0x5ac4*/      ldr r0, [pc, #4] /* data_5acc */
/*0x5ac6*/      ldrh r0, [r0]
/*0x5ac8*/      bx lr

/*0x5aca*/  .byte 0x00
/*0x5acb*/  .byte 0x00

            data_5acc:
/*0x5acc*/  .word 0x20001b9c


            .thumb_func
            call_5ad0:
/*0x5ad0*/      push {r4, r5, r6, lr}
/*0x5ad2*/      ldr r4, [pc, #0x84] /* data_5b58 */
/*0x5ad4*/      sub.w r5, r4, #8
/*0x5ad8*/      ldrb r0, [r4, #8]
/*0x5ada*/      cmp r0, #1
/*0x5adc*/      beq jump_5ae8
/*0x5ade*/      cmp r0, #2
/*0x5ae0*/      bne jump_5b44
/*0x5ae2*/      ldrh r0, [r5]
/*0x5ae4*/      cbz r0, jump_5b46
/*0x5ae6*/      b jump_5b50
            jump_5ae8:
/*0x5ae8*/      ldr r0, [pc, #0x70] /* data_5b5c */
/*0x5aea*/      mov.w r6, #0
/*0x5aee*/      ldrb r0, [r0, #3]
/*0x5af0*/      lsls r0, r0, #0x1e
/*0x5af2*/      bmi jump_5b0a
/*0x5af4*/      ldrb r0, [r4, #6]
/*0x5af6*/      cmp r0, #1
/*0x5af8*/      bne jump_5b0a
/*0x5afa*/      bl call_4a74
/*0x5afe*/      cmp r0, #1
/*0x5b00*/      bne jump_5b0a
/*0x5b02*/      movs r0, #2
/*0x5b04*/      strb r0, [r4, #6]
/*0x5b06*/      ldr r0, [pc, #0x58] /* data_5b60 */
/*0x5b08*/      strh r6, [r0]
            jump_5b0a:
/*0x5b0a*/      ldrb r0, [r4, #6]
/*0x5b0c*/      cmp r0, #3
/*0x5b0e*/      beq jump_5b2c
/*0x5b10*/      cmp r0, #6
/*0x5b12*/      beq jump_5b1c
/*0x5b14*/      cmp r0, #7
/*0x5b16*/      beq jump_5b1c
/*0x5b18*/      cmp r0, #8
/*0x5b1a*/      bne jump_5b44
            jump_5b1c:
/*0x5b1c*/      bl call_4a74
/*0x5b20*/      cmp r0, #1
/*0x5b22*/      bne jump_5b44
/*0x5b24*/      pop.w {r4, r5, r6, lr}
/*0x5b28*/      b.w jump_5c5c
            jump_5b2c:
/*0x5b2c*/      bl call_4a74
/*0x5b30*/      cmp r0, #1
/*0x5b32*/      bne jump_5b44
/*0x5b34*/      ldrb r0, [r4, #7]
/*0x5b36*/      movs r1, #0
/*0x5b38*/      bl call_41c4
/*0x5b3c*/      strh r6, [r5]
/*0x5b3e*/      movs r0, #4
/*0x5b40*/      str r6, [r4]
/*0x5b42*/      strb r0, [r4, #6]
            jump_5b44:
/*0x5b44*/      pop {r4, r5, r6, pc}
            jump_5b46:
/*0x5b46*/      b jump_5b48
            jump_5b48:
/*0x5b48*/      ldrb r0, [r4, #7]
/*0x5b4a*/      movs r1, #0
/*0x5b4c*/      bl call_41c4
            jump_5b50:
/*0x5b50*/      pop.w {r4, r5, r6, lr}
/*0x5b54*/      b.w jump_7190

            data_5b58:
/*0x5b58*/  .word 0x20001ba4
            data_5b5c:
/*0x5b5c*/  .word 0x200007c0
            data_5b60:
/*0x5b60*/  .word 0x200001b6


            .thumb_func
            call_5b64:
/*0x5b64*/      ldr r0, [pc, #0x2c] /* data_5b94 */
/*0x5b66*/      push {r4, lr}
/*0x5b68*/      ldrb r0, [r0, #8]
/*0x5b6a*/      cmp r0, #1
/*0x5b6c*/      beq jump_5b8e
/*0x5b6e*/      ldr r0, [pc, #0x28] /* data_5b98 */
/*0x5b70*/      ldr r0, [r0]
/*0x5b72*/      bl call_49e2
/*0x5b76*/      movs r1, #3
/*0x5b78*/      bl call_52c8
/*0x5b7c*/      uxtb r1, r0
/*0x5b7e*/      cmp r1, #0xff
/*0x5b80*/      beq jump_5b8e
/*0x5b82*/      uxth r0, r0
/*0x5b84*/      ldr r1, [pc, #0x10] /* data_5b98 */
/*0x5b86*/      bl call_49d8
/*0x5b8a*/      movs r0, #1
/*0x5b8c*/      pop {r4, pc}
            jump_5b8e:
/*0x5b8e*/      movs r0, #0
/*0x5b90*/      pop {r4, pc}

/*0x5b92*/  .byte 0x00
/*0x5b93*/  .byte 0x00

            data_5b94:
/*0x5b94*/  .word 0x20001ba4
            data_5b98:
/*0x5b98*/  .word 0x200007c0


            .thumb_func
            call_5b9c:
/*0x5b9c*/      push {r4, r5, r6, lr}
/*0x5b9e*/      ldr r5, [pc, #0xb0] /* data_5c50 */
/*0x5ba0*/      ldr r4, [pc, #0xb0] /* data_5c54 */
/*0x5ba2*/      ldrb r0, [r5, #8]
/*0x5ba4*/      cbz r0, jump_5bb0
/*0x5ba6*/      cmp r0, #1
/*0x5ba8*/      beq jump_5bf6
/*0x5baa*/      cmp r0, #2
/*0x5bac*/      bne jump_5c1a
/*0x5bae*/      b jump_5bc4
            jump_5bb0:
/*0x5bb0*/      bl call_7044
/*0x5bb4*/      cmp r0, #0x60
/*0x5bb6*/      bhs jump_5c1a
/*0x5bb8*/      ldrb r1, [r4, #3]
/*0x5bba*/      lsls r1, r1, #0x1e
/*0x5bbc*/      bpl jump_5c44
/*0x5bbe*/      bl call_5d30
/*0x5bc2*/      b jump_5c44
            jump_5bc4:
/*0x5bc4*/      ldrb r0, [r4, #3]
/*0x5bc6*/      lsls r1, r0, #0x1e
/*0x5bc8*/      ldr r0, [pc, #0x88] /* data_5c54 */
/*0x5bca*/      ldr r0, [r0]
/*0x5bcc*/      bpl jump_5be4
/*0x5bce*/      bl call_49e2
/*0x5bd2*/      ldrh r1, [r5, #4]
/*0x5bd4*/      cmp r0, r1
/*0x5bd6*/      bne jump_5bb0
/*0x5bd8*/      ldrb r0, [r5, #9]
/*0x5bda*/      cmp r0, #3
/*0x5bdc*/      bne jump_5bb0
            jump_5bde:
/*0x5bde*/      bl call_5d9c
/*0x5be2*/      b jump_5c44
            jump_5be4:
/*0x5be4*/      bl call_49e2
/*0x5be8*/      ldrh r1, [r5, #4]
/*0x5bea*/      cmp r0, r1
/*0x5bec*/      bne jump_5c1a
/*0x5bee*/      ldrb r0, [r5, #9]
/*0x5bf0*/      cmp r0, #2
/*0x5bf2*/      beq jump_5bde
/*0x5bf4*/      b jump_5c44
            jump_5bf6:
/*0x5bf6*/      bl call_4fd8
/*0x5bfa*/      cbnz r0, jump_5c40
/*0x5bfc*/      ldrb r0, [r5, #6]
/*0x5bfe*/      cmp r0, #5
/*0x5c00*/      beq jump_5c1e
/*0x5c02*/      ldrb r1, [r4, #3]
/*0x5c04*/      lsls r1, r1, #0x1e
/*0x5c06*/      bpl jump_5c1a
/*0x5c08*/      cmp r0, #1
/*0x5c0a*/      beq jump_5c44
/*0x5c0c*/      movs r6, #1
/*0x5c0e*/      cmp r0, #2
/*0x5c10*/      beq jump_5c26
/*0x5c12*/      cmp r0, #3
/*0x5c14*/      beq jump_5c42
/*0x5c16*/      cmp r0, #4
/*0x5c18*/      beq jump_5c48
            jump_5c1a:
/*0x5c1a*/      movs r0, #0
/*0x5c1c*/      pop {r4, r5, r6, pc}
            jump_5c1e:
/*0x5c1e*/      pop.w {r4, r5, r6, lr}
/*0x5c22*/      b.w jump_70a0
            jump_5c26:
/*0x5c26*/      bl call_7114
/*0x5c2a*/      ldrb r0, [r5, #7]
/*0x5c2c*/      cmp r0, #0x60
/*0x5c2e*/      beq jump_5c42
/*0x5c30*/      ldr r0, [r4]
/*0x5c32*/      bl call_49e2
/*0x5c36*/      strh r0, [r5, #4]
/*0x5c38*/      movs r0, #3
/*0x5c3a*/      strb r0, [r5, #6]
/*0x5c3c*/      ldr r0, [pc, #0x18] /* data_5c58 */
/*0x5c3e*/      strb r6, [r0]
            jump_5c40:
/*0x5c40*/      b jump_5c44
            jump_5c42:
/*0x5c42*/      strb r6, [r5, #6]
            jump_5c44:
/*0x5c44*/      movs r0, #1
/*0x5c46*/      pop {r4, r5, r6, pc}
            jump_5c48:
/*0x5c48*/      movs r0, #5
/*0x5c4a*/      strb r0, [r5, #6]
/*0x5c4c*/      b jump_5c1e

/*0x5c4e*/  .byte 0x00
/*0x5c4f*/  .byte 0x00

            data_5c50:
/*0x5c50*/  .word 0x20001ba4
            data_5c54:
/*0x5c54*/  .word 0x200007c0
            data_5c58:
/*0x5c58*/  .word 0x200007b4

            jump_5c5c:
/*0x5c5c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5c60*/      ldr r5, [pc, #0xb8] /* data_5d1c */
/*0x5c62*/      mov.w r8, #1
/*0x5c66*/      ldrb r0, [r5, #6]
/*0x5c68*/      cmp r0, #8
/*0x5c6a*/      beq jump_5d06
/*0x5c6c*/      ldrb r0, [r5, #7]
/*0x5c6e*/      ldr r1, [pc, #0xb0] /* data_5d20 */
/*0x5c70*/      sub.w r7, r5, #8
/*0x5c74*/      add.w r4, r1, r0, lsl #1
/*0x5c78*/      mov r0, r5
/*0x5c7a*/      ldrh r1, [r7]
/*0x5c7c*/      ldr r6, [pc, #0xa4] /* data_5d24 */
/*0x5c7e*/      ldrh r0, [r0, #4]
/*0x5c80*/      adds r4, #0x28
/*0x5c82*/      cmp r1, #2
/*0x5c84*/      bne jump_5ca4
/*0x5c86*/      ldr r2, [r6]
/*0x5c88*/      ldrh r1, [r2]
/*0x5c8a*/      ldrh r2, [r2, #4]
/*0x5c8c*/      ubfx r1, r1, #0, #0xa
/*0x5c90*/      ubfx r2, r2, #0, #0xa
/*0x5c94*/      cmp r1, r2
/*0x5c96*/      bne jump_5ca4
/*0x5c98*/      bl call_52c8
/*0x5c9c*/      movw r0, #0xffff
/*0x5ca0*/      strh r0, [r4]
/*0x5ca2*/      b jump_5ce8
            jump_5ca4:
/*0x5ca4*/      movs r1, #0xff
/*0x5ca6*/      bl call_52c8
/*0x5caa*/      ldrb r0, [r5, #9]
/*0x5cac*/      cmp r0, #1
/*0x5cae*/      beq jump_5cfe
/*0x5cb0*/      bl call_6fb8
            jump_5cb4:
/*0x5cb4*/      ldrh r1, [r7]
/*0x5cb6*/      ldr r2, [r6]
/*0x5cb8*/      add.w r1, r2, r1, lsl #2
/*0x5cbc*/      mov.w r2, #0x1c00
/*0x5cc0*/      strh r0, [r1, #-0x2]
/*0x5cc4*/      ldrb r1, [r5, #9]
/*0x5cc6*/      ldrh r0, [r5, #4]
/*0x5cc8*/      orr.w r1, r2, r1, lsl #13
/*0x5ccc*/      orrs r0, r1
/*0x5cce*/      strh r0, [r4]
/*0x5cd0*/      ldrh r0, [r7]
/*0x5cd2*/      cmp r0, #0xff
/*0x5cd4*/      bhi jump_5ce0
/*0x5cd6*/      ldr r2, [r6]
/*0x5cd8*/      mov.w r1, #0xfc00
/*0x5cdc*/      strh.w r1, [r2, r0, lsl #2]
            jump_5ce0:
/*0x5ce0*/      ldrb r0, [r5, #7]
/*0x5ce2*/      movs r1, #1
/*0x5ce4*/      bl call_41c4
            jump_5ce8:
/*0x5ce8*/      ldr r0, [pc, #0x3c] /* data_5d28 */
/*0x5cea*/      ldrb r0, [r0, #2]
/*0x5cec*/      bl call_43e8
/*0x5cf0*/      ldrb r0, [r5, #6]
/*0x5cf2*/      cmp r0, #7
/*0x5cf4*/      beq jump_5d02
/*0x5cf6*/      strb.w r8, [r5, #6]
            jump_5cfa:
/*0x5cfa*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5cfe:
/*0x5cfe*/      movs r0, #0
/*0x5d00*/      b jump_5cb4
            jump_5d02:
/*0x5d02*/      movs r0, #8
/*0x5d04*/      strb r0, [r5, #6]
            jump_5d06:
/*0x5d06*/      ldr r1, [pc, #0x14] /* data_5d1c */
/*0x5d08*/      movs r0, #0
/*0x5d0a*/      subs r1, #8
/*0x5d0c*/      strb r0, [r5, #8]
/*0x5d0e*/      str r0, [r1, #4]
/*0x5d10*/      ldr r1, [pc, #0x18] /* data_5d2c */
/*0x5d12*/      strb r0, [r5, #6]
/*0x5d14*/      strb.w r8, [r1]
/*0x5d18*/      b jump_5cfa

/*0x5d1a*/  .byte 0x00
/*0x5d1b*/  .byte 0x00

            data_5d1c:
/*0x5d1c*/  .word 0x20001ba4
            data_5d20:
/*0x5d20*/  .word 0x200008a0
            data_5d24:
/*0x5d24*/  .word 0x20000008
            data_5d28:
/*0x5d28*/  .word 0x20000894
            data_5d2c:
/*0x5d2c*/  .word 0x200007b4


            .thumb_func
            call_5d30:
/*0x5d30*/      push {r0, r1, r4, lr}
/*0x5d32*/      mov r4, r0
/*0x5d34*/      bl call_5d9c
/*0x5d38*/      bl call_708c
/*0x5d3c*/      ldr r0, [pc, #0x40] /* data_5d80 */
/*0x5d3e*/      movs r1, #2
/*0x5d40*/      sub.w r2, r0, #8
/*0x5d44*/      strb r1, [r0, #8]
/*0x5d46*/      movs r1, #0
/*0x5d48*/      strh r1, [r2]
/*0x5d4a*/      str r1, [r2, #4]
/*0x5d4c*/      strb r4, [r0, #7]
/*0x5d4e*/      cmp r4, #0xff
/*0x5d50*/      beq jump_5d5e
/*0x5d52*/      ldr r1, [pc, #0x30] /* data_5d84 */
/*0x5d54*/      add.w r1, r1, r4, lsl #1
/*0x5d58*/      ldrh r1, [r1, #0x28]
/*0x5d5a*/      strh.w r1, [sp, #4]
            jump_5d5e:
/*0x5d5e*/      ldrh.w r1, [sp, #4]
/*0x5d62*/      ubfx r1, r1, #0, #0xa
/*0x5d66*/      strh r1, [r0, #4]
/*0x5d68*/      ldrb.w r1, [sp, #5]
/*0x5d6c*/      lsr.w r1, r1, #5
/*0x5d70*/      strb r1, [r0, #9]
/*0x5d72*/      bne jump_5d7c
/*0x5d74*/      pop.w {r2, r3, r4, lr}
/*0x5d78*/      b.w jump_7190
            jump_5d7c:
/*0x5d7c*/      pop {r2, r3, r4, pc}

/*0x5d7e*/  .byte 0x00
/*0x5d7f*/  .byte 0x00

            data_5d80:
/*0x5d80*/  .word 0x20001ba4
            data_5d84:
/*0x5d84*/  .word 0x200008a0


            .thumb_func
            call_5d88:
/*0x5d88*/      ldr r0, [pc, #0xc] /* data_5d98 */
/*0x5d8a*/      ldrb r1, [r0, #8]
/*0x5d8c*/      cmp r1, #0
/*0x5d8e*/      bne jump_5d96
/*0x5d90*/      movs r1, #1
/*0x5d92*/      strb r1, [r0, #8]
/*0x5d94*/      strb r1, [r0, #6]
            jump_5d96:
/*0x5d96*/      bx lr

            data_5d98:
/*0x5d98*/  .word 0x20001ba4


            .thumb_func
            call_5d9c:
/*0x5d9c*/      push {r3, r4, r5, r6, r7, lr}
/*0x5d9e*/      ldr r6, [pc, #0x7c] /* data_5e1c */
/*0x5da0*/      movs r7, #0
/*0x5da2*/      ldrb r0, [r6, #8]
/*0x5da4*/      cmp r0, #2
/*0x5da6*/      bne jump_5e16
/*0x5da8*/      sub.w r5, r6, #8
/*0x5dac*/      ldrh r0, [r5]
/*0x5dae*/      cbz r0, jump_5e16
/*0x5db0*/      ldr r1, [pc, #0x6c] /* data_5e20 */
/*0x5db2*/      str r7, [sp]
/*0x5db4*/      ldr r1, [r1]
/*0x5db6*/      add.w r4, r1, r0, lsl #2
/*0x5dba*/      ldrb.w r0, [sp, #3]
/*0x5dbe*/      orr r0, r0, #5
/*0x5dc2*/      strb.w r0, [sp, #3]
/*0x5dc6*/      b jump_5e0c
            jump_5dc8:
/*0x5dc8*/      ldrb r0, [r4, #1]
/*0x5dca*/      lsrs r0, r0, #5
/*0x5dcc*/      cmp r0, #2
/*0x5dce*/      beq jump_5dd6
/*0x5dd0*/      cmp r0, #7
/*0x5dd2*/      bne jump_5e04
/*0x5dd4*/      b jump_5e00
            jump_5dd6:
/*0x5dd6*/      ldrh r0, [r4]
/*0x5dd8*/      mov r1, sp
/*0x5dda*/      bl call_49d8
/*0x5dde*/      ldrb.w r0, [sp, #1]
/*0x5de2*/      lsls r0, r0, #0x1f
/*0x5de4*/      ldrb.w r0, [sp]
/*0x5de8*/      beq jump_5df0
/*0x5dea*/      bl call_46e4
/*0x5dee*/      b jump_5df4
            jump_5df0:
/*0x5df0*/      ldr r1, [pc, #0x30] /* data_5e24 */
/*0x5df2*/      ldrb r0, [r1, r0]
            jump_5df4:
/*0x5df4*/      strb.w r0, [sp, #2]
/*0x5df8*/      ldr r0, [sp]
/*0x5dfa*/      bl call_4790
/*0x5dfe*/      b jump_5e04
            jump_5e00:
/*0x5e00*/      movs r0, #0xff
/*0x5e02*/      strh r0, [r5]
            jump_5e04:
/*0x5e04*/      ldrh r0, [r5]
/*0x5e06*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5e08*/      strh r0, [r5]
/*0x5e0a*/      .short 0x1d24 /* adds r4, r4, #4 */ 
            jump_5e0c:
/*0x5e0c*/      ldrh r0, [r5]
/*0x5e0e*/      cmp r0, #0xff
/*0x5e10*/      bls jump_5dc8
/*0x5e12*/      bl call_708c
            jump_5e16:
/*0x5e16*/      strb r7, [r6, #8]
/*0x5e18*/      pop {r3, r4, r5, r6, r7, pc}

/*0x5e1a*/  .byte 0x00
/*0x5e1b*/  .byte 0x00

            data_5e1c:
/*0x5e1c*/  .word 0x20001ba4
            data_5e20:
/*0x5e20*/  .word 0x20000008
            data_5e24:
/*0x5e24*/  .word 0x20000226


            .thumb_func
            call_5e28:
/*0x5e28*/      ldr r0, [pc, #0x44] /* data_5e70 */
/*0x5e2a*/      push {r4, lr}
/*0x5e2c*/      ldr r0, [r0]
/*0x5e2e*/      bl call_49e2
/*0x5e32*/      mov r4, r0
/*0x5e34*/      movs r1, #3
/*0x5e36*/      bl call_52c8
/*0x5e3a*/      uxtb r0, r0
/*0x5e3c*/      cmp r0, #0xff
/*0x5e3e*/      beq jump_5e4a
/*0x5e40*/      movs r1, #0xff
/*0x5e42*/      mov r0, r4
/*0x5e44*/      bl call_52c8
/*0x5e48*/      b jump_5e5e
            jump_5e4a:
/*0x5e4a*/      bl call_7044
/*0x5e4e*/      cmp r0, #0x60
/*0x5e50*/      bhs jump_5e6a
/*0x5e52*/      ldr r2, [pc, #0x20] /* data_5e74 */
/*0x5e54*/      movw r1, #0xffff
/*0x5e58*/      add.w r0, r2, r0, lsl #1
/*0x5e5c*/      strh r1, [r0, #0x28]
            jump_5e5e:
/*0x5e5e*/      ldr r0, [pc, #0x18] /* data_5e78 */
/*0x5e60*/      ldrb r0, [r0, #2]
/*0x5e62*/      bl call_43e8
/*0x5e66*/      movs r0, #1
/*0x5e68*/      pop {r4, pc}
            jump_5e6a:
/*0x5e6a*/      movs r0, #0
/*0x5e6c*/      pop {r4, pc}

/*0x5e6e*/  .byte 0x00
/*0x5e6f*/  .byte 0x00

            data_5e70:
/*0x5e70*/  .word 0x200007c0
            data_5e74:
/*0x5e74*/  .word 0x200008a0
            data_5e78:
/*0x5e78*/  .word 0x20000894


            .thumb_func
            call_5e7c:
/*0x5e7c*/      push {r3, r4, r5, lr}
/*0x5e7e*/      ldr r4, [pc, #0x30] /* data_5eb0 */
/*0x5e80*/      movs r5, #0x60
/*0x5e82*/      b jump_5ea6
            jump_5e84:
/*0x5e84*/      mov r1, sp
/*0x5e86*/      mov r0, r5
/*0x5e88*/      bl call_5eb4
/*0x5e8c*/      ldrb.w r0, [sp, #2]
/*0x5e90*/      strb r0, [r4]
/*0x5e92*/      sub.w r0, r4, #0x60
/*0x5e96*/      ldrb.w r1, [sp, #1]
/*0x5e9a*/      strb r1, [r0]
/*0x5e9c*/      subs r0, #0x60
/*0x5e9e*/      ldrb.w r1, [sp]
/*0x5ea2*/      strb r1, [r0]
/*0x5ea4*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_5ea6:
/*0x5ea6*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5ea8*/      uxtb r5, r5
/*0x5eaa*/      bhs jump_5e84
/*0x5eac*/      pop {r3, r4, r5, pc}

/*0x5eae*/  .byte 0x00
/*0x5eaf*/  .byte 0x00

            data_5eb0:
/*0x5eb0*/  .word 0x20000469


            .thumb_func
            call_5eb4:
/*0x5eb4*/      ldr r2, [pc, #0x2c] /* data_5ee4 */
/*0x5eb6*/      ldrb r0, [r2, r0]
/*0x5eb8*/      and r2, r0, #7
/*0x5ebc*/      lsrs r0, r0, #3
/*0x5ebe*/      rsb r0, r0, r0, lsl #8
/*0x5ec2*/      ubfx r0, r0, #4, #8
/*0x5ec6*/      strb r0, [r1]
/*0x5ec8*/      cmp r2, #5
/*0x5eca*/      beq jump_5ede
/*0x5ecc*/      rsb.w r2, r2, #5
/*0x5ed0*/      movs r3, #0x2b
/*0x5ed2*/      muls r2, r3, r2
/*0x5ed4*/      uxtb r3, r2
/*0x5ed6*/      mov r2, r1
/*0x5ed8*/      mov r1, r3
/*0x5eda*/      b.w call_4456
            jump_5ede:
/*0x5ede*/      strb r0, [r1, #1]
/*0x5ee0*/      strb r0, [r1, #2]
/*0x5ee2*/      bx lr

            data_5ee4:
/*0x5ee4*/  .word 0x00007bf8 /* possible pointer */


            .thumb_func
            call_5ee8:
/*0x5ee8*/      ldr r1, [pc, #4] /* data_5ef0 */
/*0x5eea*/      strb r0, [r1]
/*0x5eec*/      b.w jump_5738

            data_5ef0:
/*0x5ef0*/  .word 0x2000008c


            .thumb_func
            call_5ef4:
/*0x5ef4*/      movs r0, #0
/*0x5ef6*/      mov.w r2, #0x200
/*0x5efa*/      movs r3, #1
/*0x5efc*/      mov r1, r0
/*0x5efe*/      b.w call_3b5c

/*0x5f02*/  .byte 0x00
/*0x5f03*/  .byte 0x00


            .thumb_func
            call_5f04:
/*0x5f04*/      movs r2, #0
/*0x5f06*/      movs r1, #1
/*0x5f08*/      ldr r0, [pc, #4] /* data_5f10 */
/*0x5f0a*/      b.w call_38ba

/*0x5f0e*/  .byte 0x00
/*0x5f0f*/  .byte 0x00

            data_5f10:
/*0x5f10*/  .word 0x0000806c /* possible pointer */


            .thumb_func
            call_5f14:
/*0x5f14*/      movs r2, #1
/*0x5f16*/      mov r1, r2
/*0x5f18*/      ldr r0, [pc, #4] /* data_5f20 */
/*0x5f1a*/      b.w call_38ba

/*0x5f1e*/  .byte 0x00
/*0x5f1f*/  .byte 0x00

            data_5f20:
/*0x5f20*/  .word 0x0000806c /* possible pointer */


            .thumb_func
            call_5f24:
/*0x5f24*/      push {r4, r5, r6, lr}
/*0x5f26*/      ldr r1, [pc, #0x34] /* data_5f5c */
/*0x5f28*/      ldr r4, [r1]
/*0x5f2a*/      ldr r5, [pc, #0x30] /* data_5f5c */
/*0x5f2c*/      adds r5, #0x48
/*0x5f2e*/      ldr r3, [r5]
/*0x5f30*/      movs r2, #1
/*0x5f32*/      str r2, [r1]
/*0x5f34*/      movs r2, #0
/*0x5f36*/      str r2, [r5]
/*0x5f38*/      ldr r6, [pc, #0x24] /* data_5f60 */
/*0x5f3a*/      str.w r2, [r6, #0x9c]
/*0x5f3e*/      str.w r2, [r6, #0x8c]
/*0x5f42*/      str r4, [r1]
/*0x5f44*/      ldr r1, [pc, #0x1c] /* data_5f64 */
/*0x5f46*/      ldr r2, [r1]
/*0x5f48*/      orr r2, r2, #4
/*0x5f4c*/      str r2, [r1]
/*0x5f4e*/      cbz r0, jump_5f56
/*0x5f50*/      wfi 
            jump_5f52:
/*0x5f52*/      str r3, [r5]
/*0x5f54*/      pop {r4, r5, r6, pc}
            jump_5f56:
/*0x5f56*/      wfe 
/*0x5f58*/      b jump_5f52

/*0x5f5a*/  .byte 0x00
/*0x5f5b*/  .byte 0x00

            data_5f5c:
/*0x5f5c*/  .word 0x43100618
            data_5f60:
/*0x5f60*/  .word 0x42d42000
            data_5f64:
/*0x5f64*/  .word 0xe000ed10

            jump_5f68:
/*0x5f68*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5f6c*/      ldr r3, [pc, #0x34] /* data_5fa4 */
/*0x5f6e*/      ldr r6, [r3]
/*0x5f70*/      ldr r4, [pc, #0x30] /* data_5fa4 */
/*0x5f72*/      adds r4, #0x48
/*0x5f74*/      ldr r5, [r4]
/*0x5f76*/      mov.w r8, #1
/*0x5f7a*/      str.w r8, [r3]
/*0x5f7e*/      movs r7, #0
/*0x5f80*/      str r7, [r4]
/*0x5f82*/      bl call_617c
/*0x5f86*/      ldr r0, [pc, #0x20] /* data_5fa8 */
/*0x5f88*/      str.w r7, [r0, #0x9c]
/*0x5f8c*/      str.w r8, [r0, #0x8c]
/*0x5f90*/      str r6, [r3]
/*0x5f92*/      ldr r0, [pc, #0x18] /* data_5fac */
/*0x5f94*/      ldr r1, [r0]
/*0x5f96*/      orr r1, r1, #4
/*0x5f9a*/      str r1, [r0]
/*0x5f9c*/      wfe 
/*0x5f9e*/      str r5, [r4]
/*0x5fa0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5fa4:
/*0x5fa4*/  .word 0x43100618
            data_5fa8:
/*0x5fa8*/  .word 0x42d42000
            data_5fac:
/*0x5fac*/  .word 0xe000ed10


            .thumb_func
            call_5fb0:
/*0x5fb0*/      ldr r1, [pc, #0x10] /* data_5fc4 */
/*0x5fb2*/      ldr r2, [r1]
/*0x5fb4*/      bic r2, r2, #4
/*0x5fb8*/      str r2, [r1]
/*0x5fba*/      cbz r0, jump_5fc0
/*0x5fbc*/      wfi 
/*0x5fbe*/      bx lr
            jump_5fc0:
/*0x5fc0*/      wfe 
/*0x5fc2*/      bx lr

            data_5fc4:
/*0x5fc4*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x5fc8*/      push {r4, r5, r6, lr}
/*0x5fca*/      ldr r6, [pc, #0xd8] /* data_60a4 */
/*0x5fcc*/      ldrb r0, [r6]
/*0x5fce*/      cmp r0, #1
/*0x5fd0*/      bne jump_608e
/*0x5fd2*/      add.w r5, r6, #8
/*0x5fd6*/      mov r0, r5
/*0x5fd8*/      movs r4, #0
/*0x5fda*/      ldrb r2, [r5]
/*0x5fdc*/      ldrb r0, [r0, #1]
/*0x5fde*/      mov r1, r4
/*0x5fe0*/      cmp r2, #0x10
/*0x5fe2*/      beq jump_5fee
/*0x5fe4*/      cmp r2, #0x11
/*0x5fe6*/      beq jump_5ff8
/*0x5fe8*/      cmp r2, #0x12
/*0x5fea*/      bne jump_6090
/*0x5fec*/      b jump_5ffe
            jump_5fee:
/*0x5fee*/      cmp r0, #2
/*0x5ff0*/      bne jump_6090
/*0x5ff2*/      str r1, [r5, #4]
/*0x5ff4*/      movs r1, #4
/*0x5ff6*/      b jump_6072
            jump_5ff8:
/*0x5ff8*/      bl call_60ac
/*0x5ffc*/      b jump_607a
            jump_5ffe:
/*0x5ffe*/      mov.w r3, #0x400
/*0x6002*/      cmp r0, #0x20
/*0x6004*/      blo jump_6024
/*0x6006*/      sub.w r2, r0, #0x1f
/*0x600a*/      rsb r2, r2, r2, lsl #4
/*0x600e*/      cmp.w r3, r2, lsl #2
/*0x6012*/      blt jump_6024
/*0x6014*/      rsb r0, r0, r0, lsl #4
/*0x6018*/      mov.w r1, #0x2880
/*0x601c*/      add.w r0, r1, r0, lsl #2
/*0x6020*/      movs r1, #0x3c
/*0x6022*/      b jump_6074
            jump_6024:
/*0x6024*/      cbz r0, jump_6030
/*0x6026*/      cmp r0, #1
/*0x6028*/      beq jump_6066
/*0x602a*/      cmp r0, #2
/*0x602c*/      bne jump_6090
/*0x602e*/      b jump_606e
            jump_6030:
/*0x6030*/      ldrb.w r0, [r1, #0x10f]
/*0x6034*/      cmp r0, #0xaa
/*0x6036*/      beq jump_605c
/*0x6038*/      ldrb r2, [r3]
/*0x603a*/      mov r0, r3
/*0x603c*/      cmp r2, #4
/*0x603e*/      beq jump_6062
/*0x6040*/      movs r2, #0x20
/*0x6042*/      mov r1, r3
/*0x6044*/      adds r0, r5, #4
/*0x6046*/      bl call_35b0
/*0x604a*/      ldr r0, [pc, #0x5c] /* data_60a8 */
/*0x604c*/      ldr.w r1, [r0, #0x180]
/*0x6050*/      str r1, [r5, #0x24]
/*0x6052*/      ldr.w r0, [r0, #0x18c]
/*0x6056*/      movs r1, #0x28
/*0x6058*/      str r0, [r5, #0x28]
/*0x605a*/      b jump_6072
            jump_605c:
/*0x605c*/      movs r1, #0x10
/*0x605e*/      lsls r0, r1, #4
/*0x6060*/      b jump_6074
            jump_6062:
/*0x6062*/      movs r1, #0x34
/*0x6064*/      b jump_6074
            jump_6066:
/*0x6066*/      movs r1, #4
/*0x6068*/      mov.w r0, #0x3c00
/*0x606c*/      b jump_6074
            jump_606e:
/*0x606e*/      movs r1, #1
/*0x6070*/      strb r1, [r5, #4]
            jump_6072:
/*0x6072*/      adds r0, r5, #4
            jump_6074:
/*0x6074*/      bl flash_read_packet
/*0x6078*/      movs r4, #1
            jump_607a:
/*0x607a*/      ldrb r0, [r6]
/*0x607c*/      cmp r0, #1
/*0x607e*/      bne jump_608e
/*0x6080*/      cbz r4, jump_6090
/*0x6082*/      movs r1, #0x3c
/*0x6084*/      adds r0, r5, #4
            jump_6086:
/*0x6086*/      bl call_35e2
/*0x608a*/      movs r0, #2
/*0x608c*/      strb r0, [r6]
            jump_608e:
/*0x608e*/      pop {r4, r5, r6, pc}
            jump_6090:
/*0x6090*/      ldr r0, [r5]
/*0x6092*/      str r0, [r5, #4]
/*0x6094*/      movw r0, #0xaaff
/*0x6098*/      str r0, [r5]
/*0x609a*/      ldr r0, [pc, #8] /* data_60a4 */
/*0x609c*/      movs r1, #0x38
/*0x609e*/      adds r0, #0x10
/*0x60a0*/      b jump_6086

/*0x60a2*/  .byte 0x00
/*0x60a3*/  .byte 0x00

            data_60a4:
/*0x60a4*/  .word 0x2000076c
            data_60a8:
/*0x60a8*/  .word 0x40080000


            .thumb_func
            call_60ac:
/*0x60ac*/      push {r4, lr}
/*0x60ae*/      ldr r1, [pc, #0x58] /* data_6108 */
/*0x60b0*/      cbz r0, jump_60ce
/*0x60b2*/      cmp r0, #1
/*0x60b4*/      beq jump_60d2
/*0x60b6*/      cmp r0, #2
/*0x60b8*/      bne jump_6104
/*0x60ba*/      movs r0, #0x35
/*0x60bc*/      bl call_5a48
/*0x60c0*/      movs r0, #0
/*0x60c2*/      bl call_39f4
/*0x60c6*/      pop.w {r4, lr}
/*0x60ca*/      b.w jump_5f68
            jump_60ce:
/*0x60ce*/      ldr r0, [pc, #0x3c] /* data_610c */
/*0x60d0*/      b jump_60d6
            jump_60d2:
/*0x60d2*/      ldr r0, [pc, #0x38] /* data_610c */
/*0x60d4*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_60d6:
/*0x60d6*/      str r0, [r1]
/*0x60d8*/      movs r0, #0x35
/*0x60da*/      bl call_5a48
/*0x60de*/      movs r0, #0
/*0x60e0*/      bl call_39f4
/*0x60e4*/      movw r0, #0x4e20
/*0x60e8*/      bl call_37b8
/*0x60ec*/      dsb sy
/*0x60f0*/      ldr r0, [pc, #0x1c] /* data_6110 */
/*0x60f2*/      ldr r1, [r0]
/*0x60f4*/      ldr r2, [pc, #0x1c] /* data_6114 */
/*0x60f6*/      and r1, r1, #0x700
/*0x60fa*/      orrs r1, r2
/*0x60fc*/      str r1, [r0]
/*0x60fe*/      dsb sy
            jump_6102:
/*0x6102*/      b jump_6102
            jump_6104:
/*0x6104*/      pop {r4, pc}

/*0x6106*/  .byte 0x00
/*0x6107*/  .byte 0x00

            data_6108:
/*0x6108*/  .word 0x20003ffc
            data_610c:
/*0x610c*/  .word 0x55aafaf5
            data_6110:
/*0x6110*/  .word 0xe000ed0c
            data_6114:
/*0x6114*/  .word 0x05fa0004


            .thumb_func
            flash_read_packet:
/*0x6118*/      push {r4, r5, r6, lr}
/*0x611a*/      mov r4, r1
/*0x611c*/      ldr r2, [pc, #0x28] /* data_6148 */
/*0x611e*/      mov r1, r0
/*0x6120*/      movs r0, #2
/*0x6122*/      strb r0, [r2]
/*0x6124*/      add.w r0, r2, #0xc
/*0x6128*/      subs r5, r0, #4
/*0x612a*/      cmp r1, r0
/*0x612c*/      beq jump_6136
/*0x612e*/      mov r2, r4
/*0x6130*/      adds r0, r5, #4
/*0x6132*/      bl call_35b0
            jump_6136:
/*0x6136*/      adds r0, r5, r4
/*0x6138*/      rsb.w r1, r4, #0x3c
/*0x613c*/      pop.w {r4, r5, r6, lr}
/*0x6140*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x6142*/      b.w call_35e2

/*0x6146*/  .byte 0x00
/*0x6147*/  .byte 0x00

            data_6148:
/*0x6148*/  .word 0x2000076c


            .thumb_func
            call_614c:
/*0x614c*/      push {r4, r5, r6, r7, lr}
/*0x614e*/      ldr r7, [pc, #0x28] /* data_6178 */
/*0x6150*/      ldr.w r4, [r7, #0x104]
/*0x6154*/      ldr.w r5, [r7, #0x108]
/*0x6158*/      ldr.w r6, [r7, #0x10c]
/*0x615c*/      bics r4, r0
/*0x615e*/      bics r5, r1
/*0x6160*/      bics r6, r2
/*0x6162*/      cbz r3, jump_616a
/*0x6164*/      orrs r4, r0
/*0x6166*/      orrs r5, r1
/*0x6168*/      orrs r6, r2
            jump_616a:
/*0x616a*/      str.w r4, [r7, #0x104]
/*0x616e*/      str.w r5, [r7, #0x108]
/*0x6172*/      str.w r6, [r7, #0x10c]
/*0x6176*/      pop {r4, r5, r6, r7, pc}

            data_6178:
/*0x6178*/  .word 0x40088000


            .thumb_func
            call_617c:
/*0x617c*/      ldr r2, [pc, #0x1c] /* data_619c */
/*0x617e*/      movs r1, #0
/*0x6180*/      mov.w r0, #0x1c20
/*0x6184*/      str.w r1, [r2, #0x108]
            jump_6188:
/*0x6188*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x618a*/      bhs jump_6188
/*0x618c*/      movs r0, #1
/*0x618e*/      str.w r0, [r2, #0x108]
/*0x6192*/      ldr r0, [pc, #0xc] /* data_61a0 */
            jump_6194:
/*0x6194*/      ldr r1, [r0, #8]
/*0x6196*/      lsls r1, r1, #0x1a
/*0x6198*/      bpl jump_6194
/*0x619a*/      bx lr

            data_619c:
/*0x619c*/  .word 0x42d40000
            data_61a0:
/*0x61a0*/  .word 0x40088000


            .thumb_func
            call_61a4:
/*0x61a4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x61a8*/      movs r7, #0xb
/*0x61aa*/      ldr r5, [pc, #0x6c] /* data_6218 */
/*0x61ac*/      b jump_620c
            jump_61ae:
/*0x61ae*/      ldr r1, [pc, #0x6c] /* data_621c */
/*0x61b0*/      add.w r0, r7, r7, lsl #1
/*0x61b4*/      add r0, r1
/*0x61b6*/      ldrb r1, [r5, #-0x1]!
/*0x61ba*/      ldrb r0, [r0, #2]
/*0x61bc*/      eors r0, r1
/*0x61be*/      movs.w r8, r0
/*0x61c2*/      beq jump_620c
/*0x61c4*/      movs r4, #0x80
/*0x61c6*/      movs r6, #8
/*0x61c8*/      b jump_6206
            jump_61ca:
/*0x61ca*/      tst.w r8, r4
/*0x61ce*/      beq jump_6204
/*0x61d0*/      ldrb r0, [r5]
/*0x61d2*/      eors r0, r4
/*0x61d4*/      strb r0, [r5]
/*0x61d6*/      tst r0, r4
/*0x61d8*/      bne jump_61de
/*0x61da*/      movs r0, #1
/*0x61dc*/      b jump_61e0
            jump_61de:
/*0x61de*/      movs r0, #0
            jump_61e0:
/*0x61e0*/      mov sb, r0
/*0x61e2*/      add.w r0, r6, r7, lsl #3
/*0x61e6*/      uxtb r0, r0
/*0x61e8*/      mov r1, sb
/*0x61ea*/      bl call_4888
/*0x61ee*/      cbnz r0, jump_61f6
/*0x61f0*/      ldrb r0, [r5]
/*0x61f2*/      eors r0, r4
/*0x61f4*/      strb r0, [r5]
            jump_61f6:
/*0x61f6*/      movs.w r0, sb
/*0x61fa*/      beq jump_61fe
/*0x61fc*/      movs r0, #1
            jump_61fe:
/*0x61fe*/      ldr r1, [pc, #0x18] /* data_6218 */
/*0x6200*/      subs r1, #0xf
/*0x6202*/      strh r0, [r1, #2]
            jump_6204:
/*0x6204*/      lsrs r4, r4, #1
            jump_6206:
/*0x6206*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x6208*/      uxtb r6, r6
/*0x620a*/      bhs jump_61ca
            jump_620c:
/*0x620c*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x620e*/      uxtb r7, r7
/*0x6210*/      bhs jump_61ae
/*0x6212*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

/*0x6216*/  .byte 0x00
/*0x6217*/  .byte 0x00

            data_6218:
/*0x6218*/  .word 0x200001c3
            data_621c:
/*0x621c*/  .word 0x20000326


            .thumb_func
            call_6220:
/*0x6220*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6224*/      mov r6, r0
/*0x6226*/      movs r4, #2
/*0x6228*/      ldr r5, [pc, #0x50] /* data_627c */
/*0x622a*/      mov.w r7, #0x1f4
            jump_622e:
/*0x622e*/      bl call_7288
/*0x6232*/      movs r0, #0xb
/*0x6234*/      b jump_623e
            jump_6236:
/*0x6236*/      add.w r1, r0, r0, lsl #1
/*0x623a*/      ldrb r1, [r5, r1]
/*0x623c*/      cbnz r1, jump_6244
            jump_623e:
/*0x623e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6240*/      uxtb r0, r0
/*0x6242*/      bhs jump_6236
            jump_6244:
/*0x6244*/      cmp r0, #0xff
/*0x6246*/      beq jump_6258
/*0x6248*/      cmp r4, #0
/*0x624a*/      bne jump_622e
            jump_624c:
/*0x624c*/      cmp r6, #0
/*0x624e*/      beq jump_6276
/*0x6250*/      ldr r2, [pc, #0x2c] /* data_6280 */
/*0x6252*/      ldr r1, [pc, #0x28] /* data_627c */
/*0x6254*/      movs r0, #0xb
/*0x6256*/      b jump_6270
            jump_6258:
/*0x6258*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x625a*/      ands r4, r4, #0xff
/*0x625e*/      beq jump_624c
/*0x6260*/      mov r0, r7
/*0x6262*/      bl call_37b8
/*0x6266*/      b jump_622e
            jump_6268:
/*0x6268*/      ldrb r3, [r1, #2]
/*0x626a*/      strb r3, [r2], #1
/*0x626e*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6270:
/*0x6270*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6272*/      uxtb r0, r0
/*0x6274*/      bhs jump_6268
            jump_6276:
/*0x6276*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x627a*/  .byte 0x00
/*0x627b*/  .byte 0x00

            data_627c:
/*0x627c*/  .word 0x20000326
            data_6280:
/*0x6280*/  .word 0x200001b8


            .thumb_func
            call_6284:
/*0x6284*/      ldr r1, [pc, #0x10] /* data_6298 */
/*0x6286*/      ldrb r0, [r1]
/*0x6288*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x628a*/      strb r0, [r1]
/*0x628c*/      lsls r0, r0, #0x1e
/*0x628e*/      bne jump_6294
/*0x6290*/      b.w call_7288
            jump_6294:
/*0x6294*/      bx lr

/*0x6296*/  .byte 0x00
/*0x6297*/  .byte 0x00

            data_6298:
/*0x6298*/  .word 0x200001b4


            .thumb_func
            call_629c:
/*0x629c*/      ldr r2, [pc, #0x44] /* data_62e4 */
/*0x629e*/      push {r4, lr}
/*0x62a0*/      movs r3, #0
/*0x62a2*/      movs r1, #8
/*0x62a4*/      add.w r0, r2, #0x62
/*0x62a8*/      bl call_38d6
/*0x62ac*/      ldr r1, [pc, #0x38] /* data_62e8 */
/*0x62ae*/      movw r0, #0xeae0
/*0x62b2*/      str r0, [r1, #0x54]
/*0x62b4*/      movs r2, #0xff
/*0x62b6*/      movs r1, #0xb
/*0x62b8*/      ldr r0, [pc, #0x30] /* data_62ec */
/*0x62ba*/      bl call_35d4
/*0x62be*/      movs r0, #0
/*0x62c0*/      bl call_6324
/*0x62c4*/      movs r1, #0xb
/*0x62c6*/      movs r3, #0
/*0x62c8*/      ldr r0, [pc, #0x24] /* data_62f0 */
/*0x62ca*/      movs r2, #0xff
/*0x62cc*/      b jump_62da
            jump_62ce:
/*0x62ce*/      strb r3, [r0], #1
/*0x62d2*/      strb r2, [r0], #1
/*0x62d6*/      strb r2, [r0], #1
            jump_62da:
/*0x62da*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x62dc*/      uxtb r1, r1
/*0x62de*/      bhs jump_62ce
/*0x62e0*/      pop {r4, pc}

/*0x62e2*/  .byte 0x00
/*0x62e3*/  .byte 0x00

            data_62e4:
/*0x62e4*/  .word 0x00007c64 /* possible pointer */
            data_62e8:
/*0x62e8*/  .word 0x40024000
            data_62ec:
/*0x62ec*/  .word 0x200001b8
            data_62f0:
/*0x62f0*/  .word 0x20000326


            .thumb_func
            call_62f4:
/*0x62f4*/      ldr r1, [pc, #0x28] /* data_6320 */
/*0x62f6*/      push {r4, lr}
/*0x62f8*/      add.w r0, r1, #0x16e
/*0x62fc*/      movs r2, #0xb
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
/*0x6310*/      .short 0x1cc0 /* adds r0, r0, #3 */ 
/*0x6312*/      .short 0x1c49 /* adds r1, r1, #1 */ 
            jump_6314:
/*0x6314*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6316*/      uxtb r2, r2
/*0x6318*/      bhs jump_6300
/*0x631a*/      movs r0, #1
/*0x631c*/      pop {r4, pc}

/*0x631e*/  .byte 0x00
/*0x631f*/  .byte 0x00

            data_6320:
/*0x6320*/  .word 0x200001b8


            .thumb_func
            call_6324:
/*0x6324*/      push {r4, lr}
/*0x6326*/      mov r4, r0
/*0x6328*/      movs r2, #0x58
/*0x632a*/      ldr r1, [pc, #0x38] /* data_6364 */
/*0x632c*/      ldr r0, [pc, #0x38] /* data_6368 */
/*0x632e*/      bl call_35b0
/*0x6332*/      cbz r4, jump_6352
/*0x6334*/      bl call_6388
/*0x6338*/      cmp r4, #1
/*0x633a*/      beq jump_6342
/*0x633c*/      cmp r4, #2
/*0x633e*/      bne jump_6352
/*0x6340*/      b jump_634a
            jump_6342:
/*0x6342*/      ldr r1, [pc, #0x20] /* data_6364 */
/*0x6344*/      adds r1, #0xd6
/*0x6346*/      movs r0, #0x22
/*0x6348*/      b jump_634e
            jump_634a:
/*0x634a*/      ldr r1, [pc, #0x20] /* data_636c */
/*0x634c*/      movs r0, #0x11
            jump_634e:
/*0x634e*/      bl call_63b0
            jump_6352:
/*0x6352*/      bl call_6388
/*0x6356*/      bl call_5368
/*0x635a*/      pop.w {r4, lr}
/*0x635e*/      b.w call_6388

/*0x6362*/  .byte 0x00
/*0x6363*/  .byte 0x00

            data_6364:
/*0x6364*/  .word 0x00007c6e /* possible pointer */
            data_6368:
/*0x6368*/  .word 0x200001ce
            data_636c:
/*0x636c*/  .word 0x00007d88 /* possible pointer */


            .thumb_func
            call_6370:
/*0x6370*/      cbz r0, jump_6380
/*0x6372*/      movs r3, #0
            jump_6374:
/*0x6374*/      ldr r2, [pc, #0xc] /* data_6384 */
/*0x6376*/      movs r1, #0xb
/*0x6378*/      add.w r0, r2, #0x6d
/*0x637c*/      b.w call_38d6
            jump_6380:
/*0x6380*/      movs r3, #1
/*0x6382*/      b jump_6374

            data_6384:
/*0x6384*/  .word 0x00007c69 /* possible pointer */


            .thumb_func
            call_6388:
/*0x6388*/      push {r4, lr}
/*0x638a*/      ldr r4, [pc, #0x20] /* data_63ac */
/*0x638c*/      movs r2, #0xff
/*0x638e*/      adds r1, r2, #1
/*0x6390*/      adds r0, r4, #1
/*0x6392*/      bl call_35d4
/*0x6396*/      movs r0, #0x58
/*0x6398*/      adds r1, r4, #1
/*0x639a*/      b jump_63a2
            jump_639c:
/*0x639c*/      ldrb r2, [r4], #-1
/*0x63a0*/      strb r0, [r1, r2]
            jump_63a2:
/*0x63a2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x63a4*/      uxtb r0, r0
/*0x63a6*/      bhs jump_639c
/*0x63a8*/      pop {r4, pc}

/*0x63aa*/  .byte 0x00
/*0x63ab*/  .byte 0x00

            data_63ac:
/*0x63ac*/  .word 0x20000225


            .thumb_func
            call_63b0:
/*0x63b0*/      push {r4, r5, lr}
/*0x63b2*/      ldr r3, [pc, #0x1c] /* data_63d0 */
/*0x63b4*/      add.w r4, r3, #0x58
/*0x63b8*/      b jump_63c8
            jump_63ba:
/*0x63ba*/      ldrb r2, [r1]
/*0x63bc*/      ldrb r2, [r4, r2]
/*0x63be*/      cmp r2, #0xff
/*0x63c0*/      beq jump_63c6
/*0x63c2*/      ldrb r5, [r1, #1]
/*0x63c4*/      strb r5, [r3, r2]
            jump_63c6:
/*0x63c6*/      .short 0x1c89 /* adds r1, r1, #2 */ 
            jump_63c8:
/*0x63c8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x63ca*/      uxtb r0, r0
/*0x63cc*/      bhs jump_63ba
/*0x63ce*/      pop {r4, r5, pc}

            data_63d0:
/*0x63d0*/  .word 0x200001ce


            .thumb_func
            call_63d4:
/*0x63d4*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x63d8*/      ldr.w lr, [pc, #0x74] /* data_6450 */
/*0x63dc*/      ldr.w sb, [pc, #0x74] /* data_6454 */
/*0x63e0*/      movs r6, #0
/*0x63e2*/      sub.w sl, lr, #0x120
/*0x63e6*/      addw fp, sb, #0x242
            jump_63ea:
/*0x63ea*/      add.w r1, r6, r6, lsl #1
/*0x63ee*/      movs r4, #0x10
/*0x63f0*/      add.w r0, lr, r1, lsl #5
/*0x63f4*/      movs r3, #0
/*0x63f6*/      add.w ip, fp, r6, lsl #4
            jump_63fa:
/*0x63fa*/      ldrb.w r1, [sb, r3]
/*0x63fe*/      ldr.w r8, [pc, #0x54] /* data_6454 */
/*0x6402*/      add.w r2, r1, r1, lsl #1
/*0x6406*/      add.w r7, sl, r2, lsl #5
/*0x640a*/      mov r1, ip
/*0x640c*/      movs r2, #0x10
/*0x640e*/      add.w r8, r8, #0x42
/*0x6412*/      b jump_642e
            jump_6414:
/*0x6414*/      ldrb r5, [r1]
/*0x6416*/      cmp r5, #0xff
/*0x6418*/      beq jump_6422
/*0x641a*/      ldrb r5, [r7, r5]
/*0x641c*/      ldrh.w r5, [r8, r5, lsl #1]
/*0x6420*/      strh r5, [r0]
            jump_6422:
/*0x6422*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x6424*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6426*/      ands r4, r4, #0xff
/*0x642a*/      beq jump_6448
/*0x642c*/      .short 0x1d80 /* adds r0, r0, #6 */ 
            jump_642e:
/*0x642e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6430*/      uxtb r2, r2
/*0x6432*/      bhs jump_6414
/*0x6434*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x6436*/      uxtb r3, r3
/*0x6438*/      cmp r3, #3
/*0x643a*/      blo jump_63fa
/*0x643c*/      .short 0x1c76 /* adds r6, r6, #1 */ 
/*0x643e*/      uxtb r6, r6
/*0x6440*/      cmp r6, #8
/*0x6442*/      blo jump_63ea
/*0x6444*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_6448:
/*0x6448*/      movs r4, #0x10
/*0x644a*/      subs r0, #0x58
/*0x644c*/      b jump_642e

/*0x644e*/  .byte 0x00
/*0x644f*/  .byte 0x00

            data_6450:
/*0x6450*/  .word 0x2000046a
            data_6454:
/*0x6454*/  .word 0x00007daa /* possible pointer */


            .thumb_func
            call_6458:
/*0x6458*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x645a*/      movs r5, #0
/*0x645c*/      mov r1, r5
/*0x645e*/      mov.w r2, #0x20000
/*0x6462*/      movs r3, #1
/*0x6464*/      mov r0, r1
/*0x6466*/      bl call_3b5c
/*0x646a*/      movw r1, #0xea60
/*0x646e*/      ldr r0, [pc, #0x68] /* data_64d8 */
/*0x6470*/      bl call_3782
/*0x6474*/      movs r1, #2
/*0x6476*/      ldr r0, [pc, #0x64] /* data_64dc */
/*0x6478*/      bl call_38a4
/*0x647c*/      ldr r0, [pc, #0x5c] /* data_64dc */
/*0x647e*/      movs r2, #2
/*0x6480*/      movs r1, #4
/*0x6482*/      adds r0, #0x23
/*0x6484*/      bl call_38ba
/*0x6488*/      ldr r0, [pc, #0x50] /* data_64dc */
/*0x648a*/      movs r2, #2
/*0x648c*/      movs r1, #4
/*0x648e*/      .short 0x1dc0 /* adds r0, r0, #7 */ 
/*0x6490*/      bl call_38ba
/*0x6494*/      ldr r0, [pc, #0x48] /* data_64e0 */
/*0x6496*/      ldr r0, [r0]
/*0x6498*/      ldr r1, [pc, #0x48] /* data_64e4 */
/*0x649a*/      ldr r6, [pc, #0x4c] /* data_64e8 */
/*0x649c*/      udiv r4, r0, r1
/*0x64a0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x64a2*/      strh.w r4, [sp]
/*0x64a6*/      strh.w r5, [sp, #2]
/*0x64aa*/      mov r1, sp
/*0x64ac*/      mov r0, r6
/*0x64ae*/      bl call_45e4
/*0x64b2*/      strb.w r5, [sp]
/*0x64b6*/      movs r0, #7
/*0x64b8*/      strh.w r0, [sp, #2]
/*0x64bc*/      movs r0, #1
/*0x64be*/      strb.w r0, [sp, #4]
/*0x64c2*/      strb.w r5, [sp, #5]
/*0x64c6*/      lsrs r0, r4, #1
/*0x64c8*/      strh.w r0, [sp, #6]
/*0x64cc*/      mov r1, sp
/*0x64ce*/      mov r0, r6
/*0x64d0*/      bl call_458c
/*0x64d4*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x64d6*/  .byte 0x00
/*0x64d7*/  .byte 0x00

            data_64d8:
/*0x64d8*/  .word 0x40077000
            data_64dc:
/*0x64dc*/  .word 0x00007dad /* possible pointer */
            data_64e0:
/*0x64e0*/  .word 0x20000000
            data_64e4:
/*0x64e4*/  .word 0x00dbba00
            data_64e8:
/*0x64e8*/  .word 0x4006f000

            jump_64ec:
/*0x64ec*/      push {r4, lr}
/*0x64ee*/      ldr r4, [pc, #0x40] /* data_6530 */
/*0x64f0*/      movs r1, #0
/*0x64f2*/      mov r0, r4
/*0x64f4*/      bl call_376e
/*0x64f8*/      movs r1, #0
/*0x64fa*/      mov r0, r4
/*0x64fc*/      bl call_375a
/*0x6500*/      mov r0, r4
/*0x6502*/      bl call_374c
/*0x6506*/      ldr r1, [pc, #0x2c] /* data_6534 */
/*0x6508*/      asrs r0, r4, #0x14
/*0x650a*/      str.w r0, [r1, #0x180]
/*0x650e*/      movs r1, #0
/*0x6510*/      ldr r0, [pc, #0x24] /* data_6538 */
/*0x6512*/      bl call_4578
/*0x6516*/      ldr r1, [pc, #0x24] /* data_653c */
/*0x6518*/      movs r0, #2
/*0x651a*/      str r0, [r1, #0x28]
/*0x651c*/      ldr r1, [pc, #0x20] /* data_6540 */
/*0x651e*/      str r0, [r1, #0x24]
/*0x6520*/      movs r2, #0
/*0x6522*/      pop.w {r4, lr}
/*0x6526*/      movs r1, #4
/*0x6528*/      ldr r0, [pc, #0x18] /* data_6544 */
/*0x652a*/      b.w call_38ba

/*0x652e*/  .byte 0x00
/*0x652f*/  .byte 0x00

            data_6530:
/*0x6530*/  .word 0x40077000
            data_6534:
/*0x6534*/  .word 0xe000e004
            data_6538:
/*0x6538*/  .word 0x4006f000
            data_653c:
/*0x653c*/  .word 0x400b4000
            data_6540:
/*0x6540*/  .word 0x400b2000
            data_6544:
/*0x6544*/  .word 0x00007dd0 /* possible pointer */


            .thumb_func
            call_6548:
/*0x6548*/      push {r4, lr}
/*0x654a*/      ldr r0, [pc, #0x78] /* data_65c4 */
/*0x654c*/      movs r4, #2
/*0x654e*/      str r4, [r0, #0x24]
/*0x6550*/      movs r2, #1
/*0x6552*/      movs r1, #4
/*0x6554*/      ldr r0, [pc, #0x70] /* data_65c8 */
/*0x6556*/      bl call_38ba
/*0x655a*/      movw r0, #0x2710
/*0x655e*/      bl call_37b8
/*0x6562*/      ldr r0, [pc, #0x68] /* data_65cc */
/*0x6564*/      str r4, [r0, #0x24]
/*0x6566*/      mov.w r1, #0x300
/*0x656a*/      ldr r0, [pc, #0x64] /* data_65d0 */
/*0x656c*/      bl call_35e2
/*0x6570*/      ldr r1, [pc, #0x60] /* data_65d4 */
/*0x6572*/      movs r0, #0
/*0x6574*/      strb r0, [r1, #1]
/*0x6576*/      movs r0, #0x64
/*0x6578*/      bl call_37b8
/*0x657c*/      ldr r1, [pc, #0x58] /* data_65d8 */
/*0x657e*/      movs r0, #0xff
/*0x6580*/      strb r0, [r1]
/*0x6582*/      bl call_65ec
/*0x6586*/      movs r0, #2
/*0x6588*/      bl call_6fe4
/*0x658c*/      ldr r1, [pc, #0x4c] /* data_65dc */
/*0x658e*/      lsls r0, r4, #0xe
/*0x6590*/      str r0, [r1, #0x24]
/*0x6592*/      movs r1, #1
/*0x6594*/      ldr r0, [pc, #0x48] /* data_65e0 */
/*0x6596*/      bl call_4578
/*0x659a*/      ldr r4, [pc, #0x48] /* data_65e4 */
/*0x659c*/      movs r1, #0
/*0x659e*/      mov r0, r4
/*0x65a0*/      bl call_3786
/*0x65a4*/      mov r0, r4
/*0x65a6*/      bl call_374c
/*0x65aa*/      movs r1, #1
/*0x65ac*/      mov r0, r4
/*0x65ae*/      bl call_375a
/*0x65b2*/      movs r1, #1
/*0x65b4*/      mov r0, r4
/*0x65b6*/      bl call_376e
/*0x65ba*/      ldr r1, [pc, #0x2c] /* data_65e8 */
/*0x65bc*/      asrs r0, r4, #0x14
/*0x65be*/      str.w r0, [r1, #0x100]
/*0x65c2*/      pop {r4, pc}

            data_65c4:
/*0x65c4*/  .word 0x400b2000
            data_65c8:
/*0x65c8*/  .word 0x00007dd0 /* possible pointer */
            data_65cc:
/*0x65cc*/  .word 0x400b4000
            data_65d0:
/*0x65d0*/  .word 0x2000046a
            data_65d4:
/*0x65d4*/  .word 0x20000348
            data_65d8:
/*0x65d8*/  .word 0x20000004
            data_65dc:
/*0x65dc*/  .word 0x400b0000
            data_65e0:
/*0x65e0*/  .word 0x4006f000
            data_65e4:
/*0x65e4*/  .word 0x40077000
            data_65e8:
/*0x65e8*/  .word 0xe000e004


            .thumb_func
            call_65ec:
/*0x65ec*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x65f0*/      ldr r1, [pc, #0xbc] /* data_66b0 */
/*0x65f2*/      ldr r6, [pc, #0xc0] /* data_66b4 */
/*0x65f4*/      mov.w r8, #0x8000
/*0x65f8*/      ldrb r0, [r1]
/*0x65fa*/      mov.w r7, #0x100
/*0x65fe*/      mov.w sl, #0x4000
/*0x6602*/      cbz r0, jump_6650
/*0x6604*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6606*/      uxtb r0, r0
/*0x6608*/      strb r0, [r1]
/*0x660a*/      bics r0, r0, #0xc
/*0x660e*/      bne jump_6650
/*0x6610*/      movs r0, #0x12
/*0x6612*/      bl call_6fe4
/*0x6616*/      mov.w r4, #0x300
/*0x661a*/      movs r1, #0xa
/*0x661c*/      mov r0, r4
/*0x661e*/      bl call_7014
/*0x6622*/      movs r1, #0xa
/*0x6624*/      mov r0, r4
/*0x6626*/      bl call_7014
/*0x662a*/      movs r1, #2
/*0x662c*/      movs r0, #0
/*0x662e*/      bl call_7014
/*0x6632*/      str.w sl, [r6, #0x28]
/*0x6636*/      mov r4, r8
/*0x6638*/      str.w r8, [r6, #0x24]
/*0x663c*/      movs r1, #8
/*0x663e*/      mov.w r0, #0xc00
/*0x6642*/      bl call_7014
/*0x6646*/      str r7, [r6, #0x24]
/*0x6648*/      str r4, [r6, #0x28]
/*0x664a*/      nop 
/*0x664c*/      nop 
/*0x664e*/      str r4, [r6, #0x24]
            jump_6650:
/*0x6650*/      ldr r0, [pc, #0x64] /* data_66b8 */
/*0x6652*/      ldr r1, [pc, #0x68] /* data_66bc */
/*0x6654*/      movs r4, #0x10
/*0x6656*/      ldrb r0, [r0, #1]
/*0x6658*/      mov sb, r7
/*0x665a*/      add.w r0, r0, r0, lsl #1
/*0x665e*/      add.w r5, r1, r0, lsl #5
/*0x6662*/      adds r5, #0x5e
/*0x6664*/      b jump_66a2
            jump_6666:
/*0x6666*/      str.w r8, [r6, #0x28]
/*0x666a*/      ldrh r0, [r5]
/*0x666c*/      subs r7, r5, #2
/*0x666e*/      movs r1, #0xa
/*0x6670*/      bl call_7014
/*0x6674*/      ldrh r0, [r7]
/*0x6676*/      movs r1, #0xa
/*0x6678*/      bl call_7014
/*0x667c*/      ldrh r0, [r5, #-0x4]
/*0x6680*/      movs r1, #9
/*0x6682*/      ubfx r7, r0, #6, #1
/*0x6686*/      .short 0x1fad /* subs r5, r5, #6 */ 
/*0x6688*/      bl call_7014
/*0x668c*/      mov r0, sl
/*0x668e*/      str.w sl, [r6, #0x28]
/*0x6692*/      str.w r8, [r6, #0x24]
/*0x6696*/      mov r1, sb
/*0x6698*/      cbz r7, jump_669e
/*0x669a*/      str r1, [r6, #0x24]
/*0x669c*/      b jump_66a0
            jump_669e:
/*0x669e*/      str r1, [r6, #0x28]
            jump_66a0:
/*0x66a0*/      str r0, [r6, #0x24]
            jump_66a2:
/*0x66a2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x66a4*/      uxtb r4, r4
/*0x66a6*/      bhs jump_6666
/*0x66a8*/      str.w sb, [r6, #0x24]
/*0x66ac*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_66b0:
/*0x66b0*/  .word 0x20000004
            data_66b4:
/*0x66b4*/  .word 0x400b0000
            data_66b8:
/*0x66b8*/  .word 0x20000348
            data_66bc:
/*0x66bc*/  .word 0x2000046a


            .thumb_func
            call_66c0:
/*0x66c0*/      push {r4, r5, lr}
/*0x66c2*/      ldrd r4, r3, [r1, #0x14]
/*0x66c6*/      cbz r4, jump_6702
/*0x66c8*/      mov.w r2, #0x200
/*0x66cc*/      lsrs r2, r3
/*0x66ce*/      orrs r2, r4
            jump_66d0:
/*0x66d0*/      ldr r4, [r1, #8]
/*0x66d2*/      ldr r3, [r1]
/*0x66d4*/      orrs r3, r4
/*0x66d6*/      ldrd r4, r5, [r1, #0xc]
/*0x66da*/      orrs r4, r5
/*0x66dc*/      orrs r3, r4
/*0x66de*/      ldr r4, [r1, #0x1c]
/*0x66e0*/      orrs r3, r4
/*0x66e2*/      orrs r3, r2
/*0x66e4*/      str r3, [r0, #4]
/*0x66e6*/      ldr r3, [r1, #0x24]
/*0x66e8*/      ldr r2, [r1, #4]
/*0x66ea*/      orrs r2, r3
/*0x66ec*/      ldr r3, [r1, #0x20]
/*0x66ee*/      orr.w r2, r2, r3, lsl #4
/*0x66f2*/      str r2, [r0, #0x18]
/*0x66f4*/      ldr r1, [r1, #0x28]
/*0x66f6*/      mov.w r2, #-1
/*0x66fa*/      add.w r1, r2, r1, lsr #1
/*0x66fe*/      str r1, [r0, #0xc]
/*0x6700*/      pop {r4, r5, pc}
            jump_6702:
/*0x6702*/      mov.w r2, #0x100
/*0x6706*/      lsls r2, r3
/*0x6708*/      b jump_66d0

/*0x670a*/  .byte 0x00
/*0x670b*/  .byte 0x00


            .thumb_func
            call_670c:
/*0x670c*/      push {r4, lr}
/*0x670e*/      ldr r4, [pc, #0x10] /* data_6720 */
/*0x6710*/      strb r1, [r4, r0]
/*0x6712*/      add r0, r4
/*0x6714*/      strb.w r2, [r0, #0x60]
/*0x6718*/      strb.w r3, [r0, #0xc0]
/*0x671c*/      pop {r4, pc}

/*0x671e*/  .byte 0x00
/*0x671f*/  .byte 0x00

            data_6720:
/*0x6720*/  .word 0x2000034a


            .thumb_func
            call_6724:
/*0x6724*/      ldr r0, [pc, #0x50] /* data_6778 */
/*0x6726*/      movs r1, #1
/*0x6728*/      str.w r1, [r0, #0x300]
/*0x672c*/      ldr r2, [pc, #0x4c] /* data_677c */
/*0x672e*/      str.w r1, [r2, #0xa8]
            jump_6732:
/*0x6732*/      ldr.w r3, [r2, #0x108]
/*0x6736*/      cmp r3, #0
/*0x6738*/      beq jump_6732
/*0x673a*/      movs r3, #0
/*0x673c*/      str r3, [r2, #0x20]
/*0x673e*/      mov.w r3, #0x9000000
/*0x6742*/      str r3, [r0, #0x18]
/*0x6744*/      str.w r1, [r2, #0xa4]
            jump_6748:
/*0x6748*/      ldr.w r3, [r2, #0x104]
/*0x674c*/      cmp r3, #0
/*0x674e*/      beq jump_6748
/*0x6750*/      ldr r2, [pc, #0x2c] /* data_6780 */
/*0x6752*/      ldr.w r3, [r2, #0x200]
/*0x6756*/      bic r3, r3, #7
/*0x675a*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x675c*/      str.w r3, [r2, #0x200]
/*0x6760*/      str r1, [r0, #0x20]
/*0x6762*/      ldr r2, [r0, #4]
/*0x6764*/      bic r2, r2, #3
/*0x6768*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x676a*/      str r2, [r0, #4]
            jump_676c:
/*0x676c*/      ldr r2, [r0, #0x34]
/*0x676e*/      cmp.w r1, r2, lsr #30
/*0x6772*/      bne jump_676c
/*0x6774*/      bx lr

/*0x6776*/  .byte 0x00
/*0x6777*/  .byte 0x00

            data_6778:
/*0x6778*/  .word 0x40088000
            data_677c:
/*0x677c*/  .word 0x43100000
            data_6780:
/*0x6780*/  .word 0x40080000


            .thumb_func
            call_6784:
/*0x6784*/      ldr r0, [pc, #0x18] /* data_67a0 */
/*0x6786*/      movs r1, #0
/*0x6788*/      add.w r2, r0, #0xc
/*0x678c*/      str r1, [r0, #0x18]
/*0x678e*/      str r1, [r0, #0x1c]
/*0x6790*/      strb r1, [r2, #1]
/*0x6792*/      str.w r1, [r0, #0x11]
/*0x6796*/      movs r1, #0x1d
/*0x6798*/      adds r0, #0x22
/*0x679a*/      b.w call_35e2

/*0x679e*/  .byte 0x00
/*0x679f*/  .byte 0x00

            data_67a0:
/*0x67a0*/  .word 0x20000834


            .thumb_func
            usb_intr:
/*0x67a4*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x67a8*/      movs r0, #0
/*0x67aa*/      bl call_3aa4
/*0x67ae*/      mov r5, r0
/*0x67b0*/      ldr.w r8, [pc, #0x1b8] /* data_696c */
/*0x67b4*/      ldr r6, [pc, #0x1b8] /* data_6970 */
/*0x67b6*/      lsls r0, r0, #0x1b
/*0x67b8*/      bpl jump_67d8
/*0x67ba*/      movs r0, #0x10
/*0x67bc*/      str r0, [r6, #8]
/*0x67be*/      ldrb.w r1, [r8, #0x15]
/*0x67c2*/      mov r0, r8
/*0x67c4*/      cmp r1, #2
/*0x67c6*/      blo jump_67d8
/*0x67c8*/      ldr r1, [r6]
/*0x67ca*/      orr r1, r1, #0xc
/*0x67ce*/      str r1, [r6]
/*0x67d0*/      ldrb r1, [r0, #0x15]
/*0x67d2*/      strb r1, [r0, #0x16]
/*0x67d4*/      movs r1, #3
/*0x67d6*/      strb r1, [r0, #0x15]
            jump_67d8:
/*0x67d8*/      lsls r0, r5, #0x1d
/*0x67da*/      mov.w sl, #4
/*0x67de*/      mov.w sb, #0
/*0x67e2*/      bpl jump_6826
/*0x67e4*/      ldr r0, [pc, #0x184] /* data_696c */
/*0x67e6*/      mov r1, sb
/*0x67e8*/      mov r4, sl
/*0x67ea*/      strb.w sb, [r0, #0x12]
/*0x67ee*/      strb.w sb, [r0, #0x14]
/*0x67f2*/      ldrb r2, [r0, #0x17]
/*0x67f4*/      bic r2, r2, #2
/*0x67f8*/      strb r2, [r0, #0x17]
/*0x67fa*/      strb.w sl, [r0, #0x15]
/*0x67fe*/      strb.w sb, [r0, #0x18]
/*0x6802*/      movs r0, #0x20
/*0x6804*/      movs r3, #1
/*0x6806*/      mov r2, r1
/*0x6808*/      bl call_614c
/*0x680c*/      bl call_3ac8
/*0x6810*/      movs r0, #0
/*0x6812*/      bl call_6d0c
/*0x6816*/      ldr r0, [r6, #4]
/*0x6818*/      movw r1, #0x111d
/*0x681c*/      orrs r0, r1
/*0x681e*/      str r0, [r6, #4]
/*0x6820*/      bl call_74b4
/*0x6824*/      str r4, [r6, #8]
            jump_6826:
/*0x6826*/      lsls r0, r5, #0x1c
/*0x6828*/      bpl jump_683a
/*0x682a*/      bl call_3ac8
/*0x682e*/      ldrb.w r1, [r8, #0x16]
/*0x6832*/      strb.w r1, [r8, #0x15]
/*0x6836*/      movs r0, #8
/*0x6838*/      str r0, [r6, #8]
            jump_683a:
/*0x683a*/      lsls r0, r5, #0x17
/*0x683c*/      mov.w fp, #1
/*0x6840*/      bpl jump_6916
/*0x6842*/      movs r0, #1
/*0x6844*/      bl call_3aa4
/*0x6848*/      mov r7, r0
/*0x684a*/      lsls r0, r0, #0x16
/*0x684c*/      bpl jump_6896
/*0x684e*/      ldr r1, [pc, #0x124] /* data_6974 */
/*0x6850*/      ldr r4, [pc, #0x118] /* data_696c */
/*0x6852*/      ldr r2, [r1]
/*0x6854*/      str.w r2, [r8]
/*0x6858*/      ldr r1, [r1, #4]
/*0x685a*/      str.w r1, [r8, #4]
/*0x685e*/      strb.w sb, [r4, #0x12]
/*0x6862*/      strh.w sb, [r4, #0x10]
/*0x6866*/      ldrb r0, [r4]
/*0x6868*/      ands r0, r0, #0x60
/*0x686c*/      beq jump_6874
/*0x686e*/      cmp r0, #0x20
/*0x6870*/      bne jump_6882
/*0x6872*/      b jump_687c
            jump_6874:
/*0x6874*/      mov r0, r4
/*0x6876*/      bl call_7610
/*0x687a*/      b jump_6882
            jump_687c:
/*0x687c*/      mov r0, r4
/*0x687e*/      bl call_73cc
            jump_6882:
/*0x6882*/      ldrb r0, [r4, #0x12]
/*0x6884*/      cmp r0, #1
/*0x6886*/      beq jump_68a8
/*0x6888*/      cmp r0, #2
/*0x688a*/      beq jump_68ba
/*0x688c*/      str.w sl, [r6, #0x14]
            jump_6890:
/*0x6890*/      mov.w r0, #0x200
/*0x6894*/      str r0, [r6, #0x1c]
            jump_6896:
/*0x6896*/      lsls r0, r7, #0x1e
/*0x6898*/      bpl jump_68fa
/*0x689a*/      movs r0, #2
/*0x689c*/      str r0, [r6, #0x1c]
/*0x689e*/      ldrb.w r0, [r8, #0x12]
/*0x68a2*/      cmp r0, #2
/*0x68a4*/      beq jump_68c6
/*0x68a6*/      b jump_68fa
            jump_68a8:
/*0x68a8*/      ldrh r1, [r4, #0x10]
/*0x68aa*/      ldrh r0, [r4, #6]
/*0x68ac*/      cmp r1, r0
/*0x68ae*/      bls jump_68b2
/*0x68b0*/      strh r0, [r4, #0x10]
            jump_68b2:
/*0x68b2*/      mov r0, r4
/*0x68b4*/      bl call_74d8
/*0x68b8*/      b jump_6890
            jump_68ba:
/*0x68ba*/      movs r2, #0
/*0x68bc*/      mov r1, r2
/*0x68be*/      mov r0, r2
/*0x68c0*/      bl call_3a70
/*0x68c4*/      b jump_6890
            jump_68c6:
/*0x68c6*/      ldr r4, [pc, #0xa4] /* data_696c */
/*0x68c8*/      movs r0, #0
/*0x68ca*/      ldrh r2, [r4, #0x10]
/*0x68cc*/      ldr r1, [r4, #8]
/*0x68ce*/      bl call_3a10
/*0x68d2*/      ldr r1, [r4, #8]
/*0x68d4*/      add r1, r0
/*0x68d6*/      str r1, [r4, #8]
/*0x68d8*/      ldrh r1, [r4, #0x10]
/*0x68da*/      subs r0, r1, r0
/*0x68dc*/      lsls r0, r0, #0x10
/*0x68de*/      lsrs r0, r0, #0x10
/*0x68e0*/      strh r0, [r4, #0x10]
/*0x68e2*/      bne jump_68fa
/*0x68e4*/      strb.w sb, [r4, #0x12]
/*0x68e8*/      ldrb r0, [r4, #0x13]
/*0x68ea*/      cbnz r0, jump_68fa
/*0x68ec*/      sub.w r0, r4, #0x40
/*0x68f0*/      ldrb r1, [r4, #0xc]
/*0x68f2*/      strb r1, [r0, #8]
/*0x68f4*/      adds r1, r0, #4
/*0x68f6*/      strb.w fp, [r1]
            jump_68fa:
/*0x68fa*/      lsls r0, r7, #0x1b
/*0x68fc*/      bpl jump_6910
/*0x68fe*/      ldrb.w r0, [r8, #0x12]
/*0x6902*/      cmp r0, #1
/*0x6904*/      bne jump_690c
/*0x6906*/      ldr r0, [pc, #0x64] /* data_696c */
/*0x6908*/      bl call_74d8
            jump_690c:
/*0x690c*/      movs r0, #0x10
/*0x690e*/      str r0, [r6, #0x1c]
            jump_6910:
/*0x6910*/      mov.w r0, #0x100
/*0x6914*/      str r0, [r6, #8]
            jump_6916:
/*0x6916*/      ldr.w sb, [pc, #0x54] /* data_696c */
/*0x691a*/      movs r4, #1
/*0x691c*/      mov r8, fp
/*0x691e*/      sub.w sb, sb, #0x40
/*0x6922*/      mov.w fp, #0x12
/*0x6926*/      mov sl, r6
/*0x6928*/      lsls r7, r4, #8
            jump_692a:
/*0x692a*/      lsl.w r6, r7, r4
/*0x692e*/      tst r6, r5
/*0x6930*/      beq jump_6960
/*0x6932*/      adds r0, r4, #1
/*0x6934*/      uxtb r0, r0
/*0x6936*/      bl call_3aa4
/*0x693a*/      tst.w r0, #0x12
/*0x693e*/      beq jump_695c
/*0x6940*/      ldr r0, [pc, #0x2c] /* data_6970 */
/*0x6942*/      adds r1, r4, #1
/*0x6944*/      adds r0, #8
/*0x6946*/      bl call_3abc
/*0x694a*/      str.w fp, [r0]
/*0x694e*/      ldrb.w r2, [sb, #7]
/*0x6952*/      lsl.w r0, r8, r4
/*0x6956*/      orrs r0, r2
/*0x6958*/      strb.w r0, [sb, #7]
            jump_695c:
/*0x695c*/      str.w r6, [sl, #8]
            jump_6960:
/*0x6960*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6962*/      uxtb r4, r4
/*0x6964*/      cmp r4, #8
/*0x6966*/      blo jump_692a
/*0x6968*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_696c:
/*0x696c*/  .word 0x20000874
            data_6970:
/*0x6970*/  .word 0x400a8000
            data_6974:
/*0x6974*/  .word 0x400aa000


            .thumb_func
            call_6978:
/*0x6978*/      push {r4, lr}
/*0x697a*/      bl call_74b4
/*0x697e*/      ldr r1, [pc, #0xc] /* data_698c */
/*0x6980*/      movs r0, #0
/*0x6982*/      strb r0, [r1, #6]
/*0x6984*/      movs r0, #2
/*0x6986*/      adds r1, #0x40
/*0x6988*/      strb r0, [r1, #0x15]
/*0x698a*/      pop {r4, pc}

            data_698c:
/*0x698c*/  .word 0x20000834


            .thumb_func
            call_6990:
/*0x6990*/      push {r4, r5, r6, lr}
/*0x6992*/      ldr r4, [pc, #0x70] /* data_6a04 */
/*0x6994*/      ldrb r0, [r4, #0x15]
/*0x6996*/      cmp r0, #3
/*0x6998*/      bne jump_699e
/*0x699a*/      bl call_77f4
            jump_699e:
/*0x699e*/      ldr r5, [pc, #0x64] /* data_6a04 */
/*0x69a0*/      subs r5, #0x40
/*0x69a2*/      movs r6, #1
/*0x69a4*/      ldrb r0, [r5, #6]
/*0x69a6*/      cbz r0, jump_69d6
/*0x69a8*/      cmp r0, #1
/*0x69aa*/      beq jump_69c8
/*0x69ac*/      cmp r0, #2
/*0x69ae*/      beq jump_69c2
/*0x69b0*/      cmp r0, #3
/*0x69b2*/      bne jump_69fe
/*0x69b4*/      ldrb r0, [r4, #0x15]
/*0x69b6*/      cmp r0, #6
/*0x69b8*/      bne jump_69be
/*0x69ba*/      bl call_752c
            jump_69be:
/*0x69be*/      movs r0, #2
/*0x69c0*/      pop {r4, r5, r6, pc}
            jump_69c2:
/*0x69c2*/      strb r6, [r5, #6]
/*0x69c4*/      movs r0, #3
/*0x69c6*/      pop {r4, r5, r6, pc}
            jump_69c8:
/*0x69c8*/      ldrb r0, [r4, #0x15]
/*0x69ca*/      cmp r0, #6
/*0x69cc*/      bne jump_69fe
/*0x69ce*/      movs r0, #3
/*0x69d0*/      strb r0, [r5, #6]
/*0x69d2*/      movs r0, #1
/*0x69d4*/      pop {r4, r5, r6, pc}
            jump_69d6:
/*0x69d6*/      ldr r1, [pc, #0x30] /* data_6a08 */
/*0x69d8*/      mov.w r0, #0x200000
/*0x69dc*/      str.w r0, [r1, #0x100]
/*0x69e0*/      movs r1, #0
/*0x69e2*/      asrs r0, r0, #0xb
/*0x69e4*/      movs r2, #0x40
/*0x69e6*/      movs r3, #1
/*0x69e8*/      bl call_3b5c
/*0x69ec*/      movs r0, #2
/*0x69ee*/      bl call_3b80
/*0x69f2*/      ldrb r0, [r4, #0x17]
/*0x69f4*/      ubfx r0, r0, #0, #1
/*0x69f8*/      bl call_3ad8
/*0x69fc*/      strb r6, [r5, #6]
            jump_69fe:
/*0x69fe*/      movs r0, #0
/*0x6a00*/      pop {r4, r5, r6, pc}

/*0x6a02*/  .byte 0x00
/*0x6a03*/  .byte 0x00

            data_6a04:
/*0x6a04*/  .word 0x20000874
            data_6a08:
/*0x6a08*/  .word 0xe000e004


            .thumb_func
            call_6a0c:
/*0x6a0c*/      push {r2, r3, r4, r5, r6, lr}
/*0x6a0e*/      movs r0, #5
/*0x6a10*/      ldr r4, [pc, #0x18] /* data_6a2c */
/*0x6a12*/      strh.w r0, [sp]
/*0x6a16*/      movs r5, #0x40
/*0x6a18*/      str r5, [r4, #0x28]
/*0x6a1a*/      movs r2, #2
/*0x6a1c*/      add r1, sp, #4
/*0x6a1e*/      mov r0, sp
/*0x6a20*/      bl call_6b64
/*0x6a24*/      str r5, [r4, #0x24]
/*0x6a26*/      ldrb.w r0, [sp, #5]
/*0x6a2a*/      pop {r2, r3, r4, r5, r6, pc}

            data_6a2c:
/*0x6a2c*/  .word 0x400b2000


            .thumb_func
            call_6a30:
/*0x6a30*/      push {r4, lr}
/*0x6a32*/      bl call_6a0c
/*0x6a36*/      ubfx r0, r0, #0, #1
/*0x6a3a*/      pop {r4, pc}

            .thumb_func
            call_6a3c:
/*0x6a3c*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x6a40*/      mov r7, r2
/*0x6a42*/      mov r4, r1
/*0x6a44*/      mov r8, r0
/*0x6a46*/      bl call_6c24
/*0x6a4a*/      ldr r6, [pc, #0x34] /* data_6a80 */
/*0x6a4c*/      movs r5, #0x40
/*0x6a4e*/      str r5, [r6, #0x28]
/*0x6a50*/      movs r0, #2
/*0x6a52*/      strb.w r0, [sp]
/*0x6a56*/      lsrs r0, r4, #0x10
/*0x6a58*/      strb.w r0, [sp, #1]
/*0x6a5c*/      lsrs r0, r4, #8
/*0x6a5e*/      strb.w r0, [sp, #2]
/*0x6a62*/      strb.w r4, [sp, #3]
/*0x6a66*/      movs r2, #4
/*0x6a68*/      movs r1, #0
/*0x6a6a*/      mov r0, sp
/*0x6a6c*/      bl call_6b64
/*0x6a70*/      mov r2, r7
/*0x6a72*/      movs r1, #0
/*0x6a74*/      mov r0, r8
/*0x6a76*/      bl call_6b64
/*0x6a7a*/      str r5, [r6, #0x24]
/*0x6a7c*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

            data_6a80:
/*0x6a80*/  .word 0x400b2000


            .thumb_func
            call_6a84:
/*0x6a84*/      push {r3, r4, r5, r6, r7, lr}
/*0x6a86*/      mov r4, r0
/*0x6a88*/      bl call_6c24
/*0x6a8c*/      ldr r6, [pc, #0x28] /* data_6ab8 */
/*0x6a8e*/      movs r5, #0x40
/*0x6a90*/      str r5, [r6, #0x28]
/*0x6a92*/      movs r0, #0x20
/*0x6a94*/      strb.w r0, [sp]
/*0x6a98*/      lsrs r0, r4, #0x10
/*0x6a9a*/      strb.w r0, [sp, #1]
/*0x6a9e*/      lsrs r0, r4, #8
/*0x6aa0*/      strb.w r0, [sp, #2]
/*0x6aa4*/      strb.w r4, [sp, #3]
/*0x6aa8*/      movs r2, #4
/*0x6aaa*/      movs r1, #0
/*0x6aac*/      mov r0, sp
/*0x6aae*/      bl call_6b64
/*0x6ab2*/      str r5, [r6, #0x24]
/*0x6ab4*/      pop {r3, r4, r5, r6, r7, pc}

/*0x6ab6*/  .byte 0x00
/*0x6ab7*/  .byte 0x00

            data_6ab8:
/*0x6ab8*/  .word 0x400b2000


            .thumb_func
            call_6abc:
/*0x6abc*/      push {r3, r4, r5, r6, r7, lr}
/*0x6abe*/      mov r6, r0
/*0x6ac0*/      bl call_6c24
/*0x6ac4*/      ldr r4, [pc, #0x1c] /* data_6ae4 */
/*0x6ac6*/      movs r5, #0x40
/*0x6ac8*/      str r5, [r4, #0x28]
/*0x6aca*/      movs r0, #1
/*0x6acc*/      strb.w r0, [sp]
/*0x6ad0*/      strb.w r6, [sp, #1]
/*0x6ad4*/      movs r2, #2
/*0x6ad6*/      movs r1, #0
/*0x6ad8*/      mov r0, sp
/*0x6ada*/      bl call_6b64
/*0x6ade*/      str r5, [r4, #0x24]
/*0x6ae0*/      pop {r3, r4, r5, r6, r7, pc}

/*0x6ae2*/  .byte 0x00
/*0x6ae3*/  .byte 0x00

            data_6ae4:
/*0x6ae4*/  .word 0x400b2000


            .thumb_func
            call_6ae8:
/*0x6ae8*/      push {r4, lr}
/*0x6aea*/      movs r4, #0x3c
/*0x6aec*/      bl call_6a3c
/*0x6af0*/      b jump_6afe
            jump_6af2:
/*0x6af2*/      movs r0, #0x64
/*0x6af4*/      bl call_37b8
/*0x6af8*/      bl call_6a30
/*0x6afc*/      cbz r0, jump_6b06
            jump_6afe:
/*0x6afe*/      mov r0, r4
/*0x6b00*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6b02*/      bhs jump_6af2
/*0x6b04*/      pop {r4, pc}
            jump_6b06:
/*0x6b06*/      movs r0, #1
/*0x6b08*/      pop {r4, pc}

/*0x6b0a*/  .byte 0x00
/*0x6b0b*/  .byte 0x00


            .thumb_func
            call_6b0c:
/*0x6b0c*/      push {r3, r4, r5, lr}
/*0x6b0e*/      movs r0, #0xb9
/*0x6b10*/      ldr r4, [pc, #0x1c] /* data_6b30 */
/*0x6b12*/      strb.w r0, [sp]
/*0x6b16*/      movs r5, #0x40
/*0x6b18*/      str r5, [r4, #0x28]
/*0x6b1a*/      movs r2, #1
/*0x6b1c*/      movs r1, #0
/*0x6b1e*/      mov r0, sp
/*0x6b20*/      bl call_6b64
/*0x6b24*/      str r5, [r4, #0x24]
/*0x6b26*/      movs r0, #0xa
/*0x6b28*/      bl call_37b8
/*0x6b2c*/      pop {r3, r4, r5, pc}

/*0x6b2e*/  .byte 0x00
/*0x6b2f*/  .byte 0x00

            data_6b30:
/*0x6b30*/  .word 0x400b2000


            .thumb_func
            call_6b34:
/*0x6b34*/      push {r2, r3, r4, r5, r6, lr}
/*0x6b36*/      ldr r4, [pc, #0x28] /* data_6b60 */
/*0x6b38*/      movs r5, #0x40
/*0x6b3a*/      str r5, [r4, #0x28]
/*0x6b3c*/      movs r0, #0x9f
/*0x6b3e*/      strb.w r0, [sp, #4]
/*0x6b42*/      movs r0, #0
/*0x6b44*/      mov r1, r0
/*0x6b46*/      str r0, [sp]
/*0x6b48*/      movs r2, #1
/*0x6b4a*/      add r0, sp, #4
/*0x6b4c*/      bl call_6b64
/*0x6b50*/      movs r2, #3
/*0x6b52*/      mov r1, sp
/*0x6b54*/      movs r0, #0
/*0x6b56*/      bl call_6b64
/*0x6b5a*/      str r5, [r4, #0x24]
/*0x6b5c*/      ldr r0, [sp]
/*0x6b5e*/      pop {r2, r3, r4, r5, r6, pc}

            data_6b60:
/*0x6b60*/  .word 0x400b2000


            .thumb_func
            call_6b64:
/*0x6b64*/      push {r4, r5, r6, r7, lr}
/*0x6b66*/      movs r3, #0
/*0x6b68*/      cmp r2, #8
/*0x6b6a*/      bls jump_6b70
/*0x6b6c*/      movs r4, #8
/*0x6b6e*/      b jump_6b72
            jump_6b70:
/*0x6b70*/      mov r4, r2
            jump_6b72:
/*0x6b72*/      movs r5, #0
/*0x6b74*/      mov r7, r5
/*0x6b76*/      ldr r6, [pc, #0x58] /* data_6bd0 */
/*0x6b78*/      b jump_6b86
            jump_6b7a:
/*0x6b7a*/      cbz r0, jump_6b8c
/*0x6b7c*/      ldrb.w ip, [r0, r5]
/*0x6b80*/      str.w ip, [r6, #0x10]
            jump_6b84:
/*0x6b84*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_6b86:
/*0x6b86*/      cmp r5, r4
/*0x6b88*/      blo jump_6b7a
/*0x6b8a*/      b jump_6bae
            jump_6b8c:
/*0x6b8c*/      str r7, [r6, #0x10]
/*0x6b8e*/      b jump_6b84
            jump_6b90:
/*0x6b90*/      ldr r5, [r6, #0x1c]
/*0x6b92*/      tst.w r5, #0xf0
/*0x6b96*/      beq jump_6b90
/*0x6b98*/      ldr r5, [r6, #0x10]
/*0x6b9a*/      uxtb r5, r5
/*0x6b9c*/      cbz r0, jump_6bb4
/*0x6b9e*/      ldrb.w ip, [r0, r4]
/*0x6ba2*/      str.w ip, [r6, #0x10]
            jump_6ba6:
/*0x6ba6*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6ba8*/      cbz r1, jump_6bac
/*0x6baa*/      strb r5, [r1, r3]
            jump_6bac:
/*0x6bac*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_6bae:
/*0x6bae*/      cmp r4, r2
/*0x6bb0*/      blo jump_6b90
/*0x6bb2*/      b jump_6bca
            jump_6bb4:
/*0x6bb4*/      str r7, [r6, #0x10]
/*0x6bb6*/      b jump_6ba6
            jump_6bb8:
/*0x6bb8*/      ldr r0, [r6, #0x1c]
/*0x6bba*/      tst.w r0, #0xf0
/*0x6bbe*/      beq jump_6bb8
/*0x6bc0*/      ldr r0, [r6, #0x10]
/*0x6bc2*/      uxtb r0, r0
/*0x6bc4*/      cbz r1, jump_6bc8
/*0x6bc6*/      strb r0, [r1, r3]
            jump_6bc8:
/*0x6bc8*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_6bca:
/*0x6bca*/      cmp r3, r2
/*0x6bcc*/      blo jump_6bb8
/*0x6bce*/      pop {r4, r5, r6, r7, pc}

            data_6bd0:
/*0x6bd0*/  .word 0x40044000


            .thumb_func
            call_6bd4:
/*0x6bd4*/      push {r4, r5, r6, lr}
/*0x6bd6*/      movw r4, #0x12d
/*0x6bda*/      bl call_6a84
/*0x6bde*/      mov.w r5, #0x3e8
/*0x6be2*/      b jump_6bf0
            jump_6be4:
/*0x6be4*/      mov r0, r5
/*0x6be6*/      bl call_37b8
/*0x6bea*/      bl call_6a30
/*0x6bee*/      cbz r0, jump_6bf8
            jump_6bf0:
/*0x6bf0*/      mov r0, r4
/*0x6bf2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6bf4*/      bhs jump_6be4
/*0x6bf6*/      pop {r4, r5, r6, pc}
            jump_6bf8:
/*0x6bf8*/      movs r0, #1
/*0x6bfa*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6bfc:
/*0x6bfc*/      push {r3, r4, r5, lr}
/*0x6bfe*/      movs r0, #0xab
/*0x6c00*/      ldr r4, [pc, #0x1c] /* data_6c20 */
/*0x6c02*/      strb.w r0, [sp]
/*0x6c06*/      movs r5, #0x40
/*0x6c08*/      str r5, [r4, #0x28]
/*0x6c0a*/      movs r2, #1
/*0x6c0c*/      movs r1, #0
/*0x6c0e*/      mov r0, sp
/*0x6c10*/      bl call_6b64
/*0x6c14*/      str r5, [r4, #0x24]
/*0x6c16*/      movs r0, #0xa
/*0x6c18*/      bl call_37b8
/*0x6c1c*/      pop {r3, r4, r5, pc}

/*0x6c1e*/  .byte 0x00
/*0x6c1f*/  .byte 0x00

            data_6c20:
/*0x6c20*/  .word 0x400b2000


            .thumb_func
            call_6c24:
/*0x6c24*/      push {r3, r4, r5, lr}
/*0x6c26*/      movs r0, #6
/*0x6c28*/      ldr r4, [pc, #0x14] /* data_6c40 */
/*0x6c2a*/      strb.w r0, [sp]
/*0x6c2e*/      movs r5, #0x40
/*0x6c30*/      str r5, [r4, #0x28]
/*0x6c32*/      movs r2, #1
/*0x6c34*/      movs r1, #0
/*0x6c36*/      mov r0, sp
/*0x6c38*/      bl call_6b64
/*0x6c3c*/      str r5, [r4, #0x24]
/*0x6c3e*/      pop {r3, r4, r5, pc}

            data_6c40:
/*0x6c40*/  .word 0x400b2000

            jump_6c44:
/*0x6c44*/      push {r4, lr}
/*0x6c46*/      mov.w r4, #0x19a
/*0x6c4a*/      bl call_6abc
/*0x6c4e*/      b jump_6c5c
            jump_6c50:
/*0x6c50*/      movs r0, #0x64
/*0x6c52*/      bl call_37b8
/*0x6c56*/      bl call_6a30
/*0x6c5a*/      cbz r0, jump_6c64
            jump_6c5c:
/*0x6c5c*/      mov r0, r4
/*0x6c5e*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6c60*/      bhs jump_6c50
/*0x6c62*/      pop {r4, pc}
            jump_6c64:
/*0x6c64*/      movs r0, #1
/*0x6c66*/      pop {r4, pc}

            .thumb_func
            call_6c68:
/*0x6c68*/      push {r4, lr}
/*0x6c6a*/      cmp r1, #1
/*0x6c6c*/      bne jump_6c94
/*0x6c6e*/      cmp r0, #0x1f
/*0x6c70*/      beq jump_6c94
/*0x6c72*/      bgt jump_6c86
/*0x6c74*/      cmp r0, #0xb
/*0x6c76*/      beq jump_6c94
/*0x6c78*/      cmp r0, #0xc
/*0x6c7a*/      beq jump_6c94
/*0x6c7c*/      cmp r0, #0xd
/*0x6c7e*/      beq jump_6c94
/*0x6c80*/      cmp r0, #0x1e
/*0x6c82*/      bne jump_6c92
/*0x6c84*/      b jump_6c94
            jump_6c86:
/*0x6c86*/      cmp r0, #0x2d
/*0x6c88*/      beq jump_6c94
/*0x6c8a*/      cmp r0, #0x2e
/*0x6c8c*/      beq jump_6c94
/*0x6c8e*/      cmp r0, #0x2f
/*0x6c90*/      beq jump_6c94
            jump_6c92:
/*0x6c92*/      movs r1, #0
            jump_6c94:
/*0x6c94*/      ldr r3, [pc, #0x18] /* data_6cb0 */
/*0x6c96*/      lsrs r2, r0, #3
/*0x6c98*/      add.w r2, r3, r2, lsl #2
/*0x6c9c*/      lsls r0, r0, #0x1d
/*0x6c9e*/      ldr r3, [r2]
/*0x6ca0*/      lsrs r0, r0, #0x1b
/*0x6ca2*/      movs r4, #0xf
/*0x6ca4*/      lsls r4, r0
/*0x6ca6*/      bics r3, r4
/*0x6ca8*/      lsls r1, r0
/*0x6caa*/      orrs r3, r1
/*0x6cac*/      str r3, [r2]
/*0x6cae*/      pop {r4, pc}

            data_6cb0:
/*0x6cb0*/  .word 0x40022020


            .thumb_func
            call_6cb4:
/*0x6cb4*/      push {r4, lr}
/*0x6cb6*/      mvns r3, r1
/*0x6cb8*/      lsls r4, r2, #0x1f
/*0x6cba*/      ldr r4, [r0, #8]
/*0x6cbc*/      beq jump_6cc2
/*0x6cbe*/      orrs r4, r1
/*0x6cc0*/      b jump_6cc4
            jump_6cc2:
/*0x6cc2*/      ands r4, r3
            jump_6cc4:
/*0x6cc4*/      str r4, [r0, #8]
/*0x6cc6*/      lsls r2, r2, #0x1e
/*0x6cc8*/      bpl jump_6cd2
/*0x6cca*/      ldr r2, [r0, #0xc]
/*0x6ccc*/      orrs r2, r1
/*0x6cce*/      str r2, [r0, #0xc]
/*0x6cd0*/      pop {r4, pc}
            jump_6cd2:
/*0x6cd2*/      ldr r1, [r0, #0xc]
/*0x6cd4*/      ands r1, r3
/*0x6cd6*/      str r1, [r0, #0xc]
/*0x6cd8*/      pop {r4, pc}

            .thumb_func
            call_6cda:
/*0x6cda*/      push {r4, r5, r6, lr}
/*0x6cdc*/      movs r5, #0x80
            jump_6cde:
/*0x6cde*/      lsls r4, r4, #4
/*0x6ce0*/      lsls r3, r3, #4
/*0x6ce2*/      tst r2, r5
/*0x6ce4*/      beq jump_6cea
/*0x6ce6*/      add r4, r1
/*0x6ce8*/      b jump_6cec
            jump_6cea:
/*0x6cea*/      adds r3, #0xf
            jump_6cec:
/*0x6cec*/      lsrs r5, r5, #1
/*0x6cee*/      bne jump_6cde
/*0x6cf0*/      ldr r1, [r0]
/*0x6cf2*/      ands r1, r3
/*0x6cf4*/      orrs r1, r4
/*0x6cf6*/      str r1, [r0]
/*0x6cf8*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6cfa:
/*0x6cfa*/      .short 0x1cd2 /* adds r2, r2, #3 */ 
/*0x6cfc*/      lsrs r2, r2, #2
/*0x6cfe*/      b jump_6d04
            jump_6d00:
/*0x6d00*/      ldm r1!, {r3}
/*0x6d02*/      stm r0!, {r3}
            jump_6d04:
/*0x6d04*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6d06*/      bhs jump_6d00
/*0x6d08*/      bx lr

/*0x6d0a*/  .byte 0x00
/*0x6d0b*/  .byte 0x00


            .thumb_func
            call_6d0c:
/*0x6d0c*/      push {r4, lr}
/*0x6d0e*/      mov r4, r0
/*0x6d10*/      adds r1, r0, #1
/*0x6d12*/      ldr r0, [pc, #0x24] /* data_6d38 */
/*0x6d14*/      bl call_3abc
/*0x6d18*/      ldr r1, [pc, #0x20] /* data_6d3c */
/*0x6d1a*/      ldr.w r2, [r1, r4, lsl #3]
/*0x6d1e*/      str r2, [r0, #0x10]
/*0x6d20*/      add.w r1, r1, r4, lsl #3
/*0x6d24*/      ldr r1, [r1, #4]
/*0x6d26*/      str r1, [r0, #4]
/*0x6d28*/      mov.w r1, #-1
/*0x6d2c*/      str r1, [r0, #8]
/*0x6d2e*/      ldr r1, [r0]
/*0x6d30*/      and r1, r1, #0x19
/*0x6d34*/      str r1, [r0]
/*0x6d36*/      pop {r4, pc}

            data_6d38:
/*0x6d38*/  .word 0x400a8000
            data_6d3c:
/*0x6d3c*/  .word 0x00008078 /* possible pointer */

            jump_6d40:
/*0x6d40*/      ldr r0, [pc, #0x18] /* data_6d5c */
/*0x6d42*/      push {r4, lr}
/*0x6d44*/      ldrb r0, [r0, #2]
/*0x6d46*/      bl call_43e8
/*0x6d4a*/      ldr r1, [pc, #0x14] /* data_6d60 */
/*0x6d4c*/      movs r0, #0
/*0x6d4e*/      str r0, [r1, #4]
/*0x6d50*/      ldr r1, [pc, #0x10] /* data_6d64 */
/*0x6d52*/      strb r0, [r1, #5]
/*0x6d54*/      movs r0, #1
/*0x6d56*/      strb r0, [r1]
/*0x6d58*/      pop {r4, pc}

/*0x6d5a*/  .byte 0x00
/*0x6d5b*/  .byte 0x00

            data_6d5c:
/*0x6d5c*/  .word 0x20000894
            data_6d60:
/*0x6d60*/  .word 0x20000084
            data_6d64:
/*0x6d64*/  .word 0x200007b4

            jump_6d68:
/*0x6d68*/      push {r4, r5, r6, lr}
/*0x6d6a*/      mov r6, r0
/*0x6d6c*/      mov r5, r2
/*0x6d6e*/      mov r4, r1
/*0x6d70*/      mov r0, r1
/*0x6d72*/      bl call_6bd4
/*0x6d76*/      mov r2, r5
/*0x6d78*/      mov r1, r4
/*0x6d7a*/      mov r0, r6
/*0x6d7c*/      pop.w {r4, r5, r6, lr}
/*0x6d80*/      b.w jump_414c

            .thumb_func
            call_6d84:
/*0x6d84*/      push {r4, r5, lr}
/*0x6d86*/      ldr r1, [pc, #0x24] /* data_6dac */
/*0x6d88*/      movs r0, #0xa
/*0x6d8a*/      ldr r2, [pc, #0x1c] /* data_6da8 */
/*0x6d8c*/      ldr r3, [pc, #0x20] /* data_6db0 */
/*0x6d8e*/      ldrb.w r1, [r1, #0x25]
/*0x6d92*/      b jump_6d9e
            jump_6d94:
/*0x6d94*/      ldrb r4, [r2, r0]
/*0x6d96*/      muls r4, r1, r4
/*0x6d98*/      lsrs r4, r4, #3
/*0x6d9a*/      adds r5, r3, r0
/*0x6d9c*/      strb r4, [r5, #4]
            jump_6d9e:
/*0x6d9e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6da0*/      uxtb r0, r0
/*0x6da2*/      bhs jump_6d94
/*0x6da4*/      pop {r4, r5, pc}

/*0x6da6*/  .byte 0x00
/*0x6da7*/  .byte 0x00

            data_6da8:
/*0x6da8*/  .word 0x00007c58 /* possible pointer */
            data_6dac:
/*0x6dac*/  .word 0x200008a0
            data_6db0:
/*0x6db0*/  .word 0x20000090


            .thumb_func
            call_6db4:
/*0x6db4*/      push {r4, r5, r6, r7, lr}
/*0x6db6*/      ldr r6, [pc, #0x194] /* data_6f4c */
/*0x6db8*/      ldr r4, [pc, #0x194] /* data_6f50 */
/*0x6dba*/      sub sp, #0x1c
/*0x6dbc*/      ldrb r0, [r6, #3]
/*0x6dbe*/      cmp r0, #5
/*0x6dc0*/      bhi jump_6e5e
/*0x6dc2*/      cmp r0, #6
/*0x6dc4*/      bhs jump_6dfa
/*0x6dc6*/      tbb [pc, r0]

/*0x6dca*/  .byte 0x03 /* case switch_6dd0 */
/*0x6dcb*/  .byte 0x03 /* case switch_6dd0 */
/*0x6dcc*/  .byte 0x1d /* case switch_6e04 */
/*0x6dcd*/  .byte 0x56 /* case switch_6e76 */
/*0x6dce*/  .byte 0x43 /* case switch_6e50 */
/*0x6dcf*/  .byte 0x43 /* case switch_6e50 */

            switch_6dd0:
/*0x6dd0*/      movs r5, #3
/*0x6dd2*/      ldr r7, [pc, #0x180] /* data_6f54 */
/*0x6dd4*/      b jump_6df4
            jump_6dd6:
/*0x6dd6*/      ldrb r0, [r6, #3]
/*0x6dd8*/      cbz r0, jump_6dfe
/*0x6dda*/      adds r0, r4, r5
/*0x6ddc*/      ldrb r0, [r0, #4]
            jump_6dde:
/*0x6dde*/      ldr r1, [r4]
/*0x6de0*/      ldrb r1, [r1, #3]
/*0x6de2*/      muls r0, r1, r0
/*0x6de4*/      lsrs r2, r0, #3
/*0x6de6*/      add.w r0, r5, r5, lsl #1
/*0x6dea*/      add.w r0, r7, r0, lsl #5
/*0x6dee*/      movs r1, #0x60
/*0x6df0*/      bl call_35d4
            jump_6df4:
/*0x6df4*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6df6*/      uxtb r5, r5
/*0x6df8*/      bhs jump_6dd6
            jump_6dfa:
/*0x6dfa*/      add sp, #0x1c
/*0x6dfc*/      pop {r4, r5, r6, r7, pc}
            jump_6dfe:
/*0x6dfe*/      ldr r0, [r4]
/*0x6e00*/      ldrb r0, [r0, r5]
/*0x6e02*/      b jump_6dde
            switch_6e04:
/*0x6e04*/      ldrb r7, [r4, #4]
/*0x6e06*/      movs r5, #9
/*0x6e08*/      mov r6, sp
/*0x6e0a*/      b jump_6e28
            jump_6e0c:
/*0x6e0c*/      ldr r0, [r4]
/*0x6e0e*/      ldrb r0, [r0, #3]
/*0x6e10*/      lsls r1, r0, #5
/*0x6e12*/      sub.w r0, r1, r0, lsl #1
/*0x6e16*/      uxtb r1, r0
/*0x6e18*/      add.w r0, r5, r5, lsl #1
/*0x6e1c*/      adds r2, r0, r6
/*0x6e1e*/      mov r0, r7
/*0x6e20*/      bl call_4456
/*0x6e24*/      adds r7, #0x20
/*0x6e26*/      uxtb r7, r7
            jump_6e28:
/*0x6e28*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e2a*/      uxtb r5, r5
/*0x6e2c*/      bhs jump_6e0c
/*0x6e2e*/      ldr r5, [pc, #0x128] /* data_6f58 */
/*0x6e30*/      movs r4, #0x60
/*0x6e32*/      b jump_6e48
            jump_6e34:
/*0x6e34*/      ldrb r0, [r5]
/*0x6e36*/      cmp r0, #9
/*0x6e38*/      bhs jump_6e46
/*0x6e3a*/      add.w r0, r0, r0, lsl #1
/*0x6e3e*/      adds r1, r0, r6
/*0x6e40*/      mov r0, r4
/*0x6e42*/      bl call_44fc
            jump_6e46:
/*0x6e46*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6e48:
/*0x6e48*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6e4a*/      uxtb r4, r4
/*0x6e4c*/      bhs jump_6e34
/*0x6e4e*/      b jump_6dfa
            switch_6e50:
/*0x6e50*/      add sp, #0x1c
/*0x6e52*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x6e54*/      pop.w {r4, r5, r6, r7, lr}
/*0x6e58*/      uxtb r0, r0
/*0x6e5a*/      b.w jump_3ccc
            jump_6e5e:
/*0x6e5e*/      cmp r0, #7
/*0x6e60*/      bls jump_6dfa
/*0x6e62*/      bic r0, r0, #1
/*0x6e66*/      cmp r0, #8
/*0x6e68*/      beq switch_6e76
/*0x6e6a*/      cmp r0, #0xa
/*0x6e6c*/      beq jump_6e82
/*0x6e6e*/      cmp r0, #0xc
/*0x6e70*/      bne jump_6dfa
/*0x6e72*/      movs r5, #0x60
/*0x6e74*/      b jump_6f42
            switch_6e76:
/*0x6e76*/      add sp, #0x1c
/*0x6e78*/      adds r0, r4, #4
/*0x6e7a*/      pop.w {r4, r5, r6, r7, lr}
/*0x6e7e*/      b.w jump_44d0
            jump_6e82:
/*0x6e82*/      movs r0, #0
/*0x6e84*/      movs r5, #9
/*0x6e86*/      str r0, [sp, #4]
/*0x6e88*/      b jump_6ee0
            jump_6e8a:
/*0x6e8a*/      add.w r0, r5, r5, lsl #1
/*0x6e8e*/      add.w r1, r4, r0, lsl #1
/*0x6e92*/      ldrb r0, [r1, #4]!
/*0x6e96*/      cbnz r0, jump_6ea0
/*0x6e98*/      ldrb r0, [r1, #1]
/*0x6e9a*/      cbnz r0, jump_6ea0
/*0x6e9c*/      ldrb r0, [r1, #2]
/*0x6e9e*/      cbz r0, jump_6ecc
            jump_6ea0:
/*0x6ea0*/      ldrb r0, [r1, #3]
/*0x6ea2*/      cbnz r0, jump_6eac
/*0x6ea4*/      ldrb r0, [r1, #4]
/*0x6ea6*/      cbnz r0, jump_6eac
/*0x6ea8*/      ldrb r0, [r1, #5]
/*0x6eaa*/      cbz r0, jump_6ec8
            jump_6eac:
/*0x6eac*/      movs r2, #3
/*0x6eae*/      mov r6, sp
/*0x6eb0*/      b jump_6ec0
            jump_6eb2:
/*0x6eb2*/      adds r3, r1, r2
/*0x6eb4*/      ldrb r0, [r1, r2]
/*0x6eb6*/      ldrb r3, [r3, #3]
/*0x6eb8*/      cmp r0, r3
/*0x6eba*/      bhi jump_6ebe
/*0x6ebc*/      mov r0, r3
            jump_6ebe:
/*0x6ebe*/      strb r0, [r6, r2]
            jump_6ec0:
/*0x6ec0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6ec2*/      uxtb r2, r2
/*0x6ec4*/      bhs jump_6eb2
/*0x6ec6*/      mov r1, r6
            jump_6ec8:
/*0x6ec8*/      mov r0, r5
/*0x6eca*/      b jump_6edc
            jump_6ecc:
/*0x6ecc*/      ldrb r0, [r1, #3]
/*0x6ece*/      cbnz r0, jump_6ed8
/*0x6ed0*/      ldrb r0, [r1, #4]
/*0x6ed2*/      cbnz r0, jump_6ed8
/*0x6ed4*/      ldrb r0, [r1, #5]
/*0x6ed6*/      cbz r0, jump_6ee8
            jump_6ed8:
/*0x6ed8*/      mov r0, r5
/*0x6eda*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6edc:
/*0x6edc*/      bl call_6f5c
            jump_6ee0:
/*0x6ee0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6ee2*/      uxtb r5, r5
/*0x6ee4*/      bhs jump_6e8a
/*0x6ee6*/      b jump_6dfa
            jump_6ee8:
/*0x6ee8*/      add r1, sp, #4
/*0x6eea*/      b jump_6ec8
            jump_6eec:
/*0x6eec*/      ldr r0, [pc, #0x68] /* data_6f58 */
/*0x6eee*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6ef0*/      ldrb r1, [r0, r5]
/*0x6ef2*/      and r0, r1, #7
/*0x6ef6*/      add.w r0, r0, r0, lsl #2
/*0x6efa*/      add r0, r4
/*0x6efc*/      ldrsb.w r2, [r0, #0x12]
/*0x6f00*/      adds r0, #0xe
/*0x6f02*/      cbz r2, jump_6f3a
/*0x6f04*/      ldrb r3, [r0, #3]
/*0x6f06*/      rsbs r1, r3, r1, lsr #3
/*0x6f0a*/      bpl jump_6f0e
/*0x6f0c*/      rsbs r1, r1, #0
            jump_6f0e:
/*0x6f0e*/      subs r1, r1, r2
/*0x6f10*/      adds r1, #0xa
/*0x6f12*/      uxtb r2, r1
/*0x6f14*/      cmp r2, #0xa
/*0x6f16*/      bhs jump_6f3a
/*0x6f18*/      movs r1, #3
/*0x6f1a*/      mov r3, sp
/*0x6f1c*/      adds r6, r4, r2
/*0x6f1e*/      b jump_6f2a
            jump_6f20:
/*0x6f20*/      ldrb r2, [r0, r1]
/*0x6f22*/      ldrb r7, [r6, #4]
/*0x6f24*/      muls r2, r7, r2
/*0x6f26*/      lsrs r2, r2, #8
/*0x6f28*/      strb r2, [r3, r1]
            jump_6f2a:
/*0x6f2a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6f2c*/      uxtb r1, r1
/*0x6f2e*/      bhs jump_6f20
/*0x6f30*/      mov r1, r3
/*0x6f32*/      mov r0, r5
/*0x6f34*/      bl call_44fc
/*0x6f38*/      b jump_6f42
            jump_6f3a:
/*0x6f3a*/      movs r1, #0
/*0x6f3c*/      mov r0, r5
/*0x6f3e*/      bl call_4540
            jump_6f42:
/*0x6f42*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6f44*/      uxtb r5, r5
/*0x6f46*/      bhs jump_6eec
/*0x6f48*/      b jump_6dfa

/*0x6f4a*/  .byte 0x00
/*0x6f4b*/  .byte 0x00

            data_6f4c:
/*0x6f4c*/  .word 0x200008a0
            data_6f50:
/*0x6f50*/  .word 0x20000090
            data_6f54:
/*0x6f54*/  .word 0x2000034a
            data_6f58:
/*0x6f58*/  .word 0x00007bf7 /* possible pointer */


            .thumb_func
            call_6f5c:
/*0x6f5c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6f60*/      mov r7, r1
/*0x6f62*/      mov r6, r0
/*0x6f64*/      movs r4, #0x60
/*0x6f66*/      ldr r5, [pc, #0x1c] /* data_6f84 */
/*0x6f68*/      b jump_6f7a
            jump_6f6a:
/*0x6f6a*/      ldrb r0, [r5]
/*0x6f6c*/      cmp r0, r6
/*0x6f6e*/      bne jump_6f78
/*0x6f70*/      mov r1, r7
/*0x6f72*/      mov r0, r4
/*0x6f74*/      bl call_44fc
            jump_6f78:
/*0x6f78*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6f7a:
/*0x6f7a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6f7c*/      uxtb r4, r4
/*0x6f7e*/      bhs jump_6f6a
/*0x6f80*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6f84:
/*0x6f84*/  .word 0x00007bf7 /* possible pointer */


            .thumb_func
            call_6f88:
/*0x6f88*/      push {r3, r4, r5, lr}
/*0x6f8a*/      mov r4, r0
/*0x6f8c*/      ldr r0, [pc, #0x24] /* data_6fb4 */
/*0x6f8e*/      ldr r0, [r0]
/*0x6f90*/      ldrb r5, [r0, #3]
/*0x6f92*/      cbnz r1, jump_6f9c
/*0x6f94*/      mov r0, sp
/*0x6f96*/      bl call_442a
/*0x6f9a*/      mov r1, sp
            jump_6f9c:
/*0x6f9c*/      movs r2, #3
/*0x6f9e*/      b jump_6fac
            jump_6fa0:
/*0x6fa0*/      ldrb r0, [r1], #1
/*0x6fa4*/      muls r0, r5, r0
/*0x6fa6*/      lsrs r0, r0, #3
/*0x6fa8*/      strb r0, [r4], #1
            jump_6fac:
/*0x6fac*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6fae*/      uxtb r2, r2
/*0x6fb0*/      bhs jump_6fa0
/*0x6fb2*/      pop {r3, r4, r5, pc}

            data_6fb4:
/*0x6fb4*/  .word 0x20000090


            .thumb_func
            call_6fb8:
/*0x6fb8*/      ldr r1, [pc, #0x24] /* data_6fe0 */
/*0x6fba*/      ldr r0, [r1]
/*0x6fbc*/      cbz r0, jump_6fdc
/*0x6fbe*/      cmp.w r0, #0x8000
/*0x6fc2*/      bhs jump_6fc8
/*0x6fc4*/      uxth r0, r0
/*0x6fc6*/      b jump_6fd6
            jump_6fc8:
/*0x6fc8*/      lsrs r0, r0, #0xa
/*0x6fca*/      beq jump_6fd2
/*0x6fcc*/      and r0, r0, #0x8000
/*0x6fd0*/      b jump_6fd6
            jump_6fd2:
/*0x6fd2*/      movw r0, #0x8001
            jump_6fd6:
/*0x6fd6*/      movs r2, #0x1e
/*0x6fd8*/      str r2, [r1]
/*0x6fda*/      bx lr
            jump_6fdc:
/*0x6fdc*/      movs r0, #0x1e
/*0x6fde*/      bx lr

            data_6fe0:
/*0x6fe0*/  .word 0x20001ba4


            .thumb_func
            call_6fe4:
/*0x6fe4*/      push {r4, lr}
/*0x6fe6*/      ldr r1, [pc, #0x28] /* data_7010 */
/*0x6fe8*/      mov.w r4, #0x8000
/*0x6fec*/      str r4, [r1, #0x28]
/*0x6fee*/      nop 
/*0x6ff0*/      nop 
/*0x6ff2*/      str r4, [r1, #0x24]
/*0x6ff4*/      mov.w r2, #0x4000
/*0x6ff8*/      b jump_7004
            jump_6ffa:
/*0x6ffa*/      str r2, [r1, #0x28]
/*0x6ffc*/      nop 
/*0x6ffe*/      nop 
/*0x7000*/      str r2, [r1, #0x24]
/*0x7002*/      nop 
            jump_7004:
/*0x7004*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7006*/      uxtb r0, r0
/*0x7008*/      bhs jump_6ffa
/*0x700a*/      str r4, [r1, #0x28]
/*0x700c*/      pop {r4, pc}

/*0x700e*/  .byte 0x00
/*0x700f*/  .byte 0x00

            data_7010:
/*0x7010*/  .word 0x400b0000


            .thumb_func
            call_7014:
/*0x7014*/      push {r4, r5, r6, lr}
/*0x7016*/      mov.w r4, #0x100
/*0x701a*/      lsls r3, r4, #6
/*0x701c*/      ldr r2, [pc, #0x20] /* data_7040 */
/*0x701e*/      movw r5, #0xffff
/*0x7022*/      b jump_7038
            jump_7024:
/*0x7024*/      nop 
/*0x7026*/      str r3, [r2, #0x28]
/*0x7028*/      lsls r6, r0, #0x10
/*0x702a*/      bpl jump_7030
/*0x702c*/      str r4, [r2, #0x24]
/*0x702e*/      b jump_7032
            jump_7030:
/*0x7030*/      str r4, [r2, #0x28]
            jump_7032:
/*0x7032*/      str r3, [r2, #0x24]
/*0x7034*/      and.w r0, r5, r0, lsl #1
            jump_7038:
/*0x7038*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x703a*/      uxtb r1, r1
/*0x703c*/      bhs jump_7024
/*0x703e*/      pop {r4, r5, r6, pc}

            data_7040:
/*0x7040*/  .word 0x400b0000


            .thumb_func
            call_7044:
/*0x7044*/      push {r4, r5, r6, lr}
/*0x7046*/      ldr r5, [pc, #0x3c] /* data_7084 */
/*0x7048*/      ldrb.w r0, [r5, #0x2f8]
/*0x704c*/      add.w r0, r0, r0, lsl #1
/*0x7050*/      lsls r0, r0, #0x1b
/*0x7052*/      lsrs r4, r0, #0x18
/*0x7054*/      ldr r0, [pc, #0x30] /* data_7088 */
/*0x7056*/      ldr r0, [r0]
/*0x7058*/      bl call_49e2
/*0x705c*/      mov r2, r0
/*0x705e*/      movs r0, #0x18
/*0x7060*/      b jump_7078
            jump_7062:
/*0x7062*/      add.w r1, r5, r4, lsl #1
/*0x7066*/      ldrh r1, [r1, #0x28]
/*0x7068*/      ubfx r1, r1, #0, #0xa
/*0x706c*/      cmp r1, r2
/*0x706e*/      bne jump_7074
/*0x7070*/      mov r0, r4
/*0x7072*/      pop {r4, r5, r6, pc}
            jump_7074:
/*0x7074*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x7076*/      uxtb r4, r4
            jump_7078:
/*0x7078*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x707a*/      uxtb r0, r0
/*0x707c*/      bhs jump_7062
/*0x707e*/      movs r0, #0x60
/*0x7080*/      pop {r4, r5, r6, pc}

/*0x7082*/  .byte 0x00
/*0x7083*/  .byte 0x00

            data_7084:
/*0x7084*/  .word 0x200008a0
            data_7088:
/*0x7088*/  .word 0x200007c0


            .thumb_func
            call_708c:
/*0x708c*/      ldr r0, [pc, #0xc] /* data_709c */
/*0x708e*/      movs r1, #0
/*0x7090*/      str r1, [r0, #0xb]!
/*0x7094*/      str r1, [r0, #4]
/*0x7096*/      strh r1, [r0, #8]
/*0x7098*/      strb r1, [r0, #0xa]
/*0x709a*/      bx lr

            data_709c:
/*0x709c*/  .word 0x200001b8

            jump_70a0:
/*0x70a0*/      push {r4, r5, r6, lr}
/*0x70a2*/      ldr r5, [pc, #0x64] /* data_7108 */
/*0x70a4*/      ldrh r0, [r5]
/*0x70a6*/      cmp r0, #0xff
/*0x70a8*/      bls jump_70b4
/*0x70aa*/      add.w r1, r5, #8
/*0x70ae*/      movs r0, #1
/*0x70b0*/      strb r0, [r1, #6]
/*0x70b2*/      b jump_70c2
            jump_70b4:
/*0x70b4*/      ldr r6, [pc, #0x54] /* data_710c */
/*0x70b6*/      ldrb r1, [r6, #1]
/*0x70b8*/      lsls r1, r1, #0x1f
/*0x70ba*/      beq jump_70c6
/*0x70bc*/      ldrb r1, [r6]
/*0x70be*/      cmp r1, #0xc0
/*0x70c0*/      bhs jump_70c6
            jump_70c2:
/*0x70c2*/      movs r0, #1
/*0x70c4*/      pop {r4, r5, r6, pc}
            jump_70c6:
/*0x70c6*/      ldr r1, [pc, #0x48] /* data_7110 */
/*0x70c8*/      ldr r1, [r1]
/*0x70ca*/      add.w r4, r1, r0, lsl #2
/*0x70ce*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x70d0*/      strh r0, [r5]
/*0x70d2*/      ldr r0, [r6]
/*0x70d4*/      bl call_49e2
/*0x70d8*/      strh r0, [r4]
/*0x70da*/      ldrb r1, [r6, #3]
/*0x70dc*/      lsls r1, r1, #0x1e
/*0x70de*/      bpl jump_70e6
/*0x70e0*/      add.w r0, r0, #0x3c00
/*0x70e4*/      b jump_70ea
            jump_70e6:
/*0x70e6*/      add.w r0, r0, #0x5c00
            jump_70ea:
/*0x70ea*/      strh r0, [r4]
/*0x70ec*/      ldrh r0, [r5]
/*0x70ee*/      cmp r0, #1
/*0x70f0*/      bls jump_70fa
/*0x70f2*/      bl call_6fb8
/*0x70f6*/      strh r0, [r4, #-0x2]
            jump_70fa:
/*0x70fa*/      ldr r1, [pc, #0xc] /* data_7108 */
/*0x70fc*/      mov.w r0, #-1
/*0x7100*/      str r0, [r1, #4]
/*0x7102*/      movs r0, #0
/*0x7104*/      pop {r4, r5, r6, pc}

/*0x7106*/  .byte 0x00
/*0x7107*/  .byte 0x00

            data_7108:
/*0x7108*/  .word 0x20001b9c
            data_710c:
/*0x710c*/  .word 0x200007c0
            data_7110:
/*0x7110*/  .word 0x20000008


            .thumb_func
            call_7114:
/*0x7114*/      push {r4, r5, r6, lr}
/*0x7116*/      ldr r4, [pc, #0x64] /* data_717c */
/*0x7118*/      ldr r1, [pc, #0x64] /* data_7180 */
/*0x711a*/      movs r0, #0x60
/*0x711c*/      strb r0, [r4, #7]
/*0x711e*/      ldrb r0, [r1, #1]
/*0x7120*/      lsls r0, r0, #0x1f
/*0x7122*/      beq jump_7132
/*0x7124*/      ldrb r0, [r1, #2]
/*0x7126*/      movs r1, #0
/*0x7128*/      bl call_4704
/*0x712c*/      cmp r0, #0
/*0x712e*/      beq jump_717a
/*0x7130*/      b jump_7146
            jump_7132:
/*0x7132*/      movs r0, #2
/*0x7134*/      ldr r2, [pc, #0x4c] /* data_7184 */
/*0x7136*/      ldrb r1, [r1]
/*0x7138*/      b jump_7140
            jump_713a:
/*0x713a*/      ldrb r3, [r2, r0]
/*0x713c*/      cmp r1, r3
/*0x713e*/      beq jump_717a
            jump_7140:
/*0x7140*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7142*/      uxtb r0, r0
/*0x7144*/      bhs jump_713a
            jump_7146:
/*0x7146*/      bl call_5e28
/*0x714a*/      cmp r0, #0
/*0x714c*/      bne jump_717a
/*0x714e*/      ldr r2, [pc, #0x38] /* data_7188 */
/*0x7150*/      ldr r3, [pc, #0x38] /* data_718c */
/*0x7152*/      ldrb.w r0, [r2, #0x2f8]
/*0x7156*/      add.w r0, r0, r0, lsl #1
/*0x715a*/      lsls r0, r0, #3
/*0x715c*/      strb r0, [r4, #7]
/*0x715e*/      movs r0, #0x18
/*0x7160*/      b jump_7174
            jump_7162:
/*0x7162*/      ldrb r1, [r4, #7]
/*0x7164*/      add.w r5, r2, r1, lsl #1
/*0x7168*/      ldrh r5, [r5, #0x28]
/*0x716a*/      cmp.w r3, r5, lsl #22
/*0x716e*/      beq jump_717a
/*0x7170*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x7172*/      strb r1, [r4, #7]
            jump_7174:
/*0x7174*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7176*/      uxtb r0, r0
/*0x7178*/      bhs jump_7162
            jump_717a:
/*0x717a*/      pop {r4, r5, r6, pc}

            data_717c:
/*0x717c*/  .word 0x20001ba4
            data_7180:
/*0x7180*/  .word 0x200007c0
            data_7184:
/*0x7184*/  .word 0x00007b52 /* possible pointer */
            data_7188:
/*0x7188*/  .word 0x200008a0
            data_718c:
/*0x718c*/  .word 0xffc00000

            jump_7190:
/*0x7190*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x7194*/      ldr.w r8, [pc, #0xe0] /* data_7278 */
/*0x7198*/      ldr r6, [pc, #0xe0] /* data_727c */
/*0x719a*/      movs r7, #0
/*0x719c*/      mov r5, r8
/*0x719e*/      b jump_726e
            jump_71a0:
/*0x71a0*/      ldrh.w r0, [r8]
/*0x71a4*/      mov r1, r8
/*0x71a6*/      cmp r0, #0xff
/*0x71a8*/      bhi jump_71ba
/*0x71aa*/      ldr r2, [r6]
/*0x71ac*/      add.w r0, r2, r0, lsl #2
/*0x71b0*/      movs r2, #7
/*0x71b2*/      ldrb r0, [r0, #1]
/*0x71b4*/      cmp.w r2, r0, lsr #5
/*0x71b8*/      bne jump_71c6
            jump_71ba:
/*0x71ba*/      ldr r0, [pc, #0xbc] /* data_7278 */
/*0x71bc*/      adds r0, #8
/*0x71be*/      ldrb r0, [r0, #9]
/*0x71c0*/      cmp r0, #1
/*0x71c2*/      beq jump_71f6
/*0x71c4*/      strh r7, [r1]
            jump_71c6:
/*0x71c6*/      ldrh r0, [r1]
/*0x71c8*/      ldr r2, [r6]
/*0x71ca*/      movs r1, #4
/*0x71cc*/      add.w r4, r2, r0, lsl #2
/*0x71d0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x71d2*/      strh.w r0, [r8]
/*0x71d6*/      ldrb r0, [r4, #1]
/*0x71d8*/      cmp.w r1, r0, lsr #5
/*0x71dc*/      beq jump_7262
/*0x71de*/      str r7, [sp]
/*0x71e0*/      ldrh r0, [r4]
/*0x71e2*/      mov r1, sp
/*0x71e4*/      bl call_49d8
/*0x71e8*/      ldrb r0, [r4, #1]
/*0x71ea*/      lsrs r0, r0, #5
/*0x71ec*/      cmp r0, #1
/*0x71ee*/      beq jump_71fe
/*0x71f0*/      cmp r0, #2
/*0x71f2*/      bne jump_7214
/*0x71f4*/      b jump_7208
            jump_71f6:
/*0x71f6*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x71fa*/      b.w call_5d9c
            jump_71fe:
/*0x71fe*/      ldrb.w r0, [sp, #3]
/*0x7202*/      orr r0, r0, #2
/*0x7206*/      b jump_7210
            jump_7208:
/*0x7208*/      ldrb.w r0, [sp, #3]
/*0x720c*/      bic r0, r0, #2
            jump_7210:
/*0x7210*/      strb.w r0, [sp, #3]
            jump_7214:
/*0x7214*/      ldrb.w r0, [sp, #1]
/*0x7218*/      lsls r0, r0, #0x1f
/*0x721a*/      ldrb.w r0, [sp]
/*0x721e*/      beq jump_7226
/*0x7220*/      bl call_46e4
/*0x7224*/      b jump_722a
            jump_7226:
/*0x7226*/      ldr r1, [pc, #0x58] /* data_7280 */
/*0x7228*/      ldrb r0, [r1, r0]
            jump_722a:
/*0x722a*/      strb.w r0, [sp, #2]
/*0x722e*/      ldrb.w r0, [sp, #3]
/*0x7232*/      orr r2, r0, #5
/*0x7236*/      strb.w r2, [sp, #3]
/*0x723a*/      ldrb.w r0, [sp, #1]
/*0x723e*/      ldrb.w r1, [sp, #2]
/*0x7242*/      and r0, r0, #1
/*0x7246*/      add.w r3, r0, r0, lsl #1
/*0x724a*/      add.w r0, r3, r0, lsl #3
/*0x724e*/      add r0, r1
/*0x7250*/      uxtb r1, r0
/*0x7252*/      ubfx r2, r2, #1, #1
/*0x7256*/      ldr r0, [pc, #0x2c] /* data_7284 */
/*0x7258*/      bl call_440c
/*0x725c*/      ldr r0, [sp]
/*0x725e*/      bl call_4790
            jump_7262:
/*0x7262*/      ldrh r0, [r4, #2]
/*0x7264*/      lsls r1, r0, #0x10
/*0x7266*/      bpl jump_726c
/*0x7268*/      lsls r0, r0, #0x11
/*0x726a*/      lsrs r0, r0, #7
            jump_726c:
/*0x726c*/      str r0, [r5, #4]
            jump_726e:
/*0x726e*/      ldr r0, [r5, #4]
/*0x7270*/      cmp r0, #0
/*0x7272*/      beq jump_71a0
/*0x7274*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

            data_7278:
/*0x7278*/  .word 0x20001b9c
            data_727c:
/*0x727c*/  .word 0x20000008
            data_7280:
/*0x7280*/  .word 0x20000226
            data_7284:
/*0x7284*/  .word 0x200001c3


            .thumb_func
            call_7288:
/*0x7288*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x728c*/      ldr r4, [pc, #0xa0] /* data_7330 */
/*0x728e*/      ldr r5, [pc, #0xa4] /* data_7334 */
/*0x7290*/      ldr.w r8, [pc, #0xa4] /* data_7338 */
/*0x7294*/      ldr r7, [pc, #0xa4] /* data_733c */
/*0x7296*/      movs r6, #0xb
            jump_7298:
/*0x7298*/      ldrd r0, r1, [r5]
/*0x729c*/      str r1, [r0, #4]
/*0x729e*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x72a0*/      uxtb r6, r6
/*0x72a2*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x72a4*/      nop 
/*0x72a6*/      nop 
/*0x72a8*/      movs r0, #0xff
/*0x72aa*/      ldr r1, [r7, #0x1c]
/*0x72ac*/      lsls r1, r1, #0x16
/*0x72ae*/      bmi jump_72b2
/*0x72b0*/      movs r0, #0xfe
            jump_72b2:
/*0x72b2*/      ldr.w r2, [r8, #0x1c]
/*0x72b6*/      mov r1, r8
/*0x72b8*/      lsls r2, r2, #0x1a
/*0x72ba*/      bmi jump_72c0
/*0x72bc*/      bic r0, r0, #2
            jump_72c0:
/*0x72c0*/      ldr r2, [r1, #0x1c]
/*0x72c2*/      lsls r2, r2, #0x19
/*0x72c4*/      bmi jump_72ca
/*0x72c6*/      bic r0, r0, #4
            jump_72ca:
/*0x72ca*/      ldr r1, [r1, #0x1c]
/*0x72cc*/      lsls r1, r1, #0x18
/*0x72ce*/      bmi jump_72d4
/*0x72d0*/      bic r0, r0, #8
            jump_72d4:
/*0x72d4*/      ldr r1, [r7, #0x1c]
/*0x72d6*/      lsls r1, r1, #0x14
/*0x72d8*/      bmi jump_72de
/*0x72da*/      bic r0, r0, #0x10
            jump_72de:
/*0x72de*/      ldr r1, [r7, #0x1c]
/*0x72e0*/      lsls r1, r1, #0x12
/*0x72e2*/      bmi jump_72e8
/*0x72e4*/      bic r0, r0, #0x20
            jump_72e8:
/*0x72e8*/      ldr r1, [r7, #0x1c]
/*0x72ea*/      lsls r1, r1, #0x11
/*0x72ec*/      bmi jump_72f2
/*0x72ee*/      bic r0, r0, #0x40
            jump_72f2:
/*0x72f2*/      ldr r1, [r7, #0x1c]
/*0x72f4*/      lsls r1, r1, #0x10
/*0x72f6*/      bmi jump_72fc
/*0x72f8*/      bic r0, r0, #0x80
            jump_72fc:
/*0x72fc*/      ldrd r1, r2, [r5]
/*0x7300*/      str r2, [r1]
/*0x7302*/      ldrb r1, [r4, #1]
/*0x7304*/      cmp r1, r0
/*0x7306*/      beq jump_730e
/*0x7308*/      strb r0, [r4, #1]
/*0x730a*/      movs r0, #3
/*0x730c*/      b jump_731a
            jump_730e:
/*0x730e*/      ldrb r0, [r4]
/*0x7310*/      cbz r0, jump_731c
/*0x7312*/      cmp r0, #1
/*0x7314*/      bne jump_7318
/*0x7316*/      strb r1, [r4, #2]
            jump_7318:
/*0x7318*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_731a:
/*0x731a*/      strb r0, [r4]
            jump_731c:
/*0x731c*/      cmp r6, #0
/*0x731e*/      beq jump_732a
/*0x7320*/      movs r0, #5
/*0x7322*/      bl call_37b8
/*0x7326*/      subs r5, #8
/*0x7328*/      b jump_7298
            jump_732a:
/*0x732a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x732e*/  .byte 0x00
/*0x732f*/  .byte 0x00

            data_7330:
/*0x7330*/  .word 0x20000347
            data_7334:
/*0x7334*/  .word 0x00007d3c /* possible pointer */
            data_7338:
/*0x7338*/  .word 0x400b0000
            data_733c:
/*0x733c*/  .word 0x400b4000


            .thumb_func
            call_7340:
/*0x7340*/      push {r4, r5, r6, r7, lr}
/*0x7342*/      ldr r5, [pc, #0x7c] /* data_73c0 */
/*0x7344*/      sub sp, #0x44
/*0x7346*/      ubfx r2, r0, #0xc, #8
/*0x734a*/      ubfx r3, r0, #0, #0xc
/*0x734e*/      movs r4, #4
/*0x7350*/      cbz r2, jump_7364
/*0x7352*/      cmp r2, #1
/*0x7354*/      beq jump_7362
/*0x7356*/      cmp r2, #2
/*0x7358*/      beq jump_7360
/*0x735a*/      cmp r2, #3
/*0x735c*/      bne jump_7378
/*0x735e*/      adds r3, #0x20
            jump_7360:
/*0x7360*/      adds r3, #0x19
            jump_7362:
/*0x7362*/      adds r3, #0x12
            jump_7364:
/*0x7364*/      ldr r6, [pc, #0x5c] /* data_73c4 */
/*0x7366*/      movs r0, #0
            jump_7368:
/*0x7368*/      ldrb r2, [r6, r0]
/*0x736a*/      cmp r2, r3
/*0x736c*/      bhi jump_737e
/*0x736e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7370*/      subs r3, r3, r2
/*0x7372*/      uxtb r0, r0
/*0x7374*/      cmp r0, #4
/*0x7376*/      bne jump_7368
            jump_7378:
/*0x7378*/      str r4, [r5, #0x14]
            jump_737a:
/*0x737a*/      add sp, #0x44
/*0x737c*/      pop {r4, r5, r6, r7, pc}
            jump_737e:
/*0x737e*/      ldr r2, [pc, #0x48] /* data_73c8 */
/*0x7380*/      mov r4, sp
/*0x7382*/      mov r5, r1
/*0x7384*/      ldr.w r7, [r2, r0, lsl #2]
/*0x7388*/      add r3, r7
/*0x738a*/      b jump_73b0
            jump_738c:
/*0x738c*/      ldr.w r7, [r2, r0, lsl #2]
/*0x7390*/      ldrb.w ip, [r6, r0]
/*0x7394*/      add r7, ip
/*0x7396*/      b jump_73a4
            jump_7398:
/*0x7398*/      ldrb ip, [r3], #1
/*0x739c*/      strb ip, [r4], #1
/*0x73a0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x73a2*/      beq jump_73a8
            jump_73a4:
/*0x73a4*/      cmp r3, r7
/*0x73a6*/      blo jump_7398
            jump_73a8:
/*0x73a8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x73aa*/      uxtb r0, r0
/*0x73ac*/      ldr.w r3, [r2, r0, lsl #2]
            jump_73b0:
/*0x73b0*/      cmp r5, #0
/*0x73b2*/      bne jump_738c
/*0x73b4*/      mov r2, r1
/*0x73b6*/      mov r1, sp
/*0x73b8*/      movs r0, #0
/*0x73ba*/      bl call_3a70
/*0x73be*/      b jump_737a

            data_73c0:
/*0x73c0*/  .word 0x400a8000
            data_73c4:
/*0x73c4*/  .word 0x00008074 /* possible pointer */
            data_73c8:
/*0x73c8*/  .word 0x000081c4 /* possible pointer */


            .thumb_func
            call_73cc:
/*0x73cc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x73d0*/      ldrh r1, [r0]
/*0x73d2*/      movw lr, #0x921
/*0x73d6*/      movs r4, #0
/*0x73d8*/      movs r3, #1
/*0x73da*/      ldr r6, [pc, #0xd0] /* data_74ac */
/*0x73dc*/      ldr r5, [pc, #0xd0] /* data_74b0 */
/*0x73de*/      subw r2, r1, #0x921
/*0x73e2*/      mov.w r7, #0x100
/*0x73e6*/      mov.w ip, #0x200
/*0x73ea*/      cmp r1, lr
/*0x73ec*/      beq jump_7468
/*0x73ee*/      bgt jump_7410
/*0x73f0*/      adds.w r1, r2, #0x780
/*0x73f4*/      beq jump_7420
/*0x73f6*/      cmp r1, r7
/*0x73f8*/      beq jump_745c
/*0x73fa*/      cmp r1, ip
/*0x73fc*/      bne jump_7484
/*0x73fe*/      ldrh r1, [r0, #4]
/*0x7400*/      cmp r1, #0
/*0x7402*/      bne jump_7484
/*0x7404*/      ldrb r1, [r5]
/*0x7406*/      movs r2, #1
            jump_7408:
/*0x7408*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x740c*/      b.w jump_751a
            jump_7410:
/*0x7410*/      cmp r2, r7
/*0x7412*/      beq jump_748a
/*0x7414*/      cmp r2, ip
/*0x7416*/      bne jump_7484
/*0x7418*/      ldrh r2, [r0, #4]
/*0x741a*/      ldrb r1, [r0, #2]
/*0x741c*/      cbz r2, jump_7488
/*0x741e*/      b jump_74a6
            jump_7420:
/*0x7420*/      ldrb r5, [r0, #3]
/*0x7422*/      ldrb r1, [r0, #2]
/*0x7424*/      ldrh r4, [r0, #6]
/*0x7426*/      ldrh r2, [r0, #4]
/*0x7428*/      cmp r5, #1
/*0x742a*/      bne jump_7484
/*0x742c*/      cbz r2, jump_7448
/*0x742e*/      cmp r2, #1
/*0x7430*/      beq jump_7484
/*0x7432*/      cmp r2, #2
/*0x7434*/      bne jump_7484
/*0x7436*/      cmp r1, #1
/*0x7438*/      beq jump_744e
/*0x743a*/      cmp r1, #2
/*0x743c*/      beq jump_7456
/*0x743e*/      cmp r1, #4
/*0x7440*/      bne jump_7484
/*0x7442*/      ldr r1, [pc, #0x68] /* data_74ac */
/*0x7444*/      adds r1, #0x1b
/*0x7446*/      b jump_7452
            jump_7448:
/*0x7448*/      ldr r1, [pc, #0x60] /* data_74ac */
/*0x744a*/      adds r1, #0x13
/*0x744c*/      b jump_7452
            jump_744e:
/*0x744e*/      ldr r1, [pc, #0x5c] /* data_74ac */
/*0x7450*/      .short 0x1dc9 /* adds r1, r1, #7 */ 
            jump_7452:
/*0x7452*/      str r1, [r0, #8]
/*0x7454*/      b jump_74a6
            jump_7456:
/*0x7456*/      ldr r1, [pc, #0x54] /* data_74ac */
/*0x7458*/      adds r1, #0xb
/*0x745a*/      b jump_7452
            jump_745c:
/*0x745c*/      ldrh r1, [r0, #4]
/*0x745e*/      cmp r1, #0
/*0x7460*/      bne jump_7484
/*0x7462*/      ldrb r1, [r6]
/*0x7464*/      movs r2, #1
/*0x7466*/      b jump_7408
            jump_7468:
/*0x7468*/      ldrb r3, [r0, #3]
/*0x746a*/      ldrh r1, [r0, #6]
/*0x746c*/      ldrh r2, [r0, #4]
/*0x746e*/      strh r1, [r0, #0x10]
/*0x7470*/      cmp r3, #2
/*0x7472*/      bne jump_7484
/*0x7474*/      cmp r2, #0
/*0x7476*/      bne jump_7484
/*0x7478*/      add.w r1, r0, #0xc
/*0x747c*/      str r1, [r0, #8]
/*0x747e*/      strb r4, [r0, #0x13]
/*0x7480*/      movs r1, #2
/*0x7482*/      strb r1, [r0, #0x12]
            jump_7484:
/*0x7484*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_7488:
/*0x7488*/      b jump_74a4
            jump_748a:
/*0x748a*/      ldrh r2, [r0, #4]
/*0x748c*/      ldrb r1, [r0, #3]
/*0x748e*/      cmp r2, #0
/*0x7490*/      bne jump_7484
/*0x7492*/      strb r1, [r6]
/*0x7494*/      movw r2, #0xffff
/*0x7498*/      and.w r1, r2, r1, lsl #3
/*0x749c*/      ldr r2, [pc, #0xc] /* data_74ac */
/*0x749e*/      .short 0x1f52 /* subs r2, r2, #5 */ 
/*0x74a0*/      strh r1, [r2, #0xa]
/*0x74a2*/      b jump_74a6
            jump_74a4:
/*0x74a4*/      strb r1, [r5]
            jump_74a6:
/*0x74a6*/      strh r4, [r0, #0x10]
/*0x74a8*/      strb r3, [r0, #0x12]
/*0x74aa*/      b jump_7484

            data_74ac:
/*0x74ac*/  .word 0x20000839
            data_74b0:
/*0x74b0*/  .word 0x20000007


            .thumb_func
            call_74b4:
/*0x74b4*/      push {r4, lr}
/*0x74b6*/      ldr r1, [pc, #0x1c] /* data_74d4 */
/*0x74b8*/      movs r0, #1
/*0x74ba*/      movs r4, #2
/*0x74bc*/      strb r0, [r1]
/*0x74be*/      adds r0, r1, #4
/*0x74c0*/      adds r1, #0x14
/*0x74c2*/      strb r4, [r0]
/*0x74c4*/      movs r0, #4
/*0x74c6*/      strb r0, [r1]
/*0x74c8*/      bl call_6784
/*0x74cc*/      ldr r0, [pc, #4] /* data_74d4 */
/*0x74ce*/      subs r0, #0xc
/*0x74d0*/      strb r4, [r0, #6]
/*0x74d2*/      pop {r4, pc}

            data_74d4:
/*0x74d4*/  .word 0x20000840


            .thumb_func
            call_74d8:
/*0x74d8*/      push {r4, r5, r6, lr}
/*0x74da*/      mov r4, r0
/*0x74dc*/      ldrh r0, [r0, #0x10]
/*0x74de*/      ldr r3, [r4, #8]
/*0x74e0*/      cmp r0, #0x40
/*0x74e2*/      blo jump_74ec
/*0x74e4*/      movs r5, #0x40
/*0x74e6*/      subs r0, #0x40
/*0x74e8*/      strh r0, [r4, #0x10]
/*0x74ea*/      b jump_74f6
            jump_74ec:
/*0x74ec*/      movs r5, r0
/*0x74ee*/      mov.w r0, #0
/*0x74f2*/      strb r0, [r4, #0x12]
/*0x74f4*/      beq jump_7508
            jump_74f6:
/*0x74f6*/      movs r0, #9
/*0x74f8*/      cmp.w r0, r3, lsr #28
/*0x74fc*/      bne jump_7508
/*0x74fe*/      mov r1, r5
/*0x7500*/      mov r0, r3
/*0x7502*/      bl call_7340
/*0x7506*/      b jump_7512
            jump_7508:
/*0x7508*/      mov r2, r5
/*0x750a*/      mov r1, r3
/*0x750c*/      movs r0, #0
/*0x750e*/      bl call_3a70
            jump_7512:
/*0x7512*/      ldr r0, [r4, #8]
/*0x7514*/      add r0, r5
/*0x7516*/      str r0, [r4, #8]
/*0x7518*/      pop {r4, r5, r6, pc}
            jump_751a:
/*0x751a*/      str r1, [r0, #0xc]
/*0x751c*/      add.w r1, r0, #0xc
/*0x7520*/      str r1, [r0, #8]
/*0x7522*/      strh r2, [r0, #0x10]
/*0x7524*/      movs r1, #1
/*0x7526*/      strb r1, [r0, #0x12]
/*0x7528*/      bx lr

/*0x752a*/  .byte 0x00
/*0x752b*/  .byte 0x00


            .thumb_func
            call_752c:
/*0x752c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7530*/      ldr r0, [pc, #0xcc] /* data_7600 */
/*0x7532*/      ldrb r1, [r0]
/*0x7534*/      movs r4, #0
/*0x7536*/      subs r5, r0, #4
/*0x7538*/      cmp r1, #1
/*0x753a*/      bne jump_7548
/*0x753c*/      strb r4, [r0]
/*0x753e*/      ldrb r0, [r5, #8]
/*0x7540*/      and r0, r0, #7
/*0x7544*/      bl call_5ee8
            jump_7548:
/*0x7548*/      ldr r6, [pc, #0xb8] /* data_7604 */
/*0x754a*/      ldr r7, [pc, #0xbc] /* data_7608 */
/*0x754c*/      ldrb r0, [r6]
/*0x754e*/      cbz r0, jump_755c
/*0x7550*/      cmp r0, #2
/*0x7552*/      beq jump_7586
/*0x7554*/      cmp r0, #4
/*0x7556*/      beq jump_755c
/*0x7558*/      cmp r0, #5
/*0x755a*/      bne jump_7598
            jump_755c:
/*0x755c*/      ldrb r0, [r5, #7]
/*0x755e*/      lsls r0, r0, #0x1b
/*0x7560*/      bpl jump_7598
/*0x7562*/      movs r0, #1
/*0x7564*/      strb r0, [r6]
/*0x7566*/      movs r2, #0x40
/*0x7568*/      ldr r1, [pc, #0xa0] /* data_760c */
/*0x756a*/      movs r0, #4
/*0x756c*/      bl call_3a10
/*0x7570*/      ldr r2, [pc, #0x98] /* data_760c */
/*0x7572*/      rsb.w r1, r0, #0x40
/*0x7576*/      add r0, r2
/*0x7578*/      bl call_35e2
/*0x757c*/      ldrb r0, [r5, #7]
/*0x757e*/      bic r0, r0, #0x10
/*0x7582*/      strb r0, [r5, #7]
/*0x7584*/      b jump_7598
            jump_7586:
/*0x7586*/      ldr r0, [r7, #0x50]
/*0x7588*/      lsls r0, r0, #0x1e
/*0x758a*/      bpl jump_7598
/*0x758c*/      movs r2, #0x40
/*0x758e*/      ldr r1, [pc, #0x7c] /* data_760c */
/*0x7590*/      movs r0, #3
/*0x7592*/      bl call_3a70
/*0x7596*/      strb r4, [r6]
            jump_7598:
/*0x7598*/      ldr r0, [r7, #0x28]
/*0x759a*/      lsls r0, r0, #0x1e
/*0x759c*/      bpl jump_75c2
/*0x759e*/      ldrb r0, [r5]
/*0x75a0*/      cbz r0, jump_75a6
/*0x75a2*/      strb r4, [r5]
/*0x75a4*/      b jump_75b6
            jump_75a6:
/*0x75a6*/      ldrh r0, [r5, #0xa]
/*0x75a8*/      cbnz r0, jump_75c2
/*0x75aa*/      ldr r0, [pc, #0x54] /* data_7600 */
/*0x75ac*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x75ae*/      ldrb r0, [r0]
/*0x75b0*/      cbz r0, jump_75c2
/*0x75b2*/      lsls r0, r0, #3
/*0x75b4*/      strh r0, [r5, #0xa]
            jump_75b6:
/*0x75b6*/      ldr r1, [pc, #0x48] /* data_7600 */
/*0x75b8*/      movs r2, #8
/*0x75ba*/      adds r1, #0x14
/*0x75bc*/      movs r0, #1
/*0x75be*/      bl call_3a70
            jump_75c2:
/*0x75c2*/      ldr r0, [r7, #0x3c]
/*0x75c4*/      lsls r0, r0, #0x1e
/*0x75c6*/      bpl jump_75fc
/*0x75c8*/      ldrb r0, [r5, #2]
/*0x75ca*/      cbz r0, jump_75d6
/*0x75cc*/      ldr r1, [pc, #0x30] /* data_7600 */
/*0x75ce*/      movs r2, #5
/*0x75d0*/      strb r4, [r5, #2]
/*0x75d2*/      adds r1, #0xc
/*0x75d4*/      b jump_75f2
            jump_75d6:
/*0x75d6*/      ldrb r0, [r5, #1]
/*0x75d8*/      cbz r0, jump_75e4
/*0x75da*/      ldr r1, [pc, #0x24] /* data_7600 */
/*0x75dc*/      movs r2, #2
/*0x75de*/      strb r4, [r5, #1]
/*0x75e0*/      adds r1, #8
/*0x75e2*/      b jump_75f2
            jump_75e4:
/*0x75e4*/      ldrb r0, [r5, #3]
/*0x75e6*/      cmp r0, #0
/*0x75e8*/      beq jump_75fc
/*0x75ea*/      ldr r1, [pc, #0x14] /* data_7600 */
/*0x75ec*/      movs r2, #0x1f
/*0x75ee*/      strb r4, [r5, #3]
/*0x75f0*/      adds r1, #0x1c
            jump_75f2:
/*0x75f2*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x75f6*/      movs r0, #2
/*0x75f8*/      b.w call_3a70
            jump_75fc:
/*0x75fc*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_7600:
/*0x7600*/  .word 0x20000838
            data_7604:
/*0x7604*/  .word 0x2000076c
            data_7608:
/*0x7608*/  .word 0x400a8000
            data_760c:
/*0x760c*/  .word 0x20000774


            .thumb_func
            call_7610:
/*0x7610*/      push {r4, r5, r6, lr}
/*0x7612*/      mov r4, r0
/*0x7614*/      ldrh r0, [r0]
/*0x7616*/      movs r1, #1
/*0x7618*/      cmp.w r0, #0x500
/*0x761c*/      beq jump_76a4
/*0x761e*/      bgt jump_7662
/*0x7620*/      cmp.w r0, #0x100
/*0x7624*/      beq jump_7696
/*0x7626*/      bgt jump_7640
/*0x7628*/      cmp r0, #0x80
/*0x762a*/      beq jump_768e
/*0x762c*/      cmp r0, #0x81
/*0x762e*/      beq jump_7692
/*0x7630*/      cmp r0, #0x82
/*0x7632*/      bne jump_7706
/*0x7634*/      movs r1, #2
            jump_7636:
/*0x7636*/      mov r0, r4
/*0x7638*/      pop.w {r4, r5, r6, lr}
/*0x763c*/      b.w jump_7758
            jump_7640:
/*0x7640*/      cmp.w r0, #0x102
/*0x7644*/      beq jump_769a
/*0x7646*/      cmp.w r0, #0x300
/*0x764a*/      beq jump_769e
/*0x764c*/      sub.w r0, r0, #0x300
/*0x7650*/      subs r0, #2
/*0x7652*/      bne jump_7706
/*0x7654*/      movs r2, #1
            jump_7656:
/*0x7656*/      movs r1, #2
            jump_7658:
/*0x7658*/      mov r0, r4
/*0x765a*/      pop.w {r4, r5, r6, lr}
/*0x765e*/      b.w jump_77a0
            jump_7662:
/*0x7662*/      cmp.w r0, #0x900
/*0x7666*/      beq jump_7732
/*0x7668*/      bgt jump_7706
/*0x766a*/      cmp.w r0, #0x680
/*0x766e*/      beq jump_76b8
/*0x7670*/      sub.w r0, r0, #0x600
/*0x7674*/      subs r0, #0x81
/*0x7676*/      beq jump_76ee
/*0x7678*/      sub.w r0, r0, #0x100
/*0x767c*/      subs r0, #0xff
/*0x767e*/      bne jump_7706
/*0x7680*/      mov r0, r4
/*0x7682*/      ldrb r1, [r4, #0x14]
/*0x7684*/      pop.w {r4, r5, r6, lr}
/*0x7688*/      movs r2, #1
/*0x768a*/      b.w jump_751a
            jump_768e:
/*0x768e*/      movs r1, #0
/*0x7690*/      b jump_7636
            jump_7692:
/*0x7692*/      movs r1, #1
/*0x7694*/      b jump_7636
            jump_7696:
/*0x7696*/      movs r2, #0
/*0x7698*/      b jump_76a0
            jump_769a:
/*0x769a*/      movs r2, #0
/*0x769c*/      b jump_7656
            jump_769e:
/*0x769e*/      movs r2, #1
            jump_76a0:
/*0x76a0*/      movs r1, #0
/*0x76a2*/      b jump_7658
            jump_76a4:
/*0x76a4*/      ldr r0, [pc, #0xa4] /* data_774c */
/*0x76a6*/      ldr r2, [r0]
/*0x76a8*/      orr r2, r2, #0x100
/*0x76ac*/      str r2, [r0]
/*0x76ae*/      ldrb r2, [r4, #2]
/*0x76b0*/      str r2, [r0, #0x10]
/*0x76b2*/      strb r1, [r4, #0x12]
/*0x76b4*/      movs r0, #5
/*0x76b6*/      b jump_7748
            jump_76b8:
/*0x76b8*/      ldrb r0, [r4, #3]
/*0x76ba*/      cmp r0, #1
/*0x76bc*/      beq jump_76da
/*0x76be*/      cmp r0, #2
/*0x76c0*/      beq jump_76e4
/*0x76c2*/      cmp r0, #3
/*0x76c4*/      bne jump_7706
/*0x76c6*/      ldrb r0, [r4, #2]
/*0x76c8*/      cmp r0, #3
/*0x76ca*/      bhs jump_7706
/*0x76cc*/      ldr r2, [pc, #0x80] /* data_7750 */
/*0x76ce*/      ldr.w r0, [r2, r0, lsl #2]
/*0x76d2*/      str r0, [r4, #8]
/*0x76d4*/      ldrb r0, [r0]
            jump_76d6:
/*0x76d6*/      strh r0, [r4, #0x10]
/*0x76d8*/      b jump_7704
            jump_76da:
/*0x76da*/      ldr r0, [pc, #0x74] /* data_7750 */
/*0x76dc*/      adds r0, #0xc
/*0x76de*/      str r0, [r4, #8]
/*0x76e0*/      movs r0, #0x12
/*0x76e2*/      b jump_76d6
            jump_76e4:
/*0x76e4*/      mov.w r0, #-0x70000000
/*0x76e8*/      str r0, [r4, #8]
/*0x76ea*/      movs r0, #0x5b
/*0x76ec*/      b jump_76d6
            jump_76ee:
/*0x76ee*/      ldrb r2, [r4, #3]
/*0x76f0*/      ldrh r0, [r4, #4]
/*0x76f2*/      cmp r2, #0x21
/*0x76f4*/      beq jump_7708
/*0x76f6*/      cmp r2, #0x22
/*0x76f8*/      bne jump_7706
/*0x76fa*/      cbz r0, jump_7714
/*0x76fc*/      cmp r0, #1
/*0x76fe*/      beq jump_771e
/*0x7700*/      cmp r0, #2
/*0x7702*/      beq jump_7728
            jump_7704:
/*0x7704*/      strb r1, [r4, #0x12]
            jump_7706:
/*0x7706*/      pop {r4, r5, r6, pc}
            jump_7708:
/*0x7708*/      ldr r2, [pc, #0x48] /* data_7754 */
/*0x770a*/      add.w r0, r2, r0, lsl #12
/*0x770e*/      str r0, [r4, #8]
/*0x7710*/      movs r0, #9
/*0x7712*/      b jump_76d6
            jump_7714:
/*0x7714*/      ldr r0, [pc, #0x38] /* data_7750 */
/*0x7716*/      subs r0, #0xec
/*0x7718*/      str r0, [r4, #8]
/*0x771a*/      movs r0, #0x40
/*0x771c*/      b jump_76d6
            jump_771e:
/*0x771e*/      ldr r0, [pc, #0x30] /* data_7750 */
/*0x7720*/      subs r0, #0xac
/*0x7722*/      str r0, [r4, #8]
/*0x7724*/      movs r0, #0x22
/*0x7726*/      b jump_76d6
            jump_7728:
/*0x7728*/      ldr r0, [pc, #0x24] /* data_7750 */
/*0x772a*/      subs r0, #0x88
/*0x772c*/      str r0, [r4, #8]
/*0x772e*/      movs r0, #0x86
/*0x7730*/      b jump_76d6
            jump_7732:
/*0x7732*/      ldrb r0, [r4, #2]
/*0x7734*/      strb r0, [r4, #0x14]
/*0x7736*/      strb r1, [r4, #0x12]
/*0x7738*/      movs r5, #1
            jump_773a:
/*0x773a*/      uxtb r0, r5
/*0x773c*/      bl call_6d0c
/*0x7740*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x7742*/      cmp r5, #8
/*0x7744*/      blo jump_773a
/*0x7746*/      movs r0, #6
            jump_7748:
/*0x7748*/      strb r0, [r4, #0x15]
/*0x774a*/      pop {r4, r5, r6, pc}

            data_774c:
/*0x774c*/  .word 0x400a8000
            data_7750:
/*0x7750*/  .word 0x000081a4 /* possible pointer */
            data_7754:
/*0x7754*/  .word 0x90001000

            jump_7758:
/*0x7758*/      push {r4, lr}
/*0x775a*/      mov r4, r0
/*0x775c*/      cbz r1, jump_7782
/*0x775e*/      cmp r1, #1
/*0x7760*/      beq jump_7786
/*0x7762*/      cmp r1, #2
/*0x7764*/      bne jump_779a
/*0x7766*/      ldrb r0, [r4, #4]
/*0x7768*/      and r1, r0, #0xf
/*0x776c*/      ldr r0, [pc, #0x2c] /* data_779c */
/*0x776e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x7770*/      bl call_3abc
/*0x7774*/      ldr r1, [r0, #0x10]
/*0x7776*/      ldr r0, [r0]
/*0x7778*/      lsls r1, r1, #3
/*0x777a*/      bpl jump_778a
/*0x777c*/      ubfx r1, r0, #2, #1
/*0x7780*/      b jump_778e
            jump_7782:
/*0x7782*/      ldrb r1, [r4, #0x17]
/*0x7784*/      b jump_778e
            jump_7786:
/*0x7786*/      movs r1, #0
/*0x7788*/      b jump_778e
            jump_778a:
/*0x778a*/      ubfx r1, r0, #5, #1
            jump_778e:
/*0x778e*/      mov r0, r4
/*0x7790*/      pop.w {r4, lr}
/*0x7794*/      movs r2, #2
/*0x7796*/      b.w jump_751a
            jump_779a:
/*0x779a*/      pop {r4, pc}

            data_779c:
/*0x779c*/  .word 0x400a8000

            jump_77a0:
/*0x77a0*/      push {r4, r5, r6, lr}
/*0x77a2*/      mov r4, r0
/*0x77a4*/      movs r5, #1
/*0x77a6*/      cbz r1, jump_77ca
/*0x77a8*/      cmp r1, #2
/*0x77aa*/      bne jump_77ee
/*0x77ac*/      ldrb r0, [r4, #4]
/*0x77ae*/      ands r1, r0, #0xf
/*0x77b2*/      beq jump_77ec
/*0x77b4*/      ldr r0, [pc, #0x38] /* data_77f0 */
/*0x77b6*/      cbz r2, jump_77da
/*0x77b8*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x77ba*/      bl call_3abc
/*0x77be*/      movs r1, #0x40
/*0x77c0*/      str r1, [r0, #8]
/*0x77c2*/      ldr r2, [r0]
/*0x77c4*/      movs r1, #0x24
/*0x77c6*/      bics r1, r2
/*0x77c8*/      b jump_77ea
            jump_77ca:
/*0x77ca*/      ldrb r0, [r4, #2]
/*0x77cc*/      cmp r0, #1
/*0x77ce*/      bne jump_77ee
/*0x77d0*/      ldrb r0, [r4, #0x17]
/*0x77d2*/      bfi r0, r2, #1, #1
/*0x77d6*/      strb r0, [r4, #0x17]
/*0x77d8*/      b jump_77ec
            jump_77da:
/*0x77da*/      ldrb r2, [r4, #0x18]
/*0x77dc*/      cbnz r2, jump_77ec
/*0x77de*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x77e0*/      bl call_3abc
/*0x77e4*/      ldr r1, [r0]
/*0x77e6*/      and r1, r1, #0x2d
            jump_77ea:
/*0x77ea*/      str r1, [r0]
            jump_77ec:
/*0x77ec*/      strb r5, [r4, #0x12]
            jump_77ee:
/*0x77ee*/      pop {r4, r5, r6, pc}

            data_77f0:
/*0x77f0*/  .word 0x400a8000


            .thumb_func
            call_77f4:
/*0x77f4*/      push {r4, r5, r6, lr}
/*0x77f6*/      ldr r5, [pc, #0x70] /* data_7868 */
/*0x77f8*/      ldrb r0, [r5, #0x17]
/*0x77fa*/      ubfx r4, r0, #1, #1
/*0x77fe*/      cbz r4, jump_7804
/*0x7800*/      bl call_37e8
            jump_7804:
/*0x7804*/      ldrb r0, [r5, #0x15]
/*0x7806*/      cmp r0, #3
/*0x7808*/      bne jump_7840
/*0x780a*/      bl call_3b48
/*0x780e*/      cbz r0, jump_7840
/*0x7810*/      movs r0, #1
/*0x7812*/      bl call_57a4
/*0x7816*/      ldr r1, [pc, #0x50] /* data_7868 */
/*0x7818*/      movs r0, #1
/*0x781a*/      subs r1, #0x40
/*0x781c*/      strb r0, [r1, #6]
/*0x781e*/      ldrb r0, [r5, #0x15]
/*0x7820*/      cmp r0, #3
/*0x7822*/      bne jump_7840
/*0x7824*/      bl call_3b48
/*0x7828*/      cbz r0, jump_7840
/*0x782a*/      bl call_380c
/*0x782e*/      mov.w r0, #0x3e8
/*0x7832*/      bl call_37b8
/*0x7836*/      bl call_37c4
/*0x783a*/      movs r0, #0
/*0x783c*/      bl call_5f24
            jump_7840:
/*0x7840*/      cmp r4, #0
/*0x7842*/      beq jump_7866
/*0x7844*/      bl call_37fc
/*0x7848*/      cbz r0, jump_785e
/*0x784a*/      ldrb r0, [r5, #0x15]
/*0x784c*/      cmp r0, #3
/*0x784e*/      bne jump_785e
/*0x7850*/      bl call_3ac8
/*0x7854*/      ldr r0, [pc, #0x14] /* data_786c */
/*0x7856*/      ldr r1, [r0]
/*0x7858*/      orr r1, r1, #0x20
/*0x785c*/      str r1, [r0]
            jump_785e:
/*0x785e*/      pop.w {r4, r5, r6, lr}
/*0x7862*/      b.w jump_37d4
            jump_7866:
/*0x7866*/      pop {r4, r5, r6, pc}

            data_7868:
/*0x7868*/  .word 0x20000874
            data_786c:
/*0x786c*/  .word 0x400a8000


            .thumb_func
            loc_7870:
/*0x7870*/      b jump_7878

            .thumb_func
            loc_7872:
/*0x7872*/      ldm r0!, {r3}
/*0x7874*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x7876*/      stm r1!, {r3}
            jump_7878:
/*0x7878*/      cmp r2, #0
/*0x787a*/      bne loc_7872
/*0x787c*/      bx lr

            .thumb_func
            loc_787e:
/*0x787e*/      movs r0, #0
/*0x7880*/      b jump_7886

            .thumb_func
            loc_7882:
/*0x7882*/      stm r1!, {r0}
/*0x7884*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_7886:
/*0x7886*/      cmp r2, #0
/*0x7888*/      bne loc_7882
/*0x788a*/      bx lr

            .thumb_func
            call_788c:
/*0x788c*/      push {r3, r4, r5, lr}
/*0x788e*/      mov r4, r2
/*0x7890*/      movs r2, #0
/*0x7892*/      str r2, [sp]
/*0x7894*/      ldr r2, [pc, #0x1c] /* data_78b4 */
/*0x7896*/      ldr r5, [sp, #0x10]
/*0x7898*/      ldrb r4, [r2, r4]
/*0x789a*/      strb.w r4, [sp]
/*0x789e*/      ldrb r3, [r2, r3]
/*0x78a0*/      strb.w r3, [sp, #1]
/*0x78a4*/      ldrb r2, [r2, r5]
/*0x78a6*/      strb.w r2, [sp, #2]
/*0x78aa*/      mov r2, r1
/*0x78ac*/      mov r1, sp
/*0x78ae*/      bl call_49e8
/*0x78b2*/      pop {r3, r4, r5, pc}

            data_78b4:
/*0x78b4*/  .word 0x200001ce


            .thumb_func
            jump_78b8:
/*0x78b8*/      bl call_6724
/*0x78bc*/      bl call_59c0
/*0x78c0*/      bl call_381c
/*0x78c4*/      bl call_3bf0
/*0x78c8*/      bl call_4048
/*0x78cc*/      movs r0, #0xff
/*0x78ce*/      bl call_4264
/*0x78d2*/      bl call_629c
/*0x78d6*/      bl call_5ef4
/*0x78da*/      bl call_6458
/*0x78de*/      bl call_4ef0
/*0x78e2*/      movs r0, #0
/*0x78e4*/      bl call_4644
/*0x78e8*/      ldr r1, [pc, #0xb8] /* data_79a4 */
/*0x78ea*/      movs r0, #0
/*0x78ec*/      str r0, [r1]
/*0x78ee*/      bl call_5820
/*0x78f2*/      bl call_5854
/*0x78f6*/      movs r0, #0
/*0x78f8*/      bl call_57a4
/*0x78fc*/      movs r0, #0xa
/*0x78fe*/      bl call_37b8
/*0x7902*/      movs r0, #1
/*0x7904*/      bl call_6220
/*0x7908*/      bl call_4efc
/*0x790c*/      ldr r4, [pc, #0x98] /* data_79a8 */
/*0x790e*/      cbz r0, jump_7914
/*0x7910*/      movs r0, #1
/*0x7912*/      strh r0, [r4, #4]
            jump_7914:
/*0x7914*/      ldrh r0, [r4, #4]
/*0x7916*/      cbz r0, jump_793c
/*0x7918*/      bl call_6548
/*0x791c*/      bl call_5f14
/*0x7920*/      movs r0, #0
/*0x7922*/      bl call_6220
            jump_7926:
/*0x7926*/      ldrh r0, [r4, #4]
/*0x7928*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x792a*/      strh r0, [r4, #4]
/*0x792c*/      bl call_79b4
/*0x7930*/      movs r0, #1
/*0x7932*/      bl call_5fb0
/*0x7936*/      bl call_380c
/*0x793a*/      b jump_7926
            jump_793c:
/*0x793c*/      movs r0, #1
/*0x793e*/      bl call_57a4
/*0x7942*/      bl call_6978
/*0x7946*/      ldr r6, [pc, #0x64] /* data_79ac */
/*0x7948*/      ldr r5, [pc, #0x64] /* data_79b0 */
            jump_794a:
/*0x794a*/      bl call_6990
/*0x794e*/      cmp r0, #1
/*0x7950*/      beq jump_7962
/*0x7952*/      cmp r0, #2
/*0x7954*/      beq jump_7976
/*0x7956*/      cmp r0, #3
/*0x7958*/      bne jump_799e
/*0x795a*/      movs r0, #1
/*0x795c*/      bl call_57a4
/*0x7960*/      b jump_799e
            jump_7962:
/*0x7962*/      movs r0, #0
/*0x7964*/      bl call_57a4
/*0x7968*/      bl call_6548
/*0x796c*/      bl call_5f14
/*0x7970*/      movs r0, #0
/*0x7972*/      bl call_6220
            jump_7976:
/*0x7976*/      ldrh r0, [r4, #4]
/*0x7978*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x797a*/      strh r0, [r4, #4]
/*0x797c*/      lsls r0, r0, #0x11
/*0x797e*/      bne jump_798c
/*0x7980*/      ldr r0, [r5]
/*0x7982*/      cmp r0, r6
/*0x7984*/      bls jump_798c
/*0x7986*/      ldr r0, [r5]
/*0x7988*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x798a*/      str r0, [r5]
            jump_798c:
/*0x798c*/      bl handle_frame
/*0x7990*/      bl call_79b4
/*0x7994*/      ldrb r0, [r4]
/*0x7996*/      cbnz r0, jump_799e
/*0x7998*/      movs r0, #1
/*0x799a*/      bl call_5fb0
            jump_799e:
/*0x799e*/      bl call_380c
/*0x79a2*/      b jump_794a

            data_79a4:
/*0x79a4*/  .word 0x200007c0
            data_79a8:
/*0x79a8*/  .word 0x2000076c
            data_79ac:
/*0x79ac*/  .word 0x55aafaf0
            data_79b0:
/*0x79b0*/  .word 0x20003ffc


            .thumb_func
            call_79b4:
/*0x79b4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x79b8*/      ldr r5, [pc, #0xd4] /* data_7a90 */
/*0x79ba*/      movs r4, #0
/*0x79bc*/      ldrb r0, [r5, #2]
/*0x79be*/      cbz r0, jump_79de
/*0x79c0*/      cmp r0, #0x80
/*0x79c2*/      bhs jump_79de
/*0x79c4*/      movs r0, #1
/*0x79c6*/      bl call_4644
/*0x79ca*/      cbz r0, jump_79de
/*0x79cc*/      ldrb r0, [r5, #2]
/*0x79ce*/      cmp r0, #2
/*0x79d0*/      beq jump_7a0e
/*0x79d2*/      bl call_42e8
            jump_79d6:
/*0x79d6*/      strb r4, [r5, #2]
/*0x79d8*/      movs r0, #1
/*0x79da*/      bl call_5820
            jump_79de:
/*0x79de*/      bl call_526c
/*0x79e2*/      cmp r0, #0
/*0x79e4*/      beq jump_7a8a
/*0x79e6*/      ldr r6, [pc, #0xa8] /* data_7a90 */
/*0x79e8*/      mov.w r8, #1
/*0x79ec*/      subs r6, #0x48
/*0x79ee*/      ldrb r0, [r6, #1]
/*0x79f0*/      cmp r0, #0x20
/*0x79f2*/      blo jump_79fc
/*0x79f4*/      subs r0, #0x20
/*0x79f6*/      strb r0, [r6, #1]
/*0x79f8*/      strb.w r8, [r6, #2]
            jump_79fc:
/*0x79fc*/      ldr r7, [pc, #0x94] /* data_7a94 */
/*0x79fe*/      ldrb r0, [r7]
/*0x7a00*/      cmp r0, #0xff
/*0x7a02*/      beq jump_7a24
/*0x7a04*/      bl call_4a74
/*0x7a08*/      cmp r0, #1
/*0x7a0a*/      beq jump_7a14
/*0x7a0c*/      b jump_7a24
            jump_7a0e:
/*0x7a0e*/      bl call_4320
/*0x7a12*/      b jump_79d6
            jump_7a14:
/*0x7a14*/      ldrb r0, [r7]
/*0x7a16*/      bl call_4264
/*0x7a1a*/      movs r0, #0xff
/*0x7a1c*/      strb r0, [r7]
/*0x7a1e*/      movs r0, #2
/*0x7a20*/      bl call_5820
            jump_7a24:
/*0x7a24*/      ldrb r0, [r5, #3]
/*0x7a26*/      cbz r0, jump_7a38
/*0x7a28*/      bl call_4a74
/*0x7a2c*/      cmp r0, #1
/*0x7a2e*/      bne jump_7a38
/*0x7a30*/      ldrb r0, [r5, #3]
/*0x7a32*/      bl call_4b70
/*0x7a36*/      strb r4, [r5, #3]
            jump_7a38:
/*0x7a38*/      bl call_61a4
/*0x7a3c*/      bl call_5ad0
/*0x7a40*/      ldr r0, [pc, #0x54] /* data_7a98 */
/*0x7a42*/      ldrb r0, [r0, #8]
/*0x7a44*/      cmp r0, #1
/*0x7a46*/      beq jump_7a50
/*0x7a48*/      bl call_4b80
/*0x7a4c*/      bl call_3bac
            jump_7a50:
/*0x7a50*/      ldrb r0, [r6, #2]
/*0x7a52*/      cbz r0, jump_7a58
/*0x7a54*/      bl call_4ca8
            jump_7a58:
/*0x7a58*/      ldrb r0, [r5]
/*0x7a5a*/      cbz r0, jump_7a70
/*0x7a5c*/      ldr r7, [pc, #0x3c] /* data_7a9c */
/*0x7a5e*/      ldrb r0, [r7]
/*0x7a60*/      cbnz r0, jump_7a70
/*0x7a62*/      strb r4, [r5]
/*0x7a64*/      bl call_56f0
/*0x7a68*/      bl call_5700
/*0x7a6c*/      strb.w r8, [r7]
            jump_7a70:
/*0x7a70*/      ldrb r0, [r6, #2]
/*0x7a72*/      cmp r0, #0
/*0x7a74*/      beq jump_7a8a
/*0x7a76*/      ldr r0, [pc, #0x18] /* data_7a90 */
/*0x7a78*/      ldrb r2, [r6, #1]
/*0x7a7a*/      subs r0, #0x42
/*0x7a7c*/      ldrb r1, [r0, #1]
/*0x7a7e*/      add r1, r2
/*0x7a80*/      strb r1, [r0, #1]
/*0x7a82*/      ldrh r0, [r6, #6]
/*0x7a84*/      lsrs r0, r0, #1
/*0x7a86*/      strh r0, [r6, #6]
/*0x7a88*/      strb r4, [r6, #2]
            jump_7a8a:
/*0x7a8a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7a8e*/  .byte 0x00
/*0x7a8f*/  .byte 0x00

            data_7a90:
/*0x7a90*/  .word 0x200007b4
            data_7a94:
/*0x7a94*/  .word 0x20000006
            data_7a98:
/*0x7a98*/  .word 0x20001ba4
            data_7a9c:
/*0x7a9c*/  .word 0x20000348


            .thumb_func
            call_7aa0:
/*0x7aa0*/      ldr r0, [pc, #0x30] /* data_7ad4 */
/*0x7aa2*/      ldrb r0, [r0, #2]
/*0x7aa4*/      cmp r0, #0
/*0x7aa6*/      beq jump_7abe
/*0x7aa8*/      ldr r1, [pc, #0x2c] /* data_7ad8 */
/*0x7aaa*/      ldr r2, [pc, #0x30] /* data_7adc */
/*0x7aac*/      movs r3, #1
/*0x7aae*/      ldrb r1, [r1]
/*0x7ab0*/      cbz r1, jump_7ac0
/*0x7ab2*/      cmp r1, #1
/*0x7ab4*/      beq jump_7ace
/*0x7ab6*/      cmp r1, #2
/*0x7ab8*/      bne jump_7abe
/*0x7aba*/      movs r0, #2
/*0x7abc*/      strb r0, [r2, #9]
            jump_7abe:
/*0x7abe*/      bx lr
            jump_7ac0:
/*0x7ac0*/      movs r1, #0
/*0x7ac2*/      strb r1, [r2, #9]
/*0x7ac4*/      strb r3, [r2]
/*0x7ac6*/      movs r1, #3
/*0x7ac8*/      strb r1, [r2, #3]
/*0x7aca*/      b.w call_43e8
            jump_7ace:
/*0x7ace*/      strb r3, [r2, #9]
/*0x7ad0*/      bx lr

/*0x7ad2*/  .byte 0x00
/*0x7ad3*/  .byte 0x00

            data_7ad4:
/*0x7ad4*/  .word 0x20000894
            data_7ad8:
/*0x7ad8*/  .word 0x20000010
            data_7adc:
/*0x7adc*/  .word 0x200007b4

/*0x7ae0*/  .byte 0x3c
/*0x7ae1*/  .byte 0x38
/*0x7ae2*/  .byte 0xe6
/*0x7ae3*/  .byte 0xe3
/*0x7ae4*/  .byte 0x2c
/*0x7ae5*/  .byte 0x08
/*0x7ae6*/  .byte 0x14
/*0x7ae7*/  .byte 0x1a
/*0x7ae8*/  .byte 0xe5
/*0x7ae9*/  .byte 0xe4
/*0x7aea*/  .byte 0x65
/*0x7aeb*/  .byte 0xe7
/*0x7aec*/  .byte 0x39
/*0x7aed*/  .byte 0xe0
/*0x7aee*/  .byte 0xe0
/*0x7aef*/  .byte 0x39
/*0x7af0*/  .byte 0x2f
/*0x7af1*/  .byte 0x10
/*0x7af2*/  .byte 0x01
/*0x7af3*/  .byte 0x3b
/*0x7af4*/  .byte 0x60
/*0x7af5*/  .byte 0x01
/*0x7af6*/  .byte 0x39
/*0x7af7*/  .byte 0x68
/*0x7af8*/  .byte 0x01
/*0x7af9*/  .byte 0x41
/*0x7afa*/  .byte 0x69
/*0x7afb*/  .byte 0x01
/*0x7afc*/  .byte 0x35
/*0x7afd*/  .byte 0x6a
/*0x7afe*/  .byte 0x01
/*0x7aff*/  .byte 0x36
/*0x7b00*/  .byte 0x5f
/*0x7b01*/  .byte 0x01
/*0x7b02*/  .byte 0x49
/*0x7b03*/  .byte 0x3a
/*0x7b04*/  .byte 0x4a
/*0x7b05*/  .byte 0x3b
/*0x7b06*/  .byte 0x4b
/*0x7b07*/  .byte 0x3c
/*0x7b08*/  .byte 0x50
/*0x7b09*/  .byte 0x3d
/*0x7b0a*/  .byte 0x51
/*0x7b0b*/  .byte 0x3e
/*0x7b0c*/  .byte 0x52
/*0x7b0d*/  .byte 0x3f
/*0x7b0e*/  .byte 0x54
/*0x7b0f*/  .byte 0x40
/*0x7b10*/  .byte 0x4d
/*0x7b11*/  .byte 0x41
/*0x7b12*/  .byte 0x4c
/*0x7b13*/  .byte 0x42
/*0x7b14*/  .byte 0x55
/*0x7b15*/  .byte 0x43
/*0x7b16*/  .byte 0x56
/*0x7b17*/  .byte 0x44
/*0x7b18*/  .byte 0x57
/*0x7b19*/  .byte 0x45
/*0x7b1a*/  .byte 0x49
/*0x7b1b*/  .byte 0xf4
/*0x7b1c*/  .byte 0x4a
/*0x7b1d*/  .byte 0xf5
/*0x7b1e*/  .byte 0x4b
/*0x7b1f*/  .byte 0xf6
/*0x7b20*/  .byte 0x50
/*0x7b21*/  .byte 0xf2
/*0x7b22*/  .byte 0x51
/*0x7b23*/  .byte 0xf0
/*0x7b24*/  .byte 0x52
/*0x7b25*/  .byte 0xf3
/*0x7b26*/  .byte 0x55
/*0x7b27*/  .byte 0x46
/*0x7b28*/  .byte 0x56
/*0x7b29*/  .byte 0x47
/*0x7b2a*/  .byte 0x57
/*0x7b2b*/  .byte 0x48
/*0x7b2c*/  .byte 0x3a
/*0x7b2d*/  .byte 0x49
/*0x7b2e*/  .byte 0x31
/*0x7b2f*/  .byte 0xee
/*0x7b30*/  .byte 0x07
/*0x7b31*/  .byte 0x65
/*0x7b32*/  .byte 0x3a
/*0x7b33*/  .byte 0x47
/*0x7b34*/  .byte 0x3b
/*0x7b35*/  .byte 0x48
/*0x7b36*/  .byte 0x3c
/*0x7b37*/  .byte 0xc9
/*0x7b38*/  .byte 0x3d
/*0x7b39*/  .byte 0xca
/*0x7b3a*/  .byte 0x3e
/*0x7b3b*/  .byte 0xcb
/*0x7b3c*/  .byte 0x3f
/*0x7b3d*/  .byte 0xcc
/*0x7b3e*/  .byte 0x40
/*0x7b3f*/  .byte 0xf2
/*0x7b40*/  .byte 0x41
/*0x7b41*/  .byte 0xf0
/*0x7b42*/  .byte 0x42
/*0x7b43*/  .byte 0xf3
/*0x7b44*/  .byte 0x43
/*0x7b45*/  .byte 0xf4
/*0x7b46*/  .byte 0x44
/*0x7b47*/  .byte 0xf5
/*0x7b48*/  .byte 0x45
/*0x7b49*/  .byte 0xf6
/*0x7b4a*/  .byte 0xe2
/*0x7b4b*/  .byte 0xe3
/*0x7b4c*/  .byte 0xe3
/*0x7b4d*/  .byte 0xe2
/*0x7b4e*/  .byte 0xe6
/*0x7b4f*/  .byte 0xe7
/*0x7b50*/  .byte 0xe7
/*0x7b51*/  .byte 0xe6
/*0x7b52*/  .byte 0xe8
/*0x7b53*/  .byte 0xcf
/*0x7b54*/  .byte 0xff
/*0x7b55*/  .byte 0xff
/*0x7b56*/  .byte 0xff
/*0x7b57*/  .byte 0x00
/*0x7b58*/  .byte 0x00
/*0x7b59*/  .byte 0xff
/*0x7b5a*/  .byte 0xff
/*0x7b5b*/  .byte 0x00
/*0x7b5c*/  .byte 0x00
/*0x7b5d*/  .byte 0xff
/*0x7b5e*/  .byte 0xff
/*0x7b5f*/  .byte 0xff
/*0x7b60*/  .byte 0x00
/*0x7b61*/  .byte 0x01
/*0x7b62*/  .byte 0x02
/*0x7b63*/  .byte 0x03
/*0x7b64*/  .byte 0xff
/*0x7b65*/  .byte 0xff
/*0x7b66*/  .byte 0xff
/*0x7b67*/  .byte 0xff
/*0x7b68*/  .byte 0x04
/*0x7b69*/  .byte 0x04
/*0x7b6a*/  .byte 0x05
/*0x7b6b*/  .byte 0x05
/*0x7b6c*/  .byte 0x06
/*0x7b6d*/  .byte 0x06
/*0x7b6e*/  .byte 0x01
/*0x7b6f*/  .byte 0x01
/*0x7b70*/  .byte 0x01
/*0x7b71*/  .byte 0x01
/*0x7b72*/  .byte 0x01
/*0x7b73*/  .byte 0x01
/*0x7b74*/  .byte 0x01
/*0x7b75*/  .byte 0x03
/*0x7b76*/  .byte 0x05
/*0x7b77*/  .byte 0x07
/*0x7b78*/  .byte 0x09
/*0x7b79*/  .byte 0x0b
/*0x7b7a*/  .byte 0x01
/*0x7b7b*/  .byte 0x03
/*0x7b7c*/  .byte 0x05
/*0x7b7d*/  .byte 0x07
/*0x7b7e*/  .byte 0x09
/*0x7b7f*/  .byte 0x0b
/*0x7b80*/  .byte 0xaa
/*0x7b81*/  .byte 0x6e
/*0x7b82*/  .byte 0x46
/*0x7b83*/  .byte 0x28
/*0x7b84*/  .byte 0x14
/*0x7b85*/  .byte 0x0a
/*0x7b86*/  .byte 0x01
/*0x7b87*/  .byte 0x02
/*0x7b88*/  .byte 0x03
/*0x7b89*/  .byte 0x04
/*0x7b8a*/  .byte 0x06
/*0x7b8b*/  .byte 0x09
/*0x7b8c*/  .byte 0x10
/*0x7b8d*/  .byte 0x0b
/*0x7b8e*/  .byte 0x07
/*0x7b8f*/  .byte 0x04
/*0x7b90*/  .byte 0x02
/*0x7b91*/  .byte 0x01
/*0x7b92*/  .byte 0x10
/*0x7b93*/  .byte 0x0b
/*0x7b94*/  .byte 0x07
/*0x7b95*/  .byte 0x04
/*0x7b96*/  .byte 0x02
/*0x7b97*/  .byte 0x01
/*0x7b98*/  .byte 0x01
/*0x7b99*/  .byte 0x01
/*0x7b9a*/  .byte 0x08
/*0x7b9b*/  .byte 0x08
/*0x7b9c*/  .byte 0x08
/*0x7b9d*/  .byte 0x08
/*0x7b9e*/  .byte 0x07
/*0x7b9f*/  .byte 0x07
/*0x7ba0*/  .byte 0x01
/*0x7ba1*/  .byte 0x01
/*0x7ba2*/  .byte 0x08
/*0x7ba3*/  .byte 0x01
/*0x7ba4*/  .byte 0x08
/*0x7ba5*/  .byte 0x08
/*0x7ba6*/  .byte 0x07
/*0x7ba7*/  .byte 0x07
/*0x7ba8*/  .byte 0x01
/*0x7ba9*/  .byte 0x02
/*0x7baa*/  .byte 0x01
/*0x7bab*/  .byte 0x01
/*0x7bac*/  .byte 0x08
/*0x7bad*/  .byte 0x08
/*0x7bae*/  .byte 0x06
/*0x7baf*/  .byte 0x06
/*0x7bb0*/  .byte 0x02
/*0x7bb1*/  .byte 0x02
/*0x7bb2*/  .byte 0x02
/*0x7bb3*/  .byte 0x02
/*0x7bb4*/  .byte 0x06
/*0x7bb5*/  .byte 0x06
/*0x7bb6*/  .byte 0x06
/*0x7bb7*/  .byte 0x06
/*0x7bb8*/  .byte 0x02
/*0x7bb9*/  .byte 0x02
/*0x7bba*/  .byte 0x03
/*0x7bbb*/  .byte 0x03
/*0x7bbc*/  .byte 0x04
/*0x7bbd*/  .byte 0x04
/*0x7bbe*/  .byte 0x05
/*0x7bbf*/  .byte 0x05
/*0x7bc0*/  .byte 0x03
/*0x7bc1*/  .byte 0x03
/*0x7bc2*/  .byte 0x03
/*0x7bc3*/  .byte 0x04
/*0x7bc4*/  .byte 0x04
/*0x7bc5*/  .byte 0x04
/*0x7bc6*/  .byte 0x05
/*0x7bc7*/  .byte 0x05
/*0x7bc8*/  .byte 0x03
/*0x7bc9*/  .byte 0x03
/*0x7bca*/  .byte 0x04
/*0x7bcb*/  .byte 0x04
/*0x7bcc*/  .byte 0x04
/*0x7bcd*/  .byte 0x04
/*0x7bce*/  .byte 0x05
/*0x7bcf*/  .byte 0x05
/*0x7bd0*/  .byte 0x03
/*0x7bd1*/  .byte 0x03
/*0x7bd2*/  .byte 0x03
/*0x7bd3*/  .byte 0x05
/*0x7bd4*/  .byte 0x05
/*0x7bd5*/  .byte 0x05
/*0x7bd6*/  .byte 0x05
/*0x7bd7*/  .byte 0x05
/*0x7bd8*/  .byte 0xff
/*0x7bd9*/  .byte 0x04
/*0x7bda*/  .byte 0x07
/*0x7bdb*/  .byte 0x07
/*0x7bdc*/  .byte 0x07
/*0x7bdd*/  .byte 0x06
/*0x7bde*/  .byte 0x06
/*0x7bdf*/  .byte 0xff
/*0x7be0*/  .byte 0x01
/*0x7be1*/  .byte 0x01
/*0x7be2*/  .byte 0x01
/*0x7be3*/  .byte 0x02
/*0x7be4*/  .byte 0x02
/*0x7be5*/  .byte 0x02
/*0x7be6*/  .byte 0x07
/*0x7be7*/  .byte 0xff
/*0x7be8*/  .byte 0x02
/*0x7be9*/  .byte 0x02
/*0x7bea*/  .byte 0x02
/*0x7beb*/  .byte 0x04
/*0x7bec*/  .byte 0x02
/*0x7bed*/  .byte 0x03
/*0x7bee*/  .byte 0x03
/*0x7bef*/  .byte 0x03
/*0x7bf0*/  .byte 0xff
/*0x7bf1*/  .byte 0xff
/*0x7bf2*/  .byte 0xff
/*0x7bf3*/  .byte 0xff
/*0x7bf4*/  .byte 0xff
/*0x7bf5*/  .byte 0xff
/*0x7bf6*/  .byte 0xff
/*0x7bf7*/  .byte 0xff
/*0x7bf8*/  .byte 0x01
/*0x7bf9*/  .byte 0x09
/*0x7bfa*/  .byte 0x02
/*0x7bfb*/  .byte 0x12
/*0x7bfc*/  .byte 0x03
/*0x7bfd*/  .byte 0x13
/*0x7bfe*/  .byte 0x04
/*0x7bff*/  .byte 0x1c
/*0x7c00*/  .byte 0x11
/*0x7c01*/  .byte 0x19
/*0x7c02*/  .byte 0x1a
/*0x7c03*/  .byte 0x22
/*0x7c04*/  .byte 0x1b
/*0x7c05*/  .byte 0x23
/*0x7c06*/  .byte 0x24
/*0x7c07*/  .byte 0x2c
/*0x7c08*/  .byte 0x21
/*0x7c09*/  .byte 0x29
/*0x7c0a*/  .byte 0x2a
/*0x7c0b*/  .byte 0x3a
/*0x7c0c*/  .byte 0x2b
/*0x7c0d*/  .byte 0x3b
/*0x7c0e*/  .byte 0x3c
/*0x7c0f*/  .byte 0x44
/*0x7c10*/  .byte 0x31
/*0x7c11*/  .byte 0x39
/*0x7c12*/  .byte 0x42
/*0x7c13*/  .byte 0x4a
/*0x7c14*/  .byte 0x43
/*0x7c15*/  .byte 0x4b
/*0x7c16*/  .byte 0x4c
/*0x7c17*/  .byte 0x54
/*0x7c18*/  .byte 0x41
/*0x7c19*/  .byte 0x49
/*0x7c1a*/  .byte 0x52
/*0x7c1b*/  .byte 0x5a
/*0x7c1c*/  .byte 0x53
/*0x7c1d*/  .byte 0x5b
/*0x7c1e*/  .byte 0x5c
/*0x7c1f*/  .byte 0x64
/*0x7c20*/  .byte 0x51
/*0x7c21*/  .byte 0x59
/*0x7c22*/  .byte 0x62
/*0x7c23*/  .byte 0x6a
/*0x7c24*/  .byte 0x63
/*0x7c25*/  .byte 0x6b
/*0x7c26*/  .byte 0x6c
/*0x7c27*/  .byte 0x74
/*0x7c28*/  .byte 0x61
/*0x7c29*/  .byte 0x79
/*0x7c2a*/  .byte 0x72
/*0x7c2b*/  .byte 0x7a
/*0x7c2c*/  .byte 0x7b
/*0x7c2d*/  .byte 0x83
/*0x7c2e*/  .byte 0x65
/*0x7c2f*/  .byte 0x85
/*0x7c30*/  .byte 0x78
/*0x7c31*/  .byte 0x81
/*0x7c32*/  .byte 0x80
/*0x7c33*/  .byte 0x84
/*0x7c34*/  .byte 0x5d
/*0x7c35*/  .byte 0x7c
/*0x7c36*/  .byte 0x7d
/*0x7c37*/  .byte 0x6d
/*0x7c38*/  .byte 0xff
/*0x7c39*/  .byte 0x82
/*0x7c3a*/  .byte 0x15
/*0x7c3b*/  .byte 0x05
/*0x7c3c*/  .byte 0x1d
/*0x7c3d*/  .byte 0x45
/*0x7c3e*/  .byte 0x55
/*0x7c3f*/  .byte 0xff
/*0x7c40*/  .byte 0x00
/*0x7c41*/  .byte 0x10
/*0x7c42*/  .byte 0x18
/*0x7c43*/  .byte 0x20
/*0x7c44*/  .byte 0x58
/*0x7c45*/  .byte 0x50
/*0x7c46*/  .byte 0x14
/*0x7c47*/  .byte 0xff
/*0x7c48*/  .byte 0x28
/*0x7c49*/  .byte 0x38
/*0x7c4a*/  .byte 0x40
/*0x7c4b*/  .byte 0x73
/*0x7c4c*/  .byte 0x48
/*0x7c4d*/  .byte 0x60
/*0x7c4e*/  .byte 0x68
/*0x7c4f*/  .byte 0x70
/*0x7c50*/  .byte 0xff
/*0x7c51*/  .byte 0xff
/*0x7c52*/  .byte 0xff
/*0x7c53*/  .byte 0xff
/*0x7c54*/  .byte 0xff
/*0x7c55*/  .byte 0xff
/*0x7c56*/  .byte 0xff
/*0x7c57*/  .byte 0xff
/*0x7c58*/  .byte 0x00
/*0x7c59*/  .byte 0x24
/*0x7c5a*/  .byte 0x49
/*0x7c5b*/  .byte 0x6d
/*0x7c5c*/  .byte 0x92
/*0x7c5d*/  .byte 0xb6
/*0x7c5e*/  .byte 0xdb
/*0x7c5f*/  .byte 0xff
/*0x7c60*/  .byte 0xaa
/*0x7c61*/  .byte 0x55
/*0x7c62*/  .byte 0x00
/*0x7c63*/  .byte 0x00
/*0x7c64*/  .byte 0x01
/*0x7c65*/  .byte 0x01
/*0x7c66*/  .byte 0x00
/*0x7c67*/  .byte 0x01
/*0x7c68*/  .byte 0x02
/*0x7c69*/  .byte 0x07
/*0x7c6a*/  .byte 0x05
/*0x7c6b*/  .byte 0x00
/*0x7c6c*/  .byte 0x01
/*0x7c6d*/  .byte 0x05
/*0x7c6e*/  .byte 0x35
/*0x7c6f*/  .byte 0x1e
/*0x7c70*/  .byte 0x2b
/*0x7c71*/  .byte 0x14
/*0x7c72*/  .byte 0x39
/*0x7c73*/  .byte 0x04
/*0x7c74*/  .byte 0xe1
/*0x7c75*/  .byte 0x1d
/*0x7c76*/  .byte 0x1f
/*0x7c77*/  .byte 0x20
/*0x7c78*/  .byte 0x1a
/*0x7c79*/  .byte 0x08
/*0x7c7a*/  .byte 0x16
/*0x7c7b*/  .byte 0x07
/*0x7c7c*/  .byte 0x1b
/*0x7c7d*/  .byte 0x06
/*0x7c7e*/  .byte 0x21
/*0x7c7f*/  .byte 0x22
/*0x7c80*/  .byte 0x15
/*0x7c81*/  .byte 0x17
/*0x7c82*/  .byte 0x09
/*0x7c83*/  .byte 0x0a
/*0x7c84*/  .byte 0x19
/*0x7c85*/  .byte 0x05
/*0x7c86*/  .byte 0x23
/*0x7c87*/  .byte 0x24
/*0x7c88*/  .byte 0x1c
/*0x7c89*/  .byte 0x18
/*0x7c8a*/  .byte 0x0b
/*0x7c8b*/  .byte 0x0d
/*0x7c8c*/  .byte 0x11
/*0x7c8d*/  .byte 0x10
/*0x7c8e*/  .byte 0x25
/*0x7c8f*/  .byte 0x26
/*0x7c90*/  .byte 0x0c
/*0x7c91*/  .byte 0x12
/*0x7c92*/  .byte 0x0e
/*0x7c93*/  .byte 0x0f
/*0x7c94*/  .byte 0x36
/*0x7c95*/  .byte 0x37
/*0x7c96*/  .byte 0x27
/*0x7c97*/  .byte 0x2d
/*0x7c98*/  .byte 0x13
/*0x7c99*/  .byte 0x2f
/*0x7c9a*/  .byte 0x33
/*0x7c9b*/  .byte 0x34
/*0x7c9c*/  .byte 0x38
/*0x7c9d*/  .byte 0xe5
/*0x7c9e*/  .byte 0x2e
/*0x7c9f*/  .byte 0x2a
/*0x7ca0*/  .byte 0x30
/*0x7ca1*/  .byte 0x31
/*0x7ca2*/  .byte 0x28
/*0x7ca3*/  .byte 0x4e
/*0x7ca4*/  .byte 0xe4
/*0x7ca5*/  .byte 0x4f
/*0x7ca6*/  .byte 0xcf
/*0x7ca7*/  .byte 0x4a
/*0x7ca8*/  .byte 0x4c
/*0x7ca9*/  .byte 0x4d
/*0x7caa*/  .byte 0xe8
/*0x7cab*/  .byte 0x52
/*0x7cac*/  .byte 0x51
/*0x7cad*/  .byte 0x50
/*0x7cae*/  .byte 0x00
/*0x7caf*/  .byte 0x4b
/*0x7cb0*/  .byte 0xe3
/*0x7cb1*/  .byte 0xe0
/*0x7cb2*/  .byte 0xe2
/*0x7cb3*/  .byte 0x2c
/*0x7cb4*/  .byte 0xe6
/*0x7cb5*/  .byte 0x00
/*0x7cb6*/  .byte 0x29
/*0x7cb7*/  .byte 0x3a
/*0x7cb8*/  .byte 0x3b
/*0x7cb9*/  .byte 0x3c
/*0x7cba*/  .byte 0x42
/*0x7cbb*/  .byte 0x41
/*0x7cbc*/  .byte 0x64
/*0x7cbd*/  .byte 0x00
/*0x7cbe*/  .byte 0x3d
/*0x7cbf*/  .byte 0x3e
/*0x7cc0*/  .byte 0x3f
/*0x7cc1*/  .byte 0x32
/*0x7cc2*/  .byte 0x40
/*0x7cc3*/  .byte 0x43
/*0x7cc4*/  .byte 0x44
/*0x7cc5*/  .byte 0x45
/*0x7cc6*/  .byte 0x02
/*0x7cc7*/  .byte 0x09
/*0x7cc8*/  .byte 0x00
/*0x7cc9*/  .byte 0x05
/*0x7cca*/  .byte 0x00
/*0x7ccb*/  .byte 0x06
/*0x7ccc*/  .byte 0x00
/*0x7ccd*/  .byte 0x07
/*0x7cce*/  .byte 0x02
/*0x7ccf*/  .byte 0x0b
/*0x7cd0*/  .byte 0x02
/*0x7cd1*/  .byte 0x0d
/*0x7cd2*/  .byte 0x02
/*0x7cd3*/  .byte 0x0e
/*0x7cd4*/  .byte 0x02
/*0x7cd5*/  .byte 0x0f
/*0x7cd6*/  .byte 0x00
/*0x7cd7*/  .byte 0x04
/*0x7cd8*/  .byte 0x01
/*0x7cd9*/  .byte 0x0a
/*0x7cda*/  .byte 0x03
/*0x7cdb*/  .byte 0x00
/*0x7cdc*/  .byte 0x01
/*0x7cdd*/  .byte 0x0b
/*0x7cde*/  .byte 0x00
/*0x7cdf*/  .byte 0x0b
/*0x7ce0*/  .byte 0x00
/*0x7ce1*/  .byte 0x00
/*0x7ce2*/  .byte 0x00
/*0x7ce3*/  .byte 0x01
/*0x7ce4*/  .byte 0x00
/*0x7ce5*/  .byte 0x02
/*0x7ce6*/  .byte 0x00
/*0x7ce7*/  .byte 0x03
/*0x7ce8*/  .byte 0x03
/*0x7ce9*/  .byte 0x01
/*0x7cea*/  .byte 0x02
/*0x7ceb*/  .byte 0x0a
/*0x7cec*/  .byte 0x24
/*0x7ced*/  .byte 0x00
/*0x7cee*/  .byte 0x0b
/*0x7cef*/  .byte 0x40
/*0x7cf0*/  .byte 0x10
/*0x7cf1*/  .byte 0x00
/*0x7cf2*/  .byte 0x00
/*0x7cf3*/  .byte 0x00
/*0x7cf4*/  .byte 0x24
/*0x7cf5*/  .byte 0x20
/*0x7cf6*/  .byte 0x0b
/*0x7cf7*/  .byte 0x40
/*0x7cf8*/  .byte 0x00
/*0x7cf9*/  .byte 0x04
/*0x7cfa*/  .byte 0x00
/*0x7cfb*/  .byte 0x00
/*0x7cfc*/  .byte 0x24
/*0x7cfd*/  .byte 0x60
/*0x7cfe*/  .byte 0x0b
/*0x7cff*/  .byte 0x40
/*0x7d00*/  .byte 0x01
/*0x7d01*/  .byte 0x00
/*0x7d02*/  .byte 0x00
/*0x7d03*/  .byte 0x00
/*0x7d04*/  .byte 0x24
/*0x7d05*/  .byte 0x20
/*0x7d06*/  .byte 0x0b
/*0x7d07*/  .byte 0x40
/*0x7d08*/  .byte 0x00
/*0x7d09*/  .byte 0x08
/*0x7d0a*/  .byte 0x00
/*0x7d0b*/  .byte 0x00
/*0x7d0c*/  .byte 0x24
/*0x7d0d*/  .byte 0x00
/*0x7d0e*/  .byte 0x0b
/*0x7d0f*/  .byte 0x40
/*0x7d10*/  .byte 0x00
/*0x7d11*/  .byte 0x08
/*0x7d12*/  .byte 0x00
/*0x7d13*/  .byte 0x00
/*0x7d14*/  .byte 0x24
/*0x7d15*/  .byte 0x00
/*0x7d16*/  .byte 0x0b
/*0x7d17*/  .byte 0x40
/*0x7d18*/  .byte 0x01
/*0x7d19*/  .byte 0x00
/*0x7d1a*/  .byte 0x00
/*0x7d1b*/  .byte 0x00
/*0x7d1c*/  .byte 0x24
/*0x7d1d*/  .byte 0x00
/*0x7d1e*/  .byte 0x0b
/*0x7d1f*/  .byte 0x40
/*0x7d20*/  .byte 0x02
/*0x7d21*/  .byte 0x00
/*0x7d22*/  .byte 0x00
/*0x7d23*/  .byte 0x00
/*0x7d24*/  .byte 0x24
/*0x7d25*/  .byte 0x00
/*0x7d26*/  .byte 0x0b
/*0x7d27*/  .byte 0x40
/*0x7d28*/  .byte 0x04
/*0x7d29*/  .byte 0x00
/*0x7d2a*/  .byte 0x00
/*0x7d2b*/  .byte 0x00
/*0x7d2c*/  .byte 0x24
/*0x7d2d*/  .byte 0x00
/*0x7d2e*/  .byte 0x0b
/*0x7d2f*/  .byte 0x40
/*0x7d30*/  .byte 0x08
/*0x7d31*/  .byte 0x00
/*0x7d32*/  .byte 0x00
/*0x7d33*/  .byte 0x00
/*0x7d34*/  .byte 0x24
/*0x7d35*/  .byte 0x60
/*0x7d36*/  .byte 0x0b
/*0x7d37*/  .byte 0x40
/*0x7d38*/  .byte 0x02
/*0x7d39*/  .byte 0x00
/*0x7d3a*/  .byte 0x00
/*0x7d3b*/  .byte 0x00
/*0x7d3c*/  .byte 0x24
/*0x7d3d*/  .byte 0x40
/*0x7d3e*/  .byte 0x0b
/*0x7d3f*/  .byte 0x40
/*0x7d40*/  .byte 0x00
/*0x7d41*/  .byte 0x04
/*0x7d42*/  .byte 0x00
/*0x7d43*/  .byte 0x00
/*0x7d44*/  .byte 0x2d
/*0x7d45*/  .byte 0x2f
/*0x7d46*/  .byte 0x2e
/*0x7d47*/  .byte 0x30
/*0x7d48*/  .byte 0x14
/*0x7d49*/  .byte 0x34
/*0x7d4a*/  .byte 0x1a
/*0x7d4b*/  .byte 0x36
/*0x7d4c*/  .byte 0x08
/*0x7d4d*/  .byte 0x37
/*0x7d4e*/  .byte 0x15
/*0x7d4f*/  .byte 0x13
/*0x7d50*/  .byte 0x17
/*0x7d51*/  .byte 0x1c
/*0x7d52*/  .byte 0x1c
/*0x7d53*/  .byte 0x09
/*0x7d54*/  .byte 0x18
/*0x7d55*/  .byte 0x0a
/*0x7d56*/  .byte 0x0c
/*0x7d57*/  .byte 0x06
/*0x7d58*/  .byte 0x12
/*0x7d59*/  .byte 0x15
/*0x7d5a*/  .byte 0x13
/*0x7d5b*/  .byte 0x0f
/*0x7d5c*/  .byte 0x2f
/*0x7d5d*/  .byte 0x38
/*0x7d5e*/  .byte 0x30
/*0x7d5f*/  .byte 0x2e
/*0x7d60*/  .byte 0x16
/*0x7d61*/  .byte 0x12
/*0x7d62*/  .byte 0x07
/*0x7d63*/  .byte 0x08
/*0x7d64*/  .byte 0x09
/*0x7d65*/  .byte 0x18
/*0x7d66*/  .byte 0x0a
/*0x7d67*/  .byte 0x0c
/*0x7d68*/  .byte 0x0b
/*0x7d69*/  .byte 0x07
/*0x7d6a*/  .byte 0x0d
/*0x7d6b*/  .byte 0x0b
/*0x7d6c*/  .byte 0x0e
/*0x7d6d*/  .byte 0x17
/*0x7d6e*/  .byte 0x0f
/*0x7d6f*/  .byte 0x11
/*0x7d70*/  .byte 0x33
/*0x7d71*/  .byte 0x16
/*0x7d72*/  .byte 0x34
/*0x7d73*/  .byte 0x2d
/*0x7d74*/  .byte 0x1d
/*0x7d75*/  .byte 0x33
/*0x7d76*/  .byte 0x1b
/*0x7d77*/  .byte 0x14
/*0x7d78*/  .byte 0x06
/*0x7d79*/  .byte 0x0d
/*0x7d7a*/  .byte 0x19
/*0x7d7b*/  .byte 0x0e
/*0x7d7c*/  .byte 0x05
/*0x7d7d*/  .byte 0x1b
/*0x7d7e*/  .byte 0x11
/*0x7d7f*/  .byte 0x05
/*0x7d80*/  .byte 0x10
/*0x7d81*/  .byte 0x10
/*0x7d82*/  .byte 0x36
/*0x7d83*/  .byte 0x1a
/*0x7d84*/  .byte 0x37
/*0x7d85*/  .byte 0x19
/*0x7d86*/  .byte 0x38
/*0x7d87*/  .byte 0x1d
/*0x7d88*/  .byte 0x08
/*0x7d89*/  .byte 0x09
/*0x7d8a*/  .byte 0x15
/*0x7d8b*/  .byte 0x13
/*0x7d8c*/  .byte 0x17
/*0x7d8d*/  .byte 0x0a
/*0x7d8e*/  .byte 0x1c
/*0x7d8f*/  .byte 0x0d
/*0x7d90*/  .byte 0x18
/*0x7d91*/  .byte 0x0f
/*0x7d92*/  .byte 0x0c
/*0x7d93*/  .byte 0x18
/*0x7d94*/  .byte 0x12
/*0x7d95*/  .byte 0x1c
/*0x7d96*/  .byte 0x13
/*0x7d97*/  .byte 0x33
/*0x7d98*/  .byte 0x16
/*0x7d99*/  .byte 0x15
/*0x7d9a*/  .byte 0x07
/*0x7d9b*/  .byte 0x16
/*0x7d9c*/  .byte 0x09
/*0x7d9d*/  .byte 0x17
/*0x7d9e*/  .byte 0x0a
/*0x7d9f*/  .byte 0x07
/*0x7da0*/  .byte 0x0d
/*0x7da1*/  .byte 0x11
/*0x7da2*/  .byte 0x0e
/*0x7da3*/  .byte 0x08
/*0x7da4*/  .byte 0x0f
/*0x7da5*/  .byte 0x0c
/*0x7da6*/  .byte 0x33
/*0x7da7*/  .byte 0x12
/*0x7da8*/  .byte 0x11
/*0x7da9*/  .byte 0x0e
/*0x7daa*/  .byte 0x00
/*0x7dab*/  .byte 0x01
/*0x7dac*/  .byte 0x02
/*0x7dad*/  .byte 0x02
/*0x7dae*/  .byte 0x01
/*0x7daf*/  .byte 0x07
/*0x7db0*/  .byte 0x02
/*0x7db1*/  .byte 0x00
/*0x7db2*/  .byte 0x01
/*0x7db3*/  .byte 0x05
/*0x7db4*/  .byte 0x02
/*0x7db5*/  .byte 0x04
/*0x7db6*/  .byte 0x07
/*0x7db7*/  .byte 0x01
/*0x7db8*/  .byte 0x00
/*0x7db9*/  .byte 0x01
/*0x7dba*/  .byte 0x05
/*0x7dbb*/  .byte 0x02
/*0x7dbc*/  .byte 0x05
/*0x7dbd*/  .byte 0x07
/*0x7dbe*/  .byte 0x01
/*0x7dbf*/  .byte 0x00
/*0x7dc0*/  .byte 0x01
/*0x7dc1*/  .byte 0x05
/*0x7dc2*/  .byte 0x02
/*0x7dc3*/  .byte 0x06
/*0x7dc4*/  .byte 0x07
/*0x7dc5*/  .byte 0x01
/*0x7dc6*/  .byte 0x00
/*0x7dc7*/  .byte 0x01
/*0x7dc8*/  .byte 0x05
/*0x7dc9*/  .byte 0x01
/*0x7dca*/  .byte 0x01
/*0x7dcb*/  .byte 0x07
/*0x7dcc*/  .byte 0x01
/*0x7dcd*/  .byte 0x00
/*0x7dce*/  .byte 0x01
/*0x7dcf*/  .byte 0x05
/*0x7dd0*/  .byte 0x00
/*0x7dd1*/  .byte 0x08
/*0x7dd2*/  .byte 0x07
/*0x7dd3*/  .byte 0x00
/*0x7dd4*/  .byte 0x00
/*0x7dd5*/  .byte 0x01
/*0x7dd6*/  .byte 0x05
/*0x7dd7*/  .byte 0x00
/*0x7dd8*/  .byte 0x0e
/*0x7dd9*/  .byte 0x07
/*0x7dda*/  .byte 0x00
/*0x7ddb*/  .byte 0x00
/*0x7ddc*/  .byte 0x01
/*0x7ddd*/  .byte 0x05
/*0x7dde*/  .byte 0x00
/*0x7ddf*/  .byte 0x0f
/*0x7de0*/  .byte 0x07
/*0x7de1*/  .byte 0x00
/*0x7de2*/  .byte 0x00
/*0x7de3*/  .byte 0x01
/*0x7de4*/  .byte 0x05
/*0x7de5*/  .byte 0x02
/*0x7de6*/  .byte 0x03
/*0x7de7*/  .byte 0x00
/*0x7de8*/  .byte 0x00
/*0x7de9*/  .byte 0x00
/*0x7dea*/  .byte 0x01
/*0x7deb*/  .byte 0x05
/*0x7dec*/  .byte 0x00
/*0x7ded*/  .byte 0x00
/*0x7dee*/  .byte 0x13
/*0x7def*/  .byte 0x00
/*0x7df0*/  .byte 0x26
/*0x7df1*/  .byte 0x00
/*0x7df2*/  .byte 0x3a
/*0x7df3*/  .byte 0x00
/*0x7df4*/  .byte 0x4e
/*0x7df5*/  .byte 0x00
/*0x7df6*/  .byte 0x62
/*0x7df7*/  .byte 0x00
/*0x7df8*/  .byte 0x77
/*0x7df9*/  .byte 0x00
/*0x7dfa*/  .byte 0x8c
/*0x7dfb*/  .byte 0x00
/*0x7dfc*/  .byte 0xa1
/*0x7dfd*/  .byte 0x00
/*0x7dfe*/  .byte 0xb7
/*0x7dff*/  .byte 0x00
/*0x7e00*/  .byte 0xcd
/*0x7e01*/  .byte 0x00
/*0x7e02*/  .byte 0xe3
/*0x7e03*/  .byte 0x00
/*0x7e04*/  .byte 0xfa
/*0x7e05*/  .byte 0x00
/*0x7e06*/  .byte 0x11
/*0x7e07*/  .byte 0x01
/*0x7e08*/  .byte 0x28
/*0x7e09*/  .byte 0x01
/*0x7e0a*/  .byte 0x40
/*0x7e0b*/  .byte 0x01
/*0x7e0c*/  .byte 0x58
/*0x7e0d*/  .byte 0x01
/*0x7e0e*/  .byte 0x71
/*0x7e0f*/  .byte 0x01
/*0x7e10*/  .byte 0x8a
/*0x7e11*/  .byte 0x01
/*0x7e12*/  .byte 0xa3
/*0x7e13*/  .byte 0x01
/*0x7e14*/  .byte 0xbd
/*0x7e15*/  .byte 0x01
/*0x7e16*/  .byte 0xd7
/*0x7e17*/  .byte 0x01
/*0x7e18*/  .byte 0xf1
/*0x7e19*/  .byte 0x01
/*0x7e1a*/  .byte 0x0c
/*0x7e1b*/  .byte 0x02
/*0x7e1c*/  .byte 0x28
/*0x7e1d*/  .byte 0x02
/*0x7e1e*/  .byte 0x43
/*0x7e1f*/  .byte 0x02
/*0x7e20*/  .byte 0x60
/*0x7e21*/  .byte 0x02
/*0x7e22*/  .byte 0x7c
/*0x7e23*/  .byte 0x02
/*0x7e24*/  .byte 0x9a
/*0x7e25*/  .byte 0x02
/*0x7e26*/  .byte 0xb7
/*0x7e27*/  .byte 0x02
/*0x7e28*/  .byte 0xd5
/*0x7e29*/  .byte 0x02
/*0x7e2a*/  .byte 0xf4
/*0x7e2b*/  .byte 0x02
/*0x7e2c*/  .byte 0x13
/*0x7e2d*/  .byte 0x03
/*0x7e2e*/  .byte 0x32
/*0x7e2f*/  .byte 0x03
/*0x7e30*/  .byte 0x53
/*0x7e31*/  .byte 0x03
/*0x7e32*/  .byte 0x73
/*0x7e33*/  .byte 0x03
/*0x7e34*/  .byte 0x94
/*0x7e35*/  .byte 0x03
/*0x7e36*/  .byte 0xb6
/*0x7e37*/  .byte 0x03
/*0x7e38*/  .byte 0xd8
/*0x7e39*/  .byte 0x03
/*0x7e3a*/  .byte 0xfb
/*0x7e3b*/  .byte 0x03
/*0x7e3c*/  .byte 0x1e
/*0x7e3d*/  .byte 0x04
/*0x7e3e*/  .byte 0x42
/*0x7e3f*/  .byte 0x04
/*0x7e40*/  .byte 0x66
/*0x7e41*/  .byte 0x04
/*0x7e42*/  .byte 0x8b
/*0x7e43*/  .byte 0x04
/*0x7e44*/  .byte 0xb1
/*0x7e45*/  .byte 0x04
/*0x7e46*/  .byte 0xd7
/*0x7e47*/  .byte 0x04
/*0x7e48*/  .byte 0xfd
/*0x7e49*/  .byte 0x04
/*0x7e4a*/  .byte 0x25
/*0x7e4b*/  .byte 0x05
/*0x7e4c*/  .byte 0x4d
/*0x7e4d*/  .byte 0x05
/*0x7e4e*/  .byte 0x75
/*0x7e4f*/  .byte 0x05
/*0x7e50*/  .byte 0x9f
/*0x7e51*/  .byte 0x05
/*0x7e52*/  .byte 0xc8
/*0x7e53*/  .byte 0x05
/*0x7e54*/  .byte 0xf3
/*0x7e55*/  .byte 0x05
/*0x7e56*/  .byte 0x1e
/*0x7e57*/  .byte 0x06
/*0x7e58*/  .byte 0x4a
/*0x7e59*/  .byte 0x06
/*0x7e5a*/  .byte 0x77
/*0x7e5b*/  .byte 0x06
/*0x7e5c*/  .byte 0xa4
/*0x7e5d*/  .byte 0x06
/*0x7e5e*/  .byte 0xd2
/*0x7e5f*/  .byte 0x06
/*0x7e60*/  .byte 0x01
/*0x7e61*/  .byte 0x07
/*0x7e62*/  .byte 0x31
/*0x7e63*/  .byte 0x07
/*0x7e64*/  .byte 0x61
/*0x7e65*/  .byte 0x07
/*0x7e66*/  .byte 0x92
/*0x7e67*/  .byte 0x07
/*0x7e68*/  .byte 0xc4
/*0x7e69*/  .byte 0x07
/*0x7e6a*/  .byte 0xf6
/*0x7e6b*/  .byte 0x07
/*0x7e6c*/  .byte 0x2a
/*0x7e6d*/  .byte 0x08
/*0x7e6e*/  .byte 0x5e
/*0x7e6f*/  .byte 0x08
/*0x7e70*/  .byte 0x93
/*0x7e71*/  .byte 0x08
/*0x7e72*/  .byte 0xc9
/*0x7e73*/  .byte 0x08
/*0x7e74*/  .byte 0x00
/*0x7e75*/  .byte 0x09
/*0x7e76*/  .byte 0x38
/*0x7e77*/  .byte 0x09
/*0x7e78*/  .byte 0x70
/*0x7e79*/  .byte 0x09
/*0x7e7a*/  .byte 0xaa
/*0x7e7b*/  .byte 0x09
/*0x7e7c*/  .byte 0xe4
/*0x7e7d*/  .byte 0x09
/*0x7e7e*/  .byte 0x1f
/*0x7e7f*/  .byte 0x0a
/*0x7e80*/  .byte 0x5b
/*0x7e81*/  .byte 0x0a
/*0x7e82*/  .byte 0x99
/*0x7e83*/  .byte 0x0a
/*0x7e84*/  .byte 0xd7
/*0x7e85*/  .byte 0x0a
/*0x7e86*/  .byte 0x16
/*0x7e87*/  .byte 0x0b
/*0x7e88*/  .byte 0x56
/*0x7e89*/  .byte 0x0b
/*0x7e8a*/  .byte 0x97
/*0x7e8b*/  .byte 0x0b
/*0x7e8c*/  .byte 0xd9
/*0x7e8d*/  .byte 0x0b
/*0x7e8e*/  .byte 0x1d
/*0x7e8f*/  .byte 0x0c
/*0x7e90*/  .byte 0x61
/*0x7e91*/  .byte 0x0c
/*0x7e92*/  .byte 0xa6
/*0x7e93*/  .byte 0x0c
/*0x7e94*/  .byte 0xed
/*0x7e95*/  .byte 0x0c
/*0x7e96*/  .byte 0x34
/*0x7e97*/  .byte 0x0d
/*0x7e98*/  .byte 0x7d
/*0x7e99*/  .byte 0x0d
/*0x7e9a*/  .byte 0xc7
/*0x7e9b*/  .byte 0x0d
/*0x7e9c*/  .byte 0x12
/*0x7e9d*/  .byte 0x0e
/*0x7e9e*/  .byte 0x5e
/*0x7e9f*/  .byte 0x0e
/*0x7ea0*/  .byte 0xac
/*0x7ea1*/  .byte 0x0e
/*0x7ea2*/  .byte 0xfb
/*0x7ea3*/  .byte 0x0e
/*0x7ea4*/  .byte 0x4b
/*0x7ea5*/  .byte 0x0f
/*0x7ea6*/  .byte 0x9c
/*0x7ea7*/  .byte 0x0f
/*0x7ea8*/  .byte 0xee
/*0x7ea9*/  .byte 0x0f
/*0x7eaa*/  .byte 0x42
/*0x7eab*/  .byte 0x10
/*0x7eac*/  .byte 0x97
/*0x7ead*/  .byte 0x10
/*0x7eae*/  .byte 0xee
/*0x7eaf*/  .byte 0x10
/*0x7eb0*/  .byte 0x46
/*0x7eb1*/  .byte 0x11
/*0x7eb2*/  .byte 0x9f
/*0x7eb3*/  .byte 0x11
/*0x7eb4*/  .byte 0xfa
/*0x7eb5*/  .byte 0x11
/*0x7eb6*/  .byte 0x56
/*0x7eb7*/  .byte 0x12
/*0x7eb8*/  .byte 0xb4
/*0x7eb9*/  .byte 0x12
/*0x7eba*/  .byte 0x13
/*0x7ebb*/  .byte 0x13
/*0x7ebc*/  .byte 0x73
/*0x7ebd*/  .byte 0x13
/*0x7ebe*/  .byte 0xd5
/*0x7ebf*/  .byte 0x13
/*0x7ec0*/  .byte 0x39
/*0x7ec1*/  .byte 0x14
/*0x7ec2*/  .byte 0x9e
/*0x7ec3*/  .byte 0x14
/*0x7ec4*/  .byte 0x05
/*0x7ec5*/  .byte 0x15
/*0x7ec6*/  .byte 0x6e
/*0x7ec7*/  .byte 0x15
/*0x7ec8*/  .byte 0xd8
/*0x7ec9*/  .byte 0x15
/*0x7eca*/  .byte 0x44
/*0x7ecb*/  .byte 0x16
/*0x7ecc*/  .byte 0xb2
/*0x7ecd*/  .byte 0x16
/*0x7ece*/  .byte 0x21
/*0x7ecf*/  .byte 0x17
/*0x7ed0*/  .byte 0x92
/*0x7ed1*/  .byte 0x17
/*0x7ed2*/  .byte 0x05
/*0x7ed3*/  .byte 0x18
/*0x7ed4*/  .byte 0x7a
/*0x7ed5*/  .byte 0x18
/*0x7ed6*/  .byte 0xf0
/*0x7ed7*/  .byte 0x18
/*0x7ed8*/  .byte 0x69
/*0x7ed9*/  .byte 0x19
/*0x7eda*/  .byte 0xe3
/*0x7edb*/  .byte 0x19
/*0x7edc*/  .byte 0x5f
/*0x7edd*/  .byte 0x1a
/*0x7ede*/  .byte 0xde
/*0x7edf*/  .byte 0x1a
/*0x7ee0*/  .byte 0x5e
/*0x7ee1*/  .byte 0x1b
/*0x7ee2*/  .byte 0xe0
/*0x7ee3*/  .byte 0x1b
/*0x7ee4*/  .byte 0x65
/*0x7ee5*/  .byte 0x1c
/*0x7ee6*/  .byte 0xeb
/*0x7ee7*/  .byte 0x1c
/*0x7ee8*/  .byte 0x74
/*0x7ee9*/  .byte 0x1d
/*0x7eea*/  .byte 0xff
/*0x7eeb*/  .byte 0x1d
/*0x7eec*/  .byte 0x8c
/*0x7eed*/  .byte 0x1e
/*0x7eee*/  .byte 0x1b
/*0x7eef*/  .byte 0x1f
/*0x7ef0*/  .byte 0xac
/*0x7ef1*/  .byte 0x1f
/*0x7ef2*/  .byte 0x40
/*0x7ef3*/  .byte 0x20
/*0x7ef4*/  .byte 0xd6
/*0x7ef5*/  .byte 0x20
/*0x7ef6*/  .byte 0x6f
/*0x7ef7*/  .byte 0x21
/*0x7ef8*/  .byte 0x0a
/*0x7ef9*/  .byte 0x22
/*0x7efa*/  .byte 0xa8
/*0x7efb*/  .byte 0x22
/*0x7efc*/  .byte 0x48
/*0x7efd*/  .byte 0x23
/*0x7efe*/  .byte 0xea
/*0x7eff*/  .byte 0x23
/*0x7f00*/  .byte 0x8f
/*0x7f01*/  .byte 0x24
/*0x7f02*/  .byte 0x37
/*0x7f03*/  .byte 0x25
/*0x7f04*/  .byte 0xe1
/*0x7f05*/  .byte 0x25
/*0x7f06*/  .byte 0x8e
/*0x7f07*/  .byte 0x26
/*0x7f08*/  .byte 0x3e
/*0x7f09*/  .byte 0x27
/*0x7f0a*/  .byte 0xf1
/*0x7f0b*/  .byte 0x27
/*0x7f0c*/  .byte 0xa6
/*0x7f0d*/  .byte 0x28
/*0x7f0e*/  .byte 0x5f
/*0x7f0f*/  .byte 0x29
/*0x7f10*/  .byte 0x1a
/*0x7f11*/  .byte 0x2a
/*0x7f12*/  .byte 0xd8
/*0x7f13*/  .byte 0x2a
/*0x7f14*/  .byte 0x99
/*0x7f15*/  .byte 0x2b
/*0x7f16*/  .byte 0x5e
/*0x7f17*/  .byte 0x2c
/*0x7f18*/  .byte 0x25
/*0x7f19*/  .byte 0x2d
/*0x7f1a*/  .byte 0xf0
/*0x7f1b*/  .byte 0x2d
/*0x7f1c*/  .byte 0xbe
/*0x7f1d*/  .byte 0x2e
/*0x7f1e*/  .byte 0x8f
/*0x7f1f*/  .byte 0x2f
/*0x7f20*/  .byte 0x63
/*0x7f21*/  .byte 0x30
/*0x7f22*/  .byte 0x3b
/*0x7f23*/  .byte 0x31
/*0x7f24*/  .byte 0x16
/*0x7f25*/  .byte 0x32
/*0x7f26*/  .byte 0xf5
/*0x7f27*/  .byte 0x32
/*0x7f28*/  .byte 0xd7
/*0x7f29*/  .byte 0x33
/*0x7f2a*/  .byte 0xbd
/*0x7f2b*/  .byte 0x34
/*0x7f2c*/  .byte 0xa7
/*0x7f2d*/  .byte 0x35
/*0x7f2e*/  .byte 0x94
/*0x7f2f*/  .byte 0x36
/*0x7f30*/  .byte 0x85
/*0x7f31*/  .byte 0x37
/*0x7f32*/  .byte 0x7a
/*0x7f33*/  .byte 0x38
/*0x7f34*/  .byte 0x72
/*0x7f35*/  .byte 0x39
/*0x7f36*/  .byte 0x6f
/*0x7f37*/  .byte 0x3a
/*0x7f38*/  .byte 0x70
/*0x7f39*/  .byte 0x3b
/*0x7f3a*/  .byte 0x74
/*0x7f3b*/  .byte 0x3c
/*0x7f3c*/  .byte 0x7d
/*0x7f3d*/  .byte 0x3d
/*0x7f3e*/  .byte 0x8a
/*0x7f3f*/  .byte 0x3e
/*0x7f40*/  .byte 0x9c
/*0x7f41*/  .byte 0x3f
/*0x7f42*/  .byte 0xb1
/*0x7f43*/  .byte 0x40
/*0x7f44*/  .byte 0xcb
/*0x7f45*/  .byte 0x41
/*0x7f46*/  .byte 0xea
/*0x7f47*/  .byte 0x42
/*0x7f48*/  .byte 0x0d
/*0x7f49*/  .byte 0x44
/*0x7f4a*/  .byte 0x35
/*0x7f4b*/  .byte 0x45
/*0x7f4c*/  .byte 0x61
/*0x7f4d*/  .byte 0x46
/*0x7f4e*/  .byte 0x93
/*0x7f4f*/  .byte 0x47
/*0x7f50*/  .byte 0xc9
/*0x7f51*/  .byte 0x48
/*0x7f52*/  .byte 0x04
/*0x7f53*/  .byte 0x4a
/*0x7f54*/  .byte 0x44
/*0x7f55*/  .byte 0x4b
/*0x7f56*/  .byte 0x89
/*0x7f57*/  .byte 0x4c
/*0x7f58*/  .byte 0xd3
/*0x7f59*/  .byte 0x4d
/*0x7f5a*/  .byte 0x22
/*0x7f5b*/  .byte 0x4f
/*0x7f5c*/  .byte 0x77
/*0x7f5d*/  .byte 0x50
/*0x7f5e*/  .byte 0xd2
/*0x7f5f*/  .byte 0x51
/*0x7f60*/  .byte 0x31
/*0x7f61*/  .byte 0x53
/*0x7f62*/  .byte 0x97
/*0x7f63*/  .byte 0x54
/*0x7f64*/  .byte 0x02
/*0x7f65*/  .byte 0x56
/*0x7f66*/  .byte 0x72
/*0x7f67*/  .byte 0x57
/*0x7f68*/  .byte 0xe9
/*0x7f69*/  .byte 0x58
/*0x7f6a*/  .byte 0x66
/*0x7f6b*/  .byte 0x5a
/*0x7f6c*/  .byte 0xe8
/*0x7f6d*/  .byte 0x5b
/*0x7f6e*/  .byte 0x71
/*0x7f6f*/  .byte 0x5d
/*0x7f70*/  .byte 0x00
/*0x7f71*/  .byte 0x5f
/*0x7f72*/  .byte 0x95
/*0x7f73*/  .byte 0x60
/*0x7f74*/  .byte 0x31
/*0x7f75*/  .byte 0x62
/*0x7f76*/  .byte 0xd3
/*0x7f77*/  .byte 0x63
/*0x7f78*/  .byte 0x7c
/*0x7f79*/  .byte 0x65
/*0x7f7a*/  .byte 0x2c
/*0x7f7b*/  .byte 0x67
/*0x7f7c*/  .byte 0xe3
/*0x7f7d*/  .byte 0x68
/*0x7f7e*/  .byte 0xa0
/*0x7f7f*/  .byte 0x6a
/*0x7f80*/  .byte 0x65
/*0x7f81*/  .byte 0x6c
/*0x7f82*/  .byte 0x31
/*0x7f83*/  .byte 0x6e
/*0x7f84*/  .byte 0x04
/*0x7f85*/  .byte 0x70
/*0x7f86*/  .byte 0xde
/*0x7f87*/  .byte 0x71
/*0x7f88*/  .byte 0xc0
/*0x7f89*/  .byte 0x73
/*0x7f8a*/  .byte 0xaa
/*0x7f8b*/  .byte 0x75
/*0x7f8c*/  .byte 0x9c
/*0x7f8d*/  .byte 0x77
/*0x7f8e*/  .byte 0x95
/*0x7f8f*/  .byte 0x79
/*0x7f90*/  .byte 0x96
/*0x7f91*/  .byte 0x7b
/*0x7f92*/  .byte 0xa0
/*0x7f93*/  .byte 0x7d
/*0x7f94*/  .byte 0xb2
/*0x7f95*/  .byte 0x7f
/*0x7f96*/  .byte 0xcc
/*0x7f97*/  .byte 0x81
/*0x7f98*/  .byte 0xef
/*0x7f99*/  .byte 0x83
/*0x7f9a*/  .byte 0x1a
/*0x7f9b*/  .byte 0x86
/*0x7f9c*/  .byte 0x4f
/*0x7f9d*/  .byte 0x88
/*0x7f9e*/  .byte 0x8c
/*0x7f9f*/  .byte 0x8a
/*0x7fa0*/  .byte 0xd3
/*0x7fa1*/  .byte 0x8c
/*0x7fa2*/  .byte 0x22
/*0x7fa3*/  .byte 0x8f
/*0x7fa4*/  .byte 0x7b
/*0x7fa5*/  .byte 0x91
/*0x7fa6*/  .byte 0xde
/*0x7fa7*/  .byte 0x93
/*0x7fa8*/  .byte 0x4a
/*0x7fa9*/  .byte 0x96
/*0x7faa*/  .byte 0xc0
/*0x7fab*/  .byte 0x98
/*0x7fac*/  .byte 0x40
/*0x7fad*/  .byte 0x9b
/*0x7fae*/  .byte 0xcb
/*0x7faf*/  .byte 0x9d
/*0x7fb0*/  .byte 0x5f
/*0x7fb1*/  .byte 0xa0
/*0x7fb2*/  .byte 0xff
/*0x7fb3*/  .byte 0xa2
/*0x7fb4*/  .byte 0xa8
/*0x7fb5*/  .byte 0xa5
/*0x7fb6*/  .byte 0x5d
/*0x7fb7*/  .byte 0xa8
/*0x7fb8*/  .byte 0x1d
/*0x7fb9*/  .byte 0xab
/*0x7fba*/  .byte 0xe8
/*0x7fbb*/  .byte 0xad
/*0x7fbc*/  .byte 0xbe
/*0x7fbd*/  .byte 0xb0
/*0x7fbe*/  .byte 0x9f
/*0x7fbf*/  .byte 0xb3
/*0x7fc0*/  .byte 0x8d
/*0x7fc1*/  .byte 0xb6
/*0x7fc2*/  .byte 0x86
/*0x7fc3*/  .byte 0xb9
/*0x7fc4*/  .byte 0x8c
/*0x7fc5*/  .byte 0xbc
/*0x7fc6*/  .byte 0x9d
/*0x7fc7*/  .byte 0xbf
/*0x7fc8*/  .byte 0xbc
/*0x7fc9*/  .byte 0xc2
/*0x7fca*/  .byte 0xe6
/*0x7fcb*/  .byte 0xc5
/*0x7fcc*/  .byte 0x1e
/*0x7fcd*/  .byte 0xc9
/*0x7fce*/  .byte 0x63
/*0x7fcf*/  .byte 0xcc
/*0x7fd0*/  .byte 0xb5
/*0x7fd1*/  .byte 0xcf
/*0x7fd2*/  .byte 0x15
/*0x7fd3*/  .byte 0xd3
/*0x7fd4*/  .byte 0x82
/*0x7fd5*/  .byte 0xd6
/*0x7fd6*/  .byte 0xfd
/*0x7fd7*/  .byte 0xd9
/*0x7fd8*/  .byte 0x87
/*0x7fd9*/  .byte 0xdd
/*0x7fda*/  .byte 0x1f
/*0x7fdb*/  .byte 0xe1
/*0x7fdc*/  .byte 0xc5
/*0x7fdd*/  .byte 0xe4
/*0x7fde*/  .byte 0x7a
/*0x7fdf*/  .byte 0xe8
/*0x7fe0*/  .byte 0x3f
/*0x7fe1*/  .byte 0xec
/*0x7fe2*/  .byte 0x12
/*0x7fe3*/  .byte 0xf0
/*0x7fe4*/  .byte 0xf5
/*0x7fe5*/  .byte 0xf3
/*0x7fe6*/  .byte 0xe9
/*0x7fe7*/  .byte 0xf7
/*0x7fe8*/  .byte 0xec
/*0x7fe9*/  .byte 0xfb
/*0x7fea*/  .byte 0xff
/*0x7feb*/  .byte 0xff
/*0x7fec*/  .byte 0x00
/*0x7fed*/  .byte 0x08
/*0x7fee*/  .byte 0x10
/*0x7fef*/  .byte 0x18
/*0x7ff0*/  .byte 0x20
/*0x7ff1*/  .byte 0x28
/*0x7ff2*/  .byte 0x30
/*0x7ff3*/  .byte 0x38
/*0x7ff4*/  .byte 0xff
/*0x7ff5*/  .byte 0x48
/*0x7ff6*/  .byte 0x50
/*0x7ff7*/  .byte 0x58
/*0x7ff8*/  .byte 0x00
/*0x7ff9*/  .byte 0x00
/*0x7ffa*/  .byte 0x00
/*0x7ffb*/  .byte 0x00
/*0x7ffc*/  .byte 0x01
/*0x7ffd*/  .byte 0x09
/*0x7ffe*/  .byte 0x11
/*0x7fff*/  .byte 0x19
/*0x8000*/  .byte 0x21
/*0x8001*/  .byte 0x29
/*0x8002*/  .byte 0x31
/*0x8003*/  .byte 0x39
/*0x8004*/  .byte 0x41
/*0x8005*/  .byte 0x49
/*0x8006*/  .byte 0x51
/*0x8007*/  .byte 0x59
/*0x8008*/  .byte 0x00
/*0x8009*/  .byte 0x00
/*0x800a*/  .byte 0x00
/*0x800b*/  .byte 0x00
/*0x800c*/  .byte 0x02
/*0x800d*/  .byte 0x0a
/*0x800e*/  .byte 0x12
/*0x800f*/  .byte 0x1a
/*0x8010*/  .byte 0x22
/*0x8011*/  .byte 0x2a
/*0x8012*/  .byte 0x32
/*0x8013*/  .byte 0x3a
/*0x8014*/  .byte 0x42
/*0x8015*/  .byte 0x4a
/*0x8016*/  .byte 0x52
/*0x8017*/  .byte 0x5a
/*0x8018*/  .byte 0x00
/*0x8019*/  .byte 0x00
/*0x801a*/  .byte 0x00
/*0x801b*/  .byte 0x00
/*0x801c*/  .byte 0x03
/*0x801d*/  .byte 0x0b
/*0x801e*/  .byte 0x13
/*0x801f*/  .byte 0x1b
/*0x8020*/  .byte 0x23
/*0x8021*/  .byte 0x2b
/*0x8022*/  .byte 0x33
/*0x8023*/  .byte 0x3b
/*0x8024*/  .byte 0x43
/*0x8025*/  .byte 0x4b
/*0x8026*/  .byte 0x53
/*0x8027*/  .byte 0xff
/*0x8028*/  .byte 0x00
/*0x8029*/  .byte 0x00
/*0x802a*/  .byte 0x00
/*0x802b*/  .byte 0x00
/*0x802c*/  .byte 0x04
/*0x802d*/  .byte 0x0c
/*0x802e*/  .byte 0x14
/*0x802f*/  .byte 0x1c
/*0x8030*/  .byte 0x24
/*0x8031*/  .byte 0x2c
/*0x8032*/  .byte 0x34
/*0x8033*/  .byte 0x3c
/*0x8034*/  .byte 0x44
/*0x8035*/  .byte 0x4c
/*0x8036*/  .byte 0x54
/*0x8037*/  .byte 0xff
/*0x8038*/  .byte 0x00
/*0x8039*/  .byte 0x00
/*0x803a*/  .byte 0x00
/*0x803b*/  .byte 0x00
/*0x803c*/  .byte 0x05
/*0x803d*/  .byte 0x0d
/*0x803e*/  .byte 0x15
/*0x803f*/  .byte 0x1d
/*0x8040*/  .byte 0x25
/*0x8041*/  .byte 0x2d
/*0x8042*/  .byte 0x35
/*0x8043*/  .byte 0x3d
/*0x8044*/  .byte 0x45
/*0x8045*/  .byte 0x4d
/*0x8046*/  .byte 0x55
/*0x8047*/  .byte 0xff
/*0x8048*/  .byte 0x00
/*0x8049*/  .byte 0x00
/*0x804a*/  .byte 0x00
/*0x804b*/  .byte 0x00
/*0x804c*/  .byte 0x06
/*0x804d*/  .byte 0x0e
/*0x804e*/  .byte 0x16
/*0x804f*/  .byte 0x1e
/*0x8050*/  .byte 0x26
/*0x8051*/  .byte 0x2e
/*0x8052*/  .byte 0x36
/*0x8053*/  .byte 0x3e
/*0x8054*/  .byte 0x46
/*0x8055*/  .byte 0x4e
/*0x8056*/  .byte 0x56
/*0x8057*/  .byte 0xff
/*0x8058*/  .byte 0x00
/*0x8059*/  .byte 0x00
/*0x805a*/  .byte 0x00
/*0x805b*/  .byte 0x00
/*0x805c*/  .byte 0x07
/*0x805d*/  .byte 0x0f
/*0x805e*/  .byte 0x17
/*0x805f*/  .byte 0x1f
/*0x8060*/  .byte 0x27
/*0x8061*/  .byte 0x2f
/*0x8062*/  .byte 0x37
/*0x8063*/  .byte 0x3f
/*0x8064*/  .byte 0xff
/*0x8065*/  .byte 0xff
/*0x8066*/  .byte 0x57
/*0x8067*/  .byte 0xff
/*0x8068*/  .byte 0x00
/*0x8069*/  .byte 0x00
/*0x806a*/  .byte 0x00
/*0x806b*/  .byte 0x00
/*0x806c*/  .byte 0x02
/*0x806d*/  .byte 0x00
/*0x806e*/  .byte 0x07
/*0x806f*/  .byte 0x01
/*0x8070*/  .byte 0x00
/*0x8071*/  .byte 0x04
/*0x8072*/  .byte 0x05
/*0x8073*/  .byte 0x00
/*0x8074*/  .byte 0x09
/*0x8075*/  .byte 0x19
/*0x8076*/  .byte 0x20
/*0x8077*/  .byte 0x19
/*0x8078*/  .byte 0x08
/*0x8079*/  .byte 0x00
/*0x807a*/  .byte 0x01
/*0x807b*/  .byte 0x80
/*0x807c*/  .byte 0x12
/*0x807d*/  .byte 0x02
/*0x807e*/  .byte 0x00
/*0x807f*/  .byte 0x00
/*0x8080*/  .byte 0x88
/*0x8081*/  .byte 0x20
/*0x8082*/  .byte 0x00
/*0x8083*/  .byte 0x91
/*0x8084*/  .byte 0x00
/*0x8085*/  .byte 0x00
/*0x8086*/  .byte 0x00
/*0x8087*/  .byte 0x00
/*0x8088*/  .byte 0x90
/*0x8089*/  .byte 0x00
/*0x808a*/  .byte 0x01
/*0x808b*/  .byte 0x92
/*0x808c*/  .byte 0x00
/*0x808d*/  .byte 0x00
/*0x808e*/  .byte 0x00
/*0x808f*/  .byte 0x00
/*0x8090*/  .byte 0xd0
/*0x8091*/  .byte 0x00
/*0x8092*/  .byte 0x01
/*0x8093*/  .byte 0x93
/*0x8094*/  .byte 0x00
/*0x8095*/  .byte 0x00
/*0x8096*/  .byte 0x00
/*0x8097*/  .byte 0x00
/*0x8098*/  .byte 0x10
/*0x8099*/  .byte 0x01
/*0x809a*/  .byte 0x01
/*0x809b*/  .byte 0x84
/*0x809c*/  .byte 0x02
/*0x809d*/  .byte 0x00
/*0x809e*/  .byte 0x00
/*0x809f*/  .byte 0x00
/*0x80a0*/  .byte 0x50
/*0x80a1*/  .byte 0x21
/*0x80a2*/  .byte 0x00
/*0x80a3*/  .byte 0x85
/*0x80a4*/  .byte 0x00
/*0x80a5*/  .byte 0x00
/*0x80a6*/  .byte 0x00
/*0x80a7*/  .byte 0x00
/*0x80a8*/  .byte 0x00
/*0x80a9*/  .byte 0x00
/*0x80aa*/  .byte 0x00
/*0x80ab*/  .byte 0x00
/*0x80ac*/  .byte 0x00
/*0x80ad*/  .byte 0x00
/*0x80ae*/  .byte 0x00
/*0x80af*/  .byte 0x00
/*0x80b0*/  .byte 0x00
/*0x80b1*/  .byte 0x00
/*0x80b2*/  .byte 0x00
/*0x80b3*/  .byte 0x00
/*0x80b4*/  .byte 0x00
/*0x80b5*/  .byte 0x00
/*0x80b6*/  .byte 0x00
/*0x80b7*/  .byte 0x00
/*0x80b8*/  .byte 0x05
/*0x80b9*/  .byte 0x01
/*0x80ba*/  .byte 0x09
/*0x80bb*/  .byte 0x06
/*0x80bc*/  .byte 0xa1
/*0x80bd*/  .byte 0x01
/*0x80be*/  .byte 0x05
/*0x80bf*/  .byte 0x07
/*0x80c0*/  .byte 0x19
/*0x80c1*/  .byte 0xe0
/*0x80c2*/  .byte 0x29
/*0x80c3*/  .byte 0xe7
/*0x80c4*/  .byte 0x15
/*0x80c5*/  .byte 0x00
/*0x80c6*/  .byte 0x25
/*0x80c7*/  .byte 0x01
/*0x80c8*/  .byte 0x75
/*0x80c9*/  .byte 0x01
/*0x80ca*/  .byte 0x95
/*0x80cb*/  .byte 0x08
/*0x80cc*/  .byte 0x81
/*0x80cd*/  .byte 0x02
/*0x80ce*/  .byte 0x95
/*0x80cf*/  .byte 0x01
/*0x80d0*/  .byte 0x75
/*0x80d1*/  .byte 0x08
/*0x80d2*/  .byte 0x81
/*0x80d3*/  .byte 0x03
/*0x80d4*/  .byte 0x95
/*0x80d5*/  .byte 0x03
/*0x80d6*/  .byte 0x75
/*0x80d7*/  .byte 0x01
/*0x80d8*/  .byte 0x05
/*0x80d9*/  .byte 0x08
/*0x80da*/  .byte 0x19
/*0x80db*/  .byte 0x01
/*0x80dc*/  .byte 0x29
/*0x80dd*/  .byte 0x03
/*0x80de*/  .byte 0x91
/*0x80df*/  .byte 0x02
/*0x80e0*/  .byte 0x95
/*0x80e1*/  .byte 0x01
/*0x80e2*/  .byte 0x75
/*0x80e3*/  .byte 0x05
/*0x80e4*/  .byte 0x91
/*0x80e5*/  .byte 0x03
/*0x80e6*/  .byte 0x95
/*0x80e7*/  .byte 0x06
/*0x80e8*/  .byte 0x75
/*0x80e9*/  .byte 0x08
/*0x80ea*/  .byte 0x15
/*0x80eb*/  .byte 0x00
/*0x80ec*/  .byte 0x26
/*0x80ed*/  .byte 0xa4
/*0x80ee*/  .byte 0x00
/*0x80ef*/  .byte 0x05
/*0x80f0*/  .byte 0x07
/*0x80f1*/  .byte 0x19
/*0x80f2*/  .byte 0x00
/*0x80f3*/  .byte 0x29
/*0x80f4*/  .byte 0xa4
/*0x80f5*/  .byte 0x81
/*0x80f6*/  .byte 0x00
/*0x80f7*/  .byte 0xc0
/*0x80f8*/  .byte 0x06
/*0x80f9*/  .byte 0x00
/*0x80fa*/  .byte 0xff
/*0x80fb*/  .byte 0x09
/*0x80fc*/  .byte 0x01
/*0x80fd*/  .byte 0xa1
/*0x80fe*/  .byte 0x01
/*0x80ff*/  .byte 0x09
/*0x8100*/  .byte 0x02
/*0x8101*/  .byte 0x15
/*0x8102*/  .byte 0x00
/*0x8103*/  .byte 0x26
/*0x8104*/  .byte 0xff
/*0x8105*/  .byte 0x00
/*0x8106*/  .byte 0x75
/*0x8107*/  .byte 0x08
/*0x8108*/  .byte 0x95
/*0x8109*/  .byte 0x40
/*0x810a*/  .byte 0x81
/*0x810b*/  .byte 0x02
/*0x810c*/  .byte 0x09
/*0x810d*/  .byte 0x03
/*0x810e*/  .byte 0x15
/*0x810f*/  .byte 0x00
/*0x8110*/  .byte 0x26
/*0x8111*/  .byte 0xff
/*0x8112*/  .byte 0x00
/*0x8113*/  .byte 0x75
/*0x8114*/  .byte 0x08
/*0x8115*/  .byte 0x95
/*0x8116*/  .byte 0x40
/*0x8117*/  .byte 0x91
/*0x8118*/  .byte 0x02
/*0x8119*/  .byte 0xc0
/*0x811a*/  .byte 0x00
/*0x811b*/  .byte 0x00
/*0x811c*/  .byte 0x05
/*0x811d*/  .byte 0x01
/*0x811e*/  .byte 0x09
/*0x811f*/  .byte 0x80
/*0x8120*/  .byte 0xa1
/*0x8121*/  .byte 0x01
/*0x8122*/  .byte 0x85
/*0x8123*/  .byte 0x01
/*0x8124*/  .byte 0x19
/*0x8125*/  .byte 0x81
/*0x8126*/  .byte 0x29
/*0x8127*/  .byte 0x83
/*0x8128*/  .byte 0x15
/*0x8129*/  .byte 0x00
/*0x812a*/  .byte 0x25
/*0x812b*/  .byte 0x01
/*0x812c*/  .byte 0x95
/*0x812d*/  .byte 0x03
/*0x812e*/  .byte 0x75
/*0x812f*/  .byte 0x01
/*0x8130*/  .byte 0x81
/*0x8131*/  .byte 0x02
/*0x8132*/  .byte 0x95
/*0x8133*/  .byte 0x01
/*0x8134*/  .byte 0x75
/*0x8135*/  .byte 0x05
/*0x8136*/  .byte 0x81
/*0x8137*/  .byte 0x01
/*0x8138*/  .byte 0xc0
/*0x8139*/  .byte 0x05
/*0x813a*/  .byte 0x0c
/*0x813b*/  .byte 0x09
/*0x813c*/  .byte 0x01
/*0x813d*/  .byte 0xa1
/*0x813e*/  .byte 0x01
/*0x813f*/  .byte 0x85
/*0x8140*/  .byte 0x02
/*0x8141*/  .byte 0x15
/*0x8142*/  .byte 0x00
/*0x8143*/  .byte 0x25
/*0x8144*/  .byte 0x01
/*0x8145*/  .byte 0x95
/*0x8146*/  .byte 0x12
/*0x8147*/  .byte 0x75
/*0x8148*/  .byte 0x01
/*0x8149*/  .byte 0x0a
/*0x814a*/  .byte 0x83
/*0x814b*/  .byte 0x01
/*0x814c*/  .byte 0x0a
/*0x814d*/  .byte 0x8a
/*0x814e*/  .byte 0x01
/*0x814f*/  .byte 0x0a
/*0x8150*/  .byte 0x92
/*0x8151*/  .byte 0x01
/*0x8152*/  .byte 0x0a
/*0x8153*/  .byte 0x94
/*0x8154*/  .byte 0x01
/*0x8155*/  .byte 0x09
/*0x8156*/  .byte 0xcd
/*0x8157*/  .byte 0x09
/*0x8158*/  .byte 0xb7
/*0x8159*/  .byte 0x09
/*0x815a*/  .byte 0xb6
/*0x815b*/  .byte 0x09
/*0x815c*/  .byte 0xb5
/*0x815d*/  .byte 0x09
/*0x815e*/  .byte 0xe2
/*0x815f*/  .byte 0x09
/*0x8160*/  .byte 0xea
/*0x8161*/  .byte 0x09
/*0x8162*/  .byte 0xe9
/*0x8163*/  .byte 0x0a
/*0x8164*/  .byte 0x21
/*0x8165*/  .byte 0x02
/*0x8166*/  .byte 0x0a
/*0x8167*/  .byte 0x23
/*0x8168*/  .byte 0x02
/*0x8169*/  .byte 0x0a
/*0x816a*/  .byte 0x24
/*0x816b*/  .byte 0x02
/*0x816c*/  .byte 0x0a
/*0x816d*/  .byte 0x25
/*0x816e*/  .byte 0x02
/*0x816f*/  .byte 0x0a
/*0x8170*/  .byte 0x26
/*0x8171*/  .byte 0x02
/*0x8172*/  .byte 0x0a
/*0x8173*/  .byte 0x27
/*0x8174*/  .byte 0x02
/*0x8175*/  .byte 0x0a
/*0x8176*/  .byte 0x2a
/*0x8177*/  .byte 0x02
/*0x8178*/  .byte 0x81
/*0x8179*/  .byte 0x02
/*0x817a*/  .byte 0x95
/*0x817b*/  .byte 0x01
/*0x817c*/  .byte 0x75
/*0x817d*/  .byte 0x0e
/*0x817e*/  .byte 0x81
/*0x817f*/  .byte 0x01
/*0x8180*/  .byte 0xc0
/*0x8181*/  .byte 0x05
/*0x8182*/  .byte 0x01
/*0x8183*/  .byte 0x09
/*0x8184*/  .byte 0x06
/*0x8185*/  .byte 0xa1
/*0x8186*/  .byte 0x01
/*0x8187*/  .byte 0x85
/*0x8188*/  .byte 0x04
/*0x8189*/  .byte 0x05
/*0x818a*/  .byte 0x07
/*0x818b*/  .byte 0x95
/*0x818c*/  .byte 0x01
/*0x818d*/  .byte 0x75
/*0x818e*/  .byte 0x08
/*0x818f*/  .byte 0x81
/*0x8190*/  .byte 0x03
/*0x8191*/  .byte 0x95
/*0x8192*/  .byte 0xe8
/*0x8193*/  .byte 0x75
/*0x8194*/  .byte 0x01
/*0x8195*/  .byte 0x15
/*0x8196*/  .byte 0x00
/*0x8197*/  .byte 0x25
/*0x8198*/  .byte 0x01
/*0x8199*/  .byte 0x05
/*0x819a*/  .byte 0x07
/*0x819b*/  .byte 0x19
/*0x819c*/  .byte 0x00
/*0x819d*/  .byte 0x29
/*0x819e*/  .byte 0xe7
/*0x819f*/  .byte 0x81
/*0x81a0*/  .byte 0x00
/*0x81a1*/  .byte 0xc0
/*0x81a2*/  .byte 0x00
/*0x81a3*/  .byte 0x00
/*0x81a4*/  .byte 0xf0
/*0x81a5*/  .byte 0x81
/*0x81a6*/  .byte 0x00
/*0x81a7*/  .byte 0x00
/*0x81a8*/  .byte 0xf4
/*0x81a9*/  .byte 0x81
/*0x81aa*/  .byte 0x00
/*0x81ab*/  .byte 0x00
/*0x81ac*/  .byte 0x18
/*0x81ad*/  .byte 0x82
/*0x81ae*/  .byte 0x00
/*0x81af*/  .byte 0x00
/*0x81b0*/  .byte 0x12
/*0x81b1*/  .byte 0x01
/*0x81b2*/  .byte 0x10
/*0x81b3*/  .byte 0x01
/*0x81b4*/  .byte 0x00
/*0x81b5*/  .byte 0x00
/*0x81b6*/  .byte 0x00
/*0x81b7*/  .byte 0x40
/*0x81b8*/  .byte 0xd9
/*0x81b9*/  .byte 0x04
/*0x81ba*/  .byte 0x92
/*0x81bb*/  .byte 0x01
/*0x81bc*/  .byte 0x02
/*0x81bd*/  .byte 0x11
/*0x81be*/  .byte 0x00
/*0x81bf*/  .byte 0x01
/*0x81c0*/  .byte 0x00
/*0x81c1*/  .byte 0x01
/*0x81c2*/  .byte 0x00
/*0x81c3*/  .byte 0x00
/*0x81c4*/  .byte 0x44
/*0x81c5*/  .byte 0x82
/*0x81c6*/  .byte 0x00
/*0x81c7*/  .byte 0x00
/*0x81c8*/  .byte 0xd4
/*0x81c9*/  .byte 0x81
/*0x81ca*/  .byte 0x00
/*0x81cb*/  .byte 0x00
/*0x81cc*/  .byte 0x50
/*0x81cd*/  .byte 0x82
/*0x81ce*/  .byte 0x00
/*0x81cf*/  .byte 0x00
/*0x81d0*/  .byte 0x70
/*0x81d1*/  .byte 0x82
/*0x81d2*/  .byte 0x00
/*0x81d3*/  .byte 0x00
/*0x81d4*/  .byte 0x09
/*0x81d5*/  .byte 0x04
/*0x81d6*/  .byte 0x00
/*0x81d7*/  .byte 0x00
/*0x81d8*/  .byte 0x01
/*0x81d9*/  .byte 0x03
/*0x81da*/  .byte 0x01
/*0x81db*/  .byte 0x01
/*0x81dc*/  .byte 0x00
/*0x81dd*/  .byte 0x09
/*0x81de*/  .byte 0x21
/*0x81df*/  .byte 0x11
/*0x81e0*/  .byte 0x01
/*0x81e1*/  .byte 0x00
/*0x81e2*/  .byte 0x01
/*0x81e3*/  .byte 0x22
/*0x81e4*/  .byte 0x40
/*0x81e5*/  .byte 0x00
/*0x81e6*/  .byte 0x07
/*0x81e7*/  .byte 0x05
/*0x81e8*/  .byte 0x81
/*0x81e9*/  .byte 0x03
/*0x81ea*/  .byte 0x08
/*0x81eb*/  .byte 0x00
/*0x81ec*/  .byte 0x01
/*0x81ed*/  .byte 0x00
/*0x81ee*/  .byte 0x00
/*0x81ef*/  .byte 0x00
/*0x81f0*/  .byte 0x04
/*0x81f1*/  .byte 0x03
/*0x81f2*/  .byte 0x09
/*0x81f3*/  .byte 0x04
/*0x81f4*/  .byte 0x22
/*0x81f5*/  .byte 0x03
/*0x81f6*/  .byte 0x55
/*0x81f7*/  .byte 0x00
/*0x81f8*/  .byte 0x53
/*0x81f9*/  .byte 0x00
/*0x81fa*/  .byte 0x42
/*0x81fb*/  .byte 0x00
/*0x81fc*/  .byte 0x2d
/*0x81fd*/  .byte 0x00
/*0x81fe*/  .byte 0x48
/*0x81ff*/  .byte 0x00
/*0x8200*/  .byte 0x49
/*0x8201*/  .byte 0x00
/*0x8202*/  .byte 0x44
/*0x8203*/  .byte 0x00
/*0x8204*/  .byte 0x20
/*0x8205*/  .byte 0x00
/*0x8206*/  .byte 0x4b
/*0x8207*/  .byte 0x00
/*0x8208*/  .byte 0x65
/*0x8209*/  .byte 0x00
/*0x820a*/  .byte 0x79
/*0x820b*/  .byte 0x00
/*0x820c*/  .byte 0x62
/*0x820d*/  .byte 0x00
/*0x820e*/  .byte 0x6f
/*0x820f*/  .byte 0x00
/*0x8210*/  .byte 0x61
/*0x8211*/  .byte 0x00
/*0x8212*/  .byte 0x72
/*0x8213*/  .byte 0x00
/*0x8214*/  .byte 0x64
/*0x8215*/  .byte 0x00
/*0x8216*/  .byte 0x00
/*0x8217*/  .byte 0x00
/*0x8218*/  .byte 0x2c
/*0x8219*/  .byte 0x03
/*0x821a*/  .byte 0x43
/*0x821b*/  .byte 0x00
/*0x821c*/  .byte 0x59
/*0x821d*/  .byte 0x00
/*0x821e*/  .byte 0x52
/*0x821f*/  .byte 0x00
/*0x8220*/  .byte 0x4d
/*0x8221*/  .byte 0x00
/*0x8222*/  .byte 0x30
/*0x8223*/  .byte 0x00
/*0x8224*/  .byte 0x32
/*0x8225*/  .byte 0x00
/*0x8226*/  .byte 0x70
/*0x8227*/  .byte 0x00
/*0x8228*/  .byte 0x30
/*0x8229*/  .byte 0x00
/*0x822a*/  .byte 0x31
/*0x822b*/  .byte 0x00
/*0x822c*/  .byte 0x39
/*0x822d*/  .byte 0x00
/*0x822e*/  .byte 0x32
/*0x822f*/  .byte 0x00
/*0x8230*/  .byte 0x68
/*0x8231*/  .byte 0x00
/*0x8232*/  .byte 0x30
/*0x8233*/  .byte 0x00
/*0x8234*/  .byte 0x30
/*0x8235*/  .byte 0x00
/*0x8236*/  .byte 0x39
/*0x8237*/  .byte 0x00
/*0x8238*/  .byte 0x36
/*0x8239*/  .byte 0x00
/*0x823a*/  .byte 0x72
/*0x823b*/  .byte 0x00
/*0x823c*/  .byte 0x30
/*0x823d*/  .byte 0x00
/*0x823e*/  .byte 0x32
/*0x823f*/  .byte 0x00
/*0x8240*/  .byte 0x30
/*0x8241*/  .byte 0x00
/*0x8242*/  .byte 0x34
/*0x8243*/  .byte 0x00
/*0x8244*/  .byte 0x09
/*0x8245*/  .byte 0x02
/*0x8246*/  .byte 0x5b
/*0x8247*/  .byte 0x00
/*0x8248*/  .byte 0x03
/*0x8249*/  .byte 0x01
/*0x824a*/  .byte 0x00
/*0x824b*/  .byte 0xa0
/*0x824c*/  .byte 0x32
/*0x824d*/  .byte 0x00
/*0x824e*/  .byte 0x00
/*0x824f*/  .byte 0x00
/*0x8250*/  .byte 0x09
/*0x8251*/  .byte 0x04
/*0x8252*/  .byte 0x01
/*0x8253*/  .byte 0x00
/*0x8254*/  .byte 0x02
/*0x8255*/  .byte 0x03
/*0x8256*/  .byte 0x00
/*0x8257*/  .byte 0x00
/*0x8258*/  .byte 0x02
/*0x8259*/  .byte 0x09
/*0x825a*/  .byte 0x21
/*0x825b*/  .byte 0x11
/*0x825c*/  .byte 0x01
/*0x825d*/  .byte 0x00
/*0x825e*/  .byte 0x01
/*0x825f*/  .byte 0x22
/*0x8260*/  .byte 0x22
/*0x8261*/  .byte 0x00
/*0x8262*/  .byte 0x07
/*0x8263*/  .byte 0x05
/*0x8264*/  .byte 0x83
/*0x8265*/  .byte 0x03
/*0x8266*/  .byte 0x40
/*0x8267*/  .byte 0x00
/*0x8268*/  .byte 0x01
/*0x8269*/  .byte 0x07
/*0x826a*/  .byte 0x05
/*0x826b*/  .byte 0x04
/*0x826c*/  .byte 0x03
/*0x826d*/  .byte 0x40
/*0x826e*/  .byte 0x00
/*0x826f*/  .byte 0x01
/*0x8270*/  .byte 0x09
/*0x8271*/  .byte 0x04
/*0x8272*/  .byte 0x02
/*0x8273*/  .byte 0x00
/*0x8274*/  .byte 0x01
/*0x8275*/  .byte 0x03
/*0x8276*/  .byte 0x00
/*0x8277*/  .byte 0x00
/*0x8278*/  .byte 0x00
/*0x8279*/  .byte 0x09
/*0x827a*/  .byte 0x21
/*0x827b*/  .byte 0x11
/*0x827c*/  .byte 0x01
/*0x827d*/  .byte 0x00
/*0x827e*/  .byte 0x01
/*0x827f*/  .byte 0x22
/*0x8280*/  .byte 0x86
/*0x8281*/  .byte 0x00
/*0x8282*/  .byte 0x07
/*0x8283*/  .byte 0x05
/*0x8284*/  .byte 0x82
/*0x8285*/  .byte 0x03
/*0x8286*/  .byte 0x40
/*0x8287*/  .byte 0x00
/*0x8288*/  .byte 0x01
/*0x8289*/  .byte 0xff
/*0x828a*/  .byte 0xff
/*0x828b*/  .byte 0xff
/*0x828c*/  .byte 0x08
/*0x828d*/  .byte 0x03
/*0x828e*/  .byte 0x01
/*0x828f*/  .byte 0x06
/*0x8290*/  .byte 0x07
/*0x8291*/  .byte 0x00
/*0x8292*/  .byte 0x00
/*0x8293*/  .byte 0x01
/*0x8294*/  .byte 0x05
/*0x8295*/  .byte 0x01
/*0x8296*/  .byte 0x07
/*0x8297*/  .byte 0x07
/*0x8298*/  .byte 0x00
/*0x8299*/  .byte 0x00
/*0x829a*/  .byte 0x05
/*0x829b*/  .byte 0x05
/*0x829c*/  .byte 0x01
/*0x829d*/  .byte 0x08
/*0x829e*/  .byte 0x07
/*0x829f*/  .byte 0x00
/*0x82a0*/  .byte 0x00
/*0x82a1*/  .byte 0x05
/*0x82a2*/  .byte 0x05
/*0x82a3*/  .byte 0x01
/*0x82a4*/  .byte 0x09
/*0x82a5*/  .byte 0x00
/*0x82a6*/  .byte 0x00
/*0x82a7*/  .byte 0x00
/*0x82a8*/  .byte 0x05
/*0x82a9*/  .byte 0x05
/*0x82aa*/  .byte 0x00
/*0x82ab*/  .byte 0x00
/*0x82ac*/  .byte 0xcc
/*0x82ad*/  .byte 0x82
/*0x82ae*/  .byte 0x00
/*0x82af*/  .byte 0x00
/*0x82b0*/  .byte 0x00
/*0x82b1*/  .byte 0x00
/*0x82b2*/  .byte 0x00
/*0x82b3*/  .byte 0x20
/*0x82b4*/  .byte 0x10
/*0x82b5*/  .byte 0x00
/*0x82b6*/  .byte 0x00
/*0x82b7*/  .byte 0x00
/*0x82b8*/  .byte 0x70
/*0x82b9*/  .byte 0x78
/*0x82ba*/  .byte 0x00
/*0x82bb*/  .byte 0x00
/*0x82bc*/  .byte 0xdc
/*0x82bd*/  .byte 0x82
/*0x82be*/  .byte 0x00
/*0x82bf*/  .byte 0x00
/*0x82c0*/  .byte 0x10
/*0x82c1*/  .byte 0x00
/*0x82c2*/  .byte 0x00
/*0x82c3*/  .byte 0x20
/*0x82c4*/  .byte 0xa0
/*0x82c5*/  .byte 0x1b
/*0x82c6*/  .byte 0x00
/*0x82c7*/  .byte 0x00
/*0x82c8*/  .byte 0x7e
/*0x82c9*/  .byte 0x78
/*0x82ca*/  .byte 0x00
/*0x82cb*/  .byte 0x00
/*0x82cc*/  .byte 0x00
/*0x82cd*/  .byte 0xa2
/*0x82ce*/  .byte 0x4a
/*0x82cf*/  .byte 0x04
/*0x82d0*/  .byte 0xff
/*0x82d1*/  .byte 0x07
/*0x82d2*/  .byte 0xff
/*0x82d3*/  .byte 0x01
/*0x82d4*/  .byte 0x9c
/*0x82d5*/  .byte 0x0b
/*0x82d6*/  .byte 0x00
/*0x82d7*/  .byte 0x20
/*0x82d8*/  .byte 0x00
/*0x82d9*/  .byte 0x00
/*0x82da*/  .byte 0x00
/*0x82db*/  .byte 0x00
