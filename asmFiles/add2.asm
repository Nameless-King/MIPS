#add2.asm
#Date:
#	3/23/19
#Author:
#	tim deutsch
#Description:
#	Reads in two integers as input.
#	Prints sum to screen.
#Registers Used:
#	$t0 	- Holds first number
#	$t1	- Holds second number
#	$t2	- Holds sum of $t0 and $t1
#	$v0	- Syscall exit code

main:				#execution starts here
	#Get the first numnber from user, put into $t0
	li	$v0, 5
	syscall
	move	$t0, $v0
	
	#Get the second number from user, put into $t1
	li	$v0, 5
	syscall
	move	$t1, $v0
	
	add	$t2, $t0, $t1
	
	#print out $t2
	move	$a0, $t2
	li	$v0, 1
	syscall
	
	#syscall exit
	li	$v0, 10
	syscall
#end add2.asm
