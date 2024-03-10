%{
    #define KEYWORD             1
    #define IDENTIFIER          2
    #define INTEGER_CONSTANT    3
    #define FLOATING_CONSTANT   4
    #define CHARACTER_CONSTANT  5
    #define STRING_LITERAL      6
    #define PUNCTUATOR          7
    #define SINGLE_LINE_COMMENT 8
    #define MULTI_LINE_COMMENT  9
    #define ERR                 -1
%}
%x SINGLE_LINE_COMMENT_BODY
%x MULTI_LINE_COMMENT_BODY
KEYWORD                 "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"register"|"restrict"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"|"_Bool"|"_Complex"|"_Imaginary"
PUNCTUATOR              "["|"++"|"/"|"?"|"="|","|"]"|"("|"{"|"}"|"."|"->"|"*"|"+"|"-"|"~"|"!"|"%"|"<<"|">>"|"<"|">"|"<="|">="|":"|";"|"..."|"*="|"/="|"%="|"+="|"-="|"<<="|"#"|"--"|")"|"&"|"=="|"^"|"|"|"&&"|">>="|"!="|"&="|"^="|"||"|"|"   
ESCAPE_SEQUENCE         "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"
NON_DIGIT               [_a-zA-Z]
WHITESPACE              [ \t\n]
DIGIT                   [0-9]
NON_ZERO_DIGIT          [1-9]
SIGN                    [+-]

IDENTIFIER              {NON_DIGIT}({NON_DIGIT}|{DIGIT})*   
DIGIT_SEQUENCE          ({DIGIT})+
ENUMERATION_CONSTANT    {IDENTIFIER}
EXPONENT_PART           e|E({SIGN})?{DIGIT_SEQUENCE}
FRACTIONAL_CONSTANT     ({DIGIT_SEQUENCE})?\.{DIGIT_SEQUENCE}|{DIGIT_SEQUENCE}\.
FLOATING_CONSTANT       {FRACTIONAL_CONSTANT}({EXPONENT_PART})?|{DIGIT_SEQUENCE}{EXPONENT_PART}
INTEGER_CONSTANT        {NON_ZERO_DIGIT}({DIGIT})*|"0"

C_CHAR                  [^\'\\\n]|{ESCAPE_SEQUENCE}
C_CHAR_SEQUENCE         ({C_CHAR})+
CHARACTER_CONSTANT      \'{C_CHAR_SEQUENCE}\'

CONSTANT                {INTEGER_CONSTANT}|{FLOATING_CONSTANT}|{CHARACTER_CONSTANT}|{ENUMERATION_CONSTANT}

S_CHAR                  [^\"\\\n]|{ESCAPE_SEQUENCE}
S_CHAR_SEQUENCE         ({S_CHAR})+
STRING_LITERAL          \"({S_CHAR_SEQUENCE})?\"

%%
{KEYWORD}                           { return KEYWORD; }
{IDENTIFIER}                        { return IDENTIFIER; }
{INTEGER_CONSTANT}                  { return INTEGER_CONSTANT; }
{FLOATING_CONSTANT}                 { return FLOATING_CONSTANT; }
{CHARACTER_CONSTANT}                { return CHARACTER_CONSTANT; }
{STRING_LITERAL}                    { return STRING_LITERAL; }
{PUNCTUATOR}                        { return PUNCTUATOR; }
"/*"                                { BEGIN(MULTI_LINE_COMMENT_BODY); }
<MULTI_LINE_COMMENT_BODY>[^*\n]*
<MULTI_LINE_COMMENT_BODY>"*"+[^*/\n]*
<MULTI_LINE_COMMENT_BODY>\n
<MULTI_LINE_COMMENT_BODY>"*"+"/"    { BEGIN(INITIAL); return MULTI_LINE_COMMENT; }
"//"                                { BEGIN(SINGLE_LINE_COMMENT_BODY); }
<SINGLE_LINE_COMMENT_BODY>[^\n]*
<SINGLE_LINE_COMMENT_BODY>"\n"      { BEGIN(INITIAL); return SINGLE_LINE_COMMENT; }
{WHITESPACE}                        { ; }
.                                   { return ERR; }
%%

int yywrap(void){
    return 1;
}