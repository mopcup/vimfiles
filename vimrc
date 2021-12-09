
call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-airline/vim-airline'
call plug#end()

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

set backupdir=$HOME/.vim/_tmp
set directory=$HOME/.vim/_tmp

set incsearch
set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set clipboard=unnamed

set number
set title
set showmatch

set belloff=all

set tabstop=4
set shiftwidth=4

set helplang=ja

function! ImActivate(active)
	if a:active
		call system('fcitx-remote -o')
	else
		call system('fcitx-remote -c')
	endif
endfunction
set imactivatefunc=ImActivate

function! ImStatus()
  return system('fcitx-remote')[0] is# '2'
endfunction
set imstatusfunc=ImStatus

set t_Co=256
syntax enable
colorscheme tokyonight
let g:airline_theme = 'tokyonight'

set ttimeoutlen=50
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
