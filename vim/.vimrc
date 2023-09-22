" ==================================================
" Description: Vim personal config of be4zad
" Repo: https://github.com/be4zad/vimrc
" License: GPL v3.0
" ==================================================

" Get the defaults that most users want
source $VIMRUNTIME/defaults.vim

" Indent settings
set autoindent
set smartindent
set copyindent
set preserveindent
set expandtab
set shiftwidth=2
set tabstop=4

" Highlighting
syntax on

" Line numbers
set number
hi LineNr ctermfg=DarkGrey

" Ignore case in search patterns
set ic

" Save history and undo changes even after a reboot
set undofile
set undodir=~/.vim/undodir

" Enable mouse if available
if has('mouse')
  set mouse=a
endif

" Length marker
set colorcolumn=80

" Ctrl + k
noremap <C-k> :bel vert term<cr>

" Plugins stuffs
set rtp+=~/.vim/bundle/Vundle.vim

function InstallAllPlugins()
  " Install Vim Plug plugins if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif

  " Install Vundle plugins
  set nocompatible
  filetype off
  autocmd VimEnter * PluginInstall

  " Exit
  autocmd VimEnter * qa!
endfunction

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'alligator/accent.vim'
call plug#end()

call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
call vundle#end()

command! InstallPluginManagers call InstallPluginManagers()
command! InstallAllPlugins call InstallAllPlugins()
