
if exists('g:dprint_loaded')
	finish
endif

let g:dprint_loaded = 1

autocmd! BufEnter *.ts call dprint#CheckTSPreferdprint()

command! Preferdprint call dprint#OverrideLC(v:true)

function! dprint#OverrideLC(global)
	if a:global
		let g:LC_autoformat = 0
		let g:dprint_autoformat = 1
	else
		let b:LC_autoformat = 0
		let b:dprint_autoformat = 1
	endif
endfunction

function! dprint#CheckTSPreferdprint()
	if get(b:, 'TSPreferdprint', 0) == 1
		call s:prefer_dprint(v:false)

		autocmd BufWritePre <buffer> call dprint#Format()
	endif
endfunction

function! dprint#Format()
	if get(g:, 'dprint_autoformat', get(b:, 'dprint_autoformat', 0)) == 1
		let view = winsaveview()
		execute "silent %!dprint fmt '" . expand('%:p') . "'"
		if v:shell_error
			% |
			undo
			echohl Error | echomsg "dprint returned an error" | echohl None
		endif
		call winrestview(view)
	endif
endfunction
