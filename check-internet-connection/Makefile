PREFIX ?= $(HOME)/.local

all:

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p check-internet-connection $(DESTDIR)$(PREFIX)/bin/check-internet-connection
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/check-internet-connection

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/check-internet-connection
