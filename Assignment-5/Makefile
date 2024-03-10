translator: lex.yy.o y.tab.o translator.o
	g++ lex.yy.o y.tab.o translator.o -lfl -o translator

translator.o: translator.cxx translator.h
	g++ -c translator.cxx

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

lex.yy.c: lexer.l y.tab.h translator.h
	flex lexer.l

y.tab.c y.tab.h: parser.y
	bison -dty --report=all parser.y

test: translator
	@echo "Running testfile 1"
	./translator < ./test/test1.c > ./test/quads1.out

	@echo "Running testfile 2"
	./translator < ./test/test2.c > ./test/quads2.out

	@echo "Running testfile 3"
	./translator < ./test/test3.c > ./test/quads3.out

	@echo "Running testfile 4"
	./translator < ./test/test4.c > ./test/quads4.out

	@echo "Running testfile 5"
	./translator < ./test/test5.c > ./test/quads5.out
	
clean:
	rm -f translator translator.o lex.yy.* y.tab.* y.output
	@echo "Cleaning done!!!"
