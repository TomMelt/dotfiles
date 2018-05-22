" ====================================================================
" ====================================================================

"    GENERAL VIM SETUP ADAPTED FROM: github.com/mcantor/no_plugins 

" ====================================================================
" ====================================================================

" OK but i need some plugins
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

if hostname() == "xps13"
	autocmd VimEnter * echo "vim with plugins"
	Plugin 'delimitMate.vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tmhedberg/SimpylFold'
	Plugin 'tpope/vim-fugitive'
	Plugin 'Valloric/YouCompleteMe'
else
	autocmd VimEnter * echo "no plugins"
endif

call vundle#end()            " required
filetype plugin indent on    " required
syntax on                    " enable syntax highlighting

" 0) General
" 1) Fuzzy File Search
" 2) Tag jumping
" 3) Autocomplete
" 4) File Browsing
" 5) Snippets
" 6) git specifics

" ==============================
" 0) General:
" ==============================

" enter the current millenium
set nocompatible

" default split right
set splitright

" jumping between splits
nnoremap <Left> <C-W><C-H>
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>

nnoremap <S-Left> <C-W>2<
nnoremap <S-Right> <C-W>2>

" code folding
set foldlevel=2
let g:SimpylFold_docstring_preview=1
nnoremap <Space>j zo
nnoremap <Space>k zc

" Turn on line numbers 
set relativenumber

" Show tabs/spaces and trailing space
set listchars=tab:▸\ ,trail:·
set list

" search options
set ignorecase smartcase hls incsearch
"
" to clear last used search pattern
nnoremap <F7> :let @/ = ""<CR>

" turn off indent when pasting
set pastetoggle=<F3>

" show current typed command
set showcmd

" savefile
nnoremap <Space><Space> :w<cr>

" switch ; and :
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

"use ubuntu clipboard
set clipboard=unnamedplus

"open vimrc from any vim filetype
nnoremap <F12> :vsplit ~/.vimrc<CR>

"keep text selected when changing indent in visual mode
vnoremap > >gv
vnoremap < <gv

" ==============================
" 1) Fuzzy File Search:
" ==============================

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" ==============================
" 2) Tag Jumping:
" ==============================

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" ==============================
" 3) Autocomplete!!! :
" ==============================

" The good stuff is documented in |ins-completion|

" custom stuff to work with YCM
let g:ycm_autoclose_preview_window_after_completion=1

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list


" ==============================
" 4) File Browsing:
" ==============================

" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
"let g:netrw_altv=1          " open splits to the right
"let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Easier buffer switching (when multiple files are open)
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" ==============================
" 5) Snippets:
" ==============================

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" ==============================
" 6) git specifics:
" ==============================

autocmd Filetype gitcommit setlocal spell textwidth=72


" ==============================
" 7) Colorscheme for vim diff
" ==============================

highlight DiffAdd cterm=none ctermfg=green ctermbg=black
highlight DiffDelete cterm=none ctermfg=darkred ctermbg=black
highlight DiffChange cterm=none ctermfg=none ctermbg=black
highlight DiffText cterm=none ctermfg=black ctermbg=darkyellow
