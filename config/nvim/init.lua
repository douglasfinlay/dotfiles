vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.lazy')
require('config.options')

local o = vim.o

o.guifont = 'Iosevka Nerd Font:h15'

o.termguicolors = true
vim.cmd([[colorscheme catppuccin-macchiato]])
