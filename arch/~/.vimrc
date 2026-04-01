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

let mapleader = ","
let maplocalleader = ","

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
" Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-autoformat/vim-autoformat'
" Plugin 'DanBradbury/copilot-chat.vim'

" color schemes
" Plugin 'srcery-colors/srcery-vim'
" Plugin 'fcpg/vim-fahrenheit'
Plugin 'fcpg/vim-farout'


" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set encoding=utf-8



"""""""""""""""" Personal setup """"""""""""""""""""""""
"

" Python
" Follow https://realpython.com/vim-and-python-a-match-made-in-heaven/
au BufNewFile,BufRead *.py 
    \ | setlocal tabstop=4
    \ | setlocal softtabstop=4
    \ | setlocal shiftwidth=4
    \ | setlocal expandtab
    \ | setlocal autoindent
    \ | setlocal fileformat=unix
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" bind F3 to autoformat
noremap <F3> :Autoformat<CR>

" line endings
set fileformat=unix


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
set wildmode=list,full
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

" in Konsole or gnome shell, alt key does not work for mappings
nnoremap <A-k> :m .-2==
inoremap <A-k> :m .-2==gi
vnoremap <A-k> :m '<-2gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open a new Cpilot Chat window
nnoremap <leader>cc :CopilotChatOpen<CR>

" Add visual selection to copilot window
vmap <leader>a <Plug>CopilotChatAddSelection

" formatter for vim-autoformat
"let g:formatdef_eslint = '"npx eslint --fix --suppress-all"'
"let g:formatters_javascriptreact = ['eslint']
