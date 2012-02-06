set nocompatible

" --- Load and start pathogen
source ~/vim_local/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('~/vim_local/bundle')

" --- General settings

filetype plugin indent on
syntax on
set autoread

let mapleader = ","
let g:mapleader = ","
set backspace=indent,eol,start

" --- Colors and fonts

if MySys() == "windows"
    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
    let &guioptions = substitute(&guioptions, "t", "", "g")
    set guifont=Courier_New:h12:b:cRUSSIAN
elseif MySys() == "gnu/linux"
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

if has('mouse')
  set mouse=a
endif

" --- Miscellaneous bindings

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
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

" --- Mouse balloon

function! MyBalloon()
    return "Hello, world!"
endfunction
set bexpr=MyBalloon()
set ballooneval
set balloondelay=100

" --- Keybindings

inoremap <Enter> <Esc>

map <Leader>nn :NERDTree<cr>
map <Leader>nc :NERDTreeClose<cr>

map <Leader>p :set invpaste<cr>:set paste?<cr>
