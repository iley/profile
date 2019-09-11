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
  _values desks $(cd "$DESK_HOME" && ls *.sh | sed 's/\.sh//')
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
  _values virtualenvs $(cd "$WORKON_HOME" && ls)
}

mkvirtualenv () {
  local use_python3=1
  if [[ "$1" == "-2" ]]; then
    echo "Using Python 2" >&2
    use_python3=
    shift
  else
    echo "Using Python 3" >&2
  fi
  local name="$1"
  shift
  if [[ -z "$name" ]]; then
    echo "Usage: mkvirtualenv [-2] name [args]" >&2
    return 1
  fi
  local env_path="$WORKON_HOME/$name"
  if [[ -e "$env_path" ]]; then
    echo "virtualenv '$env_path' already exists" >&2
    return 1
  fi
  mkdir -p "$env_path"
  if [[ -n "$use_python3" ]]; then
    python3 -m venv "$env_path"
  else
    virtualenv "$env_path"
  fi
  workon "$name"
}

rmvirtualenv () {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "Usage: rmvirtualenv name" >&2
    return 1
  fi
  local env_path="$WORKON_HOME/$name"
  if [[ ! -e "$env_path" ]]; then
    echo "virtualenv '$env_path' does not exists" >&2
    return 1
  fi
  if [[ "$env_path" == "$VIRTUAL_ENV" ]]; then
    deactivate
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

up() {
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

_parent_dirs () {
  _values parent_dirs $(cd .. && pwd | sed 's/^.//' | tr '/' "\n")
}

kubekick () {
    local deployment="$1"
    if [[ -z "$deployment" ]]; then
        echo "Usage: kubekick DEPLOYMENT" >&2
        return
    fi
    kubectl patch deployment "$deployment" -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"
}

_deployments () {
    _values deployments $(kubectl get deployments -o name | sed 's/deployment.extensions\///')
}

_aws_environments () {
    _values aws_environments $(awsp -q)
}

if [[ -n "$ZSH_VERSION" ]]; then
  compdef _desks desk
  compdef _virtualenvs workon
  compdef _virtualenvs rmvirtualenv
  compdef _parent_dirs up
  compdef _deployments kubekick
  compdef _aws_environments awsp
fi
