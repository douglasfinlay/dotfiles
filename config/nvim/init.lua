-- disable netrw (prefer nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        print 'Installing Packer...'
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]

        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

require('config.packer')

if packer_bootstrap then
    require('packer').sync()
end

require('impatient')

local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local map = vim.api.nvim_set_keymap

-- general
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileencodings = 'utf-8'
set.bomb = true
set.binary = true
set.fileformats = 'unix,dos,mac'

-- disable creation of backup/swap files
set.backup = false
set.swapfile = false
set.writebackup = false

-- automatically read changes to files
set.autoread = true

-- set the leader to <space>
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- ui
o.guifont = 'Iosevka Nerd Font:h15'

-- colors
o.termguicolors = true
cmd[[colorscheme catppuccin-macchiato]]

-- highlight the current line
set.cursorline = true

-- line numbering
set.number = true
set.relativenumber = true

set.ruler = true

-- always show the sign column
set.signcolumn = 'yes'

-- hide rather than close files with unsaved changes when opening new files
set.hidden = true

-- searching
set.ignorecase = true
set.smartcase = true
set.incsearch = true

-- enable the mouse
set.mouse = 'a'

-- always split to the right
set.splitright = true

-- show the current in-progress command
set.showcmd = true

-- text formatting
-- indentation
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- automatically indent
set.autoindent = true
set.smartindent = true

-- colour column + wrap long lines
set.cc = [[80]]
set.wrap = true

-- autocompletion / LSP
set.completeopt = {'menuone', 'noselect', 'noinsert'}
set.shortmess = set.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300)
-- fixed column for diagnostics to appear
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- other
-- optimisation
set.lazyredraw = true

vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {silent = true, noremap = true, desc = 'Toggle problem explorer'})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader><space>', builtin.git_files, { desc = 'Repository files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {silent = true, noremap = true})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Completion Plugin Setup
local cmp = require('cmp')
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    -- Installed sources:
    sources = {
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename identifier under cursor' })
vim.keymap.set('n', '<leader>fo', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'Format entire file' })

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
  ignore_linked_group = true, -- boolean: don't clear a group that links to another group
})
