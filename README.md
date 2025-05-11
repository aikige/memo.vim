# memo.vim

VIM script to take note.

## Usage

Following command will be available.

|Command|Summary|
|:------|:------|
|Memo   |Create a new memo.|
|MSearch|Search memos using grep and open matched item.|

## Command Details

### Memo

```
:Memo Name of Memo
```

If you execute this command, following file will be created.

```
~/Documents/Memo/YYYYMMDDHHMMSS_Name_of_Memo.md
```

Here, the timestamp is automatically added, and white spaces are replaced with the underscore.

[vimrc]:https://vimhelp.org/starting.txt.html#vimrc
If you want to change folder to store memo, please set `g:memo_dir` variable in your [vimrc].

### MSearch

```
:MSearch REGEX
```

[vimgrep]:https://vimhelp.org/quickfix.txt.html#%3Avimgrep
Search memo directory using [vimgrep] and show found file.

### MOpen

```
:MOpen STRING INDEX
```
[globpath]:https://vimhelp.org/builtin.txt.html#globpath%28%29
This command searches the memo folder using [globpath] function and finds a memo that includes the _STRING_ in the filename.
When multiple files are found, the _INDEX_ is used to specify the file.
If _INDEX_ is not specified, default value _0_ is used as the index.
