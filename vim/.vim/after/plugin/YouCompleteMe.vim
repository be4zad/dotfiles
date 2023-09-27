if !has_key(plugs, 'YouCompleteMe')
  finish
endif

let g:ycm_clangd_binary_path = exepath('clangd')
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
