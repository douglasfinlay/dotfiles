require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'go',
        'python',
        'json',
        'yaml',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = false,
        disable = {},
    },
}

