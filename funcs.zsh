function init_aliases () {
    alias ls="gls --color"
    alias dir="gdir --color"
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias cp="cp -a"
    alias rm="rm -i"
    alias mkdir="mkdir -p"
    alias grep="grep --color"
    alias egrep="egrep --color"
    alias wget="wget --no-check-certificate"
    # alias -g L="| less"
    # alias -g H="| head"
    # alias -g T="| tail"
    # alias -g G="| grep"
    # alias -g N="> /dev/null"
    # alias -g V="| vim -R -"
    # alias -g P=" --help | less"
}

function init_base_zshrc () {
    export LANG=ja_JP.UTF-8
    export DISPLAY=:0.0
    export __CF_USER_TEXT_ENCODING="0x1F5:0x08000100:14"
    export EDITOR='vim -c "set fenc=utf-8"'
    export LESSEDIT='vi %f'
    export LESS='-R'

    # load zsh integrations if installed by brew
    if type brew &>/dev/null; then
        local brew_prefix
        brew_prefix=$(brew --prefix)

        if [ -r "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
            source "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
        fi

        if [ -d "$brew_prefix/share/zsh-completions" ]; then
            fpath=($brew_prefix/share/zsh-completions $fpath)
        fi
    fi

    # create completion directory, if not exists
    mkdir -p "$HOME/.zsh-completions"

    # load zsh completions if exists
    if [ -n "$(ls -A "$HOME/.zsh-completions" 2>/dev/null)" ]; then
        fpath=($HOME/.zsh-completions $fpath)
    fi

    # initialize zsh completions
    autoload -Uz compinit
    compinit

    # not exit zsh with ^D
    setopt ignore_eof

    # disable flow control with ^Q/^S 
    setopt no_flow_control

    # not beep
    setopt no_beep

    setopt extended_glob

    # bindkey "$EMOJI_CLI_KEYBIND" emoji::cli # force apply for screen
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

function load_pre_zshrc () {
    for i in "$profiles/zshrc/pre"; do
        for f in "$i"/*.zsh; do
            if [ -f "$f" ]; then
                source "$f"
            fi
        done
    done
}
