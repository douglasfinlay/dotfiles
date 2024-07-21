return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require('which-key')
        wk.add({
            { '<leader>c', group = 'LSP' },
            { '<leader>f', group = 'Find...' },
            { '<leader>g', group = 'Git' },
            { '<leader>h', group = 'Git hunks' },
            { '<leader>r', group = 'LSP' },
            { '<leader>x', group = 'Diagnostics' },

            { '<leader>v', group = 'Neovim' },
            { '<leader>vm', vim.cmd.messages, desc = 'Messages' },
            { '<leader>vp', '<cmd>Lazy<CR>', desc = 'Plugins (lazy.nvim)' },
            { '<leader>vP', '<cmd>Mason<CR>', desc = 'Packages (Mason)' },
            { '<leader>vl', '<cmd>LspInfo<CR>', desc = 'LSP Info' },
        })
    end,
    opts = {
        preset = 'modern',
    },
}
