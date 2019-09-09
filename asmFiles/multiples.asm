#multiples.asm
#Date:
#	04/17/19
#Author:
#	Tim Deutsch
#Description:
#	- Reads in two integer from I/O (A and B)
#	- Prints mulipltes of A from A to A*B

	.text
main:
	li	$v0, 5			#set v0 to 5
	syscall				#call system call 5 (read int from I/O)
	move	$t0, $v0		#move input to t0
	
	li	$v0, 5			#set v0 to 5
	syscall				#call system call 5 (read int from I/O)
	move	$t1, $v0		#move input to t1	
	
	blez	$t1, endLoop		#If t1 is zero branch to endLoop:
	
	mul	$t2, $t0, $t1		#$t2 = $t1 * $t0
	move 	$t3, $t0		#move value in t0 to t3
	
loop:
	move	$a0, $t3		#Move value in t3 to a0
	li	$v0, 1			#Load 1 into v0
	syscall				#call system call 1 (print value in a0 to I/O)
	
	beq	$t2, $t3, endLoop	#if t2 == t3, branch to endLoop:
	add	$t3, $t3, $t0		#otherwise, t3 = t3 + t0
	
	la	$a0, space_string	#Load data from space: into a0
	li	$v0, 4			#Load 1 into a0
	syscall				#call system call 4 (print_string)
	
	b 	loop			#branch to loop:
endLoop:

	li	$v0, 10			#Load 10 into v0
	syscall				#call system call 10 (exit the program)
	
	
	.data
space_string:	.byte	0x20		#hex value for SPACE
		.byte	0x0		#hex value for NUL
		
	
	