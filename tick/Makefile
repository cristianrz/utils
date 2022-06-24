PREFIX ?= $(HOME)/.local

all:
	@cp src/tick.sh build/tick
	@chmod +x build/tick

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p build/tick $(DESTDIR)$(PREFIX)/bin

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/tick

clean:
	rm -rf ./clean
