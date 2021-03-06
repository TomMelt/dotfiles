"run python script
"nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!python3 "%" "data/test3.png" <CR>
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!python3 "%"<CR>

"debug python
compiler pyunit
setlocal makeprg=flake8\ %
setlocal errorformat=%E%f:%l:\ could\ not\ compile,
                     \%-Z%p^,
                     \%A%f:%l:%c:\ %t%n\ %m,
                     \%A%f:%l:\ %t%n\ %m,
                     \%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"comment
vnoremap <buffer> <leader>c :norm i#<CR>
vnoremap <buffer> <leader>x :norm x<CR>

vnoremap <buffer> <leader>f :!format_arguments<CR>mm/#formatoptionEND<CR>mnkV`m=`ndd

"enumerate for loop
inoremap <buffer> <leader>en <Esc>mm?for <CR>f ai, <Esc>/ in <CR>f aenumerate(<Esc>$i)<Esc>`m:let @/ = ""<CR>i

"highlight anything over 79 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%>79v.\+/
