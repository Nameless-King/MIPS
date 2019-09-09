#add.asm
#Description:
#	Places one in registry t1
#	Adds 2 to t1 and places in t0
#Registers Used:
#	$t1 -holds one
#	$t0 -holds sum of $t1 and 2
#	$v0 -holds syscall code 10 (exit)
#Author:
#	tim deutsch
#Date:
#	3/23/19

main:				#start of execution.
	li	$t1, 1		#load 1 to $t1
	add	$t0, $t1, 2	#add 2 to $t1 place in $t0
	
	li	$v0, 10 	#place exit code (10) in $v0
	syscall			#syscall views $v0 for action
	
#end add.asm