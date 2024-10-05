" Nerd Tree Keybinds "

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :NERDTreeFind<CR>

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
