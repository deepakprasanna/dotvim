set nocompatible
set mouse = ""

syntax on
filetype plugin indent on

"calling pathogen to load all the plugins from the bundle directory
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

set vb t_vb= "Be silent dude

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
set list

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
au BufRead,BufNewFile *.scala set filetype=scala
au BufRead,BufNewFile *.clj set filetype=clojure
au BufRead,BufNewFile *.cljs set filetype=clojure

"ack-grep
let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=.gems" 

"nerdtree toggle
nnoremap <leader>n :NERDTreeToggle<CR>

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

" Vim native code completion
set omnifunc=syntaxcomplete#Complete

"Rainbow paren always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Disable Arrow keys in Escape mode

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Jumping between buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert new line and goto insert more one line above the current line
map <M-o> m`O<ESC>``

"relative numbering
function! NumberToggle()
 if(&relativenumber == 1)
   set norelativenumber
   set number
 else
   set relativenumber
 endif
endfunc

nnoremap <leader><leader>r :call NumberToggle()<cr>

" Persistant UNDO
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
