-- Custom
local set = vim.opt
set.number = true
set.relativenumber = false

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.smartcase = true
set.cursorline = true
set.termguicolors = true
vim.wo.wrap = false

set.hlsearch = false
set.incsearch = true

set.scrolloff = 8
set.updatetime = 50

set.colorcolumn = "88"
set.background = "dark"
set.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
set.spelllang = "en_us"
set.spell = true
set.termguicolors = true
set.winborder = "rounded"

-- Required by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.terminal_color_4 = "#89B4FA"
