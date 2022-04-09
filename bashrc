#    _               _
#   | |             | |
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# cd dir/ by typing only the name
shopt -s autocd

# command history
HISTSIZE= HISTFILESIZE= # "infinite" history
HISTCONTROL=ignoreboth # non duplicate
shopt -s histappend # append to the history file, don't overwrite it

# colored prompt, if the terminal has the capability
force_color_prompt=yes

# colors
txtblk='\e[0;30m' # black - Regular
txtred='\e[0;31m' # red
txtgrn='\e[0;32m' # green
txtylw='\e[0;33m' # yellow
txtblu='\e[0;34m' # blue
txtpur='\e[0;35m' # purple
txtcyn='\e[0;36m' # cyan
txtwht='\e[0;37m' # white
bldblk='\e[1;30m' # black - bold
bldred='\e[1;31m' # red
bldgrn='\e[1;32m' # green
bldylw='\e[1;33m' # yellow
bldblu='\e[1;34m' # blue
bldpur='\e[1;35m' # purlpe
bldcyn='\e[1;36m' # cyan
bldwht='\e[1;37m' # white
undblk='\e[4;30m' # black - underline
undred='\e[4;31m' # red
undgrn='\e[4;32m' # green
undylw='\e[4;33m' # yellow
undblu='\e[4;34m' # blue
undpur='\e[4;35m' # purple
undcyn='\e[4;36m' # cyan
undwht='\e[4;37m' # white
bakblk='\e[40m'   # black - background
bakred='\e[41m'   # red
badgrn='\e[42m'   # green
bakylw='\e[43m'   # yellow
bakblu='\e[44m'   # blue
bakpur='\e[45m'   # purple
bakcyn='\e[46m'   # cyan
bakwht='\e[47m'   # white
txtrst='\e[0m'    # text reset

# prompt config
export PS1="\e[0;31m\u\e[m at \e[0;32m\h\e[m in \e[0;34m\W\e[m \n $ "

# handy aliases
alias vim="nvim"
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias grep='grep --color=auto'
alias torbrowser-launcher='cd .tor-browser_en-US/ && ./start-tor-browser.desktop && cd ~'
alias .vimrc='nvim ~/.config/nvim/init.vim'
alias .bashrc='nvim ~/.bashrc'
alias so='source ~/.bashrc'
alias a='sudo aptitude'
alias v='nvim'
alias sv='sudo nvim'
alias ccat='highlight --out-format=ansi'
alias anime='ani-cli'
