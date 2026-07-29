#ifndef TOKENIZER_H
#define TOKENIZER_H

#include <stdio.h>

typedef enum {
	TOKEN_DOT, 		/* . */
	TOKEN_COMMA, 	/* , */
	TOKEN_COLON, 	/* : */
	TOKEN_LPAREN, 	/* ( */
	TOKEN_RPAREN, 	/* ) */
	TOKEN_DOLLAR, 	/* $ */
	TOKEN_PERCENT, 	/* % */
	TOKEN_STRING, 	/* Anything that isn't .,:()$% */
	TOKEN_EOL, 		/* End of line */
	TOKEN_NULL 		/* End of Token Stream */
} TokenType;

#define TOKEN_BUF_LEN 32

typedef struct {
	TokenType tok;
	char string[TOKEN_BUF_LEN]; /* Only Valid for TOKEN_STRING */
} Token;

Token* tokenize(FILE* fptr);

#endif
