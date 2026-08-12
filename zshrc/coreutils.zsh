if type brew > /dev/null 2>&1; then
    coreutils_prefix=$(brew --prefix coreutils 2>/dev/null)
    if [ -n "$coreutils_prefix" ]; then
        coreutils_bin="$coreutils_prefix/libexec/gnubin"
        if [ -d "$coreutils_bin" ]; then
            case ":$PATH:" in
                *":$coreutils_bin:"*) ;;
                *) export PATH=$coreutils_bin:$PATH ;;
            esac
        fi

        coreutils_man="$coreutils_prefix/libexec/gnuman"
        if [ -d "$coreutils_man" ]; then
            case ":$MANPATH:" in
                *":$coreutils_man:"*) ;;
                *) export MANPATH=$coreutils_man:$MANPATH ;;
            esac
        fi
    fi
    unset coreutils_prefix coreutils_bin coreutils_man
fi
