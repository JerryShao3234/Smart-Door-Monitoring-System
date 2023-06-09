#include "VGA.h"
#include <system.h>
#include <altera_avalon_uart_regs.h>
#include <unistd.h>

/* VGA adapter base address */
volatile unsigned *vga_addr = (volatile unsigned *)0x00004000;

#define WHITE 63
#define BLACK 0
#define TEAL 10
#define PURPLE 21

void ShowWelcome(void)
{
	ResetScreen();

	DrawString(HEADER_X, HEADER_Y, PURPLE, BLACK, "SDMS: Smart Door", FALSE, SMALL_FONT);
	DrawString(HEADER_X + 50, HEADER_Y + 10, PURPLE, BLACK, "Monitoring System", FALSE, SMALL_FONT);

	DrawString(WELCOME_TITLE_X, WELCOME_TITLE_Y, WHITE, TEAL, "Welcome!", TRUE, MEDIUM_FONT);
	DrawString(WELCOME_SUBTITLE_X, WELCOME_SUBTITLE_Y, WHITE, TEAL, "Touch Screen to Proceed", TRUE, SMALL_FONT);
}

void ShowOption1(void)
{
	ResetScreen();

	DrawString(QUESTION_X, QUESTION_Y, WHITE, BLACK, "What is the purpose", FALSE, SMALL_FONT);
	DrawString(QUESTION_X + 15, QUESTION_Y + 10, WHITE, BLACK, "of your visit?", FALSE, SMALL_FONT);

	DrawString(INTENT_X, INTENT_Y + 5, WHITE, TEAL, "Family", TRUE, MEDIUM_FONT);
	DrawString(INTENT_X + 28, INTENT_Y + 21, WHITE, TEAL, "or", TRUE, SMALL_FONT);
	DrawString(INTENT_X, INTENT_Y + 30, WHITE, TEAL, "Friend", TRUE, MEDIUM_FONT);

	DrawButton(SELECT);
	DrawButton(RIGHT);
}

void ShowOption2(void)
{
	ResetScreen();

	DrawString(QUESTION_X, QUESTION_Y, WHITE, BLACK, "What is the purpose", FALSE, SMALL_FONT);
	DrawString(QUESTION_X + 15, QUESTION_Y + 10, WHITE, BLACK, "of your visit?", FALSE, SMALL_FONT);

	DrawString(INTENT_X - 10, INTENT_Y + 3, WHITE, TEAL, "Package", TRUE, MEDIUM_FONT);
	DrawString(INTENT_X - 15, INTENT_Y + 20, WHITE, TEAL, "Delivery", TRUE, MEDIUM_FONT);

	DrawButton(SELECT);
	DrawButton(LEFT);
	DrawButton(RIGHT);
}

void ShowOption3(void)
{
	ResetScreen();

	DrawString(QUESTION_X, QUESTION_Y, WHITE, BLACK, "What is the purpose", FALSE, SMALL_FONT);
	DrawString(QUESTION_X + 15, QUESTION_Y + 10, WHITE, BLACK, "of your visit?", FALSE, SMALL_FONT);

	DrawString(INTENT_X - 3, INTENT_Y + 15, WHITE, TEAL, "Advertisement", TRUE, SMALL_FONT);

	DrawButton(SELECT);
	DrawButton(LEFT);
	DrawButton(RIGHT);
}

void ShowOptionRecord(void)
{
	ResetScreen();

	DrawString(QUESTION_X, QUESTION_Y, WHITE, BLACK, "What is the purpose", FALSE, SMALL_FONT);
	DrawString(QUESTION_X + 15, QUESTION_Y + 10, WHITE, BLACK, "of your visit?", FALSE, SMALL_FONT);

	DrawString(INTENT_X + 4, INTENT_Y + 10, WHITE, TEAL, "Other", TRUE, MEDIUM_FONT);
	DrawString(INTENT_X + 6, INTENT_Y + 35, WHITE, TEAL, "Record a", TRUE, SMALL_FONT);
	DrawString(INTENT_X - 6, INTENT_Y + 45, WHITE, TEAL, "custom message", TRUE, SMALL_FONT);

	DrawButton(RECORD);
	DrawButton(LEFT);
}

void ShowRecordingInProgress(void)
{
	ResetScreen();

	DrawString(LEFT_X_LIMIT + 5, INTENT_Y + 20, WHITE, BLACK, "Please refer to the phone", FALSE, SMALL_FONT);
}

void ShowRecordingEnd(int wait_time)
{
	char num[2];
	ResetScreen();

	DrawString(LEFT_X_LIMIT + 43, INTENT_Y, WHITE, BLACK, "Message sent!", FALSE, SMALL_FONT);
	DrawString(HEADER_X + 3, INTENT_Y + 20, WHITE, BLACK, "Please wait for a reply.", FALSE, SMALL_FONT);
	DrawString(HEADER_X + 17, INTENT_Y + 30, WHITE, BLACK, "This may take up to ", FALSE, SMALL_FONT);
	DrawString(HEADER_X + 45, INTENT_Y + 40, WHITE, BLACK, "60 seconds", FALSE, SMALL_FONT);

	int index = 0;

	char msg[100] = "";
	char msg_1[30] = "";
	char msg_2[30] = "";
	char msg_3[30] = "";
	char msg_4[30] = "";

	char c = 'a';
	
	while(c != '<')
	{
		c = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
		printf("Loop 1: %c\n", c);
		usleep(35500);
	}

	while(c == '<')
	{
		c = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
		printf("Loop 1: %c\n", c);
		usleep(35500);
	}

	while(c != '>'){
		msg[index++] = c;
		c = IORD_ALTERA_AVALON_UART_RXDATA(WIFI_MODULE_BASE);
		printf("Loop 2: %c\n", c);
		usleep(35500);
	}

	msg[index] = ' ';

	int index_1 = index;
	int index_2 = index;
	int index_3 = index;

	for(int i = 0; i <= index; i++) {
		if(i <= 25 && (msg[i] == ' ')) {
			index_1 = i;
		}
		else if(i <= (index_1 + 25) && (msg[i] == ' ')) {
			index_2 = i;
		}
		else if(i <= (index_2 + 25) && (msg[i] == ' ')) {
			index_3 = i;
		}
	}

	printf("Index 1: %d\n", index_1);
	printf("Index 2: %d\n", index_2);
	printf("Index 3: %d\n", index_3);

	for(int i = 0; i < index; i++) {
		if(i >= 0 && i < index_1) {
			msg_1[i] = msg[i];
		}
		else if(i >= index_1 && i < index_2) {
			msg_2[i - index_1 - 1] = msg[i];
		}
		else if(i >= index_2 && i < index_3) {
			msg_3[i - index_2 - 1] = msg[i];
		}
		else if(i >= index_3) {
			msg_4[i - index_3 - 1] = msg[i];
		}
	}

	printf("message 1: %s\n", msg_1);
	printf("message 2: %s\n", msg_2);
	printf("message 3: %s\n", msg_3);
	printf("message 4: %s\n", msg_4);
	ShowMessage(msg_1, msg_2, msg_3, msg_4);
}

void ShowFinish(void) 
{
	ResetScreen();

	DrawString(HEADER_X, HEADER_Y, PURPLE, BLACK, "SDMS: Smart Door", FALSE, SMALL_FONT);
	DrawString(HEADER_X + 50, HEADER_Y + 10, PURPLE, BLACK, "Monitoring System", FALSE, SMALL_FONT);

	DrawString(LEFT_X_LIMIT + 25, WELCOME_TITLE_Y, WHITE, TEAL, "Thank you", TRUE, MEDIUM_FONT);
	DrawString(LEFT_X_LIMIT + 4, WELCOME_TITLE_Y + 16, WHITE, TEAL, "for visiting!", TRUE, MEDIUM_FONT);
}

void ShowMessage(char *message_1, char *message_2, char *message_3, char *message_4) 
{
	ResetScreen();

	DrawString(LEFT_X_LIMIT + 5, TOP_Y_LIMIT + 20, WHITE, BLACK, message_1, FALSE, SMALL_FONT);
	DrawString(LEFT_X_LIMIT + 5, TOP_Y_LIMIT + 40, WHITE, BLACK, message_2, FALSE, SMALL_FONT);
	DrawString(LEFT_X_LIMIT + 5, TOP_Y_LIMIT + 60, WHITE, BLACK, message_3, FALSE, SMALL_FONT);
	DrawString(LEFT_X_LIMIT + 5, TOP_Y_LIMIT + 80, WHITE, BLACK, message_4, FALSE, SMALL_FONT);

	DrawButton(FINISH);
}

/*
	Sets the colour of pixel at (x, y) to colour.
*/
void vga_plot(unsigned x, unsigned y, unsigned colour)
{
	*vga_addr = (y << 24) + (x << 16) + colour;
}

/******************************************************************************************************************************
** This function draws a single ASCII character at the coord specified using the colour specified
** OutGraphicsCharFont2(100,100, RED, 'A', TRUE, FALSE, 1, 1) ;	// display upper case 'A' in RED at coords 100,100, erase background
** no scroll, scale x,y= 1,1
**
******************************************************************************************************************************/

/* Draw character functions modelled after OutGraphicsCharFont2() from OutGraphicsCharFont2.c from VGA reference */

void DrawMediumCharacter(int x, int y, int colour, int backgroundcolour, int c, int Erase)
{
	register int row,
		column,
		theX = x,
		theY = y;
	register int pixels;
	register char theColour = colour;
	register int BitMask,
		theCharacter = c,
		theRow, theColumn;

	if (((short)(x) > (short)(RIGHT_X_LIMIT - 1)) || ((short)(y) > (short)(BOTTOM_Y_LIMIT - 1))) // if start off edge of screen don't bother
		return;

	if (((short)(theCharacter) >= (short)(' ')) && ((short)(theCharacter) <= (short)('~')))
	{						  // if printable character
		theCharacter -= 0x20; // subtract hex 20 to get index of first printable character (the space character)

		theRow = MEDIUM_FONT_YPIXELS;
		theColumn = MEDIUM_FONT_XPIXELS;

		for (row = 0; row < theRow; row++)
		{
			pixels = Font10x14[theCharacter][row]; // get the pixels for row 0 of the character to be displayed
			BitMask = 512;						   // set of hex 200 i.e. bit 7-0 = 0010 0000 0000
			for (column = 0; column < theColumn; column++)
			{
				if ((pixels & BitMask)) // if valid pixel, then write it
					vga_plot(theX + column, theY + row, theColour);
				else
				{ // if not a valid pixel, do we erase or leave it along (no erase)
					if (Erase == TRUE)
						vga_plot(theX + column, theY + row, backgroundcolour);
					// else leave it alone
				}

				BitMask = BitMask >> 1;
			}
		}
	}
}

void DrawSmallCharacter(int x, int y, int colour, int backgroundcolour, int c, int Erase)
{
	// using register variables (as opposed to stack based ones) may make execution faster
	// depends on compiler and CPU

	register int row, column, theX = x, theY = y;
	register int pixels;
	register char theColour = colour;
	register int BitMask, theC = c, theRow, theColumn;

	// if x,y coord off edge of screen don't bother

	if (((short)(x) > (short)(RIGHT_X_LIMIT - 1)) || ((short)(y) > (short)(BOTTOM_Y_LIMIT - 1)))
		return;

	// if printable character subtract hex 20
	if (((short)(theC) >= (short)(' ')) && ((short)(theC) <= (short)('~')))
	{
		theC = theC - 0x20;
		theRow = SMALL_FONT_YPIXELS;
		theColumn = SMALL_FONT_XPIXELS;

		for (row = 0; row < theRow; row++)
		{

			// get the bit pattern for row 0 of the character from the software font
			pixels = Font5x7[theC][row];
			BitMask = 16;

			for (column = 0; column < theColumn; column++)
			{

				// if a pixel in the character display it
				if ((pixels & BitMask))
					vga_plot(theX + column, theY + row, theColour);

				else
				{
					if (Erase == TRUE)

						// if pixel is part of background (not part of character)
						// erase the background to value of variable BackGroundColour

						vga_plot(theX + column, theY + row, backgroundcolour);
				}
				BitMask = BitMask >> 1;
			}
		}
	}
}

void DrawString(int x, int y, int colour, int backgroundcolour, char s[], int Erase, int fontSize)
{
	int start_x = x;

	for (int i = 0; s[i] != 0; i++)
	{
		if (fontSize == SMALL_FONT)
		{
			DrawSmallCharacter(start_x, y, colour, backgroundcolour, s[i], Erase);
			start_x = start_x + SMALL_FONT_XPIXELS + 1;
		}
		else if (fontSize == MEDIUM_FONT)
		{
			DrawMediumCharacter(start_x, y, colour, backgroundcolour, s[i], Erase);
			start_x = start_x + MEDIUM_FONT_XPIXELS + LETTER_SPACING;
		}
	}
}

void ResetScreen(void)
{
	for (int i = LEFT_X_LIMIT; i < RIGHT_X_LIMIT; i++)
	{
		for (int j = TOP_Y_LIMIT; j < BOTTOM_Y_LIMIT; j++)
		{
			vga_plot(i, j, TEAL); // initialize screen to teal
		}
	}
}

void DrawButton(int buttonType)
{
	int x, y, width, height;
	int backgroundcolour = WHITE;

	switch (buttonType)
	{
	case SELECT:
	case RECORD:
	case FINISH:
		x = SELECT_BUTTON_X;
		y = SELECT_BUTTON_Y;
		width = SELECT_BUTTON_WIDTH;
		height = SELECT_BUTTON_HEIGHT;
		break;
	case LEFT:
		x = LEFT_BUTTON_X;
		y = LEFT_BUTTON_Y;
		width = LEFT_RIGHT_BUTTON_WIDTH;
		height = LEFT_RIGHT_BUTTON_HEIGHT;
		break;
	case RIGHT:
		x = RIGHT_BUTTON_X;
		y = RIGHT_BUTTON_Y;
		width = LEFT_RIGHT_BUTTON_WIDTH;
		height = LEFT_RIGHT_BUTTON_HEIGHT;
		break;
	default:
		break;
	}

	if (buttonType == SELECT ||
		buttonType == RECORD ||
		buttonType == FINISH)
	{
		for (int i = x; i < x + width; i++)
		{
			for (int j = y; j < y + height; j++)
			{
				if (i == SELECT_BUTTON_X ||
					i == SELECT_BUTTON_X + SELECT_BUTTON_WIDTH - 1 ||
					j == SELECT_BUTTON_Y ||
					j == SELECT_BUTTON_Y + SELECT_BUTTON_HEIGHT - 1)
				{
					vga_plot(i, j, backgroundcolour);
				}
			}
		}

		switch (buttonType)
		{
		case SELECT:
			DrawString(SELECT_BUTTON_X + 8, SELECT_BUTTON_Y + 4, WHITE, BLACK, "SELECT", FALSE, SMALL_FONT);
			break;
		case RECORD:
			DrawString(SELECT_BUTTON_X + 8, SELECT_BUTTON_Y + 4, WHITE, BLACK, "RECORD", FALSE, SMALL_FONT);
			break;
		case FINISH:
			DrawString(SELECT_BUTTON_X + 8, SELECT_BUTTON_Y + 4, WHITE, BLACK, "FINISH", FALSE, SMALL_FONT);
			break;
		default:
			break;
		}
	}
	else if (buttonType == LEFT)
	{
		for (int i = x; i < x + width; i++)
		{
			for (int j = y; j < y + height; j++)
			{
				vga_plot(i, j, backgroundcolour);
			}
		}

		DrawString(LEFT_BUTTON_X + 6, LEFT_BUTTON_Y + 6, BLACK, WHITE, "<", TRUE, MEDIUM_FONT);
	}
	else if (buttonType == RIGHT)
	{
		for (int i = x; i < x + width; i++)
		{
			for (int j = y; j < y + height; j++)
			{
				vga_plot(i, j, backgroundcolour);
			}
		}

		DrawString(RIGHT_BUTTON_X + 5, RIGHT_BUTTON_Y + 6, BLACK, WHITE, ">", TRUE, MEDIUM_FONT);
	}

	return;
}
