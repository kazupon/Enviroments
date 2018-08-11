export NVM_NODEJS_ORG_MIRROR=http://nodejs.org/dist
if [[ -d "$HOME/bin/.nvm" ]]; then
    if [[ -f "$HOME/bin/.nvm/nvm.sh" ]]; then
        . ~/bin/.nvm/nvm.sh
    fi
fi
