#    _               _
#   | |             | |
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups
shopt -s autocd # cd dir/ by typing only the name

PS1='[\033[32m\u\[\e[m\]@\h \033[32m\W\[\e[m\]$(__git_ps1 " (%s)")]\$ '

# handy aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias grep='grep --color=auto'

alias vim='nvim'
alias .vimrc='vim ~/.config/nvim/init.lua'
alias .bashrc='vim ~/.bashrc'
alias so='source ~/.bashrc'

alias blue='bluetui'

alias monitor="xrandr --output eDP1 --auto --output HDMI2 --auto --right-of eDP1"
alias lim="xrandr --output eDP1 --auto --output HDMI2 --auto --same-as eDP1"

alias open="xdg-open"
alias birth="echo 16 November 2023"

alias it="setxkbmap -layout it"
alias us="setxkbmap -layout us"

alias gonio="open ~/scuola/all-my-latex/Goniometria/gonio.pdf &"

export RUST_BACKTRACE=1

nerdfetch
./.girlfriend.sh
./system-update
source .git-prompt.sh

# Created by `pipx` on 2026-02-11 20:13:57
export PATH="$PATH:/home/eu/.local/bin"
