gen: env .FORCE
	mkdir -p gen
	find ./gen -type f -delete
	./env/bin/python gen.py
	ls ./gen/*.py

kill:
	killall autokey-gtk

env:
	virtualenv env
	./env/bin/pip install PyYAML

dump-gnome:
	dconf dump /org/gnome/desktop/wm/keybindings/ >org.gnome.desktop.wm.keybindings.conf
	dconf dump /org/gnome/mutter/keybindings/ >org.gnome.mutter.keybindings.conf
	dconf dump /org/gnome/shell/keybindings/ >org.gnome.shell.keybindings.conf
	dconf dump /org/gnome/terminal/legacy/keybindings/ >org.gnome.terminal.legacy.keybindings.conf

load-gnome:
	dconf load /org/gnome/desktop/wm/keybindings/ <org.gnome.desktop.wm.keybindings.conf
	dconf load /org/gnome/mutter/keybindings/ <org.gnome.mutter.keybindings.conf
	dconf load /org/gnome/shell/keybindings/ <org.gnome.shell.keybindings.conf
	dconf load /org/gnome/terminal/legacy/keybindings/ <org.gnome.terminal.legacy.keybindings.conf

.FORCE:
.PHONY: kill dump-gnome load-gnome
