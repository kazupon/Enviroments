#!/bin/sh

CURRENT_DIR=$(cd $(dirname "$0"); pwd)

if [ "$1" = 'replace' ]; then
    replace=1
fi

if [ "$1" = 'uninstall' ]; then
    uninstall=1
fi

if [ "$1" = '--help' -o "$1" = '-h' ]; then
    echo "Usage: $0 [-h] {replace, uninstall}"
    echo "       replace    Force to replace existing dot files."
    echo "       uninstall  Remove all dot files installed."
    exit 0
fi

for i in "${CURRENT_DIR}"/.*
do
    if [ ! -e "${i}" ]; then
        continue
    fi

    f=`basename "${i}"`
    ignored=0
    for ignore in . .. .svn .git .gitignore .gitmodules .DS_Store
    do
        if [ "${f}" = "${ignore}" ]; then
            ignored=1
            continue
        fi
    done
    if [ "${ignored}" = "1" ]; then
        continue
    fi

    if [ -e "${HOME}/${f}" -o -h "${HOME}/${f}" ]; then
        echo "${f} already exists."
        if [ "$replace" -o "$uninstall" ]; then
            echo "remove ${f}."
            rm -rf "${HOME}/${f}"
        else
            continue
        fi
    fi
    if [ ! "$uninstall" ]; then
        echo "create symlink ${f} to ${HOME}."
        ln -s "${i}" "${HOME}/${f}"
    fi
done

if [ ! "$uninstall" ]; then
    echo "create symlink /bin to ${HOME}."
    ln -s "${CURRENT_DIR}/bin" "${HOME}/bin"
else
    echo "remove ~/bin."
    rm "${HOME}/bin"
fi
