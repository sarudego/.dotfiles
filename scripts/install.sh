#!/bin/bash

function install {
    dist=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om)
    case "$dist" in 
        *Arch*)
            . archlinux/packages.sh
            for package in "${packages[@]}"; do
                which $package &> /dev/null
                if [ $? -ne 0 ]; then
                    echo -n "\n[x] Installing: ${package}..."
                    sudo pacman -S --noconfirm $package
                else
                    echo "[x] Already installed: ${package}"
                fi
            done
            ;;
        *Debian*)
            . debian/packages.sh
            for package in "${packages[@]}"; do
                echo "$package"
                if [ $(dpkg-query -W -f='${Status}' $package 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
                    echo "[x] Installing: ${package}..."
                    sudo apt-get install -y $package;
                else
                    echo "[x] Already installed: ${package}"
                fi
            done
            
            # Install awesome-terminal-fonts
            if [[ ! -d ~/awesome-terminal-fonts ]]; then
                echo "[x] Install awesome fonts"
                git clone https://github.com/gabrielelana/awesome-terminal-fonts ~/awesome-terminal-fonts
                cp -r ~/awesome-terminal-fonts/build ~/.fonts
                fc-cache -fv ~/.fonts
            fi
            ;;
    esac
    
}

install
