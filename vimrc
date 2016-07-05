set nocompatible

" Initializing Vundle
filetype off
if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin("~/.vim/bundle/")
elseif has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin("~/vimfiles/bundle")
endif

" List of plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter.git'

" Done initializing Vundle
call vundle#end()

" --- General settings
filetype plugin indent on
syntax on
set autoread

let mapleader = ","
let g:mapleader = ","
set backspace=indent,eol,start

" --- Colors and fonts

if has("unix")
    set guifont=Monospace\ 12
elseif has("win32")
    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
    let &guioptions = substitute(&guioptions, "t", "", "g")
    set guifont=Courier_New:h12:b:cRUSSIAN
endif

if has("gui_running")
    set guioptions-=T
    set t_Co=256
    set background=dark
    colorscheme pablo
else
    set background=dark
    colorscheme pablo
endif

" --- Settings

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set shiftwidth=4
set softtabstop=4
set expandtab
set foldmethod=marker
set viminfo='500,"50,h
set modelines=10
set ruler
set hlsearch
set smartindent
set number
set scrolljump=5
set scrolloff=5
set hidden
set novisualbell
set t_vb=

set textwidth=80
set colorcolumn=+1
set columns=86

set mouse=

" --- Files, backup and undo

fun! Ensure_dir(name)
    if !isdirectory(a:name)
        call mkdir(a:name, 'p')
    endif
endfun

set backup
    call Ensure_dir($HOME . '/.vim_runtime/undodir')
    call Ensure_dir($HOME . '/.vim_runtime/viewdir')
    call Ensure_dir($HOME . '/.vim_runtime/directory')
    call Ensure_dir($HOME . '/.vim_runtime/backupdir')
    set undodir=~/.vim_runtime/undodir
    set viewdir=~/.vim_runtime/viewdir
    set directory=~/.vim_runtime/directory
    set backupdir=~/.vim_runtime/backupdir
    set undofile

" --- Keybindings

inoremap <C-L> <Esc>

