return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find Files (Root)' },
        { '<leader><space>', '<cmd>Telescope git_files<CR>', desc = 'Find Files (Git)' },
        { '<leader>fr', '<cmd>Telescope oldfiles<CR>', desc = 'Recent Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help' },
    },
}
