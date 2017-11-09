source /etc/bash_completion.d/g4d
source /etc/bash_completion.d/x20_cd
source ~/.x20_tools.sh  # Updated by cron.

DEFAULT_USER=istrukov

blaze_run='/home/build/nonconf/google3/devtools/blaze/scripts/blaze-run.sh'
iblaze='/google/data/ro/teams/iblaze/iblaze'

alias annealing="/google/data/ro/teams/annealing/live/annealing"
alias blaze-run="$blaze_run"
alias build_cleaner='/google/data/ro/teams/social-backend/build_cleaner'
alias cdd='/google/data/ro/buildstatic-ro/projects/chubby/cdd/cdd'
alias iblaze="$iblaze"
alias patchpanel='/google/data/ro/projects/patchpanel/patchpanel'
alias prodplan='/google/data/ro/projects/prodplan/prodplan'
alias prodspec='/google/data/ro/teams/prodspec/prodspec'
alias sandman='/google/data/ro/projects/sandman/sandman'
alias blueprint_diff='/google/src/files/head/depot/google3/devtools/blueprint/tools/blueprint_diff'

alias stmux='tmx default'

export X20HOME="/google/data/rw/users/${USER:0:2}/$USER"

export PATH=$PATH:/google/bin/releases/x20/internal

function ui-tests {
  $blaze_run //storage/x20/ui:karma_local
}

function ui-debug {
  tmux split-window "$blaze_run //storage/x20/webexporter:webexporter -- --x20web_debug --logtostderr --x20_environment=dev"
  $iblaze run //storage/x20/ui/dev_server:dev_server
}

function ui-vdebug {
  tmux split-window -h "$blaze_run //storage/x20/webexporter:webexporter -- --x20web_debug --logtostderr --x20_environment=dev"
  $iblaze run //storage/x20/ui/dev_server:dev_server
}

function ui-rollout {
  up google3
  blaze build //storage/x20/release/ui:release_x20_ui
  ./blaze-bin/storage/x20/release/ui/release_x20_ui
}

function ui-live-rollout {
  read "reply?Are you sure? "
  if [[ "$reply" =~ ^[Yy]$ ]]; then
    up google3
    blaze build //storage/x20/release/ui:release_x20_ui
    ./blaze-bin/storage/x20/release/ui/release_x20_ui --live
  else
    echo "Aborted"
  fi
}
