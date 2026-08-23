#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# Set up monitor
# if [[ $(xrandr -q | grep 'HDMI2 connected')]]; then
xrandr --output eDP1 --auto --output HDMI2 --auto --right-of eDP1
# fi

setxkbmap -option compose:prsc

# Created by `pipx` on 2026-02-11 20:13:57
export PATH="$PATH:/home/eu/.local/bin"
source "/home/eu/programming/tgo/external/emsdk/emsdk_env.sh"
