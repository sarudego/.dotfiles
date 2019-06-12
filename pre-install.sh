#!/bin/bash

_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

# `_install <pkg>`
_install() {
    package="$1";

    # If the package IS installed:
    if [[ $(_isInstalled "${package}") == 0 ]]; then
        echo "${package} is already installed.";
        return;
    fi;

    # If the package is NOT installed:
    if [[ $(_isInstalled "${package}") == 1 ]]; then
        sudo pacman -S "${package}";
    fi;
}

# `_installMany <pkg1> <pkg2> ...`
# Works the same as `_install` above,
#     but you can pass more than one package to this one.
_installMany() {
    # The packages that are not installed will be added to this array.
    toInstall=();

    for pkg; do
        # If the package IS installed, skip it.
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;

        #Otherwise, add it to the list of packages to install.
        toInstall+=("${pkg}");
    done;

    # If no packages were added to the "${toInstall[@]}" array,
    #     don't do anything and stop this function.
    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All packages are already installed.";
        return;
    fi;

    # Otherwise, install all the packages that have been added to the "${toInstall[@]}" array.
    printf "Packages not installed:\n%s\n" "${toInstall[@]}";
    sudo pacman -S "${toInstall[@]}";
}

#package="neovim";
#_install "${package}";

packages=("neovim" "zsh" "tmux");
_installMany "${packages[@]}";

# Install Neovim
mkdir -p ~/.config/nvim/
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install ZPLUG
{ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; } &>/dev/null



./install

