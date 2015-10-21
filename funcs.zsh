function init_antigen () {
    if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
        source $HOME/.zsh/antigen/antigen.zsh
        antigen bundle zsh-users/zsh-syntax-highlighting
        antigen bundle zsh-users/zsh-completions src
        antigen bundle Tarrasch/zsh-bd
        antigen bundle m4i/cdd
        antigen bundle mollifier/anyframe
        antigen apply
    fi
}

function init_paths () {
    for i in $HOME/homebrew; do
        local bin_path="$i/bin"
        if [ -d "$bin_path" ]; then
            export PATH=$bin_path:$PATH
        fi
        local sbin_path="$i/sbin"
        if [ -d "$sbin_path" ]; then
            export PATH=$sbin_path:$PATH
        fi
        local man_path="$i/man"
        if [ -d "$man_path" ]; then
            export MANPATH=$man_path:$MANPATH
        fi
        local share_man_path="$i/share/man"
        if [ -d "$share_man_path" ]; then
            export MANPATH=$share_man_path:$MANPATH
        fi
    done
}

function init_aliases () {
    alias ls='gls --color'
    alias dir='gdir --color'
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
