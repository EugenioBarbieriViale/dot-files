#    _               _
#   | |             | |
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# cd dir/ by typing only the name
shopt -s autocd

alias vim='nvim'
alias .vimrc='nvim ~/.config/nvim/init.lua'

# handy aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias grep='grep --color=auto'
alias .bashrc='vim ~/.bashrc'
alias so='source ~/.bashrc'
alias ccat='highlight --out-format=ansi'

alias blue='bluetuith'

alias monero="monero-wallet-gui"

alias monitor="xrandr --output eDP1 --auto --output HDMI2 --auto --right-of eDP1"
alias lim="xrandr --output eDP1 --auto --output HDMI2 --auto --same-as eDP1"
alias nitro="nitrogen --set-zoom-fill --random /home/eu/Pictures/wallpapers"

alias open="xdg-open"

alias birth="echo 16 November 2023"

alias scan="iwctl station wlan0 scan"

alias it="setxkbmap -layout it"
alias us="setxkbmap -layout us"

alias sy="rsync -av ~/.config/nvim/ ~/programming/dot-files/nvim/"

export RUST_BACKTRACE=1

nerdfetch
./.girlfriend.sh
./system-update
