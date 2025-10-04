function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

autocmd User CocGitStatusChange {command}

" Git
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'status', 'readonly', 'absolutepath', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name',
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction',
            \   'status': 'zoom#statusline'
            \ },
            \ }

" Lightline Configuration "
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
