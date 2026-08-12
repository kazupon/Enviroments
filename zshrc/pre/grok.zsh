# >>> grok installer >>>
if [ -d "$HOME/.grok/bin" ]; then
    case ":$PATH:" in
        *":$HOME/.grok/bin:"*) ;;
        *) export PATH="$HOME/.grok/bin:$PATH" ;;
    esac
fi

if [ -d "$HOME/.grok/completions/zsh" ]; then
    fpath=("$HOME/.grok/completions/zsh" $fpath)
fi
# <<< grok installer <<<
