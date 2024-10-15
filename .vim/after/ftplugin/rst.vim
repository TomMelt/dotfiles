"move in docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

nnoremap <buffer> <F5> :silent !make -C docs/ clean<CR>:silent !make -C docs/ html<CR><C-L>

set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab
set tw=100
"
"load custom spellfile for a project
let b:spellfile = 'spellfile.en.utf-8.add'
if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    execute "silent mkspell! " . &l:spellfile
else
   setlocal spellfile=
endif
set spell
