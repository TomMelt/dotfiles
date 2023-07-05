"debug c++ code
setlocal expandtab shiftwidth=2 tabstop=2
setlocal makeprg=make\ -s
setlocal errorformat=%f:%l:%c:\ %m,%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"comment
set commentstring=//\ %s
