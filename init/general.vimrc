set encoding=UTF-8

set nobackup
set nowritebackup

let $BAT_THEME='gruvbox-dark'

colorscheme habamax

let g:mapleader = "\<Space>"

" Enable filetype plugins
filetype plugin on
filetype indent on

syntax on
set hidden

" For COC? "
set updatetime=100

set history=500 " For FZF 
set backspace=indent,eol,start
set cursorline
set relativenumber

" For non-godot projects... "
set autoindent smartindent expandtab tabstop=2 shiftwidth=2

" Status Window
set laststatus=2        " always show status line

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

autocmd FileType vim setlocal foldmethod=marker

" Literally all this to require a block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let &grepprg='rg --no-config --vimgrep $*'
let &shellpipe='2>&1 | tee'

" Automatically close/open brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" More Custom commands "
nnoremap <leader>! :!bash<CR>
inoremap <F3> <esc>:set paste!<cr>
nnoremap <F3> :set paste!<cr>

" Terminal colors for seoul256 color scheme
let g:terminal_ansi_colors = [
      \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
      \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
      \ '#626262', '#d75f87', '#87af87', '#ffd787',
      \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
      \ ]
