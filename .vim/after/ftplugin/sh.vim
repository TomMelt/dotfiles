"Set local leader for latex files
let maplocalleader = ";"

"run bash script
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!bash "./%"<CR>

"open ftplugin file for bash in split
nnoremap <buffer> <F2> :vsplit ~/.vim/after/ftplugin/sh.vim<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for bash
inoremap <buffer> <Localleader>for for i in {(<>)}<CR>do<CR>(<>)<CR>done<ESC>/(<>)<CR>ca(

"comment
vnoremap <buffer> <Localleader>c :norm i#<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

"shebang
inoremap <buffer> <Localleader># #!/bin/bash<Esc>o<CR>

