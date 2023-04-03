set nocompatible
filetype off
set rtp+=/usr/local/go/misc/vim/
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"
Bundle 'gmarik/vundle'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'jamessan/vim-gnupg'
Bundle 'godlygeek/tabular'
Bundle 'leafgarland/typescript-vim'
Bundle 'tfnico/vim-gradle'

filetype plugin indent on

set t_Co=256

set tabstop=2
set shiftwidth=2
set expandtab
"set smarttab
set autoindent
set encoding=utf8
set fileformat=unix
set ignorecase
set smartcase
set showcmd
set hlsearch
set incsearch
set hidden

imap <S-Tab> <C-D>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap leader to , instead of \
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <SPACE> <Nop>
let mapleader=" "
nmap <expr> <bslash> mapleader


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader>ss will toggle and untoggle spell checking
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set viminfo='10,\"100,:20,%,n~/.viminfo

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap/,/var/tmp/,/tmp/,.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * ainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep a longer history
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scroll buffer when cursor is with X lines of bot/top
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable ruler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set laststatus=2

syntax enable
colorscheme desert

set wildmode=longest,list,full
set wildmenu

" move vertically even in linewrap
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> <Up> g<Up>
noremap  <buffer> <silent> <Down> g<Down>

"Show some whitespace chars
set list listchars=tab:→\ ,trail:·

