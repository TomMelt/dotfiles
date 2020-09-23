"debug c++ code
setlocal expandtab shiftwidth=2 tabstop=2
setlocal makeprg=make\ -s
setlocal errorformat=%f:%l:%c:\ %m,%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"comment
vnoremap <buffer> <leader>c :norm i// <CR>
vnoremap <buffer> <leader>x :norm 3x<CR>
