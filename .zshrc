#export LC_CTYPE="en_US.utf8"
#export LC_COLLATE="C"
#export LC_MESSAGES="en_US.utf8"
#export LC_ALL="en_US.utf8"

# Check if zplug is installed
#if [[ ! -d ~/.zplug ]]; then
  #git clone https://github.com/zplug/zplug ~/.zplug
  #source ~/.zplug/init.zsh && zplug update --self
#fi

# Essential
source ~/.zplug/init.zsh

## Manage Zplug with zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

## General
zplug "mafredri/zsh-async", from:github, defer:0

zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_DOT_SHOW_FULLPATH=1

# Bat package, a cat alternative
zplug 'sharkdp/bat', as:command, from:gh-r, rename-to:bat, use:"*x86_64-*-linux*"

# Intuitive and fast "find" replacement
zplug 'sharkdp/fd', as:command, from:gh-r

# Install FZF, a fuzzy finder
# Ctrl+r will use fzf now to search on history among other things.
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug 'junegunn/fzf', use:'shell/key-bindings.zsh'

# Use "lsd" as default ls command
zplug "Peltoche/lsd", from:gh-r, as:command

# Automatically ls upon entering a dir.
zplug "desyncr/auto-ls", from:github
alias ls="lsd -lh"
alias tree="lsd --tree"
AUTO_LS_NEWLINE=false
AUTO_LS_COMMANDS=(ls)

# Alias tip
zplug "djui/alias-tips"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT=' alias hint: '

#zplug "jocelynmallon/zshmarks"

# zsh improves
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

zplug "plugins/git", from:oh-my-zsh

# Enhanced dir list with git features
zplug "supercrabtree/k"

# Setup theme, powerlevel10k wich is quite faster than 9k
zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme


## Setup neovim
#zplug "XayOn/c64b066d69734f6d0f5cbf2236d21bd5", from:gist, hook-build: "pip install --user yapf docformatter; nvim +PlugInstall +UpdateRemotePlugins +qa; tmux new vim +Tmuxline +TmuxlineSnapshot\ ~/.tmux.pt.conf +qa"

## Python
# Install POETRY, python management tool
zplug "sdispater/poetry", from:github, as:command, hook-build:"python get-poetry.py"

# Zsh plugin for poetry. Fixes some issues and auto-loads poetry envs
zplug 'darvid/zsh-poetry', from:github

## Node
# Install node version manager and nodejs
zplug 'lukechilds/zsh-nvm'


# Install plugins if there are plugins that have not been installed
zplug check || zplug install

# Then, source plugins and add commands to \$PATH
zplug load

[ -f $HOME/.zsh_hist_config] && source $HOME/.zsh_hist_config

## bindkeys config
bindkey -e
bindkey '^[[3~' delete-char
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" emacs-backward-word
#bindkey -v  # vi mode, not necessary if oh-my-zsh is allowed
bindkey '^R' history-incremental-search-backward

## Other stuff
if [ "$TMUX" = "" ]; then tmux; fi
[ -f $HOME/.aliases ] && source $HOME/.aliases

## Theme
source ~/.zsh.theme


source /usr/share/nvm/init-nvm.sh

