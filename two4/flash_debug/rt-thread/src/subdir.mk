################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/src/clock.c \
../rt-thread/src/components.c \
../rt-thread/src/idle.c \
../rt-thread/src/ipc.c \
../rt-thread/src/irq.c \
../rt-thread/src/kservice.c \
../rt-thread/src/mem.c \
../rt-thread/src/mempool.c \
../rt-thread/src/object.c \
../rt-thread/src/scheduler_up.c \
../rt-thread/src/thread.c \
../rt-thread/src/timer.c 

OBJS += \
./rt-thread/src/clock.o \
./rt-thread/src/components.o \
./rt-thread/src/idle.o \
./rt-thread/src/ipc.o \
./rt-thread/src/irq.o \
./rt-thread/src/kservice.o \
./rt-thread/src/mem.o \
./rt-thread/src/mempool.o \
./rt-thread/src/object.o \
./rt-thread/src/scheduler_up.o \
./rt-thread/src/thread.o \
./rt-thread/src/timer.o 

C_DEPS += \
./rt-thread/src/clock.d \
./rt-thread/src/components.d \
./rt-thread/src/idle.d \
./rt-thread/src/ipc.d \
./rt-thread/src/irq.d \
./rt-thread/src/kservice.d \
./rt-thread/src/mem.d \
./rt-thread/src/mempool.d \
./rt-thread/src/object.d \
./rt-thread/src/scheduler_up.d \
./rt-thread/src/thread.d \
./rt-thread/src/timer.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/src/%.o: ../rt-thread/src/%.c
	riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-strict-align -mno-save-restore -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -gdwarf-2 -DDEBUG -DUSE_NONVECTOR_MODE=1 -DFLASH_XIP=1 -I"F:\RT-ThreadStudio\workspace\two4" -I"F:\RT-ThreadStudio\workspace\two4\applications" -I"F:\RT-ThreadStudio\workspace\two4\board" -I"F:\RT-ThreadStudio\workspace\two4\libraries\drivers" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\arch" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\debug_console" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\dma_mgr" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\touch" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\usb" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\drivers\inc" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\HPM5361\boot" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\HPM5361" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\ip" -I"F:\RT-ThreadStudio\workspace\two4\libraries\misc\rtt_interrupt_util" -I"F:\RT-ThreadStudio\workspace\two4\libraries\misc\rtt_os_tick" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\drivers\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\compilers\common\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\compilers\newlib" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\epoll" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\eventfd" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\poll" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\ipc" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\libcpu\risc-v\common" -I"F:\RT-ThreadStudio\workspace\two4\startup\HPM5361" -include"F:\RT-ThreadStudio\workspace\two4\rtconfig_preinc.h" -std=gnu11 -ffunction-sections -fdata-sections -fno-common   -mcmodel=medlow -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

