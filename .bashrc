profiles=$HOME/.enviroments
source "${profiles}/funcs"

# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

init_paths

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

# init basic alias
alias grep='grep --color'
alias egrep='egrep --color'
alias base64=gbase64
alias basename=gbasename
alias cat=gcat
alias chcon=gchcon
alias chgrp=gchgrp
alias chmod=gchmod
alias chown=gchown
alias chroot=gchroot
alias cksum=gcksum
alias comm=gcomm
alias cp='gcp -a'
alias csplit=gcsplit
alias cut=gcut
alias date=gdate
alias dd=gdd
alias df=gdf
alias dir='gdir --color'
alias dircolors=gdircolors
alias dirname=gdirname
alias du=gdu
alias echo=gecho
alias env=genv
alias expand=gexpand
alias expr=gexpr
alias factor=gfactor
alias false=gfalse
alias fmt=gfmt
alias fold=gfold
alias groups=ggroups
alias head=ghead
alias hostid=ghostid
alias id=gid
alias install=ginstall
alias join=gjoin
alias kill=gkill
alias link=glink
alias ln=gln
alias logname=glogname
alias ls='gls --color'
alias md5sum=gmd5sum
alias mkdir=gmkdir
alias mkfifo=gmkfifo
alias mknod=gmknod
alias mktemp=gmktemp
alias mv=gmv
alias nice=gnice
alias nl=gnl
alias nohup=gnohup
alias od=god
alias paste=gpaste
alias pathchk=gpathchk
alias pinky=gpinky
alias pr=gpr
alias printenv=gprintenv
alias printf=gprintf
alias ptx=gptx
alias pwd=gpwd
alias readlink=greadlink
alias rm='grm'
alias rmdir='grmdir'
alias runcon=gruncon
alias seq=gseq
alias sha1sum=gsha1sum
alias sha224sum=gsha224sum
alias sha256sum=gsha256sum
alias sha384sum=gsha384sum
alias sha512sum=gsha512sum
alias shred=gshred
alias shuf=gshuf
alias sleep=gsleep
alias sort=gsort
alias split=gsplit
alias stat=gstat
alias stty=gstty
alias sum=gsum
alias sync=gsync
alias tac=gtac
alias tail=gtail
alias tee=gtee
alias test=gtest
alias timeout=gtimeout
alias touch=gtouch
alias tr=gtr
alias true=gtrue
alias truncate=gtruncate
alias tsort=gtsort
alias tty=gtty
alias uname=guname
alias unexpand=gunexpand
alias uniq=guniq
alias unlink=gunlink
alias uptime=guptime
alias users=gusers
alias vdir=gvdir
alias wc=gwc
alias who=gwho
alias whoami=gwhoami
alias yes=gyes
alias sed=gsed

# init my alias
alias wget='wget --no-check-certificate'
alias js=node
#alias titanium='/Library/Application\ Support/Titanium/mobilesdk/osx/1.6.2/titanium.py'


# init dircolors
eval $(dircolors -b ~/.dir_colors)
clear


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
