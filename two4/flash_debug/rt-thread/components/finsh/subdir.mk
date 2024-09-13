################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/components/finsh/cmd.c \
../rt-thread/components/finsh/msh.c \
../rt-thread/components/finsh/msh_parse.c \
../rt-thread/components/finsh/shell.c 

OBJS += \
./rt-thread/components/finsh/cmd.o \
./rt-thread/components/finsh/msh.o \
./rt-thread/components/finsh/msh_parse.o \
./rt-thread/components/finsh/shell.o 

C_DEPS += \
./rt-thread/components/finsh/cmd.d \
./rt-thread/components/finsh/msh.d \
./rt-thread/components/finsh/msh_parse.d \
./rt-thread/components/finsh/shell.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/components/finsh/%.o: ../rt-thread/components/finsh/%.c
	riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-strict-align -mno-save-restore -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -gdwarf-2 -DDEBUG -DUSE_NONVECTOR_MODE=1 -DFLASH_XIP=1 -I"F:\RT-ThreadStudio\workspace\one" -I"F:\RT-ThreadStudio\workspace\one\applications" -I"F:\RT-ThreadStudio\workspace\one\board" -I"F:\RT-ThreadStudio\workspace\one\libraries\drivers" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\arch" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\components\debug_console" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\components\dma_mgr" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\components\touch" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\components\usb" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\drivers\inc" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\soc\HPM5300\HPM5361\boot" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\soc\HPM5300\HPM5361" -I"F:\RT-ThreadStudio\workspace\one\libraries\hpm_sdk\soc\HPM5300\ip" -I"F:\RT-ThreadStudio\workspace\one\libraries\misc\rtt_interrupt_util" -I"F:\RT-ThreadStudio\workspace\one\libraries\misc\rtt_os_tick" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\drivers\include" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\finsh" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\compilers\common\include" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\compilers\newlib" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\posix\io\epoll" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\posix\io\eventfd" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\posix\io\poll" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\components\libc\posix\ipc" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\include" -I"F:\RT-ThreadStudio\workspace\one\rt-thread\libcpu\risc-v\common" -I"F:\RT-ThreadStudio\workspace\one\startup\HPM5361" -include"F:\RT-ThreadStudio\workspace\one\rtconfig_preinc.h" -std=gnu11 -ffunction-sections -fdata-sections -fno-common   -mcmodel=medlow -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

