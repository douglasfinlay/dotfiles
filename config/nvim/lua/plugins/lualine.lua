return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        extensions = {
            'lazy',
            'oil',
            'toggleterm',
            'trouble',
        },
        sections = {
            lualine_c = {},
        },
        winbar = {
            lualine_a = { 'filename' },
            lualine_b = { 'aerial' },
        },
    },
}
