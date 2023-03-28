#include "system.h"
#include "VGA.h"
#include "Fonts.h"
#include "Colours.h"

// #define STANDARD_X 320
// #define STANDARD_Y 240
// #define INTEL_BLUE 0x0071C5

/* VGA adapter base address */
volatile unsigned *vga_addr = (volatile unsigned *) 0x00004000; 

/*
	Sets the colour of pixel at (x, y) to colour. 
*/
void vga_plot(unsigned x, unsigned y, unsigned colour)
{
    *vga_addr = (y << 24) + (x << 16) + colour;
}

/* UNIV PROGRAM STUFF */
/* function prototypes */
void video_text(int, int, char *);
void video_box(int, int, int, int, short);
int  resample_rgb(int, int);
int  get_data_bits(int);


/* global variables */
int res_offset;
int col_offset;

int main()
{
	/* DOG DEMO */

	unsigned char x;
	unsigned char y;
	unsigned int colour = 0; // colour is black

	//                    row(y) col(x)
	unsigned char pixel_arr[130][170] = {{0}};  // initialize pixel array to all zero (ie black)
	
	for(int i = 0; i < 160; i++)
	{
		for(int j = 0; j < 120; j++)
		{
			vga_plot(i,j, BLACK);	// initialize screen to black
		}
	}

	colour = 255; // colour is white

	// vga_plot(LEFT_X_LIMIT, TOP_Y_LIMIT, RED);
	// vga_plot(RIGHT_X_LIMIT, BOTTOM_Y_LIMIT, YELLOW);
	// vga_plot(LEFT_X_LIMIT, BOTTOM_Y_LIMIT, LIME);
	// vga_plot(RIGHT_X_LIMIT, TOP_Y_LIMIT, MAGENTA);

	DrawCharacter(100,100, MAGENTA, BLACK, 'A', TRUE, MEDIUM_FONT);
	DrawString(100,100, MAGENTA, BLACK, 'Welcome!', TRUE, MEDIUM_FONT);
}