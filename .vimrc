set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

" Airline stuff
let g:airline_theme='simple'

" Paths
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_path = '/home/joel/.cache/omnisharp-vim/omnisharp-roslyn/run'

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

" Toggle menues Ctrl + F1-F3
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Langugage specific commands
" Press F8 to compile and run C file
autocmd FileType c map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

" Press F8 to compile and run Python file
autocmd FileType python map <F8> :w <CR> :!clear;python3 %<CR>

" Press F8 to compile and run Dotnet Core App
autocmd FileType cs map <F8> :w <CR> :!clear;dotnet run <CR>


" Omnisharp stuff
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:OmniSharp_highlight_types = 3

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1

set completeopt=longest,menuone,preview
