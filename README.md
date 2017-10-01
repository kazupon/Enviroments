# Enviroments
This repository includes configration files, scripts and tiny commands for our daily life, especially for myself.


## Prepare

### Install homebrew & homebrew packages

```sh
# homebrew
$ curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew   

# and other ...
$ brew install coreutils git curl wget zsh openssl peco htop vim --with-lua tig jq emojify
```


## Install

```sh
$ cd ~/.enviroments
$ ./setup.sh
```

### Submodule

```sh
$ git clone git@github.com:kazupon/Enviroments.git ~/.enviroments
$ cd ~/.enviroments
$ git submodule init
$ git submodule update
```

## Uninstall
you can remove all symlinks to the configuration files located in ~/.

```sh
$ cd ~/.enviroments
$ ~/.enviroments/setup.sh uninstall
```

## Custom fonts installation

#### Download and Install the xquartz

[https://xquartz.macosforge.org](https://xquartz.macosforge.org)

#### build powerline font

```sh
$ brew install fontforge --with-python
$ cd ~/.enviroments/.vim/bundle/vim-powerline/fontpatcher
$ fontforge -script ./fontpatcher ~/Library/Fonts/<user font>
```


## iTerm2
Import the `config/iterm2.itermcolors` profile

### iTerm2 setting
Set the following setting with *[Preferences]*

- Select powerline font at [Text] -> Reguar Font & Non-ASCII Font section
- Select xterm-256color at [Terminal] -> Terminal Emulation section


## Powerline

### Default font usecase

#### Setup

```sh
# install fonts
$ cd ~/.enviroments/powerline/fonts
$ ./install.sh 

$ cd ~/.enviroments/powerline/shell

# for old powerline font using case (option)
$ patch powerline-shell.py.template < ../../powerline-shell.py.template.patch 

# install powerline-shell.py
$ ./install.py 
```


# TODO
- Ansible & Docker setup


# License
[MIT license](http://www.opensource.org/licenses/mit-license.php).
