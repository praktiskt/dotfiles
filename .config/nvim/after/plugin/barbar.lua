require("barbar").setup({
	animation = false,
	auto_hide = true,
	icons = {
		modified = { button = "*" },
	},
})
vim.keymap.set({ "i", "n", "v" }, "<C-A-left>", "<Cmd>BufferPrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<C-A-right>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-Tab>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-S-Tab>", "<Cmd>BufferPrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A->>", "<Cmd>BufferNext<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-<>", "<Cmd>BufferPrevious<CR>", {})

vim.keymap.set({ "i", "n", "v" }, "<S-A-left>", "<Cmd>BufferMovePrevious<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<S-A-right>", "<Cmd>BufferMoveNext<CR>", {})

vim.keymap.set({ "i", "n", "v" }, "<A-1>", "<Cmd>BufferGoto 1<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-2>", "<Cmd>BufferGoto 2<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-3>", "<Cmd>BufferGoto 3<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-4>", "<Cmd>BufferGoto 4<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-5>", "<Cmd>BufferGoto 5<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-6>", "<Cmd>BufferGoto 6<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-7>", "<Cmd>BufferGoto 7<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-8>", "<Cmd>BufferGoto 8<CR>", {})
vim.keymap.set({ "i", "n", "v" }, "<A-9>", "<Cmd>BufferGoto 9<CR>", {})
