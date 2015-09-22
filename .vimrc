"*************************************************************************** "" Vundle
"***************************************************************************"
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
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"" disable rope, use YCM instead for auto-completion
Plugin 'klen/python-mode'

"" need to compile YCM components (refer to the documentation)
Plugin 'Valloric/YouCompleteMe'

"" code snipplets
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"" Ctrl-p fuzzy file finder
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'

"" ack (an alternative of grep)
Plugin 'mileszs/ack.vim'

"" auto-detect project root directory
Plugin 'airblade/vim-rooter'

"" colorscheme
Plugin 'crusoexia/vim-monokai'

"" source project-specific vimrc, name: .local.vimrc
Plugin 'thinca/vim-localrc'

"" git integration
Plugin 'tpope/vim-fugitive'

"" bookmarks and annotations (for code review)
Plugin 'MattesGroeger/vim-bookmarks'

"" personal diary
Plugin 'vimwiki/vimwiki'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"***************************************************************************
"" Powerline
"***************************************************************************
let g:Powerline_symbols = "fancy"
set laststatus=2

"***************************************************************************
"" Python-mode
"***************************************************************************
"" Keys:
"" K           Show python docs
"" <Leader>r   Run python script
"" <Leader>b   Set, unset breakpoint (g:pymode_breakpoint enabled)
"" [[          Jump on previous class or function (normal, visual, operator modes)
"" ]]          Jump on next class or function (normal, visual, operator modes)
"" [M          Jump on previous class or method (normal, visual, operator modes)
"" ]M          Jump on next class or method (normal, visual, operator modes)

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

"" Syntax highlighting:
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"" Don't autofold code:
let g:pymode_folding = 0

"" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

"***************************************************************************"
"" You Complete Me
"***************************************************************************"
"" enables auto closing of the preview window when the user accepts the
"" offered completion string
let g:ycm_autoclose_preview_window_after_completion=1

"" <leader>g to go to the definition/declaration
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"***************************************************************************"
"" UltiSnips
"***************************************************************************"
"" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"***************************************************************************"
"" Ctrl-P
"***************************************************************************"
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"" file listing
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor -g ""'
  \ }

"" speed up
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"***************************************************************************
"" ack (alternative for grep)
"***************************************************************************"
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " override to use ag over grep
  let g:ackprg = 'ag'
endif

"***************************************************************************
"" fugitive
"***************************************************************************
" operate on individual buffer

"" git log
noremap <Leader>gl :silent! Glog --oneline --all --decorate --graph<CR>:bot copen<CR>

" git add or stage the file to the index
noremap <Leader>ga :Gwrite<CR>

" revert the state of the file to the last commit
noremap <Leader>gr :Gread<CR>

"" git status
noremap <Leader>gs :Gstatus<CR>

noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gps :Gpush<CR>
noremap <Leader>gpl :Gpull --rebase<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>

"" and many more..

"***************************************************************************
"" Basic Setup
"***************************************************************************"
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
"set incsearch
set hlsearch
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

"***************************************************************************
"" Visual Settings
"***************************************************************************
syntax on
set ruler
set number

"" colorscheme
colorscheme monokai

"" visual autocomplete for command menu
set wildmenu

"" highlight matching [{()}]
set showmatch

"" [VERY USEFUL] to facilitate pasting from an external application
set pastetoggle=<F2>

"" always keep the cursor centered
set scrolloff=999

"" set the color of the line numbers
highlight LineNr ctermfg=grey

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" for faster line navigation
if v:version >= 703
    set relativenumber
endif

"***************************************************************************
"" Functions
"***************************************************************************

"***************************************************************************
"" Autocmd Rules
"***************************************************************************
"" Enable filetypes
filetype on
filetype plugin on
filetype indent on

"" Automatically remove trailing whitespaces
autocmd FileType vim,text,python,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

"***************************************************************************
"" Mappings
"***************************************************************************
"" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"" Exit from insert mode
inoremap <esc> <nop>
inoremap jk <esc>

"" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"" Toggle the cheatsheet window
nnoremap h :execute "vsplit" "$HOME/CONFIG/vim_cheatsheet.txt"<cr>

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

"" map // to grep (Ag) -> vs. /
nnoremap // :Ack!<Space>
