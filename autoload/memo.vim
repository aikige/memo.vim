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

function! s:get_filename_with_timestamp(dir, filename)
	if a:dir[-1:] !~ "[\\\/]"
		let a:dir = a:dir . '/'
	endif
	let l:timestamp = strftime('%Y%m%d%H%M%S')
	let l:filename = a:dir . l:timestamp . '_' . a:filename
	return l:filename
endfunction

function! memo#OpenMarkdown(...)
	if !isdirectory(g:memo_dir)
		call mkdir(g:memo_dir, "p")
	endif
	if a:0 > 0
		let l:filename = substitute(a:1 . '.md', ' ', '_', 'g')
		let l:filename = s:get_filename_with_timestamp(g:memo_dir, l:filename)
		let l:title = substitute(a:1, '_', ' ', 'g')
		let l:title = strftime("# %Y/%m/%d ") . l:title
		try
			execute 'edit ' . l:filename
		catch
			echo 'Failed to open file: ' .. v:exception
			return
		endtry
		call setline(".", l:title)
	else
		execute 'edit ' . g:memo_dir
	endif
endfunction

function! memo#SearchMemo(regex)
	execute 'vimgrep ' . a:regex . ' ' . g:memo_dir . '/**'
endfunction

function! memo#SearchAndOpenMemoByName(name, index = 0)
	let l:pattern = '*' . a:name . '*.md'
	let l:file_list = globpath(g:memo_dir, l:pattern)
	let l:files = split(l:file_list)
	execute 'edit ' . l:files[a:index]
endfunction

" Restore user-configuration.
let &cpo = s:cpo_save
unlet s:cpo_save
