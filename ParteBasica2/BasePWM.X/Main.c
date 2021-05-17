/* 
 * File:   Main.c
 * Author: Local Hero
 *
 * Created on 26 de marzo de 2018, 10:18
 */

#include "Config.h"
#include "Main.h"
#include "Func.h"
#include "dsp.h"



// Global variables

unsigned int posicion = 0;

float   duty = 0.5;         // Valor del ciclo de trabajo de la señal PWM (inicialmente 0.5)
//Variables necesarias
extern  FIRStruct pasoBanda1Filter;
fractional entrada_seno[NUM_MUESTRA]; // se?al senoidal
fractional entrada_trian[NUM_MUESTRA]; //se?al triangular

//Filtros
fractional filtrada_seno[NUM_MUESTRA]; // se?al senoidal
fractional filtrada_trian[NUM_MUESTRA]; //se?al triangular


//---------------------------------------------------------------------------
// ISR routine. ADC
//---------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _ADCInterrupt(void)
{
	IFS0bits.ADIF = 0;          // Clean flag
    //LEctura de las Entradas senoidal y triangular de AN10 y AN11
    //Filtros
   
    
    if(posicion<NUM_MUESTRA)
    {
       entrada_seno[posicion]=ADCBUFB; //Se?al en RB11 (
       entrada_trian[posicion]=ADCBUFA; //Se?al en RB10 (
        
        FIR (1, &filtrada_seno[posicion], &entrada_seno[posicion], &pasoBanda1Filter); // Se ejecuta el filtro FIR
        FIR (1, &filtrada_trian[posicion], &entrada_trian[posicion], &pasoBanda1Filter); // Se ejecuta el filtro FIR
        posicion++;
        
    }
    else{
        posicion=0;
    }
    
    ADCON1bits.ADON = 1;        // turn ADC ON
}
//---------------------------------------------------------------------------
// TMR1 routine. 
//---------------------------------------------------------------------------
void __attribute__((interrupt, auto_psv)) _T1Interrupt(void)//sensor de temperatura
{
	IFS0bits.T1IF = 0;          // limpiar el flag
    T1CONbits.TON = 0;          //arrancar TMR1
    TMR1 = 0;                   //Limpiar TMR1
    
    //InitLCD();                  //Inicializacion del LCD
   
   // Print(Max(entrada_trian, posicion), Avg(entrada_trian, posicion),Rms(entrada_trian, posicion), 10);
    //Print(Max(entrada_seno,posicion), Avg(entrada_seno, posicion),Rms(entrada_seno, posicion), 11);
   
    T1CONbits.TON = 1; //encendemos TMR1
    
}

//---------------------------------------------------------------------------
// Main routine
//---------------------------------------------------------------------------

// Función principal. Siempre incluye un bucle infinito.

int main (void)
{   
    // Initialize
        //===== FILTRO
    FIRDelayInit (&pasoBanda1Filter); //Inicializamos el Filtro
    InitIO();                    // Initialize I/O ports
    InitTMR3();                  // Initialize TMR3
    InitTMR1();                  // Initialize TMR1
    InitADC();                  // Initialize ADC
    ConfigInt();               // Configure interrupts 
    GenPWM(duty);               // Inicializar el PWM
    
    
    T3CONbits.TON = 1;         // Start TMR3
    T2CONbits.TON = 1;         // Start TMR3
    T1CONbits.TON = 1;         // Start TMR3
        
    while (1)   // bucle infinito
    {
        
    }
    
    return 0;
    
}// Main
