require("trouble").setup({})
vim.keymap.set({"n", "v"}, "<leader>td", "<esc><cmd>Trouble diagnostics toggle<CR>")
vim.keymap.set({"n", "v"}, "td", "<esc><cmd>Trouble diagnostics toggle<CR>")

