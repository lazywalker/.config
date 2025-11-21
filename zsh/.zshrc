autoload -Uz promptinit
promptinit
#prompt fade red white grey white
prompt suse

### ALIASES ###

#list
alias l='ls -l --color=auto'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -alFh'
alias l.="ls -A | egrep '^\.'"
alias listdir="ls -d */ > list"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

alias vi='nvim'
alias vim='nvim'

alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias cdo="cd /Volumes/Dev/openwrt && source env.sh"

#export GOPATH=$HOME/Work/go
#export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"

#export LIBRARY_PATH="/usr/local/opt/gettext/lib:$LIBRARY_PATH";
#export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig:$PKG_CONFIG_PATH"
#export CPATH="/usr/local/opt/gettext/include:$CPATH";

#If you need to have ncurses first in your PATH run:
#  echo 'export PATH="/usr/local/opt/ncurses/bin:$PATH"' >> ~/.bash_profile

#For compilers to find ncurses you may need to set:
#export LDFLAGS="-L/usr/local/opt/ncurses/lib"
#export CPPFLAGS="-I/usr/local/opt/ncurses/include"

#set title of alacritty
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
  precmd() {
    print -Pn "\e]0;%n@%m: %~ \a"
  }
  preexec() {
    print -Pn "\e]0;%n@%m: %1 \a"
  }
fi

#enable Home and End key functionality 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

eval "$(starship init zsh)"
