_start:
	li %t0, #0xF ; run 15 times
loop:
	sub %t0, %t0, #1
	bvc loop
