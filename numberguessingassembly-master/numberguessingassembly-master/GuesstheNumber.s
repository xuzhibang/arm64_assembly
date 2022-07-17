//.text
.global _main
//.global getc
//.global _getinput
//.global rnum



.data
randPath:
.ascii "/dev/urandom"

//msg:
//.ascii "output:"

rnum:
.word 0

out:
.byte 0

number:
.byte 0

yes:
.ascii "yes, you got it!"

no:
.ascii "try another number"



.text
.align 4

goodoutput:
MOV X0, #1 ; STDOUT
ADRP X1, yes@page ; Address van yes
add x1, x1, yes@pageoff
//strb w17, [x1]
MOV X2, #16
MOV X16, #4
SVC #0x80 ; syscall

RET

wrongoutput:
MOV X0, #1 ; STDOUT
ADRP X1, no@page ; Address van yes
add x1, x1, no@pageoff
//strb w17, [x1]
MOV X2, #18
MOV X16, #4
SVC #0x80 ; syscall


RET




_main:


ADRP X0, randPath@page
ADD X0, X0, randPath@pageoff
MOV x1, #0
MOV x2, #700
MOV x16, #5
SVC #0x80

ADRP x1, rnum@page
ADD x1, x1, rnum@pageoff
MOV x2, #4 ; 32-bits of random
MOV x16, #3 ; SYS_READ
SVC #0x80

ADRP x0, rnum@page
ADD x0, x0, rnum@pageoff
ldrb W0, [X0]

MOV X1, #10
UDIV x2, x0, x1
MSUB x3, x2, x1, x0


MOV X0, #1 ; STDOUT
ADRP X1, out@page ; Address van yes
add x1, x1, out@pageoff
add x3, x3, #48

strb w3, [x1]

MOV X0, #0 ; STDIN
ADRP x1, number@page ; Address van number
add x1, x1, number@pageoff
MOV X2, #1
MOV X16, #3
SVC #0x80 ; syscall

ADRP X1, number@page
ADD X1, X1, number@pageoff
LDRB W0, [X1]

cmp x3, x0
//add w1, w1, 1
b.eq goodoutput
b.ne wrongoutput



RET
