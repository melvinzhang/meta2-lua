SHELL := /bin/bash
.PHONY: all

all: meta.lua

%.lua: %.meta
	cat $^ | lua meta.lua > $@

%.out: %.in
	cat $^ | lua $*.lua > $@

test: meta.meta
	diff meta.lua <(cat $^ | lua meta.lua)
