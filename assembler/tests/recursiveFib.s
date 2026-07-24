:start:
	; init sp
	li %sp, #0xFFFF8
	li %t0, #0xFFFFF
	srl %t0, %t0, #40
	and %sp, %sp, %t0

	li %a0, #10 ; recursive fib 10 times
	
	add %lr, %pc, #8
	jmp fib

	; t0 is mmio ptr
	; t1 is _text.fib ptr
	; t2 is index reg
	; s0 is ascii val
	; s1 is fib index
	li %t0, #_text.screen
	ld %t0, [%t0 + #0]
	li %t1, #_text.fib
	li %t2, #0
; print leading fib number
.string:
	add %s0, %t2, %t1
	lb %s0, [%s0 + #0]
	cmp %s0, #0
	bzs .lpbegin

	add %s1, %t2, %t0
	sb %s0, [%s1 + #0]

	add %t2, %t2, #1
	jmp .string

.lpbegin:
	li %s1, #0
	add %t2, %t2, #16 

.fib:
	cmp %s1, #16
	bge .done

	add %s0, %a0, #0 ; move calculated fib number into temp reg
	li %s2, #0xF
	sll %s3, %s1, #2 ; *4
	srl %s0, %s0, %s3
	and %s0, %s0, %s2
	
	cmp %s0, #10 
	bge ..else
	..if: 
		add %s0, %s0, #48 ; convert to ascii
		add %s3, %t0, %t2
		sb %s0, [%s3 + #0]
		jmp ..endif
	..else:
		add %s0, %s0, #55
		add %s3, %t0, %t2
		sb %s0, [%s3 + #0]
	..endif:

	add %s1, %s1, #1
	sub %t2, %t2, #1 ; print backwards (actually correct)
	jmp .fib
	
.done:
	jmp .done

fib:
.prologue:
	sub %sp, %sp, #24 ; lr, a0, stashed a0 (high-low)
	sd %lr, [%sp + #16]
	sd %a0, [%sp + #8]

	; base case (if (n < 2) return n;)
	cmp %a0, #2
	bge .skip
	ld %a0, [%sp + #8] 	; reload a0 to be safe
	
	jmp .epilogue

.skip:
	sub %a0, %a0, #1 ; n-1
	add %lr, %pc, #8
	jmp fib
	
	sd %a0, [%sp + #0] 	; save n-1 calc

	ld %a0, [%sp + #8] 	; re-load original n
	sub %a0, %a0, #2	; n-2
	add %lr, %pc, #8
	jmp fib

	ld %t0, [%sp + #0] ; reload n-1
	add %a0, %a0, %t0

.epilogue:
	ld %lr, [%sp + #16]
	add %sp, %sp, #24
	ji [%lr + #0]
	

_text:
.fib:
	#d "Fib Number: \0"

#align 8
.screen:
	#d8 0x00, 0x10, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x00
