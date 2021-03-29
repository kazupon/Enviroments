HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt share_history

setopt append_history
setopt inc_append_history
# setopt hist_no_store
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_ignore_all_dups
# setopt hist_reduce_blanks
# setopt hist_ignore_space
setopt extended_history

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^x^r' peco-select-history
