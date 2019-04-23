## load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  #zgen oh-my-zsh plugins/command-not-found
  #zgen load unixorn/autoupdate-zgen
  zgen load twang817/zsh-run-help
  zgen load chrissicool/zsh-256color
  zgen load djui/alias-tips
  zgen load Cloudstek/zsh-plugin-appup  # util for docker-compose.yml file
  #zgen load mafredri/zsh-async
  #zgen load gretzky/auto-color-ls   # ---
  #zgen load desyncr/auto-ls    # ---
  #zgen load wting/autojump    # ---
  #zgen load hlissner/zsh-autopair    # ---
  zgen load zsh-users/zsh-autosuggestions
  zgen load Tarrasch/zsh-bd  # jump back a specific folder
  zgen load zsh-users/zsh-completions
  #zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  ## Git
  #zgen load elstgav/branch-manager  # needs oh_my_zsh

  ## Python
  zgen load MichaelAquilina/zsh-autoswitch-virtualenv

  ## Docker

  ## Other
  #zgen load skx/sysadmin-util
  zgen load supercrabtree/k  # is like ls with git support

  # generate the init script from plugins above
  zgen save

  # remove init script each time add/remove plugin
  #zgen reset
fi

## Plugins config
# zsh-autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC=true


## Lines configured by zsh-newuser-install
## History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# remove duplicate lines manually with:
# awk -i inplace '!x[$0]++' ~/.zsh_history

# Search on history
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

## setopt options
CASE_SENSITIVE="false"
HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY           # append
setopt HIST_IGNORE_ALL_DUPS     # no duplicate
setopt HIST_SAVE_NO_DUPS        # older commands that duplicate newer ones are omitted
setopt HIST_IGNORE_SPACE        # ignore space prefixed commands
setopt HIST_REDUCE_BLANKS       # trim blanks
setopt HIST_VERIFY              # show before executing history commands
setopt APPEND_HISTORY           # adds history
setopt INC_APPEND_HISTORY       # add commands as they are typed, don't wait until shell exit
setopt SHARE_HISTORY            # share hist between sessions
setopt HIST_EXPIRE_DUPS_FIRST   # delete duplicates first when HISTFILE size exceeds HISTSIZE

setopt BANG_HIST                # !keyword
setopt CORRECT                  # try correct bad commands

#setopt autocd autopushd pushdsilent pushdminus pushdignoredups
setopt COMPLETE_ALIASES
setopt notify

## bindkeys config
bindkey '^[[3~' delete-char
bindkey -v  # vi mode, not necessary if oh-my-zsh is allowed
bindkey '^R' history-incremental-search-backward

#bindkey "^[[A" up-line-or-beginning-search # Up
#bindkey "^[[B" down-line-or-beginning-search # Down

## give us access to ^Q
#stty -ixon

## The following lines were added by compinstall
#zstyle :compinstall filename '$HOME/.zshrc'
#zstyle ':completion:*' menu select  # autocomplete with arrows
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit && compinit  # smart auto completion
#autoload -Uz promptinit && promptinit

## Command not found hook
source /usr/share/doc/pkgfile/command-not-found.zsh

## Personal
#if [ "$TMUX" = "" ]; then tmux; fi

[ -f $HOME/.aliases ] && source $HOME/.aliases

# Load Nerd Fonts with Powerlevel9k theme for Zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme  # this line is must for powerlevel9k
source $HOME/.powerlevel9k




