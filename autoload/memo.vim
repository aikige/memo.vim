if exists('g:loaded_memo_auto')
	finish
endif
let g:loaded_memo_auto = 1

" Save user-configuration.
let s:cpo_save = &cpo
set cpo&vim

function! GenFilenameWithTimestamp(dir, suffix)
	if a:dir[-1:] !~ "[\\\/]"
		let a:dir = a:dir . '/'
	endif
	let l:timestamp = strftime('%Y%m%d%H%M%S')
	let l:filename = a:dir . l:timestamp . '_' . a:suffix
	return l:filename
endfunction

function! OpenMemo(...)
	if !exists('g:memo_dir')
		let g:memo_dir = $HOME . '/Documents/Memo/'
	endif
	let l:suffix = ''
	for n in a:000
		let l:suffix = l:suffix . n
	endfor
	if a:0 > 0
		let l:filename = GenFilenameWithTimestamp(g:memo_dir, l:suffix)
	else
		let l:filename = g:memo_dir
	endif
	if !isdirectory(g:memo_dir)
		call mkdir(g:memo_dir, "p")
	endif
	execute 'edit ' . l:filename
endfunction

function! memo#OpenMarkdown(...)
	if a:0 > 0
		call OpenMemo(a:1, ".md")
	else
		call OpenMemo()
	endif
endfunction

" Restore user-configuration.
let &cpo = s:cpo_save
unlet s:cpo_save
