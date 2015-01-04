function _update_ps1() {
   export PS1="$(~/.enviroments/powerline/shell/powerline-shell.py $? 2> /dev/null)"
}

if [[ -d "$HOME/.enviroments/powerline" ]]; then
    if [[ -f "$HOME/.enviroments/powerline/shell/powerline-shell.py" ]]; then
        export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
fi
