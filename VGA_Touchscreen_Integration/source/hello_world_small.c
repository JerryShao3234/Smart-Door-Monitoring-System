#include <stdio.h>
#include <altera_avalon_uart_regs.h>
#include <system.h>
#include <sys/alt_stdio.h>
#include <unistd.h>
#include <string.h>
#include "VGA.h"
#include <time.h>

#define RECORD_TIMEOUT 10
#define SEND_TIMEOUT 5
#define RETURN_TIMEOUT 2

struct coordinate{
	unsigned int x;
	unsigned int y;
};

enum state {WELCOME=0, OP1=1, OP2 = 2,
	          OP3=3, REC=4, PROG=5, END=6, FIN=7, IDLE=8, POST=9};

void Init_Touch(void);
struct coordinate Get_Coordinates_Of_Touch(void);
unsigned int pixelInRange(unsigned int x, unsigned int y, unsigned int lower_x, unsigned int upper_x, int lower_y, int upper_y);
void displayScreen(enum state s);

int main()
{ 
	enum state current_state;
	enum state next_state;
	enum state prev_state;
	prev_state = WELCOME;
	current_state = WELCOME;
	next_state = OP1;
    alt_putstr("Hello from Nios II!\n");
    ShowWelcome();

    // Init_Touch();

    /* Event loop never exits. */
    while (1) {
        if(IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE) == 0x81){
        	current_state = IDLE;
        }else if(current_state == IDLE && IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE) == 0x80){
        	/* compute coordinate of touch */
        	unsigned int x = 0;
        	unsigned int y = 0;

        	//Read next two bytes
			usleep(833);
			char x_param1 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

			usleep(833);
			char x_param2 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

			x = (x_param2 << 7) | x_param1;

			usleep(833);
			char y_param1 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

			usleep(833);
			char y_param2 = IORD_ALTERA_AVALON_UART_RXDATA(TOUCHSCREEN_BASE);

			y = (y_param2 << 7) | y_param1;
			printf("touch: (%d, %d)\n", x, y);

			/* convert x, y to pixel coordinates */
			x = (unsigned int)(((x-200)/3700.0)*160);
			y = (unsigned int)(((y-500)/3300.0)*120);
			printf("pixel: (%d, %d)\n", x, y);

			current_state = prev_state;
        	switch(current_state){
        		case WELCOME: {
        			next_state = OP1;
        			prev_state = WELCOME;
        			break;
        		}
        		case OP1: {
        			prev_state = OP1;
					if(pixelInRange(x, y, SELECT_BUTTON_X, SELECT_BUTTON_X + SELECT_BUTTON_WIDTH,
							SELECT_BUTTON_Y, SELECT_BUTTON_Y+SELECT_BUTTON_HEIGHT)){
						next_state = POST;
						IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, 'a');
					} else if(pixelInRange(x, y, RIGHT_BUTTON_X, RIGHT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							RIGHT_BUTTON_Y, RIGHT_BUTTON_Y+ LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = OP2;
					} else {
						next_state = OP1;
					}
					break;
        		}
        		case OP2: {
        			prev_state = OP2;
					if(pixelInRange(x, y, SELECT_BUTTON_X, SELECT_BUTTON_X + SELECT_BUTTON_WIDTH,
							SELECT_BUTTON_Y, SELECT_BUTTON_Y+SELECT_BUTTON_HEIGHT)){
						next_state = POST;
						IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, 'b');
					} else if(pixelInRange(x, y, RIGHT_BUTTON_X, RIGHT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							RIGHT_BUTTON_Y, RIGHT_BUTTON_Y+ LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = OP3;
					} else if(pixelInRange(x, y, LEFT_BUTTON_X, LEFT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							LEFT_BUTTON_Y, LEFT_BUTTON_Y + LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = OP1;
					} else {
						next_state = OP2;
					}
					break;
        		}
        		case OP3: {
        			prev_state = OP3;
					if(pixelInRange(x, y, SELECT_BUTTON_X, SELECT_BUTTON_X + SELECT_BUTTON_WIDTH,
							SELECT_BUTTON_Y, SELECT_BUTTON_Y+SELECT_BUTTON_HEIGHT)){
						next_state = POST;
						IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, 'c');
					} else if(pixelInRange(x, y, RIGHT_BUTTON_X, RIGHT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							RIGHT_BUTTON_Y, RIGHT_BUTTON_Y+ LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = REC;
					} else if(pixelInRange(x, y, LEFT_BUTTON_X, LEFT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							LEFT_BUTTON_Y, LEFT_BUTTON_Y + LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = OP2;
					} else {
						next_state = OP3;
					}
					break;
        		}
        		case REC: {
        			prev_state = REC;
					if(pixelInRange(x, y, SELECT_BUTTON_X, SELECT_BUTTON_X + SELECT_BUTTON_WIDTH,
							SELECT_BUTTON_Y, SELECT_BUTTON_Y+SELECT_BUTTON_HEIGHT)){
						next_state = END;
						IOWR_ALTERA_AVALON_UART_TXDATA(WIFI_MODULE_BASE, 'd');
					} else if(pixelInRange(x, y, LEFT_BUTTON_X, LEFT_BUTTON_X + LEFT_RIGHT_BUTTON_WIDTH,
							LEFT_BUTTON_Y, LEFT_BUTTON_Y+ LEFT_RIGHT_BUTTON_HEIGHT)){
						next_state = OP3;
					} else {
						next_state = REC;
					}
					break;
        		}
        		case PROG: {
					prev_state = PROG;
					next_state = END;
					break;
        		}
        		case END: {
        			prev_state = END;
        			next_state = FIN;
        			int wait_time = SEND_TIMEOUT;
					break;
        		}
        		case POST: {
        			prev_state = POST;
        			next_state = FIN;

        			break;
        		}
				case FIN: {
					prev_state = FIN;
					next_state = OP1;
				}
        		default: {
        			break;
        		}
        	}
        	if(prev_state != next_state){
				displayScreen(next_state);
			}
        	prev_state = next_state;
        }
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

struct coordinate Get_Coordinates_Of_Touch(void)
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

    struct coordinate touch_cord;
    touch_cord.x = x;
    touch_cord.y = y;

    return touch_cord;
}

unsigned int pixelInRange(unsigned int x, unsigned int y, unsigned int lower_x, unsigned int upper_x, int lower_y, int upper_y){
	return x >= lower_x && x <= upper_x && y >= lower_y && y <= upper_y;
}

void displayScreen(enum state s){
	switch(s){
		case WELCOME: {
			ShowWelcome();
			break;
		}
		case OP1: {
			ShowOption1();
			break;
		}
		case OP2: {
			ShowOption2();
			break;
		}
		case OP3: {
			ShowOption3();
			break;
		}
		case REC: {
			ShowOptionRecord();
			break;
		}
		case PROG: {
			ShowRecordingInProgress();
			break;
		}
		case END: {
			ShowRecordingInProgress();
			usleep(31 * 1000000); //45 seconds in real time
			ShowRecordingEnd(RECORD_TIMEOUT);
			break;
		}
		case POST: {
			ShowRecordingEnd(SEND_TIMEOUT);
			break;
		}
		case FIN: {
			ShowFinish();
			usleep(2 * 1000000);
			ShowWelcome();
		}
		default: {
			break;
		}
	}
}
