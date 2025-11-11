SHELL := /usr/bin/zsh

.PHONY: all
all:
	chmod 750 functions/*
	zcompile functions functions/*
