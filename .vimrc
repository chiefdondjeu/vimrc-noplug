set nocompatible
syntax enable
set encoding=UTF-8
" set fenc=utf-8
set termencoding=utf-8
set t_Co=256
:colorscheme slate

filetype plugin indent on
set nu
set ruler
set hidden
" set title
set showcmd
set confirm 
" set textwidth=80

" Indent
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
" set softtabstop=4

" Search
set incsearch
set ignorecase
set smartcase

set listchars=eol:¬,trail:~,tab:\ \ ,space:␣
set list

cnoremap help vert bo help<Space>
cnoremap split vsplit<Space>

" Auto save 
" autocmd CursorHold * update

" Shortcuts
map <F1> :vert bo help<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>
" move status line btw splits
map ` <C-W><C-W>:<CR>
map - :bprevious<CR>
map <F5> :ls<CR>
map = :bnext<CR>

" Ease typing
nnoremap ; :
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap /*<CR> /*<CR><BS><BS>*/<ESC>O<BS>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" Stalusline
set laststatus=2
set statusline+=%#MatchParen#
set statusline+=\ %f
set statusline+=\ 
set statusline+=%#CursorColumn#
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ 
set statusline+=%#CursorColumn#
set statusline+=%#CursorColumn#
set statusline+= 
set statusline+=%#MatchParen#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\  
set statusline+=\ %p%%
set statusline+=\  
set statusline+=\ %l:%c
set statusline+=
 
