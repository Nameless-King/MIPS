#palindrome0.asm
#Date:
#	04/17/19
#Author:
#	Tim Deutsch
#Description:
#	- Reads in a string from I/O
#	- Determines if the string is a palindrome
#	- Prints if it is a palindrome or not
#	- Only works if chars in input str are (>=65 and <=90) or (>=97 and <=122)


	.text
main:
	la	$a0, string_space		#load pointer into a0 that leads to start of memory that will be used to store string
	li	$a1, 1024			#load max number of bytes to read when reading in the string
	li	$v0, 8				#load 8 into v0
	syscall					#call system call 8 (read string from I/O)
	
	la	$t1, string_space		#load address of input string to t1
	
	#Need to move t2 to the end of the string.
	
	la	$t2, string_space
length_loop:
	lb	$t3, ($t2)			#load byte at t2 into t3
	beqz	$t3, end_length_loop		#if t3 == 0, branch out of loop
	addu	$t2, $t2, 1			#otherwise increment t2 (unsigned add)
	b	length_loop			#branch to length_loop:
end_length_loop:
	subu	$t2, $t2, 2			#sub(unsigned subtract) 2 to move t2 back past '\0' and '\n'
	
	#At this point t1 should point to the start of the string
	# and t2 should point to the end of the string.

test_loop:
	bge 	$t1, $t2, is_palin		#when t1 >= t2, it is palindrome
	
	#Test if either the current char in t1 or t2
	# is upper case or not.
	
test_front_char:
	lb	$t3, ($t1)			#load current char ascii into t3
	bgt	$t3, 90, front_not_upper	#if t3 > 90 it can't be upper
	blt	$t3, 65, front_not_upper	#if t3 < 65 it can't be upper
	addu	$t3, $t3, 32			#change t3 to lower case
front_not_upper:
	
test_back_char:
	lb	$t4, ($t2)			#load current char ascii into 
	bgt	$t4, 90, back_not_upper		#if t4 > 90 it can't be upper
	blt	$t4, 65, back_not_upper		#if t4 < 65 it can't be upper
	addu	$t4, $t4, 32			#change t4 to lower case
back_not_upper:
		
	bne	$t3, $t4, not_palin		#if t3 != t4 it is not a palindrome
	
	addu	$t1, $t1, 1			#increment t1
	subu	$t2, $t2, 1			#decrement t2

	b	test_loop			#branch to test_loop:
	
is_palin:
	la	$a0, is_palin_string		#load address of is_palin_string to a0
	li	$v0, 4				#load 4 into v0
	syscall					#call system call 4 (print_string system call)
	b	exit				#branch to exit:
	
not_palin:
	la	$a0, not_palin_string		#load address of not_palin_string to a0
	li	$v0, 4				#load 4 into v0
	syscall					#call system call 4 (print_string system call)
	b	exit				#branch to exit:

exit:
	li	$v0, 10				#load 10 into v0
	syscall					#call system call 10 (exit program)
		

	.data
string_space:	.space	1024			#set aside 1024 bytes for an input string

	.data
is_palin_string:				#= Is Palindrome
	.byte	0x49
	.byte	0x73
	.byte	0x20
	.byte	0x50
	.byte	0x61
	.byte	0x6c
	.byte	0x69
	.byte	0x6e
	.byte	0x64
	.byte	0x72
	.byte	0x6f
	.byte	0x6d
	.byte	0x65
	.byte	0x0a
	.byte	0x00
	
	.data
not_palin_string:				#= Not Palindrome
	.byte	0x4e
	.byte	0x6f
	.byte	0x74
	.byte	0x20
	.byte	0x50
	.byte	0x61
	.byte	0x6c
	.byte	0x69
	.byte	0x6e
	.byte	0x64
	.byte	0x72
	.byte	0x6f
	.byte	0x6d
	.byte	0x65
	.byte	0x0a
	.byte	0x00
	
