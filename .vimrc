set nocompatible
syntax enable
set encoding=UTF-8
"set fenc=utf-8
set termencoding=utf-8
set t_Co=256
:colorscheme slate


filetype plugin indent on
set nu
set ruler
set hidden
"set title
set showcmd
set confirm
set scrolloff=8
set nowrap
"set textwidth=80
":set signcolumn=yes


" Indentation
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set noexpandtab
"set softtabstop=4


" Search
set incsearch
set ignorecase
set smartcase


"set listchars=eol:¬,trail:~,tab:\ \ ,space:␣
set listchars=eol:¬,trail:~,tab:\ \ 
set list


"cnoremap help vert bo help<Space>
cnoremap split vsplit<Space>
set backspace=indent,eol,start


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


"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! FileSize()
  return system("printf \"%'d\" ".getfsize(expand(@%)))
endfunction

" Custom Stalusline
" run `so $VIMRUNTIME/syntax/hitest.vim` to see other colors
set laststatus=2
set statusline+=%#MatchParen#
let &statusline .="%{StatuslineGit()}"
set statusline+=%#error#
set statusline+=\ %f
set statusline+=\ %#Folded#
set statusline+=\ %m
set statusline+=%=
set statusline+=\ 
let &statusline .="%{FileSize()}"
set statusline+=\ %y
set statusline+=\ %#Folded#
set statusline+=\ %#error#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ \ %p%%
set statusline+=\ \ %l:%c
set statusline+=\ 
