"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using VIM, not VI
set nocompatible

" Set up Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

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


" Disable arrow keys to break bad habits!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Do not show the autocomplete preview window
set completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours & Fonts                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Set the colour scheme
colorscheme mustang

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T       " Hide the toolbar
    set guioptions-=m       " Hide the menubar
    set guioptions+=e       " Ensure the tab bar is displayed by the GUI
    set showtabline=2       " Always show the tab bar
    set guitablabel=%m\ %t  " Tab labels are \"[modified?] name\"
    set lines=40 columns=85 " Enlarge the default GUI window
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
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
set shiftwidth=4
set tabstop=4

" Automatically indent
set autoindent
set cindent
set smartindent

" Wrap lines
set wrap

" Automatic formatting options
set formatoptions=tcq2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backups & Undo                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File-specific                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Update quicker when working with *.tex files (so the live preview works well
" with vim-latex-live-preview
autocmd BufEnter * set updatetime=4000  " default time
autocmd BufEnter *.tex set updatetime=1000

autocmd BufEnter *.txt call SetTxtOptions()

function SetTxtOptions()
  set sw=2
  set ts=2
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 1

noremap <leader>o <Esc>:CommandT<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:indentLine_char='┆'

" vim-latex-live-preview
let g:livepreview_previewer="evince"

" airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=":t"
