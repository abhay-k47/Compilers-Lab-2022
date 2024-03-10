target_translator: lex.yy.o y.tab.o translator.o target_translator.o
	g++ lex.yy.o y.tab.o translator.o target_translator.o -lfl -o target_translator

target_translator.o: target_translator.cxx translator.h
	g++ -c target_translator.cxx

translator.o: translator.cxx translator.h
	g++ -c translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: lexer.l y.tab.h translator.h
	flex lexer.l

y.tab.c y.tab.h: parser.y
	bison -dty --report=all parser.y

libutil.a: util.o
	ar -rcs libutil.a util.o

util.o: util.c myio.h
	gcc -c util.c

clean:
	rm -f libutil.a util.o target_translator translator.o target_translator.o lex.yy.* y.tab.* y.output ./test.test*

test: target_translator libutil.a ./test/*.c 
	@echo "Generating assembly files\n"
	./target_translator ./test/test1 > ./test/quads1.out
	./target_translator ./test/test2 > ./test/quads2.out
	./target_translator ./test/test3 > ./test/quads3.out
	./target_translator ./test/test4 > ./test/quads4.out
	./target_translator ./test/test5 > ./test/quads5.out
	./target_translator ./test/test6 > ./test/quads6.out
	@echo "Compiling assembly files\n"
	gcc ./test/test1.s -L. -lutil -no-pie -o ./test/test1
	gcc ./test/test2.s -L. -lutil -no-pie -o ./test/test2
	gcc ./test/test3.s -L. -lutil -no-pie -o ./test/test3
	gcc ./test/test4.s -L. -lutil -no-pie -o ./test/test4
	gcc ./test/test5.s -L. -lutil -no-pie -o ./test/test5
	gcc ./test/test6.s -L. -lutil -no-pie -o ./test/test6
	@echo "Binaries generated. Run using ./test<num>\n\n"
	@echo "Running test1:\n"
	@./test/test1
	@echo "\nRunning test2:\n"
	@./test/test2
	@echo "\nRunning test3:\n"
	@./test/test3
	@echo "\nRunning test4:\n"
	@./test/test4
	@echo "\nRunning test5:\n"
	@./test/test5
	@echo "\nRunning test6:\n"
	@./test/test6