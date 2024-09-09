require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"elixir",
		"erlang",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"gotmpl",
		"gpg",
		"helm",
		"html",
		"java",
		"javascript",
		"jq",
		"json",
		"json5",
		"kotlin",
		"lua",
		"luadoc",
		"make",
		"markdown",
		"markdown_inline",
		"nginx",
		"php",
		"python",
		"r",
		"regex",
		"rust",
		"scala",
		"sql",
		"ssh_config",
		"svelte",
		"terraform",
		"toml",
		"toml",
		"vim",
		"vimdoc",
		"vue",
		"yaml",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,

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
