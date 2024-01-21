function rmvirtualenv
  if test -z $argv[1]
    echo "Usage: rmvirtualenv <name>"
    return 1
  end

  if not test -e $HOME/.virtualenvs/$argv[1]
    echo "ERROR: Environment '$argv[1]' does not exist."
    return 1
  end

  read -l -P "Are you sure you want to delete '$argv[1]' (y/n)? " answer
  if test "$answer" != "y"
    echo "Aborted."
    return 1
  end

  rm -rf $HOME/.virtualenvs/$argv[1]

  echo "Environment '$argv[1]' deleted."
end
