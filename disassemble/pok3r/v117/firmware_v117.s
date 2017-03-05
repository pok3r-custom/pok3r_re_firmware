.syntax unified
.cpu cortex-m3
.text
.thumb


.byte 0x60
.byte 0x37
.byte 0x0
.byte 0x20

data_2c04:
.word reset
data_2c08:
.word nmi
data_2c0c:
.word hard_fault
data_2c10:
.word mcu_fault
data_2c14:
.word bus_fault
data_2c18:
.word usage_fault

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

data_2c2c:
.word svccall_intr
data_2c30:
.word debug_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_2c38:
.word pendsv_intr
data_2c3c:
.word systick_intr
data_2c40:
.word generic_intr
data_2c44:
.word generic_intr
data_2c48:
.word generic_intr
data_2c4c:
.word generic_intr
data_2c50:
.word generic_intr
data_2c54:
.word generic_intr
data_2c58:
.word generic_intr
data_2c5c:
.word generic_intr
data_2c60:
.word generic_intr
data_2c64:
.word generic_intr
data_2c68:
.word generic_intr
data_2c6c:
.word generic_intr
data_2c70:
.word generic_intr
data_2c74:
.word generic_intr
data_2c78:
.word generic_intr
data_2c7c:
.word generic_intr
data_2c80:
.word generic_intr
data_2c84:
.word generic_intr
data_2c88:
.word generic_intr
data_2c8c:
.word generic_intr
data_2c90:
.word generic_intr
data_2c94:
.word generic_intr
data_2c98:
.word generic_intr
data_2c9c:
.word generic_intr
data_2ca0:
.word generic_intr
data_2ca4:
.word generic_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_2cac:
.word generic_intr
data_2cb0:
.word generic_intr
data_2cb4:
.word generic_intr
data_2cb8:
.word generic_intr
data_2cbc:
.word generic_intr
data_2cc0:
.word generic_intr
data_2cc4:
.word generic_intr
data_2cc8:
.word generic_intr
data_2ccc:
.word generic_intr
data_2cd0:
.word generic_intr

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

data_2ce4:
.word bftm0_intr
data_2ce8:
.word bftm1_intr
data_2cec:
.word generic_intr
data_2cf0:
.word i2c1_intr
data_2cf4:
.word generic_intr
data_2cf8:
.word generic_intr
data_2cfc:
.word generic_intr
data_2d00:
.word generic_intr
data_2d04:
.word generic_intr
data_2d08:
.word generic_intr
data_2d0c:
.word generic_intr
data_2d10:
.word generic_intr
data_2d14:
.word usb_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_2d1c:
.word generic_intr
data_2d20:
.word generic_intr
data_2d24:
.word generic_intr
data_2d28:
.word generic_intr
data_2d2c:
.word generic_intr
data_2d30:
.word generic_intr
data_2d34:
.word generic_intr
data_2d38:
.word generic_intr

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

data_2d50:
.word generic_intr

.thumb_func
reset:
    ldr r0, [pc, #0x1c] /* data_2d74 */ 
    blx r0 /* watchdog_init */ 
    ldr r0, [pc, #0x1c] /* data_2d78 */ 
    blx r0 /* clock_init */ 
    ldr r0, [pc, #0x1c] /* data_2d7c */ 
    bx r0 /* entry */ 
.thumb_func
nmi:
    b nmi
.thumb_func
hard_fault:
    b hard_fault
.thumb_func
mcu_fault:
    b mcu_fault
.thumb_func
bus_fault:
    b bus_fault
.thumb_func
usage_fault:
    b usage_fault
.thumb_func
svccall_intr:
    b svccall_intr
.thumb_func
debug_intr:
    b debug_intr
.thumb_func
pendsv_intr:
    b pendsv_intr
.thumb_func
systick_intr:
    b systick_intr
.thumb_func
generic_intr:
    b generic_intr

data_2d74:
.word watchdog_init
data_2d78:
.word clock_init
data_2d7c:
.word entry

.thumb_func
entry:
    ldr.w sp, [pc, #0xc] /* data_2d90 */ 
    bl sram_init
call_2d88:
    ldr r0, [pc, #0] /* data_2d8c */ 
    bx r0 /* main */ 

data_2d8c:
.word main
data_2d90:
.word 0x20003760

rand:
    ldr r1, [pc, #0x18] /* data_2db0 */ 
    ldr r2, [pc, #0x1c] /* data_2db4 */ 
    ldr r0, [r1]
    muls r0, r2, r0
    movw r2, #0x3039
    add r0, r2
    str r0, [r1]
    lsrs r0, r0, #1
    bx lr
srand:
    ldr r1, [pc, #4] /* data_2db0 */ 
    str r0, [r1]
    bx lr

.byte 0x0
.byte 0x0

data_2db0:
.word 0x20000230
data_2db4:
.word 0x41c64e6d

memcpy:
    orr.w r3, r0, r1
    lsls r3, r3, #0x1e
    beq jump_2dc8
    b jump_2dd6
jump_2dc2:
    ldm r1!, {r3}
    .short 0x1f12 /* subs r2, r2, #4 */ 
    stm r0!, {r3}
jump_2dc8:
    cmp r2, #4
    bhs jump_2dc2
    b jump_2dd6
jump_2dce:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
jump_2dd6:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_2dce
    bx lr
sram_init:
    ldr r4, [pc, #0x18] /* data_2df8 */ 
    ldr r5, [pc, #0x1c] /* data_2dfc */ 
    b jump_2df0
jump_2de2:
    ldr r0, [r4, #0xc]
    orr r3, r0, #1
    ldm.w r4, {r0, r1, r2}
    blx r3
    adds r4, #0x10
jump_2df0:
    cmp r4, r5
    blo jump_2de2
    bl call_2d88

data_2df8:
.word task_1
data_2dfc:
.word sram_init_data

sram_decode_static:
    push {r4, r5, r6, lr}
    add.w r4, r1, r2
jump_2e06:
    ldrb r5, [r0], #1
    ands r3, r5, #7
    bne jump_2e14
    ldrb r3, [r0], #1
jump_2e14:
    asrs r2, r5, #4
    bne jump_2e26
    ldrb r2, [r0], #1
    b jump_2e26
jump_2e1e:
    ldrb r6, [r0], #1
    strb r6, [r1], #1
jump_2e26:
    .short 0x1e5b /* subs r3, r3, #1 */ 
    bne jump_2e1e
    lsls r3, r5, #0x1c
    bmi jump_2e3a
    movs r3, #0
jump_2e30:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bmi jump_2e54
    strb r3, [r1], #1
    b jump_2e30
jump_2e3a:
    ldrb r3, [r0], #1
    add.w r2, r2, #2
    sub.w r3, r1, r3
    b jump_2e50
jump_2e48:
    ldrb r5, [r3], #1
    strb r5, [r1], #1
jump_2e50:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bpl jump_2e48
jump_2e54:
    cmp r1, r4
    blo jump_2e06
    movs r0, #0
    pop {r4, r5, r6, pc}
function_e_32:
    push {r4, r5, r6, r7, lr}
    ldr r3, [pc, #0xe4] /* data_2f44 */ 
    ldr r6, [pc, #0xe4] /* data_2f48 */ 
    movs r5, #1
    ldrb r2, [r3, #1]
    and r1, r1, #1
    cmp r0, #0xe9
    beq jump_2e78
    cmp r0, #0xea
    beq jump_2e7e
    cmp r0, #0xeb
    bne jump_2e86
    b jump_2eb6
jump_2e78:
    bfi r2, r1, #0, #1
    b jump_2e82
jump_2e7e:
    bfi r2, r1, #1, #1
jump_2e82:
    strb r2, [r3, #1]
    str r5, [r6, #0x1c]
jump_2e86:
    subs r0, #0xec
    cmp r0, #0x11
    bhi jump_2f40
    ldr r2, [pc, #0xbc] /* data_2f4c */ 
    ldr.w ip, [pc, #0xb8] /* data_2f48 */ 
    cmp r0, #0x12
    ldrb r3, [r2, #1]
    ldrb r4, [r2, #2]
    ldrb r7, [r2, #3]
    sub.w ip, ip, #0x80
    bhs jump_2f3e
    tbb [pc, r0]

.byte 0xc
.byte 0xf
.byte 0x13
.byte 0x16
.byte 0x19
.byte 0x1c
.byte 0x1f
.byte 0x22
.byte 0x25
.byte 0x2b
.byte 0x30
.byte 0x37
.byte 0x3a
.byte 0x3e
.byte 0x41
.byte 0x44
.byte 0x47
.byte 0x4a

jump_2eb6:
    bfi r2, r1, #2, #1
    b jump_2e82
switch_2ebc:
    bfi r3, r1, #0, #1
    b jump_2ec6
switch_2ec2:
    bfi r3, r1, #1, #1
jump_2ec6:
    strb r3, [r2, #1]
    b jump_2f3e
switch_2eca:
    bfi r3, r1, #2, #1
    b jump_2ec6
switch_2ed0:
    bfi r3, r1, #3, #1
    b jump_2ec6
switch_2ed6:
    bfi r3, r1, #4, #1
    b jump_2ec6
switch_2edc:
    bfi r3, r1, #5, #1
    b jump_2ec6
switch_2ee2:
    bfi r3, r1, #6, #1
    b jump_2ec6
switch_2ee8:
    bfi r3, r1, #7, #1
    b jump_2ec6
switch_2eee:
    bfi r4, r1, #0, #1
    strb r4, [r2, #2]
    strb.w r5, [ip, #0x17]
    b jump_2f3e
switch_2efa:
    bfi r4, r1, #1, #1
    strb r4, [r2, #2]
    movs r0, #2
    b jump_2f0c
switch_2f04:
    bfi r4, r1, #2, #1
    strb r4, [r2, #2]
    movs r0, #4
jump_2f0c:
    strb.w r0, [ip, #0x17]
    b jump_2f3e
switch_2f12:
    bfi r4, r1, #3, #1
    b jump_2f1c
switch_2f18:
    bfi r4, r1, #4, #1
jump_2f1c:
    strb r4, [r2, #2]
    b jump_2f3e
switch_2f20:
    bfi r4, r1, #5, #1
    b jump_2f1c
switch_2f26:
    bfi r4, r1, #6, #1
    b jump_2f1c
switch_2f2c:
    bfi r4, r1, #7, #1
    b jump_2f1c
switch_2f32:
    bfi r7, r1, #0, #1
    b jump_2f3c
switch_2f38:
    bfi r7, r1, #1, #1
jump_2f3c:
    strb r7, [r2, #3]
jump_2f3e:
    str r5, [r6, #0x18]
jump_2f40:
    pop {r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

data_2f44:
.word 0x20000018
data_2f48:
.word 0x200000d8
data_2f4c:
.word 0x2000002c

afio_exti_ssr_write:
    push {r4, lr}
    movs r2, #0
    cmp r0, #0x1c
    bls jump_2f5e
    movs r2, #1
    subs r0, #0x20
    uxtb r0, r0
jump_2f5e:
    ldr r3, [pc, #0x14] /* data_2f74 */ 
    add.w r2, r3, r2, lsl #2
    ldr r3, [r2]
switch_2f66:
    movs r4, #0xf
    lsls r4, r0
    bics r3, r4
    lsls r1, r0
    orrs r1, r3
    str r1, [r2]
    pop {r4, pc}

data_2f74:
.word 0x40022000

handle_update_packet:
    push {r4, r5, r6, lr}
    ldr r0, [pc, #0x74] /* data_2ff0 */ 
    ldr r1, [r0]
    cmp r1, #1
    bne jump_2fec
    movs r6, #0
    str r6, [r0]
    ldr r4, [pc, #0x6c] /* data_2ff4 */ 
    ldr r5, [pc, #0x6c] /* data_2ff8 */ 
    str r6, [r4]
jump_2f8c:
    ldr r0, [r4]
    adds r1, r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    str r0, [r4]
    ldr r0, [pc, #0x64] /* data_2ffc */ 
    bl function_e_2
    ldr r0, [r4]
    cmp r0, #0x40
    blo jump_2f8c
    ldrh r4, [r5, #2]
    strb r6, [r5, #3]
    strb r6, [r5, #2]
    movs r2, #0x40
switch_2fa8:
    ldr r1, [pc, #0x4c] /* data_2ff8 */ 
    movs r0, #0
    bl crc16
    ldrb r1, [r5]
    cmp r1, #7
    bhi jump_2fba
    cmp r4, r0
    beq jump_2fc4
jump_2fba:
    movs r4, #0x46
    ldr r0, [pc, #0x3c] /* data_2ffc */ 
    bl clear_two_words
    b jump_2fde
jump_2fc4:
    mvn r0, #1
    bl function_e_4
    ldrb r3, [r5]
    ldr r4, [pc, #0x30] /* data_3000 */ 
    ldrd r1, r2, [r5, #4]
    ldr.w r3, [r4, r3, lsl #2]
    ldrb r0, [r5, #1]
    blx r3
    mov r4, r0
jump_2fde:
    mov r1, r4
    pop.w {r4, r5, r6, lr}
    ldr r0, [pc, #0x14] /* data_2ffc */ 
    subs r0, #0x10
    b.w function_14
jump_2fec:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_2ff0:
.word 0x20000028
data_2ff4:
.word 0x20000054
data_2ff8:
.word 0x200007cc
data_2ffc:
.word 0x20000368
data_3000:
.word update_handlers

function_e_33:
    ldr r0, [pc, #0x54] /* data_305c */ 
    push {r4, lr}
    ldr r1, [r0]
    uxth r1, r1
    orr r2, r1, #0x11000000
    ldr r1, [pc, #0x4c] /* data_3060 */ 
    str r2, [r1]
    ldr r2, [r0, #8]
    mov.w r3, #0x2c00
    orr.w r2, r3, r2, lsl #16
    str r2, [r1, #4]
    ldr r2, [r0, #4]
    ldr r0, [r0, #4]
    sub.w r2, r2, #0xa
    sub.w r0, r0, #0xa
    orr.w r0, r2, r0, lsl #16
    str r0, [r1, #8]
    mov.w r0, #0x2800
    str r0, [r1, #0xc]
    sub.w r1, r1, #0x44
    mov.w r2, #0x44
    sub.w r0, r1, #0x420
    bl clear_two_words_and_write_two_bytes
    ldr r1, [pc, #0x18] /* data_3064 */ 
    pop.w {r4, lr}
    mov.w r2, #0x400
    sub.w r0, r1, #0x10
    b.w clear_two_words_and_write_two_bytes

.byte 0x0
.byte 0x0

data_305c:
.word 0x40080180
data_3060:
.word 0x200007bc
data_3064:
.word 0x20000378

reset_cmd:
    movs r1, #1
    lsls r0, r1, #0x10
    bl ckcu_ahb_clock_enable
    ldr r1, [pc, #0x3c] /* data_30b0 */ 
    mov.w r0, #0x200
    str r0, [r1, #0x24]
    ldr r1, [pc, #0x38] /* data_30b4 */ 
    lsls r0, r0, #0xc
    mov.w r4, #-0x1fff2000
    str r0, [r1]
    bl usb_disable_dppu
    ldr r1, [pc, #0x34] /* data_30bc */ 
    ldr r0, [pc, #0x2c] /* data_30b8 */ 
switch_308a:
    str.w r0, [r1, #0x304]
    ldr r0, [pc, #0x30] /* data_30c0 */ 
jump_3090:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bne jump_3090
    dsb sy
    ldr.w r0, [r4, #0xd0c]
    ldr r1, [pc, #0x24] /* data_30c4 */ 
    and r0, r0, #0x700
    orr.w r0, r0, r1
    str.w r0, [r4, #0xd0c]
    dsb sy
jump_30ae:
    b jump_30ae

data_30b0:
.word 0x400b0000
data_30b4:
.word 0xe000e184
data_30b8:
.word 0x55aafaf5
data_30bc:
.word 0x40080000
data_30c0:
.word 0x61a80
data_30c4:
.word 0x5fa0004

.thumb_func
bftm0_intr:
    push {r4, r5, r6, lr}
    bl rand
    ldr r0, [pc, #0x120] /* data_31f0 */ 
    bl function_44
    ldr r0, [pc, #0x11c] /* data_31f4 */ 
    movs r2, #1
    ldr r3, [pc, #0x11c] /* data_31f8 */ 
    ldrh r0, [r0]
    cmp r0, #1
    bls jump_30f6
    ldr r4, [pc, #0x118] /* data_31fc */ 
    ldrh r1, [r4]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    udiv r5, r1, r0
    mls r0, r0, r5, r1
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    strh r0, [r4]
    bne jump_30f8
jump_30f6:
    strb r2, [r3]
jump_30f8:
    ldr r0, [pc, #0x104] /* data_3200 */ 
    ldrb r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r1, [r0]
    ldr r1, [pc, #0x100] /* data_3204 */ 
    ldrb r0, [r1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r1]
    ldr r0, [pc, #0xfc] /* data_3208 */ 
    ldrb r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r1, [r0]
    ldr r0, [pc, #0xf8] /* data_320c */ 
    ldr r1, [r0]
    cbz r1, jump_311c
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_311c:
    ldr r1, [r0, #4]
    cbz r1, jump_3126
    ldr r1, [r0, #4]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0, #4]
jump_3126:
    ldr r0, [pc, #0xe8] /* data_3210 */ 
    ldr r1, [r0]
    cmp r1, #1
    bls jump_3134
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_3134:
    ldr r0, [pc, #0xdc] /* data_3214 */ 
    ldr r1, [r0]
    cmp r1, #1
    bls jump_3142
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_3142:
    ldr r0, [pc, #0xd4] /* data_3218 */ 
    ldr r1, [r0]
    cbz r1, jump_314e
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_314e:
    ldr r0, [pc, #0xcc] /* data_321c */ 
    ldr r1, [r0]
    cbz r1, jump_315a
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_315a:
    ldr r0, [pc, #0xc4] /* data_3220 */ 
    ldr r1, [r0]
    cbz r1, jump_3166
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_3166:
    ldr r0, [pc, #0xbc] /* data_3224 */ 
    ldr r1, [r0]
    cbz r1, jump_3172
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_3172:
    ldr r0, [pc, #0xb4] /* data_3228 */ 
    ldr r1, [r0]
    cbz r1, jump_317e
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_317e:
    ldr r0, [pc, #0xac] /* data_322c */ 
    ldr r1, [r0]
    cbz r1, jump_318a
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_318a:
    ldr r0, [pc, #0xa4] /* data_3230 */ 
    ldr r1, [r0]
    cbz r1, jump_3196
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_3196:
    ldr r0, [pc, #0x9c] /* data_3234 */ 
    ldr r1, [r0]
    cbz r1, jump_31a2
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31a2:
    ldr r0, [pc, #0x94] /* data_3238 */ 
    ldr r1, [r0]
    cbz r1, jump_31ae
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31ae:
    ldr r0, [pc, #0x8c] /* data_323c */ 
    ldr r1, [r0]
    cbz r1, jump_31ba
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31ba:
    ldr r0, [pc, #0x84] /* data_3240 */ 
    ldrh r1, [r0]
    cbz r1, jump_31c6
    ldrh r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    strh r1, [r0]
jump_31c6:
    ldr r0, [pc, #0x7c] /* data_3244 */ 
    ldr r1, [r0]
    cbz r1, jump_31d2
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31d2:
    ldr r0, [pc, #0x74] /* data_3248 */ 
    ldr r1, [r0]
    cbz r1, jump_31de
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31de:
    ldr r0, [pc, #0x6c] /* data_324c */ 
    ldr r1, [r0]
    cmp r1, #0
    beq jump_31ec
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_31ec:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_31f0:
.word 0x40076000
data_31f4:
.word 0x20000100
data_31f8:
.word 0x20000090
data_31fc:
.word 0x20000104
data_3200:
.word 0x2000006b
data_3204:
.word 0x2000006c
data_3208:
.word 0x2000006d
data_320c:
.word 0x20000308
data_3210:
.word 0x200000c0
data_3214:
.word 0x200000c4
data_3218:
.word 0x200000d8
data_321c:
.word 0x200000d4
data_3220:
.word 0x200000e4
data_3224:
.word 0x20000108
data_3228:
.word 0x2000010c
data_322c:
.word 0x200000dc
data_3230:
.word 0x200000c8
data_3234:
.word 0x200000cc
data_3238:
.word 0x200000d0
data_323c:
.word 0x200000b4
data_3240:
.word 0x2000009a
data_3244:
.word 0x200000fc
data_3248:
.word 0x200001d0
data_324c:
.word 0x200000e0

.thumb_func
bftm1_intr:
    push {r4, lr}
    ldr r0, [pc, #0xc] /* data_3260 */ 
    bl function_44
    pop.w {r4, lr}
    b.w function_e_47

data_3260:
.word 0x40077000

function_44:
    ldr r1, [r0, #4]
    bic r1, r1, #1
    str r1, [r0, #4]
    dsb sy
    bx lr
function_45:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_327e
    orr r1, r1, #4
    b jump_3282
jump_327e:
    bic r1, r1, #4
jump_3282:
    str r1, [r0]
    bx lr
function_46:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_3292
    orr r1, r1, #1
    b jump_3296
jump_3292:
    bic r1, r1, #1
jump_3296:
    str r1, [r0]
    bx lr
function_47:
    str r1, [r0, #0xc]
    bx lr
function_48:
    str r1, [r0, #8]
    bx lr

.byte 0x0
.byte 0x0

afio_pin_config:
    lsls r0, r0, #3
    lsrs r3, r1, #3
    add.w r0, r0, r3, lsl #2
    ldr r3, [pc, #0x18] /* data_32c8 */ 
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

data_32c8:
.word 0x40022020

spin_wait_maybe:
    add.w r0, r0, r0, lsl #2
    lsls r0, r0, #2
jump_32d2:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_32d2
    bx lr
setup_afio_gpio:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r1, #1
    lsls r5, r1, #0xe
    mov r0, r5
    bl ckcu_apb0_clock_enable
    movs r1, #1
    lsls r4, r1, #0x10
    mov r0, r4
    bl ckcu_ahb_clock_enable
    ldr r6, [pc, #0x90] /* data_3384 */ 
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    asrs r7, r4, #1
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #2
    mov r1, r7
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    asrs r5, r4, #5
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    movs r1, #0xb
    movs r0, #0
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xd
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xe
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xf
    movs r0, #2
    bl afio_pin_config
    ldr r0, [pc, #0x2c] /* data_3388 */ 
    ldr r0, [r0, #4]
    lsls r0, r0, #0x15
    bmi jump_3376
    movs r2, #1
    movs r1, #0xe
    mov r0, r2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xf
    mov r0, r2
    bl afio_pin_config
jump_3376:
    movs r1, #0
    mov r0, r4
    bl ckcu_ahb_clock_enable
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

data_3384:
.word 0x400b0000
data_3388:
.word 0x40088000

function_e_34:
    push {r4, lr}
    movs r0, #1
    bl usb_dp_pull_up
    pop.w {r4, lr}
    movs r0, #0xfa
    b.w spin_wait_maybe
usb_disable_dppu:
    movs r0, #0
    b.w usb_dp_pull_up
clear_two_words:
    movs r1, #0
    str r1, [r0, #4]
    str r1, [r0]
    bx lr
clear_two_words_and_write_two_bytes:
    movs r3, #0
    str r3, [r0]
    str r3, [r0, #4]
    strd r1, r2, [r0, #8]
    bx lr
function_e_2:
    push {r4, lr}
    ldr r4, [r0, #4]
    movs r2, #0
    ldr r3, [r0]
    cmp r4, r3
    beq jump_33dc
    ldr r2, [r0, #8]
    ldrb r2, [r2, r3]
    strb r2, [r1]
    ldr r1, [r0]
    ldr r2, [r0, #0xc]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    udiv r3, r1, r2
    mls r1, r2, r3, r1
    movs r2, #1
    str r1, [r0]
jump_33dc:
    mov r0, r2
    pop {r4, pc}
function_14:
    push {r4, r5, lr}
    ldr r3, [r0, #4]
    movs r2, #0
    ldr r4, [r0, #0xc]
    .short 0x1c5b /* adds r3, r3, #1 */ 
    udiv r5, r3, r4
    mls r3, r4, r5, r3
    ldr r4, [r0]
    cmp r3, r4
    beq jump_340e
    ldr r2, [r0, #4]
    ldr r3, [r0, #8]
    strb r1, [r3, r2]
    ldr r1, [r0, #0xc]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    udiv r3, r2, r1
    mls r1, r1, r3, r2
    str r1, [r0, #4]
    movs r2, #1
jump_340e:
    mov r0, r2
    pop {r4, r5, pc}
function_e_35:
    ldr r1, [r0, #4]
    ldr r0, [r0]
    cmp r1, r0
    bne jump_341e
    movs r0, #1
    bx lr
jump_341e:
    movs r0, #0
    bx lr

.byte 0x0
.byte 0x0

ckcu_ahb_clock_enable:
    ldr r2, [pc, #0x10] /* data_3438 */ 
    cmp r1, #1
    ldr r1, [r2, #0x24]
    beq jump_3432
    bics r1, r0
jump_342e:
    str r1, [r2, #0x24]
    bx lr
jump_3432:
    orrs r1, r0
    b jump_342e

.byte 0x0
.byte 0x0

data_3438:
.word 0x40088000

ckcu_apb0_clock_enable:
    ldr r2, [pc, #0x10] /* data_3450 */ 
    cmp r1, #1
    ldr r1, [r2, #0x2c]
    beq jump_344a
    bics r1, r0
jump_3446:
    str r1, [r2, #0x2c]
    bx lr
jump_344a:
    orrs r1, r0
    b jump_3446

.byte 0x0
.byte 0x0

data_3450:
.word 0x40088000

ckcu_apb1_clock_enable:
    ldr r2, [pc, #0x10] /* data_3468 */ 
    cmp r1, #1
    ldr r1, [r2, #0x30]
    beq jump_3462
    bics r1, r0
jump_345e:
    str r1, [r2, #0x30]
    bx lr
jump_3462:
    orrs r1, r0
    b jump_345e

.byte 0x0
.byte 0x0

data_3468:
.word 0x40088000

ckcu_set_usb_prescaler:
    ldr r1, [pc, #0xc] /* data_347c */ 
    ldr r2, [r1]
    bic r2, r2, #0xc00000
    orr.w r0, r2, r0, lsl #22
    str r0, [r1]
    bx lr

data_347c:
.word 0x40088000

crc16:
    push {r4, r5, r6, r7, lr}
    movs r6, #0
    b jump_34bc
jump_3486:
    ldrb r3, [r1, r6]
    movw ip, #0x1021
    eor.w r3, r3, r0, lsr #8
    lsl.w r4, r3, #8
    movs r3, #0
    movs r5, #8
jump_3498:
    eor.w lr, r4, r3
    lsl.w r7, r3, #1
    lsls.w lr, lr, #0x10
    bpl jump_34aa
    eor.w r7, ip, r3, lsl #1
jump_34aa:
    mov r3, r7
    .short 0x1e6d /* subs r5, r5, #1 */ 
    lsl.w r4, r4, #1
    bne jump_3498
    uxth r3, r7
    eor.w r0, r3, r0, lsl #8
    .short 0x1c76 /* adds r6, r6, #1 */ 
jump_34bc:
    cmp r6, r2
    blo jump_3486
    uxth r0, r0
    pop {r4, r5, r6, r7, pc}
flash_page_erase:
    ldr r1, [pc, #0xc] /* data_34d4 */ 
    str r0, [r1]
    movs r0, #8
    str r0, [r1, #0xc]
    movs r0, #0x14
    str r0, [r1, #0x10]
    b.w jump_34f8

data_34d4:
.word 0x40080000

flash_get_protection_status:
    ldr r0, [pc, #4] /* data_34e0 */ 
    ldr r0, [r0, #0x30]
    bx lr

.byte 0x0
.byte 0x0

data_34e0:
.word 0x40080000

flash_write:
    ldr r3, [pc, #0xc] /* data_34f4 */ 
    str r0, [r3, #0xc]
    str r1, [r3]
    str r2, [r3, #4]
    movs r0, #0x14
    str r0, [r3, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_34f4:
.word 0x40080000

jump_34f8:
    ldr r0, [pc, #0x18] /* data_3514 */ 
    ldr r1, [pc, #0x1c] /* data_3518 */ 
    b jump_3508
jump_34fe:
    ldr r2, [r1, #0x10]
    ubfx r2, r2, #2, #2
    cmp r2, #3
    beq jump_3510
jump_3508:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_34fe
    movs r0, #8
    bx lr
jump_3510:
    movs r0, #0
    bx lr

data_3514:
.word 0xfffff
data_3518:
.word 0x40080000

gpio_set_input_output:
    cmp r2, #0
    ldr r2, [r0]
    beq jump_3526
    orrs r2, r1
    b jump_3528
jump_3526:
    bics r2, r1
jump_3528:
    str r2, [r0]
    bx lr
gpio_set_output_current:
    cmp r2, #0
    ldr r2, [r0, #0x14]
    beq jump_3536
    orrs r2, r1
    b jump_3538
jump_3536:
    bics r2, r1
jump_3538:
    str r2, [r0, #0x14]
    bx lr
gpio_set_input_enable:
    cmp r2, #0
    ldr r2, [r0, #4]
    beq jump_3546
    orrs r2, r1
    b jump_3548
jump_3546:
    bics r2, r1
jump_3548:
    str r2, [r0, #4]
    bx lr
gpio_set_open_drain:
    cmp r2, #0
    ldr r2, [r0, #0x10]
    beq jump_3556
    orrs r2, r1
    b jump_3558
jump_3556:
    bics r2, r1
jump_3558:
    str r2, [r0, #0x10]
    bx lr
gpio_set_pin_pull_up_down:
    cbz r2, jump_3570
    cmp r2, #1
    beq jump_3576
    ldr r2, [r0, #8]
    bics r2, r1
jump_3566:
    str r2, [r0, #8]
    ldr r2, [r0, #0xc]
    bics r2, r1
    str r2, [r0, #0xc]
    bx lr
jump_3570:
    ldr r2, [r0, #8]
    orrs r2, r1
    b jump_3566
jump_3576:
    ldr r2, [r0, #0xc]
    orrs r2, r1
    str r2, [r0, #0xc]
    ldr r2, [r0, #8]
    bics r2, r1
    str r2, [r0, #8]
    bx lr
gpio_set_pin:
    str r1, [r0, #0x24]
    bx lr
gpio_set_reset_pin:
    cbz r2, jump_358e
    str r1, [r0, #0x24]
    bx lr
jump_358e:
    str r1, [r0, #0x28]
    bx lr
gptm_enable_disable:
    cmp r1, #0
    ldr r1, [r0, #0x10]
    beq jump_359e
    orr r1, r1, #1
    b jump_35a2
jump_359e:
    bic r1, r1, #1
jump_35a2:
    str r1, [r0, #0x10]
    bx lr
function_62:
    push {r4, r5, r6, r7, lr}
    ldrb r3, [r1]
    movs r4, #1
    add.w r6, r0, r3, lsl #2
    lsls r3, r3, #1
    lsls r4, r3
    ldr r7, [r0, #0x50]
    add.w r2, r6, #0x40
    add.w r5, r6, #0x90
    mvns r4, r4
    ands r7, r4
    str r7, [r0, #0x50]
    ldr r7, [r0, #0x54]
    ands r7, r4
    str r7, [r0, #0x54]
    ldr r4, [r0, #0x54]
    ldrb r7, [r1, #9]
    lsls r7, r3
    orrs r4, r7
    str r4, [r0, #0x54]
    ldr r4, [r2]
    movw r7, #0x107
    bics r4, r7
    str r4, [r2]
    ldr r4, [r2]
    ldr r7, [r1, #4]
    orrs r4, r7
    str r4, [r2]
    ldrh r2, [r1, #0xa]
    str r2, [r5]
    ldrh r2, [r1, #0xc]
    str.w r2, [r6, #0xa0]
    ldr r2, [r0, #0x50]
    ldrb r1, [r1, #8]
    lsls r1, r3
    orrs r2, r1
    str r2, [r0, #0x50]
    pop {r4, r5, r6, r7, pc}
function_e_36:
    movs r1, #0
    strb r1, [r0]
    str r1, [r0, #4]
    strb r1, [r0, #8]
    strb r1, [r0, #9]
    strh r1, [r0, #0xa]
    strh r1, [r0, #0xc]
    bx lr
call_360c:
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
call_3636:
    movs r1, #0
    movw r2, #0xffff
    str r1, [r0, #4]
    strh r2, [r0]
    strh r1, [r0, #2]
    mov.w r1, #0x100
    strh r1, [r0, #8]
    bx lr

.byte 0x0
.byte 0x0

.thumb_func
i2c1_intr:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r0, [pc, #0x11c] /* data_3770 */ 
    ldr r2, [r0, #0xc]
    str r2, [r0, #0xc]
    ldr r4, [pc, #0x11c] /* data_3774 */ 
    lsls r1, r2, #0x15
    mov.w sb, #0
    bpl jump_3664
    movs r1, #5
    b jump_3764
jump_3664:
    lsls r1, r2, #0x17
    bpl jump_366c
    movs r1, #4
    b jump_3764
jump_366c:
    lsls r1, r2, #0x14
    bpl jump_3674
    movs r1, #6
    b jump_3764
jump_3674:
    ldr r1, [pc, #0xfc] /* data_3774 */ 
    lsls r3, r2, #0x16
    ldrb r1, [r1]
    bpl jump_368c
    ldrh r2, [r4, #0xa]
    cbz r2, jump_3688
    .short 0x1e52 /* subs r2, r2, #1 */ 
    strh r2, [r4, #0xa]
    movs r2, #0
    b jump_3700
jump_3688:
    movs r1, #2
    b jump_3764
jump_368c:
    ldr.w ip, [r4, #0x10]
    cmp.w ip, #0
    beq jump_3762
    ldr r5, [pc, #0xdc] /* data_3774 */ 
    ldrh r3, [r5, #8]
    ldrh r5, [r5, #6]
    adds r6, r3, #1
    uxth r6, r6
    cmp.w r2, #0x190000
    beq jump_3728
    bgt jump_36c2
    mvn r1, #0x180000
    adds r1, r2, r1
    beq jump_36ee
    cmp r1, #3
    bne jump_36ee
    cmp r5, #1
    bls jump_36ee
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r1, #1
    b.w function_57
jump_36c2:
    ldr r7, [pc, #0xb0] /* data_3774 */ 
    ldr.w r8, [pc, #0xb0] /* data_3778 */ 
    mov.w sl, #1
    ldrh r7, [r7, #4]
    cmp.w r2, #0x3a0000
    beq jump_36f2
    sub.w r2, r2, #0x3a0000
    .short 0x1f12 /* subs r2, r2, #4 */ 
    bne jump_36ee
    ldrb r1, [r4, #1]
    cmp r1, #1
    beq jump_36e6
    str r7, [r0, #0x18]
    b jump_3722
jump_36e6:
    lsrs r1, r7, #8
    str r1, [r0, #0x18]
    strb.w sb, [r8, #1]
jump_36ee:
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
jump_36f2:
    ldrb.w r2, [r8, #1]
    cbz r2, jump_371e
    ldrb r2, [r4, #2]
    cbz r2, jump_3708
    mov.w r2, #0x400
jump_3700:
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    b.w function_59
jump_3708:
    cmp r3, r5
    bhs jump_3716
    ldrb.w r1, [ip, r3]
    str r1, [r0, #0x18]
    strh r6, [r4, #8]
    b jump_36ee
jump_3716:
    mov r5, sb
    strb.w sb, [r4, #3]
    b jump_3750
jump_371e:
    uxtb r1, r7
    str r1, [r0, #0x18]
jump_3722:
    strb.w sl, [r8, #1]
    b jump_36ee
jump_3728:
    mov r7, r0
    ldr r0, [r0, #0x18]
    strb.w r0, [ip, r3]
    .short 0x1e6d /* subs r5, r5, #1 */ 
    strh r6, [r4, #8]
    cmp r6, r5
    bne jump_3740
    movs r1, #0
    mov r0, r7
    bl function_57
jump_3740:
    ldrh r0, [r4, #8]
    ldrh r1, [r4, #6]
    cmp r0, r1
    bne jump_36ee
    mov r5, sb
    strb.w sb, [r4, #3]
    mov r0, r7
jump_3750:
    bl function_58
    str r5, [r4, #0x10]
    ldr r0, [r4, #0xc]
    cmp r0, #0
    beq jump_36ee
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    bx r0
jump_3762:
    movs r1, #3
jump_3764:
    strb r1, [r4, #3]
    bl function_58
    str.w sb, [r4, #0x10]
    b jump_36ee

data_3770:
.word 0x40049000
data_3774:
.word 0x20002f4c
data_3778:
.word 0x2000021e

function_57:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_3788
    orr r1, r1, #1
    b jump_378c
jump_3788:
    bic r1, r1, #1
jump_378c:
    str r1, [r0]
    bx lr
function_58:
    ldr r1, [r0]
    orr r1, r1, #2
    str r1, [r0]
    bx lr
function_59:
    ldr r3, [r0]
    lsls r3, r3, #0x1e
    bmi function_59
    cbz r2, jump_37a6
    orr r1, r1, #0x400
jump_37a6:
    str r1, [r0, #0x1c]
    bx lr

.byte 0x0
.byte 0x0

function_60:
    push {lr}
    bl function_61
    ldr r0, [pc, #0x10] /* data_37c4 */ 
    ldrb r1, [r0]
    cmp r1, #1
    bne jump_37be
    movs r1, #2
    strb r1, [r0]
jump_37be:
    movs r0, #1
    pop {pc}

.byte 0x0
.byte 0x0

data_37c4:
.word 0x2000021c

function_61:
    ldr r0, [pc, #0xc] /* data_37d8 */ 
    ldrb r1, [r0]
    cbnz r1, jump_37d2
    movs r1, #1
    strb r1, [r0]
jump_37d2:
    movs r0, #1
    bx lr

.byte 0x0
.byte 0x0

data_37d8:
.word 0x2000021c

nop_1:
    bx lr

.byte 0x0
.byte 0x0

function_13:
    push {r4, r5, lr}
    movs r1, #0xe
    movs r4, #1
    ldr r3, [pc, #0x6c] /* data_3854 */ 
    cmp.w r1, r0, lsr #4
    bne jump_3800
    and r0, r0, #0xf
    cmp r0, #8
    bhs jump_3850
    ldrb r1, [r3]
    lsls r4, r0
    orrs r1, r4
    strb r1, [r3]
    b jump_3850
jump_3800:
    cmp r0, #0x91
    bhi jump_3850
    movs r2, #0
    mov r1, r2
jump_3808:
    adds r5, r3, r1
    ldrb r5, [r5, #2]
    cmp r5, r0
    bne jump_3812
    movs r2, #1
jump_3812:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #6
    blo jump_3808
    cbnz r2, jump_3850
    movs r1, #0
jump_381e:
    adds r2, r3, r1
    ldrb r2, [r2, #2]
    cbz r2, jump_3832
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #6
    blo jump_381e
jump_382c:
    cmp r1, #6
    beq jump_3838
    b jump_3850
jump_3832:
    adds r2, r3, r1
    strb r0, [r2, #2]
    b jump_382c
jump_3838:
    lsrs r2, r0, #3
    and r0, r0, #7
    lsl.w r1, r4, r0
    ldr r0, [pc, #0x14] /* data_3858 */ 
    add r0, r2
    ldrb r2, [r0, #2]
    orrs r2, r1
    strb r2, [r0, #2]
    ldr r0, [pc, #0xc] /* data_385c */ 
    str r4, [r0, #0x14]
jump_3850:
    movs r0, #1
    pop {r4, r5, pc}

data_3854:
.word 0x2000003c
data_3858:
.word 0x2000032c
data_385c:
.word 0x200000d8

exti_set_wakup:
    ldr r1, [pc, #8] /* data_386c */ 
    movw r0, #0xe878
    str r0, [r1, #0x58]
    bx lr

.byte 0x0
.byte 0x0

data_386c:
.word 0x40024000

exti_check_wakup:
    ldr r0, [pc, #0xc] /* data_3880 */ 
    ldr r0, [r0, #0x58]
    movw r1, #0xe878
    ands r0, r1
    beq jump_387e
    movs r0, #1
jump_387e:
    bx lr

data_3880:
.word 0x40024000

function_74:
    push {r4, r5, r6, lr}
    sub sp, #0x18
    bl function_60
    bl spi_flash_init
    ldr r4, [pc, #0xa8] /* data_393c */ 
    ldr r6, [pc, #0xa4] /* data_3938 */ 
    movs r2, #3
    ldrb.w r0, [r4, #0x26]
    ldr.w r1, [r6, r0, lsl #2]
    ldr r0, [pc, #0xa0] /* data_3940 */ 
    addw r1, r1, #0xffb
    bl spi_flash_read_data
    ldr r5, [pc, #0x94] /* data_3940 */ 
    ldrb r0, [r5]
    cmp r0, #0x56
    bne jump_38bc
    ldrb r0, [r5, #1]
    cmp r0, #0x31
    bne jump_38bc
    ldrb r0, [r5, #2]
    cmp r0, #0x34
    beq jump_38ca
jump_38bc:
    bl function_e_95
jump_38c0:
    ldrb.w r0, [r4, #0x39]
    cmp r0, #1
    beq jump_38ee
    b jump_3900
jump_38ca:
    ldrb.w r0, [r4, #0x26]
    mov.w r2, #0xff0
    ldr.w r1, [r6, r0, lsl #2]
    ldr r0, [pc, #0x68] /* data_3940 */ 
    add.w r1, r1, #0xff0
    bl spi_flash_read_data
    ldrb r0, [r5]
    strb r0, [r4, #0x18]
    ldrb.w r0, [r4, #0x26]
    bl function_e_25
    b jump_38c0
jump_38ee:
    ldrh.w r0, [r4, #0x46]
    cbnz r0, jump_3900
    ldrh.w r0, [r4, #0x48]
    cbnz r0, jump_3900
    movs r0, #0xc8
    strh.w r0, [r4, #0x48]
jump_3900:
    ldr r0, [pc, #0x40] /* data_3944 */ 
    str r0, [sp, #0xc]
    movs r0, #9
    strb.w r0, [sp, #0x13]
    mov.w r0, #0x208
    strh.w r0, [sp, #0x10]
    ldr r0, [pc, #0x34] /* data_3948 */ 
    str r0, [sp]
    movs r0, #1
    strb.w r0, [sp, #0x12]
    movs r0, #0
    str r0, [sp, #4]
    str r0, [sp, #8]
    mov r0, sp
    bl function_e_48
    ldrb.w r0, [r4, #0x39]
    bl function_e_18
    bl call_4824
    add sp, #0x18
    pop {r4, r5, r6, pc}

data_3938:
.word data_3
data_393c:
.word 0x20000058
data_3940:
.word 0x20001cba
data_3944:
.word data_9
data_3948:
.word function_e_17

.thumb_func
function_e_17:
    push.w {r0, r1, r2, r4, r5, r6, r7, r8, sb, sl, fp, lr}
    sub sp, #0x10
    mov r5, r0
    movs r0, #1
    str r0, [sp, #0xc]
    movs r0, #0
    ldr.w fp, [pc, #0x3fc] /* data_3d58 */ 
    str r0, [sp]
    str r0, [sp, #4]
    str r0, [sp, #8]
    mov r6, r1
    mov sb, r0
    str.w r0, [fp, #0x34]
    sub.w r7, fp, #0x80
    ldrb.w r0, [r7, #0x30]
    cmp r0, #1
    bls jump_3996
    ldr r1, [pc, #0x3e0] /* data_3d5c */ 
    ldrb r1, [r1]
    cmp r1, #1
    bne jump_3996
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb.w r0, [r7, #0x30]
    cmp r0, #6
    bls jump_3992
    movs r0, #2
    strb.w r0, [r7, #0x30]
jump_3992:
    bl function_e_15
jump_3996:
    ldrb r0, [r7, #2]
    mov.w sl, #1
    cmp r0, #1
    bne jump_39a8
    ldr r0, [pc, #0x3bc] /* data_3d60 */ 
    ldrb r0, [r0, #6]
    cmp r0, #0xfc
    beq jump_39b2
jump_39a8:
    ldrb.w r0, [r7, #0x30]
    cmp r0, #1
    beq jump_39be
    b jump_39c8
jump_39b2:
    ldrb.w r0, [r7, #0x30]
    cmp r0, #1
    beq jump_39c8
    mov r0, sl
    b jump_39c0
jump_39be:
    mov r0, sb
jump_39c0:
    strb.w r0, [r7, #0x30]
    str.w r0, [fp, #8]
jump_39c8:
    add.w r4, r6, r5, lsl #3
    cmp r4, #0x22
    beq jump_39d4
    cmp r4, #0x43
    bne jump_3a38
jump_39d4:
    ldr r0, [sp, #0x18]
    cbz r0, jump_3a0c
    cmp r4, #0x22
    bne jump_39e8
    ldrb.w r0, [r7, #0x2b]
    orr r0, r0, #1
    strb.w r0, [r7, #0x2b]
jump_39e8:
    cmp r4, #0x43
    bne jump_39f8
    ldrb.w r0, [r7, #0x2b]
    orr r0, r0, #2
    strb.w r0, [r7, #0x2b]
jump_39f8:
    ldrb.w r0, [r7, #0x2b]
    cmp r0, #3
    bne jump_3a38
    str.w sl, [fp, #0x34]
    movs r0, #2
    strb.w r0, [r7, #0x2a]
    b jump_3a38
jump_3a0c:
    mov r0, sb
    strb.w sb, [r7, #0x2a]
    cmp r4, #0x22
    bne jump_3a22
    ldrb.w r1, [r7, #0x2b]
    and r1, r1, #0xfe
    strb.w r1, [r7, #0x2b]
jump_3a22:
    cmp r4, #0x43
    bne jump_3a32
    ldrb.w r1, [r7, #0x2b]
    and r1, r1, #0xfd
    strb.w r1, [r7, #0x2b]
jump_3a32:
    strb r0, [r7, #0xc]
    str.w r0, [fp, #0x34]
jump_3a38:
    cmp r4, #0x44
    beq jump_3a40
    cmp r4, #0xc
    bne jump_3a70
jump_3a40:
    ldr r0, [sp, #0x18]
    cbz r0, jump_3a64
    movs r0, #0x10
    cmp r4, #0x44
    bne jump_3a4e
    strb.w r0, [r7, #0x2b]
jump_3a4e:
    cmp r4, #0xc
    bne jump_3a70
    ldrb.w r0, [r7, #0x2b]
    cmp r0, #0x10
    bne jump_3a70
    strb.w sb, [r7, #0x2a]
    str.w sl, [fp, #0x34]
    b jump_3a70
jump_3a64:
    cmp r4, #0x44
    bne jump_3a6c
    strb.w sb, [r7, #0x2b]
jump_3a6c:
    str.w sb, [fp, #0x34]
jump_3a70:
    cmp r4, #0x3a
    beq jump_3a7c
    cmp r4, #0x43
    beq jump_3a7c
    cmp r4, #0x21
    bne jump_3afe
jump_3a7c:
    ldr r0, [sp, #0x18]
    cbz r0, jump_3ace
    cmp r4, #0x43
    bne jump_3a90
    ldrb.w r0, [r7, #0x2e]
    orr r0, r0, #0x10
    strb.w r0, [r7, #0x2e]
jump_3a90:
    cmp r4, #0x3a
    bne jump_3aa0
    ldrb.w r0, [r7, #0x2e]
    orr r0, r0, #0x20
    strb.w r0, [r7, #0x2e]
jump_3aa0:
    cmp r4, #0x21
    bne jump_3ab0
    ldrb.w r0, [r7, #0x2e]
    orr r0, r0, #0x40
    strb.w r0, [r7, #0x2e]
jump_3ab0:
    ldrb.w r0, [r7, #0x2e]
    cmp r0, #0x70
    bne jump_3afe
    strb.w sb, [r7, #0x2e]
    strb.w sl, [r7, #0x2f]
    ldrb.w r0, [r7, #0x2c]
    eor r0, r0, #1
    strb.w r0, [r7, #0x2d]
    b jump_3afe
jump_3ace:
    cmp r4, #0x43
    bne jump_3ade
    ldrb.w r0, [r7, #0x2e]
    bic r0, r0, #0x10
    strb.w r0, [r7, #0x2e]
jump_3ade:
    cmp r4, #0x3a
    bne jump_3aee
    ldrb.w r0, [r7, #0x2e]
    bic r0, r0, #0x20
    strb.w r0, [r7, #0x2e]
jump_3aee:
    cmp r4, #0x21
    bne jump_3afe
    ldrb.w r0, [r7, #0x2e]
    bic r0, r0, #0x40
    strb.w r0, [r7, #0x2e]
jump_3afe:
    bl function_80
    cmp r0, #1
    bne jump_3baa
    ldrb r0, [r7, #0x19]
    ldr r3, [pc, #0x258] /* data_3d64 */ 
    mov.w ip, #0xff0
    cmp r0, #1
    beq jump_3b24
    ldrb.w r0, [r7, #0x28]
    cmp r0, #1
    beq jump_3b4c
    ldrb.w r0, [r7, #0x2f]
    cmp r0, #1
    beq jump_3b4c
    b jump_3baa
jump_3b24:
    ldrb r0, [r7, #0x1a]
    strb r0, [r7, #0x18]
    ldrb.w r1, [r7, #0x27]
    ldr r2, [pc, #0x238] /* data_3d68 */ 
    strb.w r1, [r7, #0x26]
    strb.w sb, [r7, #0x19]
    strb.w r0, [r2, #0xff0]
    ldr.w r0, [r3, r1, lsl #2]
    mov r2, ip
    add.w r0, r0, #0xff0
    mov r1, r0
    bl function_e_97
    b jump_3b92
jump_3b4c:
    ldrb.w r0, [r7, #0x28]
    cmp r0, #1
    beq jump_3b5e
    ldrb.w r0, [r7, #0x2f]
    cmp r0, #1
    beq jump_3b86
    b jump_3b92
jump_3b5e:
    add.w r7, r7, #0x18
    ldrb r0, [r7, #0xf]
    strb r0, [r7, #0xe]
    mov r2, ip
    ldr.w r1, [r3, r0, lsl #2]
    ldr r0, [pc, #0x1f8] /* data_3d68 */ 
    add.w r1, r1, #0xff0
    bl spi_flash_read_data
    ldr r0, [pc, #0x1f0] /* data_3d68 */ 
    ldrb r0, [r0]
    strb r0, [r7]
    strb.w sb, [r7, #0x10]
    sub.w r7, r7, #0x18
    b jump_3b92
jump_3b86:
    ldrb.w r0, [r7, #0x2d]
    strb.w r0, [r7, #0x2c]
    strb.w sb, [r7, #0x2f]
jump_3b92:
    ldrb.w r0, [r7, #0x26]
    bl function_e_25
    ldrb.w r0, [r7, #0x39]
    bl function_e_18
    bl function_e_83
    strb.w sb, [r7, #0x1b]
jump_3baa:
    ldrb.w r0, [r7, #0x3d]
    ldr r2, [pc, #0x1bc] /* data_3d6c */ 
    cmp r4, r0
    beq jump_3bba
    cmp.w r8, #0xe8
    bne jump_3c00
jump_3bba:
    ldrb.w r0, [r7, #0x2c]
    movs r1, #1
    cmp r0, #1
    bne jump_3bda
    movs r0, #0
jump_3bc6:
    ldrb r3, [r2, r0]
    cmp r4, r3
    bne jump_3bce
    movs r1, #0
jump_3bce:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #4
    blo jump_3bc6
    cmp r1, #1
    bne jump_3c00
jump_3bda:
    ldr r0, [sp, #0x18]
    cbz r0, jump_3be4
    strb.w sl, [r7, #2]
    b jump_3bf8
jump_3be4:
    strb.w sb, [r7, #2]
    strb.w sb, [r7, #4]
    str.w sb, [r7, #0x68]
    str.w sb, [r7, #0x6c]
    str.w sb, [fp, #4]
jump_3bf8:
    movs r0, #1
    mov.w r8, #0
    str r0, [sp]
jump_3c00:
    ldrb.w r0, [r7, #0x3e]
    cmp r4, r0
    bne jump_3c3a
    ldrb.w r0, [r7, #0x2c]
    movs r1, #1
    cmp r0, #1
    bne jump_3c28
    movs r0, #0
jump_3c14:
    ldrb r3, [r2, r0]
    cmp r4, r3
    bne jump_3c1c
    movs r1, #0
jump_3c1c:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #4
    blo jump_3c14
    cmp r1, #1
    bne jump_3c3a
jump_3c28:
    ldr r0, [sp, #0x18]
    cbz r0, jump_3c32
    strb.w sl, [r7, #3]
    b jump_3c36
jump_3c32:
    strb.w sb, [r7, #3]
jump_3c36:
    movs r0, #1
    str r0, [sp]
jump_3c3a:
    ldr r0, [pc, #0x11c] /* data_3d58 */ 
    subs r0, #0x80
    ldrb.w r0, [r0, #0x2c]
    cmp r0, #1
    bne jump_3c5a
    movs r0, #0
jump_3c48:
    ldrb r1, [r2, r0]
    cmp r4, r1
    bne jump_3c52
    movs r1, #1
    str r1, [sp, #8]
jump_3c52:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #4
    blo jump_3c48
jump_3c5a:
    movs r4, #1
    ldr r3, [sp, #0x18]
    lsls r4, r6
    ldr r0, [pc, #0x10c] /* data_3d70 */ 
    ldr r1, [pc, #0x110] /* data_3d74 */ 
    ldr r2, [pc, #0x110] /* data_3d78 */ 
    cmp r3, #0
    ldr r3, [sp]
    add.w r0, r0, r5, lsl #3
    add.w r1, r1, r5, lsl #3
    add.w r2, r2, r5, lsl #3
    beq jump_3cd6
    cmp r3, #1
    beq jump_3d04
    ldr r7, [pc, #0xd8] /* data_3d58 */ 
    subs r7, #0x80
    ldrb r3, [r7, #0x18]
    cbz r3, jump_3c8e
    ldr.w r3, [fp, #0x34]
    cbnz r3, jump_3c8e
    ldr r3, [sp, #8]
    cbz r3, jump_3ca0
jump_3c8e:
    ldrb.w r3, [r7, #0x26]
    cmp r3, #1
    beq jump_3cce
    cmp r3, #2
    beq jump_3cd2
    ldrb r0, [r2, r6]
jump_3c9c:
    mov r8, r0
    b jump_3d04
jump_3ca0:
    mov r1, r6
    mov r0, r5
    ldr r2, [sp, #0x18]
    bl function_e_82
    mov r8, r0
    ldrb.w r0, [r7, #0x24]
    cmp r0, #2
    beq jump_3cc0
    cmp r0, #0x12
    beq jump_3cc0
    cmp r0, #3
    beq jump_3cc0
    cmp r0, #0x13
    bne jump_3d04
jump_3cc0:
    ldr r1, [pc, #0xb8] /* data_3d7c */ 
    ldrb r0, [r1, r5]
    orrs r0, r4
    strb r0, [r1, r5]
    movs r0, #1
    str r0, [sp, #4]
    b jump_3d04
jump_3cce:
    ldrb r0, [r0, r6]
    b jump_3c9c
jump_3cd2:
    ldrb r0, [r1, r6]
    b jump_3c9c
jump_3cd6:
    cmp r3, #1
    beq jump_3d04
    ldr r7, [pc, #0x7c] /* data_3d58 */ 
    subs r7, #0x80
    ldrb r3, [r7, #0x18]
    cbz r3, jump_3cec
    ldr.w r3, [fp, #0x34]
    cbnz r3, jump_3cec
    ldr r3, [sp, #8]
    cbz r3, jump_3d2e
jump_3cec:
    ldrb.w r3, [r7, #0x26]
    cmp r3, #1
    beq jump_3d54
    cmp r3, #2
    beq jump_3d80
    ldrb r0, [r2, r6]
jump_3cfa:
    mov r8, r0
jump_3cfc:
    ldr r0, [pc, #0x7c] /* data_3d7c */ 
    ldrb r1, [r0, r5]
    bics r1, r4
    strb r1, [r0, r5]
jump_3d04:
    mov r0, r8
    ldr r1, [sp, #0x18]
    bl function_e_85
    ldr r7, [pc, #0x5c] /* data_3d6c */ 
    ldr r0, [sp, #0x18]
    adds r7, #0x16
    cmp r0, #0
    ldr r0, [sp]
    beq jump_3e12
    cmp r0, #1
    beq jump_3e14
    mov r2, r6
    mov r1, r5
    mov r0, r8
    bl function_e_13
    mov r4, r0
    cmp r0, #0xe8
    beq jump_3d84
    b jump_3d92
jump_3d2e:
    mov r1, r6
    mov r0, r5
    ldr r2, [sp, #0x18]
    bl function_e_82
    mov r8, r0
    ldrb.w r0, [r7, #0x24]
    cmp r0, #2
    beq jump_3d4e
    cmp r0, #0x12
    beq jump_3d4e
    cmp r0, #3
    beq jump_3d4e
    cmp r0, #0x13
    bne jump_3cfc
jump_3d4e:
    movs r0, #1
    str r0, [sp, #4]
    b jump_3cfc
jump_3d54:
    ldrb r0, [r0, r6]
    b jump_3cfa

.thumb_func
data_3d58:
.word 0x200000d8
data_3d5c:
.word 0x2000003c
data_3d60:
.word 0x20002de4
.thumb_func
data_3d64:
.word data_3
.thumb_func
data_3d68:
.word 0x20001cba
.thumb_func
data_3d6c:
.word data_4
.thumb_func
data_3d70:
.word data_5
.thumb_func
data_3d74:
.word data_6
.thumb_func
data_3d78:
.word data_7
.thumb_func
data_3d7c:
.word 0x20002cba

jump_3d80:
    ldrb r0, [r1, r6]
    b jump_3cfa
jump_3d84:
    ldr r0, [pc, #0x1f8] /* data_3f80 */ 
    ldrb r1, [r0, #2]
    cmp r1, #1
    beq jump_3d92
    strb.w sl, [r0, #2]
    movs r4, #0
jump_3d92:
    ldr r0, [pc, #0x1f0] /* data_3f84 */ 
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    bpl jump_3da4
    cmp r4, #0x29
    bne jump_3da4
    ldr r0, [pc, #0x1e0] /* data_3f80 */ 
    ldrb r1, [r0, #2]
    cbz r1, jump_3dae
jump_3da4:
    ldr r1, [pc, #0x1d8] /* data_3f80 */ 
    ldrb r0, [r1, #2]
    cmp r0, #1
    beq jump_3db6
    b jump_3e36
jump_3dae:
    strb.w sl, [r0, #0x22]
    movs r4, #0x35
    b jump_3e36
jump_3db6:
    ldrb r0, [r1, #3]
    cmp r0, #1
    beq jump_3e36
    ldr r0, [sp, #4]
    cbnz r0, jump_3e16
    ldr r2, [pc, #0x1c4] /* data_3f88 */ 
jump_3dc2:
    ldrb r3, [r7, r0]
    cmp r3, r5
    bne jump_3dce
    ldrb r3, [r2, r0]
    cmp r3, r6
    beq jump_3dd8
jump_3dce:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x2c
    blo jump_3dc2
    b jump_3dfa
jump_3dd8:
    cmp r0, #0x2c
    bhs jump_3dfa
    movs r3, #1
    and r2, r0, #0x1f
    lsls r3, r2
    ldr r4, [pc, #0x198] /* data_3f80 */ 
    lsrs r2, r0, #5
    adds r4, #0xf8
    ldr.w r5, [r4, r2, lsl #2]
    orrs r5, r3
    str.w r5, [r4, r2, lsl #2]
    ldr r2, [pc, #0x190] /* data_3f88 */ 
    adds r2, #0x2c
    ldrb r4, [r2, r0]
jump_3dfa:
    cmp r4, #0xc4
    beq jump_3ea8
    bgt jump_3e18
    cmp r4, #0xc0
    beq jump_3e26
    cmp r4, #0xc1
    beq jump_3e2c
    cmp r4, #0xc2
    beq jump_3e4c
    cmp r4, #0xc3
    bne jump_3e36
    b jump_3e50
jump_3e12:
    b jump_3ed2
jump_3e14:
    b jump_3f76
jump_3e16:
    b jump_3e36
jump_3e18:
    cmp r4, #0xc5
    beq jump_3eb4
    cmp r4, #0xc6
    beq jump_3eae
    cmp r4, #0xe4
    bne jump_3e36
    b jump_3e5a
jump_3e26:
    strb.w sb, [r1, #0x1a]
    b jump_3e54
jump_3e2c:
    strb.w sl, [r1, #0x1a]
    strb.w sl, [r1, #0x19]
jump_3e34:
    movs r4, #0
jump_3e36:
    mov r0, r4
    ldr r1, [sp, #0x18]
    bl function_e_32
    mov r0, r4
    ldr r1, [sp, #0x18]
    bl function_e_92
    cmp r0, #1
    beq jump_3eba
    b jump_3ebc
jump_3e4c:
    movs r0, #2
    b jump_3e52
jump_3e50:
    movs r0, #3
jump_3e52:
    strb r0, [r1, #0x1a]
jump_3e54:
    strb.w sl, [r1, #0x19]
    b jump_3e34
jump_3e5a:
    ldrb r0, [r1, #0x18]
    cbz r0, jump_3e64
    ldrb.w r0, [r1, #0x20]
    cbz r0, jump_3e82
jump_3e64:
    ldrb.w r0, [r1, #0x20]
    cmp r0, #1
    bne jump_3e34
    str.w sl, [fp, #0x24]
    add.w r1, r1, #0x24
    ldr r0, [pc, #0x114] /* data_3f8c */ 
    strb.w sl, [r1, #1]
    ldrh.w r0, [r0, #0x8a]
    strh r0, [r1, #0x20]
    b jump_3e34
jump_3e82:
    strb.w sl, [r1, #0x16]
    str.w sl, [r1, #0x5c]
    strb.w sl, [r1]
    ldr r3, [pc, #0xf0] /* data_3f80 */ 
    adds r3, #0xf8
    str.w sb, [r3]
    str.w sb, [r3, #4]
    strb.w sb, [r1, #0x1b]
    str.w sl, [fp, #0x24]
    strb.w sb, [r1, #0x32]
    b jump_3e34
jump_3ea8:
    bl function_e_90
    b jump_3e34
jump_3eae:
    bl function_e_88
    b jump_3e34
jump_3eb4:
    bl function_e_91
    b jump_3e34
jump_3eba:
    movs r4, #0
jump_3ebc:
    mov r0, r4
    bl function_13
    cmp r0, #1
    beq jump_3ecc
    movs r0, #0
    str r0, [sp, #0xc]
    b jump_3f76
jump_3ecc:
    str.w sl, [fp, #0x10]
    b jump_3f76
jump_3ed2:
    cmp r0, #1
    beq jump_3f76
    mov r2, r6
    mov r1, r5
    mov r0, r8
    bl function_e_12
    mov r4, r0
    cmp r0, #0xe8
    beq jump_3eec
    cmp r4, #0x29
    beq jump_3f06
    b jump_3f16
jump_3eec:
    ldr r1, [pc, #0x90] /* data_3f80 */ 
    strb.w sb, [r1, #2]
    strb.w sb, [r1, #4]
    str.w sb, [r1, #0x68]
    str.w sb, [r1, #0x6c]
    str.w sb, [fp, #4]
    movs r4, #0
    b jump_3f16
jump_3f06:
    ldr r0, [pc, #0x78] /* data_3f80 */ 
    ldrb.w r1, [r0, #0x22]
    cmp r1, #1
    bne jump_3f16
    strb.w sb, [r0, #0x22]
    movs r4, #0x35
jump_3f16:
    ldr r0, [sp, #4]
    cbnz r0, jump_3f58
    ldr r1, [pc, #0x6c] /* data_3f88 */ 
jump_3f1c:
    ldrb r2, [r7, r0]
    cmp r2, r5
    bne jump_3f28
    ldrb r2, [r1, r0]
    cmp r2, r6
    beq jump_3f32
jump_3f28:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x2c
    blo jump_3f1c
    b jump_3f58
jump_3f32:
    cmp r0, #0x2c
    bhs jump_3f58
    ldr r5, [pc, #0x48] /* data_3f80 */ 
    lsrs r3, r0, #5
    adds r5, #0xf8
    and r6, r0, #0x1f
    ldr.w r2, [r5, r3, lsl #2]
    lsl.w r1, sl, r6
    tst r2, r1
    beq jump_3f58
    ldr r4, [pc, #0x38] /* data_3f88 */ 
    adds r4, #0x58
    bics r2, r1
    ldrb r4, [r4, r0]
    str.w r2, [r5, r3, lsl #2]
jump_3f58:
    mov r0, r4
    ldr r1, [sp, #0x18]
    bl function_e_32
    mov r0, r4
    ldr r1, [sp, #0x18]
    bl function_e_92
    cmp r0, #1
    bne jump_3f6e
    movs r4, #0
jump_3f6e:
    mov r0, r4
    bl function_e_23
    b jump_3ecc
jump_3f76:
    ldr r0, [sp, #0xc]
    add sp, #0x1c
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

.byte 0x0
.byte 0x0

.thumb_func
data_3f80:
.word 0x20000058
.thumb_func
data_3f84:
.word 0x2000003c
.thumb_func
data_3f88:
.word data_8
.thumb_func
data_3f8c:
.word 0x20002e2c

function_e_18:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr r5, [pc, #0x2b4] /* data_424c */ 
    movs r1, #0x64
    ldr.w fp, [pc, #0x2a8] /* data_4244 */ 
    movs r4, #0
    ldr r3, [pc, #0x2a8] /* data_4248 */ 
    mov r6, r0
    mov.w r8, #2
    mov.w sb, #0x3e8
    movw sl, #0xffff
    add.w r7, r5, #0x90
    cmp r0, #0xc
    bhs switch_3fdc
    tbb [pc, r0]

.byte 0x6
.byte 0x57
.byte 0x6
.byte 0x6
.byte 0xe4
.byte 0xfd
.byte 0xfc
.byte 0x11
.byte 0x11
.byte 0x81
.byte 0x6
.byte 0x17

switch_3fc6:
    bl function_e_41
    movs r1, #0xa
    str.w r1, [fp, #0x28]
    cmp r6, #0xa
    beq jump_3fde
    cmp r6, #3
    beq switch_3fdc
    cmp r6, #2
    beq jump_3fe2
switch_3fdc:
    b jump_423a
jump_3fde:
    movs r1, #4
    b jump_4062
jump_3fe2:
    str.w r8, [fp, #0x28]
    b jump_423a
switch_3fe8:
    movs r6, #0
jump_3fea:
    ldr r0, [pc, #0x25c] /* data_4248 */ 
    movs r5, #0
    add.w r8, r0, r6, lsl #4
    ldr r0, [pc, #0x258] /* data_424c */ 
    movw r7, #0x3e9
    add.w sb, r0, r6, lsl #4
    adds r0, #0x90
    add.w sl, r0, r6, lsl #4
jump_4002:
    bl rand
    sdiv r1, r0, r7
    mls r0, r7, r1, r0
    uxth r0, r0
    rsb r2, r0, r0, lsl #16
    mov.w r1, #0x3e8
    udiv r1, r2, r1
    mov.w r2, #0x1c2
    muls r1, r2, r1
    movw r2, #0xffff
    udiv r1, r1, r2
    strh.w r1, [r8, r5, lsl #1]
    strh.w r0, [sb, r5, lsl #1]
    bl rand
    sdiv r1, r0, r7
    mls r0, r7, r1, r0
    strh.w r0, [sl, r5, lsl #1]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
    cmp r5, #8
    blo jump_4002
    .short 0x1c76 /* adds r6, r6, #1 */ 
    uxtb r6, r6
    cmp r6, #9
    blo jump_3fea
    ldr r1, [pc, #0x1f0] /* data_4244 */ 
    str.w r4, [fp, #0x2c]
    subs r1, #0x80
    strb.w r4, [r1, #0x38]
    mov.w r1, #0x7d0
jump_4062:
    str.w r1, [fp, #0x28]
    b jump_423a
switch_4068:
    ldr r0, [pc, #0x1d8] /* data_4244 */ 
    strd r8, r4, [fp, #0x28]
    subs r0, #0x80
    movs r1, #0
    strb.w r4, [r0, #0x38]
    ldrh.w r0, [r0, #0x48]
    mov.w r2, #0x1c2
    rsb r0, r0, r0, lsl #16
    udiv r0, r0, sb
    muls r0, r2, r0
    udiv r0, r0, sl
    uxth.w r8, r0
jump_4090:
    movs r0, #0
    add.w r6, r3, r1, lsl #4
    add.w r2, r5, r1, lsl #4
    add.w ip, r7, r1, lsl #4
jump_409e:
    strh.w r8, [r6, r0, lsl #1]
    strh.w r4, [r2, r0, lsl #1]
    strh.w r4, [ip, r0, lsl #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_409e
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_4090
    b jump_423a
switch_40bc:
    ldr r6, [pc, #0x18c] /* data_424c */ 
    mov.w r3, #0x1f4
    subs r6, #0x3c
    mov.w r7, #0x12c
    strh r3, [r6]
    strh r1, [r6, #2]
    strh r7, [r6, #4]
    mov.w r8, #0x2bc
    strh.w r8, [r6, #6]
    mov.w ip, #0x384
    add.w r4, r6, #0x28
    strh.w ip, [r6, #8]
    movs r0, #0
    strb r0, [r4]
    strb r0, [r4, #1]
    movs r2, #1
    strb r2, [r4, #2]
    strb r2, [r4, #3]
    sub.w r5, r4, #0x14
    strb r0, [r4, #4]
    strh r3, [r5]
    strh.w ip, [r5, #2]
    strh.w r8, [r5, #4]
    strh r7, [r5, #6]
    strh r1, [r5, #8]
    add.w r1, r4, #0xa
    movs r3, #0
    strb r2, [r1]
    strb r2, [r1, #1]
    strb r0, [r1, #2]
    strb r0, [r1, #3]
    strb r2, [r1, #4]
    ldr r1, [pc, #0x134] /* data_4248 */ 
    ldr r2, [pc, #0x138] /* data_4250 */ 
    mov lr, sb
    mov r6, sl
jump_411a:
    ldr r4, [pc, #0x128] /* data_4244 */ 
    movs r0, #0
    ldr.w sl, [pc, #0x12c] /* data_424c */ 
    adds r4, #0xad
    sub.w sl, sl, #0x3c
    add.w sb, r4, r3, lsl #3
jump_412c:
    mov.w r8, #0x1c2
    ldrb.w r4, [sb, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #8
    ldrh.w r7, [sl, r4, lsl #1]
    rsb ip, r7, r7, lsl #16
    udiv ip, ip, lr
    mul ip, ip, r8
    udiv ip, ip, r6
    strh ip, [r1], #2
    ldrh.w r4, [r5, r4, lsl #1]
    rsb r4, r4, r4, lsl #16
    udiv r4, r4, lr
    mul r4, r4, r8
    udiv r4, r4, r6
    strh r4, [r2], #2
    blo jump_412c
    .short 0x1c5b /* adds r3, r3, #1 */ 
    cmp r3, #9
    blo jump_411a
    movs r0, #0
    movs r2, #1
    ldr r1, [pc, #0xcc] /* data_4244 */ 
    strd r2, r0, [fp, #0x28]
    subs r1, #0x80
    strb.w r0, [r1, #0x38]
    b jump_423a
switch_4182:
    ldr.w r8, [pc, #0xc0] /* data_4244 */ 
    movs r1, #0
    sub.w r8, r8, #0x80
    ldrb.w r2, [r8, #6]
jump_4190:
    movs r0, #0
jump_4192:
    ldrb.w r6, [r8, #9]
    mov ip, r8
    cbz r6, jump_41b6
    cbz r2, jump_41b6
    ldrb.w r6, [ip, #9]
    cmp r6, #1
    beq jump_41ba
    cmp r2, #1
    beq jump_41ba
    ldrb.w r6, [ip, #9]
    cmp r6, #2
    beq jump_41e2
    b jump_4204
switch_41b2:
    b jump_422a
switch_41b4:
    b jump_4216
jump_41b6:
    ldr r6, [pc, #0x9c] /* data_4254 */ 
    b jump_41bc
jump_41ba:
    ldr r6, [pc, #0x9c] /* data_4258 */ 
jump_41bc:
    add.w r6, r6, r1, lsl #5
    ldrh.w r6, [r6, r0, lsl #2]
    rsb ip, r6, r6, lsl #16
    udiv r6, ip, sb
    mov.w ip, #0x1c2
    mul r6, r6, ip
    udiv r6, r6, sl
    add.w ip, r3, r1, lsl #4
    strh.w r6, [ip, r0, lsl #1]
    b jump_41f4
jump_41e2:
    add.w r6, r3, r1, lsl #4
    strh.w r4, [r6, r0, lsl #1]
    ldr r6, [pc, #0x64] /* data_4250 */ 
    add.w r6, r6, r1, lsl #4
    strh.w r4, [r6, r0, lsl #1]
jump_41f4:
    add.w r6, r5, r1, lsl #4
    strh.w r4, [r6, r0, lsl #1]
    add.w r6, r7, r1, lsl #4
    strh.w r4, [r6, r0, lsl #1]
jump_4204:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_4192
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_4190
    b jump_423a
jump_4216:
    ldr r5, [pc, #0x2c] /* data_4244 */ 
    strd r1, r4, [fp, #0x28]
    subs r5, #0x4f
    strb r4, [r5, #7]
    bl function_e_41
    movs r0, #1
    strb r0, [r5]
    b jump_423a
jump_422a:
    ldr r0, [pc, #0x18] /* data_4244 */ 
    strd r1, r4, [fp, #0x28]
    subs r0, #0x80
    strb.w r4, [r0, #0x38]
    bl function_e_41
jump_423a:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    b.w function_e_1

.byte 0x0
.byte 0x0

data_4244:
.word 0x200000d8
data_4248:
.word 0x20002e2c
data_424c:
.word 0x20000b9a
data_4250:
.word 0x20002ebc
data_4254:
.word 0x2000091e
data_4258:
.word 0x20000a3e

function_e_19:
    push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w fp, [pc, #0x378] /* data_45dc */ 
    movs r4, #1
    add.w r1, fp, #0x1c
    ldrb.w r2, [fp, #0x39]
    ldrh r6, [r1, #0x32]
    ldrh r5, [r1, #0x34]
    adds r0, r6, #1
    uxth.w sl, r0
    subs r0, r6, #1
    uxth r7, r0
    adds r0, r5, #1
    uxth r0, r0
    str r0, [sp]
    subs r0, r5, #1
    uxth r0, r0
    str r0, [sp, #4]
    ldrb r0, [r1, #0x1e]
    ldrb r3, [r1, #-0x15]
    .short 0x1e92 /* subs r2, r2, #2 */ 
    movs r1, #0
    ldr.w sb, [pc, #0x34c] /* data_45e0 */ 
    mov.w r8, #0x3e8
    movw lr, #0xffff
    cmp r2, #0xa
    bhs switch_4360
    tbb [pc, r2]

.byte 0xc6
.byte 0x5e
.byte 0x5d
.byte 0xfe
.byte 0xfd
.byte 0x5d
.byte 0x5d
.byte 0x5d
.byte 0x5
.byte 0xfc

switch_42b0:
    mov r2, fp
    cbz r3, jump_42ba
    cmp r3, #1
    beq switch_42cc
    b jump_42e0
jump_42ba:
    cbz r0, jump_42c0
    cmp r0, #2
    bne jump_42e0
jump_42c0:
    strh.w sl, [r2, #0x4e]
    cmp sl, r8
    blo jump_42e0
    strb r4, [r2, #7]
    b jump_42e0
switch_42cc:
    cbz r0, jump_42d2
    cmp r0, #2
    bne jump_42e0
jump_42d2:
    strh.w r7, [r2, #0x4e]
    cbnz r7, jump_42e0
    strb r1, [r2, #7]
    cbnz r0, jump_42e0
    strb.w r4, [r2, #0x3a]
jump_42e0:
    ldrb r0, [r2, #8]
    cbz r0, jump_42ea
    cmp r0, #1
    beq jump_4304
    b jump_432a
jump_42ea:
    ldrb.w r0, [r2, #0x3a]
    cmp r0, #1
    beq jump_42f6
    cmp r0, #2
    bne jump_432a
jump_42f6:
    ldr r0, [sp]
    strh.w r0, [r2, #0x50]
    cmp r0, r8
    blo jump_432a
    strb r4, [r2, #8]
    b jump_432a
jump_4304:
    ldrb.w r0, [r2, #0x3a]
    cmp r0, #1
    beq jump_4310
    cmp r0, #2
    bne jump_432a
jump_4310:
    ldr r3, [sp, #4]
    strh.w r3, [r2, #0x50]
    cbnz r3, jump_432a
    strb r1, [r2, #8]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    movs r1, #3
    udiv r3, r0, r1
    mls r0, r1, r3, r0
    strb.w r0, [r2, #0x3a]
jump_432a:
    ldrh.w r0, [fp, #0x4e]
    movs r1, #0
    rsb r0, r0, r0, lsl #16
    udiv r0, r0, r8
    mov.w r2, #0x1c2
    muls r0, r2, r0
    udiv r0, r0, lr
    uxth r2, r0
    mov r4, sb
jump_4346:
    movs r0, #0
    add.w r3, r4, r1, lsl #4
jump_434c:
    strh.w r2, [r3, r0, lsl #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_434c
    .short 0x1c49 /* adds r1, r1, #1 */ 
switch_435a:
    uxtb r1, r1
    cmp r1, #9
    blo jump_4346
switch_4360:
    b jump_45ac
switch_4362:
    mov r2, fp
    mov.w ip, #2
    mov.w fp, #0x1f4
    cmp r0, #6
    bhs switch_43b6
    tbb [pc, r0]

.byte 0x3
.byte 0x9
.byte 0x21
.byte 0xf
.byte 0x18
.byte 0x1f

switch_437a:
    strb r1, [r2, #7]
    strb.w ip, [r2, #8]
    strb.w r4, [r2, #0x3a]
switch_4384:
    b jump_43c4
switch_4386:
    cmp r6, fp
    bne switch_43b6
    strb r1, [r2, #8]
    strb.w ip, [r2, #0x3a]
    b switch_43b6
switch_4392:
    cmp r5, #1
    bne switch_43b6
switch_4396:
    strb.w ip, [r2, #7]
    strb r1, [r2, #8]
    movs r0, #4
switch_439e:
    strb.w r0, [r2, #0x3a]
    b jump_43e2
switch_43a4:
    cmp r5, fp
    bne switch_43b6
    strb r1, [r2, #7]
    movs r0, #5
    strb.w r0, [r2, #0x3a]
switch_43b0:
    b jump_43c4
switch_43b2:
    cmp r6, #1
    beq jump_43be
switch_43b6:
    cbz r3, jump_43c4
    cmp r3, #1
    beq jump_43d0
    b jump_43d8
jump_43be:
    strb r1, [r2, #7]
    strb.w r1, [r2, #0x3a]
jump_43c4:
    strh.w sl, [r2, #0x4e]
    cmp sl, r8
    blo jump_43d8
    strb r4, [r2, #7]
    b jump_43d8
jump_43d0:
    strh.w r7, [r2, #0x4e]
    cbnz r7, jump_43d8
    strb r1, [r2, #7]
jump_43d8:
    ldrb r0, [r2, #8]
    cbz r0, jump_43e2
    cmp r0, #1
    beq jump_43f0
    b jump_43fa
jump_43e2:
    ldr r0, [sp]
    strh.w r0, [r2, #0x50]
switch_43e8:
    cmp r0, r8
    blo jump_43fa
    strb r4, [r2, #8]
    b jump_43fa
jump_43f0:
    ldr r0, [sp, #4]
    strh.w r0, [r2, #0x50]
    cbnz r0, jump_43fa
    strb r1, [r2, #8]
jump_43fa:
    ldrh.w r0, [r2, #0x4e]
switch_43fe:
    movs r1, #0
    rsb r0, r0, r0, lsl #16
    udiv r0, r0, r8
switch_4408:
    mov.w r2, #0x1c2
    muls r0, r2, r0
    udiv r0, r0, lr
    uxth r2, r0
    mov r4, sb
jump_4416:
    movs r0, #0
    add.w r3, r4, r1, lsl #4
jump_441c:
    strh.w r2, [r3, r0, lsl #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_441c
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_4416
switch_4430:
    b jump_45ac
switch_4432:
    movs r1, #0
jump_4434:
    ldr r0, [pc, #0x1ac] /* data_45e4 */ 
    ldr r2, [pc, #0x1b0] /* data_45e8 */ 
    add r0, r1
    movs r3, #1
    ldrb.w sl, [r0, #0x14]
    movs r0, #0
    add.w r4, r2, r1, lsl #4
    adds r2, #0x90
    add.w r5, r2, r1, lsl #4
jump_444c:
    tst.w sl, r3
    beq jump_44ba
    ldrsh.w r2, [r4, r0, lsl #1]
switch_4456:
    ldrsh.w ip, [r5, r0, lsl #1]
    cmp r2, #0
    ble jump_4486
    .short 0x1e52 /* subs r2, r2, #1 */ 
    sxth r2, r2
    cmp r2, #0
    bge jump_4468
    movs r2, #0
jump_4468:
    rsb r6, r2, r2, lsl #16
    udiv r6, r6, r8
    mov.w r7, #0x1c2
    muls r6, r7, r6
    udiv r6, r6, lr
    add.w r7, sb, r1, lsl #4
    strh.w r6, [r7, r0, lsl #1]
    strh.w r2, [r4, r0, lsl #1]
jump_4486:
    cmp.w ip, #0
    ble jump_449c
    sub.w r2, ip, #1
    sxth r2, r2
    cmp r2, #0
    bge jump_4498
    movs r2, #0
jump_4498:
    strh.w r2, [r5, r0, lsl #1]
jump_449c:
    b jump_44a4
switch_449e:
    b jump_44d0
switch_44a0:
    b jump_457e
switch_44a2:
    b jump_451c
jump_44a4:
    lsls r2, r3, #0x19
    .short 0x1c40 /* adds r0, r0, #1 */ 
    lsrs r3, r2, #0x18
    uxtb r0, r0
    cmp r0, #8
    blo jump_444c
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_4434
    b jump_45ac
jump_44ba:
    add.w r6, sb, r1, lsl #4
    mov.w r2, #0x1c2
    strh.w r2, [r6, r0, lsl #1]
    strh.w r8, [r4, r0, lsl #1]
    ldrh.w r2, [fp, #0x4a]
    b jump_4498
jump_44d0:
    movs r5, #0
    mov r7, lr
    movw fp, #0x3e9
    mov sl, sb
jump_44da:
    movs r4, #0
    mov sb, fp
    add.w r6, sl, r5, lsl #4
jump_44e2:
    bl rand
    sdiv r2, r0, sb
    mls r0, sb, r2, r0
    uxth r0, r0
    rsb r0, r0, r0, lsl #16
switch_44f4:
    udiv r0, r0, r8
    mov.w r1, #0x1c2
    muls r0, r1, r0
    udiv r0, r0, r7
    strh.w r0, [r6, r4, lsl #1]
    bl rand
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    cmp r4, #8
    blo jump_44e2
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
switch_4516:
    cmp r5, #9
    blo jump_44da
    b jump_45ac
jump_451c:
    bl function_e_41
    ldr.w sl, [pc, #0xc8] /* data_45ec */ 
    ldrb.w r2, [fp, #0x31]
    movs r1, #0
    mov r8, fp
    mov.w r3, #0x1c2
    mov ip, sb
jump_4532:
    movs r0, #0
switch_4534:
    add.w r6, sl, r1, lsl #3
    add.w r5, ip, r1, lsl #4
jump_453c:
    ldrb r7, [r6, r0]
    cmp r7, r2
    bne jump_4546
    strh.w r3, [r5, r0, lsl #1]
jump_4546:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_453c
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_4532
    ldr r0, [pc, #0x98] /* data_45f0 */ 
    cmp r2, #0x3a
    beq jump_4562
    cmp r2, #0x3d
    beq jump_4568
    b jump_456c
jump_4562:
    strh.w r3, [r0, #0x72]
    b jump_456c
jump_4568:
    strh.w r3, [r0, #0x84]
jump_456c:
    .short 0x1c52 /* adds r2, r2, #1 */ 
    uxtb r0, r2
    strb.w r0, [r8, #0x31]
    cmp r0, #0x41
    bls jump_45ac
    strb.w r4, [fp, #0x31]
    b jump_45ac
jump_457e:
    ldrb.w r2, [fp, #0x1d]
    mov r0, fp
    cmp r2, #1
    beq jump_45b4
    strh.w r1, [sb, #2]
jump_458c:
    ldrb r2, [r0, #0x1e]
    cmp r2, #1
    beq jump_45be
    strh.w r1, [sb, #4]
jump_4596:
    ldrb r2, [r0, #0x1f]
    cmp r2, #1
    beq jump_45c8
    strh.w r1, [sb, #6]
jump_45a0:
    ldrb.w r0, [fp, #0x20]
    cmp r0, #1
    beq jump_45d2
    strh.w r1, [sb, #8]
jump_45ac:
    pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    b.w function_e_1
jump_45b4:
    mov.w r2, #0x1c2
    strh.w r2, [sb, #2]
    b jump_458c
jump_45be:
    mov.w r3, #0x1c2
    strh.w r3, [sb, #4]
    b jump_4596
jump_45c8:
    mov.w r2, #0x1c2
    strh.w r2, [sb, #6]
    b jump_45a0
jump_45d2:
    mov.w r0, #0x1c2
    strh.w r0, [sb, #8]
    b jump_45ac

data_45dc:
.word 0x20000058
data_45e0:
.word 0x20002e2c
data_45e4:
.word 0x20002de4
data_45e8:
.word 0x20000b9a
data_45ec:
.word data_10
data_45f0:
.word 0x20002ebc

call_45f4:
    push {r4, lr}
    ldr r1, [pc, #0x1c] /* data_4614 */ 
    cbz r0, jump_4606
    movs r0, #1
    strb r0, [r1, #5]
    bl function_e_1
    movs r0, #1
    pop {r4, pc}
jump_4606:
    movs r0, #0
    strb r0, [r1, #5]
    bl function_e_1
    movs r0, #0
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_4614:
.word 0x20000058

nop_3:
    bx lr
nop_2:
    bx lr
function_37:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl nop_1
    mov r0, r4
    bl jump_2
    mov r0, r4
    bl function_e_49
    mov.w r1, #0x100
    ldr r0, [pc, #0x84] /* data_46bc */ 
    lsls r5, r1, #4
    ldr r6, [pc, #0x84] /* data_46c0 */ 
    lsls r7, r1, #5
    cbz r4, jump_468a
    movs r2, #0
    mov r8, r1
    mov r4, r0
    bl gpio_set_open_drain
    movs r2, #1
    mov r1, r8
    mov r0, r4
    bl gpio_set_output_current
    movs r2, #1
    mov r1, r8
    mov r0, r4
    bl gpio_set_input_output
    movs r2, #1
    mov r1, r8
    mov r0, r4
    bl gpio_set_reset_pin
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #2
    b jump_46b0
jump_468a:
    movs r2, #1
    bl gpio_set_open_drain
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #0
jump_46b0:
    mov r1, r7
    mov r0, r6
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w gpio_set_pin_pull_up_down

data_46bc:
.word 0x400b4000
data_46c0:
.word 0x400b0000

function_e_21:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0xcc] /* data_4794 */ 
    movs r5, #0
    ldrb.w r0, [r4, #0x30]
    cbz r0, jump_4708
    ldrb.w r0, [r4, #0x38]
    cbz r0, jump_46de
    bl function_e_19
    strb.w r5, [r4, #0x38]
jump_46de:
    ldr r0, [pc, #0xb4] /* data_4794 */ 
    adds r0, #0x80
    ldr r1, [r0, #8]
    movw r2, #0x1770
    cmp r1, r2
    bls jump_4700
    ldrb.w r1, [r4, #0x30]
    cmp r1, #1
    bne jump_4700
    movs r1, #2
    strb.w r1, [r4, #0x30]
    str r5, [r0, #8]
    bl function_e_15
jump_4700:
    pop.w {r4, r5, r6, lr}
    b.w function_e_46
jump_4708:
    ldrb r0, [r4, #0xa]
    cmp r0, #0x63
    beq jump_4712
    bl function_e_26
jump_4712:
    ldrb r0, [r4, #0xa]
    cmp r0, #0x63
    bne jump_4730
    ldrb r0, [r4, #0x11]
    cmp r0, #0x63
    bne jump_4730
    ldrb r0, [r4, #0xc]
    cbnz r0, jump_4734
    ldrb r0, [r4, #0x16]
    cbnz r0, jump_473c
    ldrb.w r0, [r4, #0x29]
    cbnz r0, jump_473c
    bl function_e_46
jump_4730:
    ldrb r0, [r4, #0xc]
    cbz r0, jump_473c
jump_4734:
    ldrb r0, [r4, #0x16]
    cbnz r0, jump_473c
    bl function_e_7
jump_473c:
    bl function_e_87
    ldrb r0, [r4, #0x16]
    cmp r0, #1
    bne jump_474a
    bl function_e_43
jump_474a:
    ldrb r0, [r4, #0x1b]
    cmp r0, #1
    beq jump_4756
    ldrb r0, [r4, #0x1c]
    cmp r0, #3
    bne jump_475a
jump_4756:
    bl function_e_86
jump_475a:
    ldrb.w r0, [r4, #0x20]
    cmp r0, #1
    bne jump_476c
    ldrb r0, [r4, #0x18]
    cbz r0, jump_476c
    bl function_e_14
    b jump_4780
jump_476c:
    ldrb.w r0, [r4, #0x29]
    cmp r0, #0x14
    bne jump_4780
    strb.w r5, [r4, #0x29]
    ldrb.w r0, [r4, #0x39]
    bl function_e_18
jump_4780:
    ldrb.w r0, [r4, #0x38]
    cmp r0, #0
    beq jump_4790
    bl function_e_19
    strb.w r5, [r4, #0x38]
jump_4790:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4794:
.word 0x20000058

function_e_22:
    ldr r1, [pc, #0x1c] /* data_47b8 */ 
    movw r2, #0xe878
    cbz r0, jump_47ae
    ldr r0, [r1, #0x54]
    orrs r0, r2
    str r0, [r1, #0x54]
    str r2, [r1, #0x58]
    ldr r0, [r1, #0x50]
    orrs r0, r2
    b jump_47b2
jump_47ae:
    ldr r0, [r1, #0x50]
    bics r0, r2
jump_47b2:
    str r0, [r1, #0x50]
    bx lr

.byte 0x0
.byte 0x0

data_47b8:
.word 0x40024000

function_e_23:
    push {r4, lr}
    movs r1, #0xe
    movs r3, #1
    ldr r2, [pc, #0x54] /* data_4818 */ 
    cmp.w r1, r0, lsr #4
    bne jump_47dc
    and r0, r0, #0xf
    cmp r0, #8
    bhs jump_47da
    ldrb r1, [r2]
    lsls r3, r0
    bics r1, r3
    strb r1, [r2]
jump_47da:
    pop {r4, pc}
jump_47dc:
    cmp r0, #0x91
    bhi jump_47da
    movs r1, #0
jump_47e2:
    adds r4, r2, r1
    ldrb r4, [r4, #2]
    cmp r4, r0
    bne jump_47f2
    add r2, r1
    movs r4, #0
    strb r4, [r2, #2]
    b jump_47fa
jump_47f2:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #6
    blo jump_47e2
jump_47fa:
    cmp r1, #6
    bne jump_47da
    lsrs r2, r0, #3
    and r1, r0, #7
    ldr r0, [pc, #0x14] /* data_481c */ 
    mov r4, r3
    add r0, r2
    lsls r3, r1
    ldrb r2, [r0, #2]
    bics r2, r3
    strb r2, [r0, #2]
    ldr r0, [pc, #0xc] /* data_4820 */ 
    str r4, [r0, #0x14]
    pop {r4, pc}

data_4818:
.word 0x2000003c
data_481c:
.word 0x2000032c
data_4820:
.word 0x200000d8

call_4824:
    push {r4, lr}
    movs r1, #1
    lsls r0, r1, #0x10
    bl ckcu_apb1_clock_enable
    ldr r4, [pc, #0x28] /* data_4858 */ 
    movw r1, #0x8c9f
    mov r0, r4
    bl function_47
    movs r1, #1
    mov r0, r4
    bl function_46
    ldr r2, [pc, #0x18] /* data_485c */ 
    asrs r1, r4, #0x15
    str r1, [r2]
    mov r0, r4
    pop.w {r4, lr}
    mov.w r1, #1
    b.w function_45

.byte 0x0
.byte 0x0

data_4858:
.word 0x40076000
data_485c:
.word 0xe000e104

function_e_25:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0xe4] /* data_494c */ 
    ldr r6, [pc, #0xe0] /* data_4948 */ 
    ldr r4, [pc, #0xe4] /* data_4950 */ 
    ldrb r1, [r5, #-0x8]
    ldr.w r2, [r6, r1, lsl #2]
    sub.w r1, r6, #0x9c
    ldr.w r0, [r1, r0, lsl #2]
    adds r1, r2, r0
    adds r0, r2, r4
    mov.w r2, #0x3f0
    bl spi_flash_read_data
    ldrb r0, [r5, #-0x8]
    ldr.w ip, [pc, #0xc8] /* data_4954 */ 
    ldr.w r0, [r6, r0, lsl #2]
    add.w lr, ip, #0x120
    ldrb r1, [r4, r0]
    strb r1, [r5, #0x19]
    adds r1, r4, #1
    ldrb r2, [r0, r1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldrb r1, [r0, r1]
    add.w r1, r2, r1, lsl #8
    strh r1, [r5, #0x26]
    adds r1, r4, #3
    ldrb r2, [r0, r1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldrb r1, [r0, r1]
    add.w r1, r2, r1, lsl #8
    strh r1, [r5, #0x28]
    adds r1, r4, #5
    ldrb r2, [r0, r1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldrb r1, [r0, r1]
    add.w r1, r2, r1, lsl #8
    strh r1, [r5, #0x2a]
    adds r1, r4, #7
    ldrb r2, [r0, r1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldrb r1, [r0, r1]
    add.w r1, r2, r1, lsl #8
    strh r1, [r5, #0x2c]
    add.w r1, r4, #9
    movs r2, #0
    ldrb r1, [r0, r1]
    strb r1, [r5, #-0x1a]
    add.w r1, r4, #0xa
    adds r3, r0, r4
    ldrb r1, [r0, r1]
    strb r1, [r5, #0x1d]
    add.w r1, r4, #0xb
    ldrb r1, [r0, r1]
    strb r1, [r5, #0x1e]
jump_48f0:
    movs r0, #0
    add.w r4, lr, r2, lsl #5
    add.w r5, ip, r2, lsl #5
jump_48fa:
    add.w r1, r0, r2, lsl #3
    lsls r1, r1, #2
    add.w r6, r1, #0xc
    add r6, r3
    add.w r7, r5, r0, lsl #2
    ldrh r6, [r6]
    strh.w r6, [r5, r0, lsl #2]
    add.w r6, r1, #0xe
    add r6, r3
    ldrh r6, [r6]
    strh r6, [r7, #2]
    addw r6, r1, #0x12d
    add r6, r3
    addw r1, r1, #0x12f
function_e_24:
    ldrh r6, [r6]
    strh.w r6, [r4, r0, lsl #2]
    add.w r6, r4, r0, lsl #2
    add r1, r3
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrh r1, [r1]
    uxtb r0, r0
    strh r1, [r6, #2]
    cmp r0, #8
    blo jump_48fa
    .short 0x1c52 /* adds r2, r2, #1 */ 
    uxtb r2, r2
    cmp r2, #9
    blo jump_48f0
    pop.w {r4, r5, r6, r7, r8, pc}

data_4948:
.word data_12
data_494c:
.word 0x20000078
data_4950:
.word 0x20001cba
data_4954:
.word 0x2000091e

function_e_26:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr r7, [pc, #0x2c4] /* data_4c24 */ 
    ldrb r0, [r7, #0xa]
    cmp r0, #5
    bhs jump_4a5e
    tbb [pc, r0]

.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x3
.byte 0xfe
.byte 0x0

switch_496e:
    ldr r0, [pc, #0x2b8] /* data_4c28 */ 
    movs r5, #0
    ldrb r1, [r0, #8]
    and r1, r1, #0xbf
    strb r1, [r0, #8]
    ldr r0, [pc, #0x2b0] /* data_4c2c */ 
    ldrb r1, [r0, #0x1c]
    and r1, r1, #0xbf
    strb r1, [r0, #0x1c]
    b jump_498a
jump_4986:
    cmp r5, #8
    beq jump_49e0
jump_498a:
    ldr r0, [pc, #0x2a0] /* data_4c2c */ 
    adds r1, r0, r5
    ldrb r6, [r1, #2]
jump_4990:
    ldr r0, [pc, #0x298] /* data_4c2c */ 
    movs r4, #0
    add.w fp, r0, r5
    ldrb.w r0, [fp, #0x14]
    eor.w sb, r0, r6
jump_49a0:
    lsls.w r0, sb, #0x1f
    beq jump_4aa4
    movs r0, #1
    str r0, [r7, #0x7c]
    ldr r0, [pc, #0x284] /* data_4c30 */ 
    add.w r0, r0, r5, lsl #3
    ldrb.w sl, [r0, r4]
    lsls r0, r6, #0x1f
    beq jump_49ea
    ldrb.w r1, [r7, #0x3d]
    add.w r0, r4, r5, lsl #3
    cmp r0, r1
    bne jump_49cc
    movs r0, #0
    strb r0, [r7, #2]
    str r0, [r7, #0x68]
    str r0, [r7, #0x6c]
jump_49cc:
    ldrb.w r1, [fp, #0x14]
    movs r0, #1
    lsls r0, r4
    eors r1, r0
    strb.w r1, [fp, #0x14]
    ldrb r0, [r7, #0xa]
    cbz r0, jump_4a5c
    b jump_4ba6
jump_49e0:
    ldr r0, [pc, #0x248] /* data_4c2c */ 
    ldrb r0, [r0, #0xa]
    and r6, r0, #0xbf
    b jump_4990
jump_49ea:
    ldrb r1, [r7, #0xa]
    movs r0, #0
    cmp r1, #2
    bne jump_4ae2
    ldrb.w r2, [r7, #0x3d]
    add.w r1, r4, r5, lsl #3
    cmp r1, r2
    bne jump_4a04
    movs r0, #1
    strb r0, [r7, #2]
    b jump_4a0a
jump_4a04:
    ldrb r1, [r7, #2]
    cmp r1, #1
    bne jump_4a36
jump_4a0a:
    cmp r5, #1
    bne jump_4a36
    cmp r4, #1
    beq jump_4a1c
    cmp r4, #2
    beq jump_4a26
    cmp r4, #3
    beq jump_4a2c
    b jump_4a36
jump_4a1c:
    bl function_e_52
    movs r0, #1
    movs r1, #3
    b jump_4a34
jump_4a26:
    ldrb r1, [r7, #9]
    cbz r1, jump_4a32
    b jump_4a36
jump_4a2c:
    ldrb r1, [r7, #9]
    cmp r1, #1
    bne jump_4a36
jump_4a32:
    movs r1, #4
jump_4a34:
    strb r1, [r7, #0xa]
jump_4a36:
    ldrb r1, [r7, #9]
    cbnz r1, jump_4a86
    ldrb r1, [r7, #0xa]
    cmp r1, #4
    beq jump_4a86
    cbnz r0, jump_4a86
    ldr r1, [pc, #0x1e4] /* data_4c28 */ 
    ldrh.w r2, [r7, #0x52]
    adds r1, #0x12
    add.w r1, r1, r5, lsl #5
    ldrh.w r3, [r1, r4, lsl #2]
    cmp r3, r2
    bne jump_4a78
    add.w r8, r1, r4, lsl #2
    b jump_4a60
jump_4a5c:
    b jump_4b72
jump_4a5e:
    b jump_4c0c
jump_4a60:
    ldrh.w r3, [r8, #2]
    ldrh.w ip, [r7, #0x54]
    cmp r3, ip
    bne jump_4a78
    movs r2, #0
    strh.w r2, [r1, r4, lsl #2]
    strh.w r2, [r8, #2]
    b jump_4a86
jump_4a78:
    strh.w r2, [r1, r4, lsl #2]
    add.w r1, r1, r4, lsl #2
    ldrh.w r2, [r7, #0x54]
    strh r2, [r1, #2]
jump_4a86:
    ldrb r1, [r7, #9]
    cmp r1, #1
    bne jump_4ad8
    ldrb r1, [r7, #0xa]
    cmp r1, #4
    beq jump_4ad8
    cbnz r0, jump_4ad6
    ldr r0, [pc, #0x19c] /* data_4c34 */ 
    ldrh.w r1, [r7, #0x52]
    add.w r0, r0, r5, lsl #5
    ldrh.w r2, [r0, r4, lsl #2]
    b jump_4aa6
jump_4aa4:
    b jump_4bc8
jump_4aa6:
    cmp r2, r1
    bne jump_4ac6
    add.w ip, r0, r4, lsl #2
    ldrh.w r3, [r7, #0x54]
    ldrh.w r2, [ip, #2]
    cmp r2, r3
    bne jump_4ac6
    movs r1, #0
    strh.w r1, [r0, r4, lsl #2]
    strh.w r1, [ip, #2]
    b jump_4ada
jump_4ac6:
    strh.w r1, [r0, r4, lsl #2]
    add.w r0, r0, r4, lsl #2
    ldrh.w r1, [r7, #0x54]
    strh r1, [r0, #2]
    b jump_4ada
jump_4ad6:
    b jump_4ae2
jump_4ad8:
    cbnz r0, jump_4ae2
jump_4ada:
    ldrb.w r0, [r7, #0x39]
    bl function_e_18
jump_4ae2:
    ldrb r0, [r7, #0xa]
    cmp r0, #3
    bne.w jump_49cc
    orrs.w r0, r5, r4
    beq jump_4b32
    cmp r5, #4
    beq jump_4afa
    cmp r5, #5
    beq jump_4b02
    b jump_4b06
jump_4afa:
    cmp r4, #6
    bne jump_4b06
    movs r0, #0xb
    b jump_4b32
jump_4b02:
    cmp r4, #2
    beq jump_4b24
jump_4b06:
    sub.w r0, sl, #0x1e
    cmp r0, #0xd
    bhs.w jump_49cc
    tbb [pc, r0]

.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0xa
.byte 0x7
.byte 0x7
.byte 0xe
.byte 0x0

switch_4b22:
    b jump_49cc
jump_4b24:
    movs r0, #0xc
    b jump_4b32
switch_4b28:
    sub.w r0, sl, #0x1d
    uxtb r0, r0
    b jump_4b32
switch_4b30:
    movs r0, #0xd
jump_4b32:
    ldr r1, [pc, #0x104] /* data_4c38 */ 
    ldrh.w r0, [r1, r0, lsl #1]
    strh.w r0, [r7, #0x52]
    ldrb.w r0, [r7, #0x39]
    bl function_e_18
    ldrh.w r0, [r7, #0x52]
    mov.w r1, #0x3e8
    rsb r0, r0, r0, lsl #16
    udiv r0, r0, r1
    mov.w r1, #0x1c2
    muls r0, r1, r0
    movw r1, #0xffff
    udiv r0, r0, r1
    b jump_4b66
switch_4b64:
    b jump_4be4
jump_4b66:
    ldr r1, [pc, #0xd4] /* data_4c3c */ 
    strh.w r0, [r1, #0x52]
    movs r0, #2
    strb r0, [r7, #0xa]
    b jump_49cc
jump_4b72:
    bl call_8894
    cmp r0, #1
    bne jump_4ba6
    ldrb r0, [r7, #0xa]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r7, #0xa]
    movs r0, #0
    str r0, [r7, #0x7c]
    ldr r1, [pc, #0x9c] /* data_4c24 */ 
    adds r1, #0x80
    str r0, [r1]
    strb r0, [r7, #2]
    strb r0, [r7, #4]
    ldrh.w r0, [r7, #0x46]
    ldrh.w r1, [r7, #0x48]
    orrs.w r2, r0, r1
    bne jump_4b9e
    movs r1, #0xc8
jump_4b9e:
    strh.w r1, [r7, #0x52]
    strh.w r0, [r7, #0x54]
jump_4ba6:
    ldrb r0, [r7, #0xa]
    cmp r0, #1
    bne jump_4bb8
    ldrb r0, [r7, #9]
    cmp r0, #2
    beq jump_4bb8
    ldrb r0, [r7, #0xa]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r7, #0xa]
jump_4bb8:
    bl call_8894
    cmp r0, #1
    bne jump_4bc8
    ldrb r0, [r7, #0xa]
    cmp r0, #4
    bne jump_4bc8
    strb r0, [r7, #0xa]
jump_4bc8:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    lsrs r6, r6, #1
    uxtb r4, r4
    lsr.w sb, sb, #1
    cmp r4, #8
    blo.w jump_49a0
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
    cmp r5, #9
    blo.w jump_4986
    b jump_4c0c
jump_4be4:
    ldrb r0, [r7, #9]
    strb r0, [r7, #6]
    bl function_e_5
    movs r0, #2
    strb r0, [r7, #9]
    movs r0, #0x63
    strb r0, [r7, #0xa]
    movs r0, #0
    strb r0, [r7, #2]
    strb r0, [r7, #4]
    str r0, [r7, #0x68]
    str r0, [r7, #0x6c]
    str r0, [r7, #0x7c]
    ldr r1, [pc, #0x38] /* data_4c3c */ 
    strh.w r0, [r1, #0x52]
    ldr r1, [pc, #0x38] /* data_4c40 */ 
    strh.w r0, [r1, #0x52]
jump_4c0c:
    ldr r1, [r7, #0x7c]
    movw r0, #0x4e20
    cmp r1, r0
    blo jump_4c20
    ldrb r0, [r7, #0xa]
    cmp r0, #0x14
    bhi jump_4c20
    movs r0, #4
    strb r0, [r7, #0xa]
jump_4c20:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_4c24:
.word 0x20000058
data_4c28:
.word 0x2000090c
data_4c2c:
.word 0x20002de4
data_4c30:
.word data_7
data_4c34:
.word 0x20000a3e
data_4c38:
.word 0x20000160
data_4c3c:
.word 0x20002e2c
data_4c40:
.word 0x20002ebc

function_e_27:
    cmp r1, #0
    ldr r1, [r0, #0x70]
    beq jump_4c50
    orr r1, r1, #0x10
    b jump_4c54
jump_4c50:
    bic r1, r1, #0x10
jump_4c54:
    str r1, [r0, #0x70]
    bx lr
function_e_28:
    cmp r1, #0
    ldr r1, [r0, #0x10]
    beq jump_4c64
    orr r1, r1, #1
    b jump_4c68
jump_4c64:
    bic r1, r1, #1
jump_4c68:
    str r1, [r0, #0x10]
    bx lr
function_e_29:
    push {r4, r5, r6, r7, lr}
    ldrb r3, [r1]
    movs r4, #3
    add.w lr, r0, r3, lsl #2
    lsls r3, r3, #1
    lsls r4, r3
    ldr r5, [r0, #0x50]
    add.w r2, lr, #0x40
    add.w ip, lr, #0x90
    mvns r4, r4
    ands r5, r4
    str r5, [r0, #0x50]
    ldr r5, [r0, #0x54]
    ldrb r6, [r1, #0xa]
    ldrb r7, [r1, #0xb]
    ands r5, r4
    orr.w r6, r6, r7, lsl #1
    lsls r6, r3
    orrs r6, r5
    str r6, [r0, #0x54]
    ldr r5, [r0, #0x6c]
    ldrb r6, [r1, #0xd]
    ands r5, r4
    ldrb r4, [r1, #0xc]
    orr.w r4, r4, r6, lsl #1
    lsls r4, r3
    orrs r4, r5
    str r4, [r0, #0x6c]
    ldr r4, [r2]
    movw r5, #0x107
    bics r4, r5
    str r4, [r2]
    ldr r4, [r2]
    ldr r5, [r1, #4]
    orrs r4, r5
    str r4, [r2]
    ldrh r2, [r1, #0xe]
    str.w r2, [ip]
    ldrh r2, [r1, #0x10]
    str.w r2, [lr, #0xa0]
    ldrb r2, [r1, #8]
    ldrb r1, [r1, #9]
    orr.w r1, r2, r1, lsl #1
    ldr r2, [r0, #0x50]
    lsls r1, r3
    orrs r1, r2
    str r1, [r0, #0x50]
    pop {r4, r5, r6, r7, pc}
clear_some_mem:
    movs r1, #0
    strb r1, [r0]
    str r1, [r0, #4]
    strb r1, [r0, #8]
    strb r1, [r0, #9]
    strb r1, [r0, #0xa]
    strb r1, [r0, #0xb]
    strb r1, [r0, #0xc]
    strb r1, [r0, #0xd]
    strh r1, [r0, #0xe]
    strh r1, [r0, #0x10]
    bx lr
function_e_30:
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
    ldr r3, [r1, #8]
    orrs r2, r3
    str r2, [r0]
    ldrb r2, [r1, #4]
    str.w r2, [r0, #0x8c]
    ldrh r1, [r1, #0xc]
    str r1, [r0, #0x78]
    bx lr
function_e_31:
    movs r1, #0
    movw r2, #0xffff
    str r1, [r0, #8]
    strh r2, [r0]
    strh r1, [r0, #2]
    mov.w r2, #0x100
    strh r2, [r0, #0xc]
    strb r1, [r0, #4]
    bx lr
spi_flash_read_status:
    push {r2, r3, r4, r5, r6, lr}
    ldr r4, [pc, #0x20] /* data_4d60 */ 
    movs r0, #5
    strh.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #2
    add r1, sp, #4
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    ldrb.w r0, [sp, #5]
    pop {r2, r3, r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4d60:
.word 0x400b2000

spi_init:
    push {r4, r5, r6, lr}
    sub sp, #0x30
    bl spi_gpio_init
    ldr r4, [pc, #0x5c] /* data_4dcc */ 
    ldrb r0, [r4]
    cmp r0, #1
    bne jump_4dc4
    movs r1, #1
    movs r0, #0x20
    bl ckcu_apb0_clock_enable
    mov.w r0, #0x4000
    asrs r5, r0, #4
    strd r0, r5, [sp]
    movs r0, #8
    str r0, [sp, #8]
    movs r0, #0
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
    movs r0, #4
    ldr r6, [pc, #0x34] /* data_4dd0 */ 
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    mov r1, sp
    mov r0, r6
    bl spi_config
    movs r1, #1
    mov r0, r6
    bl spi_slave_select_output
    ldr r0, [pc, #0x20] /* data_4dd4 */ 
    str r5, [r0, #0x24]
    movs r1, #1
    mov r0, r6
    bl spi_enable
    bl pinmux_b789_spi
    movs r0, #2
    strb r0, [r4]
jump_4dc4:
    add sp, #0x30
    movs r0, #1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4dcc:
.word 0x20000220
data_4dd0:
.word 0x40044000
data_4dd4:
.word 0x400b2000

spi_flash_read_wip:
    push {r4, lr}
    bl spi_flash_read_status
    ubfx r0, r0, #0, #1
    pop {r4, pc}
spi_gpio_init:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x44] /* data_4e2c */ 
    ldrb r0, [r4]
    cbnz r0, jump_4e26
    movs r1, #1
    lsls r0, r1, #0x11
    bl ckcu_ahb_clock_enable
    ldr r6, [pc, #0x38] /* data_4e30 */ 
    mov.w r5, #0x400
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl gpio_set_output_current
    movs r2, #1
    movs r1, #0x80
    mov r0, r6
    bl gpio_set_output_current
    movs r2, #1
    lsls r1, r2, #8
    mov r0, r6
    bl gpio_set_output_current
    movs r0, #1
    strb r0, [r4]
jump_4e26:
    movs r0, #1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4e2c:
.word 0x20000220
data_4e30:
.word 0x400b2000

pinmux_select_b789:
    cbz r0, jump_4e3a
    b.w pinmux_b789_gpio
jump_4e3a:
    b.w pinmux_b789_spi

.byte 0x0
.byte 0x0

pinmux_b789_spi:
    push {r4, r5, r6, lr}
    movs r2, #1
    ldr r5, [pc, #0x38] /* data_4e80 */ 
    lsls r4, r2, #0xa
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_output
    movs r2, #2
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #5
    movs r1, #7
    movs r0, #1
    bl afio_pin_config
    movs r2, #5
    movs r1, #8
    movs r0, #1
    bl afio_pin_config
    movs r2, #5
    movs r1, #9
    movs r0, #1
    bl afio_pin_config
    pop.w {r4, r5, r6, lr}
    b.w spi_flash_release_sleep

data_4e80:
.word 0x400b2000

pinmux_b789_gpio:
    push {r4, r5, r6, lr}
    bl spi_flash_deep_power_down
    ldr r5, [pc, #0x3c] /* data_4ec8 */ 
    mov.w r4, #0x400
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_output
    movs r2, #0
    movs r1, #7
    movs r0, #1
    bl afio_pin_config
    movs r2, #0
    movs r1, #8
    movs r0, #1
    bl afio_pin_config
    pop.w {r4, r5, r6, lr}
    movs r2, #0
    movs r1, #9
    movs r0, #1
    b.w afio_pin_config

.byte 0x0
.byte 0x0

data_4ec8:
.word 0x400b2000

spi_flash_page_program:
    push.w {r3, r4, r5, r6, r7, r8, sb, lr}
    mov r7, r0
    mov r4, r1
    mov r8, r2
    bl spi_flash_write_enable
    ldr r6, [pc, #0x38] /* data_4f14 */ 
    mov.w r5, #0x400
    str r5, [r6, #0x28]
    movs r0, #2
    strb.w r0, [sp]
    lsrs r0, r4, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r4, #8
    strb.w r0, [sp, #2]
    strb.w r4, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    mov r2, r8
    movs r1, #0
    mov r0, r7
    bl spi_write_read
    str r5, [r6, #0x24]
    pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

.byte 0x0
.byte 0x0

data_4f14:
.word 0x400b2000

spi_flash_sector_erase:
    push {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl spi_flash_write_enable
    ldr r6, [pc, #0x28] /* data_4f4c */ 
    mov.w r5, #0x400
    str r5, [r6, #0x28]
    movs r0, #0x20
    strb.w r0, [sp]
    lsrs r0, r4, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r4, #8
    strb.w r0, [sp, #2]
    strb.w r4, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r6, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_4f4c:
.word 0x400b2000

spi_flash_write_status_register:
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    bl spi_flash_write_enable
    ldr r4, [pc, #0x1c] /* data_4f78 */ 
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r0, #1
    strb.w r0, [sp]
    strb.w r6, [sp, #1]
    movs r2, #2
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_4f78:
.word 0x400b2000

function_78:
    push {r4, lr}
    movs r4, #0x3c
    bl spi_flash_page_program
    b jump_4f92
jump_4f86:
    movs r0, #0x64
    bl spin_wait_maybe
    bl spi_flash_read_wip
    cbz r0, jump_4f9a
jump_4f92:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    adds r0, r4, #1
    bne jump_4f86
    pop {r4, pc}
jump_4f9a:
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

spi_flash_deep_power_down:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x20] /* data_4fc4 */ 
    movs r0, #0xb9
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    pop {r3, r4, r5, pc}

data_4fc4:
.word 0x400b2000

spi_flash_read_data:
    push {r3, r4, r5, r6, r7, lr}
    ldr r5, [pc, #0x38] /* data_5004 */ 
    mov.w r4, #0x400
    mov r7, r0
    mov r6, r2
    str r4, [r5, #0x28]
    movs r0, #3
    strb.w r0, [sp]
    lsrs r0, r1, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r1, #8
    strb.w r0, [sp, #2]
    strb.w r1, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    mov r2, r6
    mov r1, r7
    movs r0, #0
    bl spi_write_read
    str r4, [r5, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_5004:
.word 0x400b2000

spi_write_read:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r6, r1
    ldr r1, [pc, #0x88] /* data_5098 */ 
    mov r5, r0
    movs r4, #0
    ldr r0, [r1, #4]
    mov r7, r2
    cmp r0, #0
    ble jump_5022
    subs r0, r0, r7
    str r0, [r1, #4]
    b jump_502c
jump_5022:
    mov.w r0, #0xfa0
    str r0, [r1, #4]
    bl watchdog_reload_timer
jump_502c:
    cmp r7, #8
    bls jump_5034
    movs r0, #8
    b jump_5036
jump_5034:
    mov r0, r7
jump_5036:
    movs r2, #0
    mov r3, r2
    ldr r1, [pc, #0x60] /* data_509c */ 
    b jump_504a
jump_503e:
    cbz r5, jump_5050
    ldrb.w ip, [r5, r2]
    str.w ip, [r1, #0x10]
jump_5048:
    .short 0x1c52 /* adds r2, r2, #1 */ 
jump_504a:
    cmp r2, r0
    blo jump_503e
    b jump_5072
jump_5050:
    str r3, [r1, #0x10]
    b jump_5048
jump_5054:
    ldr r2, [r1, #0x1c]
    tst.w r2, #0xf0
    beq jump_5054
    ldr r2, [r1, #0x10]
    uxtb r2, r2
    cbz r5, jump_5078
    ldrb.w ip, [r5, r0]
    str.w ip, [r1, #0x10]
jump_506a:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cbz r6, jump_5070
    strb r2, [r6, r4]
jump_5070:
    .short 0x1c64 /* adds r4, r4, #1 */ 
jump_5072:
    cmp r0, r7
    blo jump_5054
    b jump_508e
jump_5078:
    str r3, [r1, #0x10]
    b jump_506a
jump_507c:
    ldr r0, [r1, #0x1c]
    tst.w r0, #0xf0
    beq jump_507c
    ldr r0, [r1, #0x10]
    uxtb r0, r0
    cbz r6, jump_508c
    strb r0, [r6, r4]
jump_508c:
    .short 0x1c64 /* adds r4, r4, #1 */ 
jump_508e:
    cmp r4, r7
    blo jump_507c
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_5098:
.word 0x20000220
data_509c:
.word 0x40044000

function_e_40:
    push {r4, r5, r6, lr}
    movw r4, #0x12d
    bl spi_flash_sector_erase
    mov.w r5, #0x3e8
    b jump_50bc
jump_50b0:
    mov r0, r5
    bl spin_wait_maybe
    bl spi_flash_read_wip
    cbz r0, jump_50c4
jump_50bc:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    adds r0, r4, #1
    bne jump_50b0
    pop {r4, r5, r6, pc}
jump_50c4:
    movs r0, #1
    pop {r4, r5, r6, pc}
spi_flash_release_sleep:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x20] /* data_50ec */ 
    movs r0, #0xab
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    pop {r3, r4, r5, pc}

data_50ec:
.word 0x400b2000

function_27:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    mov r6, r0
    rsbs r0, r1, #0
    uxtb r4, r0
    mov r5, r1
    cmp r4, r2
    bhs jump_510a
    subs r0, r2, r4
    ubfx r7, r0, #8, #0x10
    uxtb r0, r0
    b jump_5110
jump_510a:
    movs r7, #0
    uxth r4, r2
    mov r0, r7
jump_5110:
    mov r8, r0
    cbz r4, jump_5126
    mov r2, r4
    mov r1, r5
    mov r0, r6
    bl function_78
    cmp r0, #1
    bne jump_515e
    add r5, r4
    add r6, r4
jump_5126:
    movs r4, #0
    mov.w sb, #0x100
    b jump_5146
jump_512e:
    mov r2, sb
    mov r1, r5
    mov r0, r6
    bl function_78
    cmp r0, #1
    bne jump_515e
    add.w r5, r5, #0x100
    add.w r6, r6, #0x100
    .short 0x1c64 /* adds r4, r4, #1 */ 
jump_5146:
    cmp r4, r7
    blt jump_512e
    movs.w r0, r8
    beq jump_5164
    mov r2, r0
    mov r1, r5
    mov r0, r6
    bl function_78
    cmp r0, #1
    beq jump_5164
jump_515e:
    movs r0, #0
jump_5160:
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
jump_5164:
    movs r0, #1
    b jump_5160
spi_flash_write_enable:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x1c] /* data_5188 */ 
    movs r0, #6
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    pop {r3, r4, r5, pc}

.byte 0x0
.byte 0x0

data_5188:
.word 0x400b2000

spi_flash_set_status_reg:
    push {r4, lr}
    mov.w r4, #0x19a
    bl spi_flash_write_status_register
    b jump_51a4
jump_5198:
    movs r0, #0x64
    bl spin_wait_maybe
    bl spi_flash_read_wip
    cbz r0, jump_51ac
jump_51a4:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    adds r0, r4, #1
    bne jump_5198
    pop {r4, pc}
jump_51ac:
    movs r0, #1
    pop {r4, pc}
setup_intr_priority:
    push {r4, lr}
    mov.w r1, #0x2c00
    movs r0, #0
    bl nvic_set_vtor
    ldr r1, [pc, #0x78] /* data_5238 */ 
    ldr r0, [r1]
    movw r2, #0xf8ff
    and.w r0, r0, r2
    ldr r2, [pc, #0x70] /* data_523c */ 
    orr r0, r0, #0x300
    orr.w r0, r0, r2
    str r0, [r1]
    mov.w r2, #0
    mov r1, r2
    mov.w r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2b
    bl ppb_set_nvic_priority
    movs r2, #0
    mov r1, r2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2c
    bl ppb_set_nvic_priority
    movs r2, #0
    movs r1, #1
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2a
    bl ppb_set_nvic_priority
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x29
    bl ppb_set_nvic_priority
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    pop.w {r4, lr}
    movs r0, #0x35
    b.w ppb_set_nvic_priority

.byte 0x0
.byte 0x0

data_5238:
.word 0xe000ed0c
data_523c:
.word 0x5fa0000

calc_nvic_priority:
    push {r4, r5, lr}
    and r3, r0, #7
    movs r5, #4
    rsb.w r0, r3, #7
    cmp r0, #4
    bhi jump_5252
    mov r5, r0
jump_5252:
    movs r4, #0
    adds r0, r3, #4
    cmp r0, #7
    blo jump_525c
    subs r4, r3, #3
jump_525c:
    movs r3, #1
    lsl.w r0, r3, r5
    .short 0x1e40 /* subs r0, r0, #1 */ 
    ands r0, r1
    lsls r0, r4
    lsls r3, r4
    .short 0x1e5b /* subs r3, r3, #1 */ 
    ands r3, r2
    orrs r0, r3
    pop {r4, r5, pc}
ppb_set_nvic_priority:
    lsls r1, r1, #0x1c
    lsrs r1, r1, #0x18
    mov.w r2, #-0x1fff2000
    cmp r0, #0
    bge jump_528a
    and r0, r0, #0xf
    add r0, r2
    strb.w r1, [r0, #0xd14]
    bx lr
jump_528a:
    add r0, r2
    strb.w r1, [r0, #0x400]
    bx lr

.byte 0x0
.byte 0x0

nvic_set_vtor:
    ldr r2, [pc, #8] /* data_52a0 */ 
    ands r1, r2
    orrs r1, r0
    ldr r0, [pc, #8] /* data_52a4 */ 
    str r1, [r0]
    bx lr

data_52a0:
.word 0x1fffff80
data_52a4:
.word 0xe000ed08

spi_flash_init:
    push {r4, lr}
    bl spi_gpio_setup
    ldr r4, [pc, #0x3c] /* data_52ec */ 
    ldrb r0, [r4]
    cmp r0, #1
    bne jump_52e6
    bl spi_init
    cmp r0, #1
    bne jump_52de
    bl spi_flash_read_status
    cbz r0, jump_52ce
    movs r0, #0
    bl spi_flash_set_status_reg
    cmp r0, #1
    bne jump_52de
jump_52ce:
    bl spi_flash_read_status
    cbz r0, jump_52e2
    movs r0, #0
    bl spi_flash_set_status_reg
    cmp r0, #1
    beq jump_52e2
jump_52de:
    movs r0, #0
    pop {r4, pc}
jump_52e2:
    movs r0, #2
    strb r0, [r4]
jump_52e6:
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_52ec:
.word 0x20000228

spi_gpio_setup:
    push {r4, lr}
    ldr r4, [pc, #0x10] /* data_5304 */ 
    ldrb r0, [r4]
    cbnz r0, jump_5300
    bl spi_gpio_init
    movs r0, #1
    strb r0, [r4]
jump_5300:
    movs r0, #1
    pop {r4, pc}

data_5304:
.word 0x20000228

jump_2:
    b.w pinmux_select_b789
function_e_41:
    push.w {r4, r5, r6, r7, r8, sb, lr}
    ldr.w ip, [pc, #0x64] /* data_5378 */ 
    movs r1, #0
    ldr.w r8, [pc, #0x58] /* data_5370 */ 
    ldr.w sb, [pc, #0x58] /* data_5374 */ 
    mov r2, r1
    add.w r7, ip, #0x90
jump_5324:
    movs r0, #0
    add.w r3, r8, r1, lsl #4
    add.w r5, sb, r1, lsl #4
    add.w r4, ip, r1, lsl #4
    add.w r6, r7, r1, lsl #4
jump_5336:
    strh.w r2, [r3, r0, lsl #1]
    strh.w r2, [r5, r0, lsl #1]
    strh.w r2, [r4, r0, lsl #1]
    strh.w r2, [r6, r0, lsl #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_5336
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_5324
    ldr r0, [pc, #0x24] /* data_537c */ 
    str r2, [r0, #0x2c]
    subs r0, #0x48
    strb r2, [r0]
    strb r2, [r0, #2]
    strh r2, [r0, #0x16]
    strh r2, [r0, #0x18]
    strb r2, [r0, #-0x31]
    strb r2, [r0, #-0x30]
    pop.w {r4, r5, r6, r7, r8, sb, pc}

data_5370:
.word 0x20002e2c
data_5374:
.word 0x20002ebc
data_5378:
.word 0x20000b9a
data_537c:
.word 0x200000d8

function_e_42:
    push {r4, r5, r6, r7, lr}
    rsb r0, r0, r0, lsl #16
    mov.w r5, #0x3e8
    udiv r0, r0, r5
    mov.w r3, #0x1c2
    muls r0, r3, r0
    movw r4, #0xffff
    udiv r0, r0, r4
    uxth r3, r0
    rsb r0, r1, r1, lsl #16
    udiv r0, r0, r5
    movs r2, #0
    mov.w r1, #0x1c2
    muls r0, r1, r0
    udiv r0, r0, r4
    ldr r7, [pc, #0x28] /* data_53dc */ 
    ldr r6, [pc, #0x28] /* data_53e0 */ 
    uxth r5, r0
jump_53b8:
    movs r0, #0
    add.w r1, r7, r2, lsl #4
    add.w r4, r6, r2, lsl #4
jump_53c2:
    strh.w r3, [r1, r0, lsl #1]
    strh.w r5, [r4, r0, lsl #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_53c2
    .short 0x1c52 /* adds r2, r2, #1 */ 
    uxtb r2, r2
    cmp r2, #9
    blo jump_53b8
    pop {r4, r5, r6, r7, pc}

data_53dc:
.word 0x20002e2c
data_53e0:
.word 0x20002ebc

function_e_43:
    push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w r8, [pc, #0x42c] /* data_5818 */ 
    movs r0, #0
    str r0, [sp]
    ldr.w r0, [r8, #0x5c]
    movw r1, #0x7530
    cmp r0, r1
    bhi jump_540e
    ldrb.w r1, [r8]
    mov r0, r8
    cmp r1, #0xa
    bne jump_5428
    ldr r0, [r0, #0x5c]
    cmp.w r0, #0xfa0
    bls jump_5428
jump_540e:
    movs r1, #0x14
    strb.w r1, [r8]
    movs r1, #0
    strb.w r1, [r8, #2]
    strb.w r1, [r8, #3]
    ldr r0, [pc, #0x3fc] /* data_581c */ 
    strh.w r1, [r0, #0x84]
    bl function_e_83
jump_5428:
    ldr r4, [pc, #0x3f4] /* data_5820 */ 
    ldrh r0, [r4]
    mov.w sb, #1
    cbnz r0, jump_54b0
    and r0, r5, #1
    mvns r0, r0
    uxtb r1, r0
    movs r6, #0
    mov r0, r7
    bl function_e_85
    ldr r1, [pc, #0x3e0] /* data_5824 */ 
    movs r0, #0
jump_5446:
    adds r2, r4, r0
    ldrb r2, [r2, #2]
    strb r2, [r1, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_5446
    ldrb r0, [r1, #8]
    movs r5, #0
    and r0, r0, #0xbf
    strb r0, [r1, #8]
    ldrb r0, [r4, #0x1c]
    and r0, r0, #0xbf
    strb r0, [r4, #0x1c]
jump_5466:
    ldr r0, [pc, #0x3bc] /* data_5824 */ 
    movs r4, #0
    ldrb.w sl, [r0, r5]
    ldr r0, [pc, #0x3b0] /* data_5820 */ 
    add r0, r5
    str r0, [sp, #4]
    ldrb r1, [r0, #0x14]
    eor.w fp, r1, sl
jump_547a:
    ldrb.w r0, [r8, #0x26]
    mov r2, r8
    cmp r0, #1
    beq jump_5548
    cmp r0, #2
    beq jump_554c
    ldr r0, [pc, #0x39c] /* data_5828 */ 
jump_548a:
    lsls.w r1, fp, #0x1f
    add.w r0, r0, r5, lsl #3
    ldrb r0, [r0, r4]
    beq jump_5592
    ldrb.w r3, [r2, #0x3d]
    add.w r1, r4, r5, lsl #3
    cmp r1, r3
    bne jump_54a8
    movs r0, #0xe8
    movs r3, #1
    str r3, [sp]
jump_54a8:
    ldrb.w r3, [r2, #0x3e]
    cmp r1, r3
    b jump_54b2
jump_54b0:
    b jump_5872
jump_54b2:
    bne jump_54ba
    movs r0, #0xca
    movs r1, #1
    str r1, [sp]
jump_54ba:
    ldrb r1, [r2]
    cmp r1, #0xa
    beq jump_54c4
    str.w sb, [r2, #0x5c]
jump_54c4:
    movs r3, #0
    strb r3, [r2, #0x17]
    ldrb.w r1, [r2, #0x32]
    cmp r1, #0x3f
    blo jump_54f0
    ldrb.w r2, [r8]
    mov r1, r8
    cmp r2, #0xa
    beq jump_54f0
    movs r2, #0xa
    strb r2, [r1]
    ldr r3, [pc, #0x338] /* data_5818 */ 
    adds r3, #0x80
    str.w sb, [r3, #0x24]
    str.w sb, [r1, #0x5c]
    movs r2, #0
    strb.w r2, [r8, #0x32]
jump_54f0:
    lsls.w r1, sl, #0x1f
    beq jump_5550
    ldrb.w r1, [r8, #0x32]
    cmp r1, #0x3f
    blo jump_5518
    ldrb.w r2, [r8]
    mov r1, r8
    cmp r2, #0xa
    beq jump_5518
    movs r2, #0xa
    strb r2, [r1]
    ldr r3, [pc, #0x308] /* data_5818 */ 
    adds r3, #0x80
    str.w sb, [r3, #0x24]
    str.w sb, [r1, #0x5c]
jump_5518:
    mov r2, r4
    mov r1, r5
    bl function_e_12
    mov r7, r0
    cmp r0, #0xe8
    beq jump_561a
    cmp r7, #0xca
    beq jump_5546
jump_552a:
    ldr r1, [pc, #0x300] /* data_582c */ 
    movs r0, #0
    add.w r2, r1, #0x2a
jump_5532:
    ldrb r3, [r1, r0]
    cmp r3, r5
    bne jump_553e
    ldrb r3, [r2, r0]
    cmp r3, r4
    beq jump_561c
jump_553e:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x2a
    blo jump_5532
jump_5546:
    b jump_57a2
jump_5548:
    ldr r0, [pc, #0x2e4] /* data_5830 */ 
    b jump_548a
jump_554c:
    ldr r0, [pc, #0x2e4] /* data_5834 */ 
    b jump_548a
jump_5550:
    mov r2, r4
    mov r1, r5
    bl function_e_13
    mov r7, r0
    cmp r0, #0xe8
    beq jump_5568
    ldrb.w r0, [r8, #2]
    cmp r0, #1
    beq jump_556c
    b jump_557a
jump_5568:
    strb.w sb, [r8, #2]
jump_556c:
    cmp r5, #8
    bne jump_557a
    cmp r4, #7
    bne jump_557a
    movs r0, #0x14
    strb.w r0, [r8]
jump_557a:
    ldrb.w r1, [r8, #0x20]
    mov r0, r8
    cmp r1, #1
    bne jump_5598
    movs r1, #0xa
    strb r1, [r0]
    ldr r2, [pc, #0x28c] /* data_5818 */ 
    adds r2, #0x80
    str.w sb, [r2, #0x24]
    b jump_5594
jump_5592:
    b jump_5856
jump_5594:
    str.w sb, [r0, #0x5c]
jump_5598:
    ldrb r0, [r0]
    cmp r0, #2
    beq jump_55a4
    cmp r0, #4
    bne jump_55ec
    b jump_55ee
jump_55a4:
    cmp r7, #0xe8
    beq jump_55ec
    cmp r7, #0xca
    beq jump_55ec
    cmp r7, #0x10
    beq jump_55bc
    cmp r7, #0x37
    beq jump_55bc
    cmp r7, #0x36
    beq jump_55bc
    cmp r7, #0x38
    bne jump_55c4
jump_55bc:
    ldrb.w r0, [r8, #2]
    cmp r0, #1
    beq jump_55ec
jump_55c4:
    ldrb.w r1, [r8, #2]
    strb.w r1, [r8, #0x35]
    strb.w r5, [r8, #0x33]
    strb.w r4, [r8, #0x34]
    movs r1, #3
    strb.w r1, [r8]
    movs r1, #0
    ldr r2, [pc, #0x258] /* data_5838 */ 
    strb.w r1, [r8, #0x32]
    mov r0, r1
jump_55e4:
    strb r1, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #0xff
    bls jump_55e4
jump_55ec:
    b jump_5732
jump_55ee:
    cmp r7, #0xe8
    beq jump_56a6
    ldrb.w r0, [r8, #0x32]
    cmp r0, #0x3f
    bhs jump_55fe
    cmp r7, #0xca
    bne jump_5632
jump_55fe:
    mov r1, r8
    cbz r0, jump_562e
    cmp r0, #0x3f
    blo jump_561e
    movs r0, #0xa
    mov r2, r1
    strb r0, [r1]
    ldr r1, [pc, #0x208] /* data_5818 */ 
    adds r1, #0x80
    str.w sb, [r1, #0x24]
    str.w sb, [r2, #0x5c]
    b jump_5632
jump_561a:
    b jump_576e
jump_561c:
    b jump_5776
jump_561e:
    bl function_26
    cmp r0, #1
    bne jump_5632
    movs r1, #5
    strb.w r1, [r8]
    b jump_5632
jump_562e:
    strb.w sb, [r1]
jump_5632:
    ldrb.w r0, [r8, #2]
    cmp r0, #1
    bne jump_572a
    ldr r0, [sp]
    cmp r0, #1
    beq jump_572a
    cmp r7, #0xca
    beq jump_5684
    ldr r1, [pc, #0x1e4] /* data_582c */ 
    movs r0, #0
    add.w r2, r1, #0x2a
jump_564c:
    ldrb r3, [r1, r0]
    cmp r3, r5
    bne jump_5658
    ldrb r3, [r2, r0]
    cmp r3, r4
    beq jump_5662
jump_5658:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x2a
    blo jump_564c
    b jump_5684
jump_5662:
    cmp r0, #0x2a
    bhs jump_5684
    movs r2, #1
    and r1, r0, #0x1f
    lsls r2, r1
    ldr r7, [pc, #0x1a8] /* data_5818 */ 
    lsrs r1, r0, #5
    adds r7, #0xf8
    ldr.w r3, [r7, r1, lsl #2]
    orrs r3, r2
    str.w r3, [r7, r1, lsl #2]
    ldr r1, [pc, #0x1ac] /* data_582c */ 
    adds r1, #0x54
    ldrb r7, [r1, r0]
jump_5684:
    cmp r7, #0xc4
    beq jump_56a8
    bgt jump_5698
    cmp r7, #5
    beq jump_56da
    cmp r7, #0xa
    beq jump_56d0
    cmp r7, #0x17
    bne jump_56a0
    b jump_56c6
jump_5698:
    cmp r7, #0xc5
    beq jump_56b4
    cmp r7, #0xc6
    beq jump_56ae
jump_56a0:
    ldrb.w r0, [r8, #1]
    cbz r0, jump_56b8
jump_56a6:
    b jump_5732
jump_56a8:
    bl function_e_90
    b jump_56b8
jump_56ae:
    bl function_e_88
    b jump_56b8
jump_56b4:
    bl function_e_91
jump_56b8:
    movs r6, #1
    movs r0, #6
    str.w r0, [r8, #0x60]
    str.w r0, [r8, #0x64]
    b jump_5740
jump_56c6:
    ldr.w r1, [r8, #0x64]
    mov r0, r8
    adds r1, #0x1e
    b jump_56e4
jump_56d0:
    ldr.w r1, [r8, #0x64]
    mov r0, r8
    adds r1, #0xc8
    b jump_56e4
jump_56da:
    ldr.w r1, [r8, #0x64]
    mov r0, r8
    add.w r1, r1, #0x3e8
jump_56e4:
    str r1, [r0, #0x64]
    ldr.w r0, [r8, #0x64]
    movw r1, #0xf830
    cmp r0, r1
    bhs jump_5732
    ldrb.w r0, [r8, #0x32]
    cbz r0, jump_5710
    ldr.w r1, [r8, #0x64]
    lsrs r2, r1, #8
    ldr r1, [pc, #0x138] /* data_5838 */ 
    add.w r0, r1, r0, lsl #2
    strb r2, [r0, #-0x2]!
    ldr.w r1, [r8, #0x64]
    strb r1, [r0, #1]
    b jump_5720
jump_5710:
    ldr.w r0, [r8, #0x64]
    str.w r0, [r8, #0x60]
    movs r1, #0
    mov r0, r1
    bl function_e_11
jump_5720:
    movs r6, #2
    strb.w sb, [r8, #1]
    b jump_5848

.byte 0xff
.byte 0xe7

jump_572a:
    ldrb.w r1, [r8, #1]
    mov r0, r8
    cbz r1, jump_5738
jump_5732:
    cmp r6, #1
    beq jump_5740
    b jump_5848
jump_5738:
    movs r6, #1
    movs r1, #6
    str r1, [r0, #0x60]
    str r1, [r0, #0x64]
jump_5740:
    ldrb.w r0, [r8]
    cmp r0, #4
    bne jump_5848
    movs r1, #1
    mov r0, r7
    bl function_e_32
    mov r0, r7
    bl function_13
    cmp r0, #1
    bne jump_5762
    ldr r1, [pc, #0xbc] /* data_5818 */ 
    adds r1, #0x80
    str.w sb, [r1, #0x10]
jump_5762:
    movs r1, #1
    mov r0, r7
    bl function_e_11
    movs r6, #0
    b jump_5848
jump_576e:
    movs r0, #0
    strb.w r0, [r8, #2]
    b jump_552a
jump_5776:
    cmp r0, #0x2a
    bhs jump_57a2
    ldr.w ip, [pc, #0x9c] /* data_5818 */ 
    lsr.w lr, r0, #5
    add.w ip, ip, #0xf8
    and r3, r0, #0x1f
    ldr.w r1, [ip, lr, lsl #2]
    lsl.w r2, sb, r3
    tst r1, r2
    beq jump_57a2
    ldr r3, [pc, #0x94] /* data_582c */ 
    adds r3, #0x7e
    bics r1, r2
    ldrb r7, [r3, r0]
    str.w r1, [ip, lr, lsl #2]
jump_57a2:
    ldrb.w r0, [r8, #1]
    cbnz r0, jump_57ee
    mov r0, r7
    bl function_e_23
    ldr r1, [pc, #0x68] /* data_5818 */ 
    mov r0, r7
    adds r1, #0x80
    str.w sb, [r1, #0x10]
    movs r1, #0
    bl function_e_32
    ldrb.w r0, [r8]
    cmp r0, #1
    beq jump_57d0
    cmp r0, #3
    beq jump_57e0
    cmp r0, #4
    bne jump_580c
    b jump_57f0
jump_57d0:
    bl function_80
    cmp r0, #1
    bne jump_580c
    movs r0, #2
    strb.w r0, [r8]
    b jump_580c
jump_57e0:
    bl function_80
    cmp r0, #1
    bne jump_580c
    movs r1, #4
    strb.w r1, [r8]
jump_57ee:
    b jump_580c
jump_57f0:
    cmp r7, #0xe8
    beq jump_580c
    cmp r7, #0xca
    beq jump_580c
    ldrb.w r1, [r8, #0x32]
    cbz r1, jump_580c
    ldrb.w r0, [r8, #1]
    cbnz r0, jump_580c
    movs r1, #0
    mov r0, r7
    bl function_e_11
jump_580c:
    ldrb.w r0, [r8, #1]
    mov r7, r8
    cmp r0, #1
    bne jump_5848
    b jump_583c

data_5818:
.word 0x20000058
data_581c:
.word 0x20002e2c
data_5820:
.word 0x20002de4
data_5824:
.word 0x2000090c
data_5828:
.word data_7
data_582c:
.word data_13
data_5830:
.word data_5
data_5834:
.word data_6
data_5838:
.word 0x2000080c

jump_583c:
    bl function_80
    cmp r0, #1
    bne jump_5848
    movs r0, #0
    strb r0, [r7, #1]
jump_5848:
    ldr r0, [sp, #4]
    ldrb r1, [r0, #0x14]
    lsl.w r0, sb, r4
    eors r1, r0
    ldr r0, [sp, #4]
    strb r1, [r0, #0x14]
jump_5856:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    lsr.w fp, fp, #1
    lsr.w sl, sl, #1
    cmp r4, #8
    blo.w jump_547a
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
    cmp r5, #9
    blo.w jump_5466
jump_5872:
    ldrb.w r0, [r8]
    mov r4, r8
    cmp r0, #5
    bne jump_5930
    bl function_80
    cmp r0, #1
    bne jump_5930
    ldrb.w r2, [r4, #0x35]
    ldr r1, [pc, #0xd4] /* data_5960 */ 
    cbz r2, jump_5892
    cmp r2, #1
    beq jump_58ae
    b jump_58ca
jump_5892:
    movs r0, #2
    strb r0, [r1]
    ldrb.w r0, [r4, #0x32]
    cmp r0, #2
    bne jump_58ca
    ldr r0, [pc, #0xc4] /* data_5964 */ 
    ldrb r3, [r0, #6]
    cbnz r3, jump_58ca
    ldrb r0, [r0, #7]
    cmp r0, #6
    bne jump_58ca
    movs r0, #0x12
    b jump_58c8
jump_58ae:
    movs r0, #3
    strb r0, [r1]
    ldrb.w r0, [r4, #0x32]
    cmp r0, #2
    bne jump_58ca
    ldr r0, [pc, #0xa8] /* data_5964 */ 
    ldrb r3, [r0, #6]
    cbnz r3, jump_58ca
    ldrb r0, [r0, #7]
    cmp r0, #6
    bne jump_58ca
    movs r0, #0x13
jump_58c8:
    strb r0, [r1]
jump_58ca:
    ldr r3, [pc, #0x98] /* data_5964 */ 
    movs r0, #0
jump_58ce:
    adds r6, r1, r0
    ldrb r5, [r3, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r5, [r6, #1]
    cmp r0, #0xff
    bls jump_58ce
    add.w r4, r4, #0x18
    ldr r1, [pc, #0x88] /* data_5968 */ 
    ldrb r0, [r4, #0xe]
    add.w r0, r0, r0, lsl #1
    add.w r0, r1, r0, lsl #4
    ldrb r1, [r4]
    add.w r0, r0, r1, lsl #4
    cbz r2, jump_5958
    sub.w r0, r0, #0xc
jump_58f6:
    ldrb r2, [r4, #0x1c]
    ldrb r3, [r4, #0x1b]
    ldr r1, [r0, #8]
    add.w r2, r2, r3, lsl #3
    ldr r0, [r0]
    add.w r5, r1, r2, lsl #8
    add r0, r2
    sub.w r4, r4, #0x18
    mov.w r2, #0
    mov r1, r0
    bl function_e_97
    movs r2, #1
    add.w r1, r5, #0xff
    mov r0, r5
    bl function_e_97
    bl function_e_83
    strb.w sb, [r4]
    movs r0, #0
    strb.w r0, [r4, #0x32]
jump_5930:
    bl function_80
    cmp r0, #1
    bne jump_5954
    ldrb r0, [r4]
    cmp r0, #0x14
    bne jump_5954
    movs r5, #0
    strb r5, [r4, #0x16]
    bl function_e_83
    str r5, [r4, #0x5c]
    strb r5, [r4]
    ldr r0, [pc, #0x20] /* data_596c */ 
    str r5, [r0, #0x24]
    adds r0, #0x78
    str r5, [r0]
    str r5, [r0, #4]
jump_5954:
    pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
jump_5958:
    b jump_595a
jump_595a:
    sub.w r0, r0, #0x10
    b jump_58f6

data_5960:
.word 0x20001cba
data_5964:
.word 0x2000080c
data_5968:
.word data_16
data_596c:
.word 0x200000d8

debug_cmd:
    push {r3, lr}
    ldr r1, [pc, #0x38] /* data_59ac */ 
    ldr r2, [pc, #0x38] /* data_59b0 */ 
    cmp r0, #6
    bhs jump_59a8
    tbb [pc, r0]

.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x7
.byte 0xa
.byte 0x12

switch_5984:
    ldr r2, [pc, #0x2c] /* data_59b4 */ 
    strb r0, [r2]
    movs r0, #0
    b jump_598e
switch_598c:
    movs r0, #1
jump_598e:
    strb r0, [r1]
    b jump_59a8
switch_5992:
    ldrb r0, [r2]
switch_5994:
    str r0, [sp]
    movs r2, #0x40
    mov r1, sp
    movs r0, #3
    bl usb_copy_send
    b jump_59a8
switch_59a2:
    ldr r0, [pc, #0x14] /* data_59b8 */ 
    ldrb r0, [r0, #0xc]
    strb r0, [r2]
jump_59a8:
    movs r0, #0x4f
    pop {r3, pc}

data_59ac:
.word 0x200001ce
data_59b0:
.word 0x200001d4
data_59b4:
.word 0x200001cd
data_59b8:
.word 0x200007cc

function_63:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
    sub sp, #0x24
    bl function_64
    ldr r0, [pc, #0x1e4] /* data_5bac */ 
    ldrb r0, [r0]
    cmp r0, #1
    bne jump_5aca
    movs r1, #1
    movw r0, #0x303
    bl ckcu_apb1_clock_enable
    add r0, sp, #0x10
    bl call_3636
    movw sb, #0x1c1
    strh.w sb, [sp, #0x10]
    add r1, sp, #0x10
    ldr r0, [pc, #0x1c4] /* data_5bb0 */ 
    bl call_360c
    mov r0, sp
    bl function_e_36
    movs r5, #1
    movs r4, #0
    strb.w r5, [sp, #8]
    movs r6, #6
    strh.w r4, [sp, #0xa]
    strb.w r4, [sp]
    mov r1, sp
    ldr r0, [pc, #0x1a4] /* data_5bb0 */ 
    str r6, [sp, #4]
    bl function_62
    strb.w r5, [sp]
    mov r1, sp
    ldr r0, [pc, #0x198] /* data_5bb0 */ 
    str r6, [sp, #4]
    bl function_62
    mov.w r8, #2
    strb.w r8, [sp]
    mov r1, sp
    ldr r0, [pc, #0x184] /* data_5bb0 */ 
    str r6, [sp, #4]
    bl function_62
    mov.w sl, #3
    strb.w sl, [sp]
    mov r1, sp
    ldr r0, [pc, #0x174] /* data_5bb0 */ 
    str r6, [sp, #4]
    bl function_62
    ldr r0, [pc, #0x16c] /* data_5bb0 */ 
    str r4, [r0, #0x7c]
    add r0, sp, #0x10
    bl call_3636
    strh.w sb, [sp, #0x10]
    add r1, sp, #0x10
    ldr r0, [pc, #0x160] /* data_5bb4 */ 
    bl call_360c
    mov r0, sp
    bl function_e_36
switch_5a5e:
    strb.w r5, [sp, #8]
    strh.w r4, [sp, #0xa]
    strb.w r4, [sp]
    mov r1, sp
    ldr r0, [pc, #0x144] /* data_5bb4 */ 
    str r6, [sp, #4]
    bl function_62
    strb.w r5, [sp]
    mov r1, sp
    ldr r0, [pc, #0x138] /* data_5bb4 */ 
    str r6, [sp, #4]
    bl function_62
    strb.w r8, [sp]
    mov r1, sp
    ldr r0, [pc, #0x128] /* data_5bb4 */ 
    str r6, [sp, #4]
    bl function_62
    movs r7, #7
    strb.w sl, [sp]
    mov r1, sp
    ldr r0, [pc, #0x118] /* data_5bb4 */ 
    str r7, [sp, #4]
    bl function_62
    ldr r0, [pc, #0x110] /* data_5bb4 */ 
    str r4, [r0, #0x7c]
    add r0, sp, #0x14
    bl function_e_31
    ldr.w fp, [pc, #0x10c] /* data_5bb8 */ 
    strh.w sb, [sp, #0x14]
    add r1, sp, #0x14
    mov r0, fp
    bl function_e_30
    mov r0, sp
    bl clear_some_mem
    strb.w r5, [sp, #8]
    strh.w r4, [sp, #0xe]
    b jump_5acc
jump_5aca:
    b jump_5ba2
jump_5acc:
    strb.w r4, [sp]
    mov r1, sp
    mov r0, fp
    str r7, [sp, #4]
    bl function_e_29
    strb.w r5, [sp]
    mov r1, sp
    mov r0, fp
    str r7, [sp, #4]
    bl function_e_29
    strb.w r8, [sp]
    mov r1, sp
    mov r0, fp
    str r7, [sp, #4]
    bl function_e_29
    strb.w sl, [sp]
    mov r1, sp
    mov r0, fp
    str r7, [sp, #4]
    bl function_e_29
    mov r0, fp
    str.w r4, [fp, #0x7c]
    movs r1, #1
    bl function_e_27
    add r0, sp, #0x14
    bl function_e_31
    strh.w sb, [sp, #0x14]
    ldr.w sb, [pc, #0xa0] /* data_5bbc */ 
    add r1, sp, #0x14
    mov r0, sb
    bl function_e_30
    mov r0, sp
    bl clear_some_mem
    strb.w r5, [sp, #8]
    strh.w r4, [sp, #0xe]
    strb.w r4, [sp]
    mov r1, sp
    mov r0, sb
    str r6, [sp, #4]
    bl function_e_29
    strb.w r5, [sp]
    mov r1, sp
    mov r0, sb
    str r7, [sp, #4]
    bl function_e_29
    strb.w r8, [sp]
    mov r1, sp
    mov r0, sb
    str r7, [sp, #4]
    bl function_e_29
    strb.w sl, [sp]
    mov r1, sp
    mov r0, sb
    str r7, [sp, #4]
    bl function_e_29
    mov r0, sb
    str.w r4, [sb, #0x7c]
    movs r1, #1
    bl function_e_27
    movs r1, #1
    ldr r0, [pc, #0x34] /* data_5bb0 */ 
    bl gptm_enable_disable
    movs r1, #1
    ldr r0, [pc, #0x30] /* data_5bb4 */ 
    bl gptm_enable_disable
    movs r1, #1
    mov r0, fp
    bl function_e_28
    movs r1, #1
    mov r0, sb
    bl function_e_28
    bl call_5ca8
    ldr r1, [pc, #0xc] /* data_5bac */ 
    strb.w r8, [r1]
jump_5ba2:
    add sp, #0x24
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

.byte 0x0
.byte 0x0

data_5bac:
.word 0x2000021d
data_5bb0:
.word 0x4006e000
data_5bb4:
.word 0x4006f000
data_5bb8:
.word 0x4002c000
data_5bbc:
.word 0x4002d000

function_64:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0xc4] /* data_5c8c */ 
    ldrb r0, [r4]
    cbnz r0, jump_5c48
    movs r1, #1
    mov.w r0, #0x70000
    bl ckcu_ahb_clock_enable
    ldr r5, [pc, #0xb8] /* data_5c90 */ 
    movs r2, #1
    lsls r1, r2, #9
    mov r0, r5
    bl gpio_set_output_current
    movs r2, #1
    lsls r6, r2, #0xa
    mov r1, r6
    mov r0, r5
    bl gpio_set_output_current
    movs r2, #1
    lsls r1, r2, #0xb
    mov r0, r5
    bl gpio_set_output_current
    ldr r7, [pc, #0x9c] /* data_5c94 */ 
    movs r2, #1
    movs r1, #0x80
    mov r0, r7
    bl gpio_set_output_current
    movs r2, #1
    mov r1, r2
    mov r0, r7
    bl gpio_set_output_current
    movs r2, #1
    movs r1, #2
    mov r0, r7
    bl gpio_set_output_current
    movs r2, #1
    movs r1, #4
    mov r0, r7
    bl gpio_set_output_current
    movs r2, #1
    movs r1, #8
    mov r0, r5
    bl gpio_set_open_drain
    movs r2, #1
    lsls r1, r2, #0xe
    mov r0, r7
    bl gpio_set_open_drain
    ldr.w r8, [pc, #0x60] /* data_5c98 */ 
    movs r2, #1
    mov r1, r2
    mov r0, r8
    bl gpio_set_open_drain
    movs r2, #1
    movs r1, #4
    b jump_5c4a
jump_5c48:
    b jump_5c86
jump_5c4a:
    mov r0, r8
    bl gpio_set_open_drain
    movs r2, #1
    movs r1, #0x80
    mov r0, r5
    bl gpio_set_open_drain
    movs r2, #1
    movs r1, #0x40
    mov r0, r8
    bl gpio_set_output_current
    movs r2, #1
    mov r1, r6
    mov r0, r7
    bl gpio_set_open_drain
    movs r2, #1
    movs r1, #0x10
    mov r0, r5
    bl gpio_set_open_drain
    movs r2, #1
    movs r1, #0x40
    mov r0, r5
    bl gpio_set_open_drain
    movs r0, #1
    strb r0, [r4]
jump_5c86:
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

data_5c8c:
.word 0x2000021d
data_5c90:
.word 0x400b4000
data_5c94:
.word 0x400b0000
data_5c98:
.word 0x400b2000

function_36:
    cbz r0, jump_5ca2
    b.w function_50
jump_5ca2:
    b.w call_5ca8

.byte 0x0
.byte 0x0

call_5ca8:
    push {r4, lr}
    ldr r4, [pc, #0xf8] /* data_5da4 */ 
    movs r2, #2
    lsls r1, r2, #8
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #9
    movs r0, #2
    bl afio_pin_config
    movs r2, #2
    lsls r1, r2, #9
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #0xa
    movs r0, #2
    bl afio_pin_config
    movs r2, #2
    lsls r1, r2, #0xa
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #0xb
    movs r0, #2
    bl afio_pin_config
    ldr r4, [pc, #0xbc] /* data_5da8 */ 
    movs r2, #2
    movs r1, #0x80
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #7
    movs r0, #0
    bl afio_pin_config
    movs r2, #2
    movs r1, #1
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r1, #0
    movs r2, #4
    mov r0, r1
    bl afio_pin_config
    movs r2, #2
    mov r1, r2
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #1
    movs r0, #0
    bl afio_pin_config
    movs r2, #2
    movs r1, #4
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #2
    movs r0, #0
    bl afio_pin_config
    movs r2, #4
    movs r1, #3
    movs r0, #2
    bl afio_pin_config
    movs r2, #4
    movs r1, #0xe
    movs r0, #0
    bl afio_pin_config
    movs r2, #4
    movs r1, #0
    movs r0, #1
    bl afio_pin_config
    movs r2, #4
    movs r1, #2
    movs r0, #1
    bl afio_pin_config
    movs r2, #4
    movs r1, #7
    movs r0, #2
    bl afio_pin_config
    movs r2, #2
    movs r1, #0x40
    ldr r0, [pc, #0x38] /* data_5dac */ 
    bl gpio_set_pin_pull_up_down
    movs r2, #4
    movs r1, #6
    movs r0, #1
    bl afio_pin_config
    movs r2, #4
    movs r1, #0xa
    movs r0, #0
    bl afio_pin_config
    movs r2, #4
    mov r1, r2
    movs r0, #2
    bl afio_pin_config
    movs r2, #4
    movs r1, #6
    pop.w {r4, lr}
    movs r0, #2
    b.w afio_pin_config

.byte 0x0
.byte 0x0

data_5da4:
.word 0x400b4000
data_5da8:
.word 0x400b0000
data_5dac:
.word 0x400b2000

function_50:
    push {r4, lr}
    ldr r4, [pc, #0xf8] /* data_5eac */ 
    movs r2, #1
    lsls r1, r2, #9
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #9
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    lsls r1, r2, #0xa
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0xa
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    lsls r1, r2, #0xb
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0xb
    movs r0, #2
    bl afio_pin_config
    ldr r4, [pc, #0xbc] /* data_5eb0 */ 
    movs r2, #1
    movs r1, #0x80
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #7
    mov r0, r2
    bl afio_pin_config
    movs r2, #1
    mov r1, r2
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r2
    mov r0, r2
    bl afio_pin_config
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #1
    mov r0, r2
    bl afio_pin_config
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #2
    mov r0, r2
    bl afio_pin_config
    movs r2, #0
    movs r1, #3
    movs r0, #2
    bl afio_pin_config
    movs r2, #0
    movs r1, #0xe
    mov r0, r2
    bl afio_pin_config
    movs r2, #0
    mov r1, r2
    movs r0, #1
    bl afio_pin_config
    movs r2, #0
    movs r1, #2
    movs r0, #1
    bl afio_pin_config
    movs r2, #0
    movs r1, #7
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0x40
    ldr r0, [pc, #0x38] /* data_5eb4 */ 
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #6
    movs r0, #1
    bl afio_pin_config
    movs r2, #0
    movs r1, #0xa
    mov r0, r2
    bl afio_pin_config
    movs r2, #0
    movs r1, #4
    movs r0, #2
    bl afio_pin_config
    movs r2, #0
    movs r1, #6
    pop.w {r4, lr}
    movs r0, #2
    b.w afio_pin_config

.byte 0x0
.byte 0x0

data_5eac:
.word 0x400b4000
data_5eb0:
.word 0x400b0000
data_5eb4:
.word 0x400b2000

function_3:
    push {r4, r5, lr}
    ldr r1, [pc, #0x34] /* data_5ef0 */ 
    ldr r4, [r1]
    ldr r3, [r1, #0x48]
    mov.w r2, #1
    str r2, [r1]
    mov.w r2, #0
    str r2, [r1, #0x48]
    ldr r5, [pc, #0x24] /* data_5ef4 */ 
    str r2, [r5, #0x10]
    str r2, [r5]
    str r4, [r1]
    ldr r2, [pc, #0x20] /* data_5ef8 */ 
    sub.w r1, r1, #0x618
    ldr r4, [r2]
    orr r4, r4, #4
    str r4, [r2]
    cbz r0, jump_5eec
    wfi 
jump_5ee6:
    str.w r3, [r1, #0x660]
    pop {r4, r5, pc}
jump_5eec:
    wfe 
    b jump_5ee6

data_5ef0:
.word 0x43100618
data_5ef4:
.word 0x42d4208c
data_5ef8:
.word 0xe000ed10

ckcu_voodoo1:
    ldr r2, [pc, #0x14] /* data_5f14 */ 
    cmp r1, #1
    ldr.w r1, [r2, #0x104]
    beq jump_5f0e
    bics r1, r0
jump_5f08:
    str.w r1, [r2, #0x104]
    bx lr
jump_5f0e:
    orrs r1, r0
    b jump_5f08

.byte 0x0
.byte 0x0

data_5f14:
.word 0x40088000

function_e_46:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr r0, [pc, #0x64] /* data_5f84 */ 
    ldrh r0, [r0]
    cmp r0, #0
    bne jump_5f80
    ldr.w sb, [pc, #0x5c] /* data_5f84 */ 
    movs r7, #0
    add.w sb, sb, #0x28
    ldrb.w fp, [sb, #0x1c]
    b jump_5f7c
jump_5f34:
    ldr r0, [pc, #0x4c] /* data_5f84 */ 
    mov.w sl, #1
    add r0, r7
    mov r8, r0
    ldrb r5, [r0, #2]
    ldrb r6, [r0, #0x14]
    eors r6, r5
    movs r4, #0
jump_5f46:
    lsls r0, r6, #0x1f
    beq jump_5f6c
    sbfx r2, r5, #0, #1
    ldr.w r3, [sb, #0xc]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    mov r1, r4
    mov r0, r7
    blx r3
    cmp r0, #1
    bne jump_5f6c
    ldrb.w r1, [r8, #0x14]
    lsl.w r0, sl, r4
    eors r1, r0
    strb.w r1, [r8, #0x14]
jump_5f6c:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    lsrs r6, r6, #1
    lsrs r5, r5, #1
    uxtb r4, r4
    cmp r4, #8
    blo jump_5f46
    .short 0x1c7f /* adds r7, r7, #1 */ 
    uxtb r7, r7
jump_5f7c:
    cmp r7, fp
    blo jump_5f34
jump_5f80:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_5f84:
.word 0x20002de4

function_e_47:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w sl, [pc, #0x108] /* data_6098 */ 
    ldr r0, [pc, #0x108] /* data_609c */ 
    sub.w sb, sl, #0x28
    ldrb.w r5, [sl, #0x1b]
    lsrs r4, r5, #1
    add.w r0, r0, r4, lsl #3
    ldr.w r8, [r0]
    ldr r7, [r0, #4]
    ldrh.w r0, [sb]
    cbz r0, jump_5fb6
    ldrh.w r1, [sb]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    strh.w r1, [sb]
jump_5fb6:
    lsls r0, r5, #0x1f
    mov.w fp, #0x100
    mov.w r3, #0
    beq jump_5fce
    bl function_e_50
    mov r6, r0
    ldr r0, [pc, #0xd4] /* data_60a0 */ 
    movs r1, #8
    b jump_6026
jump_5fce:
    ldr r0, [pc, #0xd0] /* data_60a0 */ 
    adds r0, #0x20
    movs r1, #8
    b jump_5fda
jump_5fd6:
    ldm r0!, {r2}
    str r3, [r2]
jump_5fda:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    bhs jump_5fd6
    ldr r0, [pc, #0xc4] /* data_60a4 */ 
    movs r1, #4
    str r1, [r0, #0x28]
    ldr r2, [pc, #0xc0] /* data_60a8 */ 
    mov r6, fp
    str.w fp, [r2, #0x28]
    str r1, [r0, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    str.w r7, [r8, #0x28]
    ldr r0, [pc, #0xb0] /* data_60ac */ 
    ldr r3, [pc, #0xb4] /* data_60b0 */ 
    add.w r1, r0, r4, lsl #4
    ldr r0, [pc, #0x9c] /* data_60a0 */ 
    movs r2, #8
    str r6, [r3, #0x78]
    ldr r3, [pc, #0xac] /* data_60b4 */ 
    str r6, [r3, #0x78]
    ldr r3, [pc, #0xac] /* data_60b8 */ 
    str r6, [r3, #0x78]
    ldr r3, [pc, #0xac] /* data_60bc */ 
    str r6, [r3, #0x78]
    b jump_601c
jump_6014:
    ldm r0!, {r4}
    ldrh r3, [r1], #2
    str r3, [r4]
jump_601c:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_6014
    b jump_6082
jump_6022:
    ldm r0!, {r2}
    str r3, [r2]
jump_6026:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    bhs jump_6022
    str.w r7, [r8, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    mov r0, r4
    bl function_e_51
    ldr r0, [pc, #0x70] /* data_60ac */ 
    ldr r7, [pc, #0x70] /* data_60b0 */ 
    adds r0, #0x90
    add.w r1, r0, r4, lsl #4
    ldr r0, [pc, #0x58] /* data_60a0 */ 
    str.w fp, [r7, #0x78]
    adds r0, #0x20
    movs r2, #8
    ldr r7, [pc, #0x64] /* data_60b4 */ 
    str.w fp, [r7, #0x78]
    ldr r7, [pc, #0x60] /* data_60b8 */ 
    str.w fp, [r7, #0x78]
    ldr r7, [pc, #0x60] /* data_60bc */ 
    str.w fp, [r7, #0x78]
    b jump_606a
jump_6062:
    ldm r0!, {r7}
    ldrh r3, [r1], #2
    str r3, [r7]
jump_606a:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_6062
    add.w r0, sb, r4
    mov r1, sb
    ldrb r2, [r0, #2]
    cmp r2, r6
    beq jump_6082
    ldrh.w r2, [sl, #0x18]
    strh r2, [r1]
    strb r6, [r0, #2]
jump_6082:
    ldrb.w r0, [sl, #0x1a]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    udiv r2, r5, r0
    mls r0, r0, r2, r5
    strb.w r0, [sl, #0x1b]
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_6098:
.word 0x20002e0c
data_609c:
.word data_9
data_60a0:
.word 0x200001dc
data_60a4:
.word 0x400b4000
data_60a8:
.word 0x400b0000
data_60ac:
.word 0x20002cc4
data_60b0:
.word 0x4006e000
data_60b4:
.word 0x4006f000
data_60b8:
.word 0x4002c000
data_60bc:
.word 0x4002d000

function_e_48:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    mov r4, r0
    bl function_51
    ldr.w sb, [pc, #0x98] /* data_6164 */ 
    ldrb.w r0, [sb]
    cmp r0, #1
    bne jump_615e
    ldr r7, [pc, #0x90] /* data_6168 */ 
    ldrh r0, [r4, #0x10]
    mov.w r8, #0xff
    strh r0, [r7, #0x18]
    ldr r0, [r4, #0xc]
    str r0, [r7]
    ldrb r0, [r4, #0x13]
    sub.w sl, r7, #0x28
    lsls r0, r0, #1
    strb r0, [r7, #0x1a]
    movs r0, #0
    strb r0, [r7, #0x1b]
    mov r2, r0
    sub.w ip, r7, #0x148
    sub.w r6, r7, #0xb8
    b jump_6126
jump_60fe:
    add.w r1, sl, r2
    add.w r5, ip, r2, lsl #4
    strb.w r8, [r1, #2]
    strb.w r8, [r1, #0x14]
    movs r1, #0
    add.w r3, r6, r2, lsl #4
jump_6114:
    strh.w r0, [r5, r1, lsl #1]
    strh.w r0, [r3, r1, lsl #1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    cmp r1, #8
    blt jump_6114
    .short 0x1c52 /* adds r2, r2, #1 */ 
    uxtb r2, r2
jump_6126:
    ldrb r1, [r4, #0x13]
    cmp r1, r2
    bhi jump_60fe
    ldr r0, [r4]
    str r0, [r7, #0xc]
    ldr r0, [r4, #4]
    str r0, [r7, #0x10]
    ldr r0, [r4, #8]
    str r0, [r7, #0x14]
    ldrb r0, [r4, #0x13]
    strb r0, [r7, #0x1c]
    movs r1, #1
    lsls r0, r1, #0x11
    bl ckcu_apb1_clock_enable
    mov.w r1, #0x708
    ldr r0, [pc, #0x20] /* data_616c */ 
    bl function_47
    bl function_63
    movs r0, #1
    bl function_e_49
    movs r1, #2
    strb.w r1, [sb]
jump_615e:
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

data_6164:
.word 0x200001d8
data_6168:
.word 0x20002e0c
data_616c:
.word 0x40077000

function_51:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w sb, [pc, #0x1c4] /* data_633c */ 
    ldrb.w r0, [sb]
    cbnz r0, jump_61fc
    movs r1, #1
    lsls r4, r1, #0xf
    mov r0, r4
    bl ckcu_apb0_clock_enable
    movs r1, #1
    mov.w r0, #0xf0000
    bl ckcu_ahb_clock_enable
    ldr r7, [pc, #0x1ac] /* data_6340 */ 
    movs r2, #0
    movs r1, #8
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x10
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x20
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x40
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    ldr.w sl, [pc, #0x184] /* data_6344 */ 
    asrs r6, r4, #4
    movs r2, #0
    mov r1, r6
    mov r0, sl
    bl gpio_set_pin_pull_up_down
    ldr.w r8, [pc, #0x178] /* data_6348 */ 
    mov.w fp, #0x2000
    movs r2, #0
    mov r1, fp
    mov r5, r8
    mov r0, r8
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    asrs r1, r4, #1
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    movs r1, #8
    mov r0, r7
    b jump_61fe
jump_61fc:
    b jump_6336
jump_61fe:
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x10
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x20
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x40
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r6
    mov r0, sl
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, fp
    mov r0, r5
    bl gpio_set_input_enable
    movs r2, #1
    lsls r1, r2, #0xe
    mov r0, r5
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_enable
    movs r1, #0
    movs r0, #0xc
    bl afio_exti_ssr_write
    movs r1, #0
    movs r0, #0x10
    bl afio_exti_ssr_write
    movs r1, #0
    movs r0, #0x14
    bl afio_exti_ssr_write
    movs r1, #0
    movs r0, #0x18
    bl afio_exti_ssr_write
    movs r1, #1
    movs r0, #0x2c
    bl afio_exti_ssr_write
    movs r1, #2
    movs r0, #0x34
    bl afio_exti_ssr_write
    movs r1, #2
    movs r0, #0x38
    bl afio_exti_ssr_write
    movs r1, #2
    movs r0, #0x3c
    bl afio_exti_ssr_write
    ldr.w sl, [pc, #0xc0] /* data_634c */ 
    movs r4, #0
jump_628e:
    add.w r0, sl, r4, lsl #3
    ldr r5, [r0]
    ldr r6, [r0, #4]
    mov r0, r5
    uxth r1, r6
    bl gpio_set_pin
    uxth r1, r6
    movs r2, #1
    mov r0, r5
    bl gpio_set_open_drain
    uxth r1, r6
    movs r2, #1
    mov r0, r5
    bl gpio_set_input_output
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    cmp r4, #9
    blo jump_628e
    movs r2, #2
    lsls r5, r2, #7
    mov r1, r5
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r5
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r2
    mov r4, r8
    mov r0, r8
    bl gpio_set_input_output
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl gpio_set_input_output
    movs r2, #1
    mov r1, r5
    mov r0, r7
    bl gpio_set_input_output
    bl function_64
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl gpio_set_input_output
    movs r2, #2
    lsls r4, r2, #8
    mov r1, r4
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r7
    bl gpio_set_input_enable
    mov r1, r4
    mov r0, r7
    bl gpio_set_pin
    movs r2, #1
    mov r1, r4
    mov r0, r7
    bl gpio_set_open_drain
    movs r2, #1
    mov r1, r4
    mov r0, r7
    bl gpio_set_input_output
    movs r1, #1
    strb.w r1, [sb]
jump_6336:
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_633c:
.word 0x200001d8
data_6340:
.word 0x400b0000
data_6344:
.word 0x400b2000
data_6348:
.word 0x400b4000
data_634c:
.word data_9

function_e_49:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r4, [pc, #0xa8] /* data_6400 */ 
    ldr r6, [pc, #0xac] /* data_6404 */ 
    ldr.w r8, [pc, #0xac] /* data_6408 */ 
    movs.w sb, r0
    mov.w r5, #0x200
    mov.w r7, #0x400
    beq jump_63be
    movs r1, #0
    mov r0, r6
    bl function_46
    movs r1, #0
    mov r0, r6
    bl function_45
    mov r0, r6
    bl function_44
    str.w r7, [r8, #0x180]
    movs r0, #0
    ldr r2, [pc, #0x84] /* data_640c */ 
    mov r1, r0
jump_638a:
    ldr.w r3, [r2, r0, lsl #2]
    str r1, [r3]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #7
    blt jump_638a
    ldr r2, [pc, #0x74] /* data_640c */ 
    movs r0, #0
    subs r2, #0x20
jump_639c:
    ldr.w r3, [r2, r0, lsl #2]
    str r1, [r3]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #7
    blt jump_639c
    mov.w r0, #0x100
    str r0, [r4, #0x28]
    ldr r1, [pc, #0x60] /* data_6410 */ 
    movs r0, #4
    str r0, [r1, #0x28]
    str r5, [r4, #0x24]
    movs r0, #0
    bl function_e_6
    b jump_63f4
jump_63be:
    movs r0, #1
    bl function_e_6
    movs r0, #0xa
    bl spin_wait_maybe
    str r5, [r4, #0x28]
    movs r0, #0xa
    bl spin_wait_maybe
    movs r1, #0
    mov r0, r6
    bl function_48
    mov r0, r6
    bl function_44
    movs r1, #1
    mov r0, r6
    bl function_45
    movs r1, #1
    mov r0, r6
    bl function_46
    str.w r7, [r8, #0x100]
jump_63f4:
    mov r0, sb
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    b.w function_36

.byte 0x0
.byte 0x0

data_6400:
.word 0x400b0000
data_6404:
.word 0x40077000
data_6408:
.word 0xe000e004
data_640c:
.word 0x200001fc
data_6410:
.word 0x400b4000

function_e_50:
    ldr r1, [pc, #0x54] /* data_646c */ 
    movs r0, #0
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1c
    bpl jump_6420
    movs r0, #1
jump_6420:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1b
    bpl jump_642a
    orr r0, r0, #2
jump_642a:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1a
    bpl jump_6434
    orr r0, r0, #4
jump_6434:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x19
    bpl jump_643e
    orr r0, r0, #8
jump_643e:
    ldr r1, [pc, #0x30] /* data_6470 */ 
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x14
    bpl jump_644a
    orr r0, r0, #0x10
jump_644a:
    ldr r1, [pc, #0x28] /* data_6474 */ 
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x12
    bpl jump_6456
    orr r0, r0, #0x20
jump_6456:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x11
    bpl jump_6460
    orr r0, r0, #0x40
jump_6460:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x10
    bpl jump_646a
    orr r0, r0, #0x80
jump_646a:
    bx lr

data_646c:
.word 0x400b0000
data_6470:
.word 0x400b2000
data_6474:
.word 0x400b4000

function_e_51:
    push {r4, r5, lr}
    ldr r2, [pc, #0x44] /* data_64c0 */ 
    movs r1, #4
    str r1, [r2, #0x28]
    ldr r3, [pc, #0x40] /* data_64c4 */ 
    lsls r4, r1, #6
    str r4, [r3, #0x28]
    str r1, [r2, #0x24]
    cmp r0, #8
    beq jump_64a0
    bhs jump_64a2
    ldr r3, [pc, #0x38] /* data_64c8 */ 
    mov.w r1, #8
    mov.w r4, #1
    ldrb r0, [r3, r0]
    mov.w r3, #2
    b jump_64b6
jump_64a0:
    str r4, [r3, #0x24]
jump_64a2:
    pop {r4, r5, pc}
jump_64a4:
    lsls r5, r0, #0x18
    bpl jump_64ac
    str r4, [r2, #0x24]
    b jump_64ae
jump_64ac:
    str r4, [r2, #0x28]
jump_64ae:
    str r3, [r2, #0x24]
    lsls r0, r0, #0x19
    lsrs r0, r0, #0x18
    str r3, [r2, #0x28]
jump_64b6:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    bhs jump_64a4
    str r4, [r2, #0x28]
    pop {r4, r5, pc}

.byte 0x0
.byte 0x0

data_64c0:
.word 0x400b4000
data_64c4:
.word 0x400b0000
data_64c8:
.word data_14

function_e_6:
    push {r4, lr}
    movs r2, #9
    ldr r4, [pc, #0x48] /* data_651c */ 
    movs r1, #0
    cbnz r0, jump_64e6
    b jump_6510
jump_64d8:
    add.w r0, r4, r1, lsl #3
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldr r3, [r0]
    ldr r0, [r0, #4]
    uxtb r1, r1
    str r0, [r3, #0x24]
jump_64e6:
    movs r0, r2
    sub.w r2, r2, #1
    uxtb r2, r2
    bne jump_64d8
    pop {r4, pc}
jump_64f2:
    cmp r1, #8
    beq jump_6506
    add.w r0, r4, r1, lsl #3
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldr r3, [r0]
    ldr r0, [r0, #4]
    uxtb r1, r1
    str r0, [r3, #0x28]
    b jump_6510
jump_6506:
    ldr r0, [pc, #0x14] /* data_651c */ 
    movs r1, #9
    ldr r3, [r0, #0x40]
    ldr r0, [r0, #0x44]
    str r0, [r3, #0x24]
jump_6510:
    movs r0, r2
    sub.w r2, r2, #1
    uxtb r2, r2
    bne jump_64f2
    pop {r4, pc}

data_651c:
.word data_9

function_e_52:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r6, [pc, #0x48] /* data_6570 */ 
    ldr r4, [pc, #0x44] /* data_656c */ 
    ldr r7, [pc, #0x48] /* data_6574 */ 
    movs r0, #0
    mov.w r5, #0x3e8
    movw lr, #0xffff
    sub.w r2, r6, #0xe
jump_6538:
    ldrh.w r1, [r4, r0, lsl #1]
    mov.w r3, #0x1c2
    rsb r1, r1, r1, lsl #16
    udiv r1, r1, r5
    muls r1, r3, r1
    udiv r1, r1, lr
    ldrb r3, [r6, r0]
    ldrb.w ip, [r2, r0]
    add.w r3, r7, r3, lsl #4
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strh.w r1, [r3, ip, lsl #1]
    cmp r0, #0xe
    blo jump_6538
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w function_e_1

data_656c:
.word 0x20000160
data_6570:
.word data_15
data_6574:
.word 0x20002e2c

spi_enable:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_6584
    orr r1, r1, #1
    b jump_6588
jump_6584:
    bic r1, r1, #1
jump_6588:
    str r1, [r0]
    bx lr
spi_config:
    push {r4, r5, lr}
    ldr r2, [r1, #0x14]
    cmp.w r2, #0x400
    beq jump_659a
    cbz r2, jump_65b0
    b jump_65b4
jump_659a:
    ldr r2, [r1, #0x18]
    cbz r2, jump_65a4
    cmp r2, #1
    beq jump_65aa
    b jump_65b4
jump_65a4:
    mov.w r2, #0x600
    b jump_65b8
jump_65aa:
    mov.w r2, #0x500
    b jump_65b8
jump_65b0:
    ldr r2, [r1, #0x18]
    cbz r2, jump_65ea
jump_65b4:
    mov.w r2, #0x200
jump_65b8:
    ldr r4, [r1, #8]
    ldr r3, [r1]
    orrs r3, r4
    ldrd r4, r5, [r1, #0xc]
    orrs r4, r5
    orrs r3, r4
    ldr r4, [r1, #0x1c]
    orrs r3, r4
    orrs r3, r2
    str r3, [r0, #4]
    ldr r3, [r1, #0x24]
    ldr r2, [r1, #4]
    orrs r2, r3
    ldr r3, [r1, #0x20]
    orr.w r2, r2, r3, lsl #4
    str r2, [r0, #0x18]
    ldr r1, [r1, #0x28]
    mov.w r2, #-1
    add.w r1, r2, r1, lsr #1
    str r1, [r0, #0xc]
    pop {r4, r5, pc}
jump_65ea:
    mov.w r2, #0x100
    b jump_65b8
spi_slave_select_output:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_65fc
    orr r1, r1, #8
    b jump_6600
jump_65fc:
    bic r1, r1, #8
jump_6600:
    str r1, [r0]
    bx lr
function_e_4:
    mov.w r1, #-0x1fff2000
    cbz r0, jump_6618
    cmp r0, #1
    ldr r0, [r1, #0x10]
    beq jump_661e
    bic r0, r0, #1
jump_6614:
    str r0, [r1, #0x10]
    bx lr
jump_6618:
    movs r0, #0
    str r0, [r1, #0x18]
    bx lr
jump_661e:
    orr r0, r0, #1
    b jump_6614
.thumb_func
function_17:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0x80] /* data_66ac */ 
    ldr r0, [r5, #4]
    cmp r0, #0
    beq jump_66a6
    ldr r0, [pc, #0x7c] /* data_66b0 */ 
    bl function_6
    mov r4, r0
    cmp r0, #1
    bne jump_6640
    bl function_e_22
jump_6640:
    ldr r7, [pc, #0x6c] /* data_66b0 */ 
    ldrb.w r0, [r7, #0x32]
    cmp r0, #3
    bne jump_6678
    ldr r6, [pc, #0x68] /* data_66b4 */ 
    ldr r0, [r6]
    tst.w r0, #0xc0
    beq jump_6678
    movs r0, #1
    bl function_37
    movs r0, #0
    str r0, [r5, #0xc]
    ldrb.w r0, [r7, #0x32]
    cmp r0, #3
    bne jump_6678
    ldr r0, [r6]
    tst.w r0, #0xc0
    beq jump_6678
    bl watchdog_reload_timer
    movs r0, #0
    bl function_3
jump_6678:
    bl exti_check_wakup
    cmp r0, #1
    beq jump_6692
    cmp r4, #1
    bne jump_66a6
jump_6684:
    movs r0, #0
    bl function_e_22
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w exti_set_wakup
jump_6692:
    cmp r4, #1
    bne jump_66a6
    ldr r0, [pc, #0x18] /* data_66b0 */ 
    bl call_6cb6
    cmp r0, #1
    bne jump_6684
    bl gen_remote_wakeup
    b jump_6684
jump_66a6:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_66ac:
.word 0x20000000
data_66b0:
.word 0x20000234
data_66b4:
.word 0x400a8000

.thumb_func
clock_init:
    ldr r0, [pc, #0x50] /* data_670c */ 
    movs r1, #1
    str.w r1, [r0, #0x300]
    ldr r2, [pc, #0x4c] /* data_6710 */ 
    str.w r1, [r2, #0xa8]
jump_66c6:
    ldr.w r3, [r2, #0x108]
    cmp r3, #0
    beq jump_66c6
    movs r3, #0
    str r3, [r2, #0x20]
    mov.w r3, #0x9000000
    str r3, [r0, #0x18]
    str.w r1, [r2, #0xa4]
jump_66dc:
    ldr.w r3, [r2, #0x104]
    cmp r3, #0
    beq jump_66dc
    ldr r2, [pc, #0x2c] /* data_6714 */ 
    ldr r3, [r2]
    bic r3, r3, #7
    add.w r3, r3, #3
    str r3, [r2]
    str r1, [r0, #0x20]
    ldr r2, [r0, #4]
    bic r2, r2, #3
    add.w r2, r2, #1
    str r2, [r0, #4]
jump_6700:
    ldr r2, [r0, #0x34]
    cmp.w r1, r2, lsr #30
    bne jump_6700
    bx lr

.byte 0x0
.byte 0x0

data_670c:
.word 0x40088000
data_6710:
.word 0x43100000
data_6714:
.word 0x40080200

function_e_56:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x58] /* data_6774 */ 
    ldr r0, [pc, #0x58] /* data_6778 */ 
    movs r4, #0
    ldr r1, [r5]
    cbz r1, jump_673c
    ldr r1, [r0, #0xc]
    cmp r1, #1
    bne jump_673a
    str r4, [r0, #0xc]
    add.w r1, r0, #0x28
    movs r2, #8
    movs r0, #1
    bl usb_copy_send
    str r4, [r5]
jump_673a:
    pop {r4, r5, r6, pc}
jump_673c:
    ldr r5, [pc, #0x3c] /* data_677c */ 
    ldr r1, [r5]
    cmp r1, #0
    bne jump_673a
    add.w r6, r5, #0xc
    ldr r1, [r6]
    cmp r1, #0
    beq jump_673a
    ldr r1, [r0, #0xc]
    cmp r1, #1
    bne jump_673a
    str r4, [r0, #0xc]
    ldr r1, [pc, #0x20] /* data_6778 */ 
    movs r2, #8
    adds r1, #0x28
    movs r0, #1
    bl usb_copy_send
    ldr r0, [r6]
    mov.w r1, #0xfa0
    muls r0, r1, r0
    asrs r1, r1, #3
    udiv r0, r0, r1
    str r0, [r5]
    pop {r4, r5, r6, pc}

data_6774:
.word 0x200000e8
data_6778:
.word 0x20000014
data_677c:
.word 0x20000308

function_e_57:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x6c] /* data_67f0 */ 
    ldr r0, [pc, #0x6c] /* data_67f4 */ 
    movs r4, #0
    ldr r1, [r5]
    cbz r1, jump_679c
    ldr r1, [r0, #0x10]
    cmp r1, #1
    bne jump_67b8
    str r4, [r0, #0x10]
    movs r2, #5
    add.w r1, r0, #0x18
    b jump_67b0
jump_679c:
    ldr r5, [pc, #0x58] /* data_67f8 */ 
    ldr r1, [r5]
    cbz r1, jump_67ba
    ldr r1, [r0, #0x10]
    cmp r1, #1
    bne jump_67b8
    str r4, [r0, #0x10]
    ldr r1, [pc, #0x48] /* data_67f4 */ 
    movs r2, #2
    .short 0x1d09 /* adds r1, r1, #4 */ 
jump_67b0:
    movs r0, #2
    bl usb_copy_send
    str r4, [r5]
jump_67b8:
    pop {r4, r5, r6, pc}
jump_67ba:
    ldr r5, [pc, #0x40] /* data_67fc */ 
    ldr r1, [r5]
    cbz r1, jump_67d0
    ldr r1, [r0, #0x10]
    cmp r1, #1
    bne jump_67b8
    str r4, [r0, #0x10]
    ldr r1, [pc, #0x28] /* data_67f4 */ 
    movs r2, #5
    adds r1, #0x20
    b jump_67b0
jump_67d0:
    ldr r5, [pc, #0x2c] /* data_6800 */ 
    ldrb r1, [r5]
    cmp r1, #0
    beq jump_67b8
    ldr r1, [r0, #0x10]
    cmp r1, #1
    bne jump_67b8
    str r4, [r0, #0x10]
    movs r2, #0x1f
    ldr r1, [pc, #0x20] /* data_6804 */ 
    movs r0, #2
    bl usb_copy_send
    strb r4, [r5]
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_67f0:
.word 0x200000f0
data_67f4:
.word 0x20000014
data_67f8:
.word 0x200000f4
data_67fc:
.word 0x200000f8
data_6800:
.word 0x200000ec
data_6804:
.word 0x2000032c

.thumb_func
function_68:
    ldr r1, [pc, #4] /* data_6810 */ 
    movs r0, #1
    str r0, [r1, #0xc]
    bx lr

data_6810:
.word 0x20000014

.thumb_func
function_69:
    ldr r1, [pc, #4] /* data_681c */ 
    movs r0, #1
    str r0, [r1, #0x10]
    bx lr

data_681c:
.word 0x20000014

.thumb_func
function_70:
    push {r4, lr}
    ldr r4, [pc, #0x28] /* data_684c */ 
    ldrd r1, r0, [r4, #4]
    add r1, r0
    movs r2, #0x40
    movs r0, #4
    bl usb_recv
    ldr r1, [r4, #4]
    add r0, r1
    ubfx r0, r0, #0, #0xa
    str r0, [r4, #4]
    ldr r1, [pc, #0x10] /* data_6850 */ 
    movs r0, #1
    str r0, [r1, #0x14]
    pop.w {r4, lr}
    b.w handle_update_packet

.byte 0x0
.byte 0x0

data_684c:
.word 0x20000368
data_6850:
.word 0x20000014

function_e_58:
    push {r4, r5, r6, lr}
    mov r4, r0
    ldrb r2, [r0, #3]
    ldrb r0, [r0, #2]
    ldrh r5, [r4, #6]
    ldrh r1, [r4, #4]
    cmp r2, #1
    bne jump_68bc
    cbz r1, jump_6882
    cmp r1, #1
    beq jump_6886
    cmp r1, #2
    bne jump_68bc
    cmp r0, #1
    beq jump_68ae
    cmp r0, #2
    beq jump_68be
    cmp r0, #3
    beq jump_68c4
    cmp r0, #4
    bne jump_68bc
    ldr r0, [pc, #0x4c] /* data_68cc */ 
    b jump_68b2
jump_6882:
    ldr r0, [pc, #0x4c] /* data_68d0 */ 
    b jump_68b2
jump_6886:
    ldr r0, [pc, #0x4c] /* data_68d4 */ 
    bl function_e_35
    cmp r0, #0
    bne jump_68bc
    ldr r2, [pc, #0x40] /* data_68d4 */ 
    movs r0, #0x43
    movs r3, #0
    ldr r1, [r2, #8]
    b jump_689e
jump_689a:
    strb r3, [r1, r0]
    .short 0x1e40 /* subs r0, r0, #1 */ 
jump_689e:
    ldr r6, [r2, #4]
    cmp r6, r0
    bls jump_689a
    ldr r0, [pc, #0x2c] /* data_68d4 */ 
    str r1, [r4, #0x1c]
    bl clear_two_words
    b jump_68b4
jump_68ae:
    ldr r0, [pc, #0x20] /* data_68d0 */ 
    subs r0, #0x24
jump_68b2:
    str r0, [r4, #0x1c]
jump_68b4:
    movs r0, #1
    str r5, [r4, #0x20]
    strb.w r0, [r4, #0x24]
jump_68bc:
    pop {r4, r5, r6, pc}
jump_68be:
    ldr r0, [pc, #0x10] /* data_68d0 */ 
    subs r0, #0x10
    b jump_68b2
jump_68c4:
    ldr r0, [pc, #8] /* data_68d0 */ 
    subs r0, #8
    b jump_68b2

.byte 0x0
.byte 0x0

data_68cc:
.word 0x2000032c
data_68d0:
.word 0x2000003c
data_68d4:
.word 0x20000358

ptr_write_func_ptrs:
    ldr r1, [pc, #0x20] /* data_68fc */ 
    str r1, [r0]
    ldr r1, [pc, #0x20] /* data_6900 */ 
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_6904 */ 
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x20] /* data_6908 */ 
    str r1, [r0, #0x24]
    ldr r1, [pc, #0x20] /* data_690c */ 
    str r1, [r0, #0x2c]
    ldr r1, [pc, #0x20] /* data_6910 */ 
    str r1, [r0, #0x30]
    ldr r1, [pc, #0x20] /* data_6914 */ 
    str r1, [r0, #0x38]
    movs r0, #0
    b.w function_65

.byte 0x0
.byte 0x0

data_68fc:
.word function_66
data_6900:
.word function_65
data_6904:
.word usb_get_descriptor
data_6908:
.word function_67
data_690c:
.word function_68
data_6910:
.word function_69
data_6914:
.word function_70

.thumb_func
function_66:
    ldr r0, [pc, #0x38] /* data_6954 */ 
    push {r4, lr}
    ldr r1, [r0]
    cmp r1, #1
    bne jump_6946
    movs r1, #0
    str r1, [r0]
    ldr r4, [pc, #0x30] /* data_6958 */ 
    ldrb r0, [r4]
    and r0, r0, #1
    bl nop_3
    ldrb r0, [r4]
    ubfx r0, r0, #1, #1
    bl call_45f4
    ldrb r0, [r4]
    ubfx r0, r0, #2, #1
    bl nop_2
jump_6946:
    bl function_e_56
    pop.w {r4, lr}
    b.w function_e_57

.byte 0x0
.byte 0x0

data_6954:
.word 0x20000320
data_6958:
.word 0x20000014

.thumb_func
function_67:
    push {r4, r5, r6, r7}
    ldrh r1, [r0]
    mov.w r5, #0x100
    movw r7, #0x921
    lsls r6, r5, #1
    ldr r4, [pc, #0x98] /* data_6a04 */ 
    movs r3, #1
    subw r2, r1, #0x921
    cmp r1, r7
    beq jump_69b4
    bgt jump_698e
    adds.w r1, r2, #0x780
    beq jump_69a2
    cmp r1, r5
    beq jump_69a8
    cmp r1, r6
    bne jump_69dc
    ldr r1, [pc, #0x80] /* data_6a08 */ 
    strd r1, r3, [r0, #0x1c]
    b jump_69fe
jump_698e:
    movs r7, #0
    cmp r2, r5
    beq jump_69e0
    cmp r2, r6
    bne jump_69dc
    ldr r2, [pc, #0x6c] /* data_6a08 */ 
    ldrb r1, [r0, #2]
    subs r2, #8
    str r1, [r2, #8]
    b jump_69fc
jump_69a2:
    pop {r4, r5, r6, r7}
    b.w function_e_58
jump_69a8:
    ldrh r1, [r0, #4]
    cmp r1, #0
    bne jump_69dc
    strd r4, r3, [r0, #0x1c]
    b jump_69fe
jump_69b4:
    ldrb r3, [r0, #3]
    ldrh r1, [r0, #6]
    ldrh r2, [r0, #4]
    str r1, [r0, #0x20]
    cmp r3, #2
    bne jump_69dc
    cmp r2, #0
    bne jump_69dc
    ldr r3, [pc, #0x40] /* data_6a08 */ 
    subs r3, #8
    str r3, [r0, #0x1c]
    ldr r3, [pc, #0x40] /* data_6a0c */ 
    strd r3, r2, [r0, #0x28]
    movs r2, #2
    strb.w r2, [r0, #0x24]
    ldr r0, [pc, #0x2c] /* data_6a04 */ 
    adds r0, #0x38
    str r1, [r0]
jump_69dc:
    pop {r4, r5, r6, r7}
    bx lr
jump_69e0:
    ldrh r2, [r0, #4]
    ldrb r1, [r0, #3]
    cmp r2, #0
    bne jump_69dc
    mov.w r2, #0xfa0
    str r1, [r4]
    muls r1, r2, r1
    asrs r2, r2, #3
    udiv r1, r1, r2
    ldr r2, [pc, #0xc] /* data_6a04 */ 
    subs r2, #0xc
    str r1, [r2]
jump_69fc:
    str r7, [r0, #0x20]
jump_69fe:
    strb.w r3, [r0, #0x24]
    b jump_69dc

data_6a04:
.word 0x20000314
data_6a08:
.word 0x2000001c
data_6a0c:
.word function_81

.thumb_func
function_65:
    ldr r0, [pc, #0x54] /* data_6a68 */ 
    push {r4, lr}
    movs r3, #1
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    movs r1, #0
    str r1, [r0, #0x14]
    add.w r2, r0, #0x28
    movs r0, #5
    strb r1, [r2]
jump_6a26:
    add.w r4, r2, r0
    .short 0x1e40 /* subs r0, r0, #1 */ 
    strb r1, [r4, #2]
    bpl jump_6a26
    ldr r0, [pc, #0x34] /* data_6a68 */ 
    movs r2, #2
    .short 0x1d00 /* adds r0, r0, #4 */ 
    strb r3, [r0]
    strb r1, [r0, #1]
    adds r0, #0x14
    strb r2, [r0]
    str.w r1, [r0, #1]
    adds r0, #8
    movs r2, #3
    strb r2, [r0]
    strb r1, [r0, #2]
    strb r1, [r0, #3]
    strb r1, [r0, #4]
    ldr r2, [pc, #0x1c] /* data_6a6c */ 
    strb r1, [r0, #1]
    movs r0, #4
    strb r0, [r2]
    movs r0, #0x1c
jump_6a58:
    add.w r4, r2, r0
    .short 0x1e40 /* subs r0, r0, #1 */ 
    strb r1, [r4, #2]
    bpl jump_6a58
    ldr r0, [pc, #0xc] /* data_6a70 */ 
    str r3, [r0]
    pop {r4, pc}

data_6a68:
.word 0x20000014
data_6a6c:
.word 0x2000032c
data_6a70:
.word 0x20000010

.thumb_func
function_81:
    ldr r2, [pc, #8] /* data_6a80 */ 
    movs r1, #1
    str.w r1, [r2, r0, lsl #2]
    bx lr

.byte 0x0
.byte 0x0

data_6a80:
.word 0x20000320

.thumb_func
usb_get_descriptor:
    ldrb r2, [r0, #3]
    ldrh r1, [r0, #4]
    movs r3, #1
    cmp r2, #0x21
    beq jump_6a9e
    cmp r2, #0x22
    bne jump_6ad6
    cbz r1, jump_6ac0
    cmp r1, #1
    beq jump_6ac8
    cmp r1, #2
    bne jump_6ad2
    b jump_6ad8
jump_6a9e:
    cbz r1, jump_6aaa
    cmp r1, #1
    beq jump_6ab0
    cmp r1, #2
    bne jump_6ab6
    b jump_6aba
jump_6aaa:
    ldr r1, [r0, #0xc]
    adds r1, #0x12
    b jump_6ab4
jump_6ab0:
    ldr r1, [r0, #0xc]
    adds r1, #0x2b
jump_6ab4:
    str r1, [r0, #0x1c]
jump_6ab6:
    movs r1, #9
    b jump_6ad0
jump_6aba:
    ldr r1, [r0, #0xc]
    adds r1, #0x4b
    b jump_6ab4
jump_6ac0:
    ldr r1, [pc, #0x20] /* data_6ae4 */ 
    str r1, [r0, #0x1c]
    movs r1, #0x40
    b jump_6ad0
jump_6ac8:
    ldr r1, [pc, #0x18] /* data_6ae4 */ 
    adds r1, #0x40
    str r1, [r0, #0x1c]
    movs r1, #0x22
jump_6ad0:
    str r1, [r0, #0x20]
jump_6ad2:
    strb.w r3, [r0, #0x24]
jump_6ad6:
    bx lr
jump_6ad8:
    ldr r1, [pc, #8] /* data_6ae4 */ 
    adds r1, #0x64
    str r1, [r0, #0x1c]
    movs r1, #0xc6
    b jump_6ad0

.byte 0x0
.byte 0x0

data_6ae4:
.word usb_report0_desc

function_6:
    ldrb.w r0, [r0, #0x34]
    ubfx r0, r0, #1, #1
    bx lr
usb_entry:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl usb_get_intr_flags
    mov r5, r0
    lsls r0, r0, #0x1e
    bpl jump_6b10
    ldr r1, [r4, #0x4c]
    cbz r1, jump_6b0a
    ldr r0, [r4, #0x50]
    blx r1
jump_6b0a:
    movs r0, #2
    bl usb_set_intr_flags
jump_6b10:
    lsls r0, r5, #0x1b
    bpl jump_6b32
    movs r0, #0x10
    bl usb_set_intr_flags
    ldrb.w r0, [r4, #0x32]
    cmp r0, #2
    blo jump_6b32
    bl usb_set_lpmode_pdwn
    ldrb r0, [r4, #0x32]!
    strb r0, [r4, #1]
    movs r0, #3
    strb r0, [r4], #-0x32
jump_6b32:
    lsls r0, r5, #0x1d
    mov.w r7, #0
    bpl jump_6b82
    add.w r4, r4, #0x20
    mov.w r0, #-1
    ldr r6, [r4, #0x64]
    str r0, [r4]
    strb r7, [r4, #0x10]
    strb r7, [r4, #0x11]
    ldrb r0, [r4, #0x14]
    bic r0, r0, #2
    strb r0, [r4, #0x14]
    mov.w r0, #4
    strb r0, [r4, #0x12]
    str r7, [r4, #0x18]
    bl usb_ckcu_voodoo
    bl usb_clear_csr
    movs r0, #0
    ldr r1, [r4, #0x64]
    bl function_e_70
    ldr r0, [r6]
    bl usb_enable_intr
    ldr r1, [r4, #0x24]
    sub.w r4, r4, #0x20
    cbz r1, jump_6b7c
    ldr r0, [r4, #0x48]
    blx r1
jump_6b7c:
    movs r0, #4
    bl usb_set_intr_flags
jump_6b82:
    lsls r0, r5, #0x1c
    bpl jump_6b98
    bl usb_clear_csr
    ldrb.w r0, [r4, #0x33]
    strb.w r0, [r4, #0x32]
    movs r0, #8
    bl usb_set_intr_flags
jump_6b98:
    lsls r0, r5, #0x17
    mov.w r6, #0x100
    bpl jump_6c96
    movs r0, #0
    bl usb_get_ep_intr
    mov r5, r0
    lsls r0, r0, #0x16
    bpl jump_6bf2
    mov r0, r4
    bl usb_copy_ep_setup
    strb.w r7, [r4, #0x24]
    str r7, [r4, #0x20]
    ldrb r0, [r4]
    ands r0, r0, #0x60
    beq jump_6bc6
    cmp r0, #0x20
    bne jump_6bd6
    b jump_6bce
jump_6bc6:
    mov r0, r4
    bl function_e_79
    b jump_6bd6
jump_6bce:
    ldr r1, [r4, #0x60]
    cbz r1, jump_6bd6
    mov r0, r4
    blx r1
jump_6bd6:
    ldrb.w r0, [r4, #0x24]
    cmp r0, #1
    beq jump_6c0e
    cmp r0, #2
    beq jump_6c20
    movs r0, #0
    bl function_e_72
jump_6be8:
    mov.w r1, #0x200
    movs r0, #0
    bl usb_set_ep_intr
jump_6bf2:
    lsls r0, r5, #0x1e
    bpl jump_6c54
    movs r1, #2
    movs r0, #0
    bl usb_set_ep_intr
    ldr r0, [r4, #0x20]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_6c54
    ldrb.w r0, [r4, #0x24]
    cmp r0, #2
    beq jump_6c2c
    b jump_6c54
jump_6c0e:
    ldrh r0, [r4, #6]
    ldr r1, [r4, #0x20]
    cmp r1, r0
    ble jump_6c18
    str r0, [r4, #0x20]
jump_6c18:
    mov r0, r4
    bl function_e_78
    b jump_6be8
jump_6c20:
    movs r2, #0
    mov r1, r2
    mov r0, r2
    bl usb_copy_send
    b jump_6be8
jump_6c2c:
    movs r2, #0x40
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl usb_recv
    ldr r1, [r4, #0x1c]
    add r1, r0
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    subs r0, r1, r0
    str r0, [r4, #0x20]
    bne jump_6c54
    movs r0, #1
    strb.w r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    cbz r1, jump_6c54
    ldr r0, [r4, #0x2c]
    blx r1
    str r7, [r4, #0x28]
jump_6c54:
    lsls r0, r5, #0x1b
    bpl jump_6c66
    mov r0, r4
    bl function_e_78
    movs r1, #0x10
    movs r0, #0
    bl usb_set_ep_intr
jump_6c66:
    mov r0, r6
    bl usb_set_intr_flags
    b jump_6c96
jump_6c6e:
    mov r0, r5
    bl usb_get_ep_intr
    tst.w r0, #0x12
    beq jump_6c96
    movs r1, #0x12
    mov r0, r5
    bl usb_set_ep_intr
    lsl.w r0, r6, r5
    bl usb_set_intr_flags
    add.w r0, r4, r5, lsl #2
    ldr r1, [r0, #0x64]
    cbz r1, jump_6c96
    mov r0, r5
    blx r1
jump_6c96:
    bl usb_get_intr_flags
    bl function_e_75
    mov r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    bne jump_6c6e
    pop.w {r4, r5, r6, r7, r8, pc}
function_23:
    add.w r0, r0, #0x30
    movs r1, #2
    strb r1, [r0, #2]
    ldr r0, [r0, #0x54]
    b.w jump_1
call_6cb6:
    ldrb.w r0, [r0, #0x32]
    cmp r0, #3
    beq jump_6cc2
    movs r0, #0
    bx lr
jump_6cc2:
    movs r0, #1
    bx lr
function_75:
    push {r4, lr}
    add.w r4, r0, #0x30
    ldrb r0, [r4, #4]
    ubfx r1, r0, #0, #1
    ldr r0, [r4, #0x54]
    bl function_82
    ldrb r0, [r4, #2]
    sub.w r4, r4, #0x30
    cmp r0, #3
    bne jump_6cee
    ldr.w r1, [r4, #0x88]
    cbz r1, jump_6cee
    ldr.w r0, [r4, #0x8c]
    blx r1
jump_6cee:
    ldr r1, [r4, #0x3c]
    cmp r1, #0
    beq jump_6d04
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    bne jump_6d04
    ldr r0, [r4, #0x40]
    pop.w {r4, lr}
    bx r1
jump_6d04:
    pop {r4, pc}
gen_remote_wakeup:
    push {r4, lr}
    bl usb_clear_csr
    pop.w {r4, lr}
    b.w usb_set_genrsm
ptr_set_desc_ptr:
    ldr r1, [pc, #0x10] /* data_6d28 */ 
    str r1, [r0]
    adds r1, #0x14
    str r1, [r0, #4]
    ldr r1, [pc, #0xc] /* data_6d2c */ 
    str r1, [r0, #8]
    movs r1, #4
    str r1, [r0, #0xc]
    bx lr

.byte 0x0
.byte 0x0

data_6d28:
.word usb_device_desc
data_6d2c:
.word 0x20000044

usb_set_intr_flags:
    ldr r1, [pc, #4] /* data_6d38 */ 
    str r0, [r1, #8]
    bx lr

.byte 0x0
.byte 0x0

data_6d38:
.word 0x400a8000

usb_init:
    push {r4, lr}
    movs r1, #1
    movs r0, #0x40
    bl ckcu_apb1_clock_enable
    movs r1, #1
    lsls r0, r1, #0xa
    bl ckcu_ahb_clock_enable
    movs r0, #2
    bl ckcu_set_usb_prescaler
    ldr r1, [pc, #0x30] /* data_6d88 */ 
    sub.w r0, r1, #0xc
    str r1, [r0]
    ldr r1, [pc, #0x2c] /* data_6d8c */ 
    str r1, [r0, #4]
    subs r0, #0x7c
    bl ptr_set_desc_ptr
    ldr r0, [pc, #0x20] /* data_6d88 */ 
    subs r0, #0x54
    bl ptr_write_func_ptrs
    ldr r0, [pc, #0x18] /* data_6d88 */ 
    subs r0, #0x90
    bl function_23
    ldr r1, [pc, #0x18] /* data_6d90 */ 
    mov.w r0, #0x200000
    str.w r0, [r1, #0x100]
    pop.w {r4, lr}
    b.w function_e_34

data_6d88:
.word 0x200002c4
data_6d8c:
.word function_17
data_6d90:
.word 0xe000e004

usb_dp_wake_up:
    ldr r1, [pc, #0x14] /* data_6dac */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_6da4
    bic r0, r0, #0x800
jump_6da0:
    str r0, [r1]
    bx lr
jump_6da4:
    orr r0, r0, #0x800
    b jump_6da0

.byte 0x0
.byte 0x0

data_6dac:
.word 0x400a8000

usb_dp_pull_up:
    ldr r1, [pc, #0x14] /* data_6dc8 */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_6dc0
    bic r0, r0, #0x400
jump_6dbc:
    str r0, [r1]
    bx lr
jump_6dc0:
    orr r0, r0, #0x400
    b jump_6dbc

.byte 0x0
.byte 0x0

data_6dc8:
.word 0x400a8000

usb_ckcu_voodoo:
    movs r1, #1
    movs r0, #0x20
    b.w ckcu_voodoo1
usb_ep_data_toggle:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #9
    str r1, [r0]
    pop {r4, pc}
usb_ep_stall:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x24
    str r1, [r0]
    pop {r4, pc}
usb_set_ep_intr:
    push {r4, lr}
    mov r4, r1
    bl usb_get_ep_reg
    str r4, [r0, #8]
    pop {r4, pc}
usb_get_ep_buff:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ldr r1, [pc, #8] /* data_6e14 */ 
    ubfx r0, r0, #0, #0xa
    add r0, r1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_6e14:
.word 0x400aa000

usb_get_ep_buff_end:
    push {r4, r5, r6, lr}
    mov r5, r0
    bl usb_get_ep_reg
    mov r4, r0
    mov r0, r5
    bl usb_get_ep_len
    ldr r1, [r4, #0x10]
    ubfx r1, r1, #0, #0xa
    add r0, r1
    ldr r1, [pc, #4] /* data_6e38 */ 
    add r0, r1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_6e38:
.word 0x400aa000

usb_get_ep_len:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ubfx r0, r0, #0xa, #0xa
    pop {r4, pc}
function_e_67:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0, #0x10]
    ldr r0, [r0]
    lsls r1, r1, #3
    bpl jump_6e5e
    ubfx r0, r0, #2, #1
    pop {r4, pc}
jump_6e5e:
    ubfx r0, r0, #5, #1
    pop {r4, pc}
usb_get_ep_intr:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0, #4]
    ldr r0, [r0, #8]
    ands r0, r1
    pop {r4, pc}
usb_get_ep_tcnt:
    push {r4, lr}
    mov r4, r1
    bl usb_get_ep_reg
    ldr r0, [r0, #0xc]
    lsrs r0, r4
    ubfx r0, r0, #0, #9
    pop {r4, pc}
function_e_70:
    push {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    bl usb_get_ep_reg
    add.w r1, r4, r5, lsl #3
    ldr r2, [r1, #4]
    str r2, [r0, #0x10]
    ldr r1, [r1, #8]
    str r1, [r0, #4]
    mov.w r1, #-1
    str r1, [r0, #8]
    mov r0, r5
    pop.w {r4, r5, r6, lr}
    b.w function_e_71
usb_read_ep_buff:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r6, r2
    movs r5, r0
    beq jump_6eda
    movs r1, #0
jump_6eb8:
    bl usb_get_ep_tcnt
    mov r4, r0
    cmp r0, r6
    bhi jump_6ed4
    mov r0, r5
    cbz r5, jump_6ede
    bl usb_get_ep_buff
jump_6eca:
    adds r1, r4, #3
    lsrs r2, r1, #2
    mov r1, r7
    bl word_copy
jump_6ed4:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, pc}
jump_6eda:
    movs r1, #0x10
    b jump_6eb8
jump_6ede:
    bl usb_get_ep_buff_end
    b jump_6eca
usb_recv:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r5, r2
    mov r6, r0
    bl usb_get_ep_reg
    mov r4, r0
    movs r0, #0
    cbz r5, jump_6f08
    mov r2, r5
    mov r1, r7
    mov r0, r6
    bl usb_read_ep_buff
    cbnz r0, jump_6f08
    cmp r5, #0
    bne jump_6f10
jump_6f08:
    ldr r1, [r4]
    and r1, r1, #0x10
    str r1, [r4]
jump_6f10:
    pop.w {r4, r5, r6, r7, r8, pc}
function_e_71:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x19
    str r1, [r0]
    pop {r4, pc}
function_e_72:
    push {r4, lr}
    bl usb_get_ep_reg
    movs r1, #4
    str r1, [r0]
    pop {r4, pc}
function_e_73:
    push {r4, lr}
    bl usb_get_ep_reg
    movs r1, #0x40
    str r1, [r0, #8]
    ldr r2, [r0]
    movs r1, #0x24
    bics r1, r2
    str r1, [r0]
    pop {r4, pc}
usb_copy_send:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r8, r1
    mov r4, r2
    mov r7, r0
    bl usb_get_ep_len
    mov r6, r0
    mov r0, r7
    bl usb_get_ep_reg
    mov r5, r0
    movs r1, #0
    mov r0, r7
    bl usb_get_ep_tcnt
    cmp r4, r6
    bhi jump_6f6a
    cbz r0, jump_6f70
jump_6f6a:
    movs r0, #0
jump_6f6c:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_6f70:
    mov r0, r7
    bl usb_get_ep_buff
    mov r1, r0
    adds r0, r4, #3
    lsrs r2, r0, #2
    mov r0, r8
    bl word_copy
    str r4, [r5, #0xc]
    movs r0, #2
    str r0, [r5]
    mov r0, r4
    b jump_6f6c
usb_enable_intr:
    ldr r1, [pc, #8] /* data_6f98 */ 
    ldr r2, [r1, #4]
    orrs r2, r0
    str r2, [r1, #4]
    bx lr

.byte 0x0
.byte 0x0

data_6f98:
.word 0x400a8000

function_e_75:
    mov r3, r0
    movs r1, #7
jump_6fa0:
    add.w r2, r1, #8
    lsr.w r0, r3, r2
    lsls r0, r0, #0x1f
    beq jump_6fb0
    sxtb r0, r1
    bx lr
jump_6fb0:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    cmp r1, #0
    bgt jump_6fa0
    mov.w r0, #-1
    bx lr
usb_get_intr_flags:
    ldr r0, [pc, #8] /* data_6fc8 */ 
    ldr r1, [r0, #4]
    ldr r0, [r0, #8]
    ands r0, r1
    bx lr

.byte 0x0
.byte 0x0

data_6fc8:
.word 0x400a8000

jump_1:
    b.w ptr_write_data
usb_set_lpmode_pdwn:
    ldr r0, [pc, #8] /* data_6fdc */ 
    ldr r1, [r0]
    orr r1, r1, #0xc
    str r1, [r0]
    bx lr

data_6fdc:
.word 0x400a8000

usb_clear_csr:
    ldr r0, [pc, #8] /* data_6fec */ 
    ldr r1, [r0]
    and r1, r1, #0x400
    str r1, [r0]
    bx lr

data_6fec:
.word 0x400a8000

function_82:
    push {r4, lr}
    mov r4, r0
    ldr r0, [pc, #0x64] /* data_705c */ 
    ldr r2, [r0]
    cmp r2, #1
    bne jump_705a
    movs r2, #0
    str r2, [r0]
    ldr r0, [pc, #0x5c] /* data_7060 */ 
    ldr r2, [r0]
    lsls r3, r2, #0x19
    mov.w r2, #-1
    bpl jump_7026
    movw r3, #0x40c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_701c
    movs r0, #0
    bl function_3
jump_701c:
    ldr r0, [r4]
    pop.w {r4, lr}
    b.w usb_enable_intr
jump_7026:
    movw r3, #0xc0c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_7036
    movs r0, #0
    bl function_3
jump_7036:
    movs r0, #0
    bl usb_dp_wake_up
    ldr r0, [r4]
    bl usb_enable_intr
    movs r0, #0
    bl usb_dp_pull_up
    movs r0, #0
jump_704a:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #0xc8
    blo jump_704a
    pop.w {r4, lr}
    movs r0, #1
    b.w usb_dp_pull_up
jump_705a:
    pop {r4, pc}

data_705c:
.word 0x2000022c
data_7060:
.word 0x400a8000

ptr_write_data:
    movw r1, #0x171d
    str r1, [r0]
    ldr r1, [pc, #0x28] /* data_7094 */ 
    str r1, [r0, #4]
    movw r1, #0x212
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_7098 */ 
    str r1, [r0, #0xc]
    ldr r2, [pc, #0x20] /* data_709c */ 
    movs r1, #0x10
    strd r1, r2, [r0, #0x10]
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x1c] /* data_70a0 */ 
    str r1, [r0, #0x1c]
    movs r1, #0
    str r1, [r0, #0x20]
    ldr r1, [pc, #0x18] /* data_70a4 */ 
    str r1, [r0, #0x24]
    movs r1, #2
    str r1, [r0, #0x28]
    bx lr

data_7094:
.word 0x80010008
data_7098:
.word 0x91002088
data_709c:
.word 0x92010090
data_70a0:
.word 0x930100d0
data_70a4:
.word 0x84010110

usb_copy_ep_setup:
    ldr r1, [pc, #8] /* data_70b4 */ 
    ldr r2, [r1]
    str r2, [r0]
    ldr r1, [r1, #4]
    str r1, [r0, #4]
    bx lr

data_70b4:
.word 0x400aa000

usb_set_genrsm:
    ldr r0, [pc, #8] /* data_70c4 */ 
    ldr r1, [r0]
    orr r1, r1, #0x20
    str r1, [r0]
    bx lr

data_70c4:
.word 0x400a8000

usb_set_adrset:
    ldr r1, [pc, #0xc] /* data_70d8 */ 
    ldr r2, [r1]
    orr r2, r2, #0x100
    str r2, [r1]
    str r0, [r1, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_70d8:
.word 0x400a8000

.thumb_func
usb_intr:
    ldr r0, [pc, #4] /* data_70e4 */ 
    b.w usb_entry

.byte 0x0
.byte 0x0

data_70e4:
.word 0x20000234

.thumb_func
watchdog_init:
    ldr r1, [pc, #0x4c] /* data_7138 */ 
    ldr r0, [pc, #0x48] /* data_7134 */ 
    ldr r2, [r1, #0x30]
    orr r2, r2, #0x10
    str r2, [r1, #0x30]
    ldr r1, [pc, #0x44] /* data_713c */ 
    ldr r2, [r1, #4]
    ubfx r2, r2, #0, #0xc
    orr r2, r2, #0x1a000
    b jump_710a
jump_7102:
    str r2, [r1, #4]
    ldr r3, [r1, #4]
    lsls r3, r3, #0xf
    bmi jump_710e
jump_710a:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_7102
jump_710e:
    ldr r0, [r1, #8]
    ubfx r0, r0, #0, #0xc
    orr r0, r0, #0x5000
    str r0, [r1, #8]
    ldr r0, [r1, #4]
    and r0, r0, #0x1f000
    orr r0, r0, #0x7d0
    str r0, [r1, #4]
    ldr r0, [pc, #0x18] /* data_7140 */ 
    str r0, [r1]
    movw r0, #0xca35
    str r0, [r1, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_7134:
.word 0x6ddd00
data_7138:
.word 0x40088000
data_713c:
.word 0x40068000
data_7140:
.word 0x5fa00001

watchdog_reload_timer:
    ldr r1, [pc, #8] /* data_7150 */ 
    ldr r0, [pc, #4] /* data_714c */ 
    str r0, [r1]
    bx lr

data_714c:
.word 0x5fa00001
data_7150:
.word 0x40068000

disconnect_cmd:
    movs r0, #0x4f
    bx lr
flash_crc_cmd:
    push {r4, lr}
    bl crc16
    mov r4, r0
    mov r1, r0
    ldr r0, [pc, #0x10] /* data_7174 */ 
    bl function_14
    lsrs r1, r4, #8
    ldr r0, [pc, #8] /* data_7174 */ 
    bl function_14
    movs r0, #0x4f
    pop {r4, pc}

data_7174:
.word 0x20000358

flash_erase_cmd:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    cmp r0, #0xa
    beq jump_7188
    cmp.w r1, #0xf800
    bhs jump_718e
jump_7188:
    movs r0, #0x46
jump_718a:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_718e:
    movs r5, #0
    mov r4, r1
    movs r7, #0x1e
    b jump_71b0
jump_7196:
    mov r0, r4
    bl flash_page_erase
    udiv r0, r5, r7
    mls r0, r7, r0, r5
    cbnz r0, jump_71aa
    bl watchdog_reload_timer
jump_71aa:
    add.w r4, r4, #0x400
    .short 0x1c6d /* adds r5, r5, #1 */ 
jump_71b0:
    cmp r4, r6
    bls jump_7196
    movs r0, #0x4f
    b jump_718a
flash_read_write_cmd:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    movs r6, #0
    mov r8, r0
    mov r4, r1
    mov sb, r2
    ldr r7, [pc, #0xc0] /* data_7288 */ 
    mov r5, r6
    ldr.w fp, [pc, #0xc0] /* data_728c */ 
    mov sl, r6
    bl flash_get_protection_status
    lsls r0, r0, #0x1f
    bne jump_71da
    mov.w sl, #1
jump_71da:
    cmp.w r8, #1
    bne jump_727e
    cmp.w sl, #1
    bne jump_7210
    sub.w r0, sb, r4
    .short 0x1c40 /* adds r0, r0, #1 */ 
    b jump_71f6
jump_71ee:
    ldr r1, [r4, r6]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    bne jump_723a
    .short 0x1d36 /* adds r6, r6, #4 */ 
jump_71f6:
    cmp r0, r6
    bhi jump_71ee
    cmp.w r8, #1
    beq jump_7210
    b jump_727e
jump_7202:
    mov r1, r4
    movs r0, #4
    ldr r2, [r7]
    bl flash_write
    .short 0x1d24 /* adds r4, r4, #4 */ 
    .short 0x1d3f /* adds r7, r7, #4 */ 
jump_7210:
    cmp r4, sb
    bls jump_7202
    b jump_727e
jump_7216:
    ldr r0, [pc, #0x78] /* data_7290 */ 
    cmp r4, r0
    bls jump_7220
    movs r0, #0
    b jump_7222
jump_7220:
    ldr r0, [r4]
jump_7222:
    cmp.w r8, #0
    beq jump_727c
    cmp.w r8, #3
    beq jump_7236
    cmp.w sl, #1
    beq jump_7240
    b jump_725c
jump_7236:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_727c
jump_723a:
    movs r0, #0x46
jump_723c:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
jump_7240:
    sub.w r1, r4, #0x2800
    cmp.w r1, #0x400
    blo jump_725c
    cmp.w r4, #0xf800
    bhs jump_725c
    ldr r2, [pc, #0x40] /* data_7294 */ 
    sub.w r1, r4, #0xf800
    cmp r1, r2
    blo jump_725c
    movs r0, r0
jump_725c:
    str.w r0, [fp, r5, lsl #2]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    cmp r5, #0x10
    bne jump_727c
    ldr r0, [pc, #0x30] /* data_7298 */ 
    movs r5, #0
    movs r1, #0x10
    str r1, [r0, #0x58]
    movs r1, #0x40
    str r1, [r0, #0x5c]
    movs r1, #2
    str r1, [r0, #0x50]
jump_7276:
    ldr r1, [r0, #0x58]
    lsls r1, r1, #0x1b
    bpl jump_7276
jump_727c:
    .short 0x1d24 /* adds r4, r4, #4 */ 
jump_727e:
    cmp r4, sb
    bls jump_7216
    movs r0, #0x4f
    b jump_723c

.byte 0x0
.byte 0x0

data_7288:
.word 0x200007d8
data_728c:
.word 0x400aa0d0
data_7290:
.word 0x1ff003fc
data_7294:
.word 0x1fef0850
data_7298:
.word 0x400a8000

update_start_cmd:
    push {r4, lr}
    movs r2, #0x40
    ldr r1, [pc, #8] /* data_72ac */ 
    movs r0, #3
    bl usb_copy_send
    movs r0, #0x4f
    pop {r4, pc}

data_72ac:
.word 0x200007bc

function_e_78:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r0, #0
    bl usb_get_ep_len
    mov r5, r0
    ldr r0, [r4, #0x20]
    adds r1, r0, #1
    beq jump_72f0
    ldrb.w r1, [r4, #0x24]
    cmp r1, #1
    bne jump_72f0
    cmp r0, r5
    blo jump_72d4
    subs r0, r0, r5
    str r0, [r4, #0x20]
    b jump_72e0
jump_72d4:
    mov r5, r0
    movs r0, #0
    str r0, [r4, #0x20]
    movs r0, #2
    strb.w r0, [r4, #0x24]
jump_72e0:
    mov r2, r5
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl usb_copy_send
    ldr r0, [r4, #0x1c]
    add r0, r5
    str r0, [r4, #0x1c]
jump_72f0:
    pop {r4, r5, r6, pc}
jump_72f2:
    push {r4, lr}
    mov r4, r0
    movs r0, #0
    strb r0, [r4, #0x19]
    cbz r1, jump_7310
    cmp r1, #1
    beq jump_7314
    cmp r1, #2
    bne jump_7326
    ldrh r0, [r4, #4]
    and r0, r0, #0xf
    bl function_e_67
    b jump_7314
jump_7310:
    ldrb.w r0, [r4, #0x34]
jump_7314:
    strb r0, [r4, #0x18]
    add.w r0, r4, #0x18
    str r0, [r4, #0x1c]
    movs r0, #2
    str r0, [r4, #0x20]
    movs r0, #1
    strb.w r0, [r4, #0x24]
jump_7326:
    pop {r4, pc}
function_e_79:
    push {r4, r5, r6, lr}
    mov r4, r0
    ldrh r0, [r0]
    movs r5, #1
    cmp.w r0, #0x500
    beq jump_73d2
    bgt jump_737a
    cmp.w r0, #0x100
    beq jump_73c4
    bgt jump_7358
    cmp r0, #0x80
    beq jump_73bc
    cmp r0, #0x81
    beq jump_73c0
    cmp r0, #0x82
    bne jump_7416
    movs r1, #2
jump_734e:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w jump_72f2
jump_7358:
    cmp.w r0, #0x102
    beq jump_73c8
    cmp.w r0, #0x300
    beq jump_73cc
    sub.w r0, r0, #0x300
    subs r0, #2
    bne jump_7416
    movs r2, #1
jump_736e:
    movs r1, #2
jump_7370:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w function_e_80
jump_737a:
    cmp.w r0, #0x900
    beq jump_741c
    bgt jump_73a2
    cmp.w r0, #0x680
    beq jump_73e0
    sub.w r0, r0, #0x600
    subs r0, #0x81
    beq jump_7418
    sub.w r0, r0, #0x100
    subs r0, #0xff
    bne jump_7416
    add.w r0, r4, #0x30
    strd r0, r5, [r4, #0x1c]
    b jump_7412
jump_73a2:
    sub.w r0, r0, #0xa00
    subs r0, #0x81
    beq jump_7440
    cmp r0, #0x80
    bne jump_7416
    ldr r1, [r4, #0x58]
jump_73b0:
    cmp r1, #0
    beq jump_7416
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    bx r1
jump_73bc:
    movs r1, #0
    b jump_734e
jump_73c0:
    movs r1, #1
    b jump_734e
jump_73c4:
    movs r2, #0
    b jump_73ce
jump_73c8:
    movs r2, #0
    b jump_736e
jump_73cc:
    movs r2, #1
jump_73ce:
    movs r1, #0
    b jump_7370
jump_73d2:
    ldrb r0, [r4, #2]
    bl usb_set_adrset
    strb.w r5, [r4, #0x24]
    movs r0, #5
    b jump_743a
jump_73e0:
    ldrb r0, [r4, #3]
    cmp r0, #1
    beq jump_7406
    cmp r0, #2
    beq jump_740a
    cmp r0, #3
    bne jump_7416
    ldrb r0, [r4, #2]
    ldr r1, [r4, #0x14]
    cmp r1, r0
    bls jump_7416
    ldr r1, [r4, #0x10]
    ldr.w r0, [r1, r0, lsl #2]
    cmp r0, #0
    beq jump_7416
jump_7400:
    str r0, [r4, #0x1c]
    ldrb r0, [r0]
    b jump_7410
jump_7406:
    ldr r0, [r4, #8]
    b jump_7400
jump_740a:
    ldr r0, [r4, #0xc]
    str r0, [r4, #0x1c]
    ldrh r0, [r0, #2]
jump_7410:
    str r0, [r4, #0x20]
jump_7412:
    strb.w r5, [r4, #0x24]
jump_7416:
    pop {r4, r5, r6, pc}
jump_7418:
    ldr r1, [r4, #0x54]
    b jump_73b0
jump_741c:
    ldrb r0, [r4, #2]
    strb.w r0, [r4, #0x30]
    strb.w r5, [r4, #0x24]
    movs r5, #1
jump_7428:
    sxtb r0, r5
    ldr.w r1, [r4, #0x84]
    bl function_e_70
    .short 0x1c6d /* adds r5, r5, #1 */ 
    cmp r5, #8
    blo jump_7428
    movs r0, #6
jump_743a:
    strb.w r0, [r4, #0x32]
    pop {r4, r5, r6, pc}
jump_7440:
    ldr r1, [r4, #0x5c]
    b jump_73b0
function_e_80:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r6, #1
    cbz r1, jump_7466
    cmp r1, #2
    bne jump_7464
    ldrh r0, [r4, #4]
    ands r5, r0, #0xf
    beq jump_7460
    cbz r2, jump_747c
    mov r0, r5
    bl function_e_73
jump_7460:
    strb.w r6, [r4, #0x24]
jump_7464:
    pop {r4, r5, r6, pc}
jump_7466:
    ldrb r0, [r4, #2]
    cmp r0, #1
    bne jump_7464
    add.w r4, r4, #0x24
    ldrb r0, [r4, #0x10]
    bfi r0, r2, #1, #1
    strb r0, [r4, #0x10]
    strb r6, [r4]
    pop {r4, r5, r6, pc}
jump_747c:
    ldr r0, [r4, #0x38]
    cmp r0, #0
    bne jump_7460
    mov r0, r5
    bl usb_ep_stall
    sxtb r0, r5
    bl usb_ep_data_toggle
    b jump_7460
word_copy:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bmi jump_749e
    ldr.w r3, [r0, r2, lsl #2]
    str.w r3, [r1, r2, lsl #2]
    b word_copy
jump_749e:
    bx lr
usb_get_ep_reg:
    ldr r1, [pc, #8] /* data_74ac */ 
    add.w r0, r0, r0, lsl #2
    add.w r0, r1, r0, lsl #2
    bx lr

data_74ac:
.word 0x400a8014

function_e_81_unsued:
    b jump_74b8
jump_74b2:
    ldm r0!, {r3}
    .short 0x1f12 /* subs r2, r2, #4 */ 
    stm r1!, {r3}
jump_74b8:
    cmp r2, #0
    bne jump_74b2
    bx lr

.byte 0x70
.byte 0x47

sram_stack_zero:
    movs r0, #0
    b jump_74c8
jump_74c4:
    stm r1!, {r0}
    .short 0x1f12 /* subs r2, r2, #4 */ 
jump_74c8:
    cmp r2, #0
    bne jump_74c4
    bx lr

.byte 0x0
.byte 0x0

function_e_82:
    push.w {r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
    ldr.w sb, [pc, #0x28c] /* data_7764 */ 
    mov r8, r2
    mov r4, r0
    mov r5, r1
    mov r6, sb
    ldrb.w r2, [sb, #2]
    bl function_24
    strb.w r0, [r6, #0x24]
    add.w r6, r5, r4, lsl #3
    cmp r6, #0x10
    bne jump_7502
    ldrb.w r1, [sb, #0x1f]
    cmp r1, #1
    bne jump_7502
    movs r1, #0xff
    strb.w r1, [sb, #0x24]
jump_7502:
    ldr r0, [pc, #0x268] /* data_776c */ 
    movs r7, #1
    add.w r0, r0, r4, lsl #3
    str r0, [sp]
    ldr r0, [pc, #0x260] /* data_7770 */ 
    ldr.w fp, [pc, #0x258] /* data_7768 */ 
    add.w r0, r0, r4, lsl #3
    str r0, [sp, #4]
    ldr r0, [pc, #0x258] /* data_7774 */ 
    lsls r7, r5
    add.w r0, r0, r4, lsl #3
    mov.w sl, #0
    str r0, [sp, #8]
    cmp.w r8, #0
    beq jump_7628
    ldrb.w r0, [sb, #0x1b]
    mov r8, sb
    cmp r0, #1
    beq jump_753e
    ldrb.w r0, [r8, #0x1c]
    cmp r0, #3
    bne jump_754a
jump_753e:
    bl function_e_84
    strb.w sl, [r8, #0x1b]
    strb.w sl, [r8, #0x1c]
jump_754a:
    ldrb.w r0, [r8, #2]
    mov.w r2, #0x100
    cbz r0, jump_7570
    ldr.w sb, [pc, #0x220] /* data_7778 */ 
    ldrb.w r1, [sb, r4]
    orrs r1, r7
    strb.w r1, [sb, r4]
    ldrb.w r0, [r8, #0x24]
    cmp r0, #3
    beq jump_75ea
    cmp r0, #0x13
    beq jump_765c
    b jump_7626
jump_7570:
    ldrb.w r0, [r8, #0x24]
    mov r7, r8
    cmp r0, #2
    beq jump_7580
    cmp r0, #0x12
    beq jump_75b0
    b jump_7632
jump_7580:
    add.w r7, r7, #0x18
    ldrb r0, [r7, #0xe]
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb r1, [r7]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x8]
    strb.w sl, [r7, #0x1a]
    add.w r1, r0, r6, lsl #8
    mov.w r0, #1
    strb r0, [r7, #3]
    strb r0, [r7, #4]
    strh.w sl, [r7, #0x2a]
    strb r4, [r7, #0x1e]
    b jump_761c
jump_75b0:
    add.w r7, r7, #0x18
    mov.w r2, #2
    ldrb r0, [r7, #0xe]
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb r1, [r7]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x8]
    add.w r1, r0, r6, lsl #8
    ldr r0, [pc, #0x1a8] /* data_777c */ 
    bl spi_flash_read_data
    ldr r0, [pc, #0x1a4] /* data_777c */ 
    ldrb r4, [r0, #1]
    mov r0, r4
    bl function_e_89
    movs r0, #1
    strb r0, [r7, #0xb]
    mov r0, r4
jump_75e6:
    pop.w {r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
jump_75ea:
    ldrb.w r0, [r8, #0x26]
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb.w r1, [r8, #0x18]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x4]
    strb.w sl, [r8, #0x32]
    add.w r1, r0, r6, lsl #8
    movs r0, #1
    strb.w r0, [r8, #0x1b]
    strb.w r0, [r8, #0x1c]
    strh.w sl, [r8, #0x42]
    strb.w r4, [r8, #0x36]
jump_761c:
    strb.w r5, [r8, #0x37]
    ldr r0, [pc, #0x158] /* data_777c */ 
    bl spi_flash_read_data
jump_7626:
    b jump_762a
jump_7628:
    b jump_76a6
jump_762a:
    ldrb.w r0, [r8, #0x24]
    cmp r0, #2
    beq jump_76fc
jump_7632:
    ldrb.w r0, [r8, #0x24]
    mov r1, r8
    cmp r0, #3
    beq jump_76fc
    cmp r0, #0xc
    beq jump_76fc
    cmp r0, #0xd
    beq jump_76fc
    ldrb.w r0, [r1, #0x26]
    cmp r0, #1
    beq jump_769e
    cmp r0, #2
    beq jump_76a2
    ldr r0, [sp, #8]
jump_7652:
    ldrb r0, [r0, r5]
    strb.w sl, [r8, #0x23]
    b jump_75e6

.byte 0xff
.byte 0xe7

jump_765c:
    ldrb.w r0, [r8, #0x26]
    movs r2, #2
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb.w r1, [r8, #0x18]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x4]
    add.w r1, r0, r6, lsl #8
    ldr r0, [pc, #0x100] /* data_777c */ 
    bl spi_flash_read_data
    ldr r0, [pc, #0xf8] /* data_777c */ 
    ldrb r5, [r0, #1]
    mov r0, r5
    bl function_e_89
    ldrb.w r0, [sb, r4]
    movs r1, #1
    orrs r0, r7
    strb.w r0, [sb, r4]
    strb.w r1, [r8, #0x23]
    mov r0, r5
    b jump_75e6
jump_769e:
    ldr r0, [sp]
    b jump_7652
jump_76a2:
    ldr r0, [sp, #4]
    b jump_7652
jump_76a6:
    ldr r1, [pc, #0xd0] /* data_7778 */ 
    mov.w r8, #1
    ldrb r0, [r1, r4]
    tst r0, r7
    beq jump_7718
    bics r0, r7
    strb r0, [r1, r4]
    movs r2, #1
    mov r1, r5
    mov r0, r4
    bl function_24
    mov r4, sb
    strb.w r0, [sb, #0x24]
    cmp r0, #3
    beq jump_76f2
    cmp r0, #0x13
    beq jump_7700
    cmp r0, #2
    beq jump_76fc
jump_76d2:
    uxtb r0, r0
    cmp r0, #3
    beq jump_76fc
    cmp r0, #0xc
    beq jump_76fc
    cmp r0, #0xd
    beq jump_76fc
    ldrb.w r0, [r4, #0x26]
    cmp r0, #1
    beq jump_775c
    cmp r0, #2
    beq jump_7760
    ldr r0, [sp, #8]
jump_76ee:
    ldrb r0, [r0, r5]
    b jump_75e6
jump_76f2:
    strb.w sl, [r4, #0x1b]
    movs r0, #3
    strb.w r0, [sb, #0x1c]
jump_76fc:
    movs r0, #0
    b jump_75e6
jump_7700:
    ldrb.w r0, [r4, #0x26]
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb r1, [r4, #0x18]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x4]
    b jump_7746
jump_7718:
    movs r2, #0
    mov r1, r5
    mov r0, r4
    bl function_24
    mov r4, sb
    strb.w r0, [sb, #0x24]
    cmp r0, #2
    beq jump_76f2
    cmp r0, #0x12
    bne jump_76d2
    ldrb.w r0, [r4, #0x26]
    add.w r1, r0, r0, lsl #1
    add.w r0, fp, r1, lsl #4
    ldrb r1, [r4, #0x18]
    add.w r0, r0, r1, lsl #4
    ldr r0, [r0, #-0x8]
jump_7746:
    movs r2, #2
    add.w r1, r0, r6, lsl #8
    ldr r0, [pc, #0x2c] /* data_777c */ 
    bl spi_flash_read_data
    ldr r0, [pc, #0x28] /* data_777c */ 
    ldrb r0, [r0, #1]
    strb.w r8, [r4, #0x23]
    b jump_75e6
jump_775c:
    ldr r0, [sp]
    b jump_76ee
jump_7760:
    ldr r0, [sp, #4]
    b jump_76ee

.thumb_func
data_7764:
.word 0x20000058
.thumb_func
data_7768:
.word data_16
.thumb_func
data_776c:
.word data_5
.thumb_func
data_7770:
.word data_6
.thumb_func
data_7774:
.word data_7
.thumb_func
data_7778:
.word 0x20000915
.thumb_func
data_777c:
.word 0x2000080c

function_e_83:
    push {lr}
    bl function_e_84
    movs r0, #0
    ldr r2, [pc, #0x20] /* data_77ac */ 
    mov r1, r0
jump_778c:
    strb r1, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_778c
    ldr r2, [pc, #0x18] /* data_77b0 */ 
    movs r0, #0
jump_779a:
    strb r1, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_779a
    ldr r0, [pc, #0xc] /* data_77b4 */ 
    strb r1, [r0, #2]
    pop {pc}

.byte 0x0
.byte 0x0

data_77ac:
.word 0x20002cba
data_77b0:
.word 0x20000915
data_77b4:
.word 0x20000058

function_e_84:
    push {r4, r5, r6, lr}
    ldr r3, [pc, #0x74] /* data_7830 */ 
    movs r2, #0
    ldr r1, [pc, #0x74] /* data_7834 */ 
    strb.w r2, [r3, #0x2b]
    mov r0, r2
    strb r2, [r1]
jump_77c8:
    adds r4, r1, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r2, [r4, #2]
    cmp r0, #6
    blo jump_77c8
    ldr r4, [pc, #0x58] /* data_7830 */ 
    movs r1, #1
    adds r4, #0x80
    ldr r5, [pc, #0x5c] /* data_7838 */ 
    movs r0, #0
    str r1, [r4, #0x10]
jump_77e0:
    adds r6, r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r2, [r6, #2]
    cmp r0, #0x1e
    blo jump_77e0
    strb r2, [r3, #3]
    movs r0, #2
    strb r0, [r3, #9]
    ldr r0, [pc, #0x48] /* data_783c */ 
    str r1, [r4, #0x14]
    strb r2, [r0, #2]
    strb r2, [r0, #3]
    strb r2, [r0, #4]
    ldrb r2, [r0, #1]
    bic r2, r2, #3
    strb r2, [r0, #1]
    ldr r2, [pc, #0x38] /* data_7840 */ 
    str r1, [r4, #0x20]
    ldrb r0, [r2, #1]
    bic r0, r0, #7
    strb r0, [r2, #1]
    ldr r0, [pc, #0x30] /* data_7844 */ 
    str r1, [r4, #0x1c]
    ldrb r2, [r0, #1]
    bic r2, r2, #0xff
    strb r2, [r0, #1]
    ldrb r2, [r0, #2]
    bic r2, r2, #0xff
    strb r2, [r0, #2]
    ldrb r2, [r0, #3]
    bic r2, r2, #3
    strb r2, [r0, #3]
    str r1, [r4, #0x18]
    pop {r4, r5, r6, pc}

data_7830:
.word 0x20000058
data_7834:
.word 0x2000003c
data_7838:
.word 0x2000032c
data_783c:
.word 0x20000034
data_7840:
.word 0x20000018
data_7844:
.word 0x2000002c

function_e_85:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r6, #1
    movs r7, #0
    ldr r5, [pc, #0xb8] /* data_790c */ 
    cmp r0, #0xcb
    beq jump_7864
    cmp r0, #0xcc
    beq jump_786e
    cmp r0, #0xcd
    beq jump_7878
    cmp r0, #0xce
    beq jump_7882
    b jump_788e
jump_7864:
    cbz r1, jump_786a
    strb r6, [r5, #0x1d]
    b jump_788e
jump_786a:
    strb r7, [r5, #0x1d]
    b jump_788e
jump_786e:
    cbz r1, jump_7874
    strb r6, [r5, #0x1e]
    b jump_788e
jump_7874:
    strb r7, [r5, #0x1e]
    b jump_788e
jump_7878:
    cbz r1, jump_787e
    strb r6, [r5, #0x1f]
    b jump_788e
jump_787e:
    strb r7, [r5, #0x1f]
    b jump_788e
jump_7882:
    cbz r1, jump_788a
    strb.w r6, [r5, #0x20]
    b jump_788e
jump_788a:
    strb.w r7, [r5, #0x20]
jump_788e:
    ldrb.w r0, [r5, #0x30]
    cmp r0, #0
    bne jump_78ca
    ldrb r1, [r5, #0x1d]
    ldrb r0, [r5, #0x1e]
    orrs.w r2, r1, r0
    beq jump_78a6
    cmp r1, #1
    beq jump_78aa
    b jump_78b0
jump_78a6:
    movs r4, #0
    b jump_78b2
jump_78aa:
    cbz r0, jump_78ce
    cmp r0, #1
    beq jump_78d2
jump_78b0:
    movs r4, #3
jump_78b2:
    ldrb.w r0, [r5, #0x26]
    cmp r4, r0
    beq jump_78ca
    strb.w r4, [r5, #0x27]
    bl function_80
    cmp r0, #1
    beq jump_78d6
    strb.w r6, [r5, #0x28]
jump_78ca:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_78ce:
    movs r4, #1
    b jump_78b2
jump_78d2:
    movs r4, #2
    b jump_78b2
jump_78d6:
    add.w r5, r5, #0x18
    ldr r0, [pc, #0x34] /* data_7910 */ 
    strb r4, [r5, #0xe]
    mov.w r2, #0xff0
    ldr.w r1, [r0, r4, lsl #2]
    ldr r0, [pc, #0x2c] /* data_7914 */ 
    add.w r1, r1, #0xff0
    bl spi_flash_read_data
    ldr r0, [pc, #0x20] /* data_7914 */ 
    ldrb r0, [r0]
    strb r0, [r5]
    ldrb r0, [r5, #0xe]
    bl function_e_25
    ldrb.w r0, [r5, #0x21]
    bl function_e_18
    bl function_e_83
    strb r7, [r5, #3]
    b jump_78ca

data_790c:
.word 0x20000058
data_7910:
.word data_3
data_7914:
.word 0x20001cba

function_e_86:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0xac] /* data_79cc */ 
    mov r0, r4
    ldrb r6, [r4, #0x1b]
    ldrb r0, [r0, #0x1c]
    cmp r6, #1
    beq jump_792c
    cmp r0, #3
    bne jump_7966
jump_792c:
    ldrh.w r1, [r4, #0x42]
    cmp r1, #0
    bne jump_7966
    ldr r5, [pc, #0x98] /* data_79d0 */ 
    ldrb.w r2, [r4, #0x32]
    movs r7, #0
    add.w r1, r5, r2, lsl #2
    ldrb r3, [r1, #2]
    cbnz r3, jump_794e
    ldrb.w ip, [r1, #3]
    cmp.w ip, #0
    beq jump_7954
jump_794e:
    orrs r6, r2
    beq jump_7978
    b jump_797c
jump_7954:
    cmp r6, #1
    bne jump_7974
    strb.w r7, [r4, #0x32]
    cmp r0, #1
    beq jump_796a
    movs r0, #0xc8
jump_7962:
    strh.w r0, [r4, #0x42]
jump_7966:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_796a:
    movs r0, #2
    strb r0, [r4, #0x1c]
    mov.w r0, #0x3e8
    b jump_7962
jump_7974:
    strb r7, [r4, #0x1c]
    b jump_7966
jump_7978:
    cmp r0, #3
    beq jump_7974
jump_797c:
    add.w r4, r4, #0x32
    ldrb r6, [r1, #1]
    lsls r0, r3, #8
    strh r0, [r4, #0x10]
    ldrb r0, [r1, #3]
    ldrh r1, [r4, #0x10]
    orr.w r0, r0, r1
    strh r0, [r4, #0x10]
    ldrb.w r1, [r5, r2, lsl #2]
    mov r0, r6
    bl function_e_32
    ldrb r0, [r4], #-0x32
    ldr r7, [pc, #0x2c] /* data_79cc */ 
    ldrb.w r0, [r5, r0, lsl #2]
    movs r5, #1
    adds r7, #0x80
    cmp r0, #1
    mov r0, r6
    beq jump_79be
    bl function_e_23
jump_79b2:
    str r5, [r7, #0x10]
    ldrb r0, [r4, #0x32]!
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r4]
    b jump_7966
jump_79be:
    bl function_e_89
    mov r0, r6
    bl function_13
    b jump_79b2

.byte 0x0
.byte 0x0

data_79cc:
.word 0x20000058
data_79d0:
.word 0x2000080c

function_e_87:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x6c] /* data_7a44 */ 
    ldr r0, [r5, #0x34]
    cmp r0, #0
    beq jump_7a42
    ldr r0, [r5, #0x34]
    movw r1, #0x2710
    cmp r0, r1
    bls jump_7a42
    movs r4, #0
    str r4, [r5, #0x34]
    sub.w r6, r5, #0x80
    mov r0, r6
    ldrb.w r1, [r6, #0x2a]
    ldrb.w r0, [r0, #0x26]
    cmp r1, #2
    beq jump_7a04
    bl function_e_8
    b jump_7a08
jump_7a04:
    bl function_e_94
jump_7a08:
    strb r4, [r6, #0x2a]!
    strb r4, [r6, #1]
    ldrb r0, [r6, #0xf]
    sub.w r6, r6, #0x2a
    bl function_e_18
    ldr r1, [pc, #0x2c] /* data_7a48 */ 
    movs r0, #0
    strb r4, [r1]
jump_7a1e:
    adds r2, r1, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r4, [r2, #2]
    cmp r0, #6
    blo jump_7a1e
    movs r2, #1
    ldr r1, [pc, #0x1c] /* data_7a4c */ 
    movs r0, #0
    str r2, [r5, #0x10]
jump_7a32:
    adds r3, r1, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r4, [r3, #2]
    cmp r0, #0x1d
    blo jump_7a32
    str r2, [r5, #0x14]
    strb r4, [r6, #0xc]
jump_7a42:
    pop {r4, r5, r6, pc}

data_7a44:
.word 0x200000d8
data_7a48:
.word 0x2000003c
data_7a4c:
.word 0x2000032c

function_e_88:
    push {r4, lr}
    ldr r4, [pc, #0x24] /* data_7a78 */ 
    ldrb.w r0, [r4, #0x39]
    cmp r0, #1
    bne jump_7a68
    ldrh.w r0, [r4, #0x48]
    bl function_1
    strh.w r0, [r4, #0x48]
jump_7a68:
    bl function_e_10
    ldrb.w r0, [r4, #0x39]
    pop.w {r4, lr}
    b.w function_e_18

data_7a78:
.word 0x20000058

function_e_89:
    cmp r0, #0xc4
    beq jump_7a8c
    cmp r0, #0xc5
    beq jump_7a90
    cmp r0, #0xc6
    bne jump_7a94
    b.w function_e_88
jump_7a8c:
    b.w function_e_90
jump_7a90:
    b.w function_e_91
jump_7a94:
    bx lr

.byte 0x0
.byte 0x0

function_e_90:
    push {r4, lr}
    ldr r4, [pc, #0x24] /* data_7ac0 */ 
    ldrb.w r0, [r4, #0x39]
    cmp r0, #1
    bne jump_7ab0
    ldrh.w r0, [r4, #0x48]
    bl call_837c
    strh.w r0, [r4, #0x48]
jump_7ab0:
    bl function_e_10
    ldrb.w r0, [r4, #0x39]
    pop.w {r4, lr}
    b.w function_e_18

data_7ac0:
.word 0x20000058

function_e_91:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x7c] /* data_7b44 */ 
    movs r5, #0
    ldrb.w r0, [r4, #0x39]
    cmp r0, #1
    bne jump_7aea
    ldrh.w r0, [r4, #0x46]
    cbnz r0, jump_7af2
    ldrh.w r0, [r4, #0x48]
    cbnz r0, jump_7af2
    mov.w r0, #0x12c
    strh.w r0, [r4, #0x48]
    bl function_e_9
jump_7aea:
    ldrb.w r0, [r4, #0x39]
    cmp r0, #4
    beq jump_7b3e
jump_7af2:
    ldrb.w r0, [r4, #0x39]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    and r0, r0, #3
    strb.w r0, [r4, #0x39]
jump_7b00:
    ldr r6, [pc, #0x40] /* data_7b44 */ 
    strb r5, [r4, #0xb]
    adds r6, #0x80
    str r5, [r6, #0x30]
    ldrb.w r0, [r4, #0x39]
    bl function_e_18
    ldr r1, [pc, #0x34] /* data_7b48 */ 
    ldrb.w r0, [r4, #0x39]
    strb r0, [r1]
    ldr r0, [pc, #0x30] /* data_7b4c */ 
    ldrb r1, [r4, #0x18]
    ldrb.w r2, [r4, #0x26]
    ldr.w r1, [r0, r1, lsl #2]
    subs r0, #0x9c
    ldr.w r0, [r0, r2, lsl #2]
    movs r2, #0
    add r0, r1
    mov r1, r0
    bl function_e_97
    str r5, [r4, #0x68]
    str r5, [r4, #0x6c]
    movs r0, #1
    str r0, [r6, #4]
    pop {r4, r5, r6, pc}
jump_7b3e:
    strb.w r5, [r4, #0x39]
    b jump_7b00

data_7b44:
.word 0x20000058
data_7b48:
.word 0x20001cba
data_7b4c:
.word data_12

function_24:
    push {r4, lr}
    ldr r3, [pc, #0x34] /* data_7b88 */ 
    add.w r0, r1, r0, lsl #3
    ldr r4, [pc, #0x30] /* data_7b8c */ 
    ldrb.w r1, [r3, #0x26]
    ldrb r3, [r3, #0x18]
    add.w r1, r1, r1, lsl #1
    add.w r1, r4, r1, lsl #4
    add.w r1, r1, r3, lsl #4
    cbz r2, jump_7b82
    ldr r1, [r1, #-0xc]
jump_7b72:
    movs r2, #1
    add r1, r0
    ldr r0, [pc, #0x18] /* data_7b90 */ 
    bl spi_flash_read_data
    ldr r0, [pc, #0x10] /* data_7b90 */ 
    ldrb r0, [r0]
    pop {r4, pc}
jump_7b82:
    ldr r1, [r1, #-0x10]
    b jump_7b72

.thumb_func
data_7b88:
.word 0x20000058
.thumb_func
data_7b8c:
.word data_16
.thumb_func
data_7b90:
.word 0x20001cba

.thumb_func
main:
    bl setup_intr_priority
    bl setup_afio_gpio
    bl function_74
    ldr r0, [pc, #0x118] /* data_7cbc */ 
    bl spin_wait_maybe
    movs r0, #1
    bl function_37
    movs r0, #1
    bl function_e_6
    ldr r0, [pc, #0x10c] /* data_7cc0 */ 
    bl spin_wait_maybe
    movs r0, #0xa
    bl spin_wait_maybe
    ldr.w r8, [pc, #0x104] /* data_7cc4 */ 
    mov.w r6, #0x200
    str.w r6, [r8, #0x28]
    movs r0, #0xa
    bl spin_wait_maybe
    ldr.w sl, [pc, #0xf4] /* data_7cc8 */ 
    mov.w sb, #0x100
    movs r2, #1
    mov r4, sb
    mov r1, sb
    mov r5, sl
    mov r0, sl
    bl gpio_set_input_output
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_reset_pin
    movs r0, #0xa
    bl spin_wait_maybe
    bl function_e_50
    ldr r4, [pc, #0xd0] /* data_7ccc */ 
    strb r0, [r4]
    ldrb r0, [r4]
    and r0, r0, #0x44
    strb r0, [r4]
    ldrb r1, [r4]
    ldr r0, [pc, #0xc4] /* data_7cd0 */ 
    movs r7, #0
    movs r5, #1
    cmp r1, #0x44
    beq jump_7c5e
    ldrb r1, [r4]
    cmp r1, #4
    beq jump_7c62
    ldrb r1, [r4]
    cmp r1, #0x44
    beq jump_7c66
    movs r1, #3
jump_7c20:
    strb r1, [r0]
jump_7c22:
    ldr r1, [pc, #0xb0] /* data_7cd4 */ 
    ldrb r0, [r0]
    strb r0, [r1]
    movs r2, #1
    mov r1, sb
    mov r0, sl
    bl gpio_set_reset_pin
    movs r0, #0xa
    bl spin_wait_maybe
    movs r0, #1
    bl function_e_6
    movs r0, #0xa
    bl spin_wait_maybe
    str.w r6, [r8, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    bl function_e_33
    bl usb_init
    ldr r6, [pc, #0x80] /* data_7cd8 */ 
jump_7c58:
    ldr r0, [r4, #8]
    cbz r0, jump_7c6a
    b jump_7c7a
jump_7c5e:
    strb r7, [r0]
    b jump_7c22
jump_7c62:
    strb r5, [r0]
    b jump_7c22
jump_7c66:
    movs r1, #2
    b jump_7c20
jump_7c6a:
    ldrb.w r0, [r6, #0x32]
    cmp r0, #6
    bne jump_7cb0
    movs r0, #0
    str r5, [r4, #8]
    bl function_37
jump_7c7a:
    ldr r0, [r4, #8]
    cmp r0, #1
    bne jump_7cb0
    ldr r0, [r4, #0x10]
    cbz r0, jump_7c8e
    str r7, [r4, #0x10]
    movs r0, #1
    str r7, [r4, #0xc]
    bl function_37
jump_7c8e:
    ldr r0, [r4, #0xc]
    cbnz r0, jump_7ca6
    ldr r0, [r4, #0x10]
    cbnz r0, jump_7cb0
    ldrb.w r0, [r6, #0x32]
    cmp r0, #6
    bne jump_7cb0
    movs r0, #0
    str r5, [r4, #0xc]
    bl function_37
jump_7ca6:
    ldr r0, [r4, #0xc]
    cmp r0, #1
    bne jump_7cb0
    bl function_e_21
jump_7cb0:
    ldr r0, [pc, #0x24] /* data_7cd8 */ 
    bl function_75
    bl watchdog_reload_timer
    b jump_7c58

data_7cbc:
.word 0x61a80
data_7cc0:
.word 0x186a0
data_7cc4:
.word 0x400b0000
data_7cc8:
.word 0x400b4000
data_7ccc:
.word 0x20000000
data_7cd0:
.word 0x2000007e
data_7cd4:
.word 0x2000007f
data_7cd8:
.word 0x20000234

function_e_92:
    push.w {r4, r5, r6, r7, r8, sb, lr}
    sub.w r2, r0, #0xa0
    cmp r2, #7
    bhi jump_7dba
    ldr r3, [pc, #0xd4] /* data_7dc0 */ 
    ldrb r2, [r3, #0x10]
    cmp r2, #1
    bne jump_7d00
    cmp r0, #0xa4
    beq jump_7cfa
    cmp r0, #0xa5
    beq jump_7cfe
    b jump_7d00
jump_7cfa:
    movs r0, #0xa5
    b jump_7d00
jump_7cfe:
    movs r0, #0xa4
jump_7d00:
    ldr r2, [pc, #0xc0] /* data_7dc4 */ 
    subs r0, #0xa0
    movs r6, #0
    ldrsb.w r8, [r2, #3]
    ldrsb.w ip, [r2, #2]
    ldrsb.w r7, [r2, #4]
    ldrb r4, [r2, #1]
    movs r5, #1
    mov.w sb, #-1
    cmp r0, #8
    bhs jump_7dae
    tbb [pc, r0]

.byte 0x4
.byte 0xc
.byte 0x16
.byte 0x1e
.byte 0x38
.byte 0x3f
.byte 0x28
.byte 0x2e

switch_7d2a:
    cbz r1, jump_7d32
    strb.w sb, [r2, #3]
    b jump_7d3e
jump_7d32:
    lsls.w r0, r8, #0x18
    bmi jump_7d48
    b jump_7dae
switch_7d3a:
    cbz r1, jump_7d42
    strb r5, [r2, #3]
jump_7d3e:
    str r5, [r3, #0x74]
    b jump_7dae
jump_7d42:
    lsls.w r0, r8, #0x18
    bmi jump_7dae
jump_7d48:
    strb r6, [r2, #3]
    str r6, [r3, #0x74]
    b jump_7dae
switch_7d4e:
    cbz r1, jump_7d56
    strb.w sb, [r2, #2]
    b jump_7d62
jump_7d56:
    lsls.w r0, ip, #0x18
    bmi jump_7d6c
    b jump_7dae
switch_7d5e:
    cbz r1, jump_7d66
    strb r5, [r2, #2]
jump_7d62:
    str r5, [r3, #0x70]
    b jump_7dae
jump_7d66:
    lsls.w r0, ip, #0x18
    bmi jump_7dae
jump_7d6c:
    strb r6, [r2, #2]
    str r6, [r3, #0x70]
    b jump_7dae
switch_7d72:
    cbz r1, jump_7d78
    strb r5, [r2, #4]
    b jump_7d84
jump_7d78:
    lsls r0, r7, #0x18
    bpl jump_7d8c
    b jump_7dae
switch_7d7e:
    cbz r1, jump_7d88
    strb.w sb, [r2, #4]
jump_7d84:
    str r5, [r3, #0x78]
    b jump_7dae
jump_7d88:
    lsls r0, r7, #0x18
    bpl jump_7dae
jump_7d8c:
    strb r6, [r2, #4]
    str r6, [r3, #0x78]
    b jump_7dae
switch_7d92:
    cbz r1, jump_7d9a
    orr r0, r4, #1
    b jump_7dac
jump_7d9a:
    bic r0, r4, #1
    b jump_7dac
switch_7da0:
    cbz r1, jump_7da8
    orr r0, r4, #2
    b jump_7dac
jump_7da8:
    bic r0, r4, #2
jump_7dac:
    strb r0, [r2, #1]
jump_7dae:
    ldr r0, [pc, #0x10] /* data_7dc0 */ 
    adds r0, #0x80
    str r5, [r0, #0x20]
    movs r0, #1
jump_7db6:
    pop.w {r4, r5, r6, r7, r8, sb, pc}
jump_7dba:
    movs r0, #0
    b jump_7db6

.byte 0x0
.byte 0x0

.thumb_func
data_7dc0:
.word 0x20000058
.thumb_func
data_7dc4:
.word 0x20000034

function_e_93:
    push {r4, r5, r6, r7, lr}
    movs r1, #0
    ldr r7, [pc, #0x30] /* data_7e00 */ 
    ldr.w ip, [pc, #0x34] /* data_7e04 */ 
    movs r3, #1
    mov.w r5, #0x1c2
jump_7dd8:
    ldrb r2, [r7, r1]
    movs r0, #0
    add.w r4, ip, r1, lsl #4
jump_7de0:
    lsl.w r6, r3, r0
    tst r2, r6
    beq jump_7dec
    strh.w r5, [r4, r0, lsl #1]
jump_7dec:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #8
    blo jump_7de0
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #9
    blo jump_7dd8
    pop {r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

data_7e00:
.word 0x2000017c
data_7e04:
.word 0x20002e2c

function_e_94:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x64] /* data_7e70 */ 
    movs r5, #0
    mov r6, r0
    strb r5, [r4]
    ldrb r0, [r4, #0xe]
    bl function_e_8
    movs r0, #1
    strb r0, [r4]
    ldrb r0, [r4, #0xe]
    bl function_e_8
    movs r0, #2
    strb r0, [r4]
switch_7e26:
    ldrb r0, [r4, #0xe]
    bl function_e_8
    movs r0, #3
    strb r0, [r4]
    ldrb r0, [r4, #0xe]
    bl function_e_8
    ldr r1, [pc, #0x3c] /* data_7e74 */ 
    strb r5, [r4]
    strb r5, [r4, #0x13]
    strb r5, [r1]
    movs r0, #0x56
    strb r0, [r1, #0xb]
    movs r0, #0x31
    strb r0, [r1, #0xc]
    movs r0, #0x34
    strb r0, [r1, #0xd]
    ldr r0, [pc, #0x2c] /* data_7e78 */ 
    mov.w r2, #0xff0
    ldr.w r0, [r0, r6, lsl #2]
    addw r1, r0, #0xffe
    add.w r0, r0, #0xff0
    bl function_e_97
    strb r5, [r4, #0x14]
    strb r5, [r4, #0x15]
    ldrb.w r0, [r4, #0x21]
    pop.w {r4, r5, r6, lr}
    b.w function_e_18

data_7e70:
.word 0x20000070
data_7e74:
.word 0x20002caa
data_7e78:
.word data_3

function_e_95:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    movs r4, #0
    ldr r5, [pc, #0x88] /* data_7f0c */ 
switch_7e84:
    ldr.w sb, [pc, #0x88] /* data_7f10 */ 
    ldr r7, [pc, #0x88] /* data_7f14 */ 
    mov r6, r4
    mov.w r8, #1
    mov.w sl, #2
    mov.w fp, #3
jump_7e98:
    strb r6, [r5, #0x18]
    mov r0, r4
    bl function_e_8
    strb.w r8, [r5, #0x18]
    mov r0, r4
    bl function_e_8
    strb.w sl, [r5, #0x18]
    mov r0, r4
    bl function_e_8
    strb.w fp, [r5, #0x18]
    mov r0, r4
    bl function_e_8
    strb.w r6, [r5, #0x2b]
    add.w r0, sb, #0xff0
    strb r6, [r5, #0x18]
    strb r6, [r0]
    mov.w r1, #0x56
    strb r1, [r0, #0xb]
    mov.w r1, #0x31
    strb r1, [r0, #0xc]
    mov.w r1, #0x34
    strb.w r1, [sb, #0xffd]
    ldr.w r0, [r7, r4, lsl #2]
    mov.w r2, #0xff0
    addw r1, r0, #0xffe
    add.w r0, r0, #0xff0
    bl function_e_97
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    cmp r4, #3
    blo jump_7e98
    strb r6, [r5, #0x2c]!
    strb r6, [r5, #1]
    ldrb r0, [r5, #0xd]
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    b.w function_e_18

.byte 0x0
.byte 0x0

data_7f0c:
.word 0x20000058
data_7f10:
.word 0x20001cba
data_7f14:
.word data_3

function_e_8:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr r4, [pc, #0x174] /* data_8094 */ 
    mov sb, r0
    movs r0, #2
    strb r0, [r4, #6]
    movs r6, #0x44
    strb.w r6, [r4, #0x3d]
    movs r7, #0x45
    strb.w r7, [r4, #0x3e]
    movs r3, #0
    strb.w r3, [r4, #0x39]
    ldr r0, [pc, #0x160] /* data_8098 */ 
    ldrb r1, [r4, #0x18]
    ldr r5, [pc, #0x160] /* data_809c */ 
    mov.w r8, #0xe8
    ldr.w r2, [r0, r1, lsl #2]
    adds r0, r5, #3
    adds r1, r0, #1
    strb r3, [r5, r2]
    strb.w r8, [r2, r0]
    mov.w sl, #3
    .short 0x1c80 /* adds r0, r0, #2 */ 
    strb.w sl, [r2, r1]
    strb r3, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    mov fp, r4
    strb r3, [r2, r0]
    .short 0x1cc0 /* adds r0, r0, #3 */ 
    strb r3, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r6, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    mov.w r6, #0x120
    strb r7, [r2, r0]
    movs r0, #0
    adds r1, r2, r5
jump_7f74:
    add.w r4, r0, #0xc
    strb r3, [r1, r4]
    addw r4, r0, #0x12d
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxth r0, r0
    strb r3, [r1, r4]
    cmp r0, r6
    blo jump_7f74
    ldr r7, [pc, #0x114] /* data_80a0 */ 
    movs r1, #0
    add.w ip, r7, #0x120
jump_7f90:
    movs r0, #0
    add.w r4, ip, r1, lsl #5
    add.w r5, r7, r1, lsl #5
jump_7f9a:
    add.w r6, r5, r0, lsl #2
    strh.w r3, [r5, r0, lsl #2]
    strh r3, [r6, #2]
    strh.w r3, [r4, r0, lsl #2]
    add.w r6, r4, r0, lsl #2
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxth r0, r0
    strh r3, [r6, #2]
    cmp r0, #8
    blo jump_7f9a
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxth r1, r1
    cmp r1, #9
    blo jump_7f90
    ldr r0, [pc, #0xdc] /* data_809c */ 
    ldr r1, [pc, #0xd8] /* data_809c */ 
    adds r0, #0x34
    adds r1, #0x35
    strb.w r8, [r2, r0]
    ldr r4, [pc, #0xd0] /* data_809c */ 
    strb.w sl, [r2, r1]
    movs r6, #0x32
    adds r4, #0x50
    strh r6, [r7, #0x28]
    movs r1, #0x64
    strb r1, [r2, r4]
    .short 0x1c64 /* adds r4, r4, #1 */ 
    ldr r5, [pc, #0xbc] /* data_809c */ 
    strb r3, [r2, r4]
    movs r4, #0xc8
    adds r5, #0x54
    strh.w r4, [r7, #0x44]
    strb.w r8, [r2, r5]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    mov.w lr, #0x3e8
    strb.w sl, [r2, r5]
    .short 0x1ced /* adds r5, r5, #3 */ 
    strh.w lr, [r7, #0x48]
    strb r4, [r2, r5]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    mov r0, sl
    strb r3, [r2, r5]
    mov.w sl, #0x12c
    add.w r5, r5, #0x180
    strh.w sl, [r7, #0x4c]
    strb.w r8, [r2, r5]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    strb r0, [r2, r5]
    adds r5, #0x1f
    strh.w r6, [ip, #0xac]
    strb r1, [r2, r5]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    strb r3, [r2, r5]
    strh.w r1, [ip, #0xcc]
    sub.w r1, r5, #0x71
    strb.w r8, [r2, r1]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r0, [r2, r1]
    adds r0, r5, #3
    strh.w sl, [ip, #0x5c]
    strb r4, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r3, [r2, r0]
    ldr r0, [pc, #0x54] /* data_8098 */ 
    strh.w lr, [ip, #0xd0]
    subs r0, #0x9c
    strb.w r3, [fp, #0x39]
    ldr.w r0, [r0, sb, lsl #2]
    add r0, r2
    add.w r1, r0, #0x3f0
    bl function_e_97
    ldrb.w r0, [fp, #0x18]
    cmp r0, #0
    beq jump_8090
    ldr r1, [pc, #0x34] /* data_8098 */ 
    movs r4, #0
    add.w r0, sb, sb, lsl #1
    subs r1, #0x90
    mov r6, fp
    add.w r5, r1, r0, lsl #4
jump_8072:
    ldrb r0, [r6, #0x18]
    add.w r0, r5, r0, lsl #4
    ldr r0, [r0, #-0x10]
    add.w r0, r0, r4, lsl #12
    bl function_e_40
    bl watchdog_reload_timer
    .short 0x1c64 /* adds r4, r4, #1 */ 
    lsls r4, r4, #0x10
    lsrs r4, r4, #0x10
    beq jump_8072
jump_8090:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_8094:
.word 0x20000058
data_8098:
.word data_12
data_809c:
.word 0x20001cba
data_80a0:
.word 0x2000091e

function_e_7:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0xac] /* data_8158 */ 
    movs r4, #0
    movs r7, #1
    ldrb r2, [r5, #0xc]
    add.w r6, r5, #0x80
    mov.w r0, #0x3e8
    cmp r2, #8
    bhs switch_80e8
    tbb [pc, r2]

.byte 0x14
.byte 0x4
.byte 0xa
.byte 0x4
.byte 0xa
.byte 0x4
.byte 0x16
.byte 0x27

switch_80c8:
    ldr r1, [r6, #0x34]
    cmp r1, r0
    bls switch_80e8
    movs r1, #0
    mov r0, r1
    b jump_80dc
switch_80d4:
    ldr r2, [r6, #0x34]
    cmp r2, r0
switch_80d8:
    bls switch_80e8
    mov r1, r0
jump_80dc:
    bl function_e_42
    ldrb r0, [r5, #0xc]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r5, #0xc]
    str r7, [r6, #0x34]
switch_80e8:
    pop.w {r4, r5, r6, r7, r8, pc}
switch_80ec:
    add.w r5, r5, #0xc
    ldrb r0, [r5, #0x1a]
    bl function_e_8
    ldrb r0, [r5, #0x1a]
    bl function_e_25
    ldrb.w r0, [r5, #0x2d]
    bl function_e_18
    str r4, [r6, #0x34]
    ldrb r0, [r5]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r5]
    b switch_80e8
switch_810e:
    ldr r1, [pc, #0x4c] /* data_815c */ 
    movs r0, #0
jump_8112:
    adds r2, r1, r0
    ldrb r2, [r2, #2]
    cmp r2, #0xff
    bne jump_8122
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_8112
jump_8122:
    cmp r0, #9
    bne switch_80e8
    movs r0, #0
    movs r2, #0xff
jump_812a:
    adds r3, r1, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r2, [r3, #0x14]
    cmp r0, #9
    blo jump_812a
    bl call_8894
    cmp r0, #1
    bne switch_80e8
    ldr r0, [pc, #0x18] /* data_8158 */ 
    strb r4, [r5, #0xc]
    strb r4, [r5, #2]
switch_8144:
    adds r0, #0xf8
    strb r4, [r5, #4]
    str r4, [r0]
    str r4, [r0, #4]
    adds r0, #8
    str r4, [r0]
    str r4, [r0, #4]
    str r4, [r5, #0x68]
    str r4, [r5, #0x6c]
    b switch_80e8

data_8158:
.word 0x20000058
data_815c:
.word 0x20002de4

function_e_5:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp}
    ldr.w r8, [pc, #0x108] /* data_8270 */ 
    ldr r0, [pc, #0x100] /* data_826c */ 
    ldr.w sl, [pc, #0xfc] /* data_8268 */ 
    ldrb.w r1, [r8, #0x18]
    ldr.w sb, [pc, #0x100] /* data_8274 */ 
    movs r4, #0
    ldr.w r2, [r0, r1, lsl #2]
    add.w fp, sl, #0x120
    add.w r3, r2, sb
jump_8184:
    movs r1, #0
    add.w r5, fp, r4, lsl #5
    add.w ip, sl, r4, lsl #5
jump_818e:
    add.w r0, r1, r4, lsl #3
    lsls r0, r0, #2
    add.w r6, r0, #0xc
    ldrh.w r7, [ip, r1, lsl #2]
    strb r7, [r3, r6]
    lsrs r6, r7, #8
    add.w r7, r0, #0xd
    strb r6, [r3, r7]
    add.w r6, ip, r1, lsl #2
    .short 0x1c7f /* adds r7, r7, #1 */ 
    ldrh r6, [r6, #2]
    strb r6, [r3, r7]
    .short 0x1c7f /* adds r7, r7, #1 */ 
    lsrs r6, r6, #8
    strb r6, [r3, r7]
    addw r7, r0, #0x12d
    ldrh.w r6, [r5, r1, lsl #2]
    strb r6, [r3, r7]
    .short 0x1c7f /* adds r7, r7, #1 */ 
switch_81c2:
    lsrs r6, r6, #8
    strb r6, [r3, r7]
    add.w r6, r5, r1, lsl #2
    .short 0x1c7f /* adds r7, r7, #1 */ 
    ldrh r6, [r6, #2]
    strb r6, [r3, r7]
    lsrs r6, r6, #8
    adds r0, r7, #1
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    strb r6, [r3, r0]
    cmp r1, #8
    blo jump_818e
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    cmp r4, #9
    blo jump_8184
    ldrb.w r1, [r8, #0x39]
    strb.w r1, [sb, r2]
    ldr r1, [pc, #0x84] /* data_8274 */ 
    ldrh.w r0, [r8, #0x48]
    .short 0x1cc9 /* adds r1, r1, #3 */ 
    strb r0, [r2, r1]
    lsrs r1, r0, #8
    ldr r0, [pc, #0x78] /* data_8274 */ 
    .short 0x1d00 /* adds r0, r0, #4 */ 
    strb r1, [r2, r0]
    ldr r1, [pc, #0x70] /* data_8274 */ 
    ldrh.w r0, [r8, #0x46]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r0, [r2, r1]
    lsrs r1, r0, #8
    ldr r0, [pc, #0x64] /* data_8274 */ 
    .short 0x1c80 /* adds r0, r0, #2 */ 
    strb r1, [r2, r0]
    ldr r1, [pc, #0x60] /* data_8274 */ 
    ldrh.w r0, [r8, #0x4c]
    .short 0x1dc9 /* adds r1, r1, #7 */ 
    strb r0, [r2, r1]
    lsrs r1, r0, #8
    ldr r0, [pc, #0x54] /* data_8274 */ 
    adds r0, #8
    strb r1, [r2, r0]
    ldr r1, [pc, #0x4c] /* data_8274 */ 
    ldrh.w r0, [r8, #0x4a]
    .short 0x1d49 /* adds r1, r1, #5 */ 
    strb r0, [r2, r1]
    lsrs r1, r0, #8
    ldr r0, [pc, #0x40] /* data_8274 */ 
    .short 0x1d80 /* adds r0, r0, #6 */ 
    strb r1, [r2, r0]
    .short 0x1cc0 /* adds r0, r0, #3 */ 
    ldrb.w r1, [r8, #6]
    strb r1, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrb.w r1, [r8, #0x3d]
    strb r1, [r2, r0]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrb.w r1, [r8, #0x3e]
    strb r1, [r2, r0]
    ldr r0, [pc, #0x1c] /* data_826c */ 
    ldrb.w r1, [r8, #0x26]
    subs r0, #0x9c
    ldr.w r0, [r0, r1, lsl #2]
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp}
    add r0, r2
    add.w r1, r0, #0x3f0
    b.w function_e_97

data_8268:
.word 0x2000091e
data_826c:
.word data_12
data_8270:
.word 0x20000058
data_8274:
.word 0x20001cba

function_e_9:
    ldr r1, [pc, #0x3c] /* data_82b8 */ 
    ldrb.w r0, [r1, #0x39]
    cmp r0, #1
    bne jump_82b6
    add.w r1, r1, #0x18
    ldr r2, [pc, #0x34] /* data_82bc */ 
    ldrh r0, [r1, #0x2e]
    strb r0, [r2]
    lsr.w r0, r0, #8
    strb r0, [r2, #1]
    ldr r0, [pc, #0x2c] /* data_82c0 */ 
    ldrb r2, [r1]
    ldrb r1, [r1, #0xe]
    ldr.w r2, [r0, r2, lsl #2]
    sub.w r0, r0, #0x9c
    ldr.w r0, [r0, r1, lsl #2]
    add r0, r2
    add.w r1, r0, #2
    add.w r0, r0, #1
    mov.w r2, #0
    b.w function_e_97
jump_82b6:
    bx lr

data_82b8:
.word 0x20000058
data_82bc:
.word 0x20001cba
data_82c0:
.word data_12

function_e_10:
    ldr r1, [pc, #0x3c] /* data_8304 */ 
    ldrb.w r0, [r1, #0x39]
    cmp r0, #1
    bne jump_8302
    add.w r1, r1, #0x18
    ldr r2, [pc, #0x34] /* data_8308 */ 
    ldrh r0, [r1, #0x30]
    strb r0, [r2]
    lsr.w r0, r0, #8
    strb r0, [r2, #1]
    ldr r0, [pc, #0x2c] /* data_830c */ 
    ldrb r2, [r1]
    ldrb r1, [r1, #0xe]
    ldr.w r2, [r0, r2, lsl #2]
    sub.w r0, r0, #0x9c
    ldr.w r0, [r0, r1, lsl #2]
    add r0, r2
    add.w r1, r0, #4
    add.w r0, r0, #3
    mov.w r2, #0
    b.w function_e_97
jump_8302:
    bx lr

data_8304:
.word 0x20000058
data_8308:
.word 0x20001cba
data_830c:
.word data_12

function_e_11:
    push {r4, lr}
    ldr r3, [pc, #0x24] /* data_8338 */ 
    ldr r4, [pc, #0x1c] /* data_8334 */ 
    ldrb r2, [r3, #2]
    strb.w r1, [r4, r2, lsl #2]
    add.w r1, r4, r2, lsl #2
    strb r0, [r1, #1]
    ldr r0, [r3, #0x30]
    movs r0, #0
    strb r0, [r1, #2]
    ldr r0, [r3, #0x30]
    strb r0, [r1, #3]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    strb r2, [r3, #2]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_8334:
.word 0x2000080c
data_8338:
.word 0x20000088

function_1:
    cmp r0, #0x32
    beq jump_8346
    cmp r0, #0x64
    bhi jump_8348
    movs r0, #0x32
jump_8346:
    bx lr
jump_8348:
    cmp r0, #0xc8
    bhi jump_8350
    movs r0, #0x64
    bx lr
jump_8350:
    mov.w r2, #0x12c
    cmp r0, r2
    bhi jump_835c
    movs r0, #0xc8
    bx lr
jump_835c:
    mov.w r1, #0x1f4
    cmp r0, r1
    bhi jump_8368
jump_8364:
    mov r0, r2
    bx lr
jump_8368:
    mov.w r2, #0x2bc
    cmp r0, r2
    bhi jump_8374
    mov r0, r1
    bx lr
jump_8374:
    cmp.w r0, #0x3e8
    bls jump_8364
    bx lr
call_837c:
    mov.w r2, #0x3e8
    cmp r0, r2
    beq jump_838e
    mov.w r1, #0x2bc
    cmp r0, r1
    blo jump_8390
jump_838c:
    mov r0, r2
jump_838e:
    bx lr
jump_8390:
    mov.w r2, #0x1f4
    cmp r0, r2
    blo jump_839c
jump_8398:
    mov r0, r1
    bx lr
jump_839c:
    mov.w r1, #0x12c
    cmp r0, r1
    bhs jump_838c
    cmp r0, #0xc8
    bhs jump_8398
    cmp r0, #0x64
    blo jump_83b0
    movs r0, #0xc8
    bx lr
jump_83b0:
    cmp r0, #0x32
    blo jump_83b8
    movs r0, #0x64
    bx lr
jump_83b8:
    movs r0, #0
    bx lr
function_e_14:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w r8, [pc, #0x1b0] /* data_8574 */ 
    mov.w sl, #0
    ldrb.w r0, [r8, #0x29]
    cbnz r0, jump_841c
    bl function_80
    cmp r0, #1
    bne jump_841c
    movs r0, #0
    bl function_e_18
    bl function_e_83
    add.w r1, r8, #0x29
    ldr r2, [pc, #0x190] /* data_8578 */ 
    ldrb r0, [r1, #0x14]
    mov.w r3, #0x1c2
    lsr.w r4, r0, #3
    add.w r4, r2, r4, lsl #4
    and r0, r0, #7
    strh.w r3, [r4, r0, lsl #1]
    ldrb r0, [r1, #0x15]
    lsr.w r4, r0, #3
    add.w r4, r2, r4, lsl #4
    and r0, r0, #7
    strh.w r3, [r4, r0, lsl #1]
    strh.w sl, [r2, #0x20]
    ldrb r0, [r1]
    add.w r0, r0, #1
    strb.w r0, [r8, #0x29]
jump_841c:
    movs r6, #0
jump_841e:
    ldr r0, [pc, #0x15c] /* data_857c */ 
    add r0, r6
    mov sb, r0
    ldrb r5, [r0, #2]
    ldrb r7, [r0, #0x14]
    eors r7, r5
    movs r4, #0
jump_842c:
    lsls r0, r7, #0x1f
    beq jump_84c4
    lsls r0, r5, #0x1f
    beq jump_8444
    cmp r6, #8
    bne jump_8444
    cbnz r4, jump_8444
    movs r1, #0x14
    strb.w r1, [r8, #0x29]
    strb.w sl, [r8, #0x20]
jump_8444:
    ldrb.w r0, [sb, #0x14]
    movs r1, #1
    lsls r1, r4
    eors r0, r1
    strb.w r0, [sb, #0x14]
    ldrb.w r0, [r8, #0x29]
    cmp r0, #3
    beq jump_84d2
    bgt jump_8466
    cmp r0, #1
    beq jump_8470
    cmp r0, #2
    bne jump_8558
    b jump_84c6
jump_8466:
    cmp r0, #0xb
    beq jump_850c
    cmp r0, #0xc
    bne jump_8558
    b jump_851c
jump_8470:
    lsls r0, r5, #0x1f
    bne jump_8558
    ldrb.w r1, [r8, #0x3d]
    add.w fp, r4, r6, lsl #3
    cmp fp, r1
    bne jump_849e
    bl function_e_93
    movs r1, #2
    strb.w r1, [r8, #0x29]
    ldrb.w r0, [r8, #0x3e]
    ldr r2, [pc, #0xe8] /* data_8578 */ 
    lsrs r3, r0, #3
    add.w r2, r2, r3, lsl #4
    and r0, r0, #7
    strh.w sl, [r2, r0, lsl #1]
jump_849e:
    ldrb.w r1, [r8, #0x3e]
    cmp fp, r1
    bne jump_8558
    bl function_e_93
    movs r1, #0xb
    strb.w r1, [r8, #0x29]
    ldrb.w r0, [r8, #0x3e]
    ldr r2, [pc, #0xc0] /* data_8578 */ 
    lsrs r3, r0, #3
    add.w r2, r2, r3, lsl #4
    and r0, r0, #7
    strh.w sl, [r2, r0, lsl #1]
jump_84c4:
    b jump_8558
jump_84c6:
    bl function_80
    cmp r0, #1
    bne jump_8558
    movs r1, #3
    b jump_8516
jump_84d2:
    lsls r0, r5, #0x1f
    bne jump_8558
    add.w r0, r4, r6, lsl #3
    uxtb r0, r0
    cmp r0, #0x3e
    beq jump_8558
    cmp r0, #0x47
    beq jump_8558
    cmp r0, #0x10
    beq jump_8558
    ldrb.w r2, [r8, #0x3e]
    mov r1, r8
    cmp r0, r2
    beq jump_8558
    cmp r0, #0x46
    beq jump_8558
    cmp r0, #0x42
    beq jump_8558
    cmp r0, #0x41
    beq jump_8558
    cmp r0, #0x40
    beq jump_8558
    strb.w sl, [r1, #0x29]
    strb.w r0, [r8, #0x3d]
    b jump_8554
jump_850c:
    bl function_80
    cmp r0, #1
    bne jump_8558
    movs r1, #0xc
jump_8516:
    strb.w r1, [r8, #0x29]
    b jump_8558
jump_851c:
    lsls r0, r5, #0x1f
    bne jump_8558
    add.w r0, r4, r6, lsl #3
    uxtb r0, r0
    cmp r0, #0x3e
    beq jump_8558
    cmp r0, #0x47
    beq jump_8558
    cmp r0, #0x10
    beq jump_8558
    ldrb.w r2, [r8, #0x3d]
    mov r1, r8
    cmp r0, r2
    beq jump_8558
    cmp r0, #0x46
    beq jump_8558
    cmp r0, #0x42
    beq jump_8558
    cmp r0, #0x41
    beq jump_8558
    cmp r0, #0x40
    beq jump_8558
    strb.w sl, [r1, #0x29]
    strb.w r0, [r8, #0x3e]
jump_8554:
    bl function_e_5
jump_8558:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    lsrs r7, r7, #1
    lsrs r5, r5, #1
    uxtb r4, r4
    cmp r4, #8
    blo.w jump_842c
    .short 0x1c76 /* adds r6, r6, #1 */ 
    uxtb r6, r6
    cmp r6, #9
    blo.w jump_841e
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_8574:
.word 0x20000058
data_8578:
.word 0x20002e2c
data_857c:
.word 0x20002de4

function_e_1:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r6, [pc, #0x17c] /* data_8704 */ 
    ldrb.w r0, [r6, #0x30]
    cbnz r0, jump_860a
    ldrb r1, [r6, #9]
    ldr r0, [pc, #0x178] /* data_8708 */ 
    mov.w lr, #0x3e8
    movs r2, #0
    cbz r1, jump_85b8
    ldrb r1, [r6, #9]
    cmp r1, #1
    beq jump_85b8
    strh.w r2, [r0, #0x52]
jump_85a2:
    ldr r1, [pc, #0x160] /* data_8704 */ 
    ldrb r4, [r6, #5]
    ldrb r3, [r1, #0x1f]
    mov.w r1, #0x1c2
    cbz r4, jump_85b4
    ldrb.w r4, [r6, #0x29]
    cbz r4, jump_85d8
jump_85b4:
    cbz r3, jump_85de
    b jump_85e0
jump_85b8:
    ldrh.w r1, [r6, #0x52]
    mov.w r3, #0x1c2
    rsb r1, r1, r1, lsl #16
    udiv r1, r1, lr
    muls r1, r3, r1
    movw r3, #0xffff
    udiv r1, r1, r3
    strh.w r1, [r0, #0x52]
    b jump_85a2
jump_85d8:
    cbnz r3, jump_85e0
    strh r1, [r0, #0x20]
    b jump_85e0
jump_85de:
    strh r2, [r0, #0x20]
jump_85e0:
    ldr.w ip, [pc, #0x120] /* data_8704 */ 
    add.w ip, ip, #0x80
    ldr.w r5, [ip, #0x34]
    ldr r3, [pc, #0x11c] /* data_870c */ 
    mov.w r4, #0x7d0
    cbz r5, jump_860c
    ldr.w r5, [ip, #0x34]
    udiv r7, r5, r4
    mls r5, r4, r7, r5
    cmp r5, lr
    bhs jump_8630
jump_8604:
    strh.w r1, [r0, #0x72]
    b jump_8634
jump_860a:
    b function_e_96
jump_860c:
    strh.w r2, [r0, #0x72]
    strh.w r2, [r3, #0x72]
    ldrb r5, [r6, #0x18]
    cmp r5, #1
    beq jump_8604
    cmp r5, #2
    beq jump_8624
    cmp r5, #3
    beq jump_862a
    b jump_8634
jump_8624:
    strh.w r1, [r3, #0x72]
    b jump_8634
jump_862a:
    strh.w r1, [r0, #0x72]
    b jump_8624
jump_8630:
    strh.w r2, [r0, #0x72]
jump_8634:
    ldrb r5, [r6, #0x16]
    cmp r5, #1
    beq jump_8662
    ldrb.w r4, [r6, #0x25]
    cmp r4, #1
    beq jump_86a2
    strh.w r2, [r0, #0x84]
    strh.w r2, [r3, #0x84]
function_e_96:
    movs r2, #0x90
    ldr r1, [pc, #0xb8] /* data_8708 */ 
    ldr r0, [pc, #0xc0] /* data_8710 */ 
    bl memcpy
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r2, #0x90
    ldr r1, [pc, #0xb0] /* data_870c */ 
    ldr r0, [pc, #0xb4] /* data_8714 */ 
    b.w memcpy
jump_8662:
    strb.w r2, [r6, #0x25]
    strh.w r2, [r0, #0x84]
    strh.w r2, [r3, #0x84]
    ldrb r2, [r6]
    cmp r2, #2
    blo jump_869c
    ldrb r2, [r6]
    cmp r2, #2
    beq jump_869c
    ldrb r2, [r6]
    cmp r2, #4
    bne function_e_96
    ldr.w r2, [ip, #0x24]
    cmp r2, lr
    bls jump_868c
    strh.w r1, [r0, #0x84]
jump_868c:
    ldr.w r0, [ip, #0x24]
    cmp r0, r4
    bls function_e_96
    movs r0, #1
    str.w r0, [ip, #0x24]
    b function_e_96
jump_869c:
    strh.w r1, [r0, #0x84]
    b function_e_96
jump_86a2:
    ldr.w r4, [ip, #0x24]
    bic r4, r4, #0xff000000
    cmp.w r4, #0x190
    bhs jump_86ba
    strh.w r1, [r0, #0x84]
    strh.w r1, [r3, #0x84]
    b function_e_96
jump_86ba:
    strh.w r2, [r0, #0x84]
    strh.w r2, [r3, #0x84]
    ldr.w r0, [ip, #0x24]
    bic r0, r0, #0xff000000
    cmp.w r0, #0x320
    bls function_e_96
    ldr.w r0, [ip, #0x24]
    and r0, r0, #0xf0000000
    str.w r0, [ip, #0x24]
    ldr.w r0, [ip, #0x24]
    add.w r0, r0, #0x10000000
    .short 0x1c40 /* adds r0, r0, #1 */ 
    str.w r0, [ip, #0x24]
    ldr.w r0, [ip, #0x24]
    and r0, r0, #0xf0000000
    cmp.w r0, #0x40000000
    bls function_e_96
    str.w r2, [ip, #0x24]
    strb.w r2, [r6, #0x25]
    b function_e_96

.byte 0x0
.byte 0x0

data_8704:
.word 0x20000058
data_8708:
.word 0x20002e2c
data_870c:
.word 0x20002ebc
data_8710:
.word 0x20002cc4
data_8714:
.word 0x20002d54

function_e_12:
    push {r4, lr}
    add.w r2, r2, r1, lsl #3
    ldr r3, [pc, #0x64] /* data_8784 */ 
    cmp r2, #0x10
    beq jump_873e
    ldrb.w r1, [r3, #0x2c]
    cmp r1, #1
    bne jump_873c
    ldr r3, [pc, #0x58] /* data_8788 */ 
    movs r1, #0
jump_8730:
    ldrb r4, [r3, r1]
    cmp r2, r4
    bne jump_8778
    ldr r0, [pc, #0x50] /* data_8788 */ 
    .short 0x1d00 /* adds r0, r0, #4 */ 
    ldrb r0, [r0, r1]
jump_873c:
    pop {r4, pc}
jump_873e:
    ldrb.w r1, [r3, #0x21]
    cmp r1, #1
    beq jump_875e
    ldrb.w r1, [r3, #0x24]
    cmp r1, #0xff
    beq jump_8768
    ldrb r2, [r3, #0x18]
    cbz r2, jump_8768
    cmp r1, #0x12
    beq jump_873c
    cmp r1, #0x13
    beq jump_873c
    movs r0, #0
    pop {r4, pc}
jump_875e:
    movs r0, #0
    strb.w r0, [r3, #0x21]
    movs r0, #0xe8
    pop {r4, pc}
jump_8768:
    ldrb.w r0, [r3, #0x26]
    cmp r0, #2
    beq jump_8774
    movs r0, #0x39
    pop {r4, pc}
jump_8774:
    movs r0, #0x2a
    pop {r4, pc}
jump_8778:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #4
    blo jump_8730
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_8784:
.word 0x20000058
data_8788:
.word data_4

function_e_13:
    push {r4, lr}
    add.w r2, r2, r1, lsl #3
    ldr r3, [pc, #0x60] /* data_87f4 */ 
    cmp r2, #0x10
    beq jump_87b2
    ldrb.w r1, [r3, #0x2c]
    cmp r1, #1
    bne jump_87b0
    ldr r3, [pc, #0x54] /* data_87f8 */ 
    movs r1, #0
jump_87a4:
    ldrb r4, [r3, r1]
    cmp r2, r4
    bne jump_87ea
    ldr r0, [pc, #0x4c] /* data_87f8 */ 
    .short 0x1d00 /* adds r0, r0, #4 */ 
    ldrb r0, [r0, r1]
jump_87b0:
    pop {r4, pc}
jump_87b2:
    ldrb r1, [r3, #0x1f]
    cmp r1, #1
    beq jump_87d0
    ldrb.w r1, [r3, #0x24]
    cmp r1, #0xff
    beq jump_87da
    ldrb r2, [r3, #0x18]
    cbz r2, jump_87da
    cmp r1, #0x12
    beq jump_87b0
    cmp r1, #0x13
    beq jump_87b0
    movs r0, #0
    pop {r4, pc}
jump_87d0:
    movs r0, #1
    strb.w r0, [r3, #0x21]
    movs r0, #0xe8
    pop {r4, pc}
jump_87da:
    ldrb.w r0, [r3, #0x26]
    cmp r0, #2
    beq jump_87e6
    movs r0, #0x39
    pop {r4, pc}
jump_87e6:
    movs r0, #0x2a
    pop {r4, pc}
jump_87ea:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #4
    blo jump_87a4
    pop {r4, pc}

data_87f4:
.word 0x20000058
data_87f8:
.word data_4

function_e_15:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0x84] /* data_8888 */ 
    movs r0, #1
    ldr r6, [pc, #0x84] /* data_888c */ 
    ldrb.w r1, [r5, #0x30]
    ldr r7, [pc, #0x84] /* data_8890 */ 
    .short 0x1e89 /* subs r1, r1, #2 */ 
    mov.w r4, #0x3e8
    movw r8, #0xffff
    cmp r1, #5
    bhs jump_8864
    tbb [pc, r1]

.byte 0x3
.byte 0x5
.byte 0xb
.byte 0x25
.byte 0x2b
.byte 0x0

switch_8824:
    movs r1, #0x64
    b jump_882c
switch_8828:
    mov.w r1, #0x1f4
jump_882c:
    add.w r5, r5, #0x38
    strh r1, [r5, #0x10]
    b jump_883a
switch_8834:
    add.w r5, r5, #0x38
    strh r4, [r5, #0x10]
jump_883a:
    strb r0, [r5, #1]
    mov.w r0, #1
    bl function_e_18
    ldrh r0, [r5, #0x10]
    mov.w r1, #0x1c2
    rsb r0, r0, r0, lsl #16
    udiv r0, r0, r4
    muls r0, r1, r0
    udiv r0, r0, r8
    strh r0, [r6, #0x72]!
    strh r0, [r7, #0x72]!
    strh r0, [r6, #0x12]
    strh r0, [r7, #0x12]
jump_8864:
    pop.w {r4, r5, r6, r7, r8, pc}
switch_8868:
    add.w r5, r5, #0x38
    mov.w r0, #5
    strh r4, [r5, #0x10]
    b jump_887e
switch_8874:
    add.w r5, r5, #0x38
    mov.w r0, #6
    strh r4, [r5, #0x10]
jump_887e:
    strb r0, [r5, #1]
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w function_e_18

data_8888:
.word 0x20000058
data_888c:
.word 0x20002e2c
data_8890:
.word 0x20002ebc

call_8894:
    push {lr}
    ldr r1, [pc, #0x20] /* data_88b8 */ 
    movs r0, #0
jump_889a:
    adds r2, r1, r0
    ldrb r2, [r2, #0x14]
    cmp r2, #0xff
    beq jump_88a6
    movs r0, #0
    pop {pc}
jump_88a6:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_889a
    bl function_e_83
    movs r0, #1
    pop {pc}

.byte 0x0
.byte 0x0

data_88b8:
.word 0x20002de4

function_80:
    ldr r2, [pc, #0x28] /* data_88e8 */ 
    movs r0, #0
    movs r1, #0xb8
    ldrb r3, [r2, #0xa]
    bics r1, r3
    b jump_88cc
jump_88c8:
    cmp r0, #8
    beq jump_88d8
jump_88cc:
    adds r3, r2, r0
    ldrb r3, [r3, #2]
    cmp r3, #0xff
    beq jump_88dc
jump_88d4:
    movs r0, #0
    bx lr
jump_88d8:
    cmp r1, #0
    bne jump_88d4
jump_88dc:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_88c8
    movs r0, #1
    bx lr

data_88e8:
.word 0x20002de4

function_26:
    ldr r1, [pc, #0x40] /* data_8930 */ 
    push {r4, lr}
    ldrb.w r2, [r1, #0x3e]
    movs r0, #0
    ldr r4, [pc, #0x34] /* data_892c */ 
    movs r3, #1
    and r1, r2, #7
    lsls r3, r1
jump_8900:
    adds r1, r4, r0
    cmp r0, #8
    ldrb r1, [r1, #2]
    bne jump_890c
    orr r1, r1, #0x47
jump_890c:
    cmp.w r0, r2, lsr #3
    bne jump_8916
    orrs r1, r3
    uxtb r1, r1
jump_8916:
    cmp r1, #0xff
    beq jump_891e
    movs r0, #0
    pop {r4, pc}
jump_891e:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #9
    blo jump_8900
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_892c:
.word 0x20002de4
data_8930:
.word 0x20000058

function_e_97:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    subs r4, r1, r0
    mov r7, r0
    mov r6, r2
    .short 0x1c64 /* adds r4, r4, #1 */ 
    bl watchdog_reload_timer
    ubfx r5, r7, #0, #0xc
    subs r0, r7, r5
    mov r8, r0
    mov.w sb, #0x1000
    mov r1, r0
    mov r2, sb
    ldr r0, [pc, #0x3c] /* data_8994 */ 
    bl spi_flash_read_data
    bl watchdog_reload_timer
    mov r0, r8
    bl function_e_40
    bl watchdog_reload_timer
    ldr r1, [pc, #0x28] /* data_8994 */ 
    movs r0, #0
    add.w r2, r1, #0x1000
    b jump_897c
jump_8972:
    adds r3, r0, r6
    adds r7, r5, r0
    ldrb r3, [r2, r3]
    strb r3, [r1, r7]
    .short 0x1c40 /* adds r0, r0, #1 */ 
jump_897c:
    cmp r0, r4
    blo jump_8972
    mov r2, sb
    mov r1, r8
    ldr r0, [pc, #0xc] /* data_8994 */ 
    bl function_27
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    b.w watchdog_reload_timer

.byte 0x0
.byte 0x0

data_8994:
.word 0x20000cba

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

usb_report2_desc:
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
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x2
.byte 0xa1
.byte 0x1
.byte 0x9
.byte 0x1
.byte 0xa1
.byte 0x0
.byte 0x85
.byte 0x3
.byte 0x5
.byte 0x9
.byte 0x19
.byte 0x1
.byte 0x29
.byte 0x3
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x75
.byte 0x1
.byte 0x95
.byte 0x3
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x5
.byte 0x81
.byte 0x1
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x30
.byte 0x9
.byte 0x31
.byte 0x15
.byte 0x81
.byte 0x25
.byte 0x7f
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x2
.byte 0x81
.byte 0x6
.byte 0x9
.byte 0x38
.byte 0x15
.byte 0x81
.byte 0x25
.byte 0x7f
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x1
.byte 0x81
.byte 0x6
.byte 0xc0
.byte 0xc0
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x6
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x4
.byte 0x5
.byte 0x7
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x8
.byte 0x81
.byte 0x3
.byte 0x95
.byte 0xe8
.byte 0x75
.byte 0x1
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0x0
.byte 0x29
.byte 0xe7
.byte 0x81
.byte 0x0
.byte 0xc0
.byte 0x0
.byte 0x0

usb_device_desc:
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
.byte 0x41
.byte 0x1
.byte 0x17
.byte 0x1
.byte 0x0
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
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
.byte 0xc6
.byte 0x0
.byte 0x7
.byte 0x5
.byte 0x82
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0

usb_str0_desc:
.byte 0x4
.byte 0x3
.byte 0x9
.byte 0x4

usb_str1_desc:
.byte 0x1a
.byte 0x3
.byte 0x55
.byte 0x0
.byte 0x53
.byte 0x0
.byte 0x42
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x4b
.byte 0x0
.byte 0x65
.byte 0x0
.byte 0x79
.byte 0x0
.byte 0x62
.byte 0x0
.byte 0x6f
.byte 0x0
.byte 0x61
.byte 0x0
.byte 0x72
.byte 0x0
.byte 0x64
.byte 0x0
.byte 0x0
.byte 0x0

update_handlers:
.byte 0x79
.byte 0x71
.byte 0x0
.byte 0x0
.byte 0xb9
.byte 0x71
.byte 0x0
.byte 0x0
.byte 0x59
.byte 0x71
.byte 0x0
.byte 0x0
.byte 0x9d
.byte 0x72
.byte 0x0
.byte 0x0
.byte 0x69
.byte 0x30
.byte 0x0
.byte 0x0
.byte 0x55
.byte 0x71
.byte 0x0
.byte 0x0
.byte 0x71
.byte 0x59
.byte 0x0
.byte 0x0

data_4:
.byte 0x3e
.byte 0x47
.byte 0x45
.byte 0x44
.byte 0x52
.byte 0x4f
.byte 0x51
.byte 0x50
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x7
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x5
.byte 0x4
.byte 0x1
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x3
.byte 0x3
.byte 0x7
.byte 0x7
.byte 0x7
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x3
.byte 0x8
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x3
.byte 0x3
.byte 0x3

data_8:
.byte 0x7
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x7
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x1
.byte 0x6
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x0
.byte 0x6
.byte 0x7
.byte 0x7
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x29
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x41
.byte 0x42
.byte 0x43
.byte 0x44
.byte 0x45
.byte 0x4c
.byte 0x4b
.byte 0x52
.byte 0x4e
.byte 0x46
.byte 0x47
.byte 0x48
.byte 0x50
.byte 0x51
.byte 0x4f
.byte 0x49
.byte 0x4c
.byte 0x65
.byte 0x4d
.byte 0xc1
.byte 0xc2
.byte 0xc3
.byte 0x4a
.byte 0x35
.byte 0xee
.byte 0xc0
.byte 0xe4
.byte 0xf5
.byte 0xf6
.byte 0xf4
.byte 0xf2
.byte 0xf0
.byte 0xf3
.byte 0xc5
.byte 0xc6
.byte 0xc4
.byte 0x29
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x41
.byte 0x42
.byte 0x43
.byte 0x44
.byte 0x45
.byte 0x4c
.byte 0x4b
.byte 0x52
.byte 0x4e
.byte 0x46
.byte 0x47
.byte 0x48
.byte 0x50
.byte 0x51
.byte 0x4f
.byte 0x49
.byte 0x4c
.byte 0x65
.byte 0x4d
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4a
.byte 0x35
.byte 0xee
.byte 0x0
.byte 0x0
.byte 0xf5
.byte 0xf6
.byte 0xf4
.byte 0xf2
.byte 0xf0
.byte 0xf3
.byte 0x0
.byte 0x0
.byte 0x0

data_13:
.byte 0x7
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x5
.byte 0x4
.byte 0x1
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x3
.byte 0x3
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x7
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x7
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x1
.byte 0x6
.byte 0x6
.byte 0x0
.byte 0x6
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x29
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x41
.byte 0x42
.byte 0x43
.byte 0x44
.byte 0x45
.byte 0x4c
.byte 0x4b
.byte 0x52
.byte 0x4e
.byte 0x46
.byte 0x47
.byte 0x48
.byte 0x50
.byte 0x51
.byte 0x4f
.byte 0x49
.byte 0x4c
.byte 0x65
.byte 0x4d
.byte 0x4a
.byte 0x35
.byte 0xee
.byte 0x17
.byte 0xa
.byte 0x5
.byte 0xf5
.byte 0xf6
.byte 0xf4
.byte 0xf2
.byte 0xf0
.byte 0xf3
.byte 0xc5
.byte 0xc6
.byte 0xc4
.byte 0x29
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x41
.byte 0x42
.byte 0x43
.byte 0x44
.byte 0x45
.byte 0x4c
.byte 0x4b
.byte 0x52
.byte 0x4e
.byte 0x46
.byte 0x47
.byte 0x48
.byte 0x50
.byte 0x51
.byte 0x4f
.byte 0x49
.byte 0x4c
.byte 0x65
.byte 0x4d
.byte 0x4a
.byte 0x35
.byte 0xee
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xf5
.byte 0xf6
.byte 0xf4
.byte 0xf2
.byte 0xf0
.byte 0xf3
.byte 0x0
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
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
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
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
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
.byte 0x1
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
.byte 0x7
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x2
.byte 0x7

data_15:
.byte 0x7
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x5
.byte 0x4
.byte 0x0
.byte 0x0

data_3:
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x4
.byte 0x0

data_16:
.byte 0x0
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x18
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x70
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xc0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xc8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xd0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x70
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x78
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x80
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0xd0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x38
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x90
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0xe0
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0xe8
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0xf0
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x90
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x98
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0xa0
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0xf0
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x50
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x58
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x60
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0xb0
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0x8
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0x10
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0x60
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0xb0
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0xb8
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0xc0
.byte 0x5
.byte 0x0
.byte 0x0
.byte 0x10
.byte 0x6
.byte 0x0

data_12:
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xc
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
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
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
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
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
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
.byte 0x1
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

data_10:
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x8
.byte 0x1c
.byte 0x1b
.byte 0x1a
.byte 0x19
.byte 0x18
.byte 0x17
.byte 0x16
.byte 0x15
.byte 0x1d
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x35
.byte 0x34
.byte 0x33
.byte 0x32
.byte 0x31
.byte 0x30
.byte 0x2f
.byte 0x2e
.byte 0x36
.byte 0x37
.byte 0x38
.byte 0x9
.byte 0xa
.byte 0xb
.byte 0xc
.byte 0xe
.byte 0x0
.byte 0x0
.byte 0xd
.byte 0x14
.byte 0x13
.byte 0x12
.byte 0x11
.byte 0xf
.byte 0x0
.byte 0x0
.byte 0x10
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x28
.byte 0x29
.byte 0x0
.byte 0x39
.byte 0x3b
.byte 0x2d
.byte 0x2c
.byte 0x2b
.byte 0x2a
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x3c
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x0
.byte 0x41

data_7:
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
.byte 0xce
.byte 0xcd
.byte 0xcc
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0xcb
.byte 0xe4

data_5:
.byte 0x29
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x2b
.byte 0x34
.byte 0x36
.byte 0x37
.byte 0x13
.byte 0x1c
.byte 0x9
.byte 0xa
.byte 0x39
.byte 0x4
.byte 0x12
.byte 0x8
.byte 0x18
.byte 0xc
.byte 0x7
.byte 0xb
.byte 0xe1
.byte 0x33
.byte 0x14
.byte 0xd
.byte 0xe
.byte 0x1b
.byte 0x5
.byte 0x10
.byte 0xe0
.byte 0xe3
.byte 0xe2
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x2f
.byte 0x2a
.byte 0x64
.byte 0x0
.byte 0x30
.byte 0x6
.byte 0x15
.byte 0xf
.byte 0x38
.byte 0x31
.byte 0x0
.byte 0x0
.byte 0x2e
.byte 0x17
.byte 0x11
.byte 0x16
.byte 0x2d
.byte 0x28
.byte 0x0
.byte 0x0
.byte 0x2c
.byte 0x1a
.byte 0x19
.byte 0x1d
.byte 0xe5
.byte 0x35
.byte 0xce
.byte 0xcd
.byte 0xcc
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0xcb
.byte 0xe4

data_6:
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
.byte 0x9
.byte 0x13
.byte 0xa
.byte 0xd
.byte 0xf
.byte 0x2a
.byte 0x4
.byte 0x15
.byte 0x16
.byte 0x17
.byte 0x7
.byte 0xb
.byte 0x11
.byte 0xe1
.byte 0x1d
.byte 0x1b
.byte 0x6
.byte 0x19
.byte 0x5
.byte 0xe
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
.byte 0x18
.byte 0x1c
.byte 0x33
.byte 0x2f
.byte 0x31
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0x8
.byte 0xc
.byte 0x12
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
.byte 0xce
.byte 0xcd
.byte 0xcc
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0xcb
.byte 0xe4

data_14:
.byte 0x20
.byte 0x10
.byte 0x40
.byte 0x80
.byte 0x1
.byte 0x2
.byte 0x4
.byte 0x8

data_9:
.byte 0x0
.byte 0x60
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
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x2
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
.byte 0x10
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
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0

task_1:
.word sram_init_data
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x34
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x2e
.byte 0x0
.byte 0x0

task_2:
.word data_90d4
.byte 0x34
.byte 0x2
.byte 0x0
.byte 0x20
.byte 0x2c
.byte 0x35
.byte 0x0
.byte 0x0
.byte 0xc0
.byte 0x74
.byte 0x0
.byte 0x0

sram_init_data:
.byte 0x41
.byte 0x2
.byte 0x17
.byte 0x1
.byte 0x29
.byte 0x18
.byte 0x69
.byte 0x4
.byte 0x1
.byte 0x1c
.byte 0x63
.byte 0x34
.byte 0x8b
.byte 0x5a
.byte 0x38
.byte 0x8
.byte 0xa1
.byte 0x1a
.byte 0x2
.byte 0x3
.byte 0x62
.byte 0x63
.byte 0x59
.byte 0x7
.byte 0x1
.byte 0x27
.byte 0x3
.byte 0x15
.byte 0x2a
.byte 0x4c
.byte 0x4
.byte 0x5f
.byte 0x39
.byte 0xe8
.byte 0xe0
.byte 0x2c
.byte 0x8
.byte 0x4
.byte 0x8
.byte 0x1
.byte 0x11
.byte 0x28
.byte 0xe
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x5
.byte 0x5
.byte 0x7
.byte 0xe0
.byte 0xe3
.byte 0xe2
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0xe4
.byte 0x12
.byte 0x19
.byte 0x18
.byte 0x17
.byte 0x7
.byte 0x5
.byte 0x3
.byte 0x2
.byte 0x1
.byte 0x5
.byte 0x38
.byte 0xa
.byte 0xe4
.byte 0xe7
.byte 0xe6
.byte 0xe2
.byte 0xe3
.byte 0x65
.byte 0xe0
.byte 0x6
.byte 0x4
.byte 0xe
.byte 0x51
.byte 0x2
.byte 0x19
.byte 0x1
.byte 0x12
.byte 0x47
.byte 0x12
.byte 0x8e
.byte 0x12
.byte 0xd5
.byte 0x48
.byte 0x18
.byte 0x1c
.byte 0x1
.byte 0x63
.byte 0x1
.byte 0xaa
.byte 0x1
.byte 0xf1
.byte 0x1
.byte 0x38
.byte 0x2
.byte 0x7f
.byte 0x2
.byte 0xc6
.byte 0x2
.byte 0xd
.byte 0x3
.byte 0x54
.byte 0x3
.byte 0x9b
.byte 0x3
.byte 0xe8
.byte 0x3
.byte 0xff
.byte 0x1
.byte 0x83
.byte 0xbf
.byte 0x7f
.byte 0x5a
.byte 0x1
.byte 0x1
.byte 0x5a
.byte 0x2
.byte 0x1
.byte 0x5a
.byte 0x3
.byte 0x1
.byte 0xe9
.byte 0x20
.byte 0x4c
.byte 0xa
.byte 0xa
.byte 0x4
.byte 0x20
.byte 0x3b
.byte 0x4
.byte 0x4
.byte 0x20
.byte 0x5a
.byte 0x4
.byte 0x1
.byte 0xf1
.byte 0x18
.byte 0xa
.byte 0x90
.byte 0xd0
.byte 0x2
.byte 0x40
.byte 0x90
.byte 0xf0
.byte 0x6
.byte 0x40
.byte 0x94
.byte 0x4
.byte 0x1a
.byte 0x98
.byte 0x4
.byte 0x1e
.byte 0x9c
.byte 0xe0
.byte 0x6
.byte 0x40
.byte 0x90
.byte 0x4
.byte 0x1a
.byte 0x94
.byte 0x4
.byte 0x1a
.byte 0x98
.byte 0x4
.byte 0x1e
.byte 0x9c
.byte 0xc0
.byte 0x2
.byte 0x40
.byte 0x98
.byte 0x4
.byte 0x2a
.byte 0x9c
.byte 0x24
.byte 0x29
.byte 0x2c
.byte 0x19
.byte 0xc
.byte 0x2a
.byte 0x94
.byte 0x14
.byte 0x19
.byte 0xc
.byte 0x1a
.byte 0x9c
.byte 0x4
.byte 0x81
.byte 0xcb
.byte 0xa0
.byte 0xf
.byte 0xe6

data_90d4:

