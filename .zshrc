# If you come from bash you might have to change your $PATH.
  # export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="kolo"
ZSH_THEME="powerlevel9k/powerlevel9k"


# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword



plugins=(
  git
  autojump
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

[[ -s /home/dexras/.autojump/etc/profile.d/autojump.sh ]] && source /home/dexras/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# give us access to ^Q
stty -ixon

# vi mode
#bindkey -v
#bindkey "^F" vi-cmd-mode

# handy keybindings
#bindkey "^A" beginning-of-line
#bindkey "^E" end-of-line
#bindkey "^K" kill-line
#bindkey "^R" history-incremental-search-backward
#bindkey "^P" history-search-backward
#bindkey "^Y" accept-and-hold
#bindkey "^N" insert-last-word
#bindkey "^Q" push-line-or-edit



# other
#bindkey "^[[1;5D" backward-word
#bindkey "^[[1;5C" forward-word
# bindkey '^[^[[D' backward-word
# bindkey '^[^[[C' forward-word
# bindkey '^[[5D' beginning-of-line
# bindkey '^[[5C' end-of-line
# bindkey '^[[3~' delete-char
# bindkey '^?' backward-delete-char


# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

ZSH_TMUX_AUTOSTART="true"

if [ -f "~/.aliases" ]
then
  source ~/.aliases
fi

export EDITOR='vim'


# zsh-autosuggestions
# bindkey '^ ' autosuggest-accept
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# source contents from ~/.zshrc.d
#if [[ -d $HOME/.zshrc.d/ ]]; then
  #for file in $HOME/.zshrc.d/*.zsh; do
    #source ${file}
  #done
#fi

POWERLEVEL9K_MODE='nerdfont-complete'

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
