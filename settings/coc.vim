" ****** Linting/Autocompletion ******
let g:coc_global_extensions = [
	\'coc-markdownlint',
	\'coc-tsserver',
	\'coc-eslint',
	\'coc-stylelint',
	\'coc-git',
	\'coc-json',
	\'coc-python',
	\'coc-phpls',
	\'coc-html',
	\'coc-css',
	\'coc-cssmodules',
	\'coc-docker',
	\'coc-yaml',
	\'coc-emmet',
	\'coc-pairs',
	\'coc-snippets',
	\'coc-yank',
	\'coc-prettier',
	\'coc-sh',
	\'coc-actions'
	\]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gf <Plug>(coc-fix-current)

hi CocWarningHighlight cterm=undercurl guisp=#000000

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
