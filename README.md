# zenlib

### Introduction

Zsh functions for autoloading.


### Installation

Clone the repository wherever you want, and run the `make` command. It will
compile the functions (using `zcompile`), create dynamically an init zsh file
and put them both into a newly created `~/.local/share/zsh/zenlib/` directory.

Then source the `zenlib.zsh` file from your zshrc.

Example:

```sh
# Clone the repository anywhere
git clone https://github.com/vgitv/zenlib
cd zenlib
make
echo 'source "$HOME/.local/share/zsh/zenlib/zenlib.zsh"' >> "${ZDOTDIR:-HOME}/.zshrc"
```

Update:

```sh
cd zenlib
git pull
make
```
