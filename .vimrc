set bg=dark
set number
set nowrap
syntax enable
set clipboard=unnamedplus
highlight LineNr ctermfg=gray 
set tabstop=4
set shiftwidth=4
"set expandtab

" Toggle menues Ctrl + F1-F3
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Langugage specific commands
" Press F8 to compile and run C file
autocmd FileType c map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" Press F8 to compile and run Python file
autocmd FileType python map <F8> :w <CR> :!clear;python3 %<CR>

" Disable ex mode
map Q <Nop>
