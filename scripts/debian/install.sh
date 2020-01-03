#!/bin/bash

sudo apt update -y

echo -n "System is updated"

function install {
  if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    sudo apt-get install -y $1;
  else
    echo "$1 is already installed"
  fi
}

# Basics
install ark
install bind-tools
install curl
install dolphin
install exfat-utils
install firefox
install git
install htop
install gparted
install kate
install keepass
install neovim
install ntfs-3g
install pip
install spectacle
install terminator
install tmux
install unrar
install unzip
install wget
install zsh


# Tools
install ansible
install docker
install docker-compose
install nmap

# Theme
install awesome-terminal-fonts

# Others
install hugo
install figlet
install lolcat
