" Requires in vim-nerdtree-syntax-highlighting's README
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

"let g:NERDTreeDisableFileExtensionHighlight = 1      " somehow this line made it don't work
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeGitStatusUseNerdFonts = 1     " Use NerdFonts

" I DON'T KNOW IF THIS PART IS INDEED TO STAY HERE, GOT FROM Ben Awad config
" Doesn't seems to colorize according to git status (althoug I wanted to)
"let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
"    \ "Staged"    : "#0ee375",  
"    \ "Modified"  : "#d9bf91",  
"    \ "Renamed"   : "#51C9FC",  
"    \ "Untracked" : "#FCE77C",  
"    \ "Unmerged"  : "#FC51E6",  
"    \ "Dirty"     : "#FFBD61",  
"    \ "Clean"     : "#87939A",   
"    \ "Ignored"   : "#808080"   
"    \ }        
