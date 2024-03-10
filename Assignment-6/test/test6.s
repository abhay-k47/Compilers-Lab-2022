	.file	"./test/test6.c"

#	Allocation of function variables and temporaries on the stack:

#	main
#	MAXN: -4
#	count: -8
#	i: -12
#	j: -16
#	n1: -20
#	n2: -24
#	prime: -4024
#	sum: -4028
#	t0: -4036
#	t1: -4040
#	t10: -4044
#	t100: -4052
#	t101: -4056
#	t102: -4064
#	t103: -4068
#	t104: -4072
#	t105: -4080
#	t106: -4084
#	t107: -4092
#	t108: -4096
#	t109: -4104
#	t11: -4108
#	t110: -4112
#	t111: -4120
#	t112: -4124
#	t113: -4132
#	t114: -4136
#	t115: -4144
#	t116: -4148
#	t117: -4152
#	t118: -4160
#	t119: -4164
#	t12: -4168
#	t120: -4176
#	t121: -4180
#	t122: -4188
#	t123: -4192
#	t124: -4200
#	t125: -4204
#	t126: -4208
#	t13: -4212
#	t14: -4216
#	t15: -4220
#	t16: -4224
#	t17: -4228
#	t18: -4232
#	t19: -4236
#	t2: -4240
#	t20: -4244
#	t21: -4248
#	t22: -4252
#	t23: -4256
#	t24: -4260
#	t25: -4268
#	t26: -4272
#	t27: -4276
#	t28: -4280
#	t29: -4284
#	t3: -4288
#	t30: -4292
#	t31: -4296
#	t32: -4300
#	t33: -4304
#	t34: -4308
#	t35: -4312
#	t36: -4316
#	t37: -4324
#	t38: -4328
#	t39: -4336
#	t4: -4340
#	t40: -4344
#	t41: -4348
#	t42: -4352
#	t43: -4356
#	t44: -4360
#	t45: -4364
#	t46: -4368
#	t47: -4372
#	t48: -4376
#	t49: -4384
#	t5: -4388
#	t50: -4392
#	t51: -4396
#	t52: -4400
#	t53: -4408
#	t54: -4412
#	t55: -4420
#	t56: -4424
#	t57: -4432
#	t58: -4436
#	t59: -4440
#	t6: -4444
#	t60: -4452
#	t61: -4456
#	t62: -4464
#	t63: -4468
#	t64: -4476
#	t65: -4480
#	t66: -4484
#	t67: -4488
#	t68: -4492
#	t69: -4500
#	t7: -4504
#	t70: -4508
#	t71: -4516
#	t72: -4520
#	t73: -4528
#	t74: -4532
#	t75: -4536
#	t76: -4540
#	t77: -4548
#	t78: -4552
#	t79: -4560
#	t8: -4564
#	t80: -4568
#	t81: -4576
#	t82: -4580
#	t83: -4588
#	t84: -4592
#	t85: -4600
#	t86: -4604
#	t87: -4612
#	t88: -4616
#	t89: -4620
#	t9: -4624
#	t90: -4628
#	t91: -4636
#	t92: -4640
#	t93: -4648
#	t94: -4652
#	t95: -4660
#	t96: -4664
#	t97: -4668
#	t98: -4676
#	t99: -4680
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"TEST FILE 6: [LOOPS AND RELATIONAL OPERATORS]\n"
.LC1:
	.string	"Number of primes less than 1000: "
.LC2:
	.string	"\n"
.LC3:
	.string	"Sum of primes less than 1000: "
.LC4:
	.string	"\n"
.LC5:
	.string	"\nTesting == operator: "
.LC6:
	.string	"Passed"
.LC7:
	.string	"Failed"
.LC8:
	.string	"\nTesting != operator: "
.LC9:
	.string	"Passed"
.LC10:
	.string	"Failed"
.LC11:
	.string	"\nTesting < operator (strictly less): "
.LC12:
	.string	"Passed"
.LC13:
	.string	"Failed"
.LC14:
	.string	"\nTesting < operator (equality): "
.LC15:
	.string	"Failed"
.LC16:
	.string	"Passed"
.LC17:
	.string	"\nTesting <= operator (equality): "
.LC18:
	.string	"Passed"
.LC19:
	.string	"Failed"
.LC20:
	.string	"\nTesting <= operator (strictly less): "
.LC21:
	.string	"Passed"
.LC22:
	.string	"Failed"
.LC23:
	.string	"\nTesting > operator (strictly greater): "
.LC24:
	.string	"Passed"
.LC25:
	.string	"Failed"
.LC26:
	.string	"\nTesting > operator (equality): "
.LC27:
	.string	"Failed"
.LC28:
	.string	"Passed"
.LC29:
	.string	"\nTesting >= operator (equality): "
.LC30:
	.string	"Passed"
.LC31:
	.string	"Failed"
.LC32:
	.string	"\nTesting >= operator (strictly greater): "
.LC33:
	.string	"Passed"
.LC34:
	.string	"Failed"
.LC35:
	.string	"\n\n"
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
	subq    $4680, %rsp
	movq    $.LC0, -4036(%rbp)
	movq    -4036(%rbp), %rdi
	call    printStr
	movl    %eax, -4040(%rbp)
	movl    $1000, -4240(%rbp)
	movl    -4240(%rbp), %eax
	movl    %eax, -4(%rbp)
	movl    $0, -4288(%rbp)
	movl    -4288(%rbp), %eax
	movl    %eax, -12(%rbp)
	movl    $0, -4340(%rbp)
	movl    -4340(%rbp), %eax
	movl    %eax, -4028(%rbp)
	movl    $1000, -4388(%rbp)
	movl    $0, -4444(%rbp)
	movl    -4444(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4504(%rbp)
	movl    $0, -4564(%rbp)
	movl    -4504(%rbp), %eax
	cltq    
	movl    -4564(%rbp), %ebx
	movl    %ebx, -4024(%rbp, %rax, 1)
	movl    $1, -4624(%rbp)
	movl    -4624(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4044(%rbp)
	movl    $0, -4108(%rbp)
	movl    -4044(%rbp), %eax
	cltq    
	movl    -4108(%rbp), %ebx
	movl    %ebx, -4024(%rbp, %rax, 1)
	movl    $2, -4168(%rbp)
	movl    -4168(%rbp), %eax
	movl    %eax, -12(%rbp)
.L3:
	movl    -4(%rbp), %eax
	cmpl    %eax, -12(%rbp)
	jl      .L1
	jmp     .L2
.L4:
	movl    -12(%rbp), %eax
	movl    %eax, -4212(%rbp)
	incl    -12(%rbp)
	jmp     .L3
.L1:
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4216(%rbp)
	movl    $1, -4220(%rbp)
	movl    -4216(%rbp), %eax
	cltq    
	movl    -4220(%rbp), %ebx
	movl    %ebx, -4024(%rbp, %rax, 1)
	jmp     .L4
.L2:
	movl    $2, -4224(%rbp)
	movl    -4224(%rbp), %eax
	movl    %eax, -12(%rbp)
.L7:
	movl    -4(%rbp), %eax
	cmpl    %eax, -12(%rbp)
	jl      .L5
	jmp     .L6
.L9:
	movl    -12(%rbp), %eax
	movl    %eax, -4228(%rbp)
	incl    -12(%rbp)
	jmp     .L7
.L5:
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4232(%rbp)
	movl    -4232(%rbp), %eax
	cltq    
	movl    -4024(%rbp, %rax, 1), %eax
	movl    %eax, -4236(%rbp)
	movl    $1, -4244(%rbp)
	movl    -4244(%rbp), %eax
	cmpl    %eax, -4236(%rbp)
	je      .L8
	jmp     .L9
.L8:
	movl    -12(%rbp), %eax
	imull   -12(%rbp), %eax
	movl    %eax, -4248(%rbp)
	movl    -4248(%rbp), %eax
	movl    %eax, -16(%rbp)
.L11:
	movl    -4(%rbp), %eax
	cmpl    %eax, -16(%rbp)
	jl      .L10
	jmp     .L9
.L10:
	movl    -16(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4252(%rbp)
	movl    $0, -4256(%rbp)
	movl    -4252(%rbp), %eax
	cltq    
	movl    -4256(%rbp), %ebx
	movl    %ebx, -4024(%rbp, %rax, 1)
	movl    -16(%rbp), %eax
	addl    -12(%rbp), %eax
	movl    %eax, -4260(%rbp)
	movl    -4260(%rbp), %eax
	movl    %eax, -16(%rbp)
	jmp     .L11
	jmp     .L9
	jmp     .L9
.L6:
	movq    $.LC1, -4268(%rbp)
	movq    -4268(%rbp), %rdi
	call    printStr
	movl    %eax, -4272(%rbp)
	movl    $0, -4276(%rbp)
	movl    -4276(%rbp), %eax
	movl    %eax, -8(%rbp)
	movl    $0, -4280(%rbp)
	movl    -4280(%rbp), %eax
	movl    %eax, -12(%rbp)
.L14:
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4284(%rbp)
	movl    -4284(%rbp), %eax
	cltq    
	movl    -4024(%rbp, %rax, 1), %eax
	movl    %eax, -4292(%rbp)
	movl    $1, -4296(%rbp)
	movl    -4296(%rbp), %eax
	cmpl    %eax, -4292(%rbp)
	je      .L12
	jmp     .L13
.L12:
	movl    $1, -4300(%rbp)
	movl    -8(%rbp), %eax
	addl    -4300(%rbp), %eax
	movl    %eax, -4304(%rbp)
	movl    -4304(%rbp), %eax
	movl    %eax, -8(%rbp)
	jmp     .L13
.L13:
	movl    $1, -4308(%rbp)
	movl    -12(%rbp), %eax
	addl    -4308(%rbp), %eax
	movl    %eax, -4312(%rbp)
	movl    -4312(%rbp), %eax
	movl    %eax, -12(%rbp)
	movl    -4(%rbp), %eax
	cmpl    %eax, -12(%rbp)
	jl      .L14
	jmp     .L15
.L15:
	movl    -8(%rbp), %edi
	call    printInt
	movl    %eax, -4316(%rbp)
	movq    $.LC2, -4324(%rbp)
	movq    -4324(%rbp), %rdi
	call    printStr
	movl    %eax, -4328(%rbp)
	movq    $.LC3, -4336(%rbp)
	movq    -4336(%rbp), %rdi
	call    printStr
	movl    %eax, -4344(%rbp)
	movl    $0, -4348(%rbp)
	movl    -4348(%rbp), %eax
	movl    %eax, -12(%rbp)
.L18:
	movl    -12(%rbp), %eax
	imull   $4, %eax
	movl    %eax, -4352(%rbp)
	movl    -4352(%rbp), %eax
	cltq    
	movl    -4024(%rbp, %rax, 1), %eax
	movl    %eax, -4356(%rbp)
	movl    $1, -4360(%rbp)
	movl    -4360(%rbp), %eax
	cmpl    %eax, -4356(%rbp)
	je      .L16
	jmp     .L17
.L16:
	movl    -4028(%rbp), %eax
	addl    -12(%rbp), %eax
	movl    %eax, -4364(%rbp)
	movl    -4364(%rbp), %eax
	movl    %eax, -4028(%rbp)
	jmp     .L17
.L17:
	movl    $1, -4368(%rbp)
	movl    -12(%rbp), %eax
	addl    -4368(%rbp), %eax
	movl    %eax, -4372(%rbp)
	movl    -4372(%rbp), %eax
	movl    %eax, -12(%rbp)
	movl    -4(%rbp), %eax
	cmpl    %eax, -12(%rbp)
	jl      .L18
	jmp     .L19
.L19:
	movl    -4028(%rbp), %edi
	call    printInt
	movl    %eax, -4376(%rbp)
	movq    $.LC4, -4384(%rbp)
	movq    -4384(%rbp), %rdi
	call    printStr
	movl    %eax, -4392(%rbp)
	movl    $5, -4396(%rbp)
	movl    -4396(%rbp), %eax
	movl    %eax, -20(%rbp)
	movl    $5, -4400(%rbp)
	movl    -4400(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC5, -4408(%rbp)
	movq    -4408(%rbp), %rdi
	call    printStr
	movl    %eax, -4412(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	je      .L20
	jmp     .L21
.L20:
	movq    $.LC6, -4420(%rbp)
	movq    -4420(%rbp), %rdi
	call    printStr
	movl    %eax, -4424(%rbp)
	jmp     .L22
.L21:
	movq    $.LC7, -4432(%rbp)
	movq    -4432(%rbp), %rdi
	call    printStr
	movl    %eax, -4436(%rbp)
.L22:
	movl    $6, -4440(%rbp)
	movl    -4440(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC8, -4452(%rbp)
	movq    -4452(%rbp), %rdi
	call    printStr
	movl    %eax, -4456(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jne     .L23
	jmp     .L24
.L23:
	movq    $.LC9, -4464(%rbp)
	movq    -4464(%rbp), %rdi
	call    printStr
	movl    %eax, -4468(%rbp)
	jmp     .L25
.L24:
	movq    $.LC10, -4476(%rbp)
	movq    -4476(%rbp), %rdi
	call    printStr
	movl    %eax, -4480(%rbp)
.L25:
	movl    $1, -4484(%rbp)
	movl    -4484(%rbp), %eax
	negl    %eax
	movl    %eax, -4488(%rbp)
	movl    -4488(%rbp), %eax
	movl    %eax, -20(%rbp)
	movl    $3, -4492(%rbp)
	movl    -4492(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC11, -4500(%rbp)
	movq    -4500(%rbp), %rdi
	call    printStr
	movl    %eax, -4508(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jl      .L26
	jmp     .L27
.L26:
	movq    $.LC12, -4516(%rbp)
	movq    -4516(%rbp), %rdi
	call    printStr
	movl    %eax, -4520(%rbp)
	jmp     .L28
.L27:
	movq    $.LC13, -4528(%rbp)
	movq    -4528(%rbp), %rdi
	call    printStr
	movl    %eax, -4532(%rbp)
.L28:
	movl    $1, -4536(%rbp)
	movl    -4536(%rbp), %eax
	negl    %eax
	movl    %eax, -4540(%rbp)
	movl    -4540(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC14, -4548(%rbp)
	movq    -4548(%rbp), %rdi
	call    printStr
	movl    %eax, -4552(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jl      .L29
	jmp     .L30
.L29:
	movq    $.LC15, -4560(%rbp)
	movq    -4560(%rbp), %rdi
	call    printStr
	movl    %eax, -4568(%rbp)
	jmp     .L31
.L30:
	movq    $.LC16, -4576(%rbp)
	movq    -4576(%rbp), %rdi
	call    printStr
	movl    %eax, -4580(%rbp)
.L31:
	movq    $.LC17, -4588(%rbp)
	movq    -4588(%rbp), %rdi
	call    printStr
	movl    %eax, -4592(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jle     .L32
	jmp     .L33
.L32:
	movq    $.LC18, -4600(%rbp)
	movq    -4600(%rbp), %rdi
	call    printStr
	movl    %eax, -4604(%rbp)
	jmp     .L34
.L33:
	movq    $.LC19, -4612(%rbp)
	movq    -4612(%rbp), %rdi
	call    printStr
	movl    %eax, -4616(%rbp)
.L34:
	movl    $2, -4620(%rbp)
	movl    -4620(%rbp), %eax
	negl    %eax
	movl    %eax, -4628(%rbp)
	movl    -4628(%rbp), %eax
	movl    %eax, -20(%rbp)
	movq    $.LC20, -4636(%rbp)
	movq    -4636(%rbp), %rdi
	call    printStr
	movl    %eax, -4640(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jle     .L35
	jmp     .L36
.L35:
	movq    $.LC21, -4648(%rbp)
	movq    -4648(%rbp), %rdi
	call    printStr
	movl    %eax, -4652(%rbp)
	jmp     .L37
.L36:
	movq    $.LC22, -4660(%rbp)
	movq    -4660(%rbp), %rdi
	call    printStr
	movl    %eax, -4664(%rbp)
.L37:
	movl    $7, -4668(%rbp)
	movl    -4668(%rbp), %eax
	movl    %eax, -20(%rbp)
	movq    $.LC23, -4676(%rbp)
	movq    -4676(%rbp), %rdi
	call    printStr
	movl    %eax, -4680(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jg      .L38
	jmp     .L39
.L38:
	movq    $.LC24, -4052(%rbp)
	movq    -4052(%rbp), %rdi
	call    printStr
	movl    %eax, -4056(%rbp)
	jmp     .L40
.L39:
	movq    $.LC25, -4064(%rbp)
	movq    -4064(%rbp), %rdi
	call    printStr
	movl    %eax, -4068(%rbp)
.L40:
	movl    $7, -4072(%rbp)
	movl    -4072(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC26, -4080(%rbp)
	movq    -4080(%rbp), %rdi
	call    printStr
	movl    %eax, -4084(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jg      .L41
	jmp     .L42
.L41:
	movq    $.LC27, -4092(%rbp)
	movq    -4092(%rbp), %rdi
	call    printStr
	movl    %eax, -4096(%rbp)
	jmp     .L43
.L42:
	movq    $.LC28, -4104(%rbp)
	movq    -4104(%rbp), %rdi
	call    printStr
	movl    %eax, -4112(%rbp)
.L43:
	movq    $.LC29, -4120(%rbp)
	movq    -4120(%rbp), %rdi
	call    printStr
	movl    %eax, -4124(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jge     .L44
	jmp     .L45
.L44:
	movq    $.LC30, -4132(%rbp)
	movq    -4132(%rbp), %rdi
	call    printStr
	movl    %eax, -4136(%rbp)
	jmp     .L46
.L45:
	movq    $.LC31, -4144(%rbp)
	movq    -4144(%rbp), %rdi
	call    printStr
	movl    %eax, -4148(%rbp)
.L46:
	movl    $8, -4152(%rbp)
	movl    -4152(%rbp), %eax
	movl    %eax, -20(%rbp)
	movq    $.LC32, -4160(%rbp)
	movq    -4160(%rbp), %rdi
	call    printStr
	movl    %eax, -4164(%rbp)
	movl    -24(%rbp), %eax
	cmpl    %eax, -20(%rbp)
	jge     .L47
	jmp     .L48
.L47:
	movq    $.LC33, -4176(%rbp)
	movq    -4176(%rbp), %rdi
	call    printStr
	movl    %eax, -4180(%rbp)
	jmp     .L49
.L48:
	movq    $.LC34, -4188(%rbp)
	movq    -4188(%rbp), %rdi
	call    printStr
	movl    %eax, -4192(%rbp)
.L49:
	movq    $.LC35, -4200(%rbp)
	movq    -4200(%rbp), %rdi
	call    printStr
	movl    %eax, -4204(%rbp)
	movl    $0, -4208(%rbp)
	movl    -4208(%rbp), %eax
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
