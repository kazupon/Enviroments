profiles=$HOME/.enviroments
source "${profiles}/funcs"

# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

init_paths

init_aliases

init_dir_colors

# init shell enviroments
export LANG=ja_JP.UTF-8
export DISPLAY=:0.0
export HISTCONTROL=ignoreboth
export __CF_USER_TEXT_ENCODING="0x1F5:0x08000100:14"

# init editor
#export EDITOR='mate -w'
export EDITOR='vim -c "set fenc=utf-8"'

# init libraries
export LESSEDIT='vi %f'
export LESS='-R'
export LESSOPEN='| /opt/local/bin/src-hilite-lesspipe.sh %s'

export PYTHONSTARTUP=~/.pythonstartup
export GISTY_DIR=$HOME/tmp/gist
export GISTY_SSL_CA=/opt/local/etc/openssl/cert.pem

export LUA_CPATH="./?.dylib;/opt/local/lib/lua/5.1/?.dylib;/opt/local/lib/lua/5.1/loadall.dylib"
export NODE_ENV=development

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export WORKON_HOME=$HOME/.virtualenvs
export JSTESTDRIVER_HOME=$PATH

#  python virtal enviroment
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/virtualenvwrapper.sh
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/virtualenvwrapper.sh



# init npm 
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
