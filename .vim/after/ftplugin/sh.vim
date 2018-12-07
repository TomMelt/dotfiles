"run bash script
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!bash "%"<CR>

setlocal tw=80
setlocal expandtab shiftwidth=4 tabstop=4

"Useful macros for bash
inoremap <buffer> <leader>for for i in {(<>)}<CR>do<CR>(<>)<CR>done<ESC>/(<>)<CR>ca(

"comment
vnoremap <buffer> <leader>c :norm i#<CR>
vnoremap <buffer> <leader>x :norm x<CR>

"shebang
inoremap <buffer> <leader># #!/bin/bash<Esc>o<CR>

