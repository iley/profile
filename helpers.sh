if [[ -z "$DESK_HOME" ]]; then
    export DESK_HOME="$HOME/.desks"
fi
if [[ -z "$WORKON_HOME" ]]; then
    export WORKON_HOME="$HOME/.virtualenvs"
fi

desk () {
  local desk_name="$1"
  if [[ -z "$desk_name" ]]; then
    echo "Usage: desk desk_name" >&2
    return 1
  fi
  local desk_file="$DESK_HOME/$desk_name.sh"
  if ! [[ -e "$desk_file" ]]; then
    echo "Desk file '$desk_file' not found" >&2
    return 1
  fi
  . "$desk_file"
}

_desks () {
  _values 'desks' $(cd "$DESK_HOME" && ls *.sh | sed 's/\.sh//')
  return 0
}

workon () {
    local virtualenv="$1"
    if [[ -z "$virtualenv" ]]; then
        echo "Usage: workon env_name" >&2
        return 1
    fi
    if ! [[ -e "$WORKON_HOME/$virtualenv" ]]; then
        echo "Virtualenv '$virtualenv' does not exist" >&2
        return 1
    fi
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
    . "$WORKON_HOME/$virtualenv/bin/activate"
}

_virtualenvs () {
  _values 'virtualenvs' $(cd "$WORKON_HOME" && ls)
  return 0
}

mkvirtualenv () {
    local name="$1"
    shift
    if [[ -z "$name" ]]; then
        echo "Usage: mkvirtualenv name [args]" >&2
        return 1
    fi
    local env_path="$WORKON_HOME/$name"
    if [[ -e "$env_path" ]]; then
        echo "virtualenv '$env_path' already exists" >&2
        return 1
    fi
    mkdir -p "$env_path"
    virtualenv $* "$env_path"
}

rmvirtualenv () {
    local name="$1"
    if [ -z "$name" ]; then
        echo "Usage: rmvirtualenv name" >&2
        return 1
    fi
    local env_path="$WORKON_HOME/$name"
    if [ ! -e "$env_path" ]; then
        echo "virtualenv '$env_path' does not exists" >&2
        return 1
    fi

    read -q "REPLY?Delete virtualenv '$env_path'? [y/N] " -c -n 1
    echo
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        rm -rf "$env_path"
    else
        echo "action aborted" >&2
        return 1
    fi
}

function up() {
  local start="$(pwd)"
  local target="$1"
  if [[ -z "$target" ]]; then
    echo "Usage: up DIR" 1>&2
    return
  fi
  while [[ "$(basename $(pwd))" != "$target" ]] && [[ "$(pwd)" != "/" ]]; do
    cd ..
  done
  if [[ "$(pwd)" == "/" ]]; then
    echo "Directory $target not found in path" 1>&2
    cd "$start"
  fi
}

if [[ -n "$ZSH_VERSION" ]]; then
  compdef _desks desk
  compdef _virtualenvs workon
fi
