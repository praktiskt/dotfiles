require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"elixir",
		"go",
		"java",
		"javascript",
		"kotlin",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"scala",
		"vimdoc",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		--disable = { "python" },
		additional_vim_regex_highlighting = false,
	},
	endwise = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
			selection_modes = {
				-- ['@parameter.outer'] = 'v', -- charwise
				-- ['@function.outer'] = 'V', -- linewise
				-- ['@class.outer'] = '<C-v>', -- blockwise
			},
			include_surrounding_whitespace = true,
		},
	},
})
