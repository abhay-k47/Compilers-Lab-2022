%{
    #include <stdio.h>
    #include "y.tab.h"
%}

%option yylineno 

%x MULTI_LINE_COMMENT_BODY
%x SINGLE_LINE_COMMENT_BODY

DIGIT               [0-9]
NON_ZERO_DIGIT      [1-9]
IDENTIFIER          [a-zA-Z_][a-zA-Z0-9_]*
DIGIT_SEQUENCE      {DIGIT}+
INTEGER_CONSTANT    {NON_ZERO_DIGIT}{DIGIT}*|0

EXPONENT_PART       [eE]([+-]?){DIGIT_SEQUENCE}
FRACTIONAL_CONSTANT {DIGIT_SEQUENCE}?\.{DIGIT_SEQUENCE}|{DIGIT_SEQUENCE}\.
FLOATING_CONSTANT   {FRACTIONAL_CONSTANT}{EXPONENT_PART}?|{DIGIT_SEQUENCE}{EXPONENT_PART}

ESCAPE_SEQUENCE     "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"

C_CHAR              {ESCAPE_SEQUENCE}|[^\'\n\\]
C_CHAR_SEQUENCE     {C_CHAR}+
CHARACTER_CONSTANT  \'{C_CHAR_SEQUENCE}?\'

S_CHAR              {ESCAPE_SEQUENCE}|[^\"\n\\]
S_CHAR_SEQUENCE     {S_CHAR}+
STRING_LITERAL      \"({S_CHAR_SEQUENCE}?)\"

WHITESPACE          [ \t]+
NEWLINE             \n

%%

"auto"                          { return AUTO; }
"break"                         { return BREAK; }
"case"                          { return CASE; }
"char"                          { return CHAR; }
"const"                         { return CONST; }
"continue"                      { return CONTINUE; }
"default"                       { return DEFAULT; }
"do"                            { return DO; }
"double"                        { return DOUBLE; }
"else"                          { return ELSE; }
"enum"                          { return ENUM; }
"extern"                        { return EXTERN; }
"float"                         { return FLOAT; }
"for"                           { return FOR; }
"goto"                          { return GOTO; }
"if"                            { return IF; }
"inline"                        { return INLINE; }
"int"                           { return INT; }
"long"                          { return LONG; }
"register"                      { return REGISTER; }
"restrict"                      { return RESTRICT; }
"return"                        { return RETURN; }
"short"                         { return SHORT; }
"signed"                        { return SIGNED; }
"sizeof"                        { return SIZEOF; }
"static"                        { return STATIC; }
"struct"                        { return STRUCT; }
"switch"                        { return SWITCH; }
"typedef"                       { return TYPEDEF; }
"union"                         { return UNION; }
"unsigned"                      { return UNSIGNED; }
"void"                          { return VOID; }
"volatile"                      { return VOLATILE; }
"while"                         { return WHILE; }
"_Bool"                         { return _BOOL; }
"_Complex"                      { return _COMPLEX; }
"_Imaginary"                    { return _IMAGINARY; }

{IDENTIFIER}                    { yylval.identifierVal = strdup(yytext); return IDENTIFIER; }
{INTEGER_CONSTANT}              { yylval.intVal = atoi(yytext); return INTEGER_CONSTANT; }
{FLOATING_CONSTANT}             { yylval.floatVal = atof(yytext); return FLOATING_CONSTANT; }
{CHARACTER_CONSTANT}            { yylval.charVal = strdup(yytext); return CHARACTER_CONSTANT; }
{STRING_LITERAL}                { yylval.stringVal = strdup(yytext); return STRING_LITERAL; }

"("                             { return LEFT_PARENTHESES; }
")"                             { return RIGHT_PARENTHESES; }
"{"                             { return LEFT_CURLY_BRACKET; }
"}"                             { return RIGHT_CURLY_BRACKET; }
"["                             { return LEFT_SQUARE_BRACKET; }
"]"                             { return RIGHT_SQUARE_BRACKET; }
"++"                            { return INCREMENT; }
"--"                            { return DECREMENT; }
"+"                             { return PLUS; }
"-"                             { return MINUS; }
"*"                             { return ASTERISK; }
"/"                             { return SLASH; }
"%"                             { return MODULO; }
"."                             { return PERIOD; }
"->"                            { return ARROW; }
","                             { return COMMA; }
";"                             { return SEMICOLON; }
":"                             { return COLON; }
"#"                             { return HASH; }
"..."                           { return ELLIPSIS; }
"?"                             { return QUESTION_MARK; }
"&&"                            { return LOGICAL_AND; }
"||"                            { return LOGICAL_OR; }
"!"                             { return EXCLAMATION; }
"=="                            { return EQUAL_TO; }
"!="                            { return NOT_EQUAL_TO; }
"<"                             { return LESS_THAN; }
"<="                            { return LESS_THAN_OR_EQUAL_TO; }
">"                             { return GREATER_THAN; }
">="                            { return GREATER_THAN_OR_EQUAL_TO; }
"&"                             { return BITWISE_AND; }
"|"                             { return BITWISE_OR; }
"^"                             { return BITWISE_XOR; }
"~"                             { return TILDE; }
"<<"                            { return LEFT_SHIFT; }
">>"                            { return RIGHT_SHIFT; }
"="                             { return ASSIGNMENT; }
"+="                            { return PLUS_ASSIGNMENT; }
"-="                            { return MINUS_ASSIGNMENT; }
"*="                            { return MULTIPLY_ASSIGNMENT; }
"/="                            { return DIVIDE_ASSIGNMENT; }
"%="                            { return MODULO_ASSIGNMENT; }
"&="                            { return BITWISE_AND_ASSIGNMENT; }
"|="                            { return BITWISE_OR_ASSIGNMENT; }
"^="                            { return BITWISE_XOR_ASSIGNMENT; }
"<<="                           { return LEFT_SHIFT_ASSIGNMENT; }
">>="                           { return RIGHT_SHIFT_ASSIGNMENT; }

"/*"                            { BEGIN(MULTI_LINE_COMMENT_BODY); }
<MULTI_LINE_COMMENT_BODY>"*/"   { BEGIN(INITIAL); }
<MULTI_LINE_COMMENT_BODY>.      { }
<MULTI_LINE_COMMENT_BODY>"\n"   { printf("\n\nParsing line %d, \n", yylineno); }

"//"                            { BEGIN(SINGLE_LINE_COMMENT_BODY); }        
<SINGLE_LINE_COMMENT_BODY>"\n"  { BEGIN(INITIAL); printf("\n\nParsing line %d, \n", yylineno); }
<SINGLE_LINE_COMMENT_BODY><<EOF>> { BEGIN(INITIAL); }
<SINGLE_LINE_COMMENT_BODY>.     { }

{WHITESPACE}                    { }
{NEWLINE}                       { printf("\n\nParsing line %d, \n", yylineno); }
.                               { printf("Error on line %d : Unrecognized character %s ", yylineno, yytext); return INVALID_TOKEN; }

%%
