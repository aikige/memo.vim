if exists('g:loaded_memo_auto')
	finish
endif
let g:loaded_memo_auto = 1

" Save user-configuration.
let s:cpo_save = &cpo
set cpo&vim

" Set memo directory.
if !exists('g:memo_dir')
	let g:memo_dir = $HOME . '/Documents/Memo/'
endif

function! s:get_filename_with_timestamp(dir, suffix)
	if a:dir[-1:] !~ "[\\\/]"
		let a:dir = a:dir . '/'
	endif
	let l:timestamp = strftime('%Y%m%d%H%M%S')
	let l:filename = a:dir . l:timestamp . '_' . a:suffix
	return l:filename
endfunction

function! s:open_memo(...)
	let l:suffix = ''
	for n in a:000
		let l:suffix = l:suffix . n
	endfor
	let l:title = substitute(l:suffix, '\.[a-z]*$', '', 'e')
	let l:title = substitute(l:title, '_', ' ', 'g')
	if a:0 > 0
		let l:filename = s:get_filename_with_timestamp(g:memo_dir, l:suffix)
	else
		let l:filename = g:memo_dir
	endif
	if !isdirectory(g:memo_dir)
		call mkdir(g:memo_dir, "p")
	endif
	execute 'edit ' . l:filename
	call setline(".", "# " . l:title)
endfunction

function! memo#OpenMarkdown(...)
	if a:0 > 0
		call s:open_memo(a:1, ".md")
	else
		call s:open_memo()
	endif
endfunction

function! memo#SearchMemo(regex)
	execute 'vimgrep ' . a:regex . ' ' . g:memo_dir . '/**'
endfunction

" Restore user-configuration.
let &cpo = s:cpo_save
unlet s:cpo_save
