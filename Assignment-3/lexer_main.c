#include <stdio.h>

#define KEYWORD             1
#define IDENTIFIER          2
#define INTEGER_CONSTANT    3
#define FLOATING_CONSTANT   4
#define CHARACTER_CONSTANT  5
#define STRING_LITERAL      6
#define PUNCTUATOR          7
#define SINGLE_LINE_COMMENT 8
#define MULTI_LINE_COMMENT  9
#define ERR                -1

extern int yylex();
extern char* yytext;
int main(){
    int token;
    while(token = yylex()){
        switch(token){
            case KEYWORD:
                printf("<KEYWORD, %d, %s>\n", token, yytext);
                break;
            case IDENTIFIER:
                printf("<IDENTIFIER, %d, %s>\n", token, yytext);
                break;
            case INTEGER_CONSTANT:
                printf("<INTEGER_CONSTANT, %d, %s>\n", token, yytext);
                break;
            case FLOATING_CONSTANT:
                printf("<FLOATING_CONSTANT, %d, %s>\n", token, yytext);
                break;
            case CHARACTER_CONSTANT:
                printf("<CHARACTER_CONSTANT, %d, %s>\n", token, yytext);
                break;
            case STRING_LITERAL:
                printf("<STRING_LITERAL, %d, %s>\n", token, yytext);
                break;
            case PUNCTUATOR:
                printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
                break;
            case MULTI_LINE_COMMENT:
                printf("<MULTI_LINE_COMMENT, %d>\n", token);
                break;
            case SINGLE_LINE_COMMENT:
                printf("<SINGLE_LINE_COMMENT, %d>\n", token);
                break;
            default:
                printf("<INVALID_TOKEN, %d, %s>\n", token, yytext);
                break;
        }
    }
    return 0;
}