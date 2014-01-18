GIT_UTIL_PATH=$HOME/homebrew/etc/bash_completion.d
source "${GIT_UTIL_PATH}/git-prompt.sh"
source "${GIT_UTIL_PATH}/git-completion.bash"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[1;00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[1;00m\]\$ '
source "${GIT_UTIL_PATH}/tig-completion.bash"
