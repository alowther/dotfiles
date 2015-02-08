set nocompatible              " be iMproved, required
filetype off                  " required

" Set up Vundle:
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Install Plugins:
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall


if filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-sensible'
    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdcommenter'
    "Plugin 'myusuf3/numbers.vim'
    " doesn't handle old versions smartly
    "Plugin 'Shougo/neocomplete.vim'
    "Plugin 'Shougo/neocomplcache.vim'

    call vundle#end()            " required
    filetype plugin indent on    " required

endif

let mapleader = ","
let g:mapleader = ","

" plugin options
" NERDTree settings
let g:NERDTreeWinPos = "right"
nnoremap <leader>e :NERDTreeToggle<CR>

" airline settings
" lots of themes have inactive buffer name same color as background
let g:airline_theme = "bubblegum"

" personal preferences
set background=dark
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

" custom commands
nmap <leader>l :setlocal number!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader><space> :nohlsearch<CR>
nmap <leader>ws :set list!<CR>
nmap <leader>R :so $MYVIMRC<CR>
nnoremap <leader>i :set list!<cr>
" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>
nnoremap ' `
nnoremap ` '

" search settings
set incsearch
set ignorecase
set smartcase
set hlsearch

" buffers
set hidden " hide buffers instead of close

" various
" remember more commands and search history
set history=1000
" use many muchos levels of undo
set undolevels=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
" change the terminal's title
set title
" don't beep
set visualbell
set noerrorbells

set scrolloff=6
" Show (partial) command in status line.
set showcmd
" Show matching brackets.
set showmatch
set showmode

" shortcut
nnoremap ; :

" change regex
nnoremap / /\v
vnoremap / /\v

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" temp files
set nobackup
set noswapfile

" vimrc example
if has('mouse')
  set mouse=a
endif
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" different settings for file types
autocmd FileType make set noexpandtab
autocmd FileType yaml set tabstop=2
autocmd FileType yaml set softtabstop=2
autocmd FileType yaml set shiftwidth=2
