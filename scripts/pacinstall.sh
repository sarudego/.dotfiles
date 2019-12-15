#!/bin/bash

sudo pacman -Syyu

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo pacman -S --noconfirm $1
  else
    echo "Already installed: ${1}"
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
