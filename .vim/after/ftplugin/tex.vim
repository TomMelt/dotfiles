"better indenting
setlocal expandtab shiftwidth=2 tabstop=2

set textwidth=100

let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

"Compile pdfLatex
setlocal efm=%f:%l:\ %m
setlocal efm+=%-G%.%#                      " All lines not matching any of the above patterns are ignored

setlocal makeprg=rubber\ --warn\ all\ -n\ -1\ --pdf\ %
nnoremap <buffer> <F5> :w<CR> :make!<CR><C-w><Up> :copen<CR>

"Compile pdfLatex with BibTex
nnoremap <buffer> <F4> :w<CR> :silent !rubber --clean % <CR><C-L>

"comment
vnoremap <buffer> <leader>c :norm i%<CR>
vnoremap <buffer> <leader>x :norm x<CR>

"update tags file for latex
inoremap <buffer> <leader>bi <Esc>:!ctags -R library.bib<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for latex enviroments
inoremap <buffer> <leader>np \newpage<Esc>o

inoremap <buffer> <leader>fig \begin{figure}[h(<>)]<CR>\begin{center}<CR>\includegraphics[width=(<>)\textwidth]{./figs/(<>)}<CR>\end{center}<CR>\caption{\textbf{(<>)}. (<>).}<CR>\label{fig_(<>)}<CR>\end{figure}<Esc>6?(<>)<CR>ca(

"References and Citations
inoremap <buffer> <leader>rf Fig. \ref{fig_} (<>)<Esc>F_a
inoremap <buffer> <leader>rt Table \ref{tab_} (<>)<Esc>F_a
inoremap <buffer> <leader>re Eq. \ref{eq_} (<>)<Esc>F_a
inoremap <buffer> <leader>ci <Esc>ciw\cite{} (<>)<Esc>F{pa<C-X><C-]>

"Format text
inoremap <buffer> <leader>ma $$<Esc>i
inoremap <buffer> <leader>mm $\mathrm{}$<Esc>hi

"Equations
inoremap <buffer> \q \quad
inoremap <buffer> <leader>be \begin{align}<CR>(<>)<CR>\end{align}<Esc>/(<>)<CR>ca(
inoremap <buffer> <leader>fr \frac{(<>)}{(<>)}<Esc>/(<>)<CR>ca(
inoremap <buffer> <leader>u ^{}<Esc>i
inoremap <buffer> <leader>d _{}<Esc>i
inoremap <buffer> <leader>do \dot{}<Esc>i
vnoremap <buffer> <leader>u c^{<C-R>+}
vnoremap <buffer> <leader>d c_{<C-R>+}
vnoremap <buffer> <leader>do c\dot{<C-R>+}

"Visual remaps
vnoremap <buffer> <leader>mr c\mathrm{}<Esc>hp
vnoremap <buffer> <leader>mm c$\mathrm{}$<Esc>2hp

vnoremap <buffer> <leader>ft "sc\midrule<CR><C-R>s<BS><BS> \\<CR><BS>\bottomrule<Esc>/My<CR>ci{\textbf{(<>)}. (<>).<Esc>/my<CR>ci{tab_(<>)<Esc>?table<CR>f]ih<Esc>/begin<CR>o\toprule<Esc>

"move in latex docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk
