.PHONY: all clean help run

all:
ifneq ($(ASM),)
	@$(MAKE) run ASM="$(ASM)"
else
	@echo "Error: Please specify the source file(s) to compile."
	@echo "Usage: make run ASM=path/to/file.asm"
	@echo "Or:    make run ASM=\"file1.asm file2.asm\""
	@exit 1
endif

run: $(ASM) $(DEFINITIONS)
	@if [ -z "$(ASM)" ]; then \
		echo "Error: ASM variable is empty. Usage: make run ASM=file.asm"; \
		exit 1; \
	fi
	customasm customasm/main.asm $(ASM) -f readmemh,width:8 -o program.hex

clean:
	rm -f program.hex

help:
	@echo "make run ASM=file.asm     - Compiles the specified file(s) to 8-bit hex format"
	@echo "make clean                - Removes compiled .hex files"
