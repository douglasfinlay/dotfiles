""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')

" UI
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'kyazdani42/nvim-web-devicons'

" Session saving (for tmux)
Plug 'tpope/vim-obsession'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Distraction-free editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', {
            \ 'do': { -> mkdp#util#install() },
            \ 'for': ['markdown', 'vim-plug']
            \ }

" Languages
Plug 'fatih/vim-go', { 'do': 'GoUpdateBinaries' }
" Plug 'davidhalter/jedi-vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection='1'
let g:gruvbox_italic='1'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox
set background=dark
set termguicolors

let mapleader=' '

set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set fileformats=unix,dos,mac

" Disable creation of backup/swap files
set nobackup
set noswapfile
set nowritebackup

set undodir=~/.vim/undodir
set undofile

" Automatically read changes to files
set autoread

set noerrorbells
set guicursor=
set cmdheight=2
set noshowmode

" Relative line numbers
set number
set relativenumber

set scrolloff=5

" Always show the sign column
set signcolumn=yes

" Hide rather than close files with unsaved changes when opening new files
set hidden

" Searching
set incsearch
set nohlsearch

" Always split to the right
set splitright

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" Colour column + wrap long lines
set cc=80
set nowrap

set lazyredraw
set updatetime=300


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other                                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys to break bad habits!
map <Up>        <NOP>
map <Down>      <NOP>
map <Left>      <NOP>
map <Right>     <NOP>
imap <Up>       <NOP>
imap <Down>     <NOP>
imap <Left>     <NOP>
imap <Right>    <NOP>

" Yank from cursor to end of line excluding carriage return
nnoremap Y yg_

" Keep search results centered
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Preserve cursor position when joining lines
nnoremap J mzJ`z
nnoremap gJ mzgJ`z

" Swap lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <ESC>:m .+1<CR>==
inoremap <C-k> <ESC>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>

let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP                                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('lsp-config')
lua require('treesitter')

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Avoid showing message extra message when using completion
set shortmess+=c

" <Tab> and <S-Tab> to cycle through completion options
inoremap <expr> <Tab>   pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" Telescope
nnoremap <silent> <leader><space> <cmd>Telescope git_files<CR>
nnoremap <silent> <leader>f <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>gr <cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>bu <cmd>Telescope buffers<CR>
nnoremap <silent> <leader>hi <cmd>Telescope oldfiles<CR>
nnoremap <silent> <leader>he <cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>t <cmd>Telescope current_buffer_tags<CR>
nnoremap <silent> <leader>at <cmd>Telescope tags<CR>

" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
let g:go_fmt_command='goimports'
let g:go_auto_type_info=1
let g:go_code_completion_enabled=0

" Goyo / Limelight
let g:goyo_width=120
nnoremap <silent> <leader>go :Goyo<CR>
nnoremap <silent> <leader>ll :Limelight!!<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" IndentLine
let g:indentLine_char='│'
let g:indentLine_faster=1

" Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_conceal=0
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_json_frontmatter=1
nnoremap <silent> <leader>mp :MarkdownPreview<CR>

