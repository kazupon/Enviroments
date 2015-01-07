() {
    local cdd_script_path=$HOME/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-m4i-SLASH-cdd.git/cdd
    if [[ -f $cdd_script_path ]]; then
        source $cdd_script_path
        touch $CDD_FILE
        add-zsh-hook chpwd _cdd_chpwd
    fi
}
