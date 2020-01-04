#!/bin/bash

# Up from scripts dir
dotfilesDir=$(pwd)
if [[ "${dotfilesDir}" =~ "scripts" ]] ;then
  cd ..
fi


function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink
    echo "[x] Removing existing symlink: ${dest}"
    rm ${dest}

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "[x] Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "[x] Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "[x] Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .config
linkDotfile .tmux.conf
linkDotfile .tmux.theme
linkDotfile .gitconfig
linkDotfile .gitmessage
linkDotfile .aliases
linkDotfile .zsh.theme
linkDotfile .zsh_hist_config
linkDotfile .zshrc

