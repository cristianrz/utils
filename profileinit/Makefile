PREFIX ?= $(HOME)/.local

all:

install:
	mkdir -p $(PREFIX)/bin
	cp -r bin/* $(PREFIX)/bin
	mkdir -p $(PREFIX)/etc
	cp -r etc/* $(PREFIX)/etc


uninstall:
	rm -f $(PREFIX)/bin/userctl
	rm -f $(PREFIX)/bin/userinit
	rm -f $(PREFIX)/bin/usershutdown
	rm -f $(PREFIX)/etc/rc.subr
	rm -f $(PREFIX)/etc/rc.d/sleep
	rm -f $(PREFIX)/etc/rc.conf
	rm -f $(PREFIX)/etc/rc.shutdown
	rm -f $(PREFIX)/etc/rc.local
	rm -f $(PREFIX)/etc/rc
