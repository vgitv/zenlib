SHELL := /usr/bin/zsh

targetdir := ~/.local/share/zsh/zenlib

all: $(targetdir) $(targetdir)/completion $(targetdir)/funcs.zwc $(targetdir)/zenlib.zsh $(subst completion/,$(targetdir)/completion/,$(wildcard completion/*))

$(targetdir)/funcs.zwc: $(wildcard funcs/*)
	zcompile $(targetdir)/funcs funcs/*

$(targetdir)/completion/%: completion/%
	cp $^ $@

$(targetdir)/zenlib.zsh: $(wildcard funcs/*) zenlib.zsh
	cp zenlib.zsh $(targetdir)/zenlib.zsh
	print 'autoload -Uz' funcs/*(.:t) >> $(targetdir)/zenlib.zsh

$(targetdir):
	mkdir -p $@

$(targetdir)/completion:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf $(targetdir)
