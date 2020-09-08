# memo.vim

VIM script to take note.

## Usage

Following command will be available.

```
:Memo NAME_OF_MEMO
```

If you execute this command, following file will be created.

`~/Documents/Memo/YYYYMMDDHHMMSS_NAME_OF_MEMO.md`

If you want to change folder to store memo, please set `g:memo_dir` variable in your `_vimrc`.
