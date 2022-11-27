PREFIX ?= $(HOME)/.local

all:

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin 
	@cp -p vimv $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/vimv

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/vimv
