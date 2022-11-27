PREFIX ?= $(HOME)/.local

all:

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin 
	@cp -p extract $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/extract

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/extract
