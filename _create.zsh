# This file is supposed to be sourced, not executed, because it needs to run into the current shell.

if ! command -v _create_zenlib_func > /dev/null 2>&1; then
    echo 'Initialize _create function'

    function _create_zenlib_func {
        echo -n 'Executable name: '
        read -r filename

        if command -v "$filename" > /dev/null 2>&1; then
            echo "ERROR: executable '$filename' already exists, you will run into conflicts!"
            whence -v "$filename"
            return 1
        fi

        if [[ -f "funcs/$filename" ]]; then
            echo "ERROR: file '$filename' already exists!"
            return 1
        fi

        set -x
        cp templates/func "funcs/$filename"
        chmod 750 "funcs/$filename"
        $EDITOR "funcs/$filename"
        set +x
    }
fi

_create_zenlib_func
