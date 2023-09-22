if has_key(plugs, 'accent.vim')
  set background=dark
  let g:accent_colour = 'blue'
  let g:accent_darken = 1
  let g:accent_invert_status = 0
  let g:accent_auto_cwd_colour = 0
  let g:accent_no_bg = 1

  " Length marker color
  hi ColorColumn ctermbg=Grey ctermfg=Black

  silent! colorscheme accent
endif
