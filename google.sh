source /etc/bash_completion.d/g4d
source /etc/bash_completion.d/x20_cd
source ~/.x20_tools.sh  # Updated by cron.

DEFAULT_USER=istrukov

BLAZE_RUN='/home/build/nonconf/google3/devtools/blaze/scripts/blaze-run.sh'
IBLAZE='/google/data/ro/teams/iblaze/iblaze'

alias blaze-run="$BLAZE_RUN"
alias iblaze="$IBLAZE"
alias build_cleaner='/google/data/ro/teams/social-backend/build_cleaner'
alias cdd='/google/data/ro/buildstatic-ro/projects/chubby/cdd/cdd'
alias sandman='/google/data/ro/projects/sandman/sandman'
alias prodplan='/google/data/ro/projects/prodplan/prodplan'
alias prodspec='/google/data/ro/teams/prodspec/prodspec'

export X20HOME="/google/data/rw/users/${USER:0:2}/$USER"

function ui-tests {
  $BLAZE_RUN //storage/x20/ui:karma_local
}

function ui-debug {
  tmux split-window "$BLAZE_RUN //storage/x20/webexporter:webexporter -- --x20web_debug --logtostderr --x20_environment=dev"
  $IBLAZE run //storage/x20/ui/dev_server:dev_server
}

function ui-vdebug {
  tmux split-window -h "$BLAZE_RUN //storage/x20/webexporter:webexporter -- --x20web_debug --logtostderr --x20_environment=dev"
  $IBLAZE run //storage/x20/ui/dev_server:dev_server
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
