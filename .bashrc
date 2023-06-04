# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias neofetch=“neofetch --source ~/.config/neofetch/endeavouros_small
PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$PATH"
