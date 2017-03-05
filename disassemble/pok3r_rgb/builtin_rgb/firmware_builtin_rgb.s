.syntax unified
.cpu cortex-m3
.text
.thumb


.byte 0x40
.byte 0x7
.byte 0x0
.byte 0x20
.byte 0x19
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0

.thumb_func
entry:
    ldr.w sp, [pc, #0xc] /* data_2c */ 
    bl sram_init
call_24:
    ldr r0, [pc, #0] /* data_28 */ 
    bx r0 /* main */ 

data_28:
.word main
data_2c:
.word 0x20000740

load_jump_fw:
    ldr r1, [r0]
    mov sp, r1
    ldr r1, [r0, #4]
    bx r1
call_38:
    str r1, [r0, #0xc]
    bx lr

.byte 0xf
.byte 0x1
.byte 0x0
.byte 0x0

memcpy:
    orr.w r3, r0, r1
    lsls r3, r3, #0x1e
    beq jump_50
    b jump_5e
jump_4a:
    ldm r1!, {r3}
    .short 0x1f12 /* subs r2, r2, #4 */ 
    stm r0!, {r3}
jump_50:
    cmp r2, #4
    bhs jump_4a
    b jump_5e
jump_56:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
jump_5e:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_56
    bx lr
mem_set:
    uxtb r2, r2
    b jump_6c
jump_68:
    strb r2, [r0], #1
jump_6c:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    bhs jump_68
    bx lr
mem_zero:
    movs r2, #0
    b mem_set
mem_set2:
    push {r4, lr}
    mov r3, r2
    mov r2, r1
    mov r4, r0
    mov r1, r3
    bl mem_set
    mov r0, r4
    pop {r4, pc}
sram_init:
    ldr r4, [pc, #0x18] /* data_a4 */ 
    ldr r5, [pc, #0x1c] /* data_a8 */ 
    b jump_9c
jump_8e:
    ldr r0, [r4, #0xc]
    orr r3, r0, #1
    ldm.w r4, {r0, r1, r2}
    blx r3
    adds r4, #0x10
jump_9c:
    cmp r4, r5
    blo jump_8e
    bl call_24

data_a4:
.word 0x2230
data_a8:
.word 0x2250

call_ac:
    push {r4, lr}
    movs r2, #0
    cmp r0, #7
    bls jump_ba
    movs r2, #1
    subs r0, #8
    uxtb r0, r0
jump_ba:
    lsls r3, r2, #2
    ldr r2, [pc, #0x14] /* data_d4 */ 
    add r2, r3
    ldr r3, [r2]
    lsls r0, r0, #2
    movs r4, #0xf
    lsls r4, r0
    bics r3, r4
    lsls r1, r0
    orrs r1, r3
    str r1, [r2]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_d4:
.word 0x40022000

bftm_set_counter:
    str r1, [r0, #8]
    bx lr

.byte 0x81
.byte 0x62
.byte 0x70
.byte 0x47

call_e0:
    str r1, [r0, #0x24]
    bx lr

.byte 0x35
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x65
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x27
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x27
.byte 0x1
.byte 0x0
.byte 0x0

bftm_clear:
    ldr r1, [r0, #4]
    bic r1, r1, #1
    str r1, [r0, #4]
    dsb sy
    bx lr
call_102:
    add.w r0, r0, r0, lsl #2
    lsls r0, r0, #2
jump_108:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_108
    bx lr

.byte 0x70
.byte 0x47

jump_110:
    b.w jump_151c

.byte 0xe9
.byte 0x15
.byte 0x0
.byte 0x0

reset:
    ldr r0, [pc, #0xc] /* data_128 */ 
    blx r0 /* call_15f4 */ 
    ldr r0, [pc, #0xc] /* data_12c */ 
    blx r0 /* call_f8c */ 
    ldr r0, [pc, #0xc] /* data_130 */ 
    bx r0 /* entry */ 
generic_fault:
    b generic_fault

.byte 0xfe
.byte 0xe7

data_128:
.word call_15f4
data_12c:
.word call_f8c
data_130:
.word entry

.byte 0x9
.byte 0x48
.byte 0x10
.byte 0xb5
.byte 0x1
.byte 0x68
.byte 0x11
.byte 0xb1
.byte 0x1
.byte 0x68
.byte 0x49
.byte 0x1e
.byte 0x1
.byte 0x60
.byte 0x41
.byte 0x68
.byte 0x11
.byte 0xb1
.byte 0x41
.byte 0x68
.byte 0x49
.byte 0x1e
.byte 0x41
.byte 0x60
.byte 0x4
.byte 0x48
.byte 0xff
.byte 0xf7
.byte 0xd1
.byte 0xff
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0x0
.byte 0xf0
.byte 0x21
.byte 0xbd
.byte 0x0
.byte 0x0
.byte 0xec
.byte 0x2
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x60
.byte 0x7
.byte 0x40
.byte 0x10
.byte 0xb5
.byte 0x13
.byte 0x48
.byte 0xff
.byte 0xf7
.byte 0xc4
.byte 0xff
.byte 0x12
.byte 0x4c
.byte 0x60
.byte 0x68
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x68
.byte 0x89
.byte 0xb2
.byte 0xff
.byte 0xf7
.byte 0xb3
.byte 0xff
.byte 0xa
.byte 0x20
.byte 0xff
.byte 0xf7
.byte 0xc1
.byte 0xff
.byte 0x2
.byte 0x20
.byte 0x1
.byte 0xf0
.byte 0x5f
.byte 0xfb
.byte 0xd
.byte 0x49
.byte 0x4f
.byte 0xf4
.byte 0x0
.byte 0x40
.byte 0x48
.byte 0x62
.byte 0xc
.byte 0x48
.byte 0x61
.byte 0x78
.byte 0x0
.byte 0xeb
.byte 0xc1
.byte 0x0
.byte 0x60
.byte 0x60
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x68
.byte 0x89
.byte 0xb2
.byte 0xff
.byte 0xf7
.byte 0x9d
.byte 0xff
.byte 0x60
.byte 0x78
.byte 0x40
.byte 0x1c
.byte 0x0
.byte 0xf0
.byte 0x7
.byte 0x0
.byte 0x60
.byte 0x70
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0x0
.byte 0xf0
.byte 0xa6
.byte 0xbe
.byte 0x0
.byte 0x70
.byte 0x7
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x74
.byte 0x20
.byte 0x0
.byte 0x0

call_1c4:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_1d0
    orr r1, r1, #4
    b jump_1d4
jump_1d0:
    bic r1, r1, #4
jump_1d4:
    str r1, [r0]
    bx lr
bftm_set_mien:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_1e4
    orr r1, r1, #1
    b jump_1e8
jump_1e4:
    bic r1, r1, #1
jump_1e8:
    str r1, [r0]
    bx lr
call_1ec:
    lsls r0, r0, #3
    lsrs r3, r1, #3
    add.w r0, r0, r3, lsl #2
    ldr r3, [pc, #0x18] /* data_210 */ 
    push {r4, lr}
    add r0, r3
    lsls r1, r1, #0x1d
    ldr r3, [r0]
    lsrs r1, r1, #0x1b
    movs r4, #0xf
    lsls r4, r1
    bics r3, r4
    lsls r2, r1
    orrs r3, r2
    str r3, [r0]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_210:
.word 0x40022020

call_214:
    push.w {r4, r5, r6, r7, r8, lr}
    mov.w r5, #0x4000
    movs r4, #0
    lsls r0, r5, #2
    mov r2, r4
    mov r8, r0
    movs r3, #1
    mov r1, r5
    bl ckcu_clocks_enable
    ldr r6, [pc, #0x94] /* data_2c4 */ 
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl call_3a0
    lsls r7, r5, #1
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl call_3a0
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl call_3c0
    movs r2, #2
    mov r1, r7
    mov r0, r6
    bl call_3c0
    asrs r5, r5, #3
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl call_3a0
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl call_3c0
    movs r2, #1
    movs r1, #0xb
    movs r0, #0
    bl call_1ec
    movs r2, #1
    movs r1, #0xd
    movs r0, #2
    bl call_1ec
    movs r2, #1
    movs r1, #0xe
    movs r0, #2
    bl call_1ec
    movs r2, #1
    movs r1, #0xf
    movs r0, #2
    bl call_1ec
    ldr r0, [pc, #0x30] /* data_2c8 */ 
    ldr r0, [r0, #4]
    lsls r0, r0, #0x15
    bmi jump_2b2
    movs r2, #1
    movs r1, #0xe
    mov r0, r2
    bl call_1ec
    movs r2, #1
    movs r1, #0xf
    mov r0, r2
    bl call_1ec
jump_2b2:
    mov r1, r4
    movs r3, #0
    mov r2, r4
    mov r0, r8
    bl ckcu_clocks_enable
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

data_2c4:
.word 0x400b0000
data_2c8:
.word 0x40088000

ckcu_clocks_enable:
    push {r4, r5, r6, r7, lr}
    ldr r7, [pc, #0x1c] /* data_2ec */ 
    ldr r4, [r7, #0x24]
    ldr r5, [r7, #0x2c]
    ldr r6, [r7, #0x30]
    bics r4, r0
    bics r5, r1
    bics r6, r2
    cbz r3, jump_2e4
    orrs r4, r0
    orrs r5, r1
    orrs r6, r2
jump_2e4:
    str r4, [r7, #0x24]
    str r5, [r7, #0x2c]
    str r6, [r7, #0x30]
    pop {r4, r5, r6, r7, pc}

data_2ec:
.word 0x40088000

ckcu_set_usb_prescaler:
    ldr r1, [pc, #0xc] /* data_300 */ 
    ldr r2, [r1]
    bic r2, r2, #0xc00000
    orr.w r0, r2, r0, lsl #22
    str r0, [r1]
    bx lr

data_300:
.word 0x40088000

flash_page_erase:
    ldr r1, [pc, #8] /* data_310 */ 
    str r0, [r1]
    movs r0, #8
    str r0, [r1, #0xc]
    b.w flash_commit

data_310:
.word 0x40080000

flash_commit:
    ldr r1, [pc, #0x44] /* data_35c */ 
    ldr r0, [pc, #0x40] /* data_358 */ 
    ldr r2, [r1, #0x14]
    orr r2, r2, #2
    str r2, [r1, #0x14]
    movs r2, #0x14
    str r2, [r1, #0x10]
    b jump_330
jump_326:
    ldr r2, [r1, #0x10]
    ubfx r2, r2, #2, #2
    cmp r2, #3
    beq jump_334
jump_330:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_326
jump_334:
    ldr r2, [r1, #0x18]
    ldr r3, [r1, #0x18]
    bic r3, r3, #2
    str r3, [r1, #0x18]
    lsls r1, r2, #0xe
    bpl jump_346
    movs r0, #2
    bx lr
jump_346:
    lsls r1, r2, #0x1e
    bpl jump_34e
    movs r0, #1
    bx lr
jump_34e:
    cbz r0, jump_354
    movs r0, #0
    bx lr
jump_354:
    movs r0, #3
    bx lr

data_358:
.word 0xfffff
data_35c:
.word 0x40080000

jump_360:
    and r2, r0, #7
    push {r4, lr}
    ldr r3, [pc, #0x24] /* data_38c */ 
    lsrs r0, r0, #3
    add.w r4, r3, r2, lsl #6
    lsls r0, r0, #1
    movs r2, #3
    b jump_384
jump_374:
    strh.w r1, [r4, r0, lsl #1]
    adds r0, #0x12
    uxtb r0, r0
    cmp r0, #0x1f
    bls jump_384
    subs r0, #0x1f
    uxtb r0, r0
jump_384:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_374
    pop {r4, pc}

data_38c:
.word 0x200000ec

call_390:
    cmp r2, #0
    ldr r2, [r0]
    beq jump_39a
    orrs r2, r1
    b jump_39c
jump_39a:
    bics r2, r1
jump_39c:
    str r2, [r0]
    bx lr
call_3a0:
    cmp r2, #0
    ldr r2, [r0, #4]
    beq jump_3aa
    orrs r2, r1
    b jump_3ac
jump_3aa:
    bics r2, r1
jump_3ac:
    str r2, [r0, #4]
    bx lr
call_3b0:
    cmp r2, #0
    ldr r2, [r0, #0x10]
    beq jump_3ba
    orrs r2, r1
    b jump_3bc
jump_3ba:
    bics r2, r1
jump_3bc:
    str r2, [r0, #0x10]
    bx lr
call_3c0:
    cbz r2, jump_3d4
    cmp r2, #1
    beq jump_3da
    ldr r2, [r0, #8]
    bics r2, r1
jump_3ca:
    str r2, [r0, #8]
    ldr r2, [r0, #0xc]
    bics r2, r1
    str r2, [r0, #0xc]
    bx lr
jump_3d4:
    ldr r2, [r0, #8]
    orrs r2, r1
    b jump_3ca
jump_3da:
    ldr r2, [r0, #0xc]
    orrs r2, r1
    str r2, [r0, #0xc]
    ldr r2, [r0, #8]
    bics r2, r1
    str r2, [r0, #8]
    bx lr
call_3e8:
    cbz r2, jump_3ee
    str r1, [r0, #0x24]
    bx lr
jump_3ee:
    str r1, [r0, #0x28]
    bx lr
call_3f2:
    lsls r0, r0, #0xe
    sxth r0, r0
    lsrs r1, r0, #0x10
    movs r0, #0x29
    b.w jump_360

.byte 0x70
.byte 0x47
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xd9
.byte 0x4
.byte 0x67
.byte 0x11
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x3
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x41
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x33
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x4b
.byte 0x42
.byte 0x30
.byte 0x31
.byte 0x36
.byte 0x37
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x4
.byte 0x3
.byte 0x9
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x34

call_444:
    cmp r1, #0
    ldr r1, [r0, #0x10]
    beq jump_450
    orr r1, r1, #1
    b jump_454
jump_450:
    bic r1, r1, #1
jump_454:
    str r1, [r0, #0x10]
    bx lr
call_458:
    push {r4, r5, r6, r7, lr}
    ldrb r3, [r1]
    ldr r7, [r0, #0x50]
    add.w r4, r0, r3, lsl #2
    add.w r2, r4, #0x40
    add.w r5, r4, #0x90
    add.w r6, r4, #0xa0
    lsls r3, r3, #1
    movs r4, #1
    lsls r4, r3
    mvns r4, r4
    ands r7, r4
    str r7, [r0, #0x50]
    ldr r7, [r0, #0x54]
    ands r7, r4
    str r7, [r0, #0x54]
    ldr r4, [r0, #0x54]
    ldrb r7, [r1, #5]
    lsls r7, r3
    orrs r4, r7
    str r4, [r0, #0x54]
    ldr r4, [r2]
    movw r7, #0x107
    bics r4, r7
    str r4, [r2]
    ldr r4, [r2]
    ldrh r7, [r1, #2]
    orrs r4, r7
    str r4, [r2]
    ldrh r2, [r1, #6]
    str r2, [r5]
    ldrh r2, [r1, #8]
    str r2, [r6]
    ldr r2, [r0, #0x50]
    ldrb r1, [r1, #4]
    lsls r1, r3
    orrs r2, r1
    str r2, [r0, #0x50]
    pop {r4, r5, r6, r7, pc}
call_4b0:
    ldrh r2, [r1]
    str.w r2, [r0, #0x88]
    ldrh r2, [r1, #2]
    str.w r2, [r0, #0x84]
    ldr r2, [r0]
    bic r2, r2, #0x30000
    str r2, [r0]
    ldr r2, [r0]
    bic r2, r2, #0x1000000
    str r2, [r0]
    ldr r2, [r0]
    ldr r3, [r1, #4]
    orrs r2, r3
    str r2, [r0]
    ldrh r1, [r1, #8]
    str r1, [r0, #0x78]
    bx lr

.byte 0x0
.byte 0x0

call_4dc:
    ldr r2, [pc, #0x70] /* data_550 */ 
    push {r4, lr}
    ldrb r2, [r2, r0]
    cmp r2, #0xe8
    beq jump_54a
    sub.w r0, r2, #0xe0
    movs r4, #1
    ldr r3, [pc, #0x64] /* data_554 */ 
    cmp r0, #7
    bhi jump_50c
    and r0, r2, #7
    mov r2, r3
    lsl.w r0, r4, r0
    ldrb r2, [r2]
    uxtb r0, r0
    cbz r1, jump_506
    orrs r2, r0
    b jump_508
jump_506:
    bics r2, r0
jump_508:
    strb r2, [r3]
    b jump_53c
jump_50c:
    cmp r2, #0x91
    bhi jump_54a
    mov.w r0, #0
    cbz r1, jump_52e
jump_516:
    adds r1, r3, r0
    ldrb r1, [r1, #2]
    cbz r1, jump_528
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #6
    blo jump_516
    movs r0, #0
    pop {r4, pc}
jump_528:
    add r0, r3
    strb r2, [r0, #2]
    b jump_53c
jump_52e:
    adds r1, r3, r0
    ldrb r1, [r1, #2]
    cmp r1, r2
    bne jump_542
    add r0, r3
    movs r1, #0
    strb r1, [r0, #2]
jump_53c:
    ldr r0, [pc, #0x18] /* data_558 */ 
    strb r4, [r0]
    b jump_54a
jump_542:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #6
    blo jump_52e
jump_54a:
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_550:
.word 0x1f84
data_554:
.word 0x20000038
data_558:
.word 0x2000001c

call_55c:
    push {r4, lr}
    ldr r4, [pc, #0x60] /* data_5c0 */ 
    cbz r0, jump_590
    movs r1, #0
    mov r0, r4
    bl bftm_set_mien
    movs r1, #0
    mov r0, r4
    bl call_1c4
    mov r0, r4
    bl bftm_clear
    movs r0, #0x29
    bl nvic_disable_intr
    bl call_6f4
    movs r0, #1
    bl call_c68
    pop.w {r4, lr}
    b.w jump_d90
jump_590:
    movs r0, #0
    bl call_c68
    movs r1, #0
    mov r0, r4
    bl bftm_set_counter
    mov r0, r4
    bl bftm_clear
    movs r1, #1
    mov r0, r4
    bl call_1c4
    movs r1, #1
    mov r0, r4
    bl bftm_set_mien
    ldr r1, [pc, #0xc] /* data_5c4 */ 
    mov.w r0, #0x200
    str.w r0, [r1, #0x100]
    pop {r4, pc}

data_5c0:
.word 0x40076000
data_5c4:
.word 0xe000e004

call_5c8:
    push {r4, lr}
    movs r0, #0
    mov.w r2, #0x10000
    movs r3, #1
    mov r1, r0
    bl ckcu_clocks_enable
    pop.w {r4, lr}
    movw r1, #0x8c9f
    ldr r0, [pc, #4] /* data_5e8 */ 
    b.w call_38

.byte 0x0
.byte 0x0

data_5e8:
.word 0x40076000

call_5ec:
    ldr r1, [pc, #0x70] /* data_660 */ 
    push {r4, lr}
    ldr r0, [r1]
    movw r2, #0xf8ff
    ands r0, r2
    ldr r2, [pc, #0x68] /* data_664 */ 
    orr r0, r0, #0x300
    orrs r0, r2
    str r0, [r1]
    movs r2, #0
    mov r1, r2
    movs r0, #3
    bl call_67e
    mov r1, r0
    movs r0, #0x2b
    bl call_6b0
    movs r2, #0
    mov r1, r2
    movs r0, #3
    bl call_67e
    mov r1, r0
    movs r0, #0x2c
    bl call_6b0
    movs r2, #0
    movs r1, #1
    movs r0, #3
    bl call_67e
    mov r1, r0
    movs r0, #0x2a
    bl call_6b0
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl call_67e
    mov r1, r0
    movs r0, #0x29
    bl call_6b0
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl call_67e
    mov r1, r0
    pop.w {r4, lr}
    movs r0, #0x35
    b.w call_6b0

data_660:
.word 0xe000ed0c
data_664:
.word 0x5fa0000

nvic_disable_intr:
    and r2, r0, #0x1f
    movs r1, #1
    lsls r1, r2
    lsrs r0, r0, #5
    lsls r0, r0, #2
    add.w r0, r0, #-0x1fff2000
    str.w r1, [r0, #0x180]
    bx lr
call_67e:
    push {r4, r5, lr}
    and r3, r0, #7
    rsb.w r4, r3, #7
    cmp r4, #4
    bls jump_68e
    movs r4, #4
jump_68e:
    adds r0, r3, #4
    cmp r0, #7
    bhs jump_698
    movs r3, #0
    b jump_69a
jump_698:
    .short 0x1edb /* subs r3, r3, #3 */ 
jump_69a:
    movs r5, #1
    lsl.w r0, r5, r4
    .short 0x1e40 /* subs r0, r0, #1 */ 
    ands r0, r1
    lsls r0, r3
    lsls r5, r3
    .short 0x1e6d /* subs r5, r5, #1 */ 
    ands r5, r2
    orrs r0, r5
    pop {r4, r5, pc}
call_6b0:
    lsls r1, r1, #0x1c
    lsrs r1, r1, #0x18
    cmp r0, #0
    bge jump_6c6
    and r0, r0, #0xf
    add.w r0, r0, #-0x1fff2000
    strb.w r1, [r0, #0xd14]
    bx lr
jump_6c6:
    add.w r0, r0, #-0x1fff2000
    strb.w r1, [r0, #0x400]
    bx lr
call_6d0:
    push {r4, lr}
    mov.w r2, #0x200
    movs r1, #0
    lsls r0, r2, #9
    movs r3, #1
    bl ckcu_clocks_enable
    movs r2, #1
    pop.w {r4, lr}
    mov r1, r2
    ldr r0, [pc, #4] /* data_6f0 */ 
    b.w call_3b0

.byte 0x0
.byte 0x0

data_6f0:
.word 0x400b4000

call_6f4:
    movs r2, #0
    mov r1, r2
    movs r0, #2
    b.w call_1ec
call_6fe:
    movs r2, #4
    movs r1, #0
    movs r0, #2
    b.w call_1ec
call_708:
    push {r4, r5, r6, lr}
    ldr r1, [pc, #0x34] /* data_740 */ 
    ldr r4, [r1]
    ldr r5, [pc, #0x30] /* data_740 */ 
    adds r5, #0x48
    ldr r3, [r5]
    movs r2, #1
    str r2, [r1]
    movs r2, #0
    str r2, [r5]
    ldr r6, [pc, #0x24] /* data_744 */ 
    str.w r2, [r6, #0x9c]
    str.w r2, [r6, #0x8c]
    str r4, [r1]
    ldr r1, [pc, #0x1c] /* data_748 */ 
    ldr r2, [r1]
    orr r2, r2, #4
    str r2, [r1]
    cbz r0, jump_73a
    wfi 
jump_736:
    str r3, [r5]
    pop {r4, r5, r6, pc}
jump_73a:
    wfe 
    b jump_736

.byte 0x0
.byte 0x0

data_740:
.word 0x43100618
data_744:
.word 0x42d42000
data_748:
.word 0xe000ed10

jump_74c:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r4, [pc, #0x38] /* data_78c */ 
    ldr r7, [r4]
    ldr r5, [pc, #0x34] /* data_78c */ 
    adds r5, #0x48
    ldr r6, [r5]
    mov.w sb, #1
    str.w sb, [r4]
    mov.w r8, #0
    str.w r8, [r5]
    bl call_ad0
    ldr r0, [pc, #0x20] /* data_790 */ 
    str.w r8, [r0, #0x9c]
    str.w sb, [r0, #0x8c]
    str r7, [r4]
    ldr r0, [pc, #0x18] /* data_794 */ 
    ldr r1, [r0]
    orr r1, r1, #4
    str r1, [r0]
    wfe 
    str r6, [r5]
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

data_78c:
.word 0x43100618
data_790:
.word 0x42d42000
data_794:
.word 0xe000ed10

call_798:
    ldr r1, [pc, #0x10] /* data_7ac */ 
    ldr r2, [r1]
    bic r2, r2, #4
    str r2, [r1]
    cbz r0, jump_7a8
    wfi 
    bx lr
jump_7a8:
    wfe 
    bx lr

data_7ac:
.word 0xe000ed10

decrypt_packet:
    push {r4, r5, r6, r7, lr}
    sub sp, #0x100
    mov r4, r0
    mov r5, r1
    mov r0, sp
    bl generate
    movs r2, #0
    mov r3, r2
    mov r1, sp
    b jump_7e4
jump_7c6:
    .short 0x1c52 /* adds r2, r2, #1 */ 
    uxtb r2, r2
    ldrb r0, [r1, r2]
    add r3, r0
    uxtb r3, r3
    ldrb r6, [r1, r3]
    strb r6, [r1, r2]
    strb r0, [r1, r3]
    add r0, r6
    uxtb r0, r0
    ldrb r7, [r4]
    ldrb r0, [r1, r0]
    eors r7, r0
    strb r7, [r4], #1
jump_7e4:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    bhs jump_7c6
    add sp, #0x100
    pop {r4, r5, r6, r7, pc}
flash_write_buffer:
    push {r4, r5, r6, lr}
    lsrs r2, r2, #2
    movs r4, #4
    ldr r3, [pc, #0x18] /* data_80c */ 
    movs r5, #0x14
    b jump_804
jump_7f8:
    str r4, [r3, #0xc]
    str r0, [r3]
    ldm r1!, {r6}
    str r6, [r3, #4]
    str r5, [r3, #0x10]
    .short 0x1d00 /* adds r0, r0, #4 */ 
jump_804:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_7f8
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_80c:
.word 0x40080000

handle_frame:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0x1c4] /* data_9dc */ 
    ldrb r0, [r5]
    cmp r0, #1
    bne jump_8fe
    ldr r6, [pc, #0x1c0] /* data_9e0 */ 
    movs r4, #0
    mov r0, r6
    ldrb r1, [r6]
    ldrb r0, [r0, #1]
    mov ip, r4
    cmp r1, #0x10
    beq jump_84c
    mov r2, r6
    mov.w lr, #0xcc00
    ldr r3, [r2, #4]
    mov.w r2, #0x3400
    add.w r7, r3, #0x3000
    cmp r1, #0x1d
    beq jump_8d0
    bgt jump_856
    cmp r1, #0x11
    beq jump_860
    cmp r1, #0x12
    bne jump_92c
    b jump_866
jump_84c:
    cmp r0, #2
    bne jump_92c
    str.w ip, [r6, #4]
    b jump_962
jump_856:
    cmp r1, #0x1e
    beq jump_94c
    cmp r1, #0x1f
    bne jump_92c
    b jump_984
jump_860:
    bl reset_builtin
    b jump_96c
jump_866:
    mov.w r3, #0x400
    cmp r0, #0x20
    blo jump_88c
    sub.w r1, r0, #0x1f
    rsb r1, r1, r1, lsl #4
    cmp.w r3, r1, lsl #2
    blt jump_88c
    rsb r0, r0, r0, lsl #4
    mov.w r1, #0x2880
    add.w r0, r1, r0, lsl #2
    movs r1, #0x3c
    b jump_966
jump_88c:
    cbz r0, jump_898
    cmp r0, #1
    beq jump_8c0
    cmp r0, #2
    bne jump_92c
    b jump_8c8
jump_898:
    ldrb r2, [r3]
    mov r0, r3
    cmp r2, #4
    beq jump_8bc
    movs r2, #0x20
    mov r1, r3
    adds r0, r6, #4
    bl memcpy
    ldr r0, [pc, #0x138] /* data_9e4 */ 
    ldr.w r1, [r0, #0x180]
    str r1, [r6, #0x24]
    ldr.w r0, [r0, #0x18c]
    movs r1, #0x28
    str r0, [r6, #0x28]
    b jump_964
jump_8bc:
    movs r1, #0x34
    b jump_966
jump_8c0:
    movs r1, #4
    mov.w r0, #0x3c00
    b jump_966
jump_8c8:
    strb.w ip, [r6, #4]
    movs r1, #1
    b jump_964
jump_8d0:
    lsls r1, r3, #0x1e
    bne jump_9c8
    ldr r1, [r6, #8]
    cbz r1, jump_92c
    lsls r4, r1, #0x1e
    bne jump_9c8
    add r3, r1
    cmp r3, lr
    bhi jump_9c8
    str r7, [r6, #4]
    cbz r0, jump_8f0
    cmp r0, #1
    beq jump_930
    cmp r0, #2
    bne jump_9c8
    b jump_930
jump_8f0:
    adds r0, r7, r1
    str.w ip, [r6, #8]
    strd r7, r0, [r6, #0xc]
    mov r0, r7
    b jump_91a
jump_8fe:
    b jump_980
jump_900:
    bl flash_page_erase
    cbnz r0, jump_920
    bl call_1618
    ldr r0, [r6, #8]
    add.w r0, r0, #0x400
    str r0, [r6, #8]
    ldr r0, [r6, #0xc]
    add.w r0, r0, #0x400
    str r0, [r6, #0xc]
jump_91a:
    ldr r1, [r6, #0x10]
    cmp r0, r1
    blo jump_900
jump_920:
    ldr r0, [r6, #4]
    movs r1, #8
    sub.w r0, r0, #0x3000
    str r0, [r6, #4]
    b jump_964
jump_92c:
    b jump_9c8

.byte 0xd
.byte 0xe0

jump_930:
    cmp r7, r2
    blo jump_9c8
    cmp.w r1, #0x1000
    blo jump_9c8
    cmp r0, #2
    beq jump_948
    movs r2, #0
jump_940:
    mov r0, r7
    bl firmware_check
    b jump_960
jump_948:
    movs r2, #1
    b jump_940
jump_94c:
    cbz r0, jump_95c
    cmp r0, #1
    bne jump_9c8
    cmp r3, lr
    bhs jump_9c8
    lsls r0, r3, #0x1e
    bne jump_9c8
    str r7, [r5, #4]
jump_95c:
    ldr r0, [r5, #4]
    b jump_9c2
jump_960:
    str r0, [r6, #4]
jump_962:
    movs r1, #4
jump_964:
    adds r0, r6, #4
jump_966:
    bl flash_read_packet
    movs r4, #1
jump_96c:
    ldrb r0, [r5]
    cmp r0, #1
    bne jump_980
    cbz r4, jump_9c8
    movs r1, #0x3c
    adds r0, r6, #4
jump_978:
    bl mem_zero
    movs r0, #2
    strb r0, [r5]
jump_980:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_984:
    cbz r0, jump_9c8
    lsls r1, r0, #0x1e
    bne jump_9c8
    cmp r0, #0x3c
    bhi jump_9c8
    ldr r1, [r5, #4]
    adds r3, r0, r1
    cmp.w r3, #0xfc00
    bhi jump_9c8
    cmp r1, r2
    bhs jump_9a2
    cmp r3, r2
    bhi jump_9c8
    b jump_9aa
jump_9a2:
    mov r1, r0
    adds r0, r6, #4
    bl decrypt_packet
jump_9aa:
    ldrb r2, [r6, #1]
    adds r1, r6, #4
    ldr r0, [r5, #4]
    bl flash_write_buffer
    ldrb r0, [r6, #1]
    ldr r1, [r5, #4]
    add r0, r1
    movw r1, #0x21e
    str r0, [r5, #4]
    strh r1, [r6]
jump_9c2:
    sub.w r0, r0, #0x3000
    b jump_960
jump_9c8:
    ldr r0, [r6]
    str r0, [r6, #4]
    movw r0, #0xaaff
    str r0, [r6]
    ldr r0, [pc, #0xc] /* data_9e0 */ 
    movs r1, #0x38
    adds r0, #8
    b jump_978

.byte 0x0
.byte 0x0

data_9dc:
.word 0x20000004
data_9e0:
.word 0x20000084
data_9e4:
.word 0x40080000

reset_builtin:
    push {r4, lr}
    ldr r1, [pc, #0x6c] /* data_a58 */ 
    cbz r0, jump_a0a
    cmp r0, #1
    beq jump_a0e
    cmp r0, #2
    bne jump_a56
    movs r0, #0x35
    bl nvic_disable_intr
    movs r0, #0
    bl call_1264
    pop.w {r4, lr}
    b.w jump_74c
jump_a0a:
    ldr r0, [pc, #0x50] /* data_a5c */ 
    b jump_a12
jump_a0e:
    ldr r0, [pc, #0x4c] /* data_a5c */ 
    .short 0x1f40 /* subs r0, r0, #5 */ 
jump_a12:
    str r0, [r1]
    movs r1, #0
    mov.w r0, #0x10000
    movs r3, #1
    mov r2, r1
    bl ckcu_clocks_enable
    ldr r1, [pc, #0x3c] /* data_a60 */ 
    mov.w r0, #0x200
    str r0, [r1, #0x24]
    movs r0, #0x35
    bl nvic_disable_intr
    movs r0, #0
    bl call_1264
    movw r0, #0x4e20
    bl call_102
    dsb sy
    ldr r0, [pc, #0x20] /* data_a64 */ 
    ldr r1, [r0]
    ldr r2, [pc, #0x20] /* data_a68 */ 
    and r1, r1, #0x700
    orrs r1, r2
    str r1, [r0]
    dsb sy
jump_a54:
    b jump_a54
jump_a56:
    pop {r4, pc}

data_a58:
.word 0x20003ffc
data_a5c:
.word 0x55aafaf5
data_a60:
.word 0x400b0000
data_a64:
.word 0xe000ed0c
data_a68:
.word 0x5fa0004

flash_read_packet:
    push {r4, r5, r6, lr}
    mov r4, r1
    ldr r2, [pc, #0x24] /* data_a98 */ 
    mov r1, r0
    movs r0, #2
    strb r0, [r2]
    ldr r0, [pc, #0x20] /* data_a9c */ 
    subs r5, r0, #4
    cmp r1, r0
    beq jump_a88
    mov r2, r4
    adds r0, r5, #4
    bl memcpy
jump_a88:
    adds r0, r5, r4
    rsb.w r1, r4, #0x3c
    pop.w {r4, r5, r6, lr}
    .short 0x1d00 /* adds r0, r0, #4 */ 
    b.w mem_zero

data_a98:
.word 0x20000004
data_a9c:
.word 0x20000088

.byte 0xf0
.byte 0xb5
.byte 0xa
.byte 0x4f
.byte 0xd7
.byte 0xf8
.byte 0x4
.byte 0x41
.byte 0xd7
.byte 0xf8
.byte 0x8
.byte 0x51
.byte 0xd7
.byte 0xf8
.byte 0xc
.byte 0x61
.byte 0x84
.byte 0x43
.byte 0x8d
.byte 0x43
.byte 0x96
.byte 0x43
.byte 0x13
.byte 0xb1
.byte 0x4
.byte 0x43
.byte 0xd
.byte 0x43
.byte 0x16
.byte 0x43
.byte 0xc7
.byte 0xf8
.byte 0x4
.byte 0x41
.byte 0xc7
.byte 0xf8
.byte 0x8
.byte 0x51
.byte 0xc7
.byte 0xf8
.byte 0xc
.byte 0x61
.byte 0xf0
.byte 0xbd
.byte 0x0
.byte 0x80
.byte 0x8
.byte 0x40

call_ad0:
    ldr r2, [pc, #0x1c] /* data_af0 */ 
    movs r1, #0
    mov.w r0, #0x1c20
    str.w r1, [r2, #0x108]
jump_adc:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_adc
    movs r0, #1
    str.w r0, [r2, #0x108]
    ldr r0, [pc, #0xc] /* data_af4 */ 
jump_ae8:
    ldr r1, [r0, #8]
    lsls r1, r1, #0x1a
    bpl jump_ae8
    bx lr

data_af0:
.word 0x42d40000
data_af4:
.word 0x40088000

call_af8:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r7, #0xa
    ldr r5, [pc, #0x58] /* data_b58 */ 
    b jump_b4e
jump_b02:
    ldr r1, [pc, #0x54] /* data_b58 */ 
    add.w r0, r7, r7, lsl #1
    add r0, r1
    ldrb r1, [r5, #-0x1]!
    ldrb r0, [r0, #2]
    eors r0, r1
    movs.w r8, r0
    beq jump_b4e
    movs r4, #0x80
    movs r6, #8
    b jump_b48
jump_b1e:
    tst.w r8, r4
    beq jump_b46
    ldrb r0, [r5]
    eors r0, r4
    strb r0, [r5]
    tst r0, r4
    bne jump_b32
    movs r1, #1
    b jump_b34
jump_b32:
    movs r1, #0
jump_b34:
    add.w r0, r6, r7, lsl #3
    uxtb r0, r0
    bl call_4dc
    cbnz r0, jump_b46
    ldrb r0, [r5]
    eors r0, r4
    strb r0, [r5]
jump_b46:
    lsrs r4, r4, #1
jump_b48:
    .short 0x1e76 /* subs r6, r6, #1 */ 
    uxtb r6, r6
    bhs jump_b1e
jump_b4e:
    .short 0x1e7f /* subs r7, r7, #1 */ 
    uxtb r7, r7
    bhs jump_b02
    pop.w {r4, r5, r6, r7, r8, pc}

data_b58:
.word 0x200000ce

call_b5c:
    push {r4, r5, r6, lr}
    movs r4, #2
    ldr r5, [pc, #0x34] /* data_b98 */ 
    mov.w r6, #0x1f4
jump_b66:
    bl call_1738
    movs r1, #0xa
    b jump_b76
jump_b6e:
    add.w r0, r1, r1, lsl #1
    ldrb r0, [r5, r0]
    cbnz r0, jump_b7c
jump_b76:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_b6e
jump_b7c:
    cmp r1, #0xff
    beq jump_b86
    cmp r4, #0
    bne jump_b66
jump_b84:
    pop {r4, r5, r6, pc}
jump_b86:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    ands r4, r4, #0xff
    beq jump_b84
    mov r0, r6
    bl call_102
    b jump_b66

.byte 0x0
.byte 0x0

data_b98:
.word 0x200000ce

.byte 0x4
.byte 0x49
.byte 0x8
.byte 0x78
.byte 0x40
.byte 0x1c
.byte 0x8
.byte 0x70
.byte 0x80
.byte 0x7
.byte 0x1
.byte 0xd1
.byte 0x0
.byte 0xf0
.byte 0xc6
.byte 0xbd
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0xc
.byte 0x0
.byte 0x0
.byte 0x20

call_bb4:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r6, #0
    mov r1, r6
    mov.w r0, #0xf0000
    movs r3, #1
    mov r2, r6
    bl ckcu_clocks_enable
    movs r4, #8
    b jump_bfc
jump_bcc:
    ldr r0, [pc, #0x90] /* data_c60 */ 
    movs r2, #0
    add.w r1, r0, r4, lsl #3
    ldrh r5, [r1, #4]
    ldr r0, [r1]
    uxth r1, r5
    mov r7, r0
    bl call_3c0
    uxth r1, r5
    mov r0, r7
    movs r2, #1
    bl call_3a0
    ldr r0, [pc, #0x74] /* data_c60 */ 
    adds r0, #0x40
    ldrb.w r1, [r0, r4, lsl #1]
    add.w r0, r0, r4, lsl #1
    ldrb r0, [r0, #1]
    bl call_ac
jump_bfc:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_bcc
    movs r4, #0xa
    b jump_c2e
jump_c06:
    ldr r0, [pc, #0x58] /* data_c60 */ 
    adds r0, #0x50
    add.w r1, r0, r4, lsl #3
    ldrh r5, [r1, #4]
    ldr r7, [r1]
    uxth r1, r5
    mov r0, r7
    bl call_e0
    uxth r1, r5
    mov r0, r7
    movs r2, #0
    bl call_3b0
    uxth r1, r5
    mov r0, r7
    movs r2, #1
    bl call_390
jump_c2e:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_c06
    movs r2, #0xff
    movs r1, #0xa
    ldr r0, [pc, #0x28] /* data_c64 */ 
    bl mem_set
    ldr r0, [pc, #0x24] /* data_c64 */ 
    movs r1, #0xa
    adds r0, #0xa
    movs r2, #0xff
    b jump_c54
jump_c48:
    strb r6, [r0], #1
    strb r2, [r0], #1
    strb r2, [r0], #1
jump_c54:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_c48
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_c60:
.word 0x1fd4
data_c64:
.word 0x200000c4

call_c68:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r7, r0
    mov.w r4, #0xa
    beq jump_c7c
    movs r0, #0
jump_c76:
    mov r8, r0
    ldr r5, [pc, #0x50] /* data_ccc */ 
    b jump_ca0
jump_c7c:
    movs r0, #1
    b jump_c76
jump_c80:
    add.w r6, r5, r4, lsl #3
    mov r2, r8
    ldrh r0, [r6, #4]
    uxth r1, r0
    ldr.w r0, [r5, r4, lsl #3]
    bl call_3e8
    ldrh r0, [r6, #4]
    movs r2, #1
    uxth r1, r0
    ldr.w r0, [r5, r4, lsl #3]
    bl call_390
jump_ca0:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_c80
    cbz r7, jump_cba
    movs r2, #0
jump_caa:
    ldr r4, [pc, #0x24] /* data_cd0 */ 
    movs r1, #0x10
    mov r0, r4
    bl call_3b0
    cbz r7, jump_cbe
    movs r2, #1
    b jump_cc0
jump_cba:
    movs r2, #1
    b jump_caa
jump_cbe:
    movs r2, #0
jump_cc0:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r1, #0x10
    b.w call_3e8

data_ccc:
.word 0x2024
data_cd0:
.word 0x400b0000

call_cd4:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r1, #0
    mov.w r2, #0x20000
    mov.w r0, #0x70000
    movs r3, #1
    bl ckcu_clocks_enable
    movw r1, #0xea60
    ldr r0, [pc, #0x90] /* data_d80 */ 
    bl call_38
    ldr r4, [pc, #0x90] /* data_d84 */ 
    movs r1, #2
    mov r0, r4
    bl call_e0
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl call_3b0
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl call_390
    movs r1, #4
    mov r0, r4
    bl call_e0
    ldr r6, [pc, #0x6c] /* data_d88 */ 
    mov.w r5, #0x4000
    mov r1, r5
    mov r0, r6
    bl call_e0
    lsls r7, r5, #1
    mov r1, r7
    mov r0, r6
    bl call_e0
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl call_3b0
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl call_3b0
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl call_3b0
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl call_390
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl call_390
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl call_390
    movs r2, #1
    mov r1, r2
    ldr r0, [pc, #0x18] /* data_d8c */ 
    bl call_3a0
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w jump_17f0

.byte 0x0
.byte 0x0

data_d80:
.word 0x40077000
data_d84:
.word 0x400b4000
data_d88:
.word 0x400b0000
data_d8c:
.word 0x400b2000

jump_d90:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x60] /* data_df4 */ 
    movs r1, #0
    mov r0, r4
    bl bftm_set_mien
    movs r1, #0
    mov r0, r4
    bl call_1c4
    mov r0, r4
    bl bftm_clear
    ldr r1, [pc, #0x4c] /* data_df8 */ 
    asrs r0, r4, #0x14
    str.w r0, [r1, #0x180]
    movs r1, #0
    ldr r0, [pc, #0x44] /* data_dfc */ 
    bl call_444
    ldr r1, [pc, #0x44] /* data_e00 */ 
    movs r0, #2
    str r0, [r1, #0x24]
    ldr r4, [pc, #0x40] /* data_e04 */ 
    movs r5, #8
    b jump_dec
jump_dc6:
    ldrh r0, [r4, #4]
    movs r2, #0
    uxth r1, r0
    ldr r0, [r4]
    bl call_390
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl call_3a0
    ldrh r0, [r4, #4]
    movs r2, #2
    uxth r1, r0
    ldr r0, [r4]
    bl call_3c0
    adds r4, #8
jump_dec:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_dc6
    pop {r4, r5, r6, pc}

data_df4:
.word 0x40077000
data_df8:
.word 0xe000e004
data_dfc:
.word 0x4006f000
data_e00:
.word 0x400b4000
data_e04:
.word 0x2074

call_e08:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x8c] /* data_e98 */ 
    movs r5, #8
    b jump_e34
jump_e10:
    ldrh r0, [r4, #4]
    uxth r1, r0
    ldr r0, [r4]
    bl call_e0
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl call_3b0
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl call_390
    adds r4, #8
jump_e34:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_e10
    ldr r1, [pc, #0x60] /* data_e9c */ 
    movs r0, #2
    str r0, [r1, #0x28]
    lsls r1, r0, #8
    ldr r0, [pc, #0x5c] /* data_ea0 */ 
    bl mem_zero
    ldr r1, [pc, #0x58] /* data_ea4 */ 
    movs r0, #0
    strb r0, [r1, #1]
    movs r0, #0x64
    bl call_102
    bl call_f00
    movs r0, #2
    bl call_1844
    ldr r1, [pc, #0x48] /* data_ea8 */ 
    mov.w r0, #0x8000
    str r0, [r1, #0x24]
    movs r1, #1
    ldr r0, [pc, #0x40] /* data_eac */ 
    bl call_444
    ldr r4, [pc, #0x40] /* data_eb0 */ 
    movs r1, #0
    mov r0, r4
    bl bftm_set_counter
    mov r0, r4
    bl bftm_clear
    movs r1, #1
    mov r0, r4
    bl call_1c4
    movs r1, #1
    mov r0, r4
    bl bftm_set_mien
    ldr r1, [pc, #0x24] /* data_eb4 */ 
    asrs r0, r4, #0x14
    str.w r0, [r1, #0x100]
    pop {r4, r5, r6, pc}

data_e98:
.word 0x2074
data_e9c:
.word 0x400b4000
data_ea0:
.word 0x200000ec
data_ea4:
.word 0x20000010
data_ea8:
.word 0x400b0000
data_eac:
.word 0x4006f000
data_eb0:
.word 0x40077000
data_eb4:
.word 0xe000e004

call_eb8:
    push {r4, r5, lr}
    movs r0, #0x12
    bl call_1844
    movs r1, #0xa
    mov.w r0, #0x300
    bl call_1874
    movs r1, #2
    movs r0, #0
    bl call_1874
    ldr r4, [pc, #0x24] /* data_ef8 */ 
    mov.w r0, #0x4000
    str r0, [r4, #0x28]
    lsls r5, r0, #1
    str r5, [r4, #0x24]
    movs r1, #8
    mov.w r0, #0xc00
    bl call_1874
    ldr r1, [pc, #0x10] /* data_efc */ 
    movs r0, #4
    str r0, [r1, #0x24]
    str r5, [r4, #0x28]
    nop 
    nop 
    str r5, [r4, #0x24]
    pop {r4, r5, pc}

data_ef8:
.word 0x400b0000
data_efc:
.word 0x400b4000

call_f00:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
    ldr r1, [pc, #0x78] /* data_f80 */ 
    ldr r0, [pc, #0x74] /* data_f7c */ 
    movs r5, #0x10
    ldrb r2, [r1, #1]
    movs r7, #4
    add.w r4, r0, r2, lsl #6
    ldrb r0, [r1]
    ldr.w sl, [pc, #0x6c] /* data_f84 */ 
    ldr r6, [pc, #0x6c] /* data_f88 */ 
    mov.w fp, #0x4000
    adds r4, #0x3e
    cbz r0, jump_f30
    .short 0x1e40 /* subs r0, r0, #1 */ 
    ands r0, r0, #0xff
    strb r0, [r1]
    bne jump_f30
    bl call_eb8
jump_f30:
    mov sb, r7
jump_f32:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    blo jump_f72
    mov.w r8, #0x8000
    str.w r8, [r6, #0x28]
    ldrh r0, [r4]
    subs r7, r4, #2
    movs r1, #0xa
    bl call_1874
    ldrh r0, [r7]
    movs r1, #9
    ubfx r7, r0, #6, #1
    .short 0x1f24 /* subs r4, r4, #4 */ 
    bl call_1874
    mov r0, fp
    str.w fp, [r6, #0x28]
    str.w r8, [r6, #0x24]
    mov r1, sb
    mov r2, sl
    cbz r7, jump_f6c
    str r1, [r2, #0x24]
    b jump_f6e
jump_f6c:
    str r1, [r2, #0x28]
jump_f6e:
    str r0, [r6, #0x24]
    b jump_f32
jump_f72:
    str.w sb, [sl, #0x24]
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

.byte 0x0
.byte 0x0

data_f7c:
.word 0x200000ec
data_f80:
.word 0x20000010
data_f84:
.word 0x400b4000
data_f88:
.word 0x400b0000

.thumb_func
call_f8c:
    ldr r0, [pc, #0x50] /* data_fe0 */ 
    movs r1, #1
    str.w r1, [r0, #0x300]
    ldr r2, [pc, #0x4c] /* data_fe4 */ 
    str.w r1, [r2, #0xa8]
jump_f9a:
    ldr.w r3, [r2, #0x108]
    cmp r3, #0
    beq jump_f9a
    movs r3, #0
    str r3, [r2, #0x20]
    mov.w r3, #0x9000000
    str r3, [r0, #0x18]
    str.w r1, [r2, #0xa4]
jump_fb0:
    ldr.w r3, [r2, #0x104]
    cmp r3, #0
    beq jump_fb0
    ldr r2, [pc, #0x2c] /* data_fe8 */ 
    ldr.w r3, [r2, #0x200]
    bic r3, r3, #7
    .short 0x1cdb /* adds r3, r3, #3 */ 
    str.w r3, [r2, #0x200]
    str r1, [r0, #0x20]
    ldr r2, [r0, #4]
    bic r2, r2, #3
    .short 0x1c52 /* adds r2, r2, #1 */ 
    str r2, [r0, #4]
jump_fd4:
    ldr r2, [r0, #0x34]
    cmp.w r1, r2, lsr #30
    bne jump_fd4
    bx lr

.byte 0x0
.byte 0x0

data_fe0:
.word 0x40088000
data_fe4:
.word 0x43100000
data_fe8:
.word 0x40080000

call_fec:
    ldr r0, [pc, #0x10] /* data_1000 */ 
    movs r1, #0
    add.w r2, r0, #8
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    strb r1, [r2, #1]
    str.w r1, [r0, #0x15]
    bx lr

data_1000:
.word 0x2000001c

call_1004:
    ldr r0, [pc, #0x18] /* data_1020 */ 
    push {lr}
    ldr r1, [pc, #0x14] /* data_1020 */ 
    movs r3, #1
    strb r3, [r0]
    adds r1, #0xc
    movs r0, #2
    strb r0, [r1]
    bl call_fec
    ldr r0, [pc, #4] /* data_1020 */ 
    subs r0, #8
    strb r3, [r0, #4]
    pop {pc}

data_1020:
.word 0x20000024

call_1024:
    ldrb.w r0, [r0, #0x34]
    ubfx r0, r0, #1, #1
    bx lr

.byte 0x0
.byte 0x0
.byte 0x2d
.byte 0xe9
.byte 0xf0
.byte 0x41
.byte 0x4
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x1d
.byte 0xfa
.byte 0x5
.byte 0x46
.byte 0x56
.byte 0x4e
.byte 0x80
.byte 0x7
.byte 0x5
.byte 0xd5
.byte 0x70
.byte 0x68
.byte 0x0
.byte 0xb1
.byte 0x80
.byte 0x47
.byte 0x2
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xc1
.byte 0xf8
.byte 0xe8
.byte 0x6
.byte 0xf
.byte 0xd5
.byte 0x10
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xbc
.byte 0xf8
.byte 0x94
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0x2
.byte 0x28
.byte 0x8
.byte 0xd3
.byte 0x0
.byte 0xf0
.byte 0x10
.byte 0xfa
.byte 0x94
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0x84
.byte 0xf8
.byte 0x33
.byte 0x0
.byte 0x3
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0x68
.byte 0x7
.byte 0x4f
.byte 0xf0
.byte 0x0
.byte 0x7
.byte 0x21
.byte 0xd5
.byte 0x78
.byte 0x1e
.byte 0x20
.byte 0x62
.byte 0x84
.byte 0xf8
.byte 0x30
.byte 0x70
.byte 0x84
.byte 0xf8
.byte 0x31
.byte 0x70
.byte 0x94
.byte 0xf8
.byte 0x34
.byte 0x0
.byte 0x20
.byte 0xf0
.byte 0x2
.byte 0x0
.byte 0x84
.byte 0xf8
.byte 0x34
.byte 0x0
.byte 0x4
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0xa7
.byte 0x63
.byte 0x0
.byte 0xf0
.byte 0xf1
.byte 0xf8
.byte 0x0
.byte 0xf0
.byte 0xf9
.byte 0xf9
.byte 0x3e
.byte 0x49
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0x49
.byte 0xf9
.byte 0x3c
.byte 0x48
.byte 0x0
.byte 0x68
.byte 0x0
.byte 0xf0
.byte 0xc9
.byte 0xf9
.byte 0x30
.byte 0x68
.byte 0x0
.byte 0xb1
.byte 0x80
.byte 0x47
.byte 0x4
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0x89
.byte 0xf8
.byte 0x28
.byte 0x7
.byte 0x8
.byte 0xd5
.byte 0x0
.byte 0xf0
.byte 0xe7
.byte 0xf9
.byte 0x94
.byte 0xf8
.byte 0x33
.byte 0x0
.byte 0x84
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0x8
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0x7e
.byte 0xf8
.byte 0xe8
.byte 0x5
.byte 0x4f
.byte 0xf4
.byte 0x80
.byte 0x78
.byte 0x3d
.byte 0xd5
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0x1d
.byte 0xf9
.byte 0x5
.byte 0x46
.byte 0x80
.byte 0x5
.byte 0xa
.byte 0xd5
.byte 0x20
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x63
.byte 0xfa
.byte 0x20
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x26
.byte 0xfd
.byte 0x4f
.byte 0xf4
.byte 0x0
.byte 0x71
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xd7
.byte 0xf8
.byte 0xa8
.byte 0x7
.byte 0x1e
.byte 0xd5
.byte 0x2
.byte 0x21
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xd1
.byte 0xf8
.byte 0x20
.byte 0x6a
.byte 0x40
.byte 0x1c
.byte 0x17
.byte 0xd0
.byte 0x94
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0x2
.byte 0x28
.byte 0x13
.byte 0xd1
.byte 0x40
.byte 0x22
.byte 0x0
.byte 0x20
.byte 0xe1
.byte 0x69
.byte 0x0
.byte 0xf0
.byte 0x3d
.byte 0xf9
.byte 0xe1
.byte 0x69
.byte 0x1
.byte 0x44
.byte 0xe1
.byte 0x61
.byte 0x21
.byte 0x6a
.byte 0x8
.byte 0x1a
.byte 0x20
.byte 0x62
.byte 0x7
.byte 0xd1
.byte 0x1
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0xa1
.byte 0x6a
.byte 0x11
.byte 0xb1
.byte 0xe0
.byte 0x6a
.byte 0x88
.byte 0x47
.byte 0xa7
.byte 0x62
.byte 0xe8
.byte 0x6
.byte 0x6
.byte 0xd5
.byte 0x20
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0xd9
.byte 0xfc
.byte 0x10
.byte 0x21
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xad
.byte 0xf8
.byte 0x40
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x3c
.byte 0xf8
.byte 0x44
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x8b
.byte 0xf9
.byte 0x0
.byte 0xf0
.byte 0x79
.byte 0xf9
.byte 0x5
.byte 0x46
.byte 0x40
.byte 0x1c
.byte 0x14
.byte 0xd0
.byte 0x28
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0xd7
.byte 0xf8
.byte 0x10
.byte 0xf0
.byte 0x12
.byte 0xf
.byte 0xf2
.byte 0xd0
.byte 0x12
.byte 0x21
.byte 0x28
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x98
.byte 0xf8
.byte 0x4
.byte 0xfa
.byte 0x5
.byte 0xf0
.byte 0x0
.byte 0xf0
.byte 0x26
.byte 0xf8
.byte 0xb0
.byte 0x69
.byte 0x0
.byte 0x28
.byte 0xe7
.byte 0xd0
.byte 0x1
.byte 0x46
.byte 0x28
.byte 0x46
.byte 0x88
.byte 0x47
.byte 0xe3
.byte 0xe7
.byte 0xbd
.byte 0xe8
.byte 0xf0
.byte 0x81
.byte 0x0
.byte 0x0
.byte 0x14
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x20

call_11a0:
    movs r1, #2
    strb.w r1, [r0, #0x32]
    ldr r0, [pc, #4] /* data_11ac */ 
    b.w jump_110

data_11ac:
.word 0x20000040

call_11b0:
    ldrb.w r0, [r0, #0x32]
    cmp r0, #3
    beq jump_11bc
    movs r0, #0
    bx lr
jump_11bc:
    movs r0, #1
    bx lr
call_11c0:
    push {r4, lr}
    bl call_1494
    pop.w {r4, lr}
    b.w jump_15c4

.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x49
.byte 0x88
.byte 0x60
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x80
.byte 0xa
.byte 0x40

call_11dc:
    push {r4, lr}
    movs r1, #0
    mov.w r0, #0x400
    movs r2, #0x40
    movs r3, #1
    bl ckcu_clocks_enable
    movs r0, #2
    bl ckcu_set_usb_prescaler
    ldr r4, [pc, #0x48] /* data_123c */ 
    ldr r0, [pc, #0x40] /* data_1238 */ 
    str r0, [r4, #8]
    subs r0, #0x5c
    str r0, [r4, #0xc]
    subs r0, #0xd4
    str r0, [r4, #0x10]
    movs r0, #2
    str r0, [r4, #0x14]
    bl call_1004
    mov r0, r4
    bl call_11a0
    ldr r1, [pc, #0x30] /* data_1240 */ 
    mov.w r0, #0x200000
    str.w r0, [r1, #0x100]
    movs r0, #1
    bl call_1264
    movs r0, #0xfa
    bl call_102
    ldrb.w r0, [r4, #0x34]
    pop.w {r4, lr}
    and r1, r0, #1
    ldr r0, [pc, #0x10] /* data_1244 */ 
    b.w jump_14a4

.byte 0x0
.byte 0x0

data_1238:
.word 0x21e4
data_123c:
.word 0x20000304
data_1240:
.word 0xe000e004
data_1244:
.word 0x20000040

call_1248:
    ldr r1, [pc, #0x14] /* data_1260 */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_1258
    bic r0, r0, #0x800
jump_1254:
    str r0, [r1]
    bx lr
jump_1258:
    orr r0, r0, #0x800
    b jump_1254

.byte 0x0
.byte 0x0

data_1260:
.word 0x400a8000

call_1264:
    ldr r1, [pc, #0x14] /* data_127c */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_1274
    bic r0, r0, #0x400
jump_1270:
    str r0, [r1]
    bx lr
jump_1274:
    orr r0, r0, #0x400
    b jump_1270

.byte 0x0
.byte 0x0

data_127c:
.word 0x400a8000

.byte 0x0
.byte 0x21
.byte 0x20
.byte 0x20
.byte 0x1
.byte 0x23
.byte 0xa
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0xa
.byte 0xbc
.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0x69
.byte 0xfd
.byte 0x1
.byte 0x68
.byte 0x1
.byte 0xf0
.byte 0x9
.byte 0x1
.byte 0x1
.byte 0x60
.byte 0x10
.byte 0xbd
.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0x61
.byte 0xfd
.byte 0x1
.byte 0x68
.byte 0x1
.byte 0xf0
.byte 0x24
.byte 0x1
.byte 0x1
.byte 0x60
.byte 0x10
.byte 0xbd
.byte 0x10
.byte 0xb5
.byte 0xc
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x58
.byte 0xfd
.byte 0x84
.byte 0x60
.byte 0x10
.byte 0xbd

call_12b8:
    push {r4, lr}
    bl call_1d64
    ldr r0, [r0, #0x10]
    ldr r1, [pc, #8] /* data_12cc */ 
    ubfx r0, r0, #0, #0xa
    add r0, r1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_12cc:
.word 0x400aa000

call_12d0:
    push {r4, r5, r6, lr}
    mov r5, r0
    bl call_1d64
    mov r4, r0
    mov r0, r5
    bl call_12f4
    ldr r1, [r4, #0x10]
    ubfx r1, r1, #0, #0xa
    add r0, r1
    ldr r1, [pc, #4] /* data_12f0 */ 
    add r0, r1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_12f0:
.word 0x400aa000

call_12f4:
    push {r4, lr}
    bl call_1d64
    ldr r0, [r0, #0x10]
    ubfx r0, r0, #0xa, #0xa
    pop {r4, pc}

.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0x2e
.byte 0xfd
.byte 0x1
.byte 0x69
.byte 0x0
.byte 0x68
.byte 0xc9
.byte 0x0
.byte 0x2
.byte 0xd5
.byte 0xc0
.byte 0xf3
.byte 0x80
.byte 0x0
.byte 0x10
.byte 0xbd
.byte 0xc0
.byte 0xf3
.byte 0x40
.byte 0x10
.byte 0x10
.byte 0xbd
.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0x21
.byte 0xfd
.byte 0x41
.byte 0x68
.byte 0x80
.byte 0x68
.byte 0x8
.byte 0x40
.byte 0x10
.byte 0xbd

call_132a:
    push {r4, lr}
    mov r4, r1
    bl call_1d64
    ldr r0, [r0, #0xc]
    lsrs r0, r4
    ubfx r0, r0, #0, #9
    pop {r4, pc}

.byte 0x70
.byte 0xb5
.byte 0xc
.byte 0x46
.byte 0x5
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0xf
.byte 0xfd
.byte 0x4
.byte 0xeb
.byte 0xc5
.byte 0x1
.byte 0x4a
.byte 0x68
.byte 0x2
.byte 0x61
.byte 0x89
.byte 0x68
.byte 0x41
.byte 0x60
.byte 0x4f
.byte 0xf0
.byte 0xff
.byte 0x31
.byte 0x81
.byte 0x60
.byte 0x28
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0x70
.byte 0x40
.byte 0x0
.byte 0xf0
.byte 0x35
.byte 0xb8

call_1362:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r7, r1
    movs r5, r0
    beq jump_1392
    movs r1, #0
jump_1370:
    bl call_132a
    mov r4, r0
    cmp r0, r6
    bhi jump_138c
    mov r0, r5
    cbz r5, jump_1396
    bl call_12b8
jump_1382:
    adds r1, r4, #3
    lsrs r2, r1, #2
    mov r1, r7
    bl call_1d54
jump_138c:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, pc}
jump_1392:
    movs r1, #0x10
    b jump_1370
jump_1396:
    bl call_12d0
    b jump_1382
call_139c:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r5, r2
    mov r6, r1
    mov r7, r0
    bl call_1d64
    mov r4, r0
    movs r0, #0
    cbz r5, jump_13c0
    mov r2, r5
    mov r1, r6
    mov r0, r7
    bl call_1362
    cbnz r0, jump_13c0
    cmp r5, #0
    bne jump_13c8
jump_13c0:
    ldr r1, [r4]
    and r1, r1, #0x10
    str r1, [r4]
jump_13c8:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0xc9
.byte 0xfc
.byte 0x1
.byte 0x68
.byte 0x1
.byte 0xf0
.byte 0x19
.byte 0x1
.byte 0x1
.byte 0x60
.byte 0x10
.byte 0xbd
.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0xc1
.byte 0xfc
.byte 0x4
.byte 0x21
.byte 0x1
.byte 0x60
.byte 0x10
.byte 0xbd
.byte 0x10
.byte 0xb5
.byte 0x0
.byte 0xf0
.byte 0xbb
.byte 0xfc
.byte 0x40
.byte 0x21
.byte 0x81
.byte 0x60
.byte 0x2
.byte 0x68
.byte 0x24
.byte 0x21
.byte 0x91
.byte 0x43
.byte 0x1
.byte 0x60
.byte 0x10
.byte 0xbd

call_13fc:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r2
    mov r8, r1
    mov r7, r0
    bl call_12f4
    mov r6, r0
    mov r0, r7
    bl call_1d64
    mov r5, r0
    movs r1, #0
    mov r0, r7
    bl call_132a
    cmp r4, r6
    bhi jump_1422
    cbz r0, jump_1428
jump_1422:
    movs r0, #0
jump_1424:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_1428:
    mov r0, r7
    bl call_12b8
    mov r1, r0
    adds r0, r4, #3
    lsrs r2, r0, #2
    mov r0, r8
    bl call_1d54
    str r4, [r5, #0xc]
    movs r0, #2
    str r0, [r5]
    mov r0, r4
    b jump_1424
call_1444:
    ldr r1, [pc, #8] /* data_1450 */ 
    ldr r2, [r1, #4]
    orrs r2, r0
    str r2, [r1, #4]
    bx lr

.byte 0x0
.byte 0x0

data_1450:
.word 0x400a8000

.byte 0x3
.byte 0x46
.byte 0x7
.byte 0x21
.byte 0x1
.byte 0xf1
.byte 0x8
.byte 0x2
.byte 0x23
.byte 0xfa
.byte 0x2
.byte 0xf0
.byte 0xc2
.byte 0x7
.byte 0x1
.byte 0xd0
.byte 0x48
.byte 0xb2
.byte 0x70
.byte 0x47
.byte 0x49
.byte 0x1e
.byte 0x0
.byte 0x29
.byte 0xf4
.byte 0xdc
.byte 0x4f
.byte 0xf0
.byte 0xff
.byte 0x30
.byte 0x70
.byte 0x47
.byte 0x2
.byte 0x48
.byte 0x41
.byte 0x68
.byte 0x80
.byte 0x68
.byte 0x8
.byte 0x40
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x80
.byte 0xa
.byte 0x40
.byte 0x2
.byte 0x48
.byte 0x1
.byte 0x68
.byte 0x41
.byte 0xf0
.byte 0xc
.byte 0x1
.byte 0x1
.byte 0x60
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x80
.byte 0xa
.byte 0x40

call_1494:
    ldr r0, [pc, #8] /* data_14a0 */ 
    ldr r1, [r0]
    and r1, r1, #0x400
    str r1, [r0]
    bx lr

data_14a0:
.word 0x400a8000

jump_14a4:
    push {r4, lr}
    mov r4, r0
    ldr r0, [pc, #0x68] /* data_1514 */ 
    ldr r2, [r0]
    cmp r2, #1
    bne jump_1510
    movs r2, #0
    str r2, [r0]
    ldr r0, [pc, #0x60] /* data_1518 */ 
    ldr r2, [r0]
    lsls r3, r2, #0x19
    mov.w r2, #-1
    bpl jump_14da
    movw r3, #0x40c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_14d0
    movs r0, #0
    bl call_708
jump_14d0:
    ldr r0, [r4]
    pop.w {r4, lr}
    b.w call_1444
jump_14da:
    movw r3, #0xc0c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_14ea
    movs r0, #0
    bl call_708
jump_14ea:
    movs r0, #0
    bl call_1248
    ldr r0, [r4]
    bl call_1444
    movs r0, #0
    bl call_1264
    movs r1, #0xc8
    movs r0, #0
jump_1500:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, r1
    blo jump_1500
    pop.w {r4, lr}
    movs r0, #1
    b.w call_1264
jump_1510:
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_1514:
.word 0x20000000
data_1518:
.word 0x400a8000

jump_151c:
    movw r1, #0x111d
    str r1, [r0]
    ldr r1, [pc, #0x28] /* data_154c */ 
    str r1, [r0, #4]
    movw r1, #0x212
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_1550 */ 
    str r1, [r0, #0xc]
    ldr r2, [pc, #0x20] /* data_1554 */ 
    movs r1, #0x10
    strd r1, r2, [r0, #0x10]
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x1c] /* data_1558 */ 
    str r1, [r0, #0x1c]
    movs r1, #0
    str r1, [r0, #0x20]
    ldr r1, [pc, #0x18] /* data_155c */ 
    str r1, [r0, #0x24]
    movs r1, #2
    str r1, [r0, #0x28]
    bx lr

data_154c:
.word 0x80010008
data_1550:
.word 0x91002088
data_1554:
.word 0x92010090
data_1558:
.word 0x930100d0
data_155c:
.word 0x84010110

get_event:
    push {r4, lr}
    ldr r4, [pc, #0x48] /* data_15ac */ 
    ldrb.w r0, [r4, #0x32]
    cmp r0, #3
    bne jump_1570
    bl call_1d74
jump_1570:
    ldr r1, [pc, #0x3c] /* data_15b0 */ 
    ldrb r0, [r1, #4]
    cbz r0, jump_1596
    cmp r0, #1
    beq jump_158e
    cmp r0, #2
    bne jump_159e
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    bne jump_158a
    bl call_18bc
jump_158a:
    movs r0, #2
    pop {r4, pc}
jump_158e:
    movs r0, #0
    strb r0, [r1, #4]
    movs r0, #3
    pop {r4, pc}
jump_1596:
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    beq jump_15a2
jump_159e:
    movs r0, #0
    pop {r4, pc}
jump_15a2:
    movs r0, #2
    strb r0, [r1, #4]
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_15ac:
.word 0x20000304
data_15b0:
.word 0x2000001c

.byte 0x2
.byte 0x49
.byte 0xa
.byte 0x68
.byte 0x2
.byte 0x60
.byte 0x49
.byte 0x68
.byte 0x41
.byte 0x60
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0xa0
.byte 0xa
.byte 0x40

jump_15c4:
    ldr r0, [pc, #8] /* data_15d0 */ 
    ldr r1, [r0]
    orr r1, r1, #0x20
    str r1, [r0]
    bx lr

data_15d0:
.word 0x400a8000

.byte 0x3
.byte 0x49
.byte 0xa
.byte 0x68
.byte 0x42
.byte 0xf4
.byte 0x80
.byte 0x72
.byte 0xa
.byte 0x60
.byte 0x8
.byte 0x61
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x80
.byte 0xa
.byte 0x40
.byte 0x1
.byte 0x48
.byte 0xff
.byte 0xf7
.byte 0x21
.byte 0xbd
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x3
.byte 0x0
.byte 0x20

.thumb_func
call_15f4:
    ldr r0, [pc, #0x14] /* data_160c */ 
    ldr r1, [r0, #0x30]
    orr r1, r1, #0x10
    str r1, [r0, #0x30]
    ldr r0, [pc, #0x10] /* data_1610 */ 
    movw r1, #0x5fff
    str r1, [r0, #8]
    ldr r1, [pc, #0xc] /* data_1614 */ 
    str r1, [r0, #4]
    bx lr

data_160c:
.word 0x40088000
data_1610:
.word 0x40068000
data_1614:
.word 0x1afff

call_1618:
    ldr r1, [pc, #8] /* data_1624 */ 
    ldr r0, [pc, #4] /* data_1620 */ 
    str r0, [r1]
    bx lr

data_1620:
.word 0x5fa00001
data_1624:
.word 0x40068000

generate:
    push {r4, r5, r6, lr}
    movs r1, #0
jump_162c:
    strb r1, [r0], #1
    .short 0x1c49 /* adds r1, r1, #1 */ 
    cmp r1, #0xff
    bls jump_162c
    movs r3, #0
    ldr r5, [pc, #0x28] /* data_1664 */ 
    mov r2, r3
    mov r1, r3
    sub.w r0, r0, #0x100
jump_1642:
    ldrb r6, [r5, r2]
    ldrb r4, [r0, r1]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    add r3, r4
    add r3, r6
    uxtb r3, r3
    uxtb r2, r2
    ldrb r6, [r0, r3]
    strb r6, [r0, r1]
    strb r4, [r0, r3]
    cmp r2, #8
    blo jump_165c
    movs r2, #0
jump_165c:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    cmp r1, #0xff
    bls jump_1642
    pop {r4, r5, r6, pc}

data_1664:
.word 0x1f44

firmware_check:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
    mov r6, r0
    movw r0, #0x3bf8
    sub sp, #0x104
    ldr r0, [r0]
    mov sb, r2
    mov r5, r1
    cmp.w r0, #0x3040000
    bne jump_168a
    movw r0, #0x3bfc
    ldrb r0, [r0]
    cmp r0, #1
    beq jump_1692
jump_168a:
    movs r0, #0
jump_168c:
    add sp, #0x104
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
jump_1692:
    ldr.w sl, [pc, #0xa0] /* data_1734 */ 
    mov.w r8, #0
    movw fp, #0x3bff
    cmp.w sb, #0
    beq jump_171e
    movs r1, #0
    mov.w r0, #0x2000
    movs r3, #1
    mov r2, r1
    bl ckcu_clocks_enable
    mov.w r1, #-1
    str.w r1, [sl, #4]
    movs r1, #0xe6
    str.w r1, [sl]
    b jump_171e
jump_16c2:
    ldrb.w r0, [fp]
    cmp r0, r5
    bls jump_16cc
    mov r0, r5
jump_16cc:
    uxtb r4, r0
    subs r5, r5, r4
    mov r0, sp
    bl generate
    movs r1, #0
    mov r0, r1
    b jump_1718
jump_16dc:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    ldrb.w r2, [sp, r1]
    add r0, r2
    uxtb r0, r0
    ldrb.w ip, [sp, r0]
    strb.w ip, [sp, r1]
    strb.w r2, [sp, r0]
    add r2, ip
    uxtb r2, r2
    ldrb r7, [r6]
    ldrb.w r2, [sp, r2]
    eors r7, r2
    cmp.w sb, #0
    beq jump_170c
    strb.w r7, [sl, #0xc]
    b jump_1716
jump_170c:
    subs r2, r1, #1
    lsls r2, r2, #0x1e
    lsrs r2, r2, #0x1b
    lsls r7, r2
    add r8, r7
jump_1716:
    .short 0x1c76 /* adds r6, r6, #1 */ 
jump_1718:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_16dc
jump_171e:
    cmp r5, #0
    bne jump_16c2
    cmp.w sb, #0
    beq jump_172e
    ldr.w r0, [sl, #8]
    b jump_168c
jump_172e:
    mov r0, r8
    b jump_168c

.byte 0x0
.byte 0x0

data_1734:
.word 0x4008a000

call_1738:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0xa0] /* data_17e0 */ 
    ldr r5, [pc, #0xa4] /* data_17e4 */ 
    ldr.w r8, [pc, #0xa4] /* data_17e8 */ 
    ldr r7, [pc, #0xa4] /* data_17ec */ 
    movs r6, #0xa
jump_1748:
    ldrd r0, r1, [r5]
    str r1, [r0, #0x28]
    .short 0x1e76 /* subs r6, r6, #1 */ 
    uxtb r6, r6
    .short 0x1ee4 /* subs r4, r4, #3 */ 
    nop 
    nop 
    movs r0, #0xff
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x16
    bmi jump_1762
    movs r0, #0xfe
jump_1762:
    ldr.w r2, [r8, #0x1c]
    mov r1, r8
    lsls r2, r2, #0x1a
    bmi jump_1770
    bic r0, r0, #2
jump_1770:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x19
    bmi jump_177a
    bic r0, r0, #4
jump_177a:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x18
    bmi jump_1784
    bic r0, r0, #8
jump_1784:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x14
    bmi jump_178e
    bic r0, r0, #0x10
jump_178e:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x12
    bmi jump_1798
    bic r0, r0, #0x20
jump_1798:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x11
    bmi jump_17a2
    bic r0, r0, #0x40
jump_17a2:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x10
    bmi jump_17ac
    bic r0, r0, #0x80
jump_17ac:
    ldrd r1, r2, [r5]
    str r2, [r1, #0x24]
    ldrb r1, [r4, #1]
    cmp r1, r0
    beq jump_17be
    strb r0, [r4, #1]
    movs r0, #3
    b jump_17ca
jump_17be:
    ldrb r0, [r4]
    cbz r0, jump_17cc
    cmp r0, #1
    bne jump_17c8
    strb r1, [r4, #2]
jump_17c8:
    .short 0x1e40 /* subs r0, r0, #1 */ 
jump_17ca:
    strb r0, [r4]
jump_17cc:
    cmp r6, #0
    beq jump_17da
    movs r0, #5
    bl call_102
    subs r5, #8
    b jump_1748
jump_17da:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_17e0:
.word 0x200000ec
data_17e4:
.word 0x206c
data_17e8:
.word 0x400b0000
data_17ec:
.word 0x400b4000

jump_17f0:
    push {r1, r2, r3, r4, r5, r6, r7, lr}
    ldr r0, [pc, #0x44] /* data_1838 */ 
    ldr r0, [r0]
    ldr r1, [pc, #0x44] /* data_183c */ 
    ldr r6, [pc, #0x44] /* data_1840 */ 
    udiv r4, r0, r1
    .short 0x1e64 /* subs r4, r4, #1 */ 
    strh.w r4, [sp]
    movs r5, #0
    strh.w r5, [sp, #2]
    mov r1, sp
    mov r0, r6
    bl call_4b0
    strb.w r5, [sp]
    movs r0, #7
    strh.w r0, [sp, #2]
    movs r0, #1
    strb.w r0, [sp, #4]
    strb.w r5, [sp, #5]
    lsrs r0, r4, #1
    strh.w r0, [sp, #6]
    mov r1, sp
    mov r0, r6
    bl call_458
    pop {r1, r2, r3, r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

data_1838:
.word 0x20000018
data_183c:
.word 0xdbba00
data_1840:
.word 0x4006f000

call_1844:
    push {r4, lr}
    ldr r1, [pc, #0x28] /* data_1870 */ 
    mov.w r4, #0x8000
    str r4, [r1, #0x28]
    nop 
    nop 
    str r4, [r1, #0x24]
    mov.w r2, #0x4000
    b jump_1864
jump_185a:
    str r2, [r1, #0x28]
    nop 
    nop 
    str r2, [r1, #0x24]
    nop 
jump_1864:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_185a
    str r4, [r1, #0x28]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_1870:
.word 0x400b0000

call_1874:
    push {r4, r5, r6, r7, lr}
    movs r2, #4
    ldr r3, [pc, #0x24] /* data_18a0 */ 
    lsls r4, r2, #0xc
    ldr r5, [pc, #0x24] /* data_18a4 */ 
    movw r6, #0xffff
    b jump_1898
jump_1884:
    nop 
    str r4, [r5, #0x28]
    lsls r7, r0, #0x10
    bpl jump_1890
    str r2, [r3, #0x24]
    b jump_1892
jump_1890:
    str r2, [r3, #0x28]
jump_1892:
    str r4, [r5, #0x24]
    and.w r0, r6, r0, lsl #1
jump_1898:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_1884
    pop {r4, r5, r6, r7, pc}

data_18a0:
.word 0x400b4000
data_18a4:
.word 0x400b0000

.byte 0x1
.byte 0x21
.byte 0x81
.byte 0x40
.byte 0x2
.byte 0x48
.byte 0x42
.byte 0x79
.byte 0x11
.byte 0x43
.byte 0x41
.byte 0x71
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x1c
.byte 0x0
.byte 0x0
.byte 0x20

call_18bc:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r0, [pc, #0xcc] /* data_1990 */ 
    ldrb r1, [r0]
    movs r4, #0
    sub.w r5, r0, #0xa
    cmp r1, #1
    bne jump_18da
    strb r4, [r0]
    ldrb r0, [r5, #0x10]
    and r0, r0, #7
    bl call_3f2
jump_18da:
    ldr r6, [pc, #0xb8] /* data_1994 */ 
    ldr r7, [pc, #0xb8] /* data_1998 */ 
    ldrb r0, [r6]
    cbz r0, jump_18ee
    cmp r0, #2
    beq jump_1918
    cmp r0, #4
    beq jump_18ee
    cmp r0, #5
    bne jump_192a
jump_18ee:
    ldrb r0, [r5, #5]
    lsls r0, r0, #0x1b
    bpl jump_192a
    movs r0, #1
    strb r0, [r6]
    movs r2, #0x40
    ldr r1, [pc, #0xa0] /* data_199c */ 
    movs r0, #4
    bl call_139c
    ldr r2, [pc, #0x98] /* data_199c */ 
    rsb.w r1, r0, #0x40
    add r0, r2
    bl mem_zero
    ldrb r0, [r5, #5]
    bic r0, r0, #0x10
    strb r0, [r5, #5]
    b jump_192a
jump_1918:
    ldr r0, [r7, #0x50]
    lsls r0, r0, #0x1e
    bpl jump_192a
    movs r2, #0x40
    ldr r1, [pc, #0x78] /* data_199c */ 
    movs r0, #3
    bl call_13fc
    strb r4, [r6]
jump_192a:
    ldr r0, [r7, #0x28]
    lsls r0, r0, #0x1e
    bpl jump_1960
    ldrb r0, [r5]
    cbz r0, jump_1938
    strb r4, [r5]
    b jump_1954
jump_1938:
    ldr r1, [pc, #0x64] /* data_19a0 */ 
    ldr r0, [r1]
    cbnz r0, jump_1960
    add.w r0, r1, #0xc
    ldr r0, [r0]
    cbz r0, jump_1960
    mov.w r2, #0xfa0
    muls r0, r2, r0
    asrs r2, r2, #3
    udiv r0, r0, r2
    str r0, [r1]
jump_1954:
    ldr r1, [pc, #0x38] /* data_1990 */ 
    movs r2, #8
    adds r1, #0x12
    movs r0, #1
    bl call_13fc
jump_1960:
    ldr r0, [r7, #0x3c]
    lsls r0, r0, #0x1e
    bpl jump_198c
    ldrb r0, [r5, #2]
    cbz r0, jump_1974
    ldr r1, [pc, #0x24] /* data_1990 */ 
    movs r2, #5
    strb r4, [r5, #2]
    adds r1, #0xa
    b jump_1982
jump_1974:
    ldrb r0, [r5, #1]
    cmp r0, #0
    beq jump_198c
    ldr r1, [pc, #0x14] /* data_1990 */ 
    movs r2, #2
    strb r4, [r5, #1]
    .short 0x1e89 /* subs r1, r1, #2 */ 
jump_1982:
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r0, #2
    b.w call_13fc
jump_198c:
    pop.w {r4, r5, r6, r7, r8, pc}

data_1990:
.word 0x20000026
data_1994:
.word 0x20000004
data_1998:
.word 0x400a8000
data_199c:
.word 0x20000084
data_19a0:
.word 0x200002ec

.byte 0xf0
.byte 0xb5
.byte 0x1
.byte 0x88
.byte 0x4f
.byte 0xf4
.byte 0x80
.byte 0x76
.byte 0x40
.byte 0xf6
.byte 0x21
.byte 0x15
.byte 0x77
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x32
.byte 0x4c
.byte 0xa1
.byte 0xf6
.byte 0x21
.byte 0x13
.byte 0xa9
.byte 0x42
.byte 0x37
.byte 0xd0
.byte 0xd
.byte 0xdc
.byte 0x13
.byte 0xf5
.byte 0xf0
.byte 0x61
.byte 0x13
.byte 0xd0
.byte 0xb1
.byte 0x42
.byte 0x2b
.byte 0xd0
.byte 0xb9
.byte 0x42
.byte 0x40
.byte 0xd1
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x29
.byte 0x3d
.byte 0xd1
.byte 0x2b
.byte 0x49
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x12
.byte 0x4e
.byte 0xe0
.byte 0x0
.byte 0x25
.byte 0xb3
.byte 0x42
.byte 0x38
.byte 0xd0
.byte 0xbb
.byte 0x42
.byte 0x34
.byte 0xd1
.byte 0x83
.byte 0x88
.byte 0x81
.byte 0x78
.byte 0x93
.byte 0xb3
.byte 0x44
.byte 0xe0
.byte 0xc5
.byte 0x78
.byte 0x83
.byte 0x78
.byte 0xc4
.byte 0x88
.byte 0x81
.byte 0x88
.byte 0x1
.byte 0x2d
.byte 0x2a
.byte 0xd1
.byte 0x51
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x27
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x25
.byte 0xd1
.byte 0x1
.byte 0x2b
.byte 0x7
.byte 0xd0
.byte 0x2
.byte 0x2b
.byte 0x21
.byte 0xd1
.byte 0x1d
.byte 0x49
.byte 0x11
.byte 0x31
.byte 0x4
.byte 0xe0
.byte 0x1c
.byte 0x49
.byte 0x19
.byte 0x31
.byte 0x1
.byte 0xe0
.byte 0x1a
.byte 0x49
.byte 0x49
.byte 0x1d
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x14
.byte 0x2b
.byte 0xe0
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x29
.byte 0x13
.byte 0xd1
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x42
.byte 0x25
.byte 0xe0
.byte 0xc2
.byte 0x78
.byte 0xc3
.byte 0x88
.byte 0x81
.byte 0x88
.byte 0x3
.byte 0x62
.byte 0x2
.byte 0x2a
.byte 0xa
.byte 0xd1
.byte 0x0
.byte 0x29
.byte 0x8
.byte 0xd1
.byte 0x11
.byte 0x4a
.byte 0xd
.byte 0x32
.byte 0xc2
.byte 0x61
.byte 0x10
.byte 0x4a
.byte 0xc0
.byte 0xe9
.byte 0xa
.byte 0x21
.byte 0x2
.byte 0x21
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x10
.byte 0xf0
.byte 0xbd
.byte 0xe
.byte 0xe0
.byte 0x83
.byte 0x88
.byte 0xc1
.byte 0x78
.byte 0x0
.byte 0x2b
.byte 0xf9
.byte 0xd1
.byte 0x4f
.byte 0xf4
.byte 0x7a
.byte 0x63
.byte 0x21
.byte 0x60
.byte 0x59
.byte 0x43
.byte 0xdb
.byte 0x10
.byte 0xb1
.byte 0xfb
.byte 0xf3
.byte 0xf1
.byte 0x5
.byte 0x4b
.byte 0xc
.byte 0x3b
.byte 0x19
.byte 0x60
.byte 0x2
.byte 0xe0
.byte 0x4
.byte 0x4b
.byte 0xdb
.byte 0x1e
.byte 0xd9
.byte 0x70
.byte 0x5
.byte 0x62
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x20
.byte 0xe7
.byte 0xe7
.byte 0xf8
.byte 0x2
.byte 0x0
.byte 0x20
.byte 0x1f
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x8d
.byte 0x1a
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x4a
.byte 0x1
.byte 0x21
.byte 0x11
.byte 0x54
.byte 0x70
.byte 0x47
.byte 0x26
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xc2
.byte 0x78
.byte 0x81
.byte 0x88
.byte 0x1
.byte 0x23
.byte 0x21
.byte 0x2a
.byte 0x7
.byte 0xd0
.byte 0x22
.byte 0x2a
.byte 0x21
.byte 0xd1
.byte 0xa9
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x17
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x1a
.byte 0xd1
.byte 0x1c
.byte 0xe0
.byte 0x21
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x5
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x6
.byte 0xd1
.byte 0x7
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x9
.byte 0x31
.byte 0x1
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x22
.byte 0x31
.byte 0xc1
.byte 0x61
.byte 0x9
.byte 0x21
.byte 0xa
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x42
.byte 0x31
.byte 0xf9
.byte 0xe7
.byte 0x8
.byte 0x49
.byte 0xc1
.byte 0x61
.byte 0x40
.byte 0x21
.byte 0x3
.byte 0xe0
.byte 0x6
.byte 0x49
.byte 0x8c
.byte 0x39
.byte 0xc1
.byte 0x61
.byte 0x22
.byte 0x21
.byte 0x1
.byte 0x62
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x30
.byte 0x70
.byte 0x47
.byte 0x2
.byte 0x49
.byte 0x68
.byte 0x39
.byte 0xc1
.byte 0x61
.byte 0x65
.byte 0x21
.byte 0xf6
.byte 0xe7
.byte 0x0
.byte 0x0
.byte 0x48
.byte 0x21
.byte 0x0
.byte 0x0
.byte 0x70
.byte 0xb5
.byte 0x4
.byte 0x46
.byte 0x0
.byte 0x20
.byte 0xff
.byte 0xf7
.byte 0xf7
.byte 0xfb
.byte 0x5
.byte 0x46
.byte 0x20
.byte 0x6a
.byte 0x41
.byte 0x1c
.byte 0x16
.byte 0xd0
.byte 0x94
.byte 0xf8
.byte 0x24
.byte 0x10
.byte 0x1
.byte 0x29
.byte 0x12
.byte 0xd1
.byte 0xa8
.byte 0x42
.byte 0x2
.byte 0xd3
.byte 0x40
.byte 0x1b
.byte 0x20
.byte 0x62
.byte 0x5
.byte 0xe0
.byte 0x5
.byte 0x46
.byte 0x0
.byte 0x20
.byte 0x20
.byte 0x62
.byte 0x2
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0x2a
.byte 0x46
.byte 0x0
.byte 0x20
.byte 0xe1
.byte 0x69
.byte 0xff
.byte 0xf7
.byte 0x63
.byte 0xfc
.byte 0xe0
.byte 0x69
.byte 0x28
.byte 0x44
.byte 0xe0
.byte 0x61
.byte 0x70
.byte 0xbd
.byte 0x0
.byte 0x0
.byte 0x10
.byte 0xb5
.byte 0x4
.byte 0x46
.byte 0x0
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0x20
.byte 0x62
.byte 0x20
.byte 0x78
.byte 0x10
.byte 0xf0
.byte 0x60
.byte 0x0
.byte 0x2
.byte 0xd0
.byte 0x20
.byte 0x28
.byte 0x9
.byte 0xd1
.byte 0x3
.byte 0xe0
.byte 0x20
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x40
.byte 0xf8
.byte 0x4
.byte 0xe0
.byte 0x10
.byte 0x48
.byte 0x41
.byte 0x69
.byte 0x9
.byte 0xb1
.byte 0x20
.byte 0x46
.byte 0x88
.byte 0x47
.byte 0x94
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0x1
.byte 0x28
.byte 0x6
.byte 0xd0
.byte 0x2
.byte 0x28
.byte 0xe
.byte 0xd0
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0x0
.byte 0x20
.byte 0xff
.byte 0xf7
.byte 0x2d
.byte 0xbc
.byte 0xe0
.byte 0x88
.byte 0x21
.byte 0x6a
.byte 0x81
.byte 0x42
.byte 0x0
.byte 0xdd
.byte 0x20
.byte 0x62
.byte 0x20
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0xff
.byte 0xf7
.byte 0xb3
.byte 0xbf
.byte 0x0
.byte 0x22
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0x11
.byte 0x46
.byte 0x10
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0x2c
.byte 0xbc
.byte 0x14
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x10
.byte 0xb5
.byte 0x4
.byte 0x46
.byte 0x0
.byte 0x20
.byte 0x60
.byte 0x76
.byte 0x49
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x9
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x10
.byte 0xd1
.byte 0x20
.byte 0x79
.byte 0x0
.byte 0xf0
.byte 0xf
.byte 0x0
.byte 0xff
.byte 0xf7
.byte 0x9f
.byte 0xfb
.byte 0x1
.byte 0xe0
.byte 0x94
.byte 0xf8
.byte 0x34
.byte 0x0
.byte 0x20
.byte 0x76
.byte 0x4
.byte 0xf1
.byte 0x18
.byte 0x0
.byte 0xe0
.byte 0x61
.byte 0x2
.byte 0x20
.byte 0x20
.byte 0x62
.byte 0x1
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x0
.byte 0x10
.byte 0xbd
.byte 0x0
.byte 0x0
.byte 0x70
.byte 0xb5
.byte 0x4
.byte 0x46
.byte 0x0
.byte 0x88
.byte 0x1
.byte 0x25
.byte 0xb0
.byte 0xf5
.byte 0xa0
.byte 0x6f
.byte 0x4f
.byte 0xd0
.byte 0x20
.byte 0xdc
.byte 0xb0
.byte 0xf5
.byte 0x80
.byte 0x7f
.byte 0x44
.byte 0xd0
.byte 0xb
.byte 0xdc
.byte 0x80
.byte 0x28
.byte 0x3d
.byte 0xd0
.byte 0x81
.byte 0x28
.byte 0x3d
.byte 0xd0
.byte 0x82
.byte 0x28
.byte 0x66
.byte 0xd1
.byte 0x2
.byte 0x21
.byte 0x20
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0x70
.byte 0x40
.byte 0xff
.byte 0xf7
.byte 0xcc
.byte 0xbf
.byte 0xb0
.byte 0xf5
.byte 0x81
.byte 0x7f
.byte 0x36
.byte 0xd0
.byte 0xb0
.byte 0xf5
.byte 0x40
.byte 0x7f
.byte 0x35
.byte 0xd0
.byte 0xa0
.byte 0xf5
.byte 0x40
.byte 0x70
.byte 0x2
.byte 0x38
.byte 0x56
.byte 0xd1
.byte 0x1
.byte 0x22
.byte 0x2
.byte 0x21
.byte 0x20
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0x70
.byte 0x40
.byte 0x0
.byte 0xf0
.byte 0x6b
.byte 0xb8
.byte 0x33
.byte 0x49
.byte 0xb0
.byte 0xf5
.byte 0x10
.byte 0x6f
.byte 0x4e
.byte 0xd0
.byte 0xf
.byte 0xdc
.byte 0xb0
.byte 0xf5
.byte 0xd0
.byte 0x6f
.byte 0x2c
.byte 0xd0
.byte 0xa0
.byte 0xf5
.byte 0xc0
.byte 0x60
.byte 0x81
.byte 0x38
.byte 0x44
.byte 0xd0
.byte 0xa0
.byte 0xf5
.byte 0x80
.byte 0x70
.byte 0xff
.byte 0x38
.byte 0x3f
.byte 0xd1
.byte 0x4
.byte 0xf1
.byte 0x30
.byte 0x0
.byte 0xc4
.byte 0xe9
.byte 0x7
.byte 0x5
.byte 0x38
.byte 0xe0
.byte 0xa0
.byte 0xf5
.byte 0x20
.byte 0x60
.byte 0x81
.byte 0x38
.byte 0x4a
.byte 0xd0
.byte 0x80
.byte 0x28
.byte 0x34
.byte 0xd1
.byte 0xc8
.byte 0x68
.byte 0x0
.byte 0x28
.byte 0x31
.byte 0xd0
.byte 0x1
.byte 0x46
.byte 0x20
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0x70
.byte 0x40
.byte 0x8
.byte 0x47
.byte 0x0
.byte 0x21
.byte 0xc4
.byte 0xe7
.byte 0x1
.byte 0x21
.byte 0xc2
.byte 0xe7
.byte 0x0
.byte 0x22
.byte 0x2
.byte 0xe0
.byte 0x0
.byte 0x22
.byte 0xce
.byte 0xe7
.byte 0x1
.byte 0x22
.byte 0x0
.byte 0x21
.byte 0xcc
.byte 0xe7
.byte 0xa0
.byte 0x78
.byte 0xff
.byte 0xf7
.byte 0xa0
.byte 0xfc
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x50
.byte 0x5
.byte 0x20
.byte 0x2b
.byte 0xe0
.byte 0xe0
.byte 0x78
.byte 0x1
.byte 0x28
.byte 0xf
.byte 0xd0
.byte 0x2
.byte 0x28
.byte 0xf
.byte 0xd0
.byte 0x3
.byte 0x28
.byte 0x13
.byte 0xd1
.byte 0xa0
.byte 0x78
.byte 0x61
.byte 0x69
.byte 0x81
.byte 0x42
.byte 0xf
.byte 0xd9
.byte 0x21
.byte 0x69
.byte 0x51
.byte 0xf8
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x28
.byte 0xa
.byte 0xd0
.byte 0xe0
.byte 0x61
.byte 0x0
.byte 0x78
.byte 0x4
.byte 0xe0
.byte 0xa0
.byte 0x68
.byte 0xfa
.byte 0xe7
.byte 0xe0
.byte 0x68
.byte 0xe0
.byte 0x61
.byte 0x40
.byte 0x88
.byte 0x20
.byte 0x62
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x50
.byte 0x70
.byte 0xbd
.byte 0x88
.byte 0x68
.byte 0xc8
.byte 0xe7
.byte 0xa0
.byte 0x78
.byte 0x84
.byte 0xf8
.byte 0x30
.byte 0x0
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x50
.byte 0x1
.byte 0x25
.byte 0x7
.byte 0x49
.byte 0x68
.byte 0xb2
.byte 0xff
.byte 0xf7
.byte 0x28
.byte 0xfb
.byte 0x6d
.byte 0x1c
.byte 0x8
.byte 0x2d
.byte 0xf8
.byte 0xd3
.byte 0x6
.byte 0x20
.byte 0x84
.byte 0xf8
.byte 0x32
.byte 0x0
.byte 0x70
.byte 0xbd
.byte 0x8
.byte 0x69
.byte 0xb5
.byte 0xe7
.byte 0x0
.byte 0x0
.byte 0x14
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x70
.byte 0xb5
.byte 0x4
.byte 0x46
.byte 0x1
.byte 0x26
.byte 0x61
.byte 0xb1
.byte 0x2
.byte 0x29
.byte 0x9
.byte 0xd1
.byte 0x20
.byte 0x79
.byte 0x10
.byte 0xf0
.byte 0xf
.byte 0x5
.byte 0x3
.byte 0xd0
.byte 0x82
.byte 0xb1
.byte 0x28
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0x62
.byte 0xfb
.byte 0x84
.byte 0xf8
.byte 0x24
.byte 0x60
.byte 0x70
.byte 0xbd
.byte 0xa0
.byte 0x78
.byte 0x1
.byte 0x28
.byte 0xfb
.byte 0xd1
.byte 0x14
.byte 0xf8
.byte 0x34
.byte 0xf
.byte 0x62
.byte 0xf3
.byte 0x41
.byte 0x0
.byte 0x4
.byte 0xf8
.byte 0x10
.byte 0x9
.byte 0x26
.byte 0x70
.byte 0x70
.byte 0xbd
.byte 0xa0
.byte 0x6b
.byte 0x0
.byte 0x28
.byte 0xee
.byte 0xd1
.byte 0x28
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0xa8
.byte 0xfa
.byte 0x28
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0x9d
.byte 0xfa
.byte 0xe7
.byte 0xe7

call_1d54:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bmi jump_1d62
    ldr.w r3, [r0, r2, lsl #2]
    str.w r3, [r1, r2, lsl #2]
    b call_1d54
jump_1d62:
    bx lr
call_1d64:
    ldr r1, [pc, #8] /* data_1d70 */ 
    add.w r0, r0, r0, lsl #2
    add.w r0, r1, r0, lsl #2
    bx lr

data_1d70:
.word 0x400a8014

call_1d74:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r7, #0
    mov.w r1, #0x8000
    mov r2, r7
    mov sl, r1
    movs r3, #1
    mov r0, r2
    bl ckcu_clocks_enable
    ldr r0, [pc, #0x90] /* data_1e1c */ 
    bl call_1024
    ldr r5, [pc, #0x8c] /* data_1e20 */ 
    mov r4, r0
    movw r6, #0xeae0
    cmp r0, #1
    bne jump_1daa
    ldr r0, [r5, #0x54]
    orrs r0, r6
    str r0, [r5, #0x54]
    str r6, [r5, #0x58]
    ldr r0, [r5, #0x50]
    orrs r0, r6
    str r0, [r5, #0x50]
jump_1daa:
    ldr.w r8, [pc, #0x70] /* data_1e1c */ 
    ldrb.w r0, [r8, #0x32]
    cmp r0, #3
    bne jump_1df4
    ldr.w sb, [pc, #0x6c] /* data_1e24 */ 
    ldr.w r0, [sb]
    tst.w r0, #0xc0
    beq jump_1df4
    movs r0, #1
    bl call_55c
    ldr r1, [pc, #0x5c] /* data_1e28 */ 
    strb r7, [r1, #4]
    ldrb.w r0, [r8, #0x32]
    cmp r0, #3
    bne jump_1df4
    ldr.w r0, [sb]
    tst.w r0, #0xc0
    beq jump_1df4
    bl call_1618
    mov.w r0, #0x3e8
    bl call_102
    str r6, [r5, #0x58]
    movs r0, #0
    bl call_708
jump_1df4:
    ldr r0, [r5, #0x58]
    tst r0, r6
    beq jump_1e0c
    cmp r4, #1
    bne jump_1e0c
    ldr r0, [pc, #0x1c] /* data_1e1c */ 
    bl call_11b0
    cmp r0, #1
    bne jump_1e0c
    bl call_11c0
jump_1e0c:
    mov r2, r7
    mov r1, sl
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r3, #0
    mov r0, r2
    b.w ckcu_clocks_enable

data_1e1c:
.word 0x20000304
data_1e20:
.word 0x40024000
data_1e24:
.word 0x400a8000
data_1e28:
.word 0x2000001c

.byte 0x2
.byte 0xe0
.byte 0x8
.byte 0xc8
.byte 0x12
.byte 0x1f
.byte 0x8
.byte 0xc1
.byte 0x0
.byte 0x2a
.byte 0xfa
.byte 0xd1
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x20
.byte 0x1
.byte 0xe0
.byte 0x1
.byte 0xc1
.byte 0x12
.byte 0x1f
.byte 0x0
.byte 0x2a
.byte 0xfb
.byte 0xd1
.byte 0x70
.byte 0x47

check_fw_sp_pc:
    mov.w r0, #0x3400
    ldr r1, [r0]
    sub.w r1, r1, #0x20000000
    cmp.w r1, #0x4000
    bhi jump_1ea2
    adds r1, r0, #4
    ldr r1, [r1]
    sub.w r1, r1, #0x3400
    cmp.w r1, #0xc800
    bhs jump_1ea2
    movw r1, #0x3bf8
    ldr r1, [r1]
    cmp.w r1, #0x3040000
    bne jump_1ea2
    mov.w r1, #0x3000
    ldr.w r1, [r1, #0xb0]
    ubfx r2, r1, #0, #0x12
    sub.w r3, r2, #0x5a00
    subs r3, #0xa5
    bne jump_1ea2
    lsrs r2, r1, #0x12
    cmp r2, #0xe
    bhi jump_1ea2
    movw r1, #0x3078
    b jump_1e9a
jump_1e92:
    ldr r3, [r1]
    .short 0x1c5b /* adds r3, r3, #1 */ 
    beq jump_1ea2
    .short 0x1d09 /* adds r1, r1, #4 */ 
jump_1e9a:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_1e92
    b.w load_jump_fw
jump_1ea2:
    bx lr
.thumb_func
main:
    ldr r0, [pc, #0x90] /* data_1f38 */ 
    ldr r3, [r0]
    ldr r2, [pc, #0x90] /* data_1f3c */ 
    adds r1, r2, #5
    cmp r3, r2
    blo jump_1eb6
    ldr r3, [r0]
    cmp r3, r1
    bls jump_1eba
jump_1eb6:
    str r2, [r0]
    b jump_1ec6
jump_1eba:
    ldr r2, [r0]
    cmp r2, r1
    bhs jump_1ec6
    ldr r2, [r0]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    b jump_1eb6
jump_1ec6:
    ldr r0, [r0]
    cmp r0, r1
    beq jump_1ed0
    bl check_fw_sp_pc
jump_1ed0:
    bl call_5ec
    bl call_214
    bl call_bb4
    bl call_6d0
    bl call_cd4
    bl call_5c8
    movs r0, #1
    bl call_55c
    bl call_11dc
    ldr r4, [pc, #0x4c] /* data_1f40 */ 
jump_1ef4:
    bl get_event
    cmp r0, #1
    beq jump_1f0c
    cmp r0, #2
    beq jump_1f20
    cmp r0, #3
    bne jump_1f32
    movs r0, #1
    bl call_55c
    b jump_1f32
jump_1f0c:
    movs r0, #0
    bl call_55c
    bl call_e08
    bl call_6fe
    movs r0, #0
    bl call_b5c
jump_1f20:
    bl handle_frame
    bl call_af8
    ldrb r0, [r4]
    cbnz r0, jump_1f32
    movs r0, #1
    bl call_798
jump_1f32:
    bl call_1618
    b jump_1ef4

data_1f38:
.word 0x20003ffc
data_1f3c:
.word 0x55aafaf0
data_1f40:
.word 0x20000004

.byte 0x1
.byte 0x23
.byte 0x45
.byte 0x67
.byte 0x89
.byte 0xab
.byte 0xcd
.byte 0xef
.byte 0x8
.byte 0x9
.byte 0xa
.byte 0xb
.byte 0xc
.byte 0xd
.byte 0xe
.byte 0xf
.byte 0x10
.byte 0x11
.byte 0x12
.byte 0x13
.byte 0x14
.byte 0x15
.byte 0x16
.byte 0x17
.byte 0x18
.byte 0x19
.byte 0x1a
.byte 0x1b
.byte 0x1c
.byte 0x1d
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x28
.byte 0x29
.byte 0x2a
.byte 0x2b
.byte 0x2c
.byte 0x2d
.byte 0x2e
.byte 0x2f
.byte 0x30
.byte 0x31
.byte 0x32
.byte 0x33
.byte 0x34
.byte 0x35
.byte 0x36
.byte 0x37
.byte 0x38
.byte 0x39
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x29
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x2b
.byte 0x14
.byte 0x1a
.byte 0x8
.byte 0x15
.byte 0x17
.byte 0x1c
.byte 0x18
.byte 0x39
.byte 0x4
.byte 0x16
.byte 0x7
.byte 0x9
.byte 0xa
.byte 0xb
.byte 0xd
.byte 0xe1
.byte 0x1d
.byte 0x1b
.byte 0x6
.byte 0x19
.byte 0x5
.byte 0x11
.byte 0x10
.byte 0xe0
.byte 0xe3
.byte 0xe2
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x2d
.byte 0x2a
.byte 0x64
.byte 0x0
.byte 0x2e
.byte 0xc
.byte 0x12
.byte 0x13
.byte 0x2f
.byte 0x31
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0xe
.byte 0xf
.byte 0x33
.byte 0x34
.byte 0x28
.byte 0x0
.byte 0x0
.byte 0x2c
.byte 0x36
.byte 0x37
.byte 0x38
.byte 0xe5
.byte 0x35
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0x0
.byte 0xe4
.byte 0xc0
.byte 0xc1
.byte 0xc2
.byte 0xc3
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

gpio_map_3:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x2
.byte 0x9
.byte 0x0
.byte 0x5
.byte 0x0
.byte 0x6
.byte 0x0
.byte 0x7
.byte 0x2
.byte 0xb
.byte 0x2
.byte 0xd
.byte 0x2
.byte 0xe
.byte 0x2
.byte 0xf

gpio_map_2:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x60
.byte 0xb
.byte 0x40
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0

gpio_map_1:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x34
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0xf8
.byte 0x21
.byte 0x0
.byte 0x0

usb_report1_desc:
.byte 0x6
.byte 0x0
.byte 0xff
.byte 0x9
.byte 0x1
.byte 0xa1
.byte 0x1
.byte 0x9
.byte 0x2
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xff
.byte 0x0
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x40
.byte 0x81
.byte 0x2
.byte 0x9
.byte 0x3
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xff
.byte 0x0
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x40
.byte 0x91
.byte 0x2
.byte 0xc0
.byte 0x0
.byte 0x0
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x80
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x1
.byte 0x19
.byte 0x81
.byte 0x29
.byte 0x83

usb_report2_desc:
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x95
.byte 0x3
.byte 0x75
.byte 0x1
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x5
.byte 0x81
.byte 0x1
.byte 0xc0
.byte 0x5
.byte 0xc
.byte 0x9
.byte 0x1
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x2
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x95
.byte 0x12
.byte 0x75
.byte 0x1
.byte 0xa
.byte 0x83
.byte 0x1
.byte 0xa
.byte 0x8a
.byte 0x1
.byte 0xa
.byte 0x92
.byte 0x1
.byte 0xa
.byte 0x94
.byte 0x1
.byte 0x9
.byte 0xcd
.byte 0x9
.byte 0xb7
.byte 0x9
.byte 0xb6
.byte 0x9
.byte 0xb5
.byte 0x9
.byte 0xe2
.byte 0x9
.byte 0xea
.byte 0x9
.byte 0xe9
.byte 0xa
.byte 0x21
.byte 0x2
.byte 0xa
.byte 0x23
.byte 0x2
.byte 0xa
.byte 0x24
.byte 0x2
.byte 0xa
.byte 0x25
.byte 0x2
.byte 0xa
.byte 0x26
.byte 0x2
.byte 0xa
.byte 0x27
.byte 0x2
.byte 0xa
.byte 0x2a
.byte 0x2
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0xe
.byte 0x81
.byte 0x1
.byte 0xc0
.byte 0x0
.byte 0x0
.byte 0x0

usb_report0_desc:
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x6
.byte 0xa1
.byte 0x1
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0xe0
.byte 0x29
.byte 0xe7
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x75
.byte 0x1
.byte 0x95
.byte 0x8
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x8
.byte 0x81
.byte 0x3
.byte 0x95
.byte 0x3
.byte 0x75
.byte 0x1
.byte 0x5
.byte 0x8
.byte 0x19
.byte 0x1
.byte 0x29
.byte 0x3
.byte 0x91
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x5
.byte 0x91
.byte 0x3
.byte 0x95
.byte 0x6
.byte 0x75
.byte 0x8
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xa4
.byte 0x0
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0x0
.byte 0x29
.byte 0xa4
.byte 0x81
.byte 0x0
.byte 0xc0

usb_descriptors:
.byte 0x9
.byte 0x2
.byte 0x5b
.byte 0x0
.byte 0x3
.byte 0x1
.byte 0x0
.byte 0xa0
.byte 0x32
.byte 0x9
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x3
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x40
.byte 0x0
.byte 0x7
.byte 0x5
.byte 0x81
.byte 0x3
.byte 0x8
.byte 0x0
.byte 0x1
.byte 0x9
.byte 0x4
.byte 0x1
.byte 0x0
.byte 0x2
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x22
.byte 0x0
.byte 0x7
.byte 0x5
.byte 0x83
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x7
.byte 0x5
.byte 0x4
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x9
.byte 0x4
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x65
.byte 0x0
.byte 0x7
.byte 0x5
.byte 0x82
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x12
.byte 0x1
.byte 0x10
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xd9
.byte 0x4
.byte 0x67
.byte 0x11
.byte 0x3
.byte 0x11
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x18
.byte 0x3
.byte 0x55
.byte 0x0
.byte 0x53
.byte 0x0
.byte 0x42
.byte 0x0
.byte 0x2d
.byte 0x0
.byte 0x48
.byte 0x0
.byte 0x49
.byte 0x0
.byte 0x44
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x49
.byte 0x0
.byte 0x41
.byte 0x0
.byte 0x50
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x5
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x99
.byte 0x1a
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xa5
.byte 0x19
.byte 0x0
.byte 0x0
.byte 0xa9
.byte 0x18
.byte 0x0
.byte 0x0
.byte 0x50
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x2c
.byte 0x1e
.byte 0x0
.byte 0x0
.byte 0x90
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x7
.byte 0x0
.byte 0x0
.byte 0x3a
.byte 0x1e
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xac
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xa2
.byte 0x4a
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
