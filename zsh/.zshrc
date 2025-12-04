autoload -Uz promptinit
promptinit
#prompt fade red white grey white
prompt suse

### ALIASES ###

#list
# Detect appropriate color flag for `ls` (GNU vs BSD/macOS)
if ls --color=auto >/dev/null 2>&1; then
  COLORFLAG='--color=always'
else
  COLORFLAG='-G'
fi

# source grc.zsh if grc is available
if command -v grc >/dev/null 2>&1; then
  source ~/.config/zsh/plugins/grc.zsh
fi

# source rgrc.zsh if rgrc is available
#if command -v rgrc >/dev/null 2>&1; then
#  source /usr/local/etc/rgrc.zsh
#fi

# Prefer `eza` if available, otherwise fall back to `ls` with detected color flag
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons=auto'
else
  alias ls="ls $COLORFLAG"
fi

alias l="ls -l $COLORFLAG"
alias la="l -a $COLORFLAG"
alias lh="l -h $COLORFLAG"
alias ll="ls -alh $COLORFLAG"
# safer name for listing dotfiles
alias l.='ls -A | egrep "^\."'
alias ldir='ls -d */'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

alias vi='nvim'
alias vim='nvim'

alias rm='rm -i'

# git
alias gst='git status'

alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
alias cdo="cd /Volumes/Dev/openwrt && source env.sh"

#export GOPATH=$HOME/Work/go
#export PATH=$PATH:$GOPATH/bin

# for rust
export RSPATH=$HOME/.cargo
export PATH=$PATH:$RSPATH/bin

#for openwrt compilers
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

#for brew accelerating
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_NO_VERIFY_ATTESTATIONS=1

# locale
#export LC_ALL=en_US.UTF-8
export LANG=""
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

#set title of alacritty
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
  TITLE="%n@%m: %~/> "
  precmd() {``
    print -Pn "\e]0;${TITLE}\a"
  }
  preexec() {
    print -Pn "\e]0;${TITLE} $1\a"
  }
fi

#enable Home and End key functionality 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '\e[1;3D' backward-word       # ALT+左键：向后跳一个单词
bindkey '\e[1;3C' forward-word        # ALT+右键：前跳一个单词
bindkey '\e[1;3A' beginning-of-line   # ALT+上键：跳到行首
bindkey '\e[1;3B' end-of-line         # ALT+下键：调到行尾


#history settings
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

#starship prompt line
eval "$(starship init zsh)"
#rgrc
eval $(rgrc --aliases)

#plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#completions
autoload -U compinit && compinit
