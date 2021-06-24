execute pathogen#infect()
syntax on
filetype plugin indent on
let mapleader = ","
inoremap jk <esc>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>c :ColorToggle<CR>
set pastetoggle=<leader>p
set clipboard+=unnamed

set nocompatible
set mouse=a
set number
set relativenumber
set showcmd
set hidden

set wildmenu
set wildmode=list:longest
set ttyfast
set lazyredraw
set showmatch

set incsearch
set hlsearch
set smartcase
set encoding=utf-8
set cursorline
highlight clear Cursorline
highlight CursorLineNR ctermbg=Blue
set laststatus=2

set nowrap
set wrapmargin=5
set autoindent expandtab ts=4 sw=4 sts=4
set backspace=indent,eol,start

set title
set noswapfile
set ruler
set t_ut=
if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
	\ 'colorscheme': 'one',
    \ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

autocmd! GUIEnter * set vb t_vb=
set background=dark
set t_RB=
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = '256'
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_underline = '1'
let g:gruvbox_hls_cursor = 'orange'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_italicize_strings = '1'

let g:SuperTabCrMapping = 1
