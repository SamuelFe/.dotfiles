" 
" ░██████╗░█████╗░███████╗███████╗  Samuel Fernandes
" ██╔════╝██╔══██╗██╔════╝██╔════╝  https://github.com/SamuelFe
" ╚█████╗░███████║█████╗░░█████╗░░
" ░╚═══██╗██╔══██║██╔══╝░░██╔══╝░░
" ██████╔╝██║░░██║██║░░░░░███████╗
" ╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚══════╝  🆃🅷🅸🆂 🅸🆂 🅼🆈 🅽🅴🅾🆅🅸🅼 🅲🅾🅽🅵🅸🅶.
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"{{ The Basics }}
    Plugin 'VundleVim/Vundle.vim'                                  " Let Vundle manage Vundle, required
    Plugin 'itchyny/lightline.vim'                                 " Lightline statusbar
    Plugin 'instant-markdown/vim-instant-markdown'                 " Markdown preview
    Plugin 'frazrepo/vim-rainbow'                                  " Parentheses color matching
    Plugin 'tpope/vim-surround'                                    " Surround things with {}, <>, (), etc...
"{{ File Management }}
    Plugin 'vifm/vifm.vim'                                         " Vifm
"{{ Syntax Highlighting and Colors }}
    Plugin 'vim-python/python-syntax'                              " Python highlighting
    Plugin 'ap/vim-css-color'                                      " Color previews for CSS
    Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Highlighting helper   
    Plugin 'Fymyte/rasi.vim'                                       " Rofi config files colors
"{{ VSCode like achievement }}
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}              " Completion
    Plugin 'scrooloose/nerdtree'                                   " Tree of directories
    Plugin 'Xuyuanp/nerdtree-git-plugin'                           " Git highlight for NERDTree
    Plugin 'ryanoasis/vim-devicons'                                " Develeoping icons
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'               " Syntax highlighting for NERDTree
    Plugin 'ctrlpvim/ctrlp.vim'                                    " fuzzy find files
    
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"################## PLUGGINGS CONFIGURATION ##################"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line // lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'darcula_samuel',
      \ }

let mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_autostart = 0                " Turns off auto preview
let g:instant_markdown_browser = "qutebrowser"      " Uses qutebrowser for preview
"let g:instant_markdown_slow = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

map <Leader>md :InstantMarkdownPreview<CR>          " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>             " Kills the preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow Highlighting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conquer Of Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-clangd'
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree + plugingS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

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

"############## END OF PLUGGINGS CONFIGURATION ###############"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**		        	" Searches current directory recursively.
set wildmenu			        " Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.

set t_Co=256                    " Lightline pluggin: Set if term supports 256 colors.
set termguicolors               " Lightline pluggin: This solves a color problem
set background=dark             " Lightline pluggin: Uses this

set ignorecase                  " Searches are case-insensitive unless it has an uppercase letter
set smartcase                   " Searches are case-insensitive unless it has an uppercase letter

" => Text, tab and indent related
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One <tab> == four spaces.
set tabstop=4                   " One <tab> == four spaces.

" => Mouse Scrolling
set mouse=nicr
set mouse=a                     " For copying and pasting with sources outside of vim

" => Reopen files at the last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to jj
:imap jj <Esc>
:imap JJ <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#1c1f24 ctermbg=none  cterm=none
highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#1c1f24 ctermbg=none  cterm=none
highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
highlight NERDTreeClosable guifg=#98be65 ctermfg=2
highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#5b6268 ctermbg=none  cterm=none


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab SaFe 
            \#
            \<CR># ░██████╗░█████╗░███████╗███████╗  Samuel Fernandes
            \<CR># ██╔════╝██╔══██╗██╔════╝██╔════╝  https://github.com/SamuelFe
            \<CR># ╚█████╗░███████║█████╗░░█████╗░░
            \<CR># ░╚═══██╗██╔══██║██╔══╝░░██╔══╝░░
            \<CR># ██████╔╝██║░░██║██║░░░░░███████╗
            \<CR># ╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚══════╝  🆃🅷🅸🆂 🅸🆂 🅼🆈  https://fsymbols.com/generators/carty/ .
            \<CR>#


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fix Sizing Bug With Alacritty Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://bash<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Remap ; to act like :
nnoremap ; :
vmap ; :

" Jump to particular tab directly
"NORMAL mode bindings
noremap <unique> <A-1> 1gt
noremap <unique> <A-2> 2gt
noremap <unique> <A-3> 3gt
noremap <unique> <A-4> 4gt
noremap <unique> <A-5> 5gt
noremap <unique> <A-6> 6gt
noremap <unique> <A-7> 7gt
noremap <unique> <A-8> 8gt
noremap <unique> <A-9> 9gt
noremap <unique> <A-0> 10gt
"INSERT mode bindings
inoremap <unique> <A-1> <C-O>1gt
inoremap <unique> <A-2> <C-O>2gt
inoremap <unique> <A-3> <C-O>3gt
inoremap <unique> <A-4> <C-O>4gt
inoremap <unique> <A-5> <C-O>5gt
inoremap <unique> <A-6> <C-O>6gt
inoremap <unique> <A-7> <C-O>7gt
inoremap <unique> <A-8> <C-O>8gt
inoremap <unique> <A-9> <C-O>9gt
inoremap <unique> <A-0> <C-O>10gt

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

