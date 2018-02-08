"run python script
nnoremap <buffer> <F5> :silent exec '!clear' <CR> :exec '!python3' "%" <CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for python
inoremap <buffer> ;for for (<>) in range((<>)):<CR>(<>)<ESC>/(<>)<CR>ca(
inoremap <buffer> ;pr print()<ESC>i
inoremap <buffer> ;fun def (<>)((<>)):<CR>return<ESC>/(<>)<CR>ca(

"comment
vnoremap <buffer> ;c :norm i#<CR>
vnoremap <buffer> ;x :norm x<CR>

"Useful macros for matplotlib
inoremap <buffer> ;xl plt.xlabel(r'')<ESC>hi
inoremap <buffer> ;yl plt.ylabel(r'')<ESC>hi
inoremap <buffer> ;sa plt.savefig('')<ESC>hi
inoremap <buffer> ;sh plt.show()

