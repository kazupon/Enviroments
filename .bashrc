profiles=$HOME/.enviroments
source "${profiles}/funcs"

# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

init_paths

init_aliases

init_dir_colors

init_env

# add configration from '__config__'
init_add_config

