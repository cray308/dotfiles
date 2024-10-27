#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PWD_FILE=~/.last_dir

cleanup() {
    echo $PWD > $PWD_FILE
}

trap cleanup EXIT

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

generate_ps1() {
    grey="\e[38;5;8m"
    red="\e[31m"
    green="\e[32m"
    reset="\e[m"
    echo "\[$grey\] [\@] \[$red\]\w\[$green\]\$(parse_git_branch)\[$reset\]\n \$ "
}

PS1=$(generate_ps1)
export HISTFILE=~/.cache/bash/history
export HISTCONTROL=erasedups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%h %d %H:%M '
shopt -s cmdhist
shopt -s histappend

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -Al --color=auto --group-directories-first'
alias la='ls -A --color=auto --group-directories-first'
alias ll='ls -l --color=auto --group-directories-first'
alias l.='ls -Al --color=auto --group-directories-first ../'
alias l..='ls -Al --color=auto --group-directories-first ../../'
alias df='df -h'
alias xclip='xclip -selection clipboard'
alias grep='grep --color=auto'
alias psa='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias jctl='journalctl -p 3 -xb'

source ~/.local/bin/git-completion.bash

if [ -f $PWD_FILE ]; then
    cd $(< $PWD_FILE)
fi

