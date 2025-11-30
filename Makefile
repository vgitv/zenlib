SHELL := /usr/bin/zsh

targetdir := ~/.local/share/zsh/zenlib

all: $(targetdir) $(targetdir)/funcs.zwc $(targetdir)/zenlib.zsh

$(targetdir)/funcs.zwc: $(targetdir) $(wildcard funcs/*)
	zcompile $(targetdir)/funcs funcs/*

$(targetdir)/zenlib.zsh: $(targetdir) $(wildcard funcs/*) zenlib.zsh
	cp zenlib.zsh $(targetdir)/zenlib.zsh
	print 'autoload -Uz' funcs/*(.:t) >> $(targetdir)/zenlib.zsh

$(targetdir):
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf $(targetdir)
