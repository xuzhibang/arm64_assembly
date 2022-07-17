print_format:
	.string "hello,world\n"

fmt : .ascii "\n %5d %5d \n"
a: .hword -100
b: .byte -2 

.align 3
.section .text

.global main
main:
	stp x29,x30,[sp,#-32]!  
	mov x29,sp 
	
	ldr x0,=print_format 
	bl printf  

	ldr x0,=a
	ldrsh x1,[x0]

	ldr x0,=b
	ldrsb x2,[x0]

	ldr x0,=fmt 
	bl printf 

	mov x0,#0
	ldp x29,x30,[sp],#32
	ret 


