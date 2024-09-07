let g:mapleader = "\<Space>"

" #STARTFZFBINDS "
" fzf in current directory "
nnoremap <silent> <leader><space> :Files<CR>

" ripgrep in current directory
nnoremap <silent> <leader>ff :Rg <CR>

" fzf in up directory "
nnoremap <silent> <leader>f :Files ../<CR>

" fzf in home
nnoremap <silent> <leader>fh :Files ~/<CR>
nnoremap <silent> <leader>fs :History<CR>
nnoremap <silent> <leader>fS :History/<CR>
nnoremap <silent> <leader>fc :History:<CR>
" No idea what this does
" imap <C-f> <plug>(fzf-complete-line)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" #ENDFZFBINDS "

" CMake Plugin
let g:cmake_default_config='RelWithDebInfo'
let g:cmake_generate_options=["-GNinja", "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"]
let g:cmake_jump_on_error = 0
nmap <leader>cg <Plug>(CMakeGenerate)
nmap <leader>cb <Plug>(CMakeBuild)
nmap <leader>ci <Plug>(CMakeInstall)
nmap <leader>cs <Plug>(CMakeSwitch)
nmap <leader>cq <Plug>(CMakeClose)

augroup vim-cmake-group
	autocmd User CMakeBuildSucceeded CMakeClose
augroup END

" End CMake Plugin

" NERD TREE Config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Autcomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Lightline Configuration "
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
" set noshowmode

" FUNCTIONS "

"Asynccomplete"
imap <c-@> <Plug>(asyncomplete_force_refresh)

" Vim LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gD <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-[> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-]> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" Toggling diagnostics and virtual text {{{
autocmd BufEnter * let b:my_lsp_diagnostics_enabled = 1

function! s:MyToggleLSPDiagnostics()
	" source: https://github.com/prabirshrestha/vim-lsp/issues/1312
    if !exists('b:my_lsp_diagnostics_enabled')
		" Ensure the buffer variable is defined
        let b:my_lsp_diagnostics_enabled = 1
    endif
    if b:my_lsp_diagnostics_enabled == 1
        call lsp#disable_diagnostics_for_buffer()
        let b:my_lsp_diagnostics_enabled = 0
        echo "LSP Diagnostics : OFF"
    else
        call lsp#enable_diagnostics_for_buffer()
        let b:my_lsp_diagnostics_enabled = 1
        echo "LSP Diagnostics : ON"
    endif
endfunction
command MyToggleLSPDiagnostics call s:MyToggleLSPDiagnostics()
nnoremap <leader><F3> :MyToggleLSPDiagnostics<CR>zz
" Toggling diagnostic and virtual text }}}
