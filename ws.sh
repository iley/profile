if [ -z "$WORKON_HOME" ]; then
    export WORKON_HOME="$HOME/.virtualenvs"
fi

function workon () {
    virtualenv="$1"
    if [ -z "$virtualenv" ]; then
        echo "Usage: workon env_name" >&2
        return 1
    fi
    if ! [ -e "$WORKON_HOME/$virtualenv" ]; then
        echo "Virtualenv '$virtualenv' does not exist" >&2
        return 1
    fi
    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
    fi
    . "$WORKON_HOME/$virtualenv/bin/activate"
}

# TODO: mkvirtualenv, rmvirtualenv

function ws () {
    workspace="$1"
    if [ -z "$workspace" ]; then
        echo "Usage: ws workspace_name" >&2
        return 1
    fi
    config="$HOME/.workspace.json"
    if ! command -v jq >/dev/null 2>&1; then
        echo "jq is not installed" >&2
        return 1
    fi
    json=$(jq -M ".$workspace" "$config")
    if [ $? -ne 0 ]; then
        echo "Unknown workspace '$workspace'. Check your config at '$config'" >&2
        return 1
    fi
    virtualenv=$(jq -r -M ".virtualenv" <<< "$json" 2>/dev/null)
    if [ $? -eq 0 ] && [ "$virtualenv" != "null"  ]; then
        echo Activating virtualenv $virtualenv
        workon "$virtualenv"
    else
        if [ -n "$VIRTUAL_ENV" ]; then
            deactivate
        fi
    fi
    dir=$(jq -r -M ".dir" <<< "$json" 2>/dev/null)
    if [ $? -eq 0 ] && [ "$dir" != "null"  ]; then
        echo Changing directory to $dir
        eval "cd $dir"
    fi
}
