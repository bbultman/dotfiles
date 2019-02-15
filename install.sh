#!/bin/bash

echo "Installing alacrity config"
mkdir -p ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Installing tmux system config"
cp tmux.conf /usr/local/etc/tmux.conf

echo "Done!"
