"Set local leader for latex files
let maplocalleader = ";"

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

"open ftplugin file for python in split
nnoremap <buffer> <F2> :vsplit ~/.vim/ftplugin/python.vim<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for python
inoremap <buffer> <Localleader>for for (<>) in range((<>)):<CR>(<>)<ESC>/(<>)<CR>ca(
inoremap <buffer> <Localleader>pr print()<ESC>i
inoremap <buffer> <Localleader>fun def (<>)((<>)):<CR>return<ESC>/(<>)<CR>ca(

"comment
vnoremap <buffer> <Localleader>c :norm i#<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

"Useful macros for matplotlib
inoremap <buffer> <Localleader>xl plt.xlabel(r'')<ESC>hi
inoremap <buffer> <Localleader>yl plt.ylabel(r'')<ESC>hi
inoremap <buffer> <Localleader>sa plt.savefig('')<ESC>hi
inoremap <buffer> <Localleader>sh plt.show()

"enumerate for loop
inoremap <buffer> <Localleader>en <Esc>mm?for <CR>f ai, <Esc>/ in <CR>f aenumerate(<Esc>$i)<Esc>`m:let @/ = ""<CR>i

"print subitems of list
inoremap <buffer> <Localleader>pf <Esc>yiwofor i in <C-R>+:<CR>print(i)<Esc>
