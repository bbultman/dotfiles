export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=SWAY
export WLR_RENDERER=vulkan
export GITHUB_TOKEN=
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
export PATH=$PATH:~/.local/bin
export LC_ALL=en_US.UTF-8
export NPM_CONFIG_UPDATE_NOTIFIER=false
export NPM_CONFIG_FUND=false

source ~/.config/zsh/zshrc
source /usr/share/nvm/init-nvm.sh

alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gpsu='git push --set-upstream origin'
alias gpf='git push --force-with-lease'

alias l='ls -alh --color=auto'

alias prettier='./node_modules/.bin/prettier'
alias tsc='./node_modules/.bin/tsc'
alias awd='AWESOME_API=https://platform-api.dev.akind.tech ~/code/aw/platform-api/cli/bin/dev'
alias awp='~/code/aw/platform-api/cli/bin/dev'

eval "$(starship init zsh)"

eval 
AW_AC_ZSH_SETUP_PATH=/home/ben/.cache/@akindgroup/tooling-awesome-cli-js/autocomplete/zsh_setup && test -f $AW_AC_ZSH_SETUP_PATH && source $AW_AC_ZSH_SETUP_PATH; # aw autocomplete setup

function nw () {
  swaymsg "exec foot -D $(pwd)"
}

