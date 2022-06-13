all:

install:
	mkdir -p $(HOME)/.local/bin
	mkdir -p $(HOME)/.config/rc.d
	mkdir -p $(HOME)/.config/init.d
	cp -p local/bin/* $(HOME)/.local/bin
	cp -rp config/* $(HOME)/.config

uninstall:
	rm -f $(HOME)/.config/init.d/profilecron
	rm -f $(HOME)/.config/init.d/sleep
	rm -f $(HOME)/.local/bin/profilectl
	rm -f $(HOME)/.local/bin/profileinit
	rm -f $(HOME)/.local/bin/profileshutdown
