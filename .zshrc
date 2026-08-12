profiles=$HOME/.enviroments

# global definitions
if [[ -f /etc/zshrc ]]; then
    . /etc/zshrc
fi

source "${profiles}/funcs.zsh"

init_aliases

load_pre_zshrc

init_base_zshrc

# load from ./zshrc/
load_sub_zshrc
