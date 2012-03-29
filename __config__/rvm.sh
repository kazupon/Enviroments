if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
    rvm default 1>/dev/null 2>&1
    if [ -f ".rvmrc" ]; then
        source ".rvmrc"
    fi
fi
