if has_key(plugs, 'YouCompleteMe')
  let g:ycm_clangd_binary_path = exepath('clangd')
  let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
endif
