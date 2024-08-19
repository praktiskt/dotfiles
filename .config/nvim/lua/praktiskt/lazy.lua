-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Regular configuration
require("praktiskt.conf")

-- Required by Lazy
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Init lazy
require("lazy").setup({
	spec = {
		-- File picker and fuzzy finder. See after/plugin/telescope.lua
		{
			"nvim-telescope/telescope.nvim",
			version = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
			},
		},

		-- File tree
		{
			"nvim-tree/nvim-tree.lua",
			tag = "nvim-tree-v0.99.0",
			dependencies = {
				{ "nvim-tree/nvim-web-devicons" },
			},
			lazy = false,
			config = function()
				require("nvim-web-devicons")
				require("nvim-tree").setup({
					-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L339
					filters = {
						dotfiles = false,
						custom = { "^.git$", "^node_modules$", "^venv$", "^target/debug$" },
					},
					view = {
						width = 35,
					},
				})
			end,
		},

		-- Color schemes. See after/plugin/colors.lua
		{
			"catppuccin/nvim",
			name = "catppuccin",
			flavor = "mocha",
			term_colors = true,
		},

		-- Statusline
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},

		-- Nice highlighting. See after/plugin/treesitter.lua
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		{ "nvim-treesitter/nvim-treesitter-context" },
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},

		-- Configure LSP. See after/plugin/lsp.lua
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v3.x",
			dependencies = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		},

		-- Configure REPL
		"Vigemus/iron.nvim",

		-- Manage formatting triggers
		{
			"stevearc/conform.nvim",
		},

		{
			"AckslD/swenv.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
			},
		},

		"stevearc/dressing.nvim",

		-- Autocomplete
		"TabbyML/vim-tabby",

		-- Diagnostics
		"folke/trouble.nvim",

		-- Display shortcuts on pause for current chord
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			config = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
				require("which-key").setup({})
			end,
		},

		-- Add indentation guide
		{
			"lukas-reineke/indent-blankline.nvim",
			name = "ibl",
			config = function()
				require("ibl").setup()
			end,
		},

		-- Match brackets.
		{
			"altermo/ultimate-autopair.nvim",
			event = { "InsertEnter", "CmdlineEnter" },
			branch = "v0.6",
			config = function()
				require("ultimate-autopair").setup({
					-- Config goes here
				})
			end,
		},

		-- Add end to things like Ruby, Julia, Lua ...
		"RRethy/nvim-treesitter-endwise",

		-- Fade window not in focus
		{
			"levouh/tint.nvim",
			config = function()
				require("tint").setup({
					tint = -65, -- Darken colors, use a positive value to brighten
					saturation = 0.6, -- Saturation to preserve
					tint_background_colors = false, -- Tint background portions of highlight groups
				})
			end,
		},

		-- Highlight todo comments
		{
			"folke/todo-comments.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		-- Highlight word under cursor with LSP, tree-sitter or regex
		"RRethy/vim-illuminate",

		-- Strip white space as you are writing.
		{
			"lewis6991/spaceless.nvim",
			config = function()
				require("spaceless").setup()
			end,
		},

		-- Add snippets
		{
			"nvim-telescope/telescope-symbols.nvim",
			dependencies = {
				"nvim-telescope/telescope.nvim",
			},
		},

		-- Multi-cursor
		{
			"smoka7/multicursors.nvim",
			event = "VeryLazy",
			dependencies = {
				"nvimtools/hydra.nvim",
			},
			opts = {},
			cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
			keys = {
				{
					mode = { "v", "n" },
					"<C-d>",
					"<cmd>MCstart<cr>",
					desc = "Create a selection for selected text or word under the cursor",
				},
			},
		},

		-- Terminal
		{
			"akinsho/toggleterm.nvim",
			config = function()
				-- see after/plugin/toggleterm.lua
				require("toggleterm").setup({
					size = function(term)
						if term.direction == "horizontal" then
							return vim.o.lines * 1
						elseif term.direction == "vertical" then
							return vim.o.columns * 0.4
						end
					end,
					autochdir = true,
				})
			end,
		},

		-- VCS show changes in sidebar
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({})
			end,
		},

		-- Decorated scrollbar (requires >=0.10.0)
		{
			"lewis6991/satellite.nvim",
			config = function()
				require("satellite").setup({})
			end,
		},

		-- Show colors on color codes, like #ffffff
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		},
	},
	change_detection = {
		enabled = false,
		notify = false,
	},
})
