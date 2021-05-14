/*;------------------------------------------------------------------------------
; LCD display
;------------------------------------------------------------------------------
 * 
/*;------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                    ;
;                       Software License Agreement                   ;
;                                                                    ;
;   The software supplied herewith by Microchip Technology           ;
;   Incorporated (the "Company") for its dsPIC controller            ;
;   is intended and supplied to you, the Company's customer,         ;
;   for use solely and exclusively on Microchip dsPIC                ;
;   products. The software is owned by the Company and/or its        ;
;   supplier, and is protected under applicable copyright laws. All  ;
;   rights are reserved. Any use in violation of the foregoing       ;
;   restrictions may subject the user to criminal sanctions under    ;
;   applicable laws, as well as to civil liability for the breach of ;
;   the terms and conditions of this license.                        ;
;                                                                    ;
;   THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION.  NO           ;
;   WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING,    ;
;   BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND    ;
;   FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE     ;
;   COMPANY SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL,  ;
;   INCIDENTAL OR CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.  ;
;                                                                    ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*/


 #if defined(__dsPIC30F6014__)
    #include <p30F6014.h>
#endif
#if defined(__dsPIC30F6014A__)
    #include <p30F6014A.h>
#endif
		#include "LCD_Display.h"

//;Initialize SPI port to communicate with the LCD display

void LCD_Display_Setup(void){
		LATGbits.LATG9 = 1; 	// Set SPI slave select pin high
		TRISGbits.TRISG9 = 0;	// and set as output
		SPI2CON = 0x003c;		// Load SPI control register with Master mode, Clk = Fosc/64, Input data sampled at middle of output time, Data clocked out on rising edge, Clk idle is low
		SPI2STAT = 0x8000; 		// Enable SPI port
		}

/* ;------------------------------------------------------------------------------
;Clear a column at X=W10 of the display
*/

void LCD_Display_ClrCol(unsigned char x){
		unsigned char counter;
		counter = 32;                   // Load counter to clear pixel 32 times
		while(counter > 0){
		LCD_Display_Byte(0xd9);         // Load command to clear a pixel, Call routine to send the command to the display
		LCD_Display_Byte(x);            // Load X location of pixel, Call routine to send the command to the display
		LCD_Display_Byte(counter--); 	// Load Y location of pixel, Call routine to send the command to the display
		}
}
		
/* ;------------------------------------------------------------------------------
;Display a pixel at X=W10 and Y=W11
*/

void LCD_Display_Pixel(unsigned char x,unsigned char y){
		LCD_Display_Byte(0xd8);		// Load command to set a pixel, Call routine to send the command to the display
		LCD_Display_Byte(x);		// Load X location of pixel, Call routine to send the command to the display
		LCD_Display_Byte(y);		// Load Y location of pixel, Call routine to send the command to the display
		}

/* ;------------------------------------------------------------------------------
;Send W0 byte to LCD
*/

void LCD_Display_Byte(unsigned char value){
		unsigned int junk;
		LATGbits.LATG9 = 1;         // Set slave select high
		LATGbits.LATG9 = 0;         // Set slave select low for new transmission
		junk = SPI2BUF;             // Read buffer to avoid overflow
		SPI2BUF = value;            // Write the data to the output buffer
		while(!SPI2STATbits.SPIRBF); // Check if transmission complete
		}

void LCD_Display_array(int *array_ptr[]){
	unsigned char j,k;
	for (k=0; k<122; k++)
   			{
   			j = (unsigned char)array_ptr[k]/8;
			LCD_Display_ClrCol(k);		// Clear the next whole column of the display 
      		LCD_Display_Pixel(k,j);		// Set the desired pixel (k is X position, y is Y position)
			}
	}





