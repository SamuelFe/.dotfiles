set updatetime=100
let g:gitgutter_enabled = 0

" signing customization
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = 'ww'

highlight SignColumn      guibg=#1c1f24 ctermfg=0
highlight GitGutterAdd    guifg=#98be65 ctermfg=2
highlight GitGutterChange guifg=#51afef ctermfg=3
highlight GitGutterDelete guifg=#ff6c6b ctermfg=1
