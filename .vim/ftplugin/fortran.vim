"Set local leader for latex files
let maplocalleader = ";"

"run fortran script
"nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!fortran "%" <CR>

"debug fortran
setlocal makeprg=make\ -s
setlocal errorformat=%E%f:%l:%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"open ftplugin file for fortran in split
nnoremap <buffer> <F2> :vsplit ~/.vim/ftplugin/fortran.vim<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"comment
vnoremap <buffer> <Localleader>c :norm i!<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

let fortran_free_source=1
