# unmodified code only builds properly on targets
# where "unsigned long" is 32-bit wide
CC=gcc
CFLAGS=-Wall -g -m32

all:	hashtest128 hashtest160 mactest128 mactest160

hashtest128: hashtest.c rmd128.c
	$(CC) $(CFLAGS) -DRMDsize=128 -o $@ $^

hashtest160: hashtest.c rmd160.c
	$(CC) $(CFLAGS) -DRMDsize=160 -o $@ $^

mactest128: mactest.c rmd128mc.c
	$(CC) $(CFLAGS) -DRMDsize=128 -o $@ $^

mactest160: mactest.c rmd160mc.c
	$(CC) $(CFLAGS) -DRMDsize=160 -o $@ $^

clean:
	rm -f {mac,hash}test1{28,60}
	rm -f *.o
