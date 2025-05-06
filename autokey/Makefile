gen: env .FORCE
	mkdir -p gen
	find ./gen -type f -delete
	./env/bin/python gen.py
	ls ./gen/*.py

kill:
	killall autokey-gtk

env:
	python3 -m venv env
	./env/bin/pip install PyYAML

dump-gnome:
	dconf dump /org/gnome/desktop/peripherals/mouse/ >org.gnome.desktop.peripherals.mouse.conf
	dconf dump /org/gnome/desktop/input-sources/ >org.gnome.desktop.input-sources.conf
	dconf dump /org/gnome/desktop/wm/keybindings/ >org.gnome.desktop.wm.keybindings.conf
	dconf dump /org/gnome/mutter/ >org.gnome.mutter.conf
	dconf dump /org/gnome/shell/keybindings/ >org.gnome.shell.keybindings.conf
	dconf dump /org/gnome/terminal/legacy/keybindings/ >org.gnome.terminal.legacy.keybindings.conf
	dconf dump /org/gnome/terminal/legacy/profiles:/ >org.gnome.terminal.legacy.profiles.dconf

load-gnome:
	dconf load /org/gnome/desktop/peripherals/mouse/ <org.gnome.desktop.peripherals.mouse.conf
	dconf load /org/gnome/desktop/input-sources/ <org.gnome.desktop.input-sources.conf
	dconf load /org/gnome/desktop/wm/keybindings/ <org.gnome.desktop.wm.keybindings.conf
	dconf load /org/gnome/mutter/ <org.gnome.mutter.conf
	dconf load /org/gnome/shell/keybindings/ <org.gnome.shell.keybindings.conf
	dconf load /org/gnome/terminal/legacy/keybindings/ <org.gnome.terminal.legacy.keybindings.conf
	dconf load /org/gnome/terminal/legacy/profiles:/ <org.gnome.terminal.legacy.profiles.dconf

.FORCE:
.PHONY: kill dump-gnome load-gnome
