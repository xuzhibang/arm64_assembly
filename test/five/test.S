print_format:
	.string "hello,world\n"

fmt : .ascii "\n %10d  \n"
array: .quad  0,1,2,3,4,5,6,7,8,9 

// // ARM汇编循环语句框架、数组求和


.equ counter,(.-array)/8  

.align 3
.section .text

.global main
main:
	stp x29,x30,[sp,#-32]!  
	mov x29,sp 
	
	ldr x0,=print_format 
	bl printf  

	mov x4,0 
	mov x6,0 
	ldr x5,=array 
	
	b testfor 
loop:
	ldr x2,[x5],#8
	add x6,x6,x2 
	add x4,x4,#1 

testfor:
	cmp x4,#counter 
	b.lt loop 
	ldr x0,=fmt 
	mov x1,x6 
	bl printf 

	mov x0,#0
	ldp x29,x30,[sp],#32
	ret 


