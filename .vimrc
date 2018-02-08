" ====================================================================
" ====================================================================

"    GENERAL VIM SETUP ADAPTED FROM: github.com/mcantor/no_plugins 

" ====================================================================
" ====================================================================

" 0) General
" 1) Fuzzy File Search
" 2) Tag jumping
" 3) Autocomplete
" 4) File Browsing
" 5) Snippets
" 6) Build Integration (NOT USED ATM)
" 7) git specifics

" ==============================
" 0) General:
" ==============================

" enter the current millenium
set nocompatible

" Turn on line numbers 
set nu

" Show tabs/spaces and trailing space
set listchars=tab:▸\ ,trail:·
set list

" search options
set ignorecase smartcase hls incsearch
" to clear last used search pattern
nnoremap <F7> :let @/ = "" <cr>

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

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on

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
" 6) Build Integration: (NOT USED ATM)
" ==============================
" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
"set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" ==============================
" 7) git specifics:
" ==============================

autocmd Filetype gitcommit setlocal spell textwidth=72

