" =============================================
"  ADAPTED FROM: github.com/mcantor/no_plugins
" =============================================

" PLUGINS: {{{1
"==============

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'tmhedberg/SimpylFold'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'yegappan/lsp'
"Plug 'lervag/vimtex'

call plug#end()          " Automatically executes filetype plugin indent on and syntax enable

" GENERAL SETTINGS: {{{1
"=======================

set nocompatible                        "  enter the current millenium
let mapleader = "\\"                    "  set leader key
set nowrap
set background=dark                     "  colorscheme fix for tmux
set number                              "  Turn on line numbers
set listchars=tab:▸\ ,trail:·           "  Show tabs/spaces and trailing space
set list
set backspace=indent,eol,start          "  Fix backspace
set ignorecase smartcase hls incsearch  "  search options
set showcmd                             "  show current typed command
set clipboard=unnamedplus               "  access system clipboard

let g:tex_flavor = 'latex'

set nojoinspaces
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
set spelllang=en_gb
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

" navigate jump list
" need to remap TAB before it is used for changing tabs
nnoremap ]j <TAB>
nnoremap [j <C-o>
" create tag file for project
command! MakeTags !ctags -R .
nnoremap <leader>t :silent! MakeTags<CR><C-l>
"source vimrc
nnoremap <leader>R :so ~/.vimrc<CR>
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

nnoremap <TAB> :tabn<CR><C-g>
nnoremap <S-TAB> :tabN<CR><C-g>
"
"  close current tab
nnoremap <F8> :bd<CR>
"  close all tabs
nnoremap <S-F8> :qa<CR>

"  open tag in new tab
nnoremap <C-W><C-T> <C-W>]<C-W>T<C-G>

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
" Word completion with custom spec with popup layout option
" inoremap <expr> <C-k> fzf#vim#complete(fzf#wrap({ 'source': uniq(sort(split(join(getline(1,'$'),"\n"),'\W\+')))}))

" CODE FOLDS: {{{1
"=================

set foldlevel=10
let g:markdown_folding = 1
let g:SimpylFold_docstring_preview=1
nnoremap <Space>j zo
nnoremap <Space>k zc

" FUZZY FILE SEARCH: {{{1
"========================

set path+=** " recursice fuzzy search
set wildmenu " display all matches when tab completing

" SUPERTAB: {{{1
"===================
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

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
    execute 'vsplit ' . path
endfunction

" ULTISNIPS: {{{1
"================

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" SPLITJOIN: {{{1
"================

let g:splitjoin_python_brackets_on_separate_lines = 1
let g:splitjoin_trailing_comma = 1

au BufRead,BufNewFile *.fypp set filetype=fortran
au BufRead,BufNewFile *.nc set filetype=nc | set syn=cdl

" LSP: {{{1
"================
			" \ name: 'clang',
			" \ filetype: ['c', 'cpp'],
			" \ path: '/usr/local/bin/clangd',
			" \ args: ['--background-index']
			" \ },

let lspServers = [#{
			\ name: 'clang',
			\ filetype: ['c', 'cpp'],
			\ path: '/usr/bin/clangd',
			\ args: ['--background-index']
			\ },
			\ #{
			\ name: 'pylsp',
			\ filetype: 'python',
			\ path: '/home/melt/miniconda3/envs/pylsp/bin/pylsp',
			\ args: [],
			\ },
			\ #{
			\ name: 'fortls',
			\ filetype: 'fortran',
			\ path: '/home/melt/miniconda3/envs/fortls/bin/fortls',
			\ args: ['--hover_language', 'fortran', '--lowercase_intrinsics', '--notify_init', '--hover_signature', '--use_signature_help'],
			\ }]
autocmd VimEnter * call LspAddServer(lspServers)


let lspOpts = #{autoHighlightDiags: v:true}
autocmd VimEnter * call LspOptionsSet(lspOpts)

nnoremap <leader>D <cmd>LspDocumentSymbol<CR>
nnoremap <leader>H <cmd>LspSwitchSourceHeader<CR>
nnoremap <leader>d <cmd>tab LspGotoDefinition<CR>
nnoremap <leader>r <cmd>LspRename<CR>
nnoremap <leader>h <cmd>LspHover<CR>
nnoremap <leader>s <cmd>LspShowReferences<CR>
" nnoremap <leader>c <cmd>LspDiag current<CR>

nnoremap ]w <cmd>LspDiag next<CR>
nnoremap [w <cmd>LspDiag prev<CR>
nnoremap ]e <cmd>lnext<CR>
nnoremap [e <cmd>lprev<CR>
