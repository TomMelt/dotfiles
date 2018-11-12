"open ftplugin file for melt in split
nnoremap <buffer> <F2> :vsplit ~/.vim/after/ftplugin/melt.vim<CR>

setlocal fdm=indent

setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

"Set local leader for latex files
let maplocalleader = ";"

"Compile pdfLatex
"nnoremap <buffer> <F5> :w<CR> :!clear<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> <C-L> 2h
"inoremap <buffer> <F5> <Esc>:w<CR> :!clear<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> <C-L> hi
"setlocal makeprg=pdflatex\ -interaction=nonstopmode\ -file-line-error-style\ %\ \\\|\ python\ ~/.vim/efm_vim.py
nnoremap <buffer> <F5> :w<CR> :make<CR><C-w><Up> :copen<CR>

"comment
vnoremap <buffer> <Localleader>c :norm i%<CR>
vnoremap <buffer> <Localleader>x :norm x<CR>

"update tags file for latex
inoremap <buffer> <localleader>bi <Esc>:!ctags -R library.bib<CR>

"move in latex docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

