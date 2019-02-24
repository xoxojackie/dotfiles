
" --VUNDLE-----------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jacoborus/tender.vim'
Plugin 'arcticicestudio/nord-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"---\VUNDLE----------------------------------------------------------

let colorspace=256

colorscheme nord
syntax on

"---#airline options----------------------------------------
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections = 1
let g:airline_section_x = ''
let g:airline_section_b = ''

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ''

"---#end airline options------------------------------------

" don't show mode in status bar
set noshowmode

" show line numbers
set number

" higlight current line
set cursorline

" jj is escape
:imap jj <esc>
" semicolon is colon (for commands)
:nmap ; :
" ;; is ;, for f - next
:noremap ;; ;

" soft tabs, three spaces
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

" open with cursor in last position
if has("autocmd")
     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" some nord stuff
augroup nord
    autocmd!
    autocmd ColorScheme nord highlight shDerefSimple ctermfg=6 guifg=#88C0D0
    autocmd ColorScheme nord highlight shDerefVar ctermfg=6 guifg=#88C0D0
    autocmd ColorScheme nord highlight shVariable ctermfg=6 guifg=#88C0D0
augroup END

