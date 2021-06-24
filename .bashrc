#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

trap "[ -f ~/.last_dir ] && rm ~/.last_dir" EXIT

cd() {
	builtin cd $@
	pwd > ~/.last_dir
}

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export CONFIG_DIR="${HOME}/.config"
source "${CONFIG_DIR}/.exports.sh"
source "${CONFIG_DIR}/.aliases.sh"

PS1="\[\e[38;5;8m\][\@] \[\e[38;5;1m\]\w\[\e[32m\]\$(parse_git_branch)\[\e[m\] \$ "
export HISTFILE="${HOME}/.cache/bash/.history"
export HISTSIZE=100
export HISTFILESIZE=1000
export HISTTIMEFORMAT="%h %d %H:%M"
shopt -s histappend
export HISTCONTROL=ignorespace:erasedups
shopt -s cmdhist

if [ -f ~/.last_dir ]; then
	builtin cd $(cat ~/.last_dir)
fi

