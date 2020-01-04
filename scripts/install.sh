#!/bin/bash

## import packages list from SO
 

function installOnArch {  
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo pacman -S --noconfirm $1
  else
    echo "Already installed: ${1}"
  fi
}


function installOnDebian {
  if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    sudo apt-get install -y $1;
  else
    echo "$1 is already installed"
  fi
}


function install {
    dist=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)
    case "$dist" in 
        *Arch Linux*)
            . archlinux/packages.sh
            echo $packages
            for package in "${packages[@]}"; do
                echo "$package"
                #which $package &> /dev/null
                #if [ $? -ne 0 ]; then
                #    echo -n "\n[x] Installing: ${package}..."
                #    sudo pacman -S --noconfirm $package
                #else
                #    echo "[x] Already installed: ${package}"
                #fi
            done
            ;;
        *Debian*)
            . debian/packages.sh
            echo $packages
            for package in "${packages[@]}"; do
                echo "$package"
                #if [ $(dpkg-query -W -f='${Status}' $package 2>/dev/null | grep -c "ok installed") -eq 0 ];
                #then
                #    echo -n "\n[x] Installing: ${package}..."
                #    sudo apt-get install -y $package;
                #else
                #    echo "[x] Already installed: ${package}"
                #fi
            done
            
            # Install awesome-terminal-fonts
            git clone https://github.com/gabrielelana/awesome-terminal-fonts
            cp -r ~/awesome-terminal-fonts/build ~/.fonts
            fc-cache -fv ~/.fonts
            ;;
    esac
    
}
