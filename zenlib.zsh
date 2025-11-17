# This file must be sourced because it's modifying the user current shell

function _zenlib_init {
    emulate -L zsh
    setopt nounset pipefail errreturn nullglob

    # nullglob is important if no zenlib-*.zsh are found
    for f in "$XDG_RUNTIME_DIR"/zenlib-*.zsh; do
        source "$f" > /dev/null || true
    done

    fpath=("$HOME/.local/share/zsh/zenlib/funcs.zwc" $fpath)
    autoload -Uz $(zcompile -t "$HOME/.local/share/zsh/zenlib/funcs.zwc" | awk -F '/' '/\// { print $2 }')
}

_zenlib_init
unfunction _zenlib_init
