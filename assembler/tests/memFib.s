FIB_START = 0x200 ; array of fibs

_start:
	li %s0, #FIB_START+8 	; %s0 is address reg
				; always points to fib to be written to
				; last fib is -4
	li %t0, #0
	sw %t0, [%s0 + #-8] 
	li %t0, #1
	sw %t0, [%s0 + #-4]

	li %s1, #0

loop:
	cmp %s1, #10		; loop 10 times (11th fib number)
	bge done

	; fib
	lw %t0, [%s0 + #-8]
	lw %t1, [%s0 + #-4]
	add %t2, %t1, %t0
	sw %t2, [%s0 + #0]
	add %s0, %s0, #4

	; increment
	add %s1, %s1, #1
	jmp loop

done:
	lw %a0, [%s0 + #-4] 	; load last fib into a0
				; should be 89 for 10 times looped
spin:
	jmp spin
  
