#!/bin/bash

function isExec {
  if [[ -f $1 && -x $($1) ]]; then
        true;
  else
        echo "Making $1 executable...";
	chmod +x $1
  fi;
}

isExec symlink.sh
isExec pacinstall.sh
isExec programs.sh

./symlink.sh
./pacinstall.sh
./programs.sh

# Get all upgrades
sudo pacman -Syyu

# Source zsh
source ~/.zshrc

# Fun hello
figlet "... we're ready!!"
