bindkey '^r' history-incremental-pattern-search-backward
#bindkey '^s' history-incremental-pattern-search-forward
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey '^o' history-beginning-search-backward-end
