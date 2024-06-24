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

# handy aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias grep='grep --color=auto'
alias .vimrc='vim ~/.vimrc'
alias .bashrc='vim ~/.bashrc'
alias so='source ~/.bashrc'
alias ccat='highlight --out-format=ansi'

alias blue='bluetuith'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias setl="xbacklight -set"
alias morel="xbacklight -inc 10"
alias lessl="xbacklight -dec 10"

alias monero="monero-wallet-gui"
alias server="ssh eu@192.168.1.3 -p 1143 -i .ssh/id_ed25519"

alias mp3="ffplay -v 0 -nodisp -autoexit"
alias yt="yt-dlp -x --audio-format 'mp3' --audio-quality 0 -v"
alias up="time-to-update.sh"

alias monitor="xrandr --output eDP1 --auto --output HDMI2 --auto --right-of eDP1"
alias nitro="nitrogen --set-zoom-fill --random /home/eu/Pictures/wallpapers"

nerdfetch
