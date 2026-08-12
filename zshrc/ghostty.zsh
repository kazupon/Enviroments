if [[ "$OSTYPE" == darwin* ]]; then
    ghostty_config_src="${profiles}/config/ghostty/config"
    ghostty_config_dest="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
    ghostty_config_dir="${ghostty_config_dest:h}"

    if [[ -r "$ghostty_config_src" && ! -e "$ghostty_config_dest" && ! -L "$ghostty_config_dest" ]]; then
        mkdir -p "$ghostty_config_dir"
        ln -s "$ghostty_config_src" "$ghostty_config_dest"
    fi

    unset ghostty_config_src ghostty_config_dest ghostty_config_dir
fi
