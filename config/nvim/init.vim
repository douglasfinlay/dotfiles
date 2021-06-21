""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
    call plug#begin('~/AppData/Local/nvim/plugged')
else
    call plug#begin('~/.local/share/nvim/plugged')
endif

" UI
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'

" Session saving (for tmux)
Plug 'tpope/vim-obsession'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'

" Code completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
Plug 'davidhalter/jedi-vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set fileformats=unix,dos,mac

" Disable creation of backup/swap files
set nobackup
set noswapfile
set nowritebackup

" Automatically read changes to files
set autoread

" Set the leader to <space>
let mapleader=' '

set updatetime=300


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
syntax on
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'

" Highlight the current line
set cursorline

" Line numbering
set number
set ruler

" Always show the sign column
set signcolumn=yes

" Hide rather than close files with unsaved changes when opening new files
set hidden

" Searching
set ignorecase
set smartcase
set incsearch

" Enable the mouse
set mouse=a

set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always split to the right
set splitright

" Show the current in-progress command
set showcmd


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
set smartindent

" Colour column + wrap long lines
set cc=80
set wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other                                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Optimisation
set lazyredraw

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
" Coc Configuration                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
            \ 'coc-json',
            \]

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to format
" on enter
inoremap <silent><expr> <cr> pumvisible()
            \? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Apply codeAction to the current line
nmap <leader>ac <Plug>(coc-codeaction-line)
" Autofix problem on the current line
nmap <leader>af <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll()
                \? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll()
                \? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll()
                \? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll()
                \? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll()
                \? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll()
                \? coc#float#scroll(0) : "\<C-b>"
endif

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
    vnoremap <nowait><expr> <C-f> coc#float#has_scroll()
                \? coc#float#nvim_scroll(1, 1) : "\<C-f>"
    vnoremap <nowait><expr> <C-b> coc#float#has_scroll()
                \? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" FZF
let g:fzf_nvim_statusline=0
nnoremap <silent> <leader><space> :GFiles<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>rg :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <silent> <leader>at :Tags<CR>

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

" Highlighted yank
let g:highlightedyank_highlight_duration=350

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

