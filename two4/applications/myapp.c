/*
 * Copyright (c) 2006-2021, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-09-07     15658       the first version
 */

#include <rtthread.h>
#include <rtdevice.h>
#include "hpm_gpio_drv.h"
#include "rtt_board.h"
#include "myapp.h"


#define ONE_DATA_MAXLEN 20
#define DATA_CMD_END '\n'
//
//rt_device_t serial;
//rt_device_t serial0;

rt_thread_t thread_adc_get,thread_adc;

rt_device_t rt;
rt_device_t rt0;

rt_adc_device_t adc_dev;
rt_uint32_t value, vol;

uint8_t state_adc=0;
char str[] = "hello\n";
struct serial_configure uart_config = RT_SERIAL_CONFIG_DEFAULT;
struct rt_semaphore rx_sem;
struct rt_semaphore rx0_sem;

void uart_sz_init(void)
{
    uart_config.baud_rate=460800;
    uart_config.data_bits = DATA_BITS_8;
    uart_config.stop_bits = STOP_BITS_1;
    uart_config.rx_bufsz = 128;
    uart_config.parity = PARITY_NONE;

    rt = rt_device_find(SAMPLE_UART_NAME);
    rt_device_control(rt, RT_DEVICE_CTRL_CONFIG, &uart_config);
    rt_device_open(rt, RT_DEVICE_FLAG_INT_RX);
    rt_sem_init(&rx_sem, "rx_sem", 0, RT_IPC_FLAG_FIFO);
    rt_device_set_rx_indicate(rt, uart_input);
    rt_thread_t thread = rt_thread_create("serial", (void (*)(void *parameter))data_parsing, RT_NULL,1024, 25, 10);
    rt_thread_startup(thread);

    rt0 = rt_device_find(SAMPLE_UART0_NAME);
    rt_device_control(rt0, RT_DEVICE_CTRL_CONFIG, &uart_config);
    rt_device_open(rt0, RT_DEVICE_FLAG_INT_RX);
    rt_sem_init(&rx0_sem, "rx_sem", 0, RT_IPC_FLAG_FIFO);
    rt_device_set_rx_indicate(rt0, uart0_input);
    rt_thread_t thread0 = rt_thread_create("serial0", (void (*)(void *parameter))data0_parsing, RT_NULL,1024, 25, 10);
    rt_thread_startup(thread0);
}

rt_err_t uart_input(rt_device_t dev, rt_size_t size)
{
    /* 串 口 接 收 到 数 据 后 产 生 中 断， 调 用 此 回 调 函 数， 然 后 发 送 接 收 信 号 量 */
    rt_sem_release(&rx_sem);
    return RT_EOK;
}

rt_err_t uart0_input(rt_device_t dev, rt_size_t size)
{
    /* 串 口 接 收 到 数 据 后 产 生 中 断， 调 用 此 回 调 函 数， 然 后 发 送 接 收 信 号 量 */
    rt_sem_release(&rx0_sem);
    return RT_EOK;
}



char serial_thread_entry(void )
{
    char ch;

    /* 从 串 口 读 取 一 个 字 节 的 数 据， 没 有 读 取 到 则 等 待 接 收 信 号 量 */
    while (rt_device_read(rt, -1, &ch, 1) != 1)
    {
        /* 阻 塞 等 待 接 收 信 号 量， 等 到 信 号 量 后 再 次 读 取 数 据 */
        rt_sem_control(&rx_sem, RT_IPC_CMD_RESET, RT_NULL);
        rt_sem_take(&rx_sem, RT_WAITING_FOREVER);
    }
    /* 读 取 到 的 数 据 通 过 串 口 错 位 输 出 */
    //        rt_device_write(serial0, 0, &ch, 1);
    return ch;


}

char serial0_thread_entry(void )
{
    char ch;

    /* 从 串 口 读 取 一 个 字 节 的 数 据， 没 有 读 取 到 则 等 待 接 收 信 号 量 */
    while (rt_device_read(rt0, -1, &ch, 1) != 1)
    {
        /* 阻 塞 等 待 接 收 信 号 量， 等 到 信 号 量 后 再 次 读 取 数 据 */
        rt_sem_control(&rx0_sem, RT_IPC_CMD_RESET, RT_NULL);
        rt_sem_take(&rx0_sem, RT_WAITING_FOREVER);
    }
    /* 读 取 到 的 数 据 通 过 串 口 错 位 输 出 */
    //        rt_device_write(serial, 0, &ch, 1);
    //        rt_device_write(serial, 0, "qq", 2);
    return ch;


}

void data_parsing(void)
{
    char ch;
    char data[ONE_DATA_MAXLEN];
    static char i = 0;

    while (1)
    {
        ch = serial_thread_entry();
        //        rt_device_write(serial0, 0, &ch, 1);
        data[i++] = ch;
        if(ch == DATA_CMD_END)
        {
            data[i++] = '\0';
            ch='\0';
            //            rt_kprintf("%s\n",data0);
            rt_device_write(rt0, 0, data, i-1);
            //            rt_device_write(serial0, 0, data+1, 1);

            i = 0;

            memset(data, 0, sizeof(data));

            continue;
        }

        i = (i >= ONE_DATA_MAXLEN-1) ? ONE_DATA_MAXLEN-1 : i;
    }
}

void data0_parsing(void)
{
    char ch;
    char data0[ONE_DATA_MAXLEN];
    static char i = 0;
    uint8_t pin_state=0;
    while (1)
    {
        ch = serial0_thread_entry();
        //        rt_device_write(serial0, 0, &ch, 1);
        data0[i++] = ch;
        if(ch == DATA_CMD_END)
        {
            data0[i++] = '\0';
            ch='\0';

            if((data0[0]=='r')&&(data0[1]=='t')&&(data0[2]=='2'))
            {
                rt_device_write(rt, 0, data0+3, i-4);
            }
            else if ((data0[0]=='a')&&(data0[1]=='d')&&(data0[2]=='c'))
            {
                if ((data0[3]=='1')&&(state_adc==0))
                {
                    thread_adc_get = rt_thread_create("adc_get", (void (*)(void *parameter))adc_get, RT_NULL,1024, 25, 10);
                    rt_thread_startup(thread_adc_get);
                    thread_adc = rt_thread_create("adc_print", (void (*)(void *parameter))adc_print, RT_NULL,1024, 25, 10);
                    rt_thread_startup(thread_adc);

                    state_adc=1;
                }
                else  if ((data0[3]=='0')&&(state_adc==1))
                {
                    rt_thread_delete(thread_adc_get);
                    rt_thread_delete(thread_adc);

                    state_adc=0;
                }
            }
            else if ((data0[0]=='i')&&(data0[1]=='o')&&(data0[3]=='o'))
            {
                if (data0[2]=='a')
                {
                    gpio_set_pin_output(HPM_GPIO0, GPIO_DI_GPIOA, (data0[4]-'0')*10+(data0[5]-'0'));
                    gpio_write_pin(HPM_GPIO0, GPIO_DI_GPIOA, (data0[4]-'0')*10+(data0[5]-'0'), data0[6]-'0');

                }
                else  if (data0[2]=='b')
                {
                    gpio_set_pin_output(HPM_GPIO0, GPIO_DI_GPIOB, (data0[4]-'0')*10+(data0[5]-'0'));
                    gpio_write_pin(HPM_GPIO0, GPIO_DI_GPIOB, (data0[4]-'0')*10+(data0[5]-'0'), data0[6]-'0');
                }
                ;
            }
            else if ((data0[0]=='i')&&(data0[1]=='o')&&(data0[3]=='i'))
            {
                if (data0[2]=='a')
                {
                    gpio_set_pin_input(HPM_GPIO0, GPIO_DI_GPIOA, (data0[4]-'0')*10+(data0[5]-'0'));
                    pin_state=gpio_read_pin(HPM_GPIO0, GPIO_DI_GPIOA, (data0[4]-'0')*10+(data0[5]-'0'));
                    rt_kprintf("{pin:%d}\n", pin_state);
                }
                else  if (data0[2]=='b')
                {
                    gpio_set_pin_input(HPM_GPIO0, GPIO_DI_GPIOB, (data0[4]-'0')*10+(data0[5]-'0'));
                    pin_state=gpio_read_pin(HPM_GPIO0, GPIO_DI_GPIOB, (data0[4]-'0')*10+(data0[5]-'0'));
                    rt_kprintf("{pin:%d}\n", pin_state);
                }
                ;
            }

            i = 0;

            memset(data0, 0, sizeof(data0));

            continue;
        }

        i = (i >= ONE_DATA_MAXLEN-1) ? ONE_DATA_MAXLEN-1 : i;
    }
}

void adc_sz_init(void)
{
    adc_dev = (rt_adc_device_t)rt_device_find(ADC_DEV_NAME);
    rt_adc_enable(adc_dev, ADC_DEV_CHANNEL);
}

void adc_get(void)
{
    while(1)
    {
        value = rt_adc_read(adc_dev, ADC_DEV_CHANNEL);
        rt_thread_mdelay(1);
    }
}

void adc_print(void)
{
    while(1)
    {
        rt_kprintf("{o:%d}\n", value);
        rt_thread_mdelay(1);
    }
}
