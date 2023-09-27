if has_key(plugs, 'gruvbox')
  if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
    if (has("nvim"))
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_hls_cursor='bg0'
  colorscheme gruvbox
endif
