"*****************************************************************************
"" Vundle
"*****************************************************************************"
set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" alternatively, pass a path where Vundle should install plugins
"" call vundle#begin('~/some/path/here')

"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" fyi: https://github.com/pdf/ubuntu-mono-powerline-ttf
"" fyi: http://vim.wikia.com/wiki/256_colors_in_vim
"" fyi: Konsole > Edit Current Profile > Environment > xterm-256color
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"" disable rope, use YCM instead for auto-completion
Bundle 'klen/python-mode' 

"" need to compile YCM components (refer to the documentation)
Bundle 'Valloric/YouCompleteMe' 

Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" Powerline
let g:Powerline_symbols = "fancy"
set laststatus=2

"*****************************************************************************
"" python-mode (without rope -> substituted by YouCompleteMe)
"*****************************************************************************
"" Keys:
"" K             Show python docs
"" <Leader>r     Run python script
"" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"" [[            Jump on previous class or function (normal, visual, operator modes)
"" ]]            Jump on next class or function (normal, visual, operator modes)
"" [M            Jump on previous class or method (normal, visual, operator modes)
"" ]M            Jump on next class or method (normal, visual, operator modes)

"" Rope: 
"" <Ctrl-Space>  Rope autocomplete
"" <Ctrl-c>g     Rope goto definition
"" <Ctrl-c>d     Rope show documentation
"" <Ctrl-c>f     Rope find occurrences
let g:pymode_rope = 0 
let g:pymode_rope_complete_on_dot = 0

"" Documentation:
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"" Linting:
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_jump = 0
let g:pymode_lint_signs = 1
let g:pymode_lint_minheight = 3
let g:pymode_lint_maxheight = 6

"" Support virtualenv:
let g:pymode_virtualenv = 1

"" Enable breakpoints plugin:
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

"" syntax highlighting:
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"" Don't autofold code:
let g:pymode_folding = 0

"" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

"*****************************************************************************"
"" YouCompleteMe
"*****************************************************************************"

"" enables auto closing of the preview window when the user accepts the
"" offered completion string
let g:ycm_autoclose_preview_window_after_completion=1

"" <leader>g to go to the definition/declaration
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"*****************************************************************************"
"" UltiSnips
"*****************************************************************************"

"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"***************************************************************************** 
"" Basic Setup
"*****************************************************************************"

"" Encoding
"set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8

"" Show lines numbers
set number

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
"" Maybe superseded by ~/.vim/ftplugin/python.vim
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
"set incsearch
set ignorecase
set smartcase

"" <Leader> key timeout
set timeoutlen=500

"" Encoding
"set bomb
"set binary
set ttyfast
set lazyredraw

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

"" visual autocomplete for command menu
set wildmenu

"" highlight matching [{()}]
set showmatch

"" [VERY USEFUL] to facilitate pasting from an external application
set pastetoggle=<F2>

"" set the color of the line numbers
highlight LineNr ctermfg=grey

"*****************************************************************************
"" Functions
"*****************************************************************************

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" Enable filetypes
filetype on
filetype plugin on
filetype indent on

"" Automatically remove trailing whitespaces
autocmd FileType python,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"*****************************************************************************
"" Mappings
"*****************************************************************************
"" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" Exit from insert mode
inoremap <esc> <nop>
inoremap jk <esc>

"" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

"" Toggle the cheatsheet window
nnoremap h :execute "vsplit" "$HOME/.vim/vim_cheatsheet.txt"<cr>

"" Always maintain the cursor at the center of the screen
nnoremap j jzz
nnoremap k kzz

"" List search occurences
nnoremap l :g//p<cr>

"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
map <silent> <leader> :noh<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" zz - sleeps... closes current buffer
nnoremap zz ZZ

"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
map <silent> <leader> :noh<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Shift-b to move cursor to the beginning of line
nnoremap B ^

" Bracket matching
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
