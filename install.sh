#!/bin/bash

function import_config() {
  local source="$1"
  local dest="${2:-$HOME/.config}"

  echo ""
  echo -en "Installing $dest/$source" >/dev/stderr

  if [[ -d "$dest/$source" || -f "$dest/$source" ]]; then
    echo -en "\rInstalling $dest/$source -> skipped" >/dev/stderr
    return
  fi

  cp -R "$source" "$dest"

  echo -e "\rInstalling $dest/$source -> done" >/dev/stderr
}

import_config 'akind-git-commit-template'
import_config 'akind.gitconfig'
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
echo ""
echo "Remember to create ssh keys"
