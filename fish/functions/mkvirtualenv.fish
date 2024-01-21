function mkvirtualenv
  if test -z $argv[1]
    echo "Usage: mkvirtualenv <name>"
    return 1
  end

  if test -e $HOME/.virtualenvs/$argv[1]
    echo "Virtualenv $argv[1] already exists."
    return 1
  end

  set env_path $HOME/.virtualenvs/$argv[1]
  python3 -m venv $env_path

  workon $argv[1]
end
