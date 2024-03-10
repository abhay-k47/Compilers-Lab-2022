	.file	"./test/test3.c"

#	Allocation of function variables and temporaries on the stack:

#	main
#	a: -40
#	eP: -44
#	i: -48
#	j: -52
#	maxe: -56
#	mine: -60
#	n: -64
#	sum: -68
#	t0: -76
#	t1: -80
#	t10: -84
#	t11: -92
#	t12: -96
#	t13: -100
#	t14: -108
#	t15: -112
#	t16: -116
#	t17: -120
#	t18: -128
#	t19: -132
#	t2: -136
#	t20: -140
#	t21: -144
#	t22: -148
#	t23: -156
#	t24: -160
#	t25: -164
#	t26: -168
#	t27: -176
#	t28: -180
#	t29: -184
#	t3: -188
#	t30: -192
#	t31: -196
#	t32: -200
#	t33: -204
#	t34: -208
#	t35: -216
#	t36: -220
#	t37: -224
#	t38: -232
#	t39: -236
#	t4: -240
#	t40: -244
#	t41: -248
#	t42: -252
#	t43: -256
#	t44: -260
#	t45: -264
#	t46: -268
#	t47: -276
#	t48: -280
#	t49: -284
#	t5: -288
#	t50: -296
#	t51: -300
#	t52: -304
#	t53: -308
#	t54: -312
#	t55: -316
#	t56: -320
#	t57: -324
#	t58: -328
#	t59: -336
#	t6: -340
#	t60: -344
#	t61: -348
#	t62: -356
#	t63: -360
#	t64: -364
#	t7: -368
#	t8: -372
#	t9: -376
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"TEST FILE 3: [1-D ARRAYS]\n"
.LC1:
	.string	"Enter 10 numbers: \n"
.LC2:
	.string	"The numbers are: \n"
.LC3:
	.string	" "
.LC4:
	.string	"\n"
.LC5:
	.string	"The sum of the numbers is: "
.LC6:
	.string	"\n"
.LC7:
	.string	"The maximum element is: "
.LC8:
	.string	"\n"
.LC9:
	.string	"The minimum element is: "
.LC10:
	.string	"\n"
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
	subq    $376, %rsp
	movq    $.LC0, -76(%rbp)
	movq    -76(%rbp), %rdi
	call    printStr
	movl    %eax, -80(%rbp)
	movl    $10, -136(%rbp)
	movl    $0, -188(%rbp)
	movl    -188(%rbp), %eax
	movl    %eax, -48(%rbp)
	movl    $0, -240(%rbp)
	movl    -240(%rbp), %eax
	movl    %eax, -52(%rbp)
	movl    $10, -288(%rbp)
	movl    -288(%rbp), %eax
	movl    %eax, -64(%rbp)
	movl    $0, -340(%rbp)
	movl    -340(%rbp), %eax
	movl    %eax, -68(%rbp)
	movl    $0, -368(%rbp)
	movl    -368(%rbp), %eax
	movl    %eax, -44(%rbp)
	movl    $1000000, -372(%rbp)
	movl    -372(%rbp), %eax
	negl    %eax
	movl    %eax, -376(%rbp)
	movl    -376(%rbp), %eax
	movl    %eax, -56(%rbp)
	movl    $1000000, -84(%rbp)
	movl    -84(%rbp), %eax
	movl    %eax, -60(%rbp)
	movq    $.LC1, -92(%rbp)
	movq    -92(%rbp), %rdi
	call    printStr
	movl    %eax, -96(%rbp)
.L3:
	movl    -64(%rbp), %eax
	cmpl    %eax, -48(%rbp)
	jl      .L1
	jmp     .L2
.L1:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -100(%rbp)
	leaq    -44(%rbp), %rax
	movq    %rax, -108(%rbp)
	movq    -108(%rbp), %rdi
	call    readInt
	movl    %eax, -112(%rbp)
	movl    -100(%rbp), %eax
	cltq    
	movl    -112(%rbp), %ebx
	movl    %ebx, -40(%rbp, %rax, 1)
	movl    $1, -116(%rbp)
	movl    -48(%rbp), %eax
	addl    -116(%rbp), %eax
	movl    %eax, -120(%rbp)
	movl    -120(%rbp), %eax
	movl    %eax, -48(%rbp)
	jmp     .L3
.L2:
	movq    $.LC2, -128(%rbp)
	movq    -128(%rbp), %rdi
	call    printStr
	movl    %eax, -132(%rbp)
.L6:
	movl    -64(%rbp), %eax
	cmpl    %eax, -52(%rbp)
	jl      .L4
	jmp     .L5
.L4:
	movl    -52(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -140(%rbp)
	movl    -140(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -144(%rbp)
	movl    -144(%rbp), %edi
	call    printInt
	movl    %eax, -148(%rbp)
	movq    $.LC3, -156(%rbp)
	movq    -156(%rbp), %rdi
	call    printStr
	movl    %eax, -160(%rbp)
	movl    $1, -164(%rbp)
	movl    -52(%rbp), %eax
	addl    -164(%rbp), %eax
	movl    %eax, -168(%rbp)
	movl    -168(%rbp), %eax
	movl    %eax, -52(%rbp)
	jmp     .L6
.L5:
	movq    $.LC4, -176(%rbp)
	movq    -176(%rbp), %rdi
	call    printStr
	movl    %eax, -180(%rbp)
	movl    $0, -184(%rbp)
	movl    -184(%rbp), %eax
	movl    %eax, -48(%rbp)
.L9:
	movl    -64(%rbp), %eax
	cmpl    %eax, -48(%rbp)
	jl      .L7
	jmp     .L8
.L7:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -192(%rbp)
	movl    -192(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -196(%rbp)
	movl    -68(%rbp), %eax
	addl    -196(%rbp), %eax
	movl    %eax, -200(%rbp)
	movl    -200(%rbp), %eax
	movl    %eax, -68(%rbp)
	movl    $1, -204(%rbp)
	movl    -48(%rbp), %eax
	addl    -204(%rbp), %eax
	movl    %eax, -208(%rbp)
	movl    -208(%rbp), %eax
	movl    %eax, -48(%rbp)
	jmp     .L9
.L8:
	movq    $.LC5, -216(%rbp)
	movq    -216(%rbp), %rdi
	call    printStr
	movl    %eax, -220(%rbp)
	movl    -68(%rbp), %edi
	call    printInt
	movl    %eax, -224(%rbp)
	movq    $.LC6, -232(%rbp)
	movq    -232(%rbp), %rdi
	call    printStr
	movl    %eax, -236(%rbp)
	movl    $0, -244(%rbp)
	movl    -244(%rbp), %eax
	movl    %eax, -48(%rbp)
.L14:
	movl    -64(%rbp), %eax
	cmpl    %eax, -48(%rbp)
	jl      .L10
	jmp     .L11
.L10:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -248(%rbp)
	movl    -248(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -252(%rbp)
	movl    -56(%rbp), %eax
	cmpl    %eax, -252(%rbp)
	jg      .L12
	jmp     .L13
.L12:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -256(%rbp)
	movl    -256(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -260(%rbp)
	movl    -260(%rbp), %eax
	movl    %eax, -56(%rbp)
	jmp     .L13
.L13:
	movl    $1, -264(%rbp)
	movl    -48(%rbp), %eax
	addl    -264(%rbp), %eax
	movl    %eax, -268(%rbp)
	movl    -268(%rbp), %eax
	movl    %eax, -48(%rbp)
	jmp     .L14
.L11:
	movq    $.LC7, -276(%rbp)
	movq    -276(%rbp), %rdi
	call    printStr
	movl    %eax, -280(%rbp)
	movl    -56(%rbp), %edi
	call    printInt
	movl    %eax, -284(%rbp)
	movq    $.LC8, -296(%rbp)
	movq    -296(%rbp), %rdi
	call    printStr
	movl    %eax, -300(%rbp)
	movl    $0, -304(%rbp)
	movl    -304(%rbp), %eax
	movl    %eax, -48(%rbp)
.L19:
	movl    -64(%rbp), %eax
	cmpl    %eax, -48(%rbp)
	jl      .L15
	jmp     .L16
.L15:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -308(%rbp)
	movl    -308(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -312(%rbp)
	movl    -60(%rbp), %eax
	cmpl    %eax, -312(%rbp)
	jl      .L17
	jmp     .L18
.L17:
	movl    -48(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -316(%rbp)
	movl    -316(%rbp), %eax
	cltq    
	movl    -40(%rbp, %rax, 1), %eax
	movl    %eax, -320(%rbp)
	movl    -320(%rbp), %eax
	movl    %eax, -60(%rbp)
	jmp     .L18
.L18:
	movl    $1, -324(%rbp)
	movl    -48(%rbp), %eax
	addl    -324(%rbp), %eax
	movl    %eax, -328(%rbp)
	movl    -328(%rbp), %eax
	movl    %eax, -48(%rbp)
	jmp     .L19
.L16:
	movq    $.LC9, -336(%rbp)
	movq    -336(%rbp), %rdi
	call    printStr
	movl    %eax, -344(%rbp)
	movl    -60(%rbp), %edi
	call    printInt
	movl    %eax, -348(%rbp)
	movq    $.LC10, -356(%rbp)
	movq    -356(%rbp), %rdi
	call    printStr
	movl    %eax, -360(%rbp)
	movl    $0, -364(%rbp)
	movl    -364(%rbp), %eax
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
