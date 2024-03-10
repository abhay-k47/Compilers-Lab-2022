	.file	"./test/test5.c"

#	Allocation of function variables and temporaries on the stack:

#	main
#	college: -8
#	ptr: -16
#	t13: -24
#	t14: -28
#	t15: -32
#	t16: -36
#	t17: -40
#	t18: -48
#	t19: -52
#	t20: -56
#	t21: -64
#	t22: -68
#	t23: -72
#	t24: -80
#	t25: -84
#	t26: -88
#	t27: -96
#	t28: -100
#	t29: -104
#	t30: -112
#	t31: -116
#	t32: -124
#	t33: -128
#	t34: -136
#	t35: -140
#	t36: -148
#	t37: -156
#	t38: -160
#	t39: -168
#	t40: -172
#	t41: -176
#	t42: -184
#	t43: -188
#	t44: -192
#	t45: -200
#	t46: -204
#	t47: -208
#	t48: -212
#	t49: -220
#	t50: -224
#	t51: -232
#	t52: -240
#	t53: -244
#	t54: -252
#	t55: -256
#	t56: -260
#	t57: -268
#	t58: -272
#	t59: -276
#	t60: -280
#	t61: -288
#	t62: -292
#	t63: -300
#	t64: -304
#	t65: -308
#	t66: -316
#	t67: -320
#	t68: -328
#	t69: -332
#	t70: -336
#	t71: -344
#	t72: -348
#	t73: -356
#	t74: -364
#	t75: -368
#	t76: -372
#	t77: -376
#	t78: -384
#	t79: -388
#	t80: -392
#	t81: -396
#	t82: -404
#	t83: -408
#	t84: -412
#	t85: -420
#	t86: -424
#	t87: -428
#	t88: -432
#	x: -436
#	y: -440
#	year: -444
#	z: -448
#	modulo_exponentiation
#	res: -12
#	t10: -16
#	t11: -20
#	t2: -24
#	t3: -28
#	t4: -32
#	t5: -36
#	t6: -40
#	t7: -44
#	t8: -48
#	t9: -52
#	x: -4
#	y: -8
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"CODE EXECUTED SUCCESSFULLY\n"
.LC1:
	.string	"TEST FILE 5: [Global variables]\n"
.LC2:
	.string	"\nx = "
.LC3:
	.string	"\ny = "
.LC4:
	.string	"\nx^y = z = "
.LC5:
	.string	" (MOD "
.LC6:
	.string	")\n"
.LC7:
	.string	"\n"
.LC8:
	.string	"IIT Kharagpur"
.LC9:
	.string	"Local variables:\n"
.LC10:
	.string	"college = "
.LC11:
	.string	"\nyear = "
.LC12:
	.string	"\nptr = "
.LC13:
	.string	"\n"
.LC14:
	.string	"Global variables:\n"
.LC15:
	.string	"numGlobal = "
.LC16:
	.string	"\nptrGlobal = "
.LC17:
	.string	"\n"
.LC18:
	.string	"MOD = "
.LC19:
	.string	"\n"
.LC20:
	.string	"year = numGlobal = "
.LC21:
	.string	"\n"
.LC22:
	.string	"ptrGlobal = &year = "
.LC23:
	.string	"\n"
.LC24:
	.string	"numGlobal = year * 5 = "
.LC25:
	.string	"\n"
	.comm	ptrGlobal,8,8
	.globl  MOD
	.data   
	.align  4
	.type   MOD, @object
	.size   MOD, 4
MOD:
	.long   19
	.section	.data.rel.local
	.align  8
	.type   success, @object
	.size   success, 8
success:
	.quad   .LC0
	.text
	.globl  modulo_exponentiation
	.type   modulo_exponentiation, @function
modulo_exponentiation:
.LFB0:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $52, %rsp
	movl    %edi, -4(%rbp)
	movl    %esi, -8(%rbp)
	movl    $1, -24(%rbp)
	movl    -24(%rbp), %eax
	movl    %eax, -12(%rbp)
.L6:
	movl    $0, -28(%rbp)
	movl    -28(%rbp), %eax
	cmpl    %eax, -8(%rbp)
	jg      .L2
	jmp     .L3
.L2:
	movl    $1, -32(%rbp)
.L5:
	movl    -12(%rbp), %eax
	imull   -4(%rbp), %eax
	movl    %eax, -40(%rbp)
	movl    -40(%rbp), %eax
	cdq     
	idivl   MOD
	movl    %edx, -44(%rbp)
	movl    -44(%rbp), %eax
	movl    %eax, -12(%rbp)
	jmp     .L4
	movl    0, %eax
	cmpl    %eax, -36(%rbp)
	je      .L4
	jmp     .L5
.L4:
	movl    $2, -48(%rbp)
	movl    -8(%rbp), %eax
	cdq     
	idivl   -48(%rbp)
	movl    %eax, -52(%rbp)
	movl    -52(%rbp), %eax
	movl    %eax, -8(%rbp)
	movl    -4(%rbp), %eax
	imull   -4(%rbp), %eax
	movl    %eax, -16(%rbp)
	movl    -16(%rbp), %eax
	cdq     
	idivl   MOD
	movl    %edx, -20(%rbp)
	movl    -20(%rbp), %eax
	movl    %eax, -4(%rbp)
	jmp     .L6
.L3:
	movl    -12(%rbp), %eax
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   modulo_exponentiation, .-modulo_exponentiation
	.globl  numGlobal
	.data   
	.align  4
	.type   numGlobal, @object
	.size   numGlobal, 4
numGlobal:
	.long   200
	.text
	.globl  main
	.type   main, @function
main:
.LFB1:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $448, %rsp
	movq    $.LC1, -24(%rbp)
	movq    -24(%rbp), %rdi
	call    printStr
	movl    %eax, -28(%rbp)
	movl    $23, -32(%rbp)
	movl    -32(%rbp), %eax
	movl    %eax, -436(%rbp)
	movl    $12, -36(%rbp)
	movl    -36(%rbp), %eax
	movl    %eax, -440(%rbp)
	movl    -440(%rbp), %esi
	movl    -436(%rbp), %edi
	call    modulo_exponentiation
	movl    %eax, -40(%rbp)
	movl    -40(%rbp), %eax
	movl    %eax, -448(%rbp)
	movq    $.LC2, -48(%rbp)
	movq    -48(%rbp), %rdi
	call    printStr
	movl    %eax, -52(%rbp)
	movl    -436(%rbp), %edi
	call    printInt
	movl    %eax, -56(%rbp)
	movq    $.LC3, -64(%rbp)
	movq    -64(%rbp), %rdi
	call    printStr
	movl    %eax, -68(%rbp)
	movl    -440(%rbp), %edi
	call    printInt
	movl    %eax, -72(%rbp)
	movq    $.LC4, -80(%rbp)
	movq    -80(%rbp), %rdi
	call    printStr
	movl    %eax, -84(%rbp)
	movl    -448(%rbp), %edi
	call    printInt
	movl    %eax, -88(%rbp)
	movq    $.LC5, -96(%rbp)
	movq    -96(%rbp), %rdi
	call    printStr
	movl    %eax, -100(%rbp)
	movl    MOD, %edi
	call    printInt
	movl    %eax, -104(%rbp)
	movq    $.LC6, -112(%rbp)
	movq    -112(%rbp), %rdi
	call    printStr
	movl    %eax, -116(%rbp)
	movq    $.LC7, -124(%rbp)
	movq    -124(%rbp), %rdi
	call    printStr
	movl    %eax, -128(%rbp)
	movq    $.LC8, -136(%rbp)
	movq    -136(%rbp), %rax
	movq    %rax, -8(%rbp)
	movl    $1951, -140(%rbp)
	movl    -140(%rbp), %eax
	movl    %eax, -444(%rbp)
	leaq    -444(%rbp), %rax
	movq    %rax, -148(%rbp)
	movq    -148(%rbp), %rax
	movq    %rax, -16(%rbp)
	movq    $.LC9, -156(%rbp)
	movq    -156(%rbp), %rdi
	call    printStr
	movl    %eax, -160(%rbp)
	movq    $.LC10, -168(%rbp)
	movq    -168(%rbp), %rdi
	call    printStr
	movl    %eax, -172(%rbp)
	movq    -8(%rbp), %rdi
	call    printStr
	movl    %eax, -176(%rbp)
	movq    $.LC11, -184(%rbp)
	movq    -184(%rbp), %rdi
	call    printStr
	movl    %eax, -188(%rbp)
	movl    -444(%rbp), %edi
	call    printInt
	movl    %eax, -192(%rbp)
	movq    $.LC12, -200(%rbp)
	movq    -200(%rbp), %rdi
	call    printStr
	movl    %eax, -204(%rbp)
	movq    -16(%rbp), %rax
	movl    (%rax), %eax
	movl    %eax, -208(%rbp)
	movl    -208(%rbp), %edi
	call    printInt
	movl    %eax, -212(%rbp)
	movq    $.LC13, -220(%rbp)
	movq    -220(%rbp), %rdi
	call    printStr
	movl    %eax, -224(%rbp)
	leaq    numGlobal, %rax
	movq    %rax, -232(%rbp)
	movq    -232(%rbp), %rax
	movq    %rax, ptrGlobal
	movq    $.LC14, -240(%rbp)
	movq    -240(%rbp), %rdi
	call    printStr
	movl    %eax, -244(%rbp)
	movq    $.LC15, -252(%rbp)
	movq    -252(%rbp), %rdi
	call    printStr
	movl    %eax, -256(%rbp)
	movl    numGlobal, %edi
	call    printInt
	movl    %eax, -260(%rbp)
	movq    $.LC16, -268(%rbp)
	movq    -268(%rbp), %rdi
	call    printStr
	movl    %eax, -272(%rbp)
	movq    ptrGlobal, %rax
	movl    (%rax), %eax
	movl    %eax, -276(%rbp)
	movl    -276(%rbp), %edi
	call    printInt
	movl    %eax, -280(%rbp)
	movq    $.LC17, -288(%rbp)
	movq    -288(%rbp), %rdi
	call    printStr
	movl    %eax, -292(%rbp)
	movq    $.LC18, -300(%rbp)
	movq    -300(%rbp), %rdi
	call    printStr
	movl    %eax, -304(%rbp)
	movl    MOD, %edi
	call    printInt
	movl    %eax, -308(%rbp)
	movq    $.LC19, -316(%rbp)
	movq    -316(%rbp), %rdi
	call    printStr
	movl    %eax, -320(%rbp)
	movl    numGlobal, %eax
	movl    %eax, -444(%rbp)
	movq    $.LC20, -328(%rbp)
	movq    -328(%rbp), %rdi
	call    printStr
	movl    %eax, -332(%rbp)
	movl    -444(%rbp), %edi
	call    printInt
	movl    %eax, -336(%rbp)
	movq    $.LC21, -344(%rbp)
	movq    -344(%rbp), %rdi
	call    printStr
	movl    %eax, -348(%rbp)
	leaq    -444(%rbp), %rax
	movq    %rax, -356(%rbp)
	movq    -356(%rbp), %rax
	movq    %rax, ptrGlobal
	movq    $.LC22, -364(%rbp)
	movq    -364(%rbp), %rdi
	call    printStr
	movl    %eax, -368(%rbp)
	movq    ptrGlobal, %rax
	movl    (%rax), %eax
	movl    %eax, -372(%rbp)
	movl    -372(%rbp), %edi
	call    printInt
	movl    %eax, -376(%rbp)
	movq    $.LC23, -384(%rbp)
	movq    -384(%rbp), %rdi
	call    printStr
	movl    %eax, -388(%rbp)
	movl    $5, -392(%rbp)
	movl    -444(%rbp), %eax
	imull   -392(%rbp), %eax
	movl    %eax, -396(%rbp)
	movl    -396(%rbp), %eax
	movl    %eax, numGlobal
	movq    $.LC24, -404(%rbp)
	movq    -404(%rbp), %rdi
	call    printStr
	movl    %eax, -408(%rbp)
	movl    numGlobal, %edi
	call    printInt
	movl    %eax, -412(%rbp)
	movq    $.LC25, -420(%rbp)
	movq    -420(%rbp), %rdi
	call    printStr
	movl    %eax, -424(%rbp)
	movq    success, %rdi
	call    printStr
	movl    %eax, -428(%rbp)
	movl    $0, -432(%rbp)
	movl    -432(%rbp), %eax
.LFE1:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
