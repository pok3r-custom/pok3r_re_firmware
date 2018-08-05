# Makefile for Cortex-M3

# STOP EDITING THIS FILE RIGHT NOW
# SERIOUSLY
# PLEASE.

# App name
APP_NAME = unlocker

# Directories
SRC_DIR = .
BIN_DIR = build

# Input Files
LD_SCRIPT = $(SRC_DIR)/ht32f1655.ld

ALL_SRCS = \
    board/startup.s \
    main.c

# Output Files
OUT_ELF = $(BIN_DIR)/$(APP_NAME).elf
OUT_BIN = $(BIN_DIR)/$(APP_NAME).bin
OUT_MAP = $(BIN_DIR)/$(APP_NAME).map

# Intermediary files
CC_SRCS = $(filter %.c, $(ALL_SRCS))
CC_DEPS = $(patsubst %.c, %.d, $(CC_SRCS))

AS_SRCS += $(filter %.s %.S, $(ALL_SRCS))

CC_OBJS = $(addprefix $(BIN_DIR)/, $(patsubst %.c, %.o, $(CC_SRCS)))
AS_OBJS += $(addprefix $(BIN_DIR)/, $(patsubst %.s, %.o, $(filter %.s, $(AS_SRCS))))
AS_OBJS += $(addprefix $(BIN_DIR)/, $(patsubst %.S, %.o, $(filter %.S, $(AS_SRCS))))

ALL_OBJS += $(CC_OBJS)
ALL_OBJS += $(AS_OBJS)

# Config
ARM_CPU = cortex-m3

# Commands
CC = arm-none-eabi-gcc
CXX = arm-none-eabi-g++
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy

RM = rm -f
MKDIR = mkdir -p

# Options

C_OPTS += -Wall -g -Os
C_OPTS += -mcpu=$(ARM_CPU) -mthumb -nostdlib -nostartfiles
C_OPTS += -ffreestanding -fstrict-volatile-bitfields
C_OPTS += -MMD -MP -MF $(BIN_DIR)/$*.d
C_OPTS += -DFW_BUILDING

CC_FLAGS += -std=c11 $(C_OPTS)
CXX_FLAGS += -std=c++11 $(C_OPTS)

AS_FLAGS += -mcpu=$(ARM_CPU) -mthumb -g 

LD_FLAGS += -nostdlib -nostartfiles -nodefaultlibs -T $(LD_SCRIPT) -Map $(OUT_MAP)

# Targets

all: | dirs $(OUT_BIN)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.s
	$(info AS   $(notdir $<))
	$(AS) $(AS_FLAGS) -o $@ $<

$(BIN_DIR)/%.o: $(SRC_DIR)/%.S
	$(info GAS  $(notdir $<))
	$(CC) -c $(AS_FLAGS) -o $@ $<

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	$(info CC   $(notdir $<))
	$(CC) -c $(CC_FLAGS) -o $@ $<

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(info CXX  $(notdir $<))
	$(CXX) -c $(CXX_FLAGS) -o $@ $<

$(OUT_ELF): $(LD_SCRIPT) $(ALL_OBJS)
	$(info LINK $(notdir $@))
	$(LD) $(LD_FLAGS) -o $@ $(ALL_OBJS)
	@size -B $@

$(OUT_BIN): $(OUT_ELF)
	$(info BIN  $(notdir $@))
	$(OC) $(OUT_ELF) -O binary $(OUT_BIN)

dirs:
	$(foreach d, $(ALL_OBJS), $(MKDIR) $(dir $(d));)

clean:
	$(RM) $(ALL_OBJS)
	$(RM) $(CC_DEPS)
	$(RM) $(OUT_ELF)
	$(RM) $(OUT_MAP)
	$(RM) $(OUT_BIN)

print-%:
	@echo $* = $($*)
	
disas:
# 	../../reassemble-build/reassemble -a 0x2c00 -s unlocker.sym unlocker.bin unlocker.s -AEOV
	arm-none-eabi-objdump -D -EL -b binary -m arm -M force-thumb -z --adjust-vma=0x2c00 unlocker.bin

-include $(CC_DEPS)

.PHONY: all dirs clean
