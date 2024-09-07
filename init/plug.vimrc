" Initialize Plugins "
call plug#begin()

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Use 'dir' option to install plugin in a non-default directory
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
" Post-update hook: run a shell command after installing or updating the
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim Smoothing "
Plug 'psliwka/vim-smoothie'

" LSP Settings "
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

"Color Scheme"
Plug 'morhetz/gruvbox'

" Helpers? Delete when unneeded"
Plug 'wellle/context.vim'

" CMake Generator and Compiler (May want to change this at some point due to
" wanting to build at specific areas and it doesn't work?)"
Plug 'cdelledonne/vim-cmake'

" Easy commenting
Plug 'tpope/vim-commentary'

" Vim Debugger For C/C++/Python/etc"
Plug 'puremourning/vimspector'
Plug 'jclsn/vimspector-templates'

Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'

" VIM Icons for NerdTree and lightline"
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()
" PLUG END INITIALIZATION"
