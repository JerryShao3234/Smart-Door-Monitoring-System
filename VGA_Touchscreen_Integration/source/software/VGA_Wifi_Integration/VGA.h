#ifndef VGA_H_  
#define VGA_H_

/* macro definitions */
#define LEFT_X_LIMIT 0
#define RIGHT_X_LIMIT 160
#define TOP_Y_LIMIT 0
#define BOTTOM_Y_LIMIT 120
#define TRUE 1
#define FALSE 0
#define SMALL_FONT 0
#define MEDIUM_FONT 1

#define HEADER_X 5
#define HEADER_Y 10
#define QUESTION_X 30
#define QUESTION_Y 10
#define WELCOME_TITLE_X 40
#define WELCOME_TITLE_Y 50
#define WELCOME_SUBTITLE_X 10
#define WELCOME_SUBTITLE_Y 80
#define INTENT_X 50
#define INTENT_Y 35
#define SELECT_BUTTON_X 60
#define SELECT_BUTTON_Y 100
#define SELECT_BUTTON_WIDTH 50 
#define SELECT_BUTTON_HEIGHT 15
#define LEFT_BUTTON_X 2
#define LEFT_BUTTON_Y 45
#define RIGHT_BUTTON_X 140
#define RIGHT_BUTTON_Y 45
#define LEFT_RIGHT_BUTTON_WIDTH 20
#define LEFT_RIGHT_BUTTON_HEIGHT 25

#define SELECT 0
#define LEFT 1
#define RIGHT 2
#define RECORD 3
#define FINISH 4

/* Functions for drawing premade screens */
void ShowWelcome(void);
void ShowOption1(void);
void ShowOption2(void);
void ShowOption3(void);
void ShowOptionRecord(void);
void ShowRecordingInProgress(void);
void ShowRecordingEnd(int wait_time);
void ShowFinish(void);
void ShowMessage(char *message);

/* Helper Functions */
void vga_plot(unsigned x, unsigned y, unsigned colour);
void ResetScreen(void);
void DrawMediumCharacter(int x, int y, int colour, int backgroundcolour, int c, int Erase);
void DrawSmallCharacter(int x, int y, int colour, int backgroundcolour, int c, int Erase);
void DrawString(int x, int y, int colour, int backgroundcolour, char s[], int Erase, int fontSize);

void DrawButton(int buttonType);

#include "Colours.h"
#include "Fonts.h"
#include <stdio.h>

#endif // VGA_H_
