"open ftplugin file for python in split
nnoremap <buffer> <F2> :vsplit ~/.vim/after/ftplugin/bib.vim<CR>

"Set local leader for latex files
let maplocalleader = ";"

"comment
vnoremap <buffer> <Localleader>c :norm i%<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

