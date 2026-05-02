return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' },
        'rafamadriz/friendly-snippets',
    },
    opts = {
        keymap = {
            preset = 'default',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    score_offset = 100,
                },
            },
        },
        appearance = {
            nerd_font_variant = 'mono',
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
        },
    },
}
