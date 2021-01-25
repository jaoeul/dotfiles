" Remap leader to spacebar
let mapleader = "\<Space>"

"Plug
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'rakr/vim-one'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

call plug#end()

" Trigger completions with Ctrl+SPC in insert mode
"inoremap <C-Space> <C-x><C-u>

" Toggle linenumber with <leader>ln
set number
nnoremap <leader>tln :set number!<CR>

" Disable mouse support
set mouse=""

" Open virtically split windows to the right
set splitright

" Coloring
set bg=dark
colorscheme one
syntax enable
set cursorline
highlight CursorLineNr term=bold cterm=NONE ctermfg=magenta ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight Pmenu ctermbg=gray guibg=gray
highlight PmenuSel ctermbg=white guibg=gray
highlight PmenuSbar ctermbg=darkgray guibg=gray
highlight PmenuThumb ctermbg=lightgray guibg=gray

" Don't wrap lines
set nowrap

" Collect all .swp files in a single dir
set directory=$HOME/neovim/swapfiles//

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
" autocmd vimenter * NERDTree " Start NERDTree on vim startup
map <leader>n :NERDTreeToggle<CR>
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
"set tags=./tags,tags;$HOME " Recurisve upwards search for tags file
"map gd "zyiw:exe "tag ".@z.""<CR> " map gd to go to defenition

" Textwidth
set colorcolumn=121
highlight ColorColumn ctermbg=darkmagenta

" Fuzzy search files without a plugin. Use tab to start searching
set wildmenu
nnoremap <leader>h :find $WS_ROOT/**/*

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=darkmagenta guibg=darkmagenta
autocmd Syntax * syn match ExtraWhitespace /\s\+$/ containedin=ALL

" Syntax highlighting of typedefs
autocmd Syntax * syn match Type display "\<[a-zA-Z][0-9a-zA-Z_]*_t\>"
autocmd Syntax * syn match Type display "\<[a-zA-Z][0-9a-zA-Z_]*_f\>"
autocmd Syntax * syn match Type display "\<[a-zA-Z][0-9a-zA-Z_]*_s\>"

" Buffer stuff!
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" Show buffers
nnoremap <leader>bb :buffers<CR>:b 

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
