	.file	"./test/test2.c"

#	Allocation of function variables and temporaries on the stack:

#	main
#	n1: -4
#	t0: -12
#	t1: -16
#	t10: -20
#	t11: -24
#	t12: -32
#	t13: -36
#	t14: -40
#	t15: -48
#	t16: -52
#	t17: -56
#	t18: -64
#	t19: -68
#	t2: -72
#	t20: -76
#	t21: -80
#	t22: -88
#	t23: -92
#	t24: -96
#	t25: -104
#	t26: -108
#	t27: -112
#	t28: -116
#	t29: -124
#	t3: -128
#	t30: -132
#	t31: -136
#	t32: -140
#	t33: -148
#	t34: -152
#	t35: -156
#	t36: -164
#	t37: -168
#	t38: -172
#	t39: -176
#	t4: -180
#	t40: -184
#	t41: -192
#	t42: -196
#	t43: -200
#	t44: -208
#	t45: -212
#	t46: -216
#	t47: -220
#	t5: -224
#	t6: -232
#	t7: -236
#	t8: -240
#	t9: -248
#	x: -252
#	y: -256
#	z: -260
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"\nTEST FILE 2: IF ELSE STATEMENTS\n"
.LC1:
	.string	"\nx = "
.LC2:
	.string	"\ny = "
.LC3:
	.string	"\nz = "
.LC4:
	.string	"\nn1 = "
.LC5:
	.string	"\n"
.LC6:
	.string	"x is greater than y and is between 100 and 700\n"
.LC7:
	.string	"x is greater than y and is not between 100 and 700\n"
.LC8:
	.string	"x is equal to y and n1 is greater than 1000\n"
.LC9:
	.string	"x is equal to y and n1 is equal to 1000\n"
.LC10:
	.string	"x is equal to y and n1 is less than 1000\n"
.LC11:
	.string	"x is less than y and y is between 100 and 500\n"
.LC12:
	.string	"x is less than y and y is not between 100 and 500\n"
	.text
	.globl  main
	.type   main, @function
main:
.LFB0:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $260, %rsp
	movq    $.LC0, -12(%rbp)
	movq    -12(%rbp), %rdi
	call    printStr
	movl    %eax, -16(%rbp)
	movl    $751, -72(%rbp)
	movl    -72(%rbp), %eax
	movl    %eax, -252(%rbp)
	movl    $483, -128(%rbp)
	movl    -128(%rbp), %eax
	movl    %eax, -256(%rbp)
	movl    $0, -180(%rbp)
	movl    -180(%rbp), %eax
	movl    %eax, -260(%rbp)
	movl    -252(%rbp), %eax
	addl    -256(%rbp), %eax
	movl    %eax, -224(%rbp)
	movl    -224(%rbp), %eax
	movl    %eax, -4(%rbp)
	movq    $.LC1, -232(%rbp)
	movq    -232(%rbp), %rdi
	call    printStr
	movl    %eax, -236(%rbp)
	movl    -252(%rbp), %edi
	call    printInt
	movl    %eax, -240(%rbp)
	movq    $.LC2, -248(%rbp)
	movq    -248(%rbp), %rdi
	call    printStr
	movl    %eax, -20(%rbp)
	movl    -256(%rbp), %edi
	call    printInt
	movl    %eax, -24(%rbp)
	movq    $.LC3, -32(%rbp)
	movq    -32(%rbp), %rdi
	call    printStr
	movl    %eax, -36(%rbp)
	movl    -260(%rbp), %edi
	call    printInt
	movl    %eax, -40(%rbp)
	movq    $.LC4, -48(%rbp)
	movq    -48(%rbp), %rdi
	call    printStr
	movl    %eax, -52(%rbp)
	movl    -4(%rbp), %edi
	call    printInt
	movl    %eax, -56(%rbp)
	movq    $.LC5, -64(%rbp)
	movq    -64(%rbp), %rdi
	call    printStr
	movl    %eax, -68(%rbp)
	movl    -256(%rbp), %eax
	cmpl    %eax, -252(%rbp)
	jg      .L1
	jmp     .L2
.L1:
	movl    $100, -76(%rbp)
	movl    -76(%rbp), %eax
	cmpl    %eax, -252(%rbp)
	jg      .L3
	jmp     .L4
.L3:
	movl    $700, -80(%rbp)
	movl    -80(%rbp), %eax
	cmpl    %eax, -252(%rbp)
	jl      .L5
	jmp     .L4
.L5:
	movq    $.LC6, -88(%rbp)
	movq    -88(%rbp), %rdi
	call    printStr
	movl    %eax, -92(%rbp)
	movl    $1, -96(%rbp)
	movl    -96(%rbp), %eax
	movl    %eax, -260(%rbp)
	jmp     .L6
.L4:
	movq    $.LC7, -104(%rbp)
	movq    -104(%rbp), %rdi
	call    printStr
	movl    %eax, -108(%rbp)
	movl    $2, -112(%rbp)
	movl    -112(%rbp), %eax
	movl    %eax, -260(%rbp)
	jmp     .L6
.L2:
	movl    -256(%rbp), %eax
	cmpl    %eax, -252(%rbp)
	je      .L7
	jmp     .L8
.L7:
	movl    $1000, -116(%rbp)
	movl    -116(%rbp), %eax
	cmpl    %eax, -4(%rbp)
	jg      .L9
	jmp     .L10
.L9:
	movq    $.LC8, -124(%rbp)
	movq    -124(%rbp), %rdi
	call    printStr
	movl    %eax, -132(%rbp)
	movl    $1, -136(%rbp)
	movl    -136(%rbp), %eax
	movl    %eax, -260(%rbp)
	jmp     .L6
.L10:
	movl    $1000, -140(%rbp)
	movl    -140(%rbp), %eax
	cmpl    %eax, -4(%rbp)
	je      .L11
	jmp     .L12
.L11:
	movq    $.LC9, -148(%rbp)
	movq    -148(%rbp), %rdi
	call    printStr
	movl    %eax, -152(%rbp)
	movl    -260(%rbp), %eax
	movl    %eax, -156(%rbp)
	decl    -260(%rbp)
	jmp     .L6
.L12:
	movq    $.LC10, -164(%rbp)
	movq    -164(%rbp), %rdi
	call    printStr
	movl    %eax, -168(%rbp)
	movl    $2, -172(%rbp)
	movl    -172(%rbp), %eax
	movl    %eax, -260(%rbp)
	jmp     .L6
.L8:
	movl    $100, -176(%rbp)
	movl    -176(%rbp), %eax
	cmpl    %eax, -256(%rbp)
	jg      .L13
	jmp     .L14
.L13:
	movl    $500, -184(%rbp)
	movl    -184(%rbp), %eax
	cmpl    %eax, -256(%rbp)
	jl      .L15
	jmp     .L14
.L15:
	movq    $.LC11, -192(%rbp)
	movq    -192(%rbp), %rdi
	call    printStr
	movl    %eax, -196(%rbp)
	movl    $3, -200(%rbp)
	movl    -200(%rbp), %eax
	movl    %eax, -260(%rbp)
	jmp     .L6
.L14:
	movq    $.LC12, -208(%rbp)
	movq    -208(%rbp), %rdi
	call    printStr
	movl    %eax, -212(%rbp)
	movl    $4, -216(%rbp)
	movl    -216(%rbp), %eax
	movl    %eax, -260(%rbp)
.L6:
	movl    $0, -220(%rbp)
	movl    -220(%rbp), %eax
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
