PREFIX ?= $(HOME)/.local

all:
	@cp src/run-tests.sh build/run-tests
	@chmod +x build/run-tests

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p build/run-tests $(DESTDIR)$(PREFIX)/bin

uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/run-tests

clean:
	rm -rf ./clean
