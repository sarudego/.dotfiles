#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '



# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

#source /usr/share/doc/mcfly/mcfly.bash
#if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
#. $(brew --prefix)/opt/mcfly/mcfly.bash
#fi

