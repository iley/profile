function workon
  set env_name $argv[1]
  if test -z $env_name
    echo "Usage: workon <env_name>"
    return 1
  end
  set env_path $HOME/.virtualenvs/$env_name
  source $env_path/bin/activate.fish
end
