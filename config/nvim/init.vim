""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'dracula/vim'

" Airline
Plug 'vim-airline/vim-airline'

" Visualise indentation
Plug 'Yggdroot/indentLine'

" Version control status in gutter
Plug 'mhinz/vim-signify'

" Linting / syntax checking
Plug 'dense-analysis/ale'

" Easy commenting
Plug 'tpope/vim-commentary'

" Surround
Plug 'tpope/vim-surround'

" Intellisense
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Golang
Plug 'fatih/vim-go', { 'do': 'GoUpdateBinaries' }

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
set termguicolors
colorscheme dracula

" Line numbering
set number
set ruler

" Always show the sign column
set signcolumn=yes

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

set cmdheight=2

set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set hidden

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

set cc=80


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
" Coc Configuration                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
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
    if (index([‘vim’,’help’], &filetype) >= 0)
        execute ‘h ‘.expand(‘<cword>’)
    else
        call CocAction(‘doHover’)
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

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
" Other Plugin Configuration                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_powerline_fonts=1

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

" IndentLine
let g:indentLine_char='┆'

" Golang
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
let g:go_fmt_command='goimports'
let g:go_auto_type_info = 1
let g:go_code_completion_enabled=0
