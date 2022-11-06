"run fortran script
nnoremap <buffer> <F5> :silent make<CR> :copen<CR>
nnoremap <buffer> <F6> :silent !make -C build/ <CR> <C-L> :copen<CR>

"debug fortran
"set makeprg=gfortran\ %:t\ -o\ %:t:r
set makeprg=make\ -C\ ./build/
setlocal errorformat=%E%f:%l:%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
setlocal efm+=%-G%.%# " All lines not matching any of the above patterns are ignored

"comment
set commentstring=!\ %s
set fo+=j
set comments^=:!>

let fortran_fold=1
set foldmethod=manual
let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_have_tabs=0

set expandtab
set tabstop=2
set shiftwidth=2

set textwidth=132

" do not use fixed source
let fortran_fixed_source = 0

if (b:fortran_fixed_source != 1)
	setlocal indentexpr=SebuFortranGetFreeIndent()
	setlocal indentkeys+==~subroutine,=~function,=~forall
	setlocal indentkeys+==~endsubroutine,=~endfunction,=~endforall
	" Only define the functions once
	if exists("*SebuFortranGetFreeIndent")
		finish
	endif
else
	finish
endif


" SebuFortranGetFreeIndent() is modified FortranGetFreeIndent():
" Returns the indentation of the current line
function SebuFortranGetFreeIndent()
	" No indentation for preprocessor instructions
	if getline(v:lnum) =~ '^\s*#'
		return 0
	endif
	" Previous non-blank non-preprocessor line
	let lnum = SebuPrevNonBlankNonCPP(v:lnum-1)
	" No indentation at the top of the file
	if lnum == 0
		return 0
	endif
	" Original indentation rules
	let ind = FortranGetIndent(lnum)
	" Continued statement indentation rule
	" Truth table (kind of)
	" Symbol '&'			|	Result
	" No			0	0	|	0	No change
	" Appearing		0	1	|	1	Indent
	" Disappering	1	0	|	-1	Unindent
	" Continued		1	1	|	0	No change
	let result = -SebuIsFortranContStat(lnum-1)+SebuIsFortranContStat(lnum)
	" One shiftwidth indentation for continued statements
	let ind += result*&sw
	" One shiftwidth indentation for subroutine, function and forall's bodies
	let line = getline(lnum)
	if line =~? '^\s*\(\(recursive\s*\)\=pure\|elemental\)\=\s*subroutine'
				\ || line =~? '^\s*\(\(recursive\s*\)\=pure\|elemental\)\=\s*'
				\ . '\(\(integer\|real\|complex\|logical\|character\|type\)'
				\ . '\((\S\+)\)\=\)\=\s*function'
				\ || line =~? '^\s*\(forall\)'
		let ind += &sw
	endif
	if getline(v:lnum) =~? '^\s*end\s*\(subroutine\|function\|forall\)'
		let ind -= &sw
	endif
	" You shouldn't use variable names begining with 'puresubroutine',
	" 'function', 'endforall', etc. as these would make the indentation
	" collapse: it's easier to pay attention than to implement the exceptions
	return ind
endfunction

" SebuPrevNonBlankNonCPP(lnum) is modified prevnonblank(lnum):
" Returns the line number of the first line at or above 'lnum' that is
" neither blank nor preprocessor instruction.
function SebuPrevNonBlankNonCPP(lnum)
	let lnum = prevnonblank(a:lnum)
	while getline(lnum) =~ '^#'
		let lnum = prevnonblank(lnum-1)
	endwhile
	return lnum
endfunction

" SebuIsFortranContStat(lnum):
" Returns 1 if the 'lnum' statement ends with the Fortran continue mark '&'
" and 0 else.
function SebuIsFortranContStat(lnum)
	let line = getline(a:lnum)
	return substitute(line,'!.*$','','') =~ '&\s*$'
endfunction
