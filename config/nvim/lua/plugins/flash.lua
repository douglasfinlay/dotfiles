return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
        { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
        { 'S', mode = { 'n', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
        { '<C-s>', mode = 'c', function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
}
