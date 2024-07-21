return {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    keys = {
        { '<leader>r', '', desc = '+refactor', mode = { 'n', 'v' } },
        {
            '<leader>ri',
            function()
                require('refactoring').refactor('Inline Variable')
            end,
            mode = { 'n', 'v' },
            desc = 'Inline Variable',
        },
        {
            '<leader>rb',
            function()
                require('refactoring').refactor('Extract Block')
            end,
            desc = 'Extract Block',
        },
        {
            '<leader>rf',
            function()
                require('refactoring').refactor('Extract Function')
            end,
            mode = 'v',
            desc = 'Extract Function',
        },
        {
            '<leader>rx',
            function()
                require('refactoring').refactor('Extract Variable')
            end,
            mode = 'v',
            desc = 'Extract Variable',
        },
    },
}
