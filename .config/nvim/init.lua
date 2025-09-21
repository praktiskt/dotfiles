local Plug = vim.fn["plug#"]

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("syntax enable")

vim.call("plug#begin")

-- Styling
Plug("https://github.com/catppuccin/nvim", { ["as"] = "catppuccin" })

Plug("https://github.com/RRethy/vim-illuminate")

Plug("https://github.com/lewis6991/gitsigns.nvim")

Plug("https://github.com/lewis6991/satellite.nvim")

Plug("https://github.com/norcalli/nvim-colorizer.lua")

Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/nvim-lualine/lualine.nvim")

Plug("https://github.com/nvim-lua/plenary.nvim")
Plug("https://github.com/folke/todo-comments.nvim")

Plug("https://github.com/levouh/tint.nvim")

Plug("https://github.com/lukas-reineke/indent-blankline.nvim")

Plug("https://github.com/folke/snacks.nvim")

Plug("https://github.com/neovim/nvim-lspconfig")
Plug("https://github.com/MysticalDevil/inlay-hints.nvim")

Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/lewis6991/gitsigns.nvim")
Plug("https://github.com/romgrk/barbar.nvim")

-- UI
Plug("https://github.com/nvim-lua/plenary.nvim")
Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/nvim-telescope/telescope.nvim")
Plug("https://github.com/nvim-telescope/telescope-symbols.nvim")

Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/nvim-tree/nvim-tree.lua")

-- Tooling
Plug("https://github.com/jake-stewart/multicursor.nvim")

Plug("https://github.com/folke/trouble.nvim")

Plug("https://github.com/m4xshen/autoclose.nvim")

-- Languages
Plug("https://github.com/nvim-treesitter/nvim-treesitter")
Plug("https://github.com/nvim-treesitter/nvim-treesitter-context")
Plug("https://github.com/nvim-treesitter/nvim-treesitter-textobjects")

Plug("https://github.com/neovim/nvim-lspconfig")

Plug("https://github.com/RRethy/nvim-treesitter-endwise")

Plug("rafamadriz/friendly-snippets")
Plug("https://github.com/L3MON4D3/LuaSnip")
Plug("https://github.com/Saghen/blink.cmp", { ["do"] = "cargo build --release" })

-- AI
Plug("https://github.com/nvim-lua/plenary.nvim")
Plug("https://github.com/MunifTanjim/nui.nvim")
Plug("https://github.com/MeanderingProgrammer/render-markdown.nvim")
Plug("https://github.com/hrsh7th/nvim-cmp")
Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/HakonHarnes/img-clip.nvim")
Plug("https://github.com/zbirenbaum/copilot.lua")
Plug("https://github.com/stevearc/dressing.nvim")
Plug("https://github.com/folke/snacks.nvim")
Plug("https://github.com/yetone/avante.nvim", { ["branch"] = "main", ["do"] = "make" })

-- Formatting
Plug("https://github.com/lewis6991/spaceless.nvim")

Plug("https://github.com/stevearc/conform.nvim")

vim.call("plug#end")
vim.cmd("silent! colorscheme catppuccin-mocha")

require("praktiskt.remap")
require("praktiskt.autocmds")
require("praktiskt.conf")

-- Activate LSPs in after/plugin/lsp by their <lsp name>.lua .
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/after/plugin/lsp/")) do
	if file:match("%.lua$") then
		local lsp_name = file:gsub("%.lua$", "")
		vim.lsp.enable(lsp_name)
	end
end
