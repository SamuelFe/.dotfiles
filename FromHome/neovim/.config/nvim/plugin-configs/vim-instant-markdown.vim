" filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_autostart = 0                " Turns off auto preview
let g:instant_markdown_browser = "qutebrowser"      " Uses qutebrowser for preview

map <Leader>md :InstantMarkdownPreview<CR>          " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>             " Kills the preview
