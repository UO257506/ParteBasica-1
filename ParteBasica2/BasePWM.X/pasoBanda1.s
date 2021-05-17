;.....
;    File   pasoBanda1.s 
;.....

    .equ pasoBanda1NumTaps, 61

;.....
; Allocate and initialize filter taps

		.section .pasoBanda1const, "x"
		.align 128
pasoBanda1Taps:
.hword 0x017a, 0x02fc, 0x03e2, 0x03fc, 0x0342, 0x01da, 0x000d, 0xfe3b, 0xfcc5 
.hword 0xfbf8, 0xfc00, 0xfcdc, 0xfe60, 0x003c, 0x020e, 0x0374, 0x0424, 0x03f9 
.hword 0x02fc, 0x015f, 0xff79, 0xfdae, 0xfc5c, 0xfbcb, 0xfc18, 0xfd35, 0xfee6 
.hword 0x00d1, 0x0292, 0x03cb, 0x043b, 0x03cb, 0x0292, 0x00d1, 0xfee6, 0xfd35 
.hword 0xfc18, 0xfbcb, 0xfc5c, 0xfdae, 0xff79, 0x015f, 0x02fc, 0x03f9, 0x0424 
.hword 0x0374, 0x020e, 0x003c, 0xfe60, 0xfcdc, 0xfc00, 0xfbf8, 0xfcc5, 0xfe3b 
.hword 0x000d, 0x01da, 0x0342, 0x03fc, 0x03e2, 0x02fc, 0x017a 

;.....
; Allocate delay line in (uninitialized) Y data space

		.section .ybss,  "b"
		.align 128

pasoBanda1Delay:
		.space pasoBanda1NumTaps*2

; .....
; Allocate and intialize filter structure

		.section .data
		.global _pasoBanda1Filter

_pasoBanda1Filter:
.hword pasoBanda1NumTaps
.hword psvoffset(pasoBanda1Taps)
.hword psvoffset(pasoBanda1Taps)+pasoBanda1NumTaps*2-1
.hword psvpage(pasoBanda1Taps)
.hword pasoBanda1Delay
.hword pasoBanda1Delay+pasoBanda1NumTaps*2-1
.hword pasoBanda1Delay

; ....................................
; ....................................
