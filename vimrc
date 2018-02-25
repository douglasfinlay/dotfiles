"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using VIM, not VI
set nocompatible

" Enable filetype-specific plugins and indentation
filetype plugin indent on

" Use UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Automatically read when a file is changed from the outside
set autoread

" Force VIM to source .vimrc files from the current directory if they exist
set exrc

" Restrict commands in non-default .vimrc files
set secure


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" File fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax checking
Plug 'vim-syntastic/syntastic'

" Auto-close braces, etc
Plug 'jiangmiao/auto-pairs'

" Colorscheme
Plug 'morhetz/gruvbox'

" Visually indicate indentation
Plug 'Yggdroot/indentLine'

" Version control diff gutter
Plug 'mhinz/vim-signify'

" Fast alteration of quotes, etc
Plug 'tpope/vim-surround'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Character for displaying indents
let g:indentLine_char='┆'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI                                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*.class,*.pyc

" Show the ruler
set ruler

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Make search act more natural
set incsearch

" Show matching brackets
set showmatch

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Disable arrow keys to break bad habits!
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours & Fonts                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set the colour scheme
colorscheme gruvbox
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T       " Hide the toolbar
    set guioptions-=m       " Hide the menubar
    set guioptions+=e       " Ensure the tab bar is displayed by the GUI
    set showtabline=2       " Always show the tab bar
    set guitablabel=%m\ %t  " Tab labels are \"[modified?] name\"
    set lines=40 columns=85 " Enlarge the default GUI window
    set guifont=Hack\ 12
endif

" Use 256 colours in the console.
set t_Co=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Handle the <tab> key intelligently
set smarttab

" One tab is equal to 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Automatically indent
set autoindent
set cindent
set smartindent

" Wrap long lines
set wrap

" Visual guide at 80 cols
set cc=80


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups & Undo                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent VIM from creating *~ backup files
set nobackup
set nowb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific Options                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smaller tabstops for certain file types
autocmd FileType text,ruby,html,javascript setl ts=2 sts=2 sw=2

" Enable spellchecking for text-based files
autocmd FileType text,gitcommit,mkd, setlocal spell spelllang=en_gb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim                                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

