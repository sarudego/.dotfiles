#!/bin/bash

./symlink.sh
./pacinstall.sh
./programs.sh

# Get all upgrades
sudo pacman -Syyu

# Source zsh
source ~/.zshrc

# Fun hello
figlet "... we're ready!!"
