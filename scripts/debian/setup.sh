#!/bin/bash

function isExec {
  if [[ -f "$1" && -x $("$1") ]]; then
        true;
  else
        echo -n "[x] Making $1 executable...";
	chmod +x $1
  fi;
}

isExec symlink.sh
isExec install.sh
isExec programs.sh

./symlink.sh
./install.sh
./programs.sh

# Get all upgrades
sudo apt update

# Source zsh
source ~/.zshrc

# Fun hello
figlet "... we're ready!!"
