#helloWorld.asm
#Date:
#	3/24/19
#Author:
#	tim deutsch
#Description:
#	Prints "Hello World"

	.text
main:
	la	$a0, hello_msg		#load the addr of hello_msg into $a0
	li	$v0, 4			#4 is the print_string syscall (print from $a0)
	syscall				#do syscall
	
	li	$v0, 10			#exit syscall
	syscall				#do syscall
	
	.data
hello_msg:	.asciiz "Hello World\n"


	