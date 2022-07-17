#  打印  hello,world 程序...

print_format:
	.string "hello,world\n"

.align 3
.section .text

.global main
main:
	stp x29,x30,[sp,-16]!  


	ldr x0,=print_format   //  取得  print_format 的地址..
	bl printf 

	mov x0,#0
	ldp x29,x30,[sp],16
	ret 


