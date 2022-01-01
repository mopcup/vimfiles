set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'thinca/vim-quickrun'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
call plug#end()

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

set backupdir=$HOME/.vim/_tmp
set directory=$HOME/.vim/_tmp

nnoremap <ESC><ESC> :nohl<CR>
set incsearch
set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start
set clipboard+=unnamed

set number
set title
set showmatch

set belloff=all
set helplang=ja

set splitbelow
set splitright

function! ImActivate(active)
	if !a:active
		call system('fcitx-remote -c')
	endif
endfunction
set imactivatefunc=ImActivate

function! ImStatus()
	return system('fcitx-remote')[0] is# '2'
endfunction
set imstatusfunc=ImStatus

set t_Co=256
set termguicolors
syntax enable
colorscheme tokyonight
let g:airline_theme = 'tokyonight'

set ttimeoutlen=50
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
			\ '0': '0 ',
			\ '1': '1 ',
			\ '2': '2 ',
			\ '3': '3 ',
			\ '4': '4 ',
			\ '5': '5 ',
			\ '6': '6 ',
			\ '7': '7 ',
			\ '8': '8 ',
			\ '9': '9 '
			\}
let g:airline_mode_map = {
			\ 'n'  : 'Normal',
			\ 'i'  : 'Insert',
			\ 'R'  : 'Replace',
			\ 'c'  : 'Command',
			\ 'v'  : 'Visual',
			\ 'V'  : 'V-Line',
			\ '⌃V' : 'V-Block',
			\ }

let g:airline#extensions#default#layout = [
			\ [ 'a', 'b', 'c' ],
			\ ['z']
			\ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#hunks#non_zero_only = 1 
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

nnoremap <silent><leader>r :QuickRun -mode n<CR>
vnoremap <silent><leader>r :QuickRun -mode v<CR>
let g:quickrun_config = {}
let g:quickrun_config._ = {
    \ 'outputter/error/success': 'buffer',
    \ 'outputter/error/error': 'quickfix',
    \ 'outputter/quickfix/open_cmd': 'copen',
    \ 'runner': 'vimproc',
    \ 'runner/vimproc/updatetime': 60,
    \ 'hook/time/enable': 1
		\ }
