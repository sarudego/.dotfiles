#!/bin/bash

clear

echo "[x] Creating backup existing dotfiles..".

PATH_BACKUP="$HOME/.backup-dotfiles"

if [ ! -d $PATH_BACKUP ];
then
    mkdir "$PATH_BACKUP"
    echo "$PATH_BACKUP created."
fi

if [ -f "$HOME/.vimrc" ]
then
    cp $HOME/.vimrc $PATH_BACKUP/.vimrc
    echo "~/.vimrc copied."
fi

if [ -f "$HOME/.config/nvim/init.vim" ]
then
  cp --parents $HOME/.config/nvim/init.vim $PATH_BACKUP
   echo "~/.config/nvim/init.vim copied."
fi

if [ -f "$HOME/.zshrc"  ]
then
   cp $HOME/.zshrc $PATH_BACKUP/.zshrc
   echo "~/.zshrc copied."
fi

if [ -f $HOME/.aliases ]
then
   cp $HOME/.aliases $PATH_BACKUP/.aliases
   echo "~/.aliases copied."
fi

if [ -e "$HOME/.tmux.conf" ]
then
   cp $HOME/.tmux.conf $PATH_BACKUP/.tmux.conf
   echo "~/.tmux.conf copied."
fi

echo "Backups done."


sleep 3s

echo "[x] Start dotbot installing..."

SO=`uname -r | awk -F - '{print $4}'`
if [ $SO = "ARCH" ]
then
  ./install
else
  echo "I don't know what system is..."
fi

