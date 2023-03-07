#include <stdio.h>
#include <altera_avalon_uart_regs.h>
#include <system.h>
#include <sys/alt_stdio.h>
#include <unistd.h>
#include <string.h>

void Init_Touch(void);
void Get_Coordinates_Of_Touch(void);
void Send_Blink(void);

int main()
{ 
    alt_putstr("Hello from Nios II!\n");
    
    // Init_Touch();
    Send_Blink(); 
    /* Event loop never exits. */

    while (1) {
        // char received = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
        // printf("%c\n", received);
        // usleep(833);
        // Get_Coordinates_Of_Touch();
    }

    return 0;
}

/*****************************************************************************
** Initialise touch screen controller
*****************************************************************************/
void Init_Touch(void)
{
    // send touchscreen controller an "enable touch" command
    IOWR_ALTERA_AVALON_UART_TXDATA(TOUCHSCREEN_BASE, 0x55);
    IOWR_ALTERA_AVALON_UART_TXDATA(TOUCHSCREEN_BASE, 0x01);
    IOWR_ALTERA_AVALON_UART_TXDATA(TOUCHSCREEN_BASE, 0x12);
}

void Get_Coordinates_Of_Touch(void) 
{
    // Wait for pen to go down 
    while(IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE) != 0x81);

    // Wait for pen to go up
    while(IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE) != 0x80);

    // x and y coordinates of touch
    unsigned int x = 0;
    unsigned int y = 0;

    //Read next two bytes
    usleep(833);
    char response2 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

    usleep(833);
    char response3 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

    usleep(833);

    //Calculate x
    x = (response3 << 7) | response2;

    // Read the next two bytes
    char response4 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);
    usleep(833);

    char response5 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);
    printf("\n");

    //Calculate y
    y = (response5 << 7) | response4;

    // Print coordinates on console
    printf("x: %d, y: %d", x, y);
}

void Send_Blink(void) 
{
    char blink_command[32] = "dofile(\"blinking_light.lua\")\n";
    char init_command[26] = "gpio.mode(3,gpio.OUTPUT)\n";
    // char blink_command[24] = "gpio.write(3,gpio.LOW)\n";

    // for(int i = 0; i < 26; i++) {
    //     IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, init_command[i]);
    //     // printf("%c", init_command[i]);
    //     char received = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
    //     printf("%c", received);
    //     usleep(833);
    // }

    // usleep(833);

    for(int i = 0; i < 32; i++) {
        IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, blink_command[i]);
        // printf("%c", blink_command[i]);
        // char received = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
        // printf("%c", received);
        usleep(833);
    }
}
