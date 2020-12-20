"Project switching
nnoremap <silent> <C-p> :FzfSwitchProject<CR>
let g:fzfSwitchProjectGitInitBehavior = 'none'

nnoremap <silent> <C-f> :AgGit<CR>
nnoremap <silent> <C-b> :Buffers<CR>

function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

function! s:getFzfFiles()
	cd %:p:h
	if fugitive#head() != ''
		execute 'AgIn' s:find_git_root()
	else
		execute 'AgIn' './'
	endif
endfunction

command! AgGit execute s:getFzfFiles()

function! s:ag_in(bang, ...)
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

