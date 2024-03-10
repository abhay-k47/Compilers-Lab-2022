output.txt: lexer test.c
	./lexer < test.c > output.txt
lexer: lex.yy.c
	gcc lex.yy.c lexer_main.c -lfl -o lexer
lex.yy.c: lexer.l
	flex lexer.l
clean:
	rm -f lex.yy.c lexer output.txt
