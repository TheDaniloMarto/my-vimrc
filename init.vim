" Esse arquivo de configuração usa por base o vim-bootstrap
" Todos os créditos a sua equipe de desenvolvimento https://vim-bootstrap.com/



let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let curl_exists=expand('curl')

" Instalação do vim-plug 
" ----------------------------------------------------------------------------
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

" Plugins instalados
" ----------------------------------------------------------------------------

call plug#begin(expand('~/.config/nvim/plugged'))
call plug#end()

filetype plugin indent on


let mapleader=','

" Configurações base
" ----------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase

" Configurações visuais
" ----------------------------------------------------------------------------

syntax on

set ruler
set number
set wildmenu
set showcmd
set cmdheight=2
set scrolloff=3

set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ 

" Mapeamentos
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

" Comandos
" ----------------------------------------------------------------------------

command! FixWhitespace :%s/\s\+$//e

"
" ----------------------------------------------------------------------------

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
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

