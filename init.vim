" ----------------------------------------------------------------------------
" Minhas configurações do (Neo) vim
"
"
" Baseados no vim-bootstrap
"
" Author: Danilo Marto de Carvalho <dmcarvalho.dmc@yandex.com>
"
" version: 0.1.0
"
" license: MIT
"
" ----------------------------------------------------------------------------

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let curl_exists=expand('curl')

if !executable(curl_exists)
  echoerr "You have to install curl or first install vim-plug yourself!"
  execute "q!"
endif

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))
call plug#end()

filetype plugin indent on

let mapleader=','

" Base
" ----------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Visual
" ----------------------------------------------------------------------------

syntax on
set ruler
set number
set splitright
set splitbelow
colorscheme desert
set wildmenu
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=3
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Mapping
" ----------------------------------------------------------------------------

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Commands
" ----------------------------------------------------------------------------

command! FixWhitespace :%s/\s\+$//e

" Functions
" ----------------------------------------------------------------------------

" Autocmd
" ----------------------------------------------------------------------------

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

set autoread

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <leader><Tab> :tabnew<CR>

noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>

nnoremap <leader><space> :noh<cr>

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
