local packer = require('packer')

local plugins = packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    }

    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/cmp-cmdline'                            
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/nvim-cmp' 

    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/vim-vsnip'

    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim'

    -- use 'arcticicestudio/nord-vim'
    -- use 'sainnhe/sonokai'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'
    use 'EdenEast/nightfox.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'xiyaowong/nvim-transparent' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- ui helpers
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release'
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'RRethy/vim-illuminate'
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup()
        end
    }
    use {
        'm-demare/hlargs.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    -- editing
    use {
        'kylechui/nvim-surround',
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    }
    use 'numToStr/Comment.nvim'
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    use 'preservim/tagbar'

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end
    }

    use {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
end)

require('nvim-tree').setup()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'eslint',
        'rust_analyzer',
        'tsserver',
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})

require('lualine').setup()
require('Comment').setup()
require('nvim-surround').setup()
require('gitsigns').setup()
require('hlargs').setup()

local rt = require('rust-tools');

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml", "typescript", "vim" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

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

return plugins

