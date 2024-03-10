	.file	"./test/test1.c"

#	Allocation of function variables and temporaries on the stack:

#	main
#	a: -4
#	aa: -8
#	b: -12
#	bb: -16
#	c: -24
#	cc: -28
#	d: -32
#	e: -36
#	result: -40
#	t0: -48
#	t1: -52
#	t10: -56
#	t100: -64
#	t101: -68
#	t102: -72
#	t103: -76
#	t11: -80
#	t12: -88
#	t13: -92
#	t14: -96
#	t15: -104
#	t16: -108
#	t17: -112
#	t18: -120
#	t19: -124
#	t2: -128
#	t20: -136
#	t21: -140
#	t22: -144
#	t23: -148
#	t24: -156
#	t25: -160
#	t26: -164
#	t27: -172
#	t28: -176
#	t29: -184
#	t3: -188
#	t30: -192
#	t31: -196
#	t32: -204
#	t33: -208
#	t34: -212
#	t35: -216
#	t36: -224
#	t37: -228
#	t38: -232
#	t39: -240
#	t4: -244
#	t40: -248
#	t41: -256
#	t42: -260
#	t43: -264
#	t44: -272
#	t45: -276
#	t46: -284
#	t47: -288
#	t48: -292
#	t49: -300
#	t5: -304
#	t50: -308
#	t51: -316
#	t52: -320
#	t53: -324
#	t54: -332
#	t55: -336
#	t56: -344
#	t57: -348
#	t58: -352
#	t59: -360
#	t6: -364
#	t60: -368
#	t61: -372
#	t62: -380
#	t63: -384
#	t64: -392
#	t65: -396
#	t66: -400
#	t67: -404
#	t68: -412
#	t69: -416
#	t7: -420
#	t70: -428
#	t71: -432
#	t72: -436
#	t73: -440
#	t74: -448
#	t75: -452
#	t76: -460
#	t77: -464
#	t78: -468
#	t79: -476
#	t8: -480
#	t80: -484
#	t81: -492
#	t82: -496
#	t83: -500
#	t84: -508
#	t85: -512
#	t86: -516
#	t87: -520
#	t88: -524
#	t89: -528
#	t9: -536
#	t90: -540
#	t91: -544
#	t92: -548
#	t93: -552
#	t94: -556
#	t95: -560
#	t96: -564
#	t97: -568
#	t98: -576
#	t99: -580
#	v: -584
#	w: -588
#	x: -592
#	y: -596
#	z: -600
#	printInt
#	n: -4
#	printStr
#	s: -8
#	readInt
#	eP: -8

	.section	.rodata
.LC0:
	.string	"\nTEST FILE 1: [ARITHMETIC OPERATIONS]\n"
.LC1:
	.string	"\nx = "
.LC2:
	.string	"\ny = "
.LC3:
	.string	"\nz = "
.LC4:
	.string	"\n\nTesting binary operator expressions"
.LC5:
	.string	"\n\na = z + 2"
.LC6:
	.string	"\na = "
.LC7:
	.string	"\n\nb = z - y"
.LC8:
	.string	"\nb = "
.LC9:
	.string	"\n\nc = z * 2"
.LC10:
	.string	"\nc = "
.LC11:
	.string	"\n\nd = z / 2"
.LC12:
	.string	"\nd = "
.LC13:
	.string	"\n\ne = x % y"
.LC14:
	.string	"\ne = "
.LC15:
	.string	"\n\nTesting unary operator expressions"
.LC16:
	.string	"\nx = "
.LC17:
	.string	"\n\nv = ++x"
.LC18:
	.string	"\nv = "
.LC19:
	.string	"\nz = "
.LC20:
	.string	"\n\nw = --z"
.LC21:
	.string	"\nw = "
.LC22:
	.string	"\n\naa = y++"
.LC23:
	.string	"\naa = "
.LC24:
	.string	"\n\nbb = x--"
.LC25:
	.string	"\nbb = "
.LC26:
	.string	"\n\ncc = +x"
.LC27:
	.string	"\ncc = "
.LC28:
	.string	"\n\nTesting complex expression with unary and binary operators"
.LC29:
	.string	"\n\nresult = (x + y) / (b - 2) % 3 + e * 2 / ( 2 - x)"
.LC30:
	.string	"\nresult = "
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
	subq    $600, %rsp
	movq    $.LC0, -48(%rbp)
	movq    -48(%rbp), %rdi
	call    printStr
	movl    %eax, -52(%rbp)
	movl    $213, -128(%rbp)
	movl    -128(%rbp), %eax
	movl    %eax, -592(%rbp)
	movl    $10, -188(%rbp)
	movl    -188(%rbp), %eax
	movl    %eax, -596(%rbp)
	movl    $26, -244(%rbp)
	movl    -244(%rbp), %eax
	movl    %eax, -600(%rbp)
	movl    -600(%rbp), %eax
	subl    -596(%rbp), %eax
	movl    %eax, -304(%rbp)
	movl    -304(%rbp), %eax
	movl    %eax, -12(%rbp)
	movl    $2, -364(%rbp)
	movl    -600(%rbp), %eax
	cdq     
	idivl   -364(%rbp)
	movl    %eax, -420(%rbp)
	movl    -420(%rbp), %eax
	movl    %eax, -32(%rbp)
	movl    -592(%rbp), %eax
	cdq     
	idivl   -596(%rbp)
	movl    %edx, -480(%rbp)
	movl    -480(%rbp), %eax
	movl    %eax, -36(%rbp)
	movq    $.LC1, -536(%rbp)
	movq    -536(%rbp), %rdi
	call    printStr
	movl    %eax, -56(%rbp)
	movl    -592(%rbp), %edi
	call    printInt
	movl    %eax, -80(%rbp)
	movq    $.LC2, -88(%rbp)
	movq    -88(%rbp), %rdi
	call    printStr
	movl    %eax, -92(%rbp)
	movl    -596(%rbp), %edi
	call    printInt
	movl    %eax, -96(%rbp)
	movq    $.LC3, -104(%rbp)
	movq    -104(%rbp), %rdi
	call    printStr
	movl    %eax, -108(%rbp)
	movl    -600(%rbp), %edi
	call    printInt
	movl    %eax, -112(%rbp)
	movq    $.LC4, -120(%rbp)
	movq    -120(%rbp), %rdi
	call    printStr
	movl    %eax, -124(%rbp)
	movq    $.LC5, -136(%rbp)
	movq    -136(%rbp), %rdi
	call    printStr
	movl    %eax, -140(%rbp)
	movl    $2, -144(%rbp)
	movl    -600(%rbp), %eax
	addl    -144(%rbp), %eax
	movl    %eax, -148(%rbp)
	movl    -148(%rbp), %eax
	movl    %eax, -4(%rbp)
	movq    $.LC6, -156(%rbp)
	movq    -156(%rbp), %rdi
	call    printStr
	movl    %eax, -160(%rbp)
	movl    -4(%rbp), %edi
	call    printInt
	movl    %eax, -164(%rbp)
	movq    $.LC7, -172(%rbp)
	movq    -172(%rbp), %rdi
	call    printStr
	movl    %eax, -176(%rbp)
	movq    $.LC8, -184(%rbp)
	movq    -184(%rbp), %rdi
	call    printStr
	movl    %eax, -192(%rbp)
	movl    -12(%rbp), %edi
	call    printInt
	movl    %eax, -196(%rbp)
	movq    $.LC9, -204(%rbp)
	movq    -204(%rbp), %rdi
	call    printStr
	movl    %eax, -208(%rbp)
	movl    $2, -212(%rbp)
	movl    -600(%rbp), %eax
	imull   -212(%rbp), %eax
	movl    %eax, -216(%rbp)
	movl    -216(%rbp), %eax
	movl    %eax, -24(%rbp)
	movq    $.LC10, -224(%rbp)
	movq    -224(%rbp), %rdi
	call    printStr
	movl    %eax, -228(%rbp)
	movq    -24(%rbp), %rdi
	call    printInt
	movl    %eax, -232(%rbp)
	movq    $.LC11, -240(%rbp)
	movq    -240(%rbp), %rdi
	call    printStr
	movl    %eax, -248(%rbp)
	movq    $.LC12, -256(%rbp)
	movq    -256(%rbp), %rdi
	call    printStr
	movl    %eax, -260(%rbp)
	movl    -32(%rbp), %edi
	call    printInt
	movl    %eax, -264(%rbp)
	movq    $.LC13, -272(%rbp)
	movq    -272(%rbp), %rdi
	call    printStr
	movl    %eax, -276(%rbp)
	movq    $.LC14, -284(%rbp)
	movq    -284(%rbp), %rdi
	call    printStr
	movl    %eax, -288(%rbp)
	movl    -36(%rbp), %edi
	call    printInt
	movl    %eax, -292(%rbp)
	movq    $.LC15, -300(%rbp)
	movq    -300(%rbp), %rdi
	call    printStr
	movl    %eax, -308(%rbp)
	movq    $.LC16, -316(%rbp)
	movq    -316(%rbp), %rdi
	call    printStr
	movl    %eax, -320(%rbp)
	movl    -592(%rbp), %edi
	call    printInt
	movl    %eax, -324(%rbp)
	incl    -592(%rbp)
	movl    -592(%rbp), %eax
	movl    %eax, -584(%rbp)
	movq    $.LC17, -332(%rbp)
	movq    -332(%rbp), %rdi
	call    printStr
	movl    %eax, -336(%rbp)
	movq    $.LC18, -344(%rbp)
	movq    -344(%rbp), %rdi
	call    printStr
	movl    %eax, -348(%rbp)
	movl    -584(%rbp), %edi
	call    printInt
	movl    %eax, -352(%rbp)
	decl    -600(%rbp)
	movl    -600(%rbp), %eax
	movl    %eax, -588(%rbp)
	movq    $.LC19, -360(%rbp)
	movq    -360(%rbp), %rdi
	call    printStr
	movl    %eax, -368(%rbp)
	movl    -600(%rbp), %edi
	call    printInt
	movl    %eax, -372(%rbp)
	movq    $.LC20, -380(%rbp)
	movq    -380(%rbp), %rdi
	call    printStr
	movl    %eax, -384(%rbp)
	movq    $.LC21, -392(%rbp)
	movq    -392(%rbp), %rdi
	call    printStr
	movl    %eax, -396(%rbp)
	movl    -588(%rbp), %edi
	call    printInt
	movl    %eax, -400(%rbp)
	movl    -596(%rbp), %eax
	movl    %eax, -404(%rbp)
	incl    -596(%rbp)
	movl    -404(%rbp), %eax
	movl    %eax, -8(%rbp)
	movq    $.LC22, -412(%rbp)
	movq    -412(%rbp), %rdi
	call    printStr
	movl    %eax, -416(%rbp)
	movq    $.LC23, -428(%rbp)
	movq    -428(%rbp), %rdi
	call    printStr
	movl    %eax, -432(%rbp)
	movl    -8(%rbp), %edi
	call    printInt
	movl    %eax, -436(%rbp)
	movl    -592(%rbp), %eax
	movl    %eax, -440(%rbp)
	decl    -592(%rbp)
	movl    -440(%rbp), %eax
	movl    %eax, -16(%rbp)
	movq    $.LC24, -448(%rbp)
	movq    -448(%rbp), %rdi
	call    printStr
	movl    %eax, -452(%rbp)
	movq    $.LC25, -460(%rbp)
	movq    -460(%rbp), %rdi
	call    printStr
	movl    %eax, -464(%rbp)
	movl    -16(%rbp), %edi
	call    printInt
	movl    %eax, -468(%rbp)
	movl    -592(%rbp), %eax
	movl    %eax, -28(%rbp)
	movq    $.LC26, -476(%rbp)
	movq    -476(%rbp), %rdi
	call    printStr
	movl    %eax, -484(%rbp)
	movq    $.LC27, -492(%rbp)
	movq    -492(%rbp), %rdi
	call    printStr
	movl    %eax, -496(%rbp)
	movl    -28(%rbp), %edi
	call    printInt
	movl    %eax, -500(%rbp)
	movq    $.LC28, -508(%rbp)
	movq    -508(%rbp), %rdi
	call    printStr
	movl    %eax, -512(%rbp)
	movl    -592(%rbp), %eax
	addl    -596(%rbp), %eax
	movl    %eax, -516(%rbp)
	movl    $2, -520(%rbp)
	movl    -12(%rbp), %eax
	subl    -520(%rbp), %eax
	movl    %eax, -524(%rbp)
	movl    -516(%rbp), %eax
	cdq     
	idivl   -524(%rbp)
	movl    %eax, -528(%rbp)
	movl    $3, -540(%rbp)
	movl    -528(%rbp), %eax
	cdq     
	idivl   -540(%rbp)
	movl    %edx, -544(%rbp)
	movl    $2, -548(%rbp)
	movl    -36(%rbp), %eax
	imull   -548(%rbp), %eax
	movl    %eax, -552(%rbp)
	movl    $2, -556(%rbp)
	movl    -556(%rbp), %eax
	subl    -592(%rbp), %eax
	movl    %eax, -560(%rbp)
	movl    -552(%rbp), %eax
	cdq     
	idivl   -560(%rbp)
	movl    %eax, -564(%rbp)
	movl    -544(%rbp), %eax
	addl    -564(%rbp), %eax
	movl    %eax, -568(%rbp)
	movl    -568(%rbp), %eax
	movl    %eax, -40(%rbp)
	movq    $.LC29, -576(%rbp)
	movq    -576(%rbp), %rdi
	call    printStr
	movl    %eax, -580(%rbp)
	movq    $.LC30, -64(%rbp)
	movq    -64(%rbp), %rdi
	call    printStr
	movl    %eax, -68(%rbp)
	movl    -40(%rbp), %edi
	call    printInt
	movl    %eax, -72(%rbp)
	movl    $0, -76(%rbp)
	movl    -76(%rbp), %eax
.LFE0:
	movq    %rbp, %rsp
	popq    %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
	.size   main, .-main
