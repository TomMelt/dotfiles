"debug c++ code
setlocal expandtab shiftwidth=4 tabstop=4
setlocal makeprg=make\ -s
setlocal errorformat=%f:%l:%c:\ %m,%-G%.%#
nnoremap <buffer> <F6> :silent make<CR> <C-L> :copen<CR>
set tw=100

"comment
set commentstring=//\ %s


function FormatBuffer()
    if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
        let cursor_pos = getpos('.')
        :%!clang-format-18
        call setpos('.', cursor_pos)
    endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :silent call FormatBuffer()
