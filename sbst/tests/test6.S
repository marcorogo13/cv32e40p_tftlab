.section .text
.global test6
.type test6, @function

test6:
	# ABI prologue
	addi sp, sp, -112     # allocate 112 bytes on the stack
	sw ra, 104(sp)        # save return address
	sw s0, 96(sp)         # save callee-saved registers
	sw s1, 88(sp)
	sw s2, 80(sp)
	sw s3, 72(sp)
	sw s4, 64(sp)
	sw s5, 56(sp)
	sw s6, 48(sp)
	sw s7, 40(sp)
	sw s8, 32(sp)
	sw s9, 24(sp)
	sw s10, 16(sp)
	sw s11, 8(sp)
	addi s0, sp, 112     # set up s0 to point to start of stack frame


    # You can write your code here 

	la t0, test_vector_1    # load test vector
	la t1, test_vector_2    # load test vector
	la a2, test_result_1
	la a3, test_result_2


    mv a4, a0
	li a5, 0


	lw t2, 0(t0)          # load first test value
	lw t3, 4(t0)          # load second test value
	lw t4, 0(t1)          # load first test value
	lw t5, 4(t1)          # load second test value

	mulh a0, t2, t4       # perform multiplication
	mulh a1, t3, t5       # perform multiplication	

	#store the two results
	sw a0, 0(a2)
	sw a1, 0(a3)

	lw t2, 8(t0)          # load first test value
	lw t3, 12(t0)         # load second test value
	lw t4, 8(t1)          # load first test value
	lw t5, 12(t1)         # load second test value

	mulh a0, t2, t4       # perform multiplication
	mul a1, t3, t5        # perform multiplication

	#store the two results
	sw a0, 0(a2)
	sw a1, 0(a3)
###################################################

#	lw t2, 16(t0)         # load first test value
#	lw t3, 20(t0)         # load second test value
#	lw t4, 16(t1)         # load first test value
#	lw t5, 20(t1)         # load second test value
#
#	mul a0, t2, t4        # perform multiplication
#	mul a1, t3, t5        # perform multiplication
#
#	#store the two results
#	sw a0, 0(a2)
#	sw a1, 0(a3)
#
#	lw t2, 24(t0)         # load first test value
#	lw t3, 28(t0)         # load second test value
#	lw t4, 24(t1)         # load first test value
#	lw t5, 28(t1)         # load second test value
#
#	mul a0, t2, t4        # perform multiplication
#	mulh a1, t3, t5        # perform multiplication
#
#	#store the two results
#	sw a0, 0(a2)
#	sw a1, 0(a3)



	li a0, 0


    # ABI epilogue
	lw s11, 8(sp)        # restore callee-saved registers
	lw s10, 16(sp)
	lw s9, 24(sp)
	lw s8, 32(sp)
	lw s7, 40(sp)
	lw s6, 48(sp)
	lw s5, 56(sp)
	lw s4, 64(sp)
	lw s3, 72(sp)
	lw s2, 80(sp)
	lw s1, 88(sp)
	lw s0, 96(sp)
	lw ra, 104(sp)       # restore return address
	addi sp, sp, 112     # deallocate stack space
	jr ra                # return to caller



# READ/WRITE VARIABLES

.section .data

# Two store locations for the test results 

test_result_1:
	.word 0x00000000

test_result_2:
	.word 0x00000000


# READ-ONLY VARIABLES

.section .rodata

# Vector of test 32 bit words for the multiplication test

test_vector_1:
	.word 0b01001100110001100110101110100100
	.word 0b01011100000010010111100100101100
	.word 0b10011101101100100001000111111111
	.word 0b11110010100011111110011011111000
	.word 0b00101000110101001111100011110000
	.word 0b11111011111111000101101111101101
	.word 0b10111000110000101000110100111000
	.word 0b01010001000000011110100100100011
	
test_vector_2:
	.word 0b10010011011110000101110111011000
	.word 0b00110010101101111100100101111110
	.word 0b01110001011101110011101111000000
	.word 0b10101001001000001000111100000011
	.word 0b00001010010011010001111001000001
	.word 0b00101100010011100110001010001011
	.word 0b01100110110111000011010011010110
	.word 0b11010100101000000000111001011111