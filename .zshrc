profiles=$HOME/.enviroments

# global definitions
if [[ -f /etc/zshrc ]]; then
    . /etc/zshrc
fi

source "${profiles}/funcs.zsh"

init_aliases

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=("$HOME/.grok/completions/zsh" $fpath)
# <<< grok installer <<<

init_base_zshrc

# load from ./zshrc/
load_sub_zshrc
# bun completions
[ -s "/Users/kazuya.kawaguchi/.bun/_bun" ] && source "/Users/kazuya.kawaguchi/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/kazuya.kawaguchi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
