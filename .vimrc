" =============================================
"  ADAPTED FROM: github.com/mcantor/no_plugins
" =============================================

" PLUGINS: {{{1
"==============

set nocompatible     "  be iMproved, required
filetype off         "  required
set shell=/bin/bash  "  because I use fish in the terminal

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'delimitMate.vim'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'dag/vim-fish'

if hostname() == "niko" || hostname() == "shiba" || hostname() == "mogu"
	autocmd VimEnter * echo "YCM supported"
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'ervandew/supertab'
	Plugin 'lervag/vimtex'
	Plugin 'junegunn/fzf'
	Plugin 'junegunn/fzf.vim'
else
	autocmd VimEnter * echo "YCM not included"
endif

call vundle#end()          "  required
filetype plugin indent on  "  required
syntax on                  "  enable syntax highlighting

" GENERAL SETTINGS: {{{1
"=======================

set nocompatible                        "  enter the current millenium
let mapleader = "\\"                     "  set leader key
set nowrap
set background=dark                     "  colorscheme fix for tmux
set number                              "  Turn on line numbers
set listchars=tab:▸\ ,trail:·           "  Show tabs/spaces and trailing space
set list
set backspace=indent,eol,start          "  Fix backspace
set ignorecase smartcase hls incsearch  "  search options
set showcmd                             "  show current typed command
set clipboard=unnamedplus               "  access system clipboard

" savefile
nnoremap <Space><Space> :w<cr>
" switch ; and :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" switch * and #
nnoremap * #
nnoremap # *
" spellcheck
nnoremap <F6> :set spell!<CR>
" clear last used search pattern
nnoremap <F7> :let @/ =  ""<CR>
" toggle line numbers
nnoremap <F3> :call ChangeNumber()<CR>
" toggle paste mode
nnoremap <S-F3> :set paste!<CR>:set paste?<CR>
" open custom ftplugin files
nnoremap <F2> :call Customft()<CR>
" open vimrc from any vim filetype
nnoremap <F12> :vsplit ~/.vimrc<CR>
" move lines up/down in visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" change indent of lines
vnoremap > >gv
vnoremap < <gv
" navigate quickfix searches
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
" create tag file for project
command! MakeTags !ctags -R .
nnoremap <leader>t :silent! MakeTags<CR><C-l>
"source vimrc
nnoremap <leader>r :so /home/melt/.vimrc<CR>
" CTRL-P to fuzzy find files
nnoremap <C-p> :Files <CR>

" TMUX SETTINGS: {{{1
"====================

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set <S-F3>=[1;2R   " these allow me to use shift and fn keys in tmux
set <S-F8>=[19;2~

" TAB SETTINGS: {{{1
"===================

set splitright               "  default split right
set tabpagemax=100           "  increase max. no. of tabs
set switchbuf=usetab         "  if already open jump to tab
set switchbuf+=newtab        "  otherwise use new tab

                             "  navigate tabs using TAB
nnoremap <TAB> :tabn<CR>
nnoremap <S-TAB> :tabN<CR>
                             "  close current tab
nnoremap <F8> :bd<CR>
                             "  close all tabs
nnoremap <S-F8> :qa<CR>
                             "  moving between splits
nnoremap <Left> <C-W><C-H>
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
                             "  resizing splits
nnoremap <S-Left> <C-W>2<
nnoremap <S-Right> <C-W>2>
nnoremap <S-Down> <C-W>2+
nnoremap <S-Up> <C-W>2-

let g:fzf_action = {
			\ 'enter': 'tab split',
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-v': 'vsplit' }

" CODE FOLDS: {{{1
"=================

set foldlevel=2
let g:markdown_folding = 1
let g:SimpylFold_docstring_preview=1
nnoremap <Space>j zo
nnoremap <Space>k zc

" FUZZY FILE SEARCH: {{{1
"========================

set path+=** " recursice fuzzy search
set wildmenu " display all matches when tab completing

" AUTOCOMPLETE: {{{1
"===================

" custom stuff to work with YCM
let g:ycm_autoclose_preview_window_after_insertion=1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_python_binary_path = 'python3'
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NETRW: {{{1
"============

"let g:netrw_banner=0                            "  disable annoying banner
"let g:netrw_browse_split=4                      "  open in prior window
"let g:netrw_altv=1                              "  open splits to the right
"let g:netrw_liststyle=3                         "  tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" COLORS FOR VIMDIFF: {{{1
"=========================

highlight DiffAdd cterm=none ctermfg=green ctermbg=black
highlight DiffDelete cterm=none ctermfg=darkred ctermbg=black
highlight DiffChange cterm=none ctermfg=none ctermbg=black
highlight DiffText cterm=none ctermfg=black ctermbg=darkyellow

" CUSTOM FUNCTIONS: {{{1
"=======================

" loop through line number settings
function! ChangeNumber()
	if &relativenumber && !&number
		set relativenumber!
		set number
	elseif &number
		set number!
	elseif !&relativenumber
		set relativenumber
	endif
endfunction

" open ftplugin file for current buffer in vsplit (if it exists)
function! Customft()
	let myft = &filetype
	let path = '~/.vim/after/ftplugin/' . myft . '.vim'
	if myft == 'vim'
		execute 'q'
	elseif !empty(glob(path))
		execute 'vsplit ' . path
	else
		echom "error: custom ftplugin not found"
	endif
endfunction

" ULTISNIPS {{{1
"===============

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
