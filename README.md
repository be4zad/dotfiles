# Dotfiles
My personal dotfiles

## Dependencies
Install these packages with your package manager:

* vim
* stow
* git
* curl
* python3
* vim-nox (optional)
* cmake (optional)
* clangd (optional)

## Setup
Run:

```
mkdir be4zad-dotfiles
git clone https://github.com/be4zad/dotfiles be4zad-dotfiles
cd be4zad-dotfiles
```

Then create your own branch:

```
git checkout -b local
```

## Install
Install all dotfiles + Vim plugins:

```
stow --adopt --target=$HOME bash && source $HOME/.bashrc && \
stow --adopt --target=$HOME git && \
stow --adopt --target=$HOME vim && \
bash install_vim_plugins.sh && \
if [[ $TERMUX_VERSION ]]; then \
  stow --adopt --target=$HOME termux
fi
```

## Uninstall
Uninstall all dotfiles:

```
stow --delete --adopt --target=$HOME bash && \
stow --delete --adopt --target=$HOME git && \
stow --delete --adopt --target=$HOME vim && \
if [[ $TERMUX_VERSION ]]; then \
  stow --delete --adopt --target=$HOME termux
fi
```

## Config
Edit [user] part in `git/.gitconfig` file and replace name, email and signing key with yourselves parameters.

## Notes
1. The script `install_vim_plugins.sh` will install Vim plugins and build YouCompleteMe with options I like, and must use after running stow commands to work. If you don't want to build, send Ctrl-C easily, when building.

2. It's good to have backup of your dotfiles, although Stow do it for you probably.

3. With above commands in Uninstall part, Vim plugins won't be uninstall; Just dotfiles will be removed and plugins disabled. You can remove ~/.vim directory for do that: (Not recommended)

```
rm -rf ~/.vim
```
