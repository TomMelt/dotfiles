"Compile pdfLatex
nnoremap <buffer> <F5> :w<CR> :silent !pdflatex "%"<CR> :redraw!<CR>
inoremap <buffer> <F5> <Esc>:w<CR> :silent !pdflatex "%"<CR> :redraw!<CR>

"Compile pdfLatex with BibTex
nnoremap <buffer> <F4> :w<CR> :silent !pdflatex "%"<CR> :silent !bibtex "%:r"<CR> :silent !pdflatex "%"<CR> :silent !pdflatex "%"<CR> :redraw!<CR>
inoremap <buffer> <F4> <Esc>:w<CR> :silent !pdflatex "%"<CR> :silent !bibtex "%:r"<CR> :silent !pdflatex "%"<CR> :silent !pdflatex "%"<CR> :redraw!<CR>

"Spell-check set to F6
nnoremap <buffer> <F6> :setlocal spell! spelllang=en_us<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for latex enviroments
inoremap <buffer> ;s \section{}<Esc>i
inoremap <buffer> ;ss \subsection{}<Esc>i
inoremap <buffer> ;sss \subsubsection{}<Esc>i
inoremap <buffer> ;np \newpage<Esc>o

inoremap <buffer> ;fig \begin{figure}[h(<>)]<CR>\begin{center}<CR>\includegraphics[width=(<>)\textwidth]{./figs/(<>)}<CR>\end{center}<CR>\caption{\textbf{(<>)}. (<>).}<CR>\label{fig_(<>)}<CR>\end{figure}<Esc>/(<>)<CR>ca(

"References and Citations
inoremap <buffer> ;rf \ref{fig_} (<>)<Esc>F_a
inoremap <buffer> ;rt \ref{tab_} (<>)<Esc>F_a
inoremap <buffer> ;ci <Esc>ciw\cite{} (<>)<Esc>F{pa<C-X><C-]>

"Format text
inoremap <buffer> ;em \emph{}<Esc>i
inoremap <buffer> ;bf \textbf{}<Esc>i
inoremap <buffer> ;tt \texttt{}<Esc>i
inoremap <buffer> ;ma $$<Esc>i
inoremap <buffer> ;mm $\mathrm{}$<Esc>hi

"Equations
inoremap <buffer> ;be \begin{align}<CR>(<>)<CR>\end{align}<Esc>/(<>)<CR>ca(
inoremap <buffer> ;fr \frac{(<>)}{(<>)}<Esc>/(<>)<CR>ca(
inoremap <buffer> ;u ^{}<Esc>i
inoremap <buffer> ;d _{}<Esc>i

"Visual remaps
vnoremap <buffer> ;bf c\textbf{}<Esc>hp
vnoremap <buffer> ;tt c\texttt{}<Esc>hp
vnoremap <buffer> ;em c\emph{}<Esc>hp

vnoremap <buffer> ;ft "sc\midrule<CR><C-R>s<BS><BS> \\<CR><BS>\bottomrule<Esc>/My<CR>ci{\textbf{(<>)}. (<>).<Esc>/my<CR>ci{tab_(<>)<Esc>?table<CR>f]ih<Esc>/begin<CR>o\toprule<Esc>
