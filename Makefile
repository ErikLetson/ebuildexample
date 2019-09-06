CC=gcc
CFLAGS=-I.
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

PREFIX=/usr/bin

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

ebuildexample: $(OBJ)
	$(CC) -o ebuildexample $(OBJ)

.PHONY: clean
clean:
	rm -f $(OBJ) ebuildexample

.PHONY: install
install: ebuildexample
	mkdir -p $(DESTDIR)$(PREFIX)
	cp $< $(DESTDIR)$(PREFIX)/ebuildexample

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/ebuildexample
