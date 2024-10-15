let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'fortran', 'tex']

"navigate folds for presentation mode
"nnoremap <Tab> zAzjzAz
"nnoremap <S-Tab> zazkzA[zz

"move in docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"make header underlined
nnoremap <buffer> <leader>h yypV:s/./=/g<CR>:nohls<CR>o<Esc>

"surround by backticks
vnoremap <buffer> <leader>c "dc```<C-R>d```<Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set tw=128

"load custom spellfile for a project
let b:spellfile = 'spellfile.en.utf-8.add'
if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    execute "silent mkspell! " . &l:spellfile
else
   setlocal spellfile=
endif

nnoremap <f5> :silent! make<CR><C-l>
