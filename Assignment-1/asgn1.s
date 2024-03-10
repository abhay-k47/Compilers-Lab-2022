	.file	"ass1_20CS10001.c"								# source file name
	.text													# code starts from here
	.section	.rodata										# read-only data section
	.align 8												# 8-byte boundary alignment
.LC0:														# label of format string for 1st printf
	.string	"Enter the string (all lower case): "
.LC1:														# label of format string for scanf
	.string	"%s"
.LC2:														# label of format string for 2nd printf
	.string	"Length of the string: %d\n"
	.align 8
.LC3:
	.string	"The string in descending order: %s\n"			# label of format string for 3rd printf


	.text													# code starts from here
	.globl	main											# main is globally visible in the executable
	.type	main, @function									# main is a function

main:														# beginning of main
.LFB0:
	.cfi_startproc											# initializes internal structures and emit initial CFI for entry in .eh_frame
	endbr64
	pushq	%rbp											# store base pointer (rbp) in stack to restore before function returns
	.cfi_def_cfa_offset 16									# set CFA at an offset of 16 bytes from the current stack pointer
	.cfi_offset 6, -16										# save previous value of register 6 at offset 16 from CFA
	movq	%rsp, %rbp										# rbp <-- rsp, set new stack base pointer, now rbp is frame pointer of main function
	.cfi_def_cfa_register 6									# use register 6 to compute CFA

#   char str[20],dest[20];  int len;
	subq	$80, %rsp										# %rsp <-- %rsp - 80, memory allocation on the stack for str[], dest[], len
	movq	%fs:40, %rax									# load true canary to register rax
	movq	%rax, -8(%rbp)									# M[%rbp - 8] <-- %rax, store canary on stack				
	xorl	%eax, %eax										# %eax <-- 0, erase canary from register
	
#   printf("Enter the string (all lower case): ");
	leaq	.LC0(%rip), %rdi								# load address of .LCO(%rip) i.e. f-string into %rdi which is 1st argument of printf
	movl	$0, %eax										# %eax <-- 0, clear the value of register eax (Since no floating point data is printed, vector register is set to 0)
	call	printf@PLT										# call printf with address of f-string (%rdi) as argument

#	scanf("%s",str);
	leaq	-64(%rbp), %rax									# %rax <-- %rbp-64, load address of str into %rax
	movq	%rax, %rsi										# %rsi <-- %rax, move address of str to %rsi which is 2nd argument of scanf
	leaq	.LC1(%rip), %rdi								# load address of .LC1(%rip) i.e. f-string into %rdi which is 1st argument of scanf
	movl	$0, %eax										# %eax <-- 0, clear value of register eax
	call	__isoc99_scanf@PLT								# call scanf with address of f-string (%rdi), address of str (%rsi) as arguments
	
#	len = length(str);
	leaq	-64(%rbp), %rax									# %rax <-- %rbp-64, load address of str into %rax
	movq	%rax, %rdi										# %rdi <-- %rax, move address of str to %rdi which is 1st argument of length function
	call	length											# call length function with address of str (%rdi) as argument
	movl	%eax, -68(%rbp)                   				# M[%rbp-68] <-- %eax, store integer returned by length function in variable 'len'

#   printf("Length of the string: %d\n", len);
	movl	-68(%rbp), %eax									# %eax <-- M[%rbp-68], %eax stores value of len
	movl	%eax, %esi										# %esi <-- %eax, %esi now stores value of len which is 2nd argument of printf
	leaq	.LC2(%rip), %rdi								# load address of .LC2(%rip) i.e. f-string into %rdi which is 1st argument of printf
	movl	$0, %eax										# %eax <-- 0, clear value of register eax
	call	printf@PLT										# call printf with address of f-string (%rdi), len (%esi) as arguments

#	sort(str, len, dest);
	leaq	-32(%rbp), %rdx									# %rdx <-- %rbp-32, load address of dest into %rdx which is 3rd argument of sort function
	movl	-68(%rbp), %ecx									# %ecx <-- M[%rbp-68], %ecx stores value of len
	leaq	-64(%rbp), %rax									# %rax <-- %rbp-64, load address of str into %rax
	movl	%ecx, %esi										# %esi <-- %ecx, %esi now stores value of len which is 2nd argument of sort function
	movq	%rax, %rdi										# %rdi <-- %rax, move address of str to %rdi which is 1st argument of sort function
	call	sort											# call sort function with address of str (%rdi), len (%esi), address of dest (%rdx) as arguments

#	printf("The string in descending order: %s\n", dest);
	leaq	-32(%rbp), %rax									# %rax <-- %rbp-32, load address of dest into %rax
	movq	%rax, %rsi										# %rsi <-- %rax, move address of dest to %rsi which is 2nd argument of printf
	leaq	.LC3(%rip), %rdi								# load address of .LC3(%rip) i.e. f-string into %rdi which is 1st argument of printf
	movl	$0, %eax										# %eax <-- 0, clear value of register eax
	call	printf@PLT										# call printf with  address of f-string (%rdi), address of dest (%rsi) as arguments

# 	return 0;
	movl	$0, %eax										# %eax <-- 0, clear value of register eax
	movq	-8(%rbp), %rcx									# %rcx <-- M[%rbp-8], get value of canary stored in stack frame of main
	xorq	%fs:40, %rcx									# xor restored canary with true canary
	je	.L3													# jump to L3 (normal exit from function) if restored canary = true canary
	call	__stack_chk_fail@PLT							# otherwise, function executed some undefined behavior (like return address was corrupted, buffer overflow), 
															# therefore terminate execution immediately

.L3:
	leave													# unwind stack frame of main i.e. set %rsp to %rbp
															# restore %rbp i.e. pop top of stack into %rbp
	.cfi_def_cfa 7, 8										# for computing CFA, take address from register 7 and add an offset of 8 to it 
	ret														# pop return address from stack into %rip, hence transfer control back to the return address
	.cfi_endproc											# close the unwind entry previously opened by .cfi_startproc. and emit it to .eh_frame


.LFE0:
	.size	main, .-main									# size of main
	.globl	length											# length is a global name
	.type	length, @function								# length is a function

length:														# beginning of length
.LFB1:
	.cfi_startproc											# initializes internal structures and emit initial CFI for entry in .eh_frame
	endbr64													
	pushq	%rbp											# store base pointer (rbp) in stack to restore before function returns
	.cfi_def_cfa_offset 16									# set CFA at an offset of 16 bytes from the current stack pointer
	.cfi_offset 6, -16										# save previous value of register 6 at offset 16 from CFA
	movq	%rsp, %rbp										# rbp <-- rsp, set new stack base pointer, now rbp is frame pointer of length function
	.cfi_def_cfa_register 6									# use register 6 to compute CFA
	
	movq	%rdi, -24(%rbp)									# M[%rbp-24] <-- %rdi, store the first argument i.e. str with which length was called

#	i=0;
	movl	$0, -4(%rbp)									# M[%rbp-4] <-- 0, initialize i to 0
	jmp	.L5													# unconditional jump to .L5

#	i++;
.L6:
	addl	$1, -4(%rbp)									# M[%rbp-4] = M[%rbp-4]+1, increment i by 1

.L5:
	#	str[i]!='\0';
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move i to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax 
	addq	%rdx, %rax										# %rax <-- %rax + %rdx, now %rax stores address of i-th character of str i.e. &str[i]
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores i-th character of str i.e. str[i] (1 byte)
	testb	%al, %al										# performs bitwise AND of str[i] with str[i]
	jne	.L6													# continue 'for' loop if result of previous operation is non-zero which means str[i]!='\0'
															# otherwise end 'for' loop

	#	return i;
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], sets the return value 'i' in the accumulator register %eax
	popq	%rbp											# restore %rbp i.e. pop top of stack into %rbp
	.cfi_def_cfa 7, 8										# for computing CFA, take address from register 7 and add an offset of 8 to it 
	ret														# pop return address from stack into %rip, hence transfer control back to the return address
	.cfi_endproc											# close the unwind entry previously opened by .cfi_startproc. and emit it to .eh_frame

.LFE1:
	.size	length, .-length								# size of length
	.globl	sort											# sort is a global name
	.type	sort, @function									# sort is a function

sort:														# beginning of sort 
.LFB2:
	.cfi_startproc											# initializes internal structures and emit initial CFI for entry in .eh_frame
	endbr64
	pushq	%rbp											# store base pointer (rbp) in stack to restore before function returns
	.cfi_def_cfa_offset 16									# set CFA at an offset of 16 bytes from the current stack pointer
	.cfi_offset 6, -16										# save previous value of register 6 at offset 16 from CFA
	movq	%rsp, %rbp										# rbp <-- rsp, set new stack base pointer, now rbp is frame pointer of sort function
	.cfi_def_cfa_register 6									# use register 6 to compute CFA

#	int i, j; char temp;
	subq	$48, %rsp										# %rsp <-- %rsp-48, memory allocation for storing arguments and local variables i.e. str,len,dest,i,j,temp
	movq	%rdi, -24(%rbp)									# M[%rbp-24] <-- %rdi, store the first argument i.e. str with which sort was called
	movl	%esi, -28(%rbp)									# M[%rbp-28] <-- %esi, store the second argument i.e. len with which sort was called
	movq	%rdx, -40(%rbp)									# M[%rbp-40] <-- %rdx, store the third argument i.e. dest with which sort was called

#	i=0;
	movl	$0, -8(%rbp)									# M[%rbp-8] <-- 0, initialize i to 0
	jmp	.L9													# jump to L9

#	j=0;
.L13:
	movl	$0, -4(%rbp)									# M[%rbp-4] <-- 0. initialize j to 0
	jmp	.L10												# jump to L10

.L12:
	# str[i]<str[j]
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], move i (stored in M[%rbp-8]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-24(%rbp), %rax									# %rax <- M[%rbp-24], load address of str in %rax 
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of i-th character of str i.e. &str[i]
	movzbl	(%rax), %edx									# %edx <-- M[%rax], %edx(4 byte) stores i-th character of str i.e. str[i] (1 byte)
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j (stored in M[%rbp-4]) to %eax
	movslq	%eax, %rcx										# %rcx <-- %eax, move 4-byte %eax to 8-byte %rcx with signed extension, now %rcx stores j
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax 
	addq	%rcx, %rax										# %rax <-- %rax+%rcx, now %rax stores address of j-th character of str i.e. &str[j]
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores j-th character of str i.e. str[j] (1 byte)
	cmpb	%al, %dl										# compare str[i] with str[j]
	jge	.L11												# jump to L11 if str[i] is greater than or equal to str[j]
	
	#	temp = str[i];
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], move i (stored in M[%rbp-8]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-24(%rbp), %rax									# %rax <- M[%rbp-24], load address of str in %rax 
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of i-th character of str i.e. &str[i]
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores i-th character of str i.e. str[i] (1 byte)
	movb	%al, -9(%rbp)									# M[%rbp-9] <-- %al, store str[i] in temp (at %rbp-9)

	#	str[i] = str[j];
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j (stored in M[%rbp-4]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores j
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax 
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of j-th character of str i.e. &str[j]
	
	movl	-8(%rbp), %edx									# %edx <-- M[%rbp-8], move i (stored in M[%rbp-8]) to %edx
	movslq	%edx, %rcx										# %rcx <-- %edx, move 4-byte %edx to 8-byte %rcx with signed extension, now %rcx stores i
	movq	-24(%rbp), %rdx									# %rdx <- M[%rbp-24], load address of str in %rdx 
	addq	%rcx, %rdx										# %rdx <-- %rdx+%rcx, now %rdx stores address of i-th character of str i.e. &str[i]
	
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores j-th character of str i.e. str[j] (1 byte)
	movb	%al, (%rdx)										# M[rdx] <-- %al, move str[j] to address of str[i] (equivalent to str[i]=str[j];)

	#	str[j]=temp;
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j (stored in M[%rbp-4]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores j
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax 
	addq	%rax, %rdx										# %rax <-- %rax+%rdx, now %rax stores address of j-th character of str i.e. &str[j]
	movzbl	-9(%rbp), %eax									# %eax <-- M[%rbp-9], move temp to address of str[j] (equivalent to str[j]=temp;)
	movb	%al, (%rdx)										# M[%rdx] <-- %al

# 	j++;
.L11:
	addl	$1, -4(%rbp)									# M[%rbp-4] <-- M[%rbp-4]+1, increment j by 1

.L10:
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j to %eax
	cmpl	-28(%rbp), %eax									# compare j with len (stored in M[%rbp-28])
	jl	.L12												# jump to L12 (if block), iff j is less than len 
	
	#	i++;
	addl	$1, -8(%rbp)									# M[%rbp-8] <-- M[%rbp-8]+1, increment i by 1

.L9:
	#	i<len;
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], move i to %eax
	cmpl	-28(%rbp), %eax									# compare i with len (stored at M[%rbp-28])
	jl	.L13												# jump to L13 (inner loop), iff i is less than len
	
	# 	reverse(str,len,dest);
	movq	-40(%rbp), %rdx									# %rdx <-- M[%rbp-40], load dest (stored at M[%rbp-40]) into %rdx which is 3rd argument of reverse function
	movl	-28(%rbp), %ecx									# %ecx <-- M[%rbp-28], move len (stored at M[%rbp-28]) to %ecx 
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load str (stored at M[%rbp-24]) into %rax
	movl	%ecx, %esi										# %esi <-- %ecx, load len into %esi which is 2nd argument of reverse function
	movq	%rax, %rdi										# %rdi <-- %rax, load str into %rdi which is 1st argument of reverse function
	call	reverse											# call reverse function with str (%rdi),len (%esi), dest(%rdx) as arguments
	
	# return; (implicit)
	nop														# no operation
	leave													# unwind stack frame of sort i.e. set %rsp to %rbp
															# restore %rbp i.e. pop top of stack into %rbp
	.cfi_def_cfa 7, 8										# for computing CFA, take address from register 7 and add an offset of 8 to it
	ret														# pop return address from stack into %rip, hence transfer control back to the return address
	.cfi_endproc											# close the unwind entry previously opened by .cfi_startproc. and emit it to .eh_frame
										
.LFE2:
	.size	sort, .-sort									# size of sort
	.globl	reverse											# reverse is a global name
	.type	reverse, @function								# reverse is a function

reverse:
.LFB3:
	.cfi_startproc											# initializes internal structures and emit initial CFI for entry in .eh_frame
	endbr64
	pushq	%rbp											# store base pointer (rbp) in stack to restore before function returns
	.cfi_def_cfa_offset 16									# set CFA at an offset of 16 bytes from the current stack pointer
	.cfi_offset 6, -16										# save previous value of register 6 at offset 16 from CFA
	movq	%rsp, %rbp										# rbp <-- rsp, set new stack base pointer, now rbp is frame pointer of main function
	.cfi_def_cfa_register 6									# use register 6 to compute CFA
	
	movq	%rdi, -24(%rbp)									# M[%rbp-24] <-- %rdi, store the first argument i.e. str with which reverse was called 
	movl	%esi, -28(%rbp)									# M[%rbp-28] <-- %esi, store the second argument i.e. len
	movq	%rdx, -40(%rbp)									# M[%rbp-40] <-- %rdx, store the third argument i.e. dest
	
# 	i=0;
	movl	$0, -8(%rbp)									# M[%rbp-8] <-- 0, initialize i to 0								
	jmp	.L15												# jump to L15 

.L20:
	#	j=len-i-1;
	movl	-28(%rbp), %eax									# %eax <-- M[%rbp-28], move len (at %rbp-28) to %eax
	subl	-8(%rbp), %eax									# %eax <-- %eax - M[%rbp-8], subtract i (at %rbp-28) from len
	subl	$1, %eax										# %eax <-- len - i - 1 
	movl	%eax, -4(%rbp)									# M[%rbp-4] <-- %eax, initialize j to len-i-1
	nop														# no operation

 	# j>=len/2;
	movl	-28(%rbp), %eax									# %eax <-- M[%rbp-28], move len (at %rbp-28) to %eax
	movl	%eax, %edx										# %edx <-- %eax, %edx stores len 
	shrl	$31, %edx										# %edx <-- %edx>>31, shift %edx to right by 31 bits to get sign bit
	addl	%edx, %eax										# %eax <-- %eax+%edx, adding 1 to len (%eax) if len is negative
	sarl	%eax											# %eax <-- %eax>>1, devide len by 2
	cmpl	%eax, -4(%rbp)									# compare j with len/2
	jl	.L18												# jump to L18 if j<len/2

	# if(i==j)
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], move i (at %rbp-8) to %eax 
	cmpl	-4(%rbp), %eax									# compare i with j (at %rbp-4)
	je	.L23												# jump to L23 if i equals j 

	# else
	# temp = str[i];
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], move i (stored in M[%rbp-8]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-24(%rbp), %rax									# %rax <- M[%rbp-24], load address of str in %rax 
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of i-th character of str i.e. &str[i]
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores i-th character of str i.e. str[i] (1 byte)
	movb	%al, -9(%rbp)									# M[%rbp-9] <-- %al, store str[i] in temp (at %rbp-9)

	# str[i]=str[j];
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j (stored in M[%rbp-4]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores j
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of j-th character of str i.e. &str[j]

	movl	-8(%rbp), %edx									# %edx <-- M[%rbp-8], move i (stored in M[%rbp-8]) to %edx
	movslq	%edx, %rcx										# %rcx <-- %edx, move 4-byte %edx to 8-byte %rcx with signed extension, now %rcx stores i
	movq	-24(%rbp), %rdx									# %rdx <- M[%rbp-24], load address of str in %rdx 
	addq	%rcx, %rdx										# %rdx <-- %rdx+%rcx, now %rdx stores address of i-th character of str i.e. &str[i]

	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax(4 byte) stores j-th character of str i.e. str[j] (1 byte)
	movb	%al, (%rdx)										# M[rdx] <-- %al, move str[j] to address of str[i] (equivalent to str[i]=str[j];)

	# str[j]=temp;
	movl	-4(%rbp), %eax									# %eax <-- M[%rbp-4], move j (stored in M[%rbp-4]) to %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores j
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax 
	addq	%rax, %rdx										# %rax <-- %rax+%rdx, now %rax stores address of j-th character of str i.e. &str[j]
	movzbl	-9(%rbp), %eax									# %eax <-- M[%rbp-9], move temp to address of str[j] (equivalent to str[j]=temp;)
	movb	%al, (%rdx)										# M[%rdx] <-- %al
	jmp	.L18												# jump to L18 

.L23:
	nop														# no operation

#	i++;
.L18:
	addl	$1, -8(%rbp)									# M[%rbp-8] <-- M[%rbp-8]+1, increment i by 1

.L15:
	movl	-28(%rbp), %eax									# %eax <-- M[%rbp-28], move len (at %rbp-28) to %eax
	movl	%eax, %edx										# %edx <-- %eax, %edx stores len 
	shrl	$31, %edx										# %edx <-- %edx>>31, shift %edx to right by 31 bits to get sign bit
	addl	%edx, %eax										# %eax <-- %eax+%edx, adding 1 to len (%eax) if len is negative
	sarl	%eax											# %eax <-- %eax>>1, devide len by 2		
	cmpl	%eax, -8(%rbp)									# compare i with len/2
	jl	.L20												# jump to L20 if i<len/2

	# i=0;
	movl	$0, -8(%rbp)									# M[%rbp-8] <-- 0, initialize i to 0
	jmp	.L21												# jump to L21

.L22:
	# dest[i]=str[i];
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], load i (at %rbp-8) in %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-24(%rbp), %rax									# %rax <-- M[%rbp-24], load address of str in %rax
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of i-th character of str i.e. &str[i]

	movl	-8(%rbp), %edx									# %edx <-- M[%rbp-8], load i (at %rbp-8) in %edx
	movslq	%edx, %rcx										# %rcx <-- %edx, move 4-byte %edx to 8-byte %rcx with signed extension, now %rcx stores i
	movq	-40(%rbp), %rdx									# %rdx <-- M[%rbp-40], load address of dest in %rdx
	addq	%rcx, %rdx										# %rdx <-- %rdx+%rcx, now %rdx stores address of i-th character of dest i.e. &dest[i]
	movzbl	(%rax), %eax									# %eax <-- M[%rax], %eax stores str[i]
	movb	%al, (%rdx)										# M[rdx] <-- %al, move str[i] to address of dest[i]
	# i++;
	addl	$1, -8(%rbp)									# increment i by 1

.L21:
	# i<len;
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], load i (at %rbp-8) in %eax
	cmpl	-28(%rbp), %eax									# compare i with len (at %rbp-28)						
	jl	.L22												# jump to L22 if i is less than len 
	
	#	dest[i]='\0'; 
	movl	-8(%rbp), %eax									# %eax <-- M[%rbp-8], load i (at %rbp-8) in %eax
	movslq	%eax, %rdx										# %rdx <-- %eax, move 4-byte %eax to 8-byte %rdx with signed extension, now %rdx stores i
	movq	-40(%rbp), %rax									# %rax <-- M[%rbp-40], load address of dest in %rax
	addq	%rdx, %rax										# %rax <-- %rax+%rdx, now %rax stores address of i-th character of str i.e. &dest[i]
	movb	$0, (%rax)										# %rax <-- 0, 
	nop														# no operation
	popq	%rbp											# restore %rbp i.e. pop top of stack into %rbp
	.cfi_def_cfa 7, 8										# for computing CFA, take address from register 7 and add an offset of 8 to it
	ret														# pop return address from stack into %rip, hence transfer control back to the return address
	.cfi_endproc											# close the unwind entry previously opened by .cfi_startproc. and emit it to .eh_frame

.LFE3:
	.size	reverse, .-reverse		
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
