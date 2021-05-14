/* 
 * File:   Config.h
 * Author: Local Hero
 *
 * Created on 15 de marzo de 2018, 10:57
 */

#ifndef CONFIG_H
#define	CONFIG_H


// -----------------------------------------------------------------------------
// Configuration and device
// -----------------------------------------------------------------------------

#if defined(__dsPIC30F6014__)
   #include <p30F6014.h>
    #pragma config FPR = XT_PLL4            // Primary Oscillator Mode (XT w/PLL 4x)
    #pragma config FOS = PRI                // Oscillator Source (Primary Oscillator)
#endif

#if defined(__dsPIC30F6014A__) 
    #include <p30F6014A.h>
    #pragma config FOSFPR = XT_PLL4         // Oscillator (XT w/PLL 4x)
    #pragma config FCKSMEN = CSW_FSCM_OFF   // Clock Switching and Monitor (Sw Disabled, Mon Disabled)
#endif       

// FWDT
#pragma config FWPSB = WDTPSB_16        // WDT Prescaler B (1:16)
#pragma config FWPSA = WDTPSA_512       // WDT Prescaler A (1:512)
#pragma config WDT = WDT_OFF            // Watchdog Timer (Disabled)

// FBORPOR
#pragma config FPWRT = PWRT_64          // POR Timer Value (64ms)
#pragma config BODENV = NONE            // Brown Out Voltage (Reserved)
#pragma config BOREN = PBOR_OFF         // PBOR Enable (Disabled)
#pragma config MCLRE = MCLR_EN          // Master Clear Enable (Enabled)


// FGS
#pragma config GWRP = GWRP_OFF          // General Code Segment Write Protect (Disabled)
//#pragma config GCP = CODE_PROT_OFF      // General Segment Code Protection (Disabled)

// FICD
#pragma config ICS = ICS_PGD            // Comm Channel Select (Use PGC/EMUC and PGD/EMUD)


#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif

#endif	/* CONFIG_H */

