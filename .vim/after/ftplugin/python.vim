"run python script
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :!python3 "%" <CR>

"debug python
compiler pyunit
setlocal makeprg=flake8\ %
setlocal errorformat=%E%f:%l:\ could\ not\ compile,
                     \%-Z%p^,
                     \%A%f:%l:%c:\ %t%n\ %m,
                     \%A%f:%l:\ %t%n\ %m,
                     \%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>

"Useful macros for python
inoremap <buffer> <leader>for for (<>) in range((<>)):<CR>(<>)<ESC>/(<>)<CR>ca(
inoremap <buffer> <leader>pr print()<ESC>i
vnoremap <buffer> <leader>pr "fcprint(<C-R>f)
inoremap <buffer> <leader>fun def (<>)((<>)):<CR>return<ESC>/(<>)<CR>ca(

"comment
vnoremap <buffer> <leader>c :norm i#<CR>
vnoremap <buffer> <leader>x :norm x<CR>

"Useful macros for matplotlib
inoremap <buffer> <leader>xl plt.xlabel(r'')<ESC>hi
inoremap <buffer> <leader>yl plt.ylabel(r'')<ESC>hi

"enumerate for loop
inoremap <buffer> <leader>en <Esc>mm?for <CR>f ai, <Esc>/ in <CR>f aenumerate(<Esc>$i)<Esc>`m:let @/ = ""<CR>i

"print subitems of list
inoremap <buffer> <leader>pf <Esc>yiwofor i in <C-R>+:<CR>print(i)<Esc>

"highlight anything over 79 chars
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%>79v.\+/
