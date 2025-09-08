local vim = vim
local Plug = vim.fn["plug#"]

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("syntax enable")
vim.opt.termguicolors = true

vim.call("plug#begin")

-- Styling
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })

Plug("RRethy/vim-illuminate")

Plug("lewis6991/gitsigns.nvim")

Plug("lewis6991/satellite.nvim")

Plug("norcalli/nvim-colorizer.lua")

Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-lualine/lualine.nvim")

Plug("nvim-lua/plenary.nvim")
Plug("folke/todo-comments.nvim")

Plug("levouh/tint.nvim")

Plug("lukas-reineke/indent-blankline.nvim")

Plug("folke/snacks.nvim")

Plug("neovim/nvim-lspconfig")
Plug("MysticalDevil/inlay-hints.nvim")

Plug("nvim-tree/nvim-web-devicons")
Plug("lewis6991/gitsigns.nvim")
Plug("romgrk/barbar.nvim")

-- UI
Plug("nvim-lua/plenary.nvim")
Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-telescope/telescope.nvim")

Plug("nvim-tree/nvim-web-devicons")
Plug("nvim-tree/nvim-tree.lua")

-- Tooling
Plug("jake-stewart/multicursor.nvim")

Plug("folke/trouble.nvim")

-- Languages
Plug("nvim-treesitter/nvim-treesitter")
Plug("nvim-treesitter/nvim-treesitter-context")
Plug("nvim-treesitter/nvim-treesitter-textobjects")

Plug("neovim/nvim-lspconfig")

Plug("RRethy/nvim-treesitter-endwise")

Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/nvim-cmp")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")

-- AI
Plug("nvim-lua/plenary.nvim")
Plug("MunifTanjim/nui.nvim")
Plug("MeanderingProgrammer/render-markdown.nvim")
Plug("hrsh7th/nvim-cmp")
Plug("nvim-tree/nvim-web-devicons")
Plug("HakonHarnes/img-clip.nvim")
Plug("zbirenbaum/copilot.lua")
Plug("stevearc/dressing.nvim")
Plug("folke/snacks.nvim")
Plug("yetone/avante.nvim", { ["branch"] = "main", ["do"] = "make" })

-- Formatting
Plug("lewis6991/spaceless.nvim")

Plug("stevearc/conform.nvim")

vim.call("plug#end")
vim.cmd("silent! colorscheme catppuccin-mocha")

require("praktiskt.remap")
require("praktiskt.autocmds")
require("praktiskt.conf")
