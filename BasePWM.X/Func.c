#include "Main.h"
#include "Func.h"
#include "math.h"

/* Este archivo contendrá la definición de las funciones auxiliares que se
 * necesiten para la ejecución del código.
 * Pueden añadirse tantas como se quiera.
 * El objetivo es encapsular lo máximo posible el código y reutilizar todas las+
 * funciones posibles.
 * En el archivo FUNC.H deberán incluirse los prototipos de estas funciones.
 */

// Ejemplo:
// FUNCIÓN PARA INICIALIZACIÓN DE PUERTOS E/S
// Parámetros de entrada: ninguno (void).
// Parámetros de salida: ninguno (void).
void InitIO()
{
	TRISB = 0xFFFF;     // Initialize AN6 as input                
    TRISD = 0xFFF0;     // LED outputs
    LATD = 0xFFF0;      // LED on
    return;
}// InitIO

//---------------------------------------------------------------------------
// InitTMR1
//---------------------------------------------------------------------------
void InitTMR1()
{   
    //Initialize Timer3 for 10ms period
    T1CON = 0;                    // Turn off Timer3 by clearing control register
	TMR1 = 0;                     // Start Timer1 at zero
	PR1 = (FCY/256)*0.5;         // Set period register value for 50 ms (20 Hz)
    T1CON = 0x0030;               // Configure Timer3 (timer off, continue in IDLE, not gated, 1:256 prescaler, internal clock)    
    return;
}
//---------------------------------------------------------------------------
// InitTMR3
//---------------------------------------------------------------------------
void InitTMR3()
{   
    //Initialize Timer3 for 10ms period
    T3CON = 0;                    // Turn off Timer3 by clearing control register
	TMR3 = 0;                     // Start Timer1 at zero
	PR3 = (FCY/256)*0.01;         // Set period register value for 10 ms (100 Hz)
    T3CON = 0x0030;               // Configure Timer3 (timer off, continue in IDLE, not gated, 1:256 prescaler, internal clock)    
    return;
}

//---------------------------------------------------------------------------
// InitADC. ADC intial configuration
//---------------------------------------------------------------------------
void InitADC()
{   
    // ADCON1 CONFIGURATION
    ADCON1bits.ADON = 0;        // Initially, stopped.
    ADCON1bits.ADSIDL = 0;      // No IDLE
    ADCON1bits.FORM = 0b00;     // Output format = unsigned integer
    ADCON1bits.SSRC = 0b010;    // Source for triggering conversion = auto (111) con 010 disparo con TMR3
    ADCON1bits.ASAM = 1;        // Sampling after conversion ends

    // ADCON2 CONFIGURATION
    ADCON2bits.VCFG = 0b000;    // Vref+ = VDD, Vref- = VSS.
    ADCON2bits.SMPI = 0b1011;   // Interrupts after 12 conversion
    ADCON2bits.BUFM = 0;        // 16 words
    ADCON2bits.CSCNA = 1;
    ADCON2bits.ALTS = 0;
    ADCON2bits.BUFS = 0;
           
    // ADCON3 CONFIGURATION
    ADCON3bits.SAMC = 0b01111;   // 15·Tad 
    ADCON3bits.ADCS = 4;        // Clock Tad
    ADCON3bits.ADRC = 0;        // internal clock
    
    // ADCPCFG
    ADPCFG = 0xFFFF;	
    ADPCFGbits.PCFG6 = 0;       // AN6 as analog input
    ADPCFGbits.PCFG10 = 0;      //Define  AN10 as analog input
    ADPCFGbits.PCFG11 = 0;      //Define  AN11 as analog input
    
    // ADCSSL
    ADCSSL = 0x0000;
    ADCSSLbits.CSSL6 = 1;       // AN6 conversion
    ADCSSLbits.CSSL10 = 1;      // AN10 Conversion 
    ADCSSLbits.CSSL11 = 1;      // AN11 Conversion

    ADCON1bits.ADON = 1;        // turn ADC ON
    return;
}

//---------------------------------------------------------------------------
// ConfigInt(). For configuring interrupts
//---------------------------------------------------------------------------
void ConfigInt()
{
    // Configuring the interrupts
    INTCON1bits.NSTDIS = 1;         // Disable nesting interrputs 
    
    //Modulo ADC
    IFS0bits.ADIF = 0;              // Clear ADC flag
    IEC0bits.ADIE = 1;              // Enable ADC mask
    IPC2bits.ADIP = 4;              // ADC priority level
    
    // Timer 1
    IFS0bits.T1IF = 0;              // Clean flag   
    IEC0bits.T1IE = 1;              // Set local mask
    IPC0bits.T1IP = 5;              // Set priority level
    
    SET_CPU_IPL(6);                 // Set CPU priority level to a value below the lowest interrupt
    return;   
}

// Función de generación del PWM

void GenPWM(float duty)
{
    if(duty>1)
        duty = 0.9;     // Limitación del ciclo de trabajo máximo
    if(duty<0)
        duty = 0.1;     // Limitación del ciclo de trabajo mínimo
    
    // Configuración de la base de tiempos del PWM OC1 (pin RD0)
    TMR2 = 0;           // Seleccionamo como base el TMR2
    PR2 = 0;
    
    PR2 = (FCY/8)/FPWM; // Periodo de la señal: 1/737Hz
    T2CON = 0x8010;     // Timer on, PS = 8, señal de reloj interna
    
    // Configuración del módulo PWM 1
    OC1CONbits.OCSIDL = 0;  // No funciona en modo IDLE
    OC1CONbits.OCTSEL = 0;  // Base de tiempos TMR2
    OC1CONbits.OCM = 0b110; // Modo PWM de salida
    
    // Escritura/actualización del ciclo de trabajo
    OC1RS = duty*PR2;       // Asignación del ciclo de trabajo
    
    return;
}

//=======================FUNCIONALIDAD BASICA=====================================

//---------------------------------
//init LCD
//----------------------------------------------------------
void InitLCD(void)
{
LCD_Display_Setup(); // INICIALIZA LCD
LCD_Display_Byte(HOME_CLEAR); // BORRA LCD
LCD_Display_Byte(CURSOR_ON); // PONE CURSOR
return;
}
// Funcion: VALOR MEDIO  
float Avg(float array[], unsigned int size)
{
    unsigned long suma = 0;         // Suma should be longer than an integer to avoid overflow. Next type is long (32 bits)
    unsigned int i = 0;             // Index
    for (i=0;i<size;i++)        
        suma = suma + array[i];     // Sum of all elements
    return suma/(size);           // Return the average value
}

//Funcion: VALOR MAXIMO 
float Max(float array[], unsigned int size)
{
    unsigned int max = 0;       // Inicializo el maximo a '0'
    unsigned int i = 0;
    for (i=0;i<size;i++)
    {
        if (max<array[i])
            max = array[i];
    }
    return max;
}

//Funcion: VALOR RMS
float Rms(float array[], unsigned int size)
{
    float suma2 = 0;       // Inicializo el maximo a '0'
    unsigned int i;
    float rms = 0.0;
    
    for (i=1;i<size;i++){
        suma2 = suma2 + (array[i]*array[i]);
    }
    
    rms =sqrt((1.0/size)*suma2);
    
    return rms;
}

//------------------Funciones LCD--------------------//
void Print(float max, float avg, float rms, unsigned int indice)
{
    unsigned int tamano =20;
    char fila1[tamano];
    char fila2[tamano];
   
    sprintf(fila1, "%u: M=%0.2fV; m=%0.2fV", indice, max, avg);
    sprintf(fila2, "%u: rms=%0.2fV       ", indice, rms);
     
    unsigned int TxIndex = 0;
    while (fila1[TxIndex])
    {
        LCD_Display_Byte(WRITE_CHAR);
        LCD_Display_Byte(fila1[TxIndex++]);
    } 
    TxIndex = 0;
    while (fila2[TxIndex])
    {
        LCD_Display_Byte(WRITE_CHAR);
        LCD_Display_Byte(fila2[TxIndex++]);
    } 
}