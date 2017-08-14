" necessary for pathogen plugin manager
execute pathogen#infect()

" GENERAL CONFIG **************************************************************************************************
set nocompatible          "not compatible with vi
set incsearch             "Incremental search
set hlsearch
syntax on                 "allow colorize filetype and indent it
set number                "show number lines in files
filetype plugin on
filetype plugin indent on "auto indent for filetype
set omnifunc=syntaxcomplete#Complete "activate automcomplete
set t_Co=256              "256 color mode
"colorscheme badwolf	  "color scheme
colorscheme jellybeans	  "color scheme
set encoding=utf-8        "Encoding UTF8
set fileencoding=utf8     "Unicode man
set fileformat=unix       "LF Unix style

let mapleader = "\<Space>" "Use space as leader key

set ls=2                  "Always show status line in all windows
set autoindent            "Auto indent on new line
set expandtab             "tabs to spaces
set shiftwidth=2          "Autodindent to 2 spaces width
set softtabstop=2         "Autodindent to 2 spaces widt
set scrolloff=10          "Start scrolling when 10 lines close to the bottom
set ruler                 "Shows current file position
set statusline=%<%f\ %h%m%y%r%=%-14.(%l,%c%V%)\ %P
set novisualbell          "Don't shake the screen
set ttyfast               "Smoother display for fast terminals
set hidden                "Don't close buffers when changing files
set foldmethod=indent     "Fold method indent
set foldlevel=20          "Level of folding
set nowrap                "no wrap

set backspace=indent,eol,start "Allow backspacing over tabs end of lines and start of insert
set wildmenu              "as above
set wildmode=longest:full,full "Better tab completion of filenames (like bash)
set re=1

set noswapfile
set backupdir=~/.vim/tmp/  "Store backups in same dir
"set directory=~/.vim/tmp/  "Store swps in same dir
let g:yankring_history_dir = '~/.vim/tmp' " Get yankring out of the way

" <F2> SET PASTE TOGGLE **************************************************************************************************
set pastetoggle=<F2>
set showmode

" vim Airline (status bar) ***********************************************************************************************"
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'



" KEY MAPPINGS **************************************************************************************************
" disable F1 for show help, we can show it with :help
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


" Helpful commands
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
  command! -bang WQ wq<bang>
  command! -bang Wq wq<bang>
  command! -bang W w<bang>
  command! -bang Q q<bang>
  command! -bang Qa qa<bang>
  command! -bang WA wa<bang>
  command! -bang Wa wa<bang>
endif
"Disabling Ex mode
:map Q <Nop>
"Emacs indenting
map <Tab> ==

" brackets maximises and minimises windows
if bufwinnr(1)
  map [ <C-W>=
  map ] <C-W>_
  map <F10> <C-W>_
  map <F11> <C-W>=
  map <F8> <C-W>-
  map <F9> <C-W>+
  map <F6> <C-W><
  map <F7> <C-W>>
  map <F1> :wa<CR>
endif

" CUSTOM FILETYPES **************************************************************************************************
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead *.erb set filetype=eruby
au BufNewFile,BufRead *.ui set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby
autocmd FileType qf setlocal wrap

" NERDTree **************************************************************************************************
map <c-T> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeShowFiles=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 35
let g:NERDTreeCascadeOpenSingleChildDir=0

" NERDComment **************************************************************************************************
vmap gc <leader>ci
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

" CtrlP plugin config **************************************************************************************************
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = ''

" TagBar plugin config
map <F3> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1

" Trailing whitespaces **************************************************************************************************
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Config Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'
let g:syntastic_aggregate_errors = 1
map <F5> :lclose<CR>


" Lines highlighting *******************************************************************************************************
" Only highlight current window
function SetLinesDefault()
  hi CursorLine   cterm=NONE ctermbg=124
  hi CursorColumn cterm=NONE ctermbg=124
endfunction

function SetLinesHighlight()
  hi CursorLine   cterm=NONE ctermbg=22 ctermfg=15
  hi CursorColumn cterm=NONE ctermbg=22 ctermfg=15
endfunction

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorline
  au WinLeave * setlocal nocursorcolumn
augroup END

hi clear CursorColumn
call SetLinesDefault()
autocmd InsertEnter * call SetLinesHighlight()
autocmd InsertLeave * call SetLinesDefault()
hi LineNr ctermfg=237 ctermbg=233
hi Visual term=bold cterm=italic
hi StatusLine ctermfg=19 ctermbg=15
