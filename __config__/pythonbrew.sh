if [ -s "$HOME/.pythonbrew/etc/bashrc" ]; then
    source "$HOME/.pythonbrew/etc/bashrc"
    pythonbrew use 2.7.2 1>/dev/null 2>&1
fi
