"open ftplugin file in split
nnoremap <buffer> <F2> :vsplit ~/.vim/after/ftplugin/markdown.vim<CR>

"Set local leader for latex files
let maplocalleader = ";"

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'fortran', 'tex']

nnoremap <Tab> zAzjzAz
nnoremap <S-Tab> zazkzA[zz

"move in docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"surround by backticks
vnoremap <buffer> <Localleader>c "dc```<C-R>d```<Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
