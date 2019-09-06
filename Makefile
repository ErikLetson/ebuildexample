CC=gcc
CFLAGS=-I.
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

ebuildexample: $(OBJ)
	$(CC) -o ebuildexample $(OBJ)

.PHONY: clean
clean:
	rm -f $(OBJ) ebuildexample

.PHONY: install
install: ebuildexample
	mkdir -p $(DESTDIR)
	cp $< $(DESTDIR)/ebuildexample

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/ebuildexample
