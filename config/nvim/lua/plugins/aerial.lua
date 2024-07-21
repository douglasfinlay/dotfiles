return {
    'stevearc/aerial.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    config = function(_, opts)
        require('aerial').setup(opts)
        require('telescope').load_extension('aerial')
    end,
    keys = {
        { '<leader>co', '<cmd>AerialToggle!<CR>', desc = 'Outline (toggle)' },
        { '<leader>ft', '<cmd>Telescope aerial<CR>', desc = 'Symbol' },
    },
}
