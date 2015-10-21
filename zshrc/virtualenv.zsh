if [[ -f $HOME/homebrew/bin/virtualenvwrapper.sh ]]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python`
    export WORKON_HOME=$HOME/.virtualenvs
    source $HOME/homebrew/bin/virtualenvwrapper.sh
fi
