profiles=$HOME/.enviroments

# global definitions
if [[ -f /etc/zshrc ]]; then
    . /etc/zshrc
fi

source "${profiles}/funcs.zsh"

init_antigen

init_aliases

init_base_zshrc

# load from ./zshrc/
load_sub_zshrc
