"Set local leader for latex files
let maplocalleader = ";"

"debug fortran
setlocal makeprg=make\ -s
"setlocal errorformat=%E%f:%l:%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
"setlocal errorformat=%f:%l:%c:\ error:\ %m,%C%.%#
setlocal errorformat=%f:%l:%c:\ %m,%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"open ftplugin file for fortran in split
nnoremap <buffer> <F2> :vsplit ~/.vim/ftplugin/cpp.vim<CR>

"comment
vnoremap <buffer> <Localleader>c :norm i// <CR>
vnoremap <buffer> <Localleader>x :norm 3x<CR>
