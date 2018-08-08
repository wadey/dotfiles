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

load-gnome:
	dconf load /org/gnome/desktop/wm/keybindings/ <org.gnome.desktop.wm.keybindings.conf

.FORCE:
.PHONY: kill dump-gnome load-gnome
