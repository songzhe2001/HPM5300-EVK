/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-09-07     15658       the first version
 */
#ifndef APPLICATIONS_MYAPP_H_
#define APPLICATIONS_MYAPP_H_

#include <rtthread.h>
#include <rtdevice.h>
#include "rtt_board.h"

#define SAMPLE_UART_NAME "uart2"
#define SAMPLE_UART0_NAME "uart0"

#ifdef BSP_USING_ADC16
#include "hpm_adc16_drv.h"
#endif

#define ADC_DEV_NAME        "adc0"
#define ADC_DEV_CHANNEL     15
#define REFER_VOLTAGE       330 /*3.3v*/

#ifdef BSP_USING_ADC12
#include "hpm_adc12_drv.h"
#endif
#ifdef BSP_USING_ADC16
#define CONVERT_BITS        (1 << 16) /*16 bit*/
#endif

void uart_sz_init(void);

rt_err_t uart_input(rt_device_t dev, rt_size_t size);
rt_err_t uart0_input(rt_device_t dev, rt_size_t size);

char serial_thread_entry(void );
char serial0_thread_entry(void );

void data_parsing(void);
void data0_parsing(void);


void adc_sz_init(void);
void adc_print(void);
void adc_get(void);



#endif /* APPLICATIONS_MYAPP_H_ */
