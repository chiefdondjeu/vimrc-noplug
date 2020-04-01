set nocompatible
syntax enable
filetype plugin indent on
" execute pathogen#infect()
set encoding=UTF-8
" set fenc=utf-8
set termencoding=utf-8
set t_Co=256

set nu
set ruler
set cursorline
set hidden
" set title
set showcmd
set confirm 
set mouse=c

" indent
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2

" search
set incsearch
set ignorecase
set smartcase

" set textwidth=80

" easy cmd
cnoremap help vert bo help<Space>
cnoremap git Git<Space>
cnoremap split vsplit<Space>

" auto save 
" autocmd CursorHold * update

" keys
map <F1> :vert bo help<CR>
" flip split position
map <F2> <C-W><C-X>:<CR>
map <F5> :source ~/.vimrc<CR>
" move status line btw splits
map ` <C-W><C-W>:<CR>
" save
map 2 :w<CR>
" change buffers
map - :bprevious<CR>
map = :bnext<CR>

" ease typing
nnoremap ; :
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap /*<CR> /*<CR><BS><BS>*/<ESC>O<BS>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
