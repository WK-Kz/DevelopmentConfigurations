" Initialize Plugins "
call plug#begin()

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Use 'dir' option to install plugin in a non-default directory
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
" Post-update hook: run a shell command after installing or updating the
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Color Scheme"
Plug 'morhetz/gruvbox'

Plug 'cdelledonne/vim-cmake'

" Easy comment
Plug 'tpope/vim-commentary'

" Vim Debugger "
Plug 'puremourning/vimspector'

Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

Plug 'ryanoasis/vim-devicons'

call plug#end()
" PLUG END INITIALIZATION"
