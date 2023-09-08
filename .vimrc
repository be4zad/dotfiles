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
hi ColorColumn ctermbg=White ctermfg=Black

" Ctrl + k
noremap <C-k> :bel vert term<cr>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Run plugins
" NERDTree Begin

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeShowHidden=1
let g:NERDTreeMouseMode=2
let g:NERDTreeWinPos = "left"

" NERDTree End

" papercolor-theme Begin

set background=dark
colorscheme PaperColor

" papercolor-theme End

" fugitive Begin

" Add branch name to statusline
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" fugitive End
