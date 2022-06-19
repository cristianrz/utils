PREFIX ?= $(HOME)/.local

all:

install:
	mkdir -p $(PREFIX)/bin
	cp -r bin/* $(PREFIX)/bin
	mkdir -p $(PREFIX)/etc
	cp -r etc/* $(PREFIX)/etc


uninstall:
	rm -f $(PREFIX)/bin/profilecron
	rm -f $(PREFIX)/bin/profilectl
	rm -f $(PREFIX)/bin/profileinit
	rm -f $(PREFIX)/bin/profileshutdown
	rm -f $(PREFIX)/etc/crontab
	rm -f $(PREFIX)/etc/rc
	rm -f $(PREFIX)/etc/rc.conf
	rm -f $(PREFIX)/etc/rc.d/profilecron
	rm -f $(PREFIX)/etc/rc.d/sleep
	rm -f $(PREFIX)/etc/rc.shutdown
