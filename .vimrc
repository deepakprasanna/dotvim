set nocompatible

filetype plugin indent on

"calling pathogen to load all the plugins from the bundle directory
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"Adding runtimes
runtime! macros/matchit.vim

"Color scheme
colorscheme railscasts

"Vim custom settings
set ignorecase
set ts=2
set sw=2
set expandtab
set smarttab
set guifont=Monaco\ 9

"Line numbers
set number
set numberwidth=3
set nowrap

" autocmd setting
if has("autocmd")
  augroup vimrxEx
    au!
    autocmd BufWritePost .vimrc source $MYVIMRC
  augroup END
endif "has("autocmd")

" copy and pasting
vmap <C-C> "+y
vmap <C-X> "+x
imap <C-V> <SPACE><ESC>"+gPi
set wildmenu wildmode=full 

"set filetype=coffee for .coffee files
au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.hamljs set filetype=haml
