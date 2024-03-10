	.file	"./test/test4.c"

#	Allocation of function variables and temporaries on the stack:

#	_union
#	par: -8
#	px: -20
#	py: -24
#	t10: -28
#	t11: -32
#	t12: -36
#	x: -12
#	y: -16
#	find_par
#	p: -16
#	par: -8
#	t4: -20
#	t5: -24
#	t6: -28
#	t7: -32
#	t8: -36
#	t9: -40
#	x: -12
#	main
#	i: -4
#	par: -44
#	t13: -52
#	t14: -56
#	t15: -60
#	t16: -64
#	t18: -72
#	t19: -76
#	t20: -80
#	t21: -84
#	t22: -88
#	t23: -92
#	t24: -96
#	t25: -104
#	t26: -108
#	t27: -112
#	t28: -116
#	t29: -124
#	t30: -128
#	t31: -132
#	t32: -136
#	t34: -140
#	t35: -144
#	t37: -148
#	t38: -152
#	t40: -156
#	t41: -160
#	t43: -164
#	t44: -168
#	t46: -172
#	t47: -176
#	t49: -180
#	t50: -184
#	t52: -188
#	t53: -192
#	t55: -200
#	t56: -204
#	t57: -208
#	t58: -212
#	t59: -216
#	t60: -220
#	t61: -224
#	t62: -232
#	t63: -236
#	t64: -240
#	t65: -244
#	t66: -248
#	t67: -256
#	t68: -260
#	t69: -264
#	t70: -268
#	t71: -276
#	t72: -280
#	t73: -284
#	make
#	i: -16
#	n: -4
#	par: -12
#	t0: -20
#	t1: -24
#	t2: -28
#	t3: -32
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"TEST FILE 4: [Function calls and returns]\n"
.LC1:
	.string	"The parent array is: \n"
.LC2:
	.string	" "
.LC3:
	.string	"\n"
.LC4:
	.string	"After union find The parent array is: \n"
.LC5:
	.string	" -> "
.LC6:
	.string	"\n"
.LC7:
	.string	"\n"
	.text
	.globl  make
	.type   make, @function
make:
.LFB0:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $32, %rsp
	movq    %rdi, -12(%rbp)
	movl    %esi, -4(%rbp)
	movl    $0, -20(%rbp)
	movl    -20(%rbp), %eax
	movl    %eax, -16(%rbp)
.L5:
	movl    -4(%rbp), %eax
	cmpl    %eax, -16(%rbp)
	jl      .L4
	jmp     .LFE0
.L4:
	movl    -16(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -24(%rbp)
	movl    -24(%rbp), %eax
	cltq    
	addq    -12(%rbp), %rax
	movl    -16(%rbp), %ebx
	movl    %ebx, (%rax)
	movl    $1, -28(%rbp)
	movl    -16(%rbp), %eax
	addl    -28(%rbp), %eax
	movl    %eax, -32(%rbp)
	movl    -32(%rbp), %eax
	movl    %eax, -16(%rbp)
	jmp     .L5
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   make, .-make
	.text
	.globl  find_par
	.type   find_par, @function
find_par:
.LFB1:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $40, %rsp
	movl    %edi, -12(%rbp)
	movq    %rsi, -8(%rbp)
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -20(%rbp)
	movl    -20(%rbp), %eax
	cltq    
	addq    -8(%rbp), %rax
	movl    (%rax), %eax
	movl    %eax, -24(%rbp)
	movl    -12(%rbp), %eax
	cmpl    %eax, -24(%rbp)
	je      .L6
	jmp     .L7
.L6:
	movl    -12(%rbp), %eax
	jmp     .LFE1
	jmp     .L7
.L7:
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -28(%rbp)
	movl    -28(%rbp), %eax
	cltq    
	addq    -8(%rbp), %rax
	movl    (%rax), %eax
	movl    %eax, -32(%rbp)
	movq    -8(%rbp), %rsi
	movl    -32(%rbp), %edi
	call    find_par
	movl    %eax, -36(%rbp)
	movl    -36(%rbp), %eax
	movl    %eax, -16(%rbp)
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -40(%rbp)
	movl    -40(%rbp), %eax
	cltq    
	addq    -8(%rbp), %rax
	movl    -16(%rbp), %ebx
	movl    %ebx, (%rax)
	movl    -16(%rbp), %eax
.LFE1:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   find_par, .-find_par
	.text
	.globl  _union
	.type   _union, @function
_union:
.LFB2:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $36, %rsp
	movl    %edi, -12(%rbp)
	movl    %esi, -16(%rbp)
	movq    %rdx, -8(%rbp)
	movq    -8(%rbp), %rsi
	movl    -12(%rbp), %edi
	call    find_par
	movl    %eax, -28(%rbp)
	movl    -28(%rbp), %eax
	movl    %eax, -20(%rbp)
	movq    -8(%rbp), %rsi
	movl    -16(%rbp), %edi
	call    find_par
	movl    %eax, -32(%rbp)
	movl    -32(%rbp), %eax
	movl    %eax, -24(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jne     .L8
	jmp     .LFE2
.L8:
	movl    -20(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -36(%rbp)
	movl    -36(%rbp), %eax
	cltq    
	addq    -8(%rbp), %rax
	movl    -24(%rbp), %ebx
	movl    %ebx, (%rax)
	jmp     .LFE2
.LFE2:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   _union, .-_union
	.text
	.globl  main
	.type   main, @function
main:
.LFB3:
	.cfi_startproc
	pushq   %rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq    %rsp, %rbp
	.cfi_def_cfa_register 6
	subq    $284, %rsp
	movq    $.LC0, -52(%rbp)
	movq    -52(%rbp), %rdi
	call    printStr
	movl    %eax, -56(%rbp)
	movl    $10, -60(%rbp)
	movl    $10, -64(%rbp)
	movl    -64(%rbp), %esi
	leaq    -44(%rbp), %rdi
	call    make
	movq    $.LC1, -72(%rbp)
	movq    -72(%rbp), %rdi
	call    printStr
	movl    %eax, -76(%rbp)
	movl    $0, -80(%rbp)
	movl    -80(%rbp), %eax
	movl    %eax, -4(%rbp)
.L11:
	movl    $10, -84(%rbp)
	movl    -84(%rbp), %eax
	cmpl    %eax, -4(%rbp)
	jl      .L9
	jmp     .L10
.L9:
	movl    -4(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -88(%rbp)
	movl    -88(%rbp), %eax
	cltq    
	movl    -44(%rbp, %rax, 1), %eax
	movl    %eax, -92(%rbp)
	movl    -92(%rbp), %edi
	call    printInt
	movl    %eax, -96(%rbp)
	movq    $.LC2, -104(%rbp)
	movq    -104(%rbp), %rdi
	call    printStr
	movl    %eax, -108(%rbp)
	movl    $1, -112(%rbp)
	movl    -4(%rbp), %eax
	addl    -112(%rbp), %eax
	movl    %eax, -116(%rbp)
	movl    -116(%rbp), %eax
	movl    %eax, -4(%rbp)
	jmp     .L11
.L10:
	movq    $.LC3, -124(%rbp)
	movq    -124(%rbp), %rdi
	call    printStr
	movl    %eax, -128(%rbp)
	movl    $1, -132(%rbp)
	movl    $3, -136(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -136(%rbp), %esi
	movl    -132(%rbp), %edi
	call    _union
	movl    $3, -140(%rbp)
	movl    $5, -144(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -144(%rbp), %esi
	movl    -140(%rbp), %edi
	call    _union
	movl    $5, -148(%rbp)
	movl    $7, -152(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -152(%rbp), %esi
	movl    -148(%rbp), %edi
	call    _union
	movl    $7, -156(%rbp)
	movl    $9, -160(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -160(%rbp), %esi
	movl    -156(%rbp), %edi
	call    _union
	movl    $2, -164(%rbp)
	movl    $4, -168(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -168(%rbp), %esi
	movl    -164(%rbp), %edi
	call    _union
	movl    $4, -172(%rbp)
	movl    $6, -176(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -176(%rbp), %esi
	movl    -172(%rbp), %edi
	call    _union
	movl    $6, -180(%rbp)
	movl    $8, -184(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -184(%rbp), %esi
	movl    -180(%rbp), %edi
	call    _union
	movl    $8, -188(%rbp)
	movl    $10, -192(%rbp)
	leaq    -44(%rbp), %rdx
	movl    -192(%rbp), %esi
	movl    -188(%rbp), %edi
	call    _union
	movq    $.LC4, -200(%rbp)
	movq    -200(%rbp), %rdi
	call    printStr
	movl    %eax, -204(%rbp)
	movl    $0, -208(%rbp)
	movl    -208(%rbp), %eax
	movl    %eax, -4(%rbp)
.L14:
	movl    $10, -212(%rbp)
	movl    -212(%rbp), %eax
	cmpl    %eax, -4(%rbp)
	jl      .L12
	jmp     .L13
.L12:
	movl    $1, -216(%rbp)
	movl    -4(%rbp), %eax
	addl    -216(%rbp), %eax
	movl    %eax, -220(%rbp)
	movl    -220(%rbp), %edi
	call    printInt
	movl    %eax, -224(%rbp)
	movq    $.LC5, -232(%rbp)
	movq    -232(%rbp), %rdi
	call    printStr
	movl    %eax, -236(%rbp)
	movl    -4(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -240(%rbp)
	movl    -240(%rbp), %eax
	cltq    
	movl    -44(%rbp, %rax, 1), %eax
	movl    %eax, -244(%rbp)
	movl    -244(%rbp), %edi
	call    printInt
	movl    %eax, -248(%rbp)
	movq    $.LC6, -256(%rbp)
	movq    -256(%rbp), %rdi
	call    printStr
	movl    %eax, -260(%rbp)
	movl    $1, -264(%rbp)
	movl    -4(%rbp), %eax
	addl    -264(%rbp), %eax
	movl    %eax, -268(%rbp)
	movl    -268(%rbp), %eax
	movl    %eax, -4(%rbp)
	jmp     .L14
.L13:
	movq    $.LC7, -276(%rbp)
	movq    -276(%rbp), %rdi
	call    printStr
	movl    %eax, -280(%rbp)
	movl    $0, -284(%rbp)
	movl    -284(%rbp), %eax
.LFE3:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
