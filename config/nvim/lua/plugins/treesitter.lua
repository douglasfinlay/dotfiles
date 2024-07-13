return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        ensure_installed = {
            'c',
            'cpp',
            'diff',
            'gitignore',
            'html',
            'javascript',
            'json',
            'jsonc',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'printf',
            'regex',
            'rust',
            'toml',
            'typescript',
            'xml',
            'yaml',
        },
        auto_install = true,
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
