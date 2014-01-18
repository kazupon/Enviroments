GIT_UTIL_PATH=$HOME/homebrew/etc/bash_completion.d
source "${GIT_UTIL_PATH}/git-prompt.sh"
source "${GIT_UTIL_PATH}/git-completion.bash"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
source "${GIT_UTIL_PATH}/tig-completion.bash"
