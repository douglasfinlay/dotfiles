vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local o = vim.o
o.guifont = 'Iosevka Nerd Font:h15'
o.termguicolors = true

require('config.options')
require('config.lazy')

vim.cmd([[colorscheme catppuccin-macchiato]])
