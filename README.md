# Vimrc
My personal Vim config

## Dependencies
* Vim
* git
* curl

## Installation
```
mkdir be4zad-vimrc
git -C be4zad-vimrc clone https://github.com/be4zad/Vimrc
cd be4zad-vimrc
cp -r ~/.vimrc ~/.vim /tmp/
cp .vimrc ~/ && cp -r after/ ~/.vim/
vim -c InstallAllPlugins -c qall
```

Note: .vimrc and .vim directory can be restored from /tmp/ (before reboot) if you didn't like it.
