"debug c++ code
setlocal expandtab shiftwidth=4 tabstop=4
setlocal makeprg=make\ -s
setlocal errorformat=%f:%l:%c:\ %m,%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>
set tw=100

"comment
set commentstring=//\ %s
