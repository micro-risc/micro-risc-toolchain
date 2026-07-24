FRAMEBUF_BASE = 0xF0001 ; not actual base, actual base is 0xF0001000

_start:
	; mmio address gen
	li %s0, #FRAMEBUF_BASE
	sll %s0, %s0, #12

	li %t0, #0xFFFFF
	srl %t0, %t0, #32

	and %s0, %s0, %t0
	; s0 contains 0x0000_0000_F000_1000
	; s1 is index register
	; s2 contains _text
	li %s1, #0
	li %s2, #_text
	
	; a0 is char to write
	; load a0 with char
	
loop:
	add %t0, %s1, %s2
	lb %a0, [%t0 + #0]

	; null byte check
	cmp %a0, #0
	bzs done

	; store the byte 
	add %t0, %s1, %s0
	sb %a0, [%t0 + #0]

	; increment
	add %s1, %s1, #1

	jmp loop

done:
	add %t1, %s1, %s0
	sb %a0, [%t1 + #0] ; keep probing it
	jmp done

_text:
	#d "Hello World\0"
