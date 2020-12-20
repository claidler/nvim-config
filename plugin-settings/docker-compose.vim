let dockerlogs_is_open = 0

function! DockerLogsToggle()
	if g:dockerlogs_is_open
		q
		let g:dockerlogs_is_open = 0
	else
		new | terminal sh ~/projects/healthyshoots/logs.sh
		execute "normal G"
		let g:dockerlogs_is_open = 1
	endif
endfunction	

nnoremap <silent> <leader>l :call DockerLogsToggle()<CR>
nnoremap <silent> <leader>u :term sh ~/projects/healthyshoots/up.sh<CR>
