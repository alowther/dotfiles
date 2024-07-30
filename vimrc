set nocompatible              " be iMproved, required

" Set up Vundle:
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Install Plugins:
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall


if filereadable($HOME . "/.vim/bundle/Vundle.vim/README.md")
    filetype off                  " required
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-sensible'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'jistr/vim-nerdtree-tabs'
    "Plugin 'vim-syntastic/syntastic'
    Plugin 'pearofducks/ansible-vim'
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
"let g:airline_theme = "term"

" syntastic recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" pyflakes just does compile issues
if filereadable("/usr/bin/pyflakes")
    let g:syntastic_python_checkers = ['python','pyflakes']
endif

let g:syntastic_enable_ansible_checker = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['ansible'] }

" personal preferences
set background=dark
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set list

" custom commands
nmap <leader>l :setlocal number!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader><space> :nohlsearch<CR>
nmap <leader>ws :set list!<CR>
nmap <leader>R :so $MYVIMRC<CR>
nnoremap <leader>i :set list!<cr>
nnoremap <leader>z za
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

" folding
set foldlevel=99

" mixing Makefile buffers and other buffers messing me up
autocmd FileType * set expandtab tabstop=4 softtabstop=4 shiftwidth=4
" different settings for file types
autocmd FileType make set noexpandtab list
autocmd FileType yaml set expandtab tabstop=2 softtabstop=2 shiftwidth=2

autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
"\ set textwidth=79

" ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "a"
