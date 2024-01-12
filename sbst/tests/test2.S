.section .text
.global test2
.type test2, @function

test2:
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

	li a4, 28
	li a5, 0

loop:
	lw t2, 0(t0)          # load first test value
	lw t3, 4(t0)          # load second test value
	lw t4, 0(t1)          # load first test value
	lw t5, 4(t1)          # load second test value

	mul a0, t2, t4        # perform multiplication
	mul a1, t3, t5        # perform multiplication

	#store the two results 

	sw a0, 0(a2)
	sw a1, 0(a3)

	addi t0, t0, 4
	addi t1, t1, 4
	addi a5, a5, 1

	blt a5, a4, loop


    #li a0, 0xCAFECAFE    # return value
	mv a0, a5

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
	.word 0xf0000000
	.word 0x0f000000
	.word 0x00f00000
	.word 0x000f0000
	.word 0x0000f000
	.word 0x00000f00
	.word 0x000000f0
	.word 0x0000000f
	.word 0xff000000
	.word 0x0ff00000
	.word 0x00ff0000
	.word 0x000ff000
	.word 0x0000ff00
	.word 0x00000ff0
	.word 0x000000ff
	.word 0xf000000f
	.word 0xfff00000
	.word 0x0fff0000
	.word 0x00fff000
	.word 0x000fff00
	.word 0x0000fff0
	.word 0x00000fff
	.word 0xf00000ff
	.word 0xff00000f
	.word 0xffff0000
	.word 0x0ffff000
	.word 0x00ffff00
	.word 0x000ffff0
	.word 0x0000ffff
	.word 0xf0000fff
	.word 0xff0000ff
	.word 0xfff0000f
	.word 0xfffff000
	.word 0x0fffff00
	.word 0x00fffff0
	.word 0x000fffff
	.word 0xf000ffff
	.word 0xff000fff
	.word 0xfff000ff
	.word 0xffff000f
	.word 0xffffff00
	.word 0x0ffffff0
	.word 0x00ffffff
	.word 0xf00fffff
	.word 0xff00ffff
	.word 0xfff00fff
	.word 0xffff00ff
	.word 0xfffff00f
	.word 0xfffffff0
	.word 0x0fffffff
	.word 0xf0ffffff
	.word 0xff0fffff
	.word 0xfff0ffff
	.word 0xffff0fff
	.word 0xfffff0ff
	.word 0xffffff0f
	.word 0xffffffff


test_vector_2:
	.word 0xf0000000
	.word 0x0f000000
	.word 0x00f00000
	.word 0x000f0000
	.word 0x0000f000
	.word 0x00000f00
	.word 0x000000f0
	.word 0x0000000f
	.word 0xff000000
	.word 0x0ff00000
	.word 0x00ff0000
	.word 0x000ff000
	.word 0x0000ff00
	.word 0x00000ff0
	.word 0x000000ff
	.word 0xf000000f
	.word 0xfff00000
	.word 0x0fff0000
	.word 0x00fff000
	.word 0x000fff00
	.word 0x0000fff0
	.word 0x00000fff
	.word 0xf00000ff
	.word 0xff00000f
	.word 0xffff0000
	.word 0x0ffff000
	.word 0x00ffff00
	.word 0x000ffff0
	.word 0x0000ffff
	.word 0xf0000fff
	.word 0xff0000ff
	.word 0xfff0000f
	.word 0xfffff000
	.word 0x0fffff00
	.word 0x00fffff0
	.word 0x000fffff
	.word 0xf000ffff
	.word 0xff000fff
	.word 0xfff000ff
	.word 0xffff000f
	.word 0xffffff00
	.word 0x0ffffff0
	.word 0x00ffffff
	.word 0xf00fffff
	.word 0xff00ffff
	.word 0xfff00fff
	.word 0xffff00ff
	.word 0xfffff00f
	.word 0xfffffff0
	.word 0x0fffffff
	.word 0xf0ffffff
	.word 0xff0fffff
	.word 0xfff0ffff
	.word 0xffff0fff
	.word 0xfffff0ff
	.word 0xffffff0f
	.word 0xffffffff