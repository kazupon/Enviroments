if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


for i in /usr/local $HOME/opt/local $HOME/homebrew; do
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
