set nocompatible
syntax enable
set encoding=UTF-8
"set fenc=utf-8
set termencoding=utf-8
set t_Co=256
:colorscheme jellybeans


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
set signcolumn=yes
set mouse=a


" --- Indentation
set autoindent
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set noexpandtab
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'


" --- Search
set incsearch
set ignorecase
set smartcase


"set listchars=eol:¬,trail:~,tab:\ \ ,space:␣
set listchars=eol:¬,trail:~,tab:»\ 
set list
set backspace=indent,eol,start


" --- Auto save 
" autocmd CursorHold * update


" --- Shortcuts
map <F1> :vert bo help<CR>
map <F2> :w<CR>
imap <F2> <ESC>:w<CR>

" --- move status line btw splits
map ` <C-W><C-W>:<CR>
map - :bprevious<CR>
map <F5> :ls<CR>
map = :bnext<CR>


" --- Ease typing
nnoremap ; :
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap /*<CR> /*<CR><BS><BS>*/<ESC>O<BS>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"cnoremap help vert bo help<Space>
cnoremap split vsplit<Space>


au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main


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

function! ReturnHighlightTerm(group, term)
	let output = execute('hi ' . a:group)
	echo matchstr(output, a:term.'=\zs\S*')
	return matchstr(output, a:term.'=\zs\S*')
endfunction


" --- Custom stalusline
" run `so $VIMRUNTIME/syntax/hitest.vim` to see other colors
" colorschemes https://bytefluent.com/vivify/

hi SignColumn ctermbg=NONE
hi NormalColor ctermbg=18 ctermfg=15 cterm=bold
hi InsertColor ctermbg=22 ctermfg=15 cterm=bold
hi ReplaceColor ctermbg=160 ctermfg=15 cterm=bold
hi VisualColor ctermbg=202 ctermfg=15 cterm=bold
hi CommandColor ctermbg=0 ctermfg=15 cterm=bold
hi GitColor ctermbg=NONE ctermfg=11
hi StatusLineNC cterm=bold

set laststatus=2

set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#CommandColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%#GitColor#
let &statusline .="%{StatuslineGit()}"
set statusline+=%#StatusLineNC#
set statusline+=\ %f
set statusline+=\ \ %m
set statusline+=%=\ 
let &statusline .="%{FileSize()}"
set statusline+=\ %y
set statusline+=\ \ ☰
set statusline+=\ \ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \[%{&fileformat}\]
set statusline+=\ \ %p%%
set statusline+=\ \ %l:%c\ 
