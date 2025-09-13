vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.terminal_color_4 = "#89B4FA"

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		custom = { "^.git$", "^node_modules$", "^venv$", "^target/debug$", "^\\.venv$" },
	},
	view = {
		width = 35,
	},
})

vim.keymap.set("n", "<leader>te", ":NvimTreeToggle .<CR>")
vim.keymap.set("n", "te", ":NvimTreeToggle .<CR>")
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle .<CR>")
