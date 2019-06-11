set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'

call vundle#end()            " required
filetype plugin indent on    " required

"General configurations
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let mapleader=","
set number "Numbering rows
set relativenumber "Numbers are relative to the cursor
highlight LineNr ctermfg=grey "Change number color
set hidden "Save changes to files closed in Vim while VIm is running
set autoindent "Save indentation when opening files
set backspace=indent,eol,start
set noeb vb t_vb= "Disable error sound 
set directory^=$HOME/Vim/tmp// "Save swapfiles in this dir
syntax enable 
colorscheme gruvbox
set background=dark
set t_Co=256
set encoding=utf-8
set tabstop=4
set softtabstop=4
set expandtab
set wildmenu "Show meny options whith TAB
set incsearch
set showmatch "Better search
set foldenab l
set completeopt-=preview
set mouse=
set noshowmode

"General keybinds

"Unmap the arrowkeys and mouse
no <down> ddp 
no <left> <Nop>
no <right> <Nop>
no <up> ddkP 
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
"Following commands does not seem to work
noremap <ScrollWheelUp>      <nop>
noremap <S-ScrollWheelUp>    <nop>
noremap <C-ScrollWheelUp>    <nop>
noremap <ScrollWheelDown>    <nop>
noremap <S-ScrollWheelDown>  <nop>
noremap <C-ScrollWheelDown>  <nop>
noremap <ScrollWheelLeft>    <nop>
noremap <S-ScrollWheelLeft>  <nop>
noremap <C-ScrollWheelLeft>  <nop>
noremap <ScrollWheelRight>   <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>

"Auto add second bracket
imap {<CR> {<CR><CR>}<Esc>ki<Tab>

"Bind :Q to do the same as :q
no :Q<CR> :q<CR>
no :Q!<CR> :q!<CR>

"Bind space to center screen
noremap <space> zz
vnoremap <space> zz

"Leader + S to save
inoremap <Leader>s <Esc>:update<CR>
noremap <Leader>s :update<CR>

"Toggle NERDTree with CTRL + n
nnoremap <C-n> :NERDTreeToggle<CR>

"Exiting insert mode to not move cursor
imap <Esc> <Esc>l
imap <C-c> <C-c>l

"Disable "Entering Ex-mode
noremap Q <Nop>

"Automatically reload vimrc on save
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" Snippets
noremap doc<CR> :r ~/.vim/snippets/htmltemplate.html<CR>15ji<Tab>


