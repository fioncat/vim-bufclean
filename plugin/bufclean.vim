""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufClean
"
" A mini plugin to clean up buffers.
"
" Copyright 2021 LazyCat <lazycat7706@gmail.com>.
"
" This script is based on another simple official plugin script: 
"
" https://github.com/vim-scripts/BufOnly.vim/blob/master/plugin/BufOnly.vim
"
" This official script only keeps the buffer of the current window, and the buffers of other 
" windows will be deleted together, which does not meet my requirements, so this version of 
" BufOnly is provided, I named it "BufClean", it will keep the current open window Buffer.
"
" For example, if you open multiple windows in a split screen, and then run the "BufClean" 
" command, the buffers of all windows will be retained, even if you are not focusing on them.
"
" Usage:
"  :BufClean / :BufClean!
"
" You can delete buffers that have been changed but not written by adding "!".
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! -nargs=? -complete=buffer -bang BufClean
    \ :call BufClean('<bang>')

function! BufClean(bang)
	let last_buf = bufnr('$')

	let del_cnt = 0
	let bufn = 1

	while bufn <= last_buf
		if buflisted(bufn) && bufwinnr(bufn) == -1
			if a:bang == '' && getbufvar(bufn, '&modified')
				echohl ErrorMsg
				echohl 'No write since last change for buffer(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . bufn
				if ! buflisted(bufn)
					let del_cnt = del_cnt + 1
				endif
			endif
		endif
		let bufn = bufn + 1
	endwhile

	if del_cnt > 0
		echomsg 'clean done, ' del_cnt 'buffer(s) deleted'
	endif
endfunction
