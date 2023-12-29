if !has_key(plugs, 'nerdtree')
  finish
endif

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=20

" Remove left gray bar just for nerdtree
autocmd FileType nerdtree setlocal signcolumn=no

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

