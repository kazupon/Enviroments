function init_antigen () {
    if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
        source $HOME/.zsh/antigen/antigen.zsh
        antigen bundle zsh-users/zsh-syntax-highlighting
        antigen bundle zsh-users/zsh-completions src
        antigen bundle mollifier/anyframe
        antigen apply
    fi
}

function init_aliases () {
    alias ls='ls --color'
    alias dir='dir --color'
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias cp='cp -a'
    alias rm='rm -i'
    alias mkdir='mkdir -p'
    alias grep='grep --color'
    alias egrep='egrep --color'
    alias wget='wget --no-check-certificate'
    alias js='node'
    alias zmv='noglob zmv -W'

    alias -g L='| less'
    alias -g H='| head'
    alias -g T='| tail'
    alias -g G='| grep'
    alias -g N='> /dev/null'
    alias -g V='| vim -R -'
    alias -g P=' --help | less'
}

function init_base_zshrc () {
    export LANG=ja_JP.UTF-8
    export DISPLAY=:0.0
    export __CF_USER_TEXT_ENCODING="0x1F5:0x08000100:14"
    export EDITOR='vim -c "set fenc=utf-8"'
    export LESSEDIT='vi %f'
    export LESS='-R'

    bindkey -e
    autoload -Uz compinit
    compinit

    # not exit zsh with ^D
    setopt ignore_eof

    # disable flow control with ^Q/^S 
    setopt no_flow_control

    # not beep
    setopt no_beep

    setopt extended_glob
}

function load_sub_zshrc () {
    for i in "$profiles/zshrc"; do
        # Additional initialize scripts
        for f in "$i"/$1 "$i"/*.zsh; do
            if [ -f "$f" ]; then
                source "$f"
            fi
        done
    done
}
