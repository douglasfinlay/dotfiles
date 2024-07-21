return {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
        vim.fn['mkdp#util#install']()
    end,
    keys = {
        { '<leader>m', '+Markdown' },
        { '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = 'Preview (toggle)' },
    },
}
