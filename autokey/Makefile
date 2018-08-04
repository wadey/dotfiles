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

.FORCE:
.PHONY: kill
