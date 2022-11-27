PREFIX ?= $(HOME)/.local

all:

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin 
	@cp -p winstow $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/winstow

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/winstow
