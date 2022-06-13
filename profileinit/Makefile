all:

install:
	mkdir -p $(HOME)/.local/bin
	mkdir -p $(HOME)/.config/rc.d
	mkdir -p $(HOME)/.config/init.d
	cp -p local/bin/* $(HOME)/.local/bin
	cp -p config/init.d/* $(HOME)/.config/init.d

uninstall:
	rm -f $(HOME)/.local/bin/profileinit
	rm -f $(HOME)/.local/bin/profileshutdown
	rm -f $(HOME)/.local/bin/profilectl
	rm -f $(HOME)/.config/init.d/sleep
