"Set local leader for latex files
let maplocalleader = ";"

"open ftplugin file for bash in split
nnoremap <buffer> <F2> :vsplit ~/.vim/after/ftplugin/xml.vim<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"comment
vnoremap <buffer> <Localleader>c :norm i#<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
