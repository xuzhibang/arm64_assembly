
// ---  求最大的数字

.section .data 
.align 3 
my_data:
	.quad 25
	.quad 5
	.quad 63
	.quad 10
	.quad 80
	.quad 2


.align 3
print_data:
	.string "big data:%d\n"

print_format:
	.string "hello,world\n"

.align 3
.section .text

.global main
main:
	stp x29,x30,[sp,-16]!  


	ldr x0,=print_format   //  取得  print_format 的地址..
	bl printf 
	
	ldr x0,=my_data
	mov x1,xzr 
	add x2,x0,#40  # 结束的地址...  (n-1)*8 

1:	
	ldr x3,[x0],#8 
	cmp x3,x1 
	csel x1,x3,x1,hi 
	
	cmp x2,x0 
	b.hi 1b

	ldr x0 ,=print_data
	bl printf 

	mov x0,#0
	ldp x29,x30,[sp],16
	ret 
	

