#include "tokenizer.h"
#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

static Token* tokenStream;
static int tokenStreamLen;

void emitTok(TokenType token) {
	tokenStream = realloc(tokenStream, ( tokenStreamLen + 1 ) * sizeof(Token) );	
	
	tokenStream[tokenStreamLen].tok = token;	
	
	tokenStreamLen++;
}

void emitTokStr(TokenType token, char str[TOKEN_BUF_LEN]) {
	tokenStream = realloc(tokenStream, ( tokenStreamLen + 1) * sizeof(Token) );	
	
	tokenStream[tokenStreamLen].tok = token;
	memcpy(tokenStream[tokenStreamLen].string, str, sizeof(char) * TOKEN_BUF_LEN);
	
	tokenStreamLen++;
}

bool isSpecial(int c) {
	if (c == EOF) return false;
	switch ((char) c) {
		case '.': return true; break;
		case ',': return true; break;
		case ':': return true; break;
		case '(': return true; break;
		case ')': return true; break;
		case '$': return true; break;
		case '%': return true; break;
		default: return false; 	break;
	}	

	return 0;
}

Token* tokenize(FILE* fptr) {
	int c;

	while ( (c = fgetc(fptr)) != EOF ) {
		if ( c == '\t' || c == ' ' ) continue; 	/* Skip Whitespace */
		if ( c == ';' ) { 						/* Handle ; Comments */
			while ( (c = getc(fptr)) != EOF && c != '\n'); /* Skip to EOL */
			emitTok(TOKEN_EOL);
			continue;
		}

		switch ((char) c) {
			case '.': emitTok(TOKEN_DOT); 		break;
			case ',': emitTok(TOKEN_COMMA); 	break;
			case ':': emitTok(TOKEN_COLON); 	break;
			case '(': emitTok(TOKEN_LPAREN); 	break;
			case ')': emitTok(TOKEN_RPAREN); 	break;
			case '$': emitTok(TOKEN_DOLLAR); 	break;
			case '%': emitTok(TOKEN_PERCENT); 	break;
			case '\n': emitTok(TOKEN_EOL); 		break;
			default: {
				char buffer[TOKEN_BUF_LEN];
				int len = 0;
				
				buffer[len++] = (char) c;

				while ( (c = fgetc(fptr)) != EOF ) {
					if (isspace(c) || isSpecial(c)) {
						ungetc(c, fptr);
						break;
					}
					
					if (len >= TOKEN_BUF_LEN - 1) {
						ungetc(c, fptr);
						break;
					}

					buffer[len++] = (char) c;
					
				}

				buffer[len] = '\0';

				emitTokStr(TOKEN_STRING, buffer);

				break;
			}
		}
	}

	emitTok(TOKEN_EOL);
	emitTok(TOKEN_NULL);

	return tokenStream;
}
