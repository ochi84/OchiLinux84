"
"
"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
" (_)_/ |_|_| |_| |_|_|  \___|
"
" turn on syntax highlighting
syntax off

" Color settings
"set termguicolors

" Set color (you can get great colorschemes from https://github.com/jdpedersen1/dotfiles.git)
"source ~/.vim/colors/256_noir.vim 

highlight Search cterm=bold ctermfg=lightyellow ctermbg=NONE guifg=lightyellow guibg=NONE
highlight Visual cterm=bold ctermfg=lightyellow ctermbg=NONE guifg=lightyellow guibg=NONE 

" show line numbers
set number
highlight LineNr ctermfg=white
highlight CursorLineNr ctermfg=yellow

" show file stats
set ruler

" blink cursor on error instead of beeping (grr)
" set visualbell

" status bar
set laststatus=1 

" last line
set showmode
set showcmd

" ignore capital letters during search
set ignorecase

" search as characters are entered
set incsearch

" override the ignorecase option if searching for capital letters
set smartcase

" show matching words during a search
set showmatch

" use highlighting when doing a search
set hlsearch

" highlight matching parentheses / bracket [{()}]
set showmatch

" highlight current line
" set cursorline

" enable mouse interaction
set mouse=a

" Scrollen mit der Maus
set mouse=a
set scrolloff=8
set sidescrolloff=8

" Verbessertes Wrapping von Zeilen
set linebreak

" Bessere Bewegung zwischen Fenstern
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" Automatische Konvertierung von Tabs zu Leerzeichen
set expandtab

" Größe der Einrückung
set shiftwidth=4
set tabstop=4

" Smarteres Einrücken
set smartindent

" Start vim with nerdtree
"autocmd VimEnter * NERDTree

" PLUGINS
let g:airline_theme='angr'
let g:airline#extensions#whitespace#enabled = 0

" plugin vim-syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" plugin syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
