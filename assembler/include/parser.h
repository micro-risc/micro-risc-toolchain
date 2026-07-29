#ifndef PARSER_H
#define PARSER_H

#include "common.h"
#include "tokenizer.h"

typedef enum {
	FMT_R,
	FMT_I,
	FMT_J,
	FMT_B,
	FMT_LI,
	FMT_S
} InstructionFormat;

typedef enum {
	OPC_ALU_R,
	OPC_ALU_I,
	OPC_LOAD,
	OPC_STORE,
	OPC_JMP,
	OPC_JI,
	OPC_LLI
} Opcode;

typedef enum {
	OPER_REG, 	/* %reg */
	OPER_NONE, 	/* unused in the entry */
	OPER_IMM, 	/* $imm */
	OPER_MEM 	/* $imm(%reg), */
} OperandType;

/* Pass 2 uses these to detect instructions */
typedef struct {
	char mnemonic[TOKEN_BUF_LEN];
	
	InstructionFormat fmt;
	

} InstructionEntry;

#endif
