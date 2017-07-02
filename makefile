.PHONY: all

all: meta.lua

%.lua: %.meta
	cat $^ | lua meta.lua > $@

test: meta.meta
	cat $^ | lua meta.lua > meta.next
	diff meta.next meta.lua
