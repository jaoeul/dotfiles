" Remap leader to spacebar
let mapleader = "\<Space>"

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

" Search for selected text, forwards or backwards
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" NERDTree
" autocmd vimenter * NERDTree " Start NERDTree on vim startup
"map <leader>n :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd VimEnter * wincmd p " Focus on previsouly focused window
"autocmd BufEnter * lcd %:p:h " Set cwd to vim buffer place
"let g:NERDTreeDirArrows=0

" Explorer
map <leader>n :Explore!<CR>

" Exiting and saving
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

" Cscope
" Recurisve upwards search for tags file
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose "
    exe "cs add " . db . " " . path
    set cscopeverbose
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"Find this definition
nmap <leader>gd "zyiw:exe "cscope find g ".@z.""<CR>
"Find functions calling this function
nmap <leader>gr "zyiw:exe "cscope find c ".@z.""<CR>
"Find functions called by this function
nmap <leader>gc "zyiw:exe "cscope find d ".@z.""<CR>
"Find this file
nmap <leader>gf "zyiw:exe "cscope find f ".@z.""<CR>
"Find files #including this file
nmap <leader>gi "zyiw:exe "cscope find i ".@z.""<CR>
"Find this C symbol
nmap <leader>gs "zyiw:exe "cscope find s ".@z.""<CR>
"Find assignments to
nmap <leader>ga "zyiw:exe "cscope find a ".@z.""<CR>

" Textwidth
set colorcolumn=121
highlight ColorColumn ctermbg=magenta

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

" Compile & run code directly from VI
" Rust
autocmd FileType rust map <leader>rc :! cargo rustc -- -Awarnings<CR>
autocmd FileType rust map <leader>re :! cargo run<CR>
