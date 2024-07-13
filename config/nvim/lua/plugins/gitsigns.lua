return {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('gitsigns').setup({
            on_attach = function(buffer)
                local gs = require('gitsigns')

                local keymap = vim.keymap
                local opts = { buffer = buffer, silent = true }

                opts.desc = 'Next hunk'
                keymap.set('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ ']c', bang = true })
                    else
                        gs.nav_hunk('next')
                    end
                end, opts)

                opts.desc = 'Prev hunk'
                keymap.set('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({ '[c', bang = true })
                    else
                        gs.nav_hunk('prev')
                    end
                end, opts)

                opts.desc = 'Stage hunk'
                keymap.set('n', '<leader>hs', gs.stage_hunk, opts)

                opts.desc = 'Undo stage hunk'
                keymap.set('n', '<leader>hu', gs.undo_stage_hunk, opts)

                opts.desc = 'Reset hunk'
                keymap.set('n', '<leader>hr', gs.reset_hunk, opts)

                opts.desc = 'Stage buffer'
                keymap.set('n', '<leader>hS', gs.stage_buffer, opts)

                opts.desc = 'Reset buffer'
                keymap.set('n', '<leader>hR', gs.reset_buffer, opts)

                opts.desc = 'Blame line'
                keymap.set('n', '<leader>hb', gs.toggle_current_line_blame, opts)

                opts.desc = 'Blame line (full)'
                keymap.set('n', '<leader>hB', function()
                    gs.blame_line({ full = true })
                end, opts)

                opts.desc = 'Select hunk'
                keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
            end,
        })
    end,
}
