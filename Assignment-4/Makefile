output.txt: parser test.c
	./parser < test.c > output.txt

parser: lex.yy.o y.tab.o parser.o
	gcc lex.yy.o y.tab.o parser.o -lfl -o parser

parser.o: parser.c
	gcc -c parser.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.o: y.tab.c
	gcc -c y.tab.c

lex.yy.c: lexer.l y.tab.h
	flex lexer.l

y.tab.c y.tab.h: parser.y
	bison -dty --report=all parser.y

clean:
	rm -f parser parser.o lex.yy.* y.tab.* y.output output.txt
