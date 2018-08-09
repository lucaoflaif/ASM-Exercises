
# %edi for the index of examinated data
# %ebx largest data item found
# %eax current data item

.section .data

data_items:
	.long 3,67,34,222,45,75,54,24,44,33,22,11,66,0

.section .text

.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx

start_loop:
	cmpl $0, %eax
	je loop_exit

	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax
	jle start_loop

	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax 	#1 is the exit syscall, biggest number is already in %ebx
			#it will be read by the echo $? bash command
	
	int $0x80
