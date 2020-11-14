""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Basic UI
Plug 'Yggdroot/indentLine'

" Color scheme
" Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

" Version control status in gutter
Plug 'mhinz/vim-signify'

" Linting / syntax checking
Plug 'dense-analysis/ale'

" Easy commenting
Plug 'tpope/vim-commentary'

" Code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python completion
Plug 'deoplete-plugins/deoplete-jedi'

" C/C++ completion
Plug 'zchee/deoplete-clang'

" Enhanced C/C++ highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Auto-close quotes/brackets
Plug 'jiangmiao/auto-pairs'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
set termguicolors
colorscheme dracula
set background=dark

" Line numbering
set number
set relativenumber
set ruler

" Disable creation of backup/swap files
set nobackup
set noswapfile
set nowritebackup

" Automatically read changes to files
set autoread

" Hide rather than close files with unsaved changes when opening new files
set hidden

" Searching
set ignorecase
set smartcase
set incsearch

set mouse=a


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Automatically indent
set autoindent
set cindent
set smartindent

" Wrap long lines
set wrap

set cc=120


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other                                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys to break bad habits
map <Up>        <NOP>
map <Down>      <NOP>
map <Left>      <NOP>
map <Right>     <NOP>
imap <Up>       <NOP>
imap <Down>     <NOP>
imap <Left>     <NOP>
imap <Right>    <NOP>

let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error='❌'
let g:ale_sign_warning='⚠'
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='never'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'
let g:ale_linters={
\   'python': ['flake8'],
\   'cpp': ['clang'],
\}

" Deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#sources#jedi#show_docstring=1
let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Library/Developer/CommandLineTools/usr/lib/clang'

" IndentLine
let g:indentLine_char='┆'
