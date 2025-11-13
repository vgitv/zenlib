# This file is supposed to be sourced, not executed, because it needs to run into the current shell.

function _create {
    echo -n 'Executable name: '
    read -r filename

    if command -v "$filename" > /dev/null 2>&1; then
        echo "ERROR: executable '$filename' already exists, you will run into conflicts!"
        whence -v "$filename"
        return 1
    fi

    if [[ -f "functions/$filename" ]]; then
        echo "ERROR: file '$filename' already exists!"
        return 1
    fi

    set -x
    cp template/func "functions/$filename"
    chmod 750 "functions/$filename"
    $EDITOR "functions/$filename"
    set +x
}

_create
