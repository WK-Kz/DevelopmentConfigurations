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
