# Dotfiles
My personal dotfiles

## Dependencies
Install these packages with your package manager:

* stow
* git
* curl
* vim
* fish

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
Install all dotfiles + Vim plugins (You can remove commands depending on your needs):

```
stow --adopt --target=$HOME/.config/fish/ fish && \
source ~/.config/fish/config.fish && \
stow --adopt --target=$HOME git && \
stow --adopt --target=$HOME vim && \
vim -c InstallAllPlugins && \
if [[ $TERMUX_VERSION ]]; then \
  stow --adopt --target=$HOME termux
fi
```

### Vim programming plugins
```
:CocInstall coc-rust-analyzer
```

## Uninstall
Uninstall all dotfiles:

```
stow --delete --adopt --target=$HOME/.config/fish/ fish && \
stow --delete --adopt --target=$HOME git && \
stow --delete --adopt --target=$HOME vim && \
if [[ $TERMUX_VERSION ]]; then \
  stow --delete --adopt --target=$HOME termux
fi
```

## Config
Edit [user] part in `git/.gitconfig` file and replace name, email and signing key with yourselves parameters.

## Notes
1. It's good to have backup of your dotfiles, although Stow do it for you probably.

2. With above commands in Uninstall part, Vim plugins won't be uninstall; Just dotfiles will be removed and plugins disabled. You can remove ~/.vim directory for do that: (Not recommended)

```
rm -rf ~/.vim
```
