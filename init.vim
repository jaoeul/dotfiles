let mapleader = ","

" Airline stuff
let g:airline_theme='simple'

" General stuff
set bg=dark
set number
set nowrap
syntax enable
set clipboard=unnamedplus
highlight LineNr ctermfg=gray 
set tabstop=4
set shiftwidth=4
set noshowmode
set t_Co=256
map Q <Nop>
command! Q :q
command! W :w

" Press F8 to compile and run C file
autocmd FileType c map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" Press F8 to compile and run Python file
autocmd FileType python map <F8> :w <CR> :!clear;python3 %<CR>

" Press F8 to compile and run Dotnet Core App
autocmd FileType cs map <F8> :w <CR> :!clear;dotnet run <CR>

" Autocomletion options
set completeopt=longest,menuone,preview

" Always keep an option selected
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
