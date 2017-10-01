function powerline_precmd () {
    PS1="$(~/.enviroments/powerline/shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
    #export PS1="$(~/.enviroments/powerline/shell/powerline-shell.py --shell zsh $?)"
}

function install_powerline_precmd () {
    if [[ -d "$HOME/.enviroments/powerline" ]]; then
        if [[ -f "$HOME/.enviroments/powerline/shell/powerline-shell.py" ]]; then
            for s in "${precmd_functions[@]}"; do
                if [ "$s" = "powerline_precmd" ]; then
                    return
                fi
            done
            precmd_functions+=(powerline_precmd)
        fi
    fi
}

install_powerline_precmd
