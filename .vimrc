set nocompatible

filetype plugin indent on

"calling pathogen to load all the plugins from the bundle directory
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"Adding runtimes
runtime! macros/matchit.vim

"Color scheme
colorscheme darkspectrum 

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
set ruler 
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) "a ruler on steroids

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
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.scss set filetype=css

"ack-grep
let g:ackprg="ack-grep -H --nocolor --nogroup --column" 

"nerdtree toggle
map <F2> :NERDTreeToggle<CR> 

"tabman
let g:tabman_toggle = '<F3>'
let g:tabman_focus  = '<F3>f'

"coffeecompile
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader>c :CoffeeCompile<CR> 

" Tab Navigation with Ctrl+Tab
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
nmap <silent> <C-S-Left> :exe 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> <C-S-Right> :exe 'silent! tabmove ' . tabpagenr()<CR> 
