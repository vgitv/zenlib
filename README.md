# Zenlib - Autoloaded Zsh functions

## Introduction

This is a bunch of Zsh functions that I use on a daily basis.


## Install

Clone the repository wherever you want, and run the `make` command. It will
compile the functions (using `zcompile`), and put it into a newly created
`~/.local/share/zsh/zenlib/` directory, alongside the `zenlib.zsh` file.

Then source the `zenlib.zsh` file from your zshrc.

Example:

```sh
# Clone the repository anywhere
git clone https://github.com/vgitv/zenlib
cd zenlib
make
echo 'source "$HOME/.local/share/zsh/zenlib/zenlib.zsh"' >> "${ZDOTDIR:-HOME}/.zshrc"
```

## Update

```sh
git pull
make
```

## Uninstall

```sh
make clean
```
