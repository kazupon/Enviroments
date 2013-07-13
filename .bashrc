profiles=$HOME/.enviroments

# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

source "${profiles}/funcs"

init_paths

init_aliases

init_dir_colors

init_common_env

# add configration from '__env__'
init_sub_env
