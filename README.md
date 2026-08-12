# Enviroments
This repository includes configration files, scripts and tiny commands for our daily life, especially for myself.


## Prepare

### Install homebrew & homebrew packages

```sh
# homebrew
# Supported Homebrew prefixes by the official installer: /opt/homebrew, /usr/local
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install coreutils git peco tig jq
$ brew install zsh-completions zsh-syntax-highlighting
```

### Install optional tools

```sh
$ brew install vim
$ brew install rtk
$ brew install yusukebe/tap/ax
```

### Install development tools as needed

Install these after the base setup when you need them. The zsh configuration
loads them only when their local files are available or only adds their bin
directories to `PATH`.

- Vite+ (`zshrc/vite-plus.zsh`): loads `$HOME/.vite-plus/env`
- mise (`zshrc/mise.zsh`): activates `$HOME/.local/bin/mise`
- Rust / Cargo (`zshrc/cargo.zsh`): loads `$HOME/.cargo/env`
- Bun (`zshrc/bun.zsh`): uses `$HOME/.bun`
- pnpm (`zshrc/pnpm.zsh`): uses `$HOME/Library/pnpm`
- Deno (`zshrc/deno.zsh`): uses `$HOME/.deno/bin`
- MoonBit (`zshrc/moonbit.zsh`): uses `$HOME/.moon/bin`
- pipx (`zshrc/pipx.zsh`): uses `$HOME/.local/bin`
- Grok CLI (`zshrc/pre/grok.zsh`): uses `$HOME/.grok/bin`


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

## iTerm2
Import the `config/iterm2.itermcolors` profile

### iTerm2 setting
Set the following setting with *[Preferences]*

- Select powerline font at [Text] -> Reguar Font & Non-ASCII Font section
- Select xterm-256color at [Terminal] -> Terminal Emulation section

# License
[MIT license](http://www.opensource.org/licenses/mit-license.php).
