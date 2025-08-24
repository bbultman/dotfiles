# Base ZSH setup, should be standard across all systems
# 
# It does imply usage of podman/helix/niri/node etc
# 

export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
export CASE_SENSITIVE="true"
export COMPLETION_WAITING_DOTS="false"
export DISABLE_UNTRACKED_FILES_DIRTY="true"
export HIST_STAMPS="yyy/mm/dd"
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=100000
export HISTFILE="$ZSH_CACHE_DIR/.zsh_history"

setopt autocd
setopt sharehistory
setopt incappendhistorytime
unsetopt flowcontrol
autoload -Uz compinit
compinit

export LC_ALL=en_US.UTF-8
export MOZ_ENABLE_WAYLAND=1

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cache/npm-global/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/go/bin

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
export NPM_CONFIG_UPDATE_NOTIFIER=false
export NPM_CONFIG_FUND=false

alias gp='git pull'
alias gpu='git push'
alias gpsu='git push --set-upstream origin'
alias gpf='git push --force-with-lease'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias hx='helix'

alias l='ls -alh --color=auto'

alias prettier='./node_modules/.bin/prettier'
alias tsc='./node_modules/.bin/tsc'
alias tsx='./node_modules/.bin/tsx'

# Spawn a new terminal with the same directory
function nw () {
  niri msg action spawn -- "foot" "-D" "$(pwd)"
}

# Convenience alias since `node --run` does not list executable scripts
# calling `nr` will return the available scripts
# calling `nr <script>` will run it with node --run
function nr () {
  if [[ $# > 0 ]]; then
    node --run $@
  else
    npm run
  fi
}

# Generate a uuid-v4, print to stdout and copy to clipboard 
function uuid () {
  node -p 'require("node:crypto").randomUUID()' | tee >(wl-copy)
}
