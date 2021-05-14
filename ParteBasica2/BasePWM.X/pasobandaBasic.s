;.....
;    File   pasobandaBasic.s 
;.....

    .equ pasobandaBasicNumTaps, 21

;.....
; Allocate and initialize filter taps

		.section .pasobandaBasicconst, "x"
		.align 64
pasobandaBasicTaps:
.hword 0xfe71, 0xf922, 0xf53d, 0xf392, 0xf478, 0xf7c1, 0xfcbf, 0x026a, 0x0796 
.hword 0x0b30, 0x0c7a, 0x0b30, 0x0796, 0x026a, 0xfcbf, 0xf7c1, 0xf478, 0xf392 
.hword 0xf53d, 0xf922, 0xfe71 

;.....
; Allocate delay line in (uninitialized) Y data space

		.section .ybss,  "b"
		.align 64

pasobandaBasicDelay:
		.space pasobandaBasicNumTaps*2

; .....
; Allocate and intialize filter structure

		.section .data
		.global _pasobandaBasicFilter

_pasobandaBasicFilter:
.hword pasobandaBasicNumTaps
.hword psvoffset(pasobandaBasicTaps)
.hword psvoffset(pasobandaBasicTaps)+pasobandaBasicNumTaps*2-1
.hword psvpage(pasobandaBasicTaps)
.hword pasobandaBasicDelay
.hword pasobandaBasicDelay+pasobandaBasicNumTaps*2-1
.hword pasobandaBasicDelay

; ....................................
; ....................................
