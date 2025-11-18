#zmodload zsh/zprof

BASE_CONFIG="$HOME/.config/zsh-base.sh"

if [[ -f "$BASE_CONFIG" ]]; then
  source $BASE_CONFIG
else
  echo "Base config not found, expected $BASE_CONFIG"
fi

export GITHUB_TOKEN=xxx
export EDITOR=helix

alias iwm='iwmenu -l fuzzel'
alias bzm='bzmenu -l fuzzel'
alias hz='hx --vsplit ~/.config/zsh-base.sh ~/.zshrc && source ~/.zshrc'
alias tree='eza -TA'
alias l='eza -lA'

source <(COMPLETE=zsh jj)
source <(volta completions zsh)
source <(fzf --zsh)
source <(niri completions zsh)
eval "$(starship init zsh)"

#zprof
