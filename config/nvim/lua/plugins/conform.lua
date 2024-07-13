return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require('conform')
        conform.setup({
            formatters_by_ft = {
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                css = { 'prettier' },
                html = { 'prettier' },
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
                lua = { 'stylua' },
            },
        })
    end,
    keys = {
        {
            '<leader>fo',
            function()
                require('conform').format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end,
            desc = 'Format file',
        },
    },
}
