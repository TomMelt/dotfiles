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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" do not require save before switching buffer
set hidden

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
nnoremap <C-o> :Buffers <CR>

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
" set tabpagemax=100           "  increase max. no. of tabs
" set switchbuf=usetab         "  if already open jump to tab
" set switchbuf+=newtab        "  otherwise use new tab

nnoremap <TAB> :bn<CR><C-g>
nnoremap <S-TAB> :bN<CR><C-g>
"
"  close current tab
nnoremap <F8> :bd<CR>
"  close all tabs
nnoremap <S-F8> :qa<CR>

"  open tag in new tab
" nnoremap <C-W><C-T> <C-W>]<C-W>T<C-G>

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
au BufRead,BufNewFile *.mdb set filetype=mdb
au BufRead,BufNewFile *.nc set filetype=nc | set syn=cdl

" LSP: {{{1
"================

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [w <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]w <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
" nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
" xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
" nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap ]e <cmd>lnext<CR>
nnoremap [e <cmd>lprev<CR>

" mutli-cursor alternative replace
nnoremap <silent> <C-q> :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> <C-q> "sy:let @/=@s<CR>cgn
