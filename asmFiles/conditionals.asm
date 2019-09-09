#conditionals.asm
#Date:
#	04/17/19
#Author:
#	Tim Deutsch
#Description:
#	Reads in two integers from I/O
#	Prints the larger of the two integers

	.text
main:
	#Get first number from user, put into $t0
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	#Get second number from user, put into $t1
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	#Put the larger of $t0 and $t1 into $t2
	bgt	$t0, $t1, t0_bigger
	move	$t2, $t1
	b	endif
t0_bigger:
	move	$t2, $t0
endif:
	
	#print out $t2
	move	$a0, $t2
	li	$v0, 1
	syscall
	
	#exit the program
	li	$v0, 10
	syscall