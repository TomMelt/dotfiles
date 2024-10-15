if !exists("g:ncdump_cmd")
    let ncdump_cmd= "ncdump -l 100"
endif

if !executable(substitute(ncdump_cmd,'\s\+.*$','',''))
    redraw!
    echohl Error | echo "***error*** sorry, your system doesn't appear to have the ".g:ncdump_cmd." program" | echohl None
endif

execute ":%!".ncdump_cmd." %"
redraw!
set readonly
