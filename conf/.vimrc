"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Show line numbers
set number

" Highlight all occurrences of a search
set hlsearch

" Prevent Pydoc preview window
set completeopt-=preview

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" spelling-checking. Only want spell checking on certain filetypes.
" Not code
au BufNewFile,BufRead,BufEnter *.html setlocal spell spelllang=en_us
au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_us

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256

" Enable syntax highlighting
syntax enable
"colorscheme github
colorscheme nazca
"set background=dark

set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent      " fold based on indent
set foldnestmax=10         " deepest fold is 10 levels
set nofoldenable           " don't fold by default
set foldlevel=1
" toggle folding with space bar....nicccce
nnoremap <space> za
vnoremap <space> zf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use spaces instead of tabs
set expandtab

" " Be smart when using tabs ;)
set smarttab

" Show invisible spaces
set list

" set invisible characters...not digging defaults
set listchars=tab:>-,eol:⌉

" " 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" " Linebreak on 500 characters
set lbr
set tw=500

" tab navigation like firefox
nnoremap <C-n>     :tabnew<CR>
inoremap <C-n>     <Esc>:tabnew<CR>

" Previous tab
nnoremap <C-o> :tabp<CR>
inoremap <C-o> <Esc>:tabp<CR>

" Next tab
nnoremap <C-p> :tabn<CR>
inoremap <C-p> <Esc>:tabn<CR>

"autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd BufEnter * nested :call tagbar#autoopen(0)
" move tagbar to left
let g:tagbar_left = 1


"Change zen coding plugin expansion key to ctrl + e
let g:user_zen_expandabbr_key = '<C-e>'

" Pathogen
execute pathogen#infect()

" git blame
vmap b :!git blame =expand("%:p")  \| sed -n =line("',=line("'>") p

" SASS plugin
" au BufRead,BufNewFile *.scss set filetype=scss

"let g:vdebug_options = {}
"let g:vdebug_options["port"] = 9000


