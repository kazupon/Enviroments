# Enviroments
This repository includes configration files, scripts and tiny commands for our daily life, especially for myself.


# Prepare

## Submodule

```shell
$ git clone git@github.com:kazupon/Enviroments.git ~/.enviroments
$ cd ~/.enviroments
$ git submodule init
$ git submodule update
```

## Powerline

```shell
$ cd ~/.enviroments/powerline/fonts
$ ./install.sh # install fonts
$ cd ~/.enviroments/powerline/shell
$ patch powerline-shell.py.template < ../../powerline-shell.py.template.patch
$ ./install.py # install powerline-shell.py
```


# Install

```shell
$ cd ~/.enviroments
$ ./setup.sh
```


# Uninstall
you can remove all symlinks to the configuration files located in ~/.

```shell
$ cd ~/.enviroments
$ ~/.enviroments/setup.sh uninstall
```


# License
[MIT license](http://www.opensource.org/licenses/mit-license.php).
