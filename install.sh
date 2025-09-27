#!/bin/bash

function import_config() {
  local source="$1"
  local dest="${2:-$HOME/.config}"
  local as_sudo="${3:-no}"

  echo ""
  echo -en "Installing $dest/$source" >/dev/stderr

  if [[ -d "$dest/$source" || -f "$dest/$source" ]]; then
    echo -en "\rInstalling $dest/$source -> skipped" >/dev/stderr
    return
  fi

  if [[ "$as_sudo" == "run-as-sudo" ]]; then
    sudo cp -R "$source" "$dest"
  else
    cp -R "$source" "$dest"
  fi

  echo -e "\rInstalling $dest/$source -> done" >/dev/stderr
}

import_config 'akind-git-commit-template'
import_config 'akind.gitconfig'
import_config 'btop'
import_config 'foot'
import_config 'helix'
import_config 'fuzzel'
import_config 'helix'
import_config 'htop'
import_config 'mako'
import_config 'niri'
import_config 'starship.toml'
import_config 'zsh-base.sh'
import_config '.zshrc' $HOME
import_config '.ssh' $HOME

import_config 'keyd' '/etc' 'run-as-sudo'

echo ""
echo "Remember to create ssh keys"
