#ifndef BOARD_H
#define BOARD_H

#define REG(A) (*(volatile u32*)(A))

#define STRUCT_SIZE_ASSERT(N, S) _Static_assert(sizeof(N) == S, "incorrect packed struct size")
#define STRUCT_ADDR_ASSERT(F, A) _Static_assert((u32)(&(F)) == (A), "incorrect packed struct field address")
#define STRUCT_REG_CHECK(M, R) STRUCT_ADDR_ASSERT(REG_##M->R, M##_##R)

#define STRUCT_REGISTER_START typedef union { struct
#define STRUCT_REGISTER_END __attribute__((packed)) __attribute__ ((aligned(4))); u32 word; }

#define STRUCT_REG_PTR(N) ((volatile N##_map *)N##_BASE)

#define SET_REG(A, M, O, D) REG(A) |= (D << O & M)
#define GET_REG(A, M, O, D) REG(A) |= (D << O & M)

#define MIN(A, B) ((A) < (B) ? (A) : (B))
#define MAX(A, B) ((A) > (B) ? (A) : (B))

#define NULL ((void*)0)

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;

#endif // BOARD_H
