profiles=$HOME/.enviroments
source "${profiles}/funcs"

# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

init_paths

init_aliases

init_dir_colors

init_enviroments

#  python virtal enviroment
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/virtualenvwrapper.sh
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/virtualenvwrapper.sh


# add configration from '__config__'
init_add_config

