execute pathogen#infect()

syntax on
filetype plugin indent on
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

let mapleader=","
inoremap jk <esc>
nmap <silent> <leader>h :noh<CR>
nmap <silent> <leader>r :set rnu!<CR>
map <silent> <leader>sp :setlocal spell!<CR>
nnoremap <leader>o :NERDTreeToggle<CR>
"nnoremap <leader>; :Files<CR>
set pastetoggle=<leader>p

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Set 5 to the cursor when moving vertically
set so=5

" Turn on wild menu
set wildmenu
set wildmode=list:longest

" Enable title
set title

" Always show current position
set ruler

" Enable mouse
set mouse=a

" Line numbers
set number relativenumber

" Cursor
set cursorline

" Buffer becomes hidden when abandoned
set hid

" Configure backspace
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching, try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like a web browser
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when cursor is over them
set showmatch

" Get rid of error sounds
set noerrorbells novisualbell t_vb=

" UI config
set background=dark
colorscheme gruvbox

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \     'left': [ ['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component_function': { 'gitbranch': 'fugitive#head' }
\ }

let g:SuperTabCrMapping = 1

" Set utf8 as standard encoding
set encoding=utf-8

" Set unix as the standard file type
set ffs=unix,mac,dos

" Turn backup off
set nobackup nowb noswapfile

" Enable tab indents for makefiles
if has("autocmd")
    autocmd FileType make set tabstop=8 sw=8 sts=0 noexpandtab
endif

" Disable line wrap
set nowrap

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4 tabstop=4 softtabstop=4

" Auto indent
set autoindent

" Always show the status line
set laststatus=2

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Functions

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg=@"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' ")
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

