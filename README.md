# Dotfiles
My personal dotfiles 

## Dependencies
Install these packages with your package manager:

* stow
* git
* curl
* vim/neovim
* fish
* nodejs (for coc.nvim)

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
### Dotfiles
#### Fish shell
`stow --adopt --target=$HOME/.config/fish/ fish`

#### Git
Make sure you edited git configs for youself
`stow --adopt --target=$HOME git`

#### Vim
`stow --adopt --target=$HOME vim && vim -c PlugInstall -c qall`

#### NeoVim
`stow --adopt --target=$HOME nvim && nvim -c PlugInstall -c qall`

#### Termux
`stow --adopt --target=$HOME termux`

#### All
You can remove the commands depending on your needs:

```
stow --adopt --target=$HOME/.config/fish/ fish && \
stow --adopt --target=$HOME git && \
stow --adopt --target=$HOME vim && \
vim -c PlugInstall && \
stow --adopt --target=$HOME nvim && \
nvim -c PlugInstall && \
if [[ $TERMUX_VERSION ]]; then \
  stow --adopt --target=$HOME termux
fi
```

### Vim/Neovim programming plugins
`:CocInstall coc-rust-analyzer`

## Uninstall
Add `--delete` option after the stow commands. For example:
`stow --delete --adopt --target=$HOME git`

### Uninstall Vim/Neovim things
#### Vim
`rm -rf ~/.vim`

#### Neovim
`rm -rf ~/.local/share/nvim/ ~/.local/state/nvim`

## Config
Edit [user] part in `git/.gitconfig` file and replace name, email and signing key with yourselves parameters.

## Notes
1. It's good to have backup of your dotfiles.
