# This file must be sourced because it's modifying the user shell

() {
    emulate -L zsh
    setopt no_unset pipe_fail err_return null_glob

    # nullglob is important if no zenlib-*.zsh are found
    typeset f; for f in "$XDG_RUNTIME_DIR"/zenlib-*.zsh; do
        . "$f" > /dev/null || true
    done
    fpath=("$HOME/.local/share/zsh/zenlib/funcs.zwc" "$HOME/.local/share/zsh/zenlib/completion" $fpath)
}
