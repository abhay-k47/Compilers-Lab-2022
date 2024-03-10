a.out: test.o libmyio.a
	cc test.o -L. -lmyio

test.o: test.c myio.h
	cc -c test.c

libmyio.a: myio.o
	ar -rcs libmyio.a myio.o

myio.o: myio.c myio.h
	cc -c myio.c

clean:
	rm a.out test.o libmyio.a myio.o
