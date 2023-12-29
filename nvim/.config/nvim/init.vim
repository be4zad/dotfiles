" ----- Basic ---- "

syntax on
syntax enable
set background=dark
set noswapfile
set number
set numberwidth=6
let mapleader=","
filetype plugin indent on

if has('mouse')
  set mouse=a
endif

" Ignore case in search patterns
set ignorecase

" Highlight searchs
set hlsearch

" ---- Indent ---- "

set autoindent
set smartindent
set copyindent
set preserveindent
set expandtab
set shiftwidth=4
set tabstop=4

" ---- Folding ---- "

set nofoldenable
set foldmethod=indent
set foldlevelstart=1

" ---- File ---- "

" Save history and undo changes even after a reboot
set undofile
set undodir=~/.vim/undodir

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Disable wrap for c file type
autocmd FileType c set nowrap

" Comments
set comments=s1:/*,mb:*,ex:*/

" ---- File explorer - Netrw ----

set acd
let g:netrw_keepdir= 0
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" ---- Key maps ----

" Open vertical term with Ctrl-K
noremap <C-k> :bel vert term<cr>

" ---- GUI ----

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" ---- Other ----

" Fix home/end key in all modes
map <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
tmap <esc>OH <home>
map <esc>OF <end>
cmap <esc>OF <end>

" ---- Plugin ----

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-abolish'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'preservim/nerdtree'
  Plug 'rust-lang/rust.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ---- lightline.vim ----

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename' ],
      \     [ 'reeaonly', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'gitbranch', 'filetype' ]
      \   ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
\ }
