" Get the defaults that most users want
source $VIMRUNTIME/defaults.vim

" ----- Basic ---- "

syntax on
syntax enable
set background=dark
set number
set numberwidth=6
filetype plugin indent on

if has('mouse')
  set mouse=a
endif

" Ignore case in search patterns
set ignorecase

" ---- Indent ---- "

set autoindent
set smartindent
set copyindent
set preserveindent
set expandtab
set shiftwidth=2
set tabstop=4

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

function! InstallAllPlugins()
  " Install vim-plug if not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  " Install Vim Plug plugins if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif

  " Exit
  autocmd VimEnter * qa!
endfunction

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ycm-core/YouCompleteMe'
call plug#end()

command! InstallAllPlugins call InstallAllPlugins()
