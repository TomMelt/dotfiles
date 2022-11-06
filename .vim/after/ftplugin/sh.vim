"run bash script
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!bash "%"<CR>

"setlocal tw=80
setlocal expandtab shiftwidth=4 tabstop=4

"comment
set commentstring=#\ %s
