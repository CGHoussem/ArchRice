#
# ~/.bashrc
#

exec zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la --color=auto'
PS1='[\u@\h \W]\$ '
neofetch
