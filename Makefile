SHELL := /usr/bin/zsh

targetdir := ~/.local/share/zsh/zenlib

all: $(targetdir) $(targetdir)/functions.zwc $(targetdir)/zenlib.zsh

$(targetdir)/functions.zwc: $(targetdir) $(wildcard functions/*)
	zcompile $(targetdir)/functions functions/*

$(targetdir)/zenlib.zsh: $(targetdir) $(wildcard functions/*) zenlib.zsh
	cp zenlib.zsh $(targetdir)/zenlib.zsh
	echo 'autoload -Uz' functions/*(.:t) >> $(targetdir)/zenlib.zsh

$(targetdir):
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf $(targetdir)
