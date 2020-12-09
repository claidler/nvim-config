let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

autocmd FileType dirvish nnoremap <buffer> gH :let g:dirvish_mode = ':silent keeppatterns g@\v/\.[^\/]+/?$@d'<Bar>Dirvish %<cr>
autocmd FileType dirvish nnoremap <buffer> gh :let g:dirvish_mode = ''<Bar>Dirvish %<cr>
let g:dirvish_mode = ':silent keeppatterns g@\v/\.[^\/]+/?$@d _'
