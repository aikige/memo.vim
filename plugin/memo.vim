if exists('g:loaded_memo')
	finish
endif
let g:loaded_memo = 1

command! -nargs=? Memo call memo#OpenMarkdown(<f-args>)
