PREFIX ?= $(HOME)

all:

install:
	mkdir -p $(PREFIX)/.local/bin
	mkdir -p $(PREFIX)/.config/rc.d
	mkdir -p $(PREFIX)/.config/init.d
	cp -p local/bin/* $(PREFIX)/.local/bin
	cp -rp config/* $(PREFIX)/.config

uninstall:
	rm -f $(PREFIX)/.config/init.d/profilecron
	rm -f $(PREFIX)/.config/init.d/sleep
	rm -f $(PREFIX)/.local/bin/profilectl
	rm -f $(PREFIX)/.local/bin/profileinit
	rm -f $(PREFIX)/.local/bin/profileshutdown
