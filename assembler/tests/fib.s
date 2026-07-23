_start:
	li %a0, #0
	li %a1, #1

	li %s0, #0

loop:
	cmp %s0, #10 ; run the loop 10 times
	bge done

	; actual fib calc
	; swap registers
	xor %a0, %a0, %a1
	xor %a1, %a0, %a1
	xor %a0, %a0, %a1
	
	add %a1, %a0, %a1
	add %s0, %s0, #1
	jmp loop

done:
	jmp done
