#include "tokenizer.h"
#include <stdio.h>

int main(int argc, char** argv) {
	FILE* fptr; 
	Token* tokenStream;

	fptr = fopen("tests/test1.s", "r");
	if (fptr == NULL) {
		printf("File Not Found\n");
		return 1;
	}
	
	tokenStream = tokenize(fptr);

	{
		int i = 0;
		while (tokenStream[i].tok != TOKEN_NULL) {
			switch (tokenStream[i].tok) {
				case TOKEN_DOT: 	printf("TOKEN_DOT\n"); 		break;
				case TOKEN_COMMA: 	printf("TOKEN_COMMA\n"); 	break;
				case TOKEN_COLON: 	printf("TOKEN_COLON\n"); 	break;
				case TOKEN_LPAREN: 	printf("TOKEN_LPAREN\n"); 	break;
				case TOKEN_RPAREN: 	printf("TOKEN_RPAREN\n"); 	break;
				case TOKEN_DOLLAR: 	printf("TOKEN_DOLLAR\n"); 	break;
				case TOKEN_PERCENT: printf("TOKEN_PERCENT\n"); 	break;
				case TOKEN_EOL: 	printf("TOKEN_EOL\n"); 		break;
				case TOKEN_STRING: 	printf("TOKEN_STRING: %s\n", tokenStream[i].string); break;
				default: printf("UNRECOGNIZED TOKEN\n"); 		break;
			}

			i++;
		}
	}
	
	return 0;
}
