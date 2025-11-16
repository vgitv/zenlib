SHELL := /usr/bin/zsh

targetdir := ~/.local/share/zsh/zenlib

all: $(targetdir) $(targetdir)/funcs.zwc $(targetdir)/zenlib.zsh

$(targetdir)/funcs.zwc: $(targetdir) $(wildcard funcs/*)
	zcompile $(targetdir)/funcs funcs/*

$(targetdir)/zenlib.zsh: $(targetdir) $(wildcard funcs/*) templates/zenlib.zsh
	cp templates/zenlib.zsh $(targetdir)/zenlib.zsh
	echo 'autoload -Uz' funcs/*(.:t) >> $(targetdir)/zenlib.zsh

$(targetdir):
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf $(targetdir)
