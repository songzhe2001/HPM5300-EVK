################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/hpm_sdk/components/dma_mgr/hpm_dma_mgr.c 

OBJS += \
./libraries/hpm_sdk/components/dma_mgr/hpm_dma_mgr.o 

C_DEPS += \
./libraries/hpm_sdk/components/dma_mgr/hpm_dma_mgr.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/hpm_sdk/components/dma_mgr/%.o: ../libraries/hpm_sdk/components/dma_mgr/%.c
	riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-strict-align -mno-save-restore -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -gdwarf-2 -DDEBUG -DUSE_NONVECTOR_MODE=1 -DFLASH_XIP=1 -I"F:\RT-ThreadStudio\workspace\two4" -I"F:\RT-ThreadStudio\workspace\two4\applications" -I"F:\RT-ThreadStudio\workspace\two4\board" -I"F:\RT-ThreadStudio\workspace\two4\libraries\drivers" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\arch" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\debug_console" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\dma_mgr" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\touch" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\components\usb" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\drivers\inc" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\HPM5361\boot" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\HPM5361" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\ip" -I"F:\RT-ThreadStudio\workspace\two4\libraries\misc\rtt_interrupt_util" -I"F:\RT-ThreadStudio\workspace\two4\libraries\misc\rtt_os_tick" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\drivers\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\compilers\common\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\compilers\newlib" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\epoll" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\eventfd" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\io\poll" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\components\libc\posix\ipc" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\include" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\libcpu\risc-v\common" -I"F:\RT-ThreadStudio\workspace\two4\startup\HPM5361" -include"F:\RT-ThreadStudio\workspace\two4\rtconfig_preinc.h" -std=gnu11 -ffunction-sections -fdata-sections -fno-common   -mcmodel=medlow -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

