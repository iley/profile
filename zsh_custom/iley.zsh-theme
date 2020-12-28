function _prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function _prompt_user {
  local user=$(whoami)
  if [[ ! ("$user" =~ 'ilya|iley|istrukov') || -n "$SSH_CLIENT" ]]; then
      echo "$user@"
  fi
}

function _prompt_host {
  local host=`hostname`
  if [[ "$host" =~ '^([^\.]+)\..+' ]]; then
    echo $match[1]
  else
    echo $host
  fi
}

function _prompt_pwd {
  local max_len=32
  local dir="$(pwd|sed -e "s#^$HOME#~#")"
  if [ ${#dir} -gt $max_len ]; then
    local cut=$(expr ${#dir} - $max_len + 3)
    dir="...${dir:$cut}"
  fi
  echo $dir
}

PROMPT='%(1j.* .)%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}$(_prompt_user))$(_prompt_host) %{$fg_bold[blue]%}$(_prompt_pwd) $(git_prompt_info)%_$(_prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
