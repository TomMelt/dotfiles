"open ftplugin file in split
nnoremap <buffer> <F2> :vsplit ~/.vim/ftplugin/markdown.vim<CR>

"Set local leader for latex files
let maplocalleader = ";"

"Spell-check set to F6
nnoremap <buffer> <F6> :setlocal spell! spelllang=en_us<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"move in docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"surround by backticks
vnoremap <buffer> <Localleader>c "dc```<C-R>d```<Esc>
