/* 
 * File:   Func.h
 * Author: AVA
 *
 */

/* En este archivo deben incluirse los prototipos de las funciones utilizadas en
 * FUNC.C.
 */

#ifndef FUNC_H
#define	FUNC_H

// EJEMPLO:
void InitIO(void);
void InitTMR3(void);
void ConfigInt(void);
void InitADC(void);
void GenPWM(float);

// Añadir tantos prototipos como sea necesario.
void InitLCD(void);
void InitTMR1(void);
float Max(float *, unsigned int );
float Avg(float *, unsigned int );
float Rms(float *, unsigned int );
void Print(float , float , float , unsigned int );

#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif

#endif	/* FUNC_H */

