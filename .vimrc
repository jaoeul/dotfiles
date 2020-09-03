" Show linenumber
set number

" Coloring
set bg=dark
colorscheme one
syntax enable
set cursorline
highlight CursorLineNr term=bold cterm=NONE ctermfg=magenta ctermbg=NONE gui=NONE guifg=NONE guibg=NONE

" Don't wrap lines
set nowrap

" Collect all .swp files in a single dir
set directory=$HOME/.vim/swapfiles//

" Tabbing to space
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Backspace
set backspace=2

" Show whitespaces and newlines
"set list

" Better search
set hlsearch
set ignorecase
set smartcase
set incsearch

" NERDTree
autocmd vimenter * NERDTree " Start NERDTree on vim startup
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p " Focus on previsouly focused window
autocmd BufEnter * lcd %:p:h " Set cwd to vim buffer place
let g:NERDTreeDirArrows=0

" Exiting
command! Q :q
command! W :w
command! WQ :wq
command! Qa :qa
command! WQA :wqa
command! Wq :wq
command! Wqa :wqa

" Ctags
set tags=./tags,tags;$HOME
map gd "zyiw:exe "tag ".@z.""<CR>

" Textwidth
set colorcolumn=121
highlight ColorColumn ctermbg=magenta
