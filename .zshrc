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
