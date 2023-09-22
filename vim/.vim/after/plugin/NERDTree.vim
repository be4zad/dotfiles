if has_key(plugs, 'nerdtree')
  let g:NERDTreeShowHidden=1
  let g:NERDTreeMouseMode=2
  let g:NERDTreeWinPos = "left"
  let g:NERDTreeCaseSensitiveSort=1
  let g:NERDTreeNaturalSort=1
  let g:NERDTreeCascadeSingleChildDir=0
  let g:NERDTreeCascadeOpenSingleChildDir=0

  " Start NERDTree and leave the cursor in it.
  autocmd VimEnter * NERDTree

  " Open the existing NERDTree on each new tab.
  autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
endif
