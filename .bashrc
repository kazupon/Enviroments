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

export WORKON_HOME=$HOME/.virtualenvs
export JSTESTDRIVER_HOME=$PATH

#  python virtal enviroment
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/virtualenvwrapper.sh
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/virtualenvwrapper.sh


# add configration from '__config__'
init_add_config

