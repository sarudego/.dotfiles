## load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen load denysdovhan/spaceship-prompt spaceship
  #zgen oh-my-zsh plugins/command-not-found
  #zgen load unixorn/autoupdate-zgen
  zgen load twang817/zsh-run-help
  zgen load chrissicool/zsh-256color
  zgen load djui/alias-tips
  zgen load Cloudstek/zsh-plugin-appup  # util for docker-compose.yml file
  #zgen load mafredri/zsh-async
  zgen load zsh-users/zsh-autosuggestions
  zgen load Tarrasch/zsh-bd  # jump back a specific folder
  zgen load zsh-users/zsh-completions
  #zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-syntax-highlighting

  ## Git
  #zgen load elstgav/branch-manager  # needs oh_my_zsh

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
setopt COMPLETE_ALIASES
setopt notify

## bindkeys config
bindkey -e
bindkey '^[[3~' delete-char
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" emacs-backward-word
bindkey '^R' history-incremental-search-backward

autoload -Uz compinit && compinit  # smart auto completion
#autoload -Uz promptinit && promptinit

## Command not found hook
#if [[ -s '/etc/zsh_command_not_found' ]]; then
  #source '/etc/zsh_command_not_found'
#fi

## Personal
if [ "$TMUX" = "" ]; then tmux; fi

[ -f $HOME/.aliases ] && source $HOME/.aliases


