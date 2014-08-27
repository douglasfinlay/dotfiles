"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using VIM, not VI
set nocompatible

" Set up Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles to use. Run :BundleInstall after updating.
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-rails'
Bundle 'davidhalter/jedi-vim'
Bundle 'othree/html5.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xuhdev/vim-latex-live-preview'
Bundle 'armyofevilrobots/vim-openscad'
Bundle 'gerw/vim-latex-suite'

filetype plugin indent on

" Use UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Automatically read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI                                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*.class,*.pyc

" Show the ruler
set ruler

" Set command bar height to 2
set cmdheight=2

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Make search act more natural
set incsearch

" Show matching brackets
set showmatch

" Show the vertical guide at 80 chars
set colorcolumn=80

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Display the line number column with a nicer width
set numberwidth=5

" Disable arrow keys to break bad habits!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours & Fonts                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set the colour scheme
colorscheme lucius

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T       " Hide the toolbar
    set guioptions+=e       " Ensure the tab bar is displayed by the GUI
    set showtabline=2       " Always show the tab bar
    set guitablabel=%m\ %t  " Tab labels are \"[modified?] name\"
    set lines=40 columns=85 " Enlarge the default GUI window
    set guifont="Inconsolata"
endif

" Use 256 colours in the console.
set t_Co=256

set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Use tabs intelligently
set smarttab

" One tab is equal to 4 spaces
set shiftwidth=2
set tabstop=2

" Automatically indent
set autoindent
set cindent
set smartindent

" Wrap lines
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups & Undo                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb


autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'evince'
autocmd Filetype tex nmap <F12> ::LLPStartPreview<cr>
