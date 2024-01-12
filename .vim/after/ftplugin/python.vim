"run python script
"nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!python3 "%" "data/test3.png" <CR>
nnoremap <buffer> <F5> :silent !clear<CR>:!python "%"<CR>

autocmd BufWritePre *.py :LspFormat

set expandtab
set tabstop=4
set shiftwidth=4

"debug python
compiler pyunit
setlocal makeprg=flake8\ --ignore\ E501\ %
setlocal errorformat=%E%f:%l:\ could\ not\ compile,
                     \%-Z%p^,
                     \%A%f:%l:%c:\ %t%n\ %m,
                     \%A%f:%l:\ %t%n\ %m,
                     \%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"comment
set commentstring=#\ %s

vnoremap <buffer> <leader>f :!format_arguments<CR>mm/#formatoptionEND<CR>mnkV`m=`ndd

"enumerate for loop
inoremap <buffer> <leader>en <Esc>mm?for <CR>f ai, <Esc>/ in <CR>f aenumerate(<Esc>$i)<Esc>`m:let @/ = ""<CR>i

"highlight anything over 79 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%>99v.\+/

let g:ultisnips_python_style = 'google'
