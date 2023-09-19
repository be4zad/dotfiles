if has_key(plugs, 'nerdtree')
  " Start NERDTree and leave the cursor in it.
  autocmd VimEnter * NERDTree

  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

  let g:NERDTreeShowHidden=1
  let g:NERDTreeMouseMode=2
  let g:NERDTreeWinPos = "left"
endif
