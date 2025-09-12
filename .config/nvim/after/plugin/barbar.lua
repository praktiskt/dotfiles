require("barbar").setup({
	icons = {
		modified = { button = "*" },
	},
})
vim.keymap.set({ "i", "n", "v" }, "<C-A-left>", "<Cmd>BufferPrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-A-right>", "<Cmd>BufferNext<CR>", {})
