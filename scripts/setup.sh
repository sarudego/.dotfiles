#!/bin/bash

## Import other functions


## Helper functions
function isExec {
    if [[ -f $1 && -x $($1) ]]; then
        true;
    else
        echo "Making $1 executable...";
        chmod +x $1
    fi;
}

# Get all upgrades
function updateSystem {
    dist=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)
    echo "[x] Your distro is $dist"
    case "$dist" in 
        *Arch Linux*)
            sudo pacman -Syyu --noconfirm
            ;;
        *Debian*)
            sudo apt -y update
            sudo apt -y upgrade
            ;;
    esac
    echo -e "\n[x] System is updated"
}

# Install packages
function installPackages {
    isExec symlink.sh
    isExec install.sh

    ./symlink.sh
    ./install.sh
}

#isExec programs.sh


#./programs.sh



updateSystem
installPackages

## Source zsh
#source ~/.zshrc

## System ready...
figlet "... we're ready!!"
