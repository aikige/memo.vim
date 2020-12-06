if exists('g:loaded_memo')
	finish
endif
let g:loaded_memo = 1

" Save user-configuration.
let s:cpo_save = &cpo
set cpo&vim

command! -nargs=? Memo call memo#OpenMarkdown(<f-args>)
command! -nargs=1 MSearch call memo#SearchMemo(<f-args>)

" Restore user-configuration.
let &cpo = s:cpo_save
unlet s:cpo_save
