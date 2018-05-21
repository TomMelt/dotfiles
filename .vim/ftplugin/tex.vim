"open ftplugin file for python in split
nnoremap <buffer> <F2> :vsplit ~/.vim/ftplugin/tex.vim<CR>

"Set local leader for latex files
let maplocalleader = ";"

"Compile pdfLatex
nnoremap <buffer> <F5> :w<CR> :!clear<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> <C-L> 2h
inoremap <buffer> <F5> <Esc>:w<CR> :!clear<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> <C-L> hi

"Compile pdfLatex with BibTex
nnoremap <buffer> <F4> :w<CR> :!pdflatex "%" > /dev/null<CR> :!clear<CR> :!bibtex "%:r" <Bar> grep -i -e warning -e error<CR> :!pdflatex "%" > /dev/null<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> :redraw!<CR> 2h
inoremap <buffer> <F4> <Esc>:w<CR> :!pdflatex "%" > /dev/null<CR> :!clear<CR> :!bibtex "%:r" <Bar> grep -i -e warning -e error<CR> :!pdflatex "%" > /dev/null<CR> :!pdflatex "%" <Bar> grep -i -e warning -e error<CR> :redraw!<CR> hi

"Spell-check set to F6
nnoremap <buffer> <F6> :setlocal spell! spelllang=en_us<CR>

"Jump to marker (<>)
nnoremap <buffer> // /(<>)<CR>ca(
inoremap <buffer> // <Esc>/(<>)<CR>ca(

"Useful macros for latex enviroments
inoremap <buffer> <localleader>s \section{}<Esc>i
inoremap <buffer> <localleader>ss \subsection{}<Esc>i
inoremap <buffer> <localleader>sss \subsubsection{}<Esc>i
inoremap <buffer> <localleader>np \newpage<Esc>o

inoremap <buffer> <localleader>fig \begin{figure}[h(<>)]<CR>\begin{center}<CR>\includegraphics[width=(<>)\textwidth]{./figs/(<>)}<CR>\end{center}<CR>\caption{\textbf{(<>)}. (<>).}<CR>\label{fig_(<>)}<CR>\end{figure}<Esc>6?(<>)<CR>ca(
inoremap <buffer> <localleader>it \begin{itemize}<CR>\end{itemize}<Esc>O\item 
inoremap <buffer> <localleader>en \begin{enumerate}<CR>\end{enumerate}<Esc>O\item 
inoremap <buffer> <localleader>ce \begin{center}<CR>\end{center}<Esc>O

"References and Citations
inoremap <buffer> <localleader>rf Fig. \ref{fig_} (<>)<Esc>F_a
inoremap <buffer> <localleader>rt \ref{tab_} (<>)<Esc>F_a
inoremap <buffer> <localleader>ci <Esc>ciw\cite{} (<>)<Esc>F{pa<C-X><C-]>

"Format text
inoremap <buffer> <localleader>em \emph{}<Esc>i
inoremap <buffer> <localleader>bf \textbf{}<Esc>i
inoremap <buffer> <localleader>tt \texttt{}<Esc>i
inoremap <buffer> <localleader>ma $$<Esc>i
inoremap <buffer> <localleader>mm $\mathrm{}$<Esc>hi

"Equations
inoremap <buffer> <localleader>be \begin{align}<CR>(<>)<CR>\end{align}<Esc>/(<>)<CR>ca(
inoremap <buffer> <localleader>fr \frac{(<>)}{(<>)}<Esc>/(<>)<CR>ca(
inoremap <buffer> <localleader>u ^{}<Esc>i
inoremap <buffer> <localleader>d _{}<Esc>i

"Visual remaps
vnoremap <buffer> <localleader>bf c\textbf{}<Esc>hp
vnoremap <buffer> <localleader>tt c\texttt{}<Esc>hp
vnoremap <buffer> <localleader>em c\emph{}<Esc>hp
vnoremap <buffer> <localleader>mm c$\mathrm{}$<Esc>2hp

vnoremap <buffer> <localleader>ft "sc\midrule<CR><C-R>s<BS><BS> \\<CR><BS>\bottomrule<Esc>/My<CR>ci{\textbf{(<>)}. (<>).<Esc>/my<CR>ci{tab_(<>)<Esc>?table<CR>f]ih<Esc>/begin<CR>o\toprule<Esc>

"move in latex docs
nnoremap <buffer> j gj
nnoremap <buffer> k gk

