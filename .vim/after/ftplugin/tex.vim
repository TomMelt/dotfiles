"better indenting
setlocal expandtab shiftwidth=2 tabstop=2

set textwidth=100

nnoremap <buffer> <F5> :silent! !make<CR><C-l>
nnoremap <buffer> <S-F5> :silent! !make CoupledHartreeFock.bib<CR><C-l>

"comment
set commentstring=%\ %s

"Useful macros for latex environments
inoremap <buffer> <leader>np \newpage<CR>

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
command! Bibtool !bibtool format -i library.bib

"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-G "\.tex" --color-path="0;33"', <bang>0)


function! s:customParagraph()
    " custom paragraph object for editing latex files

    " magic is needed for this
    let l:magic = &magic
    set magic

    " pattern matching; \begin, \end or empty lines
    let l:pat = '\\begin\|\(\\end\)\|\(^$\)'

    " find first match (backwards & don't wrap or move cursor)
    let l:start = search(l:pat, 'bWn') + 1

    " next, find first match (forwards & don't wrap or move cursor)
    let l:end = search(l:pat, 'Wn')

    if (l:end !=# 0)
        " if search succeeded, it went too far, so subtract 1
        let l:end -= 1
    endif

    " go to start (this includes empty lines) and--importantly--column 0
    execute 'normal! '.l:start.'G0'

    " skip empty lines (unless already on one .. need to be in column 0)
    call search('^[^\n\r]', 'Wc')

    " go to end (this includes empty lines)
    execute 'normal! Vo'.l:end.'G'

    " skip backwards to last selected non-empty line
    call search('^[^\n\r]', 'bWc')

    " go to end-of-line 'cause why not
    normal! $o

    " restore magic
    let &magic = l:magic
endfunction

function! s:formatParagraph()
    normal! mm
    call <sid>customParagraph()
    normal! gq`m
endfunction

" "in indentation" (indentation level sans any surrounding empty lines)
xnoremap <silent> ip :<c-u>call <sid>customParagraph()<cr>
onoremap <silent> ip :<c-u>call <sid>customParagraph()<cr>

inoremap <buffer> <leader>f <C-O>:call <sid>formatParagraph()<cr>
nnoremap <buffer> <leader>f :call <sid>formatParagraph()<cr>
