local map = vim.api.nvim_set_keymap

-- set the leader to <space>
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', {silent = true, noremap = true, desc = 'Toggle problem explorer'})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader><space>', builtin.git_files, { desc = 'Repository files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {silent = true, noremap = true})

vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = 'Rename identifier under cursor' })
vim.keymap.set('n', '<leader>fo', '<cmd>lua vim.lsp.buf.format()<cr>', { desc = 'Format entire file' })

