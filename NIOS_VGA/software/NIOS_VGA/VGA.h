#ifndef VGA_H_  
#define VGA_H_

#define TRUE 1
#define FALSE 0
#define SMALL_FONT 0
#define MEDIUM_FONT 1

/******************************************************************************************************************************
** This function draws a single ASCII character at the coord specified using the colour specified
** OutGraphicsCharFont2(100,100, RED, 'A', TRUE, FALSE, 1, 1) ;	// display upper case 'A' in RED at coords 100,100, erase background
** no scroll, scale x,y= 1,1
**
******************************************************************************************************************************/
void DrawCharacter(int x, int y, int colour, int backgroundcolour, int c, int Erase, int fontSize);

void DrawString(int x, int y, int colour, int backgroundcolour, char s[], int Erase, int fontSize);

#endif // VGA_H_