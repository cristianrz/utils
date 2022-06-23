PREFIX ?= $(HOME)/.local

all:
	@mkdir -p build/bin
	@cp src/hostify.sh build/bin/hostify
	@chmod +x build/bin/hostify

install:
	@cp build/bin/* $(PREFIX)/bin

uninstall:
	@rm -f $(PREFIX)/bin/hostify

clean:
	@rm -rf ./build
