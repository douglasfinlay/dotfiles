return {
    'rmagatti/auto-session',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        auto_session_suppress_dirs = { '~/Downloads' },
        auto_session_use_git_branch = true,

        session_lens = {
            load_on_setup = true,
            theme_conf = { border = true },
            previewer = false,
            buftypes_to_ignore = {},
        },
    },
    keys = {
        {
            '<leader>fs',
            function()
                require('auto-session.session-lens').search_session()
            end,
            desc = 'Sessions',
        },
    },
}
