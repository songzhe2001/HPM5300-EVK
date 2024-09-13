/*
 * Copyright (c) 2021 hpmicro
 *
 * Change Logs:
 * Date         Author          Notes
 * 2021-08-13   Fan YANG        first version
 *
 */

#include <rtthread.h>
#include <rtdevice.h>
#include "rtt_board.h"
#include "myapp.h"

void thread_entry(void *arg);

extern rt_device_t rt;
extern rt_device_t rt0;

extern struct serial_configure config;
extern struct rt_semaphore rx_sem;
extern struct rt_semaphore rx0_sem;


int main(void)
{

    app_init_led_pins();

    static uint32_t led_thread_arg = 0;
    rt_thread_t led_thread = rt_thread_create("led_th", thread_entry, &led_thread_arg, 1024, 1, 10);
    rt_thread_startup(led_thread);



    uart_sz_init();
    adc_sz_init();

    return 0;
}


void thread_entry(void *arg)
{
    while(1){
        app_led_write(0, APP_LED_ON);
        rt_thread_mdelay(100);
        app_led_write(0, APP_LED_OFF);
        rt_thread_mdelay(100);
    }
}
