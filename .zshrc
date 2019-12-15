# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Check if exists .zplug, if not install it
# Load zplug
if [ ! -d ~/.zplug ]
then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# this line is must for zplug
source ~/.zplug/init.zsh

## Manage zplug with zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

## General
zplug "mafredri/zsh-async", from:github, defer:0
zplug "b4b4r07/enhancd", use:init.sh

# Intuitive and fast "find" replacement
zplug 'sharkdp/fd', as:command, from:gh-r

# Bat package, a cat alternative
zplug 'sharkdp/bat', as:command, from:gh-r, rename-to:bat, use:"*x86_64-*-linux*"

# Alias tip
zplug "djui/alias-tips"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT=' alias hint: '

# Use "lsd" as default ls command
zplug "Peltoche/lsd", from:gh-r, as:command
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Enhanced dir list with git features
zplug "supercrabtree/k"

# zsh improves
zplug "zsh-users/zsh-completions",              defer:1
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Install FZF, a fuzzy finder
# Ctrl+r will use fzf now to search on history among other things.
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug 'junegunn/fzf', use:'shell/key-bindings.zsh'

# Git plugin from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Enable nvm plugin
zplug "lukechilds/zsh-nvm"

# zsh theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


## Custom config

[ -f $HOME/.zsh_hist_config ] && source $HOME/.zsh_hist_config

## bindkeys config
bindkey -e
bindkey '^[[3~' delete-char
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" emacs-backward-word
bindkey '^R' history-incremental-search-backward

## Other stuff
if [ "$TMUX" = "" ]; then tmux; fi
[ -f $HOME/.aliases ] && source $HOME/.aliases

# Vim for life
export EDITOR=/usr/bin/vim



