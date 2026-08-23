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

PS1='[\[\033[32m\]\u\[\e[m\]@\h \[\033[32m\]\W\[\e[m\]$(__git_ps1 " (%s)")]\$ '

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
alias ii='vim ~/.config/i3/config'
alias so='source ~/.bashrc'

alias blue='bluetui'
alias open="xdg-open"
alias birth="echo 16 November 2023"

alias it="setxkbmap -layout it"
alias us="setxkbmap -layout us"

alias gonio="open ~/scuola/all-my-latex/Goniometria/gonio.pdf &"
alias mirror="xrandr --output eDP1 --rate 60 --mode 1920x1080 --fb 1920x1080 --panning 1920x1080* --output HDMI2 --mode 1920x1080 --same-as eDP1"
alias right="xrandr --output eDP1 --rate 60 --mode 1920x1080 --fb 3840x1080 --panning 1920x1080+0+0 --output HDMI2 --mode 1920x1080 --right-of eDP1"

alias allowstud="xhost +SI:localuser:student"

alias tailup="sudo tailscale up --exit-node=100.89.38.27 --exit-node-allow-lan-access"
alias taildown="sudo tailscale down"
alias server="ssh eu@100.89.38.27"
alias lanserver="ssh eu@192.168.1.184"

stty werase undef

bind '"\C-w": backward-kill-word'

source .git-prompt.sh

# Created by `pipx` on 2026-02-11 20:13:57
export PATH="$PATH:/home/eu/.local/bin"

export RUST_BACKTRACE=1
export GIT_EDITOR=nvim
export EDITOR=nvim

# Added by install.sh
/home/eu/.local/bin/update.sh
