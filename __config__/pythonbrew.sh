if [ -s "$HOME/.pythonbrew/etc/bashrc" ]; then
    source "$HOME/.pythonbrew/etc/bashrc"
    # TODO: extract python version "2.x.y"
    pythonbrew use 2.7.2 1>/dev/null 2>&1
    if [ -f "$HOME/.pythonbrew/pythons/Python-2.7.2/bin/python" ]; then
        export VIRTUALENVWRAPPER_PYTHON=$HOME/.pythonbrew/pythons/Python-2.7.2/bin/python
        export WORKON_HOME=$HOME/.virtualenvs
        source $HOME/.pythonbrew/pythons/Python-2.7.2/bin/virtualenvwrapper.sh
    fi
fi
