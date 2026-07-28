" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Vundle setup

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-autoformat/vim-autoformat'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'github/copilot.vim'
" Plugin 'DanBradbury/copilot-chat.vim'
" Plugin 'fcpg/vim-farout'
Plugin 'vim-scripts/loremipsum'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""" Personal setup """"""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

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

" Set regular expression engine automatically
set regexpengine=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Python
" Follow https://realpython.com/vim-and-python-a-match-made-in-heaven/
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufNewFile,BufRead *.py
            \ | setlocal tabstop=4
            \ | setlocal softtabstop=4
            \ | setlocal shiftwidth=4
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix
            \ | setlocal encoding=utf-8

au FileType typescriptreact,javascriptreact 
            \ | setlocal tabstop=2
            \ | setlocal softtabstop=2
            \ | setlocal shiftwidth=2
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix
            \ | setlocal encoding=utf-8

au FileType css
            \ | setlocal tabstop=2
            \ | setlocal softtabstop=2
            \ | setlocal shiftwidth=2
            \ | setlocal expandtab
            \ | setlocal autoindent
            \ | setlocal fileformat=unix
            \ | setlocal encoding=utf-8

noremap <F3> :Autoformat<CR>
noremap <C-S-i> :!npx prettier % --write<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cosmetics and stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

color default

" show line numbers
set relativenumber number
highlight LineNr ctermfg=DarkGrey

set cursorline
highlight! link CursorLine Normal
highlight CursorLine ctermul=darkgrey
highlight CursorLineNr guifg=#fabd2f guibg=#3c3836 ctermfg=white cterm=NONE

" set comments
highlight Comment ctermfg=8

" show current position
set ruler

" searching all lowercase will search case insensitive
set ignorecase
set smartcase

" enable auto completion menu when pressing tab after typing a command
set wildmenu
set wildmode=list
highlight wildmenu ctermbg=lightgreen ctermfg=black

" highlight search result
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [old] Map <space> to : (command)
" [new] Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> :
map <space> /
map <C-@> ?
map <S-space> :
"
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" copilot
" Open a new Cpilot Chat window
" nnoremap <leader>cc :CopilotChatOpen<CR>

" Add visual selection to copilot window
" vmap <leader>a <Plug>CopilotChatAddSelection

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load local configuration files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" maybe use a for loop for all configuration files matching a pattern?
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
