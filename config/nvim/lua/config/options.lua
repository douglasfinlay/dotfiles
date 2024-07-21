local set = vim.opt

-- general
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.fileencodings = 'utf-8'
set.bomb = true
set.binary = true
set.fileformats = 'unix,dos,mac'

-- use system clipboard
set.clipboard = 'unnamedplus'

-- disable creation of backup/swap files
set.backup = false
set.swapfile = false
set.writebackup = false

-- automatically read changes to files
set.autoread = true

-- highlight the current line
set.cursorline = true

-- line numbering
set.number = true
set.relativenumber = true

set.ruler = true

-- always show the sign column
set.signcolumn = 'yes'

-- hide rather than close files with unsaved changes when opening new files
set.hidden = true

-- searching
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.hlsearch = false

-- enable the mouse
set.mouse = 'a'

-- always split below and to the right
set.splitbelow = true
set.splitright = true

-- show the current in-progress command
set.showcmd = true

-- text formatting
-- indentation
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- automatically indent
set.autoindent = true
set.smartindent = true

-- colour column + wrap long lines
set.cc = [[80]]
set.wrap = true

-- fixed column for diagnostics to appear
set.signcolumn = 'yes'
