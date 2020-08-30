set number

set nowrap

set directory=$HOME/.vim/swapfiles//

set bg=dark
colorscheme gruvbox
syntax enable

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set backspace=2

set list

set hlsearch
set ignorecase
set smartcase
set incsearch

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p

command! Q :q
command! W :w
command! WQ :wq
