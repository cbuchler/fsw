PREFIX ?= /usr/local
root = $(DESTDIR)$(PREFIX)

.PHONY: install test
install:
	install -d "$(root)/bin" "$(root)/share/fsw"
	install -m 755 bin/fsw "$(root)/bin/fsw"
	install -m 644 share/fsw/rules.example.toml "$(root)/share/fsw/rules.example.toml"

test:
	bash tests/fsw.test.sh
