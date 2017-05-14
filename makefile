.PHONY: all clean check

all: check

meta.lua:      bootstrap.lua  meta.txt runtime.lua
	lua $< < meta.txt >$@
meta-diff.lua: meta.lua       meta.txt runtime.lua
	lua $< < meta.txt >$@

check: meta.lua meta-diff.lua
	test $$(diff $^ | wc -l) -eq 0 && echo "Success!" || echo "Fail?"

clean:
	rm -f meta.lua meta-diff.lua
