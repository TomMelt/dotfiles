"better indenting
setlocal expandtab shiftwidth=2 tabstop=2

set textwidth=100

nnoremap <buffer> <F5> :silent! !make<CR><C-l>

"comment
vnoremap <buffer> <leader>c :norm i%<CR>
vnoremap <buffer> <leader>x :norm x<CR>

"Useful macros for latex environments
inoremap <buffer> <leader>np \newpage<CR>
inoremap <buffer> <leader>f <Esc>mmvipgqvip:s/ \s\+/ /ge<CR>:nohls<CR>`m
nnoremap <buffer> <leader>f mmvipgqvip:s/ \s\+/ /ge<CR>:nohls<CR>`m

"move in latex docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

"load custom spellfile for a project
let b:spellfile = 'spellfile.en.utf-8.add'
if filereadable(b:spellfile)
    let &l:spellfile = b:spellfile
    execute "silent mkspell! " . &l:spellfile
else
   setlocal spellfile=
endif

command! MakeTags !ctags -R *.bib

"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-G "\.tex" --color-path="0;33"', <bang>0)
