function prompt_char {
    if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function prompt_user {
  local user=`whoami`
  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
      echo "$user@"
  fi
}

PROMPT='%(1j.* .)%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}$(prompt_user))%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
