vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local o = vim.o
o.guifont = 'JetBrainsMono_Nerd_Font:h13'
o.termguicolors = true
o.scrolloff = 3

require('config.options')
require('config.lazy')

if vim.g.neovide then
    require('config.neovide')
end
