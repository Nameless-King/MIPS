#atoi1.asm
#Date:
#	4/18/19
#Author:
#	Tim Deutsch
#Description:
#	- Reads in input string from IO
#	- Converts input string into an integer
#	- Prints out converted input string

	.text
main:
	la	$a0, string_space	#load address of string_space to a0
	li	$a1, 1024		#load max number of butes to read when reading in the string
	li	$v0, 8			#load 8 into v0
	syscall				#call system call 8 (read string from I/O)
	
	la	$t0, string_space	#load address of string_space to t0
	
	li	$t2, 0			#Initialize t2 as 0
	
sum_loop:
	lb	$t1, ($t0)		#Load byte from t0 to t1
	addu	$t0, $t0, 1		#Increment t0
	
	#Use 10 instead of '\n' due to SPIM bug?
	#(10 is ascii for '\n' anyway so nothing strange here)
	beq	$t1, 10, end_sum_loop	#if t1 == '\n', branch out of loop
	
	mul	$t2, $t2, 10		#t *= 10
	sub	$t1, $t1, '0'		#t1 -= '0' (ASCII of numbers consecutively, sub '0' to bring to true value)
	add	$t2, $t2, $t1		#t2 += t1
	
	b	sum_loop		#Branch to sum_loop:
end_sum_loop:
	
	move	$a0, $t2		#Move value in t2 into a0
	li	$v0, 1			#Load 1 into v0
	syscall				#call system call 1 (print value to I/O)
	
	b 	exit			#Branch to exit:
	
exit:
	li $v0, 10			#load 10 to v0
	syscall				#call system call 10 (exits program)



	.data
string_space:	.space	1024	#set aside 1024 bytes for an input string