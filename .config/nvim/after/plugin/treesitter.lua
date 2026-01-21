require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.config").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = {
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
	"vim",
	"vimdoc",
	"vue",
	"yaml",
}

-- require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(require("nvim-treesitter.parsers")),
	callback = function()
		vim.treesitter.start()
	end,
})

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		include_surrounding_whitespace = false,
	},
})

vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)

require("treesitter-context").setup({})
