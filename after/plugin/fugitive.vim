if has_key(plugs, 'vim-fugitive')
  " Add branch name to statusline
  set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
endif
