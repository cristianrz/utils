PREFIX ?= $(HOME)/.local

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -p ping-sweep $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ping-sweep

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ping-sweep
