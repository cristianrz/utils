PREFIX ?= /usr/local

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -p noraid $(DESTDIR)$(PREFIX)/bin/noraid
	chmod 755 $(DESTDIR)$(PREFIX)/bin/noraid

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/noraid
