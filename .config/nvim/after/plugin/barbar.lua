require("barbar").setup({
	animation = false,
	auto_hide = true,
	icons = {
		modified = { button = "*" },
	},
})
vim.keymap.set({ "i", "n", "v" }, "<C-A-left>", "<Cmd>BufferPrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-A-right>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<M-Tab>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<M->>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<M-<>", "<Cmd>BufferPrevious<CR>", {})

vim.keymap.set({ "i", "n", "v" }, "<S-A-left>", "<Cmd>BufferMovePrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<S-A-right>", "<Cmd>BufferMoveNext<CR>", {})
